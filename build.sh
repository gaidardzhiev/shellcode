#!/bin/sh

if [ $(uname -m) = armv8l ];
then 
	as arm_rev_sh.s -o arm_rev_sh.o
	ld -N arm_rev_sh.o -o arm_rev_sh
	objcopy -O binary arm_rev_sh arm_rev_sh.bin
	hexdump -v -e '"\\""x" 1/1 "%02x" ""' arm_rev_sh.bin > shellcode0
	as arm_bind_sh.s -o arm_bind_sh.o
	ld -N arm_bind_sh.o -o arm_bind_sh
	objcopy -O binary arm_bind_sh arm_bind_sh.bin
	hexdump -v -e '"\\""x" 1/1 "%02x" ""' arm_bind_sh.bin > shellcode1
elif [ $(uname -m) = x86_64 ];
then
nasm -f elf32 spawn_shell.asm -o spawn_shell.o
ld -m elf_i386 spawn_shell.o -o spawn_shell
else
	echo "1"
fi
