#!/bin/sh

as arm_rev_sh.s -o arm_rev_sh.o
ld -N arm_rev_sh.o -o arm_rev_sh
objcopy -O binary arm_rev_sh arm_rev_sh.bin
hexdump -v -e '"\\""x" 1/1 "%02x" ""' arm_rev_sh.bin > shellcode
