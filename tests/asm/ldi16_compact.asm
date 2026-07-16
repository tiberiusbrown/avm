.include "include/primitive_output.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ; c0
    ldi16 c0, 0x0
    mov r0, r4
    debug_print_r0_line_inline

    ldi16 c0, 0x1
    mov r0, r4
    debug_print_r0_line_inline

    ldi16 c0, 0x7fff
    mov r0, r4
    debug_print_r0_line_inline

    ldi16 c0, 0x8000
    mov r0, r4
    debug_print_r0_line_inline

    ldi16 c0, 0xffff
    mov r0, r4
    debug_print_r0_line_inline

    ; c1
    ldi16 c1, 0x0
    mov r0, r5
    debug_print_r0_line_inline

    ldi16 c1, 0x1
    mov r0, r5
    debug_print_r0_line_inline

    ldi16 c1, 0x7fff
    mov r0, r5
    debug_print_r0_line_inline

    ldi16 c1, 0x8000
    mov r0, r5
    debug_print_r0_line_inline

    ldi16 c1, 0xffff
    mov r0, r5
    debug_print_r0_line_inline

    ; c2
    ldi16 c2, 0x0
    mov r0, r6
    debug_print_r0_line_inline

    ldi16 c2, 0x1
    mov r0, r6
    debug_print_r0_line_inline

    ldi16 c2, 0x7fff
    mov r0, r6
    debug_print_r0_line_inline

    ldi16 c2, 0x8000
    mov r0, r6
    debug_print_r0_line_inline

    ldi16 c2, 0xffff
    mov r0, r6
    debug_print_r0_line_inline

    ; c3
    ldi16 c3, 0x0
    mov r0, r7
    debug_print_r0_line_inline

    ldi16 c3, 0x1
    mov r0, r7
    debug_print_r0_line_inline

    ldi16 c3, 0x7fff
    mov r0, r7
    debug_print_r0_line_inline

    ldi16 c3, 0x8000
    mov r0, r7
    debug_print_r0_line_inline

    ldi16 c3, 0xffff
    mov r0, r7
    debug_print_r0_line_inline

    sys debug_break
