.include "include/debug_output.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ; Minimum displacement: -32.
    ldi16 r6, 0x05e0
    ldi8  r5, 0x80
    st8   [r6], r5
    ldi16 r1, 0x0600
    ld8u  r0, [r1-32]
    call  debug_print_r0_line

    ; Negative displacement: -1.
    ldi16 r6, 0x05ff
    ldi8  r5, 0xa5
    st8   [r6], r5
    ldi16 r1, 0x0600
    ld8u  r0, [r1-1]
    call  debug_print_r0_line

    ; Zero displacement (encoded off8 = 0x20).
    ldi16 r6, 0x0600
    ldi8  r5, 0x5a
    st8   [r6], r5
    ldi16 r1, 0x0600
    ld8u  r0, [r1+0]
    call  debug_print_r0_line

    ; Positive displacement: +1.
    ldi16 r6, 0x0601
    ldi8  r5, 0xff
    st8   [r6], r5
    ldi16 r1, 0x0600
    ld8u  r0, [r1+1]
    call  debug_print_r0_line

    ; Maximum displacement: +223.
    ldi16 r6, 0x06df
    ldi8  r5, 0x01
    st8   [r6], r5
    ldi16 r1, 0x0600
    ld8u  r0, [r1+223]
    call  debug_print_r0_line

    ; Ordinary loads permit destination/address aliasing. The effective address
    ; must be captured before r1 is overwritten with the zero-extended byte.
    ldi16 r6, 0x060f
    ldi8  r5, 0x7e
    st8   [r6], r5
    ldi16 r1, 0x0608
    ld8u  r1, [r1+7]
    mov   r0, r1
    call  debug_print_r0_line

    sys debug_break

.size _start, .-_start
