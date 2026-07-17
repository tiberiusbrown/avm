.include "include/debug_output.inc"

.section .data,"aw",@progbits
ld8u_test_data:
    .byte 0x12, 0xa1, 0xa2, 0xa3
    .byte 0x34, 0xb1, 0xb2, 0xb3
    .byte 0x80, 0xc1, 0xc2, 0xc3
    .byte 0xff, 0xd1, 0xd2, 0xd3

.section .text,"ax",@progbits

.macro reset_ld_regs
    ldi16 r4, 0x1111
    ldi16 r5, 0x2222
    ldi16 r6, 0x3333
    ldi16 r7, 0x4444
.endm

.globl _start
.type _start, @function
_start:
    ; Destination r4, every address register.
    reset_ld_regs
    ldi16 r4, 0x0100
    ld8u r4, [r4]
    call debug_print_upper_regs

    reset_ld_regs
    ldi16 r5, 0x0104
    ld8u r4, [r5]
    call debug_print_upper_regs

    reset_ld_regs
    ldi16 r6, 0x0108
    ld8u r4, [r6]
    call debug_print_upper_regs

    reset_ld_regs
    ldi16 r7, 0x010c
    ld8u r4, [r7]
    call debug_print_upper_regs

    ; Destination r5, every address register.
    reset_ld_regs
    ldi16 r4, 0x0100
    ld8u r5, [r4]
    call debug_print_upper_regs

    reset_ld_regs
    ldi16 r5, 0x0104
    ld8u r5, [r5]
    call debug_print_upper_regs

    reset_ld_regs
    ldi16 r6, 0x0108
    ld8u r5, [r6]
    call debug_print_upper_regs

    reset_ld_regs
    ldi16 r7, 0x010c
    ld8u r5, [r7]
    call debug_print_upper_regs

    ; Destination r6, every address register.
    reset_ld_regs
    ldi16 r4, 0x0100
    ld8u r6, [r4]
    call debug_print_upper_regs

    reset_ld_regs
    ldi16 r5, 0x0104
    ld8u r6, [r5]
    call debug_print_upper_regs

    reset_ld_regs
    ldi16 r6, 0x0108
    ld8u r6, [r6]
    call debug_print_upper_regs

    reset_ld_regs
    ldi16 r7, 0x010c
    ld8u r6, [r7]
    call debug_print_upper_regs

    ; Destination r7, every address register.
    reset_ld_regs
    ldi16 r4, 0x0100
    ld8u r7, [r4]
    call debug_print_upper_regs

    reset_ld_regs
    ldi16 r5, 0x0104
    ld8u r7, [r5]
    call debug_print_upper_regs

    reset_ld_regs
    ldi16 r6, 0x0108
    ld8u r7, [r6]
    call debug_print_upper_regs

    reset_ld_regs
    ldi16 r7, 0x010c
    ld8u r7, [r7]
    call debug_print_upper_regs

    sys debug_break
