/*
 * loader.h
 *
 *  Created on: Mar 28, 2013
 *      Author: justin
 */

#ifndef LOADER_H_
#define LOADER_H_

#include <avr/io.h>
#include <avr/wdt.h>
#include <avr/power.h>
#include <avr/interrupt.h>

#include "Descriptors.h"

#include "LUFA/Drivers/USB/USB.h"
#include "LUFA/Drivers/Peripheral/SPI.h"
#include "LUFA/Drivers/Peripheral/Serial.h"

#include "Hardware.h"
#include "Flash.h"

void setupHardware();
void startLoad();
void initLoad();
void sendByte(uint8_t);
void sendExtraClocks();
void loaderTask();
void loadFromFlash();
void adcTask();
void uartTask();
void initPostLoad();
void disablePostLoad();
inline void enableDataBus();

void EVENT_USB_Device_Connect();
void EVENT_USB_Device_Disconnect();
void EVENT_USB_Device_ConfigurationChanged();
void EVENT_USB_Device_ControlRequest();

void EVENT_CDC_Device_ControLineStateChanged(
		USB_ClassInfo_CDC_Device_t * const CDCInterfaceInfo);

#endif /* LOADER_H_ */
