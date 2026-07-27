
C:/Users/Brown/Documents/GitHub/avm/build/projects/ardurogue2/ardurogue2.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0.c
00000000 l    df *ABS*	00000000 main.cpp
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000004 _start
00000104 g     F .text	0000001c main
00000120 g     F .text	00000002 avm_halt
00000500 g       *ABS*	00000000 __avm_framebuffer

Disassembly of section .text:

<_start>:
 d5 02                 call8	main
 d5 1c                 call8	avm_halt

<main>:
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c3 14                 ldi8	r7, 0x14
 c1 0a                 ldi8	r5, 0xa
 f0 00 01              ldi8	r0, 0x1
 01                    mov	r4, r5
 f4 48                 stsp16	[sp+0x2], r4
 0b                    mov	r6, r7
 f1 20                 mov	r4, r0
 f4 40                 stsp16	[sp+0x0], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 27                 sys	draw_filled_rect_white
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 1d                 sys	display
 d4 f6                 jmp8	main+18

<avm_halt>:
 d4 fe                 jmp8	avm_halt
