
draw_text_clipping.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 draw_text_clipping.c
0000056e l     F .text	00000130 check_case
0000069e l     F .text	00000064 prepare_memory
00000711 l     F .text	0000002b font_pointer
00000702 l     F .text	0000000f avm_set_text_font
0000073c l     F .text	0000000b avm_set_text_mode
00000747 l     F .text	0000014b invoke_draw
00000892 l     F .text	00000091 reference_cursor
00000923 l     F .text	0000003c fail_cursor
0000095f l     F .text	0000009a check_guards
000009f9 l     F .text	000001e8 expected_byte
00000be1 l     F .text	00000031 fail_byte
00000c12 l     F .text	00000016 guard_before_byte
00000c28 l     F .text	00000016 guard_after_byte
00000c3e l     F .text	00000018 initial_byte
00000fd4 l     O .rodata	00000018 single_page_font
00000fec l     O .rodata	00000022 multi_page_font
00000c74 l     F .text	0000004e ram_text
00000c56 l     F .text	0000001e avm_draw_text
00000ce3 l     F .text	00000066 program_text
00000cc2 l     F .text	00000021 avm_draw_text_P
00000100 l     O .data	00000003 format_one
00000d49 l     F .text	00000018 __avm_text_cursor_from_u32
00000103 l     O .data	00000005 format_two
00000108 l     O .data	00000006 format_newline
00000d61 l     F .text	0000002f logical_length
00000d90 l     F .text	00000077 logical_char
00000e07 l     F .text	00000011 font_line_height
00000e18 l     F .text	000000b7 reference_glyph
0000011c l     O .data	00000005 .L.str
00000ecf l     F .text	00000019 test_line16
00000121 l     O .data	00000006 .L.str.1
00000127 l     O .data	00000005 .L.str.2
0000012c l     O .data	00000006 .L.str.3
00000132 l     O .data	00000005 .L.str.4
00000f69 l     F .text	00000069 reference_image_byte
0000014f l     O .data	00000005 .L.str.5
00000154 l     O .data	00000005 .L.str.6
00000159 l     O .data	00000004 .L.str.7
0000010e l     O .data	00000002 ram_a
00000110 l     O .data	00000002 ram_b
00000112 l     O .data	00000003 ram_ab
00000115 l     O .data	00000003 ram_ba
00000118 l     O .data	00000004 ram_a_newline_b
0000100e l     O .rodata	00000002 program_a
00001010 l     O .rodata	00000002 program_b
00001012 l     O .rodata	00000003 program_ab
00001015 l     O .rodata	00000003 program_ba
00001018 l     O .rodata	00000004 program_a_newline_b
00000ee8 l     F .text	00000022 test_puts
00000f0a l     F .text	0000000b test_putc
00000f15 l     F .text	0000000f test_hex16
00000f24 l     F .text	00000019 test_hex8
00000f3d l     F .text	0000002c test_hex_digit
00000137 l     O .data	00000003 single_a_image
0000013a l     O .data	00000004 single_b_image
0000013e l     O .data	00000008 multi_a_image
00000146 l     O .data	00000009 multi_b_image
00000000 l    df *ABS*	00000000 runtime.c
0000101c l       .init_array	00000000 .hidden __init_array_end
0000101c l       .init_array	00000000 .hidden __init_array_start
0000101c l       .fini_array	00000000 .hidden __fini_array_start
0000101c l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000297 avm_test_main
00000fd2 g     F .text	00000002 avm_halt
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
 e1 b4 0d              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 1c 10              ldi16	r4, 0x101c
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 1c 10              ldi16	r6, 0x101c
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 1c 10           ldi16	r0, 0x101c
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 1c 10           ldi16	r2, 0x101c
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
 c4 1c 10              ldi16	r4, 0x101c
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 1c 10              ldi16	r6, 0x101c
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 1c 10           ldi16	r2, 0x101c
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 1c 10           ldi16	r0, 0x101c
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
 d6 fe                 adjsp	-0x2
 d6 fa                 adjsp	-0x6
 c0 31                 ldi8	r4, 0x31
 f1 44                 stsp8	[sp+0x5], r4
 c0 0c                 ldi8	r4, 0xc
 f4 4c                 stsp16	[sp+0x3], r4
 c0 06                 ldi8	r4, 0x6
 f4 44                 stsp16	[sp+0x1], r4
 c0 02                 ldi8	r4, 0x2
 f1 30                 stsp8	[sp+0x0], r4
 af                    xor	r7, r7
 03                    mov	r4, r7
 07                    mov	r5, r7
 0b                    mov	r6, r7
 e1 7c 02              call16	check_case
 d6 06                 adjsp	0x6
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+42
 d4 00                 jmp8	avm_test_main+35
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 e0 68 02              jmp16	avm_test_main+658
 d6 fa                 adjsp	-0x6
 c0 c7                 ldi8	r4, 0xc7
 f1 44                 stsp8	[sp+0x5], r4
 c0 09                 ldi8	r4, 0x9
 f4 4c                 stsp16	[sp+0x3], r4
 c4 fe ff              ldi16	r4, 0xfffe
 f4 44                 stsp16	[sp+0x1], r4
 c2 02                 ldi8	r6, 0x2
 f1 32                 stsp8	[sp+0x0], r6
 a5                    xor	r5, r5
 c3 01                 ldi8	r7, 0x1
 03                    mov	r4, r7
 e1 53 02              call16	check_case
 d6 06                 adjsp	0x6
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+83
 d4 00                 jmp8	avm_test_main+76
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 e0 3f 02              jmp16	avm_test_main+658
 d6 fa                 adjsp	-0x6
 c0 5a                 ldi8	r4, 0x5a
 f1 44                 stsp8	[sp+0x5], r4
 c0 0b                 ldi8	r4, 0xb
 f4 4c                 stsp16	[sp+0x3], r4
 c0 7d                 ldi8	r4, 0x7d
 f4 44                 stsp16	[sp+0x1], r4
 c2 03                 ldi8	r6, 0x3
 f1 32                 stsp8	[sp+0x0], r6
 a5                    xor	r5, r5
 c3 02                 ldi8	r7, 0x2
 03                    mov	r4, r7
 e1 2b 02              call16	check_case
 d6 06                 adjsp	0x6
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+123
 d4 00                 jmp8	avm_test_main+116
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 e0 17 02              jmp16	avm_test_main+658
 d6 fa                 adjsp	-0x6
 c0 96                 ldi8	r4, 0x96
 f1 44                 stsp8	[sp+0x5], r4
 c0 03                 ldi8	r4, 0x3
 f4 4c                 stsp16	[sp+0x3], r4
 c1 1f                 ldi8	r5, 0x1f
 f4 45                 stsp16	[sp+0x1], r5
 af                    xor	r7, r7
 f1 33                 stsp8	[sp+0x0], r7
 07                    mov	r5, r7
 0b                    mov	r6, r7
 e1 06 02              call16	check_case
 d6 06                 adjsp	0x6
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+160
 d4 00                 jmp8	avm_test_main+153
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 e0 f2 01              jmp16	avm_test_main+658
 d6 fa                 adjsp	-0x6
 c0 a5                 ldi8	r4, 0xa5
 f1 44                 stsp8	[sp+0x5], r4
 c0 3f                 ldi8	r4, 0x3f
 f4 4c                 stsp16	[sp+0x3], r4
 c0 4b                 ldi8	r4, 0x4b
 f4 44                 stsp16	[sp+0x1], r4
 c3 01                 ldi8	r7, 0x1
 f1 33                 stsp8	[sp+0x0], r7
 c0 04                 ldi8	r4, 0x4
 a5                    xor	r5, r5
 c2 02                 ldi8	r6, 0x2
 e1 dd 01              call16	check_case
 d6 06                 adjsp	0x6
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+201
 d4 00                 jmp8	avm_test_main+194
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 e0 c9 01              jmp16	avm_test_main+658
 d6 fa                 adjsp	-0x6
 c0 69                 ldi8	r4, 0x69
 f1 44                 stsp8	[sp+0x5], r4
 c3 02                 ldi8	r7, 0x2
 f4 4f                 stsp16	[sp+0x3], r7
 c4 fd ff              ldi16	r4, 0xfffd
 f4 44                 stsp16	[sp+0x1], r4
 c2 03                 ldi8	r6, 0x3
 f1 32                 stsp8	[sp+0x0], r6
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 e1 b5 01              call16	check_case
 d6 06                 adjsp	0x6
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+241
 d4 00                 jmp8	avm_test_main+234
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 e0 a1 01              jmp16	avm_test_main+658
 d6 fa                 adjsp	-0x6
 c0 3c                 ldi8	r4, 0x3c
 f1 44                 stsp8	[sp+0x5], r4
 c0 18                 ldi8	r4, 0x18
 f4 4c                 stsp16	[sp+0x3], r4
 c0 08                 ldi8	r4, 0x8
 f4 44                 stsp16	[sp+0x1], r4
 c0 02                 ldi8	r4, 0x2
 f1 30                 stsp8	[sp+0x0], r4
 c0 06                 ldi8	r4, 0x6
 c1 01                 ldi8	r5, 0x1
 af                    xor	r7, r7
 0b                    mov	r6, r7
 e1 8b 01              call16	check_case
 d6 06                 adjsp	0x6
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+283
 d4 00                 jmp8	avm_test_main+276
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 e0 77 01              jmp16	avm_test_main+658
 d6 fa                 adjsp	-0x6
 c0 c3                 ldi8	r4, 0xc3
 f1 44                 stsp8	[sp+0x5], r4
 c0 16                 ldi8	r4, 0x16
 f4 4c                 stsp16	[sp+0x3], r4
 c4 fe ff              ldi16	r4, 0xfffe
 f4 44                 stsp16	[sp+0x1], r4
 c2 02                 ldi8	r6, 0x2
 f1 32                 stsp8	[sp+0x0], r6
 c0 07                 ldi8	r4, 0x7
 c3 01                 ldi8	r7, 0x1
 07                    mov	r5, r7
 e1 61 01              call16	check_case
 d6 06                 adjsp	0x6
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+325
 d4 00                 jmp8	avm_test_main+318
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 e0 4d 01              jmp16	avm_test_main+658
 d6 fa                 adjsp	-0x6
 c0 55                 ldi8	r4, 0x55
 f1 44                 stsp8	[sp+0x5], r4
 c0 18                 ldi8	r4, 0x18
 f4 4c                 stsp16	[sp+0x3], r4
 c0 7d                 ldi8	r4, 0x7d
 f4 44                 stsp16	[sp+0x1], r4
 c2 03                 ldi8	r6, 0x3
 f1 32                 stsp8	[sp+0x0], r6
 c0 08                 ldi8	r4, 0x8
 c1 01                 ldi8	r5, 0x1
 c3 02                 ldi8	r7, 0x2
 e1 37 01              call16	check_case
 d6 06                 adjsp	0x6
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+367
 d4 00                 jmp8	avm_test_main+360
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 e0 23 01              jmp16	avm_test_main+658
 d6 fa                 adjsp	-0x6
 c0 aa                 ldi8	r4, 0xaa
 f1 44                 stsp8	[sp+0x5], r4
 c0 05                 ldi8	r4, 0x5
 f4 4c                 stsp16	[sp+0x3], r4
 c0 30                 ldi8	r4, 0x30
 f4 44                 stsp16	[sp+0x1], r4
 af                    xor	r7, r7
 f1 33                 stsp8	[sp+0x0], r7
 c0 09                 ldi8	r4, 0x9
 c1 01                 ldi8	r5, 0x1
 0b                    mov	r6, r7
 e1 0f 01              call16	check_case
 d6 06                 adjsp	0x6
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+407
 d4 00                 jmp8	avm_test_main+400
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 e0 fb 00              jmp16	avm_test_main+658
 d6 fa                 adjsp	-0x6
 c0 0f                 ldi8	r4, 0xf
 f1 44                 stsp8	[sp+0x5], r4
 c0 3c                 ldi8	r4, 0x3c
 f4 4c                 stsp16	[sp+0x3], r4
 c0 40                 ldi8	r4, 0x40
 f4 44                 stsp16	[sp+0x1], r4
 c3 01                 ldi8	r7, 0x1
 f1 33                 stsp8	[sp+0x0], r7
 c0 0a                 ldi8	r4, 0xa
 c2 02                 ldi8	r6, 0x2
 07                    mov	r5, r7
 e1 e6 00              call16	check_case
 d6 06                 adjsp	0x6
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+448
 d4 00                 jmp8	avm_test_main+441
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 e0 d2 00              jmp16	avm_test_main+658
 d6 fa                 adjsp	-0x6
 c0 f0                 ldi8	r4, 0xf0
 f1 44                 stsp8	[sp+0x5], r4
 c0 3d                 ldi8	r4, 0x3d
 f4 4c                 stsp16	[sp+0x3], r4
 c0 7e                 ldi8	r4, 0x7e
 f4 44                 stsp16	[sp+0x1], r4
 c3 02                 ldi8	r7, 0x2
 f1 33                 stsp8	[sp+0x0], r7
 c0 0b                 ldi8	r4, 0xb
 c1 01                 ldi8	r5, 0x1
 c2 03                 ldi8	r6, 0x3
 e1 bc 00              call16	check_case
 d6 06                 adjsp	0x6
 f6 2c                 tst16	r4
 d0 09                 breq8	avm_test_main+490
 d4 00                 jmp8	avm_test_main+483
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 e0 a8 00              jmp16	avm_test_main+658
 d6 fa                 adjsp	-0x6
 c0 87                 ldi8	r4, 0x87
 f1 44                 stsp8	[sp+0x5], r4
 c0 0e                 ldi8	r4, 0xe
 f4 4c                 stsp16	[sp+0x3], r4
 c0 14                 ldi8	r4, 0x14
 f4 44                 stsp16	[sp+0x1], r4
 c0 04                 ldi8	r4, 0x4
 f1 30                 stsp8	[sp+0x0], r4
 c0 0c                 ldi8	r4, 0xc
 c1 01                 ldi8	r5, 0x1
 af                    xor	r7, r7
 0b                    mov	r6, r7
 e1 92 00              call16	check_case
 d6 06                 adjsp	0x6
 f6 2c                 tst16	r4
 d0 08                 breq8	avm_test_main+531
 d4 00                 jmp8	avm_test_main+525
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 d4 7f                 jmp8	avm_test_main+658
 d6 fa                 adjsp	-0x6
 c0 78                 ldi8	r4, 0x78
 f1 44                 stsp8	[sp+0x5], r4
 c4 ec ff              ldi16	r4, 0xffec
 f4 4c                 stsp16	[sp+0x3], r4
 c0 0c                 ldi8	r4, 0xc
 f4 44                 stsp16	[sp+0x1], r4
 c2 02                 ldi8	r6, 0x2
 f1 32                 stsp8	[sp+0x0], r6
 c0 0d                 ldi8	r4, 0xd
 c3 01                 ldi8	r7, 0x1
 07                    mov	r5, r7
 d5 6a                 call8	check_case
 d6 06                 adjsp	0x6
 f6 2c                 tst16	r4
 d0 08                 breq8	avm_test_main+571
 d4 00                 jmp8	avm_test_main+565
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 d4 57                 jmp8	avm_test_main+658
 d6 fa                 adjsp	-0x6
 c0 1e                 ldi8	r4, 0x1e
 f1 44                 stsp8	[sp+0x5], r4
 c0 14                 ldi8	r4, 0x14
 f4 4c                 stsp16	[sp+0x3], r4
 c0 82                 ldi8	r4, 0x82
 f4 44                 stsp16	[sp+0x1], r4
 c3 02                 ldi8	r7, 0x2
 f1 33                 stsp8	[sp+0x0], r7
 c0 0e                 ldi8	r4, 0xe
 a5                    xor	r5, r5
 c2 03                 ldi8	r6, 0x3
 d5 43                 call8	check_case
 d6 06                 adjsp	0x6
 f6 2c                 tst16	r4
 d0 08                 breq8	avm_test_main+610
 d4 00                 jmp8	avm_test_main+604
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 d4 30                 jmp8	avm_test_main+658
 d6 fa                 adjsp	-0x6
 c0 e1                 ldi8	r4, 0xe1
 f1 44                 stsp8	[sp+0x5], r4
 c4 fe ff              ldi16	r4, 0xfffe
 f4 4c                 stsp16	[sp+0x3], r4
 c4 ff ff              ldi16	r4, 0xffff
 f4 44                 stsp16	[sp+0x1], r4
 c0 04                 ldi8	r4, 0x4
 f1 30                 stsp8	[sp+0x0], r4
 c0 0f                 ldi8	r4, 0xf
 c1 01                 ldi8	r5, 0x1
 aa                    xor	r6, r6
 c3 02                 ldi8	r7, 0x2
 d5 18                 call8	check_case
 d6 06                 adjsp	0x6
 f6 2c                 tst16	r4
 d0 08                 breq8	avm_test_main+653
 d4 00                 jmp8	avm_test_main+647
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 d4 05                 jmp8	avm_test_main+658
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	avm_test_main+658
 f4 00                 ldsp16	r4, [sp+0x0]
 d6 02                 adjsp	0x2
 ef                    ret

