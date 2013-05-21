/*
 * loader.c
 *
 *  Created on: Mar 27, 2013
 *      Author: justin
 */

#include "Loader.h"

USB_ClassInfo_CDC_Device_t VirtualSerial_CDC_Interface = { .Config = {
		.ControlInterfaceNumber = 0, .DataINEndpoint = { .Address =
				CDC_TX_EPADDR, .Size = CDC_TXRX_EPSIZE, .Banks = 1, },
		.DataOUTEndpoint = { .Address = CDC_RX_EPADDR, .Size = CDC_TXRX_EPSIZE,
				.Banks = 1, }, .NotificationEndpoint = { .Address =
				CDC_NOTIFICATION_EPADDR, .Size = CDC_NOTIFICATION_EPSIZE,
				.Banks = 1, }, }, };

typedef enum {
	IDLE,
	READ_SIZE,
	WRITE_TO_FLASH,
	WRITE_TO_FPGA,
	VERIFY_FLASH,
	LOAD_FROM_FLASH
} loaderState_t;

typedef enum {
	WAIT, START_LOAD, LOAD, SERVICE
} taskState_t;

uint8_t loadBuffer[256];
uint8_t adcBuffer[512];
RingBuffer_t ringBuffer;
RingBuffer_t adcRingBuffer;
volatile taskState_t taskState = SERVICE;

uint8_t adcPort = 0x0F;
volatile uint8_t convPort = 0x0F;

int main(void) {
	setupHardware();

	GlobalInterruptEnable();

	loadFromFlash();
	initPostLoad();

	while (1) {
		loaderTask();

		CDC_Device_USBTask(&VirtualSerial_CDC_Interface);
		USB_USBTask();
	}
	return 0;
}

void configADC(uint8_t preScaler, uint8_t highPower, uint8_t refSelect,
		uint8_t port) {
	ADCSRA = (0 << ADEN); //disable
	ADMUX = (refSelect << REFS0) | (port & 0x07);

	if (port > 7)
		ADCSRB = (1 << MUX5) | (highPower << ADHSM);
	else
		ADCSRB = (highPower << ADHSM);

	convPort = port;
	ADCSRA = (1 << ADEN) | (1 << ADSC) | (1 << ADATE) | (1 << ADIE)
			| (preScaler << ADPS0);
}

void adcTask() {
	static uint8_t preScaler = 0x05; // 128
	static uint8_t highPower = 1;
	static uint8_t refSelect = 0x01; // AVcc

	uint8_t adc_bus = (ADC_BUS_PIN & ADC_BUS_MASK) >> ADC_BUS_OFFSET;

	if (adc_bus != adcPort) {
		adcPort = adc_bus;
		if (adcPort < 2 || (adcPort < 10 && adcPort > 3)) { // 0,1,4,5,6,7,8,9
			configADC(preScaler, highPower, refSelect, adcPort);
		} else {
			ADCSRA = (0 << ADEN); //disable
		}
	}

	while (!RingBuffer_IsEmpty(&adcRingBuffer)) {
		uint8_t byte1 = *adcRingBuffer.Out;
		if (++adcRingBuffer.Out == adcRingBuffer.End)
			adcRingBuffer.Out = adcRingBuffer.Start;
		uint8_t byte2 = *adcRingBuffer.Out;
		if (++adcRingBuffer.Out == adcRingBuffer.End)
			adcRingBuffer.Out = adcRingBuffer.Start;

		uint_reg_t CurrentGlobalInt = GetGlobalInterruptMask();
		GlobalInterruptDisable();

		adcRingBuffer.Count -= 2;

		SetGlobalInterruptMask(CurrentGlobalInt);

		SET(SS, LOW);
		uint8_t keyWord = SPI_TransferByte(byte1);
		uint8_t config = SPI_TransferByte(byte2);
		SET(SS, HIGH);
		if (keyWord == 0xAA) {
			preScaler = config & 0x07;
			highPower = (config >> 3) & 0x01;
			refSelect = (config >> 4) & 0x03;
			configADC(preScaler, highPower, refSelect, adcPort);
		}
	}
}

