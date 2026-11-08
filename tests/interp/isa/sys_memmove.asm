; Functional test for SYS 0x12: memmove(void *dst, const void *src, uint16_t n).
;
; Each case emits its identifying letter on success or 'X' on failure.
; Expected output: ABCDEF\n
;
; The test verifies:
;   A  n == 0 leaves memory unchanged.
;   B  dst == src returns immediately without changing the range.
;   C  dst < src, non-overlapping copy (shared memcpy forward loop).
;   D  dst < src, overlapping copy (forward direction required).
;   E  dst > src, overlapping copy (backward direction required).
;   F  dst > src, non-overlapping copy (shared memcpy forward loop).
;
; Every case also checks the returned r4 value, preserved r0-r3/r5-r7,
; preserved SP, and preserved C/Z/S condition bits.

.section .text,"ax",@progbits

.equ SAFE_SP, 0x09c0
.macro emit_char character
    ldi8 r4, \character
    sys debug_putc
.endm

.macro store_byte address, value
    ldi16 r4, \address
    ldi8  r5, \value
    st8   [r4], r5
.endm

.macro expect_byte address, value, fail
    ldi16 r4, \address
    ld8u  r7, [r4]
    ldi8  r4, \value
    cmp   r7, r4
    brne16 \fail
.endm

; Establish sentinels and C/Z/S = 0/0/1 respectively:
; unsigned(0x8000) >= unsigned(0x7fff), unequal, and
; signed(0x8000) < signed(0x7fff).
.macro prepare_state
    ldi16 r7, SAFE_SP
    setsp r7

    ldi16 r0, 0x8000
    ldi16 r1, 0x7fff
    ldi16 r2, 0x55aa
    ldi16 r3, 0x55aa
    ldi16 r7, 0x55aa
    cmp   r0, r1
.endm

; Must be invoked immediately after SYS, before any flag-producing instruction.
.macro expect_state dst, src, count, fail
    ; C/Z/S must still be 0/0/1.
    breq16  \fail
    brult16 \fail
    brsge16 \fail

    ; r2, r3, and r7 retain a common sentinel.
    cmp r2, r7
    brne16 \fail
    cmp r3, r7
    brne16 \fail

    ; SP is preserved.
    getsp r7
    ldi16 r2, SAFE_SP
    cmp r7, r2
    brne16 \fail

    ; r0-r1 retain their sentinels.
    ldi16 r7, 0x8000
    cmp r0, r7
    brne16 \fail
    ldi16 r7, 0x7fff
    cmp r1, r7
    brne16 \fail

    ; r4 is both the input destination and returned pointer. r5/r6 are inputs.
    ldi16 r7, \dst
    cmp r4, r7
    brne16 \fail
    ldi16 r7, \src
    cmp r5, r7
    brne16 \fail
    ldi16 r7, \count
    cmp r6, r7
    brne16 \fail
.endm

.globl _start
.type _start, @function
_start:

; -----------------------------------------------------------------------------
; A: zero length
; -----------------------------------------------------------------------------
    store_byte 0x0500, 0xa5

    prepare_state
    ldi16 r4, 0x0500
    ldi16 r5, 0x0520
    ldi16 r6, 0
    sys memmove

    expect_state 0x0500, 0x0520, 0, .Lcase_a_fail
    expect_byte  0x0500, 0xa5, .Lcase_a_fail

    emit_char 'A'
    jmp16 .Lcase_a_done
.Lcase_a_fail:
    emit_char 'X'
.Lcase_a_done:

; -----------------------------------------------------------------------------
; B: identical pointers
; -----------------------------------------------------------------------------
    store_byte 0x0510, 0x10
    store_byte 0x0511, 0x11
    store_byte 0x0512, 0x12
    store_byte 0x0513, 0x13
    store_byte 0x0514, 0x14
    store_byte 0x0515, 0x15
    store_byte 0x0516, 0x16
    store_byte 0x0517, 0x17

    prepare_state
    ldi16 r4, 0x0510
    ldi16 r5, 0x0510
    ldi16 r6, 8
    sys memmove

    expect_state 0x0510, 0x0510, 8, .Lcase_b_fail
    expect_byte 0x0510, 0x10, .Lcase_b_fail
    expect_byte 0x0511, 0x11, .Lcase_b_fail
    expect_byte 0x0512, 0x12, .Lcase_b_fail
    expect_byte 0x0513, 0x13, .Lcase_b_fail
    expect_byte 0x0514, 0x14, .Lcase_b_fail
    expect_byte 0x0515, 0x15, .Lcase_b_fail
    expect_byte 0x0516, 0x16, .Lcase_b_fail
    expect_byte 0x0517, 0x17, .Lcase_b_fail

    emit_char 'B'
    jmp16 .Lcase_b_done
