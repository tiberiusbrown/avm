
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/draw_text_P.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 draw_text_P.c
00000133 l     O .rodata	0000002c .L.avm.flashstr.0
00000000 l    df *ABS*	00000000 font_5x7.c
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000015 _start
00000115 g     F .text	0000001c avm_test_main
00000131 g     F .text	00000002 avm_halt
00000500 g       *ABS*	00000000 __avm_framebuffer
0000015f g     O .rodata	00000477 _avm_font_5x7_storage

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
 d5 1c                 call8	avm_halt

<avm_test_main>:
 b2                    push16	r2
 d7 01                 sys	debug_break
 c4 5f 01              ldi16	r4, 0x15f
 c1 00                 ldi8	r5, 0x0
 d7 31                 sys	set_text_font
 c6 33 01              ldi16	r6, 0x133
 c3 00                 ldi8	r7, 0x0
 f2 42                 sub	r2, r2
 a0                    xor	r4, r4
 c1 11                 ldi8	r5, 0x11
 d7 34                 sys	draw_text_p
 d7 01                 sys	debug_break
 f1 22                 mov	r4, r2
 ba                    pop16	r2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
