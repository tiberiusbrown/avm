.include "tests/asm/test_helpers.inc"
.section .text,"ax",@progbits
.globl _start
.type _start, @function
.p2align 1

; Emit an E3 instruction directly. The interpreter implements this page before
; the assembler exposes mnemonic syntax for it.
.macro e3 secondary
    .byte 0xe3, \secondary
.endm

.macro test_cset_equal secondary, dst
    ldi8 c0, 5
    ldi8 c1, 5
    cmp16 c0, c1
    e3 \secondary
    print_reg16 \dst
.endm

.macro test_cset_signed_negative secondary, dst
    ldi8 c0, 1
    neg16 c0                  ; 0xffff: unsigned greater, signed less
    ldi8 c1, 1
    cmp16 c0, c1
    e3 \secondary
    print_reg16 \dst
.endm

_start:
    ; 00dddsss: MOV16 across the compact/noncompact boundary and with aliased
    ; operands. c0-c3 are architectural r4-r7.
    ldi8 c0, 0xab
    e3 0x04                   ; mov16 r0, r4
    e3 0x20                   ; mov16 r4, r0
    print_reg16 c0

    ldi8 c1, 0xcd
    e3 0x2d                   ; mov16 r5, r5
    print_reg16 c1

    ; 01dddsss: MOV8Z clears the high byte, including when the operands alias.
    ldi8 c0, 0x80
    e3 0x4c                   ; mov8z r1, b4
    e3 0x21                   ; mov16 r4, r1
    print_reg16 c0

    ldi8 c0, 0x80
    e3 0x64                   ; mov8z r4, b4
    print_reg16 c0

    ; 10dddsss: MOV8S extends both negative and positive low-byte values.
    ldi8 c0, 0x80
    e3 0x94                   ; mov8s r2, b4
    e3 0x22                   ; mov16 r4, r2
    print_reg16 c0

    ldi8 c1, 0x7f
    e3 0xad                   ; mov8s r5, b5
    print_reg16 c1

    ; 11cccddd: exercise every condition on equal operands. Destinations span
    ; all four compact registers, covering both zero and one materialization.
    test_cset_equal 0xc4, c0  ; eq
    test_cset_equal 0xcd, c1  ; ne
    test_cset_equal 0xd6, c2  ; ult
    test_cset_equal 0xdf, c3  ; uge
    test_cset_equal 0xe4, c0  ; slt
    test_cset_equal 0xed, c1  ; sge
    test_cset_equal 0xf6, c2  ; ule
    test_cset_equal 0xff, c3  ; ugt

    ; Repeat every condition where unsigned and signed ordering disagree.
    test_cset_signed_negative 0xc4, c0
    test_cset_signed_negative 0xcd, c1
    test_cset_signed_negative 0xd6, c2
    test_cset_signed_negative 0xdf, c3
    test_cset_signed_negative 0xe4, c0
    test_cset_signed_negative 0xed, c1
    test_cset_signed_negative 0xf6, c2
    test_cset_signed_negative 0xff, c3

    sys 1

.size _start, .-_start