.Lcase_b_fail:
    emit_char 'X'
.Lcase_b_done:

; -----------------------------------------------------------------------------
; C: dst < src, non-overlapping; forward into the memcpy loop
; -----------------------------------------------------------------------------
    store_byte 0x051f, 0xc1
    store_byte 0x0520, 0xee
    store_byte 0x0521, 0xee
    store_byte 0x0522, 0xee
    store_byte 0x0523, 0xee
    store_byte 0x0524, 0xee
    store_byte 0x0525, 0xee
    store_byte 0x0526, 0xee
    store_byte 0x0527, 0xee
    store_byte 0x0528, 0xc2

    store_byte 0x0530, 0x21
    store_byte 0x0531, 0x22
    store_byte 0x0532, 0x23
    store_byte 0x0533, 0x24
    store_byte 0x0534, 0x25
    store_byte 0x0535, 0x26
    store_byte 0x0536, 0x27
    store_byte 0x0537, 0x28

    prepare_state
    ldi16 r4, 0x0520
    ldi16 r5, 0x0530
    ldi16 r6, 8
    sys memmove

    expect_state 0x0520, 0x0530, 8, .Lcase_c_fail
    expect_byte 0x051f, 0xc1, .Lcase_c_fail
    expect_byte 0x0520, 0x21, .Lcase_c_fail
    expect_byte 0x0521, 0x22, .Lcase_c_fail
    expect_byte 0x0522, 0x23, .Lcase_c_fail
    expect_byte 0x0523, 0x24, .Lcase_c_fail
    expect_byte 0x0524, 0x25, .Lcase_c_fail
    expect_byte 0x0525, 0x26, .Lcase_c_fail
    expect_byte 0x0526, 0x27, .Lcase_c_fail
    expect_byte 0x0527, 0x28, .Lcase_c_fail
    expect_byte 0x0528, 0xc2, .Lcase_c_fail
    expect_byte 0x0530, 0x21, .Lcase_c_fail
    expect_byte 0x0537, 0x28, .Lcase_c_fail

    emit_char 'C'
    jmp16 .Lcase_c_done
.Lcase_c_fail:
    emit_char 'X'
.Lcase_c_done:

; -----------------------------------------------------------------------------
; D: dst < src with overlap; forward copy is required
; Initial:  00 01 02 03 04 05 06 07 08 09
; Expected: 02 03 04 05 06 07 08 09 08 09
; -----------------------------------------------------------------------------
    store_byte 0x0550, 0x00
    store_byte 0x0551, 0x01
    store_byte 0x0552, 0x02
    store_byte 0x0553, 0x03
    store_byte 0x0554, 0x04
    store_byte 0x0555, 0x05
    store_byte 0x0556, 0x06
    store_byte 0x0557, 0x07
    store_byte 0x0558, 0x08
    store_byte 0x0559, 0x09

    prepare_state
    ldi16 r4, 0x0550
    ldi16 r5, 0x0552
    ldi16 r6, 8
    sys memmove

    expect_state 0x0550, 0x0552, 8, .Lcase_d_fail
    expect_byte 0x0550, 0x02, .Lcase_d_fail
    expect_byte 0x0551, 0x03, .Lcase_d_fail
    expect_byte 0x0552, 0x04, .Lcase_d_fail
    expect_byte 0x0553, 0x05, .Lcase_d_fail
    expect_byte 0x0554, 0x06, .Lcase_d_fail
    expect_byte 0x0555, 0x07, .Lcase_d_fail
    expect_byte 0x0556, 0x08, .Lcase_d_fail
    expect_byte 0x0557, 0x09, .Lcase_d_fail
    expect_byte 0x0558, 0x08, .Lcase_d_fail
    expect_byte 0x0559, 0x09, .Lcase_d_fail

    emit_char 'D'
    jmp16 .Lcase_d_done
