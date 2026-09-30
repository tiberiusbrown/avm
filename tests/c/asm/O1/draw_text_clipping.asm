
draw_text_clipping.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 draw_text_clipping.c
00000530 l     F .text	00000701 check_case
00000da2 l     O .rodata	00000022 multi_page_font
00000d8a l     O .rodata	00000018 single_page_font
00000110 l     O .data	00000002 ram_b
00000dc6 l     O .rodata	00000002 program_b
00000115 l     O .data	00000003 ram_ba
00000dcb l     O .rodata	00000003 program_ba
00000118 l     O .data	00000004 ram_a_newline_b
00000dce l     O .rodata	00000004 program_a_newline_b
0000010e l     O .data	00000002 ram_a
00000112 l     O .data	00000003 ram_ab
00000dc4 l     O .rodata	00000002 program_a
00000dc8 l     O .rodata	00000003 program_ab
00000108 l     O .data	00000006 format_newline
00000100 l     O .data	00000003 format_one
00000103 l     O .data	00000005 format_two
0000013a l     O .data	00000004 single_b_image
00000137 l     O .data	00000003 single_a_image
0000013e l     O .data	00000008 multi_a_image
00000146 l     O .data	00000009 multi_b_image
0000011c l     O .data	00000005 .L.str
00000121 l     O .data	00000006 .L.str.1
00000127 l     O .data	00000005 .L.str.2
0000012c l     O .data	00000006 .L.str.3
00000132 l     O .data	00000005 .L.str.4
00000c31 l     F .text	00000157 fail_byte
0000014f l     O .data	00000005 .L.str.5
00000154 l     O .data	00000005 .L.str.6
00000159 l     O .data	00000004 .L.str.7
00000000 l    df *ABS*	00000000 runtime.c
00000dd2 l       .init_array	00000000 .hidden __init_array_end
00000dd2 l       .init_array	00000000 .hidden __init_array_start
00000dd2 l       .fini_array	00000000 .hidden __fini_array_start
00000dd2 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000259 avm_test_main
00000d88 g     F .text	00000002 avm_halt
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
 e1 6a 0b              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 d2 0d              ldi16	r4, 0xdd2
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 d2 0d              ldi16	r6, 0xdd2
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 d2 0d           ldi16	r0, 0xdd2
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 d2 0d           ldi16	r2, 0xdd2
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
 c4 d2 0d              ldi16	r4, 0xdd2
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 d2 0d              ldi16	r6, 0xdd2
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 d2 0d           ldi16	r2, 0xdd2
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 d2 0d           ldi16	r0, 0xdd2
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
 d6 c2                 adjsp	-0x3e
 f0 3f 36              stsp16	[sp+0x36], r7
 f1 1e                 mov	r3, r6
 f0 3d 2a              stsp16	[sp+0x2a], r5
 f4 40                 stsp16	[sp+0x0], r4
 f0 02 04              ldi8	r2, 0x4
 f0 04 00 09           ldi16	r0, 0x900
 f0 05 fc 04           ldi16	r1, 0x4fc
 c1 5a                 ldi8	r5, 0x5a
 c0 a5                 ldi8	r4, 0xa5
 f0 1f 4e              ldsp8u	r7, [sp+0x4e]
 f0 36 4c              ldsp16	r6, [sp+0x4c]
 f4 52                 stsp16	[sp+0x4], r6
 f0 36 4a              ldsp16	r6, [sp+0x4a]
 f4 62                 stsp16	[sp+0x8], r6
 f0 1e 49              ldsp8u	r6, [sp+0x49]
 f0 3e 14              stsp16	[sp+0x14], r6
 08                    mov	r6, r4
 ab                    xor	r6, r7
 f0 6d c3              st8	[r1+], r6
 09                    mov	r6, r5
 ab                    xor	r6, r7
 f0 6d c1              st8	[r0+], r6
 c8 11                 addi.s8	r4, 0x11
 c9 1d                 addi.s8	r5, 0x1d
 f4 b2                 dec16	r2
 f6 2a                 tst16	r2
 d1 ec                 brne8	check_case+50
 f0 04 00 05           ldi16	r0, 0x500
 aa                    xor	r6, r6
 02                    mov	r4, r6
 06                    mov	r5, r6
 fa 82                 lsr16i	r5, 0x2
 a4                    xor	r5, r4
 a7                    xor	r5, r7
 f0 6d a1              st8	[r0+], r5
 c8 25                 addi.s8	r4, 0x25
 f4 ae                 inc16	r6
 c5 00 04              ldi16	r5, 0x400
 39                    cmp	r6, r5
 d1 ee                 brne8	check_case+76
 c4 a2 0d              ldi16	r4, 0xda2
 c1 00                 ldi8	r5, 0x0
 f0 04 8a 0d           ldi16	r0, 0xd8a
 f0 01 00              ldi8	r1, 0x0
 f0 36 2a              ldsp16	r6, [sp+0x2a]
 f4 a6                 tst8	r6
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 d7 31                 sys	set_text_font
 f1 23                 mov	r4, r3
 d7 32                 sys	set_text_mode
 f0 35 36              ldsp16	r5, [sp+0x36]
 cd 01                 cmpi.s8	r5, 0x1
 f0 01 42              ldi8	r1, 0x42
 f4 5b                 stsp16	[sp+0x6], r7
 f0 34 14              ldsp16	r4, [sp+0x14]
 d0 17                 breq8	check_case+159
 f4 a5                 tst8	r5
 f4 23                 ldsp16	r7, [sp+0x8]
 d1 26                 brne8	check_case+180
 cc 02                 cmpi.s8	r4, 0x2
 d9 35                 brsge8	check_case+199
 f4 a4                 tst8	r4
 d0 67                 breq8	check_case+253
 cc 01                 cmpi.s8	r4, 0x1
 d1 57                 brne8	check_case+241
 c6 10 01              ldi16	r6, 0x110
 d4 66                 jmp8	check_case+261
 cc 02                 cmpi.s8	r4, 0x2
 f4 21                 ldsp16	r5, [sp+0x8]
 d9 2f                 brsge8	check_case+212
 f4 a4                 tst8	r4
 d0 6c                 breq8	check_case+277
 cc 01                 cmpi.s8	r4, 0x1
 d1 49                 brne8	check_case+246
 c6 c6 0d              ldi16	r6, 0xdc6
 c3 00                 ldi8	r7, 0x0
 d4 6d                 jmp8	check_case+289
 cc 02                 cmpi.s8	r4, 0x2
 d9 2b                 brsge8	check_case+227
 f4 a4                 tst8	r4
 da 8c 00              breq16	check_case+329
 cc 01                 cmpi.s8	r4, 0x1
 d1 76                 brne8	check_case+311
 f0 39 3a              stsp16	[sp+0x3a], r1
 e0 87 00              jmp16	check_case+334
 cc 02                 cmpi.s8	r4, 0x2
 d0 37                 breq8	check_case+258
 cc 03                 cmpi.s8	r4, 0x3
 d1 22                 brne8	check_case+241
 c6 15 01              ldi16	r6, 0x115
 d4 31                 jmp8	check_case+261
 cc 02                 cmpi.s8	r4, 0x2
 d0 44                 breq8	check_case+284
 cc 03                 cmpi.s8	r4, 0x3
 d1 1a                 brne8	check_case+246
 c6 cb 0d              ldi16	r6, 0xdcb
 c3 00                 ldi8	r7, 0x0
 d4 3e                 jmp8	check_case+289
 cc 02                 cmpi.s8	r4, 0x2
 d0 6f                 breq8	check_case+342
 cc 03                 cmpi.s8	r4, 0x3
 d1 4c                 brne8	check_case+311
 c0 42                 ldi8	r4, 0x42
 c1 41                 ldi8	r5, 0x41
 d4 69                 jmp8	check_case+346
 c6 18 01              ldi16	r6, 0x118
 d4 0f                 jmp8	check_case+261
 c6 ce 0d              ldi16	r6, 0xdce
 c3 00                 ldi8	r7, 0x0
 d4 24                 jmp8	check_case+289
 c6 0e 01              ldi16	r6, 0x10e
 d4 03                 jmp8	check_case+261
 c6 12 01              ldi16	r6, 0x112
 f0 3e 36              stsp16	[sp+0x36], r6
 03                    mov	r4, r7
 f0 30 04              ldsp16	r0, [sp+0x4]
 f1 24                 mov	r5, r0
 f0 36 36              ldsp16	r6, [sp+0x36]
 d7 33                 sys	draw_text
 d4 59                 jmp8	check_case+366
 c6 c4 0d              ldi16	r6, 0xdc4
 c3 00                 ldi8	r7, 0x0
 d4 05                 jmp8	check_case+289
 c6 c8 0d              ldi16	r6, 0xdc8
 c3 00                 ldi8	r7, 0x0
 f0 3e 36              stsp16	[sp+0x36], r6
 f0 3f 38              stsp16	[sp+0x38], r7
 01                    mov	r4, r5
 f0 30 04              ldsp16	r0, [sp+0x4]
 f1 24                 mov	r5, r0
 f0 36 36              ldsp16	r6, [sp+0x36]
 f0 37 38              ldsp16	r7, [sp+0x38]
 d7 34                 sys	draw_text_p
 d4 37                 jmp8	check_case+366
 c0 41                 ldi8	r4, 0x41
 c1 42                 ldi8	r5, 0x42
 f0 3c 3a              stsp16	[sp+0x3a], r4
 f0 3d 3c              stsp16	[sp+0x3c], r5
 f0 12 3a              leasp	r2, 0x3a
 c6 08 01              ldi16	r6, 0x108
 d4 1d                 jmp8	check_case+358
 c0 41                 ldi8	r4, 0x41
 f0 3c 3a              stsp16	[sp+0x3a], r4
 f0 12 3a              leasp	r2, 0x3a
 c6 00 01              ldi16	r6, 0x100
 d4 10                 jmp8	check_case+358
 c0 41                 ldi8	r4, 0x41
 c1 42                 ldi8	r5, 0x42
 f0 3c 3a              stsp16	[sp+0x3a], r4
 f0 3d 3c              stsp16	[sp+0x3c], r5
 f0 12 3a              leasp	r2, 0x3a
 c6 03 01              ldi16	r6, 0x103
 03                    mov	r4, r7
 f0 30 04              ldsp16	r0, [sp+0x4]
 f1 24                 mov	r5, r0
 d7 35                 sys	draw_textfv
 f0 3c 30              stsp16	[sp+0x30], r4
 f0 3d 32              stsp16	[sp+0x32], r5
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 3d 2e              stsp16	[sp+0x2e], r5
 c1 13                 ldi8	r5, 0x13
 c3 0a                 ldi8	r7, 0xa
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 f4 a4                 tst8	r4
 fb 2f                 cmov.eq	r5, r7
 f4 69                 stsp16	[sp+0xa], r5
 af                    xor	r7, r7
 f0 02 01              ldi8	r2, 0x1
 f0 34 14              ldsp16	r4, [sp+0x14]
 c8 fe                 addi.s8	r4, -0x2
 f4 70                 stsp16	[sp+0xc], r4
 f1 20                 mov	r4, r0
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 30 08              ldsp16	r0, [sp+0x8]
 d4 0b                 jmp8	check_case+425
 f4 28                 ldsp16	r4, [sp+0xa]
 f0 35 34              ldsp16	r5, [sp+0x34]
 14                    add	r5, r4
 f0 3d 34              stsp16	[sp+0x34], r5
 f4 af                 inc16	r7
 f1 20                 mov	r4, r0
 f0 3c 36              stsp16	[sp+0x36], r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 cc 02                 cmpi.s8	r4, 0x2
 f1 2a                 mov	r6, r2
 d2 12                 brult8	check_case+457
 f4 30                 ldsp16	r4, [sp+0xc]
 cc 02                 cmpi.s8	r4, 0x2
 d8 0a                 bruge8	check_case+455
 c2 02                 ldi8	r6, 0x2
 07                    mov	r5, r7
 f1 75                 zext8	r5
 36                    cmp	r5, r6
 d0 78                 breq8	check_case+573
 d4 08                 jmp8	check_case+463
 c2 03                 ldi8	r6, 0x3
 07                    mov	r5, r7
 f1 75                 zext8	r5
 36                    cmp	r5, r6
 d0 6e                 breq8	check_case+573
 f0 34 14              ldsp16	r4, [sp+0x14]
 cc 02                 cmpi.s8	r4, 0x2
 d9 17                 brsge8	check_case+493
 f4 a4                 tst8	r4
 c2 41                 ldi8	r6, 0x41
 d0 3d                 breq8	check_case+537
 f0 34 14              ldsp16	r4, [sp+0x14]
 cc 01                 cmpi.s8	r4, 0x1
 d1 20                 brne8	check_case+515
 f1 29                 mov	r6, r1
 f1 76                 zext8	r6
 ce 0a                 cmpi.s8	r6, 0xa
 d0 b3                 breq8	check_case+414
 d4 33                 jmp8	check_case+544
 cc 02                 cmpi.s8	r4, 0x2
 d0 20                 breq8	check_case+529
 cc 03                 cmpi.s8	r4, 0x3
 d1 0e                 brne8	check_case+515
 c2 41                 ldi8	r6, 0x41
 f4 a7                 tst8	r7
 fb 31                 cmov.eq	r6, r1
 f1 76                 zext8	r6
 ce 0a                 cmpi.s8	r6, 0xa
 d0 9d                 breq8	check_case+414
 d4 1d                 jmp8	check_case+544
 cd 01                 cmpi.s8	r5, 0x1
 f1 29                 mov	r6, r1
 c0 0a                 ldi8	r4, 0xa
 fb 34                 cmov.eq	r6, r4
 c1 41                 ldi8	r5, 0x41
 f4 a7                 tst8	r7
 d4 06                 jmp8	check_case+535
 c1 41                 ldi8	r5, 0x41
 f4 a7                 tst8	r7
 f1 29                 mov	r6, r1
 fb 35                 cmov.eq	r6, r5
 f1 76                 zext8	r6
 ce 0a                 cmpi.s8	r6, 0xa
 da 7e ff              breq16	check_case+414
 c1 06                 ldi8	r5, 0x6
 c0 04                 ldi8	r4, 0x4
 ce 41                 cmpi.s8	r6, 0x41
 fb 2c                 cmov.eq	r5, r4
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 f4 a4                 tst8	r4
 c0 05                 ldi8	r4, 0x5
 fb 25                 cmov.eq	r4, r5
 f0 35 36              ldsp16	r5, [sp+0x36]
 14                    add	r5, r4
 f0 3d 36              stsp16	[sp+0x36], r5
 f4 af                 inc16	r7
 e0 71 ff              jmp16	check_case+430
 f0 34 30              ldsp16	r4, [sp+0x30]
 f0 35 32              ldsp16	r5, [sp+0x32]
 f0 36 36              ldsp16	r6, [sp+0x36]
 38                    cmp	r6, r4
 db a5 02              brne16	check_case+1263
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 f0 35 2e              ldsp16	r5, [sp+0x2e]
 f0 36 34              ldsp16	r6, [sp+0x34]
 38                    cmp	r6, r4
 db 98 02              brne16	check_case+1263
 c0 a5                 ldi8	r4, 0xa5
 f0 04 fc 04           ldi16	r0, 0x4fc
 f1 24                 mov	r5, r0
 f0 31 06              ldsp16	r1, [sp+0x6]
 f0 32 14              ldsp16	r2, [sp+0x14]
 08                    mov	r6, r4
 f9 c6                 xor	r6, r1
 f1 76                 zext8	r6
 4d                    ld8u	r7, [r5]
 3e                    cmp	r7, r6
 db 7a 04              brne16	check_case+1769
 c8 11                 addi.s8	r4, 0x11
 f4 ad                 inc16	r5
 f4 a8                 inc16	r0
 c6 00 05              ldi16	r6, 0x500
 f5 06                 cmp	r0, r6
 d1 e9                 brne8	check_case+613
 c0 5a                 ldi8	r4, 0x5a
 f0 04 00 09           ldi16	r0, 0x900
 f1 24                 mov	r5, r0
 08                    mov	r6, r4
 f9 c6                 xor	r6, r1
 f1 76                 zext8	r6
 4d                    ld8u	r7, [r5]
 3e                    cmp	r7, r6
 db 5b 04              brne16	check_case+1769
 c8 1d                 addi.s8	r4, 0x1d
 f4 ad                 inc16	r5
 f4 a8                 inc16	r0
 c6 04 09              ldi16	r6, 0x904
 f5 06                 cmp	r0, r6
 d1 e9                 brne8	check_case+644
 a0                    xor	r4, r4
 04                    mov	r5, r4
 f0 30 04              ldsp16	r0, [sp+0x4]
 f4 22                 ldsp16	r6, [sp+0x8]
 0d                    mov	r7, r5
 c0 25                 ldi8	r4, 0x25
 fe 2c                 mul16	r5, r4
 03                    mov	r4, r7
 fa 72                 lsr16i	r4, 0x2
 a1                    xor	r4, r5
 f9 86                 xor	r4, r1
 f0 3c 36              stsp16	[sp+0x36], r4
 c0 7f                 ldi8	r4, 0x7f
 83                    and	r4, r7
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f4 4b                 stsp16	[sp+0x2], r7
 fa a4                 lsr16i	r7, 0x4
 c4 f8 07              ldi16	r4, 0x7f8
 f0 3f 28              stsp16	[sp+0x28], r7
 83                    and	r4, r7
 f0 3c 34              stsp16	[sp+0x34], r4
 c8 08                 addi.s8	r4, 0x8
 f0 3c 30              stsp16	[sp+0x30], r4
 a0                    xor	r4, r4
 0c                    mov	r7, r4
 f0 38 12              stsp16	[sp+0x12], r0
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 0e 02              cmpi.s8	r2, 0x2
 dc 98 01              brult16	check_case+1135
 e0 7b 01              jmp16	check_case+1109
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 f4 a4                 tst8	r4
 c6 ff ff              ldi16	r6, 0xffff
 c0 07                 ldi8	r4, 0x7
 f0 3f 10              stsp16	[sp+0x10], r7
 d0 26                 breq8	check_case+786
 f0 00 11              ldi8	r0, 0x11
 c0 0d                 ldi8	r4, 0xd
 f0 37 24              ldsp16	r7, [sp+0x24]
 cf 41                 cmpi.s8	r7, 0x41
 fb 04                 cmov.eq	r0, r4
 f0 06 f8 ff           ldi16	r2, 0xfff8
 c4 f6 ff              ldi16	r4, 0xfff6
 fb 14                 cmov.eq	r2, r4
 c1 03                 ldi8	r5, 0x3
 c0 04                 ldi8	r4, 0x4
 cf 41                 cmpi.s8	r7, 0x41
 fb 2c                 cmov.eq	r5, r4
 f0 01 01              ldi8	r1, 0x1
 fb 0e                 cmov.eq	r1, r6
 c0 05                 ldi8	r4, 0x5
 d4 27                 jmp8	check_case+825
 f0 00 08              ldi8	r0, 0x8
 f0 37 24              ldsp16	r7, [sp+0x24]
 cf 41                 cmpi.s8	r7, 0x41
 fb 04                 cmov.eq	r0, r4
 f0 06 fc ff           ldi16	r2, 0xfffc
 c4 fa ff              ldi16	r4, 0xfffa
 fb 14                 cmov.eq	r2, r4
 f0 01 01              ldi8	r1, 0x1
 cf 41                 cmpi.s8	r7, 0x41
 fb 0e                 cmov.eq	r1, r6
 c2 04                 ldi8	r6, 0x4
 c0 03                 ldi8	r4, 0x3
 06                    mov	r5, r6
 fb 2c                 cmov.eq	r5, r4
 c0 06                 ldi8	r4, 0x6
 cf 41                 cmpi.s8	r7, 0x41
 fb 26                 cmov.eq	r4, r6
 f4 78                 stsp16	[sp+0xe], r4
 cf 41                 cmpi.s8	r7, 0x41
 c4 3a 01              ldi16	r4, 0x13a
 08                    mov	r6, r4
 c4 37 01              ldi16	r4, 0x137
 fb 34                 cmov.eq	r6, r4
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 34 12              ldsp16	r4, [sp+0x12]
 f2 14                 add	r2, r4
 f0 3a 1a              stsp16	[sp+0x1a], r2
 f0 34 16              ldsp16	r4, [sp+0x16]
 f2 0c                 add	r1, r4
 af                    xor	r7, r7
 f1 70                 zext8	r0
 f1 75                 zext8	r5
 0b                    mov	r6, r7
 f0 39 20              stsp16	[sp+0x20], r1
 f0 3d 1e              stsp16	[sp+0x1e], r5
 d4 17                 jmp8	check_case+891
 f0 36 26              ldsp16	r6, [sp+0x26]
 f4 ae                 inc16	r6
 f0 37 22              ldsp16	r7, [sp+0x22]
 f4 af                 inc16	r7
 03                    mov	r4, r7
 f1 74                 zext8	r4
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 31                    cmp	r4, r5
 f0 31 20              ldsp16	r1, [sp+0x20]
 da c1 00              breq16	check_case+1084
 f0 3f 22              stsp16	[sp+0x22], r7
 f2 0e                 add	r1, r6
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 f5 0d                 cmp	r1, r5
 f0 3e 26              stsp16	[sp+0x26], r6
 d1 da                 brne8	check_case+868
 f0 34 18              ldsp16	r4, [sp+0x18]
 12                    add	r4, r6
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f2 42                 sub	r2, r2
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 cf 40                 cmpi.s8	r7, 0x40
 d9 0d                 brsge8	check_case+935
 d4 1b                 jmp8	check_case+951
 f4 a5                 tst8	r5
 f0 34 36              ldsp16	r4, [sp+0x36]
 d0 04                 breq8	check_case+935
 92                    or	r4, r6
 f0 3c 36              stsp16	[sp+0x36], r4
 f4 af                 inc16	r7
 f4 aa                 inc16	r2
 f1 22                 mov	r4, r2
 f1 74                 zext8	r4
 f5 04                 cmp	r0, r4
 d0 b1                 breq8	check_case+868
 cf 40                 cmpi.s8	r7, 0x40
 d9 f0                 brsge8	check_case+935
 f0 34 34              ldsp16	r4, [sp+0x34]
 3c                    cmp	r7, r4
 d3 ea                 brslt8	check_case+935
 f0 34 30              ldsp16	r4, [sp+0x30]
 3c                    cmp	r7, r4
 d9 e4                 brsge8	check_case+935
 f1 0b                 mov	r1, r3
 f0 03 f8              ldi8	r3, 0xf8
 f1 2a                 mov	r6, r2
 f9 cc                 and	r6, r3
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 f4 a4                 tst8	r4
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 d0 25                 breq8	check_case+1019
 fa 93                 lsr16i	r6, 0x3
 f0 34 24              ldsp16	r4, [sp+0x24]
 cc 41                 cmpi.s8	r4, 0x41
 d1 0d                 brne8	check_case+1004
 1a                    add	r6, r6
 1a                    add	r6, r6
 f0 34 26              ldsp16	r4, [sp+0x26]
 18                    add	r6, r4
 f1 76                 zext8	r6
 c4 3e 01              ldi16	r4, 0x13e
 d4 0d                 jmp8	check_case+1017
 c1 03                 ldi8	r5, 0x3
 f3 19                 mulu8.w	r6, r5
 f0 34 26              ldsp16	r4, [sp+0x26]
 18                    add	r6, r4
 f1 76                 zext8	r6
 c4 46 01              ldi16	r4, 0x146
 18                    add	r6, r4
 06                    mov	r5, r6
 f1 22                 mov	r4, r2
 c2 07                 ldi8	r6, 0x7
 82                    and	r4, r6
 c2 01                 ldi8	r6, 0x1
 fa 08                 shl16v	r6, r4
 45                    ld8u	r5, [r5]
 86                    and	r5, r6
 c2 01                 ldi8	r6, 0x1
 f0 34 28              ldsp16	r4, [sp+0x28]
 f9 70                 and	r3, r4
 03                    mov	r4, r7
 f2 53                 sub	r4, r3
 f1 74                 zext8	r4
 fa 08                 shl16v	r6, r4
 f1 19                 mov	r3, r1
 f0 0f 02              cmpi.s8	r3, 0x2
 d0 81                 breq8	check_case+924
 f4 a3                 tst8	r3
 f0 34 36              ldsp16	r4, [sp+0x36]
 d1 0d                 brne8	check_case+1071
 f4 a5                 tst8	r5
 db 7c ff              brne16	check_case+931
 c5 ff ff              ldi16	r5, 0xffff
 a9                    xor	r6, r5
 82                    and	r4, r6
 e0 75 ff              jmp16	check_case+932
 f4 a5                 tst8	r5
 da 73 ff              breq16	check_case+935
 c5 ff ff              ldi16	r5, 0xffff
 a9                    xor	r6, r5
 82                    and	r4, r6
 e0 68 ff              jmp16	check_case+932
 f0 34 16              ldsp16	r4, [sp+0x16]
 f4 39                 ldsp16	r5, [sp+0xe]
 11                    add	r4, r5
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 31 06              ldsp16	r1, [sp+0x6]
 f4 22                 ldsp16	r6, [sp+0x8]
 f0 32 14              ldsp16	r2, [sp+0x14]
 f0 37 10              ldsp16	r7, [sp+0x10]
 f0 0e 02              cmpi.s8	r2, 0x2
 d2 1a                 brult8	check_case+1135
 f4 30                 ldsp16	r4, [sp+0xc]
 cc 02                 cmpi.s8	r4, 0x2
 d8 0a                 bruge8	check_case+1125
 c1 02                 ldi8	r5, 0x2
 03                    mov	r4, r7
 f1 74                 zext8	r4
 31                    cmp	r4, r5
 d0 62                 breq8	check_case+1221
 d4 12                 jmp8	check_case+1143
 c1 03                 ldi8	r5, 0x3
 03                    mov	r4, r7
 f1 74                 zext8	r4
 31                    cmp	r4, r5
 d0 58                 breq8	check_case+1221
 d4 08                 jmp8	check_case+1143
 c1 01                 ldi8	r5, 0x1
 03                    mov	r4, r7
 f1 74                 zext8	r4
 31                    cmp	r4, r5
 d0 4e                 breq8	check_case+1221
 f0 0e 02              cmpi.s8	r2, 0x2
 d9 0d                 brsge8	check_case+1161
 f4 a2                 tst8	r2
 d0 23                 breq8	check_case+1187
 f0 0e 01              cmpi.s8	r2, 0x1
 d1 14                 brne8	check_case+1177
 c0 42                 ldi8	r4, 0x42
 d4 27                 jmp8	check_case+1200
 f0 0e 02              cmpi.s8	r2, 0x2
 d0 19                 breq8	check_case+1191
 f0 0e 03              cmpi.s8	r2, 0x3
 d1 06                 brne8	check_case+1177
 c1 41                 ldi8	r5, 0x41
 c0 42                 ldi8	r4, 0x42
 d4 12                 jmp8	check_case+1195
 c1 42                 ldi8	r5, 0x42
 cc 01                 cmpi.s8	r4, 0x1
 c0 0a                 ldi8	r4, 0xa
 fb 2c                 cmov.eq	r5, r4
 d4 06                 jmp8	check_case+1193
 c0 41                 ldi8	r4, 0x41
 d4 09                 jmp8	check_case+1200
 c1 42                 ldi8	r5, 0x42
 c0 41                 ldi8	r4, 0x41
 f4 a7                 tst8	r7
 fb 2c                 cmov.eq	r5, r4
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 0a                 cmpi.s8	r4, 0xa
 f4 af                 inc16	r7
 db 21 fe              brne16	check_case+730
 f4 28                 ldsp16	r4, [sp+0xa]
 f0 35 12              ldsp16	r5, [sp+0x12]
 14                    add	r5, r4
 f0 3d 12              stsp16	[sp+0x12], r5
 e0 09 fe              jmp16	check_case+718
 f1 01                 mov	r0, r1
 f4 09                 ldsp16	r5, [sp+0x2]
 0d                    mov	r7, r5
 c4 00 05              ldi16	r4, 0x500
 1c                    add	r7, r4
 f5 3d                 ld8u	r1, [r7]
 f0 34 36              ldsp16	r4, [sp+0x36]
 f1 74                 zext8	r4
 f0 39 36              stsp16	[sp+0x36], r1
 f5 0c                 cmp	r1, r4
 db 1b 02              brne16	check_case+1784
 f4 ad                 inc16	r5
 c4 00 04              ldi16	r4, 0x400
 34                    cmp	r5, r4
 f1 08                 mov	r1, r0
 f0 30 04              ldsp16	r0, [sp+0x4]
 db b7 fd              brne16	check_case+674
 a0                    xor	r4, r4
 e0 02 02              jmp16	check_case+1777
 c0 43                 ldi8	r4, 0x43
 c7 1d 01              ldi16	r7, 0x11d
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	check_case+1268
 f4 00                 ldsp16	r4, [sp+0x0]
 04                    mov	r5, r4
 f1 75                 zext8	r5
 0d                    mov	r7, r5
 fa a4                 lsr16i	r7, 0x4
 f0 03 30              ldi8	r3, 0x30
 0b                    mov	r6, r7
 f9 cd                 or	r6, r3
 cb 37                 addi.s8	r7, 0x37
 f0 01 a0              ldi8	r1, 0xa0
 f5 25                 cmp	r5, r1
 fc 3e                 cmov.ult	r7, r6
 f0 3f 2a              stsp16	[sp+0x2a], r7
 f0 02 0f              ldi8	r2, 0xf
 04                    mov	r5, r4
 f9 a8                 and	r5, r2
 09                    mov	r6, r5
 f9 cd                 or	r6, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2e                 cmov.ult	r5, r6
 08                    mov	r6, r4
 fa 9c                 lsr16i	r6, 0xc
 0e                    mov	r7, r6
 f9 ed                 or	r7, r3
 ca 37                 addi.s8	r6, 0x37
 f0 04 00 a0           ldi16	r0, 0xa000
 f5 20                 cmp	r4, r0
 fc 37                 cmov.ult	r6, r7
 fa 78                 lsr16i	r4, 0x8
 f9 88                 and	r4, r2
 0c                    mov	r7, r4
 f9 ed                 or	r7, r3
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 27                 cmov.ult	r4, r7
 0c                    mov	r7, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 58                 ldi8	r4, 0x58
 c7 22 01              ldi16	r7, 0x122
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	check_case+1377
 f0 37 36              ldsp16	r7, [sp+0x36]
 07                    mov	r5, r7
 f1 75                 zext8	r5
 f5 25                 cmp	r5, r1
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 0b                    mov	r6, r7
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 2a              stsp16	[sp+0x2a], r6
 0b                    mov	r6, r7
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ca 37                 addi.s8	r6, 0x37
 f5 2c                 cmp	r7, r0
 fc 34                 cmov.ult	r6, r4
 fa a8                 lsr16i	r7, 0x8
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 58                 ldi8	r4, 0x58
 c7 28 01              ldi16	r7, 0x128
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	check_case+1472
 f0 36 30              ldsp16	r6, [sp+0x30]
 f0 37 32              ldsp16	r7, [sp+0x32]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 f5 25                 cmp	r5, r1
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 36              stsp16	[sp+0x36], r5
 06                    mov	r5, r6
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 f5 28                 cmp	r6, r0
 fc 2c                 cmov.ult	r5, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f0 34 36              ldsp16	r4, [sp+0x36]
 d7 00                 sys	debug_putc
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 59                 ldi8	r4, 0x59
 c7 2d 01              ldi16	r7, 0x12d
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	check_case+1575
 f0 35 34              ldsp16	r5, [sp+0x34]
 0d                    mov	r7, r5
 f1 77                 zext8	r7
 f5 2d                 cmp	r7, r1
 fa a4                 lsr16i	r7, 0x4
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 09                    mov	r6, r5
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 36              stsp16	[sp+0x36], r6
 09                    mov	r6, r5
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ca 37                 addi.s8	r6, 0x37
 f5 24                 cmp	r5, r0
 fc 34                 cmov.ult	r6, r4
 fa 88                 lsr16i	r5, 0x8
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f0 34 36              ldsp16	r4, [sp+0x36]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 59                 ldi8	r4, 0x59
 c7 33 01              ldi16	r7, 0x133
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	check_case+1670
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 f5 25                 cmp	r5, r1
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 36              stsp16	[sp+0x36], r5
 06                    mov	r5, r6
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 34              stsp16	[sp+0x34], r5
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 f5 28                 cmp	r6, r0
 fc 2c                 cmov.ult	r5, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c8                 and	r6, r2
 f9 79                 or	r3, r6
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 33                 cmov.ult	r6, r3
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f0 34 36              ldsp16	r4, [sp+0x36]
 d7 00                 sys	debug_putc
 f0 34 34              ldsp16	r4, [sp+0x34]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d4 06                 jmp8	check_case+1775
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 24                 mov	r5, r0
 d5 12                 call8	fail_byte
 c0 01                 ldi8	r4, 0x1
 d6 3e                 adjsp	0x3e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 08                    mov	r6, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 07                    mov	r5, r7
 f0 37 36              ldsp16	r7, [sp+0x36]
 d4 ec                 jmp8	check_case+1773

