.include "tests/asm/test_helpers.inc"
.section .text,"ax",@progbits
.globl _start
.type _start, @function
.p2align 1

_start:
    getsp c0
    adjsp -2
    getsp c1
    sub c0, c1
    adjsp 2
    print_reg16 c0
    sys 1

.size _start, .-_start
