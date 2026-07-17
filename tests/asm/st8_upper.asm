.include "include/debug_output.inc"

.section .data,"aw",@progbits
st8_test_data:
    .byte 0xee, 0xa5
    .byte 0xee, 0xa5
    .byte 0xee, 0xa5
    .byte 0xee, 0xa5
    .byte 0xee, 0xa5
    .byte 0xee, 0xa5
    .byte 0xee, 0xa5
    .byte 0xee, 0xa5
    .byte 0xee, 0xa5
    .byte 0xee, 0xa5
    .byte 0xee, 0xa5
    .byte 0xee, 0xa5
    .byte 0xee, 0xa5
    .byte 0xee, 0xa5
    .byte 0xee, 0xa5
    .byte 0xee, 0xa5

.section .text,"ax",@progbits

.macro reset_store_regs
    ldi16 c0, 0x1122
    ldi16 c1, 0x3344
    ldi16 c2, 0x5566
    ldi16 c3, 0x7788
.endm

.globl _start
.type _start, @function
_start:
    ; Address c0, every source register.
    reset_store_regs
    ldi16 c0, 0x0100
    st8 [c0], c0
    call debug_print_upper_regs
    ld16 r0, [c0]
    call debug_print_r0_line

    reset_store_regs
    ldi16 c0, 0x0102
    st8 [c0], c1
    call debug_print_upper_regs
    ld16 r0, [c0]
    call debug_print_r0_line

    reset_store_regs
    ldi16 c0, 0x0104
    st8 [c0], c2
    call debug_print_upper_regs
    ld16 r0, [c0]
    call debug_print_r0_line

    reset_store_regs
    ldi16 c0, 0x0106
    st8 [c0], c3
    call debug_print_upper_regs
    ld16 r0, [c0]
    call debug_print_r0_line

    ; Address c1, every source register.
    reset_store_regs
    ldi16 c1, 0x0108
    st8 [c1], c0
    call debug_print_upper_regs
    ld16 r0, [c1]
    call debug_print_r0_line

    reset_store_regs
    ldi16 c1, 0x010a
    st8 [c1], c1
    call debug_print_upper_regs
    ld16 r0, [c1]
    call debug_print_r0_line

    reset_store_regs
    ldi16 c1, 0x010c
    st8 [c1], c2
    call debug_print_upper_regs
    ld16 r0, [c1]
    call debug_print_r0_line

    reset_store_regs
    ldi16 c1, 0x010e
    st8 [c1], c3
    call debug_print_upper_regs
    ld16 r0, [c1]
    call debug_print_r0_line

    ; Address c2, every source register.
    reset_store_regs
    ldi16 c2, 0x0110
    st8 [c2], c0
    call debug_print_upper_regs
    ld16 r0, [c2]
    call debug_print_r0_line

    reset_store_regs
    ldi16 c2, 0x0112
    st8 [c2], c1
    call debug_print_upper_regs
    ld16 r0, [c2]
    call debug_print_r0_line

    reset_store_regs
    ldi16 c2, 0x0114
    st8 [c2], c2
    call debug_print_upper_regs
    ld16 r0, [c2]
    call debug_print_r0_line

    reset_store_regs
    ldi16 c2, 0x0116
    st8 [c2], c3
    call debug_print_upper_regs
    ld16 r0, [c2]
    call debug_print_r0_line

    ; Address c3, every source register.
    reset_store_regs
    ldi16 c3, 0x0118
    st8 [c3], c0
    call debug_print_upper_regs
    ld16 r0, [c3]
    call debug_print_r0_line

    reset_store_regs
    ldi16 c3, 0x011a
    st8 [c3], c1
    call debug_print_upper_regs
    ld16 r0, [c3]
    call debug_print_r0_line

    reset_store_regs
    ldi16 c3, 0x011c
    st8 [c3], c2
    call debug_print_upper_regs
    ld16 r0, [c3]
    call debug_print_r0_line

    reset_store_regs
    ldi16 c3, 0x011e
    st8 [c3], c3
    call debug_print_upper_regs
    ld16 r0, [c3]
    call debug_print_r0_line

    sys debug_break
