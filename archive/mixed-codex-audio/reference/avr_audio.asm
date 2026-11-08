; Historical excerpts, not a standalone assembler input. See implementation.zip and root.patch.
; Music decoder: a 64-byte compressed ring and 35 bytes of persistent state.
; Producer and consumer publish independent uint8 heads; their difference is
; bounded by 64. FX cursors and lengths remain uint24 throughout.
#define data_audio_begin             (data_text_mode+1)
#define data_audio_ticks_pending     (data_audio_begin+0)
#define data_audio_volume            (data_audio_begin+1)
#define data_audio_status            (data_audio_begin+2)
#define data_audio_flags             (data_audio_begin+3)
#define data_audio_read              (data_audio_begin+4)
#define data_audio_write             (data_audio_begin+5)
#define data_audio_cursor            (data_audio_begin+6)
#define data_audio_start             (data_audio_begin+9)
#define data_audio_bytes             (data_audio_begin+12)
#define data_audio_length            (data_audio_begin+15)
#define data_audio_remaining         (data_audio_begin+18)
#define data_audio_total             (data_audio_begin+22)
#define data_audio_frame_left        (data_audio_begin+26)
#define data_audio_parameter         (data_audio_begin+27)
#define data_audio_step              (data_audio_begin+28)
#define data_audio_previous          (data_audio_begin+29)
#define data_audio_older             (data_audio_begin+30)
#define data_audio_bits              (data_audio_begin+31)
#define data_audio_bit_count         (data_audio_begin+32)
#define data_audio_sample            (data_audio_begin+33)
#define data_audio_underruns         (data_audio_begin+34)
#define data_audio_ring              (data_audio_begin+35)
#define data_audio_end               (data_audio_ring+64)

.if (data_audio_end - data_audio_begin) != 99
    .error "audio persistent SRAM must occupy 99 bytes"
.endif
.if (data_audio_begin >> 8) != ((data_audio_end-1) >> 8)
    .error "audio compact pointers must fit in one SRAM page"
.endif

#define data_end_private             data_audio_end
#define data_audio_header            data_end_private


; Canonical mixed-codec scales; residuals are +/-S and +/-3S.
.org 0x0100
audio_steps:
    .byte 1,2,3,4,5,6,8,10,12,15,18,22,26,31,36,42

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

seek_and_dispatch_func:
    rjmp seek_and_dispatch_func

stack_overflow_indirect:
    rjmp stack_overflow_func

; CALLP shared prologue. The primary slot preserved the selected target in
; r26:r25:r24 and performed the low-byte increment from the CALLP opcode to its
; sequential return address. Finish the 24-bit carry chain, push PC+1 in
; canonical little-endian stack layout, install the target, and fall through
; directly into the common seek handler.
push_pc_seek_and_dispatch_func:
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO
    st   -Y, VM_PCH
    st   -Y, VM_PCM
    st   -Y, VM_PCL
    ; Shared by all four specialized CALLP slots. Both useful check cycles
    ; are exposed (+2); JMPP and the common seek timing are unchanged.
    cpi  VM_SPH, hi8(data_stack)
    brlo stack_overflow_indirect
    movw VM_PCL, r24
    mov  VM_PCH, r26

; Shared continuation for JMPP, CALLP, RET, and taken control-flow instructions.
; On entry, VM_PCH:VM_PCM:VM_PCL is the new image-relative program counter.
; Seek the external-flash stream to VM_PC, consume the target primary opcode,
; start its following-byte fetch, and dispatch directly to that primary slot.
seek_and_dispatch_func:
    fx_disable
seek_and_dispatch_func_disabled:
    lds  r30, data_audio_ticks_pending
    tst  r30
    brne audio_service_and_seek
seek_and_dispatch_no_audio:
    ldi  r30, SFC_READ
    fx_enable
    out  SPDR, r30

    lds  r26, data_page_data+0
    add  r26, VM_PCM
    lds  r27, data_page_data+1
    adc  r27, VM_PCH

    ; SFC_READ and each address byte are meaningful transmitted data, so
    ; command-to-address-high also requires the 18-cycle OUT-to-OUT cadence.
    rcall interp_delay_11
    out  SPDR, r27
    rcall interp_delay_17
    out  SPDR, r26
    rcall interp_delay_17
    out  SPDR, VM_PCL
    rcall interp_delay_16
    out  SPDR, ZERO
    rcall interp_delay_15
    cli
    out  SPDR, ZERO
    in   PRIMARY_OPCODE, SPDR
    sei
    mul  PRIMARY_OPCODE, FOUR
    movw r30, r0
    subi r31, hi8(-(pm(primary_table)))
    ijmp

