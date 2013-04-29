################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lib/LUFA/Drivers/USB/Class/Host/AndroidAccessoryClassHost.c \
../lib/LUFA/Drivers/USB/Class/Host/AudioClassHost.c \
../lib/LUFA/Drivers/USB/Class/Host/CDCClassHost.c \
../lib/LUFA/Drivers/USB/Class/Host/HIDClassHost.c \
../lib/LUFA/Drivers/USB/Class/Host/MIDIClassHost.c \
../lib/LUFA/Drivers/USB/Class/Host/MassStorageClassHost.c \
../lib/LUFA/Drivers/USB/Class/Host/PrinterClassHost.c \
../lib/LUFA/Drivers/USB/Class/Host/RNDISClassHost.c \
../lib/LUFA/Drivers/USB/Class/Host/StillImageClassHost.c 

OBJS += \
./lib/LUFA/Drivers/USB/Class/Host/AndroidAccessoryClassHost.o \
./lib/LUFA/Drivers/USB/Class/Host/AudioClassHost.o \
./lib/LUFA/Drivers/USB/Class/Host/CDCClassHost.o \
./lib/LUFA/Drivers/USB/Class/Host/HIDClassHost.o \
./lib/LUFA/Drivers/USB/Class/Host/MIDIClassHost.o \
./lib/LUFA/Drivers/USB/Class/Host/MassStorageClassHost.o \
./lib/LUFA/Drivers/USB/Class/Host/PrinterClassHost.o \
./lib/LUFA/Drivers/USB/Class/Host/RNDISClassHost.o \
./lib/LUFA/Drivers/USB/Class/Host/StillImageClassHost.o 

C_DEPS += \
./lib/LUFA/Drivers/USB/Class/Host/AndroidAccessoryClassHost.d \
./lib/LUFA/Drivers/USB/Class/Host/AudioClassHost.d \
./lib/LUFA/Drivers/USB/Class/Host/CDCClassHost.d \
./lib/LUFA/Drivers/USB/Class/Host/HIDClassHost.d \
./lib/LUFA/Drivers/USB/Class/Host/MIDIClassHost.d \
./lib/LUFA/Drivers/USB/Class/Host/MassStorageClassHost.d \
./lib/LUFA/Drivers/USB/Class/Host/PrinterClassHost.d \
./lib/LUFA/Drivers/USB/Class/Host/RNDISClassHost.d \
./lib/LUFA/Drivers/USB/Class/Host/StillImageClassHost.d 


# Each subdirectory must supply rules for building sources it contributes
lib/LUFA/Drivers/USB/Class/Host/%.o: ../lib/LUFA/Drivers/USB/Class/Host/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/home/justin/workspace/Mojo-v2-Loader/lib" -DF_USB=8000000 -Wall -Os -fpack-struct -fshort-enums -std=gnu99 -funsigned-char -funsigned-bitfields -mmcu=atmega16u4 -DF_CPU=8000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


