
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/sprite_overwrite.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sprite_overwrite.c
0000091e l     O .rodata	00000020 sprite_5x13
000068b6 l     O .rodata	00000400 expected_00
0000093e l     O .rodata	00000400 expected_01
00000d3e l     O .rodata	00000400 expected_02
0000113e l     O .rodata	00000400 expected_03
0000153e l     O .rodata	00000400 expected_04
0000193e l     O .rodata	00000400 expected_05
00001d3e l     O .rodata	00000400 expected_06
0000213e l     O .rodata	00000104 sprite_1x1_many_frames
00002242 l     O .rodata	00000400 expected_07
00002642 l     O .rodata	0000000b sprite_9x8
0000264d l     O .rodata	00000400 expected_08
00002a4d l     O .rodata	00000400 expected_09
00002e4d l     O .rodata	0000001a sprite_4x17
00002e67 l     O .rodata	00000400 expected_10
00003267 l     O .rodata	00000400 expected_11
00003667 l     O .rodata	0000020a sprite_130x9
00003871 l     O .rodata	00000400 expected_12
00003c71 l     O .rodata	00000041 sprite_7x65
00003cb2 l     O .rodata	00000400 expected_13
000040b2 l     O .rodata	00000400 expected_14
000044b2 l     O .rodata	00000400 expected_15
000048b2 l     O .rodata	00000400 expected_16
00004cb2 l     O .rodata	00000400 expected_17
000050b2 l     O .rodata	00000002 sprite_zero_width
000050b4 l     O .rodata	00000400 expected_18
000054b4 l     O .rodata	00000002 sprite_zero_height
000054b6 l     O .rodata	00000400 expected_19
000058b6 l     O .rodata	00000400 expected_20
00005cb6 l     O .rodata	00000400 expected_21
000060b6 l     O .rodata	00000400 expected_22
000064b6 l     O .rodata	00000400 expected_23
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000016 _start
00000116 g     F .text	00000806 avm_test_main
0000091c g     F .text	00000002 avm_halt
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
 e1 06 08              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f0 05 00 04           ldi16	r1, 0x400
 af                    xor	r7, r7
 f0 04 00 05           ldi16	r0, 0x500
 f1 20                 mov	r4, r0
 07                    mov	r5, r7
 f1 29                 mov	r6, r1
 d7 11                 sys	memset
 f0 06 1e 09           ldi16	r2, 0x91e
 f0 03 00              ldi8	r3, 0x0
 c1 08                 ldi8	r5, 0x8
 c0 0a                 ldi8	r4, 0xa
 0b                    mov	r6, r7
 d7 1e                 sys	draw_sprite_overwrite
 c6 b6 68              ldi16	r6, 0x68b6
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 f1 01                 mov	r0, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 23                 breq8	avm_test_main+88
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
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 e0 a2 07              jmp16	avm_test_main+2042
 f0 05 00 05           ldi16	r1, 0x500
 f1 21                 mov	r4, r1
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 c1 a5                 ldi8	r5, 0xa5
 f1 21                 mov	r4, r1
 d7 11                 sys	memset
 c2 01                 ldi8	r6, 0x1
 c0 0a                 ldi8	r4, 0xa
 c1 08                 ldi8	r5, 0x8
 d7 1e                 sys	draw_sprite_overwrite
 c6 3e 09              ldi16	r6, 0x93e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+168
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
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 e0 52 07              jmp16	avm_test_main+2042
 c4 00 05              ldi16	r4, 0x500
 0c                    mov	r7, r4
 c6 00 04              ldi16	r6, 0x400
 f2 39                 sub	r1, r1
 f1 25                 mov	r5, r1
 d7 11                 sys	memset
 c1 3c                 ldi8	r5, 0x3c
 03                    mov	r4, r7
 d7 11                 sys	memset
 f0 01 02              ldi8	r1, 0x2
 c6 1e 09              ldi16	r6, 0x91e
 c3 00                 ldi8	r7, 0x0
 c0 1b                 ldi8	r4, 0x1b
 c1 03                 ldi8	r5, 0x3
 f2 67                 mov32	q1, q3
 f1 29                 mov	r6, r1
 d7 1e                 sys	draw_sprite_overwrite
 c6 3e 0d              ldi16	r6, 0xd3e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 00 05              ldi16	r4, 0x500
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+259
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
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 e0 f7 06              jmp16	avm_test_main+2042
 f0 04 00 05           ldi16	r0, 0x500
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 f2 39                 sub	r1, r1
 f1 25                 mov	r5, r1
 d7 11                 sys	memset
 c1 96                 ldi8	r5, 0x96
 f1 20                 mov	r4, r0
 d7 11                 sys	memset
 c6 1e 09              ldi16	r6, 0x91e
 c3 00                 ldi8	r7, 0x0
 c4 fe ff              ldi16	r4, 0xfffe
 c1 13                 ldi8	r5, 0x13
 f2 67                 mov32	q1, q3
 c2 01                 ldi8	r6, 0x1
 d7 1e                 sys	draw_sprite_overwrite
 c6 3e 11              ldi16	r6, 0x113e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+351
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
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 e0 9b 06              jmp16	avm_test_main+2042
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 f1 25                 mov	r5, r1
 d7 11                 sys	memset
 c1 69                 ldi8	r5, 0x69
 f1 20                 mov	r4, r0
 d7 11                 sys	memset
 c6 1e 09              ldi16	r6, 0x91e
 c3 00                 ldi8	r7, 0x0
 c0 7e                 ldi8	r4, 0x7e
 c1 11                 ldi8	r5, 0x11
 f2 67                 mov32	q1, q3
 c2 02                 ldi8	r6, 0x2
 d7 1e                 sys	draw_sprite_overwrite
 c6 3e 15              ldi16	r6, 0x153e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+436
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
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 e0 46 06              jmp16	avm_test_main+2042
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 f1 25                 mov	r5, r1
 d7 11                 sys	memset
 c1 c3                 ldi8	r5, 0xc3
 f1 20                 mov	r4, r0
 d7 11                 sys	memset
 c6 1e 09              ldi16	r6, 0x91e
 c3 00                 ldi8	r7, 0x0
 c5 fb ff              ldi16	r5, 0xfffb
 c0 28                 ldi8	r4, 0x28
 f2 67                 mov32	q1, q3
 f1 29                 mov	r6, r1
 d7 1e                 sys	draw_sprite_overwrite
 c6 3e 19              ldi16	r6, 0x193e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+522
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
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 e0 f0 05              jmp16	avm_test_main+2042
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 f1 25                 mov	r5, r1
 d7 11                 sys	memset
 c1 5a                 ldi8	r5, 0x5a
 f1 20                 mov	r4, r0
 d7 11                 sys	memset
 c6 1e 09              ldi16	r6, 0x91e
 c3 00                 ldi8	r7, 0x0
 c0 46                 ldi8	r4, 0x46
 c1 3a                 ldi8	r5, 0x3a
 f2 67                 mov32	q1, q3
 c2 01                 ldi8	r6, 0x1
 d7 1e                 sys	draw_sprite_overwrite
 c6 3e 1d              ldi16	r6, 0x1d3e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+607
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
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 e0 9b 05              jmp16	avm_test_main+2042
 f0 05 00 05           ldi16	r1, 0x500
 f1 21                 mov	r4, r1
 a5                    xor	r5, r5
 f0 04 00 04           ldi16	r0, 0x400
 f1 28                 mov	r6, r0
 d7 11                 sys	memset
 c6 3e 21              ldi16	r6, 0x213e
 c3 00                 ldi8	r7, 0x0
 c1 3f                 ldi8	r5, 0x3f
 c0 7f                 ldi8	r4, 0x7f
 f2 67                 mov32	q1, q3
 c6 01 01              ldi16	r6, 0x101
 d7 1e                 sys	draw_sprite_overwrite
 c6 42 22              ldi16	r6, 0x2242
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+692
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
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 e0 46 05              jmp16	avm_test_main+2042
 f0 04 00 05           ldi16	r0, 0x500
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 af                    xor	r7, r7
 07                    mov	r5, r7
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 3c                 ldi8	r5, 0x3c
 d7 11                 sys	memset
 f0 06 42 26           ldi16	r2, 0x2642
 f0 03 00              ldi8	r3, 0x0
 c4 fc ff              ldi16	r4, 0xfffc
 c1 07                 ldi8	r5, 0x7
 0b                    mov	r6, r7
 d7 1e                 sys	draw_sprite_overwrite
 c6 4d 26              ldi16	r6, 0x264d
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+781
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
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 e0 ed 04              jmp16	avm_test_main+2042
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 af                    xor	r7, r7
 07                    mov	r5, r7
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 c3                 ldi8	r5, 0xc3
 d7 11                 sys	memset
 c0 7d                 ldi8	r4, 0x7d
 c1 3b                 ldi8	r5, 0x3b
 0b                    mov	r6, r7
 d7 1e                 sys	draw_sprite_overwrite
 c6 4d 2a              ldi16	r6, 0x2a4d
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+858
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
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 e0 a0 04              jmp16	avm_test_main+2042
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 af                    xor	r7, r7
 07                    mov	r5, r7
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 69                 ldi8	r5, 0x69
 d7 11                 sys	memset
 f0 06 4d 2e           ldi16	r2, 0x2e4d
 f0 03 00              ldi8	r3, 0x0
 c0 14                 ldi8	r4, 0x14
 c5 f7 ff              ldi16	r5, 0xfff7
 0b                    mov	r6, r7
 d7 1e                 sys	draw_sprite_overwrite
 c6 67 2e              ldi16	r6, 0x2e67
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+943
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c1 41                 ldi8	r5, 0x41
 01                    mov	r4, r5
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
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 e0 4b 04              jmp16	avm_test_main+2042
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 96                 ldi8	r5, 0x96
 d7 11                 sys	memset
 c6 4d 2e              ldi16	r6, 0x2e4d
 c3 00                 ldi8	r7, 0x0
 c1 37                 ldi8	r5, 0x37
 c0 14                 ldi8	r4, 0x14
 f2 67                 mov32	q1, q3
 c2 01                 ldi8	r6, 0x1
 d7 1e                 sys	draw_sprite_overwrite
 c6 67 32              ldi16	r6, 0x3267
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1027
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
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 e0 f7 03              jmp16	avm_test_main+2042
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 5a                 ldi8	r5, 0x5a
 d7 11                 sys	memset
 c6 67 36              ldi16	r6, 0x3667
 c3 00                 ldi8	r7, 0x0
 c4 ff ff              ldi16	r4, 0xffff
 c1 1f                 ldi8	r5, 0x1f
 f2 67                 mov32	q1, q3
 c2 01                 ldi8	r6, 0x1
 d7 1e                 sys	draw_sprite_overwrite
 c6 71 38              ldi16	r6, 0x3871
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1112
 c1 43                 ldi8	r5, 0x43
 01                    mov	r4, r5
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
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 e0 a2 03              jmp16	avm_test_main+2042
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 af                    xor	r7, r7
 07                    mov	r5, r7
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 a5                 ldi8	r5, 0xa5
 d7 11                 sys	memset
 f0 06 71 3c           ldi16	r2, 0x3c71
 f0 03 00              ldi8	r3, 0x0
 c0 3c                 ldi8	r4, 0x3c
 c5 ff ff              ldi16	r5, 0xffff
 0b                    mov	r6, r7
 d7 1e                 sys	draw_sprite_overwrite
 c6 b2 3c              ldi16	r6, 0x3cb2
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1197
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
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 e0 4d 03              jmp16	avm_test_main+2042
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 af                    xor	r7, r7
 07                    mov	r5, r7
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 3c                 ldi8	r5, 0x3c
 d7 11                 sys	memset
 f0 06 1e 09           ldi16	r2, 0x91e
 f0 03 00              ldi8	r3, 0x0
 c0 80                 ldi8	r4, 0x80
 c1 0a                 ldi8	r5, 0xa
 0b                    mov	r6, r7
 d7 1e                 sys	draw_sprite_overwrite
 c6 b2 40              ldi16	r6, 0x40b2
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1281
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c1 45                 ldi8	r5, 0x45
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 e0 f9 02              jmp16	avm_test_main+2042
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 c3                 ldi8	r5, 0xc3
 d7 11                 sys	memset
 c4 fb ff              ldi16	r4, 0xfffb
 c1 0a                 ldi8	r5, 0xa
 c2 01                 ldi8	r6, 0x1
 d7 1e                 sys	draw_sprite_overwrite
 c6 b2 44              ldi16	r6, 0x44b2
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1359
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
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 e0 ab 02              jmp16	avm_test_main+2042
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 69                 ldi8	r5, 0x69
 d7 11                 sys	memset
 c6 1e 09              ldi16	r6, 0x91e
 c3 00                 ldi8	r7, 0x0
 c0 0a                 ldi8	r4, 0xa
 c5 f3 ff              ldi16	r5, 0xfff3
 f2 67                 mov32	q1, q3
 c2 02                 ldi8	r6, 0x2
 d7 1e                 sys	draw_sprite_overwrite
 c6 b2 48              ldi16	r6, 0x48b2
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+1446
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
 c0 0a                 ldi8	r4, 0xa
 e0 54 02              jmp16	avm_test_main+2042
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 af                    xor	r7, r7
 07                    mov	r5, r7
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 96                 ldi8	r5, 0x96
 d7 11                 sys	memset
 f0 06 1e 09           ldi16	r2, 0x91e
 f0 03 00              ldi8	r3, 0x0
 c0 0a                 ldi8	r4, 0xa
 c1 40                 ldi8	r5, 0x40
 0b                    mov	r6, r7
 d7 1e                 sys	draw_sprite_overwrite
 c6 b2 4c              ldi16	r6, 0x4cb2
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1530
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
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 e0 00 02              jmp16	avm_test_main+2042
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 af                    xor	r7, r7
 07                    mov	r5, r7
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 5a                 ldi8	r5, 0x5a
 d7 11                 sys	memset
 f0 06 b2 50           ldi16	r2, 0x50b2
 f0 03 00              ldi8	r3, 0x0
 03                    mov	r4, r7
 07                    mov	r5, r7
 c2 7b                 ldi8	r6, 0x7b
 d7 1e                 sys	draw_sprite_overwrite
 c6 b4 50              ldi16	r6, 0x50b4
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+1615
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
 c0 32                 ldi8	r4, 0x32
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 e0 ab 01              jmp16	avm_test_main+2042
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 af                    xor	r7, r7
 07                    mov	r5, r7
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 a5                 ldi8	r5, 0xa5
 d7 11                 sys	memset
 f0 06 b4 54           ldi16	r2, 0x54b4
 f0 03 00              ldi8	r3, 0x0
 03                    mov	r4, r7
 07                    mov	r5, r7
 c6 c8 01              ldi16	r6, 0x1c8
 d7 1e                 sys	draw_sprite_overwrite
 c6 b6 54              ldi16	r6, 0x54b6
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+1701
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
 c0 33                 ldi8	r4, 0x33
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 e0 55 01              jmp16	avm_test_main+2042
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 af                    xor	r7, r7
 07                    mov	r5, r7
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 f0                 ldi8	r5, 0xf0
 d7 11                 sys	memset
 f0 06 67 36           ldi16	r2, 0x3667
 f0 03 00              ldi8	r3, 0x0
 c4 7f ff              ldi16	r4, 0xff7f
 c1 18                 ldi8	r5, 0x18
 0b                    mov	r6, r7
 d7 1e                 sys	draw_sprite_overwrite
 c6 b6 58              ldi16	r6, 0x58b6
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+1788
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
 c0 34                 ldi8	r4, 0x34
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 e0 fe 00              jmp16	avm_test_main+2042
 f1 21                 mov	r4, r1
 c6 00 04              ldi16	r6, 0x400
 af                    xor	r7, r7
 07                    mov	r5, r7
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 0f                 ldi8	r5, 0xf
 d7 11                 sys	memset
 f0 06 71 3c           ldi16	r2, 0x3c71
 f0 03 00              ldi8	r3, 0x0
 f0 00 49              ldi8	r0, 0x49
 f1 20                 mov	r4, r0
 c5 c0 ff              ldi16	r5, 0xffc0
 0b                    mov	r6, r7
 d7 1e                 sys	draw_sprite_overwrite
 c6 b6 5c              ldi16	r6, 0x5cb6
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+1878
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
 c0 35                 ldi8	r4, 0x35
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 e0 a4 00              jmp16	avm_test_main+2042
 f1 21                 mov	r4, r1
 c6 00 04              ldi16	r6, 0x400
 af                    xor	r7, r7
 07                    mov	r5, r7
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 55                 ldi8	r5, 0x55
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 3f                 ldi8	r5, 0x3f
 0b                    mov	r6, r7
 d7 1e                 sys	draw_sprite_overwrite
 c6 b6 60              ldi16	r6, 0x60b6
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 26                 breq8	avm_test_main+1956
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
 c0 36                 ldi8	r4, 0x36
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d4 56                 jmp8	avm_test_main+2042
 f1 21                 mov	r4, r1
 c6 00 04              ldi16	r6, 0x400
 f2 30                 sub	r0, r0
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 aa                 ldi8	r5, 0xaa
 d7 11                 sys	memset
 c6 67 36              ldi16	r6, 0x3667
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 c1 04                 ldi8	r5, 0x4
 f2 67                 mov32	q1, q3
 f1 28                 mov	r6, r0
 d7 1e                 sys	draw_sprite_overwrite
 c6 b6 64              ldi16	r6, 0x64b6
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 29                 breq8	avm_test_main+2047
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
 c0 37                 ldi8	r4, 0x37
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 f0 00 01              ldi8	r0, 0x1
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
