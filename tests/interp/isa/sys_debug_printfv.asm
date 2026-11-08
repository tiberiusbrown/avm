.section .text,"ax",@progbits
.globl _start
.type _start, @function
_start:
    ldi16 r4, 0x980
    setsp r4
    ldi16 r0, 0x1001
    ldi16 r1, 0x2002
    ldi16 r2, arguments
    ldi16 r3, 0x3003
    ldi16 r4, 0x4004
    ldi16 r5, 0x5005
    ldi16 r6, ram_format
    ldi16 r7, 0x7007
    cmp r0, r0
    sys debug_printfv
    breq8 .Lcc_ok
    jmp8 .Lfail
.Lcc_ok:
    ; Check r7 before using it as the comparison scratch register.
    push16 r0
    ldi16 r0, 0x7007
    cmp r0, r7
    pop16 r0
    breq8 .Lr7_ok
    jmp8 .Lfail
.Lr7_ok:
    ldi16 r7, 0x1001
    cmp r0, r7
    breq8 .Lr0_ok
    jmp8 .Lfail
.Lr0_ok:
    ldi16 r7, 0x2002
    cmp r1, r7
    breq8 .Lr1_ok
    jmp8 .Lfail
.Lr1_ok:
    ldi16 r7, arguments
    cmp r2, r7
    breq8 .Lr2_ok
    jmp8 .Lfail
.Lr2_ok:
    ldi16 r7, 0x3003
    cmp r3, r7
    breq8 .Lr3_ok
    jmp8 .Lfail
.Lr3_ok:
    ldi16 r7, 3
    cmp r4, r7
    breq8 .Lr4_ok
    jmp8 .Lfail
.Lr4_ok:
    ldi16 r7, 0x5005
    cmp r5, r7
    breq8 .Lr5_ok
    jmp8 .Lfail
.Lr5_ok:
    ldi16 r7, ram_format
    cmp r6, r7
    breq8 .Lr6_ok
    jmp8 .Lfail
.Lr6_ok:
    getsp r4
    ldi16 r7, 0x980
    cmp r4, r7
    breq8 .Lsp_ok
    jmp8 .Lfail
.Lsp_ok:
    ldi16 r6, count
    ld16 r4, [r6]
    ldi16 r7, 3
    cmp r4, r7
    breq8 .Ln_ok
    jmp8 .Lfail
.Ln_ok:
    ldi16 r6, %lo16(program_format)
    ldi8 r7, %hi8(program_format)
    sys debug_printfv_p
    ldi16 r7, 3
    cmp r4, r7
    breq8 .Lpass
.Lfail:
    ldi8 r4, 'F'
    sys debug_putc
    sys debug_break
.Lpass:
    ldi8 r4, 'P'
    sys debug_putc
    sys debug_break
.section .data,"aw",@progbits
ram_format:
    .asciz "X%d%n"
arguments:
    .short 42
    .short count
count:
    .short 0
.section .rodata,"a",@progbits
program_format:
    .asciz "X%d%n"
