
draw_text_clipping.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 draw_text_clipping.c
00000530 l     F .text	0000045f check_case
00000ac5 l     O .rodata	00000022 multi_page_font
00000aad l     O .rodata	00000018 single_page_font
00000110 l     O .data	00000002 ram_b
00000ae9 l     O .rodata	00000002 program_b
00000100 l     O .data	00000003 format_one
00000115 l     O .data	00000003 ram_ba
00000aee l     O .rodata	00000003 program_ba
00000112 l     O .data	00000003 ram_ab
0000010e l     O .data	00000002 ram_a
00000aeb l     O .rodata	00000003 program_ab
00000ae7 l     O .rodata	00000002 program_a
00000103 l     O .data	00000005 format_two
00000118 l     O .data	00000004 ram_a_newline_b
00000af1 l     O .rodata	00000004 program_a_newline_b
00000108 l     O .data	00000006 format_newline
000009bb l     F .text	00000013 logical_length
000009ce l     F .text	0000002f logical_char
000009fd l     F .text	00000064 reference_glyph
0000011c l     O .data	00000005 .L.str
00000a61 l     F .text	00000026 test_line16
00000121 l     O .data	00000006 .L.str.1
00000127 l     O .data	00000005 .L.str.2
0000012c l     O .data	00000006 .L.str.3
00000132 l     O .data	00000005 .L.str.4
0000098f l     F .text	0000002c fail_byte
0000013a l     O .data	00000004 single_b_image
00000137 l     O .data	00000003 single_a_image
0000013e l     O .data	00000008 multi_a_image
00000146 l     O .data	00000009 multi_b_image
0000014f l     O .data	00000005 .L.str.5
00000154 l     O .data	00000005 .L.str.6
00000159 l     O .data	00000004 .L.str.7
00000a87 l     F .text	00000024 test_hex8
00000000 l    df *ABS*	00000000 runtime.c
00000af5 l       .init_array	00000000 .hidden __init_array_end
00000af5 l       .init_array	00000000 .hidden __init_array_start
00000af5 l       .fini_array	00000000 .hidden __fini_array_start
00000af5 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000259 avm_test_main
00000aab g     F .text	00000002 avm_halt
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
 e1 8d 08              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 f5 0a              ldi16	r4, 0xaf5
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 f5 0a              ldi16	r6, 0xaf5
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 f5 0a           ldi16	r0, 0xaf5
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 f5 0a           ldi16	r2, 0xaf5
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
 c4 f5 0a              ldi16	r4, 0xaf5
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 f5 0a              ldi16	r6, 0xaf5
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 f5 0a           ldi16	r2, 0xaf5
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 f5 0a           ldi16	r0, 0xaf5
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
 d6 fa                 adjsp	-0x6
 c0 31                 ldi8	r4, 0x31
 f1 44                 stsp8	[sp+0x5], r4
 c0 06                 ldi8	r4, 0x6
 c1 0c                 ldi8	r5, 0xc
 f4 44                 stsp16	[sp+0x1], r4
 f4 4d                 stsp16	[sp+0x3], r5
 f0 01 02              ldi8	r1, 0x2
 f0 29 00              stsp8	[sp+0x0], r1
 a0                    xor	r4, r4
 04                    mov	r5, r4
 08                    mov	r6, r4
 0c                    mov	r7, r4
 e1 3a 02              call16	check_case
 d6 06                 adjsp	0x6
 f4 a4                 tst8	r4
 d0 06                 breq8	avm_test_main+43
 f0 00 01              ldi8	r0, 0x1
 e0 27 02              jmp16	avm_test_main+594
 d6 fa                 adjsp	-0x6
 c0 c7                 ldi8	r4, 0xc7
 f1 44                 stsp8	[sp+0x5], r4
 c4 fe ff              ldi16	r4, 0xfffe
 c1 09                 ldi8	r5, 0x9
 f4 44                 stsp16	[sp+0x1], r4
 f4 4d                 stsp16	[sp+0x3], r5
 f0 29 00              stsp8	[sp+0x0], r1
 a5                    xor	r5, r5
 f0 00 01              ldi8	r0, 0x1
 f1 20                 mov	r4, r0
 f1 29                 mov	r6, r1
 f1 2c                 mov	r7, r0
 e1 0f 02              call16	check_case
 d6 06                 adjsp	0x6
 f4 a4                 tst8	r4
 db 01 02              brne16	avm_test_main+594
 d6 fa                 adjsp	-0x6
 c0 5a                 ldi8	r4, 0x5a
 f1 44                 stsp8	[sp+0x5], r4
 c0 7d                 ldi8	r4, 0x7d
 c1 0b                 ldi8	r5, 0xb
 f4 44                 stsp16	[sp+0x1], r4
 f4 4d                 stsp16	[sp+0x3], r5
 c2 03                 ldi8	r6, 0x3
 f1 32                 stsp8	[sp+0x0], r6
 f2 39                 sub	r1, r1
 c0 02                 ldi8	r4, 0x2
 f1 25                 mov	r5, r1
 0c                    mov	r7, r4
 e1 ec 01              call16	check_case
 d6 06                 adjsp	0x6
 f4 a4                 tst8	r4
 db de 01              brne16	avm_test_main+594
 d6 fa                 adjsp	-0x6
 c0 96                 ldi8	r4, 0x96
 f1 44                 stsp8	[sp+0x5], r4
 c0 1f                 ldi8	r4, 0x1f
 c1 03                 ldi8	r5, 0x3
 f4 44                 stsp16	[sp+0x1], r4
 f4 4d                 stsp16	[sp+0x3], r5
 f0 29 00              stsp8	[sp+0x0], r1
 f0 02 03              ldi8	r2, 0x3
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 f1 29                 mov	r6, r1
 f1 2d                 mov	r7, r1
 e1 c6 01              call16	check_case
 d6 06                 adjsp	0x6
 f4 a4                 tst8	r4
 db b8 01              brne16	avm_test_main+594
 d6 fa                 adjsp	-0x6
 c0 a5                 ldi8	r4, 0xa5
 f1 44                 stsp8	[sp+0x5], r4
 c0 4b                 ldi8	r4, 0x4b
 c1 3f                 ldi8	r5, 0x3f
 f4 44                 stsp16	[sp+0x1], r4
 f4 4d                 stsp16	[sp+0x3], r5
 f0 00 01              ldi8	r0, 0x1
 f0 28 00              stsp8	[sp+0x0], r0
 f0 01 04              ldi8	r1, 0x4
 a5                    xor	r5, r5
 c2 02                 ldi8	r6, 0x2
 f1 21                 mov	r4, r1
 f1 2c                 mov	r7, r0
 e1 9e 01              call16	check_case
 d6 06                 adjsp	0x6
 f4 a4                 tst8	r4
 db 90 01              brne16	avm_test_main+594
 d6 fa                 adjsp	-0x6
 c0 69                 ldi8	r4, 0x69
 f1 44                 stsp8	[sp+0x5], r4
 c4 fd ff              ldi16	r4, 0xfffd
 c1 02                 ldi8	r5, 0x2
 f4 44                 stsp16	[sp+0x1], r4
 f4 4d                 stsp16	[sp+0x3], r5
 f0 2a 00              stsp8	[sp+0x0], r2
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f0 03 02              ldi8	r3, 0x2
 f1 2a                 mov	r6, r2
 f1 2f                 mov	r7, r3
 e1 78 01              call16	check_case
 d6 06                 adjsp	0x6
 f4 a4                 tst8	r4
 db 6a 01              brne16	avm_test_main+594
 d6 fa                 adjsp	-0x6
 c0 3c                 ldi8	r4, 0x3c
 f1 44                 stsp8	[sp+0x5], r4
 c0 08                 ldi8	r4, 0x8
 c1 18                 ldi8	r5, 0x18
 f4 44                 stsp16	[sp+0x1], r4
 f4 4d                 stsp16	[sp+0x3], r5
 f0 2b 00              stsp8	[sp+0x0], r3
 c0 06                 ldi8	r4, 0x6
 f0 00 01              ldi8	r0, 0x1
 aa                    xor	r6, r6
 f1 24                 mov	r5, r0
 0e                    mov	r7, r6
 e1 54 01              call16	check_case
 d6 06                 adjsp	0x6
 f4 a4                 tst8	r4
 db 46 01              brne16	avm_test_main+594
 d6 fa                 adjsp	-0x6
 c0 c3                 ldi8	r4, 0xc3
 f1 44                 stsp8	[sp+0x5], r4
 c4 fe ff              ldi16	r4, 0xfffe
 c1 16                 ldi8	r5, 0x16
 f4 44                 stsp16	[sp+0x1], r4
 f4 4d                 stsp16	[sp+0x3], r5
 f0 2b 00              stsp8	[sp+0x0], r3
 c0 07                 ldi8	r4, 0x7
 f0 00 01              ldi8	r0, 0x1
 f1 24                 mov	r5, r0
 f1 2b                 mov	r6, r3
 f1 2c                 mov	r7, r0
 e1 2d 01              call16	check_case
 d6 06                 adjsp	0x6
 f4 a4                 tst8	r4
 db 1f 01              brne16	avm_test_main+594
 d6 fa                 adjsp	-0x6
 c0 55                 ldi8	r4, 0x55
 f1 44                 stsp8	[sp+0x5], r4
 c0 7d                 ldi8	r4, 0x7d
 c1 18                 ldi8	r5, 0x18
 f4 44                 stsp16	[sp+0x1], r4
 f4 4d                 stsp16	[sp+0x3], r5
 f0 2a 00              stsp8	[sp+0x0], r2
 c0 08                 ldi8	r4, 0x8
 f0 00 01              ldi8	r0, 0x1
 c3 02                 ldi8	r7, 0x2
 f1 24                 mov	r5, r0
 f1 2a                 mov	r6, r2
 e1 07 01              call16	check_case
 d6 06                 adjsp	0x6
 f4 a4                 tst8	r4
 db f9 00              brne16	avm_test_main+594
 d6 fa                 adjsp	-0x6
 c0 aa                 ldi8	r4, 0xaa
 f1 44                 stsp8	[sp+0x5], r4
 c0 30                 ldi8	r4, 0x30
 c1 05                 ldi8	r5, 0x5
 f4 44                 stsp16	[sp+0x1], r4
 f4 4d                 stsp16	[sp+0x3], r5
 aa                    xor	r6, r6
 f1 32                 stsp8	[sp+0x0], r6
 c0 09                 ldi8	r4, 0x9
 f0 00 01              ldi8	r0, 0x1
 f1 24                 mov	r5, r0
 0e                    mov	r7, r6
 e1 e4 00              call16	check_case
 d6 06                 adjsp	0x6
 f4 a4                 tst8	r4
 db d6 00              brne16	avm_test_main+594
 d6 fa                 adjsp	-0x6
 c0 0f                 ldi8	r4, 0xf
 f1 44                 stsp8	[sp+0x5], r4
 c0 40                 ldi8	r4, 0x40
 c1 3c                 ldi8	r5, 0x3c
 f4 44                 stsp16	[sp+0x1], r4
 f4 4d                 stsp16	[sp+0x3], r5
 f0 00 01              ldi8	r0, 0x1
 f0 28 00              stsp8	[sp+0x0], r0
 c0 0a                 ldi8	r4, 0xa
 f0 02 02              ldi8	r2, 0x2
 f1 24                 mov	r5, r0
 f1 2a                 mov	r6, r2
 f1 2c                 mov	r7, r0
 e1 bb 00              call16	check_case
 d6 06                 adjsp	0x6
 f4 a4                 tst8	r4
 db ad 00              brne16	avm_test_main+594
 d6 fa                 adjsp	-0x6
 c0 f0                 ldi8	r4, 0xf0
 f1 44                 stsp8	[sp+0x5], r4
 c0 7e                 ldi8	r4, 0x7e
 c1 3d                 ldi8	r5, 0x3d
 f4 44                 stsp16	[sp+0x1], r4
 f4 4d                 stsp16	[sp+0x3], r5
 f0 2a 00              stsp8	[sp+0x0], r2
 c0 0b                 ldi8	r4, 0xb
 f0 00 01              ldi8	r0, 0x1
 c2 03                 ldi8	r6, 0x3
 f1 24                 mov	r5, r0
 f1 2e                 mov	r7, r2
 e1 95 00              call16	check_case
 d6 06                 adjsp	0x6
 f4 a4                 tst8	r4
 db 87 00              brne16	avm_test_main+594
 d6 fa                 adjsp	-0x6
 c0 87                 ldi8	r4, 0x87
 f1 44                 stsp8	[sp+0x5], r4
 c0 14                 ldi8	r4, 0x14
 c1 0e                 ldi8	r5, 0xe
 f4 44                 stsp16	[sp+0x1], r4
 f4 4d                 stsp16	[sp+0x3], r5
 f0 29 00              stsp8	[sp+0x0], r1
 c0 0c                 ldi8	r4, 0xc
 f0 00 01              ldi8	r0, 0x1
 aa                    xor	r6, r6
 f1 24                 mov	r5, r0
 0e                    mov	r7, r6
 d5 72                 call8	check_case
 d6 06                 adjsp	0x6
 f4 a4                 tst8	r4
 d1 65                 brne8	avm_test_main+594
 d6 fa                 adjsp	-0x6
 c0 78                 ldi8	r4, 0x78
 f1 44                 stsp8	[sp+0x5], r4
 c0 0c                 ldi8	r4, 0xc
 c5 ec ff              ldi16	r5, 0xffec
 f4 44                 stsp16	[sp+0x1], r4
 f4 4d                 stsp16	[sp+0x3], r5
 f0 2a 00              stsp8	[sp+0x0], r2
 c0 0d                 ldi8	r4, 0xd
 f0 00 01              ldi8	r0, 0x1
 f1 24                 mov	r5, r0
 f1 2a                 mov	r6, r2
 f1 2c                 mov	r7, r0
 d5 4d                 call8	check_case
 d6 06                 adjsp	0x6
 f4 a4                 tst8	r4
 d1 40                 brne8	avm_test_main+594
 d6 fa                 adjsp	-0x6
 c0 1e                 ldi8	r4, 0x1e
 f1 44                 stsp8	[sp+0x5], r4
 c0 82                 ldi8	r4, 0x82
 c1 14                 ldi8	r5, 0x14
 f4 44                 stsp16	[sp+0x1], r4
 f4 4d                 stsp16	[sp+0x3], r5
 f0 2a 00              stsp8	[sp+0x0], r2
 c0 0e                 ldi8	r4, 0xe
 a5                    xor	r5, r5
 c2 03                 ldi8	r6, 0x3
 f1 2e                 mov	r7, r2
 d5 2d                 call8	check_case
 d6 06                 adjsp	0x6
 f4 a4                 tst8	r4
 d1 20                 brne8	avm_test_main+594
 d6 fa                 adjsp	-0x6
 c0 e1                 ldi8	r4, 0xe1
 f1 44                 stsp8	[sp+0x5], r4
 c4 ff ff              ldi16	r4, 0xffff
 c5 fe ff              ldi16	r5, 0xfffe
 f4 44                 stsp16	[sp+0x1], r4
 f4 4d                 stsp16	[sp+0x3], r5
 f0 29 00              stsp8	[sp+0x0], r1
 c0 0f                 ldi8	r4, 0xf
 c1 01                 ldi8	r5, 0x1
 aa                    xor	r6, r6
 c3 02                 ldi8	r7, 0x2
 d5 0b                 call8	check_case
 d6 06                 adjsp	0x6
 f1 04                 mov	r0, r4
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<check_case>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 bd                 adjsp	-0x43
 f0 3e 2a              stsp16	[sp+0x2a], r6
 f0 3d 2e              stsp16	[sp+0x2e], r5
 f4 40                 stsp16	[sp+0x0], r4
 f0 02 5a              ldi8	r2, 0x5a
 f0 03 a5              ldi8	r3, 0xa5
 f0 04 fc 04           ldi16	r0, 0x4fc
 f0 05 00 09           ldi16	r1, 0x900
 c2 04                 ldi8	r6, 0x4
 f0 1d 53              ldsp8u	r5, [sp+0x53]
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 34 51              ldsp16	r4, [sp+0x51]
 f4 60                 stsp16	[sp+0x8], r4
 f0 34 4f              ldsp16	r4, [sp+0x4f]
 f4 70                 stsp16	[sp+0xc], r4
 f0 1c 4e              ldsp8u	r4, [sp+0x4e]
 f0 3c 14              stsp16	[sp+0x14], r4
 f6 2e                 tst16	r6
 d0 1b                 breq8	check_case+83
 f1 27                 mov	r5, r3
 f0 34 10              ldsp16	r4, [sp+0x10]
 a4                    xor	r5, r4
 f0 6d a1              st8	[r0+], r5
 f1 26                 mov	r5, r2
 a4                    xor	r5, r4
 f0 6d a3              st8	[r1+], r5
 f4 b6                 dec16	r6
 f0 0b 11              addi.s8	r3, 0x11
 f0 0a 1d              addi.s8	r2, 0x1d
 f6 2e                 tst16	r6
 d1 e5                 brne8	check_case+56
 aa                    xor	r6, r6
 f0 04 00 05           ldi16	r0, 0x500
 f1 0e                 mov	r1, r6
 c4 00 04              ldi16	r4, 0x400
 38                    cmp	r6, r4
 d0 17                 breq8	check_case+119
 02                    mov	r4, r6
 fa 72                 lsr16i	r4, 0x2
 f9 86                 xor	r4, r1
 f0 35 10              ldsp16	r5, [sp+0x10]
 a1                    xor	r4, r5
 f0 6d 81              st8	[r0+], r4
 f0 09 25              addi.s8	r1, 0x25
 f4 ae                 inc16	r6
 c4 00 04              ldi16	r4, 0x400
 38                    cmp	r6, r4
 d1 e9                 brne8	check_case+96
 c4 c5 0a              ldi16	r4, 0xac5
 c1 00                 ldi8	r5, 0x0
 f0 04 ad 0a           ldi16	r0, 0xaad
 f0 01 00              ldi8	r1, 0x0
 f0 36 2e              ldsp16	r6, [sp+0x2e]
 f4 a6                 tst8	r6
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 d7 31                 sys	set_text_font
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 d7 32                 sys	set_text_mode
 cf 01                 cmpi.s8	r7, 0x1
 d0 23                 breq8	check_case+186
 f4 a7                 tst8	r7
 f0 30 08              ldsp16	r0, [sp+0x8]
 f4 31                 ldsp16	r5, [sp+0xc]
 f0 34 14              ldsp16	r4, [sp+0x14]
 d1 38                 brne8	check_case+219
 f4 a4                 tst8	r4
 d0 70                 breq8	check_case+279
 cc 03                 cmpi.s8	r4, 0x3
 d0 5b                 breq8	check_case+262
 cc 02                 cmpi.s8	r4, 0x2
 d0 63                 breq8	check_case+274
 cc 01                 cmpi.s8	r4, 0x1
 db b0 00              brne16	check_case+356
 c6 10 01              ldi16	r6, 0x110
 e0 ad 00              jmp16	check_case+359
 f0 34 14              ldsp16	r4, [sp+0x14]
 f4 a4                 tst8	r4
 f0 30 08              ldsp16	r0, [sp+0x8]
 f4 31                 ldsp16	r5, [sp+0xc]
 d0 5d                 breq8	check_case+291
 cc 03                 cmpi.s8	r4, 0x3
 d0 41                 breq8	check_case+267
 cc 02                 cmpi.s8	r4, 0x2
 d0 4e                 breq8	check_case+284
 cc 01                 cmpi.s8	r4, 0x1
 db 9b 00              brne16	check_case+366
 c6 e9 0a              ldi16	r6, 0xae9
 c3 00                 ldi8	r7, 0x0
 e0 98 00              jmp16	check_case+371
 cc 03                 cmpi.s8	r4, 0x3
 08                    mov	r6, r4
 f0 12 3e              leasp	r2, 0x3e
 d0 69                 breq8	check_case+332
 ce 01                 cmpi.s8	r6, 0x1
 d0 43                 breq8	check_case+298
 ce 02                 cmpi.s8	r6, 0x2
 0e                    mov	r7, r6
 c0 41                 ldi8	r4, 0x41
 c1 42                 ldi8	r5, 0x42
 f0 16 3e              leasp	r6, 0x3e
 d0 45                 breq8	check_case+312
 f4 a7                 tst8	r7
 db 82 00              brne16	check_case+378
 c0 41                 ldi8	r4, 0x41
 f0 3c 3e              stsp16	[sp+0x3e], r4
 f0 17 3e              leasp	r7, 0x3e
 c6 00 01              ldi16	r6, 0x100
 e0 80 00              jmp16	check_case+390
 c6 15 01              ldi16	r6, 0x115
 d4 5c                 jmp8	check_case+359
 c6 ee 0a              ldi16	r6, 0xaee
 c3 00                 ldi8	r7, 0x0
 d4 61                 jmp8	check_case+371
 c6 12 01              ldi16	r6, 0x112
 d4 50                 jmp8	check_case+359
 c6 0e 01              ldi16	r6, 0x10e
 d4 4b                 jmp8	check_case+359
 c6 eb 0a              ldi16	r6, 0xaeb
 c3 00                 ldi8	r7, 0x0
 d4 50                 jmp8	check_case+371
 c6 e7 0a              ldi16	r6, 0xae7
 c3 00                 ldi8	r7, 0x0
 d4 49                 jmp8	check_case+371
 c0 42                 ldi8	r4, 0x42
 f0 3c 3e              stsp16	[sp+0x3e], r4
 f0 17 3e              leasp	r7, 0x3e
 c6 00 01              ldi16	r6, 0x100
 01                    mov	r4, r5
 d4 53                 jmp8	check_case+395
 f0 3c 3e              stsp16	[sp+0x3e], r4
 f0 3d 40              stsp16	[sp+0x40], r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f0 30 08              ldsp16	r0, [sp+0x8]
 f1 24                 mov	r5, r0
 f1 16                 mov	r2, r6
 c6 03 01              ldi16	r6, 0x103
 d4 43                 jmp8	check_case+399
 c2 42                 ldi8	r6, 0x42
 c3 41                 ldi8	r7, 0x41
 f0 3e 3e              stsp16	[sp+0x3e], r6
 f0 3f 40              stsp16	[sp+0x40], r7
 c6 03 01              ldi16	r6, 0x103
 01                    mov	r4, r5
 f0 3c 3a              stsp16	[sp+0x3a], r4
 f1 24                 mov	r5, r0
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 d4 2b                 jmp8	check_case+399
 c6 18 01              ldi16	r6, 0x118
 01                    mov	r4, r5
 f1 24                 mov	r5, r0
 d7 33                 sys	draw_text
 d4 23                 jmp8	check_case+401
 c6 f1 0a              ldi16	r6, 0xaf1
 c3 00                 ldi8	r7, 0x0
 01                    mov	r4, r5
 f1 24                 mov	r5, r0
 d7 34                 sys	draw_text_p
 d4 17                 jmp8	check_case+401
 f0 3c 3e              stsp16	[sp+0x3e], r4
 f0 3d 40              stsp16	[sp+0x40], r5
 f0 17 3e              leasp	r7, 0x3e
 c6 08 01              ldi16	r6, 0x108
 f4 30                 ldsp16	r4, [sp+0xc]
 f0 30 08              ldsp16	r0, [sp+0x8]
 f1 24                 mov	r5, r0
 f1 17                 mov	r2, r7
 d7 35                 sys	draw_textfv
 f0 3c 3a              stsp16	[sp+0x3a], r4
 f0 3d 3c              stsp16	[sp+0x3c], r5
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 36              stsp16	[sp+0x36], r4
 f0 3d 38              stsp16	[sp+0x38], r5
 c2 13                 ldi8	r6, 0x13
 c0 0a                 ldi8	r4, 0xa
 f0 35 2e              ldsp16	r5, [sp+0x2e]
 f4 a5                 tst8	r5
 fb 34                 cmov.eq	r6, r4
 f4 6a                 stsp16	[sp+0xa], r6
 f0 34 14              ldsp16	r4, [sp+0x14]
 e1 d9 02              call16	logical_length
 f1 1c                 mov	r3, r4
 f2 39                 sub	r1, r1
 f1 10                 mov	r2, r0
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f1 25                 mov	r5, r1
 f1 75                 zext8	r5
 f1 23                 mov	r4, r3
 f1 74                 zext8	r4
 31                    cmp	r4, r5
 d0 2c                 breq8	check_case+498
 f0 34 14              ldsp16	r4, [sp+0x14]
 e1 d2 02              call16	logical_char
 04                    mov	r5, r4
 f1 74                 zext8	r4
 cc 0a                 cmpi.s8	r4, 0xa
 d1 0b                 brne8	check_case+478
 f4 28                 ldsp16	r4, [sp+0xa]
 f2 14                 add	r2, r4
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f4 a9                 inc16	r1
 d4 dd                 jmp8	check_case+443
 f6 45                 sext8	r5
 f0 16 3e              leasp	r6, 0x3e
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 e1 e4 02              call16	reference_glyph
 f0 1c 42              ldsp8u	r4, [sp+0x42]
 f2 04                 add	r0, r4
 f4 a9                 inc16	r1
 d4 c9                 jmp8	check_case+443
 f0 36 3a              ldsp16	r6, [sp+0x3a]
 f0 37 3c              ldsp16	r7, [sp+0x3c]
 f5 06                 cmp	r0, r6
 d1 33                 brne8	check_case+559
 f0 36 36              ldsp16	r6, [sp+0x36]
 f0 37 38              ldsp16	r7, [sp+0x38]
 f5 16                 cmp	r2, r6
 d1 29                 brne8	check_case+559
 f4 78                 stsp16	[sp+0xe], r4
 c5 fb 04              ldi16	r5, 0x4fb
 f0 02 a5              ldi8	r2, 0xa5
 f0 04 fc 04           ldi16	r0, 0x4fc
 f0 05 ff 04           ldi16	r1, 0x4ff
 f5 25                 cmp	r5, r1
 d0 43                 breq8	check_case+605
 f0 6c e1              ld8u	r7, [r0+]
 f1 2a                 mov	r6, r2
 f0 34 10              ldsp16	r4, [sp+0x10]
 a8                    xor	r6, r4
 f0 0a 11              addi.s8	r2, 0x11
 f4 ad                 inc16	r5
 f1 76                 zext8	r6
 3e                    cmp	r7, r6
 d0 e9                 breq8	check_case+534
 d4 53                 jmp8	check_case+642
 c4 1c 01              ldi16	r4, 0x11c
 f4 01                 ldsp16	r5, [sp+0x0]
 e1 fa 02              call16	test_line16
 c4 21 01              ldi16	r4, 0x121
 f1 24                 mov	r5, r0
 e1 f2 02              call16	test_line16
 c4 27 01              ldi16	r4, 0x127
 f0 36 3a              ldsp16	r6, [sp+0x3a]
 06                    mov	r5, r6
 e1 e8 02              call16	test_line16
 c4 2c 01              ldi16	r4, 0x12c
 f1 26                 mov	r5, r2
 e1 e0 02              call16	test_line16
 c4 32 01              ldi16	r4, 0x132
 f0 36 36              ldsp16	r6, [sp+0x36]
 06                    mov	r5, r6
 e1 d6 02              call16	test_line16
 d4 2a                 jmp8	check_case+647
 c5 ff 08              ldi16	r5, 0x8ff
 f0 02 5a              ldi8	r2, 0x5a
 f0 04 00 09           ldi16	r0, 0x900
 f0 05 03 09           ldi16	r1, 0x903
 f5 25                 cmp	r5, r1
 d0 21                 breq8	check_case+656
 f0 6c e1              ld8u	r7, [r0+]
 f1 2a                 mov	r6, r2
 f0 34 10              ldsp16	r4, [sp+0x10]
 a8                    xor	r6, r4
 f0 0a 1d              addi.s8	r2, 0x1d
 f4 ad                 inc16	r5
 f1 76                 zext8	r6
 3e                    cmp	r7, r6
 d0 e9                 breq8	check_case+619
 f4 00                 ldsp16	r4, [sp+0x0]
 e1 d8 01              call16	fail_byte
 c0 01                 ldi8	r4, 0x1
 d6 43                 adjsp	0x43
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 af                    xor	r7, r7
 c1 25                 ldi8	r5, 0x25
 f4 51                 stsp16	[sp+0x4], r5
 c1 7f                 ldi8	r5, 0x7f
 f4 49                 stsp16	[sp+0x2], r5
 c4 00 04              ldi16	r4, 0x400
 3c                    cmp	r7, r4
 f0 30 08              ldsp16	r0, [sp+0x8]
 da b1 01              breq16	check_case+1108
 03                    mov	r4, r7
 07                    mov	r5, r7
 f4 12                 ldsp16	r6, [sp+0x4]
 fe 26                 mul16	r4, r6
 fa a2                 lsr16i	r7, 0x2
 ac                    xor	r7, r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 ac                    xor	r7, r4
 f0 31 14              ldsp16	r1, [sp+0x14]
 01                    mov	r4, r5
 f4 0a                 ldsp16	r6, [sp+0x2]
 82                    and	r4, r6
 f0 3c 24              stsp16	[sp+0x24], r4
 f4 59                 stsp16	[sp+0x6], r5
 fa 84                 lsr16i	r5, 0x4
 c6 f8 07              ldi16	r6, 0x7f8
 f0 3d 2c              stsp16	[sp+0x2c], r5
 89                    and	r6, r5
 a0                    xor	r4, r4
 f0 3e 34              stsp16	[sp+0x34], r6
 ca 08                 addi.s8	r6, 0x8
 f0 3e 32              stsp16	[sp+0x32], r6
 f0 38 12              stsp16	[sp+0x12], r0
 f4 31                 ldsp16	r5, [sp+0xc]
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 3f 3a              stsp16	[sp+0x3a], r7
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f4 3a                 ldsp16	r6, [sp+0xe]
 36                    cmp	r5, r6
 da 5c 01              breq16	check_case+1086
 f0 3c 16              stsp16	[sp+0x16], r4
 f1 21                 mov	r4, r1
 e1 b4 01              call16	logical_char
 04                    mov	r5, r4
 f1 74                 zext8	r4
 cc 0a                 cmpi.s8	r4, 0xa
 d1 14                 brne8	check_case+773
 f4 28                 ldsp16	r4, [sp+0xa]
 f0 35 12              ldsp16	r5, [sp+0x12]
 14                    add	r5, r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 37 3a              ldsp16	r7, [sp+0x3a]
 e0 2e 01              jmp16	check_case+1075
 f6 45                 sext8	r5
 f0 16 3e              leasp	r6, 0x3e
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 f1 05                 mov	r0, r5
 e1 bb 01              call16	reference_glyph
 f0 38 26              stsp16	[sp+0x26], r0
 f0 0c 41              cmpi.s8	r0, 0x41
 c4 3a 01              ldi16	r4, 0x13a
 04                    mov	r5, r4
 c4 37 01              ldi16	r4, 0x137
 fb 2c                 cmov.eq	r5, r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 25 3f              ldsp8s	r5, [sp+0x3f]
 f0 34 12              ldsp16	r4, [sp+0x12]
 14                    add	r5, r4
 f0 3d 20              stsp16	[sp+0x20], r5
 f0 20 41              ldsp8s	r0, [sp+0x41]
 f0 34 18              ldsp16	r4, [sp+0x18]
 f2 04                 add	r0, r4
 aa                    xor	r6, r6
 f0 19 40              ldsp8u	r1, [sp+0x40]
 f0 1c 3e              ldsp8u	r4, [sp+0x3e]
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 37 3a              ldsp16	r7, [sp+0x3a]
 f0 38 1e              stsp16	[sp+0x1e], r0
 f0 39 1c              stsp16	[sp+0x1c], r1
 f5 29                 cmp	r6, r1
 da db 00              breq16	check_case+1065
 f1 20                 mov	r4, r0
 12                    add	r4, r6
 f0 35 24              ldsp16	r5, [sp+0x24]
 31                    cmp	r4, r5
 db ca 00              brne16	check_case+1058
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 3e 28              stsp16	[sp+0x28], r6
 12                    add	r4, r6
 f0 3c 30              stsp16	[sp+0x30], r4
 aa                    xor	r6, r6
 f0 32 1a              ldsp16	r2, [sp+0x1a]
 f0 31 20              ldsp16	r1, [sp+0x20]
 f6 2a                 tst16	r2
 da ab 00              breq16	check_case+1049
 f0 0d 40              cmpi.s8	r1, 0x40
 df 9a 00              brsge16	check_case+1038
 f0 34 34              ldsp16	r4, [sp+0x34]
 f5 0c                 cmp	r1, r4
 de 92 00              brslt16	check_case+1038
 f0 34 32              ldsp16	r4, [sp+0x32]
 f5 0c                 cmp	r1, r4
 df 8a 00              brsge16	check_case+1038
 f0 3f 3a              stsp16	[sp+0x3a], r7
 f0 00 f8              ldi8	r0, 0xf8
 0e                    mov	r7, r6
 f9 e0                 and	r7, r0
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 f4 a4                 tst8	r4
 f0 35 30              ldsp16	r5, [sp+0x30]
 d0 25                 breq8	check_case+956
 fa a3                 lsr16i	r7, 0x3
 f0 34 26              ldsp16	r4, [sp+0x26]
 cc 41                 cmpi.s8	r4, 0x41
 d1 0d                 brne8	check_case+941
 fa 62                 lsl16i	r7, 0x2
 f0 34 28              ldsp16	r4, [sp+0x28]
 1c                    add	r7, r4
 f1 77                 zext8	r7
 c4 3e 01              ldi16	r4, 0x13e
 d4 0d                 jmp8	check_case+954
 c1 03                 ldi8	r5, 0x3
 f3 1d                 mulu8.w	r7, r5
 f0 34 28              ldsp16	r4, [sp+0x28]
 1c                    add	r7, r4
 f1 77                 zext8	r7
 c4 46 01              ldi16	r4, 0x146
 1c                    add	r7, r4
 07                    mov	r5, r7
 c0 07                 ldi8	r4, 0x7
 f0 3e 36              stsp16	[sp+0x36], r6
 82                    and	r4, r6
 c2 01                 ldi8	r6, 0x1
 0e                    mov	r7, r6
 fa 0c                 shl16v	r7, r4
 f5 37                 ld8u	r3, [r5]
 f9 7c                 and	r3, r7
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 f9 10                 and	r0, r4
 f1 21                 mov	r4, r1
 f2 50                 sub	r4, r0
 f1 74                 zext8	r4
 fa 08                 shl16v	r6, r4
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 cc 02                 cmpi.s8	r4, 0x2
 f0 37 3a              ldsp16	r7, [sp+0x3a]
 07                    mov	r5, r7
 96                    or	r5, r6
 d0 0f                 breq8	check_case+1011
 f4 a4                 tst8	r4
 f0 04 ff ff           ldi16	r0, 0xffff
 d1 18                 brne8	check_case+1028
 f4 a3                 tst8	r3
 d0 18                 breq8	check_case+1032
 0d                    mov	r7, r5
 d4 18                 jmp8	check_case+1035
 f4 a3                 tst8	r3
 f0 36 36              ldsp16	r6, [sp+0x36]
 d0 14                 breq8	check_case+1038
 0d                    mov	r7, r5
 f4 b2                 dec16	r2
 f4 ae                 inc16	r6
 f4 a9                 inc16	r1
 e0 65 ff              jmp16	check_case+873
 f4 a3                 tst8	r3
 d0 03                 breq8	check_case+1035
 f9 c2                 xor	r6, r0
 8e                    and	r7, r6
 f0 36 36              ldsp16	r6, [sp+0x36]
 f4 b2                 dec16	r2
 f4 ae                 inc16	r6
 f4 a9                 inc16	r1
 f6 2a                 tst16	r2
 db 55 ff              brne16	check_case+878
 f0 30 1e              ldsp16	r0, [sp+0x1e]
 f0 36 28              ldsp16	r6, [sp+0x28]
 f0 31 1c              ldsp16	r1, [sp+0x1c]
 f4 ae                 inc16	r6
 f5 29                 cmp	r6, r1
 db 25 ff              brne16	check_case+846
 f0 1c 42              ldsp8u	r4, [sp+0x42]
 f0 35 18              ldsp16	r5, [sp+0x18]
 14                    add	r5, r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 34 16              ldsp16	r4, [sp+0x16]
 f4 ac                 inc16	r4
 f0 31 14              ldsp16	r1, [sp+0x14]
 e0 98 fe              jmp16	check_case+726
 c5 00 05              ldi16	r5, 0x500
 f4 1b                 ldsp16	r7, [sp+0x6]
 17                    add	r5, r7
 f5 34                 ld8u	r0, [r5]
 f0 36 3a              ldsp16	r6, [sp+0x3a]
 f1 76                 zext8	r6
 f5 06                 cmp	r0, r6
 d1 09                 brne8	check_case+1112
 f4 af                 inc16	r7
 e0 45 fe              jmp16	check_case+665
 a0                    xor	r4, r4
 e0 31 fe              jmp16	check_case+649
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 2c                 mov	r7, r0
 e0 25 fe              jmp16	check_case+644

