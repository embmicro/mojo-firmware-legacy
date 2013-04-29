################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/LUFA/Drivers/USB/Core/ConfigDescriptors.c \
../src/LUFA/Drivers/USB/Core/DeviceStandardReq.c \
../src/LUFA/Drivers/USB/Core/Events.c \
../src/LUFA/Drivers/USB/Core/HostStandardReq.c \
../src/LUFA/Drivers/USB/Core/USBTask.c 

OBJS += \
./src/LUFA/Drivers/USB/Core/ConfigDescriptors.o \
./src/LUFA/Drivers/USB/Core/DeviceStandardReq.o \
./src/LUFA/Drivers/USB/Core/Events.o \
./src/LUFA/Drivers/USB/Core/HostStandardReq.o \
./src/LUFA/Drivers/USB/Core/USBTask.o 

C_DEPS += \
./src/LUFA/Drivers/USB/Core/ConfigDescriptors.d \
./src/LUFA/Drivers/USB/Core/DeviceStandardReq.d \
./src/LUFA/Drivers/USB/Core/Events.d \
./src/LUFA/Drivers/USB/Core/HostStandardReq.d \
./src/LUFA/Drivers/USB/Core/USBTask.d 


# Each subdirectory must supply rules for building sources it contributes
src/LUFA/Drivers/USB/Core/%.o: ../src/LUFA/Drivers/USB/Core/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/home/justin/Dropbox/laptop-workspace/Mojo-v2-Loader/src/Config" -DF_USB=8000000 -DUSE_LUFA_CONFIG_HEADER -Wall -Os -fpack-struct -fshort-enums -std=gnu99 -funsigned-char -funsigned-bitfields -mmcu=atmega16u4 -DF_CPU=8000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


