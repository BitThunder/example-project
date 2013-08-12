This is an example BitThunder project.

To build follow the steps below:

# 1. Create a valid configuration

    make menuconfig

## Compiler

Be sure to set the compiler location under Build System -> Toolchain Prefix
e.g. if your compiler is located at:

/opt/codesourcery/bin

Then your prefix is /opt/codesourcery/bin/arm-none-eabi- or something similar.

## Select Architecture and CPU
Just the relevent architecture under the System Architecture menu. E.g. for STM32 choose ARM
and STM32 :)

## Linking / Memory Definitions

BitThunder generates a linker description file automatically, but it needs to know
what memories are available on your device.

Under the System Architecture menu, configure the Linking (new versions call this Memory)
parameters.

Currently BT supports 3 different kinds of memories. Simply enable at least one of them,
and define the start address and length in HEX. (One must be Read/Writable, e.g. at least an SRAM).

You can also request different sections to placed in different memories.
For micro-controllers you will usually have a FLASH and SRAM. Enable both, and ensure that
INIT and TEXT reside in FLASH, where Data and BSS reside in SRAM.

Leave the initial stack sizes as default.

## Exit and Save the configuration

# 2. Compile your kernel.

    make

This should compile a valid bitthunder kernel for your platform.
Files are output in the bsp folder, e.g. example.elf and example.list ...
