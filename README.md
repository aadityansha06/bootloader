# My Custom OS Bootloader

This is a simple 16-bit bootloader written in x86 Assembly. It prints a welcome message to the screen using BIOS interrupts.

## Prerequisites

You need a Linux terminal with the following tools installed:
* **Binutils** (standard assembler `as` and linker `ld`)
* **QEMU** (to emulate the computer)

To install them on Ubuntu/Debian:
```bash
sudo apt update
sudo apt install binutils qemu-system-x86
```
# How to Build and Run
### Follow these steps to compile the code and start the virtual machine.

1. Assemble the Code
Convert the assembly source code (boot.s) into an object file (boot.o).

```bash

as boot.s -o boot.o
```
2. Link the Binary
Use the linker script (boot.ld) to create the raw 512-byte boot sector image (boot.bin).

```bash

ld -T boot.ld boot.o -o boot.bin
```
3. Verify the Size (Important!)
Check that the output file is exactly 512 bytes. If it is not, the BIOS won't load it correctly.

```bash

ls -l boot.bin

```
## Output should look like:


```bash
-rwxrwxr-x ... 512 ... boot.bin
```
4. Run in Emulator
Boot the operating system using QEMU, treating the binary as a floppy disk image.

```bash

qemu-system-x86_64 -fda boot.bin
```
# Troubleshooting
"boot.bin is 32KB?" Check that your boot.ld file contains the /DISCARD/ section to remove hidden ELF metadata that bloats the file size.

"No bootable device?" Make sure you are using the -fda flag in the QEMU command (floppy disk emulation) to tell the emulator where your boot sector is.