void serialRXEnable() {
	UCSR1B |= (1 << RXEN1);
}

void serailRXDisable() {
	UCSR1B &= ~(1 << RXEN1);
}

void uartTask() {
	Endpoint_SelectEndpoint(
			VirtualSerial_CDC_Interface.Config.DataINEndpoint.Address);
	if (Endpoint_IsReadWriteAllowed()) { // does the data have somewhere to go?
		uint16_t ct = RingBuffer_GetCount(&ringBuffer);
		if (ct > 0) {
			if (ringBuffer.Out + ct <= ringBuffer.End) {
				CDC_Device_SendData(&VirtualSerial_CDC_Interface,
						ringBuffer.Out, ct);
				ringBuffer.Out += ct;
				if (ringBuffer.Out == ringBuffer.End)
					ringBuffer.Out = ringBuffer.Start;

			} else {
				uint8_t* end = ringBuffer.Out + ct;
				uint16_t ct2 = end - ringBuffer.End;
				uint16_t ct1 = ct - ct2;
				CDC_Device_SendData(&VirtualSerial_CDC_Interface,
						ringBuffer.Out, ct1);
				CDC_Device_SendData(&VirtualSerial_CDC_Interface,
						ringBuffer.Start, ct2);
				ringBuffer.Out = ringBuffer.Start + ct2;
			}

			uint_reg_t CurrentGlobalInt = GetGlobalInterruptMask();
			GlobalInterruptDisable();

			ringBuffer.Count -= ct;

			SetGlobalInterruptMask(CurrentGlobalInt);
		}

		if (RingBuffer_GetCount(&ringBuffer) < 10) {
			SET(TX_BUSY, LOW);
			serialRXEnable();
		}
	}

	int16_t w;
	while ((w = CDC_Device_ReceiveByte(&VirtualSerial_CDC_Interface)) >= 0) {
		Serial_SendByte(w);
	}
}

