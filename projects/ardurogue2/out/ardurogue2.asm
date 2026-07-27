
C:/Users/Brown/Documents/GitHub/avm/build/projects/ardurogue2/ardurogue2.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0.c
00000000 l    df *ABS*	00000000 main.cpp
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000004 _start
00000104 g     F .text	0000000e main
00000112 g     F .text	00000002 avm_halt
00000500 g       *ABS*	00000000 __avm_framebuffer

Disassembly of section .text:

<_start>:
 d5 02                 call8	main
 d5 0e                 call8	avm_halt

<main>:
 c1 0a                 ldi8	r5, 0xa
 c2 14                 ldi8	r6, 0x14
 01                    mov	r4, r5
 0e                    mov	r7, r6
 d7 27                 sys	draw_filled_rect_white
 c0 01                 ldi8	r4, 0x1
 d7 1d                 sys	display
 d4 f6                 jmp8	main+4

<avm_halt>:
 d4 fe                 jmp8	avm_halt
