ARCH:=$(shell uname -m)
AS=as
LD=ld
OBJ=objcopy
HEX=hexdump
GCC=gcc
TCC=tcc

all: build_shellcode

build_shellcode: 
ifeq ($(ARCH),armv8l)
	@echo "building arm_rev_sh.s and arm_bind_sh.s for ARM"
	$(AS) arm_rev_sh.s -o arm_rev_sh.o
	$(LD) -N arm_rev_sh.o -o arm_rev_sh
	$(OBJ) -O binary arm_rev_sh arm_rev_sh.bin
	$(HEX) -v -e '"\\""x" 1/1 "%02x" ""' arm_rev_sh.bin > shellcode0
	$(AS) arm_bind_sh.s -o arm_bind_sh.o
	$(LD) -N arm_bind_sh.o -o arm_bind_sh
	$(OBJ) -O binary arm_bind_sh arm_bind_sh.bin
	$(HEX) -v -e '"\\""x" 1/1 "%02x" ""' arm_bind_sh.bin > shellcode1
else ifeq ($(ARCH),x86_64)
	@echo "building spawn_shell.asm for x86_64 ..."
	nasm -f elf32 spawn_shell.asm -o spawn_shell.o
	$(LD) -m elf_i386 spawn_shell.o -o spawn_shell
else
	@echo "unsupported architecture: $(ARCH)"
	exit 1
endif

.PHONY: all build_shellcode

all: run inject revsh

run: run.c
	$(GCC) -z execstack run.c -o run

inject: inject.c
	$(GCC) inject.c -o inject

revsh: revsh.c
	$(TCC) revsh.c -o revsh

clean:
	rm revsh inject spawn_shell spawn_shell.o run arm_rev_sh.o arm_rev_sh arm_rev_sh.bin shellcode0 arm_bind_sh.o arm_bind_sh arm_bind_sh.bin shellcode1
