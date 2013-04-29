################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../LUFA/Drivers/USB/Core/UC3/Device_UC3.c \
../LUFA/Drivers/USB/Core/UC3/EndpointStream_UC3.c \
../LUFA/Drivers/USB/Core/UC3/Endpoint_UC3.c \
../LUFA/Drivers/USB/Core/UC3/Host_UC3.c \
../LUFA/Drivers/USB/Core/UC3/PipeStream_UC3.c \
../LUFA/Drivers/USB/Core/UC3/Pipe_UC3.c \
../LUFA/Drivers/USB/Core/UC3/USBController_UC3.c \
../LUFA/Drivers/USB/Core/UC3/USBInterrupt_UC3.c 

OBJS += \
./LUFA/Drivers/USB/Core/UC3/Device_UC3.o \
./LUFA/Drivers/USB/Core/UC3/EndpointStream_UC3.o \
./LUFA/Drivers/USB/Core/UC3/Endpoint_UC3.o \
./LUFA/Drivers/USB/Core/UC3/Host_UC3.o \
./LUFA/Drivers/USB/Core/UC3/PipeStream_UC3.o \
./LUFA/Drivers/USB/Core/UC3/Pipe_UC3.o \
./LUFA/Drivers/USB/Core/UC3/USBController_UC3.o \
./LUFA/Drivers/USB/Core/UC3/USBInterrupt_UC3.o 

C_DEPS += \
./LUFA/Drivers/USB/Core/UC3/Device_UC3.d \
./LUFA/Drivers/USB/Core/UC3/EndpointStream_UC3.d \
./LUFA/Drivers/USB/Core/UC3/Endpoint_UC3.d \
./LUFA/Drivers/USB/Core/UC3/Host_UC3.d \
./LUFA/Drivers/USB/Core/UC3/PipeStream_UC3.d \
./LUFA/Drivers/USB/Core/UC3/Pipe_UC3.d \
./LUFA/Drivers/USB/Core/UC3/USBController_UC3.d \
./LUFA/Drivers/USB/Core/UC3/USBInterrupt_UC3.d 


# Each subdirectory must supply rules for building sources it contributes
LUFA/Drivers/USB/Core/UC3/%.o: ../LUFA/Drivers/USB/Core/UC3/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/home/justin/workspace/Mojo-v2-Loader/LUFA" -DF_USB=8000000 -Wall -Os -fpack-struct -fshort-enums -std=gnu99 -funsigned-char -funsigned-bitfields -mmcu=atmega16u4 -DF_CPU=8000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


