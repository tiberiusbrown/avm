.include "tests/asm/test_helpers.inc"

.section .text,"ax",@progbits
.globl _start
.type _start, @function
.p2align 1

.macro print_any16 reg
    mov16 c0, \reg
    print_reg16 c0
.endm

.macro print_q low, high
    ; print_reg16 uses all compact registers as scratch. Capture both halves
    ; in noncompact registers before the first print so q2/q3 remain observable.
    mov16 r0, \low
    mov16 r1, \high
    print_any16 r0
    print_any16 r1
.endm

.macro establish_cc
    ; C=1, Z=0, S=0
    ldi16 c1, 0x0001
    ldi16 c2, 0xffff
    cmp16 c1, c2
.endm

.macro print_preserved_cc
    cset r0, ult
    cset r1, ne
    cset r2, sge
    print_any16 r0
    print_any16 r1
    print_any16 r2
.endm


_start:
    ; Simple addition.
    ldi16 r0, 0x0001
    ldi16 r1, 0x0000
    ldi16 r2, 0x0002
    ldi16 r3, 0x0000
    add32 q0, q1
    print_q r0, r1

    ; Carry from the low 16-bit register into the high register.
    ldi16 r2, 0xffff
    ldi16 r3, 0x0000
    ldi16 r4, 0x0001
    ldi16 r5, 0x0000
    add32 q1, q2
    print_q r2, r3

    ; Complete 32-bit wraparound.
    ldi16 r4, 0xffff
    ldi16 r5, 0xffff
    ldi16 r6, 0x0001
    ldi16 r7, 0x0000
    add32 q2, q3
    print_q r4, r5

    ; Carry into the sign bit.
    ldi16 r6, 0xffff
    ldi16 r7, 0x7fff
    ldi16 r0, 0x0001
    ldi16 r1, 0x0000
    add32 q3, q0
    print_q r6, r7

    ; Aliasing: doubling in place.
    ldi16 r0, 0x5678
    ldi16 r1, 0x1234
    add32 q0, q0
    print_q r0, r1

    ; Another destination/source combination.
    ldi16 r6, 0x2222
    ldi16 r7, 0x1111
    ldi16 r4, 0x4444
    ldi16 r5, 0x3333
    add32 q3, q2
    print_q r6, r7

    ; ADD32 preserves architectural CC.
    ldi16 r0, 0x1111
    ldi16 r1, 0x2222
    ldi16 r2, 0x3333
    ldi16 r3, 0x4444
    establish_cc
    add32 q0, q1
    print_preserved_cc

    sys 1

.size _start, .-_start
