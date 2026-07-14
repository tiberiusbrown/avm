.include "tests/asm/test_helpers.inc"
.section .text,"ax",@progbits
.globl _start
.type _start, @function
.p2align 1

.macro print_any16 reg
    mov16 r4, \reg
    print_reg16 c0
.endm

.macro test_mulu8_e2 src, av, sv
    ; Nonzero high bytes verify that only low8(A) and low8(rS) participate.
    ldi16 c0, \av
    ldi16 \src, \sv
    mulu8 a, \src
    print_reg16 c0
.endm

_start:
    test_mulu8_e2 r0, 0xa57f, 0x5a02
    test_mulu8_e2 r1, 0xa581, 0x5a11
    test_mulu8_e2 r2, 0xa5ff, 0x5a80
    test_mulu8_e2 r3, 0xa5fe, 0x5aff

    ; Verify that MULU8 preserves C=1, Z=0, S=0.
    ldi16 c0, 0xa5f3
    ldi16 r3, 0x5aa7
    ldi8 c1, 1
    ldi8 c2, 0xff
    sext8 c2
    cmp16 c1, c2
    mulu8 a, r3
    mov16 r3, r4
    cset r0, ult
    cset r1, ne
    cset r2, sge
    print_any16 r3
    print_any16 r0
    print_any16 r1
    print_any16 r2

    sys 1
.size _start, .-_start
