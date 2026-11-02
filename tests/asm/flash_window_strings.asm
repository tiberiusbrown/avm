.include "include/debug_output.inc"

; Program strings sit at image offset 0x500 (AS0 0x0B00). Destinations are RAM at
; 0x0700 with sentinel bytes, printed as four letters per byte.
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

.globl _start
.type _start, @function
_start:
    ; strlen flash empty at 0x0B00
    ldi16 r5, 0x5555
    ldi16 r4, 0x0B00
    ldi16 r6, 0x3333
    ldi16 r7, 0x4444
    sys 0x1A
    call debug_print_upper_regs
    ; strlen flash one at 0x0B01
    ldi16 r5, 0x5555
    ldi16 r4, 0x0B01
    ldi16 r6, 0x3333
    ldi16 r7, 0x4444
    sys 0x1A
    call debug_print_upper_regs
    ; strlen flash flash at 0x0B03
    ldi16 r5, 0x5555
    ldi16 r4, 0x0B03
    ldi16 r6, 0x3333
    ldi16 r7, 0x4444
    sys 0x1A
    call debug_print_upper_regs
    ; strlen flash high at 0x0B0A
    ldi16 r5, 0x5555
    ldi16 r4, 0x0B0A
    ldi16 r6, 0x3333
    ldi16 r7, 0x4444
    sys 0x1A
    call debug_print_upper_regs
    ; strlen flash long at 0x0B10
    ldi16 r5, 0x5555
    ldi16 r4, 0x0B10
    ldi16 r6, 0x3333
    ldi16 r7, 0x4444
    sys 0x1A
    call debug_print_upper_regs
    ; strncpy flash flash, n=0
    fill_ram 0x0700, 24, 0xEE
    ldi16 r4, 0x0701
    ldi16 r5, 0x0B03
    ldi16 r6, 0
    ldi16 r7, 0x4444
    sys 0x1B
    call debug_print_upper_regs
    print_ram 0x0700, 2
    ; strncpy flash flash, n=3
    fill_ram 0x0700, 24, 0xEE
    ldi16 r4, 0x0701
    ldi16 r5, 0x0B03
    ldi16 r6, 3
    ldi16 r7, 0x4444
    sys 0x1B
    call debug_print_upper_regs
    print_ram 0x0700, 5
    ; strncpy flash flash, n=6
    fill_ram 0x0700, 24, 0xEE
    ldi16 r4, 0x0701
    ldi16 r5, 0x0B03
    ldi16 r6, 6
    ldi16 r7, 0x4444
    sys 0x1B
    call debug_print_upper_regs
    print_ram 0x0700, 8
    ; strncpy flash flash, n=8
    fill_ram 0x0700, 24, 0xEE
    ldi16 r4, 0x0701
    ldi16 r5, 0x0B03
    ldi16 r6, 8
    ldi16 r7, 0x4444
    sys 0x1B
    call debug_print_upper_regs
    print_ram 0x0700, 10
    ; strncpy flash empty, n=4
    fill_ram 0x0700, 24, 0xEE
    ldi16 r4, 0x0701
    ldi16 r5, 0x0B00
    ldi16 r6, 4
    ldi16 r7, 0x4444
    sys 0x1B
    call debug_print_upper_regs
    print_ram 0x0700, 6
    ; strncpy flash high, n=5
    fill_ram 0x0700, 24, 0xEE
    ldi16 r4, 0x0701
    ldi16 r5, 0x0B0A
    ldi16 r6, 5
    ldi16 r7, 0x4444
    sys 0x1B
    call debug_print_upper_regs
    print_ram 0x0700, 7
    ; strncat flash flash, n=0
    fill_ram 0x0700, 40, 0xEE
    ldi16 r4, 0x0710
    ldi8  r5, 0x41
    st8   [r4], r5
    ldi16 r4, 0x0711
    ldi8  r5, 0x42
    st8   [r4], r5
    ldi16 r4, 0x0712
    ldi8  r5, 0x00
    st8   [r4], r5
    ldi16 r4, 0x0710
    ldi16 r5, 0x0B03
    ldi16 r6, 0
    ldi16 r7, 0x4444
    sys 0x1C
    call debug_print_upper_regs
    print_ram 0x0700, 40
    ; strncat flash flash, n=3
    fill_ram 0x0700, 40, 0xEE
    ldi16 r4, 0x0710
    ldi8  r5, 0x41
    st8   [r4], r5
    ldi16 r4, 0x0711
    ldi8  r5, 0x42
    st8   [r4], r5
    ldi16 r4, 0x0712
    ldi8  r5, 0x00
    st8   [r4], r5
    ldi16 r4, 0x0710
    ldi16 r5, 0x0B03
    ldi16 r6, 3
    ldi16 r7, 0x4444
    sys 0x1C
    call debug_print_upper_regs
    print_ram 0x0700, 40
    ; strncat flash flash, n=20
    fill_ram 0x0700, 40, 0xEE
    ldi16 r4, 0x0710
    ldi8  r5, 0x41
    st8   [r4], r5
    ldi16 r4, 0x0711
    ldi8  r5, 0x42
    st8   [r4], r5
    ldi16 r4, 0x0712
    ldi8  r5, 0x00
    st8   [r4], r5
    ldi16 r4, 0x0710
    ldi16 r5, 0x0B03
    ldi16 r6, 20
    ldi16 r7, 0x4444
    sys 0x1C
    call debug_print_upper_regs
    print_ram 0x0700, 40
    ; strncat flash empty, n=4
    fill_ram 0x0700, 40, 0xEE
    ldi16 r4, 0x0710
    ldi8  r5, 0x41
    st8   [r4], r5
    ldi16 r4, 0x0711
    ldi8  r5, 0x42
    st8   [r4], r5
    ldi16 r4, 0x0712
    ldi8  r5, 0x00
    st8   [r4], r5
    ldi16 r4, 0x0710
    ldi16 r5, 0x0B00
    ldi16 r6, 4
    ldi16 r7, 0x4444
    sys 0x1C
    call debug_print_upper_regs
    print_ram 0x0700, 40
    ; strncat flash high, n=2
    fill_ram 0x0700, 40, 0xEE
    ldi16 r4, 0x0710
    ldi8  r5, 0x41
    st8   [r4], r5
    ldi16 r4, 0x0711
    ldi8  r5, 0x42
    st8   [r4], r5
    ldi16 r4, 0x0712
    ldi8  r5, 0x00
    st8   [r4], r5
    ldi16 r4, 0x0710
    ldi16 r5, 0x0B0A
    ldi16 r6, 2
    ldi16 r7, 0x4444
    sys 0x1C
    call debug_print_upper_regs
    print_ram 0x0700, 40
    ; strcmp RAM-lhs vs 'flash'
    ldi16 r4, 0x0730
    ldi8  r5, 0x46
    st8   [r4], r5
    ldi16 r4, 0x0731
    ldi8  r5, 0x4C
    st8   [r4], r5
    ldi16 r4, 0x0732
    ldi8  r5, 0x41
    st8   [r4], r5
    ldi16 r4, 0x0733
    ldi8  r5, 0x53
    st8   [r4], r5
    ldi16 r4, 0x0734
    ldi8  r5, 0x48
    st8   [r4], r5
    ldi16 r4, 0x0735
    ldi8  r5, 0x21
    st8   [r4], r5
    ldi16 r4, 0x0736
    ldi8  r5, 0x00
    st8   [r4], r5
    ldi16 r4, 0x0730
    ldi16 r5, 0x0B03
    ldi16 r6, 0x3333
    ldi16 r7, 0x4444
    sys 0x19
    call debug_print_upper_regs
    ; strcmp RAM-lhs vs 'flash'
    ldi16 r4, 0x0730
    ldi8  r5, 0x46
    st8   [r4], r5
    ldi16 r4, 0x0731
    ldi8  r5, 0x4C
    st8   [r4], r5
    ldi16 r4, 0x0732
    ldi8  r5, 0x41
    st8   [r4], r5
    ldi16 r4, 0x0733
    ldi8  r5, 0x53
    st8   [r4], r5
    ldi16 r4, 0x0734
    ldi8  r5, 0x48
    st8   [r4], r5
    ldi16 r4, 0x0735
    ldi8  r5, 0x00
    st8   [r4], r5
    ldi16 r4, 0x0730
    ldi16 r5, 0x0B03
    ldi16 r6, 0x3333
    ldi16 r7, 0x4444
    sys 0x19
    call debug_print_upper_regs
    ; strcmp RAM-lhs vs 'flash'
    ldi16 r4, 0x0730
    ldi8  r5, 0x46
    st8   [r4], r5
    ldi16 r4, 0x0731
    ldi8  r5, 0x4C
    st8   [r4], r5
    ldi16 r4, 0x0732
    ldi8  r5, 0x41
    st8   [r4], r5
    ldi16 r4, 0x0733
    ldi8  r5, 0x53
    st8   [r4], r5
    ldi16 r4, 0x0734
    ldi8  r5, 0x48
    st8   [r4], r5
    ldi16 r4, 0x0735
    ldi8  r5, 0x21
    st8   [r4], r5
    ldi16 r4, 0x0736
    ldi8  r5, 0x21
    st8   [r4], r5
    ldi16 r4, 0x0737
    ldi8  r5, 0x00
    st8   [r4], r5
    ldi16 r4, 0x0730
    ldi16 r5, 0x0B03
    ldi16 r6, 0x3333
    ldi16 r7, 0x4444
    sys 0x19
    call debug_print_upper_regs
    ; strcmp RAM-lhs vs 'empty'
    ldi16 r4, 0x0730
    ldi8  r5, 0x00
    st8   [r4], r5
    ldi16 r4, 0x0730
    ldi16 r5, 0x0B00
    ldi16 r6, 0x3333
    ldi16 r7, 0x4444
    sys 0x19
    call debug_print_upper_regs
    ; strcmp RAM-lhs vs 'one'
    ldi16 r4, 0x0730
    ldi8  r5, 0x80
    st8   [r4], r5
    ldi16 r4, 0x0731
    ldi8  r5, 0x00
    st8   [r4], r5
    ldi16 r4, 0x0730
    ldi16 r5, 0x0B01
    ldi16 r6, 0x3333
    ldi16 r7, 0x4444
    sys 0x19
    call debug_print_upper_regs
    ; strcmp flash-lhs vs 'high'
    ldi16 r4, 0x0730
    ldi8  r5, 0x68
    st8   [r4], r5
    ldi16 r4, 0x0731
    ldi8  r5, 0x69
    st8   [r4], r5
    ldi16 r4, 0x0732
    ldi8  r5, 0x80
    st8   [r4], r5
    ldi16 r4, 0x0733
    ldi8  r5, 0xFE
    st8   [r4], r5
    ldi16 r4, 0x0734
    ldi8  r5, 0x00
    st8   [r4], r5
    ldi16 r4, 0x0B0A
    ldi16 r5, 0x0730
    ldi16 r6, 0x3333
    ldi16 r7, 0x4444
    sys 0x19
    call debug_print_upper_regs
    ; strcmp flash-lhs vs 'one'
    ldi16 r4, 0x0730
    ldi8  r5, 0x42
    st8   [r4], r5
    ldi16 r4, 0x0731
    ldi8  r5, 0x00
    st8   [r4], r5
    ldi16 r4, 0x0B01
    ldi16 r5, 0x0730
    ldi16 r6, 0x3333
    ldi16 r7, 0x4444
    sys 0x19
    call debug_print_upper_regs
    ; strcmp flash-lhs vs 'empty'
    ldi16 r4, 0x0730
    ldi8  r5, 0x41
    st8   [r4], r5
    ldi16 r4, 0x0731
    ldi8  r5, 0x00
    st8   [r4], r5
    ldi16 r4, 0x0B00
    ldi16 r5, 0x0730
    ldi16 r6, 0x3333
    ldi16 r7, 0x4444
    sys 0x19
    call debug_print_upper_regs
    ; strcmp flash-lhs vs 'high'
    ldi16 r4, 0x0730
    ldi8  r5, 0x68
    st8   [r4], r5
    ldi16 r4, 0x0731
    ldi8  r5, 0x69
    st8   [r4], r5
    ldi16 r4, 0x0732
    ldi8  r5, 0x80
    st8   [r4], r5
    ldi16 r4, 0x0733
    ldi8  r5, 0xFF
    st8   [r4], r5
    ldi16 r4, 0x0734
    ldi8  r5, 0x21
    st8   [r4], r5
    ldi16 r4, 0x0735
    ldi8  r5, 0x00
    st8   [r4], r5
    ldi16 r4, 0x0B0A
    ldi16 r5, 0x0730
    ldi16 r6, 0x3333
    ldi16 r7, 0x4444
    sys 0x19
    call debug_print_upper_regs
    ; dual AS0 strcmp: equal abc
    ldi16 r4, 0x0B30
    ldi16 r5, 0x0B30
    ldi16 r6, 0x3333
    ldi16 r7, 0x4444
    sys 0x19
    call debug_print_upper_regs
    ; dual AS0 strcmp: abc < abd
    ldi16 r4, 0x0B30
    ldi16 r5, 0x0B34
    ldi16 r6, 0x3333
    ldi16 r7, 0x4444
    sys 0x19
    call debug_print_upper_regs
    ; dual AS0 strcmp: abd > abc
    ldi16 r4, 0x0B34
    ldi16 r5, 0x0B30
    ldi16 r6, 0x3333
    ldi16 r7, 0x4444
    sys 0x19
    call debug_print_upper_regs
    ; dual AS0 strcmp: ab < abc (NUL before c)
    ldi16 r4, 0x0B38
    ldi16 r5, 0x0B30
    ldi16 r6, 0x3333
    ldi16 r7, 0x4444
    sys 0x19
    call debug_print_upper_regs
    ; dual AS0 strcmp: abc > ab
    ldi16 r4, 0x0B30
    ldi16 r5, 0x0B38
    ldi16 r6, 0x3333
    ldi16 r7, 0x4444
    sys 0x19
    call debug_print_upper_regs
    ; dual AS0 strcmp: empty equal
    ldi16 r4, 0x0B3B
    ldi16 r5, 0x0B3B
    ldi16 r6, 0x3333
    ldi16 r7, 0x4444
    sys 0x19
    call debug_print_upper_regs
    ; dual AS0 strcmp: empty < a
    ldi16 r4, 0x0B3B
    ldi16 r5, 0x0B3C
    ldi16 r6, 0x3333
    ldi16 r7, 0x4444
    sys 0x19
    call debug_print_upper_regs
    ; dual AS0 strcmp: 0x80 > a unsigned
    ldi16 r4, 0x0B3E
    ldi16 r5, 0x0B3C
    ldi16 r6, 0x3333
    ldi16 r7, 0x4444
    sys 0x19
    call debug_print_upper_regs
    ; dual AS0 strcmp: a < 0x80 unsigned
    ldi16 r4, 0x0B3C
    ldi16 r5, 0x0B3E
    ldi16 r6, 0x3333
    ldi16 r7, 0x4444
    sys 0x19
    call debug_print_upper_regs
    ; dual AS0 strcmp: 0xFF > 0x80 unsigned
    ldi16 r4, 0x0B3F
    ldi16 r5, 0x0B3E
    ldi16 r6, 0x3333
    ldi16 r7, 0x4444
    sys 0x19
    call debug_print_upper_regs
    ; dual flash-lhs strcmp_P: flash lhs equal abc AS1
    ldi16 r4, 0x0B30
    ldi16 r5, 0x5555
    ldi16 r6, 0x0530
    ldi16 r7, 0xA500
    sys 0x14
    call debug_print_upper_regs
    ; dual flash-lhs strcmp_P: flash lhs abc < abd AS1
    ldi16 r4, 0x0B30
    ldi16 r5, 0x5555
    ldi16 r6, 0x0534
    ldi16 r7, 0xA500
    sys 0x14
    call debug_print_upper_regs
    ; dual flash-lhs strcmp_P: flash lhs abd > abc AS1
    ldi16 r4, 0x0B34
    ldi16 r5, 0x5555
    ldi16 r6, 0x0530
    ldi16 r7, 0xA500
    sys 0x14
    call debug_print_upper_regs
    ; dual flash-lhs strcmp_P: flash lhs ab < abc AS1
    ldi16 r4, 0x0B38
    ldi16 r5, 0x5555
    ldi16 r6, 0x0530
    ldi16 r7, 0xA500
    sys 0x14
    call debug_print_upper_regs
    ; dual flash-lhs strcmp_P: flash lhs 0x80 > a AS1
    ldi16 r4, 0x0B3E
    ldi16 r5, 0x5555
    ldi16 r6, 0x053C
    ldi16 r7, 0xA500
    sys 0x14
    call debug_print_upper_regs
    ; dual flash-lhs strcmp_P: flash lhs empty equal AS1
    ldi16 r4, 0x0B3B
    ldi16 r5, 0x5555
    ldi16 r6, 0x053B
    ldi16 r7, 0xA500
    sys 0x14
    call debug_print_upper_regs
    sys debug_break