.Lcase_d_fail:
    emit_char 'X'
.Lcase_d_done:

; -----------------------------------------------------------------------------
; E: dst > src with overlap; backward copy is required
; Initial:  00 01 02 03 04 05 06 07 08 09
; Expected: 00 01 00 01 02 03 04 05 06 07
; -----------------------------------------------------------------------------
    store_byte 0x0570, 0x00
    store_byte 0x0571, 0x01
    store_byte 0x0572, 0x02
    store_byte 0x0573, 0x03
    store_byte 0x0574, 0x04
    store_byte 0x0575, 0x05
    store_byte 0x0576, 0x06
    store_byte 0x0577, 0x07
    store_byte 0x0578, 0x08
    store_byte 0x0579, 0x09

    prepare_state
    ldi16 r4, 0x0572
    ldi16 r5, 0x0570
    ldi16 r6, 8
    sys memmove

    expect_state 0x0572, 0x0570, 8, .Lcase_e_fail
    expect_byte 0x0570, 0x00, .Lcase_e_fail
    expect_byte 0x0571, 0x01, .Lcase_e_fail
    expect_byte 0x0572, 0x00, .Lcase_e_fail
    expect_byte 0x0573, 0x01, .Lcase_e_fail
    expect_byte 0x0574, 0x02, .Lcase_e_fail
    expect_byte 0x0575, 0x03, .Lcase_e_fail
    expect_byte 0x0576, 0x04, .Lcase_e_fail
    expect_byte 0x0577, 0x05, .Lcase_e_fail
    expect_byte 0x0578, 0x06, .Lcase_e_fail
    expect_byte 0x0579, 0x07, .Lcase_e_fail

    emit_char 'E'
    jmp16 .Lcase_e_done
.Lcase_e_fail:
    emit_char 'X'
.Lcase_e_done:

; -----------------------------------------------------------------------------
; F: dst > src, non-overlapping; delta >= n enters the memcpy forward loop
; -----------------------------------------------------------------------------
    store_byte 0x0590, 0x31
    store_byte 0x0591, 0x32
    store_byte 0x0592, 0x33
    store_byte 0x0593, 0x34
    store_byte 0x0594, 0x35
    store_byte 0x0595, 0x36
    store_byte 0x0596, 0x37
    store_byte 0x0597, 0x38

    store_byte 0x059f, 0xd1
    store_byte 0x05a0, 0xff
    store_byte 0x05a1, 0xff
    store_byte 0x05a2, 0xff
    store_byte 0x05a3, 0xff
    store_byte 0x05a4, 0xff
    store_byte 0x05a5, 0xff
    store_byte 0x05a6, 0xff
    store_byte 0x05a7, 0xff
    store_byte 0x05a8, 0xd2

    prepare_state
    ldi16 r4, 0x05a0
    ldi16 r5, 0x0590
    ldi16 r6, 8
    sys memmove

    expect_state 0x05a0, 0x0590, 8, .Lcase_f_fail
    expect_byte 0x0590, 0x31, .Lcase_f_fail
    expect_byte 0x0597, 0x38, .Lcase_f_fail
    expect_byte 0x059f, 0xd1, .Lcase_f_fail
    expect_byte 0x05a0, 0x31, .Lcase_f_fail
    expect_byte 0x05a1, 0x32, .Lcase_f_fail
    expect_byte 0x05a2, 0x33, .Lcase_f_fail
    expect_byte 0x05a3, 0x34, .Lcase_f_fail
    expect_byte 0x05a4, 0x35, .Lcase_f_fail
    expect_byte 0x05a5, 0x36, .Lcase_f_fail
    expect_byte 0x05a6, 0x37, .Lcase_f_fail
    expect_byte 0x05a7, 0x38, .Lcase_f_fail
    expect_byte 0x05a8, 0xd2, .Lcase_f_fail

    emit_char 'F'
    jmp16 .Lcase_f_done
.Lcase_f_fail:
    emit_char 'X'
.Lcase_f_done:

    emit_char '\n'
    sys debug_break
