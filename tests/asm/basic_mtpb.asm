.include "tests/asm/test_helpers.inc"
.section .text,"ax",@progbits
.globl _start
.type _start, @function
.p2align 1

.macro print_any16 reg
    mov16 r4, \reg
    print_reg16 c0
.endm

.macro test_mtpb src, value, result
    ldi16 \src, \value
    mtpb \src
    mfpb \result
    print_any16 \result
.endm

_start:
    test_mtpb r0, 0xa511, r3
    test_mtpb r1, 0xb622, r3
    test_mtpb r2, 0xc733, r3
    test_mtpb r3, 0xd844, r2
    test_mtpb r4, 0xe955, r3
    test_mtpb r5, 0xfa66, r3
    test_mtpb r6, 0x8b77, r3
    test_mtpb r7, 0x9c88, r3

    ; MTPB preserves C=1, Z=0, S=0.
    ldi16 r0, 0x005a
    ldi8 c0, 1
    ldi8 c1, 0xff
    sext8 c1
    cmp16 c0, c1
    mtpb r0
    cset r1, ult
    cset r2, ne
    cset r3, sge
    mfpb r0
    print_any16 r0
    print_any16 r1
    print_any16 r2
    print_any16 r3

    sys 1
.size _start, .-_start
