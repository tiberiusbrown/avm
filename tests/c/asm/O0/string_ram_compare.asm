
string_ram_compare.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000031e l     F .text	0000004a avm_run_constructors
00000368 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 string_ram_compare.c
00000144 l     O .data	00000105 avm_test_main.long_text
00000100 l     O .data	00000005 avm_test_main.eq_a
00000105 l     O .data	00000005 avm_test_main.eq_b
0000010a l     O .data	00000005 avm_test_main.low
0000010f l     O .data	00000005 avm_test_main.high
00000114 l     O .data	00000005 avm_test_main.high2
00000119 l     O .data	00000005 avm_test_main.low2
0000011e l     O .data	00000005 avm_test_main.late_a
00000123 l     O .data	00000005 avm_test_main.late_b
00000128 l     O .data	00000006 avm_test_main.alpha
0000012e l     O .data	00000006 avm_test_main.alphz
00000134 l     O .data	00000004 avm_test_main.cat
00000138 l     O .data	00000008 avm_test_main.catalog
00000140 l     O .data	00000002 avm_test_main.unsigned_hi
00000142 l     O .data	00000002 avm_test_main.unsigned_lo
00000249 l     O .data	00000001 .L.str
0000024a l     O .data	00000005 .L.str.1
0000024f l     O .data	00000003 .L.str.2
0000066c l     F .text	00000019 test_line16
00000252 l     O .data	00000003 .L.str.3
00000255 l     O .data	00000003 .L.str.4
00000258 l     O .data	00000003 .L.str.5
0000025b l     O .data	00000003 .L.str.6
0000025e l     O .data	00000003 .L.str.7
00000261 l     O .data	00000003 .L.str.8
00000264 l     O .data	00000003 .L.str.9
00000267 l     O .data	00000003 .L.str.10
0000026a l     O .data	00000003 .L.str.11
0000026d l     O .data	00000003 .L.str.12
00000270 l     O .data	00000003 .L.str.13
00000273 l     O .data	00000003 .L.str.14
00000276 l     O .data	00000003 .L.str.15
00000279 l     O .data	00000003 .L.str.16
00000685 l     F .text	00000022 test_puts
000006a7 l     F .text	0000000b test_putc
000006b2 l     F .text	0000000f test_hex16
000006c1 l     F .text	00000019 test_hex8
000006da l     F .text	0000002c test_hex_digit
00000000 l    df *ABS*	00000000 runtime.c
00000708 l       .init_array	00000000 .hidden __init_array_end
00000708 l       .init_array	00000000 .hidden __init_array_start
00000708 l       .fini_array	00000000 .hidden __fini_array_start
00000708 l       .fini_array	00000000 .hidden __fini_array_end
00000300 g     F .text	0000001e _start
00000404 g     F .text	00000268 avm_test_main
00000706 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000003d7 g     F .text	00000013 test_call_memcmp
000003ea g     F .text	0000000f test_call_strcmp
000003f9 g     F .text	0000000b test_call_strlen

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 fe 00              call16	avm_test_main
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
 e1 e8 03              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 08 07              ldi16	r4, 0x708
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 08 07              ldi16	r6, 0x708
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 08 07           ldi16	r0, 0x708
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 08 07           ldi16	r2, 0x708
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
 e1 81 fc              call16	-895
 c4 08 07              ldi16	r4, 0x708
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 08 07              ldi16	r6, 0x708
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 08 07           ldi16	r2, 0x708
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 08 07           ldi16	r0, 0x708
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
 e1 30 fc              call16	-976
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<test_call_memcmp>:
 d6 fa                 adjsp	-0x6
 f4 50                 stsp16	[sp+0x4], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 02                 ldsp16	r6, [sp+0x0]
 d7 18                 sys	memcmp
 d6 06                 adjsp	0x6
 ef                    ret

<test_call_strcmp>:
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f4 41                 stsp16	[sp+0x0], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 01                 ldsp16	r5, [sp+0x0]
 d7 19                 sys	strcmp
 d6 04                 adjsp	0x4
 ef                    ret

