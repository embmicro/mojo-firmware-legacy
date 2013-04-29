################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lib/LUFA/Build/HID_EEPROM_Loader/HID_EEPROM_Loader.c 

OBJS += \
./lib/LUFA/Build/HID_EEPROM_Loader/HID_EEPROM_Loader.o 

C_DEPS += \
./lib/LUFA/Build/HID_EEPROM_Loader/HID_EEPROM_Loader.d 


# Each subdirectory must supply rules for building sources it contributes
lib/LUFA/Build/HID_EEPROM_Loader/%.o: ../lib/LUFA/Build/HID_EEPROM_Loader/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/home/justin/workspace/Mojo-v2-Loader/lib" -DF_USB=8000000 -Wall -Os -fpack-struct -fshort-enums -std=gnu99 -funsigned-char -funsigned-bitfields -mmcu=atmega16u4 -DF_CPU=8000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


