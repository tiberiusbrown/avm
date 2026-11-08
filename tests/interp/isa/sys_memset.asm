.section .text,"ax",@progbits

.macro emit_char character
    ldi8 r4, \character
    sys debug_putc
.endm

.globl _start
.type _start, @function
_start:
    ; Fill five bytes with low8(0xab5a) == 'Z'. The nonzero high byte checks
    ; the C memset conversion from int16_t to unsigned char.
    ldi16 r4, memset_dst + 1
    ldi16 r5, 0xab5a
    ldi16 r6, 5

    ldi16 r0, 0x0001
    ldi16 r1, 0x0001
    cmp r0, r1

    sys 0x11

    push16 r4
    push16 r5
    push16 r6
    pop16 r2                         ; returned n
    pop16 r1                         ; returned val
    pop16 r0                         ; returned dst

    breq8 .Lmemset_cc_ok
    emit_char '!'
    jmp8 .Lmemset_cc_done
.Lmemset_cc_ok:
    emit_char 'C'
.Lmemset_cc_done:

    ldi16 r7, memset_dst + 1
    cmp r0, r7
    breq8 .Lmemset_return_ok
    emit_char '!'
    jmp8 .Lmemset_return_done
.Lmemset_return_ok:
    emit_char 'R'
.Lmemset_return_done:

    ldi16 r7, 0xab5a
    cmp r1, r7
    breq8 .Lmemset_value_ok
    emit_char '!'
    jmp8 .Lmemset_value_done
.Lmemset_value_ok:
    emit_char 'V'
.Lmemset_value_done:

    ldi16 r7, 5
    cmp r2, r7
    breq8 .Lmemset_count_ok
    emit_char '!'
    jmp8 .Lmemset_count_done
.Lmemset_count_ok:
    emit_char 'N'
.Lmemset_count_done:
    emit_char '\n'

    ldi16 r5, memset_dst
    ldi16 r6, 7
    call print_bytes
    emit_char '\n'

    ; Zero length must not store even one byte.
    ldi16 r4, memset_zero + 1
    ldi16 r5, 0x5151
    ldi16 r6, 0
    sys 0x11

    mov r0, r4
    ldi16 r7, memset_zero + 1
    cmp r0, r7
    breq8 .Lmemset_zero_return_ok
    emit_char '!'
    jmp8 .Lmemset_zero_return_done
.Lmemset_zero_return_ok:
    emit_char 'Z'
.Lmemset_zero_return_done:
    emit_char '\n'

    ldi16 r5, memset_zero
    ldi16 r6, 4
    call print_bytes
    emit_char '\n'

    sys debug_break

print_bytes:
.Lprint_bytes_loop:
    ld8u r4, [r5+]
    sys debug_putc
    dec16 r6
    tst16 r6
    brne8 .Lprint_bytes_loop
    ret

.size _start, .-_start

.section .data,"aw",@progbits
memset_dst:
    .ascii "<.....>"
memset_zero:
    .ascii "zero"
