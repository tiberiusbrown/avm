.include "tests/asm/test_helpers.inc"
.section .text,"ax",@progbits
.globl _start
.type _start, @function
.p2align 1

.macro test_ldi reg, value
    ldi8 \reg, \value
    print_reg16 \reg
.endm

_start:
    test_inc16 c0, 0x00
    test_inc16 c1, 0x0f
    test_inc16 c2, 0x7f
    test_inc16 c3, 0xff
    test_dec16 c0, 0x00
    test_dec16 c1, 0x01
    test_dec16 c2, 0x80
    test_dec16 c3, 0xff
    test_ldi c0, 0x00
    test_ldi c1, 0x0f
    test_ldi c2, 0x80
    test_ldi c3, 0xff
    sys 1

.size _start, .-_start
