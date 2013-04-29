################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../LUFA/Drivers/Peripheral/XMEGA/Serial_XMEGA.c 

OBJS += \
./LUFA/Drivers/Peripheral/XMEGA/Serial_XMEGA.o 

C_DEPS += \
./LUFA/Drivers/Peripheral/XMEGA/Serial_XMEGA.d 


# Each subdirectory must supply rules for building sources it contributes
LUFA/Drivers/Peripheral/XMEGA/%.o: ../LUFA/Drivers/Peripheral/XMEGA/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/home/justin/workspace/Mojo-v2-Loader/LUFA" -DF_USB=8000000 -Wall -Os -fpack-struct -fshort-enums -std=gnu99 -funsigned-char -funsigned-bitfields -mmcu=atmega16u4 -DF_CPU=8000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


