.include "include/primitive_output.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ldi16 r4, 0x0980
    setsp r4
    adjsp -128
    getsp r0
    debug_print_r0_line_inline

    ldi16 r4, 0x0980
    setsp r4
    adjsp -127
    getsp r0
    debug_print_r0_line_inline

    ldi16 r4, 0x0980
    setsp r4
    adjsp -1
    getsp r0
    debug_print_r0_line_inline

    ldi16 r4, 0x0980
    setsp r4
    adjsp 0
    getsp r0
    debug_print_r0_line_inline

    ldi16 r4, 0x0980
    setsp r4
    adjsp 1
    getsp r0
    debug_print_r0_line_inline

    ldi16 r4, 0x0980
    setsp r4
    adjsp 127
    getsp r0
    debug_print_r0_line_inline

    ldi16 r4, 0x0910
    setsp r4
    adjsp -16
    getsp r0
    debug_print_r0_line_inline

    ldi16 r4, 0x09f0
    setsp r4
    adjsp 16
    getsp r0
    debug_print_r0_line_inline

    sys debug_break
