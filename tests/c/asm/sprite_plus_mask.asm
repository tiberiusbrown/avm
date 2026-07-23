
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/sprite_plus_mask.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sprite_plus_mask.c
000008fa l     O .rodata	0000003e sprite_5x13
00006c1a l     O .rodata	00000400 expected_00
00000938 l     O .rodata	00000400 expected_01
00000d38 l     O .rodata	00000400 expected_02
00001138 l     O .rodata	00000400 expected_03
00001538 l     O .rodata	00000400 expected_04
00001938 l     O .rodata	00000400 expected_05
00001d38 l     O .rodata	00000400 expected_06
00002138 l     O .rodata	00000206 sprite_1x1_many_frames
0000233e l     O .rodata	00000400 expected_07
0000273e l     O .rodata	00000014 sprite_9x8
00002752 l     O .rodata	00000400 expected_08
00002b52 l     O .rodata	00000400 expected_09
00002f52 l     O .rodata	00000032 sprite_4x17
00002f84 l     O .rodata	00000400 expected_10
00003384 l     O .rodata	00000400 expected_11
00003784 l     O .rodata	00000412 sprite_130x9
00003b96 l     O .rodata	00000400 expected_12
00003f96 l     O .rodata	00000080 sprite_7x65
00004016 l     O .rodata	00000400 expected_13
00004416 l     O .rodata	00000400 expected_14
00004816 l     O .rodata	00000400 expected_15
00004c16 l     O .rodata	00000400 expected_16
00005016 l     O .rodata	00000400 expected_17
00005416 l     O .rodata	00000002 sprite_zero_width
00005418 l     O .rodata	00000400 expected_18
00005818 l     O .rodata	00000002 sprite_zero_height
0000581a l     O .rodata	00000400 expected_19
00005c1a l     O .rodata	00000400 expected_20
0000601a l     O .rodata	00000400 expected_21
0000641a l     O .rodata	00000400 expected_22
0000681a l     O .rodata	00000400 expected_23
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000016 _start
00000116 g     F .text	000007e2 avm_test_main
000008f8 g     F .text	00000002 avm_halt

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
 e1 e2 07              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	avm_test_main
 f0 05 00 04           ldi16	r1, 0x400
 f2 30                 sub	r0, r0
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 24                 mov	r5, r0
 f1 29                 mov	r6, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c6 fa 08              ldi16	r6, 0x8fa
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c1 08                 ldi8	r5, 0x8
 c0 0a                 ldi8	r4, 0xa
 d7 1f                 sys	draw_sprite_plus_mask
 c6 1a 6c              ldi16	r6, 0x6c1a
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+86
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
 e0 9f 03              jmp16	avm_test_main+1013
 a5                    xor	r5, r5
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 29                 mov	r6, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 a5                 ldi8	r4, 0xa5
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c6 fa 08              ldi16	r6, 0x8fa
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 00 01              ldi8	r0, 0x1
 c1 08                 ldi8	r5, 0x8
 c0 0a                 ldi8	r4, 0xa
 d7 1f                 sys	draw_sprite_plus_mask
 c6 38 09              ldi16	r6, 0x938
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+171
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
 e0 4a 03              jmp16	avm_test_main+1013
 a5                    xor	r5, r5
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 29                 mov	r6, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 3c                 ldi8	r4, 0x3c
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c6 fa 08              ldi16	r6, 0x8fa
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 00 02              ldi8	r0, 0x2
 c1 03                 ldi8	r5, 0x3
 c0 1b                 ldi8	r4, 0x1b
 d7 1f                 sys	draw_sprite_plus_mask
 c6 38 0d              ldi16	r6, 0xd38
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+256
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
 e0 f5 02              jmp16	avm_test_main+1013
 a5                    xor	r5, r5
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 29                 mov	r6, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 96                 ldi8	r4, 0x96
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c6 fa 08              ldi16	r6, 0x8fa
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 00 01              ldi8	r0, 0x1
 c1 13                 ldi8	r5, 0x13
 c4 fe ff              ldi16	r4, 0xfffe
 d7 1f                 sys	draw_sprite_plus_mask
 c6 38 11              ldi16	r6, 0x1138
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+342
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
 e0 9f 02              jmp16	avm_test_main+1013
 a5                    xor	r5, r5
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 29                 mov	r6, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 69                 ldi8	r4, 0x69
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c6 fa 08              ldi16	r6, 0x8fa
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 00 02              ldi8	r0, 0x2
 c1 11                 ldi8	r5, 0x11
 c0 7e                 ldi8	r4, 0x7e
 d7 1f                 sys	draw_sprite_plus_mask
 c6 38 15              ldi16	r6, 0x1538
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+427
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
 e0 4a 02              jmp16	avm_test_main+1013
 f2 30                 sub	r0, r0
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 24                 mov	r5, r0
 f1 29                 mov	r6, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 c3                 ldi8	r4, 0xc3
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c6 fa 08              ldi16	r6, 0x8fa
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c5 fb ff              ldi16	r5, 0xfffb
 c0 28                 ldi8	r4, 0x28
 d7 1f                 sys	draw_sprite_plus_mask
 c6 38 19              ldi16	r6, 0x1938
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+513
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
 e0 f4 01              jmp16	avm_test_main+1013
 a5                    xor	r5, r5
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 29                 mov	r6, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 5a                 ldi8	r4, 0x5a
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c6 fa 08              ldi16	r6, 0x8fa
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 00 01              ldi8	r0, 0x1
 c1 3a                 ldi8	r5, 0x3a
 c0 46                 ldi8	r4, 0x46
 d7 1f                 sys	draw_sprite_plus_mask
 c6 38 1d              ldi16	r6, 0x1d38
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+598
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
 e0 9f 01              jmp16	avm_test_main+1013
 a5                    xor	r5, r5
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 29                 mov	r6, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c6 38 21              ldi16	r6, 0x2138
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 04 01 01           ldi16	r0, 0x101
 c1 3f                 ldi8	r5, 0x3f
 c0 7f                 ldi8	r4, 0x7f
 d7 1f                 sys	draw_sprite_plus_mask
 c6 3e 23              ldi16	r6, 0x233e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+677
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
 e0 50 01              jmp16	avm_test_main+1013
 f2 30                 sub	r0, r0
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 24                 mov	r5, r0
 f1 29                 mov	r6, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 3c                 ldi8	r4, 0x3c
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c6 3e 27              ldi16	r6, 0x273e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c1 07                 ldi8	r5, 0x7
 c4 fc ff              ldi16	r4, 0xfffc
 d7 1f                 sys	draw_sprite_plus_mask
 c6 52 27              ldi16	r6, 0x2752
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+763
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
 e0 fa 00              jmp16	avm_test_main+1013
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 24                 mov	r5, r0
 f1 29                 mov	r6, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 c3                 ldi8	r4, 0xc3
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c6 3e 27              ldi16	r6, 0x273e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c1 3b                 ldi8	r5, 0x3b
 c0 7d                 ldi8	r4, 0x7d
 d7 1f                 sys	draw_sprite_plus_mask
 c6 52 2b              ldi16	r6, 0x2b52
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+846
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
 e0 a7 00              jmp16	avm_test_main+1013
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 24                 mov	r5, r0
 f1 29                 mov	r6, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 69                 ldi8	r4, 0x69
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c6 52 2f              ldi16	r6, 0x2f52
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c5 f7 ff              ldi16	r5, 0xfff7
 c0 14                 ldi8	r4, 0x14
 d7 1f                 sys	draw_sprite_plus_mask
 c6 84 2f              ldi16	r6, 0x2f84
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 22                 breq8	avm_test_main+931
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 f4 50                 stsp16	[sp+0x4], r4
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
 f4 10                 ldsp16	r4, [sp+0x4]
 d4 52                 jmp8	avm_test_main+1013
 a5                    xor	r5, r5
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 29                 mov	r6, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 96                 ldi8	r4, 0x96
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c6 52 2f              ldi16	r6, 0x2f52
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 00 01              ldi8	r0, 0x1
 c1 37                 ldi8	r5, 0x37
 c0 14                 ldi8	r4, 0x14
 d7 1f                 sys	draw_sprite_plus_mask
 c6 84 33              ldi16	r6, 0x3384
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 30                 breq8	avm_test_main+1031
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
 d7 00                 sys	debug_putc
 f0 00 01              ldi8	r0, 0x1
 f1 20                 mov	r4, r0
 d6 06                 adjsp	avm_test_main+1032
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 a5                    xor	r5, r5
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 29                 mov	r6, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 5a                 ldi8	r4, 0x5a
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c6 84 37              ldi16	r6, 0x3784
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c1 1f                 ldi8	r5, 0x1f
 c4 ff ff              ldi16	r4, 0xffff
 d7 1f                 sys	draw_sprite_plus_mask
 c6 96 3b              ldi16	r6, 0x3b96
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 0b                 breq8	avm_test_main+1092
 c0 43                 ldi8	r4, 0x43
 f4 50                 stsp16	[sp+0x4], r4
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 e0 45 ff              jmp16	avm_test_main+905
 f2 30                 sub	r0, r0
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 24                 mov	r5, r0
 f1 29                 mov	r6, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 a5                 ldi8	r4, 0xa5
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c6 96 3f              ldi16	r6, 0x3f96
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c5 ff ff              ldi16	r5, 0xffff
 c0 3c                 ldi8	r4, 0x3c
 d7 1f                 sys	draw_sprite_plus_mask
 c6 16 40              ldi16	r6, 0x4016
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+1178
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
 e0 5b ff              jmp16	avm_test_main+1013
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 24                 mov	r5, r0
 f1 29                 mov	r6, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 3c                 ldi8	r4, 0x3c
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c6 fa 08              ldi16	r6, 0x8fa
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c1 0a                 ldi8	r5, 0xa
 c0 80                 ldi8	r4, 0x80
 d7 1f                 sys	draw_sprite_plus_mask
 c6 16 44              ldi16	r6, 0x4416
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 13                 breq8	avm_test_main+1247
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 f4 50                 stsp16	[sp+0x4], r4
 e0 b2 fe              jmp16	avm_test_main+913
 a5                    xor	r5, r5
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 29                 mov	r6, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 c3                 ldi8	r4, 0xc3
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c6 fa 08              ldi16	r6, 0x8fa
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 00 01              ldi8	r0, 0x1
 c1 0a                 ldi8	r5, 0xa
 c4 fb ff              ldi16	r4, 0xfffb
 d7 1f                 sys	draw_sprite_plus_mask
 c6 16 48              ldi16	r6, 0x4816
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+1333
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
 e0 c0 fe              jmp16	avm_test_main+1013
 a5                    xor	r5, r5
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 29                 mov	r6, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 69                 ldi8	r4, 0x69
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c6 fa 08              ldi16	r6, 0x8fa
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 00 02              ldi8	r0, 0x2
 c5 f3 ff              ldi16	r5, 0xfff3
 c0 0a                 ldi8	r4, 0xa
 d7 1f                 sys	draw_sprite_plus_mask
 c6 16 4c              ldi16	r6, 0x4c16
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+1419
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
 f4 50                 stsp16	[sp+0x4], r4
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 e0 12 fe              jmp16	avm_test_main+925
 f2 30                 sub	r0, r0
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 24                 mov	r5, r0
 f1 29                 mov	r6, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 96                 ldi8	r4, 0x96
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c6 fa 08              ldi16	r6, 0x8fa
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c1 40                 ldi8	r5, 0x40
 c0 0a                 ldi8	r4, 0xa
 d7 1f                 sys	draw_sprite_plus_mask
 c6 16 50              ldi16	r6, 0x5016
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+1504
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
 e0 15 fe              jmp16	avm_test_main+1013
 af                    xor	r7, r7
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 07                    mov	r5, r7
 f4 41                 stsp16	[sp+0x0], r5
 f1 29                 mov	r6, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c1 5a                 ldi8	r5, 0x5a
 f4 49                 stsp16	[sp+0x2], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 09                 ldsp16	r5, [sp+0x2]
 d7 11                 sys	memset
 f0 06 16 54           ldi16	r2, 0x5416
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 f0 00 7b              ldi8	r0, 0x7b
 03                    mov	r4, r7
 f2 6b                 mov32	q3, q1
 f4 01                 ldsp16	r5, [sp+0x0]
 d7 1f                 sys	draw_sprite_plus_mask
 c6 18 54              ldi16	r6, 0x5418
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+1596
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
 e0 bd fa              jmp16	avm_test_main+249
 af                    xor	r7, r7
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 07                    mov	r5, r7
 f4 41                 stsp16	[sp+0x0], r5
 f1 29                 mov	r6, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c1 a5                 ldi8	r5, 0xa5
 f4 49                 stsp16	[sp+0x2], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 09                 ldsp16	r5, [sp+0x2]
 d7 11                 sys	memset
 f0 06 18 58           ldi16	r2, 0x5818
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 f0 04 c8 01           ldi16	r0, 0x1c8
 03                    mov	r4, r7
 f2 6b                 mov32	q3, q1
 f4 01                 ldsp16	r5, [sp+0x0]
 d7 1f                 sys	draw_sprite_plus_mask
 c6 1a 58              ldi16	r6, 0x581a
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+1689
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
 e0 b6 fa              jmp16	avm_test_main+335
 f2 30                 sub	r0, r0
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 24                 mov	r5, r0
 f1 29                 mov	r6, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 f0                 ldi8	r4, 0xf0
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c6 84 37              ldi16	r6, 0x3784
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c1 18                 ldi8	r5, 0x18
 c4 7f ff              ldi16	r4, 0xff7f
 d7 1f                 sys	draw_sprite_plus_mask
 c6 1a 5c              ldi16	r6, 0x5c1a
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+1773
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
 e0 b7 fa              jmp16	avm_test_main+420
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 24                 mov	r5, r0
 f1 29                 mov	r6, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 0f                 ldi8	r4, 0xf
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c6 96 3f              ldi16	r6, 0x3f96
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c5 c0 ff              ldi16	r5, 0xffc0
 c0 49                 ldi8	r4, 0x49
 d7 1f                 sys	draw_sprite_plus_mask
 c6 1a 60              ldi16	r6, 0x601a
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+1855
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
 e0 bb fa              jmp16	avm_test_main+506
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 24                 mov	r5, r0
 f1 29                 mov	r6, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 55                 ldi8	r4, 0x55
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c6 96 3f              ldi16	r6, 0x3f96
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c1 3f                 ldi8	r5, 0x3f
 c0 49                 ldi8	r4, 0x49
 d7 1f                 sys	draw_sprite_plus_mask
 c6 1a 64              ldi16	r6, 0x641a
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+1936
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
 e0 bf fa              jmp16	avm_test_main+591
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 24                 mov	r5, r0
 f1 29                 mov	r6, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c0 aa                 ldi8	r4, 0xaa
 04                    mov	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c6 84 37              ldi16	r6, 0x3784
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c1 04                 ldi8	r5, 0x4
 f1 20                 mov	r4, r0
 d7 1f                 sys	draw_sprite_plus_mask
 c6 1a 68              ldi16	r6, 0x681a
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 da 3b fc              breq16	avm_test_main+1022
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
 e0 bc fa              jmp16	avm_test_main+670

<avm_halt>:
 d4 fe                 jmp8	avm_halt
