.include "include/debug_output.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ; Minimum displacement: -32.
    ldi16 r1, 0x0600
    ldi16 r0, 0x0123
    st16  [r1-32], r0
    ldi16 r6, 0x05e0
    ld16  r0, [r6]
    call  debug_print_r0_line

    ; Negative displacement: -1.
    ldi16 r1, 0x0600
    ldi16 r0, 0x4567
    st16  [r1-1], r0
    ldi16 r6, 0x05ff
    ld16  r0, [r6]
    call  debug_print_r0_line

    ; Zero displacement.
    ldi16 r1, 0x0600
    ldi16 r0, 0x89ab
    st16  [r1+0], r0
    ldi16 r6, 0x0600
    ld16  r0, [r6]
    call  debug_print_r0_line

    ; Positive displacement: +1.
    ldi16 r1, 0x0600
    ldi16 r0, 0xcdef
    st16  [r1+1], r0
    ldi16 r6, 0x0601
    ld16  r0, [r6]
    call  debug_print_r0_line

    ; Maximum displacement: +223.
    ldi16 r1, 0x0600
    ldi16 r0, 0xa55a
    st16  [r1+223], r0
    ldi16 r6, 0x06df
    ld16  r0, [r6]
    call  debug_print_r0_line

    ; Stores permit source/address aliasing. This stores 0x0608 at 0x060f.
    ldi16 r1, 0x0608
    st16  [r1+7], r1
    ldi16 r6, 0x060f
    ld16  r0, [r6]
    call  debug_print_r0_line

    sys debug_break

.size _start, .-_start
