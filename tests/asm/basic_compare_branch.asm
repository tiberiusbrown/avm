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

_start:
    ; Both branch senses and both zero-test widths are represented. One means
    ; taken and two means fall-through.
    test_branch tst16, breq, 0
    test_branch tst16, breq, 1
    test_branch tst16, brne, 0
    test_branch tst8,  breq, 1
    test_branch tst8,  brne, 0
    sys 1

.size _start, .-_start
