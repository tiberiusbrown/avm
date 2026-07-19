.section .text,"ax",@progbits

.macro emit_char character
    ldi8 r4, \character
    sys debug_putc
.endm

.globl _start
.type _start, @function
_start:
    ; Copy seven bytes between data-space objects. Guard bytes around the
    ; destination detect an incorrect count or an off-by-one store.
    ldi16 r4, memcpy_dst + 1
    ldi16 r5, memcpy_src
    ldi16 r6, 7

    ; SYS services preserve CC unless specified otherwise.
    ldi16 r0, 0x1234
    ldi16 r1, 0x1234
    cmp r0, r1

    sys 0x0f

    ; Save the returned arguments without changing CC.
    push16 r4
    push16 r5
    push16 r6
    pop16 r2                         ; returned n
    pop16 r1                         ; returned src
    pop16 r0                         ; returned dst

    breq8 .Lmemcpy_cc_ok
    emit_char '!'
    jmp8 .Lmemcpy_cc_done
.Lmemcpy_cc_ok:
    emit_char 'C'
.Lmemcpy_cc_done:

    ldi16 r7, memcpy_dst + 1
    cmp r0, r7
    breq8 .Lmemcpy_return_ok
    emit_char '!'
    jmp8 .Lmemcpy_return_done
.Lmemcpy_return_ok:
    emit_char 'R'
.Lmemcpy_return_done:

    ldi16 r7, memcpy_src
    cmp r1, r7
    breq8 .Lmemcpy_src_ok
    emit_char '!'
    jmp8 .Lmemcpy_src_done
.Lmemcpy_src_ok:
    emit_char 'S'
.Lmemcpy_src_done:

    ldi16 r7, 7
    cmp r2, r7
    breq8 .Lmemcpy_count_ok
    emit_char '!'
    jmp8 .Lmemcpy_count_done
.Lmemcpy_count_ok:
    emit_char 'N'
.Lmemcpy_count_done:
    emit_char '\n'

    ldi16 r5, memcpy_dst
    ldi16 r6, 9
    call print_bytes
    emit_char '\n'

    ; A zero-length copy must not access either object and must still return dst.
    ldi16 r4, memcpy_zero + 1
    ldi16 r5, memcpy_src
    ldi16 r6, 0
    sys 0x0f

    mov r0, r4
    ldi16 r7, memcpy_zero + 1
    cmp r0, r7
    breq8 .Lmemcpy_zero_return_ok
    emit_char '!'
    jmp8 .Lmemcpy_zero_return_done
.Lmemcpy_zero_return_ok:
    emit_char 'Z'
.Lmemcpy_zero_return_done:
    emit_char '\n'

    ldi16 r5, memcpy_zero
    ldi16 r6, 4
    call print_bytes
    emit_char '\n'

    sys debug_break

; Print r6 bytes beginning at data pointer r5.
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
memcpy_src:
    .ascii "source!"
memcpy_dst:
    .ascii "<.......>"
memcpy_zero:
    .ascii "zero"
