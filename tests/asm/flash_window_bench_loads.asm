.include "include/debug_output.inc"

; Readback check for the flash-window load rows of bench/instructions.asm. The test
; link places .rodata at image offset 0x500, so AS0 0x0B00 is the first table byte.
; The table is the same 16 bytes as bench/instruction_flash_fixture.c. Each case uses
; the same encoding as its benchmark row: .byte forms where the benchmark uses them,
; and the mnemonic forms otherwise. Effective addresses for displaced loads are the
; ones the benchmark rows use.
.section .text,"ax",@progbits

.macro reset_regs
    ldi16 r4, 0x1111
    ldi16 r5, 0x2222
    ldi16 r6, 0x3333
    ldi16 r7, 0x4444
.endm

.globl _start
.type _start, @function
_start:
    ; LD8U r4,[r6] (flash upper one-byte): the high byte is cleared.
    reset_regs
    ldi16 r6, 0x0B00
    .byte 0x42
    mov r0, r4
    call debug_print_r0_line

    ; LD16 r4,[r6] (flash upper one-byte)
    reset_regs
    ldi16 r6, 0x0B00
    .byte 0x62
    mov r0, r4
    call debug_print_r0_line

    ; LD8U r0,[r6] (flash dense F5)
    reset_regs
    ldi16 r0, 0xffff
    ldi16 r6, 0x0B00
    .byte 0xf5, 0x38
    call debug_print_r0_line

    ; LD16 r0,[r6] (flash dense F5)
    reset_regs
    ldi16 r0, 0xffff
    ldi16 r6, 0x0B00
    .byte 0xf5, 0x48
    call debug_print_r0_line

    ; LD8U r0,[r6+] (flash dense F7): the pointer advances by one.
    reset_regs
    ldi16 r0, 0xffff
    ldi16 r6, 0x0B00
    .byte 0xf7, 0x10
    call debug_print_r0_line
    mov r0, r6
    call debug_print_r0_line

    ; LD16 r0,[r6+] (flash dense F7): the pointer advances by two.
    reset_regs
    ldi16 r0, 0xffff
    ldi16 r6, 0x0B00
    .byte 0xf7, 0x30
    call debug_print_r0_line
    mov r0, r6
    call debug_print_r0_line

    ; LD8U r0,[r1] (flash cold general F0)
    reset_regs
    ldi16 r0, 0xffff
    ldi16 r1, 0x0B00
    .byte 0xf0, 0x6c, 0x02
    call debug_print_r0_line

    ; LD16 r0,[r1] (flash cold general F0)
    reset_regs
    ldi16 r0, 0xffff
    ldi16 r1, 0x0B00
    .byte 0xf0, 0x6c, 0x12
    call debug_print_r0_line

    ; LD8U r0,[r1+7] (flash displaced ED): effective address 0x0B07.
    reset_regs
    ldi16 r0, 0xffff
    ldi16 r1, 0x0B00
    ld8u r0, [r1+7]
    call debug_print_r0_line

    ; LD16 r0,[r1-5] (flash displaced ED): effective address 0x0B00.
    reset_regs
    ldi16 r0, 0xffff
    ldi16 r1, 0x0B05
    ld16 r0, [r1-5]
    call debug_print_r0_line

    ; LD8U r0,[r1+] (flash cold general F0 postincrement)
    reset_regs
    ldi16 r0, 0xffff
    ldi16 r1, 0x0B00
    .byte 0xf0, 0x6c, 0x03
    call debug_print_r0_line
    mov r0, r1
    call debug_print_r0_line

    ; LD16 r0,[r1+] (flash cold general F0 postincrement)
    reset_regs
    ldi16 r0, 0xffff
    ldi16 r1, 0x0B00
    .byte 0xf0, 0x6c, 0x13
    call debug_print_r0_line
    mov r0, r1
    call debug_print_r0_line

    ; LDM8U r0,[0x0B00] (flash absolute F0)
    reset_regs
    ldi16 r0, 0xffff
    ldm8u r0, [0x0B00]
    call debug_print_r0_line

    ; LDM16 r0,[0x0B00] (flash absolute F0)
    reset_regs
    ldi16 r0, 0xffff
    ldm16 r0, [0x0B00]
    call debug_print_r0_line

    ; LD32 q0,[r4] (flash wide): q0 is r0:r1, with the low word in r0.
    reset_regs
    ldi16 r4, 0x0B00
    .byte 0xf0, 0x6a, 0x08
    call debug_print_r0_line
    mov r0, r1
    call debug_print_r0_line

    sys debug_break

.section .rodata,"a",@progbits
flash_table:
    .byte 0x12, 0x34, 0x56, 0x78, 0x90, 0xab, 0xcd, 0xef
    .byte 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88