void loaderTask() {
	static loaderState_t state = IDLE;
	static int8_t destination;
	static int8_t verify;
	static uint32_t byteCount;
	static uint32_t transferSize;

	int16_t w;
	uint8_t byte;

	switch (taskState) {
	case WAIT:
		break;
	case START_LOAD:
		disablePostLoad();
		taskState = LOAD;
		state = IDLE;
		break;
	case LOAD:
		w = CDC_Device_ReceiveByte(&VirtualSerial_CDC_Interface);
		byte = (uint8_t) w;
		if (w >= 0) {
			switch (state) {
			case IDLE:
				byteCount = 0;
				transferSize = 0;
				if (byte == 'F') { // write to flash
					destination = 0;
					verify = 0;
					state = READ_SIZE;
					CDC_Device_SendByte(&VirtualSerial_CDC_Interface, 'R');
				}
				if (byte == 'V') { // write to flash and verify
					destination = 0;
					verify = 1;
					state = READ_SIZE;
					CDC_Device_SendByte(&VirtualSerial_CDC_Interface, 'R');
				}
				if (byte == 'R') { // write to RAM
					destination = 1;
					state = READ_SIZE;
					CDC_Device_SendByte(&VirtualSerial_CDC_Interface, 'R');
				}
				if (byte == 'E') { //erase
					eraseFlash();
					CDC_Device_SendByte(&VirtualSerial_CDC_Interface, 'D');
				}
				break;
			case READ_SIZE:
				transferSize |= ((uint32_t) byte << (byteCount++ * 8));
				if (byteCount > 3) {
					byteCount = 0;
					if (destination) {
						state = WRITE_TO_FPGA;
						initLoad();
						startLoad();
					} else {
						state = WRITE_TO_FLASH;
						eraseFlash();
					}
					CDC_Device_SendByte(&VirtualSerial_CDC_Interface, 'O');
				}
				break;
			case WRITE_TO_FLASH:
				// we can only use the batch write for even addresses
				// so address 5 is written as a single byte
				if (byteCount == 0)
					writeByteFlash(5, byte);

				uint8_t buffIdx = (byteCount++ - 1) % 256;
				loadBuffer[buffIdx] = byte;

				if (buffIdx == 255 && byteCount != 0)
					writeFlash(byteCount + 5 - 256, loadBuffer, 256);

				if (byteCount == transferSize) {

					if (buffIdx != 255)
						writeFlash(byteCount + 5 - (buffIdx + 1), loadBuffer,
								buffIdx + 1);

					_delay_us(50);
					uint32_t size = byteCount + 5;
					for (uint8_t k = 0; k < 4; k++) {
						writeByteFlash(k + 1, (size >> (k * 8)) & 0xFF);
						_delay_us(50);
					}
					_delay_us(50);
					writeByteFlash(0, 0xAA);
					CDC_Device_SendByte(&VirtualSerial_CDC_Interface, 'D');
					if (verify) {
						state = VERIFY_FLASH;
					} else {
						state = LOAD_FROM_FLASH;
					}
				}
				break;
			case WRITE_TO_FPGA:
				sendByte(byte);
				if (++byteCount == transferSize) {
					sendExtraClocks();
					state = IDLE;
					taskState = SERVICE;
					initPostLoad();
					CDC_Device_SendByte(&VirtualSerial_CDC_Interface, 'D');
				}
				break;
			case VERIFY_FLASH:
				if (byte == 'S') {
					byteCount += 5;
					for (uint32_t k = 0; k < byteCount; k += 256) {
						uint16_t s;
						if (k + 256 <= byteCount) {
							s = 256;
						} else {
							s = byteCount - k;
						}
						readFlash(loadBuffer, k, s);
						CDC_Device_SendData(&VirtualSerial_CDC_Interface,
								(uint8_t*) loadBuffer, s);
					}
					state = LOAD_FROM_FLASH;
				}
				break;
			case LOAD_FROM_FLASH:
				if (byte == 'L') {
					loadFromFlash();
					CDC_Device_SendByte(&VirtualSerial_CDC_Interface, 'D');
					state = IDLE;
					taskState = SERVICE;
					initPostLoad();
				}
				break;
			}
		}

		break;
	case SERVICE:
		uartTask();
		adcTask();
		break;
	}
}

void setupTimers() {
	TCCR0A = 0x00; //no PWM
	TCCR0B = (1 << CS02) | (0 << CS01) | (1 << CS00); // div 1024 clock
}

void setupHardware() {
	/* Disable watchdog if enabled by bootloader/fuses */
	MCUSR &= ~(1 << WDRF);
	wdt_disable();

	/* Disable clock division */
	clock_prescale_set(clock_div_1);

	/* Hardware Initialization */
	OUTPUT(CS_FLASH);
	SET(CS_FLASH, HIGH);
	OUTPUT(CCLK);
	OUTPUT(PROGRAM);

	DIDR0 = 0xF3;
	DIDR2 = 0x03;

	setupTimers();

	USB_Init();
}

void disablePostLoad() {
	ADCSRA = 0; //disable
	UCSR1B = 0; //disable
	SPI_Disable();
	SET(CCLK, LOW);
	SET(PROGRAM, LOW);
	INPUT(INIT);
	SET(INIT, HIGH);
}

void initPostLoad() {
	CDC_Device_Flush(&VirtualSerial_CDC_Interface);

	RingBuffer_InitBuffer(&ringBuffer, loadBuffer, 256);
	RingBuffer_InitBuffer(&adcRingBuffer, adcBuffer, 512);

	adcPort = 0x0f;
	ADC_BUS_DDR &= ~ADC_BUS_MASK; // make inputs
	ADC_BUS_PORT &= ~ADC_BUS_MASK; // no pull ups

	SET(CS_FLASH, HIGH);
	OUTPUT(SS);
	SET(SS, HIGH);
	SPI_Init(FLASH_SETTINGS);

	UBRR1 = 1; // 0.5 M Baud

	UCSR1C = (1 << UCSZ11) | (1 << UCSZ10);
	UCSR1A = (1 << U2X1);
	UCSR1B = (1 << TXEN1) | (1 << RXEN1) | (1 << RXCIE1);

	DDRD |= (1 << 3);
	DDRD &= ~(1 << 2);
	PORTD |= (1 << 2);

	OUTPUT(TX_BUSY);
	SET(TX_BUSY, LOW);

	SET(CCLK, HIGH);
}

