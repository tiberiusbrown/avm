
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/tilesrect.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 tilesrect.c
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000016 _start
00000116 g     F .text	0000029a avm_test_main
000003b0 g     F .text	00000002 avm_halt
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
 e1 9a 02              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f0 01 01              ldi8	r1, 0x1
 f2 42                 sub	r2, r2
 d7 01                 sys	debug_break
 c0 08                 ldi8	r4, 0x8
 a5                    xor	r5, r5
 f4 69                 stsp16	[sp+0xa], r5
 08                    mov	r6, r4
 f4 62                 stsp16	[sp+0x8], r6
 0c                    mov	r7, r4
 f4 5b                 stsp16	[sp+0x6], r7
 f1 26                 mov	r5, r2
 f4 51                 stsp16	[sp+0x4], r5
 f4 4a                 stsp16	[sp+0x2], r6
 f4 43                 stsp16	[sp+0x0], r7
 f1 01                 mov	r0, r1
 f1 20                 mov	r4, r0
 f9 84                 and	r4, r1
 f4 a4                 tst8	r4
 d0 1b                 breq8	avm_test_main+69
 f1 22                 mov	r4, r2
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 03                 ldsp16	r7, [sp+0x0]
 d7 28                 sys	draw_filled_rect_black
 f9 06                 xor	r0, r1
 f4 aa                 inc16	r2
 f0 0e 10              cmpi.s8	r2, 0x10
 d0 1b                 breq8	avm_test_main+88
 f1 20                 mov	r4, r0
 f9 84                 and	r4, r1
 f4 a4                 tst8	r4
 d1 e5                 brne8	avm_test_main+42
 f1 22                 mov	r4, r2
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 1b                 ldsp16	r7, [sp+0x6]
 d7 27                 sys	draw_filled_rect_white
 f9 06                 xor	r0, r1
 f4 aa                 inc16	r2
 f0 0e 10              cmpi.s8	r2, 0x10
 d1 e5                 brne8	avm_test_main+61
 f2 42                 sub	r2, r2
 f0 00 01              ldi8	r0, 0x1
 f1 24                 mov	r5, r0
 f4 69                 stsp16	[sp+0xa], r5
 c0 08                 ldi8	r4, 0x8
 08                    mov	r6, r4
 f4 62                 stsp16	[sp+0x8], r6
 0c                    mov	r7, r4
 f4 5b                 stsp16	[sp+0x6], r7
 c1 01                 ldi8	r5, 0x1
 f4 51                 stsp16	[sp+0x4], r5
 f4 4a                 stsp16	[sp+0x2], r6
 f4 43                 stsp16	[sp+0x0], r7
 f1 1a                 mov	r3, r2
 f1 27                 mov	r5, r3
 f9 a0                 and	r5, r0
 f1 22                 mov	r4, r2
 f4 a5                 tst8	r5
 d0 1b                 breq8	avm_test_main+152
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 03                 ldsp16	r7, [sp+0x0]
 d7 28                 sys	draw_filled_rect_black
 f9 62                 xor	r3, r0
 f4 aa                 inc16	r2
 f0 0e 10              cmpi.s8	r2, 0x10
 d0 1b                 breq8	avm_test_main+169
 f1 27                 mov	r5, r3
 f9 a0                 and	r5, r0
 f1 22                 mov	r4, r2
 f4 a5                 tst8	r5
 d1 e5                 brne8	avm_test_main+125
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 1b                 ldsp16	r7, [sp+0x6]
 d7 27                 sys	draw_filled_rect_white
 f9 62                 xor	r3, r0
 f4 aa                 inc16	r2
 f0 0e 10              cmpi.s8	r2, 0x10
 d1 e5                 brne8	avm_test_main+142
 f2 4b                 sub	r3, r3
 f0 01 02              ldi8	r1, 0x2
 f1 25                 mov	r5, r1
 f4 69                 stsp16	[sp+0xa], r5
 c1 08                 ldi8	r5, 0x8
 01                    mov	r4, r5
 08                    mov	r6, r4
 f4 62                 stsp16	[sp+0x8], r6
 0c                    mov	r7, r4
 f4 5b                 stsp16	[sp+0x6], r7
 f1 25                 mov	r5, r1
 f4 51                 stsp16	[sp+0x4], r5
 f4 4a                 stsp16	[sp+0x2], r6
 f4 43                 stsp16	[sp+0x0], r7
 f1 08                 mov	r1, r0
 f0 02 01              ldi8	r2, 0x1
 f1 25                 mov	r5, r1
 f9 a0                 and	r5, r0
 f1 23                 mov	r4, r3
 f4 a5                 tst8	r5
 d0 1b                 breq8	avm_test_main+237
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 03                 ldsp16	r7, [sp+0x0]
 d7 28                 sys	draw_filled_rect_black
 f9 2a                 xor	r1, r2
 f4 ab                 inc16	r3
 f0 0f 10              cmpi.s8	r3, 0x10
 d0 1b                 breq8	avm_test_main+254
 f1 25                 mov	r5, r1
 f9 a0                 and	r5, r0
 f1 23                 mov	r4, r3
 f4 a5                 tst8	r5
 d1 e5                 brne8	avm_test_main+210
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 1b                 ldsp16	r7, [sp+0x6]
 d7 27                 sys	draw_filled_rect_white
 f9 2a                 xor	r1, r2
 f4 ab                 inc16	r3
 f0 0f 10              cmpi.s8	r3, 0x10
 d1 e5                 brne8	avm_test_main+227
 f2 39                 sub	r1, r1
 c0 03                 ldi8	r4, 0x3
 04                    mov	r5, r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 00 08              ldi8	r0, 0x8
 f1 28                 mov	r6, r0
 f4 6a                 stsp16	[sp+0xa], r6
 f1 2c                 mov	r7, r0
 f4 5b                 stsp16	[sp+0x6], r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 4a                 stsp16	[sp+0x2], r6
 f4 43                 stsp16	[sp+0x0], r7
 f1 19                 mov	r3, r1
 f1 23                 mov	r4, r3
 f9 88                 and	r4, r2
 f4 a4                 tst8	r4
 d0 1b                 breq8	avm_test_main+315
 f1 21                 mov	r4, r1
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 03                 ldsp16	r7, [sp+0x0]
 d7 28                 sys	draw_filled_rect_black
 f9 6a                 xor	r3, r2
 f4 a9                 inc16	r1
 f0 0d 10              cmpi.s8	r1, 0x10
 d0 1b                 breq8	avm_test_main+334
 f1 23                 mov	r4, r3
 f9 88                 and	r4, r2
 f4 a4                 tst8	r4
 d1 e5                 brne8	avm_test_main+288
 f1 21                 mov	r4, r1
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 1b                 ldsp16	r7, [sp+0x6]
 d7 27                 sys	draw_filled_rect_white
 f9 6a                 xor	r3, r2
 f4 a9                 inc16	r1
 f0 0d 10              cmpi.s8	r1, 0x10
 d1 e5                 brne8	avm_test_main+307
 f2 4b                 sub	r3, r3
 c0 04                 ldi8	r4, 0x4
 04                    mov	r5, r4
 f4 69                 stsp16	[sp+0xa], r5
 f1 28                 mov	r6, r0
 f4 62                 stsp16	[sp+0x8], r6
 f1 2c                 mov	r7, r0
 f4 5b                 stsp16	[sp+0x6], r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 4a                 stsp16	[sp+0x2], r6
 f4 43                 stsp16	[sp+0x0], r7
 f1 02                 mov	r0, r2
 f0 01 01              ldi8	r1, 0x1
 f1 2a                 mov	r6, r2
 f9 c0                 and	r6, r0
 f1 23                 mov	r4, r3
 f4 a6                 tst8	r6
 d0 1b                 breq8	avm_test_main+397
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 03                 ldsp16	r7, [sp+0x0]
 d7 28                 sys	draw_filled_rect_black
 f9 46                 xor	r2, r1
 f4 ab                 inc16	r3
 f0 0f 10              cmpi.s8	r3, 0x10
 d0 1b                 breq8	avm_test_main+414
 f1 2a                 mov	r6, r2
 f9 c0                 and	r6, r0
 f1 23                 mov	r4, r3
 f4 a6                 tst8	r6
 d1 e5                 brne8	avm_test_main+370
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 1b                 ldsp16	r7, [sp+0x6]
 d7 27                 sys	draw_filled_rect_white
 f9 46                 xor	r2, r1
 f4 ab                 inc16	r3
 f0 0f 10              cmpi.s8	r3, 0x10
 d1 e5                 brne8	avm_test_main+387
 f2 42                 sub	r2, r2
 c0 05                 ldi8	r4, 0x5
 04                    mov	r5, r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 00 08              ldi8	r0, 0x8
 f1 28                 mov	r6, r0
 f4 62                 stsp16	[sp+0x8], r6
 f1 2c                 mov	r7, r0
 f4 5b                 stsp16	[sp+0x6], r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 4a                 stsp16	[sp+0x2], r6
 f4 43                 stsp16	[sp+0x0], r7
 f1 1a                 mov	r3, r2
 f1 23                 mov	r4, r3
 f9 84                 and	r4, r1
 f4 a4                 tst8	r4
 d0 1b                 breq8	avm_test_main+475
 f1 22                 mov	r4, r2
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 03                 ldsp16	r7, [sp+0x0]
 d7 28                 sys	draw_filled_rect_black
 f9 66                 xor	r3, r1
 f4 aa                 inc16	r2
 f0 0e 10              cmpi.s8	r2, 0x10
 d0 1b                 breq8	avm_test_main+494
 f1 23                 mov	r4, r3
 f9 84                 and	r4, r1
 f4 a4                 tst8	r4
 d1 e5                 brne8	avm_test_main+448
 f1 22                 mov	r4, r2
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 1b                 ldsp16	r7, [sp+0x6]
 d7 27                 sys	draw_filled_rect_white
 f9 66                 xor	r3, r1
 f4 aa                 inc16	r2
 f0 0e 10              cmpi.s8	r2, 0x10
 d1 e5                 brne8	avm_test_main+467
 f2 42                 sub	r2, r2
 c0 06                 ldi8	r4, 0x6
 04                    mov	r5, r4
 f4 69                 stsp16	[sp+0xa], r5
 f1 28                 mov	r6, r0
 f4 62                 stsp16	[sp+0x8], r6
 f1 2c                 mov	r7, r0
 f4 5b                 stsp16	[sp+0x6], r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 4a                 stsp16	[sp+0x2], r6
 f4 43                 stsp16	[sp+0x0], r7
 f1 01                 mov	r0, r1
 f0 03 01              ldi8	r3, 0x1
 f1 25                 mov	r5, r1
 f9 a0                 and	r5, r0
 f1 22                 mov	r4, r2
 f4 a5                 tst8	r5
 d0 1b                 breq8	avm_test_main+557
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 03                 ldsp16	r7, [sp+0x0]
 d7 28                 sys	draw_filled_rect_black
 f9 2e                 xor	r1, r3
 f4 aa                 inc16	r2
 f0 0e 10              cmpi.s8	r2, 0x10
 d0 1b                 breq8	avm_test_main+574
 f1 25                 mov	r5, r1
 f9 a0                 and	r5, r0
 f1 22                 mov	r4, r2
 f4 a5                 tst8	r5
 d1 e5                 brne8	avm_test_main+530
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 1b                 ldsp16	r7, [sp+0x6]
 d7 27                 sys	draw_filled_rect_white
 f9 2e                 xor	r1, r3
 f4 aa                 inc16	r2
 f0 0e 10              cmpi.s8	r2, 0x10
 d1 e5                 brne8	avm_test_main+547
 f2 30                 sub	r0, r0
 f0 01 07              ldi8	r1, 0x7
 f1 25                 mov	r5, r1
 f4 69                 stsp16	[sp+0xa], r5
 c1 08                 ldi8	r5, 0x8
 01                    mov	r4, r5
 08                    mov	r6, r4
 f4 62                 stsp16	[sp+0x8], r6
 0c                    mov	r7, r4
 f4 5b                 stsp16	[sp+0x6], r7
 f1 25                 mov	r5, r1
 f4 51                 stsp16	[sp+0x4], r5
 f4 4a                 stsp16	[sp+0x2], r6
 f4 43                 stsp16	[sp+0x0], r7
 f1 08                 mov	r1, r0
 f1 21                 mov	r4, r1
 f9 8c                 and	r4, r3
 f4 a4                 tst8	r4
 d0 1b                 breq8	avm_test_main+637
 f1 20                 mov	r4, r0
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 03                 ldsp16	r7, [sp+0x0]
 d7 28                 sys	draw_filled_rect_black
 f9 2e                 xor	r1, r3
 f4 a8                 inc16	r0
 f0 0c 10              cmpi.s8	r0, 0x10
 d0 1b                 breq8	avm_test_main+656
 f1 21                 mov	r4, r1
 f9 8c                 and	r4, r3
 f4 a4                 tst8	r4
 d1 e5                 brne8	avm_test_main+610
 f1 20                 mov	r4, r0
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 1b                 ldsp16	r7, [sp+0x6]
 d7 27                 sys	draw_filled_rect_white
 f9 2e                 xor	r1, r3
 f4 a8                 inc16	r0
 f0 0c 10              cmpi.s8	r0, 0x10
 d1 e5                 brne8	avm_test_main+629
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
