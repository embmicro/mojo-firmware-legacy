################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../LUFA/CodeTemplates/DeviceTemplate/Descriptors.c \
../LUFA/CodeTemplates/DeviceTemplate/DeviceApplication.c 

OBJS += \
./LUFA/CodeTemplates/DeviceTemplate/Descriptors.o \
./LUFA/CodeTemplates/DeviceTemplate/DeviceApplication.o 

C_DEPS += \
./LUFA/CodeTemplates/DeviceTemplate/Descriptors.d \
./LUFA/CodeTemplates/DeviceTemplate/DeviceApplication.d 


# Each subdirectory must supply rules for building sources it contributes
LUFA/CodeTemplates/DeviceTemplate/%.o: ../LUFA/CodeTemplates/DeviceTemplate/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -I"/home/justin/workspace/Mojo-v2-Loader/LUFA" -DF_USB=8000000 -Wall -Os -fpack-struct -fshort-enums -std=gnu99 -funsigned-char -funsigned-bitfields -mmcu=atmega16u4 -DF_CPU=8000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


