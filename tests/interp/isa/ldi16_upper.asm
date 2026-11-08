.include "include/primitive_output.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ; r4
    ldi16 r4, 0x0
    mov r0, r4
    debug_print_r0_line_inline

    ldi16 r4, 0x1
    mov r0, r4
    debug_print_r0_line_inline

    ldi16 r4, 0x7fff
    mov r0, r4
    debug_print_r0_line_inline

    ldi16 r4, 0x8000
    mov r0, r4
    debug_print_r0_line_inline

    ldi16 r4, 0xffff
    mov r0, r4
    debug_print_r0_line_inline

    ; r5
    ldi16 r5, 0x0
    mov r0, r5
    debug_print_r0_line_inline

    ldi16 r5, 0x1
    mov r0, r5
    debug_print_r0_line_inline

    ldi16 r5, 0x7fff
    mov r0, r5
    debug_print_r0_line_inline

    ldi16 r5, 0x8000
    mov r0, r5
    debug_print_r0_line_inline

    ldi16 r5, 0xffff
    mov r0, r5
    debug_print_r0_line_inline

    ; r6
    ldi16 r6, 0x0
    mov r0, r6
    debug_print_r0_line_inline

    ldi16 r6, 0x1
    mov r0, r6
    debug_print_r0_line_inline

    ldi16 r6, 0x7fff
    mov r0, r6
    debug_print_r0_line_inline

    ldi16 r6, 0x8000
    mov r0, r6
    debug_print_r0_line_inline

    ldi16 r6, 0xffff
    mov r0, r6
    debug_print_r0_line_inline

    ; r7
    ldi16 r7, 0x0
    mov r0, r7
    debug_print_r0_line_inline

    ldi16 r7, 0x1
    mov r0, r7
    debug_print_r0_line_inline

    ldi16 r7, 0x7fff
    mov r0, r7
    debug_print_r0_line_inline

    ldi16 r7, 0x8000
    mov r0, r7
    debug_print_r0_line_inline

    ldi16 r7, 0xffff
    mov r0, r7
    debug_print_r0_line_inline

    sys debug_break
