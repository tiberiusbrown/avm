.section .text,"ax",@progbits

.macro emit_char character
    ldi8 r4, \character
    sys debug_putc
.endm

.globl _start
.type _start, @function
_start:
    ; Copy six bytes from program space to data space. r7 is loaded with LDI8
    ; so q3 is canonical: its unused bits 31:24 are zero.
    ldi16 r4, memcpy_p_dst + 1
    ldi16 r6, %lo16(memcpy_p_src)
    ldi8  r7, %hi8(memcpy_p_src)
    ldi16 r5, 6

    ldi16 r0, 0x8000
    ldi16 r1, 0x8000
    cmp r0, r1

    sys 0x10

    ; Capture dst, n, and both registers of q3 before using r4 for output.
    push16 r4
    push16 r5
    push16 r6
    push16 r7
    pop16 r3                         ; returned q3 high register
    pop16 r2                         ; returned q3 low register
    pop16 r1                         ; returned n
    pop16 r0                         ; returned dst

    breq8 .Lmemcpy_p_cc_ok
    emit_char '!'
    jmp8 .Lmemcpy_p_cc_done
.Lmemcpy_p_cc_ok:
    emit_char 'C'
.Lmemcpy_p_cc_done:

    ldi16 r7, memcpy_p_dst + 1
    cmp r0, r7
    breq8 .Lmemcpy_p_return_ok
    emit_char '!'
    jmp8 .Lmemcpy_p_return_done
.Lmemcpy_p_return_ok:
    emit_char 'R'
.Lmemcpy_p_return_done:

    ldi16 r7, %lo16(memcpy_p_src)
    cmp r2, r7
    brne8 .Lmemcpy_p_pointer_bad
    ldi8 r7, %hi8(memcpy_p_src)
    cmp r3, r7
    brne8 .Lmemcpy_p_pointer_bad
    emit_char 'P'
    jmp8 .Lmemcpy_p_pointer_done
.Lmemcpy_p_pointer_bad:
    emit_char '!'
.Lmemcpy_p_pointer_done:

    ldi16 r7, 6
    cmp r1, r7
    breq8 .Lmemcpy_p_count_ok
    emit_char '!'
    jmp8 .Lmemcpy_p_count_done
.Lmemcpy_p_count_ok:
    emit_char 'N'
.Lmemcpy_p_count_done:
    emit_char '\n'

    ; Reaching and executing this code also checks that memcpy_P correctly
    ; restarts the instruction stream after its independent FX read transaction.
    ldi16 r5, memcpy_p_dst
    ldi16 r6, 8
    call print_bytes
    emit_char '\n'

    ; Zero length must perform no program-space or data-space access.
    ldi16 r4, memcpy_p_zero + 1
    ldi16 r6, %lo16(memcpy_p_src)
    ldi8  r7, %hi8(memcpy_p_src)
    ldi16 r5, 0
    sys 0x10

    mov r0, r4
    ldi16 r7, memcpy_p_zero + 1
    cmp r0, r7
    breq8 .Lmemcpy_p_zero_return_ok
    emit_char '!'
    jmp8 .Lmemcpy_p_zero_return_done
.Lmemcpy_p_zero_return_ok:
    emit_char 'Z'
.Lmemcpy_p_zero_return_done:
    emit_char '\n'

    ldi16 r5, memcpy_p_zero
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

.section .rodata,"a",@progbits
memcpy_p_src:
    .ascii "FLASH!"

.section .data,"aw",@progbits
memcpy_p_dst:
    .ascii "<......>"
memcpy_p_zero:
    .ascii "zero"
