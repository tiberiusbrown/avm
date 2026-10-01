.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ; Three trips through the same PC, then a coherent debug-break stop.
    ldi16 r4, 3
    ldi16 r5, 0
.Lagain:
    dec16 r4
    cmp r4, r5
    brne8 .Lagain
    sys debug_break
.Lfault:
    .byte 0xff
