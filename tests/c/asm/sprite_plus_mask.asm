
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/sprite_plus_mask.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sprite_plus_mask.c
00000957 l     O .rodata	0000003e sprite_5x13
00006c77 l     O .rodata	00000400 expected_00
00000995 l     O .rodata	00000400 expected_01
00000d95 l     O .rodata	00000400 expected_02
00001195 l     O .rodata	00000400 expected_03
00001595 l     O .rodata	00000400 expected_04
00001995 l     O .rodata	00000400 expected_05
00001d95 l     O .rodata	00000400 expected_06
00002195 l     O .rodata	00000206 sprite_1x1_many_frames
0000239b l     O .rodata	00000400 expected_07
0000279b l     O .rodata	00000014 sprite_9x8
000027af l     O .rodata	00000400 expected_08
00002baf l     O .rodata	00000400 expected_09
00002faf l     O .rodata	00000032 sprite_4x17
00002fe1 l     O .rodata	00000400 expected_10
000033e1 l     O .rodata	00000400 expected_11
000037e1 l     O .rodata	00000412 sprite_130x9
00003bf3 l     O .rodata	00000400 expected_12
00003ff3 l     O .rodata	00000080 sprite_7x65
00004073 l     O .rodata	00000400 expected_13
00004473 l     O .rodata	00000400 expected_14
00004873 l     O .rodata	00000400 expected_15
00004c73 l     O .rodata	00000400 expected_16
00005073 l     O .rodata	00000400 expected_17
00005473 l     O .rodata	00000002 sprite_zero_width
00005475 l     O .rodata	00000400 expected_18
00005875 l     O .rodata	00000002 sprite_zero_height
00005877 l     O .rodata	00000400 expected_19
00005c77 l     O .rodata	00000400 expected_20
00006077 l     O .rodata	00000400 expected_21
00006477 l     O .rodata	00000400 expected_22
00006877 l     O .rodata	00000400 expected_23
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000016 _start
00000116 g     F .text	0000083f avm_test_main
00000955 g     F .text	00000002 avm_halt
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
 e1 3f 08              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c6 00 04              ldi16	r6, 0x400
 f2 30                 sub	r0, r0
 f0 05 00 05           ldi16	r1, 0x500
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 c6 57 09              ldi16	r6, 0x957
 c3 00                 ldi8	r7, 0x0
 c1 08                 ldi8	r5, 0x8
 c0 0a                 ldi8	r4, 0xa
 f2 67                 mov32	q1, q3
 f1 28                 mov	r6, r0
 f0 04 00 04           ldi16	r0, 0x400
 d7 1f                 sys	draw_sprite_plus_mask
 c6 77 6c              ldi16	r6, 0x6c77
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
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
 c0 0a                 ldi8	r4, 0xa
 e0 d9 07              jmp16	avm_test_main+2099
 f1 21                 mov	r4, r1
 f1 28                 mov	r6, r0
 a5                    xor	r5, r5
 d7 11                 sys	memset
 c1 a5                 ldi8	r5, 0xa5
 f1 21                 mov	r4, r1
 d7 11                 sys	memset
 c2 01                 ldi8	r6, 0x1
 f0 06 57 09           ldi16	r2, 0x957
 f0 03 00              ldi8	r3, 0x0
 c0 0a                 ldi8	r4, 0xa
 c1 08                 ldi8	r5, 0x8
 d7 1f                 sys	draw_sprite_plus_mask
 c6 95 09              ldi16	r6, 0x995
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+172
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
 e0 87 07              jmp16	avm_test_main+2099
 f1 21                 mov	r4, r1
 f1 28                 mov	r6, r0
 f1 2d                 mov	r7, r1
 f2 39                 sub	r1, r1
 f1 25                 mov	r5, r1
 d7 11                 sys	memset
 c1 3c                 ldi8	r5, 0x3c
 03                    mov	r4, r7
 d7 11                 sys	memset
 f0 01 02              ldi8	r1, 0x2
 c6 57 09              ldi16	r6, 0x957
 c3 00                 ldi8	r7, 0x0
 c1 03                 ldi8	r5, 0x3
 c0 1b                 ldi8	r4, 0x1b
 f2 67                 mov32	q1, q3
 f1 29                 mov	r6, r1
 d7 1f                 sys	draw_sprite_plus_mask
 c6 95 0d              ldi16	r6, 0xd95
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 00 05              ldi16	r4, 0x500
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+262
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
 e0 2d 07              jmp16	avm_test_main+2099
 f0 05 00 05           ldi16	r1, 0x500
 f1 21                 mov	r4, r1
 f1 28                 mov	r6, r0
 a5                    xor	r5, r5
 d7 11                 sys	memset
 c1 96                 ldi8	r5, 0x96
 f1 21                 mov	r4, r1
 d7 11                 sys	memset
 c6 57 09              ldi16	r6, 0x957
 c3 00                 ldi8	r7, 0x0
 c1 13                 ldi8	r5, 0x13
 c4 fe ff              ldi16	r4, 0xfffe
 f2 67                 mov32	q1, q3
 c2 01                 ldi8	r6, 0x1
 d7 1f                 sys	draw_sprite_plus_mask
 c6 95 11              ldi16	r6, 0x1195
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+349
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
 e0 d6 06              jmp16	avm_test_main+2099
 f1 21                 mov	r4, r1
 f1 28                 mov	r6, r0
 a5                    xor	r5, r5
 d7 11                 sys	memset
 c1 69                 ldi8	r5, 0x69
 f1 21                 mov	r4, r1
 d7 11                 sys	memset
 c6 57 09              ldi16	r6, 0x957
 c3 00                 ldi8	r7, 0x0
 c1 11                 ldi8	r5, 0x11
 c0 7e                 ldi8	r4, 0x7e
 f2 67                 mov32	q1, q3
 c2 02                 ldi8	r6, 0x2
 d7 1f                 sys	draw_sprite_plus_mask
 c6 95 15              ldi16	r6, 0x1595
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+431
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
 e0 84 06              jmp16	avm_test_main+2099
 f1 21                 mov	r4, r1
 f1 28                 mov	r6, r0
 f2 30                 sub	r0, r0
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 c1 c3                 ldi8	r5, 0xc3
 f1 21                 mov	r4, r1
 d7 11                 sys	memset
 c6 57 09              ldi16	r6, 0x957
 c3 00                 ldi8	r7, 0x0
 c5 fb ff              ldi16	r5, 0xfffb
 c0 28                 ldi8	r4, 0x28
 f2 67                 mov32	q1, q3
 f1 28                 mov	r6, r0
 d7 1f                 sys	draw_sprite_plus_mask
 c6 95 19              ldi16	r6, 0x1995
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+518
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
 e0 2d 06              jmp16	avm_test_main+2099
 f0 04 00 05           ldi16	r0, 0x500
 f1 20                 mov	r4, r0
 f1 0d                 mov	r1, r5
 f1 29                 mov	r6, r1
 a5                    xor	r5, r5
 d7 11                 sys	memset
 c1 5a                 ldi8	r5, 0x5a
 f1 20                 mov	r4, r0
 d7 11                 sys	memset
 c6 57 09              ldi16	r6, 0x957
 c3 00                 ldi8	r7, 0x0
 c1 3a                 ldi8	r5, 0x3a
 c0 46                 ldi8	r4, 0x46
 f2 67                 mov32	q1, q3
 c2 01                 ldi8	r6, 0x1
 d7 1f                 sys	draw_sprite_plus_mask
 c6 95 1d              ldi16	r6, 0x1d95
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+606
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
 e0 d5 05              jmp16	avm_test_main+2099
 f0 05 00 05           ldi16	r1, 0x500
 f1 21                 mov	r4, r1
 a5                    xor	r5, r5
 f0 04 00 04           ldi16	r0, 0x400
 f1 28                 mov	r6, r0
 d7 11                 sys	memset
 c6 01 01              ldi16	r6, 0x101
 f0 06 95 21           ldi16	r2, 0x2195
 f0 03 00              ldi8	r3, 0x0
 c1 3f                 ldi8	r5, 0x3f
 c0 7f                 ldi8	r4, 0x7f
 d7 1f                 sys	draw_sprite_plus_mask
 c6 9b 23              ldi16	r6, 0x239b
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+691
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
 e0 80 05              jmp16	avm_test_main+2099
 f1 21                 mov	r4, r1
 f1 28                 mov	r6, r0
 f2 30                 sub	r0, r0
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 3c                 ldi8	r5, 0x3c
 d7 11                 sys	memset
 c6 9b 27              ldi16	r6, 0x279b
 c3 00                 ldi8	r7, 0x0
 c1 07                 ldi8	r5, 0x7
 c4 fc ff              ldi16	r4, 0xfffc
 f2 67                 mov32	q1, q3
 f1 28                 mov	r6, r0
 d7 1f                 sys	draw_sprite_plus_mask
 c6 af 27              ldi16	r6, 0x27af
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+778
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
 e0 29 05              jmp16	avm_test_main+2099
 f1 21                 mov	r4, r1
 f0 04 00 04           ldi16	r0, 0x400
 f1 28                 mov	r6, r0
 f2 30                 sub	r0, r0
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 c3                 ldi8	r5, 0xc3
 d7 11                 sys	memset
 c6 9b 27              ldi16	r6, 0x279b
 c3 00                 ldi8	r7, 0x0
 c1 3b                 ldi8	r5, 0x3b
 c0 7d                 ldi8	r4, 0x7d
 f2 67                 mov32	q1, q3
 f1 28                 mov	r6, r0
 d7 1f                 sys	draw_sprite_plus_mask
 c6 af 2b              ldi16	r6, 0x2baf
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+868
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
 e0 cf 04              jmp16	avm_test_main+2099
 f1 21                 mov	r4, r1
 f0 04 00 04           ldi16	r0, 0x400
 f1 28                 mov	r6, r0
 f2 30                 sub	r0, r0
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 69                 ldi8	r5, 0x69
 d7 11                 sys	memset
 c6 af 2f              ldi16	r6, 0x2faf
 c3 00                 ldi8	r7, 0x0
 c5 f7 ff              ldi16	r5, 0xfff7
 c0 14                 ldi8	r4, 0x14
 f2 67                 mov32	q1, q3
 f1 28                 mov	r6, r0
 d7 1f                 sys	draw_sprite_plus_mask
 c6 e1 2f              ldi16	r6, 0x2fe1
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+959
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
 e0 74 04              jmp16	avm_test_main+2099
 f1 21                 mov	r4, r1
 f0 04 00 04           ldi16	r0, 0x400
 f1 28                 mov	r6, r0
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 96                 ldi8	r5, 0x96
 d7 11                 sys	memset
 c6 af 2f              ldi16	r6, 0x2faf
 c3 00                 ldi8	r7, 0x0
 c1 37                 ldi8	r5, 0x37
 c0 14                 ldi8	r4, 0x14
 f2 67                 mov32	q1, q3
 c2 01                 ldi8	r6, 0x1
 d7 1f                 sys	draw_sprite_plus_mask
 c6 e1 33              ldi16	r6, 0x33e1
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1045
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
 e0 1e 04              jmp16	avm_test_main+2099
 f1 21                 mov	r4, r1
 f1 28                 mov	r6, r0
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 5a                 ldi8	r5, 0x5a
 d7 11                 sys	memset
 c6 e1 37              ldi16	r6, 0x37e1
 c3 00                 ldi8	r7, 0x0
 c1 1f                 ldi8	r5, 0x1f
 c4 ff ff              ldi16	r4, 0xffff
 f2 67                 mov32	q1, q3
 c2 01                 ldi8	r6, 0x1
 d7 1f                 sys	draw_sprite_plus_mask
 c6 f3 3b              ldi16	r6, 0x3bf3
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1128
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
 e0 cb 03              jmp16	avm_test_main+2099
 f1 21                 mov	r4, r1
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 07                    mov	r5, r7
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 a5                 ldi8	r5, 0xa5
 d7 11                 sys	memset
 f0 06 f3 3f           ldi16	r2, 0x3ff3
 f0 03 00              ldi8	r3, 0x0
 c0 3c                 ldi8	r4, 0x3c
 c5 ff ff              ldi16	r5, 0xffff
 0b                    mov	r6, r7
 d7 1f                 sys	draw_sprite_plus_mask
 c6 73 40              ldi16	r6, 0x4073
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1211
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
 e0 78 03              jmp16	avm_test_main+2099
 c4 00 05              ldi16	r4, 0x500
 0c                    mov	r7, r4
 f1 28                 mov	r6, r0
 f2 39                 sub	r1, r1
 f1 25                 mov	r5, r1
 d7 11                 sys	memset
 03                    mov	r4, r7
 c1 3c                 ldi8	r5, 0x3c
 d7 11                 sys	memset
 c6 57 09              ldi16	r6, 0x957
 c3 00                 ldi8	r7, 0x0
 c0 80                 ldi8	r4, 0x80
 c1 0a                 ldi8	r5, 0xa
 f2 67                 mov32	q1, q3
 f1 29                 mov	r6, r1
 d7 1f                 sys	draw_sprite_plus_mask
 c6 73 44              ldi16	r6, 0x4473
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 00 05              ldi16	r4, 0x500
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1298
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
 e0 21 03              jmp16	avm_test_main+2099
 f0 05 00 05           ldi16	r1, 0x500
 f1 21                 mov	r4, r1
 f1 28                 mov	r6, r0
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 c3                 ldi8	r5, 0xc3
 d7 11                 sys	memset
 f0 06 57 09           ldi16	r2, 0x957
 f0 03 00              ldi8	r3, 0x0
 c4 fb ff              ldi16	r4, 0xfffb
 c1 0a                 ldi8	r5, 0xa
 c2 01                 ldi8	r6, 0x1
 d7 1f                 sys	draw_sprite_plus_mask
 c6 73 48              ldi16	r6, 0x4873
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1385
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
 e0 ca 02              jmp16	avm_test_main+2099
 f1 21                 mov	r4, r1
 f1 28                 mov	r6, r0
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 69                 ldi8	r5, 0x69
 d7 11                 sys	memset
 c6 57 09              ldi16	r6, 0x957
 c3 00                 ldi8	r7, 0x0
 c5 f3 ff              ldi16	r5, 0xfff3
 c0 0a                 ldi8	r4, 0xa
 f2 67                 mov32	q1, q3
 c2 02                 ldi8	r6, 0x2
 d7 1f                 sys	draw_sprite_plus_mask
 c6 73 4c              ldi16	r6, 0x4c73
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+1470
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
 e0 75 02              jmp16	avm_test_main+2099
 c4 00 05              ldi16	r4, 0x500
 0c                    mov	r7, r4
 f0 05 00 04           ldi16	r1, 0x400
 f1 29                 mov	r6, r1
 f2 30                 sub	r0, r0
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 03                    mov	r4, r7
 c1 96                 ldi8	r5, 0x96
 d7 11                 sys	memset
 c6 57 09              ldi16	r6, 0x957
 c3 00                 ldi8	r7, 0x0
 c1 40                 ldi8	r5, 0x40
 c0 0a                 ldi8	r4, 0xa
 f2 67                 mov32	q1, q3
 f1 28                 mov	r6, r0
 d7 1f                 sys	draw_sprite_plus_mask
 c6 73 50              ldi16	r6, 0x5073
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 00 05              ldi16	r4, 0x500
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1561
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
 e0 1a 02              jmp16	avm_test_main+2099
 f0 05 00 05           ldi16	r1, 0x500
 f1 21                 mov	r4, r1
 f0 04 00 04           ldi16	r0, 0x400
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 07                    mov	r5, r7
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 5a                 ldi8	r5, 0x5a
 d7 11                 sys	memset
 c2 7b                 ldi8	r6, 0x7b
 f0 06 73 54           ldi16	r2, 0x5473
 f0 03 00              ldi8	r3, 0x0
 03                    mov	r4, r7
 07                    mov	r5, r7
 d7 1f                 sys	draw_sprite_plus_mask
 c6 75 54              ldi16	r6, 0x5475
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+1652
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
 e0 bf 01              jmp16	avm_test_main+2099
 f1 21                 mov	r4, r1
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 07                    mov	r5, r7
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 a5                 ldi8	r5, 0xa5
 d7 11                 sys	memset
 c6 c8 01              ldi16	r6, 0x1c8
 f0 06 75 58           ldi16	r2, 0x5875
 f0 03 00              ldi8	r3, 0x0
 03                    mov	r4, r7
 07                    mov	r5, r7
 d7 1f                 sys	draw_sprite_plus_mask
 c6 77 58              ldi16	r6, 0x5877
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+1736
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
 e0 6b 01              jmp16	avm_test_main+2099
 c4 00 05              ldi16	r4, 0x500
 0c                    mov	r7, r4
 f0 05 00 04           ldi16	r1, 0x400
 f1 29                 mov	r6, r1
 f2 30                 sub	r0, r0
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 c1 f0                 ldi8	r5, 0xf0
 03                    mov	r4, r7
 d7 11                 sys	memset
 c6 e1 37              ldi16	r6, 0x37e1
 c3 00                 ldi8	r7, 0x0
 c1 18                 ldi8	r5, 0x18
 c4 7f ff              ldi16	r4, 0xff7f
 f2 67                 mov32	q1, q3
 f1 28                 mov	r6, r0
 d7 1f                 sys	draw_sprite_plus_mask
 c6 77 5c              ldi16	r6, 0x5c77
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 00 05              ldi16	r4, 0x500
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+1830
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
 e0 0d 01              jmp16	avm_test_main+2099
 c4 00 05              ldi16	r4, 0x500
 0c                    mov	r7, r4
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 c1 0f                 ldi8	r5, 0xf
 03                    mov	r4, r7
 d7 11                 sys	memset
 c6 f3 3f              ldi16	r6, 0x3ff3
 c3 00                 ldi8	r7, 0x0
 c5 c0 ff              ldi16	r5, 0xffc0
 c0 49                 ldi8	r4, 0x49
 f2 67                 mov32	q1, q3
 f1 28                 mov	r6, r0
 d7 1f                 sys	draw_sprite_plus_mask
 c6 77 60              ldi16	r6, 0x6077
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 00 05              ldi16	r4, 0x500
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+1918
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
 e0 b5 00              jmp16	avm_test_main+2099
 f0 05 00 05           ldi16	r1, 0x500
 f1 21                 mov	r4, r1
 f0 04 00 04           ldi16	r0, 0x400
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 07                    mov	r5, r7
 d7 11                 sys	memset
 c1 55                 ldi8	r5, 0x55
 f1 21                 mov	r4, r1
 d7 11                 sys	memset
 f0 06 f3 3f           ldi16	r2, 0x3ff3
 f0 03 00              ldi8	r3, 0x0
 c0 49                 ldi8	r4, 0x49
 c1 3f                 ldi8	r5, 0x3f
 0b                    mov	r6, r7
 d7 1f                 sys	draw_sprite_plus_mask
 c6 77 64              ldi16	r6, 0x6477
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 26                 breq8	avm_test_main+2009
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
 d4 5a                 jmp8	avm_test_main+2099
 c4 00 05              ldi16	r4, 0x500
 0c                    mov	r7, r4
 f0 05 00 04           ldi16	r1, 0x400
 f1 29                 mov	r6, r1
 f2 30                 sub	r0, r0
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 c1 aa                 ldi8	r5, 0xaa
 03                    mov	r4, r7
 d7 11                 sys	memset
 c6 e1 37              ldi16	r6, 0x37e1
 c3 00                 ldi8	r7, 0x0
 c1 04                 ldi8	r5, 0x4
 f1 20                 mov	r4, r0
 f2 67                 mov32	q1, q3
 f1 28                 mov	r6, r0
 d7 1f                 sys	draw_sprite_plus_mask
 c6 77 68              ldi16	r6, 0x6877
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 00 05              ldi16	r4, 0x500
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 29                 breq8	avm_test_main+2104
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