<check_case>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e9                 adjsp	-0x17
 f0 18 25              ldsp8u	r0, [sp+0x25]
 f0 30 23              ldsp16	r0, [sp+0x23]
 f0 30 21              ldsp16	r0, [sp+0x21]
 f0 18 20              ldsp8u	r0, [sp+0x20]
 f0 3c 13              stsp16	[sp+0x13], r4
 f0 2d 12              stsp8	[sp+0x12], r5
 f0 2e 11              stsp8	[sp+0x11], r6
 f0 2f 10              stsp8	[sp+0x10], r7
 f0 1c 25              ldsp8u	r4, [sp+0x25]
 e1 0d 01              call16	prepare_memory
 f0 1c 12              ldsp8u	r4, [sp+0x12]
 e1 7a 01              call16	font_pointer
 f1 75                 zext8	r5
 e1 66 01              call16	avm_set_text_font
 f0 1c 11              ldsp8u	r4, [sp+0x11]
 e1 9a 01              call16	avm_set_text_mode
 f0 1c 10              ldsp8u	r4, [sp+0x10]
 f0 1d 20              ldsp8u	r5, [sp+0x20]
 f0 36 21              ldsp16	r6, [sp+0x21]
 f0 37 23              ldsp16	r7, [sp+0x23]
 e1 96 01              call16	invoke_draw
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f3 54                 ldsp8u	r4, [sp+0x5]
 f1 6c                 stsp8	[sp+0xf], r4
 f3 50                 ldsp8u	r4, [sp+0x4]
 f1 68                 stsp8	[sp+0xe], r4
 f3 4c                 ldsp8u	r4, [sp+0x3]
 f1 64                 stsp8	[sp+0xd], r4
 f3 48                 ldsp8u	r4, [sp+0x2]
 f1 60                 stsp8	[sp+0xc], r4
 f0 1c 12              ldsp8u	r4, [sp+0x12]
 f0 1d 20              ldsp8u	r5, [sp+0x20]
 f0 36 21              ldsp16	r6, [sp+0x21]
 f0 37 23              ldsp16	r7, [sp+0x23]
 d6 fc                 adjsp	-0x4
 f0 10 0c              leasp	r0, 0xc
 f0 38 02              stsp16	[sp+0x2], r0
 f0 10 0e              leasp	r0, 0xe
 f0 38 00              stsp16	[sp+0x0], r0
 e1 b0 02              call16	reference_cursor
 d6 04                 adjsp	0x4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 29                 ldsp16	r5, [sp+0xa]
 31                    cmp	r4, r5
 d1 0b                 brne8	check_case+136
 d4 00                 jmp8	check_case+127
 f4 38                 ldsp16	r4, [sp+0xe]
 f4 21                 ldsp16	r5, [sp+0x8]
 31                    cmp	r4, r5
 d0 1e                 breq8	check_case+164
 d4 00                 jmp8	check_case+136
 f0 34 13              ldsp16	r4, [sp+0x13]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 23                 ldsp16	r7, [sp+0x8]
 f0 30 0e              ldsp16	r0, [sp+0xe]
 d6 fe                 adjsp	-0x2
 f0 38 00              stsp16	[sp+0x0], r0
 e1 19 03              call16	fail_cursor
 d6 02                 adjsp	0x2
 f0 3c 15              stsp16	[sp+0x15], r4
 e0 83 00              jmp16	check_case+295
 f0 34 13              ldsp16	r4, [sp+0x13]
 f0 1d 25              ldsp8u	r5, [sp+0x25]
 e1 44 03              call16	check_guards
 f6 2c                 tst16	r4
 d0 09                 breq8	check_case+186
 d4 00                 jmp8	check_case+179
 c0 01                 ldi8	r4, 0x1
 f0 3c 15              stsp16	[sp+0x15], r4
 d4 6d                 jmp8	check_case+295
 a0                    xor	r4, r4
 f4 58                 stsp16	[sp+0x6], r4
 d4 00                 jmp8	check_case+191
 f4 18                 ldsp16	r4, [sp+0x6]
 c5 00 04              ldi16	r5, 0x400
 31                    cmp	r4, r5
 d0 5a                 breq8	check_case+289
 d4 00                 jmp8	check_case+201
 f0 1c 12              ldsp8u	r4, [sp+0x12]
 f0 1d 11              ldsp8u	r5, [sp+0x11]
 f0 1e 20              ldsp8u	r6, [sp+0x20]
 f0 37 21              ldsp16	r7, [sp+0x21]
 f0 30 23              ldsp16	r0, [sp+0x23]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f0 1a 25              ldsp8u	r2, [sp+0x25]
 d6 fb                 adjsp	-0x5
 f0 2a 04              stsp8	[sp+0x4], r2
 f0 39 02              stsp16	[sp+0x2], r1
 f0 38 00              stsp16	[sp+0x0], r0
 e1 9f 03              call16	expected_byte
 d6 05                 adjsp	0x5
 f1 34                 stsp8	[sp+0x1], r4
 f4 18                 ldsp16	r4, [sp+0x6]
 c5 00 05              ldi16	r5, 0x500
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f1 30                 stsp8	[sp+0x0], r4
 f3 40                 ldsp8u	r4, [sp+0x0]
 f3 45                 ldsp8u	r5, [sp+0x1]
 31                    cmp	r4, r5
 d0 17                 breq8	check_case+279
 d4 00                 jmp8	check_case+258
 f0 34 13              ldsp16	r4, [sp+0x13]
 f4 19                 ldsp16	r5, [sp+0x6]
 c6 00 05              ldi16	r6, 0x500
 16                    add	r5, r6
 f3 46                 ldsp8u	r6, [sp+0x1]
 f3 43                 ldsp8u	r7, [sp+0x0]
 e1 61 05              call16	fail_byte
 f0 3c 15              stsp16	[sp+0x15], r4
 d4 10                 jmp8	check_case+295
 d4 00                 jmp8	check_case+281
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 ac                 inc16	r4
 f4 58                 stsp16	[sp+0x6], r4
 d4 9e                 jmp8	check_case+191
 a0                    xor	r4, r4
 f0 3c 15              stsp16	[sp+0x15], r4
 d4 00                 jmp8	check_case+295
 f0 34 15              ldsp16	r4, [sp+0x15]
 d6 17                 adjsp	0x17
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<prepare_memory>:
 d6 fc                 adjsp	-0x4
 f1 3c                 stsp8	[sp+0x3], r4
 a0                    xor	r4, r4
 f1 30                 stsp8	[sp+0x0], r4
 d4 00                 jmp8	prepare_memory+9
 f3 40                 ldsp8u	r4, [sp+0x0]
 cc 04                 cmpi.s8	r4, 0x4
 d0 2a                 breq8	prepare_memory+57
 d4 00                 jmp8	prepare_memory+17
 f3 40                 ldsp8u	r4, [sp+0x0]
 f3 4d                 ldsp8u	r5, [sp+0x3]
 e1 5c 05              call16	guard_before_byte
 04                    mov	r5, r4
 f3 40                 ldsp8u	r4, [sp+0x0]
 c6 fc 04              ldi16	r6, 0x4fc
 12                    add	r4, r6
 51                    st8	[r4], r5
 f3 40                 ldsp8u	r4, [sp+0x0]
 f3 4d                 ldsp8u	r5, [sp+0x3]
 e1 63 05              call16	guard_after_byte
 04                    mov	r5, r4
 f3 40                 ldsp8u	r4, [sp+0x0]
 c6 00 09              ldi16	r6, 0x900
 92                    or	r4, r6
 51                    st8	[r4], r5
 d4 00                 jmp8	prepare_memory+49
 f3 40                 ldsp8u	r4, [sp+0x0]
 f4 ac                 inc16	r4
 f1 30                 stsp8	[sp+0x0], r4
 d4 d0                 jmp8	prepare_memory+9
 a0                    xor	r4, r4
 f4 44                 stsp16	[sp+0x1], r4
 d4 00                 jmp8	prepare_memory+62
 f4 04                 ldsp16	r4, [sp+0x1]
 c5 00 04              ldi16	r5, 0x400
 31                    cmp	r4, r5
 d0 1b                 breq8	prepare_memory+97
 d4 00                 jmp8	prepare_memory+72
 f4 04                 ldsp16	r4, [sp+0x1]
 f3 4d                 ldsp8u	r5, [sp+0x3]
 e1 51 05              call16	initial_byte
 04                    mov	r5, r4
 f4 04                 ldsp16	r4, [sp+0x1]
 c6 00 05              ldi16	r6, 0x500
 12                    add	r4, r6
 51                    st8	[r4], r5
 d4 00                 jmp8	prepare_memory+89
 f4 04                 ldsp16	r4, [sp+0x1]
 f4 ac                 inc16	r4
 f4 44                 stsp16	[sp+0x1], r4
 d4 dd                 jmp8	prepare_memory+62
 d6 04                 adjsp	0x4
 ef                    ret

