.include "include/primitive_output.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ; r4
    ldi8 r4, 0x0
    mov r0, r4
    debug_print_r0_line_inline

    ldi8 r4, 0x1
    mov r0, r4
    debug_print_r0_line_inline

    ldi8 r4, 0x7f
    mov r0, r4
    debug_print_r0_line_inline

    ldi8 r4, 0x80
    mov r0, r4
    debug_print_r0_line_inline

    ldi8 r4, 0xff
    mov r0, r4
    debug_print_r0_line_inline

    ; r5
    ldi8 r5, 0x0
    mov r0, r5
    debug_print_r0_line_inline

    ldi8 r5, 0x1
    mov r0, r5
    debug_print_r0_line_inline

    ldi8 r5, 0x7f
    mov r0, r5
    debug_print_r0_line_inline

    ldi8 r5, 0x80
    mov r0, r5
    debug_print_r0_line_inline

    ldi8 r5, 0xff
    mov r0, r5
    debug_print_r0_line_inline

    ; r6
    ldi8 r6, 0x0
    mov r0, r6
    debug_print_r0_line_inline

    ldi8 r6, 0x1
    mov r0, r6
    debug_print_r0_line_inline

    ldi8 r6, 0x7f
    mov r0, r6
    debug_print_r0_line_inline

    ldi8 r6, 0x80
    mov r0, r6
    debug_print_r0_line_inline

    ldi8 r6, 0xff
    mov r0, r6
    debug_print_r0_line_inline

    ; r7
    ldi8 r7, 0x0
    mov r0, r7
    debug_print_r0_line_inline

    ldi8 r7, 0x1
    mov r0, r7
    debug_print_r0_line_inline

    ldi8 r7, 0x7f
    mov r0, r7
    debug_print_r0_line_inline

    ldi8 r7, 0x80
    mov r0, r7
    debug_print_r0_line_inline

    ldi8 r7, 0xff
    mov r0, r7
    debug_print_r0_line_inline

    sys debug_break
