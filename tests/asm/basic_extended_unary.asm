.section .text,"ax",@progbits
.globl _start
.type _start, @function
.p2align 1

_start:
    ldi8 c0, 0x0F
    ldi8 c1, 0x80
    ldi8 c2, 0x55
    ldi8 c3, 0x01
    not16 r0
    not16 r1
    not16 r2
    not16 r3
    not16 r4
    not16 r5
    not16 r6
    not16 r7
    ldi8 c0, 0xB0
    neg16 c0
    sys 0
    neg16 r0
    neg16 r1
    neg16 r2
    neg16 r3
    neg16 r4
    neg16 r5
    neg16 r6
    neg16 r7
    ldi8 c0, 'G'
    sys 0
    zext8 r0
    zext8 r1
    zext8 r2
    zext8 r3
    zext8 r4
    zext8 r5
    zext8 r6
    zext8 r7
    ldi8 c0, 'A'
    zext8 c0
    sys 0
    sext8 r0
    sext8 r1
    sext8 r2
    sext8 r3
    sext8 r4
    sext8 r5
    sext8 r6
    sext8 r7
    ldi8 c0, 'A'
    sext8 c0
    sys 0
    swap8 r0
    swap8 r1
    swap8 r2
    swap8 r3
    swap8 r4
    swap8 r5
    swap8 r6
    swap8 r7
    ldi8 c0, 0x12
    swap8 c0
    sys 0
    getsp r0
    getsp r1
    getsp r2
    getsp r3
    getsp r4
    getsp r5
    getsp r6
    getsp r7
    setsp r7
    getsp c0
    dec16 c0
    setsp c0
    getsp c1
    cmp16 c1, c0
    brne stack_pointer_bad
    ldi8 c0, 'P'
    sys 0
stack_pointer_bad:
    inc16 c1
    setsp c1
    sys 0
    nop
    ldi8 c0, 'O'
    sys 0
    sys 1

.size _start, .-_start