<avm_set_text_font>:
 d6 fd                 adjsp	-0x3
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f3 49                 ldsp8u	r5, [sp+0x2]
 d7 31                 sys	set_text_font
 d6 03                 adjsp	0x3
 ef                    ret

<font_pointer>:
 d6 fc                 adjsp	-0x4
 f1 30                 stsp8	[sp+0x0], r4
 f3 40                 ldsp8u	r4, [sp+0x0]
 f4 a4                 tst8	r4
 d1 0d                 brne8	font_pointer+23
 d4 00                 jmp8	font_pointer+12
 c4 d4 0f              ldi16	r4, 0xfd4
 c1 00                 ldi8	r5, 0x0
 f4 44                 stsp16	[sp+0x1], r4
 f1 3d                 stsp8	[sp+0x3], r5
 d4 0b                 jmp8	font_pointer+34
 c4 ec 0f              ldi16	r4, 0xfec
 c1 00                 ldi8	r5, 0x0
 f4 44                 stsp16	[sp+0x1], r4
 f1 3d                 stsp8	[sp+0x3], r5
 d4 00                 jmp8	font_pointer+34
 f4 04                 ldsp16	r4, [sp+0x1]
 f3 4d                 ldsp8u	r5, [sp+0x3]
 f1 75                 zext8	r5
 d6 04                 adjsp	0x4
 ef                    ret

