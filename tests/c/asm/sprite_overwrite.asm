
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/sprite_overwrite.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sprite_overwrite.c
00000a1e l     O .rodata	00000020 sprite_5x13
000069b6 l     O .rodata	00000400 expected_00
00000100 l     O .data	00000005 .L.str
00000a3e l     O .rodata	00000400 expected_01
00000e3e l     O .rodata	00000400 expected_02
0000123e l     O .rodata	00000400 expected_03
0000163e l     O .rodata	00000400 expected_04
00001a3e l     O .rodata	00000400 expected_05
00001e3e l     O .rodata	00000400 expected_06
0000223e l     O .rodata	00000104 sprite_1x1_many_frames
00002342 l     O .rodata	00000400 expected_07
00002742 l     O .rodata	0000000b sprite_9x8
0000274d l     O .rodata	00000400 expected_08
00002b4d l     O .rodata	00000400 expected_09
00002f4d l     O .rodata	0000001a sprite_4x17
00002f67 l     O .rodata	00000400 expected_10
00003367 l     O .rodata	00000400 expected_11
00003767 l     O .rodata	0000020a sprite_130x9
00003971 l     O .rodata	00000400 expected_12
00003d71 l     O .rodata	00000041 sprite_7x65
00003db2 l     O .rodata	00000400 expected_13
000041b2 l     O .rodata	00000400 expected_14
000045b2 l     O .rodata	00000400 expected_15
000049b2 l     O .rodata	00000400 expected_16
00004db2 l     O .rodata	00000400 expected_17
000051b2 l     O .rodata	00000002 sprite_zero_width
000051b4 l     O .rodata	00000400 expected_18
000055b4 l     O .rodata	00000002 sprite_zero_height
000055b6 l     O .rodata	00000400 expected_19
000059b6 l     O .rodata	00000400 expected_20
00005db6 l     O .rodata	00000400 expected_21
000061b6 l     O .rodata	00000400 expected_22
000065b6 l     O .rodata	00000400 expected_23
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	00000806 avm_test_main
00000a1c g     F .text	00000002 avm_halt

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
 e1 06 08              call16	avm_halt

