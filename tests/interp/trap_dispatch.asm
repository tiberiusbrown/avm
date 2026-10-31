; Fatal-trap integration fixture. The production __avm_trap_entry and
; __avm_trap_report come from libavm.a; this file defines only guest sites.
.section .text,"ax",@progbits
.globl _start
_start:
    mov r0, r0

; Known overflowing PUSH16 with SP seeded at 0x0900 by the harness. From reset
; SP = 0x0A00 this push is legal, so execution continues to the next site.
.globl overflow_site
overflow_site:
    push16 r0
    mov r0, r7

; Reserved SYS 0x04: fatal invalid-secondary trap.
.globl invalid_secondary_site
invalid_secondary_site:
    .byte 0xd7, 0x04
    mov r0, r7