<avm_set_text_mode>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f3 40                 ldsp8u	r4, [sp+0x0]
 d7 32                 sys	set_text_mode
 d6 02                 adjsp	0x2
 ef                    ret

<invoke_draw>:
 b0                    push16	r0
 d6 dc                 adjsp	-0x24
 f0 2c 1f              stsp8	[sp+0x1f], r4
 f0 2d 1e              stsp8	[sp+0x1e], r5
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 f0 1c 1f              ldsp8u	r4, [sp+0x1f]
 f4 a4                 tst8	r4
 d1 23                 brne8	invoke_draw+57
 d4 00                 jmp8	invoke_draw+24
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f4 60                 stsp16	[sp+0x8], r4
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f4 58                 stsp16	[sp+0x6], r4
 f0 1c 1e              ldsp8u	r4, [sp+0x1e]
 e1 05 05              call16	ram_text
 f4 19                 ldsp16	r5, [sp+0x6]
 08                    mov	r6, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 e1 df 04              call16	avm_draw_text
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 e0 08 01              jmp16	invoke_draw+321
 f0 1c 1f              ldsp8u	r4, [sp+0x1f]
 cc 01                 cmpi.s8	r4, 0x1
 d1 26                 brne8	invoke_draw+102
 d4 00                 jmp8	invoke_draw+66
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f4 50                 stsp16	[sp+0x4], r4
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f4 48                 stsp16	[sp+0x2], r4
 f0 1c 1e              ldsp8u	r4, [sp+0x1e]
 e1 4a 05              call16	program_text
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 77                 zext8	r7
 e1 1e 05              call16	avm_draw_text_P
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 e0 db 00              jmp16	invoke_draw+321
 f0 1c 1e              ldsp8u	r4, [sp+0x1e]
 f4 40                 stsp16	[sp+0x0], r4
 f4 a4                 tst8	r4
 d0 1b                 breq8	invoke_draw+138
 d4 00                 jmp8	invoke_draw+113
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 01                 cmpi.s8	r4, 0x1
 d0 36                 breq8	invoke_draw+173
 d4 00                 jmp8	invoke_draw+121
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 02                 cmpi.s8	r4, 0x2
 d0 50                 breq8	invoke_draw+207
 d4 00                 jmp8	invoke_draw+129
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 03                 cmpi.s8	r4, 0x3
 d0 6f                 breq8	invoke_draw+246
 e0 92 00              jmp16	invoke_draw+284
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 c2 41                 ldi8	r6, 0x41
 f0 3e 18              stsp16	[sp+0x18], r6
 c6 00 01              ldi16	r6, 0x100
 f0 17 18              leasp	r7, 0x18
 b2                    push16	r2
 f1 17                 mov	r2, r7
 d7 35                 sys	draw_textfv
 ba                    pop16	r2
 e1 5e 05              call16	__avm_text_cursor_from_u32
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 e0 94 00              jmp16	invoke_draw+321
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 c2 42                 ldi8	r6, 0x42
 f0 3e 16              stsp16	[sp+0x16], r6
 c6 00 01              ldi16	r6, 0x100
 f0 17 16              leasp	r7, 0x16
 b2                    push16	r2
 f1 17                 mov	r2, r7
 d7 35                 sys	draw_textfv
 ba                    pop16	r2
 e1 3b 05              call16	__avm_text_cursor_from_u32
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 d4 72                 jmp8	invoke_draw+321
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 c2 41                 ldi8	r6, 0x41
 f0 3e 12              stsp16	[sp+0x12], r6
 c2 42                 ldi8	r6, 0x42
 f0 3e 14              stsp16	[sp+0x14], r6
 c6 03 01              ldi16	r6, 0x103
 f0 17 12              leasp	r7, 0x12
 b2                    push16	r2
 f1 17                 mov	r2, r7
 d7 35                 sys	draw_textfv
 ba                    pop16	r2
 e1 14 05              call16	__avm_text_cursor_from_u32
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 d4 4b                 jmp8	invoke_draw+321
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 c2 42                 ldi8	r6, 0x42
 f4 7a                 stsp16	[sp+0xe], r6
 c2 41                 ldi8	r6, 0x41
 f0 3e 10              stsp16	[sp+0x10], r6
 c6 03 01              ldi16	r6, 0x103
 f0 17 0e              leasp	r7, 0xe
 b2                    push16	r2
 f1 17                 mov	r2, r7
 d7 35                 sys	draw_textfv
 ba                    pop16	r2
 e1 ee 04              call16	__avm_text_cursor_from_u32
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 d4 25                 jmp8	invoke_draw+321
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 c2 41                 ldi8	r6, 0x41
 f4 6a                 stsp16	[sp+0xa], r6
 c2 42                 ldi8	r6, 0x42
 f4 72                 stsp16	[sp+0xc], r6
 c6 08 01              ldi16	r6, 0x108
 f0 17 0a              leasp	r7, 0xa
 b2                    push16	r2
 f1 17                 mov	r2, r7
 d7 35                 sys	draw_textfv
 ba                    pop16	r2
 e1 c9 04              call16	__avm_text_cursor_from_u32
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 d4 00                 jmp8	invoke_draw+321
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 d6 24                 adjsp	0x24
 b8                    pop16	r0
 ef                    ret

<reference_cursor>:
 b0                    push16	r0
 d6 eb                 adjsp	-0x15
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f0 30 1a              ldsp16	r0, [sp+0x1a]
 f0 2c 14              stsp8	[sp+0x14], r4
 f0 2d 13              stsp8	[sp+0x13], r5
 f0 3e 11              stsp16	[sp+0x11], r6
 f4 7f                 stsp16	[sp+0xf], r7
 f0 34 11              ldsp16	r4, [sp+0x11]
 f4 74                 stsp16	[sp+0xd], r4
 f4 3c                 ldsp16	r4, [sp+0xf]
 f4 6c                 stsp16	[sp+0xb], r4
 a0                    xor	r4, r4
 f1 58                 stsp8	[sp+0xa], r4
 d4 00                 jmp8	reference_cursor+34
 f3 68                 ldsp8u	r4, [sp+0xa]
 f4 48                 stsp16	[sp+0x2], r4
 f0 1c 13              ldsp8u	r4, [sp+0x13]
 e1 a3 04              call16	logical_length
 04                    mov	r5, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f1 75                 zext8	r5
 31                    cmp	r4, r5
 d0 4d                 breq8	reference_cursor+129
 d4 00                 jmp8	reference_cursor+54
 f0 1c 13              ldsp8u	r4, [sp+0x13]
 f3 69                 ldsp8u	r5, [sp+0xa]
 e1 c0 04              call16	logical_char
 f1 54                 stsp8	[sp+0x9], r4
 f3 64                 ldsp8u	r4, [sp+0x9]
 f6 44                 sext8	r4
 cc 0a                 cmpi.s8	r4, 0xa
 d1 1b                 brne8	reference_cursor+99
 d4 00                 jmp8	reference_cursor+74
 f0 34 11              ldsp16	r4, [sp+0x11]
 f4 74                 stsp16	[sp+0xd], r4
 f4 2c                 ldsp16	r4, [sp+0xb]
 f4 40                 stsp16	[sp+0x0], r4
 f0 1c 14              ldsp8u	r4, [sp+0x14]
 e1 1c 05              call16	font_line_height
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 75                 zext8	r5
 11                    add	r4, r5
 f4 6c                 stsp16	[sp+0xb], r4
 d4 16                 jmp8	reference_cursor+121
 f0 1c 14              ldsp8u	r4, [sp+0x14]
 f3 65                 ldsp8u	r5, [sp+0x9]
 f6 45                 sext8	r5
 f0 16 04              leasp	r6, 0x4
 e1 16 05              call16	reference_glyph
 f4 34                 ldsp16	r4, [sp+0xd]
 f3 61                 ldsp8u	r5, [sp+0x8]
 11                    add	r4, r5
 f4 74                 stsp16	[sp+0xd], r4
 d4 00                 jmp8	reference_cursor+121
 f3 68                 ldsp8u	r4, [sp+0xa]
 f4 ac                 inc16	r4
 f1 58                 stsp8	[sp+0xa], r4
 d4 a1                 jmp8	reference_cursor+34
 f4 35                 ldsp16	r5, [sp+0xd]
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 71                    st16	[r4], r5
 f4 2d                 ldsp16	r5, [sp+0xb]
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 71                    st16	[r4], r5
 d6 15                 adjsp	0x15
 b8                    pop16	r0
 ef                    ret

