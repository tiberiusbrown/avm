.include "tests/asm/test_helpers.inc"
.section .text,"ax",@progbits
.globl _start
.type _start, @function
.p2align 1

; Copy any architectural register through r4/c0 before using print_reg16.
; print_reg16 intentionally clobbers all compact registers.
.macro print_any16 reg
    mov16 r4, \reg
    print_reg16 c0
.endm

; Materialize EQ, ULT, and SLT before printing because the print helper
; intentionally executes flag-producing compact arithmetic.
.macro print_compare_cc
    cset r1, eq
    cset r2, ult
    cset r3, slt
    print_any16 r1
    print_any16 r2
    print_any16 r3
.endm

_start:
    ; E0 80-87: LDI16 across all eight register selectors.
    ldi16 r0, 0x0000
    print_any16 r0
    ldi16 r1, 0x0001
    print_any16 r1
    ldi16 r2, 0x00ff
    print_any16 r2
    ldi16 r3, 0x1234
    print_any16 r3
    ldi16 r4, 0x8000
    print_any16 r4
    ldi16 r5, 0xabcd
    print_any16 r5
    ldi16 r6, 0xffff
    print_any16 r6
    ldi16 r7, 0x5aa5
    print_any16 r7

    ; E0 88-8B: generic noncompact LDI8 forms. Seed nonzero high bytes to
    ; verify that every load zero-extends rather than preserving bits 15:8.
    ldi16 r0, 0xffff
    ldi8 r0, 0x00
    print_any16 r0
    ldi16 r1, 0xffff
    ldi8 r1, 0x01
    print_any16 r1
    ldi16 r2, 0xffff
    ldi8 r2, 0x7f
    print_any16 r2
    ldi16 r3, 0xffff
    ldi8 r3, 0x80
    print_any16 r3

    ; E0 90-B7: immediate arithmetic and logical operations. These cases
    ; exercise low-byte carry/borrow, word wraparound, and both immediate bytes.
    ldi16 r0, 0xffff
    addi16 r0, 0x0001
    print_any16 r0

    ldi16 r7, 0x0102
    addi16 r7, 0x1234
    print_any16 r7

    ldi16 r1, 0x0000
    subi16 r1, 0x0001
    print_any16 r1

    ldi16 r6, 0x1234
    subi16 r6, 0x1234
    print_any16 r6

    ldi16 r2, 0xa55a
    andi16 r2, 0x0ff0
    print_any16 r2

    ldi16 r3, 0xa005
    ori16 r3, 0x0ff0
    print_any16 r3

    ldi16 r4, 0x55aa
    xori16 r4, 0xffff
    print_any16 r4

    ; LDI16, generic LDI8, and all immediate ALU operations preserve CC.
    ; Establish C=1, Z=0, S=0, execute every preserving family, then verify
    ; ULT=1, NE=1, and SGE=1.
    ldi8 c0, 1
    ldi8 c1, 0xff
    sext8 c1
    cmp16 c0, c1

    ldi16 r0, 0x1234
    ldi16 r1, 0xffff
    ldi8 r2, 0x80
    addi16 r0, 0x1111
    subi16 r0, 0x0101
    andi16 r0, 0x7fff
    ori16 r0, 0x8000
    xori16 r0, 0xffff

    cset r1, ult
    cset r2, ne
    cset r3, sge
    print_any16 r1
    print_any16 r2
    print_any16 r3

    ; E0 B8-BF: CMPI16. The three cases distinguish equality, unsigned
    ; ordering, and signed ordering.
    ldi16 r0, 0x1234
    cmpi16 r0, 0x1234
    print_compare_cc

    ldi16 r0, 0x0001
    cmpi16 r0, 0xffff
    print_compare_cc

    ldi16 r0, 0x8000
    cmpi16 r0, 0x0000
    print_compare_cc

    ; E0 C0-C7: CMPI8 compares only the low byte. The first case verifies
    ; that the nonzero high byte is ignored.
    ldi16 r0, 0xab80
    cmpi8 r0, 0x80
    print_compare_cc

    ldi16 r0, 0x007f
    cmpi8 r0, 0x80
    print_compare_cc

    ldi16 r0, 0x0080
    cmpi8 r0, 0x7f
    print_compare_cc

    ; E0 E8-EF: noncompact TST16 forms.
    ldi16 r0, 0x0000
    tst16 r0
    print_compare_cc

    ldi16 r0, 0x8000
    tst16 r0
    print_compare_cc

    ldi16 r0, 0x0001
    tst16 r0
    print_compare_cc

    ; E0 F0-F7: noncompact TST8 forms. The first value has a nonzero high
    ; byte but a zero low byte, proving that TST8 ignores bits 15:8.
    ldi16 r0, 0x1200
    tst8 r0
    print_compare_cc

    ldi16 r0, 0x0080
    tst8 r0
    print_compare_cc

    ldi16 r0, 0xff01
    tst8 r0
    print_compare_cc

    sys 1

.size _start, .-_start
