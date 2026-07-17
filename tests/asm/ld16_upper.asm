.include "include/debug_output.inc"

.section .data,"aw",@progbits
ld16_test_data:
    .byte 0xa0, 0x23, 0x01, 0xa3
    .byte 0xa4, 0x67, 0x45, 0xa7
    .byte 0xa8, 0xab, 0x89, 0xab
    .byte 0xac, 0xef, 0xcd, 0xaf

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
    ldi16 r4, 0x0101
    ld16 r4, [r4]
    call debug_print_upper_regs

    reset_ld_regs
    ldi16 r5, 0x0105
    ld16 r4, [r5]
    call debug_print_upper_regs

    reset_ld_regs
    ldi16 r6, 0x0109
    ld16 r4, [r6]
    call debug_print_upper_regs

    reset_ld_regs
    ldi16 r7, 0x010d
    ld16 r4, [r7]
    call debug_print_upper_regs

    ; Destination r5, every address register.
    reset_ld_regs
    ldi16 r4, 0x0101
    ld16 r5, [r4]
    call debug_print_upper_regs

    reset_ld_regs
    ldi16 r5, 0x0105
    ld16 r5, [r5]
    call debug_print_upper_regs

    reset_ld_regs
    ldi16 r6, 0x0109
    ld16 r5, [r6]
    call debug_print_upper_regs

    reset_ld_regs
    ldi16 r7, 0x010d
    ld16 r5, [r7]
    call debug_print_upper_regs

    ; Destination r6, every address register.
    reset_ld_regs
    ldi16 r4, 0x0101
    ld16 r6, [r4]
    call debug_print_upper_regs

    reset_ld_regs
    ldi16 r5, 0x0105
    ld16 r6, [r5]
    call debug_print_upper_regs

    reset_ld_regs
    ldi16 r6, 0x0109
    ld16 r6, [r6]
    call debug_print_upper_regs

    reset_ld_regs
    ldi16 r7, 0x010d
    ld16 r6, [r7]
    call debug_print_upper_regs

    ; Destination r7, every address register.
    reset_ld_regs
    ldi16 r4, 0x0101
    ld16 r7, [r4]
    call debug_print_upper_regs

    reset_ld_regs
    ldi16 r5, 0x0105
    ld16 r7, [r5]
    call debug_print_upper_regs

    reset_ld_regs
    ldi16 r6, 0x0109
    ld16 r7, [r6]
    call debug_print_upper_regs

    reset_ld_regs
    ldi16 r7, 0x010d
    ld16 r7, [r7]
    call debug_print_upper_regs

    sys debug_break
