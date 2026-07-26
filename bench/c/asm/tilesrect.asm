
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/tilesrect.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 tilesrect.c
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000016 _start
00000116 g     F .text	00000264 avm_test_main
0000037a g     F .text	00000002 avm_halt
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
 e1 64 02              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d7 01                 sys	debug_break
 f0 02 08              ldi8	r2, 0x8
 f2 4b                 sub	r3, r3
 f1 27                 mov	r5, r3
 f1 2a                 mov	r6, r2
 f1 2e                 mov	r7, r2
 f1 23                 mov	r4, r3
 d7 28                 sys	draw_filled_rect_black
 c0 01                 ldi8	r4, 0x1
 d7 27                 sys	draw_filled_rect_white
 f0 01 02              ldi8	r1, 0x2
 f1 21                 mov	r4, r1
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
 f1 22                 mov	r4, r2
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
 f0 00 01              ldi8	r0, 0x1
 f1 24                 mov	r5, r0
 f1 23                 mov	r4, r3
 d7 27                 sys	draw_filled_rect_white
 f1 20                 mov	r4, r0
 d7 28                 sys	draw_filled_rect_black
 f1 11                 mov	r2, r1
 f1 22                 mov	r4, r2
 d7 27                 sys	draw_filled_rect_white
 f0 00 03              ldi8	r0, 0x3
 f1 20                 mov	r4, r0
 d7 28                 sys	draw_filled_rect_black
 f0 01 04              ldi8	r1, 0x4
 f1 21                 mov	r4, r1
 d7 27                 sys	draw_filled_rect_white
 f0 03 05              ldi8	r3, 0x5
 f1 23                 mov	r4, r3
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
 f0 00 0e              ldi8	r0, 0xe
 f1 20                 mov	r4, r0
 d7 27                 sys	draw_filled_rect_white
 f0 00 0f              ldi8	r0, 0xf
 f1 20                 mov	r4, r0
 d7 28                 sys	draw_filled_rect_black
 f1 26                 mov	r5, r2
 a0                    xor	r4, r4
 d7 28                 sys	draw_filled_rect_black
 c0 01                 ldi8	r4, 0x1
 d7 27                 sys	draw_filled_rect_white
 f1 22                 mov	r4, r2
 d7 28                 sys	draw_filled_rect_black
 f0 00 03              ldi8	r0, 0x3
 f1 20                 mov	r4, r0
 d7 27                 sys	draw_filled_rect_white
 f1 21                 mov	r4, r1
 d7 28                 sys	draw_filled_rect_black
 f1 23                 mov	r4, r3
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
 f1 24                 mov	r5, r0
 f1 08                 mov	r1, r0
 a0                    xor	r4, r4
 d7 27                 sys	draw_filled_rect_white
 c0 01                 ldi8	r4, 0x1
 d7 28                 sys	draw_filled_rect_black
 f1 22                 mov	r4, r2
 d7 27                 sys	draw_filled_rect_white
 f1 21                 mov	r4, r1
 d7 28                 sys	draw_filled_rect_black
 f0 01 04              ldi8	r1, 0x4
 f1 21                 mov	r4, r1
 d7 27                 sys	draw_filled_rect_white
 f1 23                 mov	r4, r3
 d7 28                 sys	draw_filled_rect_black
 c0 06                 ldi8	r4, 0x6
 d7 27                 sys	draw_filled_rect_white
 f0 00 07              ldi8	r0, 0x7
 f1 20                 mov	r4, r0
 d7 28                 sys	draw_filled_rect_black
 f0 00 08              ldi8	r0, 0x8
 f1 20                 mov	r4, r0
 d7 27                 sys	draw_filled_rect_white
 f0 00 09              ldi8	r0, 0x9
 f1 20                 mov	r4, r0
 d7 28                 sys	draw_filled_rect_black
 f0 00 0a              ldi8	r0, 0xa
 f1 20                 mov	r4, r0
 d7 27                 sys	draw_filled_rect_white
 f0 00 0b              ldi8	r0, 0xb
 f1 20                 mov	r4, r0
 d7 28                 sys	draw_filled_rect_black
 f0 00 0c              ldi8	r0, 0xc
 f1 20                 mov	r4, r0
 d7 27                 sys	draw_filled_rect_white
 f0 00 0d              ldi8	r0, 0xd
 f1 20                 mov	r4, r0
 d7 28                 sys	draw_filled_rect_black
 f0 00 0e              ldi8	r0, 0xe
 f1 20                 mov	r4, r0
 d7 27                 sys	draw_filled_rect_white
 f0 00 0f              ldi8	r0, 0xf
 f1 20                 mov	r4, r0
 d7 28                 sys	draw_filled_rect_black
 f1 25                 mov	r5, r1
 f2 30                 sub	r0, r0
 f1 20                 mov	r4, r0
 d7 28                 sys	draw_filled_rect_black
 c0 01                 ldi8	r4, 0x1
 d7 27                 sys	draw_filled_rect_white
 f1 22                 mov	r4, r2
 d7 28                 sys	draw_filled_rect_black
 c0 03                 ldi8	r4, 0x3
 d7 27                 sys	draw_filled_rect_white
 f1 21                 mov	r4, r1
 d7 28                 sys	draw_filled_rect_black
 f1 23                 mov	r4, r3
 d7 27                 sys	draw_filled_rect_white
 f0 01 06              ldi8	r1, 0x6
 f1 21                 mov	r4, r1
 d7 28                 sys	draw_filled_rect_black
 f0 00 07              ldi8	r0, 0x7
 f1 20                 mov	r4, r0
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
 f1 27                 mov	r5, r3
 a0                    xor	r4, r4
 d7 27                 sys	draw_filled_rect_white
 c0 01                 ldi8	r4, 0x1
 d7 28                 sys	draw_filled_rect_black
 f1 22                 mov	r4, r2
 d7 27                 sys	draw_filled_rect_white
 c0 03                 ldi8	r4, 0x3
 d7 28                 sys	draw_filled_rect_black
 c0 04                 ldi8	r4, 0x4
 d7 27                 sys	draw_filled_rect_white
 f1 23                 mov	r4, r3
 d7 28                 sys	draw_filled_rect_black
 f1 21                 mov	r4, r1
 d7 27                 sys	draw_filled_rect_white
 f1 20                 mov	r4, r0
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
 f1 25                 mov	r5, r1
 a0                    xor	r4, r4
 d7 28                 sys	draw_filled_rect_black
 c0 01                 ldi8	r4, 0x1
 d7 27                 sys	draw_filled_rect_white
 f1 22                 mov	r4, r2
 d7 28                 sys	draw_filled_rect_black
 c0 03                 ldi8	r4, 0x3
 d7 27                 sys	draw_filled_rect_white
 c0 04                 ldi8	r4, 0x4
 d7 28                 sys	draw_filled_rect_black
 f1 23                 mov	r4, r3
 d7 27                 sys	draw_filled_rect_white
 f1 21                 mov	r4, r1
 d7 28                 sys	draw_filled_rect_black
 f1 20                 mov	r4, r0
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
 f1 24                 mov	r5, r0
 a0                    xor	r4, r4
 d7 27                 sys	draw_filled_rect_white
 c0 01                 ldi8	r4, 0x1
 d7 28                 sys	draw_filled_rect_black
 f1 22                 mov	r4, r2
 d7 27                 sys	draw_filled_rect_white
 c0 03                 ldi8	r4, 0x3
 d7 28                 sys	draw_filled_rect_black
 c0 04                 ldi8	r4, 0x4
 d7 27                 sys	draw_filled_rect_white
 f1 23                 mov	r4, r3
 d7 28                 sys	draw_filled_rect_black
 f1 21                 mov	r4, r1
 d7 27                 sys	draw_filled_rect_white
 f1 20                 mov	r4, r0
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
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
