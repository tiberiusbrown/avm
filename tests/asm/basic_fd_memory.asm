.include "tests/asm/test_helpers.inc"
.section .text,"ax",@progbits
.globl _start
.type _start, @function
.p2align 1

; Produce a stable scratch address at 0x09e0 from the initial VM SP (0x0a00).
.macro scratch_addr
    getsp c3
    .rept 32
        dec16 c3
    .endr
.endm

_start:
    ; FD 00/01: generic indirect byte store/load. Seed a noncompact address
    ; register through the direct-memory forms so assembly selects FD rather
    ; than the one-byte compact instruction.
    scratch_addr
    stm16 0x09d0, c3
    ldm16 r1, 0x09d0
    ldi8 c0, 0xab
    st8 [r1], c0
    ld8 c1, [r1]
    print_reg16 c1

    ; FD 02/03: generic indirect word store/load.
    scratch_addr
    stm16 0x09d0, c3
    ldm16 r1, 0x09d0
    ldi8 c0, 0xcd
    st16 [r1], c0
    ld16 c1, [r1]
    print_reg16 c1

    ; FD 04/05: postincrement byte forms update the address by one.
    scratch_addr
    ldi8 c0, 0xab
    st8 [c3]+, c0
    print_reg16 c3
    scratch_addr
    ld8 c1, [c3]+
    print_reg16 c1
    scratch_addr
    ld8 c1, [c3]+
    print_reg16 c3

    ; FD 06/07: postincrement word forms update the address by two.
    scratch_addr
    ldi8 c0, 0xcd
    st16 [c3]+, c0
    print_reg16 c3
    scratch_addr
    ld16 c1, [c3]+
    print_reg16 c1
    scratch_addr
    ld16 c1, [c3]+
    print_reg16 c3

    ; FD 08-0C: LEA and positive/negative signed displacements.
    scratch_addr
    ldi8 c0, 0xab
    st8 [c3+5], c0
    ld8 c1, [c3+5]
    print_reg16 c1

    scratch_addr
    ldi8 c0, 0xcd
    st16 [c3-1], c0
    ld16 c1, [c3-1]
    print_reg16 c1

    scratch_addr
    lea c1, [c3+5]
    print_reg16 c1

    ; FD 10-2F: unsigned stack-relative byte and word forms.
    adjsp -16
    ldi8 c0, 0xab
    stsp8 [sp+3], c0
    ldsp8 c1, [sp+3]
    print_reg16 c1

    ldi8 c0, 0xcd
    stsp16 [sp+6], c0
    ldsp16 c1, [sp+6]
    print_reg16 c1
    adjsp 16

    ; FD 30-4F: absolute data-space byte and word forms.
    ldi8 c0, 0xab
    stm8 0x09e0, c0
    ldm8 c1, 0x09e0
    print_reg16 c1

    ldi8 c0, 0xcd
    stm16 0x09e0, c0
    ldm16 c1, 0x09e0
    print_reg16 c1

    sys 1

.size _start, .-_start
