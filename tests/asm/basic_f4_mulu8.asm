.include "tests/asm/test_helpers.inc"
.section .text,"ax",@progbits
.globl _start
.type _start, @function
.p2align 1

.macro print_any16 reg
    mov16 r4, \reg
    print_reg16 c0
.endm

.macro test_mulu8_f4 dst, src, dv, sv
    ; Each case is initialized independently because print_reg16 uses all
    ; compact registers as scratch. Diagonal cases initialize the shared
    ; operand once and exercise the exact cD == cS encoding.
    .ifc \dst,\src
        ldi16 \dst, \dv
    .else
        ldi16 \dst, \dv
        ldi16 \src, \sv
    .endif
    mulu8 \dst, \src
    print_reg16 \dst
.endm

_start:
    test_mulu8_f4 c0, c0, 0xa503, 0xa503
    test_mulu8_f4 c0, c1, 0xa503, 0x5a07
    test_mulu8_f4 c0, c2, 0xa503, 0x5a80
    test_mulu8_f4 c0, c3, 0xa503, 0x5aff
    test_mulu8_f4 c1, c0, 0xa511, 0x5a02
    test_mulu8_f4 c1, c1, 0xa511, 0xa511
    test_mulu8_f4 c1, c2, 0xa511, 0x5a80
    test_mulu8_f4 c1, c3, 0xa511, 0x5aff
    test_mulu8_f4 c2, c0, 0xa581, 0x5a02
    test_mulu8_f4 c2, c1, 0xa581, 0x5a07
    test_mulu8_f4 c2, c2, 0xa581, 0xa581
    test_mulu8_f4 c2, c3, 0xa581, 0x5aff
    test_mulu8_f4 c3, c0, 0xa5fe, 0x5a02
    test_mulu8_f4 c3, c1, 0xa5fe, 0x5a07
    test_mulu8_f4 c3, c2, 0xa5fe, 0x5a80
    test_mulu8_f4 c3, c3, 0xa5fe, 0xa5fe

    ; Verify that MULU8 preserves C=1, Z=0, S=0.
    ldi16 c2, 0xa5f3
    ldi16 c3, 0x5aa7
    ldi8 c0, 1
    ldi8 c1, 0xff
    sext8 c1
    cmp16 c0, c1
    mulu8 c2, c3
    mov16 r3, r6
    cset r0, ult
    cset r1, ne
    cset r2, sge
    print_any16 r3
    print_any16 r0
    print_any16 r1
    print_any16 r2

    sys 1
.size _start, .-_start