.section .rodata,"a",@progbits
program_strings:
    .byte 0x00, 0x41, 0x00, 0x46, 0x4C, 0x41, 0x53, 0x48
    .byte 0x21, 0x00, 0x68, 0x69, 0x80, 0xFF, 0x21, 0x00
    .byte 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37
    .byte 0x38, 0x39, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46
    .byte 0x47, 0x48, 0x49, 0x4A, 0x00

; Dual-window strings at image 0x530 (AS0 0x0B30, AS1 0x530), after program_strings.
; The assembly-time checks pin the offsets used by the AS0 aliases above.
.fill 11, 1, 0x00                            ; pad program_strings (37 bytes) to 0x530
dual_strings:
    .byte 0x61, 0x62, 0x63, 0x00                 ; "abc"        AS0 0x0B30
    .byte 0x61, 0x62, 0x64, 0x00                 ; "abd"        AS0 0x0B34
    .byte 0x61, 0x62, 0x00                       ; "ab"         AS0 0x0B38
    .byte 0x00                                   ; ""           AS0 0x0B3B
    .byte 0x61, 0x00                             ; "a"          AS0 0x0B3C
    .byte 0x80, 0xFF, 0x00                       ; "\x80\xFF"   AS0 0x0B3E
.if (dual_strings - program_strings) != 0x30
    .error "dual_strings must start at image offset 0x530 (AS0 0x0B30)"
.endif
