
sprite_erase.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 sprite_erase.c
000007f7 l     F .text	00000024 prepare_framebuffer
000008e0 l     O .rodata	00000020 sprite_5x13
00000900 l     O .rodata	00000400 expected_00
0000081b l     F .text	00000019 framebuffer_matches
00000834 l     F .text	00000010 fail_case
00000d00 l     O .rodata	00000400 expected_01
00001100 l     O .rodata	00000400 expected_02
00001500 l     O .rodata	00000400 expected_03
00001900 l     O .rodata	00000400 expected_04
00001d00 l     O .rodata	00000400 expected_05
00002100 l     O .rodata	00000400 expected_06
00002500 l     O .rodata	00000104 sprite_1x1_many_frames
00002604 l     O .rodata	00000400 expected_07
00002a04 l     O .rodata	0000000b sprite_9x8
00002a0f l     O .rodata	00000400 expected_08
00002e0f l     O .rodata	00000400 expected_09
0000320f l     O .rodata	0000001a sprite_4x17
00003229 l     O .rodata	00000400 expected_10
00003629 l     O .rodata	00000400 expected_11
00003a29 l     O .rodata	0000020a sprite_130x9
00003c33 l     O .rodata	00000400 expected_12
00004033 l     O .rodata	00000041 sprite_7x65
00004074 l     O .rodata	00000400 expected_13
00004474 l     O .rodata	00000400 expected_14
00004874 l     O .rodata	00000400 expected_15
00004c74 l     O .rodata	00000400 expected_16
00005074 l     O .rodata	00000400 expected_17
00005474 l     O .rodata	00000002 sprite_zero_width
00005476 l     O .rodata	00000400 expected_18
00005876 l     O .rodata	00000002 sprite_zero_height
00005878 l     O .rodata	00000400 expected_19
00005c78 l     O .rodata	00000400 expected_20
00006078 l     O .rodata	00000400 expected_21
00006478 l     O .rodata	00000400 expected_22
00006878 l     O .rodata	00000400 expected_23
00000100 l     O .data	00000005 .L.str
00000844 l     F .text	00000019 test_line16
0000085d l     F .text	00000022 test_puts
0000087f l     F .text	0000000b test_putc
0000088a l     F .text	0000000f test_hex16
00000899 l     F .text	00000019 test_hex8
000008b2 l     F .text	0000002c test_hex_digit
00000000 l    df *ABS*	00000000 runtime.c
00006c78 l       .init_array	00000000 .hidden __init_array_end
00006c78 l       .init_array	00000000 .hidden __init_array_start
00006c78 l       .fini_array	00000000 .hidden __fini_array_start
00006c78 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000520 avm_test_main
000008de g     F .text	00000002 avm_halt
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
 e1 c0 06              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 78 6c              ldi16	r4, 0x6c78
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 78 6c              ldi16	r6, 0x6c78
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 78 6c           ldi16	r0, 0x6c78
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 78 6c           ldi16	r2, 0x6c78
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
 c4 78 6c              ldi16	r4, 0x6c78
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 78 6c              ldi16	r6, 0x6c78
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 78 6c           ldi16	r2, 0x6c78
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 78 6c           ldi16	r0, 0x6c78
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
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 c0 ff                 ldi8	r4, 0xff
 e1 18 05              call16	prepare_framebuffer
 c6 e0 08              ldi16	r6, 0x8e0
 c3 00                 ldi8	r7, 0x0
 f2 30                 sub	r0, r0
 c1 08                 ldi8	r5, 0x8
 c0 0a                 ldi8	r4, 0xa
 b2                    push16	r2
 b3                    push16	r3
 f1 16                 mov	r2, r6
 f1 1f                 mov	r3, r7
 f1 28                 mov	r6, r0
 d7 21                 sys	draw_sprite_erase
 c4 00 09              ldi16	r4, 0x900
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 bb                    pop16	r3
 ba                    pop16	r2
 e1 1b 05              call16	framebuffer_matches
 f6 2c                 tst16	r4
 d1 0b                 brne8	avm_test_main+56
 d4 00                 jmp8	avm_test_main+47
 a0                    xor	r4, r4
 e1 2a 05              call16	fail_case
 f4 40                 stsp16	[sp+0x0], r4
 e0 e2 04              jmp16	avm_test_main+1306
 c0 a5                 ldi8	r4, 0xa5
 e1 e3 04              call16	prepare_framebuffer
 c6 e0 08              ldi16	r6, 0x8e0
 c3 00                 ldi8	r7, 0x0
 f0 00 01              ldi8	r0, 0x1
 c1 08                 ldi8	r5, 0x8
 c0 0a                 ldi8	r4, 0xa
 b2                    push16	r2
 b3                    push16	r3
 f1 16                 mov	r2, r6
 f1 1f                 mov	r3, r7
 f1 28                 mov	r6, r0
 d7 21                 sys	draw_sprite_erase
 c4 00 0d              ldi16	r4, 0xd00
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 bb                    pop16	r3
 ba                    pop16	r2
 e1 e5 04              call16	framebuffer_matches
 f6 2c                 tst16	r4
 d1 0c                 brne8	avm_test_main+111
 d4 00                 jmp8	avm_test_main+101
 c0 01                 ldi8	r4, 0x1
 e1 f3 04              call16	fail_case
 f4 40                 stsp16	[sp+0x0], r4
 e0 ab 04              jmp16	avm_test_main+1306
 c0 3c                 ldi8	r4, 0x3c
 e1 ac 04              call16	prepare_framebuffer
 c6 e0 08              ldi16	r6, 0x8e0
 c3 00                 ldi8	r7, 0x0
 f0 00 02              ldi8	r0, 0x2
 c1 03                 ldi8	r5, 0x3
 c0 1b                 ldi8	r4, 0x1b
 b2                    push16	r2
 b3                    push16	r3
 f1 16                 mov	r2, r6
 f1 1f                 mov	r3, r7
 f1 28                 mov	r6, r0
 d7 21                 sys	draw_sprite_erase
 c4 00 11              ldi16	r4, 0x1100
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 bb                    pop16	r3
 ba                    pop16	r2
 e1 ae 04              call16	framebuffer_matches
 f6 2c                 tst16	r4
 d1 0c                 brne8	avm_test_main+166
 d4 00                 jmp8	avm_test_main+156
 c0 02                 ldi8	r4, 0x2
 e1 bc 04              call16	fail_case
 f4 40                 stsp16	[sp+0x0], r4
 e0 74 04              jmp16	avm_test_main+1306
 c0 96                 ldi8	r4, 0x96
 e1 75 04              call16	prepare_framebuffer
 c6 e0 08              ldi16	r6, 0x8e0
 c3 00                 ldi8	r7, 0x0
 f0 00 01              ldi8	r0, 0x1
 c1 13                 ldi8	r5, 0x13
 c4 fe ff              ldi16	r4, 0xfffe
 b2                    push16	r2
 b3                    push16	r3
 f1 16                 mov	r2, r6
 f1 1f                 mov	r3, r7
 f1 28                 mov	r6, r0
 d7 21                 sys	draw_sprite_erase
 c4 00 15              ldi16	r4, 0x1500
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 bb                    pop16	r3
 ba                    pop16	r2
 e1 76 04              call16	framebuffer_matches
 f6 2c                 tst16	r4
 d1 0c                 brne8	avm_test_main+222
 d4 00                 jmp8	avm_test_main+212
 c0 03                 ldi8	r4, 0x3
 e1 84 04              call16	fail_case
 f4 40                 stsp16	[sp+0x0], r4
 e0 3c 04              jmp16	avm_test_main+1306
 c0 69                 ldi8	r4, 0x69
 e1 3d 04              call16	prepare_framebuffer
 c6 e0 08              ldi16	r6, 0x8e0
 c3 00                 ldi8	r7, 0x0
 f0 00 02              ldi8	r0, 0x2
 c1 11                 ldi8	r5, 0x11
 c0 7e                 ldi8	r4, 0x7e
 b2                    push16	r2
 b3                    push16	r3
 f1 16                 mov	r2, r6
 f1 1f                 mov	r3, r7
 f1 28                 mov	r6, r0
 d7 21                 sys	draw_sprite_erase
 c4 00 19              ldi16	r4, 0x1900
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 bb                    pop16	r3
 ba                    pop16	r2
 e1 3f 04              call16	framebuffer_matches
 f6 2c                 tst16	r4
 d1 0c                 brne8	avm_test_main+277
 d4 00                 jmp8	avm_test_main+267
 c0 04                 ldi8	r4, 0x4
 e1 4d 04              call16	fail_case
 f4 40                 stsp16	[sp+0x0], r4
 e0 05 04              jmp16	avm_test_main+1306
 c0 c3                 ldi8	r4, 0xc3
 e1 06 04              call16	prepare_framebuffer
 c6 e0 08              ldi16	r6, 0x8e0
 c3 00                 ldi8	r7, 0x0
 f2 30                 sub	r0, r0
 c5 fb ff              ldi16	r5, 0xfffb
 c0 28                 ldi8	r4, 0x28
 b2                    push16	r2
 b3                    push16	r3
 f1 16                 mov	r2, r6
 f1 1f                 mov	r3, r7
 f1 28                 mov	r6, r0
 d7 21                 sys	draw_sprite_erase
 c4 00 1d              ldi16	r4, 0x1d00
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 bb                    pop16	r3
 ba                    pop16	r2
 e1 08 04              call16	framebuffer_matches
 f6 2c                 tst16	r4
 d1 0c                 brne8	avm_test_main+332
 d4 00                 jmp8	avm_test_main+322
 c0 05                 ldi8	r4, 0x5
 e1 16 04              call16	fail_case
 f4 40                 stsp16	[sp+0x0], r4
 e0 ce 03              jmp16	avm_test_main+1306
 c0 5a                 ldi8	r4, 0x5a
 e1 cf 03              call16	prepare_framebuffer
 c6 e0 08              ldi16	r6, 0x8e0
 c3 00                 ldi8	r7, 0x0
 f0 00 01              ldi8	r0, 0x1
 c1 3a                 ldi8	r5, 0x3a
 c0 46                 ldi8	r4, 0x46
 b2                    push16	r2
 b3                    push16	r3
 f1 16                 mov	r2, r6
 f1 1f                 mov	r3, r7
 f1 28                 mov	r6, r0
 d7 21                 sys	draw_sprite_erase
 c4 00 21              ldi16	r4, 0x2100
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 bb                    pop16	r3
 ba                    pop16	r2
 e1 d1 03              call16	framebuffer_matches
 f6 2c                 tst16	r4
 d1 0c                 brne8	avm_test_main+387
 d4 00                 jmp8	avm_test_main+377
 c0 06                 ldi8	r4, 0x6
 e1 df 03              call16	fail_case
 f4 40                 stsp16	[sp+0x0], r4
 e0 97 03              jmp16	avm_test_main+1306
 c0 ff                 ldi8	r4, 0xff
 e1 98 03              call16	prepare_framebuffer
 c6 00 25              ldi16	r6, 0x2500
 c3 00                 ldi8	r7, 0x0
 f0 04 01 01           ldi16	r0, 0x101
 c1 3f                 ldi8	r5, 0x3f
 c0 7f                 ldi8	r4, 0x7f
 b2                    push16	r2
 b3                    push16	r3
 f1 16                 mov	r2, r6
 f1 1f                 mov	r3, r7
 f1 28                 mov	r6, r0
 d7 21                 sys	draw_sprite_erase
 c4 04 26              ldi16	r4, 0x2604
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 bb                    pop16	r3
 ba                    pop16	r2
 e1 99 03              call16	framebuffer_matches
 f6 2c                 tst16	r4
 d1 0c                 brne8	avm_test_main+443
 d4 00                 jmp8	avm_test_main+433
 c0 07                 ldi8	r4, 0x7
 e1 a7 03              call16	fail_case
 f4 40                 stsp16	[sp+0x0], r4
 e0 5f 03              jmp16	avm_test_main+1306
 c0 3c                 ldi8	r4, 0x3c
 e1 60 03              call16	prepare_framebuffer
 c6 04 2a              ldi16	r6, 0x2a04
 c3 00                 ldi8	r7, 0x0
 f2 30                 sub	r0, r0
 c1 07                 ldi8	r5, 0x7
 c4 fc ff              ldi16	r4, 0xfffc
 b2                    push16	r2
 b3                    push16	r3
 f1 16                 mov	r2, r6
 f1 1f                 mov	r3, r7
 f1 28                 mov	r6, r0
 d7 21                 sys	draw_sprite_erase
 c4 0f 2a              ldi16	r4, 0x2a0f
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 bb                    pop16	r3
 ba                    pop16	r2
 e1 62 03              call16	framebuffer_matches
 f6 2c                 tst16	r4
 d1 0c                 brne8	avm_test_main+498
 d4 00                 jmp8	avm_test_main+488
 c0 08                 ldi8	r4, 0x8
 e1 70 03              call16	fail_case
 f4 40                 stsp16	[sp+0x0], r4
 e0 28 03              jmp16	avm_test_main+1306
 c0 c3                 ldi8	r4, 0xc3
 e1 29 03              call16	prepare_framebuffer
 c6 04 2a              ldi16	r6, 0x2a04
 c3 00                 ldi8	r7, 0x0
 f2 30                 sub	r0, r0
 c1 3b                 ldi8	r5, 0x3b
 c0 7d                 ldi8	r4, 0x7d
 b2                    push16	r2
 b3                    push16	r3
 f1 16                 mov	r2, r6
 f1 1f                 mov	r3, r7
 f1 28                 mov	r6, r0
 d7 21                 sys	draw_sprite_erase
 c4 0f 2e              ldi16	r4, 0x2e0f
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 bb                    pop16	r3
 ba                    pop16	r2
 e1 2c 03              call16	framebuffer_matches
 f6 2c                 tst16	r4
 d1 0c                 brne8	avm_test_main+552
 d4 00                 jmp8	avm_test_main+542
 c0 09                 ldi8	r4, 0x9
 e1 3a 03              call16	fail_case
 f4 40                 stsp16	[sp+0x0], r4
 e0 f2 02              jmp16	avm_test_main+1306
 c0 69                 ldi8	r4, 0x69
 e1 f3 02              call16	prepare_framebuffer
 c6 0f 32              ldi16	r6, 0x320f
 c3 00                 ldi8	r7, 0x0
 f2 30                 sub	r0, r0
 c5 f7 ff              ldi16	r5, 0xfff7
 c0 14                 ldi8	r4, 0x14
 b2                    push16	r2
 b3                    push16	r3
 f1 16                 mov	r2, r6
 f1 1f                 mov	r3, r7
 f1 28                 mov	r6, r0
 d7 21                 sys	draw_sprite_erase
 c4 29 32              ldi16	r4, 0x3229
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 bb                    pop16	r3
 ba                    pop16	r2
 e1 f5 02              call16	framebuffer_matches
 f6 2c                 tst16	r4
 d1 0c                 brne8	avm_test_main+607
 d4 00                 jmp8	avm_test_main+597
 c0 0a                 ldi8	r4, 0xa
 e1 03 03              call16	fail_case
 f4 40                 stsp16	[sp+0x0], r4
 e0 bb 02              jmp16	avm_test_main+1306
 c0 96                 ldi8	r4, 0x96
 e1 bc 02              call16	prepare_framebuffer
 c6 0f 32              ldi16	r6, 0x320f
 c3 00                 ldi8	r7, 0x0
 f0 00 01              ldi8	r0, 0x1
 c1 37                 ldi8	r5, 0x37
 c0 14                 ldi8	r4, 0x14
 b2                    push16	r2
 b3                    push16	r3
 f1 16                 mov	r2, r6
 f1 1f                 mov	r3, r7
 f1 28                 mov	r6, r0
 d7 21                 sys	draw_sprite_erase
 c4 29 36              ldi16	r4, 0x3629
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 bb                    pop16	r3
 ba                    pop16	r2
 e1 be 02              call16	framebuffer_matches
 f6 2c                 tst16	r4
 d1 0c                 brne8	avm_test_main+662
 d4 00                 jmp8	avm_test_main+652
 c0 0b                 ldi8	r4, 0xb
 e1 cc 02              call16	fail_case
 f4 40                 stsp16	[sp+0x0], r4
 e0 84 02              jmp16	avm_test_main+1306
 c0 5a                 ldi8	r4, 0x5a
 e1 85 02              call16	prepare_framebuffer
 c6 29 3a              ldi16	r6, 0x3a29
 c3 00                 ldi8	r7, 0x0
 f0 00 01              ldi8	r0, 0x1
 c1 1f                 ldi8	r5, 0x1f
 c4 ff ff              ldi16	r4, 0xffff
 b2                    push16	r2
 b3                    push16	r3
 f1 16                 mov	r2, r6
 f1 1f                 mov	r3, r7
 f1 28                 mov	r6, r0
 d7 21                 sys	draw_sprite_erase
 c4 33 3c              ldi16	r4, 0x3c33
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 bb                    pop16	r3
 ba                    pop16	r2
 e1 86 02              call16	framebuffer_matches
 f6 2c                 tst16	r4
 d1 0c                 brne8	avm_test_main+718
 d4 00                 jmp8	avm_test_main+708
 c0 0c                 ldi8	r4, 0xc
 e1 94 02              call16	fail_case
 f4 40                 stsp16	[sp+0x0], r4
 e0 4c 02              jmp16	avm_test_main+1306
 c0 a5                 ldi8	r4, 0xa5
 e1 4d 02              call16	prepare_framebuffer
 c6 33 40              ldi16	r6, 0x4033
 c3 00                 ldi8	r7, 0x0
 f2 30                 sub	r0, r0
 c5 ff ff              ldi16	r5, 0xffff
 c0 3c                 ldi8	r4, 0x3c
 b2                    push16	r2
 b3                    push16	r3
 f1 16                 mov	r2, r6
 f1 1f                 mov	r3, r7
 f1 28                 mov	r6, r0
 d7 21                 sys	draw_sprite_erase
 c4 74 40              ldi16	r4, 0x4074
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 bb                    pop16	r3
 ba                    pop16	r2
 e1 4f 02              call16	framebuffer_matches
 f6 2c                 tst16	r4
 d1 0c                 brne8	avm_test_main+773
 d4 00                 jmp8	avm_test_main+763
 c0 0d                 ldi8	r4, 0xd
 e1 5d 02              call16	fail_case
 f4 40                 stsp16	[sp+0x0], r4
 e0 15 02              jmp16	avm_test_main+1306
 c0 3c                 ldi8	r4, 0x3c
 e1 16 02              call16	prepare_framebuffer
 c6 e0 08              ldi16	r6, 0x8e0
 c3 00                 ldi8	r7, 0x0
 f2 30                 sub	r0, r0
 c1 0a                 ldi8	r5, 0xa
 c0 80                 ldi8	r4, 0x80
 b2                    push16	r2
 b3                    push16	r3
 f1 16                 mov	r2, r6
 f1 1f                 mov	r3, r7
 f1 28                 mov	r6, r0
 d7 21                 sys	draw_sprite_erase
 c4 74 44              ldi16	r4, 0x4474
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 bb                    pop16	r3
 ba                    pop16	r2
 e1 19 02              call16	framebuffer_matches
 f6 2c                 tst16	r4
 d1 0c                 brne8	avm_test_main+827
 d4 00                 jmp8	avm_test_main+817
 c0 0e                 ldi8	r4, 0xe
 e1 27 02              call16	fail_case
 f4 40                 stsp16	[sp+0x0], r4
 e0 df 01              jmp16	avm_test_main+1306
 c0 c3                 ldi8	r4, 0xc3
 e1 e0 01              call16	prepare_framebuffer
 c6 e0 08              ldi16	r6, 0x8e0
 c3 00                 ldi8	r7, 0x0
 f0 00 01              ldi8	r0, 0x1
 c1 0a                 ldi8	r5, 0xa
 c4 fb ff              ldi16	r4, 0xfffb
 b2                    push16	r2
 b3                    push16	r3
 f1 16                 mov	r2, r6
 f1 1f                 mov	r3, r7
 f1 28                 mov	r6, r0
 d7 21                 sys	draw_sprite_erase
 c4 74 48              ldi16	r4, 0x4874
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 bb                    pop16	r3
 ba                    pop16	r2
 e1 e1 01              call16	framebuffer_matches
 f6 2c                 tst16	r4
 d1 0c                 brne8	avm_test_main+883
 d4 00                 jmp8	avm_test_main+873
 c0 0f                 ldi8	r4, 0xf
 e1 ef 01              call16	fail_case
 f4 40                 stsp16	[sp+0x0], r4
 e0 a7 01              jmp16	avm_test_main+1306
 c0 69                 ldi8	r4, 0x69
 e1 a8 01              call16	prepare_framebuffer
 c6 e0 08              ldi16	r6, 0x8e0
 c3 00                 ldi8	r7, 0x0
 f0 00 02              ldi8	r0, 0x2
 c5 f3 ff              ldi16	r5, 0xfff3
 c0 0a                 ldi8	r4, 0xa
 b2                    push16	r2
 b3                    push16	r3
 f1 16                 mov	r2, r6
 f1 1f                 mov	r3, r7
 f1 28                 mov	r6, r0
 d7 21                 sys	draw_sprite_erase
 c4 74 4c              ldi16	r4, 0x4c74
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 bb                    pop16	r3
 ba                    pop16	r2
 e1 a9 01              call16	framebuffer_matches
 f6 2c                 tst16	r4
 d1 0c                 brne8	avm_test_main+939
 d4 00                 jmp8	avm_test_main+929
 c0 10                 ldi8	r4, 0x10
 e1 b7 01              call16	fail_case
 f4 40                 stsp16	[sp+0x0], r4
 e0 6f 01              jmp16	avm_test_main+1306
 c0 96                 ldi8	r4, 0x96
 e1 70 01              call16	prepare_framebuffer
 c6 e0 08              ldi16	r6, 0x8e0
 c3 00                 ldi8	r7, 0x0
 f2 30                 sub	r0, r0
 c1 40                 ldi8	r5, 0x40
 c0 0a                 ldi8	r4, 0xa
 b2                    push16	r2
 b3                    push16	r3
 f1 16                 mov	r2, r6
 f1 1f                 mov	r3, r7
 f1 28                 mov	r6, r0
 d7 21                 sys	draw_sprite_erase
 c4 74 50              ldi16	r4, 0x5074
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 bb                    pop16	r3
 ba                    pop16	r2
 e1 73 01              call16	framebuffer_matches
 f6 2c                 tst16	r4
 d1 0c                 brne8	avm_test_main+993
 d4 00                 jmp8	avm_test_main+983
 c0 11                 ldi8	r4, 0x11
 e1 81 01              call16	fail_case
 f4 40                 stsp16	[sp+0x0], r4
 e0 39 01              jmp16	avm_test_main+1306
 c0 5a                 ldi8	r4, 0x5a
 e1 3a 01              call16	prepare_framebuffer
 c6 74 54              ldi16	r6, 0x5474
 c3 00                 ldi8	r7, 0x0
 c1 7b                 ldi8	r5, 0x7b
 a0                    xor	r4, r4
 b2                    push16	r2
 b3                    push16	r3
 f1 16                 mov	r2, r6
 f1 1f                 mov	r3, r7
 09                    mov	r6, r5
 04                    mov	r5, r4
 d7 21                 sys	draw_sprite_erase
 c4 76 54              ldi16	r4, 0x5476
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 bb                    pop16	r3
 ba                    pop16	r2
 e1 40 01              call16	framebuffer_matches
 f6 2c                 tst16	r4
 d1 0c                 brne8	avm_test_main+1044
 d4 00                 jmp8	avm_test_main+1034
 c0 12                 ldi8	r4, 0x12
 e1 4e 01              call16	fail_case
 f4 40                 stsp16	[sp+0x0], r4
 e0 06 01              jmp16	avm_test_main+1306
 c0 a5                 ldi8	r4, 0xa5
 e1 07 01              call16	prepare_framebuffer
 c6 76 58              ldi16	r6, 0x5876
 c3 00                 ldi8	r7, 0x0
 c5 c8 01              ldi16	r5, 0x1c8
 a0                    xor	r4, r4
 b2                    push16	r2
 b3                    push16	r3
 f1 16                 mov	r2, r6
 f1 1f                 mov	r3, r7
 09                    mov	r6, r5
 04                    mov	r5, r4
 d7 21                 sys	draw_sprite_erase
 c4 78 58              ldi16	r4, 0x5878
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 bb                    pop16	r3
 ba                    pop16	r2
 e1 0c 01              call16	framebuffer_matches
 f6 2c                 tst16	r4
 d1 0c                 brne8	avm_test_main+1096
 d4 00                 jmp8	avm_test_main+1086
 c0 13                 ldi8	r4, 0x13
 e1 1a 01              call16	fail_case
 f4 40                 stsp16	[sp+0x0], r4
 e0 d2 00              jmp16	avm_test_main+1306
 c0 ff                 ldi8	r4, 0xff
 e1 d3 00              call16	prepare_framebuffer
 c6 29 3a              ldi16	r6, 0x3a29
 c3 00                 ldi8	r7, 0x0
 f2 30                 sub	r0, r0
 c1 18                 ldi8	r5, 0x18
 c4 7f ff              ldi16	r4, 0xff7f
 b2                    push16	r2
 b3                    push16	r3
 f1 16                 mov	r2, r6
 f1 1f                 mov	r3, r7
 f1 28                 mov	r6, r0
 d7 21                 sys	draw_sprite_erase
 c4 78 5c              ldi16	r4, 0x5c78
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 bb                    pop16	r3
 ba                    pop16	r2
 e1 d5 00              call16	framebuffer_matches
 f6 2c                 tst16	r4
 d1 0c                 brne8	avm_test_main+1151
 d4 00                 jmp8	avm_test_main+1141
 c0 14                 ldi8	r4, 0x14
 e1 e3 00              call16	fail_case
 f4 40                 stsp16	[sp+0x0], r4
 e0 9b 00              jmp16	avm_test_main+1306
 c0 0f                 ldi8	r4, 0xf
 e1 9c 00              call16	prepare_framebuffer
 c6 33 40              ldi16	r6, 0x4033
 c3 00                 ldi8	r7, 0x0
 f2 30                 sub	r0, r0
 c5 c0 ff              ldi16	r5, 0xffc0
 c0 49                 ldi8	r4, 0x49
 b2                    push16	r2
 b3                    push16	r3
 f1 16                 mov	r2, r6
 f1 1f                 mov	r3, r7
 f1 28                 mov	r6, r0
 d7 21                 sys	draw_sprite_erase
 c4 78 60              ldi16	r4, 0x6078
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 bb                    pop16	r3
 ba                    pop16	r2
 e1 9e 00              call16	framebuffer_matches
 f6 2c                 tst16	r4
 d1 0b                 brne8	avm_test_main+1205
 d4 00                 jmp8	avm_test_main+1196
 c0 15                 ldi8	r4, 0x15
 e1 ac 00              call16	fail_case
 f4 40                 stsp16	[sp+0x0], r4
 d4 65                 jmp8	avm_test_main+1306
 c0 ff                 ldi8	r4, 0xff
 d5 67                 call8	prepare_framebuffer
 c6 33 40              ldi16	r6, 0x4033
 c3 00                 ldi8	r7, 0x0
 f2 30                 sub	r0, r0
 c1 3f                 ldi8	r5, 0x3f
 c0 49                 ldi8	r4, 0x49
 b2                    push16	r2
 b3                    push16	r3
 f1 16                 mov	r2, r6
 f1 1f                 mov	r3, r7
 f1 28                 mov	r6, r0
 d7 21                 sys	draw_sprite_erase
 c4 78 64              ldi16	r4, 0x6478
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 bb                    pop16	r3
 ba                    pop16	r2
 d5 6b                 call8	framebuffer_matches
 f6 2c                 tst16	r4
 d1 0a                 brne8	avm_test_main+1255
 d4 00                 jmp8	avm_test_main+1247
 c0 16                 ldi8	r4, 0x16
 d5 7a                 call8	fail_case
 f4 40                 stsp16	[sp+0x0], r4
 d4 33                 jmp8	avm_test_main+1306
 c0 aa                 ldi8	r4, 0xaa
 d5 35                 call8	prepare_framebuffer
 c6 29 3a              ldi16	r6, 0x3a29
 c3 00                 ldi8	r7, 0x0
 c1 04                 ldi8	r5, 0x4
 a0                    xor	r4, r4
 b2                    push16	r2
 b3                    push16	r3
 f1 16                 mov	r2, r6
 f1 1f                 mov	r3, r7
 08                    mov	r6, r4
 d7 21                 sys	draw_sprite_erase
 c4 78 68              ldi16	r4, 0x6878
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 bb                    pop16	r3
 ba                    pop16	r2
 d5 3d                 call8	framebuffer_matches
 f6 2c                 tst16	r4
 d1 0a                 brne8	avm_test_main+1301
 d4 00                 jmp8	avm_test_main+1293
 c0 17                 ldi8	r4, 0x17
 d5 4c                 call8	fail_case
 f4 40                 stsp16	[sp+0x0], r4
 d4 05                 jmp8	avm_test_main+1306
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	avm_test_main+1306
 f4 00                 ldsp16	r4, [sp+0x0]
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 ef                    ret

