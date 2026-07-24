
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/sprite_self_masked.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sprite_self_masked.c
00000924 l     O .rodata	00000020 sprite_5x13
000060bc l     O .rodata	00000400 expected_00
00000944 l     O .rodata	00000400 expected_01
00000d44 l     O .rodata	00000400 expected_02
00001144 l     O .rodata	00000400 expected_03
00001544 l     O .rodata	00000400 expected_04
00001944 l     O .rodata	00000400 expected_05
00001d44 l     O .rodata	00000400 expected_06
00002144 l     O .rodata	00000104 sprite_1x1_many_frames
00002248 l     O .rodata	00000400 expected_07
00002648 l     O .rodata	0000000b sprite_9x8
00002653 l     O .rodata	00000400 expected_08
00002a53 l     O .rodata	00000400 expected_09
00002e53 l     O .rodata	0000001a sprite_4x17
00002e6d l     O .rodata	00000400 expected_10
0000326d l     O .rodata	00000400 expected_11
0000366d l     O .rodata	0000020a sprite_130x9
00003877 l     O .rodata	00000400 expected_12
00003c77 l     O .rodata	00000041 sprite_7x65
00003cb8 l     O .rodata	00000400 expected_13
000040b8 l     O .rodata	00000400 expected_14
000044b8 l     O .rodata	00000400 expected_15
000048b8 l     O .rodata	00000400 expected_16
00004cb8 l     O .rodata	00000400 expected_17
000050b8 l     O .rodata	00000002 sprite_zero_width
000050ba l     O .rodata	00000400 expected_18
000054ba l     O .rodata	00000002 sprite_zero_height
000054bc l     O .rodata	00000400 expected_19
000064bc l     O .rodata	00000400 expected_20
000068bc l     O .rodata	00000400 expected_21
000058bc l     O .rodata	00000400 expected_22
00005cbc l     O .rodata	00000400 expected_23
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000016 _start
00000116 g     F .text	0000080c avm_test_main
00000922 g     F .text	00000002 avm_halt
00000500 g       *ABS*	00000000 __avm_framebuffer

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 04                    mov	r5, r4
 c0 46                 ldi8	r4, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2d                 tst16	r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 0c 08              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f0 04 00 04           ldi16	r0, 0x400
 af                    xor	r7, r7
 f0 05 00 05           ldi16	r1, 0x500
 f1 21                 mov	r4, r1
 07                    mov	r5, r7
 f1 28                 mov	r6, r0
 d7 11                 sys	memset
 f0 06 24 09           ldi16	r2, 0x924
 f0 03 00              ldi8	r3, 0x0
 c1 08                 ldi8	r5, 0x8
 c0 0a                 ldi8	r4, 0xa
 0b                    mov	r6, r7
 d7 20                 sys	draw_sprite_self_masked
 c6 bc 60              ldi16	r6, 0x60bc
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
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
 e0 a6 07              jmp16	avm_test_main+2046
 c4 00 05              ldi16	r4, 0x500
 f1 0c                 mov	r1, r4
 f1 28                 mov	r6, r0
 a5                    xor	r5, r5
 d7 11                 sys	memset
 c1 a5                 ldi8	r5, 0xa5
 f1 21                 mov	r4, r1
 d7 11                 sys	memset
 c2 01                 ldi8	r6, 0x1
 f0 06 24 09           ldi16	r2, 0x924
 f0 03 00              ldi8	r3, 0x0
 c0 0a                 ldi8	r4, 0xa
 c1 08                 ldi8	r5, 0x8
 d7 20                 sys	draw_sprite_self_masked
 c6 44 09              ldi16	r6, 0x944
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+173
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
 e0 51 07              jmp16	avm_test_main+2046
 c4 00 05              ldi16	r4, 0x500
 0c                    mov	r7, r4
 f0 05 00 04           ldi16	r1, 0x400
 f1 29                 mov	r6, r1
 f2 30                 sub	r0, r0
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 c1 3c                 ldi8	r5, 0x3c
 03                    mov	r4, r7
 f1 07                 mov	r0, r7
 d7 11                 sys	memset
 c2 02                 ldi8	r6, 0x2
 f0 06 24 09           ldi16	r2, 0x924
 f0 03 00              ldi8	r3, 0x0
 c1 03                 ldi8	r5, 0x3
 c0 1b                 ldi8	r4, 0x1b
 d7 20                 sys	draw_sprite_self_masked
 c6 44 0d              ldi16	r6, 0xd44
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+265
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
 e0 f5 06              jmp16	avm_test_main+2046
 f0 04 00 05           ldi16	r0, 0x500
 f1 20                 mov	r4, r0
 f1 29                 mov	r6, r1
 a5                    xor	r5, r5
 d7 11                 sys	memset
 c1 96                 ldi8	r5, 0x96
 f1 20                 mov	r4, r0
 d7 11                 sys	memset
 f0 06 24 09           ldi16	r2, 0x924
 f0 03 00              ldi8	r3, 0x0
 c1 13                 ldi8	r5, 0x13
 c4 fe ff              ldi16	r4, 0xfffe
 c2 01                 ldi8	r6, 0x1
 d7 20                 sys	draw_sprite_self_masked
 c6 44 11              ldi16	r6, 0x1144
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+352
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
 e0 9e 06              jmp16	avm_test_main+2046
 f1 20                 mov	r4, r0
 f1 29                 mov	r6, r1
 a5                    xor	r5, r5
 d7 11                 sys	memset
 c1 69                 ldi8	r5, 0x69
 f1 20                 mov	r4, r0
 d7 11                 sys	memset
 f0 06 24 09           ldi16	r2, 0x924
 f0 03 00              ldi8	r3, 0x0
 c1 11                 ldi8	r5, 0x11
 c0 7e                 ldi8	r4, 0x7e
 c2 02                 ldi8	r6, 0x2
 d7 20                 sys	draw_sprite_self_masked
 c6 44 15              ldi16	r6, 0x1544
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+434
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
 e0 4c 06              jmp16	avm_test_main+2046
 f1 20                 mov	r4, r0
 f1 29                 mov	r6, r1
 af                    xor	r7, r7
 07                    mov	r5, r7
 d7 11                 sys	memset
 c1 c3                 ldi8	r5, 0xc3
 f1 20                 mov	r4, r0
 d7 11                 sys	memset
 f0 06 24 09           ldi16	r2, 0x924
 f0 03 00              ldi8	r3, 0x0
 c5 fb ff              ldi16	r5, 0xfffb
 c0 28                 ldi8	r4, 0x28
 0b                    mov	r6, r7
 d7 20                 sys	draw_sprite_self_masked
 c6 44 19              ldi16	r6, 0x1944
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+517
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
 e0 f9 05              jmp16	avm_test_main+2046
 f0 06 00 05           ldi16	r2, 0x500
 f1 22                 mov	r4, r2
 f1 29                 mov	r6, r1
 f2 30                 sub	r0, r0
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 c1 5a                 ldi8	r5, 0x5a
 f1 22                 mov	r4, r2
 f1 02                 mov	r0, r2
 d7 11                 sys	memset
 f0 06 24 09           ldi16	r2, 0x924
 f0 03 00              ldi8	r3, 0x0
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 c1 3a                 ldi8	r5, 0x3a
 c0 46                 ldi8	r4, 0x46
 c2 01                 ldi8	r6, 0x1
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 d7 20                 sys	draw_sprite_self_masked
 c6 44 1d              ldi16	r6, 0x1d44
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+620
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
 e0 92 05              jmp16	avm_test_main+2046
 f0 04 00 05           ldi16	r0, 0x500
 f1 20                 mov	r4, r0
 a5                    xor	r5, r5
 f1 29                 mov	r6, r1
 d7 11                 sys	memset
 c6 01 01              ldi16	r6, 0x101
 f0 06 44 21           ldi16	r2, 0x2144
 f0 03 00              ldi8	r3, 0x0
 c1 3f                 ldi8	r5, 0x3f
 c0 7f                 ldi8	r4, 0x7f
 d7 20                 sys	draw_sprite_self_masked
 c6 48 22              ldi16	r6, 0x2248
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+701
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
 e0 41 05              jmp16	avm_test_main+2046
 f1 20                 mov	r4, r0
 f1 29                 mov	r6, r1
 af                    xor	r7, r7
 07                    mov	r5, r7
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 3c                 ldi8	r5, 0x3c
 d7 11                 sys	memset
 f0 06 48 26           ldi16	r2, 0x2648
 f0 03 00              ldi8	r3, 0x0
 c1 07                 ldi8	r5, 0x7
 c4 fc ff              ldi16	r4, 0xfffc
 0b                    mov	r6, r7
 d7 20                 sys	draw_sprite_self_masked
 c6 53 26              ldi16	r6, 0x2653
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+784
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
 e0 ee 04              jmp16	avm_test_main+2046
 f1 20                 mov	r4, r0
 f1 29                 mov	r6, r1
 af                    xor	r7, r7
 07                    mov	r5, r7
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 c3                 ldi8	r5, 0xc3
 d7 11                 sys	memset
 f0 06 48 26           ldi16	r2, 0x2648
 f0 03 00              ldi8	r3, 0x0
 c1 3b                 ldi8	r5, 0x3b
 c0 7d                 ldi8	r4, 0x7d
 0b                    mov	r6, r7
 d7 20                 sys	draw_sprite_self_masked
 c6 53 2a              ldi16	r6, 0x2a53
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+866
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
 e0 9c 04              jmp16	avm_test_main+2046
 f1 20                 mov	r4, r0
 f1 29                 mov	r6, r1
 af                    xor	r7, r7
 07                    mov	r5, r7
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 69                 ldi8	r5, 0x69
 d7 11                 sys	memset
 f0 06 53 2e           ldi16	r2, 0x2e53
 f0 03 00              ldi8	r3, 0x0
 c5 f7 ff              ldi16	r5, 0xfff7
 c0 14                 ldi8	r4, 0x14
 0b                    mov	r6, r7
 d7 20                 sys	draw_sprite_self_masked
 c6 6d 2e              ldi16	r6, 0x2e6d
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+949
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
 e0 49 04              jmp16	avm_test_main+2046
 f0 05 00 05           ldi16	r1, 0x500
 f1 21                 mov	r4, r1
 f0 04 00 04           ldi16	r0, 0x400
 f1 28                 mov	r6, r0
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 96                 ldi8	r5, 0x96
 d7 11                 sys	memset
 f0 06 53 2e           ldi16	r2, 0x2e53
 f0 03 00              ldi8	r3, 0x0
 c1 37                 ldi8	r5, 0x37
 c0 14                 ldi8	r4, 0x14
 c2 01                 ldi8	r6, 0x1
 d7 20                 sys	draw_sprite_self_masked
 c6 6d 32              ldi16	r6, 0x326d
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1039
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
 e0 ef 03              jmp16	avm_test_main+2046
 f1 21                 mov	r4, r1
 f1 28                 mov	r6, r0
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 5a                 ldi8	r5, 0x5a
 d7 11                 sys	memset
 f0 06 6d 36           ldi16	r2, 0x366d
 f0 03 00              ldi8	r3, 0x0
 c1 1f                 ldi8	r5, 0x1f
 c4 ff ff              ldi16	r4, 0xffff
 c2 01                 ldi8	r6, 0x1
 d7 20                 sys	draw_sprite_self_masked
 c6 77 38              ldi16	r6, 0x3877
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1122
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
 e0 9c 03              jmp16	avm_test_main+2046
 f1 21                 mov	r4, r1
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 07                    mov	r5, r7
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 a5                 ldi8	r5, 0xa5
 d7 11                 sys	memset
 f0 06 77 3c           ldi16	r2, 0x3c77
 f0 03 00              ldi8	r3, 0x0
 c0 3c                 ldi8	r4, 0x3c
 c5 ff ff              ldi16	r5, 0xffff
 0b                    mov	r6, r7
 d7 20                 sys	draw_sprite_self_masked
 c6 b8 3c              ldi16	r6, 0x3cb8
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1205
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
 e0 49 03              jmp16	avm_test_main+2046
 f1 21                 mov	r4, r1
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 07                    mov	r5, r7
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 3c                 ldi8	r5, 0x3c
 d7 11                 sys	memset
 f0 06 24 09           ldi16	r2, 0x924
 f0 03 00              ldi8	r3, 0x0
 c0 80                 ldi8	r4, 0x80
 c1 0a                 ldi8	r5, 0xa
 0b                    mov	r6, r7
 d7 20                 sys	draw_sprite_self_masked
 c6 b8 40              ldi16	r6, 0x40b8
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1287
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
 e0 f7 02              jmp16	avm_test_main+2046
 f1 21                 mov	r4, r1
 f1 28                 mov	r6, r0
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 c3                 ldi8	r5, 0xc3
 d7 11                 sys	memset
 f0 06 24 09           ldi16	r2, 0x924
 f0 03 00              ldi8	r3, 0x0
 c4 fb ff              ldi16	r4, 0xfffb
 c1 0a                 ldi8	r5, 0xa
 c2 01                 ldi8	r6, 0x1
 d7 20                 sys	draw_sprite_self_masked
 c6 b8 44              ldi16	r6, 0x44b8
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1370
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
 e0 a4 02              jmp16	avm_test_main+2046
 f1 21                 mov	r4, r1
 f1 28                 mov	r6, r0
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 69                 ldi8	r5, 0x69
 d7 11                 sys	memset
 f0 06 24 09           ldi16	r2, 0x924
 f0 03 00              ldi8	r3, 0x0
 c5 f3 ff              ldi16	r5, 0xfff3
 c0 0a                 ldi8	r4, 0xa
 c2 02                 ldi8	r6, 0x2
 d7 20                 sys	draw_sprite_self_masked
 c6 b8 48              ldi16	r6, 0x48b8
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+1455
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
 e0 4f 02              jmp16	avm_test_main+2046
 f1 21                 mov	r4, r1
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 07                    mov	r5, r7
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 96                 ldi8	r5, 0x96
 d7 11                 sys	memset
 f0 06 24 09           ldi16	r2, 0x924
 f0 03 00              ldi8	r3, 0x0
 c1 40                 ldi8	r5, 0x40
 c0 0a                 ldi8	r4, 0xa
 0b                    mov	r6, r7
 d7 20                 sys	draw_sprite_self_masked
 c6 b8 4c              ldi16	r6, 0x4cb8
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1537
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
 e0 fd 01              jmp16	avm_test_main+2046
 f1 21                 mov	r4, r1
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 07                    mov	r5, r7
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 5a                 ldi8	r5, 0x5a
 d7 11                 sys	memset
 c2 7b                 ldi8	r6, 0x7b
 f0 06 b8 50           ldi16	r2, 0x50b8
 f0 03 00              ldi8	r3, 0x0
 03                    mov	r4, r7
 07                    mov	r5, r7
 d7 20                 sys	draw_sprite_self_masked
 c6 ba 50              ldi16	r6, 0x50ba
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+1620
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
 e0 aa 01              jmp16	avm_test_main+2046
 f1 21                 mov	r4, r1
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 07                    mov	r5, r7
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 a5                 ldi8	r5, 0xa5
 d7 11                 sys	memset
 c6 c8 01              ldi16	r6, 0x1c8
 f0 06 ba 54           ldi16	r2, 0x54ba
 f0 03 00              ldi8	r3, 0x0
 03                    mov	r4, r7
 07                    mov	r5, r7
 d7 20                 sys	draw_sprite_self_masked
 c6 bc 54              ldi16	r6, 0x54bc
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+1704
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
 e0 56 01              jmp16	avm_test_main+2046
 f1 21                 mov	r4, r1
 af                    xor	r7, r7
 07                    mov	r5, r7
 f1 28                 mov	r6, r0
 d7 11                 sys	memset
 f0 06 6d 36           ldi16	r2, 0x366d
 f0 03 00              ldi8	r3, 0x0
 c1 18                 ldi8	r5, 0x18
 c4 7f ff              ldi16	r4, 0xff7f
 0b                    mov	r6, r7
 d7 20                 sys	draw_sprite_self_masked
 c6 bc 64              ldi16	r6, 0x64bc
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+1783
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
 e0 07 01              jmp16	avm_test_main+2046
 f1 21                 mov	r4, r1
 af                    xor	r7, r7
 07                    mov	r5, r7
 f1 28                 mov	r6, r0
 d7 11                 sys	memset
 f0 06 77 3c           ldi16	r2, 0x3c77
 f0 03 00              ldi8	r3, 0x0
 c5 c0 ff              ldi16	r5, 0xffc0
 c0 49                 ldi8	r4, 0x49
 0b                    mov	r6, r7
 d7 20                 sys	draw_sprite_self_masked
 c6 bc 68              ldi16	r6, 0x68bc
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+1862
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
 e0 b8 00              jmp16	avm_test_main+2046
 f1 21                 mov	r4, r1
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 07                    mov	r5, r7
 d7 11                 sys	memset
 c1 55                 ldi8	r5, 0x55
 f1 21                 mov	r4, r1
 d7 11                 sys	memset
 f0 06 77 3c           ldi16	r2, 0x3c77
 f0 03 00              ldi8	r3, 0x0
 c0 49                 ldi8	r4, 0x49
 c1 3f                 ldi8	r5, 0x3f
 0b                    mov	r6, r7
 d7 20                 sys	draw_sprite_self_masked
 c6 bc 58              ldi16	r6, 0x58bc
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 26                 breq8	avm_test_main+1945
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
 d4 65                 jmp8	avm_test_main+2046
 f1 21                 mov	r4, r1
 f1 28                 mov	r6, r0
 f2 30                 sub	r0, r0
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 c1 aa                 ldi8	r5, 0xaa
 f1 21                 mov	r4, r1
 d7 11                 sys	memset
 f0 06 6d 36           ldi16	r2, 0x366d
 f0 03 00              ldi8	r3, 0x0
 c1 04                 ldi8	r5, 0x4
 f1 20                 mov	r4, r0
 f1 28                 mov	r6, r0
 d7 20                 sys	draw_sprite_self_masked
 c6 bc 5c              ldi16	r6, 0x5cbc
 c3 00                 ldi8	r7, 0x0
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f1 77                 zext8	r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 29                 breq8	avm_test_main+2051
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
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
