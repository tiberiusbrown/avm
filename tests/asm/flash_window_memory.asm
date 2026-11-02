.include "include/debug_output.inc"

; Flash bytes sit at image offset 0x500, so AS0 0x0B00 is their first byte. The
; RAM buffer at 0x0700 is bordered by sentinels and printed as four letters per
; byte, which makes overruns and missed copies visible in the transcript.
.section .text,"ax",@progbits

; fill_ram base, count, value: writes value to count bytes starting at base.
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

.globl _start
.type _start, @function
_start:
    ; memcpy from flash: n=0, src=0x0B02, dst=0x0701
    fill_ram 0x0700, 24, 0xEE
    ldi16 r4, 0x0701
    ldi16 r5, 0x0B02
    ldi16 r6, 0
    ldi16 r7, 0x4444
    sys 0x0F
    call debug_print_upper_regs
    print_ram 0x0700, 2
    ; memcpy from flash: n=1, src=0x0B03, dst=0x0701
    fill_ram 0x0700, 24, 0xEE
    ldi16 r4, 0x0701
    ldi16 r5, 0x0B03
    ldi16 r6, 1
    ldi16 r7, 0x4444
    sys 0x0F
    call debug_print_upper_regs
    print_ram 0x0700, 3
    ; memcpy from flash: n=2, src=0x0B04, dst=0x0701
    fill_ram 0x0700, 24, 0xEE
    ldi16 r4, 0x0701
    ldi16 r5, 0x0B04
    ldi16 r6, 2
    ldi16 r7, 0x4444
    sys 0x0F
    call debug_print_upper_regs
    print_ram 0x0700, 4
    ; memcpy from flash: n=3, src=0x0B05, dst=0x0701
    fill_ram 0x0700, 24, 0xEE
    ldi16 r4, 0x0701
    ldi16 r5, 0x0B05
    ldi16 r6, 3
    ldi16 r7, 0x4444
    sys 0x0F
    call debug_print_upper_regs
    print_ram 0x0700, 5
    ; memcpy from flash: n=7, src=0x0B04, dst=0x0701
    fill_ram 0x0700, 24, 0xEE
    ldi16 r4, 0x0701
    ldi16 r5, 0x0B04
    ldi16 r6, 7
    ldi16 r7, 0x4444
    sys 0x0F
    call debug_print_upper_regs
    print_ram 0x0700, 9
    ; memcpy from flash: n=16, src=0x0B03, dst=0x0701
    fill_ram 0x0700, 24, 0xEE
    ldi16 r4, 0x0701
    ldi16 r5, 0x0B03
    ldi16 r6, 16
    ldi16 r7, 0x4444
    sys 0x0F
    call debug_print_upper_regs
    print_ram 0x0700, 18
    ; memmove from flash: n=0, src=0x0B02, dst=0x0701
    fill_ram 0x0700, 24, 0xEE
    ldi16 r4, 0x0701
    ldi16 r5, 0x0B02
    ldi16 r6, 0
    ldi16 r7, 0x4444
    sys 0x12
    call debug_print_upper_regs
    print_ram 0x0700, 2
    ; memmove from flash: n=1, src=0x0B03, dst=0x0701
    fill_ram 0x0700, 24, 0xEE
    ldi16 r4, 0x0701
    ldi16 r5, 0x0B03
    ldi16 r6, 1
    ldi16 r7, 0x4444
    sys 0x12
    call debug_print_upper_regs
    print_ram 0x0700, 3
    ; memmove from flash: n=2, src=0x0B04, dst=0x0701
    fill_ram 0x0700, 24, 0xEE
    ldi16 r4, 0x0701
    ldi16 r5, 0x0B04
    ldi16 r6, 2
    ldi16 r7, 0x4444
    sys 0x12
    call debug_print_upper_regs
    print_ram 0x0700, 4
    ; memmove from flash: n=3, src=0x0B05, dst=0x0701
    fill_ram 0x0700, 24, 0xEE
    ldi16 r4, 0x0701
    ldi16 r5, 0x0B05
    ldi16 r6, 3
    ldi16 r7, 0x4444
    sys 0x12
    call debug_print_upper_regs
    print_ram 0x0700, 5
    ; memmove from flash: n=7, src=0x0B04, dst=0x0701
    fill_ram 0x0700, 24, 0xEE
    ldi16 r4, 0x0701
    ldi16 r5, 0x0B04
    ldi16 r6, 7
    ldi16 r7, 0x4444
    sys 0x12
    call debug_print_upper_regs
    print_ram 0x0700, 9
    ; memmove from flash: n=16, src=0x0B03, dst=0x0701
    fill_ram 0x0700, 24, 0xEE
    ldi16 r4, 0x0701
    ldi16 r5, 0x0B03
    ldi16 r6, 16
    ldi16 r7, 0x4444
    sys 0x12
    call debug_print_upper_regs
    print_ram 0x0700, 18
    ; memmove RAM overlap: dst = src + 1, n = 4
    ldi16 r4, 0x0710
    ldi8  r5, 0x41
    st8   [r4], r5
    ldi16 r4, 0x0711
    ldi8  r5, 0x42
    st8   [r4], r5
    ldi16 r4, 0x0712
    ldi8  r5, 0x43
    st8   [r4], r5
    ldi16 r4, 0x0713
    ldi8  r5, 0x44
    st8   [r4], r5
    ldi16 r4, 0x0714
    ldi8  r5, 0x45
    st8   [r4], r5
    ldi16 r4, 0x0715
    ldi8  r5, 0x46
    st8   [r4], r5
    ldi16 r4, 0x0716
    ldi8  r5, 0x47
    st8   [r4], r5
    ldi16 r4, 0x0717
    ldi8  r5, 0x48
    st8   [r4], r5
    ldi16 r4, 0x0711
    ldi16 r5, 0x0710
    ldi16 r6, 4
    ldi16 r7, 0x4444
    sys 0x12
    call debug_print_upper_regs
    print_ram 0x0710, 8
    ; memcmp RAM-lhs n=5
    ldi16 r4, 0x0720
    ldi8  r5, 0x46
    st8   [r4], r5
    ldi16 r4, 0x0721
    ldi8  r5, 0x4C
    st8   [r4], r5
    ldi16 r4, 0x0722
    ldi8  r5, 0x41
    st8   [r4], r5
    ldi16 r4, 0x0723
    ldi8  r5, 0x53
    st8   [r4], r5
    ldi16 r4, 0x0724
    ldi8  r5, 0x48
    st8   [r4], r5
    ldi16 r4, 0x0720
    ldi16 r5, 0x0B00
    ldi16 r6, 5
    ldi16 r7, 0x4444
    sys 0x18
    call debug_print_upper_regs
    ; memcmp RAM-lhs n=5
    ldi16 r4, 0x0720
    ldi8  r5, 0x47
    st8   [r4], r5
    ldi16 r4, 0x0721
    ldi8  r5, 0x4C
    st8   [r4], r5
    ldi16 r4, 0x0722
    ldi8  r5, 0x41
    st8   [r4], r5
    ldi16 r4, 0x0723
    ldi8  r5, 0x53
    st8   [r4], r5
    ldi16 r4, 0x0724
    ldi8  r5, 0x48
    st8   [r4], r5
    ldi16 r4, 0x0720
    ldi16 r5, 0x0B00
    ldi16 r6, 5
    ldi16 r7, 0x4444
    sys 0x18
    call debug_print_upper_regs
    ; memcmp RAM-lhs n=5
    ldi16 r4, 0x0720
    ldi8  r5, 0x46
    st8   [r4], r5
    ldi16 r4, 0x0721
    ldi8  r5, 0x4C
    st8   [r4], r5
    ldi16 r4, 0x0722
    ldi8  r5, 0x41
    st8   [r4], r5
    ldi16 r4, 0x0723
    ldi8  r5, 0x53
    st8   [r4], r5
    ldi16 r4, 0x0724
    ldi8  r5, 0x49
    st8   [r4], r5
    ldi16 r4, 0x0720
    ldi16 r5, 0x0B00
    ldi16 r6, 5
    ldi16 r7, 0x4444
    sys 0x18
    call debug_print_upper_regs
    ; memcmp RAM-lhs n=6
    ldi16 r4, 0x0720
    ldi8  r5, 0x46
    st8   [r4], r5
    ldi16 r4, 0x0721
    ldi8  r5, 0x4C
    st8   [r4], r5
    ldi16 r4, 0x0722
    ldi8  r5, 0x41
    st8   [r4], r5
    ldi16 r4, 0x0723
    ldi8  r5, 0x53
    st8   [r4], r5
    ldi16 r4, 0x0724
    ldi8  r5, 0x48
    st8   [r4], r5
    ldi16 r4, 0x0725
    ldi8  r5, 0x20
    st8   [r4], r5
    ldi16 r4, 0x0720
    ldi16 r5, 0x0B00
    ldi16 r6, 6
    ldi16 r7, 0x4444
    sys 0x18
    call debug_print_upper_regs
    ; memcmp RAM-lhs n=2
    ldi16 r4, 0x0720
    ldi8  r5, 0xFF
    st8   [r4], r5
    ldi16 r4, 0x0721
    ldi8  r5, 0x00
    st8   [r4], r5
    ldi16 r4, 0x0720
    ldi16 r5, 0x0B05
    ldi16 r6, 2
    ldi16 r7, 0x4444
    sys 0x18
    call debug_print_upper_regs
    ; memcmp RAM-lhs n=0
    ldi16 r4, 0x0720
    ldi8  r5, 0x00
    st8   [r4], r5
    ldi16 r4, 0x0720
    ldi16 r5, 0x0B00
    ldi16 r6, 0
    ldi16 r7, 0x4444
    sys 0x18
    call debug_print_upper_regs
    ; memcmp flash-lhs n=5
    ldi16 r4, 0x0720
    ldi8  r5, 0x46
    st8   [r4], r5
    ldi16 r4, 0x0721
    ldi8  r5, 0x4C
    st8   [r4], r5
    ldi16 r4, 0x0722
    ldi8  r5, 0x41
    st8   [r4], r5
    ldi16 r4, 0x0723
    ldi8  r5, 0x53
    st8   [r4], r5
    ldi16 r4, 0x0724
    ldi8  r5, 0x48
    st8   [r4], r5
    ldi16 r4, 0x0B00
    ldi16 r5, 0x0720
    ldi16 r6, 5
    ldi16 r7, 0x4444
    sys 0x18
    call debug_print_upper_regs
    ; memcmp flash-lhs n=5
    ldi16 r4, 0x0720
    ldi8  r5, 0x45
    st8   [r4], r5
    ldi16 r4, 0x0721
    ldi8  r5, 0x4C
    st8   [r4], r5
    ldi16 r4, 0x0722
    ldi8  r5, 0x41
    st8   [r4], r5
    ldi16 r4, 0x0723
    ldi8  r5, 0x53
    st8   [r4], r5
    ldi16 r4, 0x0724
    ldi8  r5, 0x48
    st8   [r4], r5
    ldi16 r4, 0x0B00
    ldi16 r5, 0x0720
    ldi16 r6, 5
    ldi16 r7, 0x4444
    sys 0x18
    call debug_print_upper_regs
    ; memcmp flash-lhs n=5
    ldi16 r4, 0x0720
    ldi8  r5, 0x46
    st8   [r4], r5
    ldi16 r4, 0x0721
    ldi8  r5, 0x4C
    st8   [r4], r5
    ldi16 r4, 0x0722
    ldi8  r5, 0x41
    st8   [r4], r5
    ldi16 r4, 0x0723
    ldi8  r5, 0x53
    st8   [r4], r5
    ldi16 r4, 0x0724
    ldi8  r5, 0x47
    st8   [r4], r5
    ldi16 r4, 0x0B00
    ldi16 r5, 0x0720
    ldi16 r6, 5
    ldi16 r7, 0x4444
    sys 0x18
    call debug_print_upper_regs
    ; memcmp flash-lhs n=2
    ldi16 r4, 0x0720
    ldi8  r5, 0x20
    st8   [r4], r5
    ldi16 r4, 0x0721
    ldi8  r5, 0x00
    st8   [r4], r5
    ldi16 r4, 0x0B05
    ldi16 r5, 0x0720
    ldi16 r6, 2
    ldi16 r7, 0x4444
    sys 0x18
    call debug_print_upper_regs
    ; memcmp flash-lhs n=2
    ldi16 r4, 0x0720
    ldi8  r5, 0x22
    st8   [r4], r5
    ldi16 r4, 0x0721
    ldi8  r5, 0x00
    st8   [r4], r5
    ldi16 r4, 0x0B05
    ldi16 r5, 0x0720
    ldi16 r6, 2
    ldi16 r7, 0x4444
    sys 0x18
    call debug_print_upper_regs
    ; memcmp flash-lhs n=1
    ldi16 r4, 0x0720
    ldi8  r5, 0x80
    st8   [r4], r5
    ldi16 r4, 0x0B06
    ldi16 r5, 0x0720
    ldi16 r6, 1
    ldi16 r7, 0x4444
    sys 0x18
    call debug_print_upper_regs
    sys debug_break

.section .rodata,"a",@progbits
flash_bytes:
    .byte 0x46, 0x4C, 0x41, 0x53, 0x48, 0x21, 0x80, 0xFF
    .byte 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xDE, 0xF0
    .byte 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08
    .byte 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10