<prepare_framebuffer>:
 d6 ff                 adjsp	-0x1
 f1 30                 stsp8	[sp+0x0], r4
 c6 00 04              ldi16	r6, 0x400
 a5                    xor	r5, r5
 c4 00 05              ldi16	r4, 0x500
 d7 11                 sys	memset
 f3 40                 ldsp8u	r4, [sp+0x0]
 f4 a4                 tst8	r4
 d0 0e                 breq8	prepare_framebuffer+33
 d4 00                 jmp8	prepare_framebuffer+21
 f3 41                 ldsp8u	r5, [sp+0x0]
 c6 00 04              ldi16	r6, 0x400
 c4 00 05              ldi16	r4, 0x500
 d7 11                 sys	memset
 d4 00                 jmp8	prepare_framebuffer+33
 d6 01                 adjsp	0x1
 ef                    ret

<framebuffer_matches>:
 d6 fd                 adjsp	-0x3
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f3 4b                 ldsp8u	r7, [sp+0x2]
 c5 00 04              ldi16	r5, 0x400
 c4 00 05              ldi16	r4, 0x500
 d7 13                 sys	memcmp_p
 f6 2c                 tst16	r4
 f8 04                 cset.eq	r4
 d6 03                 adjsp	0x3
 ef                    ret

