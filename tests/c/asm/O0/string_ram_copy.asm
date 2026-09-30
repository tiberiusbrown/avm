
string_ram_copy.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 string_ram_copy.c
000006bf l     F .text	0000002f fill_bytes
00000100 l     O .data	00000004 .L.str
00000104 l     O .data	00000007 .L.str.1
0000010b l     O .data	00000004 .L.str.2
0000010f l     O .data	00000008 .L.str.3
00000117 l     O .data	0000000c .L__const.avm_test_main.full
00000123 l     O .data	0000000c .L__const.avm_test_main.cut
0000012f l     O .data	00000008 .L__const.avm_test_main.nochange
00000137 l     O .data	00000008 .L__const.avm_test_main.empty_source
0000013f l     O .data	00000005 .L.str.4
00000144 l     O .data	00000007 .L.str.5
0000014b l     O .data	00000005 .L.str.6
00000150 l     O .data	00000001 .L.str.7
00000151 l     O .data	00000003 .L.str.8
000006ee l     F .text	0000004e hash_bytes
00000154 l     O .data	00000003 .L.str.9
0000073c l     F .text	0000001d test_line16
00000157 l     O .data	00000003 .L.str.10
0000015a l     O .data	00000003 .L.str.11
0000015d l     O .data	00000003 .L.str.12
00000160 l     O .data	00000003 .L.str.13
00000163 l     O .data	00000003 .L.str.14
00000166 l     O .data	00000003 .L.str.15
00000169 l     O .data	00000003 .L.str.16
0000016c l     O .data	00000003 .L.str.17
0000016f l     O .data	00000003 .L.str.18
00000172 l     O .data	0000000a avm_test_main.expect_pad
00000759 l     F .text	00000047 bytes_equal
0000017c l     O .data	00000007 avm_test_main.expect_trunc
00000183 l     O .data	00000006 avm_test_main.expect_exact
00000189 l     O .data	00000005 avm_test_main.expect_zero
0000018e l     O .data	00000008 .L.str.19
000007a0 l     F .text	00000040 text_equal
00000196 l     O .data	00000007 .L.str.20
0000019d l     O .data	00000004 .L.str.21
000001a1 l     O .data	00000004 .L.str.22
000007e0 l     F .text	00000022 test_puts
00000802 l     F .text	0000000b test_putc
0000080d l     F .text	0000000f test_hex16
0000081c l     F .text	00000019 test_hex8
00000835 l     F .text	0000002c test_hex_digit
00000000 l    df *ABS*	00000000 runtime.c
00000863 l       .init_array	00000000 .hidden __init_array_end
00000863 l       .init_array	00000000 .hidden __init_array_start
00000863 l       .fini_array	00000000 .hidden __fini_array_start
00000863 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002fd g     F .text	000003c2 avm_test_main
00000861 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000002d7 g     F .text	00000013 test_call_strncpy
000002ea g     F .text	00000013 test_call_strncat

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 f7 00              call16	avm_test_main
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
 e1 43 06              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 63 08              ldi16	r4, 0x863
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 63 08              ldi16	r6, 0x863
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 63 08           ldi16	r0, 0x863
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 63 08           ldi16	r2, 0x863
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
 c4 63 08              ldi16	r4, 0x863
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 63 08              ldi16	r6, 0x863
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 63 08           ldi16	r2, 0x863
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 63 08           ldi16	r0, 0x863
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

<test_call_strncpy>:
 d6 fa                 adjsp	-0x6
 f4 50                 stsp16	[sp+0x4], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 02                 ldsp16	r6, [sp+0x0]
 d7 1b                 sys	strncpy
 d6 06                 adjsp	0x6
 ef                    ret

<test_call_strncat>:
 d6 fa                 adjsp	-0x6
 f4 50                 stsp16	[sp+0x4], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 02                 ldsp16	r6, [sp+0x0]
 d7 1c                 sys	strncat
 d6 06                 adjsp	0x6
 ef                    ret

