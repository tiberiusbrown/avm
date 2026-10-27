; Native FF accelerators. The avr-libc notice at the top of interp.asm
; applies to the restoring sqrt and exponent-aligned remainder adaptations.
; No routine touches GPIOR0, Y, VM_PC, the interpreter constants, or SPI.
; The in-flight following opcode is consumed by the standard dispatch tail.
native_math_begin:
ff_sqrt:
    ldi   r30, lo8(pm(avm_sqrt))
    ldi   r31, hi8(pm(avm_sqrt))
    rjmp  ff_binary_fixed
ff_mod:
    ldi   r30, lo8(pm(avm_fmod))
    ldi   r31, hi8(pm(avm_fmod))
    rjmp  ff_binary_fixed

; Shared bit-level rounding. The shifted raw low 24 bits retain the low
; exponent bit, so an increment/shift reconstructs carries into the exponent.
; T retains the last discarded bit (the half-integer bit); r0 counts all
; discarded ones. Every finite result is exact; ties go away from zero.
native_round_begin:
ff_trunc:
    ldi   r25, 0
    rjmp  avm_round
ff_floor:
    ldi   r25, 1
    rjmp  avm_round
ff_ceil:
    ldi   r25, 2
    rjmp  avm_round
ff_round:
    ldi   r25, 3
avm_round:
    mov   r24, r18
    lsl   r24
    mov   r24, r19
    rol   r24
    cpi   r24, 150
    brsh  .Lround_done
    cpi   r24, 127
    brlo  .Lround_small
    neg   r24
    subi  r24, -150
    mov   r31, r24
    movw  r26, r16
    mov   r30, r18
    clr   r0
.Lround_right:
    bst   r26, 0
    lsr   r30
    ror   r27
    ror   r26
    adc   r0, ZERO
    dec   r31
    brne  .Lround_right
    tst   r0
    breq  .Lround_done
    cpi   r25, 3
    breq  .Lround_nearest
    cpi   r25, 1
    breq  .Lround_down
    cpi   r25, 2
    brne  .Lround_left
    sbrc  r19, 7
    rjmp  .Lround_left
    rjmp  .Lround_increment
.Lround_down:
    sbrs  r19, 7
    rjmp  .Lround_left
    rjmp  .Lround_increment
.Lround_nearest:
    brtc  .Lround_left
.Lround_increment:
    add   r26, ONE
    adc   r27, ZERO
    adc   r30, ZERO
.Lround_left:
    lsl   r26
    rol   r27
    rol   r30
    adc   r19, ZERO
    dec   r24
    brne  .Lround_left
    movw  r16, r26
    mov   r18, r30
.Lround_done:
    jmp   ff_cluster_tail_18
.Lround_small:
    mov   r26, r19
    andi  r26, 0x7f
    or    r26, r18
    or    r26, r17
    or    r26, r16
    breq  .Lround_done
    cpi   r25, 3
    breq  .Lround_small_nearest
    cpi   r25, 1
    breq  .Lround_small_down
    cpi   r25, 2
    brne  .Lround_zero
    sbrs  r19, 7
    rjmp  .Lround_one
    rjmp  .Lround_zero
.Lround_small_down:
    sbrc  r19, 7
    rjmp  .Lround_one
    rjmp  .Lround_zero
.Lround_small_nearest:
    cpi   r24, 126
    breq  .Lround_one
.Lround_zero:
    clr   r16
    clr   r17
    clr   r18
    andi  r19, 0x80
    rjmp  .Lround_done
.Lround_one:
    clr   r16
    clr   r17
    ldi   r18, 0x80
    andi  r19, 0x80
    ori   r19, 0x3f
    rjmp  .Lround_done
native_round_end:

; avr-libc restoring square root, size variant. All 24 bits and the rounding
; decision are developed from the exact remainder. Subnormals normalize with
; a signed 16-bit exponent. r1 is scratch here, not the ABI zero register.
native_sqrt_begin:
avm_sqrt:
    rcall __fp_splitA
    brcc  .Lsqrt_finite
    brne  .Lsqrt_pack
    brtc  .Lsqrt_pack
