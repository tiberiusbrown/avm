.include "tests/asm/test_helpers.inc"
.section .text,"ax",@progbits
.globl _start
.type _start, @function
.p2align 1

; Copy any architectural register through r4/c0 before using print_reg16.
; print_reg16 intentionally clobbers all compact registers.
.macro print_any16 reg
    mov16 r4, \reg
    print_reg16 c0
.endm

; Verify that a condition-code-preserving instruction retained C=1, Z=0, S=0.
; Materialize the conditions before printing because print_reg16 changes CC.
.macro print_preserved_cc
    cset r1, ult
    cset r2, ne
    cset r3, sge
    print_any16 r1
    print_any16 r2
    print_any16 r3
.endm

.macro test_asr8 reg, value
    ldi16 \reg, \value
    asr8 \reg
    print_any16 \reg
.endm

_start:
    ; Each case uses a nonzero high byte to verify that ASR8 changes only bN.
    test_asr8 r0, 0x1200
    test_asr8 r1, 0x3401
    test_asr8 r2, 0x567f
    test_asr8 r3, 0x7880
    test_asr8 r4, 0x9a81
    test_asr8 r5, 0xbcfe
    test_asr8 r6, 0xdeff
    test_asr8 r7, 0xf040

    ; ASR8 preserves AVM CC.
    ldi8 c0, 1
    ldi8 c1, 0xff
    sext8 c1
    cmp16 c0, c1
    asr8 r0
    print_preserved_cc

    sys 1

.size _start, .-_start
