
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/tilesrect.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 tilesrect.c
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000016 _start
00000116 g     F .text	0000021d avm_test_main
00000333 g     F .text	00000002 avm_halt
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
 e1 1d 02              call16	avm_halt

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
 f4 a3                 tst8	r3
 d0 17                 breq8	avm_test_main+61
 f1 22                 mov	r4, r2
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 03                 ldsp16	r7, [sp+0x0]
 d7 28                 sys	draw_filled_rect_black
 f9 66                 xor	r3, r1
 f4 aa                 inc16	r2
 f0 0e 10              cmpi.s8	r2, 0x10
 d0 16                 breq8	avm_test_main+79
 f4 a3                 tst8	r3
 d1 e9                 brne8	avm_test_main+38
 a5                    xor	r5, r5
 f1 22                 mov	r4, r2
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 1b                 ldsp16	r7, [sp+0x6]
 d7 27                 sys	draw_filled_rect_white
 f9 66                 xor	r3, r1
 f4 aa                 inc16	r2
 f0 0e 10              cmpi.s8	r2, 0x10
 d1 ea                 brne8	avm_test_main+57
 f2 4b                 sub	r3, r3
 f1 28                 mov	r6, r0
 f4 62                 stsp16	[sp+0x8], r6
 f1 2c                 mov	r7, r0
 f4 5b                 stsp16	[sp+0x6], r7
 f4 52                 stsp16	[sp+0x4], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f1 13                 mov	r2, r3
 f0 01 01              ldi8	r1, 0x1
 f4 a2                 tst8	r2
 d0 17                 breq8	avm_test_main+125
 c1 01                 ldi8	r5, 0x1
 f1 23                 mov	r4, r3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 0b                 ldsp16	r7, [sp+0x2]
 d7 28                 sys	draw_filled_rect_black
 f9 46                 xor	r2, r1
 f4 ab                 inc16	r3
 f0 0f 10              cmpi.s8	r3, 0x10
 d0 17                 breq8	avm_test_main+144
 f4 a2                 tst8	r2
 d1 e9                 brne8	avm_test_main+102
 f1 23                 mov	r4, r3
 f1 25                 mov	r5, r1
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 1b                 ldsp16	r7, [sp+0x6]
 d7 27                 sys	draw_filled_rect_white
 f9 46                 xor	r2, r1
 f4 ab                 inc16	r3
 f0 0f 10              cmpi.s8	r3, 0x10
 d1 e9                 brne8	avm_test_main+121
 f2 4b                 sub	r3, r3
 f1 28                 mov	r6, r0
 f4 4a                 stsp16	[sp+0x2], r6
 f1 2c                 mov	r7, r0
 f4 5b                 stsp16	[sp+0x6], r7
 f4 52                 stsp16	[sp+0x4], r6
 f4 43                 stsp16	[sp+0x0], r7
 c1 02                 ldi8	r5, 0x2
 f0 02 01              ldi8	r2, 0x1
 f1 23                 mov	r4, r3
 f4 a1                 tst8	r1
 d0 15                 breq8	avm_test_main+190
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 03                 ldsp16	r7, [sp+0x0]
 d7 28                 sys	draw_filled_rect_black
 f9 2a                 xor	r1, r2
 f4 ab                 inc16	r3
 f0 0f 10              cmpi.s8	r3, 0x10
 d0 19                 breq8	avm_test_main+209
 f1 23                 mov	r4, r3
 f4 a1                 tst8	r1
 d1 eb                 brne8	avm_test_main+169
 f4 60                 stsp16	[sp+0x8], r4
 f4 1b                 ldsp16	r7, [sp+0x6]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 27                 sys	draw_filled_rect_white
 f9 2a                 xor	r1, r2
 f4 ab                 inc16	r3
 f0 0f 10              cmpi.s8	r3, 0x10
 d1 e7                 brne8	avm_test_main+184
 f2 4b                 sub	r3, r3
 f1 28                 mov	r6, r0
 f4 5a                 stsp16	[sp+0x6], r6
 f1 2c                 mov	r7, r0
 f4 53                 stsp16	[sp+0x4], r7
 f4 4a                 stsp16	[sp+0x2], r6
 f4 43                 stsp16	[sp+0x0], r7
 f1 0b                 mov	r1, r3
 c1 03                 ldi8	r5, 0x3
 f1 23                 mov	r4, r3
 f4 a1                 tst8	r1
 d0 15                 breq8	avm_test_main+254
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 03                 ldsp16	r7, [sp+0x0]
 d7 28                 sys	draw_filled_rect_black
 f9 2a                 xor	r1, r2
 f4 ab                 inc16	r3
 f0 0f 10              cmpi.s8	r3, 0x10
 d0 19                 breq8	avm_test_main+273
 f1 23                 mov	r4, r3
 f4 a1                 tst8	r1
 d1 eb                 brne8	avm_test_main+233
 f4 60                 stsp16	[sp+0x8], r4
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 13                 ldsp16	r7, [sp+0x4]
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 27                 sys	draw_filled_rect_white
 f9 2a                 xor	r1, r2
 f4 ab                 inc16	r3
 f0 0f 10              cmpi.s8	r3, 0x10
 d1 e7                 brne8	avm_test_main+248
 f2 39                 sub	r1, r1
 f1 28                 mov	r6, r0
 f4 5a                 stsp16	[sp+0x6], r6
 f1 2c                 mov	r7, r0
 f4 53                 stsp16	[sp+0x4], r7
 f4 4a                 stsp16	[sp+0x2], r6
 f4 43                 stsp16	[sp+0x0], r7
 c1 04                 ldi8	r5, 0x4
 f0 03 01              ldi8	r3, 0x1
 f1 21                 mov	r4, r1
 f4 a2                 tst8	r2
 d0 15                 breq8	avm_test_main+319
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 03                 ldsp16	r7, [sp+0x0]
 d7 28                 sys	draw_filled_rect_black
 f9 4e                 xor	r2, r3
 f4 a9                 inc16	r1
 f0 0d 10              cmpi.s8	r1, 0x10
 d0 19                 breq8	avm_test_main+338
 f1 21                 mov	r4, r1
 f4 a2                 tst8	r2
 d1 eb                 brne8	avm_test_main+298
 f4 60                 stsp16	[sp+0x8], r4
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 13                 ldsp16	r7, [sp+0x4]
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 27                 sys	draw_filled_rect_white
 f9 4e                 xor	r2, r3
 f4 a9                 inc16	r1
 f0 0d 10              cmpi.s8	r1, 0x10
 d1 e7                 brne8	avm_test_main+313
 f2 42                 sub	r2, r2
 f1 28                 mov	r6, r0
 f4 52                 stsp16	[sp+0x4], r6
 f1 2c                 mov	r7, r0
 f4 5b                 stsp16	[sp+0x6], r7
 f4 4a                 stsp16	[sp+0x2], r6
 f4 43                 stsp16	[sp+0x0], r7
 f1 0a                 mov	r1, r2
 c1 05                 ldi8	r5, 0x5
 f1 22                 mov	r4, r2
 f4 a1                 tst8	r1
 d0 15                 breq8	avm_test_main+383
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 03                 ldsp16	r7, [sp+0x0]
 d7 28                 sys	draw_filled_rect_black
 f9 2e                 xor	r1, r3
 f4 aa                 inc16	r2
 f0 0e 10              cmpi.s8	r2, 0x10
 d0 19                 breq8	avm_test_main+402
 f1 22                 mov	r4, r2
 f4 a1                 tst8	r1
 d1 eb                 brne8	avm_test_main+362
 f4 60                 stsp16	[sp+0x8], r4
 f4 1b                 ldsp16	r7, [sp+0x6]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 27                 sys	draw_filled_rect_white
 f9 2e                 xor	r1, r3
 f4 aa                 inc16	r2
 f0 0e 10              cmpi.s8	r2, 0x10
 d1 e7                 brne8	avm_test_main+377
 f2 42                 sub	r2, r2
 f1 28                 mov	r6, r0
 f4 5a                 stsp16	[sp+0x6], r6
 f1 2c                 mov	r7, r0
 f4 53                 stsp16	[sp+0x4], r7
 f4 4a                 stsp16	[sp+0x2], r6
 f4 43                 stsp16	[sp+0x0], r7
 c1 06                 ldi8	r5, 0x6
 f0 01 01              ldi8	r1, 0x1
 f1 22                 mov	r4, r2
 f4 a3                 tst8	r3
 d0 15                 breq8	avm_test_main+448
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 03                 ldsp16	r7, [sp+0x0]
 d7 28                 sys	draw_filled_rect_black
 f9 66                 xor	r3, r1
 f4 aa                 inc16	r2
 f0 0e 10              cmpi.s8	r2, 0x10
 d0 19                 breq8	avm_test_main+467
 f1 22                 mov	r4, r2
 f4 a3                 tst8	r3
 d1 eb                 brne8	avm_test_main+427
 f4 60                 stsp16	[sp+0x8], r4
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 13                 ldsp16	r7, [sp+0x4]
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 27                 sys	draw_filled_rect_white
 f9 66                 xor	r3, r1
 f4 aa                 inc16	r2
 f0 0e 10              cmpi.s8	r2, 0x10
 d1 e7                 brne8	avm_test_main+442
 f2 42                 sub	r2, r2
 f1 28                 mov	r6, r0
 f4 5a                 stsp16	[sp+0x6], r6
 f1 2c                 mov	r7, r0
 f4 53                 stsp16	[sp+0x4], r7
 f4 4a                 stsp16	[sp+0x2], r6
 f4 43                 stsp16	[sp+0x0], r7
 f1 02                 mov	r0, r2
 c1 07                 ldi8	r5, 0x7
 f1 22                 mov	r4, r2
 f4 a0                 tst8	r0
 d0 15                 breq8	avm_test_main+512
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 03                 ldsp16	r7, [sp+0x0]
 d7 28                 sys	draw_filled_rect_black
 f9 06                 xor	r0, r1
 f4 aa                 inc16	r2
 f0 0e 10              cmpi.s8	r2, 0x10
 d0 19                 breq8	avm_test_main+531
 f1 22                 mov	r4, r2
 f4 a0                 tst8	r0
 d1 eb                 brne8	avm_test_main+491
 f4 60                 stsp16	[sp+0x8], r4
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 13                 ldsp16	r7, [sp+0x4]
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 27                 sys	draw_filled_rect_white
 f9 06                 xor	r0, r1
 f4 aa                 inc16	r2
 f0 0e 10              cmpi.s8	r2, 0x10
 d1 e7                 brne8	avm_test_main+506
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
