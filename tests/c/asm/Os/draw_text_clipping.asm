
draw_text_clipping.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 draw_text_clipping.c
00000530 l     F .text	00000630 check_case
00000d0a l     O .rodata	00000022 multi_page_font
00000cf2 l     O .rodata	00000018 single_page_font
00000110 l     O .data	00000002 ram_b
00000d2e l     O .rodata	00000002 program_b
00000115 l     O .data	00000003 ram_ba
00000d33 l     O .rodata	00000003 program_ba
00000118 l     O .data	00000004 ram_a_newline_b
00000d36 l     O .rodata	00000004 program_a_newline_b
0000010e l     O .data	00000002 ram_a
00000112 l     O .data	00000003 ram_ab
00000d2c l     O .rodata	00000002 program_a
00000d30 l     O .rodata	00000003 program_ab
00000108 l     O .data	00000006 format_newline
00000100 l     O .data	00000003 format_one
00000103 l     O .data	00000005 format_two
00000cbd l     F .text	00000033 logical_char
0000013a l     O .data	00000004 single_b_image
00000137 l     O .data	00000003 single_a_image
0000013e l     O .data	00000008 multi_a_image
00000146 l     O .data	00000009 multi_b_image
0000011c l     O .data	00000005 .L.str
00000121 l     O .data	00000006 .L.str.1
00000127 l     O .data	00000005 .L.str.2
0000012c l     O .data	00000006 .L.str.3
00000132 l     O .data	00000005 .L.str.4
00000b60 l     F .text	0000015d fail_byte
0000014f l     O .data	00000005 .L.str.5
00000154 l     O .data	00000005 .L.str.6
00000000 l    df *ABS*	00000000 runtime.c
00000d3a l       .init_array	00000000 .hidden __init_array_end
00000d3a l       .init_array	00000000 .hidden __init_array_start
00000d3a l       .fini_array	00000000 .hidden __fini_array_start
00000d3a l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000259 avm_test_main
00000cf0 g     F .text	00000002 avm_halt
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
 e1 d2 0a              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 3a 0d              ldi16	r4, 0xd3a
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 3a 0d              ldi16	r6, 0xd3a
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 3a 0d           ldi16	r0, 0xd3a
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 3a 0d           ldi16	r2, 0xd3a
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
 c4 3a 0d              ldi16	r4, 0xd3a
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 3a 0d              ldi16	r6, 0xd3a
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 3a 0d           ldi16	r2, 0xd3a
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 3a 0d           ldi16	r0, 0xd3a
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
 d6 c4                 adjsp	-0x3c
 f0 3e 28              stsp16	[sp+0x28], r6
 f0 3d 2a              stsp16	[sp+0x2a], r5
 f4 40                 stsp16	[sp+0x0], r4
 f0 02 04              ldi8	r2, 0x4
 f0 04 00 09           ldi16	r0, 0x900
 f0 05 fc 04           ldi16	r1, 0x4fc
 c1 5a                 ldi8	r5, 0x5a
 c0 a5                 ldi8	r4, 0xa5
 f0 1b 4c              ldsp8u	r3, [sp+0x4c]
 f0 36 4a              ldsp16	r6, [sp+0x4a]
 f4 5a                 stsp16	[sp+0x6], r6
 f0 36 48              ldsp16	r6, [sp+0x48]
 f4 6a                 stsp16	[sp+0xa], r6
 f0 1e 47              ldsp8u	r6, [sp+0x47]
 f0 3e 16              stsp16	[sp+0x16], r6
 08                    mov	r6, r4
 f9 ce                 xor	r6, r3
 f0 6d c3              st8	[r1+], r6
 09                    mov	r6, r5
 f9 ce                 xor	r6, r3
 f0 6d c1              st8	[r0+], r6
 c8 11                 addi.s8	r4, 0x11
 c9 1d                 addi.s8	r5, 0x1d
 f4 b2                 dec16	r2
 f6 2a                 tst16	r2
 d1 ea                 brne8	check_case+48
 f0 04 00 05           ldi16	r0, 0x500
 aa                    xor	r6, r6
 02                    mov	r4, r6
 06                    mov	r5, r6
 fa 82                 lsr16i	r5, 0x2
 a4                    xor	r5, r4
 f9 ae                 xor	r5, r3
 f0 6d a1              st8	[r0+], r5
 c8 25                 addi.s8	r4, 0x25
 f4 ae                 inc16	r6
 c5 00 04              ldi16	r5, 0x400
 39                    cmp	r6, r5
 d1 ed                 brne8	check_case+76
 c4 0a 0d              ldi16	r4, 0xd0a
 c1 00                 ldi8	r5, 0x0
 f0 04 f2 0c           ldi16	r0, 0xcf2
 f0 01 00              ldi8	r1, 0x0
 f0 36 2a              ldsp16	r6, [sp+0x2a]
 f4 a6                 tst8	r6
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 d7 31                 sys	set_text_font
 f0 34 28              ldsp16	r4, [sp+0x28]
 d7 32                 sys	set_text_mode
 cf 01                 cmpi.s8	r7, 0x1
 f0 32 06              ldsp16	r2, [sp+0x6]
 d0 1a                 breq8	check_case+156
 f4 a7                 tst8	r7
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 34 16              ldsp16	r4, [sp+0x16]
 d1 2a                 brne8	check_case+181
 cc 02                 cmpi.s8	r4, 0x2
 d9 37                 brsge8	check_case+198
 f4 a4                 tst8	r4
 d0 69                 breq8	check_case+252
 cc 01                 cmpi.s8	r4, 0x1
 d1 59                 brne8	check_case+240
 c6 10 01              ldi16	r6, 0x110
 d4 68                 jmp8	check_case+260
 f0 34 16              ldsp16	r4, [sp+0x16]
 cc 02                 cmpi.s8	r4, 0x2
 f0 30 0a              ldsp16	r0, [sp+0xa]
 d9 2d                 brsge8	check_case+211
 f4 a4                 tst8	r4
 d0 61                 breq8	check_case+267
 cc 01                 cmpi.s8	r4, 0x1
 d1 47                 brne8	check_case+245
 c6 2e 0d              ldi16	r6, 0xd2e
 c3 00                 ldi8	r7, 0x0
 d4 62                 jmp8	check_case+279
 cc 02                 cmpi.s8	r4, 0x2
 d9 29                 brsge8	check_case+226
 f4 a4                 tst8	r4
 da 83 00              breq16	check_case+321
 cc 01                 cmpi.s8	r4, 0x1
 d1 6d                 brne8	check_case+303
 c0 42                 ldi8	r4, 0x42
 d4 7d                 jmp8	check_case+323
 cc 02                 cmpi.s8	r4, 0x2
 d0 37                 breq8	check_case+257
 cc 03                 cmpi.s8	r4, 0x3
 d1 22                 brne8	check_case+240
 c6 15 01              ldi16	r6, 0x115
 d4 31                 jmp8	check_case+260
 cc 02                 cmpi.s8	r4, 0x2
 d0 3b                 breq8	check_case+274
 cc 03                 cmpi.s8	r4, 0x3
 d1 1a                 brne8	check_case+245
 c6 33 0d              ldi16	r6, 0xd33
 c3 00                 ldi8	r7, 0x0
 d4 35                 jmp8	check_case+279
 cc 02                 cmpi.s8	r4, 0x2
 d0 68                 breq8	check_case+334
 cc 03                 cmpi.s8	r4, 0x3
 d1 45                 brne8	check_case+303
 c0 42                 ldi8	r4, 0x42
 c1 41                 ldi8	r5, 0x41
 d4 62                 jmp8	check_case+338
 c6 18 01              ldi16	r6, 0x118
 d4 0f                 jmp8	check_case+260
 c6 36 0d              ldi16	r6, 0xd36
 c3 00                 ldi8	r7, 0x0
 d4 1b                 jmp8	check_case+279
 c6 0e 01              ldi16	r6, 0x10e
 d4 03                 jmp8	check_case+260
 c6 12 01              ldi16	r6, 0x112
 03                    mov	r4, r7
 f1 26                 mov	r5, r2
 d7 33                 sys	draw_text
 d4 5d                 jmp8	check_case+360
 c6 2c 0d              ldi16	r6, 0xd2c
 c3 00                 ldi8	r7, 0x0
 d4 05                 jmp8	check_case+279
 c6 30 0d              ldi16	r6, 0xd30
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 f1 26                 mov	r5, r2
 d7 34                 sys	draw_text_p
 f0 3c 30              stsp16	[sp+0x30], r4
 f0 3d 32              stsp16	[sp+0x32], r5
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 3d 2e              stsp16	[sp+0x2e], r5
 f1 2c                 mov	r7, r0
 d4 47                 jmp8	check_case+374
 c0 41                 ldi8	r4, 0x41
 c1 42                 ldi8	r5, 0x42
 f0 3c 38              stsp16	[sp+0x38], r4
 f0 3d 3a              stsp16	[sp+0x3a], r5
 f0 10 38              leasp	r0, 0x38
 c6 08 01              ldi16	r6, 0x108
 d4 1d                 jmp8	check_case+350
 c0 41                 ldi8	r4, 0x41
 f0 3c 38              stsp16	[sp+0x38], r4
 f0 10 38              leasp	r0, 0x38
 c6 00 01              ldi16	r6, 0x100
 d4 10                 jmp8	check_case+350
 c0 41                 ldi8	r4, 0x41
 c1 42                 ldi8	r5, 0x42
 f0 3c 38              stsp16	[sp+0x38], r4
 f0 3d 3a              stsp16	[sp+0x3a], r5
 f0 10 38              leasp	r0, 0x38
 c6 03 01              ldi16	r6, 0x103
 03                    mov	r4, r7
 f1 26                 mov	r5, r2
 f1 10                 mov	r2, r0
 d7 35                 sys	draw_textfv
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 3c 30              stsp16	[sp+0x30], r4
 f0 3d 32              stsp16	[sp+0x32], r5
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 3d 2e              stsp16	[sp+0x2e], r5
 c2 13                 ldi8	r6, 0x13
 c0 0a                 ldi8	r4, 0xa
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 f4 a5                 tst8	r5
 fb 34                 cmov.eq	r6, r4
 f4 62                 stsp16	[sp+0x8], r6
 f2 30                 sub	r0, r0
 f0 01 01              ldi8	r1, 0x1
 f0 34 16              ldsp16	r4, [sp+0x16]
 04                    mov	r5, r4
 c9 fe                 addi.s8	r5, -0x2
 f4 71                 stsp16	[sp+0xc], r5
 f1 26                 mov	r5, r2
 f0 3d 34              stsp16	[sp+0x34], r5
 cc 02                 cmpi.s8	r4, 0x2
 f1 21                 mov	r4, r1
 d2 0c                 brult8	check_case+423
 f4 30                 ldsp16	r4, [sp+0xc]
 cc 02                 cmpi.s8	r4, 0x2
 d8 04                 bruge8	check_case+421
 c0 02                 ldi8	r4, 0x2
 d4 02                 jmp8	check_case+423
 c0 03                 ldi8	r4, 0x3
 f1 24                 mov	r5, r0
 f1 75                 zext8	r5
 34                    cmp	r5, r4
 f0 3f 36              stsp16	[sp+0x36], r7
 d0 3b                 breq8	check_case+492
 f0 34 16              ldsp16	r4, [sp+0x16]
 e1 d6 05              call16	logical_char
 f1 74                 zext8	r4
 cc 0a                 cmpi.s8	r4, 0xa
 d1 0d                 brne8	check_case+458
 f4 20                 ldsp16	r4, [sp+0x8]
 f0 35 34              ldsp16	r5, [sp+0x34]
 14                    add	r5, r4
 f0 3d 34              stsp16	[sp+0x34], r5
 f4 2b                 ldsp16	r7, [sp+0xa]
 d4 15                 jmp8	check_case+479
 c1 06                 ldi8	r5, 0x6
 c2 04                 ldi8	r6, 0x4
 cc 41                 cmpi.s8	r4, 0x41
 fb 2e                 cmov.eq	r5, r6
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 f4 a4                 tst8	r4
 c0 05                 ldi8	r4, 0x5
 fb 25                 cmov.eq	r4, r5
 f0 37 36              ldsp16	r7, [sp+0x36]
 1c                    add	r7, r4
 f4 a8                 inc16	r0
 f0 34 16              ldsp16	r4, [sp+0x16]
 cc 02                 cmpi.s8	r4, 0x2
 f1 21                 mov	r4, r1
 d8 b1                 bruge8	check_case+411
 d4 bb                 jmp8	check_case+423
 f0 34 30              ldsp16	r4, [sp+0x30]
 f0 35 32              ldsp16	r5, [sp+0x32]
 3c                    cmp	r7, r4
 db 33 02              brne16	check_case+1065
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 f0 35 2e              ldsp16	r5, [sp+0x2e]
 f0 36 34              ldsp16	r6, [sp+0x34]
 38                    cmp	r6, r4
 db 26 02              brne16	check_case+1065
 f0 00 a5              ldi8	r0, 0xa5
 c5 fc 04              ldi16	r5, 0x4fc
 01                    mov	r4, r5
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f1 28                 mov	r6, r0
 f9 ce                 xor	r6, r3
 f1 76                 zext8	r6
 4c                    ld8u	r7, [r4]
 3e                    cmp	r7, r6
 db 0b 04              brne16	check_case+1571
 f0 08 11              addi.s8	r0, 0x11
 f4 ac                 inc16	r4
 f4 ad                 inc16	r5
 c6 00 05              ldi16	r6, 0x500
 36                    cmp	r5, r6
 d1 e8                 brne8	check_case+525
 f0 00 5a              ldi8	r0, 0x5a
 c5 00 09              ldi16	r5, 0x900
 01                    mov	r4, r5
 f1 28                 mov	r6, r0
 f9 ce                 xor	r6, r3
 f1 76                 zext8	r6
 4c                    ld8u	r7, [r4]
 3e                    cmp	r7, r6
 db ec 03              brne16	check_case+1571
 f0 08 1d              addi.s8	r0, 0x1d
 f4 ac                 inc16	r4
 f4 ad                 inc16	r5
 c6 04 09              ldi16	r6, 0x904
 36                    cmp	r5, r6
 d1 e8                 brne8	check_case+556
 a0                    xor	r4, r4
 08                    mov	r6, r4
 f0 3b 04              stsp16	[sp+0x4], r3
 c0 25                 ldi8	r4, 0x25
 06                    mov	r5, r6
 fe 2c                 mul16	r5, r4
 02                    mov	r4, r6
 fa 72                 lsr16i	r4, 0x2
 a1                    xor	r4, r5
 f9 8e                 xor	r4, r3
 f0 3c 36              stsp16	[sp+0x36], r4
 c0 7f                 ldi8	r4, 0x7f
 82                    and	r4, r6
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f4 4a                 stsp16	[sp+0x2], r6
 fa 94                 lsr16i	r6, 0x4
 c4 f8 07              ldi16	r4, 0x7f8
 f0 3e 26              stsp16	[sp+0x26], r6
 82                    and	r4, r6
 f0 3c 34              stsp16	[sp+0x34], r4
 c8 08                 addi.s8	r4, 0x8
 f0 3c 30              stsp16	[sp+0x30], r4
 a0                    xor	r4, r4
 04                    mov	r5, r4
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 39 12              stsp16	[sp+0x12], r1
 f0 34 16              ldsp16	r4, [sp+0x16]
 cc 02                 cmpi.s8	r4, 0x2
 d2 0a                 brult8	check_case+649
 f4 30                 ldsp16	r4, [sp+0xc]
 cc 02                 cmpi.s8	r4, 0x2
 d8 08                 bruge8	check_case+653
 c0 02                 ldi8	r4, 0x2
 d4 06                 jmp8	check_case+655
 c0 01                 ldi8	r4, 0x1
 d4 02                 jmp8	check_case+655
 c0 03                 ldi8	r4, 0x3
 f0 3d 14              stsp16	[sp+0x14], r5
 f1 75                 zext8	r5
 34                    cmp	r5, r4
 da 73 01              breq16	check_case+1035
 f0 34 16              ldsp16	r4, [sp+0x16]
 e1 ef 04              call16	logical_char
 04                    mov	r5, r4
 f1 75                 zext8	r5
 cd 0a                 cmpi.s8	r5, 0xa
 d1 0f                 brne8	check_case+692
 f4 20                 ldsp16	r4, [sp+0x8]
 f0 35 10              ldsp16	r5, [sp+0x10]
 14                    add	r5, r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 39 12              stsp16	[sp+0x12], r1
 e0 4f 01              jmp16	check_case+1027
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 f4 a4                 tst8	r4
 f0 00 07              ldi8	r0, 0x7
 d0 20                 breq8	check_case+734
 c3 03                 ldi8	r7, 0x3
 c0 04                 ldi8	r4, 0x4
 cd 41                 cmpi.s8	r5, 0x41
 fb 3c                 cmov.eq	r7, r4
 f0 05 f8 ff           ldi16	r1, 0xfff8
 c4 f6 ff              ldi16	r4, 0xfff6
 fb 0c                 cmov.eq	r1, r4
 f0 02 11              ldi8	r2, 0x11
 c0 0d                 ldi8	r4, 0xd
 cd 41                 cmpi.s8	r5, 0x41
 fb 14                 cmov.eq	r2, r4
 c0 05                 ldi8	r4, 0x5
 f4 78                 stsp16	[sp+0xe], r4
 d4 1e                 jmp8	check_case+764
 c0 06                 ldi8	r4, 0x6
 c3 04                 ldi8	r7, 0x4
 cd 41                 cmpi.s8	r5, 0x41
 fb 27                 cmov.eq	r4, r7
 f4 78                 stsp16	[sp+0xe], r4
 c0 03                 ldi8	r4, 0x3
 fb 3c                 cmov.eq	r7, r4
 f0 05 fc ff           ldi16	r1, 0xfffc
 c4 fa ff              ldi16	r4, 0xfffa
 cd 41                 cmpi.s8	r5, 0x41
 fb 0c                 cmov.eq	r1, r4
 f0 02 08              ldi8	r2, 0x8
 fb 10                 cmov.eq	r2, r0
 c0 01                 ldi8	r4, 0x1
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 3d 24              stsp16	[sp+0x24], r5
 cd 41                 cmpi.s8	r5, 0x41
 04                    mov	r5, r4
 fb 28                 cmov.eq	r5, r0
 c4 3a 01              ldi16	r4, 0x13a
 08                    mov	r6, r4
 c4 37 01              ldi16	r4, 0x137
 fb 34                 cmov.eq	r6, r4
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 34 12              ldsp16	r4, [sp+0x12]
 14                    add	r5, r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 f2 0c                 add	r1, r4
 f0 39 1a              stsp16	[sp+0x1a], r1
 a5                    xor	r5, r5
 f1 72                 zext8	r2
 f1 77                 zext8	r7
 f1 0d                 mov	r1, r5
 f0 3f 20              stsp16	[sp+0x20], r7
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f2 21                 add	r4, r1
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 31                    cmp	r4, r5
 db a2 00              brne16	check_case+992
 f0 34 18              ldsp16	r4, [sp+0x18]
 f2 21                 add	r4, r1
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f2 4b                 sub	r3, r3
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 cd 40                 cmpi.s8	r5, 0x40
 df 83 00              brsge16	check_case+979
 f0 34 34              ldsp16	r4, [sp+0x34]
 34                    cmp	r5, r4
 d3 7d                 brslt8	check_case+979
 f0 34 30              ldsp16	r4, [sp+0x30]
 34                    cmp	r5, r4
 d9 77                 brsge8	check_case+979
 c0 f8                 ldi8	r4, 0xf8
 f1 2b                 mov	r6, r3
 88                    and	r6, r4
 f0 37 2a              ldsp16	r7, [sp+0x2a]
 f4 a7                 tst8	r7
 f0 30 2c              ldsp16	r0, [sp+0x2c]
 d0 22                 breq8	check_case+909
 fa 93                 lsr16i	r6, 0x3
 f0 37 24              ldsp16	r7, [sp+0x24]
 cf 41                 cmpi.s8	r7, 0x41
 d1 0b                 brne8	check_case+895
 fa 52                 lsl16i	r6, 0x2
 f2 29                 add	r6, r1
 f1 76                 zext8	r6
 c7 3e 01              ldi16	r7, 0x13e
 d4 0b                 jmp8	check_case+906
 c3 03                 ldi8	r7, 0x3
 f3 1b                 mulu8.w	r6, r7
 f2 29                 add	r6, r1
 f1 76                 zext8	r6
 c7 46 01              ldi16	r7, 0x146
 1b                    add	r6, r7
 f1 06                 mov	r0, r6
 f1 2b                 mov	r6, r3
 c3 07                 ldi8	r7, 0x7
 8b                    and	r6, r7
 c3 01                 ldi8	r7, 0x1
 fa 0e                 shl16v	r7, r6
 ed c0 20              ld8u	r6, [r0+0]
 8b                    and	r6, r7
 f0 37 26              ldsp16	r7, [sp+0x26]
 83                    and	r4, r7
 0d                    mov	r7, r5
 2c                    sub	r7, r4
 f1 77                 zext8	r7
 c0 01                 ldi8	r4, 0x1
 fa 03                 shl16v	r4, r7
 f0 37 28              ldsp16	r7, [sp+0x28]
 cf 02                 cmpi.s8	r7, 0x2
 d0 0d                 breq8	check_case+954
 f4 a7                 tst8	r7
 d1 13                 brne8	check_case+964
 f4 a6                 tst8	r6
 d1 09                 brne8	check_case+958
 c6 ff ff              ldi16	r6, 0xffff
 d4 11                 jmp8	check_case+971
 f4 a6                 tst8	r6
 d0 15                 breq8	check_case+979
 f0 36 36              ldsp16	r6, [sp+0x36]
 98                    or	r6, r4
 d4 0c                 jmp8	check_case+976
 f4 a6                 tst8	r6
 d0 0b                 breq8	check_case+979
 c6 ff ff              ldi16	r6, 0xffff
 a2                    xor	r4, r6
 f0 36 36              ldsp16	r6, [sp+0x36]
 88                    and	r6, r4
 f0 3e 36              stsp16	[sp+0x36], r6
 f4 ad                 inc16	r5
 f4 ab                 inc16	r3
 f1 23                 mov	r4, r3
 f1 74                 zext8	r4
 f5 14                 cmp	r2, r4
 db 6b ff              brne16	check_case+843
 f4 a9                 inc16	r1
 f0 35 22              ldsp16	r5, [sp+0x22]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 f0 37 20              ldsp16	r7, [sp+0x20]
 33                    cmp	r4, r7
 db 3e ff              brne16	check_case+815
 f0 34 12              ldsp16	r4, [sp+0x12]
 f4 39                 ldsp16	r5, [sp+0xe]
 11                    add	r4, r5
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 33 04              ldsp16	r3, [sp+0x4]
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f4 ad                 inc16	r5
 e0 6d fe              jmp16	check_case+632
 f4 0a                 ldsp16	r6, [sp+0x2]
 06                    mov	r5, r6
 c4 00 05              ldi16	r4, 0x500
 14                    add	r5, r4
 4d                    ld8u	r7, [r5]
 f0 34 36              ldsp16	r4, [sp+0x36]
 f1 74                 zext8	r4
 3c                    cmp	r7, r4
 db 06 02              brne16	check_case+1570
 f4 ae                 inc16	r6
 c4 00 04              ldi16	r4, 0x400
 38                    cmp	r6, r4
 db 24 fe              brne16	check_case+585
 a0                    xor	r4, r4
 e0 00 02              jmp16	check_case+1577
 c0 43                 ldi8	r4, 0x43
 c7 1d 01              ldi16	r7, 0x11d
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	check_case+1070
 f4 02                 ldsp16	r6, [sp+0x0]
 02                    mov	r4, r6
 f1 74                 zext8	r4
 0c                    mov	r7, r4
 fa a4                 lsr16i	r7, 0x4
 f0 03 30              ldi8	r3, 0x30
 07                    mov	r5, r7
 f9 ad                 or	r5, r3
 cb 37                 addi.s8	r7, 0x37
 f0 01 a0              ldi8	r1, 0xa0
 f5 21                 cmp	r4, r1
 fc 3d                 cmov.ult	r7, r5
 f0 3f 2a              stsp16	[sp+0x2a], r7
 f0 02 0f              ldi8	r2, 0xf
 0e                    mov	r7, r6
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 f0 04 00 a0           ldi16	r0, 0xa000
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
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
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
 d1 f5                 brne8	check_case+1178
 f0 37 36              ldsp16	r7, [sp+0x36]
 0b                    mov	r6, r7
 f1 76                 zext8	r6
 f5 29                 cmp	r6, r1
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 07                    mov	r5, r7
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 07                    mov	r5, r7
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 f5 2c                 cmp	r7, r0
 fc 2c                 cmov.ult	r5, r4
 fa a8                 lsr16i	r7, 0x8
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
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
 d1 f5                 brne8	check_case+1273
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
 d1 f5                 brne8	check_case+1376
 f0 37 34              ldsp16	r7, [sp+0x34]
 0b                    mov	r6, r7
 f1 76                 zext8	r6
 f5 29                 cmp	r6, r1
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 07                    mov	r5, r7
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 36              stsp16	[sp+0x36], r5
 07                    mov	r5, r7
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 f5 2c                 cmp	r7, r0
 fc 2c                 cmov.ult	r5, r4
 fa a8                 lsr16i	r7, 0x8
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
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
 d1 f5                 brne8	check_case+1471
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
 d4 05                 jmp8	check_case+1575
 08                    mov	r6, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d5 09                 call8	fail_byte
 c0 01                 ldi8	r4, 0x1
 d6 3c                 adjsp	0x3c
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<fail_byte>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f4 5b                 stsp16	[sp+0x6], r7
 f4 62                 stsp16	[sp+0x8], r6
 f4 51                 stsp16	[sp+0x4], r5
 f4 48                 stsp16	[sp+0x2], r4
 c0 43                 ldi8	r4, 0x43
 c7 1d 01              ldi16	r7, 0x11d
 f7 1e                 ld8u	r6, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a6                 tst8	r6
 02                    mov	r4, r6
 d1 f5                 brne8	fail_byte+19
 f4 0b                 ldsp16	r7, [sp+0x2]
 03                    mov	r4, r7
 f1 74                 zext8	r4
 08                    mov	r6, r4
 fa 94                 lsr16i	r6, 0x4
 f0 00 30              ldi8	r0, 0x30
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ca 37                 addi.s8	r6, 0x37
 f0 01 a0              ldi8	r1, 0xa0
 f5 21                 cmp	r4, r1
 fc 35                 cmov.ult	r6, r5
 f4 42                 stsp16	[sp+0x0], r6
 f0 02 0f              ldi8	r2, 0xf
 07                    mov	r5, r7
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 0b                    mov	r6, r7
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ca 37                 addi.s8	r6, 0x37
 f0 07 00 a0           ldi16	r3, 0xa000
 f5 2f                 cmp	r7, r3
 fc 34                 cmov.ult	r6, r4
 fa a8                 lsr16i	r7, 0x8
 f9 e8                 and	r7, r2
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
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
 f5 25                 cmp	r5, r1
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 0e                    mov	r7, r6
 f9 e8                 and	r7, r2
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
 f9 c8                 and	r6, r2
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
 f4 21                 ldsp16	r5, [sp+0x8]
 09                    mov	r6, r5
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f4 52                 stsp16	[sp+0x4], r6
 f5 25                 cmp	r5, r1
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 1b                 ldsp16	r7, [sp+0x6]
 03                    mov	r4, r7
 fa 74                 lsr16i	r4, 0x4
 f4 60                 stsp16	[sp+0x8], r4
 f4 22                 ldsp16	r6, [sp+0x8]
 f9 c1                 or	r6, r0
 f4 62                 stsp16	[sp+0x8], r6
 c8 37                 addi.s8	r4, 0x37
 f5 2d                 cmp	r7, r1
 f4 22                 ldsp16	r6, [sp+0x8]
 fc 26                 cmov.ult	r4, r6
 f4 60                 stsp16	[sp+0x8], r4
 f9 e8                 and	r7, r2
 f9 1d                 or	r0, r7
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 38                 cmov.ult	r7, r0
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 47                 ldi8	r4, 0x47
 d7 00                 sys	debug_putc
 c0 4f                 ldi8	r4, 0x4f
 d7 00                 sys	debug_putc
 c0 54                 ldi8	r4, 0x54
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<logical_char>:
 cc 02                 cmpi.s8	r4, 0x2
 d9 0b                 brsge8	logical_char+15
 f4 a4                 tst8	r4
 d0 1f                 breq8	logical_char+39
 cc 01                 cmpi.s8	r4, 0x1
 d1 11                 brne8	logical_char+29
 c0 42                 ldi8	r4, 0x42
 ef                    ret
 cc 02                 cmpi.s8	r4, 0x2
 d0 17                 breq8	logical_char+42
 cc 03                 cmpi.s8	r4, 0x3
 d1 06                 brne8	logical_char+29
 c0 41                 ldi8	r4, 0x41
 c2 42                 ldi8	r6, 0x42
 d4 11                 jmp8	logical_char+46
 c0 42                 ldi8	r4, 0x42
 c2 0a                 ldi8	r6, 0xa
 cd 01                 cmpi.s8	r5, 0x1
 fb 26                 cmov.eq	r4, r6
 d4 05                 jmp8	logical_char+44
 c0 41                 ldi8	r4, 0x41
 ef                    ret
 c0 42                 ldi8	r4, 0x42
 c2 41                 ldi8	r6, 0x41
 f4 a5                 tst8	r5
 fb 26                 cmov.eq	r4, r6
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
