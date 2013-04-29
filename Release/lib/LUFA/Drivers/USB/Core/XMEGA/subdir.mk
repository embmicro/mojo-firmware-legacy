################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lib/LUFA/Drivers/USB/Core/XMEGA/Device_XMEGA.c \
../lib/LUFA/Drivers/USB/Core/XMEGA/EndpointStream_XMEGA.c \
../lib/LUFA/Drivers/USB/Core/XMEGA/Endpoint_XMEGA.c \
../lib/LUFA/Drivers/USB/Core/XMEGA/Host_XMEGA.c \
../lib/LUFA/Drivers/USB/Core/XMEGA/PipeStream_XMEGA.c \
../lib/LUFA/Drivers/USB/Core/XMEGA/Pipe_XMEGA.c \
../lib/LUFA/Drivers/USB/Core/XMEGA/USBController_XMEGA.c \
../lib/LUFA/Drivers/USB/Core/XMEGA/USBInterrupt_XMEGA.c 

OBJS += \
./lib/LUFA/Drivers/USB/Core/XMEGA/Device_XMEGA.o \
./lib/LUFA/Drivers/USB/Core/XMEGA/EndpointStream_XMEGA.o \
./lib/LUFA/Drivers/USB/Core/XMEGA/Endpoint_XMEGA.o \
./lib/LUFA/Drivers/USB/Core/XMEGA/Host_XMEGA.o \
./lib/LUFA/Drivers/USB/Core/XMEGA/PipeStream_XMEGA.o \
./lib/LUFA/Drivers/USB/Core/XMEGA/Pipe_XMEGA.o \
./lib/LUFA/Drivers/USB/Core/XMEGA/USBController_XMEGA.o \
./lib/LUFA/Drivers/USB/Core/XMEGA/USBInterrupt_XMEGA.o 

C_DEPS += \
./lib/LUFA/Drivers/USB/Core/XMEGA/Device_XMEGA.d \
./lib/LUFA/Drivers/USB/Core/XMEGA/EndpointStream_XMEGA.d \
./lib/LUFA/Drivers/USB/Core/XMEGA/Endpoint_XMEGA.d \
./lib/LUFA/Drivers/USB/Core/XMEGA/Host_XMEGA.d \
./lib/LUFA/Drivers/USB/Core/XMEGA/PipeStream_XMEGA.d \
./lib/LUFA/Drivers/USB/Core/XMEGA/Pipe_XMEGA.d \
./lib/LUFA/Drivers/USB/Core/XMEGA/USBController_XMEGA.d \
./lib/LUFA/Drivers/USB/Core/XMEGA/USBInterrupt_XMEGA.d 


# Each subdirectory must supply rules for building sources it contributes
lib/LUFA/Drivers/USB/Core/XMEGA/%.o: ../lib/LUFA/Drivers/USB/Core/XMEGA/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/home/justin/workspace/Mojo-v2-Loader/lib" -DF_USB=8000000 -Wall -Os -fpack-struct -fshort-enums -std=gnu99 -funsigned-char -funsigned-bitfields -mmcu=atmega16u4 -DF_CPU=8000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


