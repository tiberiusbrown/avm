.include "include/debug_output.inc"
.include "include/upper_matrix_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ; Destination c0, every source.
    reset_upper_regs
    sub c0, c0
    call debug_print_upper_regs

    reset_upper_regs
    sub c0, r5
    call debug_print_upper_regs

    reset_upper_regs
    sub c0, r6
    call debug_print_upper_regs

    reset_upper_regs
    sub c0, r7
    call debug_print_upper_regs

    ; Destination r5, every source.
    reset_upper_regs
    sub r5, c0
    call debug_print_upper_regs

    reset_upper_regs
    sub r5, r5
    call debug_print_upper_regs

    reset_upper_regs
    sub r5, r6
    call debug_print_upper_regs

    reset_upper_regs
    sub r5, r7
    call debug_print_upper_regs

    ; Destination r6, every source.
    reset_upper_regs
    sub r6, c0
    call debug_print_upper_regs

    reset_upper_regs
    sub r6, r5
    call debug_print_upper_regs

    reset_upper_regs
    sub r6, r6
    call debug_print_upper_regs

    reset_upper_regs
    sub r6, r7
    call debug_print_upper_regs

    ; Destination r7, every source.
    reset_upper_regs
    sub r7, c0
    call debug_print_upper_regs

    reset_upper_regs
    sub r7, r5
    call debug_print_upper_regs

    reset_upper_regs
    sub r7, r6
    call debug_print_upper_regs

    reset_upper_regs
    sub r7, r7
    call debug_print_upper_regs

    sys debug_break
