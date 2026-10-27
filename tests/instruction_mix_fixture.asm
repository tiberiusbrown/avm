.section .text,"ax",@progbits
.globl _start
_start:
    ; Setup must not appear in the profile.
    ldi16 r4, 12345
    sys debug_break
    ldi16 r4, 3
    ldi16 r5, 0
.Lloop:
    dec16 r4
    cmp r4, r5
    brne8 .Lloop
    nop
    clr r5
    mov r0, r1
    add r4, r5
    add r0, r1
    addi.s8 r4, 1
    addi.s8 r0, 1
    ldi16 r4, 0xa5a5
    ldi16 r5, 0
    udiv16 r4, r5
    ldi16 r4, 0xffff
    ldi16 r5, 1
    udiv16 r4, r5
    sys debug_break
    ; Trailing work must not appear in the profile.
    ldi16 r4, 54321
    sys debug_break
.Lend:
    jmp8 .Lend