<avm_test_main>:
 d6 80                 adjsp	-0x80
 d6 f8                 adjsp	-0x8
 f0 14 7e              leasp	r4, 0x7e
 f0 3c 12              stsp16	[sp+0x12], r4
 c1 a5                 ldi8	r5, 0xa5
 c2 0a                 ldi8	r6, 0xa
 e1 b1 03              call16	fill_bytes
 f0 14 77              leasp	r4, 0x77
 f4 70                 stsp16	[sp+0xc], r4
 c1 cc                 ldi8	r5, 0xcc
 c2 07                 ldi8	r6, 0x7
 e1 a5 03              call16	fill_bytes
 f0 14 71              leasp	r4, 0x71
 f4 78                 stsp16	[sp+0xe], r4
 c1 7e                 ldi8	r5, 0x7e
 c2 06                 ldi8	r6, 0x6
 e1 99 03              call16	fill_bytes
 f0 14 6c              leasp	r4, 0x6c
 f0 3c 10              stsp16	[sp+0x10], r4
 c1 3c                 ldi8	r5, 0x3c
 c2 05                 ldi8	r6, 0x5
 e1 8c 03              call16	fill_bytes
 f0 34 12              ldsp16	r4, [sp+0x12]
 c5 00 01              ldi16	r5, 0x100
 c2 08                 ldi8	r6, 0x8
 d5 9a                 call8	test_call_strncpy
 04                    mov	r5, r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f0 3d 6a              stsp16	[sp+0x6a], r5
 c5 04 01              ldi16	r5, 0x104
 c2 03                 ldi8	r6, 0x3
 d5 8d                 call8	test_call_strncpy
 04                    mov	r5, r4
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 3d 68              stsp16	[sp+0x68], r5
 c5 0b 01              ldi16	r5, 0x10b
 c2 04                 ldi8	r6, 0x4
 d5 80                 call8	test_call_strncpy
 04                    mov	r5, r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 3d 66              stsp16	[sp+0x66], r5
 c5 0f 01              ldi16	r5, 0x10f
 aa                    xor	r6, r6
 f0 3e 14              stsp16	[sp+0x14], r6
 e1 6f ff              call16	test_call_strncpy
 f0 35 12              ldsp16	r5, [sp+0x12]
 08                    mov	r6, r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 3e 64              stsp16	[sp+0x64], r6
 f0 3c 62              stsp16	[sp+0x62], r4
 f0 34 6a              ldsp16	r4, [sp+0x6a]
 31                    cmp	r4, r5
 d1 0d                 brne8	avm_test_main+139
 d4 00                 jmp8	avm_test_main+128
 f0 34 62              ldsp16	r4, [sp+0x62]
 c1 01                 ldi8	r5, 0x1
 91                    or	r4, r5
 f0 3c 62              stsp16	[sp+0x62], r4
 d4 00                 jmp8	avm_test_main+139
 f0 34 68              ldsp16	r4, [sp+0x68]
 f0 15 77              leasp	r5, 0x77
 31                    cmp	r4, r5
 d1 0d                 brne8	avm_test_main+161
 d4 00                 jmp8	avm_test_main+150
 f0 34 62              ldsp16	r4, [sp+0x62]
 c1 02                 ldi8	r5, 0x2
 91                    or	r4, r5
 f0 3c 62              stsp16	[sp+0x62], r4
 d4 00                 jmp8	avm_test_main+161
 f0 34 66              ldsp16	r4, [sp+0x66]
 f0 15 71              leasp	r5, 0x71
 31                    cmp	r4, r5
 d1 0d                 brne8	avm_test_main+183
 d4 00                 jmp8	avm_test_main+172
 f0 34 62              ldsp16	r4, [sp+0x62]
 c1 04                 ldi8	r5, 0x4
 91                    or	r4, r5
 f0 3c 62              stsp16	[sp+0x62], r4
 d4 00                 jmp8	avm_test_main+183
 f0 34 64              ldsp16	r4, [sp+0x64]
 f0 15 6c              leasp	r5, 0x6c
 31                    cmp	r4, r5
 d1 0d                 brne8	avm_test_main+205
 d4 00                 jmp8	avm_test_main+194
 f0 34 62              ldsp16	r4, [sp+0x62]
 c1 08                 ldi8	r5, 0x8
 91                    or	r4, r5
 f0 3c 62              stsp16	[sp+0x62], r4
 d4 00                 jmp8	avm_test_main+205
 c6 17 01              ldi16	r6, 0x117
 c3 0c                 ldi8	r7, 0xc
 f0 14 56              leasp	r4, 0x56
 f4 68                 stsp16	[sp+0xa], r4
 04                    mov	r5, r4
 b4                    push16	r4
 01                    mov	r4, r5
 06                    mov	r5, r6
 0b                    mov	r6, r7
 d7 0f                 sys	memcpy
 04                    mov	r5, r4
 c6 23 01              ldi16	r6, 0x123
 bc                    pop16	r4
 f0 15 4a              leasp	r5, 0x4a
 f4 59                 stsp16	[sp+0x6], r5
 b4                    push16	r4
 01                    mov	r4, r5
 06                    mov	r5, r6
 0b                    mov	r6, r7
 d7 0f                 sys	memcpy
 04                    mov	r5, r4
 f0 45 36 01           ldm8u	r5, [0x136]
 bc                    pop16	r4
 f0 2d 49              stsp8	[sp+0x49], r5
 f0 45 35 01           ldm8u	r5, [0x135]
 f0 2d 48              stsp8	[sp+0x48], r5
 f0 45 34 01           ldm8u	r5, [0x134]
 f0 2d 47              stsp8	[sp+0x47], r5
 f0 45 33 01           ldm8u	r5, [0x133]
 f0 2d 46              stsp8	[sp+0x46], r5
 f0 45 32 01           ldm8u	r5, [0x132]
 f0 2d 45              stsp8	[sp+0x45], r5
 f0 45 31 01           ldm8u	r5, [0x131]
 f0 2d 44              stsp8	[sp+0x44], r5
 f0 45 30 01           ldm8u	r5, [0x130]
 f0 2d 43              stsp8	[sp+0x43], r5
 f0 45 2f 01           ldm8u	r5, [0x12f]
 f0 2d 42              stsp8	[sp+0x42], r5
 f0 45 3e 01           ldm8u	r5, [0x13e]
 f0 2d 41              stsp8	[sp+0x41], r5
 f0 45 3d 01           ldm8u	r5, [0x13d]
 f0 2d 40              stsp8	[sp+0x40], r5
 f0 45 3c 01           ldm8u	r5, [0x13c]
 f0 2d 3f              stsp8	[sp+0x3f], r5
 f0 45 3b 01           ldm8u	r5, [0x13b]
 f0 2d 3e              stsp8	[sp+0x3e], r5
 f0 45 3a 01           ldm8u	r5, [0x13a]
 f0 2d 3d              stsp8	[sp+0x3d], r5
 f0 45 39 01           ldm8u	r5, [0x139]
 f0 2d 3c              stsp8	[sp+0x3c], r5
 f0 45 38 01           ldm8u	r5, [0x138]
 f0 2d 3b              stsp8	[sp+0x3b], r5
 f0 45 37 01           ldm8u	r5, [0x137]
 f0 2d 3a              stsp8	[sp+0x3a], r5
 a5                    xor	r5, r5
 f4 61                 stsp16	[sp+0x8], r5
 f0 2d 39              stsp8	[sp+0x39], r5
 f0 2d 38              stsp8	[sp+0x38], r5
 f0 2d 37              stsp8	[sp+0x37], r5
 f0 2d 36              stsp8	[sp+0x36], r5
 f0 2d 35              stsp8	[sp+0x35], r5
 f0 2d 34              stsp8	[sp+0x34], r5
 f0 2d 33              stsp8	[sp+0x33], r5
 f0 2d 32              stsp8	[sp+0x32], r5
 c5 3f 01              ldi16	r5, 0x13f
 c2 08                 ldi8	r6, 0x8
 e1 6a fe              call16	test_call_strncat
 04                    mov	r5, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f0 3d 30              stsp16	[sp+0x30], r5
 c5 44 01              ldi16	r5, 0x144
 c2 03                 ldi8	r6, 0x3
 e1 5c fe              call16	test_call_strncat
 f4 22                 ldsp16	r6, [sp+0x8]
 f0 3c 2e              stsp16	[sp+0x2e], r4
 c5 4b 01              ldi16	r5, 0x14b
 f0 14 42              leasp	r4, 0x42
 e1 4e fe              call16	test_call_strncat
 f0 3c 2c              stsp16	[sp+0x2c], r4
 c5 50 01              ldi16	r5, 0x150
 f0 14 3a              leasp	r4, 0x3a
 c2 04                 ldi8	r6, 0x4
 e1 40 fe              call16	test_call_strncat
 f0 3c 2a              stsp16	[sp+0x2a], r4
 c5 51 01              ldi16	r5, 0x151
 f0 14 32              leasp	r4, 0x32
 c2 02                 ldi8	r6, 0x2
 e1 32 fe              call16	test_call_strncat
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 34 30              ldsp16	r4, [sp+0x30]
 31                    cmp	r4, r5
 d1 0d                 brne8	avm_test_main+467
 d4 00                 jmp8	avm_test_main+456
 f0 34 62              ldsp16	r4, [sp+0x62]
 c1 10                 ldi8	r5, 0x10
 91                    or	r4, r5
 f0 3c 62              stsp16	[sp+0x62], r4
 d4 00                 jmp8	avm_test_main+467
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 f0 15 4a              leasp	r5, 0x4a
 31                    cmp	r4, r5
 d1 0d                 brne8	avm_test_main+489
 d4 00                 jmp8	avm_test_main+478
 f0 34 62              ldsp16	r4, [sp+0x62]
 c1 20                 ldi8	r5, 0x20
 91                    or	r4, r5
 f0 3c 62              stsp16	[sp+0x62], r4
 d4 00                 jmp8	avm_test_main+489
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 f0 15 42              leasp	r5, 0x42
 31                    cmp	r4, r5
 d1 0d                 brne8	avm_test_main+511
 d4 00                 jmp8	avm_test_main+500
 f0 34 62              ldsp16	r4, [sp+0x62]
 c1 40                 ldi8	r5, 0x40
 91                    or	r4, r5
 f0 3c 62              stsp16	[sp+0x62], r4
 d4 00                 jmp8	avm_test_main+511
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 f0 15 3a              leasp	r5, 0x3a
 31                    cmp	r4, r5
 d1 0d                 brne8	avm_test_main+533
 d4 00                 jmp8	avm_test_main+522
 f0 34 62              ldsp16	r4, [sp+0x62]
 c1 80                 ldi8	r5, 0x80
 91                    or	r4, r5
 f0 3c 62              stsp16	[sp+0x62], r4
 d4 00                 jmp8	avm_test_main+533
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 15 32              leasp	r5, 0x32
 31                    cmp	r4, r5
 d1 0e                 brne8	avm_test_main+556
 d4 00                 jmp8	avm_test_main+544
 f0 34 62              ldsp16	r4, [sp+0x62]
 c5 00 01              ldi16	r5, 0x100
 91                    or	r4, r5
 f0 3c 62              stsp16	[sp+0x62], r4
 d4 00                 jmp8	avm_test_main+556
 f0 14 7e              leasp	r4, 0x7e
 c1 0a                 ldi8	r5, 0xa
 e1 bd 01              call16	hash_bytes
 f0 3c 26              stsp16	[sp+0x26], r4
 f0 14 77              leasp	r4, 0x77
 c1 07                 ldi8	r5, 0x7
 e1 b2 01              call16	hash_bytes
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 14 71              leasp	r4, 0x71
 c1 06                 ldi8	r5, 0x6
 e1 a7 01              call16	hash_bytes
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 14 6c              leasp	r4, 0x6c
 c1 05                 ldi8	r5, 0x5
 e1 9c 01              call16	hash_bytes
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 14 56              leasp	r4, 0x56
 c1 0c                 ldi8	r5, 0xc
 f4 41                 stsp16	[sp+0x0], r5
 e1 8f 01              call16	hash_bytes
 f4 01                 ldsp16	r5, [sp+0x0]
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 14 4a              leasp	r4, 0x4a
 e1 84 01              call16	hash_bytes
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 14 42              leasp	r4, 0x42
 c1 08                 ldi8	r5, 0x8
 f4 49                 stsp16	[sp+0x2], r5
 e1 77 01              call16	hash_bytes
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 14 3a              leasp	r4, 0x3a
 e1 6c 01              call16	hash_bytes
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 14 32              leasp	r4, 0x32
 e1 61 01              call16	hash_bytes
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 35 62              ldsp16	r5, [sp+0x62]
 c4 54 01              ldi16	r4, 0x154
 e1 a3 01              call16	test_line16
 f0 35 26              ldsp16	r5, [sp+0x26]
 c4 57 01              ldi16	r4, 0x157
 e1 9a 01              call16	test_line16
 f0 35 24              ldsp16	r5, [sp+0x24]
 c4 5a 01              ldi16	r4, 0x15a
 e1 91 01              call16	test_line16
 f0 35 22              ldsp16	r5, [sp+0x22]
 c4 5d 01              ldi16	r4, 0x15d
 e1 88 01              call16	test_line16
 f0 35 20              ldsp16	r5, [sp+0x20]
 c4 60 01              ldi16	r4, 0x160
 e1 7f 01              call16	test_line16
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 c4 63 01              ldi16	r4, 0x163
 e1 76 01              call16	test_line16
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 c4 66 01              ldi16	r4, 0x166
 e1 6d 01              call16	test_line16
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 c4 69 01              ldi16	r4, 0x169
 e1 64 01              call16	test_line16
 f0 35 18              ldsp16	r5, [sp+0x18]
 c4 6c 01              ldi16	r4, 0x16c
 e1 5b 01              call16	test_line16
 f0 35 16              ldsp16	r5, [sp+0x16]
 c4 6f 01              ldi16	r4, 0x16f
 e1 52 01              call16	test_line16
 f0 35 62              ldsp16	r5, [sp+0x62]
 c0 01                 ldi8	r4, 0x1
 c6 ff 01              ldi16	r6, 0x1ff
 36                    cmp	r5, r6
 f4 50                 stsp16	[sp+0x4], r4
 db bd 00              brne16	avm_test_main+952
 d4 00                 jmp8	avm_test_main+765
 c5 72 01              ldi16	r5, 0x172
 f0 14 7e              leasp	r4, 0x7e
 c2 0a                 ldi8	r6, 0xa
 e1 54 01              call16	bytes_equal
 04                    mov	r5, r4
 c0 01                 ldi8	r4, 0x1
 f6 2d                 tst16	r5
 f4 50                 stsp16	[sp+0x4], r4
 da a6 00              breq16	avm_test_main+952
 d4 00                 jmp8	avm_test_main+788
 c5 7c 01              ldi16	r5, 0x17c
 f0 14 77              leasp	r4, 0x77
 c2 07                 ldi8	r6, 0x7
 e1 3d 01              call16	bytes_equal
 04                    mov	r5, r4
 c0 01                 ldi8	r4, 0x1
 f6 2d                 tst16	r5
 f4 50                 stsp16	[sp+0x4], r4
 da 8f 00              breq16	avm_test_main+952
 d4 00                 jmp8	avm_test_main+811
 c5 83 01              ldi16	r5, 0x183
 f0 14 71              leasp	r4, 0x71
 c2 06                 ldi8	r6, 0x6
 e1 26 01              call16	bytes_equal
 04                    mov	r5, r4
 c0 01                 ldi8	r4, 0x1
 f6 2d                 tst16	r5
 f4 50                 stsp16	[sp+0x4], r4
 d0 79                 breq8	avm_test_main+952
 d4 00                 jmp8	avm_test_main+833
 c5 89 01              ldi16	r5, 0x189
 f0 14 6c              leasp	r4, 0x6c
 c2 05                 ldi8	r6, 0x5
 e1 10 01              call16	bytes_equal
 04                    mov	r5, r4
 c0 01                 ldi8	r4, 0x1
 f6 2d                 tst16	r5
 f4 50                 stsp16	[sp+0x4], r4
 d0 63                 breq8	avm_test_main+952
 d4 00                 jmp8	avm_test_main+855
 c5 8e 01              ldi16	r5, 0x18e
 f0 14 56              leasp	r4, 0x56
 e1 43 01              call16	text_equal
 04                    mov	r5, r4
 c0 01                 ldi8	r4, 0x1
 f6 2d                 tst16	r5
 f4 50                 stsp16	[sp+0x4], r4
 d0 4f                 breq8	avm_test_main+952
 d4 00                 jmp8	avm_test_main+875
 c5 96 01              ldi16	r5, 0x196
 f0 14 4a              leasp	r4, 0x4a
 e1 2f 01              call16	text_equal
 04                    mov	r5, r4
 c0 01                 ldi8	r4, 0x1
 f6 2d                 tst16	r5
 f4 50                 stsp16	[sp+0x4], r4
 d0 3b                 breq8	avm_test_main+952
 d4 00                 jmp8	avm_test_main+895
 c5 9d 01              ldi16	r5, 0x19d
 f0 14 42              leasp	r4, 0x42
 e1 1b 01              call16	text_equal
 04                    mov	r5, r4
 c0 01                 ldi8	r4, 0x1
 f6 2d                 tst16	r5
 f4 50                 stsp16	[sp+0x4], r4
 d0 27                 breq8	avm_test_main+952
 d4 00                 jmp8	avm_test_main+915
 c5 a1 01              ldi16	r5, 0x1a1
 f0 14 3a              leasp	r4, 0x3a
 e1 07 01              call16	text_equal
 04                    mov	r5, r4
 c0 01                 ldi8	r4, 0x1
 f6 2d                 tst16	r5
 f4 50                 stsp16	[sp+0x4], r4
 d0 13                 breq8	avm_test_main+952
 d4 00                 jmp8	avm_test_main+935
 c5 51 01              ldi16	r5, 0x151
 f0 14 32              leasp	r4, 0x32
 e1 f3 00              call16	text_equal
 f6 2c                 tst16	r4
 f8 04                 cset.eq	r4
 f4 50                 stsp16	[sp+0x4], r4
 d4 00                 jmp8	avm_test_main+952
 f4 10                 ldsp16	r4, [sp+0x4]
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 d6 7f                 adjsp	0x7f
 d6 09                 adjsp	0x9
 ef                    ret

