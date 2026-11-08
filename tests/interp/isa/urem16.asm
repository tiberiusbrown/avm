.include "include/divrem16_test.inc"

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:

    ; encoding matrix: urem16 r0,r0; dividend=0x0000, divisor=0x0000.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x235a
    push16 r4
    ldi16 r4, 0x35a3
    push16 r4
    ldi16 r4, 0x47ec
    push16 r4
    ldi16 r4, 0x5a35
    push16 r4
    ldi16 r4, 0x6c7e
    push16 r4
    ldi16 r4, 0x7ec7
    push16 r4
    ldi16 r4, 0x9110
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r0, r0 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r0,r1; dividend=0x0001, divisor=0x0001.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x36e0
    push16 r4
    ldi16 r4, 0x4929
    push16 r4
    ldi16 r4, 0x5b72
    push16 r4
    ldi16 r4, 0x6dbb
    push16 r4
    ldi16 r4, 0x8004
    push16 r4
    ldi16 r4, 0x924d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r0, r1 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r0,r2; dividend=0x0001, divisor=0x0002.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x25d4
    push16 r4
    ldi16 r4, 0x0002
    push16 r4
    ldi16 r4, 0x4a66
    push16 r4
    ldi16 r4, 0x5caf
    push16 r4
    ldi16 r4, 0x6ef8
    push16 r4
    ldi16 r4, 0x8141
    push16 r4
    ldi16 r4, 0x938a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r0, r2 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r0,r3; dividend=0x0002, divisor=0x0001.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x0002
    push16 r4
    ldi16 r4, 0x2711
    push16 r4
    ldi16 r4, 0x395a
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x5dec
    push16 r4
    ldi16 r4, 0x7035
    push16 r4
    ldi16 r4, 0x827e
    push16 r4
    ldi16 r4, 0x94c7
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r0, r3 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r0,r4; dividend=0x1234, divisor=0x0011.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x1234
    push16 r4
    ldi16 r4, 0x284e
    push16 r4
    ldi16 r4, 0x3a97
    push16 r4
    ldi16 r4, 0x4ce0
    push16 r4
    ldi16 r4, 0x0011
    push16 r4
    ldi16 r4, 0x7172
    push16 r4
    ldi16 r4, 0x83bb
    push16 r4
    ldi16 r4, 0x9604
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r0, r4 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r0,r5; dividend=0xFFFF, divisor=0x00FF.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x298b
    push16 r4
    ldi16 r4, 0x3bd4
    push16 r4
    ldi16 r4, 0x4e1d
    push16 r4
    ldi16 r4, 0x6066
    push16 r4
    ldi16 r4, 0x00ff
    push16 r4
    ldi16 r4, 0x84f8
    push16 r4
    ldi16 r4, 0x9741
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r0, r5 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r0,r6; dividend=0x8000, divisor=0x0003.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0x2ac8
    push16 r4
    ldi16 r4, 0x3d11
    push16 r4
    ldi16 r4, 0x4f5a
    push16 r4
    ldi16 r4, 0x61a3
    push16 r4
    ldi16 r4, 0x73ec
    push16 r4
    ldi16 r4, 0x0003
    push16 r4
    ldi16 r4, 0x987e
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r0, r6 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r0,r7; dividend=0xFFFF, divisor=0xFFFF.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x2c05
    push16 r4
    ldi16 r4, 0x3e4e
    push16 r4
    ldi16 r4, 0x5097
    push16 r4
    ldi16 r4, 0x62e0
    push16 r4
    ldi16 r4, 0x7529
    push16 r4
    ldi16 r4, 0x8772
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r0, r7 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r1,r0; dividend=0xA5A5, divisor=0x0000.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0xa5a5
    push16 r4
    ldi16 r4, 0x3f8b
    push16 r4
    ldi16 r4, 0x51d4
    push16 r4
    ldi16 r4, 0x641d
    push16 r4
    ldi16 r4, 0x7666
    push16 r4
    ldi16 r4, 0x88af
    push16 r4
    ldi16 r4, 0x9af8
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r1, r0 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r1,r1; dividend=0x0001, divisor=0x0001.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1c36
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x40c8
    push16 r4
    ldi16 r4, 0x5311
    push16 r4
    ldi16 r4, 0x655a
    push16 r4
    ldi16 r4, 0x77a3
    push16 r4
    ldi16 r4, 0x89ec
    push16 r4
    ldi16 r4, 0x9c35
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r1, r1 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r1,r2; dividend=0xFFFE, divisor=0x0002.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1d73
    push16 r4
    ldi16 r4, 0xfffe
    push16 r4
    ldi16 r4, 0x0002
    push16 r4
    ldi16 r4, 0x544e
    push16 r4
    ldi16 r4, 0x6697
    push16 r4
    ldi16 r4, 0x78e0
    push16 r4
    ldi16 r4, 0x8b29
    push16 r4
    ldi16 r4, 0x9d72
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r1, r2 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r1,r3; dividend=0x8001, divisor=0x7FFF.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x1eb0
    push16 r4
    ldi16 r4, 0x8001
    push16 r4
    ldi16 r4, 0x4342
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    ldi16 r4, 0x67d4
    push16 r4
    ldi16 r4, 0x7a1d
    push16 r4
    ldi16 r4, 0x8c66
    push16 r4
    ldi16 r4, 0x9eaf
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r1, r3 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r1,r4; dividend=0x7FFF, divisor=0x8000.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x1fed
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    ldi16 r4, 0x447f
    push16 r4
    ldi16 r4, 0x56c8
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0x7b5a
    push16 r4
    ldi16 r4, 0x8da3
    push16 r4
    ldi16 r4, 0x9fec
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r1, r4 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r1,r5; dividend=0xFEDC, divisor=0x0123.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x212a
    push16 r4
    ldi16 r4, 0xfedc
    push16 r4
    ldi16 r4, 0x45bc
    push16 r4
    ldi16 r4, 0x5805
    push16 r4
    ldi16 r4, 0x6a4e
    push16 r4
    ldi16 r4, 0x0123
    push16 r4
    ldi16 r4, 0x8ee0
    push16 r4
    ldi16 r4, 0xa129
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r1, r5 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r1,r6; dividend=0x0100, divisor=0x0010.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x2267
    push16 r4
    ldi16 r4, 0x0100
    push16 r4
    ldi16 r4, 0x46f9
    push16 r4
    ldi16 r4, 0x5942
    push16 r4
    ldi16 r4, 0x6b8b
    push16 r4
    ldi16 r4, 0x7dd4
    push16 r4
    ldi16 r4, 0x0010
    push16 r4
    ldi16 r4, 0xa266
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r1, r6 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r1,r7; dividend=0x00FF, divisor=0x0100.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x23a4
    push16 r4
    ldi16 r4, 0x00ff
    push16 r4
    ldi16 r4, 0x4836
    push16 r4
    ldi16 r4, 0x5a7f
    push16 r4
    ldi16 r4, 0x6cc8
    push16 r4
    ldi16 r4, 0x7f11
    push16 r4
    ldi16 r4, 0x915a
    push16 r4
    ldi16 r4, 0x0100
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r1, r7 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r2,r0; dividend=0x0000, divisor=0x0001.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x372a
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x5bbc
    push16 r4
    ldi16 r4, 0x6e05
    push16 r4
    ldi16 r4, 0x804e
    push16 r4
    ldi16 r4, 0x9297
    push16 r4
    ldi16 r4, 0xa4e0
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r2, r0 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r2,r1; dividend=0x0001, divisor=0x0001.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x261e
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x5cf9
    push16 r4
    ldi16 r4, 0x6f42
    push16 r4
    ldi16 r4, 0x818b
    push16 r4
    ldi16 r4, 0x93d4
    push16 r4
    ldi16 r4, 0xa61d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r2, r1 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r2,r2; dividend=0xFFFF, divisor=0xFFFF.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x275b
    push16 r4
    ldi16 r4, 0x39a4
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x5e36
    push16 r4
    ldi16 r4, 0x707f
    push16 r4
    ldi16 r4, 0x82c8
    push16 r4
    ldi16 r4, 0x9511
    push16 r4
    ldi16 r4, 0xa75a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r2, r2 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r2,r3; dividend=0x0002, divisor=0x0001.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x2898
    push16 r4
    ldi16 r4, 0x3ae1
    push16 r4
    ldi16 r4, 0x0002
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x71bc
    push16 r4
    ldi16 r4, 0x8405
    push16 r4
    ldi16 r4, 0x964e
    push16 r4
    ldi16 r4, 0xa897
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r2, r3 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r2,r4; dividend=0x1234, divisor=0x0011.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x29d5
    push16 r4
    ldi16 r4, 0x3c1e
    push16 r4
    ldi16 r4, 0x1234
    push16 r4
    ldi16 r4, 0x60b0
    push16 r4
    ldi16 r4, 0x0011
    push16 r4
    ldi16 r4, 0x8542
    push16 r4
    ldi16 r4, 0x978b
    push16 r4
    ldi16 r4, 0xa9d4
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r2, r4 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r2,r5; dividend=0xFFFF, divisor=0x00FF.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x2b12
    push16 r4
    ldi16 r4, 0x3d5b
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x61ed
    push16 r4
    ldi16 r4, 0x7436
    push16 r4
    ldi16 r4, 0x00ff
    push16 r4
    ldi16 r4, 0x98c8
    push16 r4
    ldi16 r4, 0xab11
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r2, r5 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r2,r6; dividend=0x8000, divisor=0x0003.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x2c4f
    push16 r4
    ldi16 r4, 0x3e98
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0x632a
    push16 r4
    ldi16 r4, 0x7573
    push16 r4
    ldi16 r4, 0x87bc
    push16 r4
    ldi16 r4, 0x0003
    push16 r4
    ldi16 r4, 0xac4e
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r2, r6 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r2,r7; dividend=0xFFFF, divisor=0xFFFF.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x2d8c
    push16 r4
    ldi16 r4, 0x3fd5
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x6467
    push16 r4
    ldi16 r4, 0x76b0
    push16 r4
    ldi16 r4, 0x88f9
    push16 r4
    ldi16 r4, 0x9b42
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r2, r7 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r3,r0; dividend=0xA5A5, divisor=0x0000.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x4112
    push16 r4
    ldi16 r4, 0x535b
    push16 r4
    ldi16 r4, 0xa5a5
    push16 r4
    ldi16 r4, 0x77ed
    push16 r4
    ldi16 r4, 0x8a36
    push16 r4
    ldi16 r4, 0x9c7f
    push16 r4
    ldi16 r4, 0xaec8
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r3, r0 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r3,r1; dividend=0x0000, divisor=0x0000.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x3006
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x5498
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x792a
    push16 r4
    ldi16 r4, 0x8b73
    push16 r4
    ldi16 r4, 0x9dbc
    push16 r4
    ldi16 r4, 0xb005
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r3, r1 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r3,r2; dividend=0xFFFE, divisor=0x0002.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x3143
    push16 r4
    ldi16 r4, 0x438c
    push16 r4
    ldi16 r4, 0x0002
    push16 r4
    ldi16 r4, 0xfffe
    push16 r4
    ldi16 r4, 0x7a67
    push16 r4
    ldi16 r4, 0x8cb0
    push16 r4
    ldi16 r4, 0x9ef9
    push16 r4
    ldi16 r4, 0xb142
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r3, r2 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r3,r3; dividend=0x8000, divisor=0x8000.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x3280
    push16 r4
    ldi16 r4, 0x44c9
    push16 r4
    ldi16 r4, 0x5712
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0x7ba4
    push16 r4
    ldi16 r4, 0x8ded
    push16 r4
    ldi16 r4, 0xa036
    push16 r4
    ldi16 r4, 0xb27f
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r3, r3 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r3,r4; dividend=0x7FFF, divisor=0x8000.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x33bd
    push16 r4
    ldi16 r4, 0x4606
    push16 r4
    ldi16 r4, 0x584f
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0x8f2a
    push16 r4
    ldi16 r4, 0xa173
    push16 r4
    ldi16 r4, 0xb3bc
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r3, r4 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r3,r5; dividend=0xFEDC, divisor=0x0123.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x34fa
    push16 r4
    ldi16 r4, 0x4743
    push16 r4
    ldi16 r4, 0x598c
    push16 r4
    ldi16 r4, 0xfedc
    push16 r4
    ldi16 r4, 0x7e1e
    push16 r4
    ldi16 r4, 0x0123
    push16 r4
    ldi16 r4, 0xa2b0
    push16 r4
    ldi16 r4, 0xb4f9
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r3, r5 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r3,r6; dividend=0x0100, divisor=0x0010.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x3637
    push16 r4
    ldi16 r4, 0x4880
    push16 r4
    ldi16 r4, 0x5ac9
    push16 r4
    ldi16 r4, 0x0100
    push16 r4
    ldi16 r4, 0x7f5b
    push16 r4
    ldi16 r4, 0x91a4
    push16 r4
    ldi16 r4, 0x0010
    push16 r4
    ldi16 r4, 0xb636
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r3, r6 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r3,r7; dividend=0x00FF, divisor=0x0100.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x3774
    push16 r4
    ldi16 r4, 0x49bd
    push16 r4
    ldi16 r4, 0x5c06
    push16 r4
    ldi16 r4, 0x00ff
    push16 r4
    ldi16 r4, 0x8098
    push16 r4
    ldi16 r4, 0x92e1
    push16 r4
    ldi16 r4, 0xa52a
    push16 r4
    ldi16 r4, 0x0100
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r3, r7 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r4,r0; dividend=0x0000, divisor=0x0001.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x4afa
    push16 r4
    ldi16 r4, 0x5d43
    push16 r4
    ldi16 r4, 0x6f8c
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x941e
    push16 r4
    ldi16 r4, 0xa667
    push16 r4
    ldi16 r4, 0xb8b0
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r4, r0 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r4,r1; dividend=0x0001, divisor=0x0001.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x39ee
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x5e80
    push16 r4
    ldi16 r4, 0x70c9
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x955b
    push16 r4
    ldi16 r4, 0xa7a4
    push16 r4
    ldi16 r4, 0xb9ed
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r4, r1 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r4,r2; dividend=0x0001, divisor=0x0002.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x3b2b
    push16 r4
    ldi16 r4, 0x4d74
    push16 r4
    ldi16 r4, 0x0002
    push16 r4
    ldi16 r4, 0x7206
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x9698
    push16 r4
    ldi16 r4, 0xa8e1
    push16 r4
    ldi16 r4, 0xbb2a
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r4, r2 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r4,r3; dividend=0x0002, divisor=0x0001.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x3c68
    push16 r4
    ldi16 r4, 0x4eb1
    push16 r4
    ldi16 r4, 0x60fa
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x0002
    push16 r4
    ldi16 r4, 0x97d5
    push16 r4
    ldi16 r4, 0xaa1e
    push16 r4
    ldi16 r4, 0xbc67
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r4, r3 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r4,r4; dividend=0x0007, divisor=0x0007.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x3da5
    push16 r4
    ldi16 r4, 0x4fee
    push16 r4
    ldi16 r4, 0x6237
    push16 r4
    ldi16 r4, 0x7480
    push16 r4
    ldi16 r4, 0x0007
    push16 r4
    ldi16 r4, 0x9912
    push16 r4
    ldi16 r4, 0xab5b
    push16 r4
    ldi16 r4, 0xbda4
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r4, r4 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r4,r5; dividend=0xFFFF, divisor=0x00FF.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x3ee2
    push16 r4
    ldi16 r4, 0x512b
    push16 r4
    ldi16 r4, 0x6374
    push16 r4
    ldi16 r4, 0x75bd
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x00ff
    push16 r4
    ldi16 r4, 0xac98
    push16 r4
    ldi16 r4, 0xbee1
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r4, r5 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r4,r6; dividend=0x8000, divisor=0x0003.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x401f
    push16 r4
    ldi16 r4, 0x5268
    push16 r4
    ldi16 r4, 0x64b1
    push16 r4
    ldi16 r4, 0x76fa
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0x9b8c
    push16 r4
    ldi16 r4, 0x0003
    push16 r4
    ldi16 r4, 0xc01e
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r4, r6 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r4,r7; dividend=0xFFFF, divisor=0xFFFF.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x415c
    push16 r4
    ldi16 r4, 0x53a5
    push16 r4
    ldi16 r4, 0x65ee
    push16 r4
    ldi16 r4, 0x7837
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x9cc9
    push16 r4
    ldi16 r4, 0xaf12
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r4, r7 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r5,r0; dividend=0xA5A5, divisor=0x0000.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x54e2
    push16 r4
    ldi16 r4, 0x672b
    push16 r4
    ldi16 r4, 0x7974
    push16 r4
    ldi16 r4, 0x8bbd
    push16 r4
    ldi16 r4, 0xa5a5
    push16 r4
    ldi16 r4, 0xb04f
    push16 r4
    ldi16 r4, 0xc298
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r5, r0 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r5,r1; dividend=0x0000, divisor=0x0000.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x43d6
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x6868
    push16 r4
    ldi16 r4, 0x7ab1
    push16 r4
    ldi16 r4, 0x8cfa
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0xb18c
    push16 r4
    ldi16 r4, 0xc3d5
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r5, r1 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r5,r2; dividend=0xFFFE, divisor=0x0002.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x4513
    push16 r4
    ldi16 r4, 0x575c
    push16 r4
    ldi16 r4, 0x0002
    push16 r4
    ldi16 r4, 0x7bee
    push16 r4
    ldi16 r4, 0x8e37
    push16 r4
    ldi16 r4, 0xfffe
    push16 r4
    ldi16 r4, 0xb2c9
    push16 r4
    ldi16 r4, 0xc512
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r5, r2 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r5,r3; dividend=0x8001, divisor=0x7FFF.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x4650
    push16 r4
    ldi16 r4, 0x5899
    push16 r4
    ldi16 r4, 0x6ae2
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    ldi16 r4, 0x8f74
    push16 r4
    ldi16 r4, 0x8001
    push16 r4
    ldi16 r4, 0xb406
    push16 r4
    ldi16 r4, 0xc64f
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r5, r3 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r5,r4; dividend=0x7FFF, divisor=0x8000.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x478d
    push16 r4
    ldi16 r4, 0x59d6
    push16 r4
    ldi16 r4, 0x6c1f
    push16 r4
    ldi16 r4, 0x7e68
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    ldi16 r4, 0xb543
    push16 r4
    ldi16 r4, 0xc78c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r5, r4 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r5,r5; dividend=0x7FFF, divisor=0x7FFF.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x48ca
    push16 r4
    ldi16 r4, 0x5b13
    push16 r4
    ldi16 r4, 0x6d5c
    push16 r4
    ldi16 r4, 0x7fa5
    push16 r4
    ldi16 r4, 0x91ee
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    ldi16 r4, 0xb680
    push16 r4
    ldi16 r4, 0xc8c9
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r5, r5 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r5,r6; dividend=0x0100, divisor=0x0010.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x4a07
    push16 r4
    ldi16 r4, 0x5c50
    push16 r4
    ldi16 r4, 0x6e99
    push16 r4
    ldi16 r4, 0x80e2
    push16 r4
    ldi16 r4, 0x932b
    push16 r4
    ldi16 r4, 0x0100
    push16 r4
    ldi16 r4, 0x0010
    push16 r4
    ldi16 r4, 0xca06
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r5, r6 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r5,r7; dividend=0x00FF, divisor=0x0100.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x4b44
    push16 r4
    ldi16 r4, 0x5d8d
    push16 r4
    ldi16 r4, 0x6fd6
    push16 r4
    ldi16 r4, 0x821f
    push16 r4
    ldi16 r4, 0x9468
    push16 r4
    ldi16 r4, 0x00ff
    push16 r4
    ldi16 r4, 0xb8fa
    push16 r4
    ldi16 r4, 0x0100
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r5, r7 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r6,r0; dividend=0x0000, divisor=0x0001.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x5eca
    push16 r4
    ldi16 r4, 0x7113
    push16 r4
    ldi16 r4, 0x835c
    push16 r4
    ldi16 r4, 0x95a5
    push16 r4
    ldi16 r4, 0xa7ee
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0xcc80
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r6, r0 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r6,r1; dividend=0x0001, divisor=0x0001.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x4dbe
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x7250
    push16 r4
    ldi16 r4, 0x8499
    push16 r4
    ldi16 r4, 0x96e2
    push16 r4
    ldi16 r4, 0xa92b
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0xcdbd
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r6, r1 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r6,r2; dividend=0x0001, divisor=0x0002.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x4efb
    push16 r4
    ldi16 r4, 0x6144
    push16 r4
    ldi16 r4, 0x0002
    push16 r4
    ldi16 r4, 0x85d6
    push16 r4
    ldi16 r4, 0x981f
    push16 r4
    ldi16 r4, 0xaa68
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0xcefa
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r6, r2 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r6,r3; dividend=0x0002, divisor=0x0001.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x5038
    push16 r4
    ldi16 r4, 0x6281
    push16 r4
    ldi16 r4, 0x74ca
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x995c
    push16 r4
    ldi16 r4, 0xaba5
    push16 r4
    ldi16 r4, 0x0002
    push16 r4
    ldi16 r4, 0xd037
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r6, r3 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r6,r4; dividend=0x1234, divisor=0x0011.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x5175
    push16 r4
    ldi16 r4, 0x63be
    push16 r4
    ldi16 r4, 0x7607
    push16 r4
    ldi16 r4, 0x8850
    push16 r4
    ldi16 r4, 0x0011
    push16 r4
    ldi16 r4, 0xace2
    push16 r4
    ldi16 r4, 0x1234
    push16 r4
    ldi16 r4, 0xd174
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r6, r4 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r6,r5; dividend=0xFFFF, divisor=0x00FF.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x52b2
    push16 r4
    ldi16 r4, 0x64fb
    push16 r4
    ldi16 r4, 0x7744
    push16 r4
    ldi16 r4, 0x898d
    push16 r4
    ldi16 r4, 0x9bd6
    push16 r4
    ldi16 r4, 0x00ff
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0xd2b1
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r6, r5 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r6,r6; dividend=0x1234, divisor=0x1234.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x53ef
    push16 r4
    ldi16 r4, 0x6638
    push16 r4
    ldi16 r4, 0x7881
    push16 r4
    ldi16 r4, 0x8aca
    push16 r4
    ldi16 r4, 0x9d13
    push16 r4
    ldi16 r4, 0xaf5c
    push16 r4
    ldi16 r4, 0x1234
    push16 r4
    ldi16 r4, 0xd3ee
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r6, r6 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r6,r7; dividend=0xFFFF, divisor=0xFFFF.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x552c
    push16 r4
    ldi16 r4, 0x6775
    push16 r4
    ldi16 r4, 0x79be
    push16 r4
    ldi16 r4, 0x8c07
    push16 r4
    ldi16 r4, 0x9e50
    push16 r4
    ldi16 r4, 0xb099
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r6, r7 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r7,r0; dividend=0xA5A5, divisor=0x0000.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x68b2
    push16 r4
    ldi16 r4, 0x7afb
    push16 r4
    ldi16 r4, 0x8d44
    push16 r4
    ldi16 r4, 0x9f8d
    push16 r4
    ldi16 r4, 0xb1d6
    push16 r4
    ldi16 r4, 0xc41f
    push16 r4
    ldi16 r4, 0xa5a5
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r7, r0 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r7,r1; dividend=0x0000, divisor=0x0000.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x57a6
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x7c38
    push16 r4
    ldi16 r4, 0x8e81
    push16 r4
    ldi16 r4, 0xa0ca
    push16 r4
    ldi16 r4, 0xb313
    push16 r4
    ldi16 r4, 0xc55c
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r7, r1 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r7,r2; dividend=0xFFFE, divisor=0x0002.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x58e3
    push16 r4
    ldi16 r4, 0x6b2c
    push16 r4
    ldi16 r4, 0x0002
    push16 r4
    ldi16 r4, 0x8fbe
    push16 r4
    ldi16 r4, 0xa207
    push16 r4
    ldi16 r4, 0xb450
    push16 r4
    ldi16 r4, 0xc699
    push16 r4
    ldi16 r4, 0xfffe
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r7, r2 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r7,r3; dividend=0x8001, divisor=0x7FFF.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x5a20
    push16 r4
    ldi16 r4, 0x6c69
    push16 r4
    ldi16 r4, 0x7eb2
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    ldi16 r4, 0xa344
    push16 r4
    ldi16 r4, 0xb58d
    push16 r4
    ldi16 r4, 0xc7d6
    push16 r4
    ldi16 r4, 0x8001
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r7, r3 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r7,r4; dividend=0x7FFF, divisor=0x8000.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x5b5d
    push16 r4
    ldi16 r4, 0x6da6
    push16 r4
    ldi16 r4, 0x7fef
    push16 r4
    ldi16 r4, 0x9238
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0xb6ca
    push16 r4
    ldi16 r4, 0xc913
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r7, r4 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r7,r5; dividend=0xFEDC, divisor=0x0123.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x5c9a
    push16 r4
    ldi16 r4, 0x6ee3
    push16 r4
    ldi16 r4, 0x812c
    push16 r4
    ldi16 r4, 0x9375
    push16 r4
    ldi16 r4, 0xa5be
    push16 r4
    ldi16 r4, 0x0123
    push16 r4
    ldi16 r4, 0xca50
    push16 r4
    ldi16 r4, 0xfedc
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r7, r5 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r7,r6; dividend=0x0100, divisor=0x0010.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x5dd7
    push16 r4
    ldi16 r4, 0x7020
    push16 r4
    ldi16 r4, 0x8269
    push16 r4
    ldi16 r4, 0x94b2
    push16 r4
    ldi16 r4, 0xa6fb
    push16 r4
    ldi16 r4, 0xb944
    push16 r4
    ldi16 r4, 0x0010
    push16 r4
    ldi16 r4, 0x0100
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r7, r6 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; encoding matrix: urem16 r7,r7; dividend=0xA5A5, divisor=0xA5A5.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x5f14
    push16 r4
    ldi16 r4, 0x715d
    push16 r4
    ldi16 r4, 0x83a6
    push16 r4
    ldi16 r4, 0x95ef
    push16 r4
    ldi16 r4, 0xa838
    push16 r4
    ldi16 r4, 0xba81
    push16 r4
    ldi16 r4, 0xccca
    push16 r4
    ldi16 r4, 0xa5a5
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r7, r7 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; semantic edge: urem16 r0,r1; dividend=0x0000, divisor=0x0000.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0x84e3
    push16 r4
    ldi16 r4, 0x972c
    push16 r4
    ldi16 r4, 0xa975
    push16 r4
    ldi16 r4, 0xbbbe
    push16 r4
    ldi16 r4, 0xce07
    push16 r4
    ldi16 r4, 0xe050
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r0, r1 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; semantic edge: urem16 r1,r4; dividend=0x1234, divisor=0x0000.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x618e
    push16 r4
    ldi16 r4, 0x1234
    push16 r4
    ldi16 r4, 0x8620
    push16 r4
    ldi16 r4, 0x9869
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0xbcfb
    push16 r4
    ldi16 r4, 0xcf44
    push16 r4
    ldi16 r4, 0xe18d
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r1, r4 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; semantic edge: urem16 r2,r7; dividend=0xFFFF, divisor=0x0000.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x62cb
    push16 r4
    ldi16 r4, 0x7514
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x99a6
    push16 r4
    ldi16 r4, 0xabef
    push16 r4
    ldi16 r4, 0xbe38
    push16 r4
    ldi16 r4, 0xd081
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r2, r7 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; semantic edge: urem16 r3,r2; dividend=0x0000, divisor=0x0001.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x6408
    push16 r4
    ldi16 r4, 0x7651
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x0000
    push16 r4
    ldi16 r4, 0xad2c
    push16 r4
    ldi16 r4, 0xbf75
    push16 r4
    ldi16 r4, 0xd1be
    push16 r4
    ldi16 r4, 0xe407
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r3, r2 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; semantic edge: urem16 r4,r5; dividend=0x0001, divisor=0x0001.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x6545
    push16 r4
    ldi16 r4, 0x778e
    push16 r4
    ldi16 r4, 0x89d7
    push16 r4
    ldi16 r4, 0x9c20
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0xd2fb
    push16 r4
    ldi16 r4, 0xe544
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r4, r5 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; semantic edge: urem16 r5,r0; dividend=0xFFFF, divisor=0x0001.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x78cb
    push16 r4
    ldi16 r4, 0x8b14
    push16 r4
    ldi16 r4, 0x9d5d
    push16 r4
    ldi16 r4, 0xafa6
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0xd438
    push16 r4
    ldi16 r4, 0xe681
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r5, r0 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; semantic edge: urem16 r6,r3; dividend=0x0001, divisor=0x0002.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x67bf
    push16 r4
    ldi16 r4, 0x7a08
    push16 r4
    ldi16 r4, 0x8c51
    push16 r4
    ldi16 r4, 0x0002
    push16 r4
    ldi16 r4, 0xb0e3
    push16 r4
    ldi16 r4, 0xc32c
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0xe7be
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r6, r3 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; semantic edge: urem16 r7,r6; dividend=0x0002, divisor=0x0001.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x68fc
    push16 r4
    ldi16 r4, 0x7b45
    push16 r4
    ldi16 r4, 0x8d8e
    push16 r4
    ldi16 r4, 0x9fd7
    push16 r4
    ldi16 r4, 0xb220
    push16 r4
    ldi16 r4, 0xc469
    push16 r4
    ldi16 r4, 0x0001
    push16 r4
    ldi16 r4, 0x0002
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r7, r6 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; semantic edge: urem16 r0,r1; dividend=0xFFFF, divisor=0xFFFF.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x8ecb
    push16 r4
    ldi16 r4, 0xa114
    push16 r4
    ldi16 r4, 0xb35d
    push16 r4
    ldi16 r4, 0xc5a6
    push16 r4
    ldi16 r4, 0xd7ef
    push16 r4
    ldi16 r4, 0xea38
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r0, r1 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; semantic edge: urem16 r1,r4; dividend=0xFFFF, divisor=0x0100.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x6b76
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0x9008
    push16 r4
    ldi16 r4, 0xa251
    push16 r4
    ldi16 r4, 0x0100
    push16 r4
    ldi16 r4, 0xc6e3
    push16 r4
    ldi16 r4, 0xd92c
    push16 r4
    ldi16 r4, 0xeb75
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r1, r4 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; semantic edge: urem16 r2,r7; dividend=0x8000, divisor=0x0003.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x6cb3
    push16 r4
    ldi16 r4, 0x7efc
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0xa38e
    push16 r4
    ldi16 r4, 0xb5d7
    push16 r4
    ldi16 r4, 0xc820
    push16 r4
    ldi16 r4, 0xda69
    push16 r4
    ldi16 r4, 0x0003
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r2, r7 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; semantic edge: urem16 r3,r2; dividend=0x8001, divisor=0x7FFF.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x6df0
    push16 r4
    ldi16 r4, 0x8039
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    ldi16 r4, 0x8001
    push16 r4
    ldi16 r4, 0xb714
    push16 r4
    ldi16 r4, 0xc95d
    push16 r4
    ldi16 r4, 0xdba6
    push16 r4
    ldi16 r4, 0xedef
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r3, r2 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; semantic edge: urem16 r4,r5; dividend=0x7FFF, divisor=0x8000.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x0001
    ldi16 r7, 0x0002
    cmp r6, r7
    ldi16 r4, 0x6f2d
    push16 r4
    ldi16 r4, 0x8176
    push16 r4
    ldi16 r4, 0x93bf
    push16 r4
    ldi16 r4, 0xa608
    push16 r4
    ldi16 r4, 0x7fff
    push16 r4
    ldi16 r4, 0x8000
    push16 r4
    ldi16 r4, 0xdce3
    push16 r4
    ldi16 r4, 0xef2c
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r4, r5 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; semantic edge: urem16 r5,r0; dividend=0xFFFE, divisor=0x0002.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x1357
    ldi16 r7, 0x1357
    cmp r6, r7
    ldi16 r4, 0x0002
    push16 r4
    ldi16 r4, 0x82b3
    push16 r4
    ldi16 r4, 0x94fc
    push16 r4
    ldi16 r4, 0xa745
    push16 r4
    ldi16 r4, 0xb98e
    push16 r4
    ldi16 r4, 0xfffe
    push16 r4
    ldi16 r4, 0xde20
    push16 r4
    ldi16 r4, 0xf069
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r5, r0 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; semantic edge: urem16 r6,r3; dividend=0xFFFF, divisor=0x0002.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x7fff
    ldi16 r7, 0x8000
    cmp r6, r7
    ldi16 r4, 0x71a7
    push16 r4
    ldi16 r4, 0x83f0
    push16 r4
    ldi16 r4, 0x9639
    push16 r4
    ldi16 r4, 0x0002
    push16 r4
    ldi16 r4, 0xbacb
    push16 r4
    ldi16 r4, 0xcd14
    push16 r4
    ldi16 r4, 0xffff
    push16 r4
    ldi16 r4, 0xf1a6
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r6, r3 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    ; semantic edge: urem16 r7,r6; dividend=0x1234, divisor=0x0011.
    ldi16 r4, 0x09f0
    setsp r4
    ldi16 r6, 0x8000
    ldi16 r7, 0x7fff
    cmp r6, r7
    ldi16 r4, 0x72e4
    push16 r4
    ldi16 r4, 0x852d
    push16 r4
    ldi16 r4, 0x9776
    push16 r4
    ldi16 r4, 0xa9bf
    push16 r4
    ldi16 r4, 0xbc08
    push16 r4
    ldi16 r4, 0xce51
    push16 r4
    ldi16 r4, 0x0011
    push16 r4
    ldi16 r4, 0x1234
    push16 r4
    pop16 r7
    pop16 r6
    pop16 r5
    pop16 r4
    pop16 r3
    pop16 r2
    pop16 r1
    pop16 r0
    urem16 r7, r6 ; TEST
    push16 r7
    push16 r6
    push16 r5
    push16 r4
    push16 r3
    push16 r2
    push16 r1
    push16 r0
    getsp r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    pop16 r0
    call divrem_print_r0_line
    call divrem_print_flags

    sys debug_break

.size _start, .-_start
