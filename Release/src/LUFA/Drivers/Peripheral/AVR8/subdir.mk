################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/LUFA/Drivers/Peripheral/AVR8/Serial_AVR8.c \
../src/LUFA/Drivers/Peripheral/AVR8/TWI_AVR8.c 

OBJS += \
./src/LUFA/Drivers/Peripheral/AVR8/Serial_AVR8.o \
./src/LUFA/Drivers/Peripheral/AVR8/TWI_AVR8.o 

C_DEPS += \
./src/LUFA/Drivers/Peripheral/AVR8/Serial_AVR8.d \
./src/LUFA/Drivers/Peripheral/AVR8/TWI_AVR8.d 


# Each subdirectory must supply rules for building sources it contributes
src/LUFA/Drivers/Peripheral/AVR8/%.o: ../src/LUFA/Drivers/Peripheral/AVR8/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/home/justin/Dropbox/laptop-workspace/Mojo-v2-Loader/src/Config" -DF_USB=8000000 -DUSE_LUFA_CONFIG_HEADER -Wall -Os -fpack-struct -fshort-enums -std=gnu99 -funsigned-char -funsigned-bitfields -mmcu=atmega16u4 -DF_CPU=8000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


