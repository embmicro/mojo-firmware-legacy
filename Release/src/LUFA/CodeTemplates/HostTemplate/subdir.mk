################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/LUFA/CodeTemplates/HostTemplate/HostApplication.c 

OBJS += \
./src/LUFA/CodeTemplates/HostTemplate/HostApplication.o 

C_DEPS += \
./src/LUFA/CodeTemplates/HostTemplate/HostApplication.d 


# Each subdirectory must supply rules for building sources it contributes
src/LUFA/CodeTemplates/HostTemplate/%.o: ../src/LUFA/CodeTemplates/HostTemplate/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: AVR Compiler'
	avr-gcc -DF_USB=8000000 -Wall -Os -fpack-struct -fshort-enums -std=gnu99 -funsigned-char -funsigned-bitfields -mmcu=atmega16u4 -DF_CPU=8000000UL -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


