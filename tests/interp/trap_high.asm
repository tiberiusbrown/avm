; High-address trap fixture. The handler in trap_high.c is placed at 0x10100
; through --section-start=.high_trap_text=0x10100.
.section .text,"ax",@progbits
.globl _start
_start:
    mov r0, r0

.globl high_site
high_site:
    .byte 0xd7, 0x04
    mov r0, r7