<fill_bytes>:
 d6 f7                 adjsp	-0x9
 f4 5c                 stsp16	[sp+0x7], r4
 f1 49                 stsp8	[sp+0x6], r5
 f4 52                 stsp16	[sp+0x4], r6
 f4 1c                 ldsp16	r4, [sp+0x7]
 f4 48                 stsp16	[sp+0x2], r4
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	fill_bytes+17
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 31                    cmp	r4, r5
 d8 14                 bruge8	fill_bytes+44
 d4 00                 jmp8	fill_bytes+26
 f3 59                 ldsp8u	r5, [sp+0x6]
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 02                 ldsp16	r6, [sp+0x0]
 12                    add	r4, r6
 51                    st8	[r4], r5
 d4 00                 jmp8	fill_bytes+36
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 ac                 inc16	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 e5                 jmp8	fill_bytes+17
 d6 09                 adjsp	0x9
 ef                    ret

<hash_bytes>:
 d6 f6                 adjsp	-0xa
 f4 60                 stsp16	[sp+0x8], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 50                 stsp16	[sp+0x4], r4
 c4 2b 6d              ldi16	r4, 0x6d2b
 f4 48                 stsp16	[sp+0x2], r4
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	hash_bytes+20
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 19                 ldsp16	r5, [sp+0x6]
 31                    cmp	r4, r5
 d8 2e                 bruge8	hash_bytes+73
 d4 00                 jmp8	hash_bytes+29
 f4 08                 ldsp16	r4, [sp+0x2]
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f4 48                 stsp16	[sp+0x2], r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 44                    ld8u	r5, [r4]
 f4 08                 ldsp16	r4, [sp+0x2]
 a1                    xor	r4, r5
 f4 48                 stsp16	[sp+0x2], r4
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 00                 ldsp16	r4, [sp+0x0]
 c2 11                 ldi8	r6, 0x11
 fe 26                 mul16	r4, r6
 11                    add	r4, r5
 c8 03                 addi.s8	r4, 0x3
 f4 48                 stsp16	[sp+0x2], r4
 d4 00                 jmp8	hash_bytes+65
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 ac                 inc16	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 cb                 jmp8	hash_bytes+20
 f4 08                 ldsp16	r4, [sp+0x2]
 d6 0a                 adjsp	0xa
 ef                    ret