<test_call_strlen>:
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 1a                 sys	strlen
 d6 02                 adjsp	0x2
 ef                    ret

<avm_test_main>:
 d6 c8                 adjsp	-0x38
 a0                    xor	r4, r4
 f0 3c 36              stsp16	[sp+0x36], r4
 d4 00                 jmp8	avm_test_main+8
 f0 35 36              ldsp16	r5, [sp+0x36]
 c4 03 01              ldi16	r4, 0x103
 31                    cmp	r4, r5
 d2 18                 brult8	avm_test_main+41
 d4 00                 jmp8	avm_test_main+19
 f0 34 36              ldsp16	r4, [sp+0x36]
 c5 44 01              ldi16	r5, 0x144
 11                    add	r4, r5
 c1 78                 ldi8	r5, 0x78
 51                    st8	[r4], r5
 d4 00                 jmp8	avm_test_main+31
 f0 34 36              ldsp16	r4, [sp+0x36]
 f4 ac                 inc16	r4
 f0 3c 36              stsp16	[sp+0x36], r4
 d4 df                 jmp8	avm_test_main+8
 a0                    xor	r4, r4
 f4 50                 stsp16	[sp+0x4], r4
 f0 4c 48 02           stm8	[0x248], r4
 c4 44 01              ldi16	r4, 0x144
 f0 3c 14              stsp16	[sp+0x14], r4
 c4 00 01              ldi16	r4, 0x100
 c5 05 01              ldi16	r5, 0x105
 c2 05                 ldi8	r6, 0x5
 f4 42                 stsp16	[sp+0x0], r6
 d5 91                 call8	test_call_memcmp
 f4 02                 ldsp16	r6, [sp+0x0]
 f0 3c 34              stsp16	[sp+0x34], r4
 c4 0a 01              ldi16	r4, 0x10a
 f4 58                 stsp16	[sp+0x6], r4
 c5 0f 01              ldi16	r5, 0x10f
 f4 49                 stsp16	[sp+0x2], r5
 d5 80                 call8	test_call_memcmp
 f4 02                 ldsp16	r6, [sp+0x0]
 f0 3c 32              stsp16	[sp+0x32], r4
 c4 14 01              ldi16	r4, 0x114
 c5 19 01              ldi16	r5, 0x119
 e1 72 ff              call16	test_call_memcmp
 f4 02                 ldsp16	r6, [sp+0x0]
 f0 3c 30              stsp16	[sp+0x30], r4
 c4 1e 01              ldi16	r4, 0x11e
 c5 23 01              ldi16	r5, 0x123
 e1 64 ff              call16	test_call_memcmp
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 12                 ldsp16	r6, [sp+0x4]
 0c                    mov	r7, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f0 3f 2e              stsp16	[sp+0x2e], r7
 e1 57 ff              call16	test_call_memcmp
 f0 3c 2c              stsp16	[sp+0x2c], r4
 c5 28 01              ldi16	r5, 0x128
 f4 61                 stsp16	[sp+0x8], r5
 01                    mov	r4, r5
 e1 5e ff              call16	test_call_strcmp
 04                    mov	r5, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f0 3d 2a              stsp16	[sp+0x2a], r5
 c5 2e 01              ldi16	r5, 0x12e
 f4 69                 stsp16	[sp+0xa], r5
 e1 50 ff              call16	test_call_strcmp
 f4 21                 ldsp16	r5, [sp+0x8]
 08                    mov	r6, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 f0 3e 28              stsp16	[sp+0x28], r6
 e1 45 ff              call16	test_call_strcmp
 f0 3c 26              stsp16	[sp+0x26], r4
 c4 34 01              ldi16	r4, 0x134
 f4 70                 stsp16	[sp+0xc], r4
 c5 38 01              ldi16	r5, 0x138
 f4 79                 stsp16	[sp+0xe], r5
 e1 35 ff              call16	test_call_strcmp
 f4 31                 ldsp16	r5, [sp+0xc]
 08                    mov	r6, r4
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 3e 24              stsp16	[sp+0x24], r6
 e1 2a ff              call16	test_call_strcmp
 f0 3c 22              stsp16	[sp+0x22], r4
 c4 40 01              ldi16	r4, 0x140
 f0 3c 10              stsp16	[sp+0x10], r4
 c5 42 01              ldi16	r5, 0x142
 f0 3d 12              stsp16	[sp+0x12], r5
 e1 18 ff              call16	test_call_strcmp
 f0 35 10              ldsp16	r5, [sp+0x10]
 08                    mov	r6, r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 3e 20              stsp16	[sp+0x20], r6
 e1 0b ff              call16	test_call_strcmp
 f0 3c 1e              stsp16	[sp+0x1e], r4
 c4 49 02              ldi16	r4, 0x249
 e1 11 ff              call16	test_call_strlen
 f0 3c 1c              stsp16	[sp+0x1c], r4
 c4 4a 02              ldi16	r4, 0x24a
 e1 08 ff              call16	test_call_strlen
 04                    mov	r5, r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 3d 1a              stsp16	[sp+0x1a], r5
 e1 fe fe              call16	test_call_strlen
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 35 34              ldsp16	r5, [sp+0x34]
 c4 4f 02              ldi16	r4, 0x24f
 e1 65 01              call16	test_line16
 f0 35 32              ldsp16	r5, [sp+0x32]
 c4 52 02              ldi16	r4, 0x252
 e1 5c 01              call16	test_line16
 f0 35 30              ldsp16	r5, [sp+0x30]
 c4 55 02              ldi16	r4, 0x255
 e1 53 01              call16	test_line16
 f0 35 2e              ldsp16	r5, [sp+0x2e]
 c4 58 02              ldi16	r4, 0x258
 e1 4a 01              call16	test_line16
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 c4 5b 02              ldi16	r4, 0x25b
 e1 41 01              call16	test_line16
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 c4 5e 02              ldi16	r4, 0x25e
 e1 38 01              call16	test_line16
 f0 35 28              ldsp16	r5, [sp+0x28]
 c4 61 02              ldi16	r4, 0x261
 e1 2f 01              call16	test_line16
 f0 35 26              ldsp16	r5, [sp+0x26]
 c4 64 02              ldi16	r4, 0x264
 e1 26 01              call16	test_line16
 f0 35 24              ldsp16	r5, [sp+0x24]
 c4 67 02              ldi16	r4, 0x267
 e1 1d 01              call16	test_line16
 f0 35 22              ldsp16	r5, [sp+0x22]
 c4 6a 02              ldi16	r4, 0x26a
 e1 14 01              call16	test_line16
 f0 35 20              ldsp16	r5, [sp+0x20]
 c4 6d 02              ldi16	r4, 0x26d
 e1 0b 01              call16	test_line16
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 c4 70 02              ldi16	r4, 0x270
 e1 02 01              call16	test_line16
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 c4 73 02              ldi16	r4, 0x273
 e1 f9 00              call16	test_line16
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 c4 76 02              ldi16	r4, 0x276
 e1 f0 00              call16	test_line16
 f0 35 18              ldsp16	r5, [sp+0x18]
 c4 79 02              ldi16	r4, 0x279
 e1 e7 00              call16	test_line16
 f0 35 34              ldsp16	r5, [sp+0x34]
 c0 01                 ldi8	r4, 0x1
 f6 2d                 tst16	r5
 f0 3c 16              stsp16	[sp+0x16], r4
 db d1 00              brne16	avm_test_main+607
 d4 00                 jmp8	avm_test_main+400
 f0 35 32              ldsp16	r5, [sp+0x32]
 c0 01                 ldi8	r4, 0x1
 c6 02 ff              ldi16	r6, 0xff02
 36                    cmp	r5, r6
 f0 3c 16              stsp16	[sp+0x16], r4
 db c0 00              brne16	avm_test_main+607
 d4 00                 jmp8	avm_test_main+417
 f0 35 30              ldsp16	r5, [sp+0x30]
 c0 01                 ldi8	r4, 0x1
 c2 fc                 ldi8	r6, 0xfc
 36                    cmp	r5, r6
 f0 3c 16              stsp16	[sp+0x16], r4
 db b0 00              brne16	avm_test_main+607
 d4 00                 jmp8	avm_test_main+433
 f0 35 2e              ldsp16	r5, [sp+0x2e]
 c0 01                 ldi8	r4, 0x1
 cd 05                 cmpi.s8	r5, 0x5
 f0 3c 16              stsp16	[sp+0x16], r4
 db a1 00              brne16	avm_test_main+607
 d4 00                 jmp8	avm_test_main+448
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 c0 01                 ldi8	r4, 0x1
 f6 2d                 tst16	r5
 f0 3c 16              stsp16	[sp+0x16], r4
 db 92 00              brne16	avm_test_main+607
 d4 00                 jmp8	avm_test_main+463
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 c0 01                 ldi8	r4, 0x1
 f6 2d                 tst16	r5
 f0 3c 16              stsp16	[sp+0x16], r4
 db 83 00              brne16	avm_test_main+607
 d4 00                 jmp8	avm_test_main+478
 f0 35 28              ldsp16	r5, [sp+0x28]
 c0 01                 ldi8	r4, 0x1
 cd e7                 cmpi.s8	r5, -0x19
 f0 3c 16              stsp16	[sp+0x16], r4
 d1 75                 brne8	avm_test_main+607
 d4 00                 jmp8	avm_test_main+492
 f0 35 26              ldsp16	r5, [sp+0x26]
 c0 01                 ldi8	r4, 0x1
 cd 19                 cmpi.s8	r5, 0x19
 f0 3c 16              stsp16	[sp+0x16], r4
 d1 67                 brne8	avm_test_main+607
 d4 00                 jmp8	avm_test_main+506
 f0 35 24              ldsp16	r5, [sp+0x24]
 c0 01                 ldi8	r4, 0x1
 cd 9f                 cmpi.s8	r5, -0x61
 f0 3c 16              stsp16	[sp+0x16], r4
 d1 59                 brne8	avm_test_main+607
 d4 00                 jmp8	avm_test_main+520
 f0 35 22              ldsp16	r5, [sp+0x22]
 c0 01                 ldi8	r4, 0x1
 cd 61                 cmpi.s8	r5, 0x61
 f0 3c 16              stsp16	[sp+0x16], r4
 d1 4b                 brne8	avm_test_main+607
 d4 00                 jmp8	avm_test_main+534
 f0 35 20              ldsp16	r5, [sp+0x20]
 c0 01                 ldi8	r4, 0x1
 c2 e0                 ldi8	r6, 0xe0
 36                    cmp	r5, r6
 f0 3c 16              stsp16	[sp+0x16], r4
 d1 3c                 brne8	avm_test_main+607
 d4 00                 jmp8	avm_test_main+549
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 c0 01                 ldi8	r4, 0x1
 c6 20 ff              ldi16	r6, 0xff20
 36                    cmp	r5, r6
 f0 3c 16              stsp16	[sp+0x16], r4
 d1 2c                 brne8	avm_test_main+607
 d4 00                 jmp8	avm_test_main+565
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 c0 01                 ldi8	r4, 0x1
 f6 2d                 tst16	r5
 f0 3c 16              stsp16	[sp+0x16], r4
 d1 1e                 brne8	avm_test_main+607
 d4 00                 jmp8	avm_test_main+579
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 c0 01                 ldi8	r4, 0x1
 cd 04                 cmpi.s8	r5, 0x4
 f0 3c 16              stsp16	[sp+0x16], r4
 d1 10                 brne8	avm_test_main+607
 d4 00                 jmp8	avm_test_main+593
 f0 34 18              ldsp16	r4, [sp+0x18]
 c5 04 01              ldi16	r5, 0x104
 31                    cmp	r4, r5
 f8 0c                 cset.ne	r4
 f0 3c 16              stsp16	[sp+0x16], r4
 d4 00                 jmp8	avm_test_main+607
 f0 34 16              ldsp16	r4, [sp+0x16]
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 d6 38                 adjsp	0x38
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
