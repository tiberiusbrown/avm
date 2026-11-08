.include "include/primitive_output.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ; r4
    ldi16 r4, 0x0040
    addi.s8 r4, -128
    mov r0, r4
    debug_print_r0_line_inline

    ldi16 r4, 0x7f80
    addi.s8 r4, -127
    mov r0, r4
    debug_print_r0_line_inline

    ldi16 r4, 0x0000
    addi.s8 r4, -1
    mov r0, r4
    debug_print_r0_line_inline

    ldi16 r4, 0x8000
    addi.s8 r4, 0
    mov r0, r4
    debug_print_r0_line_inline

    ldi16 r4, 0xffff
    addi.s8 r4, 1
    mov r0, r4
    debug_print_r0_line_inline

    ldi16 r4, 0xffc0
    addi.s8 r4, 127
    mov r0, r4
    debug_print_r0_line_inline

    ; r5
    ldi16 r5, 0x0040
    addi.s8 r5, -128
    mov r0, r5
    debug_print_r0_line_inline

    ldi16 r5, 0x7f80
    addi.s8 r5, -127
    mov r0, r5
    debug_print_r0_line_inline

    ldi16 r5, 0x0000
    addi.s8 r5, -1
    mov r0, r5
    debug_print_r0_line_inline

    ldi16 r5, 0x8000
    addi.s8 r5, 0
    mov r0, r5
    debug_print_r0_line_inline

    ldi16 r5, 0xffff
    addi.s8 r5, 1
    mov r0, r5
    debug_print_r0_line_inline

    ldi16 r5, 0xffc0
    addi.s8 r5, 127
    mov r0, r5
    debug_print_r0_line_inline

    ; r6
    ldi16 r6, 0x0040
    addi.s8 r6, -128
    mov r0, r6
    debug_print_r0_line_inline

    ldi16 r6, 0x7f80
    addi.s8 r6, -127
    mov r0, r6
    debug_print_r0_line_inline

    ldi16 r6, 0x0000
    addi.s8 r6, -1
    mov r0, r6
    debug_print_r0_line_inline

    ldi16 r6, 0x8000
    addi.s8 r6, 0
    mov r0, r6
    debug_print_r0_line_inline

    ldi16 r6, 0xffff
    addi.s8 r6, 1
    mov r0, r6
    debug_print_r0_line_inline

    ldi16 r6, 0xffc0
    addi.s8 r6, 127
    mov r0, r6
    debug_print_r0_line_inline

    ; r7
    ldi16 r7, 0x0040
    addi.s8 r7, -128
    mov r0, r7
    debug_print_r0_line_inline

    ldi16 r7, 0x7f80
    addi.s8 r7, -127
    mov r0, r7
    debug_print_r0_line_inline

    ldi16 r7, 0x0000
    addi.s8 r7, -1
    mov r0, r7
    debug_print_r0_line_inline

    ldi16 r7, 0x8000
    addi.s8 r7, 0
    mov r0, r7
    debug_print_r0_line_inline

    ldi16 r7, 0xffff
    addi.s8 r7, 1
    mov r0, r7
    debug_print_r0_line_inline

    ldi16 r7, 0xffc0
    addi.s8 r7, 127
    mov r0, r7
    debug_print_r0_line_inline

    sys debug_break