<test_line16>:
 d6 fc                 adjsp	-0x4
 f4 48                 stsp16	[sp+0x2], r4
 f4 41                 stsp16	[sp+0x0], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 e1 99 00              call16	test_puts
 c0 3d                 ldi8	r4, 0x3d
 e1 b6 00              call16	test_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 e1 bc 00              call16	test_hex16
 c0 0a                 ldi8	r4, 0xa
 e1 ac 00              call16	test_putc
 d6 04                 adjsp	0x4
 ef                    ret

<bytes_equal>:
 d6 f2                 adjsp	-0xe
 f4 68                 stsp16	[sp+0xa], r4
 f4 61                 stsp16	[sp+0x8], r5
 f4 5a                 stsp16	[sp+0x6], r6
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 50                 stsp16	[sp+0x4], r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 48                 stsp16	[sp+0x2], r4
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 00                 jmp8	bytes_equal+21
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 19                 ldsp16	r5, [sp+0x6]
 31                    cmp	r4, r5
 d8 20                 bruge8	bytes_equal+60
 d4 00                 jmp8	bytes_equal+30
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 02                 ldsp16	r6, [sp+0x0]
 12                    add	r4, r6
 40                    ld8u	r4, [r4]
 f4 09                 ldsp16	r5, [sp+0x2]
 16                    add	r5, r6
 45                    ld8u	r5, [r5]
 31                    cmp	r4, r5
 d0 07                 breq8	bytes_equal+50
 d4 00                 jmp8	bytes_equal+45
 a0                    xor	r4, r4
 f4 70                 stsp16	[sp+0xc], r4
 d4 10                 jmp8	bytes_equal+66
 d4 00                 jmp8	bytes_equal+52
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 ac                 inc16	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 d9                 jmp8	bytes_equal+21
 c0 01                 ldi8	r4, 0x1
 f4 70                 stsp16	[sp+0xc], r4
 d4 00                 jmp8	bytes_equal+66
 f4 30                 ldsp16	r4, [sp+0xc]
 d6 0e                 adjsp	0xe
 ef                    ret

