
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/text.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 text.c
0000014e l     F .text	00000024 avm_draw_textf_P
00000188 l     O .rodata	0000002c .L.avm.flashstr.1
000001b4 l     O .rodata	0000002c .L.avm.flashstr.2
00000174 l     O .rodata	00000014 .L.avm.flashstr.0
00000000 l    df *ABS*	00000000 font_5x7.c
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000015 _start
00000115 g     F .text	00000039 avm_test_main
00000172 g     F .text	00000002 avm_halt
00000500 g       *ABS*	00000000 __avm_framebuffer
000001e0 g     O .rodata	000004d6 _avm_font_5x7_storage

Disassembly of section .text:

<_start>:
 d5 13                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 01                    mov	r4, r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 d5 5d                 call8	avm_halt

<avm_test_main>:
 b2                    push16	r2
 d7 01                 sys	debug_break
 c4 e0 01              ldi16	r4, 0x1e0
 c1 00                 ldi8	r5, 0x0
 d7 31                 sys	set_text_font
 c5 e8 03              ldi16	r5, 0x3e8
 d7 02                 sys	millis
 ec 25                 udiv16	r4, r5
 d6 f7                 adjsp	-0x9
 f4 5c                 stsp16	[sp+0x7], r4
 f4 50                 stsp16	[sp+0x4], r4
 f1 49                 stsp8	[sp+0x6], r5
 d5 1e                 call8	avm_draw_textf_P
 d6 09                 adjsp	0x9
 c6 88 01              ldi16	r6, 0x188
 c3 00                 ldi8	r7, 0x0
 f2 42                 sub	r2, r2
 a0                    xor	r4, r4
 c1 11                 ldi8	r5, 0x11
 d7 34                 sys	draw_text_p
 c6 b4 01              ldi16	r6, 0x1b4
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 2c                 ldi8	r5, 0x2c
 d7 34                 sys	draw_text_p
 d7 01                 sys	debug_break
 f1 22                 mov	r4, r2
 ba                    pop16	r2
 ef                    ret

<avm_draw_textf_P>:
 b2                    push16	r2
 d6 fa                 adjsp	-0x6
 f4 3c                 ldsp16	r4, [sp+0xf]
 f0 1d 11              ldsp8u	r5, [sp+0x11]
 f0 12 12              leasp	r2, 0x12
 f0 3a 04              stsp16	[sp+0x4], r2
 c6 74 01              ldi16	r6, 0x174
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 08                 ldi8	r5, 0x8
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 d7 36                 sys	draw_textfv_p
 d6 06                 adjsp	0x6
 ba                    pop16	r2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