<avm_test_main>:
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	_start+20
 f0 05 00 04           ldi16	r1, 0x400
 f2 30                 sub	r0, r0
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 24                 mov	r5, r0
 f1 29                 mov	r6, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c6 1e 0a              ldi16	r6, 0xa1e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c1 08                 ldi8	r5, 0x8
 c0 0a                 ldi8	r4, 0xa
 d7 1e                 sys	draw_sprite_overwrite
 c6 b6 69              ldi16	r6, 0x69b6
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+84
 c0 43                 ldi8	r4, 0x43
 c7 01 01              ldi16	r7, 0x101
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+58
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 e0 49 05              jmp16	avm_test_main+1437
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
 c6 1e 0a              ldi16	r6, 0xa1e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 00 01              ldi8	r0, 0x1
 c1 08                 ldi8	r5, 0x8
 c0 0a                 ldi8	r4, 0xa
 d7 1e                 sys	draw_sprite_overwrite
 c6 3e 0a              ldi16	r6, 0xa3e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+169
 c0 43                 ldi8	r4, 0x43
 c7 01 01              ldi16	r7, 0x101
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+141
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 e0 f4 04              jmp16	avm_test_main+1437
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
 c6 1e 0a              ldi16	r6, 0xa1e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 00 02              ldi8	r0, 0x2
 c1 03                 ldi8	r5, 0x3
 c0 1b                 ldi8	r4, 0x1b
 d7 1e                 sys	draw_sprite_overwrite
 c6 3e 0e              ldi16	r6, 0xe3e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+254
 c0 43                 ldi8	r4, 0x43
 c7 01 01              ldi16	r7, 0x101
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+226
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 32                 ldi8	r4, 0x32
 e0 9f 04              jmp16	avm_test_main+1437
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
 c6 1e 0a              ldi16	r6, 0xa1e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 00 01              ldi8	r0, 0x1
 c1 13                 ldi8	r5, 0x13
 c4 fe ff              ldi16	r4, 0xfffe
 d7 1e                 sys	draw_sprite_overwrite
 c6 3e 12              ldi16	r6, 0x123e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+340
 c0 43                 ldi8	r4, 0x43
 c7 01 01              ldi16	r7, 0x101
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+312
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 33                 ldi8	r4, 0x33
 e0 49 04              jmp16	avm_test_main+1437
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
 c6 1e 0a              ldi16	r6, 0xa1e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 00 02              ldi8	r0, 0x2
 c1 11                 ldi8	r5, 0x11
 c0 7e                 ldi8	r4, 0x7e
 d7 1e                 sys	draw_sprite_overwrite
 c6 3e 16              ldi16	r6, 0x163e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+425
 c0 43                 ldi8	r4, 0x43
 c7 01 01              ldi16	r7, 0x101
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+397
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 34                 ldi8	r4, 0x34
 e0 f4 03              jmp16	avm_test_main+1437
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
 c6 1e 0a              ldi16	r6, 0xa1e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c5 fb ff              ldi16	r5, 0xfffb
 c0 28                 ldi8	r4, 0x28
 d7 1e                 sys	draw_sprite_overwrite
 c6 3e 1a              ldi16	r6, 0x1a3e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+511
 c0 43                 ldi8	r4, 0x43
 c7 01 01              ldi16	r7, 0x101
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+483
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 35                 ldi8	r4, 0x35
 e0 9e 03              jmp16	avm_test_main+1437
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
 c6 1e 0a              ldi16	r6, 0xa1e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 00 01              ldi8	r0, 0x1
 c1 3a                 ldi8	r5, 0x3a
 c0 46                 ldi8	r4, 0x46
 d7 1e                 sys	draw_sprite_overwrite
 c6 3e 1e              ldi16	r6, 0x1e3e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+596
 c0 43                 ldi8	r4, 0x43
 c7 01 01              ldi16	r7, 0x101
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+568
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 36                 ldi8	r4, 0x36
 e0 49 03              jmp16	avm_test_main+1437
 a5                    xor	r5, r5
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 29                 mov	r6, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c6 3e 22              ldi16	r6, 0x223e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 04 01 01           ldi16	r0, 0x101
 c1 3f                 ldi8	r5, 0x3f
 c0 7f                 ldi8	r4, 0x7f
 d7 1e                 sys	draw_sprite_overwrite
 c6 42 23              ldi16	r6, 0x2342
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+675
 c0 43                 ldi8	r4, 0x43
 c7 01 01              ldi16	r7, 0x101
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+647
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 37                 ldi8	r4, 0x37
 e0 fa 02              jmp16	avm_test_main+1437
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
 c6 42 27              ldi16	r6, 0x2742
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c1 07                 ldi8	r5, 0x7
 c4 fc ff              ldi16	r4, 0xfffc
 d7 1e                 sys	draw_sprite_overwrite
 c6 4d 27              ldi16	r6, 0x274d
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+761
 c0 43                 ldi8	r4, 0x43
 c7 01 01              ldi16	r7, 0x101
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+733
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 38                 ldi8	r4, 0x38
 e0 a4 02              jmp16	avm_test_main+1437
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
 c6 42 27              ldi16	r6, 0x2742
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c1 3b                 ldi8	r5, 0x3b
 c0 7d                 ldi8	r4, 0x7d
 d7 1e                 sys	draw_sprite_overwrite
 c6 4d 2b              ldi16	r6, 0x2b4d
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+844
 c0 43                 ldi8	r4, 0x43
 c7 01 01              ldi16	r7, 0x101
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+816
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 39                 ldi8	r4, 0x39
 e0 51 02              jmp16	avm_test_main+1437
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
 c6 4d 2f              ldi16	r6, 0x2f4d
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c5 f7 ff              ldi16	r5, 0xfff7
 c0 14                 ldi8	r4, 0x14
 d7 1e                 sys	draw_sprite_overwrite
 c6 67 2f              ldi16	r6, 0x2f67
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+928
 c0 43                 ldi8	r4, 0x43
 c7 01 01              ldi16	r7, 0x101
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+900
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 e0 fd 01              jmp16	avm_test_main+1437
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
 c6 4d 2f              ldi16	r6, 0x2f4d
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 00 01              ldi8	r0, 0x1
 c1 37                 ldi8	r5, 0x37
 c0 14                 ldi8	r4, 0x14
 d7 1e                 sys	draw_sprite_overwrite
 c6 67 33              ldi16	r6, 0x3367
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+1013
 c0 43                 ldi8	r4, 0x43
 c7 01 01              ldi16	r7, 0x101
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+985
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 42                 ldi8	r4, 0x42
 e0 a8 01              jmp16	avm_test_main+1437
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
 c6 67 37              ldi16	r6, 0x3767
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c1 1f                 ldi8	r5, 0x1f
 c4 ff ff              ldi16	r4, 0xffff
 d7 1e                 sys	draw_sprite_overwrite
 c6 71 39              ldi16	r6, 0x3971
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+1096
 c0 43                 ldi8	r4, 0x43
 c7 01 01              ldi16	r7, 0x101
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1068
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 e0 55 01              jmp16	avm_test_main+1437
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
 c6 71 3d              ldi16	r6, 0x3d71
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c5 ff ff              ldi16	r5, 0xffff
 c0 3c                 ldi8	r4, 0x3c
 d7 1e                 sys	draw_sprite_overwrite
 c6 b2 3d              ldi16	r6, 0x3db2
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+1182
 c0 43                 ldi8	r4, 0x43
 c7 01 01              ldi16	r7, 0x101
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1154
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 44                 ldi8	r4, 0x44
 e0 ff 00              jmp16	avm_test_main+1437
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
 c6 1e 0a              ldi16	r6, 0xa1e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c1 0a                 ldi8	r5, 0xa
 c0 80                 ldi8	r4, 0x80
 d7 1e                 sys	draw_sprite_overwrite
 c6 b2 41              ldi16	r6, 0x41b2
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+1265
 c0 43                 ldi8	r4, 0x43
 c7 01 01              ldi16	r7, 0x101
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1237
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 e0 ac 00              jmp16	avm_test_main+1437
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
 c6 1e 0a              ldi16	r6, 0xa1e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 00 01              ldi8	r0, 0x1
 c1 0a                 ldi8	r5, 0xa
 c4 fb ff              ldi16	r4, 0xfffb
 d7 1e                 sys	draw_sprite_overwrite
 c6 b2 45              ldi16	r6, 0x45b2
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 20                 breq8	avm_test_main+1350
 c0 43                 ldi8	r4, 0x43
 c7 01 01              ldi16	r7, 0x101
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1323
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 d4 57                 jmp8	avm_test_main+1437
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
 c6 1e 0a              ldi16	r6, 0xa1e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 00 02              ldi8	r0, 0x2
 c5 f3 ff              ldi16	r5, 0xfff3
 c0 0a                 ldi8	r4, 0xa
 d7 1e                 sys	draw_sprite_overwrite
 c6 b2 49              ldi16	r6, 0x49b2
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 32                 breq8	avm_test_main+1453
 c0 43                 ldi8	r4, 0x43
 c7 01 01              ldi16	r7, 0x101
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1408
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 f4 50                 stsp16	[sp+0x4], r4
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f0 00 01              ldi8	r0, 0x1
 f1 20                 mov	r4, r0
 d6 06                 adjsp	avm_test_main+1456
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
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
 c6 1e 0a              ldi16	r6, 0xa1e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c1 40                 ldi8	r5, 0x40
 c0 0a                 ldi8	r4, 0xa
 d7 1e                 sys	draw_sprite_overwrite
 c6 b2 4d              ldi16	r6, 0x4db2
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+1536
 c0 43                 ldi8	r4, 0x43
 c7 01 01              ldi16	r7, 0x101
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1510
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 e0 4f fa              jmp16	avm_test_main+79
 c6 00 04              ldi16	r6, 0x400
 f2 39                 sub	r1, r1
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 25                 mov	r5, r1
 f4 41                 stsp16	[sp+0x0], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c1 5a                 ldi8	r5, 0x5a
 f4 49                 stsp16	[sp+0x2], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 09                 ldsp16	r5, [sp+0x2]
 d7 11                 sys	memset
 c6 b2 51              ldi16	r6, 0x51b2
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 00 7b              ldi8	r0, 0x7b
 f1 21                 mov	r4, r1
 f4 01                 ldsp16	r5, [sp+0x0]
 d7 1e                 sys	draw_sprite_overwrite
 c6 b4 51              ldi16	r6, 0x51b4
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c5 00 04              ldi16	r5, 0x400
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+1629
 c0 43                 ldi8	r4, 0x43
 c7 01 01              ldi16	r7, 0x101
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1603
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 e0 9a fa              jmp16	avm_test_main+247
 c6 00 04              ldi16	r6, 0x400
 c4 00 05              ldi16	r4, 0x500
 f4 50                 stsp16	[sp+0x4], r4
 f1 25                 mov	r5, r1
 f4 41                 stsp16	[sp+0x0], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 11                 sys	memset
 c1 a5                 ldi8	r5, 0xa5
 f4 49                 stsp16	[sp+0x2], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 09                 ldsp16	r5, [sp+0x2]
 d7 11                 sys	memset
 c6 b4 55              ldi16	r6, 0x55b4
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 04 c8 01           ldi16	r0, 0x1c8
 f1 21                 mov	r4, r1
 f4 01                 ldsp16	r5, [sp+0x0]
 d7 1e                 sys	draw_sprite_overwrite
 c6 b6 55              ldi16	r6, 0x55b6
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c5 00 04              ldi16	r5, 0x400
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+1721
 c0 43                 ldi8	r4, 0x43
 c7 01 01              ldi16	r7, 0x101
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1695
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 e0 94 fa              jmp16	avm_test_main+333
 f0 05 00 04           ldi16	r1, 0x400
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
 c6 67 37              ldi16	r6, 0x3767
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c1 18                 ldi8	r5, 0x18
 c4 7f ff              ldi16	r4, 0xff7f
 d7 1e                 sys	draw_sprite_overwrite
 c6 b6 59              ldi16	r6, 0x59b6
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+1809
 c0 43                 ldi8	r4, 0x43
 c7 01 01              ldi16	r7, 0x101
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1783
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 e0 91 fa              jmp16	avm_test_main+418
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
 c6 71 3d              ldi16	r6, 0x3d71
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c5 c0 ff              ldi16	r5, 0xffc0
 c0 49                 ldi8	r4, 0x49
 d7 1e                 sys	draw_sprite_overwrite
 c6 b6 5d              ldi16	r6, 0x5db6
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+1891
 c0 43                 ldi8	r4, 0x43
 c7 01 01              ldi16	r7, 0x101
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1865
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 e0 95 fa              jmp16	avm_test_main+504
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
 c6 71 3d              ldi16	r6, 0x3d71
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c1 3f                 ldi8	r5, 0x3f
 c0 49                 ldi8	r4, 0x49
 d7 1e                 sys	draw_sprite_overwrite
 c6 b6 61              ldi16	r6, 0x61b6
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+1972
 c0 43                 ldi8	r4, 0x43
 c7 01 01              ldi16	r7, 0x101
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+1946
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 e0 99 fa              jmp16	avm_test_main+589
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
 c6 67 37              ldi16	r6, 0x3767
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c1 04                 ldi8	r5, 0x4
 f1 20                 mov	r4, r0
 d7 1e                 sys	draw_sprite_overwrite
 c6 b6 65              ldi16	r6, 0x65b6
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 25                 mov	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 da bf fd              breq16	avm_test_main+1446
 c0 43                 ldi8	r4, 0x43
 c7 01 01              ldi16	r7, 0x101
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	avm_test_main+2028
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 e0 96 fa              jmp16	avm_test_main+668

<avm_halt>:
 d4 fe                 jmp8	avm_halt