inline void enableDataBus() {
	FPGA_BUS_DDR = 0xFF;
}

void initLoad() {
	SET(INIT, HIGH); // pull-up
	SET(CCLK, LOW);
	SET(PROGRAM, LOW);

	enableDataBus();
}

void startLoad() {
	SET(CCLK, LOW);
	SET(PROGRAM, LOW);
	_delay_ms(1);
	SET(PROGRAM, HIGH);
	while (!VALUE(INIT))
		;
}

void sendByte(uint8_t byte) {
	FPGA_BUS_PORT = byte;
	SET(CCLK, HIGH);
	SET(CCLK, LOW);
}

void sendExtraClocks() {
	FPGA_BUS_PORT = 0xff;
	for (int i = 0; i < 10; i++) {
		SET(CCLK, HIGH);
		SET(CCLK, LOW);
	}
}

void loadFromFlash() {
	uint32_t lastAddr = 0;

	initLoad();
	startLoad();

	readFlash(loadBuffer, 0, 5);

	if (loadBuffer[0] != 0xaa)
		return;

	for (uint8_t k = 0; k < 4; k++) {
		lastAddr |= (uint32_t) loadBuffer[k + 1] << (k * 8);
	}

	uint32_t curAddr = 5;

	while (curAddr + 256 < lastAddr) {
		readFlash(loadBuffer, curAddr, 256);
		enableDataBus();
		for (uint16_t i = 0; i < 256; i++) {
			sendByte(loadBuffer[i]);
		}
		curAddr += 256;
	}

	if (curAddr < lastAddr) {
		uint8_t rem = lastAddr - curAddr;
		readFlash(loadBuffer, curAddr, rem);
		enableDataBus();
		for (uint8_t i = 0; i < rem; i++) {
			sendByte(loadBuffer[i]);
		}
	}

	sendExtraClocks();
}

/** Event handler for the library USB Connection event. */
void EVENT_USB_Device_Connect(void) {
}

/** Event handler for the library USB Disconnection event. */
void EVENT_USB_Device_Disconnect(void) {
}

/** Event handler for the library USB Configuration Changed event. */
void EVENT_USB_Device_ConfigurationChanged(void) {
	CDC_Device_ConfigureEndpoints(&VirtualSerial_CDC_Interface);
}

/** Event handler for the library USB Control Request reception event. */
void EVENT_USB_Device_ControlRequest(void) {
	CDC_Device_ProcessControlRequest(&VirtualSerial_CDC_Interface);
}

void EVENT_CDC_Device_ControLineStateChanged(
		USB_ClassInfo_CDC_Device_t * const CDCInterfaceInfo) {
	bool CurrentDTRState =
			(CDCInterfaceInfo->State.ControlLineStates.HostToDevice
					& CDC_CONTROL_LINE_OUT_DTR);
	if (CurrentDTRState) {
		if (!(TIFR0 & (1 << TOV0))) { // timer did not overflow
			taskState = START_LOAD;
			//SET(PROGRAM, LOW);
		}
	} else {
		TCNT0 = 0;
		TIFR0 |= (1 << TOV0);
	}
}

ISR(USART1_RX_vect) {
	RingBuffer_Insert(&ringBuffer, UDR1 );
	if (ringBuffer.Count > 100)
		SET(TX_BUSY, HIGH);
	else
		SET(TX_BUSY, LOW);
	if (ringBuffer.Count > 150)
		serailRXDisable();
}

ISR(ADC_vect) {
	RingBuffer_Insert(&adcRingBuffer, ADCL );
	RingBuffer_Insert(&adcRingBuffer, (convPort << 4) | ADCH );
}
