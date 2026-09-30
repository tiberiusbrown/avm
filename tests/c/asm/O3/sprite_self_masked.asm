
sprite_self_masked.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000011e l     F .text	0000004a avm_run_constructors
00000168 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 sprite_self_masked.c
00000915 l     O .rodata	00000020 sprite_5x13
000060ad l     O .rodata	00000400 expected_00
00000935 l     O .rodata	00000400 expected_01
00000d35 l     O .rodata	00000400 expected_02
00001135 l     O .rodata	00000400 expected_03
00001535 l     O .rodata	00000400 expected_04
00001935 l     O .rodata	00000400 expected_05
00001d35 l     O .rodata	00000400 expected_06
00002135 l     O .rodata	00000104 sprite_1x1_many_frames
00002239 l     O .rodata	00000400 expected_07
00002639 l     O .rodata	0000000b sprite_9x8
00002644 l     O .rodata	00000400 expected_08
00002a44 l     O .rodata	00000400 expected_09
00002e44 l     O .rodata	0000001a sprite_4x17
00002e5e l     O .rodata	00000400 expected_10
0000325e l     O .rodata	00000400 expected_11
0000365e l     O .rodata	0000020a sprite_130x9
00003868 l     O .rodata	00000400 expected_12
00003c68 l     O .rodata	00000041 sprite_7x65
00003ca9 l     O .rodata	00000400 expected_13
000040a9 l     O .rodata	00000400 expected_14
000044a9 l     O .rodata	00000400 expected_15
000048a9 l     O .rodata	00000400 expected_16
00004ca9 l     O .rodata	00000400 expected_17
000050a9 l     O .rodata	00000002 sprite_zero_width
000050ab l     O .rodata	00000400 expected_18
000054ab l     O .rodata	00000002 sprite_zero_height
000054ad l     O .rodata	00000400 expected_19
000064ad l     O .rodata	00000400 expected_20
000068ad l     O .rodata	00000400 expected_21
000058ad l     O .rodata	00000400 expected_22
00005cad l     O .rodata	00000400 expected_23
00000000 l    df *ABS*	00000000 runtime.c
00006cad l       .init_array	00000000 .hidden __init_array_end
00006cad l       .init_array	00000000 .hidden __init_array_start
00006cad l       .fini_array	00000000 .hidden __fini_array_start
00006cad l       .fini_array	00000000 .hidden __fini_array_end
00000100 g     F .text	0000001e _start
000001d7 g     F .text	0000073c avm_test_main
00000913 g     F .text	00000002 avm_halt
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
 e1 f5 07              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 ad 6c              ldi16	r4, 0x6cad
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 ad 6c              ldi16	r6, 0x6cad
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 ad 6c           ldi16	r0, 0x6cad
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 ad 6c           ldi16	r2, 0x6cad
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
 e1 81 fe              call16	-383
 c4 ad 6c              ldi16	r4, 0x6cad
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 ad 6c              ldi16	r6, 0x6cad
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 ad 6c           ldi16	r2, 0x6cad
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 ad 6c           ldi16	r0, 0x6cad
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
 e1 30 fe              call16	-464
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
 f2 39                 sub	r1, r1
 f0 04 00 05           ldi16	r0, 0x500
 f1 20                 mov	r4, r0
 a5                    xor	r5, r5
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 c6 15 09              ldi16	r6, 0x915
 c3 00                 ldi8	r7, 0x0
 c0 0a                 ldi8	r4, 0xa
 c1 08                 ldi8	r5, 0x8
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 20                 sys	draw_sprite_self_masked
 c6 ad 60              ldi16	r6, 0x60ad
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+79
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
 e0 db 04              jmp16	avm_test_main+1322
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 a5                 ldi8	r5, 0xa5
 d7 11                 sys	memset
 c6 15 09              ldi16	r6, 0x915
 c3 00                 ldi8	r7, 0x0
 c0 0a                 ldi8	r4, 0xa
 c1 08                 ldi8	r5, 0x8
 f2 67                 mov32	q1, q3
 c2 01                 ldi8	r6, 0x1
 d7 20                 sys	draw_sprite_self_masked
 c6 35 09              ldi16	r6, 0x935
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+157
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
 e0 8d 04              jmp16	avm_test_main+1322
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 3c                 ldi8	r5, 0x3c
 d7 11                 sys	memset
 c6 15 09              ldi16	r6, 0x915
 c3 00                 ldi8	r7, 0x0
 c0 1b                 ldi8	r4, 0x1b
 c1 03                 ldi8	r5, 0x3
 f2 67                 mov32	q1, q3
 c2 02                 ldi8	r6, 0x2
 d7 20                 sys	draw_sprite_self_masked
 c6 35 0d              ldi16	r6, 0xd35
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+235
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
 e0 3f 04              jmp16	avm_test_main+1322
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 96                 ldi8	r5, 0x96
 d7 11                 sys	memset
 c6 15 09              ldi16	r6, 0x915
 c3 00                 ldi8	r7, 0x0
 c4 fe ff              ldi16	r4, 0xfffe
 c1 13                 ldi8	r5, 0x13
 f2 67                 mov32	q1, q3
 c2 01                 ldi8	r6, 0x1
 d7 20                 sys	draw_sprite_self_masked
 c6 35 11              ldi16	r6, 0x1135
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+314
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
 e0 f0 03              jmp16	avm_test_main+1322
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 69                 ldi8	r5, 0x69
 d7 11                 sys	memset
 c6 15 09              ldi16	r6, 0x915
 c3 00                 ldi8	r7, 0x0
 c0 7e                 ldi8	r4, 0x7e
 c1 11                 ldi8	r5, 0x11
 f2 67                 mov32	q1, q3
 c2 02                 ldi8	r6, 0x2
 d7 20                 sys	draw_sprite_self_masked
 c6 35 15              ldi16	r6, 0x1535
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+392
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
 e0 a2 03              jmp16	avm_test_main+1322
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 c3                 ldi8	r5, 0xc3
 d7 11                 sys	memset
 c6 15 09              ldi16	r6, 0x915
 c3 00                 ldi8	r7, 0x0
 c0 28                 ldi8	r4, 0x28
 c5 fb ff              ldi16	r5, 0xfffb
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 20                 sys	draw_sprite_self_masked
 c6 35 19              ldi16	r6, 0x1935
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+470
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
 e0 54 03              jmp16	avm_test_main+1322
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 5a                 ldi8	r5, 0x5a
 d7 11                 sys	memset
 c6 15 09              ldi16	r6, 0x915
 c3 00                 ldi8	r7, 0x0
 c0 46                 ldi8	r4, 0x46
 c1 3a                 ldi8	r5, 0x3a
 f2 67                 mov32	q1, q3
 c2 01                 ldi8	r6, 0x1
 d7 20                 sys	draw_sprite_self_masked
 c6 35 1d              ldi16	r6, 0x1d35
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+548
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
 e0 06 03              jmp16	avm_test_main+1322
 f1 20                 mov	r4, r0
 a5                    xor	r5, r5
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 c6 35 21              ldi16	r6, 0x2135
 c3 00                 ldi8	r7, 0x0
 c0 7f                 ldi8	r4, 0x7f
 c1 3f                 ldi8	r5, 0x3f
 f2 67                 mov32	q1, q3
 c6 01 01              ldi16	r6, 0x101
 d7 20                 sys	draw_sprite_self_masked
 c6 39 22              ldi16	r6, 0x2239
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+621
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
 e0 bd 02              jmp16	avm_test_main+1322
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 3c                 ldi8	r5, 0x3c
 d7 11                 sys	memset
 c6 39 26              ldi16	r6, 0x2639
 c3 00                 ldi8	r7, 0x0
 c4 fc ff              ldi16	r4, 0xfffc
 c1 07                 ldi8	r5, 0x7
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 20                 sys	draw_sprite_self_masked
 c6 44 26              ldi16	r6, 0x2644
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+699
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
 e0 6f 02              jmp16	avm_test_main+1322
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 c3                 ldi8	r5, 0xc3
 d7 11                 sys	memset
 c6 39 26              ldi16	r6, 0x2639
 c3 00                 ldi8	r7, 0x0
 c0 7d                 ldi8	r4, 0x7d
 c1 3b                 ldi8	r5, 0x3b
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 20                 sys	draw_sprite_self_masked
 c6 44 2a              ldi16	r6, 0x2a44
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+776
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
 e0 22 02              jmp16	avm_test_main+1322
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 69                 ldi8	r5, 0x69
 d7 11                 sys	memset
 c6 44 2e              ldi16	r6, 0x2e44
 c3 00                 ldi8	r7, 0x0
 c0 14                 ldi8	r4, 0x14
 c5 f7 ff              ldi16	r5, 0xfff7
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 20                 sys	draw_sprite_self_masked
 c6 5e 2e              ldi16	r6, 0x2e5e
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+854
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
 c0 41                 ldi8	r4, 0x41
 e0 d4 01              jmp16	avm_test_main+1322
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 96                 ldi8	r5, 0x96
 d7 11                 sys	memset
 c6 44 2e              ldi16	r6, 0x2e44
 c3 00                 ldi8	r7, 0x0
 c0 14                 ldi8	r4, 0x14
 c1 37                 ldi8	r5, 0x37
 f2 67                 mov32	q1, q3
 c2 01                 ldi8	r6, 0x1
 d7 20                 sys	draw_sprite_self_masked
 c6 5e 32              ldi16	r6, 0x325e
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+932
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
 e0 86 01              jmp16	avm_test_main+1322
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 5a                 ldi8	r5, 0x5a
 d7 11                 sys	memset
 c6 5e 36              ldi16	r6, 0x365e
 c3 00                 ldi8	r7, 0x0
 c4 ff ff              ldi16	r4, 0xffff
 c1 1f                 ldi8	r5, 0x1f
 f2 67                 mov32	q1, q3
 c2 01                 ldi8	r6, 0x1
 d7 20                 sys	draw_sprite_self_masked
 c6 68 38              ldi16	r6, 0x3868
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+1011
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
 c0 43                 ldi8	r4, 0x43
 e0 37 01              jmp16	avm_test_main+1322
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 a5                 ldi8	r5, 0xa5
 d7 11                 sys	memset
 c6 68 3c              ldi16	r6, 0x3c68
 c3 00                 ldi8	r7, 0x0
 c0 3c                 ldi8	r4, 0x3c
 c5 ff ff              ldi16	r5, 0xffff
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 20                 sys	draw_sprite_self_masked
 c6 a9 3c              ldi16	r6, 0x3ca9
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+1089
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
 e0 e9 00              jmp16	avm_test_main+1322
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 3c                 ldi8	r5, 0x3c
 d7 11                 sys	memset
 c6 15 09              ldi16	r6, 0x915
 c3 00                 ldi8	r7, 0x0
 c0 80                 ldi8	r4, 0x80
 c1 0a                 ldi8	r5, 0xa
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 20                 sys	draw_sprite_self_masked
 c6 a9 40              ldi16	r6, 0x40a9
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 21                 breq8	avm_test_main+1166
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
 c0 45                 ldi8	r4, 0x45
 e0 9c 00              jmp16	avm_test_main+1322
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 c3                 ldi8	r5, 0xc3
 d7 11                 sys	memset
 c6 15 09              ldi16	r6, 0x915
 c3 00                 ldi8	r7, 0x0
 c4 fb ff              ldi16	r4, 0xfffb
 c1 0a                 ldi8	r5, 0xa
 f2 67                 mov32	q1, q3
 c2 01                 ldi8	r6, 0x1
 d7 20                 sys	draw_sprite_self_masked
 c6 a9 44              ldi16	r6, 0x44a9
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 20                 breq8	avm_test_main+1244
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
 d4 4e                 jmp8	avm_test_main+1322
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 69                 ldi8	r5, 0x69
 d7 11                 sys	memset
 c6 15 09              ldi16	r6, 0x915
 c3 00                 ldi8	r7, 0x0
 c0 0a                 ldi8	r4, 0xa
 c5 f3 ff              ldi16	r5, 0xfff3
 f2 67                 mov32	q1, q3
 c2 02                 ldi8	r6, 0x2
 d7 20                 sys	draw_sprite_self_masked
 c6 a9 48              ldi16	r6, 0x48a9
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 30                 breq8	avm_test_main+1338
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
 f0 01 01              ldi8	r1, 0x1
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 96                 ldi8	r5, 0x96
 d7 11                 sys	memset
 c6 15 09              ldi16	r6, 0x915
 c3 00                 ldi8	r7, 0x0
 c0 0a                 ldi8	r4, 0xa
 c1 40                 ldi8	r5, 0x40
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 20                 sys	draw_sprite_self_masked
 c6 a9 4c              ldi16	r6, 0x4ca9
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+1413
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
 e0 c5 fa              jmp16	avm_test_main+74
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 5a                 ldi8	r5, 0x5a
 d7 11                 sys	memset
 c6 a9 50              ldi16	r6, 0x50a9
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f2 67                 mov32	q1, q3
 c2 7b                 ldi8	r6, 0x7b
 d7 20                 sys	draw_sprite_self_masked
 c6 ab 50              ldi16	r6, 0x50ab
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+1487
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
 e0 15 fb              jmp16	avm_test_main+228
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 a5                 ldi8	r5, 0xa5
 d7 11                 sys	memset
 c6 ab 54              ldi16	r6, 0x54ab
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f2 67                 mov32	q1, q3
 c6 c8 01              ldi16	r6, 0x1c8
 d7 20                 sys	draw_sprite_self_masked
 c6 ad 54              ldi16	r6, 0x54ad
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+1562
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
 e0 19 fb              jmp16	avm_test_main+307
 f1 20                 mov	r4, r0
 a5                    xor	r5, r5
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 c6 5e 36              ldi16	r6, 0x365e
 c3 00                 ldi8	r7, 0x0
 c4 7f ff              ldi16	r4, 0xff7f
 c1 18                 ldi8	r5, 0x18
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 20                 sys	draw_sprite_self_masked
 c6 ad 64              ldi16	r6, 0x64ad
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+1632
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
 e0 21 fb              jmp16	avm_test_main+385
 f1 20                 mov	r4, r0
 a5                    xor	r5, r5
 c6 00 04              ldi16	r6, 0x400
 d7 11                 sys	memset
 c6 68 3c              ldi16	r6, 0x3c68
 c3 00                 ldi8	r7, 0x0
 c0 49                 ldi8	r4, 0x49
 c5 c0 ff              ldi16	r5, 0xffc0
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 20                 sys	draw_sprite_self_masked
 c6 ad 68              ldi16	r6, 0x68ad
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+1702
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
 e0 29 fb              jmp16	avm_test_main+463
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 55                 ldi8	r5, 0x55
 d7 11                 sys	memset
 c6 68 3c              ldi16	r6, 0x3c68
 c3 00                 ldi8	r7, 0x0
 c0 49                 ldi8	r4, 0x49
 c1 3f                 ldi8	r5, 0x3f
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 20                 sys	draw_sprite_self_masked
 c6 ad 58              ldi16	r6, 0x58ad
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 d0 1f                 breq8	avm_test_main+1777
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
 e0 2c fb              jmp16	avm_test_main+541
 f1 20                 mov	r4, r0
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 d7 11                 sys	memset
 f1 20                 mov	r4, r0
 c1 aa                 ldi8	r5, 0xaa
 d7 11                 sys	memset
 c6 5e 36              ldi16	r6, 0x365e
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 04                 ldi8	r5, 0x4
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 d7 20                 sys	draw_sprite_self_masked
 c6 ad 5c              ldi16	r6, 0x5cad
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 c5 00 04              ldi16	r5, 0x400
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 da 16 fe              breq16	avm_test_main+1331
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
 e0 2a fb              jmp16	avm_test_main+614

<avm_halt>:
 d4 fe                 jmp8	avm_halt
