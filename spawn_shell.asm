section .data
  msg: db '/bin/sh'
section .bss
section .text
  global _start
_start:
  xor eax, eax
  xor ebx, ebx
  xor ecx, ecx
  xor edx, edx
  mov al, 0xb
  mov ebx, msg
  int 0x80
  mov al, 1
  xor ebx, ebx
  int 0x80
