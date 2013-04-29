/*
 * Flash.c
 *
 *  Created on: Mar 29, 2013
 *      Author: justin
 */

#include "Flash.h"

void waitBusy() {
	SET(CS_FLASH, LOW);
	SPI_SendByte(0x05); //read status register
	while (SPI_ReceiveByte() & 0x01)
		;
	SET(CS_FLASH, HIGH);
}

void eraseFlash() {
	SPI_Init(FLASH_SETTINGS);

	SET(CS_FLASH, LOW);
	SPI_SendByte(0x06); // Write mode
	SET(CS_FLASH, HIGH);

	SET(CS_FLASH, LOW);
	SPI_SendByte(0x01); // Write status reg
	SPI_SendByte(0x00); // Disable protection
	SET(CS_FLASH, HIGH);

	SET(CS_FLASH, LOW);
	SPI_SendByte(0x06); // Write mode
	SET(CS_FLASH, HIGH);

	SET(CS_FLASH, LOW);
	SPI_SendByte(0x60); // Full chip erase
	SET(CS_FLASH, HIGH);

	waitBusy(); // Wait for operation to finish

	SPI_Disable();
}

void writeByteFlash(uint32_t address, uint8_t byte) {
	SPI_Init(FLASH_SETTINGS);

	waitBusy(); // wait for other writes

	SET(CS_FLASH, LOW);
	SPI_SendByte(0x06); // Write mode
	SET(CS_FLASH, HIGH);

	SET(CS_FLASH, LOW);
	SPI_SendByte(0x02); // Single write
	SPI_SendByte(address >> 16);
	SPI_SendByte(address >> 8);
	SPI_SendByte(address);
	SPI_SendByte(byte);
	SET(CS_FLASH, HIGH);

	SPI_Disable();
}

void waitHardwareBusy() {
	SET(CS_FLASH, LOW);
	_delay_us(1);
	while (VALUE(MISO) == 0)
		;
	SET(CS_FLASH, HIGH);
}

void writeFlash(uint32_t startAddress, uint8_t *data, uint16_t length) {
	if (length < 2) {
		if (length == 1)
			writeByteFlash(startAddress, data[0]);
		return;
	}

	uint16_t pos;

	SPI_Init(FLASH_SETTINGS);

	waitBusy();

	SET(CS_FLASH, LOW);
	SPI_SendByte(0x70); // Hardware EOW detection
	SET(CS_FLASH, HIGH);

	SET(CS_FLASH, LOW);
	SPI_SendByte(0x06); // Write Enable
	SET(CS_FLASH, HIGH);

	SET(CS_FLASH, LOW);
	SPI_SendByte(0xAD); // Auto-increment write
	SPI_SendByte(startAddress >> 16);
	SPI_SendByte(startAddress >> 8);
	SPI_SendByte(startAddress);
	SPI_SendByte(data[0]);
	SPI_SendByte(data[1]);
	SET(CS_FLASH, HIGH);

	waitHardwareBusy();

	for (pos = 2; pos <= length - 2; pos += 2) {
		SET(CS_FLASH, LOW);
		SPI_SendByte(0xAD); // Auto-increment write
		SPI_SendByte(data[pos]);
		SPI_SendByte(data[pos + 1]);
		SET(CS_FLASH, HIGH);

		waitHardwareBusy();
	}

	SET(CS_FLASH, LOW);
	SPI_SendByte(0x04); // Write Disable
	SET(CS_FLASH, HIGH);

	SET(CS_FLASH, LOW);
	SPI_SendByte(0x80); // Disable hardware EOW detection
	SET(CS_FLASH, HIGH);

	if (pos < length)
		writeByteFlash(startAddress + pos, data[pos]);

}

void readFlash(volatile uint8_t* buffer, uint32_t address, uint16_t count) {
	SPI_Init(FLASH_SETTINGS);

	SET(CS_FLASH, LOW);
	SPI_SendByte(0x03);
	SPI_SendByte(address >> 16);
	SPI_SendByte(address >> 8);
	SPI_SendByte(address);

	for (uint16_t c = 0; c < count; c++)
		buffer[c] = SPI_ReceiveByte();
	SET(CS_FLASH, HIGH);

	SPI_Disable();
}
