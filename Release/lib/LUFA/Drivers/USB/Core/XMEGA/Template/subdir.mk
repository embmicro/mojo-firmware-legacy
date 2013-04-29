################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lib/LUFA/Drivers/USB/Core/XMEGA/Template/Template_Endpoint_Control_R.c \
../lib/LUFA/Drivers/USB/Core/XMEGA/Template/Template_Endpoint_Control_W.c \
../lib/LUFA/Drivers/USB/Core/XMEGA/Template/Template_Endpoint_RW.c 

OBJS += \
./lib/LUFA/Drivers/USB/Core/XMEGA/Template/Template_Endpoint_Control_R.o \
./lib/LUFA/Drivers/USB/Core/XMEGA/Template/Template_Endpoint_Control_W.o \
./lib/LUFA/Drivers/USB/Core/XMEGA/Template/Template_Endpoint_RW.o 

C_DEPS += \
./lib/LUFA/Drivers/USB/Core/XMEGA/Template/Template_Endpoint_Control_R.d \
./lib/LUFA/Drivers/USB/Core/XMEGA/Template/Template_Endpoint_Control_W.d \
./lib/LUFA/Drivers/USB/Core/XMEGA/Template/Template_Endpoint_RW.d 


# Each subdirectory must supply rules for building sources it contributes
lib/LUFA/Drivers/USB/Core/XMEGA/Template/%.o: ../lib/LUFA/Drivers/USB/Core/XMEGA/Template/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/home/justin/workspace/Mojo-v2-Loader/lib" -DF_USB=8000000 -Wall -Os -fpack-struct -fshort-enums -std=gnu99 -funsigned-char -funsigned-bitfields -mmcu=atmega16u4 -DF_CPU=8000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


