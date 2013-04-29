################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/LUFA/Drivers/USB/Core/XMEGA/Device_XMEGA.c \
../src/LUFA/Drivers/USB/Core/XMEGA/EndpointStream_XMEGA.c \
../src/LUFA/Drivers/USB/Core/XMEGA/Endpoint_XMEGA.c \
../src/LUFA/Drivers/USB/Core/XMEGA/Host_XMEGA.c \
../src/LUFA/Drivers/USB/Core/XMEGA/PipeStream_XMEGA.c \
../src/LUFA/Drivers/USB/Core/XMEGA/Pipe_XMEGA.c \
../src/LUFA/Drivers/USB/Core/XMEGA/USBController_XMEGA.c \
../src/LUFA/Drivers/USB/Core/XMEGA/USBInterrupt_XMEGA.c 

OBJS += \
./src/LUFA/Drivers/USB/Core/XMEGA/Device_XMEGA.o \
./src/LUFA/Drivers/USB/Core/XMEGA/EndpointStream_XMEGA.o \
./src/LUFA/Drivers/USB/Core/XMEGA/Endpoint_XMEGA.o \
./src/LUFA/Drivers/USB/Core/XMEGA/Host_XMEGA.o \
./src/LUFA/Drivers/USB/Core/XMEGA/PipeStream_XMEGA.o \
./src/LUFA/Drivers/USB/Core/XMEGA/Pipe_XMEGA.o \
./src/LUFA/Drivers/USB/Core/XMEGA/USBController_XMEGA.o \
./src/LUFA/Drivers/USB/Core/XMEGA/USBInterrupt_XMEGA.o 

C_DEPS += \
./src/LUFA/Drivers/USB/Core/XMEGA/Device_XMEGA.d \
./src/LUFA/Drivers/USB/Core/XMEGA/EndpointStream_XMEGA.d \
./src/LUFA/Drivers/USB/Core/XMEGA/Endpoint_XMEGA.d \
./src/LUFA/Drivers/USB/Core/XMEGA/Host_XMEGA.d \
./src/LUFA/Drivers/USB/Core/XMEGA/PipeStream_XMEGA.d \
./src/LUFA/Drivers/USB/Core/XMEGA/Pipe_XMEGA.d \
./src/LUFA/Drivers/USB/Core/XMEGA/USBController_XMEGA.d \
./src/LUFA/Drivers/USB/Core/XMEGA/USBInterrupt_XMEGA.d 


# Each subdirectory must supply rules for building sources it contributes
src/LUFA/Drivers/USB/Core/XMEGA/%.o: ../src/LUFA/Drivers/USB/Core/XMEGA/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/home/justin/Dropbox/laptop-workspace/Mojo-v2-Loader/src/Config" -DF_USB=8000000 -DUSE_LUFA_CONFIG_HEADER -Wall -Os -fpack-struct -fshort-enums -std=gnu99 -funsigned-char -funsigned-bitfields -mmcu=atmega16u4 -DF_CPU=8000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


