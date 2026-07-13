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


.macro print_cmp_cc
    ; print_reg16 changes AVM CC. Materialize every predicate first and save
    ; the results on the VM stack. Push in reverse order so POP emits:
    ; EQ, NE, ULT, UGE, SLT, SGE, ULE, UGT.
    cset r0, ugt
    push16 r0
    cset r0, ule
    push16 r0
    cset r0, sge
    push16 r0
    cset r0, slt
    push16 r0
    cset r0, uge
    push16 r0
    cset r0, ult
    push16 r0
    cset r0, ne
    push16 r0
    cset r0, eq
    push16 r0

    .rept 8
        pop16 r0
        print_any16 r0
    .endr
.endm

_start:
    ; Equal values.
    ldi16 r0, 0x5678
    ldi16 r1, 0x1234
    ldi16 r2, 0x5678
    ldi16 r3, 0x1234
    cmp32 q0, q1
    print_cmp_cc

    ; Unsigned less, but signed greater: 1 < 0xffffffff unsigned only.
    ldi16 r2, 0x0001
    ldi16 r3, 0x0000
    ldi16 r4, 0xffff
    ldi16 r5, 0xffff
    cmp32 q1, q2
    print_cmp_cc

    ; Signed less, but unsigned greater: 0xffffffff < 1 signed only.
    ldi16 r4, 0xffff
    ldi16 r5, 0xffff
    ldi16 r6, 0x0001
    ldi16 r7, 0x0000
    cmp32 q2, q3
    print_cmp_cc

    ; Unsigned less, but signed greater across the sign boundary.
    ldi16 r6, 0xffff
    ldi16 r7, 0x7fff
    ldi16 r0, 0x0000
    ldi16 r1, 0x8000
    cmp32 q3, q0
    print_cmp_cc

    ; Signed less, but unsigned greater across the sign boundary.
    ldi16 r0, 0x0000
    ldi16 r1, 0x8000
    ldi16 r6, 0xffff
    ldi16 r7, 0x7fff
    cmp32 q0, q3
    print_cmp_cc

    ; Aliasing must compare equal.
    ldi16 r4, 0xbeef
    ldi16 r5, 0xdead
    cmp32 q2, q2
    print_cmp_cc

    sys 1

.size _start, .-_start
