################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/LUFA/Drivers/USB/Class/Device/CDCClassDevice.c 

OBJS += \
./src/LUFA/Drivers/USB/Class/Device/CDCClassDevice.o 

C_DEPS += \
./src/LUFA/Drivers/USB/Class/Device/CDCClassDevice.d 


# Each subdirectory must supply rules for building sources it contributes
src/LUFA/Drivers/USB/Class/Device/%.o: ../src/LUFA/Drivers/USB/Class/Device/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/home/justin/Dropbox/laptop-workspace/Mojo-v2-Loader/src/Config" -DF_USB=8000000 -DUSE_LUFA_CONFIG_HEADER -Wall -Os -fpack-struct -fshort-enums -std=gnu99 -funsigned-char -funsigned-bitfields -mmcu=atmega16u4 -DF_CPU=8000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


