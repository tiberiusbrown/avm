.include "include/debug_output.inc"
.include "include/upper_matrix_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ; Destination c0, every source.
    reset_upper_regs
    or c0, c0
    call debug_print_upper_regs

    reset_upper_regs
    or c0, c1
    call debug_print_upper_regs

    reset_upper_regs
    or c0, c2
    call debug_print_upper_regs

    reset_upper_regs
    or c0, c3
    call debug_print_upper_regs

    ; Destination c1, every source.
    reset_upper_regs
    or c1, c0
    call debug_print_upper_regs

    reset_upper_regs
    or c1, c1
    call debug_print_upper_regs

    reset_upper_regs
    or c1, c2
    call debug_print_upper_regs

    reset_upper_regs
    or c1, c3
    call debug_print_upper_regs

    ; Destination c2, every source.
    reset_upper_regs
    or c2, c0
    call debug_print_upper_regs

    reset_upper_regs
    or c2, c1
    call debug_print_upper_regs

    reset_upper_regs
    or c2, c2
    call debug_print_upper_regs

    reset_upper_regs
    or c2, c3
    call debug_print_upper_regs

    ; Destination c3, every source.
    reset_upper_regs
    or c3, c0
    call debug_print_upper_regs

    reset_upper_regs
    or c3, c1
    call debug_print_upper_regs

    reset_upper_regs
    or c3, c2
    call debug_print_upper_regs

    reset_upper_regs
    or c3, c3
    call debug_print_upper_regs

    sys debug_break
