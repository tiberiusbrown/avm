
sprite_erase.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 sprite_erase.c
00000800 l     O .rodata	00000020 sprite_5x13
00000820 l     O .rodata	00000400 expected_00
00000c20 l     O .rodata	00000400 expected_01
00001020 l     O .rodata	00000400 expected_02
00001420 l     O .rodata	00000400 expected_03
00001820 l     O .rodata	00000400 expected_04
00001c20 l     O .rodata	00000400 expected_05
00002020 l     O .rodata	00000400 expected_06
00002420 l     O .rodata	00000104 sprite_1x1_many_frames
00002524 l     O .rodata	00000400 expected_07
00002924 l     O .rodata	0000000b sprite_9x8
0000292f l     O .rodata	00000400 expected_08
00002d2f l     O .rodata	00000400 expected_09
0000312f l     O .rodata	0000001a sprite_4x17
00003149 l     O .rodata	00000400 expected_10
00003549 l     O .rodata	00000400 expected_11
00003949 l     O .rodata	0000020a sprite_130x9
00003b53 l     O .rodata	00000400 expected_12
00003f53 l     O .rodata	00000041 sprite_7x65
00003f94 l     O .rodata	00000400 expected_13
00004394 l     O .rodata	00000400 expected_14
00004794 l     O .rodata	00000400 expected_15
00004b94 l     O .rodata	00000400 expected_16
00004f94 l     O .rodata	00000400 expected_17
00005394 l     O .rodata	00000002 sprite_zero_width
00005396 l     O .rodata	00000400 expected_18
00005796 l     O .rodata	00000002 sprite_zero_height
00005798 l     O .rodata	00000400 expected_19
00005b98 l     O .rodata	00000400 expected_20
00005f98 l     O .rodata	00000400 expected_21
00006398 l     O .rodata	00000400 expected_22
00006798 l     O .rodata	00000400 expected_23
000007b1 l     F .text	00000029 fail_case
00000100 l     O .data	00000005 .L.str
000007da l     F .text	00000024 test_hex8
00000000 l    df *ABS*	00000000 runtime.c
00006b98 l       .init_array	00000000 .hidden __init_array_end
00006b98 l       .init_array	00000000 .hidden __init_array_start
00006b98 l       .fini_array	00000000 .hidden __fini_array_start
00006b98 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	000004da avm_test_main
000007fe g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000500 g       *ABS*	00000000 __avm_framebuffer

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 d1 00              call16	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 d5 57                 call8	avm_run_destructors
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 e0 05              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 98 6b              ldi16	r4, 0x6b98
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 98 6b              ldi16	r6, 0x6b98
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 98 6b           ldi16	r0, 0x6b98
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 98 6b           ldi16	r2, 0x6b98
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	avm_run_constructors+48
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_run_destructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+23
 e1 81 fd              call16	-639
 c4 98 6b              ldi16	r4, 0x6b98
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 98 6b              ldi16	r6, 0x6b98
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 98 6b           ldi16	r2, 0x6b98
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 98 6b           ldi16	r0, 0x6b98
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	avm_run_destructors+68
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+104
 e1 30 fd              call16	-720
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f2 30                 sub	r0, r0
 f0 05 00 05           ldi16	r1, 0x500
 f1 21                 mov	r4, r1
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 ff                 ldi8	r5, 0xff
 d7 11                 sys	memset
 f0 06 00 08           ldi16	r2, 0x800
 f0 03 00              ldi8	r3, 0x0
 c0 08                 ldi8	r4, 0x8
 f4 60                 stsp16	[sp+0x8], r4
 c0 0a                 ldi8	r4, 0xa
 f4 58                 stsp16	[sp+0x6], r4
 c1 08                 ldi8	r5, 0x8
 aa                    xor	r6, r6
 d7 21                 sys	draw_sprite_erase
 c6 20 08              ldi16	r6, 0x820
 c3 00                 ldi8	r7, 0x0
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 db 8b 04              brne16	avm_test_main+1226
 a0                    xor	r4, r4
 f4 50                 stsp16	[sp+0x4], r4
 f1 21                 mov	r4, r1
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 a5                 ldi8	r5, 0xa5
 d7 11                 sys	memset
 f0 00 01              ldi8	r0, 0x1
 c0 0a                 ldi8	r4, 0xa
 c1 08                 ldi8	r5, 0x8
 c2 01                 ldi8	r6, 0x1
 d7 21                 sys	draw_sprite_erase
 c6 20 0c              ldi16	r6, 0xc20
 c3 00                 ldi8	r7, 0x0
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 db 5e 04              brne16	avm_test_main+1226
 f1 21                 mov	r4, r1
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 3c                 ldi8	r5, 0x3c
 d7 11                 sys	memset
 f0 00 02              ldi8	r0, 0x2
 c6 00 08              ldi16	r6, 0x800
 c3 00                 ldi8	r7, 0x0
 c0 03                 ldi8	r4, 0x3
 f4 48                 stsp16	[sp+0x2], r4
 c0 1b                 ldi8	r4, 0x1b
 c1 03                 ldi8	r5, 0x3
 f2 67                 mov32	q1, q3
 c2 02                 ldi8	r6, 0x2
 d7 21                 sys	draw_sprite_erase
 c6 20 10              ldi16	r6, 0x1020
 c3 00                 ldi8	r7, 0x0
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 db 29 04              brne16	avm_test_main+1226
 f1 21                 mov	r4, r1
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 96                 ldi8	r5, 0x96
 d7 11                 sys	memset
 c6 00 08              ldi16	r6, 0x800
 c3 00                 ldi8	r7, 0x0
 c0 13                 ldi8	r4, 0x13
 f4 40                 stsp16	[sp+0x0], r4
 c4 fe ff              ldi16	r4, 0xfffe
 c1 13                 ldi8	r5, 0x13
 f2 67                 mov32	q1, q3
 c2 01                 ldi8	r6, 0x1
 d7 21                 sys	draw_sprite_erase
 c6 20 14              ldi16	r6, 0x1420
 c3 00                 ldi8	r7, 0x0
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 f0 30 02              ldsp16	r0, [sp+0x2]
 db f3 03              brne16	avm_test_main+1226
 f1 21                 mov	r4, r1
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 69                 ldi8	r5, 0x69
 d7 11                 sys	memset
 c6 00 08              ldi16	r6, 0x800
 c3 00                 ldi8	r7, 0x0
 f0 00 11              ldi8	r0, 0x11
 c0 7e                 ldi8	r4, 0x7e
 c1 11                 ldi8	r5, 0x11
 f2 67                 mov32	q1, q3
 c2 02                 ldi8	r6, 0x2
 d7 21                 sys	draw_sprite_erase
 c6 20 18              ldi16	r6, 0x1820
 c3 00                 ldi8	r7, 0x0
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 06                 breq8	avm_test_main+269
 f0 00 04              ldi8	r0, 0x4
 e0 bd 03              jmp16	avm_test_main+1226
 f1 21                 mov	r4, r1
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 c3                 ldi8	r5, 0xc3
 d7 11                 sys	memset
 c6 00 08              ldi16	r6, 0x800
 c3 00                 ldi8	r7, 0x0
 c0 28                 ldi8	r4, 0x28
 c5 fb ff              ldi16	r5, 0xfffb
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 21                 sys	draw_sprite_erase
 c6 20 1c              ldi16	r6, 0x1c20
 c3 00                 ldi8	r7, 0x0
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 06                 breq8	avm_test_main+320
 f0 00 05              ldi8	r0, 0x5
 e0 8a 03              jmp16	avm_test_main+1226
 f1 21                 mov	r4, r1
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 5a                 ldi8	r5, 0x5a
 d7 11                 sys	memset
 c6 00 08              ldi16	r6, 0x800
 c3 00                 ldi8	r7, 0x0
 c0 46                 ldi8	r4, 0x46
 c1 3a                 ldi8	r5, 0x3a
 f2 67                 mov32	q1, q3
 c2 01                 ldi8	r6, 0x1
 d7 21                 sys	draw_sprite_erase
 c6 20 20              ldi16	r6, 0x2020
 c3 00                 ldi8	r7, 0x0
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 06                 breq8	avm_test_main+371
 f0 00 06              ldi8	r0, 0x6
 e0 57 03              jmp16	avm_test_main+1226
 f1 21                 mov	r4, r1
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 ff                 ldi8	r5, 0xff
 d7 11                 sys	memset
 c6 20 24              ldi16	r6, 0x2420
 c3 00                 ldi8	r7, 0x0
 c0 7f                 ldi8	r4, 0x7f
 c1 3f                 ldi8	r5, 0x3f
 f2 67                 mov32	q1, q3
 c6 01 01              ldi16	r6, 0x101
 d7 21                 sys	draw_sprite_erase
 c6 24 25              ldi16	r6, 0x2524
 c3 00                 ldi8	r7, 0x0
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 06                 breq8	avm_test_main+423
 f0 00 07              ldi8	r0, 0x7
 e0 23 03              jmp16	avm_test_main+1226
 f0 38 02              stsp16	[sp+0x2], r0
 f1 21                 mov	r4, r1
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 3c                 ldi8	r5, 0x3c
 d7 11                 sys	memset
 c6 24 29              ldi16	r6, 0x2924
 c3 00                 ldi8	r7, 0x0
 c4 fc ff              ldi16	r4, 0xfffc
 c1 07                 ldi8	r5, 0x7
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 21                 sys	draw_sprite_erase
 c6 2f 29              ldi16	r6, 0x292f
 c3 00                 ldi8	r7, 0x0
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 f0 30 08              ldsp16	r0, [sp+0x8]
 db ef 02              brne16	avm_test_main+1226
 f1 21                 mov	r4, r1
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 c3                 ldi8	r5, 0xc3
 d7 11                 sys	memset
 c6 24 29              ldi16	r6, 0x2924
 c3 00                 ldi8	r7, 0x0
 c0 7d                 ldi8	r4, 0x7d
 c1 3b                 ldi8	r5, 0x3b
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 21                 sys	draw_sprite_erase
 c6 2f 2d              ldi16	r6, 0x2d2f
 c3 00                 ldi8	r7, 0x0
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 06                 breq8	avm_test_main+525
 f0 00 09              ldi8	r0, 0x9
 e0 bd 02              jmp16	avm_test_main+1226
 f1 21                 mov	r4, r1
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 69                 ldi8	r5, 0x69
 d7 11                 sys	memset
 c6 2f 31              ldi16	r6, 0x312f
 c3 00                 ldi8	r7, 0x0
 c0 14                 ldi8	r4, 0x14
 f4 60                 stsp16	[sp+0x8], r4
 c5 f7 ff              ldi16	r5, 0xfff7
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 21                 sys	draw_sprite_erase
 c6 49 31              ldi16	r6, 0x3149
 c3 00                 ldi8	r7, 0x0
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 f0 30 06              ldsp16	r0, [sp+0x6]
 db 8a 02              brne16	avm_test_main+1226
 f1 21                 mov	r4, r1
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 96                 ldi8	r5, 0x96
 d7 11                 sys	memset
 c6 2f 31              ldi16	r6, 0x312f
 c3 00                 ldi8	r7, 0x0
 c0 14                 ldi8	r4, 0x14
 c1 37                 ldi8	r5, 0x37
 f2 67                 mov32	q1, q3
 c2 01                 ldi8	r6, 0x1
 d7 21                 sys	draw_sprite_erase
 c6 49 35              ldi16	r6, 0x3549
 c3 00                 ldi8	r7, 0x0
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 06                 breq8	avm_test_main+627
 f0 00 0b              ldi8	r0, 0xb
 e0 57 02              jmp16	avm_test_main+1226
 f1 21                 mov	r4, r1
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 5a                 ldi8	r5, 0x5a
 d7 11                 sys	memset
 c6 49 39              ldi16	r6, 0x3949
 c3 00                 ldi8	r7, 0x0
 c4 ff ff              ldi16	r4, 0xffff
 c1 1f                 ldi8	r5, 0x1f
 f2 67                 mov32	q1, q3
 c2 01                 ldi8	r6, 0x1
 d7 21                 sys	draw_sprite_erase
 c6 53 3b              ldi16	r6, 0x3b53
 c3 00                 ldi8	r7, 0x0
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 06                 breq8	avm_test_main+679
 f0 00 0c              ldi8	r0, 0xc
 e0 23 02              jmp16	avm_test_main+1226
 f1 21                 mov	r4, r1
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 a5                 ldi8	r5, 0xa5
 d7 11                 sys	memset
 c6 53 3f              ldi16	r6, 0x3f53
 c3 00                 ldi8	r7, 0x0
 c0 3c                 ldi8	r4, 0x3c
 c5 ff ff              ldi16	r5, 0xffff
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 21                 sys	draw_sprite_erase
 c6 94 3f              ldi16	r6, 0x3f94
 c3 00                 ldi8	r7, 0x0
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 06                 breq8	avm_test_main+730
 f0 00 0d              ldi8	r0, 0xd
 e0 f0 01              jmp16	avm_test_main+1226
 f1 21                 mov	r4, r1
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 3c                 ldi8	r5, 0x3c
 d7 11                 sys	memset
 c6 00 08              ldi16	r6, 0x800
 c3 00                 ldi8	r7, 0x0
 c0 80                 ldi8	r4, 0x80
 c1 0a                 ldi8	r5, 0xa
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 21                 sys	draw_sprite_erase
 c6 94 43              ldi16	r6, 0x4394
 c3 00                 ldi8	r7, 0x0
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 06                 breq8	avm_test_main+780
 f0 00 0e              ldi8	r0, 0xe
 e0 be 01              jmp16	avm_test_main+1226
 f1 21                 mov	r4, r1
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 c3                 ldi8	r5, 0xc3
 d7 11                 sys	memset
 c6 00 08              ldi16	r6, 0x800
 c3 00                 ldi8	r7, 0x0
 c4 fb ff              ldi16	r4, 0xfffb
 c1 0a                 ldi8	r5, 0xa
 f2 67                 mov32	q1, q3
 c2 01                 ldi8	r6, 0x1
 d7 21                 sys	draw_sprite_erase
 c6 94 47              ldi16	r6, 0x4794
 c3 00                 ldi8	r7, 0x0
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 06                 breq8	avm_test_main+832
 f0 00 0f              ldi8	r0, 0xf
 e0 8a 01              jmp16	avm_test_main+1226
 f1 21                 mov	r4, r1
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 69                 ldi8	r5, 0x69
 d7 11                 sys	memset
 c6 00 08              ldi16	r6, 0x800
 c3 00                 ldi8	r7, 0x0
 c0 0a                 ldi8	r4, 0xa
 c5 f3 ff              ldi16	r5, 0xfff3
 f2 67                 mov32	q1, q3
 c2 02                 ldi8	r6, 0x2
 d7 21                 sys	draw_sprite_erase
 c6 94 4b              ldi16	r6, 0x4b94
 c3 00                 ldi8	r7, 0x0
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 06                 breq8	avm_test_main+884
 f0 00 10              ldi8	r0, 0x10
 e0 56 01              jmp16	avm_test_main+1226
 f1 21                 mov	r4, r1
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 96                 ldi8	r5, 0x96
 d7 11                 sys	memset
 c6 00 08              ldi16	r6, 0x800
 c3 00                 ldi8	r7, 0x0
 c0 0a                 ldi8	r4, 0xa
 c1 40                 ldi8	r5, 0x40
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 21                 sys	draw_sprite_erase
 c6 94 4f              ldi16	r6, 0x4f94
 c3 00                 ldi8	r7, 0x0
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 f0 30 02              ldsp16	r0, [sp+0x2]
 db 26 01              brne16	avm_test_main+1226
 f1 21                 mov	r4, r1
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 5a                 ldi8	r5, 0x5a
 d7 11                 sys	memset
 c6 94 53              ldi16	r6, 0x5394
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f2 67                 mov32	q1, q3
 c2 7b                 ldi8	r6, 0x7b
 d7 21                 sys	draw_sprite_erase
 c6 96 53              ldi16	r6, 0x5396
 c3 00                 ldi8	r7, 0x0
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 06                 breq8	avm_test_main+981
 f0 00 12              ldi8	r0, 0x12
 e0 f5 00              jmp16	avm_test_main+1226
 f1 21                 mov	r4, r1
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 a5                 ldi8	r5, 0xa5
 d7 11                 sys	memset
 c6 96 57              ldi16	r6, 0x5796
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f2 67                 mov32	q1, q3
 c6 c8 01              ldi16	r6, 0x1c8
 d7 21                 sys	draw_sprite_erase
 c6 98 57              ldi16	r6, 0x5798
 c3 00                 ldi8	r7, 0x0
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 f0 30 00              ldsp16	r0, [sp+0x0]
 db c5 00              brne16	avm_test_main+1226
 f1 21                 mov	r4, r1
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 ff                 ldi8	r5, 0xff
 d7 11                 sys	memset
 c6 49 39              ldi16	r6, 0x3949
 c3 00                 ldi8	r7, 0x0
 c4 7f ff              ldi16	r4, 0xff7f
 c1 18                 ldi8	r5, 0x18
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 21                 sys	draw_sprite_erase
 c6 98 5b              ldi16	r6, 0x5b98
 c3 00                 ldi8	r7, 0x0
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 f0 30 08              ldsp16	r0, [sp+0x8]
 db 94 00              brne16	avm_test_main+1226
 f1 21                 mov	r4, r1
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 0f                 ldi8	r5, 0xf
 d7 11                 sys	memset
 c6 53 3f              ldi16	r6, 0x3f53
 c3 00                 ldi8	r7, 0x0
 c0 49                 ldi8	r4, 0x49
 c5 c0 ff              ldi16	r5, 0xffc0
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 21                 sys	draw_sprite_erase
 c6 98 5f              ldi16	r6, 0x5f98
 c3 00                 ldi8	r7, 0x0
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 05                 breq8	avm_test_main+1128
 f0 00 15              ldi8	r0, 0x15
 d4 62                 jmp8	avm_test_main+1226
 f1 21                 mov	r4, r1
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 ff                 ldi8	r5, 0xff
 d7 11                 sys	memset
 c6 53 3f              ldi16	r6, 0x3f53
 c3 00                 ldi8	r7, 0x0
 c0 49                 ldi8	r4, 0x49
 c1 3f                 ldi8	r5, 0x3f
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 21                 sys	draw_sprite_erase
 c6 98 63              ldi16	r6, 0x6398
 c3 00                 ldi8	r7, 0x0
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 05                 breq8	avm_test_main+1177
 f0 00 16              ldi8	r0, 0x16
 d4 31                 jmp8	avm_test_main+1226
 f1 21                 mov	r4, r1
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 21                 mov	r4, r1
 c1 aa                 ldi8	r5, 0xaa
 d7 11                 sys	memset
 c6 49 39              ldi16	r6, 0x3949
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 04                 ldi8	r5, 0x4
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 21                 sys	draw_sprite_erase
 c6 98 67              ldi16	r6, 0x6798
 c3 00                 ldi8	r7, 0x0
 f1 21                 mov	r4, r1
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 f0 31 04              ldsp16	r1, [sp+0x4]
 d0 0a                 breq8	avm_test_main+1233
 f0 00 17              ldi8	r0, 0x17
 f0 01 01              ldi8	r1, 0x1
 f1 20                 mov	r4, r0
 d5 09                 call8	fail_case
 f1 21                 mov	r4, r1
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<fail_case>:
 d6 fe                 adjsp	-0x2
 0c                    mov	r7, r4
 c6 00 01              ldi16	r6, 0x100
 42                    ld8u	r4, [r6]
 f4 a4                 tst8	r4
 d0 06                 breq8	fail_case+17
 d7 00                 sys	debug_putc
 f4 ae                 inc16	r6
 d4 f5                 jmp8	fail_case+6
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f4 43                 stsp16	[sp+0x0], r7
 d5 0d                 call8	test_hex8
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 74                 zext8	r4
 d5 07                 call8	test_hex8
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d6 02                 adjsp	0x2
 ef                    ret

<test_hex8>:
 b0                    push16	r0
 04                    mov	r5, r4
 fa 84                 lsr16i	r5, 0x4
 f0 00 30              ldi8	r0, 0x30
 0d                    mov	r7, r5
 f9 e1                 or	r7, r0
 c9 37                 addi.s8	r5, 0x37
 c2 a0                 ldi8	r6, 0xa0
 32                    cmp	r4, r6
 fc 2f                 cmov.ult	r5, r7
 c2 0f                 ldi8	r6, 0xf
 88                    and	r6, r4
 f9 19                 or	r0, r6
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 30                 cmov.ult	r6, r0
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 b8                    pop16	r0
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
