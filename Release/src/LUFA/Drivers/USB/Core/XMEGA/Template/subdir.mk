################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/LUFA/Drivers/USB/Core/XMEGA/Template/Template_Endpoint_Control_R.c \
../src/LUFA/Drivers/USB/Core/XMEGA/Template/Template_Endpoint_Control_W.c \
../src/LUFA/Drivers/USB/Core/XMEGA/Template/Template_Endpoint_RW.c 

OBJS += \
./src/LUFA/Drivers/USB/Core/XMEGA/Template/Template_Endpoint_Control_R.o \
./src/LUFA/Drivers/USB/Core/XMEGA/Template/Template_Endpoint_Control_W.o \
./src/LUFA/Drivers/USB/Core/XMEGA/Template/Template_Endpoint_RW.o 

C_DEPS += \
./src/LUFA/Drivers/USB/Core/XMEGA/Template/Template_Endpoint_Control_R.d \
./src/LUFA/Drivers/USB/Core/XMEGA/Template/Template_Endpoint_Control_W.d \
./src/LUFA/Drivers/USB/Core/XMEGA/Template/Template_Endpoint_RW.d 


# Each subdirectory must supply rules for building sources it contributes
src/LUFA/Drivers/USB/Core/XMEGA/Template/%.o: ../src/LUFA/Drivers/USB/Core/XMEGA/Template/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/home/justin/Dropbox/laptop-workspace/Mojo-v2-Loader/src/Config" -DF_USB=8000000 -DUSE_LUFA_CONFIG_HEADER -Wall -Os -fpack-struct -fshort-enums -std=gnu99 -funsigned-char -funsigned-bitfields -mmcu=atmega16u4 -DF_CPU=8000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


