
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/text.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 text.c
00000159 l     O .rodata	00000014 .L.avm.flashstr.0
0000016d l     O .rodata	0000002c .L.avm.flashstr.1
00000199 l     O .rodata	0000002c .L.avm.flashstr.2
00000000 l    df *ABS*	00000000 font_5x7.c
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000015 _start
00000115 g     F .text	00000042 avm_test_main
00000157 g     F .text	00000002 avm_halt
00000500 g       *ABS*	00000000 __avm_framebuffer
000001c5 g     O .rodata	000004d6 _avm_font_5x7_storage

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
 d5 42                 call8	avm_halt

<avm_test_main>:
 b2                    push16	r2
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 d7 01                 sys	debug_break
 c4 c5 01              ldi16	r4, 0x1c5
 c1 00                 ldi8	r5, 0x0
 d7 31                 sys	set_text_font
 c5 e8 03              ldi16	r5, 0x3e8
 d7 02                 sys	millis
 ec 25                 udiv16	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 f0 12 00              leasp	r2, 0x0
 c6 59 01              ldi16	r6, 0x159
 c3 00                 ldi8	r7, 0x0
 f2 30                 sub	r0, r0
 a0                    xor	r4, r4
 c1 08                 ldi8	r5, 0x8
 d7 36                 sys	draw_textfv_p
 c6 6d 01              ldi16	r6, 0x16d
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 11                 ldi8	r5, 0x11
 d7 34                 sys	draw_text_p
 c6 99 01              ldi16	r6, 0x199
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 2c                 ldi8	r5, 0x2c
 d7 34                 sys	draw_text_p
 d7 01                 sys	debug_break
 f1 20                 mov	r4, r0
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 ba                    pop16	r2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