<text_equal>:
 d6 fa                 adjsp	-0x6
 f4 48                 stsp16	[sp+0x2], r4
 f4 41                 stsp16	[sp+0x0], r5
 d4 00                 jmp8	text_equal+8
 f4 08                 ldsp16	r4, [sp+0x2]
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 f4 01                 ldsp16	r5, [sp+0x0]
 45                    ld8u	r5, [r5]
 f6 45                 sext8	r5
 31                    cmp	r4, r5
 d1 21                 brne8	text_equal+54
 d4 00                 jmp8	text_equal+23
 f4 08                 ldsp16	r4, [sp+0x2]
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 f4 a4                 tst8	r4
 d1 08                 brne8	text_equal+40
 d4 00                 jmp8	text_equal+34
 c0 01                 ldi8	r4, 0x1
 f4 50                 stsp16	[sp+0x4], r4
 d4 13                 jmp8	text_equal+59
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 ac                 inc16	r4
 f4 48                 stsp16	[sp+0x2], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 ac                 inc16	r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 d2                 jmp8	text_equal+8
 a0                    xor	r4, r4
 f4 50                 stsp16	[sp+0x4], r4
 d4 00                 jmp8	text_equal+59
 f4 10                 ldsp16	r4, [sp+0x4]
 d6 06                 adjsp	0x6
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
