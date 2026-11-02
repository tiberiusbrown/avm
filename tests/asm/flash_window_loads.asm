.include "include/debug_output.inc"

; The test link places .rodata at image offset 0x500, so AS0 0x0B00 is its first
; byte. Tests pass numeric AS0 addresses; a placement change fails the transcript.
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
    ; ld8u r4,[r4] at AS0 0x0B04
    reset_ld_regs
    ldi16 r4, 0x0B04
    ld8u r4, [r4]
    call debug_print_upper_regs
    ; ld8u r4,[r5] at AS0 0x0B05
    reset_ld_regs
    ldi16 r5, 0x0B05
    ld8u r4, [r5]
    call debug_print_upper_regs
    ; ld8u r4,[r6] at AS0 0x0B06
    reset_ld_regs
    ldi16 r6, 0x0B06
    ld8u r4, [r6]
    call debug_print_upper_regs
    ; ld8u r4,[r7] at AS0 0x0B07
    reset_ld_regs
    ldi16 r7, 0x0B07
    ld8u r4, [r7]
    call debug_print_upper_regs
    ; ld8u r5,[r4] at AS0 0x0B00
    reset_ld_regs
    ldi16 r4, 0x0B00
    ld8u r5, [r4]
    call debug_print_upper_regs
    ; ld8u r5,[r5] at AS0 0x0B01
    reset_ld_regs
    ldi16 r5, 0x0B01
    ld8u r5, [r5]
    call debug_print_upper_regs
    ; ld8u r5,[r6] at AS0 0x0B02
    reset_ld_regs
    ldi16 r6, 0x0B02
    ld8u r5, [r6]
    call debug_print_upper_regs
    ; ld8u r5,[r7] at AS0 0x0B03
    reset_ld_regs
    ldi16 r7, 0x0B03
    ld8u r5, [r7]
    call debug_print_upper_regs
    ; ld8u r6,[r4] at AS0 0x0B04
    reset_ld_regs
    ldi16 r4, 0x0B04
    ld8u r6, [r4]
    call debug_print_upper_regs
    ; ld8u r6,[r5] at AS0 0x0B05
    reset_ld_regs
    ldi16 r5, 0x0B05
    ld8u r6, [r5]
    call debug_print_upper_regs
    ; ld8u r6,[r6] at AS0 0x0B06
    reset_ld_regs
    ldi16 r6, 0x0B06
    ld8u r6, [r6]
    call debug_print_upper_regs
    ; ld8u r6,[r7] at AS0 0x0B07
    reset_ld_regs
    ldi16 r7, 0x0B07
    ld8u r6, [r7]
    call debug_print_upper_regs
    ; ld8u r7,[r4] at AS0 0x0B00
    reset_ld_regs
    ldi16 r4, 0x0B00
    ld8u r7, [r4]
    call debug_print_upper_regs
    ; ld8u r7,[r5] at AS0 0x0B01
    reset_ld_regs
    ldi16 r5, 0x0B01
    ld8u r7, [r5]
    call debug_print_upper_regs
    ; ld8u r7,[r6] at AS0 0x0B02
    reset_ld_regs
    ldi16 r6, 0x0B02
    ld8u r7, [r6]
    call debug_print_upper_regs
    ; ld8u r7,[r7] at AS0 0x0B03
    reset_ld_regs
    ldi16 r7, 0x0B03
    ld8u r7, [r7]
    call debug_print_upper_regs
    ; ld16 r4,[r4] at AS0 0x0B08
    reset_ld_regs
    ldi16 r4, 0x0B08
    ld16 r4, [r4]
    call debug_print_upper_regs
    ; ld16 r4,[r5] at AS0 0x0B09
    reset_ld_regs
    ldi16 r5, 0x0B09
    ld16 r4, [r5]
    call debug_print_upper_regs
    ; ld16 r4,[r6] at AS0 0x0B0A
    reset_ld_regs
    ldi16 r6, 0x0B0A
    ld16 r4, [r6]
    call debug_print_upper_regs
    ; ld16 r4,[r7] at AS0 0x0B0B
    reset_ld_regs
    ldi16 r7, 0x0B0B
    ld16 r4, [r7]
    call debug_print_upper_regs
    ; ld16 r5,[r4] at AS0 0x0B04
    reset_ld_regs
    ldi16 r4, 0x0B04
    ld16 r5, [r4]
    call debug_print_upper_regs
    ; ld16 r5,[r5] at AS0 0x0B05
    reset_ld_regs
    ldi16 r5, 0x0B05
    ld16 r5, [r5]
    call debug_print_upper_regs
    ; ld16 r5,[r6] at AS0 0x0B06
    reset_ld_regs
    ldi16 r6, 0x0B06
    ld16 r5, [r6]
    call debug_print_upper_regs
    ; ld16 r5,[r7] at AS0 0x0B07
    reset_ld_regs
    ldi16 r7, 0x0B07
    ld16 r5, [r7]
    call debug_print_upper_regs
    ; ld16 r6,[r4] at AS0 0x0B08
    reset_ld_regs
    ldi16 r4, 0x0B08
    ld16 r6, [r4]
    call debug_print_upper_regs
    ; ld16 r6,[r5] at AS0 0x0B09
    reset_ld_regs
    ldi16 r5, 0x0B09
    ld16 r6, [r5]
    call debug_print_upper_regs
    ; ld16 r6,[r6] at AS0 0x0B0A
    reset_ld_regs
    ldi16 r6, 0x0B0A
    ld16 r6, [r6]
    call debug_print_upper_regs
    ; ld16 r6,[r7] at AS0 0x0B0B
    reset_ld_regs
    ldi16 r7, 0x0B0B
    ld16 r6, [r7]
    call debug_print_upper_regs
    ; ld16 r7,[r4] at AS0 0x0B04
    reset_ld_regs
    ldi16 r4, 0x0B04
    ld16 r7, [r4]
    call debug_print_upper_regs
    ; ld16 r7,[r5] at AS0 0x0B05
    reset_ld_regs
    ldi16 r5, 0x0B05
    ld16 r7, [r5]
    call debug_print_upper_regs
    ; ld16 r7,[r6] at AS0 0x0B06
    reset_ld_regs
    ldi16 r6, 0x0B06
    ld16 r7, [r6]
    call debug_print_upper_regs
    ; ld16 r7,[r7] at AS0 0x0B07
    reset_ld_regs
    ldi16 r7, 0x0B07
    ld16 r7, [r7]
    call debug_print_upper_regs
    ; ld8u r4,[r6] at AS0 0x0B00
    reset_ld_regs
    ldi16 r6, 0x0B00
    ld8u r4, [r6]
    call debug_print_upper_regs
    ; ld8u r4,[r6] at AS0 0x0B01
    reset_ld_regs
    ldi16 r6, 0x0B01
    ld8u r4, [r6]
    call debug_print_upper_regs
    ; ld8u r4,[r6] at AS0 0x0B06
    reset_ld_regs
    ldi16 r6, 0x0B06
    ld8u r4, [r6]
    call debug_print_upper_regs
    ; ld8u r4,[r6] at AS0 0x0B07
    reset_ld_regs
    ldi16 r6, 0x0B07
    ld8u r4, [r6]
    call debug_print_upper_regs
    ; ld16 r4,[r6] at AS0 0x0B00
    reset_ld_regs
    ldi16 r6, 0x0B00
    ld16 r4, [r6]
    call debug_print_upper_regs
    ; ld16 r4,[r6] at AS0 0x0B06
    reset_ld_regs
    ldi16 r6, 0x0B06
    ld16 r4, [r6]
    call debug_print_upper_regs
    ; ld16 r4,[r6] at AS0 0x0B0E
    reset_ld_regs
    ldi16 r6, 0x0B0E
    ld16 r4, [r6]
    call debug_print_upper_regs
    ; ld8u r0,[r1+7] with r1=0x0AF9
    ldi16 r1, 0x0AF9
    ld8u r0, [r1+7]
    call debug_print_r0
    ldi8 r4, '\n'
    sys debug_putc
    ; ld16 r0,[r1-5] with r1=0x0B05
    ldi16 r1, 0x0B05
    ld16 r0, [r1-5]
    call debug_print_r0
    ldi8 r4, '\n'
    sys debug_putc
    ; ld8u r0,[r1+0] with r1=0x0B01
    ldi16 r1, 0x0B01
    ld8u r0, [r1+0]
    call debug_print_r0
    ldi8 r4, '\n'
    sys debug_putc
    ; ld16 r0,[r1+1] with r1=0x0AFF
    ldi16 r1, 0x0AFF
    ld16 r0, [r1+1]
    call debug_print_r0
    ldi8 r4, '\n'
    sys debug_putc
    ; ldm8u r0, 0x0B02
    reset_ld_regs
    ldm8u r0, [0x0B02]
    mov r4, r0
    call debug_print_upper_regs
    ; ldm8u r1, 0x0B03
    reset_ld_regs
    ldm8u r1, [0x0B03]
    mov r4, r1
    call debug_print_upper_regs
    ; ldm8u r2, 0x0B04
    reset_ld_regs
    ldm8u r2, [0x0B04]
    mov r4, r2
    call debug_print_upper_regs
    ; ldm8u r3, 0x0B05
    reset_ld_regs
    ldm8u r3, [0x0B05]
    mov r4, r3
    call debug_print_upper_regs
    ; ldm8u r4, 0x0B06
    reset_ld_regs
    ldm8u r4, [0x0B06]
    call debug_print_upper_regs
    ; ldm8u r5, 0x0B07
    reset_ld_regs
    ldm8u r5, [0x0B07]
    call debug_print_upper_regs
    ; ldm8u r6, 0x0B08
    reset_ld_regs
    ldm8u r6, [0x0B08]
    call debug_print_upper_regs
    ; ldm8u r7, 0x0B09
    reset_ld_regs
    ldm8u r7, [0x0B09]
    call debug_print_upper_regs
    ; ldm16 r0, 0x0B03
    reset_ld_regs
    ldm16 r0, [0x0B03]
    mov r4, r0
    call debug_print_upper_regs
    ; ldm16 r1, 0x0B04
    reset_ld_regs
    ldm16 r1, [0x0B04]
    mov r4, r1
    call debug_print_upper_regs
    ; ldm16 r2, 0x0B05
    reset_ld_regs
    ldm16 r2, [0x0B05]
    mov r4, r2
    call debug_print_upper_regs
    ; ldm16 r3, 0x0B06
    reset_ld_regs
    ldm16 r3, [0x0B06]
    mov r4, r3
    call debug_print_upper_regs
    ; ldm16 r4, 0x0B07
    reset_ld_regs
    ldm16 r4, [0x0B07]
    call debug_print_upper_regs
    ; ldm16 r5, 0x0B08
    reset_ld_regs
    ldm16 r5, [0x0B08]
    call debug_print_upper_regs
    ; ldm16 r6, 0x0B09
    reset_ld_regs
    ldm16 r6, [0x0B09]
    call debug_print_upper_regs
    ; ldm16 r7, 0x0B0A
    reset_ld_regs
    ldm16 r7, [0x0B0A]
    call debug_print_upper_regs
    ; ld8u r4, [r0] at AS0 0x0B09
    reset_ld_regs
    ldi16 r0, 0x0B09
    ld8u r4, [r0]
    call debug_print_upper_regs
    ; ld16 r4, [r0] at AS0 0x0B09
    reset_ld_regs
    ldi16 r0, 0x0B09
    ld16 r4, [r0]
    call debug_print_upper_regs
    ; ld8u r5, [r1] at AS0 0x0B09
    reset_ld_regs
    ldi16 r1, 0x0B09
    ld8u r5, [r1]
    call debug_print_upper_regs
    ; ld16 r5, [r1] at AS0 0x0B09
    reset_ld_regs
    ldi16 r1, 0x0B09
    ld16 r5, [r1]
    call debug_print_upper_regs
    ; ld8u r6, [r2] at AS0 0x0B09
    reset_ld_regs
    ldi16 r2, 0x0B09
    ld8u r6, [r2]
    call debug_print_upper_regs
    ; ld16 r6, [r2] at AS0 0x0B09
    reset_ld_regs
    ldi16 r2, 0x0B09
    ld16 r6, [r2]
    call debug_print_upper_regs
    ; ld8u r7, [r3] at AS0 0x0B09
    reset_ld_regs
    ldi16 r3, 0x0B09
    ld8u r7, [r3]
    call debug_print_upper_regs
    ; ld16 r7, [r3] at AS0 0x0B09
    reset_ld_regs
    ldi16 r3, 0x0B09
    ld16 r7, [r3]
    call debug_print_upper_regs
    ; ld8u r0, [r1] at AS0 0x0B09
    reset_ld_regs
    ldi16 r1, 0x0B09
    ld8u r0, [r1]
    mov r4, r0
    call debug_print_upper_regs
    ; ld16 r0, [r1] at AS0 0x0B09
    reset_ld_regs
    ldi16 r1, 0x0B09
    ld16 r0, [r1]
    mov r4, r0
    call debug_print_upper_regs
    ; ld8u r2, [r3] at AS0 0x0B09
    reset_ld_regs
    ldi16 r3, 0x0B09
    ld8u r2, [r3]
    mov r4, r2
    call debug_print_upper_regs
    ; ld16 r2, [r3] at AS0 0x0B09
    reset_ld_regs
    ldi16 r3, 0x0B09
    ld16 r2, [r3]
    mov r4, r2
    call debug_print_upper_regs
    ; ld8u r3, [r0] at AS0 0x0B09
    reset_ld_regs
    ldi16 r0, 0x0B09
    ld8u r3, [r0]
    mov r4, r3
    call debug_print_upper_regs
    ; ld16 r3, [r0] at AS0 0x0B09
    reset_ld_regs
    ldi16 r0, 0x0B09
    ld16 r3, [r0]
    mov r4, r3
    call debug_print_upper_regs
    ; ld8u r4, [r0+] at AS0 0x0B09
    reset_ld_regs
    ldi16 r0, 0x0B09
    ld8u r4, [r0+]
    mov r7, r0
    call debug_print_upper_regs
    ; ld16 r4, [r0+] at AS0 0x0B09
    reset_ld_regs
    ldi16 r0, 0x0B09
    ld16 r4, [r0+]
    mov r7, r0
    call debug_print_upper_regs
    ; ld8u r5, [r1+] at AS0 0x0B09
    reset_ld_regs
    ldi16 r1, 0x0B09
    ld8u r5, [r1+]
    mov r7, r1
    call debug_print_upper_regs
    ; ld16 r5, [r1+] at AS0 0x0B09
    reset_ld_regs
    ldi16 r1, 0x0B09
    ld16 r5, [r1+]
    mov r7, r1
    call debug_print_upper_regs
    ; ld8u r6, [r2+] at AS0 0x0B09
    reset_ld_regs
    ldi16 r2, 0x0B09
    ld8u r6, [r2+]
    mov r7, r2
    call debug_print_upper_regs
    ; ld16 r6, [r2+] at AS0 0x0B09
    reset_ld_regs
    ldi16 r2, 0x0B09
    ld16 r6, [r2+]
    mov r7, r2
    call debug_print_upper_regs
    ; ld32 q1, [r6] at AS0 0x0B01, RRSPEC32=0x4C
    reset_ld_regs
    ldi16 r6, 0x0B01
    .byte 0xf0, 0x6a, 0x4c
    mov r4, r2
    mov r5, r3
    call debug_print_upper_regs
    ; ld32 q0, [r7] at AS0 0x0B0C, RRSPEC32=0x0E
    reset_ld_regs
    ldi16 r7, 0x0B0C
    .byte 0xf0, 0x6a, 0x0e
    mov r4, r0
    mov r5, r1
    call debug_print_upper_regs
    ; ld32 q3, [r6] at AS0 0x0B04, RRSPEC32=0xCC
    reset_ld_regs
    ldi16 r6, 0x0B04
    .byte 0xf0, 0x6a, 0xcc
    mov r4, r6
    mov r5, r7
    call debug_print_upper_regs
    ; ld8u r0,[r4] at AS0 0x0B04
    reset_ld_regs
    ldi16 r4, 0x0B04
    ld8u r0, [r4]
    mov r4, r0
    call debug_print_upper_regs
    ; ld16 r0,[r4] at AS0 0x0B08
    reset_ld_regs
    ldi16 r4, 0x0B08
    ld16 r0, [r4]
    mov r4, r0
    call debug_print_upper_regs
    ; ld8u r0,[r5] at AS0 0x0B05
    reset_ld_regs
    ldi16 r5, 0x0B05
    ld8u r0, [r5]
    mov r4, r0
    call debug_print_upper_regs
    ; ld16 r0,[r5] at AS0 0x0B09
    reset_ld_regs
    ldi16 r5, 0x0B09
    ld16 r0, [r5]
    mov r4, r0
    call debug_print_upper_regs
    ; ld8u r0,[r6] at AS0 0x0B06
    reset_ld_regs
    ldi16 r6, 0x0B06
    ld8u r0, [r6]
    mov r4, r0
    call debug_print_upper_regs
    ; ld16 r0,[r6] at AS0 0x0B0A
    reset_ld_regs
    ldi16 r6, 0x0B0A
    ld16 r0, [r6]
    mov r4, r0
    call debug_print_upper_regs
    ; ld8u r0,[r7] at AS0 0x0B07
    reset_ld_regs
    ldi16 r7, 0x0B07
    ld8u r0, [r7]
    mov r4, r0
    call debug_print_upper_regs
    ; ld16 r0,[r7] at AS0 0x0B0B
    reset_ld_regs
    ldi16 r7, 0x0B0B
    ld16 r0, [r7]
    mov r4, r0
    call debug_print_upper_regs
    ; ld8u r1,[r4] at AS0 0x0B08
    reset_ld_regs
    ldi16 r4, 0x0B08
    ld8u r1, [r4]
    mov r4, r1
    call debug_print_upper_regs
    ; ld16 r1,[r4] at AS0 0x0B0C
    reset_ld_regs
    ldi16 r4, 0x0B0C
    ld16 r1, [r4]
    mov r4, r1
    call debug_print_upper_regs
    ; ld8u r1,[r5] at AS0 0x0B09
    reset_ld_regs
    ldi16 r5, 0x0B09
    ld8u r1, [r5]
    mov r4, r1
    call debug_print_upper_regs
    ; ld16 r1,[r5] at AS0 0x0B0D
    reset_ld_regs
    ldi16 r5, 0x0B0D
    ld16 r1, [r5]
    mov r4, r1
    call debug_print_upper_regs
    ; ld8u r1,[r6] at AS0 0x0B0A
    reset_ld_regs
    ldi16 r6, 0x0B0A
    ld8u r1, [r6]
    mov r4, r1
    call debug_print_upper_regs
    ; ld16 r1,[r6] at AS0 0x0B0E
    reset_ld_regs
    ldi16 r6, 0x0B0E
    ld16 r1, [r6]
    mov r4, r1
    call debug_print_upper_regs
    ; ld8u r1,[r7] at AS0 0x0B0B
    reset_ld_regs
    ldi16 r7, 0x0B0B
    ld8u r1, [r7]
    mov r4, r1
    call debug_print_upper_regs
    ; ld16 r1,[r7] at AS0 0x0B0F
    reset_ld_regs
    ldi16 r7, 0x0B0F
    ld16 r1, [r7]
    mov r4, r1
    call debug_print_upper_regs
    ; ld8u r2,[r4] at AS0 0x0B0C
    reset_ld_regs
    ldi16 r4, 0x0B0C
    ld8u r2, [r4]
    mov r4, r2
    call debug_print_upper_regs
    ; ld16 r2,[r4] at AS0 0x0B10
    reset_ld_regs
    ldi16 r4, 0x0B10
    ld16 r2, [r4]
    mov r4, r2
    call debug_print_upper_regs
    ; ld8u r2,[r5] at AS0 0x0B0D
    reset_ld_regs
    ldi16 r5, 0x0B0D
    ld8u r2, [r5]
    mov r4, r2
    call debug_print_upper_regs
    ; ld16 r2,[r5] at AS0 0x0B11
    reset_ld_regs
    ldi16 r5, 0x0B11
    ld16 r2, [r5]
    mov r4, r2
    call debug_print_upper_regs
    ; ld8u r2,[r6] at AS0 0x0B0E
    reset_ld_regs
    ldi16 r6, 0x0B0E
    ld8u r2, [r6]
    mov r4, r2
    call debug_print_upper_regs
    ; ld16 r2,[r6] at AS0 0x0B12
    reset_ld_regs
    ldi16 r6, 0x0B12
    ld16 r2, [r6]
    mov r4, r2
    call debug_print_upper_regs
    ; ld8u r2,[r7] at AS0 0x0B0F
    reset_ld_regs
    ldi16 r7, 0x0B0F
    ld8u r2, [r7]
    mov r4, r2
    call debug_print_upper_regs
    ; ld16 r2,[r7] at AS0 0x0B13
    reset_ld_regs
    ldi16 r7, 0x0B13
    ld16 r2, [r7]
    mov r4, r2
    call debug_print_upper_regs
    ; ld8u r3,[r4] at AS0 0x0B10
    reset_ld_regs
    ldi16 r4, 0x0B10
    ld8u r3, [r4]
    mov r4, r3
    call debug_print_upper_regs
    ; ld16 r3,[r4] at AS0 0x0B14
    reset_ld_regs
    ldi16 r4, 0x0B14
    ld16 r3, [r4]
    mov r4, r3
    call debug_print_upper_regs
    ; ld8u r3,[r5] at AS0 0x0B11
    reset_ld_regs
    ldi16 r5, 0x0B11
    ld8u r3, [r5]
    mov r4, r3
    call debug_print_upper_regs
    ; ld16 r3,[r5] at AS0 0x0B15
    reset_ld_regs
    ldi16 r5, 0x0B15
    ld16 r3, [r5]
    mov r4, r3
    call debug_print_upper_regs
    ; ld8u r3,[r6] at AS0 0x0B12
    reset_ld_regs
    ldi16 r6, 0x0B12
    ld8u r3, [r6]
    mov r4, r3
    call debug_print_upper_regs
    ; ld16 r3,[r6] at AS0 0x0B16
    reset_ld_regs
    ldi16 r6, 0x0B16
    ld16 r3, [r6]
    mov r4, r3
    call debug_print_upper_regs
    ; ld8u r3,[r7] at AS0 0x0B13
    reset_ld_regs
    ldi16 r7, 0x0B13
    ld8u r3, [r7]
    mov r4, r3
    call debug_print_upper_regs
    ; ld16 r3,[r7] at AS0 0x0B17
    reset_ld_regs
    ldi16 r7, 0x0B17
    ld16 r3, [r7]
    mov r4, r3
    call debug_print_upper_regs
    ; ld8u r0, [r4+] at AS0 0x0B04
    reset_ld_regs
    ldi16 r4, 0x0B04
    ld8u r0, [r4+]
    mov r4, r0
    call debug_print_upper_regs
    ; ld16 r0, [r4+] at AS0 0x0B08
    reset_ld_regs
    ldi16 r4, 0x0B08
    ld16 r0, [r4+]
    mov r4, r0
    call debug_print_upper_regs
    ; ld8u r0, [r5+] at AS0 0x0B05
    reset_ld_regs
    ldi16 r5, 0x0B05
    ld8u r0, [r5+]
    mov r4, r0
    call debug_print_upper_regs
    ; ld16 r0, [r5+] at AS0 0x0B09
    reset_ld_regs
    ldi16 r5, 0x0B09
    ld16 r0, [r5+]
    mov r4, r0
    call debug_print_upper_regs
    ; ld8u r0, [r6+] at AS0 0x0B06
    reset_ld_regs
    ldi16 r6, 0x0B06
    ld8u r0, [r6+]
    mov r4, r0
    call debug_print_upper_regs
    ; ld16 r0, [r6+] at AS0 0x0B0A
    reset_ld_regs
    ldi16 r6, 0x0B0A
    ld16 r0, [r6+]
    mov r4, r0
    call debug_print_upper_regs
    ; ld8u r0, [r7+] at AS0 0x0B07
    reset_ld_regs
    ldi16 r7, 0x0B07
    ld8u r0, [r7+]
    mov r4, r0
    call debug_print_upper_regs
    ; ld16 r0, [r7+] at AS0 0x0B0B
    reset_ld_regs
    ldi16 r7, 0x0B0B
    ld16 r0, [r7+]
    mov r4, r0
    call debug_print_upper_regs
    ; ld8u r1, [r4+] at AS0 0x0B08
    reset_ld_regs
    ldi16 r4, 0x0B08
    ld8u r1, [r4+]
    mov r4, r1
    call debug_print_upper_regs
    ; ld16 r1, [r4+] at AS0 0x0B0C
    reset_ld_regs
    ldi16 r4, 0x0B0C
    ld16 r1, [r4+]
    mov r4, r1
    call debug_print_upper_regs
    ; ld8u r1, [r5+] at AS0 0x0B09
    reset_ld_regs
    ldi16 r5, 0x0B09
    ld8u r1, [r5+]
    mov r4, r1
    call debug_print_upper_regs
    ; ld16 r1, [r5+] at AS0 0x0B0D
    reset_ld_regs
    ldi16 r5, 0x0B0D
    ld16 r1, [r5+]
    mov r4, r1
    call debug_print_upper_regs
    ; ld8u r1, [r6+] at AS0 0x0B0A
    reset_ld_regs
    ldi16 r6, 0x0B0A
    ld8u r1, [r6+]
    mov r4, r1
    call debug_print_upper_regs
    ; ld16 r1, [r6+] at AS0 0x0B0E
    reset_ld_regs
    ldi16 r6, 0x0B0E
    ld16 r1, [r6+]
    mov r4, r1
    call debug_print_upper_regs
    ; ld8u r1, [r7+] at AS0 0x0B0B
    reset_ld_regs
    ldi16 r7, 0x0B0B
    ld8u r1, [r7+]
    mov r4, r1
    call debug_print_upper_regs
    ; ld16 r1, [r7+] at AS0 0x0B0F
    reset_ld_regs
    ldi16 r7, 0x0B0F
    ld16 r1, [r7+]
    mov r4, r1
    call debug_print_upper_regs
    ; ld8u r2, [r4+] at AS0 0x0B0C
    reset_ld_regs
    ldi16 r4, 0x0B0C
    ld8u r2, [r4+]
    mov r4, r2
    call debug_print_upper_regs
    ; ld16 r2, [r4+] at AS0 0x0B10
    reset_ld_regs
    ldi16 r4, 0x0B10
    ld16 r2, [r4+]
    mov r4, r2
    call debug_print_upper_regs
    ; ld8u r2, [r5+] at AS0 0x0B0D
    reset_ld_regs
    ldi16 r5, 0x0B0D
    ld8u r2, [r5+]
    mov r4, r2
    call debug_print_upper_regs
    ; ld16 r2, [r5+] at AS0 0x0B11
    reset_ld_regs
    ldi16 r5, 0x0B11
    ld16 r2, [r5+]
    mov r4, r2
    call debug_print_upper_regs
    ; ld8u r2, [r6+] at AS0 0x0B0E
    reset_ld_regs
    ldi16 r6, 0x0B0E
    ld8u r2, [r6+]
    mov r4, r2
    call debug_print_upper_regs
    ; ld16 r2, [r6+] at AS0 0x0B12
    reset_ld_regs
    ldi16 r6, 0x0B12
    ld16 r2, [r6+]
    mov r4, r2
    call debug_print_upper_regs
    ; ld8u r2, [r7+] at AS0 0x0B0F
    reset_ld_regs
    ldi16 r7, 0x0B0F
    ld8u r2, [r7+]
    mov r4, r2
    call debug_print_upper_regs
    ; ld16 r2, [r7+] at AS0 0x0B13
    reset_ld_regs
    ldi16 r7, 0x0B13
    ld16 r2, [r7+]
    mov r4, r2
    call debug_print_upper_regs
    ; ld8u r3, [r4+] at AS0 0x0B00
    reset_ld_regs
    ldi16 r4, 0x0B00
    ld8u r3, [r4+]
    mov r4, r3
    call debug_print_upper_regs
    ; ld16 r3, [r4+] at AS0 0x0B04
    reset_ld_regs
    ldi16 r4, 0x0B04
    ld16 r3, [r4+]
    mov r4, r3
    call debug_print_upper_regs
    ; ld8u r3, [r5+] at AS0 0x0B01
    reset_ld_regs
    ldi16 r5, 0x0B01
    ld8u r3, [r5+]
    mov r4, r3
    call debug_print_upper_regs
    ; ld16 r3, [r5+] at AS0 0x0B05
    reset_ld_regs
    ldi16 r5, 0x0B05
    ld16 r3, [r5+]
    mov r4, r3
    call debug_print_upper_regs
    ; ld8u r3, [r6+] at AS0 0x0B02
    reset_ld_regs
    ldi16 r6, 0x0B02
    ld8u r3, [r6+]
    mov r4, r3
    call debug_print_upper_regs
    ; ld16 r3, [r6+] at AS0 0x0B06
    reset_ld_regs
    ldi16 r6, 0x0B06
    ld16 r3, [r6+]
    mov r4, r3
    call debug_print_upper_regs
    ; ld8u r3, [r7+] at AS0 0x0B03
    reset_ld_regs
    ldi16 r7, 0x0B03
    ld8u r3, [r7+]
    mov r4, r3
    call debug_print_upper_regs
    ; ld16 r3, [r7+] at AS0 0x0B07
    reset_ld_regs
    ldi16 r7, 0x0B07
    ld16 r3, [r7+]
    mov r4, r3
    call debug_print_upper_regs
    ; ld8u r4, [r5+] at AS0 0x0B05
    reset_ld_regs
    ldi16 r5, 0x0B05
    ld8u r4, [r5+]
    call debug_print_upper_regs
    ; ld16 r4, [r5+] at AS0 0x0B09
    reset_ld_regs
    ldi16 r5, 0x0B09
    ld16 r4, [r5+]
    call debug_print_upper_regs
    ; ld8u r4, [r6+] at AS0 0x0B06
    reset_ld_regs
    ldi16 r6, 0x0B06
    ld8u r4, [r6+]
    call debug_print_upper_regs
    ; ld16 r4, [r6+] at AS0 0x0B0A
    reset_ld_regs
    ldi16 r6, 0x0B0A
    ld16 r4, [r6+]
    call debug_print_upper_regs
    ; ld8u r4, [r7+] at AS0 0x0B07
    reset_ld_regs
    ldi16 r7, 0x0B07
    ld8u r4, [r7+]
    call debug_print_upper_regs
    ; ld16 r4, [r7+] at AS0 0x0B0B
    reset_ld_regs
    ldi16 r7, 0x0B0B
    ld16 r4, [r7+]
    call debug_print_upper_regs
    ; ld8u r5, [r4+] at AS0 0x0B08
    reset_ld_regs
    ldi16 r4, 0x0B08
    ld8u r5, [r4+]
    call debug_print_upper_regs
    ; ld16 r5, [r4+] at AS0 0x0B0C
    reset_ld_regs
    ldi16 r4, 0x0B0C
    ld16 r5, [r4+]
    call debug_print_upper_regs
    ; ld8u r5, [r6+] at AS0 0x0B0A
    reset_ld_regs
    ldi16 r6, 0x0B0A
    ld8u r5, [r6+]
    call debug_print_upper_regs
    ; ld16 r5, [r6+] at AS0 0x0B0E
    reset_ld_regs
    ldi16 r6, 0x0B0E
    ld16 r5, [r6+]
    call debug_print_upper_regs
    ; ld8u r5, [r7+] at AS0 0x0B0B
    reset_ld_regs
    ldi16 r7, 0x0B0B
    ld8u r5, [r7+]
    call debug_print_upper_regs
    ; ld16 r5, [r7+] at AS0 0x0B0F
    reset_ld_regs
    ldi16 r7, 0x0B0F
    ld16 r5, [r7+]
    call debug_print_upper_regs
    ; ld8u r6, [r4+] at AS0 0x0B0C
    reset_ld_regs
    ldi16 r4, 0x0B0C
    ld8u r6, [r4+]
    call debug_print_upper_regs
    ; ld16 r6, [r4+] at AS0 0x0B10
    reset_ld_regs
    ldi16 r4, 0x0B10
    ld16 r6, [r4+]
    call debug_print_upper_regs
    ; ld8u r6, [r5+] at AS0 0x0B0D
    reset_ld_regs
    ldi16 r5, 0x0B0D
    ld8u r6, [r5+]
    call debug_print_upper_regs
    ; ld16 r6, [r5+] at AS0 0x0B11
    reset_ld_regs
    ldi16 r5, 0x0B11
    ld16 r6, [r5+]
    call debug_print_upper_regs
    ; ld8u r6, [r7+] at AS0 0x0B0F
    reset_ld_regs
    ldi16 r7, 0x0B0F
    ld8u r6, [r7+]
    call debug_print_upper_regs
    ; ld16 r6, [r7+] at AS0 0x0B13
    reset_ld_regs
    ldi16 r7, 0x0B13
    ld16 r6, [r7+]
    call debug_print_upper_regs
    ; ld8u r7, [r4+] at AS0 0x0B00
    reset_ld_regs
    ldi16 r4, 0x0B00
    ld8u r7, [r4+]
    call debug_print_upper_regs
    ; ld16 r7, [r4+] at AS0 0x0B04
    reset_ld_regs
    ldi16 r4, 0x0B04
    ld16 r7, [r4+]
    call debug_print_upper_regs
    ; ld8u r7, [r5+] at AS0 0x0B01
    reset_ld_regs
    ldi16 r5, 0x0B01
    ld8u r7, [r5+]
    call debug_print_upper_regs
    ; ld16 r7, [r5+] at AS0 0x0B05
    reset_ld_regs
    ldi16 r5, 0x0B05
    ld16 r7, [r5+]
    call debug_print_upper_regs
    ; ld8u r7, [r6+] at AS0 0x0B02
    reset_ld_regs
    ldi16 r6, 0x0B02
    ld8u r7, [r6+]
    call debug_print_upper_regs
    ; ld16 r7, [r6+] at AS0 0x0B06
    reset_ld_regs
    ldi16 r6, 0x0B06
    ld16 r7, [r6+]
    call debug_print_upper_regs
    ; VM flags survive a flash F7 postincrement load: cmp sets Z, and the load must
    ; not clear it. Prints P when Z is still set.
    ldi16 r0, 0x1234
    cmp   r0, r0
    ldi16 r6, 0x0B09
    ld8u  r4, [r6+]
    breq8 .Lflags_z_kept
    ldi8  r4, 'F'
    sys   debug_putc
    jmp8  .Lflags_done
.Lflags_z_kept:
    ldi8  r4, 'P'
    sys   debug_putc
.Lflags_done:
    ldi8  r4, '\n'
    sys   debug_putc
    sys debug_break

.section .rodata,"a",@progbits
flash_bytes:
    .byte 0x46, 0x4C, 0x41, 0x53, 0x48, 0x21, 0x80, 0xFF
    .byte 0x12, 0x34, 0x56, 0x78, 0x9A, 0xBC, 0xDE, 0xF0
    .byte 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08
    .byte 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10
