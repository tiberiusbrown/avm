.include "include/debug_output.inc"

; Formatter coverage for flash-window sources. The format and string items live
; in .rodata at image offset 0x500, so AS0 0x0B00 names the first byte. RAM
; formats and arguments are in .data. Program formats use AS1 image addresses.
; Each case prints the formatted text, then the returned count and preserved
; r5/r7 as four letters per value. vsnprintf cases print the complete 32-byte
; destination after the same dump.
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

; Prints the count in r4 followed by preserved r5 and r7, then a newline.
.macro dump_r4_r5_r7
    mov   r0, r4
    call  debug_print_r0
    mov   r0, r5
    call  debug_print_r0
    mov   r0, r7
    call  debug_print_r0
    call  debug_print_newline
.endm

.globl _start
.type _start, @function
_start:
    ldi16 r4, 0x980
    setsp r4
    ; case 0: RAM format, flash %s
    ldi16 r2, args_0
    ldi16 r6, ram_fmt_s
    ldi16 r5, 0x5005
    ldi16 r7, 0x7007
    sys debug_printfv
    call debug_print_newline
    dump_r4_r5_r7
    ; case 1: RAM format, flash %.3s
    ldi16 r2, args_1
    ldi16 r6, ram_fmt_p3
    ldi16 r5, 0x5005
    ldi16 r7, 0x7007
    sys debug_printfv
    call debug_print_newline
    dump_r4_r5_r7
    ; case 2: RAM format, flash %.0s
    ldi16 r2, args_2
    ldi16 r6, ram_fmt_p0
    ldi16 r5, 0x5005
    ldi16 r7, 0x7007
    sys debug_printfv
    call debug_print_newline
    dump_r4_r5_r7
    ; case 3: RAM format, RAM %s
    ldi16 r2, args_3
    ldi16 r6, ram_fmt_r
    ldi16 r5, 0x5005
    ldi16 r7, 0x7007
    sys debug_printfv
    call debug_print_newline
    dump_r4_r5_r7
    ; case 4: flash format, RAM %s
    ldi16 r2, args_4
    ldi16 r6, 0x0b10
    ldi16 r5, 0x5005
    ldi16 r7, 0x7007
    sys debug_printfv
    call debug_print_newline
    dump_r4_r5_r7
    ; case 5: flash format, flash %s
    ldi16 r2, args_5
    ldi16 r6, 0x0b10
    ldi16 r5, 0x5005
    ldi16 r7, 0x7007
    sys debug_printfv
    call debug_print_newline
    dump_r4_r5_r7
    ; case 6: AS1 format, flash %s (debug_printfv_P)
    ldi16 r2, args_6
    ldi16 r6, 0x0610
    ldi16 r7, 0xA500
    ldi16 r5, 0x5005
    sys debug_printfv_p
    call debug_print_newline
    dump_r4_r5_r7
    ; case 7: vsnprintf flash format %d %s
    fill_ram 0x0800, 32, 0xEE
    ldi16 r4, 0x0800
    ldi16 r5, 32
    ldi16 r6, 0x0b20
    ldi16 r7, 0x7007
    ldi16 r2, args_7
    sys 0x2F
    dump_r4_r5_r7
    print_ram 0x0800, 32
    ; case 8: vsnprintf truncated, flash %s
    fill_ram 0x0800, 32, 0xEE
    ldi16 r4, 0x0800
    ldi16 r5, 5
    ldi16 r6, ram_fmt_trunc
    ldi16 r7, 0x7007
    ldi16 r2, args_8
    sys 0x2F
    dump_r4_r5_r7
    print_ram 0x0800, 32
    ; case 9: vsnprintf size zero
    fill_ram 0x0800, 32, 0xEE
    ldi16 r4, 0x0800
    ldi16 r5, 0
    ldi16 r6, 0x0bc0
    ldi16 r7, 0x7007
    ldi16 r2, args_9
    sys 0x2F
    dump_r4_r5_r7
    print_ram 0x0800, 32
    ; case 10: vsnprintf_P %S %s %d
    fill_ram 0x0800, 32, 0xEE
    ldi16 r4, 0x0800
    ldi16 r5, 32
    ldi16 r6, 0x05e0
    ldi16 r7, 0xa500
    ldi16 r2, args_10
    sys 0x30
    dump_r4_r5_r7
    print_ram 0x0800, 32
    ; case 11: flash format crosses 16-byte cache
    ldi16 r2, args_11
    ldi16 r6, 0x0b30
    ldi16 r5, 0x5005
    ldi16 r7, 0x7007
    sys debug_printfv
    call debug_print_newline
    dump_r4_r5_r7
    ; case 12: RAM format, flash 26-byte %s
    ldi16 r2, args_12
    ldi16 r6, ram_fmt_paren
    ldi16 r5, 0x5005
    ldi16 r7, 0x7007
    sys debug_printfv
    call debug_print_newline
    dump_r4_r5_r7
    ; case 13: flash format widths
    ldi16 r2, args_13
    ldi16 r6, 0x0b90
    ldi16 r5, 0x5005
    ldi16 r7, 0x7007
    sys debug_printfv
    call debug_print_newline
    dump_r4_r5_r7
    ; case 14: flash format star width and precision
    ldi16 r2, args_14
    ldi16 r6, 0x0ba0
    ldi16 r5, 0x5005
    ldi16 r7, 0x7007
    sys debug_printfv
    call debug_print_newline
    dump_r4_r5_r7
    ; case 15: flash format flash %s then %n
    fill_ram 0x07C0, 2, 0xFF
    ldi16 r2, args_15
    ldi16 r6, 0x0bb0
    ldi16 r5, 0x5005
    ldi16 r7, 0x7007
    sys debug_printfv
    call debug_print_newline
    dump_r4_r5_r7
    ldi16 r5, 0x07C0
    ld16 r0, [r5]
    call debug_print_r0
    call debug_print_newline
    ; case 16: RAM format %S (AS1 pointer)
    ldi16 r2, args_16
    ldi16 r6, ram_fmt_S
    ldi16 r5, 0x5005
    ldi16 r7, 0x7007
    sys debug_printfv
    call debug_print_newline
    dump_r4_r5_r7
    sys debug_break

