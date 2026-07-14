.include "tests/asm/test_helpers.inc"
.section .text,"ax",@progbits
.globl _start
.type _start, @function
.p2align 1

.macro print_any16 reg
    mov16 r4, \reg
    print_reg16 c0
.endm

; Set SP from SRC, read it back, reload the original SP from scratch memory,
; restore it, and only then invoke the print helper.
.macro test_setsp src, value
    ldi16 \src, \value
    setsp \src
    getsp r5
    ldm16 r3, 0x09f0
    setsp r3
    print_any16 r5
.endm

_start:
    ; print_reg16 clobbers all compact registers, so retain the original SP in
    ; scratch memory rather than in a compact register between cases.
    getsp r3
    stm16 0x09f0, r3

    test_setsp r0, 0x09c0
    test_setsp r1, 0x09c2
    test_setsp r2, 0x09c4
    test_setsp r3, 0x09c6
    test_setsp r4, 0x09c8
    test_setsp r5, 0x09ca
    test_setsp r6, 0x09cc
    test_setsp r7, 0x09ce

    ; SETSP preserves C=1, Z=0, S=0.
    ldi8 c0, 1
    ldi8 c1, 0xff
    sext8 c1
    cmp16 c0, c1
    ldi16 r0, 0x09d0
    setsp r0
    getsp r5
    ldm16 r3, 0x09f0
    setsp r3
    cset r0, ult
    cset r1, ne
    cset r2, sge
    print_any16 r5
    print_any16 r0
    print_any16 r1
    print_any16 r2

    sys 1
.size _start, .-_start
