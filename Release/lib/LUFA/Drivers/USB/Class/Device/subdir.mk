################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lib/LUFA/Drivers/USB/Class/Device/AudioClassDevice.c \
../lib/LUFA/Drivers/USB/Class/Device/CDCClassDevice.c \
../lib/LUFA/Drivers/USB/Class/Device/HIDClassDevice.c \
../lib/LUFA/Drivers/USB/Class/Device/MIDIClassDevice.c \
../lib/LUFA/Drivers/USB/Class/Device/MassStorageClassDevice.c \
../lib/LUFA/Drivers/USB/Class/Device/RNDISClassDevice.c 

OBJS += \
./lib/LUFA/Drivers/USB/Class/Device/AudioClassDevice.o \
./lib/LUFA/Drivers/USB/Class/Device/CDCClassDevice.o \
./lib/LUFA/Drivers/USB/Class/Device/HIDClassDevice.o \
./lib/LUFA/Drivers/USB/Class/Device/MIDIClassDevice.o \
./lib/LUFA/Drivers/USB/Class/Device/MassStorageClassDevice.o \
./lib/LUFA/Drivers/USB/Class/Device/RNDISClassDevice.o 

C_DEPS += \
./lib/LUFA/Drivers/USB/Class/Device/AudioClassDevice.d \
./lib/LUFA/Drivers/USB/Class/Device/CDCClassDevice.d \
./lib/LUFA/Drivers/USB/Class/Device/HIDClassDevice.d \
./lib/LUFA/Drivers/USB/Class/Device/MIDIClassDevice.d \
./lib/LUFA/Drivers/USB/Class/Device/MassStorageClassDevice.d \
./lib/LUFA/Drivers/USB/Class/Device/RNDISClassDevice.d 


# Each subdirectory must supply rules for building sources it contributes
lib/LUFA/Drivers/USB/Class/Device/%.o: ../lib/LUFA/Drivers/USB/Class/Device/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/home/justin/workspace/Mojo-v2-Loader/lib" -DF_USB=8000000 -Wall -Os -fpack-struct -fshort-enums -std=gnu99 -funsigned-char -funsigned-bitfields -mmcu=atmega16u4 -DF_CPU=8000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


