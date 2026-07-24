
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/sprite_self_masked.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sprite_self_masked.c
00000916 l     O .rodata	00000020 sprite_5x13
000060ae l     O .rodata	00000400 expected_00
00000936 l     O .rodata	00000400 expected_01
00000d36 l     O .rodata	00000400 expected_02
00001136 l     O .rodata	00000400 expected_03
00001536 l     O .rodata	00000400 expected_04
00001936 l     O .rodata	00000400 expected_05
00001d36 l     O .rodata	00000400 expected_06
00002136 l     O .rodata	00000104 sprite_1x1_many_frames
0000223a l     O .rodata	00000400 expected_07
0000263a l     O .rodata	0000000b sprite_9x8
00002645 l     O .rodata	00000400 expected_08
00002a45 l     O .rodata	00000400 expected_09
00002e45 l     O .rodata	0000001a sprite_4x17
00002e5f l     O .rodata	00000400 expected_10
0000325f l     O .rodata	00000400 expected_11
0000365f l     O .rodata	0000020a sprite_130x9
00003869 l     O .rodata	00000400 expected_12
00003c69 l     O .rodata	00000041 sprite_7x65
00003caa l     O .rodata	00000400 expected_13
000040aa l     O .rodata	00000400 expected_14
000044aa l     O .rodata	00000400 expected_15
000048aa l     O .rodata	00000400 expected_16
00004caa l     O .rodata	00000400 expected_17
000050aa l     O .rodata	00000002 sprite_zero_width
000050ac l     O .rodata	00000400 expected_18
000054ac l     O .rodata	00000002 sprite_zero_height
000054ae l     O .rodata	00000400 expected_19
000064ae l     O .rodata	00000400 expected_20
000068ae l     O .rodata	00000400 expected_21
000058ae l     O .rodata	00000400 expected_22
00005cae l     O .rodata	00000400 expected_23
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000016 _start
00000116 g     F .text	000007fe avm_test_main
00000914 g     F .text	00000002 avm_halt
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
 e1 fe 07              call16	avm_halt

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
 c6 16 09              ldi16	r6, 0x916
 c3 00                 ldi8	r7, 0x0
 c1 08                 ldi8	r5, 0x8
 f0 01 0a              ldi8	r1, 0xa
 f1 21                 mov	r4, r1
 d7 20                 sys	draw_sprite_self_masked
 c6 ae 60              ldi16	r6, 0x60ae
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
 e0 96 07              jmp16	avm_test_main+2032
 c4 00 05              ldi16	r4, 0x500
 f1 1c                 mov	r3, r4
 f1 2a                 mov	r6, r2
 a5                    xor	r5, r5
 d7 11                 sys	memset
 c1 a5                 ldi8	r5, 0xa5
 f1 23                 mov	r4, r3
 d7 11                 sys	memset
 f0 00 01              ldi8	r0, 0x1
 c6 16 09              ldi16	r6, 0x916
 c3 00                 ldi8	r7, 0x0
 f1 21                 mov	r4, r1
 c1 08                 ldi8	r5, 0x8
 d7 20                 sys	draw_sprite_self_masked
 c6 36 09              ldi16	r6, 0x936
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
 e0 42 07              jmp16	avm_test_main+2032
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
 c6 16 09              ldi16	r6, 0x916
 c3 00                 ldi8	r7, 0x0
 c1 03                 ldi8	r5, 0x3
 c0 1b                 ldi8	r4, 0x1b
 d7 20                 sys	draw_sprite_self_masked
 c6 36 0d              ldi16	r6, 0xd36
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
 e0 e3 06              jmp16	avm_test_main+2032
 f1 23                 mov	r4, r3
 f1 29                 mov	r6, r1
 a5                    xor	r5, r5
 d7 11                 sys	memset
 c1 96                 ldi8	r5, 0x96
 f1 23                 mov	r4, r3
 d7 11                 sys	memset
 c6 16 09              ldi16	r6, 0x916
 c3 00                 ldi8	r7, 0x0
 c1 13                 ldi8	r5, 0x13
 c4 fe ff              ldi16	r4, 0xfffe
 f0 00 01              ldi8	r0, 0x1
 d7 20                 sys	draw_sprite_self_masked
 c6 36 11              ldi16	r6, 0x1136
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
 e0 91 06              jmp16	avm_test_main+2032
 f1 23                 mov	r4, r3
 f1 29                 mov	r6, r1
 a5                    xor	r5, r5
 d7 11                 sys	memset
 c1 69                 ldi8	r5, 0x69
 f1 23                 mov	r4, r3
 d7 11                 sys	memset
 c6 16 09              ldi16	r6, 0x916
 c3 00                 ldi8	r7, 0x0
 c1 11                 ldi8	r5, 0x11
 c0 7e                 ldi8	r4, 0x7e
 f0 00 02              ldi8	r0, 0x2
 d7 20                 sys	draw_sprite_self_masked
 c6 36 15              ldi16	r6, 0x1536
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
 e0 40 06              jmp16	avm_test_main+2032
 f1 23                 mov	r4, r3
 f1 29                 mov	r6, r1
 f2 30                 sub	r0, r0
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 c1 c3                 ldi8	r5, 0xc3
 f1 23                 mov	r4, r3
 d7 11                 sys	memset
 c6 16 09              ldi16	r6, 0x916
 c3 00                 ldi8	r7, 0x0
 c5 fb ff              ldi16	r5, 0xfffb
 c0 28                 ldi8	r4, 0x28
 d7 20                 sys	draw_sprite_self_masked
 c6 36 19              ldi16	r6, 0x1936
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
 e0 ee 05              jmp16	avm_test_main+2032
 f1 23                 mov	r4, r3
 f1 29                 mov	r6, r1
 a5                    xor	r5, r5
 d7 11                 sys	memset
 c1 5a                 ldi8	r5, 0x5a
 f1 23                 mov	r4, r3
 d7 11                 sys	memset
 c6 16 09              ldi16	r6, 0x916
 c3 00                 ldi8	r7, 0x0
 c1 3a                 ldi8	r5, 0x3a
 c0 46                 ldi8	r4, 0x46
 f0 00 01              ldi8	r0, 0x1
 d7 20                 sys	draw_sprite_self_masked
 c6 36 1d              ldi16	r6, 0x1d36
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
 e0 9d 05              jmp16	avm_test_main+2032
 f0 05 00 05           ldi16	r1, 0x500
 f1 21                 mov	r4, r1
 a5                    xor	r5, r5
 f0 04 00 04           ldi16	r0, 0x400
 f1 18                 mov	r3, r0
 f1 2b                 mov	r6, r3
 d7 11                 sys	memset
 f0 04 01 01           ldi16	r0, 0x101
 f0 38 00              stsp16	[sp+0x0], r0
 c6 36 21              ldi16	r6, 0x2136
 c3 00                 ldi8	r7, 0x0
 c1 3f                 ldi8	r5, 0x3f
 c0 7f                 ldi8	r4, 0x7f
 f0 30 00              ldsp16	r0, [sp+0x0]
 d7 20                 sys	draw_sprite_self_masked
 c6 3a 22              ldi16	r6, 0x223a
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
 e0 41 05              jmp16	avm_test_main+2032
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
 c6 3a 26              ldi16	r6, 0x263a
 c3 00                 ldi8	r7, 0x0
 c1 07                 ldi8	r5, 0x7
 c4 fc ff              ldi16	r4, 0xfffc
 d7 20                 sys	draw_sprite_self_masked
 c6 45 26              ldi16	r6, 0x2645
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
 e0 e7 04              jmp16	avm_test_main+2032
 f1 23                 mov	r4, r3
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 f1 23                 mov	r4, r3
 c1 c3                 ldi8	r5, 0xc3
 d7 11                 sys	memset
 c6 3a 26              ldi16	r6, 0x263a
 c3 00                 ldi8	r7, 0x0
 c1 3b                 ldi8	r5, 0x3b
 c0 7d                 ldi8	r4, 0x7d
 d7 20                 sys	draw_sprite_self_masked
 c6 45 2a              ldi16	r6, 0x2a45
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
 e0 98 04              jmp16	avm_test_main+2032
 f1 23                 mov	r4, r3
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 f1 23                 mov	r4, r3
 c1 69                 ldi8	r5, 0x69
 d7 11                 sys	memset
 c6 45 2e              ldi16	r6, 0x2e45
 c3 00                 ldi8	r7, 0x0
 c5 f7 ff              ldi16	r5, 0xfff7
 c0 14                 ldi8	r4, 0x14
 d7 20                 sys	draw_sprite_self_masked
 c6 5f 2e              ldi16	r6, 0x2e5f
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
 e0 48 04              jmp16	avm_test_main+2032
 f0 06 00 05           ldi16	r2, 0x500
 f1 22                 mov	r4, r2
 f1 29                 mov	r6, r1
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 c1 96                 ldi8	r5, 0x96
 d7 11                 sys	memset
 c6 45 2e              ldi16	r6, 0x2e45
 c3 00                 ldi8	r7, 0x0
 c1 37                 ldi8	r5, 0x37
 c0 14                 ldi8	r4, 0x14
 f0 00 01              ldi8	r0, 0x1
 d7 20                 sys	draw_sprite_self_masked
 c6 5f 32              ldi16	r6, 0x325f
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
 e0 f3 03              jmp16	avm_test_main+2032
 f1 22                 mov	r4, r2
 f1 29                 mov	r6, r1
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 c1 5a                 ldi8	r5, 0x5a
 d7 11                 sys	memset
 c6 5f 36              ldi16	r6, 0x365f
 c3 00                 ldi8	r7, 0x0
 c1 1f                 ldi8	r5, 0x1f
 f0 07 ff ff           ldi16	r3, 0xffff
 f1 23                 mov	r4, r3
 d7 20                 sys	draw_sprite_self_masked
 c6 69 38              ldi16	r6, 0x3869
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
 e0 a1 03              jmp16	avm_test_main+2032
 f1 22                 mov	r4, r2
 f1 29                 mov	r6, r1
 f2 30                 sub	r0, r0
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 c1 a5                 ldi8	r5, 0xa5
 d7 11                 sys	memset
 c6 69 3c              ldi16	r6, 0x3c69
 c3 00                 ldi8	r7, 0x0
 c0 3c                 ldi8	r4, 0x3c
 f1 27                 mov	r5, r3
 d7 20                 sys	draw_sprite_self_masked
 c6 aa 3c              ldi16	r6, 0x3caa
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
 e0 50 03              jmp16	avm_test_main+2032
 f1 22                 mov	r4, r2
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 c1 3c                 ldi8	r5, 0x3c
 d7 11                 sys	memset
 c6 16 09              ldi16	r6, 0x916
 c3 00                 ldi8	r7, 0x0
 c0 80                 ldi8	r4, 0x80
 c1 0a                 ldi8	r5, 0xa
 d7 20                 sys	draw_sprite_self_masked
 c6 aa 40              ldi16	r6, 0x40aa
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
 e0 01 03              jmp16	avm_test_main+2032
 f1 22                 mov	r4, r2
 f1 29                 mov	r6, r1
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 c1 c3                 ldi8	r5, 0xc3
 d7 11                 sys	memset
 c6 16 09              ldi16	r6, 0x916
 c3 00                 ldi8	r7, 0x0
 c4 fb ff              ldi16	r4, 0xfffb
 c1 0a                 ldi8	r5, 0xa
 f0 00 01              ldi8	r0, 0x1
 d7 20                 sys	draw_sprite_self_masked
 c6 aa 44              ldi16	r6, 0x44aa
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
 e0 af 02              jmp16	avm_test_main+2032
 f1 22                 mov	r4, r2
 f1 29                 mov	r6, r1
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 c1 69                 ldi8	r5, 0x69
 d7 11                 sys	memset
 c6 16 09              ldi16	r6, 0x916
 c3 00                 ldi8	r7, 0x0
 c5 f3 ff              ldi16	r5, 0xfff3
 c0 0a                 ldi8	r4, 0xa
 f0 00 02              ldi8	r0, 0x2
 d7 20                 sys	draw_sprite_self_masked
 c6 aa 48              ldi16	r6, 0x48aa
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
 e0 5b 02              jmp16	avm_test_main+2032
 f1 22                 mov	r4, r2
 f1 29                 mov	r6, r1
 f2 30                 sub	r0, r0
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 c1 96                 ldi8	r5, 0x96
 d7 11                 sys	memset
 c6 16 09              ldi16	r6, 0x916
 c3 00                 ldi8	r7, 0x0
 c1 40                 ldi8	r5, 0x40
 c0 0a                 ldi8	r4, 0xa
 d7 20                 sys	draw_sprite_self_masked
 c6 aa 4c              ldi16	r6, 0x4caa
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
 e0 0a 02              jmp16	avm_test_main+2032
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
 c6 aa 50              ldi16	r6, 0x50aa
 c3 00                 ldi8	r7, 0x0
 f1 21                 mov	r4, r1
 f1 25                 mov	r5, r1
 f0 30 00              ldsp16	r0, [sp+0x0]
 d7 20                 sys	draw_sprite_self_masked
 c6 ac 50              ldi16	r6, 0x50ac
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
 e0 a8 01              jmp16	avm_test_main+2032
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
 c6 ac 54              ldi16	r6, 0x54ac
 c3 00                 ldi8	r7, 0x0
 f1 21                 mov	r4, r1
 f1 25                 mov	r5, r1
 f0 30 00              ldsp16	r0, [sp+0x0]
 d7 20                 sys	draw_sprite_self_masked
 c6 ae 54              ldi16	r6, 0x54ae
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
 e0 47 01              jmp16	avm_test_main+2032
 f1 22                 mov	r4, r2
 f2 30                 sub	r0, r0
 f1 24                 mov	r5, r0
 f0 05 00 04           ldi16	r1, 0x400
 f1 29                 mov	r6, r1
 d7 11                 sys	memset
 c6 5f 36              ldi16	r6, 0x365f
 c3 00                 ldi8	r7, 0x0
 c1 18                 ldi8	r5, 0x18
 c4 7f ff              ldi16	r4, 0xff7f
 d7 20                 sys	draw_sprite_self_masked
 c6 ae 64              ldi16	r6, 0x64ae
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+1787
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
 e0 f5 00              jmp16	avm_test_main+2032
 f1 22                 mov	r4, r2
 f1 24                 mov	r5, r0
 f1 29                 mov	r6, r1
 d7 11                 sys	memset
 c6 69 3c              ldi16	r6, 0x3c69
 c3 00                 ldi8	r7, 0x0
 c5 c0 ff              ldi16	r5, 0xffc0
 f0 03 49              ldi8	r3, 0x49
 f1 23                 mov	r4, r3
 d7 20                 sys	draw_sprite_self_masked
 c6 ae 68              ldi16	r6, 0x68ae
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+1866
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
 e0 a6 00              jmp16	avm_test_main+2032
 f1 22                 mov	r4, r2
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 c1 55                 ldi8	r5, 0x55
 f1 22                 mov	r4, r2
 d7 11                 sys	memset
 c6 69 3c              ldi16	r6, 0x3c69
 c3 00                 ldi8	r7, 0x0
 f1 23                 mov	r4, r3
 c1 3f                 ldi8	r5, 0x3f
 d7 20                 sys	draw_sprite_self_masked
 c6 ae 58              ldi16	r6, 0x58ae
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 26                 breq8	avm_test_main+1946
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
 d4 56                 jmp8	avm_test_main+2032
 f0 07 00 05           ldi16	r3, 0x500
 f1 23                 mov	r4, r3
 f1 29                 mov	r6, r1
 f2 42                 sub	r2, r2
 f1 26                 mov	r5, r2
 d7 11                 sys	memset
 c1 aa                 ldi8	r5, 0xaa
 f1 23                 mov	r4, r3
 d7 11                 sys	memset
 c6 5f 36              ldi16	r6, 0x365f
 c3 00                 ldi8	r7, 0x0
 c1 04                 ldi8	r5, 0x4
 f1 22                 mov	r4, r2
 f1 02                 mov	r0, r2
 d7 20                 sys	draw_sprite_self_masked
 c6 ae 5c              ldi16	r6, 0x5cae
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 23                 mov	r4, r3
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 29                 breq8	avm_test_main+2037
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
 d6 02                 adjsp	avm_test_main+2043
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
