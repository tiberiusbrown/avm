.include "include/primitive_output.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ; c0
    ldi8 c0, 0x0
    mov r0, r4
    debug_print_r0_line_inline

    ldi8 c0, 0x1
    mov r0, r4
    debug_print_r0_line_inline

    ldi8 c0, 0x7f
    mov r0, r4
    debug_print_r0_line_inline

    ldi8 c0, 0x80
    mov r0, r4
    debug_print_r0_line_inline

    ldi8 c0, 0xff
    mov r0, r4
    debug_print_r0_line_inline

    ; c1
    ldi8 c1, 0x0
    mov r0, r5
    debug_print_r0_line_inline

    ldi8 c1, 0x1
    mov r0, r5
    debug_print_r0_line_inline

    ldi8 c1, 0x7f
    mov r0, r5
    debug_print_r0_line_inline

    ldi8 c1, 0x80
    mov r0, r5
    debug_print_r0_line_inline

    ldi8 c1, 0xff
    mov r0, r5
    debug_print_r0_line_inline

    ; c2
    ldi8 c2, 0x0
    mov r0, r6
    debug_print_r0_line_inline

    ldi8 c2, 0x1
    mov r0, r6
    debug_print_r0_line_inline

    ldi8 c2, 0x7f
    mov r0, r6
    debug_print_r0_line_inline

    ldi8 c2, 0x80
    mov r0, r6
    debug_print_r0_line_inline

    ldi8 c2, 0xff
    mov r0, r6
    debug_print_r0_line_inline

    ; c3
    ldi8 c3, 0x0
    mov r0, r7
    debug_print_r0_line_inline

    ldi8 c3, 0x1
    mov r0, r7
    debug_print_r0_line_inline

    ldi8 c3, 0x7f
    mov r0, r7
    debug_print_r0_line_inline

    ldi8 c3, 0x80
    mov r0, r7
    debug_print_r0_line_inline

    ldi8 c3, 0xff
    mov r0, r7
    debug_print_r0_line_inline

    sys debug_break
