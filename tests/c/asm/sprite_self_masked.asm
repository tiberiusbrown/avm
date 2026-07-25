
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/sprite_self_masked.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sprite_self_masked.c
0000092e l     O .rodata	00000020 sprite_5x13
000060c6 l     O .rodata	00000400 expected_00
0000094e l     O .rodata	00000400 expected_01
00000d4e l     O .rodata	00000400 expected_02
0000114e l     O .rodata	00000400 expected_03
0000154e l     O .rodata	00000400 expected_04
0000194e l     O .rodata	00000400 expected_05
00001d4e l     O .rodata	00000400 expected_06
0000214e l     O .rodata	00000104 sprite_1x1_many_frames
00002252 l     O .rodata	00000400 expected_07
00002652 l     O .rodata	0000000b sprite_9x8
0000265d l     O .rodata	00000400 expected_08
00002a5d l     O .rodata	00000400 expected_09
00002e5d l     O .rodata	0000001a sprite_4x17
00002e77 l     O .rodata	00000400 expected_10
00003277 l     O .rodata	00000400 expected_11
00003677 l     O .rodata	0000020a sprite_130x9
00003881 l     O .rodata	00000400 expected_12
00003c81 l     O .rodata	00000041 sprite_7x65
00003cc2 l     O .rodata	00000400 expected_13
000040c2 l     O .rodata	00000400 expected_14
000044c2 l     O .rodata	00000400 expected_15
000048c2 l     O .rodata	00000400 expected_16
00004cc2 l     O .rodata	00000400 expected_17
000050c2 l     O .rodata	00000002 sprite_zero_width
000050c4 l     O .rodata	00000400 expected_18
000054c4 l     O .rodata	00000002 sprite_zero_height
000054c6 l     O .rodata	00000400 expected_19
000064c6 l     O .rodata	00000400 expected_20
000068c6 l     O .rodata	00000400 expected_21
000058c6 l     O .rodata	00000400 expected_22
00005cc6 l     O .rodata	00000400 expected_23
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000016 _start
00000116 g     F .text	00000816 avm_test_main
0000092c g     F .text	00000002 avm_halt
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
 e1 16 08              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f0 04 00 04           ldi16	r0, 0x400
 af                    xor	r7, r7
 f0 05 00 05           ldi16	r1, 0x500
 f1 21                 mov	r4, r1
 07                    mov	r5, r7
 f1 28                 mov	r6, r0
 d7 11                 sys	memset
 f0 06 2e 09           ldi16	r2, 0x92e
 f0 03 00              ldi8	r3, 0x0
 c1 08                 ldi8	r5, 0x8
 c0 0a                 ldi8	r4, 0xa
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 0b                    mov	r6, r7
 d7 20                 sys	draw_sprite_self_masked
 c6 c6 60              ldi16	r6, 0x60c6
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 23                 breq8	avm_test_main+94
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
 e0 aa 07              jmp16	avm_test_main+2056
 c4 00 05              ldi16	r4, 0x500
 f1 0c                 mov	r1, r4
 f1 28                 mov	r6, r0
 a5                    xor	r5, r5
 d7 11                 sys	memset
 c1 a5                 ldi8	r5, 0xa5
 f1 21                 mov	r4, r1
 d7 11                 sys	memset
 c2 01                 ldi8	r6, 0x1
 c0 0a                 ldi8	r4, 0xa
 c1 08                 ldi8	r5, 0x8
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 d7 20                 sys	draw_sprite_self_masked
 c6 4e 09              ldi16	r6, 0x94e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+178
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
 e0 56 07              jmp16	avm_test_main+2056
 c4 00 05              ldi16	r4, 0x500
 0c                    mov	r7, r4
 f1 28                 mov	r6, r0
 f2 39                 sub	r1, r1
 f1 25                 mov	r5, r1
 d7 11                 sys	memset
 c1 3c                 ldi8	r5, 0x3c
 03                    mov	r4, r7
 f1 0f                 mov	r1, r7
 d7 11                 sys	memset
 c2 02                 ldi8	r6, 0x2
 c1 03                 ldi8	r5, 0x3
 c0 1b                 ldi8	r4, 0x1b
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 d7 20                 sys	draw_sprite_self_masked
 c6 4e 0d              ldi16	r6, 0xd4e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
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
 e0 ff 06              jmp16	avm_test_main+2056
 f0 05 00 05           ldi16	r1, 0x500
 f1 21                 mov	r4, r1
 f1 28                 mov	r6, r0
 a5                    xor	r5, r5
 d7 11                 sys	memset
 c1 96                 ldi8	r5, 0x96
 f1 21                 mov	r4, r1
 d7 11                 sys	memset
 c1 13                 ldi8	r5, 0x13
 c4 fe ff              ldi16	r4, 0xfffe
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 c2 01                 ldi8	r6, 0x1
 d7 20                 sys	draw_sprite_self_masked
 c6 4e 11              ldi16	r6, 0x114e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
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
 e0 a9 06              jmp16	avm_test_main+2056
 f1 21                 mov	r4, r1
 f1 28                 mov	r6, r0
 a5                    xor	r5, r5
 d7 11                 sys	memset
 c1 69                 ldi8	r5, 0x69
 f1 21                 mov	r4, r1
 d7 11                 sys	memset
 c1 11                 ldi8	r5, 0x11
 c0 7e                 ldi8	r4, 0x7e
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 c2 02                 ldi8	r6, 0x2
 d7 20                 sys	draw_sprite_self_masked
 c6 4e 15              ldi16	r6, 0x154e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
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
 e0 58 06              jmp16	avm_test_main+2056
 f1 21                 mov	r4, r1
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 07                    mov	r5, r7
 d7 11                 sys	memset
 c1 c3                 ldi8	r5, 0xc3
 f1 21                 mov	r4, r1
 d7 11                 sys	memset
 c5 fb ff              ldi16	r5, 0xfffb
 c0 28                 ldi8	r4, 0x28
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 0b                    mov	r6, r7
 d7 20                 sys	draw_sprite_self_masked
 c6 4e 19              ldi16	r6, 0x194e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
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
 e0 06 06              jmp16	avm_test_main+2056
 c4 00 05              ldi16	r4, 0x500
 0c                    mov	r7, r4
 f1 28                 mov	r6, r0
 f2 39                 sub	r1, r1
 f1 25                 mov	r5, r1
 d7 11                 sys	memset
 c1 5a                 ldi8	r5, 0x5a
 03                    mov	r4, r7
 f1 0f                 mov	r1, r7
 d7 11                 sys	memset
 c1 3a                 ldi8	r5, 0x3a
 c0 46                 ldi8	r4, 0x46
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 c2 01                 ldi8	r6, 0x1
 d7 20                 sys	draw_sprite_self_masked
 c6 4e 1d              ldi16	r6, 0x1d4e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+601
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
 e0 af 05              jmp16	avm_test_main+2056
 f0 05 00 05           ldi16	r1, 0x500
 f1 21                 mov	r4, r1
 a5                    xor	r5, r5
 f1 28                 mov	r6, r0
 d7 11                 sys	memset
 c6 01 01              ldi16	r6, 0x101
 f0 06 4e 21           ldi16	r2, 0x214e
 f0 03 00              ldi8	r3, 0x0
 c1 3f                 ldi8	r5, 0x3f
 c0 7f                 ldi8	r4, 0x7f
 d7 20                 sys	draw_sprite_self_masked
 c6 52 22              ldi16	r6, 0x2252
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+682
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
 e0 5e 05              jmp16	avm_test_main+2056
 f1 21                 mov	r4, r1
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 07                    mov	r5, r7
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 3c                 ldi8	r5, 0x3c
 d7 11                 sys	memset
 f0 06 52 26           ldi16	r2, 0x2652
 f0 03 00              ldi8	r3, 0x0
 c1 07                 ldi8	r5, 0x7
 c4 fc ff              ldi16	r4, 0xfffc
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 0b                    mov	r6, r7
 d7 20                 sys	draw_sprite_self_masked
 c6 5d 26              ldi16	r6, 0x265d
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+771
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
 e0 05 05              jmp16	avm_test_main+2056
 f1 21                 mov	r4, r1
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 07                    mov	r5, r7
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 c3                 ldi8	r5, 0xc3
 d7 11                 sys	memset
 c1 3b                 ldi8	r5, 0x3b
 c0 7d                 ldi8	r4, 0x7d
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 0b                    mov	r6, r7
 d7 20                 sys	draw_sprite_self_masked
 c6 5d 2a              ldi16	r6, 0x2a5d
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+852
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
 e0 b4 04              jmp16	avm_test_main+2056
 c4 00 05              ldi16	r4, 0x500
 f1 0c                 mov	r1, r4
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 07                    mov	r5, r7
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 69                 ldi8	r5, 0x69
 d7 11                 sys	memset
 f0 06 5d 2e           ldi16	r2, 0x2e5d
 f0 03 00              ldi8	r3, 0x0
 c5 f7 ff              ldi16	r5, 0xfff7
 c0 14                 ldi8	r4, 0x14
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 0b                    mov	r6, r7
 d7 20                 sys	draw_sprite_self_masked
 c6 77 2e              ldi16	r6, 0x2e77
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+944
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
 e0 58 04              jmp16	avm_test_main+2056
 f0 05 00 05           ldi16	r1, 0x500
 f1 21                 mov	r4, r1
 f1 28                 mov	r6, r0
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 96                 ldi8	r5, 0x96
 d7 11                 sys	memset
 c1 37                 ldi8	r5, 0x37
 c0 14                 ldi8	r4, 0x14
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 c2 01                 ldi8	r6, 0x1
 d7 20                 sys	draw_sprite_self_masked
 c6 77 32              ldi16	r6, 0x3277
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1029
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
 e0 03 04              jmp16	avm_test_main+2056
 f0 04 00 05           ldi16	r0, 0x500
 f1 20                 mov	r4, r0
 f0 05 00 04           ldi16	r1, 0x400
 f1 29                 mov	r6, r1
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 5a                 ldi8	r5, 0x5a
 d7 11                 sys	memset
 f0 06 77 36           ldi16	r2, 0x3677
 f0 03 00              ldi8	r3, 0x0
 c1 1f                 ldi8	r5, 0x1f
 c4 ff ff              ldi16	r4, 0xffff
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 c2 01                 ldi8	r6, 0x1
 d7 20                 sys	draw_sprite_self_masked
 c6 81 38              ldi16	r6, 0x3881
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1126
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
 e0 a2 03              jmp16	avm_test_main+2056
 f1 20                 mov	r4, r0
 f1 29                 mov	r6, r1
 af                    xor	r7, r7
 07                    mov	r5, r7
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 a5                 ldi8	r5, 0xa5
 d7 11                 sys	memset
 f0 06 81 3c           ldi16	r2, 0x3c81
 f0 03 00              ldi8	r3, 0x0
 c0 3c                 ldi8	r4, 0x3c
 c5 ff ff              ldi16	r5, 0xffff
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 0b                    mov	r6, r7
 d7 20                 sys	draw_sprite_self_masked
 c6 c2 3c              ldi16	r6, 0x3cc2
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1215
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
 e0 49 03              jmp16	avm_test_main+2056
 f0 05 00 05           ldi16	r1, 0x500
 f1 21                 mov	r4, r1
 f0 04 00 04           ldi16	r0, 0x400
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 07                    mov	r5, r7
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 3c                 ldi8	r5, 0x3c
 d7 11                 sys	memset
 c0 80                 ldi8	r4, 0x80
 c1 0a                 ldi8	r5, 0xa
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 0b                    mov	r6, r7
 d7 20                 sys	draw_sprite_self_masked
 c6 c2 40              ldi16	r6, 0x40c2
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1304
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
 e0 f0 02              jmp16	avm_test_main+2056
 f1 21                 mov	r4, r1
 f1 28                 mov	r6, r0
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 c3                 ldi8	r5, 0xc3
 d7 11                 sys	memset
 c4 fb ff              ldi16	r4, 0xfffb
 c1 0a                 ldi8	r5, 0xa
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 c2 01                 ldi8	r6, 0x1
 d7 20                 sys	draw_sprite_self_masked
 c6 c2 44              ldi16	r6, 0x44c2
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1386
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
 e0 9e 02              jmp16	avm_test_main+2056
 f1 21                 mov	r4, r1
 f1 28                 mov	r6, r0
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 69                 ldi8	r5, 0x69
 d7 11                 sys	memset
 c5 f3 ff              ldi16	r5, 0xfff3
 c0 0a                 ldi8	r4, 0xa
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 c2 02                 ldi8	r6, 0x2
 d7 20                 sys	draw_sprite_self_masked
 c6 c2 48              ldi16	r6, 0x48c2
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
 e0 4a 02              jmp16	avm_test_main+2056
 f1 21                 mov	r4, r1
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 07                    mov	r5, r7
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 96                 ldi8	r5, 0x96
 d7 11                 sys	memset
 c1 40                 ldi8	r5, 0x40
 c0 0a                 ldi8	r4, 0xa
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 0b                    mov	r6, r7
 d7 20                 sys	draw_sprite_self_masked
 c6 c2 4c              ldi16	r6, 0x4cc2
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1551
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
 e0 f9 01              jmp16	avm_test_main+2056
 f1 21                 mov	r4, r1
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 07                    mov	r5, r7
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 5a                 ldi8	r5, 0x5a
 d7 11                 sys	memset
 c2 7b                 ldi8	r6, 0x7b
 f0 06 c2 50           ldi16	r2, 0x50c2
 f0 03 00              ldi8	r3, 0x0
 03                    mov	r4, r7
 07                    mov	r5, r7
 d7 20                 sys	draw_sprite_self_masked
 c6 c4 50              ldi16	r6, 0x50c4
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+1634
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
 e0 a6 01              jmp16	avm_test_main+2056
 f1 21                 mov	r4, r1
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 07                    mov	r5, r7
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 a5                 ldi8	r5, 0xa5
 d7 11                 sys	memset
 c6 c8 01              ldi16	r6, 0x1c8
 f0 06 c4 54           ldi16	r2, 0x54c4
 f0 03 00              ldi8	r3, 0x0
 03                    mov	r4, r7
 07                    mov	r5, r7
 d7 20                 sys	draw_sprite_self_masked
 c6 c6 54              ldi16	r6, 0x54c6
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+1718
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
 e0 52 01              jmp16	avm_test_main+2056
 f1 21                 mov	r4, r1
 af                    xor	r7, r7
 07                    mov	r5, r7
 f1 28                 mov	r6, r0
 d7 11                 sys	memset
 c1 18                 ldi8	r5, 0x18
 c4 7f ff              ldi16	r4, 0xff7f
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 0b                    mov	r6, r7
 d7 20                 sys	draw_sprite_self_masked
 c6 c6 64              ldi16	r6, 0x64c6
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+1796
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
 e0 04 01              jmp16	avm_test_main+2056
 f0 04 00 05           ldi16	r0, 0x500
 f1 20                 mov	r4, r0
 af                    xor	r7, r7
 07                    mov	r5, r7
 f0 05 00 04           ldi16	r1, 0x400
 f1 29                 mov	r6, r1
 d7 11                 sys	memset
 c5 c0 ff              ldi16	r5, 0xffc0
 c0 49                 ldi8	r4, 0x49
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 0b                    mov	r6, r7
 d7 20                 sys	draw_sprite_self_masked
 c6 c6 68              ldi16	r6, 0x68c6
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+1882
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
 e0 ae 00              jmp16	avm_test_main+2056
 c4 00 05              ldi16	r4, 0x500
 f1 04                 mov	r0, r4
 f1 29                 mov	r6, r1
 af                    xor	r7, r7
 07                    mov	r5, r7
 d7 11                 sys	memset
 c1 55                 ldi8	r5, 0x55
 f1 20                 mov	r4, r0
 d7 11                 sys	memset
 c0 49                 ldi8	r4, 0x49
 c1 3f                 ldi8	r5, 0x3f
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 0b                    mov	r6, r7
 d7 20                 sys	draw_sprite_self_masked
 c6 c6 58              ldi16	r6, 0x58c6
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 26                 breq8	avm_test_main+1967
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
 d4 59                 jmp8	avm_test_main+2056
 c4 00 05              ldi16	r4, 0x500
 0c                    mov	r7, r4
 f1 29                 mov	r6, r1
 f2 30                 sub	r0, r0
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 c1 aa                 ldi8	r5, 0xaa
 03                    mov	r4, r7
 d7 11                 sys	memset
 c1 04                 ldi8	r5, 0x4
 f4 61                 stsp16	[sp+0x8], r5
 f1 20                 mov	r4, r0
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f1 28                 mov	r6, r0
 f4 21                 ldsp16	r5, [sp+0x8]
 d7 20                 sys	draw_sprite_self_masked
 c6 c6 5c              ldi16	r6, 0x5cc6
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 00 05              ldi16	r4, 0x500
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 29                 breq8	avm_test_main+2061
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
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