.section .data,"aw",@progbits
ram_fmt_s:
    .asciz "[%s]"
ram_fmt_p3:
    .asciz "<%.3s>"
ram_fmt_p0:
    .asciz "<%.0s>"
ram_fmt_r:
    .asciz "R:%s"
ram_fmt_paren:
    .asciz "(%s)"
ram_fmt_S:
    .asciz "%S"
ram_fmt_trunc:
    .asciz "[%s]"
ram_str:
    .asciz "ram"
args_0:
    .short 0x0b00
args_1:
    .short 0x0b00
args_2:
    .short 0x0b00
args_3:
    .short ram_str
args_4:
    .short ram_str
args_5:
    .short 0x0b00
args_6:
    .short 0x0b00
args_7:
    .short 0xfffb
    .short 0x0b00
args_8:
    .short 0x0b00
args_9:
    .short 0x0b00
args_10:
    .byte 0x00, 0x06, 0x00
    .short 0x0b00
    .short 0x002a
args_11:
    .short 0x0b00
args_12:
    .short 0x0b60
args_13:
    .short 0x0b00
    .short 0x0b00
args_14:
    .short 0x0006
    .short 0x0003
    .short 0x0b00
args_15:
    .short 0x0b00
    .short 0x07c0
args_16:
    .byte 0x00, 0x06, 0x00
.section .rodata,"a",@progbits
str_flash:
    .asciz "flash"
    .fill 0xa, 1, 0x00
fmt_flash_brace:
    .asciz "{%s}"
    .fill 0xb, 1, 0x00
fmt_flash_mixed:
    .asciz "[%d|%s]"
    .fill 0x8, 1, 0x00
fmt_flash_long:
    .asciz "0123456789ABCDEFGHIJ[%s]"
    .fill 0x17, 1, 0x00
str_alpha:
    .asciz "abcdefghijklmnopqrstuvwxyz"
    .fill 0x15, 1, 0x00
fmt_flash_pad:
    .asciz "%-8s|%8s|"
    .fill 0x6, 1, 0x00
fmt_flash_star:
    .asciz "%*.*s"
    .fill 0xa, 1, 0x00
fmt_flash_n:
    .asciz "%s%n"
    .fill 0xb, 1, 0x00
fmt_flash_bracket:
    .asciz "[%s]"
    .fill 0x1b, 1, 0x00
prog_fmt_mixed:
    .asciz "%S|%s|%d"
    .fill 0x17, 1, 0x00
prog_str:
    .asciz "prog"
    .fill 0xb, 1, 0x00
prog_fmt_bracket:
    .asciz "<%s>"
.if (fmt_flash_brace - str_flash) != 0x10
    .error "fmt_flash_brace must sit at rodata offset 0x10"
.endif
.if (fmt_flash_mixed - str_flash) != 0x20
    .error "fmt_flash_mixed must sit at rodata offset 0x20"
.endif
.if (fmt_flash_long - str_flash) != 0x30
    .error "fmt_flash_long must sit at rodata offset 0x30"
.endif
.if (str_alpha - str_flash) != 0x60
    .error "str_alpha must sit at rodata offset 0x60"
.endif
.if (fmt_flash_pad - str_flash) != 0x90
    .error "fmt_flash_pad must sit at rodata offset 0x90"
.endif
.if (fmt_flash_star - str_flash) != 0xa0
    .error "fmt_flash_star must sit at rodata offset 0xa0"
.endif
.if (fmt_flash_n - str_flash) != 0xb0
    .error "fmt_flash_n must sit at rodata offset 0xb0"
.endif
.if (fmt_flash_bracket - str_flash) != 0xc0
    .error "fmt_flash_bracket must sit at rodata offset 0xc0"
.endif
.if (prog_fmt_mixed - str_flash) != 0xe0
    .error "prog_fmt_mixed must sit at rodata offset 0xe0"
.endif
.if (prog_str - str_flash) != 0x100
    .error "prog_str must sit at rodata offset 0x100"
.endif
.if (prog_fmt_bracket - str_flash) != 0x110
    .error "prog_fmt_bracket must sit at rodata offset 0x110"
.endif