audio_service_and_seek:
    call audio_service_func
    rjmp seek_and_dispatch_no_audio


; Mixed one/two-bit music. Only the foreground touches FX; the interrupt
; consumes compressed bytes, never a decoded PCM queue. Each frame restarts
; from its signed seed and contains at most 256 output samples.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.macro audio_save
    push r16
    push r17
    push r18
    push r19
    push r20
    push r21
    push r22
    push r23
.endm
.macro audio_restore
    pop r23
    pop r22
    pop r21
    pop r20
    pop r19
    pop r18
    pop r17
    pop r16
.endm

audio_service_func:
    sts  data_audio_ticks_pending, ZERO
    lds  r24, data_audio_status
    tst  r24
    breq 1f
    audio_save
    rcall audio_refill
    audio_restore
1:
    ret

; Single producer; publish head only after all bytes have arrived. Interrupts
; stay enabled through the shared SPI reader. Never read past the payload.
audio_refill:
    lds  r16, data_audio_write
    lds  r24, data_audio_read
    mov  r17, r16
    sub  r17, r24
    ldi  r18, 64
    sub  r18, r17
    brne 9f
    rjmp .Laudio_refill_done
9:
    cpi  r18, 33
    brlo 1f
    ldi  r18, 32
1:
    mov  r17, r16
    andi r17, 63
    ldi  r24, 64
    sub  r24, r17
    cp   r18, r24
    brlo 1f
    mov  r18, r24
1:
    lds  r19, data_audio_bytes
    lds  r20, data_audio_bytes+1
    lds  r21, data_audio_bytes+2
    mov  r24, r19
    or   r24, r20
    or   r24, r21
    brne .Laudio_refill_length
    lds  r24, data_audio_flags
    sbrs r24, 0
    rjmp .Laudio_refill_done
    lds  r19, data_audio_length
    lds  r20, data_audio_length+1
    lds  r21, data_audio_length+2
    lds  r24, data_audio_start
    lds  r25, data_audio_start+1
    lds  r26, data_audio_start+2
    sts  data_audio_cursor, r24
    sts  data_audio_cursor+1, r25
    sts  data_audio_cursor+2, r26
.Laudio_refill_length:
    tst  r20
    brne 1f
    tst  r21
    brne 1f
    cp   r18, r19
    brlo 1f
    mov  r18, r19
1:
    sub  r19, r18
    sbc  r20, ZERO
    sbc  r21, ZERO
    sts  data_audio_bytes, r19
    sts  data_audio_bytes+1, r20
    sts  data_audio_bytes+2, r21
    lds  r24, data_audio_cursor
    lds  r25, data_audio_cursor+1
    lds  r26, data_audio_cursor+2
    mov  r19, r24
    mov  r20, r25
    mov  r21, r26
    add  r19, r18
    adc  r20, ZERO
    adc  r21, ZERO
    sts  data_audio_cursor, r19
    sts  data_audio_cursor+1, r20
    sts  data_audio_cursor+2, r21
    ldi  r30, lo8(data_audio_ring)
    ldi  r31, hi8(data_audio_ring)
    add  r30, r17
    mov  r0, r18
    mov  r1, ZERO
    call fx_read_program_bytes_func
    add  r16, r18
    sts  data_audio_write, r16
    rjmp audio_refill
.Laudio_refill_done:
    ret

; SYS 0x38. Legacy SFX/tone/rate command numbers are reserved and ignored.
; PLAY expects AVM1: magic[4], payload_bytes:u24, flags:u8 (bit0 loop),
; sample_count:u32, then unchanged AVAX mixed-256 frame payload.
sys_audio_impl:
    fx_disable
    audio_save
    mov  r24, VM_R7L
    tst  r24
    brne 9f
    rjmp .Laudio_play
9:
    cpi  r24, 2
    breq .Laudio_stop
    cpi  r24, 3
    breq .Laudio_pause
    cpi  r24, 4
    breq .Laudio_resume
    cpi  r24, 5
    breq .Laudio_volume
    cpi  r24, 11
    breq .Laudio_volume
    cpi  r24, 6
    breq .Laudio_enable_command
    cpi  r24, 7
    breq .Laudio_disable
    cpi  r24, 9
    breq .Laudio_status
    rjmp .Laudio_command_done
