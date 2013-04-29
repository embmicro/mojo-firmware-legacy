################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/LUFA/Drivers/USB/Class/Host/AndroidAccessoryClassHost.c \
../src/LUFA/Drivers/USB/Class/Host/AudioClassHost.c \
../src/LUFA/Drivers/USB/Class/Host/CDCClassHost.c \
../src/LUFA/Drivers/USB/Class/Host/HIDClassHost.c \
../src/LUFA/Drivers/USB/Class/Host/MIDIClassHost.c \
../src/LUFA/Drivers/USB/Class/Host/MassStorageClassHost.c \
../src/LUFA/Drivers/USB/Class/Host/PrinterClassHost.c \
../src/LUFA/Drivers/USB/Class/Host/RNDISClassHost.c \
../src/LUFA/Drivers/USB/Class/Host/StillImageClassHost.c 

OBJS += \
./src/LUFA/Drivers/USB/Class/Host/AndroidAccessoryClassHost.o \
./src/LUFA/Drivers/USB/Class/Host/AudioClassHost.o \
./src/LUFA/Drivers/USB/Class/Host/CDCClassHost.o \
./src/LUFA/Drivers/USB/Class/Host/HIDClassHost.o \
./src/LUFA/Drivers/USB/Class/Host/MIDIClassHost.o \
./src/LUFA/Drivers/USB/Class/Host/MassStorageClassHost.o \
./src/LUFA/Drivers/USB/Class/Host/PrinterClassHost.o \
./src/LUFA/Drivers/USB/Class/Host/RNDISClassHost.o \
./src/LUFA/Drivers/USB/Class/Host/StillImageClassHost.o 

C_DEPS += \
./src/LUFA/Drivers/USB/Class/Host/AndroidAccessoryClassHost.d \
./src/LUFA/Drivers/USB/Class/Host/AudioClassHost.d \
./src/LUFA/Drivers/USB/Class/Host/CDCClassHost.d \
./src/LUFA/Drivers/USB/Class/Host/HIDClassHost.d \
./src/LUFA/Drivers/USB/Class/Host/MIDIClassHost.d \
./src/LUFA/Drivers/USB/Class/Host/MassStorageClassHost.d \
./src/LUFA/Drivers/USB/Class/Host/PrinterClassHost.d \
./src/LUFA/Drivers/USB/Class/Host/RNDISClassHost.d \
./src/LUFA/Drivers/USB/Class/Host/StillImageClassHost.d 


# Each subdirectory must supply rules for building sources it contributes
src/LUFA/Drivers/USB/Class/Host/%.o: ../src/LUFA/Drivers/USB/Class/Host/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/home/justin/Dropbox/laptop-workspace/Mojo-v2-Loader/src/Config" -DF_USB=8000000 -DUSE_LUFA_CONFIG_HEADER -Wall -Os -fpack-struct -fshort-enums -std=gnu99 -funsigned-char -funsigned-bitfields -mmcu=atmega16u4 -DF_CPU=8000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