.Lsqrt_nan:
    rjmp  __fp_nan
.Lsqrt_pack:
    rjmp  __fp_mpack
.Lsqrt_finite:
    tst   r25
    breq  .Lsqrt_pack
    brts  .Lsqrt_nan
    subi  r25, 127
    sbc   r21, r21
    sbrs  r24, 7
    rcall avm_norm2
    clr   r0
    clr   r1
    ldi   r26, 0x60
    ldi   r20, 0xa0
    movw  r18, r0
    clr   r27
    subi  r24, 0x40
    lsr   r21
    ror   r25
    brcs  .Lsqrt_shift
    subi  r24, 0x40
.Lsqrt_loop:
    brcc  .Lsqrt_mask
    cp    r26, r27
    sbc   r22, r18
    sbc   r23, r19
    sbc   r24, r20
    or    r18, r0
    or    r19, r1
    or    r20, r26
.Lsqrt_mask:
    lsr   r26
    ror   r1
    ror   r0
    rol   r27
    eor   r18, r0
    eor   r19, r1
    eor   r20, r26
.Lsqrt_shift:
    lsl   r22
    rol   r23
    rol   r24
    brcs  .Lsqrt_test
    cp    r18, r22
    cpc   r19, r23
    cpc   r20, r24
.Lsqrt_test:
    sbrs  r27, 1
    rjmp  .Lsqrt_loop
    adc   r18, r1
    adc   r19, r1
    adc   r20, r1
    movw  r22, r18
    mov   r24, r20
    subi  r25, -127
    lsl   r24
    lsr   r25
    ror   r24
    ret
avm_norm2:
    subi  r25, 1
    sbci  r21, 0
    lsl   r22
    rol   r23
    rol   r24
    brpl  avm_norm2
    ret
native_sqrt_end:

; Exact normalized significand shift/subtract fmod (avr-libc fmod.S).
native_fmod_begin:
avm_fmod:
    mov   r30, r25
    rcall __fp_split3
    brcc  .Lmod_finite
    rcall __fp_pscA
    brcs  .Lmod_nan
    breq  .Lmod_nan
    rcall __fp_pscB
    brcc  .Lmod_sign
.Lmod_nan:
    rjmp  __fp_nan
.Lmod_zero:
    rjmp  __fp_szero
.Lmod_finite:
    tst   r21
    breq  .Lmod_nan
.Lmod_sign:
    bst   r30, 7
    cp    r22, r18
    cpc   r23, r19
    cpc   r24, r20
    cpc   r25, r21
    brlo  .Lmod_pack
    breq  .Lmod_zero
    mov   r30, r25
    clr   r31
    tst   r24
    brmi  .Lmod_norm_b
.Lmod_norm_a:
    sbiw  r30, 1
    lsl   r22
    rol   r23
    rol   r24
    brpl  .Lmod_norm_a
.Lmod_norm_b:
    mov   r25, r21
    clr   r21
    tst   r20
    brmi  .Lmod_prepare
.Lmod_norm_b_loop:
    subi  r25, 1
    sbci  r21, 0
    lsl   r18
    rol   r19
    rol   r20
    brpl  .Lmod_norm_b_loop
.Lmod_prepare:
    clr   r27
    sub   r30, r25
    sbc   r31, r21
.Lmod_loop:
    sub   r22, r18
    sbc   r23, r19
    sbc   r24, r20
    sbc   r27, ZERO
    breq  .Lmod_zero
    brpl  .Lmod_next
    add   r22, r18
    adc   r23, r19
    adc   r24, r20
    adc   r27, ZERO
.Lmod_next:
    sbiw  r30, 1
    brmi  .Lmod_normalize
    lsl   r22
    rol   r23
    rol   r24
    rol   r27
    rjmp  .Lmod_loop
.Lmod_normalize:
    subi  r25, 1
    sbci  r21, 0
    brmi  .Lmod_subnormal
    breq  .Lmod_bias
