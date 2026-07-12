.include "tests/asm/test_helpers.inc"
.section .text,"ax",@progbits
.globl _start
.type _start, @function
.p2align 1

.macro test_unary op, reg, value
    ldi8 \reg, \value
    \op \reg
    print_reg16 \reg
.endm

_start:
    ; Each implemented unary operation is sampled across every compact
    ; register, including zero, positive, and negative low-byte inputs.
    test_unary not16,  c0, 0x00
    test_unary not16,  c1, 0x0f
    test_unary not16,  c2, 0x80
    test_unary not16,  c3, 0x55
    test_unary neg16,  c0, 0x00
    test_unary neg16,  c1, 0x01
    test_unary neg16,  c2, 0x80
    test_unary neg16,  c3, 0x55
    test_unary zext8, c0, 0x00
    test_unary zext8, c1, 0x0f
    test_unary zext8, c2, 0x80
    test_unary zext8, c3, 0x55
    test_unary sext8, c0, 0x00
    test_unary sext8, c1, 0x0f
    test_unary sext8, c2, 0x80
    test_unary sext8, c3, 0x55
    test_unary swap8, c0, 0x00
    test_unary swap8, c1, 0x0f
    test_unary swap8, c2, 0x80
    test_unary swap8, c3, 0x55
    sys 1

.size _start, .-_start
