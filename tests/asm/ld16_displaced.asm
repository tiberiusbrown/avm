.include "include/debug_output.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ; Minimum displacement: -32.
    ldi16 r6, 0x05e0
    ldi16 r5, 0x0123
    st16  [r6], r5
    ldi16 r1, 0x0600
    ld16  r0, [r1-32]
    call  debug_print_r0_line

    ; Negative displacement: -1.
    ldi16 r6, 0x05ff
    ldi16 r5, 0x4567
    st16  [r6], r5
    ldi16 r1, 0x0600
    ld16  r0, [r1-1]
    call  debug_print_r0_line

    ; Zero displacement (encoded off8 = 0x20).
    ldi16 r6, 0x0600
    ldi16 r5, 0x89ab
    st16  [r6], r5
    ldi16 r1, 0x0600
    ld16  r0, [r1+0]
    call  debug_print_r0_line

    ; Positive displacement: +1.
    ldi16 r6, 0x0601
    ldi16 r5, 0xcdef
    st16  [r6], r5
    ldi16 r1, 0x0600
    ld16  r0, [r1+1]
    call  debug_print_r0_line

    ; Maximum displacement: +223. The word ends at 0x06e0.
    ldi16 r6, 0x06df
    ldi16 r5, 0xa55a
    st16  [r6], r5
    ldi16 r1, 0x0600
    ld16  r0, [r1+223]
    call  debug_print_r0_line

    ; Ordinary loads permit destination/address aliasing.
    ldi16 r6, 0x060f
    ldi16 r5, 0x1357
    st16  [r6], r5
    ldi16 r1, 0x0608
    ld16  r1, [r1+7]
    mov   r0, r1
    call  debug_print_r0_line

    sys debug_break

.size _start, .-_start