<fail_byte>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f1 07                 mov	r0, r7
 f1 0e                 mov	r1, r6
 f1 15                 mov	r2, r5
 04                    mov	r5, r4
 c4 1c 01              ldi16	r4, 0x11c
 e1 c2 00              call16	test_line16
 c4 4f 01              ldi16	r4, 0x14f
 f1 26                 mov	r5, r2
 e1 ba 00              call16	test_line16
 c4 54 01              ldi16	r4, 0x154
 f1 25                 mov	r5, r1
 e1 b2 00              call16	test_line16
 c4 59 01              ldi16	r4, 0x159
 f1 24                 mov	r5, r0
 e1 aa 00              call16	test_line16
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<logical_length>:
 cc 02                 cmpi.s8	r4, 0x2
 d2 09                 brult8	logical_length+13
 c8 fe                 addi.s8	r4, -0x2
 cc 02                 cmpi.s8	r4, 0x2
 d8 06                 bruge8	logical_length+16
 c0 02                 ldi8	r4, 0x2
 ef                    ret
 c0 01                 ldi8	r4, 0x1
 ef                    ret
 c0 03                 ldi8	r4, 0x3
 ef                    ret

<logical_char>:
 f4 a4                 tst8	r4
 d0 19                 breq8	logical_char+29
 cc 03                 cmpi.s8	r4, 0x3
 d0 0b                 breq8	logical_char+19
 cc 02                 cmpi.s8	r4, 0x2
 d0 0d                 breq8	logical_char+25
 cc 01                 cmpi.s8	r4, 0x1
 d1 10                 brne8	logical_char+32
 c0 42                 ldi8	r4, 0x42
 ef                    ret
 c0 41                 ldi8	r4, 0x41
 c2 42                 ldi8	r6, 0x42
 d4 11                 jmp8	logical_char+42
 c0 42                 ldi8	r4, 0x42
 d4 0b                 jmp8	logical_char+40
 c0 41                 ldi8	r4, 0x41
 ef                    ret
 c0 42                 ldi8	r4, 0x42
 c2 0a                 ldi8	r6, 0xa
 cd 01                 cmpi.s8	r5, 0x1
 fb 26                 cmov.eq	r4, r6
 c2 41                 ldi8	r6, 0x41
 f4 a5                 tst8	r5
 fb 26                 cmov.eq	r4, r6
 ef                    ret

