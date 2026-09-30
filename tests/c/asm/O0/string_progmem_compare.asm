
string_progmem_compare.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 string_progmem_compare.c
000005f7 l     O .rodata	00000005 p_equal
00000100 l     O .data	00000005 avm_test_main.equal
000005fc l     O .rodata	00000005 p_high
00000105 l     O .data	00000005 avm_test_main.low
00000601 l     O .rodata	00000005 p_low
0000010a l     O .data	00000005 avm_test_main.high
00000606 l     O .rodata	00000005 p_late
0000010f l     O .data	00000005 avm_test_main.late
0000060b l     O .rodata	00000006 p_alpha
00000114 l     O .data	00000006 avm_test_main.alpha
00000611 l     O .rodata	00000006 p_alphz
0000011a l     O .data	00000006 avm_test_main.alphz
00000617 l     O .rodata	00000008 p_catalog
00000120 l     O .data	00000004 avm_test_main.cat
0000061f l     O .rodata	00000004 p_cat
00000124 l     O .data	00000008 avm_test_main.catalog
00000623 l     O .rodata	00000002 p_unsigned_lo
0000012c l     O .data	00000002 avm_test_main.unsigned_hi
00000625 l     O .rodata	00000001 p_empty
00000626 l     O .rodata	00000008 p_short
0000062e l     O .rodata	00000105 p_long
0000012e l     O .data	00000003 .L.str
0000055b l     F .text	00000019 test_line16
00000131 l     O .data	00000003 .L.str.1
00000134 l     O .data	00000003 .L.str.2
00000137 l     O .data	00000003 .L.str.3
0000013a l     O .data	00000003 .L.str.4
0000013d l     O .data	00000003 .L.str.5
00000140 l     O .data	00000003 .L.str.6
00000143 l     O .data	00000003 .L.str.7
00000146 l     O .data	00000003 .L.str.8
00000149 l     O .data	00000003 .L.str.9
0000014c l     O .data	00000003 .L.str.10
0000014f l     O .data	00000003 .L.str.11
00000152 l     O .data	00000003 .L.str.12
00000155 l     O .data	00000003 .L.str.13
00000574 l     F .text	00000022 test_puts
00000596 l     F .text	0000000b test_putc
000005a1 l     F .text	0000000f test_hex16
000005b0 l     F .text	00000019 test_hex8
000005c9 l     F .text	0000002c test_hex_digit
00000000 l    df *ABS*	00000000 runtime.c
00000733 l       .init_array	00000000 .hidden __init_array_end
00000733 l       .init_array	00000000 .hidden __init_array_start
00000733 l       .fini_array	00000000 .hidden __fini_array_start
00000733 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
00000312 g     F .text	00000249 avm_test_main
000005f5 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000002d7 g     F .text	00000017 test_call_memcmp_P
000002ee g     F .text	00000013 test_call_strcmp_P
00000301 g     F .text	00000011 test_call_strlen_P

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 0c 01              call16	avm_test_main
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
 e1 d7 03              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 33 07              ldi16	r4, 0x733
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 33 07              ldi16	r6, 0x733
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 33 07           ldi16	r0, 0x733
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 33 07           ldi16	r2, 0x733
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
 c4 33 07              ldi16	r4, 0x733
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 33 07              ldi16	r6, 0x733
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 33 07           ldi16	r2, 0x733
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 33 07           ldi16	r0, 0x733
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

<test_call_memcmp_P>:
 d6 fb                 adjsp	-0x5
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 4c                 stsp16	[sp+0x3], r4
 f4 42                 stsp16	[sp+0x0], r6
 f1 3b                 stsp8	[sp+0x2], r7
 f4 0c                 ldsp16	r4, [sp+0x3]
 f4 02                 ldsp16	r6, [sp+0x0]
 f3 4b                 ldsp8u	r7, [sp+0x2]
 f4 21                 ldsp16	r5, [sp+0x8]
 d7 13                 sys	memcmp_p
 d6 05                 adjsp	0x5
 ef                    ret

<test_call_strcmp_P>:
 d6 fb                 adjsp	-0x5
 f4 4c                 stsp16	[sp+0x3], r4
 f4 42                 stsp16	[sp+0x0], r6
 f1 3b                 stsp8	[sp+0x2], r7
 f4 0c                 ldsp16	r4, [sp+0x3]
 f4 02                 ldsp16	r6, [sp+0x0]
 f3 4b                 ldsp8u	r7, [sp+0x2]
 d7 14                 sys	strcmp_p
 d6 05                 adjsp	0x5
 ef                    ret

<test_call_strlen_P>:
 d6 fd                 adjsp	-0x3
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f3 49                 ldsp8u	r5, [sp+0x2]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d7 15                 sys	strlen_p
 d6 03                 adjsp	0x3
 ef                    ret

