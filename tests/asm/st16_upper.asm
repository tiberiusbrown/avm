.include "include/debug_output.inc"

.section .data,"aw",@progbits
st16_test_data:
    .byte 0xee, 0xdd, 0xa5
    .byte 0xee, 0xdd, 0xa5
    .byte 0xee, 0xdd, 0xa5
    .byte 0xee, 0xdd, 0xa5
    .byte 0xee, 0xdd, 0xa5
    .byte 0xee, 0xdd, 0xa5
    .byte 0xee, 0xdd, 0xa5
    .byte 0xee, 0xdd, 0xa5
    .byte 0xee, 0xdd, 0xa5
    .byte 0xee, 0xdd, 0xa5
    .byte 0xee, 0xdd, 0xa5
    .byte 0xee, 0xdd, 0xa5
    .byte 0xee, 0xdd, 0xa5
    .byte 0xee, 0xdd, 0xa5
    .byte 0xee, 0xdd, 0xa5
    .byte 0xee, 0xdd, 0xa5

.section .text,"ax",@progbits

.macro reset_store_regs
    ldi16 c0, 0x1122
    ldi16 r5, 0x3344
    ldi16 r6, 0x5566
    ldi16 r7, 0x7788
.endm

.globl _start
.type _start, @function
_start:
    ; Address c0, every source register.
    reset_store_regs
    ldi16 c0, 0x0100
    st16 [c0], c0
    call debug_print_upper_regs
    ld16 r0, [c0]
    call debug_print_r0_line
    addi.s8 c0, 2
    ld8u r0, [c0]
    call debug_print_r0_line

    reset_store_regs
    ldi16 c0, 0x0103
    st16 [c0], r5
    call debug_print_upper_regs
    ld16 r0, [c0]
    call debug_print_r0_line
    addi.s8 c0, 2
    ld8u r0, [c0]
    call debug_print_r0_line

    reset_store_regs
    ldi16 c0, 0x0106
    st16 [c0], r6
    call debug_print_upper_regs
    ld16 r0, [c0]
    call debug_print_r0_line
    addi.s8 c0, 2
    ld8u r0, [c0]
    call debug_print_r0_line

    reset_store_regs
    ldi16 c0, 0x0109
    st16 [c0], r7
    call debug_print_upper_regs
    ld16 r0, [c0]
    call debug_print_r0_line
    addi.s8 c0, 2
    ld8u r0, [c0]
    call debug_print_r0_line

    ; Address r5, every source register.
    reset_store_regs
    ldi16 r5, 0x010c
    st16 [r5], c0
    call debug_print_upper_regs
    ld16 r0, [r5]
    call debug_print_r0_line
    addi.s8 r5, 2
    ld8u r0, [r5]
    call debug_print_r0_line

    reset_store_regs
    ldi16 r5, 0x010f
    st16 [r5], r5
    call debug_print_upper_regs
    ld16 r0, [r5]
    call debug_print_r0_line
    addi.s8 r5, 2
    ld8u r0, [r5]
    call debug_print_r0_line

    reset_store_regs
    ldi16 r5, 0x0112
    st16 [r5], r6
    call debug_print_upper_regs
    ld16 r0, [r5]
    call debug_print_r0_line
    addi.s8 r5, 2
    ld8u r0, [r5]
    call debug_print_r0_line

    reset_store_regs
    ldi16 r5, 0x0115
    st16 [r5], r7
    call debug_print_upper_regs
    ld16 r0, [r5]
    call debug_print_r0_line
    addi.s8 r5, 2
    ld8u r0, [r5]
    call debug_print_r0_line

    ; Address r6, every source register.
    reset_store_regs
    ldi16 r6, 0x0118
    st16 [r6], c0
    call debug_print_upper_regs
    ld16 r0, [r6]
    call debug_print_r0_line
    addi.s8 r6, 2
    ld8u r0, [r6]
    call debug_print_r0_line

    reset_store_regs
    ldi16 r6, 0x011b
    st16 [r6], r5
    call debug_print_upper_regs
    ld16 r0, [r6]
    call debug_print_r0_line
    addi.s8 r6, 2
    ld8u r0, [r6]
    call debug_print_r0_line

    reset_store_regs
    ldi16 r6, 0x011e
    st16 [r6], r6
    call debug_print_upper_regs
    ld16 r0, [r6]
    call debug_print_r0_line
    addi.s8 r6, 2
    ld8u r0, [r6]
    call debug_print_r0_line

    reset_store_regs
    ldi16 r6, 0x0121
    st16 [r6], r7
    call debug_print_upper_regs
    ld16 r0, [r6]
    call debug_print_r0_line
    addi.s8 r6, 2
    ld8u r0, [r6]
    call debug_print_r0_line

    ; Address r7, every source register.
    reset_store_regs
    ldi16 r7, 0x0124
    st16 [r7], c0
    call debug_print_upper_regs
    ld16 r0, [r7]
    call debug_print_r0_line
    addi.s8 r7, 2
    ld8u r0, [r7]
    call debug_print_r0_line

    reset_store_regs
    ldi16 r7, 0x0127
    st16 [r7], r5
    call debug_print_upper_regs
    ld16 r0, [r7]
    call debug_print_r0_line
    addi.s8 r7, 2
    ld8u r0, [r7]
    call debug_print_r0_line

    reset_store_regs
    ldi16 r7, 0x012a
    st16 [r7], r6
    call debug_print_upper_regs
    ld16 r0, [r7]
    call debug_print_r0_line
    addi.s8 r7, 2
    ld8u r0, [r7]
    call debug_print_r0_line

    reset_store_regs
    ldi16 r7, 0x012d
    st16 [r7], r7
    call debug_print_upper_regs
    ld16 r0, [r7]
    call debug_print_r0_line
    addi.s8 r7, 2
    ld8u r0, [r7]
    call debug_print_r0_line

    sys debug_break