<fail_cursor>:
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f0 30 0d              ldsp16	r0, [sp+0xd]
 f4 58                 stsp16	[sp+0x6], r4
 f4 51                 stsp16	[sp+0x4], r5
 f4 4a                 stsp16	[sp+0x2], r6
 f4 43                 stsp16	[sp+0x0], r7
 f4 19                 ldsp16	r5, [sp+0x6]
 c4 1c 01              ldi16	r4, 0x11c
 e1 96 05              call16	test_line16
 f4 11                 ldsp16	r5, [sp+0x4]
 c4 21 01              ldi16	r4, 0x121
 e1 8e 05              call16	test_line16
 f4 09                 ldsp16	r5, [sp+0x2]
 c4 27 01              ldi16	r4, 0x127
 e1 86 05              call16	test_line16
 f4 01                 ldsp16	r5, [sp+0x0]
 c4 2c 01              ldi16	r4, 0x12c
 e1 7e 05              call16	test_line16
 f4 35                 ldsp16	r5, [sp+0xd]
 c4 32 01              ldi16	r4, 0x132
 e1 76 05              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 ef                    ret

<check_guards>:
 d6 f6                 adjsp	-0xa
 f4 58                 stsp16	[sp+0x6], r4
 f1 45                 stsp8	[sp+0x5], r5
 a0                    xor	r4, r4
 f1 40                 stsp8	[sp+0x4], r4
 d4 00                 jmp8	check_guards+11
 f3 50                 ldsp8u	r4, [sp+0x4]
 cc 04                 cmpi.s8	r4, 0x4
 d0 3a                 breq8	check_guards+75
 d4 00                 jmp8	check_guards+19
 f3 50                 ldsp8u	r4, [sp+0x4]
 f3 55                 ldsp8u	r5, [sp+0x5]
 e1 99 02              call16	guard_before_byte
 f1 3c                 stsp8	[sp+0x3], r4
 f3 50                 ldsp8u	r4, [sp+0x4]
 c5 fc 04              ldi16	r5, 0x4fc
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f1 38                 stsp8	[sp+0x2], r4
 f3 48                 ldsp8u	r4, [sp+0x2]
 f3 4d                 ldsp8u	r5, [sp+0x3]
 31                    cmp	r4, r5
 d0 15                 breq8	check_guards+65
 d4 00                 jmp8	check_guards+46
 f4 18                 ldsp16	r4, [sp+0x6]
 f3 51                 ldsp8u	r5, [sp+0x4]
 c6 fc 04              ldi16	r6, 0x4fc
 16                    add	r5, r6
 f3 4e                 ldsp8u	r6, [sp+0x3]
 f3 4b                 ldsp8u	r7, [sp+0x2]
 e1 45 02              call16	fail_byte
 f4 60                 stsp16	[sp+0x8], r4
 d4 54                 jmp8	check_guards+149
 d4 00                 jmp8	check_guards+67
 f3 50                 ldsp8u	r4, [sp+0x4]
 f4 ac                 inc16	r4
 f1 40                 stsp8	[sp+0x4], r4
 d4 c0                 jmp8	check_guards+11
 a0                    xor	r4, r4
 f1 40                 stsp8	[sp+0x4], r4
 d4 00                 jmp8	check_guards+80
 f3 50                 ldsp8u	r4, [sp+0x4]
 cc 04                 cmpi.s8	r4, 0x4
 d0 3a                 breq8	check_guards+144
 d4 00                 jmp8	check_guards+88
 f3 50                 ldsp8u	r4, [sp+0x4]
 f3 55                 ldsp8u	r5, [sp+0x5]
 e1 6a 02              call16	guard_after_byte
 f1 34                 stsp8	[sp+0x1], r4
 f3 50                 ldsp8u	r4, [sp+0x4]
 c5 00 09              ldi16	r5, 0x900
 91                    or	r4, r5
 40                    ld8u	r4, [r4]
 f1 30                 stsp8	[sp+0x0], r4
 f3 40                 ldsp8u	r4, [sp+0x0]
 f3 45                 ldsp8u	r5, [sp+0x1]
 31                    cmp	r4, r5
 d0 15                 breq8	check_guards+134
 d4 00                 jmp8	check_guards+115
 f4 18                 ldsp16	r4, [sp+0x6]
 f3 51                 ldsp8u	r5, [sp+0x4]
 c6 00 09              ldi16	r6, 0x900
 96                    or	r5, r6
 f3 46                 ldsp8u	r6, [sp+0x1]
 f3 43                 ldsp8u	r7, [sp+0x0]
 e1 00 02              call16	fail_byte
 f4 60                 stsp16	[sp+0x8], r4
 d4 0f                 jmp8	check_guards+149
 d4 00                 jmp8	check_guards+136
 f3 50                 ldsp8u	r4, [sp+0x4]
 f4 ac                 inc16	r4
 f1 40                 stsp8	[sp+0x4], r4
 d4 c0                 jmp8	check_guards+80
 a0                    xor	r4, r4
 f4 60                 stsp16	[sp+0x8], r4
 d4 00                 jmp8	check_guards+149
 f4 20                 ldsp16	r4, [sp+0x8]
 d6 0a                 adjsp	0xa
 ef                    ret