.Laudio_stop:
    sts  data_audio_status, ZERO
    sts  data_audio_ticks_pending, ZERO
    rjmp .Laudio_silence
.Laudio_pause:
    lds  r24, data_audio_status
    cpi  r24, 1
    brne .Laudio_command_done
    ldi  r24, 2
    sts  data_audio_status, r24
    rjmp .Laudio_silence
.Laudio_resume:
    lds  r24, data_audio_status
    cpi  r24, 2
    brne .Laudio_command_done
    sts  data_audio_status, ONE
    rjmp .Laudio_command_done
.Laudio_volume:
    sts  data_audio_volume, VM_R4L
    rjmp .Laudio_command_done
.Laudio_enable_command:
    rcall audio_enable
    rjmp .Laudio_command_done
.Laudio_disable:
    sts  data_audio_status, ZERO
    sts  data_audio_ticks_pending, ZERO
    in   r25, SREG
    cli
    sts  TIMSK1, ZERO
    sts  TCCR1B, ZERO
    sts  TCCR4A, ZERO
    sts  TCCR4B, ZERO
    cbi  PORTC, 6
    cbi  PORTC, 7
    out  SREG, r25
.Laudio_silence:
    ldi  r24, 128
    sts  data_audio_sample, r24
    rjmp .Laudio_command_done
.Laudio_status:
    lds  r24, data_audio_status
    audio_restore
    mov  VM_R4L, r24
    mov  VM_R4H, ZERO
    jmp seek_and_dispatch_func_disabled
.Laudio_command_done:
    audio_restore
    jmp seek_and_dispatch_func_disabled

.Laudio_play:
    sts  data_audio_status, ZERO ; ISR cannot see partially installed state
    mov  r24, VM_R4L
    mov  r25, VM_R4H
    mov  r26, VM_R5L
    subi r16, lo8(-12)
    sbci r17, hi8(-12)
    sbci r18, hlo8(-12)
    sts  data_audio_start, r16
    sts  data_audio_start+1, r17
    sts  data_audio_start+2, r18
    sts  data_audio_cursor, r16
    sts  data_audio_cursor+1, r17
    sts  data_audio_cursor+2, r18
    ldi  r30, lo8(data_audio_header)
    ldi  r31, hi8(data_audio_header)
    ldi  r16, 12
    mov  r0, r16
    mov  r1, ZERO
    call fx_read_program_bytes_func
    ldi  r30, lo8(data_audio_header)
    ldi  r31, hi8(data_audio_header)
    ld   r24, Z+
    cpi  r24, 'A'
    breq 9f
    rjmp .Laudio_bad_header
9:
    ld   r24, Z+
    cpi  r24, 'V'
    breq 9f
    rjmp .Laudio_bad_header
9:
    ld   r24, Z+
    cpi  r24, 'M'
    breq 9f
    rjmp .Laudio_bad_header
9:
    ld   r24, Z+
    cpi  r24, '1'
    breq 9f
    rjmp .Laudio_bad_header
9:
    clr  r25
    .set audio_i, 0
    .rept 3
        ld   r24, Z+
        sts  data_audio_bytes+audio_i, r24
        sts  data_audio_length+audio_i, r24
        or   r25, r24
        .set audio_i, audio_i+1
    .endr
    tst  r25
    brne 9f
    rjmp .Laudio_bad_header
9:
    ld   r24, Z+
    cpi  r24, 2
    brlo 9f
    rjmp .Laudio_bad_header
9:
    sts  data_audio_flags, r24
    clr  r25
    .set audio_i, 0
    .rept 4
        ld   r24, Z+
        sts  data_audio_remaining+audio_i, r24
        sts  data_audio_total+audio_i, r24
        or   r25, r24
        .set audio_i, audio_i+1
    .endr
    tst  r25
    brne 9f
    rjmp .Laudio_bad_header
9:
    sts  data_audio_read, ZERO
    sts  data_audio_write, ZERO
    sts  data_audio_frame_left, ZERO
    sts  data_audio_bits, ZERO
    sts  data_audio_bit_count, ZERO
    sts  data_audio_underruns, ZERO
    sts  data_audio_ticks_pending, ZERO
    ldi  r24, 128
    sts  data_audio_sample, r24
    rcall audio_refill
    sts  data_audio_status, ONE
    rcall audio_enable
    rjmp .Laudio_command_done