<fail_byte>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f4 63                 stsp16	[sp+0x8], r7
 f4 5a                 stsp16	[sp+0x6], r6
 f4 51                 stsp16	[sp+0x4], r5
 f4 48                 stsp16	[sp+0x2], r4
 c0 43                 ldi8	r4, 0x43
 c6 1d 01              ldi16	r6, 0x11d
 f7 17                 ld8u	r7, [r6+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a7                 tst8	r7
 03                    mov	r4, r7
 d1 f5                 brne8	fail_byte+19
 f4 0a                 ldsp16	r6, [sp+0x2]
 02                    mov	r4, r6
 f1 74                 zext8	r4
 0c                    mov	r7, r4
 fa a4                 lsr16i	r7, 0x4
 f0 00 30              ldi8	r0, 0x30
 07                    mov	r5, r7
 f9 a1                 or	r5, r0
 cb 37                 addi.s8	r7, 0x37
 f0 02 a0              ldi8	r2, 0xa0
 f5 22                 cmp	r4, r2
 fc 3d                 cmov.ult	r7, r5
 f4 43                 stsp16	[sp+0x0], r7
 f0 01 0f              ldi8	r1, 0xf
 06                    mov	r5, r6
 f9 a4                 and	r5, r1
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 0e                    mov	r7, r6
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cb 37                 addi.s8	r7, 0x37
 f0 07 00 a0           ldi16	r3, 0xa000
 f5 2b                 cmp	r6, r3
 fc 3c                 cmov.ult	r7, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c4                 and	r6, r1
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 c7 50 01              ldi16	r7, 0x150
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	fail_byte+125
 f4 12                 ldsp16	r6, [sp+0x4]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 f5 26                 cmp	r5, r2
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 0e                    mov	r7, r6
 f9 e4                 and	r7, r1
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f4 4b                 stsp16	[sp+0x2], r7
 0e                    mov	r7, r6
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cb 37                 addi.s8	r7, 0x37
 f5 2b                 cmp	r6, r3
 fc 3c                 cmov.ult	r7, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c4                 and	r6, r1
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 57                 ldi8	r4, 0x57
 c7 55 01              ldi16	r7, 0x155
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	fail_byte+217
 f4 1a                 ldsp16	r6, [sp+0x6]
 06                    mov	r5, r6
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 f5 2a                 cmp	r6, r2
 fc 2c                 cmov.ult	r5, r4
 f9 c4                 and	r6, r1
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 47                 ldi8	r4, 0x47
 c7 5a 01              ldi16	r7, 0x15a
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	fail_byte+278
 f4 22                 ldsp16	r6, [sp+0x8]
 06                    mov	r5, r6
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 f5 2a                 cmp	r6, r2
 fc 2c                 cmov.ult	r5, r4
 f9 38                 and	r1, r6
 f9 05                 or	r0, r1
 f0 0d 0a              cmpi.s8	r1, 0xa
 f0 09 37              addi.s8	r1, 0x37
 fc 08                 cmov.ult	r1, r0
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
