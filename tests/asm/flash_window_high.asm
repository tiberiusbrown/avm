.include "include/debug_output.inc"

; AS0 0xFFFE and 0xFFFF alias the last two image bytes. This fixture links .rodata
; at image 0xF8FE, so the bytes below occupy image 0xF8FE..0xF9FF. The two high
; bytes sit at image 0xF9FE and 0xF9FF (AS0 0xFFFE/0xFFFF). The AVM linker script
; merges program-space section names such as .rodata.* into .rodata, so one
; section carries both the carry bytes and the high pair.
; Carry cases: AS0 0xFEFE reads 0x33/0x11 (no middle carry); AS0 0xFEFF reads
; 0x11/0x22 across the image 0xF8FF/0xF900 boundary (low and middle carry).
; No case reads across 0xFFFF.
.section .text,"ax",@progbits

.macro reset_ld_regs
    ldi16 r4, 0x1111
    ldi16 r5, 0x2222
    ldi16 r6, 0x3333
    ldi16 r7, 0x4444
.endm

.globl _start
.type _start, @function
_start:
    ; ld8u r5,[r4] at AS0 0xFFFE: low image byte of the high pair.
    reset_ld_regs
    ldi16 r4, 0xFFFE
    ld8u  r5, [r4]
    call  debug_print_upper_regs
    ; ld8u r5,[r4] at AS0 0xFFFF: high image byte.
    reset_ld_regs
    ldi16 r4, 0xFFFF
    ld8u  r5, [r4]
    call  debug_print_upper_regs
    ; ld16 r5,[r4] at AS0 0xFFFE: little-endian pair 0xC35A.
    reset_ld_regs
    ldi16 r4, 0xFFFE
    ld16  r5, [r4]
    call  debug_print_upper_regs
    ; ld8u r6,[r7+] at AS0 0xFFFE: postincrement leaves the pointer at 0xFFFF.
    reset_ld_regs
    ldi16 r7, 0xFFFE
    ld8u  r6, [r7+]
    call  debug_print_upper_regs
    ; ld16 r5,[r4] at AS0 0xFEFE: image 0xF8FE/0xF8FF, low byte only.
    reset_ld_regs
    ldi16 r4, 0xFEFE
    ld16  r5, [r4]
    call  debug_print_upper_regs
    ; ld16 r5,[r4] at AS0 0xFEFF: image 0xF8FF/0xF900 crosses into the middle byte.
    reset_ld_regs
    ldi16 r4, 0xFEFF
    ld16  r5, [r4]
    call  debug_print_upper_regs
    ; memcmp_P, AS0 window lhs 0xFEFE against the AS1 rhs at image 0x10000 (q3[23:16]=1).
    ; The high padding byte in r7[15:8] must survive.
    reset_ld_regs
    ldi16 r4, 0xFEFE
    ldi16 r5, 3
    ldi16 r6, 0x0000
    ldi16 r7, 0xA501
    sys 0x13
    call  debug_print_upper_regs
    ; The third byte differs (0x22 against 0x23) at image 0x10005: a -1 result.
    reset_ld_regs
    ldi16 r4, 0xFEFE
    ldi16 r5, 3
    ldi16 r6, 0x0003
    ldi16 r7, 0xA501
    sys 0x13
    call  debug_print_upper_regs
    ; Two bytes at the same high rhs equal: 33 11 against 33 11.
    reset_ld_regs
    ldi16 r4, 0xFEFE
    ldi16 r5, 2
    ldi16 r6, 0x0003
    ldi16 r7, 0xA501
    sys 0x13
    call  debug_print_upper_regs
    sys debug_break

.section .rodata,"a",@progbits
carry_bytes:
    .byte 0x33, 0x11, 0x22
    .fill 0xFD, 1, 0x00
high_bytes:
    .byte 0x5A, 0xC3
; AS1 program pointers above 64 KiB for the dual-window memcmp_P cases: image
; 0x10000 and 0x10003 hold the bytes that the window pair 0xFEFE (33 11 22) is
; compared against. The 0x600-byte gap keeps the layout explicit.
.fill 0x600, 1, 0x00
rhs_high:
    .byte 0x33, 0x11, 0x22, 0x33, 0x11, 0x23
.if (rhs_high - carry_bytes) != 0x10000 - 0xF8FE
    .error "rhs_high must sit at image offset 0x10000"
.endif
