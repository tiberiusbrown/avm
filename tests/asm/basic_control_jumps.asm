.section .text,"ax",@progbits
.globl _start
.type _start, @function
.p2align 1

.macro putc char
    ldi8 c0, '\char'
    sys 0
.endm

_start:
    jmp 1f
    putc X
1:
    putc J
    ; The restricted image writer does not link BANK16/FAR24 relocations, so
    ; direct targets use their final logical image addresses (text starts at
    ; 0x100 in these fixtures).
    jmp16 0x0112
    putc X

.p2align 1
absolute_target:
    putc A
    jmpf 0x00011e
    putc X

.p2align 1
far_target:
    putc F
    ldi8 c0, 10
    sys 0
    sys 1

.size _start, .-_start