.Lmod_normalize_loop:
    tst   r24
    brmi  .Lmod_bias
    lsl   r22
    rol   r23
    rol   r24
    subi  r25, 1
    sbci  r21, 0
    brne  .Lmod_normalize_loop
.Lmod_bias:
    inc   r25
.Lmod_pack:
    rjmp  __fp_mpack
.Lmod_subnormal:
    lsr   r24
    ror   r23
    ror   r22
    subi  r25, -1
    brne  .Lmod_subnormal
    rjmp  .Lmod_bias
native_fmod_end:

; avr-libc __fp_rempio2's 32-bit significand (flt40_t) division, extended
; to the nearest multiple and signed modulo-four quotient. D=C90FDAA2/2^31.
; Native precision is intentionally bounded; the guest chooses its fallback.
native_rempio2_begin:
ff_rempio2:
    push  r22
    push  r23
    movw  r24, r18
    movw  r22, r16
    mov   r16, r25
    andi  r16, 0x80
    mov   r17, r16
    clr   r30
    rcall __fp_splitA
    brcc  .Lrem_finite
    clr   r20
    clr   r21
    rcall __fp_nan
    rjmp  .Lrem_store
.Lrem_finite:
    clr   r27
    cpi   r25, 126
    brlo  .Lrem_pack
    ldi   r18, 0xda
    ldi   r19, 0x0f
    ldi   r20, 0xc9
    subi  r25, 127
    brcc  .Lrem_compare
    lsr   r24
    ror   r23
    ror   r22
    ror   r27
    rjmp  .Lrem_nearest
.Lrem_loop:
    lsl   r30
    lsl   r27
    rol   r22
    rol   r23
    rol   r24
    brcs  .Lrem_subtract
.Lrem_compare:
    cpi   r27, 0xa2
    cpc   r22, r18
    cpc   r23, r19
    cpc   r24, r20
    brlo  .Lrem_next
.Lrem_subtract:
    subi  r27, 0xa2
    sbc   r22, r18
    sbc   r23, r19
    sbc   r24, r20
    inc   r30
.Lrem_next:
    dec   r25
    brpl  .Lrem_loop
.Lrem_nearest:
    ldi   r25, 127
    ldi   r26, 0x64
    cpi   r27, 0x51
    ldi   r31, 0xed
    cpc   r22, r31
    ldi   r31, 0x87
    cpc   r23, r31
    cpc   r24, r26
    brlo  .Lrem_normalize
    subi  r27, 0xa2
    sbc   r22, r18
    sbc   r23, r19
    sbc   r24, r20
    com   r24
    com   r23
    com   r22
    neg   r27
    sbci  r22, 0xff
    sbci  r23, 0xff
    sbci  r24, 0xff
    ldi   r26, 0x80
    eor   r16, r26
    inc   r30
.Lrem_normalize:
    tst   r24
    brmi  .Lrem_pack
    lsl   r27
    rol   r22
    rol   r23
    rol   r24
    dec   r25
    rjmp  .Lrem_normalize
.Lrem_pack:
    bst   r16, 7
    sbrc  r17, 7
    neg   r30
    mov   r20, r30
    andi  r20, 3
    clr   r21
    clr   r31
    rcall __fp_mpack
    rcall __fp_round
.Lrem_store:
    movw  r16, r22
    movw  r18, r24
    pop   r23
    pop   r22
    jmp   ff_cluster_tail_18
native_rempio2_end:

; avr-libc fma.S convention: retain flt40_t through multiply and add,
; with a single binary32 rounding at the end. This deliberately has the
; precision/range of the embedded helpers, including their cancellation
; and intermediate overflow limits; it is not an exact 48-bit product FMA.
native_fma_begin:
ff_fma:
    ldi   r30, lo8(pm(avm_fma))
    ldi   r31, hi8(pm(avm_fma))
    rjmp  ff_binary_fixed
avm_fma:
    rcall __mulsf3x
    movw  r18, r8
    movw  r20, r10
    clr   r26
    rcall __addsf3x_ext
    rjmp  __fp_round
native_fma_end:
native_math_end:
