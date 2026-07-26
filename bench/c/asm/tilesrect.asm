
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/tilesrect.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 tilesrect.c
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000016 _start
00000116 g     F .text	00000271 avm_test_main
00000387 g     F .text	00000002 avm_halt
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
 e1 71 02              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f0 01 01              ldi8	r1, 0x1
 f2 42                 sub	r2, r2
 d7 01                 sys	debug_break
 f0 00 08              ldi8	r0, 0x8
 f1 28                 mov	r6, r0
 f4 62                 stsp16	[sp+0x8], r6
 f1 2c                 mov	r7, r0
 f4 5b                 stsp16	[sp+0x6], r7
 f1 26                 mov	r5, r2
 f4 51                 stsp16	[sp+0x4], r5
 f4 4a                 stsp16	[sp+0x2], r6
 f4 43                 stsp16	[sp+0x0], r7
 f1 19                 mov	r3, r1
 f1 23                 mov	r4, r3
 f9 84                 and	r4, r1
 f4 a4                 tst8	r4
 d0 1b                 breq8	avm_test_main+69
 f1 22                 mov	r4, r2
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 03                 ldsp16	r7, [sp+0x0]
 d7 28                 sys	draw_filled_rect_black
 f9 66                 xor	r3, r1
 f4 aa                 inc16	r2
 f0 0e 10              cmpi.s8	r2, 0x10
 d0 1a                 breq8	avm_test_main+87
 f1 23                 mov	r4, r3
 f9 84                 and	r4, r1
 f4 a4                 tst8	r4
 d1 e5                 brne8	avm_test_main+42
 a5                    xor	r5, r5
 f1 22                 mov	r4, r2
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 1b                 ldsp16	r7, [sp+0x6]
 d7 27                 sys	draw_filled_rect_white
 f9 66                 xor	r3, r1
 f4 aa                 inc16	r2
 f0 0e 10              cmpi.s8	r2, 0x10
 d1 e6                 brne8	avm_test_main+61
 f2 4b                 sub	r3, r3
 f1 28                 mov	r6, r0
 f4 62                 stsp16	[sp+0x8], r6
 f1 2c                 mov	r7, r0
 f4 5b                 stsp16	[sp+0x6], r7
 f4 52                 stsp16	[sp+0x4], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f1 13                 mov	r2, r3
 f0 01 01              ldi8	r1, 0x1
 f1 22                 mov	r4, r2
 f9 84                 and	r4, r1
 f4 a4                 tst8	r4
 d0 1b                 breq8	avm_test_main+141
 c1 01                 ldi8	r5, 0x1
 f1 23                 mov	r4, r3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 0b                 ldsp16	r7, [sp+0x2]
 d7 28                 sys	draw_filled_rect_black
 f9 46                 xor	r2, r1
 f4 ab                 inc16	r3
 f0 0f 10              cmpi.s8	r3, 0x10
 d0 1b                 breq8	avm_test_main+160
 f1 22                 mov	r4, r2
 f9 84                 and	r4, r1
 f4 a4                 tst8	r4
 d1 e5                 brne8	avm_test_main+114
 f1 23                 mov	r4, r3
 f1 25                 mov	r5, r1
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 1b                 ldsp16	r7, [sp+0x6]
 d7 27                 sys	draw_filled_rect_white
 f9 46                 xor	r2, r1
 f4 ab                 inc16	r3
 f0 0f 10              cmpi.s8	r3, 0x10
 d1 e5                 brne8	avm_test_main+133
 f2 30                 sub	r0, r0
 c0 08                 ldi8	r4, 0x8
 08                    mov	r6, r4
 f4 52                 stsp16	[sp+0x4], r6
 0c                    mov	r7, r4
 f4 5b                 stsp16	[sp+0x6], r7
 f4 4a                 stsp16	[sp+0x2], r6
 f4 43                 stsp16	[sp+0x0], r7
 f1 19                 mov	r3, r1
 f0 02 01              ldi8	r2, 0x1
 f1 27                 mov	r5, r3
 f9 a4                 and	r5, r1
 f4 a5                 tst8	r5
 c1 02                 ldi8	r5, 0x2
 f1 20                 mov	r4, r0
 d0 1b                 breq8	avm_test_main+218
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 03                 ldsp16	r7, [sp+0x0]
 d7 28                 sys	draw_filled_rect_black
 f9 6a                 xor	r3, r2
 f4 a8                 inc16	r0
 f0 0c 10              cmpi.s8	r0, 0x10
 d0 1f                 breq8	avm_test_main+237
 f1 27                 mov	r5, r3
 f9 a4                 and	r5, r1
 f4 a5                 tst8	r5
 c1 02                 ldi8	r5, 0x2
 f1 20                 mov	r4, r0
 d1 e5                 brne8	avm_test_main+191
 f4 60                 stsp16	[sp+0x8], r4
 f4 1b                 ldsp16	r7, [sp+0x6]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 27                 sys	draw_filled_rect_white
 f9 6a                 xor	r3, r2
 f4 a8                 inc16	r0
 f0 0c 10              cmpi.s8	r0, 0x10
 d1 e1                 brne8	avm_test_main+206
 f2 4b                 sub	r3, r3
 f0 00 08              ldi8	r0, 0x8
 f1 28                 mov	r6, r0
 f4 5a                 stsp16	[sp+0x6], r6
 f1 2c                 mov	r7, r0
 f4 53                 stsp16	[sp+0x4], r7
 f4 4a                 stsp16	[sp+0x2], r6
 f4 43                 stsp16	[sp+0x0], r7
 f1 0b                 mov	r1, r3
 c1 03                 ldi8	r5, 0x3
 f1 2d                 mov	r7, r1
 f9 e8                 and	r7, r2
 f1 23                 mov	r4, r3
 f4 a7                 tst8	r7
 d0 19                 breq8	avm_test_main+293
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 03                 ldsp16	r7, [sp+0x0]
 d7 28                 sys	draw_filled_rect_black
 f9 2a                 xor	r1, r2
 f4 ab                 inc16	r3
 f0 0f 10              cmpi.s8	r3, 0x10
 d0 1d                 breq8	avm_test_main+312
 f1 2d                 mov	r7, r1
 f9 e8                 and	r7, r2
 f1 23                 mov	r4, r3
 f4 a7                 tst8	r7
 d1 e7                 brne8	avm_test_main+268
 f4 60                 stsp16	[sp+0x8], r4
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 13                 ldsp16	r7, [sp+0x4]
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 27                 sys	draw_filled_rect_white
 f9 2a                 xor	r1, r2
 f4 ab                 inc16	r3
 f0 0f 10              cmpi.s8	r3, 0x10
 d1 e3                 brne8	avm_test_main+283
 f2 30                 sub	r0, r0
 c0 08                 ldi8	r4, 0x8
 08                    mov	r6, r4
 f4 5a                 stsp16	[sp+0x6], r6
 0c                    mov	r7, r4
 f4 53                 stsp16	[sp+0x4], r7
 f4 4a                 stsp16	[sp+0x2], r6
 f4 43                 stsp16	[sp+0x0], r7
 f1 1a                 mov	r3, r2
 f0 01 01              ldi8	r1, 0x1
 f1 27                 mov	r5, r3
 f9 a8                 and	r5, r2
 f4 a5                 tst8	r5
 c2 04                 ldi8	r6, 0x4
 f1 20                 mov	r4, r0
 d0 1c                 breq8	avm_test_main+371
 06                    mov	r5, r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 03                 ldsp16	r7, [sp+0x0]
 d7 28                 sys	draw_filled_rect_black
 f9 66                 xor	r3, r1
 f4 a8                 inc16	r0
 f0 0c 10              cmpi.s8	r0, 0x10
 d0 20                 breq8	avm_test_main+391
 f1 27                 mov	r5, r3
 f9 a8                 and	r5, r2
 f4 a5                 tst8	r5
 c2 04                 ldi8	r6, 0x4
 f1 20                 mov	r4, r0
 d1 e4                 brne8	avm_test_main+343
 f4 60                 stsp16	[sp+0x8], r4
 06                    mov	r5, r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 13                 ldsp16	r7, [sp+0x4]
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 27                 sys	draw_filled_rect_white
 f9 66                 xor	r3, r1
 f4 a8                 inc16	r0
 f0 0c 10              cmpi.s8	r0, 0x10
 d1 e0                 brne8	avm_test_main+359
 f2 4b                 sub	r3, r3
 f0 00 08              ldi8	r0, 0x8
 f1 28                 mov	r6, r0
 f4 5a                 stsp16	[sp+0x6], r6
 f1 2c                 mov	r7, r0
 f4 53                 stsp16	[sp+0x4], r7
 f4 4a                 stsp16	[sp+0x2], r6
 f4 43                 stsp16	[sp+0x0], r7
 f1 13                 mov	r2, r3
 c1 05                 ldi8	r5, 0x5
 f1 2e                 mov	r7, r2
 f9 e4                 and	r7, r1
 f1 23                 mov	r4, r3
 f4 a7                 tst8	r7
 d0 19                 breq8	avm_test_main+447
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 03                 ldsp16	r7, [sp+0x0]
 d7 28                 sys	draw_filled_rect_black
 f9 46                 xor	r2, r1
 f4 ab                 inc16	r3
 f0 0f 10              cmpi.s8	r3, 0x10
 d0 1d                 breq8	avm_test_main+466
 f1 2e                 mov	r7, r2
 f9 e4                 and	r7, r1
 f1 23                 mov	r4, r3
 f4 a7                 tst8	r7
 d1 e7                 brne8	avm_test_main+422
 f4 60                 stsp16	[sp+0x8], r4
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 13                 ldsp16	r7, [sp+0x4]
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 27                 sys	draw_filled_rect_white
 f9 46                 xor	r2, r1
 f4 ab                 inc16	r3
 f0 0f 10              cmpi.s8	r3, 0x10
 d1 e3                 brne8	avm_test_main+437
 f2 30                 sub	r0, r0
 c0 08                 ldi8	r4, 0x8
 08                    mov	r6, r4
 f4 52                 stsp16	[sp+0x4], r6
 0c                    mov	r7, r4
 f4 5b                 stsp16	[sp+0x6], r7
 f4 4a                 stsp16	[sp+0x2], r6
 f4 43                 stsp16	[sp+0x0], r7
 f1 19                 mov	r3, r1
 f0 02 01              ldi8	r2, 0x1
 f1 27                 mov	r5, r3
 f9 a4                 and	r5, r1
 f4 a5                 tst8	r5
 c1 06                 ldi8	r5, 0x6
 f1 20                 mov	r4, r0
 d0 1b                 breq8	avm_test_main+524
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 03                 ldsp16	r7, [sp+0x0]
 d7 28                 sys	draw_filled_rect_black
 f9 6a                 xor	r3, r2
 f4 a8                 inc16	r0
 f0 0c 10              cmpi.s8	r0, 0x10
 d0 1f                 breq8	avm_test_main+543
 f1 27                 mov	r5, r3
 f9 a4                 and	r5, r1
 f4 a5                 tst8	r5
 c1 06                 ldi8	r5, 0x6
 f1 20                 mov	r4, r0
 d1 e5                 brne8	avm_test_main+497
 f4 60                 stsp16	[sp+0x8], r4
 f4 1b                 ldsp16	r7, [sp+0x6]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 27                 sys	draw_filled_rect_white
 f9 6a                 xor	r3, r2
 f4 a8                 inc16	r0
 f0 0c 10              cmpi.s8	r0, 0x10
 d1 e1                 brne8	avm_test_main+512
 f2 39                 sub	r1, r1
 c1 08                 ldi8	r5, 0x8
 09                    mov	r6, r5
 f4 5a                 stsp16	[sp+0x6], r6
 0d                    mov	r7, r5
 f4 53                 stsp16	[sp+0x4], r7
 f4 4a                 stsp16	[sp+0x2], r6
 f4 43                 stsp16	[sp+0x0], r7
 f1 01                 mov	r0, r1
 c1 07                 ldi8	r5, 0x7
 f1 2c                 mov	r7, r0
 f9 e8                 and	r7, r2
 f1 21                 mov	r4, r1
 f4 a7                 tst8	r7
 d0 19                 breq8	avm_test_main+596
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 03                 ldsp16	r7, [sp+0x0]
 d7 28                 sys	draw_filled_rect_black
 f9 0a                 xor	r0, r2
 f4 a9                 inc16	r1
 f0 0d 10              cmpi.s8	r1, 0x10
 d0 1d                 breq8	avm_test_main+615
 f1 2c                 mov	r7, r0
 f9 e8                 and	r7, r2
 f1 21                 mov	r4, r1
 f4 a7                 tst8	r7
 d1 e7                 brne8	avm_test_main+571
 f4 60                 stsp16	[sp+0x8], r4
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 13                 ldsp16	r7, [sp+0x4]
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 27                 sys	draw_filled_rect_white
 f9 0a                 xor	r0, r2
 f4 a9                 inc16	r1
 f0 0d 10              cmpi.s8	r1, 0x10
 d1 e3                 brne8	avm_test_main+586
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
