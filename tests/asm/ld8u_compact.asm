.include "include/debug_output.inc"

.section .data,"aw",@progbits
ld8u_test_data:
    .byte 0x12, 0xa1, 0xa2, 0xa3
    .byte 0x34, 0xb1, 0xb2, 0xb3
    .byte 0x80, 0xc1, 0xc2, 0xc3
    .byte 0xff, 0xd1, 0xd2, 0xd3

.section .text,"ax",@progbits

.macro reset_ld_regs
    ldi16 c0, 0x1111
    ldi16 c1, 0x2222
    ldi16 c2, 0x3333
    ldi16 c3, 0x4444
.endm

.globl _start
.type _start, @function
_start:
    ; Destination c0, every address register.
    reset_ld_regs
    ldi16 c0, 0x0100
    ld8u c0, [c0]
    call debug_print_compact_regs

    reset_ld_regs
    ldi16 c1, 0x0104
    ld8u c0, [c1]
    call debug_print_compact_regs

    reset_ld_regs
    ldi16 c2, 0x0108
    ld8u c0, [c2]
    call debug_print_compact_regs

    reset_ld_regs
    ldi16 c3, 0x010c
    ld8u c0, [c3]
    call debug_print_compact_regs

    ; Destination c1, every address register.
    reset_ld_regs
    ldi16 c0, 0x0100
    ld8u c1, [c0]
    call debug_print_compact_regs

    reset_ld_regs
    ldi16 c1, 0x0104
    ld8u c1, [c1]
    call debug_print_compact_regs

    reset_ld_regs
    ldi16 c2, 0x0108
    ld8u c1, [c2]
    call debug_print_compact_regs

    reset_ld_regs
    ldi16 c3, 0x010c
    ld8u c1, [c3]
    call debug_print_compact_regs

    ; Destination c2, every address register.
    reset_ld_regs
    ldi16 c0, 0x0100
    ld8u c2, [c0]
    call debug_print_compact_regs

    reset_ld_regs
    ldi16 c1, 0x0104
    ld8u c2, [c1]
    call debug_print_compact_regs

    reset_ld_regs
    ldi16 c2, 0x0108
    ld8u c2, [c2]
    call debug_print_compact_regs

    reset_ld_regs
    ldi16 c3, 0x010c
    ld8u c2, [c3]
    call debug_print_compact_regs

    ; Destination c3, every address register.
    reset_ld_regs
    ldi16 c0, 0x0100
    ld8u c3, [c0]
    call debug_print_compact_regs

    reset_ld_regs
    ldi16 c1, 0x0104
    ld8u c3, [c1]
    call debug_print_compact_regs

    reset_ld_regs
    ldi16 c2, 0x0108
    ld8u c3, [c2]
    call debug_print_compact_regs

    reset_ld_regs
    ldi16 c3, 0x010c
    ld8u c3, [c3]
    call debug_print_compact_regs

    sys debug_break
