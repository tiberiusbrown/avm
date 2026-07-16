.include "include/debug_output.inc"

.section .data,"aw",@progbits
ld16_test_data:
    .byte 0xa0, 0x23, 0x01, 0xa3
    .byte 0xa4, 0x67, 0x45, 0xa7
    .byte 0xa8, 0xab, 0x89, 0xab
    .byte 0xac, 0xef, 0xcd, 0xaf

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
    ldi16 c0, 0x0101
    ld16 c0, [c0]
    call debug_print_compact_regs

    reset_ld_regs
    ldi16 c1, 0x0105
    ld16 c0, [c1]
    call debug_print_compact_regs

    reset_ld_regs
    ldi16 c2, 0x0109
    ld16 c0, [c2]
    call debug_print_compact_regs

    reset_ld_regs
    ldi16 c3, 0x010d
    ld16 c0, [c3]
    call debug_print_compact_regs

    ; Destination c1, every address register.
    reset_ld_regs
    ldi16 c0, 0x0101
    ld16 c1, [c0]
    call debug_print_compact_regs

    reset_ld_regs
    ldi16 c1, 0x0105
    ld16 c1, [c1]
    call debug_print_compact_regs

    reset_ld_regs
    ldi16 c2, 0x0109
    ld16 c1, [c2]
    call debug_print_compact_regs

    reset_ld_regs
    ldi16 c3, 0x010d
    ld16 c1, [c3]
    call debug_print_compact_regs

    ; Destination c2, every address register.
    reset_ld_regs
    ldi16 c0, 0x0101
    ld16 c2, [c0]
    call debug_print_compact_regs

    reset_ld_regs
    ldi16 c1, 0x0105
    ld16 c2, [c1]
    call debug_print_compact_regs

    reset_ld_regs
    ldi16 c2, 0x0109
    ld16 c2, [c2]
    call debug_print_compact_regs

    reset_ld_regs
    ldi16 c3, 0x010d
    ld16 c2, [c3]
    call debug_print_compact_regs

    ; Destination c3, every address register.
    reset_ld_regs
    ldi16 c0, 0x0101
    ld16 c3, [c0]
    call debug_print_compact_regs

    reset_ld_regs
    ldi16 c1, 0x0105
    ld16 c3, [c1]
    call debug_print_compact_regs

    reset_ld_regs
    ldi16 c2, 0x0109
    ld16 c3, [c2]
    call debug_print_compact_regs

    reset_ld_regs
    ldi16 c3, 0x010d
    ld16 c3, [c3]
    call debug_print_compact_regs

    sys debug_break
