#
#   BSP Makefile for Example project.
#

BINARY_NAME=example
BASE=$(shell pwd)/../bitthunder/
BUILD_BASE=$(BASE)
MODULE_NAME="example"

TARGETS=$(BINARY_NAME).img
TARGET_DEPS=$(BINARY_NAME).elf

BUILD_DIR=$(shell pwd)/build/

include $(BASE).dbuild/dbuild.mk

tool:
	@echo $(BASE)
	@echo $(BT_CONFIG_SUBARCH)
	@echo $(BT_CONFIG_TOOLCHAIN)
	@echo $(TOOLCHAIN)

all: $(BINARY_NAME).elf $(BINARY_NAME).list $(BINARY_NAME).img $(BINARY_NAME).syms
	$(Q)$(SIZE) $(BINARY_NAME).elf

$(BINARY_NAME).img: $(BINARY_NAME).elf
	$(Q)$(PRETTY) IMAGE $(MODULE_NAME) $@
	$(Q)$(OBJCOPY) $(BINARY_NAME).elf -O binary $@

$(BINARY_NAME).list: $(BINARY_NAME).elf
	$(Q)$(PRETTY) LIST $(MODULE_NAME) $@
	$(Q)$(OBJDUMP) -D $(BINARY_NAME).elf > $@

$(BINARY_NAME).syms: $(BINARY_NAME).elf
	$(Q)$(PRETTY) SYMS $(MODULE_NAME) $@
	$(Q)$(OBJDUMP) -t $(BINARY_NAME).elf > $@

$(BINARY_NAME).elf: $(OBJECTS)
	$(Q)$(PRETTY) --dbuild "LD" $(MODULE_NAME) $@
	$(Q)$(CC) -o $@ -T $(LINKER_SCRIPT) -Wl,-Map=$(BINARY_NAME).map -Wl,--gc-sections $(OBJECTS) -nostdlib -lc -lgcc
