.include "include/debug_output.inc"

; Text-renderer coverage for flash-window sources. Glyph data and format or
; string items live in .rodata at image 0x500 (AS0 0x0B00). The font object is
; program space at image 0x550. Every case clears the first three framebuffer
; pages, draws in overwrite mode, then prints the returned cursor and the
; affected framebuffer bytes.
.section .text,"ax",@progbits

.macro fill_ram base, count, value
    ldi16 r4, \base
    ldi16 r6, \count
    ldi8  r5, \value
.Lfill_ram_\@:
    st8   [r4+], r5
    dec16 r6
    tst16 r6
    brne8 .Lfill_ram_\@
.endm

.macro print_ram base, count
    ldi16 r5, \base
    ldi16 r6, \count
.Lprint_ram_\@:
    ld8u  r0, [r5+]
    call  debug_print_r0
    dec16 r6
    tst16 r6
    brne8 .Lprint_ram_\@
    ldi8  r4, '\n'
    sys   debug_putc
.endm

.macro dump_r4_r5
    mov   r0, r4
    call  debug_print_r0
    mov   r0, r5
    call  debug_print_r0
    call  debug_print_newline
.endm

.globl _start
.type _start, @function
_start:
    ldi16 r4, 0x980
    setsp r4
    ; Select the program-space font at image 0x550 (q2 = r4:r5, bits 23:0).
    ldi16 r4, 0x0550
    ldi16 r5, 0x0000
    sys 0x31
    ; draw_text flash AB at (4,8)
    fill_ram 0x0500, 384, 0x00
    ldi16 r4, 0x0000
    ldi16 r5, 0x0000
    ldi16 r4, 0x0000
    sys 0x32
    ldi16 r4, 0x0004
    ldi16 r5, 0x0008
    ldi16 r6, 0x0b00
    sys 0x33
    dump_r4_r5
    print_ram 0x0580, 80
    print_ram 0x0638, 16
    ; draw_textfv flash %s arg AB at (20,8)
    fill_ram 0x0500, 384, 0x00
    ldi16 r4, 0x0000
    ldi16 r5, 0x0000
    ldi16 r4, 0x0000
    sys 0x32
    ldi16 r4, 0x0014
    ldi16 r5, 0x0008
    ldi16 r6, 0x0b10
    ldi16 r2, args_1
    sys 0x35
    dump_r4_r5
    print_ram 0x0580, 80
    print_ram 0x0638, 16
    ; draw_text flash A newline B at (60,8)
    fill_ram 0x0500, 384, 0x00
    ldi16 r4, 0x0000
    ldi16 r5, 0x0000
    ldi16 r4, 0x0000
    sys 0x32
    ldi16 r4, 0x003c
    ldi16 r5, 0x0008
    ldi16 r6, 0x0b20
    sys 0x33
    dump_r4_r5
    print_ram 0x0580, 80
    print_ram 0x0638, 16
    ; draw_text RAM AA at (40,8)
    fill_ram 0x0500, 384, 0x00
    ldi16 r4, 0x0000
    ldi16 r5, 0x0000
    ldi16 r4, 0x0000
    sys 0x32
    ldi16 r4, 0x0028
    ldi16 r5, 0x0008
    ldi16 r6, ram_3
    sys 0x33
    dump_r4_r5
    print_ram 0x0580, 80
    print_ram 0x0638, 16
    ; draw_textfv_P AS1 %s arg AB at (70,8)
    fill_ram 0x0500, 384, 0x00
    ldi16 r4, 0x0000
    ldi16 r5, 0x0000
    ldi16 r4, 0x0000
    sys 0x32
    ldi16 r4, 0x0046
    ldi16 r5, 0x0008
    ldi16 r6, 0x0540
    ldi16 r7, 0xA500
    ldi16 r2, args_4
    sys 0x36
    dump_r4_r5
    print_ram 0x0580, 80
    print_ram 0x0638, 16
    ; draw_text flash A space B at (4,8)
    fill_ram 0x0500, 384, 0x00
    ldi16 r4, 0x0000
    ldi16 r5, 0x0000
    ldi16 r4, 0x0000
    sys 0x32
    ldi16 r4, 0x0004
    ldi16 r5, 0x0008
    ldi16 r6, 0x0b30
    sys 0x33
    dump_r4_r5
    print_ram 0x0580, 80
    print_ram 0x0638, 16
    sys debug_break

.section .data,"aw",@progbits
args_1:
    .short 0x0b00
ram_3:
    .asciz "AA"
args_4:
    .short 0x0b00
.section .rodata,"a",@progbits
str_ab:
    .byte 0x41, 0x42, 0x00
    .fill 0xd, 1, 0x00
fmt_s:
    .byte 0x25, 0x73, 0x00
    .fill 0xd, 1, 0x00
str_a_nl_b:
    .byte 0x41, 0x0a, 0x42, 0x00
    .fill 0xc, 1, 0x00
str_a_sp_b:
    .byte 0x41, 0x20, 0x42, 0x00
    .fill 0xc, 1, 0x00
fmt_s_p:
    .byte 0x25, 0x73, 0x00
    .fill 0xd, 1, 0x00
font:
    .byte 0x08, 0x41, 0x02, 0x08, 0x00, 0x02, 0x00, 0x0e, 0x00, 0x03, 0x08, 0x00, 0x01, 0x00, 0x10, 0x00, 0x02, 0x81, 0xff, 0x3c
.if (font - str_ab) != 0x50
    .error "font must sit at image offset 0x550"
.endif
.if (fmt_s - str_ab) != 0x10
    .error "fmt_s must sit at image offset 0x510"
.endif
