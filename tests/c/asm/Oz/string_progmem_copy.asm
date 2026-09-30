
string_progmem_copy.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000041e l     F .text	0000004a avm_run_constructors
00000468 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 string_progmem_copy.c
0000095b l     O .rodata	00000004 p_cat
0000095f l     O .rodata	00000007 p_abcdef
00000966 l     O .rodata	00000004 p_dog
0000096a l     O .rodata	00000008 p_ignored
00000100 l     O .data	0000000c .L__const.avm_test_main.full
0000010c l     O .data	0000000c .L__const.avm_test_main.cut
00000972 l     O .rodata	00000005 p_wood
00000977 l     O .rodata	00000007 p_flower
0000097e l     O .rodata	00000005 p_berg
00000983 l     O .rodata	00000001 p_empty
00000984 l     O .rodata	00000003 p_go
00000118 l     O .data	00000107 avm_test_main.long_pad
00000987 l     O .rodata	00000002 p_z
0000021f l     O .data	0000010e avm_test_main.long_cat
000008a9 l     F .text	0000002a hash_bytes
0000032d l     O .data	00000003 .L.str
000008d3 l     F .text	00000026 test_line16
00000330 l     O .data	00000003 .L.str.1
00000333 l     O .data	00000003 .L.str.2
00000336 l     O .data	00000003 .L.str.3
00000339 l     O .data	00000003 .L.str.4
0000033c l     O .data	00000003 .L.str.5
0000033f l     O .data	00000003 .L.str.6
00000342 l     O .data	00000003 .L.str.7
00000345 l     O .data	00000003 .L.str.8
00000348 l     O .data	00000003 .L.str.9
0000034b l     O .data	00000003 .L.str.10
0000034e l     O .data	00000003 .L.str.11
00000351 l     O .data	0000000a avm_test_main.expect_pad
000008f9 l     F .text	0000001e bytes_equal
0000035b l     O .data	00000007 avm_test_main.expect_trunc
00000362 l     O .data	00000006 avm_test_main.expect_exact
00000368 l     O .data	00000005 avm_test_main.expect_zero
0000036d l     O .data	00000008 .L.str.12
00000917 l     F .text	0000001e text_equal
00000375 l     O .data	00000007 .L.str.13
0000037c l     O .data	00000004 .L.str.14
00000380 l     O .data	00000004 .L.str.15
00000384 l     O .data	00000003 .L.str.16
00000935 l     F .text	00000024 test_hex8
00000000 l    df *ABS*	00000000 runtime.c
00000989 l       .init_array	00000000 .hidden __init_array_end
00000989 l       .init_array	00000000 .hidden __init_array_start
00000989 l       .fini_array	00000000 .hidden __fini_array_start
00000989 l       .fini_array	00000000 .hidden __fini_array_end
00000400 g     F .text	0000001e _start
000004ed g     F .text	000003bc avm_test_main
00000959 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000004d7 g     F .text	0000000b test_call_strncpy_P
000004e2 g     F .text	0000000b test_call_strncat_P

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 e7 00              call16	avm_test_main
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
 e1 3b 05              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 89 09              ldi16	r4, 0x989
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 89 09              ldi16	r6, 0x989
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 89 09           ldi16	r0, 0x989
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 89 09           ldi16	r2, 0x989
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
 e1 81 fb              call16	-1151
 c4 89 09              ldi16	r4, 0x989
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 89 09              ldi16	r6, 0x989
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 89 09           ldi16	r2, 0x989
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 89 09           ldi16	r0, 0x989
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
 e1 30 fb              call16	-1232
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<test_call_strncpy_P>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 f4 15                 ldsp16	r5, [sp+0x5]
 d7 16                 sys	strncpy_p
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 ef                    ret