<expected_byte>:
 b0                    push16	r0
 d6 d8                 adjsp	-0x28
 f0 18 31              ldsp8u	r0, [sp+0x31]
 f0 30 2f              ldsp16	r0, [sp+0x2f]
 f0 30 2d              ldsp16	r0, [sp+0x2d]
 f0 2c 27              stsp8	[sp+0x27], r4
 f0 2d 26              stsp8	[sp+0x26], r5
 f0 2e 25              stsp8	[sp+0x25], r6
 f0 3f 23              stsp16	[sp+0x23], r7
 f0 34 2f              ldsp16	r4, [sp+0x2f]
 f0 1d 31              ldsp8u	r5, [sp+0x31]
 e1 24 02              call16	initial_byte
 f0 2c 22              stsp8	[sp+0x22], r4
 f0 34 2f              ldsp16	r4, [sp+0x2f]
 c1 7f                 ldi8	r5, 0x7f
 81                    and	r4, r5
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 34 2f              ldsp16	r4, [sp+0x2f]
 fa 74                 lsr16i	r4, 0x4
 c5 f8 0f              ldi16	r5, 0xff8
 81                    and	r4, r5
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 34 23              ldsp16	r4, [sp+0x23]
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 34 2d              ldsp16	r4, [sp+0x2d]
 f0 3c 1a              stsp16	[sp+0x1a], r4
 a0                    xor	r4, r4
 f0 2c 19              stsp8	[sp+0x19], r4
 d4 00                 jmp8	expected_byte+75
 f0 1c 19              ldsp8u	r4, [sp+0x19]
 f4 48                 stsp16	[sp+0x2], r4
 f0 1c 25              ldsp8u	r4, [sp+0x25]
 e1 12 03              call16	logical_length
 04                    mov	r5, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f1 75                 zext8	r5
 31                    cmp	r4, r5
 da 82 01              breq16	expected_byte+481
 d4 00                 jmp8	expected_byte+97
 f0 1c 25              ldsp8u	r4, [sp+0x25]
 f0 1d 19              ldsp8u	r5, [sp+0x19]
 e1 2d 03              call16	logical_char
 f0 2c 18              stsp8	[sp+0x18], r4
 f0 24 18              ldsp8s	r4, [sp+0x18]
 cc 0a                 cmpi.s8	r4, 0xa
 d1 1f                 brne8	expected_byte+147
 d4 00                 jmp8	expected_byte+118
 f0 34 23              ldsp16	r4, [sp+0x23]
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f4 40                 stsp16	[sp+0x0], r4
 f0 1c 27              ldsp8u	r4, [sp+0x27]
 e1 87 03              call16	font_line_height
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 75                 zext8	r5
 11                    add	r4, r5
 f0 3c 1a              stsp16	[sp+0x1a], r4
 e0 43 01              jmp16	expected_byte+470
 f0 1c 27              ldsp8u	r4, [sp+0x27]
 f0 25 18              ldsp8s	r5, [sp+0x18]
 f0 16 13              leasp	r6, 0x13
 e1 80 03              call16	reference_glyph
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 25 16              ldsp8s	r5, [sp+0x16]
 11                    add	r4, r5
 f0 3c 11              stsp16	[sp+0x11], r4
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 25 14              ldsp8s	r5, [sp+0x14]
 11                    add	r4, r5
 f4 7c                 stsp16	[sp+0xf], r4
 a0                    xor	r4, r4
 f1 68                 stsp8	[sp+0xe], r4
 d4 00                 jmp8	expected_byte+183
 f3 78                 ldsp8u	r4, [sp+0xe]
 f0 1d 15              ldsp8u	r5, [sp+0x15]
 31                    cmp	r4, r5
 da 0a 01              breq16	expected_byte+458
 d4 00                 jmp8	expected_byte+194
 f0 34 11              ldsp16	r4, [sp+0x11]
 f3 79                 ldsp8u	r5, [sp+0xe]
 11                    add	r4, r5
 f4 70                 stsp16	[sp+0xc], r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f0 35 20              ldsp16	r5, [sp+0x20]
 31                    cmp	r4, r5
 d0 05                 breq8	expected_byte+215
 d4 00                 jmp8	expected_byte+212
 e0 ea 00              jmp16	expected_byte+449
 a0                    xor	r4, r4
 f1 5c                 stsp8	[sp+0xb], r4
 d4 00                 jmp8	expected_byte+220
 f3 6c                 ldsp8u	r4, [sp+0xb]
 f0 1d 13              ldsp8u	r5, [sp+0x13]
 31                    cmp	r4, r5
 da da 00              breq16	expected_byte+447
 d4 00                 jmp8	expected_byte+231
 f4 3c                 ldsp16	r4, [sp+0xf]
 f3 6d                 ldsp8u	r5, [sp+0xb]
 11                    add	r4, r5
 f4 64                 stsp16	[sp+0x9], r4
 f4 24                 ldsp16	r4, [sp+0x9]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 31                    cmp	r4, r5
 d3 0e                 brslt8	expected_byte+260
 d4 00                 jmp8	expected_byte+248
 f4 24                 ldsp16	r4, [sp+0x9]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 c9 08                 addi.s8	r5, 0x8
 31                    cmp	r4, r5
 d3 05                 brslt8	expected_byte+263
 d4 00                 jmp8	expected_byte+260
 e0 af 00              jmp16	expected_byte+438
 f4 24                 ldsp16	r4, [sp+0x9]
 f6 2c                 tst16	r4
 d3 0a                 brslt8	expected_byte+279
 d4 00                 jmp8	expected_byte+271
 f4 24                 ldsp16	r4, [sp+0x9]
 cc 40                 cmpi.s8	r4, 0x40
 d3 05                 brslt8	expected_byte+282
 d4 00                 jmp8	expected_byte+279
 e0 9c 00              jmp16	expected_byte+438
 f0 1c 27              ldsp8u	r4, [sp+0x27]
 f0 25 18              ldsp8s	r5, [sp+0x18]
 f3 6e                 ldsp8u	r6, [sp+0xb]
 fa 93                 lsr16i	r6, 0x3
 f3 7b                 ldsp8u	r7, [sp+0xe]
 e1 47 04              call16	reference_image_byte
 f1 50                 stsp8	[sp+0x8], r4
 f3 6e                 ldsp8u	r6, [sp+0xb]
 c0 07                 ldi8	r4, 0x7
 88                    and	r6, r4
 c0 01                 ldi8	r4, 0x1
 04                    mov	r5, r4
 fa 06                 shl16v	r5, r6
 f1 4d                 stsp8	[sp+0x7], r5
 f3 61                 ldsp8u	r5, [sp+0x8]
 f3 5e                 ldsp8u	r6, [sp+0x7]
 86                    and	r5, r6
 f4 a5                 tst8	r5
 f8 0d                 cset.ne	r5
 f4 51                 stsp16	[sp+0x4], r5
 f4 25                 ldsp16	r5, [sp+0x9]
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 26                    sub	r5, r6
 f1 75                 zext8	r5
 fa 01                 shl16v	r4, r5
 f1 48                 stsp8	[sp+0x6], r4
 f0 1c 26              ldsp8u	r4, [sp+0x26]
 f4 a4                 tst8	r4
 d1 26                 brne8	expected_byte+379
 d4 00                 jmp8	expected_byte+343
 f4 10                 ldsp16	r4, [sp+0x4]
 f6 2c                 tst16	r4
 d0 0d                 breq8	expected_byte+362
 d4 00                 jmp8	expected_byte+351
 f3 59                 ldsp8u	r5, [sp+0x6]
 f0 1c 22              ldsp8u	r4, [sp+0x22]
 91                    or	r4, r5
 f0 2c 22              stsp8	[sp+0x22], r4
 d4 0f                 jmp8	expected_byte+377
 f3 59                 ldsp8u	r5, [sp+0x6]
 c4 ff ff              ldi16	r4, 0xffff
 a4                    xor	r5, r4
 f0 1c 22              ldsp8u	r4, [sp+0x22]
 81                    and	r4, r5
 f0 2c 22              stsp8	[sp+0x22], r4
 d4 00                 jmp8	expected_byte+377
 d4 39                 jmp8	expected_byte+436
 f0 1c 26              ldsp8u	r4, [sp+0x26]
 cc 02                 cmpi.s8	r4, 0x2
 d1 17                 brne8	expected_byte+409
 d4 00                 jmp8	expected_byte+388
 f4 10                 ldsp16	r4, [sp+0x4]
 f6 2c                 tst16	r4
 d0 0d                 breq8	expected_byte+407
 d4 00                 jmp8	expected_byte+396
 f3 59                 ldsp8u	r5, [sp+0x6]
 f0 1c 22              ldsp8u	r4, [sp+0x22]
 91                    or	r4, r5
 f0 2c 22              stsp8	[sp+0x22], r4
 d4 00                 jmp8	expected_byte+407
 d4 19                 jmp8	expected_byte+434
 f4 10                 ldsp16	r4, [sp+0x4]
 f6 2c                 tst16	r4
 d0 11                 breq8	expected_byte+432
 d4 00                 jmp8	expected_byte+417
 f3 59                 ldsp8u	r5, [sp+0x6]
 c4 ff ff              ldi16	r4, 0xffff
 a4                    xor	r5, r4
 f0 1c 22              ldsp8u	r4, [sp+0x22]
 81                    and	r4, r5
 f0 2c 22              stsp8	[sp+0x22], r4
 d4 00                 jmp8	expected_byte+432
 d4 00                 jmp8	expected_byte+434
 d4 00                 jmp8	expected_byte+436
 d4 00                 jmp8	expected_byte+438
 f3 6c                 ldsp8u	r4, [sp+0xb]
 f4 ac                 inc16	r4
 f1 5c                 stsp8	[sp+0xb], r4
 e0 1d ff              jmp16	expected_byte+220
 d4 00                 jmp8	expected_byte+449
 f3 78                 ldsp8u	r4, [sp+0xe]
 f4 ac                 inc16	r4
 f1 68                 stsp8	[sp+0xe], r4
 e0 ed fe              jmp16	expected_byte+183
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 1d 17              ldsp8u	r5, [sp+0x17]
 11                    add	r4, r5
 f0 3c 1c              stsp16	[sp+0x1c], r4
 d4 00                 jmp8	expected_byte+470
 f0 1c 19              ldsp8u	r4, [sp+0x19]
 f4 ac                 inc16	r4
 f0 2c 19              stsp8	[sp+0x19], r4
 e0 6a fe              jmp16	expected_byte+75
 f0 1c 22              ldsp8u	r4, [sp+0x22]
 d6 28                 adjsp	0x28
 b8                    pop16	r0
 ef                    ret

<fail_byte>:
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 f4 50                 stsp16	[sp+0x4], r4
 f4 49                 stsp16	[sp+0x2], r5
 f1 36                 stsp8	[sp+0x1], r6
 f1 33                 stsp8	[sp+0x0], r7
 f4 11                 ldsp16	r5, [sp+0x4]
 c4 1c 01              ldi16	r4, 0x11c
 e1 db 02              call16	test_line16
 f4 09                 ldsp16	r5, [sp+0x2]
 c4 4f 01              ldi16	r4, 0x14f
 e1 d3 02              call16	test_line16
 f3 45                 ldsp8u	r5, [sp+0x1]
 c4 54 01              ldi16	r4, 0x154
 e1 cb 02              call16	test_line16
 f3 41                 ldsp8u	r5, [sp+0x0]
 c4 59 01              ldi16	r4, 0x159
 e1 c3 02              call16	test_line16
 c0 01                 ldi8	r4, 0x1
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 ef                    ret