<fail_case>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 01                 ldsp16	r5, [sp+0x0]
 c4 00 01              ldi16	r4, 0x100
 d5 05                 call8	test_line16
 c0 01                 ldi8	r4, 0x1
 d6 02                 adjsp	0x2
 ef                    ret

<test_line16>:
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f4 41                 stsp16	[sp+0x0], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 d5 0f                 call8	test_puts
 c0 3d                 ldi8	r4, 0x3d
 d5 2d                 call8	test_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d5 34                 call8	test_hex16
 c0 0a                 ldi8	r4, 0xa
 d5 25                 call8	test_putc
 d6 04                 adjsp	0x4
 ef                    ret

<test_puts>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	test_puts+6
 f4 00                 ldsp16	r4, [sp+0x0]
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 f4 a4                 tst8	r4
 d0 10                 breq8	test_puts+31
 d4 00                 jmp8	test_puts+17
 f4 00                 ldsp16	r4, [sp+0x0]
 04                    mov	r5, r4
 f4 ad                 inc16	r5
 f4 41                 stsp16	[sp+0x0], r5
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 d5 05                 call8	test_putc
 d4 e7                 jmp8	test_puts+6
 d6 02                 adjsp	0x2
 ef                    ret

<test_putc>:
 d6 ff                 adjsp	-0x1
 f1 30                 stsp8	[sp+0x0], r4
 f3 40                 ldsp8u	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 d6 01                 adjsp	0x1
 ef                    ret

