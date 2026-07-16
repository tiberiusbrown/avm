.include "include/primitive_output.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ; c0
    ldi16 c0, 0x0040
    addi.s8 c0, -128
    mov r0, r4
    debug_print_r0_line_inline

    ldi16 c0, 0x7f80
    addi.s8 c0, -127
    mov r0, r4
    debug_print_r0_line_inline

    ldi16 c0, 0x0000
    addi.s8 c0, -1
    mov r0, r4
    debug_print_r0_line_inline

    ldi16 c0, 0x8000
    addi.s8 c0, 0
    mov r0, r4
    debug_print_r0_line_inline

    ldi16 c0, 0xffff
    addi.s8 c0, 1
    mov r0, r4
    debug_print_r0_line_inline

    ldi16 c0, 0xffc0
    addi.s8 c0, 127
    mov r0, r4
    debug_print_r0_line_inline

    ; c1
    ldi16 c1, 0x0040
    addi.s8 c1, -128
    mov r0, r5
    debug_print_r0_line_inline

    ldi16 c1, 0x7f80
    addi.s8 c1, -127
    mov r0, r5
    debug_print_r0_line_inline

    ldi16 c1, 0x0000
    addi.s8 c1, -1
    mov r0, r5
    debug_print_r0_line_inline

    ldi16 c1, 0x8000
    addi.s8 c1, 0
    mov r0, r5
    debug_print_r0_line_inline

    ldi16 c1, 0xffff
    addi.s8 c1, 1
    mov r0, r5
    debug_print_r0_line_inline

    ldi16 c1, 0xffc0
    addi.s8 c1, 127
    mov r0, r5
    debug_print_r0_line_inline

    ; c2
    ldi16 c2, 0x0040
    addi.s8 c2, -128
    mov r0, r6
    debug_print_r0_line_inline

    ldi16 c2, 0x7f80
    addi.s8 c2, -127
    mov r0, r6
    debug_print_r0_line_inline

    ldi16 c2, 0x0000
    addi.s8 c2, -1
    mov r0, r6
    debug_print_r0_line_inline

    ldi16 c2, 0x8000
    addi.s8 c2, 0
    mov r0, r6
    debug_print_r0_line_inline

    ldi16 c2, 0xffff
    addi.s8 c2, 1
    mov r0, r6
    debug_print_r0_line_inline

    ldi16 c2, 0xffc0
    addi.s8 c2, 127
    mov r0, r6
    debug_print_r0_line_inline

    ; c3
    ldi16 c3, 0x0040
    addi.s8 c3, -128
    mov r0, r7
    debug_print_r0_line_inline

    ldi16 c3, 0x7f80
    addi.s8 c3, -127
    mov r0, r7
    debug_print_r0_line_inline

    ldi16 c3, 0x0000
    addi.s8 c3, -1
    mov r0, r7
    debug_print_r0_line_inline

    ldi16 c3, 0x8000
    addi.s8 c3, 0
    mov r0, r7
    debug_print_r0_line_inline

    ldi16 c3, 0xffff
    addi.s8 c3, 1
    mov r0, r7
    debug_print_r0_line_inline

    ldi16 c3, 0xffc0
    addi.s8 c3, 127
    mov r0, r7
    debug_print_r0_line_inline

    sys debug_break
