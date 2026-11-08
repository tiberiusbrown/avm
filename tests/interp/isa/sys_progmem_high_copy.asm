; Program-space sources above 64 KiB exercise the full 24-bit q3 pointer in the
; AS1 copy services. .text begins at image address 0x100, so .org offsets are
; measured from that base: 0xFEFD is absolute 0xFFFD, and 0x11F00 is absolute
; 0x12000. The fixtures precede all code so linker relaxation cannot shift them.
.section .text,"ax",@progbits

    ; Six bytes crossing the 0x10000 boundary: absolute 0x00FFFD..0x010002.
    .org 0xfefd
.Lhigh_cross_src:
    .byte 0x41, 0x42, 0x43, 0x44, 0x45, 0x46

    ; "abc" followed by NUL, then filler that must never be copied.
    .org 0x11f00
.Lhigh_str_src:
    .byte 0x61, 0x62, 0x63, 0x00, 0x51, 0x51, 0x51, 0x51
    .byte 0x51, 0x51, 0x51, 0x51, 0x51, 0x51, 0x51, 0x51

    ; "xyz" followed by NUL, for strncat_P onto a two-byte destination.
    .org 0x11f10
.Lhigh_cat_src:
    .byte 0x78, 0x79, 0x7a, 0x00, 0x51, 0x51, 0x51, 0x51
    .byte 0x51, 0x51, 0x51, 0x51, 0x51, 0x51, 0x51, 0x51

    ; Eight digits without a NUL, followed by filler.
    .org 0x11f20
.Lhigh_mem_src:
    .byte 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37
    .byte 0x51, 0x51, 0x51, 0x51, 0x51, 0x51, 0x51, 0x51

.include "include/debug_output.inc"

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

; print_ram base, count: four letters per byte from RAM, then a newline.
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

; Set r7 to the bound padding value 0xA5 in q3[31:24] while preserving the
; 24-bit source computed by the caller.
.macro set_q3_padding
    ldi16 r0, 0xa500
    or    r7, r0
.endm

.globl _start
.type _start, @function
_start:
    ; memcpy_P across 0x10000: the returned pointer and count are unchanged,
    ; and q3[31:24] is preserved.
    fill_ram 0x0700, 8, 0xEE
    ldi16 r4, 0x0700
    ldi16 r5, 6
    ldi16 r6, %lo16(.Lhigh_cross_src)
    ldi8  r7, %hi8(.Lhigh_cross_src)
    set_q3_padding
    sys   0x10
    call  debug_print_upper_regs
    print_ram 0x0700, 8

    ; strncpy_P from 0x012000 with bound 8: the three letters, then NUL padding.
    fill_ram 0x0720, 10, 0xEE
    ldi16 r4, 0x0720
    ldi16 r5, 8
    ldi16 r6, %lo16(.Lhigh_str_src)
    ldi8  r7, %hi8(.Lhigh_str_src)
    set_q3_padding
    sys   0x16
    print_ram 0x0720, 10

    ; strncat_P from 0x012010 with bound 8 onto "AB": the source NUL is
    ; copied at offset 5, and the remaining destination bytes are untouched.
    fill_ram 0x0740, 12, 0xEE
    ldi16 r4, 0x0740
    ldi8  r5, 'A'
    st8   [r4+], r5
    ldi8  r5, 'B'
    st8   [r4+], r5
    ldi8  r5, 0
    st8   [r4+], r5
    ldi16 r4, 0x0740
    ldi16 r5, 8
    ldi16 r6, %lo16(.Lhigh_cat_src)
    ldi8  r7, %hi8(.Lhigh_cat_src)
    set_q3_padding
    sys   0x17
    print_ram 0x0740, 10

    ; strncpy_P truncation: four of eight available bytes, with no NUL copied.
    fill_ram 0x0760, 6, 0xEE
    ldi16 r4, 0x0760
    ldi16 r5, 4
    ldi16 r6, %lo16(.Lhigh_mem_src)
    ldi8  r7, %hi8(.Lhigh_mem_src)
    set_q3_padding
    sys   0x16
    print_ram 0x0760, 6

    ; memcpy_P of eight bytes from 0x012020 leaves the two trailing sentinels.
    fill_ram 0x0770, 10, 0xEE
    ldi16 r4, 0x0770
    ldi16 r5, 8
    ldi16 r6, %lo16(.Lhigh_mem_src)
    ldi8  r7, %hi8(.Lhigh_mem_src)
    set_q3_padding
    sys   0x10
    print_ram 0x0770, 10

    sys debug_break