<test_hex16>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f3 44                 ldsp8u	r4, [sp+0x1]
 d5 07                 call8	test_hex8
 f3 40                 ldsp8u	r4, [sp+0x0]
 d5 03                 call8	test_hex8
 d6 02                 adjsp	0x2
 ef                    ret

<test_hex8>:
 d6 ff                 adjsp	-0x1
 f1 30                 stsp8	[sp+0x0], r4
 f3 40                 ldsp8u	r4, [sp+0x0]
 fa 74                 lsr16i	r4, 0x4
 d5 0f                 call8	test_hex_digit
 f6 44                 sext8	r4
 d5 d8                 call8	test_putc
 f3 40                 ldsp8u	r4, [sp+0x0]
 d5 07                 call8	test_hex_digit
 f6 44                 sext8	r4
 d5 d0                 call8	test_putc
 d6 01                 adjsp	0x1
 ef                    ret

<test_hex_digit>:
 d6 fd                 adjsp	-0x3
 f1 38                 stsp8	[sp+0x2], r4
 f3 48                 ldsp8u	r4, [sp+0x2]
 c1 0f                 ldi8	r5, 0xf
 81                    and	r4, r5
 f1 38                 stsp8	[sp+0x2], r4
 f3 48                 ldsp8u	r4, [sp+0x2]
 cc 0a                 cmpi.s8	r4, 0xa
 d9 0c                 brsge8	test_hex_digit+29
 d4 00                 jmp8	test_hex_digit+19
 f3 48                 ldsp8u	r4, [sp+0x2]
 c8 30                 addi.s8	r4, 0x30
 f1 74                 zext8	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 0a                 jmp8	test_hex_digit+39
 f3 48                 ldsp8u	r4, [sp+0x2]
 c8 37                 addi.s8	r4, 0x37
 f1 74                 zext8	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	test_hex_digit+39
 f4 00                 ldsp16	r4, [sp+0x0]
 d6 03                 adjsp	0x3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
