; Program-space code whose addresses fall inside the data-space .flash window.
;
; The linker places .flash at data address 0x0B00. Program and data addresses
; with the same low bits are different locations, so the loop below must be
; disassembled from .text even though its addresses also name bytes of .flash.
; The .flash bytes (0x02) decode as `mov r4, r6` if they are misread as code.
; The window spans 0x0B00-0x0EFF. Packed program text follows the .flash bytes
; (near 0x0900 here) and the padding places the loop near 0x0D00, so the
; fixture tolerates a few hundred bytes of layout drift.
.section .flash,"a",@progbits
.globl flash_window_data
flash_window_data:
    .fill 0x400, 1, 0x02

.section .text,"ax",@progbits
.globl _start
.type _start, @function
_start:
    jmp16 .Lwindow
    ; Never executed. Moves .Lwindow into the .flash address range.
    .fill 0x400, 1, 0xff
.Lwindow:
    ldi16 r4, 3
    ldi16 r5, 0
.Lagain:
    dec16 r4
    cmp r4, r5
    brne8 .Lagain
    sys debug_break
.Lfault:
    .byte 0xff
.size _start, .-_start
