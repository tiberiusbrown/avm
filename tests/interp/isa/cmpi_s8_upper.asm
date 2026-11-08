.include "include/primitive_output.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ; r4
    ldi16 r4, 0x8000
    cmpi.s8 r4, -128
    debug_print_conditions_inline

    ldi16 r4, 0x8000
    cmpi.s8 r4, -127
    debug_print_conditions_inline

    ldi16 r4, 0x0000
    cmpi.s8 r4, -1
    debug_print_conditions_inline

    ldi16 r4, 0x0000
    cmpi.s8 r4, 0
    debug_print_conditions_inline

    ldi16 r4, 0x0000
    cmpi.s8 r4, 1
    debug_print_conditions_inline

    ldi16 r4, 0x8000
    cmpi.s8 r4, 127
    debug_print_conditions_inline

    ; r5
    ldi16 r5, 0x8000
    cmpi.s8 r5, -128
    debug_print_conditions_inline

    ldi16 r5, 0x8000
    cmpi.s8 r5, -127
    debug_print_conditions_inline

    ldi16 r5, 0x0000
    cmpi.s8 r5, -1
    debug_print_conditions_inline

    ldi16 r5, 0x0000
    cmpi.s8 r5, 0
    debug_print_conditions_inline

    ldi16 r5, 0x0000
    cmpi.s8 r5, 1
    debug_print_conditions_inline

    ldi16 r5, 0x8000
    cmpi.s8 r5, 127
    debug_print_conditions_inline

    ; r6
    ldi16 r6, 0x8000
    cmpi.s8 r6, -128
    debug_print_conditions_inline

    ldi16 r6, 0x8000
    cmpi.s8 r6, -127
    debug_print_conditions_inline

    ldi16 r6, 0x0000
    cmpi.s8 r6, -1
    debug_print_conditions_inline

    ldi16 r6, 0x0000
    cmpi.s8 r6, 0
    debug_print_conditions_inline

    ldi16 r6, 0x0000
    cmpi.s8 r6, 1
    debug_print_conditions_inline

    ldi16 r6, 0x8000
    cmpi.s8 r6, 127
    debug_print_conditions_inline

    ; r7
    ldi16 r7, 0x8000
    cmpi.s8 r7, -128
    debug_print_conditions_inline

    ldi16 r7, 0x8000
    cmpi.s8 r7, -127
    debug_print_conditions_inline

    ldi16 r7, 0x0000
    cmpi.s8 r7, -1
    debug_print_conditions_inline

    ldi16 r7, 0x0000
    cmpi.s8 r7, 0
    debug_print_conditions_inline

    ldi16 r7, 0x0000
    cmpi.s8 r7, 1
    debug_print_conditions_inline

    ldi16 r7, 0x8000
    cmpi.s8 r7, 127
    debug_print_conditions_inline

    sys debug_break
