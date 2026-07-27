
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/tilesrect.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 tilesrect.c
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000016 _start
00000116 g     F .text	00000216 avm_test_main
0000032c g     F .text	00000002 avm_halt
00000500 g       *ABS*	00000000 __avm_framebuffer

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 01                    mov	r4, r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 16 02              call16	avm_halt

<avm_test_main>:
 b0                    push16	r0
 d7 01                 sys	debug_break
 f2 30                 sub	r0, r0
 a5                    xor	r5, r5
 c2 08                 ldi8	r6, 0x8
 c3 08                 ldi8	r7, 0x8
 a0                    xor	r4, r4
 d7 28                 sys	draw_filled_rect_black
 c0 01                 ldi8	r4, 0x1
 d7 27                 sys	draw_filled_rect_white
 c0 02                 ldi8	r4, 0x2
 d7 28                 sys	draw_filled_rect_black
 c0 03                 ldi8	r4, 0x3
 d7 27                 sys	draw_filled_rect_white
 c0 04                 ldi8	r4, 0x4
 d7 28                 sys	draw_filled_rect_black
 c0 05                 ldi8	r4, 0x5
 d7 27                 sys	draw_filled_rect_white
 c0 06                 ldi8	r4, 0x6
 d7 28                 sys	draw_filled_rect_black
 c0 07                 ldi8	r4, 0x7
 d7 27                 sys	draw_filled_rect_white
 c0 08                 ldi8	r4, 0x8
 d7 28                 sys	draw_filled_rect_black
 c0 09                 ldi8	r4, 0x9
 d7 27                 sys	draw_filled_rect_white
 c0 0a                 ldi8	r4, 0xa
 d7 28                 sys	draw_filled_rect_black
 c0 0b                 ldi8	r4, 0xb
 d7 27                 sys	draw_filled_rect_white
 c0 0c                 ldi8	r4, 0xc
 d7 28                 sys	draw_filled_rect_black
 c0 0d                 ldi8	r4, 0xd
 d7 27                 sys	draw_filled_rect_white
 c0 0e                 ldi8	r4, 0xe
 d7 28                 sys	draw_filled_rect_black
 c0 0f                 ldi8	r4, 0xf
 d7 27                 sys	draw_filled_rect_white
 c1 01                 ldi8	r5, 0x1
 a0                    xor	r4, r4
 d7 27                 sys	draw_filled_rect_white
 c0 01                 ldi8	r4, 0x1
 d7 28                 sys	draw_filled_rect_black
 c0 02                 ldi8	r4, 0x2
 d7 27                 sys	draw_filled_rect_white
 c0 03                 ldi8	r4, 0x3
 d7 28                 sys	draw_filled_rect_black
 c0 04                 ldi8	r4, 0x4
 d7 27                 sys	draw_filled_rect_white
 c0 05                 ldi8	r4, 0x5
 d7 28                 sys	draw_filled_rect_black
 c0 06                 ldi8	r4, 0x6
 d7 27                 sys	draw_filled_rect_white
 c0 07                 ldi8	r4, 0x7
 d7 28                 sys	draw_filled_rect_black
 c0 08                 ldi8	r4, 0x8
 d7 27                 sys	draw_filled_rect_white
 c0 09                 ldi8	r4, 0x9
 d7 28                 sys	draw_filled_rect_black
 c0 0a                 ldi8	r4, 0xa
 d7 27                 sys	draw_filled_rect_white
 c0 0b                 ldi8	r4, 0xb
 d7 28                 sys	draw_filled_rect_black
 c0 0c                 ldi8	r4, 0xc
 d7 27                 sys	draw_filled_rect_white
 c0 0d                 ldi8	r4, 0xd
 d7 28                 sys	draw_filled_rect_black
 c0 0e                 ldi8	r4, 0xe
 d7 27                 sys	draw_filled_rect_white
 c0 0f                 ldi8	r4, 0xf
 d7 28                 sys	draw_filled_rect_black
 c1 02                 ldi8	r5, 0x2
 a0                    xor	r4, r4
 d7 28                 sys	draw_filled_rect_black
 c0 01                 ldi8	r4, 0x1
 d7 27                 sys	draw_filled_rect_white
 c0 02                 ldi8	r4, 0x2
 d7 28                 sys	draw_filled_rect_black
 c0 03                 ldi8	r4, 0x3
 d7 27                 sys	draw_filled_rect_white
 c0 04                 ldi8	r4, 0x4
 d7 28                 sys	draw_filled_rect_black
 c0 05                 ldi8	r4, 0x5
 d7 27                 sys	draw_filled_rect_white
 c0 06                 ldi8	r4, 0x6
 d7 28                 sys	draw_filled_rect_black
 c0 07                 ldi8	r4, 0x7
 d7 27                 sys	draw_filled_rect_white
 c0 08                 ldi8	r4, 0x8
 d7 28                 sys	draw_filled_rect_black
 c0 09                 ldi8	r4, 0x9
 d7 27                 sys	draw_filled_rect_white
 c0 0a                 ldi8	r4, 0xa
 d7 28                 sys	draw_filled_rect_black
 c0 0b                 ldi8	r4, 0xb
 d7 27                 sys	draw_filled_rect_white
 c0 0c                 ldi8	r4, 0xc
 d7 28                 sys	draw_filled_rect_black
 c0 0d                 ldi8	r4, 0xd
 d7 27                 sys	draw_filled_rect_white
 c0 0e                 ldi8	r4, 0xe
 d7 28                 sys	draw_filled_rect_black
 c0 0f                 ldi8	r4, 0xf
 d7 27                 sys	draw_filled_rect_white
 c1 03                 ldi8	r5, 0x3
 a0                    xor	r4, r4
 d7 27                 sys	draw_filled_rect_white
 c0 01                 ldi8	r4, 0x1
 d7 28                 sys	draw_filled_rect_black
 c0 02                 ldi8	r4, 0x2
 d7 27                 sys	draw_filled_rect_white
 c0 03                 ldi8	r4, 0x3
 d7 28                 sys	draw_filled_rect_black
 c0 04                 ldi8	r4, 0x4
 d7 27                 sys	draw_filled_rect_white
 c0 05                 ldi8	r4, 0x5
 d7 28                 sys	draw_filled_rect_black
 c0 06                 ldi8	r4, 0x6
 d7 27                 sys	draw_filled_rect_white
 c0 07                 ldi8	r4, 0x7
 d7 28                 sys	draw_filled_rect_black
 c0 08                 ldi8	r4, 0x8
 d7 27                 sys	draw_filled_rect_white
 c0 09                 ldi8	r4, 0x9
 d7 28                 sys	draw_filled_rect_black
 c0 0a                 ldi8	r4, 0xa
 d7 27                 sys	draw_filled_rect_white
 c0 0b                 ldi8	r4, 0xb
 d7 28                 sys	draw_filled_rect_black
 c0 0c                 ldi8	r4, 0xc
 d7 27                 sys	draw_filled_rect_white
 c0 0d                 ldi8	r4, 0xd
 d7 28                 sys	draw_filled_rect_black
 c0 0e                 ldi8	r4, 0xe
 d7 27                 sys	draw_filled_rect_white
 c0 0f                 ldi8	r4, 0xf
 d7 28                 sys	draw_filled_rect_black
 c1 04                 ldi8	r5, 0x4
 a0                    xor	r4, r4
 d7 28                 sys	draw_filled_rect_black
 c0 01                 ldi8	r4, 0x1
 d7 27                 sys	draw_filled_rect_white
 c0 02                 ldi8	r4, 0x2
 d7 28                 sys	draw_filled_rect_black
 c0 03                 ldi8	r4, 0x3
 d7 27                 sys	draw_filled_rect_white
 c0 04                 ldi8	r4, 0x4
 d7 28                 sys	draw_filled_rect_black
 c0 05                 ldi8	r4, 0x5
 d7 27                 sys	draw_filled_rect_white
 c0 06                 ldi8	r4, 0x6
 d7 28                 sys	draw_filled_rect_black
 c0 07                 ldi8	r4, 0x7
 d7 27                 sys	draw_filled_rect_white
 c0 08                 ldi8	r4, 0x8
 d7 28                 sys	draw_filled_rect_black
 c0 09                 ldi8	r4, 0x9
 d7 27                 sys	draw_filled_rect_white
 c0 0a                 ldi8	r4, 0xa
 d7 28                 sys	draw_filled_rect_black
 c0 0b                 ldi8	r4, 0xb
 d7 27                 sys	draw_filled_rect_white
 c0 0c                 ldi8	r4, 0xc
 d7 28                 sys	draw_filled_rect_black
 c0 0d                 ldi8	r4, 0xd
 d7 27                 sys	draw_filled_rect_white
 c0 0e                 ldi8	r4, 0xe
 d7 28                 sys	draw_filled_rect_black
 c0 0f                 ldi8	r4, 0xf
 d7 27                 sys	draw_filled_rect_white
 c1 05                 ldi8	r5, 0x5
 a0                    xor	r4, r4
 d7 27                 sys	draw_filled_rect_white
 c0 01                 ldi8	r4, 0x1
 d7 28                 sys	draw_filled_rect_black
 c0 02                 ldi8	r4, 0x2
 d7 27                 sys	draw_filled_rect_white
 c0 03                 ldi8	r4, 0x3
 d7 28                 sys	draw_filled_rect_black
 c0 04                 ldi8	r4, 0x4
 d7 27                 sys	draw_filled_rect_white
 c0 05                 ldi8	r4, 0x5
 d7 28                 sys	draw_filled_rect_black
 c0 06                 ldi8	r4, 0x6
 d7 27                 sys	draw_filled_rect_white
 c0 07                 ldi8	r4, 0x7
 d7 28                 sys	draw_filled_rect_black
 c0 08                 ldi8	r4, 0x8
 d7 27                 sys	draw_filled_rect_white
 c0 09                 ldi8	r4, 0x9
 d7 28                 sys	draw_filled_rect_black
 c0 0a                 ldi8	r4, 0xa
 d7 27                 sys	draw_filled_rect_white
 c0 0b                 ldi8	r4, 0xb
 d7 28                 sys	draw_filled_rect_black
 c0 0c                 ldi8	r4, 0xc
 d7 27                 sys	draw_filled_rect_white
 c0 0d                 ldi8	r4, 0xd
 d7 28                 sys	draw_filled_rect_black
 c0 0e                 ldi8	r4, 0xe
 d7 27                 sys	draw_filled_rect_white
 c0 0f                 ldi8	r4, 0xf
 d7 28                 sys	draw_filled_rect_black
 c1 06                 ldi8	r5, 0x6
 a0                    xor	r4, r4
 d7 28                 sys	draw_filled_rect_black
 c0 01                 ldi8	r4, 0x1
 d7 27                 sys	draw_filled_rect_white
 c0 02                 ldi8	r4, 0x2
 d7 28                 sys	draw_filled_rect_black
 c0 03                 ldi8	r4, 0x3
 d7 27                 sys	draw_filled_rect_white
 c0 04                 ldi8	r4, 0x4
 d7 28                 sys	draw_filled_rect_black
 c0 05                 ldi8	r4, 0x5
 d7 27                 sys	draw_filled_rect_white
 c0 06                 ldi8	r4, 0x6
 d7 28                 sys	draw_filled_rect_black
 c0 07                 ldi8	r4, 0x7
 d7 27                 sys	draw_filled_rect_white
 c0 08                 ldi8	r4, 0x8
 d7 28                 sys	draw_filled_rect_black
 c0 09                 ldi8	r4, 0x9
 d7 27                 sys	draw_filled_rect_white
 c0 0a                 ldi8	r4, 0xa
 d7 28                 sys	draw_filled_rect_black
 c0 0b                 ldi8	r4, 0xb
 d7 27                 sys	draw_filled_rect_white
 c0 0c                 ldi8	r4, 0xc
 d7 28                 sys	draw_filled_rect_black
 c0 0d                 ldi8	r4, 0xd
 d7 27                 sys	draw_filled_rect_white
 c0 0e                 ldi8	r4, 0xe
 d7 28                 sys	draw_filled_rect_black
 c0 0f                 ldi8	r4, 0xf
 d7 27                 sys	draw_filled_rect_white
 c1 07                 ldi8	r5, 0x7
 a0                    xor	r4, r4
 d7 27                 sys	draw_filled_rect_white
 c0 01                 ldi8	r4, 0x1
 d7 28                 sys	draw_filled_rect_black
 c0 02                 ldi8	r4, 0x2
 d7 27                 sys	draw_filled_rect_white
 c0 03                 ldi8	r4, 0x3
 d7 28                 sys	draw_filled_rect_black
 c0 04                 ldi8	r4, 0x4
 d7 27                 sys	draw_filled_rect_white
 c0 05                 ldi8	r4, 0x5
 d7 28                 sys	draw_filled_rect_black
 c0 06                 ldi8	r4, 0x6
 d7 27                 sys	draw_filled_rect_white
 c0 07                 ldi8	r4, 0x7
 d7 28                 sys	draw_filled_rect_black
 c0 08                 ldi8	r4, 0x8
 d7 27                 sys	draw_filled_rect_white
 c0 09                 ldi8	r4, 0x9
 d7 28                 sys	draw_filled_rect_black
 c0 0a                 ldi8	r4, 0xa
 d7 27                 sys	draw_filled_rect_white
 c0 0b                 ldi8	r4, 0xb
 d7 28                 sys	draw_filled_rect_black
 c0 0c                 ldi8	r4, 0xc
 d7 27                 sys	draw_filled_rect_white
 c0 0d                 ldi8	r4, 0xd
 d7 28                 sys	draw_filled_rect_black
 c0 0e                 ldi8	r4, 0xe
 d7 27                 sys	draw_filled_rect_white
 c0 0f                 ldi8	r4, 0xf
 d7 28                 sys	draw_filled_rect_black
 d7 01                 sys	debug_break
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
