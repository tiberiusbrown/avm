.include "tests/asm/test_helpers.inc"
.section .text,"ax",@progbits
.globl _start
.type _start, @function
.p2align 1

.macro print_any16 reg
    mov16 r4, \reg
    print_reg16 c0
.endm

_start:
    ldi16 r0, 0x1234
    getsp r1
    ldpbi 0x5a

    ; Establish C=1, Z=0, S=0.
    ldi8 c0, 1
    ldi8 c1, 0xff
    sext8 c1
    cmp16 c0, c1

    nop

    ; Capture state using only CC-preserving operations.
    getsp r2
    mfpb r3
    cset c0, ult
    cset c1, ne
    cset c2, sge
    stm16 0x09e0, c0
    stm16 0x09e2, c1
    stm16 0x09e4, c2

    cmpi16 r0, 0x1234
    cset r0, eq

    mov16 c0, r1
    mov16 c1, r2
    cmp16 c0, c1
    cset r1, eq

    cmpi16 r3, 0x005a
    cset r2, eq

    print_any16 r0
    print_any16 r1
    print_any16 r2

    ldm16 r0, 0x09e0
    print_any16 r0
    ldm16 r0, 0x09e2
    print_any16 r0
    ldm16 r0, 0x09e4
    print_any16 r0

    sys 1
.size _start, .-_start