<test_call_strncat_P>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 f4 15                 ldsp16	r5, [sp+0x5]
 d7 17                 sys	strncat_p
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 ef                    ret

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 a0                 adjsp	-0x60
 f0 14 56              leasp	r4, 0x56
 c1 0a                 ldi8	r5, 0xa
 f0 02 a5              ldi8	r2, 0xa5
 f6 2d                 tst16	r5
 d0 08                 breq8	avm_test_main+26
 f6 02                 st8	[r4+], r2
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f8                 brne8	avm_test_main+18
 f0 14 4f              leasp	r4, 0x4f
 c1 07                 ldi8	r5, 0x7
 c2 cc                 ldi8	r6, 0xcc
 f6 2d                 tst16	r5
 d0 08                 breq8	avm_test_main+45
 f6 06                 st8	[r4+], r6
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f8                 brne8	avm_test_main+37
 f0 14 49              leasp	r4, 0x49
 c1 06                 ldi8	r5, 0x6
 c2 7e                 ldi8	r6, 0x7e
 f6 2d                 tst16	r5
 d0 08                 breq8	avm_test_main+64
 f6 06                 st8	[r4+], r6
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f8                 brne8	avm_test_main+56
 f0 14 44              leasp	r4, 0x44
 c1 05                 ldi8	r5, 0x5
 c2 3c                 ldi8	r6, 0x3c
 f6 2d                 tst16	r5
 d0 08                 breq8	avm_test_main+83
 f6 06                 st8	[r4+], r6
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f8                 brne8	avm_test_main+75
 d6 fe                 adjsp	-0x2
 c0 08                 ldi8	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 c6 5b 09              ldi16	r6, 0x95b
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 58              leasp	r4, 0x58
 d5 85                 call8	test_call_strncpy_P
 d6 02                 adjsp	0x2
 d6 fe                 adjsp	-0x2
 c0 03                 ldi8	r4, 0x3
 f4 40                 stsp16	[sp+0x0], r4
 c6 5f 09              ldi16	r6, 0x95f
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 51              leasp	r4, 0x51
 e1 70 ff              call16	test_call_strncpy_P
 d6 02                 adjsp	0x2
 d6 fe                 adjsp	-0x2
 c0 04                 ldi8	r4, 0x4
 f4 40                 stsp16	[sp+0x0], r4
 c6 66 09              ldi16	r6, 0x966
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 4b              leasp	r4, 0x4b
 e1 5b ff              call16	test_call_strncpy_P
 d6 02                 adjsp	0x2
 c6 6a 09              ldi16	r6, 0x96a
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 d6 fe                 adjsp	-0x2
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 46              leasp	r4, 0x46
 e1 47 ff              call16	test_call_strncpy_P
 d6 02                 adjsp	0x2
 f0 01 0c              ldi8	r1, 0xc
 c5 00 01              ldi16	r5, 0x100
 f0 13 38              leasp	r3, 0x38
 f1 23                 mov	r4, r3
 c2 0c                 ldi8	r6, 0xc
 d7 0f                 sys	memcpy
 c5 0c 01              ldi16	r5, 0x10c
 f0 10 2c              leasp	r0, 0x2c
 f1 20                 mov	r4, r0
 d7 0f                 sys	memcpy
 c4 69 63              ldi16	r4, 0x6369
 c1 65                 ldi8	r5, 0x65
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 c6 6f 61              ldi16	r6, 0x616f
 c3 6b                 ldi8	r7, 0x6b
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 d6 fe                 adjsp	-0x2
 c0 08                 ldi8	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 c6 72 09              ldi16	r6, 0x972
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 23                 mov	r4, r3
 f2 4b                 sub	r3, r3
 e1 f3 fe              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 d6 fe                 adjsp	-0x2
 c0 03                 ldi8	r4, 0x3
 f4 40                 stsp16	[sp+0x0], r4
 c6 77 09              ldi16	r6, 0x977
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 e1 df fe              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 d6 fe                 adjsp	-0x2
 f0 3b 00              stsp16	[sp+0x0], r3
 c6 7e 09              ldi16	r6, 0x97e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 26              leasp	r4, 0x26
 e1 cb fe              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 d6 fe                 adjsp	-0x2
 c0 04                 ldi8	r4, 0x4
 f4 40                 stsp16	[sp+0x0], r4
 c6 83 09              ldi16	r6, 0x983
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 1e              leasp	r4, 0x1e
 e1 b6 fe              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 d6 fe                 adjsp	-0x2
 f0 00 02              ldi8	r0, 0x2
 f0 38 00              stsp16	[sp+0x0], r0
 c6 84 09              ldi16	r6, 0x984
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 16              leasp	r4, 0x16
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 e1 99 fe              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 c4 18 01              ldi16	r4, 0x118
 c5 07 01              ldi16	r5, 0x107
 f6 2d                 tst16	r5
 d0 08                 breq8	avm_test_main+368
 f6 02                 st8	[r4+], r2
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f8                 brne8	avm_test_main+360
 d6 fe                 adjsp	-0x2
 c4 04 01              ldi16	r4, 0x104
 f4 40                 stsp16	[sp+0x0], r4
 c6 87 09              ldi16	r6, 0x987
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 18 01              ldi16	r4, 0x118
 e1 66 fe              call16	test_call_strncpy_P
 d6 02                 adjsp	0x2
 c4 1f 02              ldi16	r4, 0x21f
 c5 01 01              ldi16	r5, 0x101
 c2 64                 ldi8	r6, 0x64
 f6 2d                 tst16	r5
 d0 08                 breq8	avm_test_main+410
 f6 06                 st8	[r4+], r6
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f8                 brne8	avm_test_main+402
 f0 4b 20 03           stm8	[0x320], r3
 c4 21 03              ldi16	r4, 0x321
 c1 b6                 ldi8	r5, 0xb6
 f6 29                 tst16	r1
 d0 08                 breq8	avm_test_main+431
 f6 05                 st8	[r4+], r5
 f4 b1                 dec16	r1
 f6 29                 tst16	r1
 d1 f8                 brne8	avm_test_main+423
 d6 fe                 adjsp	-0x2
 f0 38 00              stsp16	[sp+0x0], r0
 c4 1f 02              ldi16	r4, 0x21f
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 e1 35 fe              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 f0 14 56              leasp	r4, 0x56
 c1 0a                 ldi8	r5, 0xa
 e1 f2 01              call16	hash_bytes
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 14 4f              leasp	r4, 0x4f
 c1 07                 ldi8	r5, 0x7
 e1 e7 01              call16	hash_bytes
 f4 78                 stsp16	[sp+0xe], r4
 f0 14 49              leasp	r4, 0x49
 c1 06                 ldi8	r5, 0x6
 e1 dd 01              call16	hash_bytes
 f4 70                 stsp16	[sp+0xc], r4
 f0 14 44              leasp	r4, 0x44
 c1 05                 ldi8	r5, 0x5
 e1 d3 01              call16	hash_bytes
 f4 68                 stsp16	[sp+0xa], r4
 f0 14 38              leasp	r4, 0x38
 f0 00 0c              ldi8	r0, 0xc
 f1 24                 mov	r5, r0
 e1 c6 01              call16	hash_bytes
 f4 60                 stsp16	[sp+0x8], r4
 f0 14 2c              leasp	r4, 0x2c
 f1 24                 mov	r5, r0
 e1 bc 01              call16	hash_bytes
 f4 58                 stsp16	[sp+0x6], r4
 f0 14 24              leasp	r4, 0x24
 f0 00 08              ldi8	r0, 0x8
 f1 24                 mov	r5, r0
 e1 af 01              call16	hash_bytes
 f4 50                 stsp16	[sp+0x4], r4
 f0 14 1c              leasp	r4, 0x1c
 f1 24                 mov	r5, r0
 e1 a5 01              call16	hash_bytes
 f4 48                 stsp16	[sp+0x2], r4
 f0 14 14              leasp	r4, 0x14
 f1 24                 mov	r5, r0
 e1 9b 01              call16	hash_bytes
 f4 40                 stsp16	[sp+0x0], r4
 c4 18 01              ldi16	r4, 0x118
 c5 07 01              ldi16	r5, 0x107
 e1 90 01              call16	hash_bytes
 f1 0c                 mov	r1, r4
 c5 0e 01              ldi16	r5, 0x10e
 c4 1f 02              ldi16	r4, 0x21f
 e1 85 01              call16	hash_bytes
 f1 04                 mov	r0, r4
 c4 2d 03              ldi16	r4, 0x32d
 c5 ff 07              ldi16	r5, 0x7ff
 e1 a4 01              call16	test_line16
 c4 30 03              ldi16	r4, 0x330
 f0 35 10              ldsp16	r5, [sp+0x10]
 e1 9b 01              call16	test_line16
 c4 33 03              ldi16	r4, 0x333
 f4 39                 ldsp16	r5, [sp+0xe]
 e1 93 01              call16	test_line16
 c4 36 03              ldi16	r4, 0x336
 f4 31                 ldsp16	r5, [sp+0xc]
 e1 8b 01              call16	test_line16
 c4 39 03              ldi16	r4, 0x339
 f4 29                 ldsp16	r5, [sp+0xa]
 e1 83 01              call16	test_line16
 c4 3c 03              ldi16	r4, 0x33c
 f4 21                 ldsp16	r5, [sp+0x8]
 e1 7b 01              call16	test_line16
 c4 3f 03              ldi16	r4, 0x33f
 f4 19                 ldsp16	r5, [sp+0x6]
 e1 73 01              call16	test_line16
 c4 42 03              ldi16	r4, 0x342
 f4 11                 ldsp16	r5, [sp+0x4]
 e1 6b 01              call16	test_line16
 c4 45 03              ldi16	r4, 0x345
 f4 09                 ldsp16	r5, [sp+0x2]
 e1 63 01              call16	test_line16
 c4 48 03              ldi16	r4, 0x348
 f4 01                 ldsp16	r5, [sp+0x0]
 e1 5b 01              call16	test_line16
 c4 4b 03              ldi16	r4, 0x34b
 f1 25                 mov	r5, r1
 e1 53 01              call16	test_line16
 c4 4e 03              ldi16	r4, 0x34e
 f1 24                 mov	r5, r0
 e1 4b 01              call16	test_line16
 c4 19 01              ldi16	r4, 0x119
 c5 03 01              ldi16	r5, 0x103
 f0 46 18 01           ldm8u	r6, [0x118]
 ce 5a                 cmpi.s8	r6, 0x5a
 f8 01                 cset.eq	r1
 f6 2d                 tst16	r5
 d0 10                 breq8	avm_test_main+701
 f7 06                 ld8u	r6, [r4+]
 f4 a6                 tst8	r6
 f1 2b                 mov	r6, r3
 fb 31                 cmov.eq	r6, r1
 f4 b5                 dec16	r5
 f1 0e                 mov	r1, r6
 f6 2d                 tst16	r5
 d1 f0                 brne8	avm_test_main+685
 f0 44 23 03           ldm8u	r4, [0x323]
 f4 78                 stsp16	[sp+0xe], r4
 f0 44 22 03           ldm8u	r4, [0x322]
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 44 21 03           ldm8u	r4, [0x321]
 f4 70                 stsp16	[sp+0xc], r4
 f0 44 20 03           ldm8u	r4, [0x320]
 f4 68                 stsp16	[sp+0xa], r4
 f0 44 1e 02           ldm8u	r4, [0x21e]
 f4 58                 stsp16	[sp+0x6], r4
 f0 43 1d 02           ldm8u	r3, [0x21d]
 f0 44 1c 02           ldm8u	r4, [0x21c]
 f4 60                 stsp16	[sp+0x8], r4
 f0 14 56              leasp	r4, 0x56
 c5 51 03              ldi16	r5, 0x351
 c2 0a                 ldi8	r6, 0xa
 e1 1b 01              call16	bytes_equal
 f0 00 01              ldi8	r0, 0x1
 f4 a4                 tst8	r4
 da ba 00              breq16	avm_test_main+947
 f0 14 4f              leasp	r4, 0x4f
 c5 5b 03              ldi16	r5, 0x35b
 c2 07                 ldi8	r6, 0x7
 e1 08 01              call16	bytes_equal
 f4 a4                 tst8	r4
 da aa 00              breq16	avm_test_main+947
 f0 14 49              leasp	r4, 0x49
 c5 62 03              ldi16	r5, 0x362
 c2 06                 ldi8	r6, 0x6
 e1 f8 00              call16	bytes_equal
 f4 a4                 tst8	r4
 da 9a 00              breq16	avm_test_main+947
 f0 14 44              leasp	r4, 0x44
 c5 68 03              ldi16	r5, 0x368
 c2 05                 ldi8	r6, 0x5
 e1 e8 00              call16	bytes_equal
 f4 a4                 tst8	r4
 da 8a 00              breq16	avm_test_main+947
 f0 14 38              leasp	r4, 0x38
 c5 6d 03              ldi16	r5, 0x36d
 e1 f8 00              call16	text_equal
 f4 a4                 tst8	r4
 d0 7d                 breq8	avm_test_main+947
 f0 14 2c              leasp	r4, 0x2c
 c5 75 03              ldi16	r5, 0x375
 e1 eb 00              call16	text_equal
 f4 a4                 tst8	r4
 d0 70                 breq8	avm_test_main+947
 f0 14 24              leasp	r4, 0x24
 c5 7c 03              ldi16	r5, 0x37c
 e1 de 00              call16	text_equal
 f4 a4                 tst8	r4
 d0 63                 breq8	avm_test_main+947
 f0 14 1c              leasp	r4, 0x1c
 c5 80 03              ldi16	r5, 0x380
 e1 d1 00              call16	text_equal
 f4 a4                 tst8	r4
 d0 56                 breq8	avm_test_main+947
 f1 73                 zext8	r3
 f5 1a                 cmp	r3, r2
 f8 0c                 cset.ne	r4
 f4 19                 ldsp16	r5, [sp+0x6]
 f1 75                 zext8	r5
 f5 26                 cmp	r5, r2
 f8 08                 cset.ne	r0
 f9 11                 or	r0, r4
 f0 14 14              leasp	r4, 0x14
 c5 84 03              ldi16	r5, 0x384
 e1 b4 00              call16	text_equal
 f4 a4                 tst8	r4
 f8 04                 cset.eq	r4
 f9 81                 or	r4, r0
 f4 21                 ldsp16	r5, [sp+0x8]
 f1 75                 zext8	r5
 f5 26                 cmp	r5, r2
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 f6 29                 tst16	r1
 f8 04                 cset.eq	r4
 91                    or	r4, r5
 f4 29                 ldsp16	r5, [sp+0xa]
 f1 75                 zext8	r5
 cd 67                 cmpi.s8	r5, 0x67
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f1 74                 zext8	r4
 cc 6f                 cmpi.s8	r4, 0x6f
 f8 0c                 cset.ne	r4
 91                    or	r4, r5
 f4 3a                 ldsp16	r6, [sp+0xe]
 f1 76                 zext8	r6
 c1 b6                 ldi8	r5, 0xb6
 39                    cmp	r6, r5
 f8 0d                 cset.ne	r5
 f0 36 10              ldsp16	r6, [sp+0x10]
 f4 a6                 tst8	r6
 f8 0e                 cset.ne	r6
 98                    or	r6, r4
 99                    or	r6, r5
 f0 00 01              ldi8	r0, 0x1
 f9 18                 and	r0, r6
 f1 20                 mov	r4, r0
 d6 60                 adjsp	0x60
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<hash_bytes>:
 b1                    push16	r1
 b0                    push16	r0
 f2 30                 sub	r0, r0
 c6 2b 6d              ldi16	r6, 0x6d2b
 f0 01 11              ldi8	r1, 0x11
 f6 2d                 tst16	r5
 d0 18                 breq8	hash_bytes+38
 0e                    mov	r7, r6
 fa ab                 lsr16i	r7, 0xb
 fa 55                 lsl16i	r6, 0x5
 9b                    or	r6, r7
 f7 07                 ld8u	r7, [r4+]
 ae                    xor	r7, r6
 f1 28                 mov	r6, r0
 fe 31                 mul16	r6, r1
 1b                    add	r6, r7
 f4 b5                 dec16	r5
 f4 a8                 inc16	r0
 ca 03                 addi.s8	r6, 0x3
 f6 2d                 tst16	r5
 d1 e8                 brne8	hash_bytes+14
 02                    mov	r4, r6
 b8                    pop16	r0
 b9                    pop16	r1
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
 d5 49                 call8	test_hex8
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 74                 zext8	r4
 d5 43                 call8	test_hex8
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d6 02                 adjsp	0x2
 ef                    ret

<bytes_equal>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 af                    xor	r7, r7
 f1 07                 mov	r0, r7
 f5 28                 cmp	r6, r0
 d0 0c                 breq8	bytes_equal+22
 f7 09                 ld8u	r1, [r5+]
 f7 02                 ld8u	r2, [r4+]
 f1 2c                 mov	r7, r0
 f4 af                 inc16	r7
 f5 11                 cmp	r2, r1
 d0 ee                 breq8	bytes_equal+4
 f5 06                 cmp	r0, r6
 f8 1c                 cset.uge	r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<text_equal>:
 b1                    push16	r1
 b0                    push16	r0
 f1 0c                 mov	r1, r4
 a0                    xor	r4, r4
 f0 00 01              ldi8	r0, 0x1
 ed e2 20              ld8u	r7, [r1+0]
 49                    ld8u	r6, [r5]
 3e                    cmp	r7, r6
 d1 0c                 brne8	text_equal+27
 f4 a7                 tst8	r7
 d0 06                 breq8	text_equal+25
 f4 ad                 inc16	r5
 f4 a9                 inc16	r1
 d4 ef                 jmp8	text_equal+8
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 b9                    pop16	r1
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
