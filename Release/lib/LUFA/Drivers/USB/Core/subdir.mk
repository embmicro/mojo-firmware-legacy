################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lib/LUFA/Drivers/USB/Core/ConfigDescriptors.c \
../lib/LUFA/Drivers/USB/Core/DeviceStandardReq.c \
../lib/LUFA/Drivers/USB/Core/Events.c \
../lib/LUFA/Drivers/USB/Core/HostStandardReq.c \
../lib/LUFA/Drivers/USB/Core/USBTask.c 

OBJS += \
./lib/LUFA/Drivers/USB/Core/ConfigDescriptors.o \
./lib/LUFA/Drivers/USB/Core/DeviceStandardReq.o \
./lib/LUFA/Drivers/USB/Core/Events.o \
./lib/LUFA/Drivers/USB/Core/HostStandardReq.o \
./lib/LUFA/Drivers/USB/Core/USBTask.o 

C_DEPS += \
./lib/LUFA/Drivers/USB/Core/ConfigDescriptors.d \
./lib/LUFA/Drivers/USB/Core/DeviceStandardReq.d \
./lib/LUFA/Drivers/USB/Core/Events.d \
./lib/LUFA/Drivers/USB/Core/HostStandardReq.d \
./lib/LUFA/Drivers/USB/Core/USBTask.d 


# Each subdirectory must supply rules for building sources it contributes
lib/LUFA/Drivers/USB/Core/%.o: ../lib/LUFA/Drivers/USB/Core/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/home/justin/workspace/Mojo-v2-Loader/lib" -DF_USB=8000000 -Wall -Os -fpack-struct -fshort-enums -std=gnu99 -funsigned-char -funsigned-bitfields -mmcu=atmega16u4 -DF_CPU=8000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


