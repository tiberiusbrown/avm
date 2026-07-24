
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/sprite_plus_mask.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sprite_plus_mask.c
00000922 l     O .rodata	0000003e sprite_5x13
00006c42 l     O .rodata	00000400 expected_00
00000960 l     O .rodata	00000400 expected_01
00000d60 l     O .rodata	00000400 expected_02
00001160 l     O .rodata	00000400 expected_03
00001560 l     O .rodata	00000400 expected_04
00001960 l     O .rodata	00000400 expected_05
00001d60 l     O .rodata	00000400 expected_06
00002160 l     O .rodata	00000206 sprite_1x1_many_frames
00002366 l     O .rodata	00000400 expected_07
00002766 l     O .rodata	00000014 sprite_9x8
0000277a l     O .rodata	00000400 expected_08
00002b7a l     O .rodata	00000400 expected_09
00002f7a l     O .rodata	00000032 sprite_4x17
00002fac l     O .rodata	00000400 expected_10
000033ac l     O .rodata	00000400 expected_11
000037ac l     O .rodata	00000412 sprite_130x9
00003bbe l     O .rodata	00000400 expected_12
00003fbe l     O .rodata	00000080 sprite_7x65
0000403e l     O .rodata	00000400 expected_13
0000443e l     O .rodata	00000400 expected_14
0000483e l     O .rodata	00000400 expected_15
00004c3e l     O .rodata	00000400 expected_16
0000503e l     O .rodata	00000400 expected_17
0000543e l     O .rodata	00000002 sprite_zero_width
00005440 l     O .rodata	00000400 expected_18
00005840 l     O .rodata	00000002 sprite_zero_height
00005842 l     O .rodata	00000400 expected_19
00005c42 l     O .rodata	00000400 expected_20
00006042 l     O .rodata	00000400 expected_21
00006442 l     O .rodata	00000400 expected_22
00006842 l     O .rodata	00000400 expected_23
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000016 _start
00000116 g     F .text	0000080a avm_test_main
00000920 g     F .text	00000002 avm_halt
00000500 g       *ABS*	00000000 __avm_framebuffer

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 fb 2e                 cmov.eq	r5, r6
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 0a 08              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	avm_test_main+4
 f0 06 00 04           ldi16	r2, 0x400
 f2 30                 sub	r0, r0
 f0 07 00 05           ldi16	r3, 0x500
 f1 23                 mov	r4, r3
 f1 24                 mov	r5, r0
 f1 2a                 mov	r6, r2
 d7 11                 sys	memset
 c6 22 09              ldi16	r6, 0x922
 c3 00                 ldi8	r7, 0x0
 c1 08                 ldi8	r5, 0x8
 f0 01 0a              ldi8	r1, 0xa
 f1 21                 mov	r4, r1
 d7 1f                 sys	draw_sprite_plus_mask
 c6 42 6c              ldi16	r6, 0x6c42
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 23                 mov	r4, r3
 f1 26                 mov	r5, r2
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 23                 breq8	avm_test_main+90
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
 f1 21                 mov	r4, r1
 e0 a2 07              jmp16	avm_test_main+2044
 c4 00 05              ldi16	r4, 0x500
 f1 1c                 mov	r3, r4
 f1 2a                 mov	r6, r2
 a5                    xor	r5, r5
 d7 11                 sys	memset
 c1 a5                 ldi8	r5, 0xa5
 f1 23                 mov	r4, r3
 d7 11                 sys	memset
 f0 00 01              ldi8	r0, 0x1
 c6 22 09              ldi16	r6, 0x922
 c3 00                 ldi8	r7, 0x0
 f1 21                 mov	r4, r1
 c1 08                 ldi8	r5, 0x8
 d7 1f                 sys	draw_sprite_plus_mask
 c6 60 09              ldi16	r6, 0x960
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 23                 mov	r4, r3
 f1 26                 mov	r5, r2
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+174
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
 e0 4e 07              jmp16	avm_test_main+2044
 f0 07 00 05           ldi16	r3, 0x500
 f1 23                 mov	r4, r3
 f0 05 00 04           ldi16	r1, 0x400
 f1 29                 mov	r6, r1
 f2 42                 sub	r2, r2
 f1 26                 mov	r5, r2
 d7 11                 sys	memset
 f0 02 3c              ldi8	r2, 0x3c
 f1 23                 mov	r4, r3
 f1 26                 mov	r5, r2
 d7 11                 sys	memset
 f0 00 02              ldi8	r0, 0x2
 c6 22 09              ldi16	r6, 0x922
 c3 00                 ldi8	r7, 0x0
 c1 03                 ldi8	r5, 0x3
 c0 1b                 ldi8	r4, 0x1b
 d7 1f                 sys	draw_sprite_plus_mask
 c6 60 0d              ldi16	r6, 0xd60
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 23                 mov	r4, r3
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+269
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
 e0 ef 06              jmp16	avm_test_main+2044
 f1 23                 mov	r4, r3
 f1 29                 mov	r6, r1
 a5                    xor	r5, r5
 d7 11                 sys	memset
 c1 96                 ldi8	r5, 0x96
 f1 23                 mov	r4, r3
 d7 11                 sys	memset
 c6 22 09              ldi16	r6, 0x922
 c3 00                 ldi8	r7, 0x0
 c1 13                 ldi8	r5, 0x13
 c4 fe ff              ldi16	r4, 0xfffe
 f0 00 01              ldi8	r0, 0x1
 d7 1f                 sys	draw_sprite_plus_mask
 c6 60 11              ldi16	r6, 0x1160
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 23                 mov	r4, r3
 f1 25                 mov	r5, r1
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
 e0 9d 06              jmp16	avm_test_main+2044
 f1 23                 mov	r4, r3
 f1 29                 mov	r6, r1
 a5                    xor	r5, r5
 d7 11                 sys	memset
 c1 69                 ldi8	r5, 0x69
 f1 23                 mov	r4, r3
 d7 11                 sys	memset
 c6 22 09              ldi16	r6, 0x922
 c3 00                 ldi8	r7, 0x0
 c1 11                 ldi8	r5, 0x11
 c0 7e                 ldi8	r4, 0x7e
 f0 00 02              ldi8	r0, 0x2
 d7 1f                 sys	draw_sprite_plus_mask
 c6 60 15              ldi16	r6, 0x1560
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 23                 mov	r4, r3
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+432
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
 e0 4c 06              jmp16	avm_test_main+2044
 f1 23                 mov	r4, r3
 f1 29                 mov	r6, r1
 f2 30                 sub	r0, r0
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 c1 c3                 ldi8	r5, 0xc3
 f1 23                 mov	r4, r3
 d7 11                 sys	memset
 c6 22 09              ldi16	r6, 0x922
 c3 00                 ldi8	r7, 0x0
 c5 fb ff              ldi16	r5, 0xfffb
 c0 28                 ldi8	r4, 0x28
 d7 1f                 sys	draw_sprite_plus_mask
 c6 60 19              ldi16	r6, 0x1960
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 23                 mov	r4, r3
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+514
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
 e0 fa 05              jmp16	avm_test_main+2044
 f1 23                 mov	r4, r3
 f1 29                 mov	r6, r1
 a5                    xor	r5, r5
 d7 11                 sys	memset
 c1 5a                 ldi8	r5, 0x5a
 f1 23                 mov	r4, r3
 d7 11                 sys	memset
 c6 22 09              ldi16	r6, 0x922
 c3 00                 ldi8	r7, 0x0
 c1 3a                 ldi8	r5, 0x3a
 c0 46                 ldi8	r4, 0x46
 f0 00 01              ldi8	r0, 0x1
 d7 1f                 sys	draw_sprite_plus_mask
 c6 60 1d              ldi16	r6, 0x1d60
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 23                 mov	r4, r3
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+595
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
 e0 a9 05              jmp16	avm_test_main+2044
 f0 05 00 05           ldi16	r1, 0x500
 f1 21                 mov	r4, r1
 a5                    xor	r5, r5
 f0 04 00 04           ldi16	r0, 0x400
 f1 18                 mov	r3, r0
 f1 2b                 mov	r6, r3
 d7 11                 sys	memset
 f0 04 01 01           ldi16	r0, 0x101
 f0 38 00              stsp16	[sp+0x0], r0
 c6 60 21              ldi16	r6, 0x2160
 c3 00                 ldi8	r7, 0x0
 c1 3f                 ldi8	r5, 0x3f
 c0 7f                 ldi8	r4, 0x7f
 f0 30 00              ldsp16	r0, [sp+0x0]
 d7 1f                 sys	draw_sprite_plus_mask
 c6 66 23              ldi16	r6, 0x2366
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 27                 mov	r5, r3
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+687
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
 e0 4d 05              jmp16	avm_test_main+2044
 f0 07 00 05           ldi16	r3, 0x500
 f1 23                 mov	r4, r3
 f0 05 00 04           ldi16	r1, 0x400
 f1 29                 mov	r6, r1
 f2 30                 sub	r0, r0
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 f1 23                 mov	r4, r3
 f1 26                 mov	r5, r2
 d7 11                 sys	memset
 c6 66 27              ldi16	r6, 0x2766
 c3 00                 ldi8	r7, 0x0
 c1 07                 ldi8	r5, 0x7
 c4 fc ff              ldi16	r4, 0xfffc
 d7 1f                 sys	draw_sprite_plus_mask
 c6 7a 27              ldi16	r6, 0x277a
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 23                 mov	r4, r3
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+777
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
 e0 f3 04              jmp16	avm_test_main+2044
 f1 23                 mov	r4, r3
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 f1 23                 mov	r4, r3
 c1 c3                 ldi8	r5, 0xc3
 d7 11                 sys	memset
 c6 66 27              ldi16	r6, 0x2766
 c3 00                 ldi8	r7, 0x0
 c1 3b                 ldi8	r5, 0x3b
 c0 7d                 ldi8	r4, 0x7d
 d7 1f                 sys	draw_sprite_plus_mask
 c6 7a 2b              ldi16	r6, 0x2b7a
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 23                 mov	r4, r3
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+856
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
 e0 a4 04              jmp16	avm_test_main+2044
 f1 23                 mov	r4, r3
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 f1 23                 mov	r4, r3
 c1 69                 ldi8	r5, 0x69
 d7 11                 sys	memset
 c6 7a 2f              ldi16	r6, 0x2f7a
 c3 00                 ldi8	r7, 0x0
 c5 f7 ff              ldi16	r5, 0xfff7
 c0 14                 ldi8	r4, 0x14
 d7 1f                 sys	draw_sprite_plus_mask
 c6 ac 2f              ldi16	r6, 0x2fac
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 23                 mov	r4, r3
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+936
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
 e0 54 04              jmp16	avm_test_main+2044
 f0 06 00 05           ldi16	r2, 0x500
 f1 22                 mov	r4, r2
 f1 29                 mov	r6, r1
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 c1 96                 ldi8	r5, 0x96
 d7 11                 sys	memset
 c6 7a 2f              ldi16	r6, 0x2f7a
 c3 00                 ldi8	r7, 0x0
 c1 37                 ldi8	r5, 0x37
 c0 14                 ldi8	r4, 0x14
 f0 00 01              ldi8	r0, 0x1
 d7 1f                 sys	draw_sprite_plus_mask
 c6 ac 33              ldi16	r6, 0x33ac
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1021
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
 e0 ff 03              jmp16	avm_test_main+2044
 f1 22                 mov	r4, r2
 f1 29                 mov	r6, r1
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 c1 5a                 ldi8	r5, 0x5a
 d7 11                 sys	memset
 c6 ac 37              ldi16	r6, 0x37ac
 c3 00                 ldi8	r7, 0x0
 c1 1f                 ldi8	r5, 0x1f
 f0 07 ff ff           ldi16	r3, 0xffff
 f1 23                 mov	r4, r3
 d7 1f                 sys	draw_sprite_plus_mask
 c6 be 3b              ldi16	r6, 0x3bbe
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1103
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
 e0 ad 03              jmp16	avm_test_main+2044
 f1 22                 mov	r4, r2
 f1 29                 mov	r6, r1
 f2 30                 sub	r0, r0
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 c1 a5                 ldi8	r5, 0xa5
 d7 11                 sys	memset
 c6 be 3f              ldi16	r6, 0x3fbe
 c3 00                 ldi8	r7, 0x0
 c0 3c                 ldi8	r4, 0x3c
 f1 27                 mov	r5, r3
 d7 1f                 sys	draw_sprite_plus_mask
 c6 3e 40              ldi16	r6, 0x403e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1184
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
 e0 5c 03              jmp16	avm_test_main+2044
 f1 22                 mov	r4, r2
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 c1 3c                 ldi8	r5, 0x3c
 d7 11                 sys	memset
 c6 22 09              ldi16	r6, 0x922
 c3 00                 ldi8	r7, 0x0
 c0 80                 ldi8	r4, 0x80
 c1 0a                 ldi8	r5, 0xa
 d7 1f                 sys	draw_sprite_plus_mask
 c6 3e 44              ldi16	r6, 0x443e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1263
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
 e0 0d 03              jmp16	avm_test_main+2044
 f1 22                 mov	r4, r2
 f1 29                 mov	r6, r1
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 c1 c3                 ldi8	r5, 0xc3
 d7 11                 sys	memset
 c6 22 09              ldi16	r6, 0x922
 c3 00                 ldi8	r7, 0x0
 c4 fb ff              ldi16	r4, 0xfffb
 c1 0a                 ldi8	r5, 0xa
 f0 00 01              ldi8	r0, 0x1
 d7 1f                 sys	draw_sprite_plus_mask
 c6 3e 48              ldi16	r6, 0x483e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1345
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
 e0 bb 02              jmp16	avm_test_main+2044
 f1 22                 mov	r4, r2
 f1 29                 mov	r6, r1
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 c1 69                 ldi8	r5, 0x69
 d7 11                 sys	memset
 c6 22 09              ldi16	r6, 0x922
 c3 00                 ldi8	r7, 0x0
 c5 f3 ff              ldi16	r5, 0xfff3
 c0 0a                 ldi8	r4, 0xa
 f0 00 02              ldi8	r0, 0x2
 d7 1f                 sys	draw_sprite_plus_mask
 c6 3e 4c              ldi16	r6, 0x4c3e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+1429
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
 c1 30                 ldi8	r5, 0x30
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 e0 67 02              jmp16	avm_test_main+2044
 f1 22                 mov	r4, r2
 f1 29                 mov	r6, r1
 f2 30                 sub	r0, r0
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 c1 96                 ldi8	r5, 0x96
 d7 11                 sys	memset
 c6 22 09              ldi16	r6, 0x922
 c3 00                 ldi8	r7, 0x0
 c1 40                 ldi8	r5, 0x40
 c0 0a                 ldi8	r4, 0xa
 d7 1f                 sys	draw_sprite_plus_mask
 c6 3e 50              ldi16	r6, 0x503e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1510
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
 e0 16 02              jmp16	avm_test_main+2044
 f1 22                 mov	r4, r2
 f0 04 00 04           ldi16	r0, 0x400
 f1 18                 mov	r3, r0
 f1 2b                 mov	r6, r3
 f2 39                 sub	r1, r1
 f1 25                 mov	r5, r1
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 c1 5a                 ldi8	r5, 0x5a
 d7 11                 sys	memset
 f0 00 7b              ldi8	r0, 0x7b
 f0 38 00              stsp16	[sp+0x0], r0
 c6 3e 54              ldi16	r6, 0x543e
 c3 00                 ldi8	r7, 0x0
 f1 21                 mov	r4, r1
 f1 25                 mov	r5, r1
 f0 30 00              ldsp16	r0, [sp+0x0]
 d7 1f                 sys	draw_sprite_plus_mask
 c6 40 54              ldi16	r6, 0x5440
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+1608
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
 e0 b4 01              jmp16	avm_test_main+2044
 f1 22                 mov	r4, r2
 f0 04 00 04           ldi16	r0, 0x400
 f1 18                 mov	r3, r0
 f1 2b                 mov	r6, r3
 f1 25                 mov	r5, r1
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 c1 a5                 ldi8	r5, 0xa5
 d7 11                 sys	memset
 f0 04 c8 01           ldi16	r0, 0x1c8
 f0 38 00              stsp16	[sp+0x0], r0
 c6 40 58              ldi16	r6, 0x5840
 c3 00                 ldi8	r7, 0x0
 f1 21                 mov	r4, r1
 f1 25                 mov	r5, r1
 f0 30 00              ldsp16	r0, [sp+0x0]
 d7 1f                 sys	draw_sprite_plus_mask
 c6 42 58              ldi16	r6, 0x5842
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+1705
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
 e0 53 01              jmp16	avm_test_main+2044
 f1 22                 mov	r4, r2
 f0 05 00 04           ldi16	r1, 0x400
 f1 29                 mov	r6, r1
 f2 30                 sub	r0, r0
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 c1 f0                 ldi8	r5, 0xf0
 f1 22                 mov	r4, r2
 d7 11                 sys	memset
 c6 ac 37              ldi16	r6, 0x37ac
 c3 00                 ldi8	r7, 0x0
 c1 18                 ldi8	r5, 0x18
 c4 7f ff              ldi16	r4, 0xff7f
 d7 1f                 sys	draw_sprite_plus_mask
 c6 42 5c              ldi16	r6, 0x5c42
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+1793
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
 e0 fb 00              jmp16	avm_test_main+2044
 f1 22                 mov	r4, r2
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 c1 0f                 ldi8	r5, 0xf
 f1 22                 mov	r4, r2
 d7 11                 sys	memset
 c6 be 3f              ldi16	r6, 0x3fbe
 c3 00                 ldi8	r7, 0x0
 c5 c0 ff              ldi16	r5, 0xffc0
 f0 03 49              ldi8	r3, 0x49
 f1 23                 mov	r4, r3
 d7 1f                 sys	draw_sprite_plus_mask
 c6 42 60              ldi16	r6, 0x6042
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
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
 e0 a6 00              jmp16	avm_test_main+2044
 f1 22                 mov	r4, r2
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 c1 55                 ldi8	r5, 0x55
 f1 22                 mov	r4, r2
 d7 11                 sys	memset
 c6 be 3f              ldi16	r6, 0x3fbe
 c3 00                 ldi8	r7, 0x0
 f1 23                 mov	r4, r3
 c1 3f                 ldi8	r5, 0x3f
 d7 1f                 sys	draw_sprite_plus_mask
 c6 42 64              ldi16	r6, 0x6442
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 26                 breq8	avm_test_main+1958
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
 d4 56                 jmp8	avm_test_main+2044
 f0 07 00 05           ldi16	r3, 0x500
 f1 23                 mov	r4, r3
 f1 29                 mov	r6, r1
 f2 42                 sub	r2, r2
 f1 26                 mov	r5, r2
 d7 11                 sys	memset
 c1 aa                 ldi8	r5, 0xaa
 f1 23                 mov	r4, r3
 d7 11                 sys	memset
 c6 ac 37              ldi16	r6, 0x37ac
 c3 00                 ldi8	r7, 0x0
 c1 04                 ldi8	r5, 0x4
 f1 22                 mov	r4, r2
 f1 02                 mov	r0, r2
 d7 1f                 sys	draw_sprite_plus_mask
 c6 42 68              ldi16	r6, 0x6842
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 23                 mov	r4, r3
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 29                 breq8	avm_test_main+2049
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
 f0 02 01              ldi8	r2, 0x1
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d6 02                 adjsp	avm_test_main+2055
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
