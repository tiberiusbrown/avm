        .text
        .globl _start
        .p2align 1
_start:
        .byte 0xf4, 0xf3       ; NOP
        .byte 0xff             ; RET
