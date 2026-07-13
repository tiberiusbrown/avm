.include "tests/asm/test_helpers.inc"
.section .text,"ax",@progbits
.globl _start
.type _start, @function
.p2align 1

.macro test_branch flagop, branchop, value
    ldi8 c1, \value
    ldi8 c0, 1               ; remains one when the branch is taken
    \flagop c1
    \branchop 1f
    ldi8 c0, 2               ; records a fall-through instead
1:
    print_reg16 c0
.endm

.macro test_compare_branch cmpop, branchop, lhs, rhs
    ldi8 c1, \lhs
    ldi8 c2, \rhs
    ldi8 c0, 1               ; remains one when the branch is taken
    \cmpop c1, c2
    \branchop 1f
    ldi8 c0, 2               ; records a fall-through instead
1:
    print_reg16 c0
.endm

_start:
    ; Both branch senses and both zero-test widths are represented. One means
    ; taken and two means fall-through.
    test_branch tst16, breq, 0
    test_branch tst16, breq, 1
    test_branch tst16, brne, 0
    test_branch tst8,  breq, 1
    test_branch tst8,  brne, 0

    ; Exercise both paths of the C- and S-bit branches (F7-FA). CMP8 makes
    ; 0x80 negative for the signed comparisons while LDI8 zero-extends it.
    test_compare_branch cmp16, brult, 0,    1
    test_compare_branch cmp16, brult, 1,    0
    test_compare_branch cmp16, bruge, 0,    1
    test_compare_branch cmp16, bruge, 1,    0
    test_compare_branch cmp8,  brslt, 0x80, 0
    test_compare_branch cmp8,  brslt, 1,    0
    test_compare_branch cmp8,  brsge, 0x80, 0
    test_compare_branch cmp8,  brsge, 1,    0

    ; The combined-condition branches (FB-FC) need separate equality and
    ; inequality coverage so both C and Z affect the result.
    test_compare_branch cmp16, brule, 0, 1
    test_compare_branch cmp16, brule, 1, 1
    test_compare_branch cmp16, brule, 1, 0
    test_compare_branch cmp16, brugt, 1, 0
    test_compare_branch cmp16, brugt, 1, 1
    test_compare_branch cmp16, brugt, 0, 1
    sys 1

.size _start, .-_start
