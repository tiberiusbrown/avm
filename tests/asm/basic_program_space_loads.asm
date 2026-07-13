.include "tests/asm/test_helpers.inc"

; Program-space test bytes. The backend resolves the bank and low 16 bits
; through prog_hi8()/prog_lo16(), so the test does not depend on linker
; placement of .rodata.
.section .rodata,"a",@progbits
.p2align 0
ldp_test_data:
    .byte 0xd3, 0x5a, 0xc7, 0x80
    .byte 0x01, 0xfe, 0x34, 0x12
    .byte 0xab, 0xcd, 0x7e, 0xff
    .byte 0x67, 0x45, 0x23, 0x01

.section .text,"ax",@progbits
.globl _start
.type _start, @function
.p2align 1

; print_reg16 operates on a compact register. Copy an arbitrary architectural
; register through A/c0 before printing it.
.macro print_any16 reg
    mov16 c0, \reg
    print_reg16 c0
.endm

; Establish C=1, Z=0, S=0. The new instructions must preserve all three
; architectural condition bits.
.macro establish_cc
    ldi16 c1, 0x0001
    ldi16 c2, 0xffff
    cmp16 c1, c2
.endm

; Materialize ULT, NE, and SGE before the print helper can affect native SREG.
; With the condition state established above, each result must be one.
.macro print_preserved_cc
    cset r0, ult
    cset r1, ne
    cset r2, sge
    print_any16 r0
    print_any16 r1
    print_any16 r2
.endm

; Verify that a non-aliasing LDP operation preserved its address register.
; r5 holds the address captured immediately before the operation.
; Compare the current address against the saved copy and materialize the
; result before any print helper runs. print_reg16 may use every compact
; register as scratch, but it preserves noncompact r0-r3.
.macro capture_address_preserved result
    cmp16 r6, r5
    cset \result, eq
.endm

_start:
    ; E8: LDPBI imm8. Verify that the complete immediate is installed in PB.
    ldpbi 0x5a
    mfpb r0
    print_any16 r0

    ; All remaining program-space reads use the linked .rodata symbol.
    ldpbi prog_hi8(ldp_test_data)

    ; FD 80: LDP8 rD,[PB:rA].
    ; Seed a nonzero high byte to verify zero extension.
    ldi16 r0, 0xffff
    ldi16 r6, prog_lo16(ldp_test_data)
    mov16 r5, r6
    ldp8 r0, [pb:r6]
    capture_address_preserved r3
    print_any16 r0                 ; 0x00d3
    print_any16 r3                 ; address preserved

    ; FD 81: LDP16 rD,[PB:rA], little-endian.
    ldi16 r6, prog_lo16(ldp_test_data)
    addi16 r6, 1
    mov16 r5, r6
    ldp16 r1, [pb:r6]
    capture_address_preserved r3
    print_any16 r1                 ; bytes 5a c7 -> 0xc75a
    print_any16 r3                 ; address preserved

    ; FD 82: positive displaced LDP8.
    ldi16 r6, prog_lo16(ldp_test_data)
    mov16 r5, r6
    ldp8 r2, [pb:r6 + 4]
    capture_address_preserved r3
    print_any16 r2                 ; byte 01 -> 0x0001
    print_any16 r3                 ; address preserved

    ; FD 83: positive displaced LDP16.
    ldi16 r6, prog_lo16(ldp_test_data)
    mov16 r5, r6
    ldp16 r3, [pb:r6 + 6]
    capture_address_preserved r0
    print_any16 r3                 ; bytes 34 12 -> 0x1234
    print_any16 r0                 ; address preserved

    ; Negative displacements exercise sign extension and subtraction.
    ldi16 r6, prog_lo16(ldp_test_data)
    addi16 r6, 8
    mov16 r5, r6
    ldp8 r0, [pb:r6 - 3]
    capture_address_preserved r3
    print_any16 r0                 ; byte fe -> 0x00fe
    print_any16 r3                 ; address preserved

    ldi16 r6, prog_lo16(ldp_test_data)
    addi16 r6, 9
    mov16 r5, r6
    ldp16 r1, [pb:r6 - 2]
    capture_address_preserved r3
    print_any16 r1                 ; bytes 12 ab -> 0xab12
    print_any16 r3                 ; address preserved

    ; Destination/address aliasing: the implementation must capture the source
    ; address before writing the result register.
    ldi16 r6, prog_lo16(ldp_test_data)
    addi16 r6, 10
    ldp8 r6, [pb:r6]
    print_any16 r6                 ; byte 7e -> 0x007e

    ldi16 r6, prog_lo16(ldp_test_data)
    addi16 r6, 11
    ldp16 r6, [pb:r6]
    print_any16 r6                 ; bytes ff 67 -> 0x67ff

    ; LDPBI preserves AVM CC.
    establish_cc
    ldpbi prog_hi8(ldp_test_data)
    print_preserved_cc

    ; Direct LDP8 preserves AVM CC.
    ldi16 r6, prog_lo16(ldp_test_data)
    establish_cc
    ldp8 r3, [pb:r6]
    print_preserved_cc

    ; Direct LDP16 preserves AVM CC.
    ldi16 r6, prog_lo16(ldp_test_data)
    addi16 r6, 1
    establish_cc
    ldp16 r3, [pb:r6]
    print_preserved_cc

    ; Displaced LDP8 preserves AVM CC.
    ldi16 r6, prog_lo16(ldp_test_data)
    addi16 r6, 8
    establish_cc
    ldp8 r3, [pb:r6 - 3]
    print_preserved_cc

    ; Displaced LDP16 preserves AVM CC.
    ldi16 r6, prog_lo16(ldp_test_data)
    addi16 r6, 9
    establish_cc
    ldp16 r3, [pb:r6 - 2]
    print_preserved_cc

    sys 1

.size _start, .-_start
