################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/LUFA/Drivers/USB/Core/AVR8/Device_AVR8.c \
../src/LUFA/Drivers/USB/Core/AVR8/EndpointStream_AVR8.c \
../src/LUFA/Drivers/USB/Core/AVR8/Endpoint_AVR8.c \
../src/LUFA/Drivers/USB/Core/AVR8/Host_AVR8.c \
../src/LUFA/Drivers/USB/Core/AVR8/PipeStream_AVR8.c \
../src/LUFA/Drivers/USB/Core/AVR8/Pipe_AVR8.c \
../src/LUFA/Drivers/USB/Core/AVR8/USBController_AVR8.c \
../src/LUFA/Drivers/USB/Core/AVR8/USBInterrupt_AVR8.c 

OBJS += \
./src/LUFA/Drivers/USB/Core/AVR8/Device_AVR8.o \
./src/LUFA/Drivers/USB/Core/AVR8/EndpointStream_AVR8.o \
./src/LUFA/Drivers/USB/Core/AVR8/Endpoint_AVR8.o \
./src/LUFA/Drivers/USB/Core/AVR8/Host_AVR8.o \
./src/LUFA/Drivers/USB/Core/AVR8/PipeStream_AVR8.o \
./src/LUFA/Drivers/USB/Core/AVR8/Pipe_AVR8.o \
./src/LUFA/Drivers/USB/Core/AVR8/USBController_AVR8.o \
./src/LUFA/Drivers/USB/Core/AVR8/USBInterrupt_AVR8.o 

C_DEPS += \
./src/LUFA/Drivers/USB/Core/AVR8/Device_AVR8.d \
./src/LUFA/Drivers/USB/Core/AVR8/EndpointStream_AVR8.d \
./src/LUFA/Drivers/USB/Core/AVR8/Endpoint_AVR8.d \
./src/LUFA/Drivers/USB/Core/AVR8/Host_AVR8.d \
./src/LUFA/Drivers/USB/Core/AVR8/PipeStream_AVR8.d \
./src/LUFA/Drivers/USB/Core/AVR8/Pipe_AVR8.d \
./src/LUFA/Drivers/USB/Core/AVR8/USBController_AVR8.d \
./src/LUFA/Drivers/USB/Core/AVR8/USBInterrupt_AVR8.d 


# Each subdirectory must supply rules for building sources it contributes
src/LUFA/Drivers/USB/Core/AVR8/%.o: ../src/LUFA/Drivers/USB/Core/AVR8/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/home/justin/Dropbox/laptop-workspace/Mojo-v2-Loader/src/Config" -DF_USB=8000000 -DUSE_LUFA_CONFIG_HEADER -Wall -Os -fpack-struct -fshort-enums -std=gnu99 -funsigned-char -funsigned-bitfields -mmcu=atmega16u4 -DF_CPU=8000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