.Laudio_bad_header:
    rjmp .Laudio_stop

audio_enable:
    lds  r24, TIMSK1
    tst  r24
    brne 1f
    in   r25, SREG
    cli
    sts  TC4H, ZERO
    ldi  r24, 128
    sts  OCR4A, r24
    sts  data_audio_sample, r24
    sbi  DDRC, 6
    sbi  DDRC, 7
    ldi  r24, (_BV(COM4A0) | _BV(PWM4A))
    sts  TCCR4A, r24
    ldi  r24, _BV(CS40)
    sts  TCCR4B, r24
    rcall audio_timer1_start
    out  SREG, r25
1:
    ret

; Called with interrupts disabled; preserves r25 (saved SREG).
audio_timer1_start:
    ldi  r24, (_BV(WGM12) | _BV(CS11))
    sts  TCCR1B, r24
    ; Both clocks share a prescaler: Timer0 ticks every 64 CPU cycles, Timer1
    ; every 8. Seed Timer1 from Timer0's coarse phase instead of call timing.
    ; Eight cycles from the TCNT0 read to the TCNT1L latch (STS's second cycle) put
    ; audio deadlines 64..120 cycles after clock deadlines modulo 128, clear
    ; of Timer0's ISR. Keep this sequence's instruction timing unchanged.
    ; Do not reset the shared prescaler or alter the millisecond counter.
    sts  TCNT1H, ZERO
audio_enable_phase:
    in   r24, TCNT0
    lsl  r24
    lsl  r24
    lsl  r24
    andi r24, 127
    nop
    nop
    sts  TCNT1L, r24
    ldi  r24, _BV(OCF1A)
    out  TIFR1, r24
    ldi  r24, _BV(OCIE1A)
    sts  TIMSK1, r24
    ret

; Timer0 compare-A fires once per millisecond. Preserve the interrupted native
; state; the VM register file may be live in any AVR register when this runs.
timer0_compa_isr:
    push r0
    in   r0, SREG
    push r0

    lds  r0, data_millis+0
    inc  r0
    sts  data_millis+0, r0
    brne timer0_compa_isr_done

    lds  r0, data_millis+1
    inc  r0
    sts  data_millis+1, r0
    brne timer0_compa_isr_done

    lds  r0, data_millis+2
    inc  r0
    sts  data_millis+2, r0
    brne timer0_compa_isr_done

    lds  r0, data_millis+3
    inc  r0
    sts  data_millis+3, r0

timer0_compa_isr_done:
    pop  r0
    out  SREG, r0
    pop  r0
    reti

; Timer1 emits the held PWM value at a fixed 14-cycle body latency, then
; decodes exactly one signed PCM8 sample. No SPI, guest zero-register use,
; frame-sized PCM scratch, or unbounded work occurs in this interrupt.
timer1_compa_isr:
    push r0
    in   r0, SREG
    push r0
    push r20
timer1_synthesis:
    lds  r20, data_audio_sample
    clr  r0
    sts  TC4H, r0
timer1_endpoint_write:
    sts  OCR4A, r20
    push r1
    push r21
    push r22
    push r23
    push r24
    push r25
    push r26
    push r27
    push r30
    push r31
    lds  r20, data_audio_status
    cpi  r20, 1
    breq 1f
    rjmp .Laudio_isr_silence
1:
    lds  r20, data_audio_remaining
    lds  r21, data_audio_remaining+1
    lds  r22, data_audio_remaining+2
    lds  r23, data_audio_remaining+3
    or   r20, r21
    or   r20, r22
    or   r20, r23
    brne .Laudio_decode_sample
    lds  r20, data_audio_flags
    sbrs r20, 0
    rjmp .Laudio_isr_stop
    .set audio_i, 0
    .rept 4
        lds  r20, data_audio_total+audio_i
        sts  data_audio_remaining+audio_i, r20
        .set audio_i, audio_i+1
    .endr
    clr  r20
    sts  data_audio_frame_left, r20
.Laudio_decode_sample:
    lds  r20, data_audio_write
    lds  r21, data_audio_read
    sub  r20, r21
    cpi  r20, 33
    brsh 1f
    ldi  r21, 1
    sts  data_audio_ticks_pending, r21
1:
    lds  r21, data_audio_frame_left
    tst  r21
    brne .Laudio_residual
    cpi  r20, 2
    brsh 1f
    rjmp .Laudio_underrun
1:
    lds  r21, data_audio_bits
    tst  r21
    breq 1f
    rjmp .Laudio_isr_stop ; nonzero frame padding
1:
    rcall audio_pop
    mov  r20, r24
    rcall audio_pop
    mov  r22, r24
    andi r22, 0xc0
    cpi  r22, 0xc0
    breq .Laudio_invalid_frame
    mov  r22, r24
    andi r22, 0x30
    cpi  r22, 0x30
    breq .Laudio_invalid_frame
    cpi  r24, 0x40
    brsh 1f
    tst  r24
    brne .Laudio_invalid_frame ; hold parameter must be zero
1:
    sts  data_audio_parameter, r24
    mov  r30, r24
    andi r30, 15
    subi r30, lo8(-audio_steps)
    ldi  r31, hi8(audio_steps)
    lpm  r21, Z
    sts  data_audio_step, r21
    ldi  r21, 255
    sts  data_audio_frame_left, r21
    clr  r21
    sts  data_audio_bit_count, r21
    sts  data_audio_older, r20
    rjmp .Laudio_store_sample
.Laudio_invalid_frame:
    rjmp .Laudio_isr_stop
.Laudio_residual:
    lds  r23, data_audio_parameter
    cpi  r23, 0x40
    brsh .Laudio_read_symbol
    lds  r20, data_audio_previous
    rjmp .Laudio_residual_done
.Laudio_read_symbol:
    lds  r22, data_audio_bit_count
    tst  r22
    brne 1f
    tst  r20
    brne 2f
    rjmp .Laudio_underrun
2:
    rcall audio_pop
    sts  data_audio_bits, r24
    ldi  r22, 8
1:
    lds  r24, data_audio_bits
    mov  r21, r24
    andi r21, 3
    lsr  r24
    dec  r22
    sbrs r23, 7
    rjmp .Laudio_one_bit
    lsr  r24
    dec  r22
    rjmp .Laudio_symbol_ready
.Laudio_one_bit:
    andi r21, 1
    inc  r21 ; binary -S/+S maps to two-bit symbols 1/2
.Laudio_symbol_ready:
    sts  data_audio_bits, r24
    sts  data_audio_bit_count, r22
    mov  r22, r21
    lds  r20, data_audio_previous
    clr  r21
    sbrc r20, 7
    ser  r21
    andi r23, 0x30
    breq .Laudio_prediction_ready
    mov  r24, r20
    mov  r25, r21
    lds  r26, data_audio_older
    clr  r27
    sbrc r26, 7
    ser  r27
    sub  r24, r26
    sbc  r25, r27
    sbrs r23, 5
    rjmp 1f
    asr  r25
    ror  r24 ; floor(half slope), including negative odd slopes
1:
    add  r20, r24
    adc  r21, r25
.Laudio_prediction_ready:
    lds  r23, data_audio_step
    mov  r24, r23
    cpi  r22, 1
    breq 1f
    cpi  r22, 2
    breq 1f
    lsl  r24
    add  r24, r23 ; largest canonical 3*S is 126
1:
    clr  r25
    cpi  r22, 2
    brsh 1f
    neg  r24
    ser  r25
1:
    add  r20, r24
    adc  r21, r25
    tst  r21
    breq .Laudio_nonnegative
    cpi  r21, 255
    brne .Laudio_clamp
    sbrc r20, 7
    rjmp .Laudio_history
    rjmp .Laudio_clamp
.Laudio_nonnegative:
    sbrs r20, 7
    rjmp .Laudio_history
.Laudio_clamp:
    ldi  r20, 127
    sbrc r21, 7
    ldi  r20, 128
.Laudio_history:
    lds  r21, data_audio_previous
    sts  data_audio_older, r21
.Laudio_residual_done:
    lds  r21, data_audio_frame_left
    dec  r21
    sts  data_audio_frame_left, r21
.Laudio_store_sample:
    sts  data_audio_previous, r20
    ; Gain is applied after history reconstruction. Doubling the product's
    ; signed high byte detects overflow before the /128 conversion.
    lds  r21, data_audio_volume
    mulsu r20, r21
    mov  r20, r1
    lsl  r20
    brvs .Laudio_gain_clip
    clr  r21
    lsl  r0
    adc  r20, r21
    rjmp .Laudio_gain_bias
.Laudio_gain_clip:
    ldi  r20, 127
    sbrc r1, 7
    ldi  r20, 128
.Laudio_gain_bias:
    subi r20, 128
    sts  data_audio_sample, r20
    lds  r20, data_audio_remaining
    subi r20, 1
    sts  data_audio_remaining, r20
    brcc .Laudio_isr_done
    lds  r20, data_audio_remaining+1
    sbci r20, 0
    sts  data_audio_remaining+1, r20
    brcc .Laudio_isr_done
    lds  r20, data_audio_remaining+2
    sbci r20, 0
    sts  data_audio_remaining+2, r20
    brcc .Laudio_isr_done
    lds  r20, data_audio_remaining+3
    sbci r20, 0
    sts  data_audio_remaining+3, r20
    rjmp .Laudio_isr_done
.Laudio_underrun:
    lds  r20, data_audio_underruns
    cpi  r20, 255
    breq .Laudio_isr_silence
    inc  r20
    sts  data_audio_underruns, r20
    rjmp .Laudio_isr_silence
.Laudio_isr_stop:
    clr  r20
    sts  data_audio_status, r20
    sts  data_audio_ticks_pending, r20
.Laudio_isr_silence:
    ldi  r20, 128
    sts  data_audio_sample, r20
.Laudio_isr_done:
    pop  r31
    pop  r30
    pop  r27
    pop  r26
    pop  r25
    pop  r24
    pop  r23
    pop  r22
    pop  r21
    pop  r1
timer1_output_done:
    pop  r20
    pop  r0
    out  SREG, r0
    pop  r0
    reti

; ISR-only pop. Caller has checked availability for the complete operation.
; uint8 head wrap is independent of the physical ring's 64-byte wrap.
audio_pop:
    lds  r25, data_audio_read
    mov  r30, r25
    andi r30, 63
    subi r30, lo8(-data_audio_ring)
    ldi  r31, hi8(data_audio_ring)
    ld   r24, Z
    inc  r25
    sts  data_audio_read, r25
    ret

; Startup-only zero writes, in order. All timers below are stopped and masked
; before their remaining controls are reset. All addresses fit in data page 0;
; TC4H is cleared before writing TCNT4 and the Timer4 compare registers.
audio_init_zero_registers:
    .byte TCCR3B, TIMSK3, TCCR3A, TCCR3C
    .byte TCCR1B, TIMSK1, TCCR1A, TCCR1C, OCR1AH
    .byte TCCR4B, TIMSK4, TCCR4A, TCCR4C, TCCR4D, TCCR4E
    .byte DT4, TC4H, TCNT4
audio_init_zero_registers_end:

; Startup only, interrupts off. 96 MHz VCO / 1.5 = 64 MHz Timer4;
; USB postcaler remains 48 MHz (96 / 2). Datasheet sections 6.11 and 15.
audio_init_func:
    ldi  r24, _BV(PINDIV)
    out  PLLCSR, r24
    ldi  r24, 0x6a
    out  PLLFRQ, r24
    ldi  r24, (_BV(PINDIV) | _BV(PLLE))
    out  PLLCSR, r24
    ; Wait at least 100 us before checking lock, as required by Timer4.
    ldi  r24, 240 ; 1679 cycles = 104.9 us
1:
    delay_4
    dec  r24
    brne 1b
1:
    in   r24, PLLCSR
    sbrs r24, PLOCK
    rjmp 1b
    ; Timer0 initialization already cleared Timer1's power gate in PRR0.
    lds  r24, PRR1
    andi r24, (0xff ^ _BV(PRTIM4))
    sts  PRR1, r24
    ldi  r30, lo8(audio_init_zero_registers)
    ldi  r31, hi8(audio_init_zero_registers)
    ldi  r27, 0
    ldi  r24, (audio_init_zero_registers_end-audio_init_zero_registers)
1:
    lpm  r26, Z+
    st   X, ZERO
    dec  r24
    brne 1b
    ldi  r24, 127 ; 16 MHz / 8 / 128 = 15625 output samples/s
    sts  OCR1AL, r24
    cbi  PORTC, 6
    cbi  PORTC, 7
    cbi  DDRC, 6
    cbi  DDRC, 7
    ldi  r24, 255 ; Timer4 retains its 250 kHz carrier and 8-bit duty range
    sts  OCR4C, r24
    ldi  r24, 128
    sts  OCR4A, r24
    ldi  r24, 128 ; signed PCM8 unity gain (volume / 128)
    sts  data_audio_volume, r24
    ret
