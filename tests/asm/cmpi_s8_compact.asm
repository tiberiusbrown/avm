.include "include/primitive_output.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ; c0
    ldi16 c0, 0x8000
    cmpi.s8 c0, -128
    debug_print_conditions_inline

    ldi16 c0, 0x8000
    cmpi.s8 c0, -127
    debug_print_conditions_inline

    ldi16 c0, 0x0000
    cmpi.s8 c0, -1
    debug_print_conditions_inline

    ldi16 c0, 0x0000
    cmpi.s8 c0, 0
    debug_print_conditions_inline

    ldi16 c0, 0x0000
    cmpi.s8 c0, 1
    debug_print_conditions_inline

    ldi16 c0, 0x8000
    cmpi.s8 c0, 127
    debug_print_conditions_inline

    ; c1
    ldi16 c1, 0x8000
    cmpi.s8 c1, -128
    debug_print_conditions_inline

    ldi16 c1, 0x8000
    cmpi.s8 c1, -127
    debug_print_conditions_inline

    ldi16 c1, 0x0000
    cmpi.s8 c1, -1
    debug_print_conditions_inline

    ldi16 c1, 0x0000
    cmpi.s8 c1, 0
    debug_print_conditions_inline

    ldi16 c1, 0x0000
    cmpi.s8 c1, 1
    debug_print_conditions_inline

    ldi16 c1, 0x8000
    cmpi.s8 c1, 127
    debug_print_conditions_inline

    ; c2
    ldi16 c2, 0x8000
    cmpi.s8 c2, -128
    debug_print_conditions_inline

    ldi16 c2, 0x8000
    cmpi.s8 c2, -127
    debug_print_conditions_inline

    ldi16 c2, 0x0000
    cmpi.s8 c2, -1
    debug_print_conditions_inline

    ldi16 c2, 0x0000
    cmpi.s8 c2, 0
    debug_print_conditions_inline

    ldi16 c2, 0x0000
    cmpi.s8 c2, 1
    debug_print_conditions_inline

    ldi16 c2, 0x8000
    cmpi.s8 c2, 127
    debug_print_conditions_inline

    ; c3
    ldi16 c3, 0x8000
    cmpi.s8 c3, -128
    debug_print_conditions_inline

    ldi16 c3, 0x8000
    cmpi.s8 c3, -127
    debug_print_conditions_inline

    ldi16 c3, 0x0000
    cmpi.s8 c3, -1
    debug_print_conditions_inline

    ldi16 c3, 0x0000
    cmpi.s8 c3, 0
    debug_print_conditions_inline

    ldi16 c3, 0x0000
    cmpi.s8 c3, 1
    debug_print_conditions_inline

    ldi16 c3, 0x8000
    cmpi.s8 c3, 127
    debug_print_conditions_inline

    sys debug_break
