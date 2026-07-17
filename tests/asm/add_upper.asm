.include "include/debug_output.inc"
.include "include/upper_matrix_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ; Destination r4, every source.
    reset_upper_regs
    add r4, r4
    call debug_print_upper_regs

    reset_upper_regs
    add r4, r5
    call debug_print_upper_regs

    reset_upper_regs
    add r4, r6
    call debug_print_upper_regs

    reset_upper_regs
    add r4, r7
    call debug_print_upper_regs

    ; Destination r5, every source.
    reset_upper_regs
    add r5, r4
    call debug_print_upper_regs

    reset_upper_regs
    add r5, r5
    call debug_print_upper_regs

    reset_upper_regs
    add r5, r6
    call debug_print_upper_regs

    reset_upper_regs
    add r5, r7
    call debug_print_upper_regs

    ; Destination r6, every source.
    reset_upper_regs
    add r6, r4
    call debug_print_upper_regs

    reset_upper_regs
    add r6, r5
    call debug_print_upper_regs

    reset_upper_regs
    add r6, r6
    call debug_print_upper_regs

    reset_upper_regs
    add r6, r7
    call debug_print_upper_regs

    ; Destination r7, every source.
    reset_upper_regs
    add r7, r4
    call debug_print_upper_regs

    reset_upper_regs
    add r7, r5
    call debug_print_upper_regs

    reset_upper_regs
    add r7, r6
    call debug_print_upper_regs

    reset_upper_regs
    add r7, r7
    call debug_print_upper_regs

    sys debug_break
