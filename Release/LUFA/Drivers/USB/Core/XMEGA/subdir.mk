################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../LUFA/Drivers/USB/Core/XMEGA/Device_XMEGA.c \
../LUFA/Drivers/USB/Core/XMEGA/EndpointStream_XMEGA.c \
../LUFA/Drivers/USB/Core/XMEGA/Endpoint_XMEGA.c \
../LUFA/Drivers/USB/Core/XMEGA/Host_XMEGA.c \
../LUFA/Drivers/USB/Core/XMEGA/PipeStream_XMEGA.c \
../LUFA/Drivers/USB/Core/XMEGA/Pipe_XMEGA.c \
../LUFA/Drivers/USB/Core/XMEGA/USBController_XMEGA.c \
../LUFA/Drivers/USB/Core/XMEGA/USBInterrupt_XMEGA.c 

OBJS += \
./LUFA/Drivers/USB/Core/XMEGA/Device_XMEGA.o \
./LUFA/Drivers/USB/Core/XMEGA/EndpointStream_XMEGA.o \
./LUFA/Drivers/USB/Core/XMEGA/Endpoint_XMEGA.o \
./LUFA/Drivers/USB/Core/XMEGA/Host_XMEGA.o \
./LUFA/Drivers/USB/Core/XMEGA/PipeStream_XMEGA.o \
./LUFA/Drivers/USB/Core/XMEGA/Pipe_XMEGA.o \
./LUFA/Drivers/USB/Core/XMEGA/USBController_XMEGA.o \
./LUFA/Drivers/USB/Core/XMEGA/USBInterrupt_XMEGA.o 

C_DEPS += \
./LUFA/Drivers/USB/Core/XMEGA/Device_XMEGA.d \
./LUFA/Drivers/USB/Core/XMEGA/EndpointStream_XMEGA.d \
./LUFA/Drivers/USB/Core/XMEGA/Endpoint_XMEGA.d \
./LUFA/Drivers/USB/Core/XMEGA/Host_XMEGA.d \
./LUFA/Drivers/USB/Core/XMEGA/PipeStream_XMEGA.d \
./LUFA/Drivers/USB/Core/XMEGA/Pipe_XMEGA.d \
./LUFA/Drivers/USB/Core/XMEGA/USBController_XMEGA.d \
./LUFA/Drivers/USB/Core/XMEGA/USBInterrupt_XMEGA.d 


# Each subdirectory must supply rules for building sources it contributes
LUFA/Drivers/USB/Core/XMEGA/%.o: ../LUFA/Drivers/USB/Core/XMEGA/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/home/justin/workspace/Mojo-v2-Loader/LUFA" -DF_USB=8000000 -Wall -Os -fpack-struct -fshort-enums -std=gnu99 -funsigned-char -funsigned-bitfields -mmcu=atmega16u4 -DF_CPU=8000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


