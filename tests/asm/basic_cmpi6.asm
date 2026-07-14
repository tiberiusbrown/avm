.include "tests/asm/test_helpers.inc"
.section .text,"ax",@progbits
.globl _start
.type _start, @function
.p2align 1

.macro print_any16 reg
    mov16 r4, \reg
    print_reg16 c0
.endm

.macro test_cmpi6 reg, value, immediate
    ldi16 \reg, \value
    cmpi6 \reg, \immediate
    mov16 r3, \reg
    cset r0, eq
    cset r1, ult
    cset r2, slt
    print_any16 r3
    print_any16 r0
    print_any16 r1
    print_any16 r2
.endm

_start:
    test_cmpi6 c0, 0xffef, -17
    test_cmpi6 c1, 0x0000, -1
    test_cmpi6 c2, 0xffff, 0
    test_cmpi6 c3, 0x001f, 31
    test_cmpi6 c0, 0xffe0, 31
    test_cmpi6 c1, 0x001f, -32
    sys 1
.size _start, .-_start