<guard_before_byte>:
 d6 fe                 adjsp	-0x2
 f1 34                 stsp8	[sp+0x1], r4
 f1 31                 stsp8	[sp+0x0], r5
 f3 40                 ldsp8u	r4, [sp+0x0]
 f3 45                 ldsp8u	r5, [sp+0x1]
 c2 11                 ldi8	r6, 0x11
 f3 16                 mulu8.w	r5, r6
 c9 a5                 addi.s8	r5, -0x5b
 f1 75                 zext8	r5
 a1                    xor	r4, r5
 d6 02                 adjsp	0x2
 ef                    ret

<guard_after_byte>:
 d6 fe                 adjsp	-0x2
 f1 34                 stsp8	[sp+0x1], r4
 f1 31                 stsp8	[sp+0x0], r5
 f3 40                 ldsp8u	r4, [sp+0x0]
 f3 45                 ldsp8u	r5, [sp+0x1]
 c2 1d                 ldi8	r6, 0x1d
 f3 16                 mulu8.w	r5, r6
 c9 5a                 addi.s8	r5, 0x5a
 f1 75                 zext8	r5
 a1                    xor	r4, r5
 d6 02                 adjsp	0x2
 ef                    ret

<initial_byte>:
 d6 fd                 adjsp	-0x3
 f4 44                 stsp16	[sp+0x1], r4
 f1 31                 stsp8	[sp+0x0], r5
 f4 05                 ldsp16	r5, [sp+0x1]
 c2 25                 ldi8	r6, 0x25
 01                    mov	r4, r5
 fe 26                 mul16	r4, r6
 fa 82                 lsr16i	r5, 0x2
 a1                    xor	r4, r5
 f1 74                 zext8	r4
 f3 41                 ldsp8u	r5, [sp+0x0]
 a1                    xor	r4, r5
 d6 03                 adjsp	0x3
 ef                    ret

<avm_draw_text>:
 d6 f6                 adjsp	-0xa
 f4 50                 stsp16	[sp+0x4], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 02                 ldsp16	r6, [sp+0x0]
 d7 33                 sys	draw_text
 e1 e0 00              call16	__avm_text_cursor_from_u32
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 d6 0a                 adjsp	0xa
 ef                    ret

<ram_text>:
 d6 fb                 adjsp	-0x5
 f1 38                 stsp8	[sp+0x2], r4
 f3 48                 ldsp8u	r4, [sp+0x2]
 f4 40                 stsp16	[sp+0x0], r4
 f4 a4                 tst8	r4
 d0 1a                 breq8	ram_text+38
 d4 00                 jmp8	ram_text+14
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 01                 cmpi.s8	r4, 0x1
 d0 19                 breq8	ram_text+45
 d4 00                 jmp8	ram_text+22
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 02                 cmpi.s8	r4, 0x2
 d0 18                 breq8	ram_text+52
 d4 00                 jmp8	ram_text+30
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 03                 cmpi.s8	r4, 0x3
 d0 17                 breq8	ram_text+59
 d4 1c                 jmp8	ram_text+66
 c4 0e 01              ldi16	r4, 0x10e
 f4 4c                 stsp16	[sp+0x3], r4
 d4 1c                 jmp8	ram_text+73
 c4 10 01              ldi16	r4, 0x110
 f4 4c                 stsp16	[sp+0x3], r4
 d4 15                 jmp8	ram_text+73
 c4 12 01              ldi16	r4, 0x112
 f4 4c                 stsp16	[sp+0x3], r4
 d4 0e                 jmp8	ram_text+73
 c4 15 01              ldi16	r4, 0x115
 f4 4c                 stsp16	[sp+0x3], r4
 d4 07                 jmp8	ram_text+73
 c4 18 01              ldi16	r4, 0x118
 f4 4c                 stsp16	[sp+0x3], r4
 d4 00                 jmp8	ram_text+73
 f4 0c                 ldsp16	r4, [sp+0x3]
 d6 05                 adjsp	0x5
 ef                    ret

<avm_draw_text_P>:
 d6 f5                 adjsp	-0xb
 f4 54                 stsp16	[sp+0x5], r4
 f4 4d                 stsp16	[sp+0x3], r5
 f4 42                 stsp16	[sp+0x0], r6
 f1 3b                 stsp8	[sp+0x2], r7
 f4 14                 ldsp16	r4, [sp+0x5]
 f4 0d                 ldsp16	r5, [sp+0x3]
 f4 02                 ldsp16	r6, [sp+0x0]
 f3 4b                 ldsp8u	r7, [sp+0x2]
 d7 34                 sys	draw_text_p
 d5 71                 call8	__avm_text_cursor_from_u32
 f4 5c                 stsp16	[sp+0x7], r4
 f4 65                 stsp16	[sp+0x9], r5
 f4 1c                 ldsp16	r4, [sp+0x7]
 f4 25                 ldsp16	r5, [sp+0x9]
 d6 0b                 adjsp	0xb
 ef                    ret

<program_text>:
 d6 fa                 adjsp	-0x6
 f1 38                 stsp8	[sp+0x2], r4
 f3 48                 ldsp8u	r4, [sp+0x2]
 f4 40                 stsp16	[sp+0x0], r4
 f4 a4                 tst8	r4
 d0 1a                 breq8	program_text+38
 d4 00                 jmp8	program_text+14
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 01                 cmpi.s8	r4, 0x1
 d0 1d                 breq8	program_text+49
 d4 00                 jmp8	program_text+22
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 02                 cmpi.s8	r4, 0x2
 d0 20                 breq8	program_text+60
 d4 00                 jmp8	program_text+30
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 03                 cmpi.s8	r4, 0x3
 d0 23                 breq8	program_text+71
 d4 2c                 jmp8	program_text+82
 c4 0e 10              ldi16	r4, 0x100e
 c1 00                 ldi8	r5, 0x0
 f4 4c                 stsp16	[sp+0x3], r4
 f1 45                 stsp8	[sp+0x5], r5
 d4 2c                 jmp8	program_text+93
 c4 10 10              ldi16	r4, 0x1010
 c1 00                 ldi8	r5, 0x0
 f4 4c                 stsp16	[sp+0x3], r4
 f1 45                 stsp8	[sp+0x5], r5
 d4 21                 jmp8	program_text+93
 c4 12 10              ldi16	r4, 0x1012
 c1 00                 ldi8	r5, 0x0
 f4 4c                 stsp16	[sp+0x3], r4
 f1 45                 stsp8	[sp+0x5], r5
 d4 16                 jmp8	program_text+93
 c4 15 10              ldi16	r4, 0x1015
 c1 00                 ldi8	r5, 0x0
 f4 4c                 stsp16	[sp+0x3], r4
 f1 45                 stsp8	[sp+0x5], r5
 d4 0b                 jmp8	program_text+93
 c4 18 10              ldi16	r4, 0x1018
 c1 00                 ldi8	r5, 0x0
 f4 4c                 stsp16	[sp+0x3], r4
 f1 45                 stsp8	[sp+0x5], r5
 d4 00                 jmp8	program_text+93
 f4 0c                 ldsp16	r4, [sp+0x3]
 f3 55                 ldsp8u	r5, [sp+0x5]
 f1 75                 zext8	r5
 d6 06                 adjsp	0x6
 ef                    ret

<__avm_text_cursor_from_u32>:
 d6 f8                 adjsp	-0x8
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 50                 stsp16	[sp+0x4], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 a5                    xor	r5, r5
 f4 58                 stsp16	[sp+0x6], r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 d6 08                 adjsp	0x8
 ef                    ret

<logical_length>:
 d6 fc                 adjsp	-0x4
 f1 38                 stsp8	[sp+0x2], r4
 f3 48                 ldsp8u	r4, [sp+0x2]
 f4 40                 stsp16	[sp+0x0], r4
 cc 02                 cmpi.s8	r4, 0x2
 d2 0c                 brult8	logical_length+24
 d4 00                 jmp8	logical_length+14
 f4 00                 ldsp16	r4, [sp+0x0]
 c8 fe                 addi.s8	r4, -0x2
 cc 02                 cmpi.s8	r4, 0x2
 d2 08                 brult8	logical_length+30
 d4 0c                 jmp8	logical_length+36
 c0 01                 ldi8	r4, 0x1
 f1 3c                 stsp8	[sp+0x3], r4
 d4 0c                 jmp8	logical_length+42
 c0 02                 ldi8	r4, 0x2
 f1 3c                 stsp8	[sp+0x3], r4
 d4 06                 jmp8	logical_length+42
 c0 03                 ldi8	r4, 0x3
 f1 3c                 stsp8	[sp+0x3], r4
 d4 00                 jmp8	logical_length+42
 f3 4c                 ldsp8u	r4, [sp+0x3]
 d6 04                 adjsp	0x4
 ef                    ret

