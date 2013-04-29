################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../LUFA/Drivers/USB/Core/ConfigDescriptors.c \
../LUFA/Drivers/USB/Core/DeviceStandardReq.c \
../LUFA/Drivers/USB/Core/Events.c \
../LUFA/Drivers/USB/Core/HostStandardReq.c \
../LUFA/Drivers/USB/Core/USBTask.c 

OBJS += \
./LUFA/Drivers/USB/Core/ConfigDescriptors.o \
./LUFA/Drivers/USB/Core/DeviceStandardReq.o \
./LUFA/Drivers/USB/Core/Events.o \
./LUFA/Drivers/USB/Core/HostStandardReq.o \
./LUFA/Drivers/USB/Core/USBTask.o 

C_DEPS += \
./LUFA/Drivers/USB/Core/ConfigDescriptors.d \
./LUFA/Drivers/USB/Core/DeviceStandardReq.d \
./LUFA/Drivers/USB/Core/Events.d \
./LUFA/Drivers/USB/Core/HostStandardReq.d \
./LUFA/Drivers/USB/Core/USBTask.d 


# Each subdirectory must supply rules for building sources it contributes
LUFA/Drivers/USB/Core/%.o: ../LUFA/Drivers/USB/Core/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/home/justin/workspace/Mojo-v2-Loader/LUFA" -DF_USB=8000000 -Wall -Os -fpack-struct -fshort-enums -std=gnu99 -funsigned-char -funsigned-bitfields -mmcu=atmega16u4 -DF_CPU=8000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


