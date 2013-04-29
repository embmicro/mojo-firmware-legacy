################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../LUFA/Drivers/USB/Class/Device/AudioClassDevice.c \
../LUFA/Drivers/USB/Class/Device/CDCClassDevice.c \
../LUFA/Drivers/USB/Class/Device/HIDClassDevice.c \
../LUFA/Drivers/USB/Class/Device/MIDIClassDevice.c \
../LUFA/Drivers/USB/Class/Device/MassStorageClassDevice.c \
../LUFA/Drivers/USB/Class/Device/RNDISClassDevice.c 

OBJS += \
./LUFA/Drivers/USB/Class/Device/AudioClassDevice.o \
./LUFA/Drivers/USB/Class/Device/CDCClassDevice.o \
./LUFA/Drivers/USB/Class/Device/HIDClassDevice.o \
./LUFA/Drivers/USB/Class/Device/MIDIClassDevice.o \
./LUFA/Drivers/USB/Class/Device/MassStorageClassDevice.o \
./LUFA/Drivers/USB/Class/Device/RNDISClassDevice.o 

C_DEPS += \
./LUFA/Drivers/USB/Class/Device/AudioClassDevice.d \
./LUFA/Drivers/USB/Class/Device/CDCClassDevice.d \
./LUFA/Drivers/USB/Class/Device/HIDClassDevice.d \
./LUFA/Drivers/USB/Class/Device/MIDIClassDevice.d \
./LUFA/Drivers/USB/Class/Device/MassStorageClassDevice.d \
./LUFA/Drivers/USB/Class/Device/RNDISClassDevice.d 


# Each subdirectory must supply rules for building sources it contributes
LUFA/Drivers/USB/Class/Device/%.o: ../LUFA/Drivers/USB/Class/Device/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/home/justin/workspace/Mojo-v2-Loader/LUFA" -DF_USB=8000000 -Wall -Os -fpack-struct -fshort-enums -std=gnu99 -funsigned-char -funsigned-bitfields -mmcu=atmega16u4 -DF_CPU=8000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


