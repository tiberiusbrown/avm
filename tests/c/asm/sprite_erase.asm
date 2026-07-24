
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/sprite_erase.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sprite_erase.c
00000927 l     O .rodata	00000020 sprite_5x13
00000947 l     O .rodata	00000400 expected_00
00000d47 l     O .rodata	00000400 expected_01
00001147 l     O .rodata	00000400 expected_02
00001547 l     O .rodata	00000400 expected_03
00001947 l     O .rodata	00000400 expected_04
00001d47 l     O .rodata	00000400 expected_05
00002147 l     O .rodata	00000400 expected_06
00002547 l     O .rodata	00000104 sprite_1x1_many_frames
0000264b l     O .rodata	00000400 expected_07
00002a4b l     O .rodata	0000000b sprite_9x8
00002a56 l     O .rodata	00000400 expected_08
00002e56 l     O .rodata	00000400 expected_09
00003256 l     O .rodata	0000001a sprite_4x17
00003270 l     O .rodata	00000400 expected_10
00003670 l     O .rodata	00000400 expected_11
00003a70 l     O .rodata	0000020a sprite_130x9
00003c7a l     O .rodata	00000400 expected_12
0000407a l     O .rodata	00000041 sprite_7x65
000040bb l     O .rodata	00000400 expected_13
000044bb l     O .rodata	00000400 expected_14
000048bb l     O .rodata	00000400 expected_15
00004cbb l     O .rodata	00000400 expected_16
000050bb l     O .rodata	00000400 expected_17
000054bb l     O .rodata	00000002 sprite_zero_width
000054bd l     O .rodata	00000400 expected_18
000058bd l     O .rodata	00000002 sprite_zero_height
000058bf l     O .rodata	00000400 expected_19
00005cbf l     O .rodata	00000400 expected_20
000060bf l     O .rodata	00000400 expected_21
000064bf l     O .rodata	00000400 expected_22
000068bf l     O .rodata	00000400 expected_23
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000016 _start
00000116 g     F .text	0000080f avm_test_main
00000925 g     F .text	00000002 avm_halt
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
 e1 0f 08              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	avm_test_main+4
 f0 05 00 04           ldi16	r1, 0x400
 f2 30                 sub	r0, r0
 f0 06 00 05           ldi16	r2, 0x500
 f1 22                 mov	r4, r2
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 c1 ff                 ldi8	r5, 0xff
 f1 22                 mov	r4, r2
 d7 11                 sys	memset
 c6 27 09              ldi16	r6, 0x927
 c3 00                 ldi8	r7, 0x0
 c1 08                 ldi8	r5, 0x8
 f0 03 0a              ldi8	r3, 0xa
 f1 23                 mov	r4, r3
 d7 21                 sys	draw_sprite_erase
 c6 47 09              ldi16	r6, 0x947
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 23                 breq8	avm_test_main+96
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
 f1 23                 mov	r4, r3
 e0 a1 07              jmp16	avm_test_main+2049
 f1 22                 mov	r4, r2
 f1 29                 mov	r6, r1
 a5                    xor	r5, r5
 d7 11                 sys	memset
 c1 a5                 ldi8	r5, 0xa5
 f1 22                 mov	r4, r2
 d7 11                 sys	memset
 f0 00 01              ldi8	r0, 0x1
 c6 27 09              ldi16	r6, 0x927
 c3 00                 ldi8	r7, 0x0
 f1 23                 mov	r4, r3
 c1 08                 ldi8	r5, 0x8
 d7 21                 sys	draw_sprite_erase
 c6 47 0d              ldi16	r6, 0xd47
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+177
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
 e0 50 07              jmp16	avm_test_main+2049
 f0 07 00 05           ldi16	r3, 0x500
 f1 23                 mov	r4, r3
 f1 29                 mov	r6, r1
 f2 42                 sub	r2, r2
 f1 26                 mov	r5, r2
 d7 11                 sys	memset
 f0 02 3c              ldi8	r2, 0x3c
 f1 23                 mov	r4, r3
 f1 26                 mov	r5, r2
 d7 11                 sys	memset
 f0 00 02              ldi8	r0, 0x2
 c6 27 09              ldi16	r6, 0x927
 c3 00                 ldi8	r7, 0x0
 c1 03                 ldi8	r5, 0x3
 c0 1b                 ldi8	r4, 0x1b
 d7 21                 sys	draw_sprite_erase
 c6 47 11              ldi16	r6, 0x1147
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 23                 mov	r4, r3
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+268
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
 e0 f5 06              jmp16	avm_test_main+2049
 f1 23                 mov	r4, r3
 f1 29                 mov	r6, r1
 a5                    xor	r5, r5
 d7 11                 sys	memset
 c1 96                 ldi8	r5, 0x96
 f1 23                 mov	r4, r3
 d7 11                 sys	memset
 c6 27 09              ldi16	r6, 0x927
 c3 00                 ldi8	r7, 0x0
 c1 13                 ldi8	r5, 0x13
 c4 fe ff              ldi16	r4, 0xfffe
 f0 00 01              ldi8	r0, 0x1
 d7 21                 sys	draw_sprite_erase
 c6 47 15              ldi16	r6, 0x1547
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 23                 mov	r4, r3
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+350
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
 e0 a3 06              jmp16	avm_test_main+2049
 f1 23                 mov	r4, r3
 f1 29                 mov	r6, r1
 a5                    xor	r5, r5
 d7 11                 sys	memset
 c1 69                 ldi8	r5, 0x69
 f1 23                 mov	r4, r3
 d7 11                 sys	memset
 c6 27 09              ldi16	r6, 0x927
 c3 00                 ldi8	r7, 0x0
 c1 11                 ldi8	r5, 0x11
 c0 7e                 ldi8	r4, 0x7e
 f0 00 02              ldi8	r0, 0x2
 d7 21                 sys	draw_sprite_erase
 c6 47 19              ldi16	r6, 0x1947
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 23                 mov	r4, r3
 f1 25                 mov	r5, r1
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
 e0 52 06              jmp16	avm_test_main+2049
 f1 23                 mov	r4, r3
 f1 29                 mov	r6, r1
 f2 30                 sub	r0, r0
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 c1 c3                 ldi8	r5, 0xc3
 f1 23                 mov	r4, r3
 d7 11                 sys	memset
 c6 27 09              ldi16	r6, 0x927
 c3 00                 ldi8	r7, 0x0
 c5 fb ff              ldi16	r5, 0xfffb
 c0 28                 ldi8	r4, 0x28
 d7 21                 sys	draw_sprite_erase
 c6 47 1d              ldi16	r6, 0x1d47
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 23                 mov	r4, r3
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+513
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
 e0 00 06              jmp16	avm_test_main+2049
 f1 23                 mov	r4, r3
 f1 29                 mov	r6, r1
 a5                    xor	r5, r5
 d7 11                 sys	memset
 c1 5a                 ldi8	r5, 0x5a
 f1 23                 mov	r4, r3
 d7 11                 sys	memset
 c6 27 09              ldi16	r6, 0x927
 c3 00                 ldi8	r7, 0x0
 c1 3a                 ldi8	r5, 0x3a
 c0 46                 ldi8	r4, 0x46
 f0 00 01              ldi8	r0, 0x1
 d7 21                 sys	draw_sprite_erase
 c6 47 21              ldi16	r6, 0x2147
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 23                 mov	r4, r3
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+594
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
 e0 af 05              jmp16	avm_test_main+2049
 f0 05 00 05           ldi16	r1, 0x500
 f1 21                 mov	r4, r1
 f0 04 00 04           ldi16	r0, 0x400
 f1 18                 mov	r3, r0
 f1 2b                 mov	r6, r3
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 ff                 ldi8	r5, 0xff
 d7 11                 sys	memset
 f0 04 01 01           ldi16	r0, 0x101
 f0 38 00              stsp16	[sp+0x0], r0
 c6 47 25              ldi16	r6, 0x2547
 c3 00                 ldi8	r7, 0x0
 c1 3f                 ldi8	r5, 0x3f
 c0 7f                 ldi8	r4, 0x7f
 f0 30 00              ldsp16	r0, [sp+0x0]
 d7 21                 sys	draw_sprite_erase
 c6 4b 26              ldi16	r6, 0x264b
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 21                 mov	r4, r1
 f1 27                 mov	r5, r3
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
 e0 4d 05              jmp16	avm_test_main+2049
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
 c6 4b 2a              ldi16	r6, 0x2a4b
 c3 00                 ldi8	r7, 0x0
 c1 07                 ldi8	r5, 0x7
 c4 fc ff              ldi16	r4, 0xfffc
 d7 21                 sys	draw_sprite_erase
 c6 56 2a              ldi16	r6, 0x2a56
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 23                 mov	r4, r3
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+782
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
 e0 f3 04              jmp16	avm_test_main+2049
 f1 23                 mov	r4, r3
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 f1 23                 mov	r4, r3
 c1 c3                 ldi8	r5, 0xc3
 d7 11                 sys	memset
 c6 4b 2a              ldi16	r6, 0x2a4b
 c3 00                 ldi8	r7, 0x0
 c1 3b                 ldi8	r5, 0x3b
 c0 7d                 ldi8	r4, 0x7d
 d7 21                 sys	draw_sprite_erase
 c6 56 2e              ldi16	r6, 0x2e56
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 23                 mov	r4, r3
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+861
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
 e0 a4 04              jmp16	avm_test_main+2049
 f1 23                 mov	r4, r3
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 f1 23                 mov	r4, r3
 c1 69                 ldi8	r5, 0x69
 d7 11                 sys	memset
 c6 56 32              ldi16	r6, 0x3256
 c3 00                 ldi8	r7, 0x0
 c5 f7 ff              ldi16	r5, 0xfff7
 c0 14                 ldi8	r4, 0x14
 d7 21                 sys	draw_sprite_erase
 c6 70 32              ldi16	r6, 0x3270
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 23                 mov	r4, r3
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+941
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
 e0 54 04              jmp16	avm_test_main+2049
 f0 06 00 05           ldi16	r2, 0x500
 f1 22                 mov	r4, r2
 f1 29                 mov	r6, r1
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 c1 96                 ldi8	r5, 0x96
 d7 11                 sys	memset
 c6 56 32              ldi16	r6, 0x3256
 c3 00                 ldi8	r7, 0x0
 c1 37                 ldi8	r5, 0x37
 c0 14                 ldi8	r4, 0x14
 f0 00 01              ldi8	r0, 0x1
 d7 21                 sys	draw_sprite_erase
 c6 70 36              ldi16	r6, 0x3670
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1026
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
 e0 ff 03              jmp16	avm_test_main+2049
 f1 22                 mov	r4, r2
 f1 29                 mov	r6, r1
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 c1 5a                 ldi8	r5, 0x5a
 d7 11                 sys	memset
 c6 70 3a              ldi16	r6, 0x3a70
 c3 00                 ldi8	r7, 0x0
 c1 1f                 ldi8	r5, 0x1f
 f0 07 ff ff           ldi16	r3, 0xffff
 f1 23                 mov	r4, r3
 d7 21                 sys	draw_sprite_erase
 c6 7a 3c              ldi16	r6, 0x3c7a
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1108
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
 e0 ad 03              jmp16	avm_test_main+2049
 f1 22                 mov	r4, r2
 f1 29                 mov	r6, r1
 f2 30                 sub	r0, r0
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 c1 a5                 ldi8	r5, 0xa5
 d7 11                 sys	memset
 c6 7a 40              ldi16	r6, 0x407a
 c3 00                 ldi8	r7, 0x0
 c0 3c                 ldi8	r4, 0x3c
 f1 27                 mov	r5, r3
 d7 21                 sys	draw_sprite_erase
 c6 bb 40              ldi16	r6, 0x40bb
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1189
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
 e0 5c 03              jmp16	avm_test_main+2049
 f1 22                 mov	r4, r2
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 c1 3c                 ldi8	r5, 0x3c
 d7 11                 sys	memset
 c6 27 09              ldi16	r6, 0x927
 c3 00                 ldi8	r7, 0x0
 c0 80                 ldi8	r4, 0x80
 c1 0a                 ldi8	r5, 0xa
 d7 21                 sys	draw_sprite_erase
 c6 bb 44              ldi16	r6, 0x44bb
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1268
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
 e0 0d 03              jmp16	avm_test_main+2049
 f1 22                 mov	r4, r2
 f1 29                 mov	r6, r1
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 c1 c3                 ldi8	r5, 0xc3
 d7 11                 sys	memset
 c6 27 09              ldi16	r6, 0x927
 c3 00                 ldi8	r7, 0x0
 c4 fb ff              ldi16	r4, 0xfffb
 c1 0a                 ldi8	r5, 0xa
 f0 00 01              ldi8	r0, 0x1
 d7 21                 sys	draw_sprite_erase
 c6 bb 48              ldi16	r6, 0x48bb
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1350
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
 e0 bb 02              jmp16	avm_test_main+2049
 f1 22                 mov	r4, r2
 f1 29                 mov	r6, r1
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 c1 69                 ldi8	r5, 0x69
 d7 11                 sys	memset
 c6 27 09              ldi16	r6, 0x927
 c3 00                 ldi8	r7, 0x0
 c5 f3 ff              ldi16	r5, 0xfff3
 c0 0a                 ldi8	r4, 0xa
 f0 00 02              ldi8	r0, 0x2
 d7 21                 sys	draw_sprite_erase
 c6 bb 4c              ldi16	r6, 0x4cbb
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+1434
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
 e0 67 02              jmp16	avm_test_main+2049
 f1 22                 mov	r4, r2
 f1 29                 mov	r6, r1
 f2 30                 sub	r0, r0
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 c1 96                 ldi8	r5, 0x96
 d7 11                 sys	memset
 c6 27 09              ldi16	r6, 0x927
 c3 00                 ldi8	r7, 0x0
 c1 40                 ldi8	r5, 0x40
 c0 0a                 ldi8	r4, 0xa
 d7 21                 sys	draw_sprite_erase
 c6 bb 50              ldi16	r6, 0x50bb
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 25                 breq8	avm_test_main+1515
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
 e0 16 02              jmp16	avm_test_main+2049
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
 c6 bb 54              ldi16	r6, 0x54bb
 c3 00                 ldi8	r7, 0x0
 f1 21                 mov	r4, r1
 f1 25                 mov	r5, r1
 f0 30 00              ldsp16	r0, [sp+0x0]
 d7 21                 sys	draw_sprite_erase
 c6 bd 54              ldi16	r6, 0x54bd
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+1613
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
 e0 b4 01              jmp16	avm_test_main+2049
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
 c6 bd 58              ldi16	r6, 0x58bd
 c3 00                 ldi8	r7, 0x0
 f1 21                 mov	r4, r1
 f1 25                 mov	r5, r1
 f0 30 00              ldsp16	r0, [sp+0x0]
 d7 21                 sys	draw_sprite_erase
 c6 bf 58              ldi16	r6, 0x58bf
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+1710
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
 e0 53 01              jmp16	avm_test_main+2049
 f1 22                 mov	r4, r2
 f0 05 00 04           ldi16	r1, 0x400
 f1 29                 mov	r6, r1
 f2 30                 sub	r0, r0
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 c1 ff                 ldi8	r5, 0xff
 d7 11                 sys	memset
 c6 70 3a              ldi16	r6, 0x3a70
 c3 00                 ldi8	r7, 0x0
 c1 18                 ldi8	r5, 0x18
 c4 7f ff              ldi16	r4, 0xff7f
 d7 21                 sys	draw_sprite_erase
 c6 bf 5c              ldi16	r6, 0x5cbf
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+1798
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
 e0 fb 00              jmp16	avm_test_main+2049
 f1 22                 mov	r4, r2
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 c1 0f                 ldi8	r5, 0xf
 f1 22                 mov	r4, r2
 d7 11                 sys	memset
 c6 7a 40              ldi16	r6, 0x407a
 c3 00                 ldi8	r7, 0x0
 c5 c0 ff              ldi16	r5, 0xffc0
 f0 03 49              ldi8	r3, 0x49
 f1 23                 mov	r4, r3
 d7 21                 sys	draw_sprite_erase
 c6 bf 60              ldi16	r6, 0x60bf
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 27                 breq8	avm_test_main+1883
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
 e0 a6 00              jmp16	avm_test_main+2049
 f1 22                 mov	r4, r2
 f1 29                 mov	r6, r1
 f1 24                 mov	r5, r0
 d7 11                 sys	memset
 f1 22                 mov	r4, r2
 c1 ff                 ldi8	r5, 0xff
 d7 11                 sys	memset
 c6 7a 40              ldi16	r6, 0x407a
 c3 00                 ldi8	r7, 0x0
 f1 23                 mov	r4, r3
 c1 3f                 ldi8	r5, 0x3f
 d7 21                 sys	draw_sprite_erase
 c6 bf 64              ldi16	r6, 0x64bf
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 26                 breq8	avm_test_main+1963
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
 d4 56                 jmp8	avm_test_main+2049
 f0 07 00 05           ldi16	r3, 0x500
 f1 23                 mov	r4, r3
 f1 29                 mov	r6, r1
 f2 42                 sub	r2, r2
 f1 26                 mov	r5, r2
 d7 11                 sys	memset
 c1 aa                 ldi8	r5, 0xaa
 f1 23                 mov	r4, r3
 d7 11                 sys	memset
 c6 70 3a              ldi16	r6, 0x3a70
 c3 00                 ldi8	r7, 0x0
 c1 04                 ldi8	r5, 0x4
 f1 22                 mov	r4, r2
 f1 02                 mov	r0, r2
 d7 21                 sys	draw_sprite_erase
 c6 bf 68              ldi16	r6, 0x68bf
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 23                 mov	r4, r3
 f1 25                 mov	r5, r1
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 29                 breq8	avm_test_main+2054
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
 d6 02                 adjsp	avm_test_main+2060
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
