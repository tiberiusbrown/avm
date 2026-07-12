.include "tests/asm/test_helpers.inc"
.section .text,"ax",@progbits
.globl _start
.type _start, @function
.p2align 1

.macro stack_slot
    getsp c0
    dec16 c0
    dec16 c0
.endm

.macro test_ld8 dst, value
    stack_slot
    ldi8 c3, \value
    st8 [c0], c3
    ld8 \dst, [c0]
    print_reg16 \dst
.endm

.macro test_ld16 dst, value
    stack_slot
    ldi8 c3, \value
    st16 [c0], c3
    ld16 \dst, [c0]
    print_reg16 \dst
.endm

.macro test_st8 src, value
    stack_slot
    ldi8 \src, \value
    st8 [c0], \src
    ld8 c2, [c0]
    print_reg16 c2
.endm

_start:
    ; Each load destination and each non-address store source is observed.
    test_ld8  c0, 0x10
    test_ld8  c1, 0x11
    test_ld8  c2, 0x12
    test_ld8  c3, 0x13
    test_ld16 c0, 0x20
    test_ld16 c1, 0x21
    test_ld16 c2, 0x22
    test_ld16 c3, 0x23
    test_st8 c1, 0x51
    test_st8 c2, 0x52
    test_st8 c3, 0x53
    sys 1

.size _start, .-_start
