
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/sprite_overwrite.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sprite_overwrite.c
00000890 l     O .rodata	00000020 sprite_5x13
00006828 l     O .rodata	00000400 expected_00
000008b0 l     O .rodata	00000400 expected_01
00000cb0 l     O .rodata	00000400 expected_02
000010b0 l     O .rodata	00000400 expected_03
000014b0 l     O .rodata	00000400 expected_04
000018b0 l     O .rodata	00000400 expected_05
00001cb0 l     O .rodata	00000400 expected_06
000020b0 l     O .rodata	00000104 sprite_1x1_many_frames
000021b4 l     O .rodata	00000400 expected_07
000025b4 l     O .rodata	0000000b sprite_9x8
000025bf l     O .rodata	00000400 expected_08
000029bf l     O .rodata	00000400 expected_09
00002dbf l     O .rodata	0000001a sprite_4x17
00002dd9 l     O .rodata	00000400 expected_10
000031d9 l     O .rodata	00000400 expected_11
000035d9 l     O .rodata	0000020a sprite_130x9
000037e3 l     O .rodata	00000400 expected_12
00003be3 l     O .rodata	00000041 sprite_7x65
00003c24 l     O .rodata	00000400 expected_13
00004024 l     O .rodata	00000400 expected_14
00004424 l     O .rodata	00000400 expected_15
00004824 l     O .rodata	00000400 expected_16
00004c24 l     O .rodata	00000400 expected_17
00005024 l     O .rodata	00000002 sprite_zero_width
00005026 l     O .rodata	00000400 expected_18
00005426 l     O .rodata	00000002 sprite_zero_height
00005428 l     O .rodata	00000400 expected_19
00005828 l     O .rodata	00000400 expected_20
00005c28 l     O .rodata	00000400 expected_21
00006028 l     O .rodata	00000400 expected_22
00006428 l     O .rodata	00000400 expected_23
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000016 _start
00000116 g     F .text	00000778 avm_test_main
0000088e g     F .text	00000002 avm_halt
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
 e1 78 07              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 39                 sub	r1, r1
 f0 04 00 05           ldi16	r0, 0x500
 f1 20                 mov	r4, r0
 a5                    xor	r5, r5
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 c6 90 08              ldi16	r6, 0x890
 c3 00                 ldi8	r7, 0x0
 c0 0a                 ldi8	r4, 0xa
 c1 08                 ldi8	r5, 0x8
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 1e                 sys	draw_sprite_overwrite
 c6 28 68              ldi16	r6, 0x6828
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+81
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 e0 fb 04              jmp16	avm_test_main+1356
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 a5                 ldi8	r5, 0xa5
 d7 11                 sys	memset
 c6 90 08              ldi16	r6, 0x890
 c3 00                 ldi8	r7, 0x0
 c0 0a                 ldi8	r4, 0xa
 c1 08                 ldi8	r5, 0x8
 f2 67                 mov32	q1, q3
 c2 01                 ldi8	r6, 0x1
 d7 1e                 sys	draw_sprite_overwrite
 c6 b0 08              ldi16	r6, 0x8b0
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+161
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 e0 ab 04              jmp16	avm_test_main+1356
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 3c                 ldi8	r5, 0x3c
 d7 11                 sys	memset
 c6 90 08              ldi16	r6, 0x890
 c3 00                 ldi8	r7, 0x0
 c0 1b                 ldi8	r4, 0x1b
 c1 03                 ldi8	r5, 0x3
 f2 67                 mov32	q1, q3
 c2 02                 ldi8	r6, 0x2
 d7 1e                 sys	draw_sprite_overwrite
 c6 b0 0c              ldi16	r6, 0xcb0
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+241
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 32                 ldi8	r4, 0x32
 e0 5b 04              jmp16	avm_test_main+1356
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 96                 ldi8	r5, 0x96
 d7 11                 sys	memset
 c6 90 08              ldi16	r6, 0x890
 c3 00                 ldi8	r7, 0x0
 c4 fe ff              ldi16	r4, 0xfffe
 c1 13                 ldi8	r5, 0x13
 f2 67                 mov32	q1, q3
 c2 01                 ldi8	r6, 0x1
 d7 1e                 sys	draw_sprite_overwrite
 c6 b0 10              ldi16	r6, 0x10b0
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+322
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 33                 ldi8	r4, 0x33
 e0 0a 04              jmp16	avm_test_main+1356
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 69                 ldi8	r5, 0x69
 d7 11                 sys	memset
 c6 90 08              ldi16	r6, 0x890
 c3 00                 ldi8	r7, 0x0
 c0 7e                 ldi8	r4, 0x7e
 c1 11                 ldi8	r5, 0x11
 f2 67                 mov32	q1, q3
 c2 02                 ldi8	r6, 0x2
 d7 1e                 sys	draw_sprite_overwrite
 c6 b0 14              ldi16	r6, 0x14b0
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+402
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 34                 ldi8	r4, 0x34
 e0 ba 03              jmp16	avm_test_main+1356
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 c3                 ldi8	r5, 0xc3
 d7 11                 sys	memset
 c6 90 08              ldi16	r6, 0x890
 c3 00                 ldi8	r7, 0x0
 c0 28                 ldi8	r4, 0x28
 c5 fb ff              ldi16	r5, 0xfffb
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 1e                 sys	draw_sprite_overwrite
 c6 b0 18              ldi16	r6, 0x18b0
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+482
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 35                 ldi8	r4, 0x35
 e0 6a 03              jmp16	avm_test_main+1356
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 5a                 ldi8	r5, 0x5a
 d7 11                 sys	memset
 c6 90 08              ldi16	r6, 0x890
 c3 00                 ldi8	r7, 0x0
 c0 46                 ldi8	r4, 0x46
 c1 3a                 ldi8	r5, 0x3a
 f2 67                 mov32	q1, q3
 c2 01                 ldi8	r6, 0x1
 d7 1e                 sys	draw_sprite_overwrite
 c6 b0 1c              ldi16	r6, 0x1cb0
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+562
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 36                 ldi8	r4, 0x36
 e0 1a 03              jmp16	avm_test_main+1356
 f1 20                 mov	r4, r0
 a5                    xor	r5, r5
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 c6 b0 20              ldi16	r6, 0x20b0
 c3 00                 ldi8	r7, 0x0
 c0 7f                 ldi8	r4, 0x7f
 c1 3f                 ldi8	r5, 0x3f
 f2 67                 mov32	q1, q3
 c6 01 01              ldi16	r6, 0x101
 d7 1e                 sys	draw_sprite_overwrite
 c6 b4 21              ldi16	r6, 0x21b4
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+637
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 37                 ldi8	r4, 0x37
 e0 cf 02              jmp16	avm_test_main+1356
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 3c                 ldi8	r5, 0x3c
 d7 11                 sys	memset
 c6 b4 25              ldi16	r6, 0x25b4
 c3 00                 ldi8	r7, 0x0
 c4 fc ff              ldi16	r4, 0xfffc
 c1 07                 ldi8	r5, 0x7
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 1e                 sys	draw_sprite_overwrite
 c6 bf 25              ldi16	r6, 0x25bf
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+717
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 38                 ldi8	r4, 0x38
 e0 7f 02              jmp16	avm_test_main+1356
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 c3                 ldi8	r5, 0xc3
 d7 11                 sys	memset
 c6 b4 25              ldi16	r6, 0x25b4
 c3 00                 ldi8	r7, 0x0
 c0 7d                 ldi8	r4, 0x7d
 c1 3b                 ldi8	r5, 0x3b
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 1e                 sys	draw_sprite_overwrite
 c6 bf 29              ldi16	r6, 0x29bf
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+796
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 39                 ldi8	r4, 0x39
 e0 30 02              jmp16	avm_test_main+1356
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 69                 ldi8	r5, 0x69
 d7 11                 sys	memset
 c6 bf 2d              ldi16	r6, 0x2dbf
 c3 00                 ldi8	r7, 0x0
 c0 14                 ldi8	r4, 0x14
 c5 f7 ff              ldi16	r5, 0xfff7
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 1e                 sys	draw_sprite_overwrite
 c6 d9 2d              ldi16	r6, 0x2dd9
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+876
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 e0 e0 01              jmp16	avm_test_main+1356
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 96                 ldi8	r5, 0x96
 d7 11                 sys	memset
 c6 bf 2d              ldi16	r6, 0x2dbf
 c3 00                 ldi8	r7, 0x0
 c0 14                 ldi8	r4, 0x14
 c1 37                 ldi8	r5, 0x37
 f2 67                 mov32	q1, q3
 c2 01                 ldi8	r6, 0x1
 d7 1e                 sys	draw_sprite_overwrite
 c6 d9 31              ldi16	r6, 0x31d9
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+956
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 42                 ldi8	r4, 0x42
 e0 90 01              jmp16	avm_test_main+1356
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 5a                 ldi8	r5, 0x5a
 d7 11                 sys	memset
 c6 d9 35              ldi16	r6, 0x35d9
 c3 00                 ldi8	r7, 0x0
 c4 ff ff              ldi16	r4, 0xffff
 c1 1f                 ldi8	r5, 0x1f
 f2 67                 mov32	q1, q3
 c2 01                 ldi8	r6, 0x1
 d7 1e                 sys	draw_sprite_overwrite
 c6 e3 37              ldi16	r6, 0x37e3
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+1037
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 e0 3f 01              jmp16	avm_test_main+1356
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 a5                 ldi8	r5, 0xa5
 d7 11                 sys	memset
 c6 e3 3b              ldi16	r6, 0x3be3
 c3 00                 ldi8	r7, 0x0
 c0 3c                 ldi8	r4, 0x3c
 c5 ff ff              ldi16	r5, 0xffff
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 1e                 sys	draw_sprite_overwrite
 c6 24 3c              ldi16	r6, 0x3c24
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+1117
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 44                 ldi8	r4, 0x44
 e0 ef 00              jmp16	avm_test_main+1356
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 3c                 ldi8	r5, 0x3c
 d7 11                 sys	memset
 c6 90 08              ldi16	r6, 0x890
 c3 00                 ldi8	r7, 0x0
 c0 80                 ldi8	r4, 0x80
 c1 0a                 ldi8	r5, 0xa
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 1e                 sys	draw_sprite_overwrite
 c6 24 40              ldi16	r6, 0x4024
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+1196
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 e0 a0 00              jmp16	avm_test_main+1356
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 c3                 ldi8	r5, 0xc3
 d7 11                 sys	memset
 c6 90 08              ldi16	r6, 0x890
 c3 00                 ldi8	r7, 0x0
 c4 fb ff              ldi16	r4, 0xfffb
 c1 0a                 ldi8	r5, 0xa
 f2 67                 mov32	q1, q3
 c2 01                 ldi8	r6, 0x1
 d7 1e                 sys	draw_sprite_overwrite
 c6 24 44              ldi16	r6, 0x4424
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 20                 breq8	avm_test_main+1276
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 d4 50                 jmp8	avm_test_main+1356
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 69                 ldi8	r5, 0x69
 d7 11                 sys	memset
 c6 90 08              ldi16	r6, 0x890
 c3 00                 ldi8	r7, 0x0
 c0 0a                 ldi8	r4, 0xa
 c5 f3 ff              ldi16	r5, 0xfff3
 f2 67                 mov32	q1, q3
 c2 02                 ldi8	r6, 0x2
 d7 1e                 sys	draw_sprite_overwrite
 c6 24 48              ldi16	r6, 0x4824
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 30                 breq8	avm_test_main+1372
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 f0 01 01              ldi8	r1, 0x1
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 96                 ldi8	r5, 0x96
 d7 11                 sys	memset
 c6 90 08              ldi16	r6, 0x890
 c3 00                 ldi8	r7, 0x0
 c0 0a                 ldi8	r4, 0xa
 c1 40                 ldi8	r5, 0x40
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 1e                 sys	draw_sprite_overwrite
 c6 24 4c              ldi16	r6, 0x4c24
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+1449
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 e0 a3 fa              jmp16	avm_test_main+76
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 5a                 ldi8	r5, 0x5a
 d7 11                 sys	memset
 c6 24 50              ldi16	r6, 0x5024
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f2 67                 mov32	q1, q3
 c2 7b                 ldi8	r6, 0x7b
 d7 1e                 sys	draw_sprite_overwrite
 c6 26 50              ldi16	r6, 0x5026
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+1525
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 e0 f5 fa              jmp16	avm_test_main+234
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 a5                 ldi8	r5, 0xa5
 d7 11                 sys	memset
 c6 26 54              ldi16	r6, 0x5426
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f2 67                 mov32	q1, q3
 c6 c8 01              ldi16	r6, 0x1c8
 d7 1e                 sys	draw_sprite_overwrite
 c6 28 54              ldi16	r6, 0x5428
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+1602
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 e0 f9 fa              jmp16	avm_test_main+315
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 f0                 ldi8	r5, 0xf0
 d7 11                 sys	memset
 c6 d9 35              ldi16	r6, 0x35d9
 c3 00                 ldi8	r7, 0x0
 c4 7f ff              ldi16	r4, 0xff7f
 c1 18                 ldi8	r5, 0x18
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 1e                 sys	draw_sprite_overwrite
 c6 28 58              ldi16	r6, 0x5828
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+1680
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 e0 fb fa              jmp16	avm_test_main+395
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 0f                 ldi8	r5, 0xf
 d7 11                 sys	memset
 c6 e3 3b              ldi16	r6, 0x3be3
 c3 00                 ldi8	r7, 0x0
 c0 49                 ldi8	r4, 0x49
 c5 c0 ff              ldi16	r5, 0xffc0
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 1e                 sys	draw_sprite_overwrite
 c6 28 5c              ldi16	r6, 0x5c28
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+1758
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 e0 fd fa              jmp16	avm_test_main+475
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 55                 ldi8	r5, 0x55
 d7 11                 sys	memset
 c6 e3 3b              ldi16	r6, 0x3be3
 c3 00                 ldi8	r7, 0x0
 c0 49                 ldi8	r4, 0x49
 c1 3f                 ldi8	r5, 0x3f
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 1e                 sys	draw_sprite_overwrite
 c6 28 60              ldi16	r6, 0x6028
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+1835
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 e0 00 fb              jmp16	avm_test_main+555
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 aa                 ldi8	r5, 0xaa
 d7 11                 sys	memset
 c6 d9 35              ldi16	r6, 0x35d9
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 04                 ldi8	r5, 0x4
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 1e                 sys	draw_sprite_overwrite
 c6 28 64              ldi16	r6, 0x6428
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 da fc fd              breq16	avm_test_main+1365
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 e0 fe fa              jmp16	avm_test_main+630

<avm_halt>:
 d4 fe                 jmp8	avm_halt