<reference_glyph>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f4 a4                 tst8	r4
 d0 20                 breq8	reference_glyph+40
 f0 01 03              ldi8	r1, 0x3
 c0 04                 ldi8	r4, 0x4
 cd 41                 cmpi.s8	r5, 0x41
 fb 0c                 cmov.eq	r1, r4
 f0 06 f8 ff           ldi16	r2, 0xfff8
 c4 f6 ff              ldi16	r4, 0xfff6
 fb 14                 cmov.eq	r2, r4
 f0 03 11              ldi8	r3, 0x11
 c3 0d                 ldi8	r7, 0xd
 cd 41                 cmpi.s8	r5, 0x41
 fb 1f                 cmov.eq	r3, r7
 f0 00 05              ldi8	r0, 0x5
 d4 20                 jmp8	reference_glyph+72
 f0 00 06              ldi8	r0, 0x6
 f0 01 04              ldi8	r1, 0x4
 cd 41                 cmpi.s8	r5, 0x41
 fb 01                 cmov.eq	r0, r1
 c0 03                 ldi8	r4, 0x3
 fb 0c                 cmov.eq	r1, r4
 f0 06 fc ff           ldi16	r2, 0xfffc
 c4 fa ff              ldi16	r4, 0xfffa
 cd 41                 cmpi.s8	r5, 0x41
 fb 14                 cmov.eq	r2, r4
 f0 03 08              ldi8	r3, 0x8
 c3 07                 ldi8	r7, 0x7
 fb 1f                 cmov.eq	r3, r7
 c3 01                 ldi8	r7, 0x1
 c4 ff ff              ldi16	r4, 0xffff
 cd 41                 cmpi.s8	r5, 0x41
 fb 3c                 cmov.eq	r7, r4
 ee 0c 24              st8	[r6+4], r0
 ee 2c 22              st8	[r6+2], r1
 ee 4c 21              st8	[r6+1], r2
 f3 0b                 st8	[r6], r3
 ee ec 23              st8	[r6+3], r7
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<test_line16>:
 d6 fe                 adjsp	-0x2
 08                    mov	r6, r4
 42                    ld8u	r4, [r6]
 f4 a4                 tst8	r4
 d0 06                 breq8	test_line16+14
 d7 00                 sys	debug_putc
 f4 ae                 inc16	r6
 d4 f5                 jmp8	test_line16+3
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f4 41                 stsp16	[sp+0x0], r5
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
