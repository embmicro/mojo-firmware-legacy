################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/LUFA/Platform/UC3/subdir.mk
-include src/LUFA/Drivers/USB/Core/XMEGA/Template/subdir.mk
-include src/LUFA/Drivers/USB/Core/XMEGA/subdir.mk
-include src/LUFA/Drivers/USB/Core/UC3/Template/subdir.mk
-include src/LUFA/Drivers/USB/Core/UC3/subdir.mk
-include src/LUFA/Drivers/USB/Core/AVR8/Template/subdir.mk
-include src/LUFA/Drivers/USB/Core/AVR8/subdir.mk
-include src/LUFA/Drivers/USB/Core/subdir.mk
-include src/LUFA/Drivers/USB/Class/Host/subdir.mk
-include src/LUFA/Drivers/USB/Class/Device/subdir.mk
-include src/LUFA/Drivers/Peripheral/XMEGA/subdir.mk
-include src/LUFA/Drivers/Peripheral/AVR8/subdir.mk
-include src/LUFA/Drivers/Board/subdir.mk
-include src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(ASM_DEPS)),)
-include $(ASM_DEPS)
endif
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
LSS += \
Mojo-v2-Loader.lss \

FLASH_IMAGE += \
Mojo-v2-Loader.hex \

EEPROM_IMAGE += \
Mojo-v2-Loader.eep \

SIZEDUMMY += \
sizedummy \


# All Target
all: Mojo-v2-Loader.elf secondary-outputs

# Tool invocations
Mojo-v2-Loader.elf: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: AVR C Linker'
	avr-gcc -Wl,-Map,Mojo-v2-Loader.map -mmcu=atmega16u4 -o "Mojo-v2-Loader.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

Mojo-v2-Loader.lss: Mojo-v2-Loader.elf
	@echo 'Invoking: AVR Create Extended Listing'
	-avr-objdump -h -S Mojo-v2-Loader.elf  >"Mojo-v2-Loader.lss"
	@echo 'Finished building: $@'
	@echo ' '

Mojo-v2-Loader.hex: Mojo-v2-Loader.elf
	@echo 'Create Flash image (ihex format)'
	-avr-objcopy -R .eeprom -O ihex Mojo-v2-Loader.elf  "Mojo-v2-Loader.hex"
	@echo 'Finished building: $@'
	@echo ' '

Mojo-v2-Loader.eep: Mojo-v2-Loader.elf
	@echo 'Create eeprom image (ihex format)'
	-avr-objcopy -j .eeprom --no-change-warnings --change-section-lma .eeprom=0 -O ihex Mojo-v2-Loader.elf  "Mojo-v2-Loader.eep"
	@echo 'Finished building: $@'
	@echo ' '

sizedummy: Mojo-v2-Loader.elf
	@echo 'Invoking: Print Size'
	-avr-size --format=avr --mcu=atmega16u4 Mojo-v2-Loader.elf
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(C_DEPS)$(ASM_DEPS)$(EEPROM_IMAGE)$(FLASH_IMAGE)$(ELFS)$(LSS)$(S_DEPS)$(SIZEDUMMY)$(S_UPPER_DEPS) Mojo-v2-Loader.elf
	-@echo ' '

secondary-outputs: $(LSS) $(FLASH_IMAGE) $(EEPROM_IMAGE) $(SIZEDUMMY)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
