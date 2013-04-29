################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lib/LUFA/Drivers/Peripheral/AVR8/Serial_AVR8.c \
../lib/LUFA/Drivers/Peripheral/AVR8/TWI_AVR8.c 

OBJS += \
./lib/LUFA/Drivers/Peripheral/AVR8/Serial_AVR8.o \
./lib/LUFA/Drivers/Peripheral/AVR8/TWI_AVR8.o 

C_DEPS += \
./lib/LUFA/Drivers/Peripheral/AVR8/Serial_AVR8.d \
./lib/LUFA/Drivers/Peripheral/AVR8/TWI_AVR8.d 


# Each subdirectory must supply rules for building sources it contributes
lib/LUFA/Drivers/Peripheral/AVR8/%.o: ../lib/LUFA/Drivers/Peripheral/AVR8/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/home/justin/workspace/Mojo-v2-Loader/lib" -DF_USB=8000000 -Wall -Os -fpack-struct -fshort-enums -std=gnu99 -funsigned-char -funsigned-bitfields -mmcu=atmega16u4 -DF_CPU=8000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


