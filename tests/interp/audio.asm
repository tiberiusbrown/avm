.section .text,"ax",@progbits
.globl _start
_start:
    sys 0x2a
    jmp8 _start