<avm_test_main>:
 d6 d4                 adjsp	-0x2c
 d6 fe                 adjsp	-0x2
 c0 05                 ldi8	r4, 0x5
 f4 48                 stsp16	[sp+0x2], r4
 f4 40                 stsp16	[sp+0x0], r4
 c6 f7 05              ldi16	r6, 0x5f7
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 00 01              ldi16	r4, 0x100
 d5 af                 call8	test_call_memcmp_P
 d6 02                 adjsp	0x2
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 3d 2a              stsp16	[sp+0x2a], r5
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 c6 fc 05              ldi16	r6, 0x5fc
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 c4 05 01              ldi16	r4, 0x105
 f4 60                 stsp16	[sp+0x8], r4
 d5 91                 call8	test_call_memcmp_P
 d6 02                 adjsp	0x2
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 3d 28              stsp16	[sp+0x28], r5
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 c6 01 06              ldi16	r6, 0x601
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 0a 01              ldi16	r4, 0x10a
 e1 78 ff              call16	test_call_memcmp_P
 d6 02                 adjsp	0x2
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 3d 26              stsp16	[sp+0x26], r5
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 c6 06 06              ldi16	r6, 0x606
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 0f 01              ldi16	r4, 0x10f
 e1 5f ff              call16	test_call_memcmp_P
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 d6 02                 adjsp	0x2
 04                    mov	r5, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f0 3d 24              stsp16	[sp+0x24], r5
 d6 fe                 adjsp	-0x2
 a5                    xor	r5, r5
 f4 41                 stsp16	[sp+0x0], r5
 e1 4b ff              call16	test_call_memcmp_P
 d6 02                 adjsp	0x2
 f0 3c 22              stsp16	[sp+0x22], r4
 c6 0b 06              ldi16	r6, 0x60b
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 c4 14 01              ldi16	r4, 0x114
 f4 60                 stsp16	[sp+0x8], r4
 e1 4a ff              call16	test_call_strcmp_P
 04                    mov	r5, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f0 3d 20              stsp16	[sp+0x20], r5
 c6 11 06              ldi16	r6, 0x611
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 e1 3a ff              call16	test_call_strcmp_P
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 f0 3c 1e              stsp16	[sp+0x1e], r4
 c4 1a 01              ldi16	r4, 0x11a
 e1 2d ff              call16	test_call_strcmp_P
 f0 3c 1c              stsp16	[sp+0x1c], r4
 c6 17 06              ldi16	r6, 0x617
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 20 01              ldi16	r4, 0x120
 e1 1d ff              call16	test_call_strcmp_P
 f0 3c 1a              stsp16	[sp+0x1a], r4
 c6 1f 06              ldi16	r6, 0x61f
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 24 01              ldi16	r4, 0x124
 e1 0d ff              call16	test_call_strcmp_P
 f0 3c 18              stsp16	[sp+0x18], r4
 c6 23 06              ldi16	r6, 0x623
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 2c 01              ldi16	r4, 0x12c
 e1 fd fe              call16	test_call_strcmp_P
 f0 3c 16              stsp16	[sp+0x16], r4
 c4 25 06              ldi16	r4, 0x625
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 e1 03 ff              call16	test_call_strlen_P
 f0 3c 14              stsp16	[sp+0x14], r4
 c4 26 06              ldi16	r4, 0x626
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 e1 f6 fe              call16	test_call_strlen_P
 f0 3c 12              stsp16	[sp+0x12], r4
 c4 2e 06              ldi16	r4, 0x62e
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 e1 e9 fe              call16	test_call_strlen_P
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 c4 2e 01              ldi16	r4, 0x12e
 e1 37 01              call16	test_line16
 f0 35 28              ldsp16	r5, [sp+0x28]
 c4 31 01              ldi16	r4, 0x131
 e1 2e 01              call16	test_line16
 f0 35 26              ldsp16	r5, [sp+0x26]
 c4 34 01              ldi16	r4, 0x134
 e1 25 01              call16	test_line16
 f0 35 24              ldsp16	r5, [sp+0x24]
 c4 37 01              ldi16	r4, 0x137
 e1 1c 01              call16	test_line16
 f0 35 22              ldsp16	r5, [sp+0x22]
 c4 3a 01              ldi16	r4, 0x13a
 e1 13 01              call16	test_line16
 f0 35 20              ldsp16	r5, [sp+0x20]
 c4 3d 01              ldi16	r4, 0x13d
 e1 0a 01              call16	test_line16
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 c4 40 01              ldi16	r4, 0x140
 e1 01 01              call16	test_line16
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 c4 43 01              ldi16	r4, 0x143
 e1 f8 00              call16	test_line16
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 c4 46 01              ldi16	r4, 0x146
 e1 ef 00              call16	test_line16
 f0 35 18              ldsp16	r5, [sp+0x18]
 c4 49 01              ldi16	r4, 0x149
 e1 e6 00              call16	test_line16
 f0 35 16              ldsp16	r5, [sp+0x16]
 c4 4c 01              ldi16	r4, 0x14c
 e1 dd 00              call16	test_line16
 f0 35 14              ldsp16	r5, [sp+0x14]
 c4 4f 01              ldi16	r4, 0x14f
 e1 d4 00              call16	test_line16
 f0 35 12              ldsp16	r5, [sp+0x12]
 c4 52 01              ldi16	r4, 0x152
 e1 cb 00              call16	test_line16
 f0 35 10              ldsp16	r5, [sp+0x10]
 c4 55 01              ldi16	r4, 0x155
 e1 c2 00              call16	test_line16
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 c0 01                 ldi8	r4, 0x1
 f6 2d                 tst16	r5
 f4 78                 stsp16	[sp+0xe], r4
 db ae 00              brne16	avm_test_main+577
 d4 00                 jmp8	avm_test_main+405
 f0 35 28              ldsp16	r5, [sp+0x28]
 c0 01                 ldi8	r4, 0x1
 cd ff                 cmpi.s8	r5, -0x1
 f4 78                 stsp16	[sp+0xe], r4
 db a0 00              brne16	avm_test_main+577
 d4 00                 jmp8	avm_test_main+419
 f0 35 26              ldsp16	r5, [sp+0x26]
 c0 01                 ldi8	r4, 0x1
 cd 01                 cmpi.s8	r5, 0x1
 f4 78                 stsp16	[sp+0xe], r4
 db 92 00              brne16	avm_test_main+577
 d4 00                 jmp8	avm_test_main+433
 f0 35 24              ldsp16	r5, [sp+0x24]
 c0 01                 ldi8	r4, 0x1
 cd ff                 cmpi.s8	r5, -0x1
 f4 78                 stsp16	[sp+0xe], r4
 db 84 00              brne16	avm_test_main+577
 d4 00                 jmp8	avm_test_main+447
 f0 35 22              ldsp16	r5, [sp+0x22]
 c0 01                 ldi8	r4, 0x1
 f6 2d                 tst16	r5
 f4 78                 stsp16	[sp+0xe], r4
 d1 77                 brne8	avm_test_main+577
 d4 00                 jmp8	avm_test_main+460
 f0 35 20              ldsp16	r5, [sp+0x20]
 c0 01                 ldi8	r4, 0x1
 f6 2d                 tst16	r5
 f4 78                 stsp16	[sp+0xe], r4
 d1 6a                 brne8	avm_test_main+577
 d4 00                 jmp8	avm_test_main+473
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 c0 01                 ldi8	r4, 0x1
 cd ff                 cmpi.s8	r5, -0x1
 f4 78                 stsp16	[sp+0xe], r4
 d1 5d                 brne8	avm_test_main+577
 d4 00                 jmp8	avm_test_main+486
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 c0 01                 ldi8	r4, 0x1
 cd 01                 cmpi.s8	r5, 0x1
 f4 78                 stsp16	[sp+0xe], r4
 d1 50                 brne8	avm_test_main+577
 d4 00                 jmp8	avm_test_main+499
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 c0 01                 ldi8	r4, 0x1
 cd ff                 cmpi.s8	r5, -0x1
 f4 78                 stsp16	[sp+0xe], r4
 d1 43                 brne8	avm_test_main+577
 d4 00                 jmp8	avm_test_main+512
 f0 35 18              ldsp16	r5, [sp+0x18]
 c0 01                 ldi8	r4, 0x1
 cd 01                 cmpi.s8	r5, 0x1
 f4 78                 stsp16	[sp+0xe], r4
 d1 36                 brne8	avm_test_main+577
 d4 00                 jmp8	avm_test_main+525
 f0 35 16              ldsp16	r5, [sp+0x16]
 c0 01                 ldi8	r4, 0x1
 cd 01                 cmpi.s8	r5, 0x1
 f4 78                 stsp16	[sp+0xe], r4
 d1 29                 brne8	avm_test_main+577
 d4 00                 jmp8	avm_test_main+538
 f0 35 14              ldsp16	r5, [sp+0x14]
 c0 01                 ldi8	r4, 0x1
 f6 2d                 tst16	r5
 f4 78                 stsp16	[sp+0xe], r4
 d1 1c                 brne8	avm_test_main+577
 d4 00                 jmp8	avm_test_main+551
 f0 35 12              ldsp16	r5, [sp+0x12]
 c0 01                 ldi8	r4, 0x1
 cd 07                 cmpi.s8	r5, 0x7
 f4 78                 stsp16	[sp+0xe], r4
 d1 0f                 brne8	avm_test_main+577
 d4 00                 jmp8	avm_test_main+564
 f0 34 10              ldsp16	r4, [sp+0x10]
 c5 04 01              ldi16	r5, 0x104
 31                    cmp	r4, r5
 f8 0c                 cset.ne	r4
 f4 78                 stsp16	[sp+0xe], r4
 d4 00                 jmp8	avm_test_main+577
 f4 38                 ldsp16	r4, [sp+0xe]
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 d6 2c                 adjsp	0x2c
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