<logical_char>:
 d6 fb                 adjsp	-0x5
 f1 3c                 stsp8	[sp+0x3], r4
 f1 39                 stsp8	[sp+0x2], r5
 f3 4c                 ldsp8u	r4, [sp+0x3]
 f4 40                 stsp16	[sp+0x0], r4
 f4 a4                 tst8	r4
 d0 1a                 breq8	logical_char+40
 d4 00                 jmp8	logical_char+16
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 01                 cmpi.s8	r4, 0x1
 d0 18                 breq8	logical_char+46
 d4 00                 jmp8	logical_char+24
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 02                 cmpi.s8	r4, 0x2
 d0 16                 breq8	logical_char+52
 d4 00                 jmp8	logical_char+32
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 03                 cmpi.s8	r4, 0x3
 d0 1c                 breq8	logical_char+66
 d4 28                 jmp8	logical_char+80
 c0 41                 ldi8	r4, 0x41
 f1 40                 stsp8	[sp+0x4], r4
 d4 44                 jmp8	logical_char+114
 c0 42                 ldi8	r4, 0x42
 f1 40                 stsp8	[sp+0x4], r4
 d4 3e                 jmp8	logical_char+114
 f3 4a                 ldsp8u	r6, [sp+0x2]
 c0 42                 ldi8	r4, 0x42
 c1 41                 ldi8	r5, 0x41
 f4 a6                 tst8	r6
 fb 25                 cmov.eq	r4, r5
 f1 40                 stsp8	[sp+0x4], r4
 d4 30                 jmp8	logical_char+114
 f3 4a                 ldsp8u	r6, [sp+0x2]
 c0 41                 ldi8	r4, 0x41
 c1 42                 ldi8	r5, 0x42
 f4 a6                 tst8	r6
 fb 25                 cmov.eq	r4, r5
 f1 40                 stsp8	[sp+0x4], r4
 d4 22                 jmp8	logical_char+114
 f3 48                 ldsp8u	r4, [sp+0x2]
 f4 a4                 tst8	r4
 d1 08                 brne8	logical_char+94
 d4 00                 jmp8	logical_char+88
 c0 41                 ldi8	r4, 0x41
 f1 40                 stsp8	[sp+0x4], r4
 d4 14                 jmp8	logical_char+114
 f3 48                 ldsp8u	r4, [sp+0x2]
 cc 01                 cmpi.s8	r4, 0x1
 d1 08                 brne8	logical_char+108
 d4 00                 jmp8	logical_char+102
 c0 0a                 ldi8	r4, 0xa
 f1 40                 stsp8	[sp+0x4], r4
 d4 06                 jmp8	logical_char+114
 c0 42                 ldi8	r4, 0x42
 f1 40                 stsp8	[sp+0x4], r4
 d4 00                 jmp8	logical_char+114
 f3 50                 ldsp8u	r4, [sp+0x4]
 d6 05                 adjsp	0x5
 ef                    ret

<font_line_height>:
 d6 ff                 adjsp	-0x1
 f1 30                 stsp8	[sp+0x0], r4
 f3 42                 ldsp8u	r6, [sp+0x0]
 c0 13                 ldi8	r4, 0x13
 c1 0a                 ldi8	r5, 0xa
 f4 a6                 tst8	r6
 fb 25                 cmov.eq	r4, r5
 d6 01                 adjsp	0x1
 ef                    ret

<reference_glyph>:
 d6 fc                 adjsp	-0x4
 f1 3c                 stsp8	[sp+0x3], r4
 f1 39                 stsp8	[sp+0x2], r5
 f4 42                 stsp16	[sp+0x0], r6
 f3 4c                 ldsp8u	r4, [sp+0x3]
 f4 a4                 tst8	r4
 d1 54                 brne8	reference_glyph+98
 d4 00                 jmp8	reference_glyph+16
 f3 48                 ldsp8u	r4, [sp+0x2]
 f6 44                 sext8	r4
 cc 41                 cmpi.s8	r4, 0x41
 d1 25                 brne8	reference_glyph+61
 d4 00                 jmp8	reference_glyph+26
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 07                 ldi8	r5, 0x7
 51                    st8	[r4], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 fa                 ldi8	r5, 0xfa
 ee a8 21              st8	[r4+1], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 03                 ldi8	r5, 0x3
 ee a8 22              st8	[r4+2], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 ff                 ldi8	r5, 0xff
 ee a8 23              st8	[r4+3], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 04                 ldi8	r5, 0x4
 ee a8 24              st8	[r4+4], r5
 d4 23                 jmp8	reference_glyph+96
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 08                 ldi8	r5, 0x8
 51                    st8	[r4], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 fc                 ldi8	r5, 0xfc
 ee a8 21              st8	[r4+1], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 04                 ldi8	r5, 0x4
 ee a8 22              st8	[r4+2], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 01                 ldi8	r5, 0x1
 ee a8 23              st8	[r4+3], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 06                 ldi8	r5, 0x6
 ee a8 24              st8	[r4+4], r5
 d4 00                 jmp8	reference_glyph+96
 d4 52                 jmp8	reference_glyph+180
 f3 48                 ldsp8u	r4, [sp+0x2]
 f6 44                 sext8	r4
 cc 41                 cmpi.s8	r4, 0x41
 d1 25                 brne8	reference_glyph+143
 d4 00                 jmp8	reference_glyph+108
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 0d                 ldi8	r5, 0xd
 51                    st8	[r4], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 f6                 ldi8	r5, 0xf6
 ee a8 21              st8	[r4+1], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 04                 ldi8	r5, 0x4
 ee a8 22              st8	[r4+2], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 ff                 ldi8	r5, 0xff
 ee a8 23              st8	[r4+3], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 05                 ldi8	r5, 0x5
 ee a8 24              st8	[r4+4], r5
 d4 23                 jmp8	reference_glyph+178
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 11                 ldi8	r5, 0x11
 51                    st8	[r4], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 f8                 ldi8	r5, 0xf8
 ee a8 21              st8	[r4+1], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 03                 ldi8	r5, 0x3
 ee a8 22              st8	[r4+2], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 01                 ldi8	r5, 0x1
 ee a8 23              st8	[r4+3], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 05                 ldi8	r5, 0x5
 ee a8 24              st8	[r4+4], r5
 d4 00                 jmp8	reference_glyph+178
 d4 00                 jmp8	reference_glyph+180
 d6 04                 adjsp	0x4
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

<reference_image_byte>:
 b0                    push16	r0
 d6 fb                 adjsp	-0x5
 f1 3c                 stsp8	[sp+0x3], r4
 f1 39                 stsp8	[sp+0x2], r5
 f1 36                 stsp8	[sp+0x1], r6
 f1 33                 stsp8	[sp+0x0], r7
 f3 4c                 ldsp8u	r4, [sp+0x3]
 f4 a4                 tst8	r4
 d1 22                 brne8	reference_image_byte+51
 d4 00                 jmp8	reference_image_byte+19
 f3 48                 ldsp8u	r4, [sp+0x2]
 f6 44                 sext8	r4
 cc 41                 cmpi.s8	r4, 0x41
 d1 0d                 brne8	reference_image_byte+40
 d4 00                 jmp8	reference_image_byte+29
 f3 40                 ldsp8u	r4, [sp+0x0]
 c5 37 01              ldi16	r5, 0x137
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f1 40                 stsp8	[sp+0x4], r4
 d4 3b                 jmp8	reference_image_byte+99
 f3 40                 ldsp8u	r4, [sp+0x0]
 c5 3a 01              ldi16	r5, 0x13a
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f1 40                 stsp8	[sp+0x4], r4
 d4 30                 jmp8	reference_image_byte+99
 f3 48                 ldsp8u	r4, [sp+0x2]
 f6 44                 sext8	r4
 cc 41                 cmpi.s8	r4, 0x41
 d1 14                 brne8	reference_image_byte+79
 d4 00                 jmp8	reference_image_byte+61
 f3 44                 ldsp8u	r4, [sp+0x1]
 10                    add	r4, r4
 10                    add	r4, r4
 f3 41                 ldsp8u	r5, [sp+0x0]
 11                    add	r4, r5
 f1 74                 zext8	r4
 c5 3e 01              ldi16	r5, 0x13e
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f1 40                 stsp8	[sp+0x4], r4
 d4 14                 jmp8	reference_image_byte+99
 f3 44                 ldsp8u	r4, [sp+0x1]
 c1 03                 ldi8	r5, 0x3
 f3 11                 mulu8.w	r4, r5
 f3 41                 ldsp8u	r5, [sp+0x0]
 11                    add	r4, r5
 f1 74                 zext8	r4
 c5 46 01              ldi16	r5, 0x146
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f1 40                 stsp8	[sp+0x4], r4
 d4 00                 jmp8	reference_image_byte+99
 f3 50                 ldsp8u	r4, [sp+0x4]
 d6 05                 adjsp	0x5
 b8                    pop16	r0
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
