
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/string_progmem_copy.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 string_progmem_copy.c
0000120f l     O .rodata	00000004 p_cat
00001213 l     O .rodata	00000007 p_abcdef
0000121a l     O .rodata	00000004 p_dog
0000121e l     O .rodata	00000008 p_ignored
00000100 l     O .data	0000000c .L__const.avm_test_main.full
0000010c l     O .data	0000000c .L__const.avm_test_main.cut
00001226 l     O .rodata	00000005 p_wood
0000122b l     O .rodata	00000007 p_flower
00001232 l     O .rodata	00000005 p_berg
00001237 l     O .rodata	00000001 p_empty
00001238 l     O .rodata	00000003 p_go
00000118 l     O .data	00000107 avm_test_main.long_pad
0000123b l     O .rodata	00000002 p_z
0000021f l     O .data	0000010e avm_test_main.long_cat
0000032d l     O .data	0000000a avm_test_main.expect_pad
00000337 l     O .data	00000007 avm_test_main.expect_trunc
0000033e l     O .data	00000006 avm_test_main.expect_exact
00000344 l     O .data	00000008 .L.str.12
0000034c l     O .data	00000007 .L.str.13
00000353 l     O .data	00000004 .L.str.14
00000357 l     O .data	00000004 .L.str.15
0000035b l     O .data	00000003 .L.str.16
00000000 l    df *ABS*	00000000 runtime.c
00000400 g     F .text	00000016 _start
0000042c g     F .text	00000de1 avm_test_main
0000120d g     F .text	00000002 avm_halt
00000416 g     F .text	0000000b test_call_strncpy_P
00000421 g     F .text	0000000b test_call_strncat_P

Disassembly of section .text:

<_start>:
 d5 2a                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 01                    mov	r4, r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 f7 0d              call16	avm_halt

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
 d6 80                 adjsp	-0x80
 d6 92                 adjsp	-0x6e
 c4 a5 a5              ldi16	r4, 0xa5a5
 f0 3c ec              stsp16	[sp+0xec], r4
 c4 a5 a5              ldi16	r4, 0xa5a5
 c5 a5 a5              ldi16	r5, 0xa5a5
 f0 3c e8              stsp16	[sp+0xe8], r4
 f0 3d ea              stsp16	[sp+0xea], r5
 f0 3c e4              stsp16	[sp+0xe4], r4
 f0 3d e6              stsp16	[sp+0xe6], r5
 c4 cc cc              ldi16	r4, 0xcccc
 c1 cc                 ldi8	r5, 0xcc
 f0 3c e1              stsp16	[sp+0xe1], r4
 f0 2d e3              stsp8	[sp+0xe3], r5
 c4 cc cc              ldi16	r4, 0xcccc
 c5 cc cc              ldi16	r5, 0xcccc
 f0 3c dd              stsp16	[sp+0xdd], r4
 f0 3d df              stsp16	[sp+0xdf], r5
 c4 7e 7e              ldi16	r4, 0x7e7e
 f0 3c db              stsp16	[sp+0xdb], r4
 c4 7e 7e              ldi16	r4, 0x7e7e
 c5 7e 7e              ldi16	r5, 0x7e7e
 f0 3c d7              stsp16	[sp+0xd7], r4
 f0 3d d9              stsp16	[sp+0xd9], r5
 c0 3c                 ldi8	r4, 0x3c
 f0 2c d6              stsp8	[sp+0xd6], r4
 c4 3c 3c              ldi16	r4, 0x3c3c
 c5 3c 3c              ldi16	r5, 0x3c3c
 f0 3c d2              stsp16	[sp+0xd2], r4
 f0 3d d4              stsp16	[sp+0xd4], r5
 d6 fe                 adjsp	-0x2
 c0 08                 ldi8	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 c6 0f 12              ldi16	r6, 0x120f
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 e6              leasp	r4, 0xe6
 e1 7d ff              call16	test_call_strncpy_P
 d6 02                 adjsp	0x2
 c6 13 12              ldi16	r6, 0x1213
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 d6 fe                 adjsp	-0x2
 c0 03                 ldi8	r4, 0x3
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 df              leasp	r4, 0xdf
 e1 68 ff              call16	test_call_strncpy_P
 d6 02                 adjsp	0x2
 c6 1a 12              ldi16	r6, 0x121a
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 d6 fe                 adjsp	-0x2
 f0 02 04              ldi8	r2, 0x4
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 14 d9              leasp	r4, 0xd9
 e1 51 ff              call16	test_call_strncpy_P
 d6 02                 adjsp	0x2
 c6 1e 12              ldi16	r6, 0x121e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 d6 fe                 adjsp	-0x2
 f2 39                 sub	r1, r1
 f0 39 00              stsp16	[sp+0x0], r1
 f0 14 d4              leasp	r4, 0xd4
 e1 3b ff              call16	test_call_strncpy_P
 d6 02                 adjsp	0x2
 c5 00 01              ldi16	r5, 0x100
 f0 13 c6              leasp	r3, 0xc6
 f1 23                 mov	r4, r3
 c2 0c                 ldi8	r6, 0xc
 d7 0f                 sys	memcpy
 c5 0c 01              ldi16	r5, 0x10c
 f0 10 ba              leasp	r0, 0xba
 f1 20                 mov	r4, r0
 d7 0f                 sys	memcpy
 c4 69 63              ldi16	r4, 0x6369
 c1 65                 ldi8	r5, 0x65
 f0 3c b2              stsp16	[sp+0xb2], r4
 f0 3d b4              stsp16	[sp+0xb4], r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c b6              stsp16	[sp+0xb6], r4
 f0 3d b8              stsp16	[sp+0xb8], r5
 c6 6f 61              ldi16	r6, 0x616f
 c3 6b                 ldi8	r7, 0x6b
 f0 3e aa              stsp16	[sp+0xaa], r6
 f0 3f ac              stsp16	[sp+0xac], r7
 f0 3c ae              stsp16	[sp+0xae], r4
 f0 3d b0              stsp16	[sp+0xb0], r5
 f0 3c a6              stsp16	[sp+0xa6], r4
 f0 3d a8              stsp16	[sp+0xa8], r5
 f0 3c a2              stsp16	[sp+0xa2], r4
 f0 3d a4              stsp16	[sp+0xa4], r5
 d6 fe                 adjsp	-0x2
 c0 08                 ldi8	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 c6 26 12              ldi16	r6, 0x1226
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 23                 mov	r4, r3
 e1 ec fe              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 d6 fe                 adjsp	-0x2
 c0 03                 ldi8	r4, 0x3
 f4 40                 stsp16	[sp+0x0], r4
 c6 2b 12              ldi16	r6, 0x122b
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 e1 d8 fe              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 d6 fe                 adjsp	-0x2
 f0 39 00              stsp16	[sp+0x0], r1
 c6 32 12              ldi16	r6, 0x1232
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 b4              leasp	r4, 0xb4
 e1 c4 fe              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 d6 fe                 adjsp	-0x2
 f0 3a 00              stsp16	[sp+0x0], r2
 c6 37 12              ldi16	r6, 0x1237
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 ac              leasp	r4, 0xac
 e1 b0 fe              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 d6 fe                 adjsp	-0x2
 f0 00 02              ldi8	r0, 0x2
 f0 38 00              stsp16	[sp+0x0], r0
 f0 06 38 12           ldi16	r2, 0x1238
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 f0 14 a4              leasp	r4, 0xa4
 f2 6b                 mov32	q3, q1
 e1 95 fe              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 c4 07 01              ldi16	r4, 0x107
 c5 18 01              ldi16	r5, 0x118
 c2 a5                 ldi8	r6, 0xa5
 f6 0e                 st8	[r5+], r6
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f8                 brne8	avm_test_main+362
 d6 fe                 adjsp	-0x2
 c4 04 01              ldi16	r4, 0x104
 f4 40                 stsp16	[sp+0x0], r4
 c6 3b 12              ldi16	r6, 0x123b
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 05 18 01           ldi16	r1, 0x118
 f1 21                 mov	r4, r1
 e1 61 fe              call16	test_call_strncpy_P
 d6 02                 adjsp	0x2
 c4 01 01              ldi16	r4, 0x101
 c5 1f 02              ldi16	r5, 0x21f
 c2 64                 ldi8	r6, 0x64
 f6 0e                 st8	[r5+], r6
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f8                 brne8	avm_test_main+403
 c4 b6 b6              ldi16	r4, 0xb6b6
 c5 b6 b6              ldi16	r5, 0xb6b6
 c6 28 03              ldi16	r6, 0x328
 f0 6b 8c              st32	[r6], q2
 c6 24 03              ldi16	r6, 0x324
 f0 6b 8c              st32	[r6], q2
 c4 00 b6              ldi16	r4, 0xb600
 c5 b6 b6              ldi16	r5, 0xb6b6
 c6 20 03              ldi16	r6, 0x320
 f0 6b 8c              st32	[r6], q2
 c0 b6                 ldi8	r4, 0xb6
 f0 4c 2c 03           stm8	[0x32c], r4
 d6 fe                 adjsp	-0x2
 f0 38 00              stsp16	[sp+0x0], r0
 f0 04 1f 02           ldi16	r0, 0x21f
 f1 20                 mov	r4, r0
 f2 6b                 mov32	q3, q1
 e1 26 fe              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 c6 2b 6d              ldi16	r6, 0x6d2b
 c4 f2 ff              ldi16	r4, 0xfff2
 f0 03 0e              ldi8	r3, 0xe
 f0 1d a9              ldsp8u	r5, [sp+0xa9]
 f0 3d 6a              stsp16	[sp+0x6a], r5
 f0 1d a8              ldsp8u	r5, [sp+0xa8]
 f0 3d 44              stsp16	[sp+0x44], r5
 f0 1d a7              ldsp8u	r5, [sp+0xa7]
 f0 3d 40              stsp16	[sp+0x40], r5
 f0 1d a6              ldsp8u	r5, [sp+0xa6]
 f0 3d 3c              stsp16	[sp+0x3c], r5
 f0 1d a5              ldsp8u	r5, [sp+0xa5]
 f0 3d 38              stsp16	[sp+0x38], r5
 f0 1d a4              ldsp8u	r5, [sp+0xa4]
 f0 3d 34              stsp16	[sp+0x34], r5
 f0 1d a3              ldsp8u	r5, [sp+0xa3]
 f0 3d 32              stsp16	[sp+0x32], r5
 f0 1d a2              ldsp8u	r5, [sp+0xa2]
 f0 3d a0              stsp16	[sp+0xa0], r5
 f0 1d b1              ldsp8u	r5, [sp+0xb1]
 f0 3d 78              stsp16	[sp+0x78], r5
 f0 1d b0              ldsp8u	r5, [sp+0xb0]
 f0 3d 30              stsp16	[sp+0x30], r5
 f0 1d af              ldsp8u	r5, [sp+0xaf]
 f0 3d 2e              stsp16	[sp+0x2e], r5
 f0 1d ae              ldsp8u	r5, [sp+0xae]
 f0 3d 2c              stsp16	[sp+0x2c], r5
 f0 1d ad              ldsp8u	r5, [sp+0xad]
 f0 3d 2a              stsp16	[sp+0x2a], r5
 f0 1d ac              ldsp8u	r5, [sp+0xac]
 f0 3d 28              stsp16	[sp+0x28], r5
 f0 1d ab              ldsp8u	r5, [sp+0xab]
 f0 3d 26              stsp16	[sp+0x26], r5
 f0 1d aa              ldsp8u	r5, [sp+0xaa]
 f0 3d 9e              stsp16	[sp+0x9e], r5
 f0 1d b9              ldsp8u	r5, [sp+0xb9]
 f0 3d 80              stsp16	[sp+0x80], r5
 f0 1d b8              ldsp8u	r5, [sp+0xb8]
 f0 3d 24              stsp16	[sp+0x24], r5
 f0 1d b7              ldsp8u	r5, [sp+0xb7]
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 1d b6              ldsp8u	r5, [sp+0xb6]
 f0 3d 20              stsp16	[sp+0x20], r5
 f0 1d b5              ldsp8u	r5, [sp+0xb5]
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 1d b4              ldsp8u	r5, [sp+0xb4]
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f0 1d b3              ldsp8u	r5, [sp+0xb3]
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 1d b2              ldsp8u	r5, [sp+0xb2]
 f0 3d 9c              stsp16	[sp+0x9c], r5
 f0 1d c5              ldsp8u	r5, [sp+0xc5]
 f0 3d 7e              stsp16	[sp+0x7e], r5
 f0 1d c4              ldsp8u	r5, [sp+0xc4]
 f0 3d 7c              stsp16	[sp+0x7c], r5
 f0 1d c3              ldsp8u	r5, [sp+0xc3]
 f0 3d 7a              stsp16	[sp+0x7a], r5
 f0 1d c2              ldsp8u	r5, [sp+0xc2]
 f0 3d 76              stsp16	[sp+0x76], r5
 f0 1d c1              ldsp8u	r5, [sp+0xc1]
 f0 3d 74              stsp16	[sp+0x74], r5
 f0 1d c0              ldsp8u	r5, [sp+0xc0]
 f0 3d 72              stsp16	[sp+0x72], r5
 f0 1d bf              ldsp8u	r5, [sp+0xbf]
 f0 3d 70              stsp16	[sp+0x70], r5
 f0 1d be              ldsp8u	r5, [sp+0xbe]
 f0 3d 6e              stsp16	[sp+0x6e], r5
 f0 1d bd              ldsp8u	r5, [sp+0xbd]
 f0 3d 6c              stsp16	[sp+0x6c], r5
 f0 1d bc              ldsp8u	r5, [sp+0xbc]
 f0 3d 68              stsp16	[sp+0x68], r5
 f0 1d bb              ldsp8u	r5, [sp+0xbb]
 f0 3d 66              stsp16	[sp+0x66], r5
 f0 1d ba              ldsp8u	r5, [sp+0xba]
 f0 3d 9a              stsp16	[sp+0x9a], r5
 f0 1d d1              ldsp8u	r5, [sp+0xd1]
 f0 3d 64              stsp16	[sp+0x64], r5
 f0 1d d0              ldsp8u	r5, [sp+0xd0]
 f0 3d 62              stsp16	[sp+0x62], r5
 f0 1d cf              ldsp8u	r5, [sp+0xcf]
 f0 3d 60              stsp16	[sp+0x60], r5
 f0 1d ce              ldsp8u	r5, [sp+0xce]
 f0 3d 5e              stsp16	[sp+0x5e], r5
 f0 1d cd              ldsp8u	r5, [sp+0xcd]
 f0 3d 5c              stsp16	[sp+0x5c], r5
 f0 1d cc              ldsp8u	r5, [sp+0xcc]
 f0 3d 5a              stsp16	[sp+0x5a], r5
 f0 1d cb              ldsp8u	r5, [sp+0xcb]
 f0 3d 58              stsp16	[sp+0x58], r5
 f0 1d ca              ldsp8u	r5, [sp+0xca]
 f0 3d 56              stsp16	[sp+0x56], r5
 f0 1d c9              ldsp8u	r5, [sp+0xc9]
 f0 3d 54              stsp16	[sp+0x54], r5
 f0 1d c8              ldsp8u	r5, [sp+0xc8]
 f0 3d 52              stsp16	[sp+0x52], r5
 f0 1d c7              ldsp8u	r5, [sp+0xc7]
 f0 3d 50              stsp16	[sp+0x50], r5
 f0 1d c6              ldsp8u	r5, [sp+0xc6]
 f0 3d 90              stsp16	[sp+0x90], r5
 f0 1d d6              ldsp8u	r5, [sp+0xd6]
 f0 3d 86              stsp16	[sp+0x86], r5
 f0 1d d5              ldsp8u	r5, [sp+0xd5]
 f4 59                 stsp16	[sp+0x6], r5
 f0 1d d4              ldsp8u	r5, [sp+0xd4]
 f4 51                 stsp16	[sp+0x4], r5
 f0 1d d3              ldsp8u	r5, [sp+0xd3]
 f4 49                 stsp16	[sp+0x2], r5
 f0 1d d2              ldsp8u	r5, [sp+0xd2]
 f0 3d 8e              stsp16	[sp+0x8e], r5
 f0 1d dc              ldsp8u	r5, [sp+0xdc]
 f0 3d 82              stsp16	[sp+0x82], r5
 f0 1d db              ldsp8u	r5, [sp+0xdb]
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 1d da              ldsp8u	r5, [sp+0xda]
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 1d d9              ldsp8u	r5, [sp+0xd9]
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 1d d8              ldsp8u	r5, [sp+0xd8]
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 1d d7              ldsp8u	r5, [sp+0xd7]
 f0 3d 98              stsp16	[sp+0x98], r5
 f0 1d e3              ldsp8u	r5, [sp+0xe3]
 f0 3d 84              stsp16	[sp+0x84], r5
 f0 1d e2              ldsp8u	r5, [sp+0xe2]
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 1d e1              ldsp8u	r5, [sp+0xe1]
 f4 79                 stsp16	[sp+0xe], r5
 f0 1d e0              ldsp8u	r5, [sp+0xe0]
 f4 71                 stsp16	[sp+0xc], r5
 f0 1d df              ldsp8u	r5, [sp+0xdf]
 f4 69                 stsp16	[sp+0xa], r5
 f0 1d de              ldsp8u	r5, [sp+0xde]
 f4 61                 stsp16	[sp+0x8], r5
 f0 1d dd              ldsp8u	r5, [sp+0xdd]
 f0 3d 96              stsp16	[sp+0x96], r5
 f0 1d ed              ldsp8u	r5, [sp+0xed]
 f0 3d 4e              stsp16	[sp+0x4e], r5
 f0 1d ec              ldsp8u	r5, [sp+0xec]
 f0 3d 4c              stsp16	[sp+0x4c], r5
 f0 1d eb              ldsp8u	r5, [sp+0xeb]
 f0 3d 4a              stsp16	[sp+0x4a], r5
 f0 1d ea              ldsp8u	r5, [sp+0xea]
 f0 3d 48              stsp16	[sp+0x48], r5
 f0 1d e9              ldsp8u	r5, [sp+0xe9]
 f0 3d 46              stsp16	[sp+0x46], r5
 f0 1d e8              ldsp8u	r5, [sp+0xe8]
 f0 3d 42              stsp16	[sp+0x42], r5
 f0 1d e7              ldsp8u	r5, [sp+0xe7]
 f0 3d 3e              stsp16	[sp+0x3e], r5
 f0 1d e6              ldsp8u	r5, [sp+0xe6]
 f0 3d 3a              stsp16	[sp+0x3a], r5
 f0 1d e5              ldsp8u	r5, [sp+0xe5]
 f0 3d 36              stsp16	[sp+0x36], r5
 f0 1d e4              ldsp8u	r5, [sp+0xe4]
 f0 3d 94              stsp16	[sp+0x94], r5
 c7 69 11              ldi16	r7, 0x1169
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 6c a3              ld8u	r5, [r1+]
 a6                    xor	r5, r6
 f0 0b ef              addi.s8	r3, -0x11
 c8 11                 addi.s8	r4, 0x11
 08                    mov	r6, r4
 19                    add	r6, r5
 33                    cmp	r4, r7
 d1 ec                 brne8	avm_test_main+926
 f0 3d 92              stsp16	[sp+0x92], r5
 11                    add	r4, r5
 c6 2b 6d              ldi16	r6, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 01 0e              ldi8	r1, 0xe
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 6c 41              ld8u	r2, [r0+]
 f9 5a                 xor	r2, r6
 f0 09 ef              addi.s8	r1, -0x11
 cb 11                 addi.s8	r7, 0x11
 0b                    mov	r6, r7
 f2 2a                 add	r6, r2
 c5 e0 11              ldi16	r5, 0x11e0
 3d                    cmp	r7, r5
 d1 e7                 brne8	avm_test_main+959
 f0 35 92              ldsp16	r5, [sp+0x92]
 f2 57                 sub	r5, r3
 f0 3d 92              stsp16	[sp+0x92], r5
 f1 75                 zext8	r5
 f0 3d 8a              stsp16	[sp+0x8a], r5
 fa 84                 lsr16i	r5, 0x4
 f0 00 30              ldi8	r0, 0x30
 f0 3d 8c              stsp16	[sp+0x8c], r5
 f0 36 8c              ldsp16	r6, [sp+0x8c]
 f9 c1                 or	r6, r0
 f0 3e 8c              stsp16	[sp+0x8c], r6
 c9 37                 addi.s8	r5, 0x37
 f0 03 a0              ldi8	r3, 0xa0
 f0 36 8a              ldsp16	r6, [sp+0x8a]
 f5 2b                 cmp	r6, r3
 f0 36 8c              ldsp16	r6, [sp+0x8c]
 fc 2e                 cmov.ult	r5, r6
 f0 3d 88              stsp16	[sp+0x88], r5
 f1 2a                 mov	r6, r2
 f2 59                 sub	r6, r1
 f0 3e 8c              stsp16	[sp+0x8c], r6
 f1 76                 zext8	r6
 f4 42                 stsp16	[sp+0x0], r6
 fa 94                 lsr16i	r6, 0x4
 f0 3e 8a              stsp16	[sp+0x8a], r6
 f0 35 8a              ldsp16	r5, [sp+0x8a]
 f9 a1                 or	r5, r0
 f0 3d 8a              stsp16	[sp+0x8a], r5
 ca 37                 addi.s8	r6, 0x37
 f4 01                 ldsp16	r5, [sp+0x0]
 f5 27                 cmp	r5, r3
 f0 35 8a              ldsp16	r5, [sp+0x8a]
 fc 35                 cmov.ult	r6, r5
 f0 3e 8a              stsp16	[sp+0x8a], r6
 c5 6d 05              ldi16	r5, 0x56d
 f0 36 8e              ldsp16	r6, [sp+0x8e]
 a9                    xor	r6, r5
 f1 0d                 mov	r1, r5
 fa 55                 lsl16i	r6, 0x5
 ca 74                 addi.s8	r6, 0x74
 f4 09                 ldsp16	r5, [sp+0x2]
 a9                    xor	r6, r5
 ca 14                 addi.s8	r6, 0x14
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f4 11                 ldsp16	r5, [sp+0x4]
 a9                    xor	r6, r5
 ca 25                 addi.s8	r6, 0x25
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f4 19                 ldsp16	r5, [sp+0x6]
 a9                    xor	r6, r5
 ca 36                 addi.s8	r6, 0x36
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 86              ldsp16	r5, [sp+0x86]
 a9                    xor	r6, r5
 ca 47                 addi.s8	r6, 0x47
 f0 3e 8e              stsp16	[sp+0x8e], r6
 f1 76                 zext8	r6
 f5 2b                 cmp	r6, r3
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f0 3e 86              stsp16	[sp+0x86], r6
 f0 36 96              ldsp16	r6, [sp+0x96]
 f9 c6                 xor	r6, r1
 fa 55                 lsl16i	r6, 0x5
 ca 74                 addi.s8	r6, 0x74
 f4 21                 ldsp16	r5, [sp+0x8]
 a9                    xor	r6, r5
 ca 14                 addi.s8	r6, 0x14
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f4 29                 ldsp16	r5, [sp+0xa]
 a9                    xor	r6, r5
 ca 25                 addi.s8	r6, 0x25
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f4 31                 ldsp16	r5, [sp+0xc]
 a9                    xor	r6, r5
 ca 36                 addi.s8	r6, 0x36
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f4 39                 ldsp16	r5, [sp+0xe]
 a9                    xor	r6, r5
 ca 47                 addi.s8	r6, 0x47
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 10              ldsp16	r5, [sp+0x10]
 a9                    xor	r6, r5
 ca 58                 addi.s8	r6, 0x58
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 84              ldsp16	r5, [sp+0x84]
 a9                    xor	r6, r5
 ca 69                 addi.s8	r6, 0x69
 f0 3e 96              stsp16	[sp+0x96], r6
 f1 76                 zext8	r6
 f5 2b                 cmp	r6, r3
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f0 3e 84              stsp16	[sp+0x84], r6
 f0 36 98              ldsp16	r6, [sp+0x98]
 f9 c6                 xor	r6, r1
 fa 55                 lsl16i	r6, 0x5
 ca 74                 addi.s8	r6, 0x74
 f0 35 12              ldsp16	r5, [sp+0x12]
 a9                    xor	r6, r5
 ca 14                 addi.s8	r6, 0x14
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 14              ldsp16	r5, [sp+0x14]
 a9                    xor	r6, r5
 ca 25                 addi.s8	r6, 0x25
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 16              ldsp16	r5, [sp+0x16]
 a9                    xor	r6, r5
 ca 36                 addi.s8	r6, 0x36
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 18              ldsp16	r5, [sp+0x18]
 a9                    xor	r6, r5
 ca 47                 addi.s8	r6, 0x47
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 82              ldsp16	r5, [sp+0x82]
 a9                    xor	r6, r5
 ca 58                 addi.s8	r6, 0x58
 f0 3e 98              stsp16	[sp+0x98], r6
 f1 76                 zext8	r6
 f5 2b                 cmp	r6, r3
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f0 3e 82              stsp16	[sp+0x82], r6
 f0 36 9c              ldsp16	r6, [sp+0x9c]
 f9 c6                 xor	r6, r1
 fa 55                 lsl16i	r6, 0x5
 ca 74                 addi.s8	r6, 0x74
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 a9                    xor	r6, r5
 ca 14                 addi.s8	r6, 0x14
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 a9                    xor	r6, r5
 ca 25                 addi.s8	r6, 0x25
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 a9                    xor	r6, r5
 ca 36                 addi.s8	r6, 0x36
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 20              ldsp16	r5, [sp+0x20]
 a9                    xor	r6, r5
 ca 47                 addi.s8	r6, 0x47
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 22              ldsp16	r5, [sp+0x22]
 a9                    xor	r6, r5
 ca 58                 addi.s8	r6, 0x58
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 24              ldsp16	r5, [sp+0x24]
 a9                    xor	r6, r5
 ca 69                 addi.s8	r6, 0x69
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 80              ldsp16	r5, [sp+0x80]
 a9                    xor	r6, r5
 ca 7a                 addi.s8	r6, 0x7a
 f0 3e 9c              stsp16	[sp+0x9c], r6
 f1 76                 zext8	r6
 f5 2b                 cmp	r6, r3
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f0 3e 80              stsp16	[sp+0x80], r6
 f0 36 9e              ldsp16	r6, [sp+0x9e]
 f9 c6                 xor	r6, r1
 fa 55                 lsl16i	r6, 0x5
 ca 74                 addi.s8	r6, 0x74
 f0 35 26              ldsp16	r5, [sp+0x26]
 a9                    xor	r6, r5
 ca 14                 addi.s8	r6, 0x14
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 28              ldsp16	r5, [sp+0x28]
 a9                    xor	r6, r5
 ca 25                 addi.s8	r6, 0x25
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 a9                    xor	r6, r5
 ca 36                 addi.s8	r6, 0x36
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 a9                    xor	r6, r5
 ca 47                 addi.s8	r6, 0x47
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 2e              ldsp16	r5, [sp+0x2e]
 a9                    xor	r6, r5
 ca 58                 addi.s8	r6, 0x58
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 30              ldsp16	r5, [sp+0x30]
 a9                    xor	r6, r5
 ca 69                 addi.s8	r6, 0x69
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 78              ldsp16	r5, [sp+0x78]
 a9                    xor	r6, r5
 ca 7a                 addi.s8	r6, 0x7a
 f0 3e 9e              stsp16	[sp+0x9e], r6
 f1 76                 zext8	r6
 f5 2b                 cmp	r6, r3
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f0 3e 78              stsp16	[sp+0x78], r6
 f0 36 a0              ldsp16	r6, [sp+0xa0]
 f9 c6                 xor	r6, r1
 fa 55                 lsl16i	r6, 0x5
 ca 74                 addi.s8	r6, 0x74
 f0 35 32              ldsp16	r5, [sp+0x32]
 a9                    xor	r6, r5
 ca 14                 addi.s8	r6, 0x14
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 34              ldsp16	r5, [sp+0x34]
 a9                    xor	r6, r5
 ca 25                 addi.s8	r6, 0x25
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 38              ldsp16	r5, [sp+0x38]
 a9                    xor	r6, r5
 ca 36                 addi.s8	r6, 0x36
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 3c              ldsp16	r5, [sp+0x3c]
 a9                    xor	r6, r5
 ca 47                 addi.s8	r6, 0x47
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 40              ldsp16	r5, [sp+0x40]
 a9                    xor	r6, r5
 ca 58                 addi.s8	r6, 0x58
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 44              ldsp16	r5, [sp+0x44]
 a9                    xor	r6, r5
 ca 69                 addi.s8	r6, 0x69
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 6a              ldsp16	r5, [sp+0x6a]
 a9                    xor	r6, r5
 ca 7a                 addi.s8	r6, 0x7a
 f0 3e a0              stsp16	[sp+0xa0], r6
 f1 76                 zext8	r6
 f5 2b                 cmp	r6, r3
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f0 3e 6a              stsp16	[sp+0x6a], r6
 f0 36 94              ldsp16	r6, [sp+0x94]
 f9 c6                 xor	r6, r1
 fa 55                 lsl16i	r6, 0x5
 ca 74                 addi.s8	r6, 0x74
 f0 35 36              ldsp16	r5, [sp+0x36]
 a9                    xor	r6, r5
 ca 14                 addi.s8	r6, 0x14
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 3a              ldsp16	r5, [sp+0x3a]
 a9                    xor	r6, r5
 ca 25                 addi.s8	r6, 0x25
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 3e              ldsp16	r5, [sp+0x3e]
 a9                    xor	r6, r5
 ca 36                 addi.s8	r6, 0x36
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 42              ldsp16	r5, [sp+0x42]
 a9                    xor	r6, r5
 ca 47                 addi.s8	r6, 0x47
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 46              ldsp16	r5, [sp+0x46]
 a9                    xor	r6, r5
 ca 58                 addi.s8	r6, 0x58
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 48              ldsp16	r5, [sp+0x48]
 a9                    xor	r6, r5
 ca 69                 addi.s8	r6, 0x69
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 4a              ldsp16	r5, [sp+0x4a]
 a9                    xor	r6, r5
 ca 7a                 addi.s8	r6, 0x7a
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 4c              ldsp16	r5, [sp+0x4c]
 a9                    xor	r6, r5
 f0 03 8b              ldi8	r3, 0x8b
 f2 2b                 add	r6, r3
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 4e              ldsp16	r5, [sp+0x4e]
 a9                    xor	r6, r5
 f0 01 9c              ldi8	r1, 0x9c
 f2 29                 add	r6, r1
 f0 3e 94              stsp16	[sp+0x94], r6
 f1 76                 zext8	r6
 c1 a0                 ldi8	r5, 0xa0
 39                    cmp	r6, r5
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f0 3e 4e              stsp16	[sp+0x4e], r6
 f0 36 90              ldsp16	r6, [sp+0x90]
 c5 6d 05              ldi16	r5, 0x56d
 a9                    xor	r6, r5
 fa 55                 lsl16i	r6, 0x5
 ca 74                 addi.s8	r6, 0x74
 f0 35 50              ldsp16	r5, [sp+0x50]
 a9                    xor	r6, r5
 ca 14                 addi.s8	r6, 0x14
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 52              ldsp16	r5, [sp+0x52]
 a9                    xor	r6, r5
 ca 25                 addi.s8	r6, 0x25
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 54              ldsp16	r5, [sp+0x54]
 a9                    xor	r6, r5
 ca 36                 addi.s8	r6, 0x36
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 56              ldsp16	r5, [sp+0x56]
 a9                    xor	r6, r5
 ca 47                 addi.s8	r6, 0x47
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 58              ldsp16	r5, [sp+0x58]
 a9                    xor	r6, r5
 ca 58                 addi.s8	r6, 0x58
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 5a              ldsp16	r5, [sp+0x5a]
 a9                    xor	r6, r5
 ca 69                 addi.s8	r6, 0x69
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 5c              ldsp16	r5, [sp+0x5c]
 a9                    xor	r6, r5
 ca 7a                 addi.s8	r6, 0x7a
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 5e              ldsp16	r5, [sp+0x5e]
 a9                    xor	r6, r5
 f2 2b                 add	r6, r3
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 60              ldsp16	r5, [sp+0x60]
 a9                    xor	r6, r5
 f2 29                 add	r6, r1
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 62              ldsp16	r5, [sp+0x62]
 a9                    xor	r6, r5
 f0 03 ad              ldi8	r3, 0xad
 f2 2b                 add	r6, r3
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 64              ldsp16	r5, [sp+0x64]
 a9                    xor	r6, r5
 f0 01 be              ldi8	r1, 0xbe
 f2 29                 add	r6, r1
 f0 3e 90              stsp16	[sp+0x90], r6
 f1 76                 zext8	r6
 c1 a0                 ldi8	r5, 0xa0
 39                    cmp	r6, r5
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f0 3e 64              stsp16	[sp+0x64], r6
 f0 36 9a              ldsp16	r6, [sp+0x9a]
 c5 6d 05              ldi16	r5, 0x56d
 a9                    xor	r6, r5
 fa 55                 lsl16i	r6, 0x5
 ca 74                 addi.s8	r6, 0x74
 f0 35 66              ldsp16	r5, [sp+0x66]
 a9                    xor	r6, r5
 ca 14                 addi.s8	r6, 0x14
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 68              ldsp16	r5, [sp+0x68]
 a9                    xor	r6, r5
 ca 25                 addi.s8	r6, 0x25
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 6c              ldsp16	r5, [sp+0x6c]
 a9                    xor	r6, r5
 ca 36                 addi.s8	r6, 0x36
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 6e              ldsp16	r5, [sp+0x6e]
 a9                    xor	r6, r5
 ca 47                 addi.s8	r6, 0x47
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 70              ldsp16	r5, [sp+0x70]
 a9                    xor	r6, r5
 ca 58                 addi.s8	r6, 0x58
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 72              ldsp16	r5, [sp+0x72]
 a9                    xor	r6, r5
 ca 69                 addi.s8	r6, 0x69
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 74              ldsp16	r5, [sp+0x74]
 a9                    xor	r6, r5
 ca 7a                 addi.s8	r6, 0x7a
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 76              ldsp16	r5, [sp+0x76]
 a9                    xor	r6, r5
 c1 8b                 ldi8	r5, 0x8b
 19                    add	r6, r5
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 7a              ldsp16	r5, [sp+0x7a]
 a9                    xor	r6, r5
 c1 9c                 ldi8	r5, 0x9c
 19                    add	r6, r5
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 7c              ldsp16	r5, [sp+0x7c]
 a9                    xor	r6, r5
 f2 2b                 add	r6, r3
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f0 35 7e              ldsp16	r5, [sp+0x7e]
 a9                    xor	r6, r5
 f2 29                 add	r6, r1
 f0 3e 9a              stsp16	[sp+0x9a], r6
 06                    mov	r5, r6
 f1 75                 zext8	r5
 c2 a0                 ldi8	r6, 0xa0
 36                    cmp	r5, r6
 fa 84                 lsr16i	r5, 0x4
 09                    mov	r6, r5
 f9 c1                 or	r6, r0
 c9 37                 addi.s8	r5, 0x37
 fc 2e                 cmov.ult	r5, r6
 f0 3d 7a              stsp16	[sp+0x7a], r5
 f0 03 0f              ldi8	r3, 0xf
 f0 35 8c              ldsp16	r5, [sp+0x8c]
 f9 ac                 and	r5, r3
 f1 0d                 mov	r1, r5
 f9 21                 or	r1, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 29                 cmov.ult	r5, r1
 f0 3d 8c              stsp16	[sp+0x8c], r5
 f2 2e                 add	r7, r2
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f9 ac                 and	r5, r3
 09                    mov	r6, r5
 f9 c1                 or	r6, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2e                 cmov.ult	r5, r6
 f0 3d 7e              stsp16	[sp+0x7e], r5
 07                    mov	r5, r7
 fa 8c                 lsr16i	r5, 0xc
 09                    mov	r6, r5
 f9 c1                 or	r6, r0
 c9 37                 addi.s8	r5, 0x37
 f0 06 00 a0           ldi16	r2, 0xa000
 f5 2e                 cmp	r7, r2
 fc 2e                 cmov.ult	r5, r6
 f0 3d 7c              stsp16	[sp+0x7c], r5
 f0 31 92              ldsp16	r1, [sp+0x92]
 f9 2c                 and	r1, r3
 f1 25                 mov	r5, r1
 f9 a1                 or	r5, r0
 f0 0d 0a              cmpi.s8	r1, 0xa
 f0 09 37              addi.s8	r1, 0x37
 fc 0d                 cmov.ult	r1, r5
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 f9 ec                 and	r7, r3
 07                    mov	r5, r7
 f9 a1                 or	r5, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 92              stsp16	[sp+0x92], r7
 0c                    mov	r7, r4
 fa ac                 lsr16i	r7, 0xc
 07                    mov	r5, r7
 f9 a1                 or	r5, r0
 cb 37                 addi.s8	r7, 0x37
 f5 22                 cmp	r4, r2
 fc 3d                 cmov.ult	r7, r5
 f0 3f 76              stsp16	[sp+0x76], r7
 f0 35 8e              ldsp16	r5, [sp+0x8e]
 0d                    mov	r7, r5
 f9 ec                 and	r7, r3
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 74              stsp16	[sp+0x74], r7
 0d                    mov	r7, r5
 fa a8                 lsr16i	r7, 0x8
 f9 ec                 and	r7, r3
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 72              stsp16	[sp+0x72], r7
 0d                    mov	r7, r5
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cb 37                 addi.s8	r7, 0x37
 f5 26                 cmp	r5, r2
 fc 3c                 cmov.ult	r7, r4
 f0 3f 6e              stsp16	[sp+0x6e], r7
 f0 37 96              ldsp16	r7, [sp+0x96]
 07                    mov	r5, r7
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 68              stsp16	[sp+0x68], r5
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 60              stsp16	[sp+0x60], r5
 f5 2e                 cmp	r7, r2
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 96              stsp16	[sp+0x96], r7
 f0 37 98              ldsp16	r7, [sp+0x98]
 07                    mov	r5, r7
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 62              stsp16	[sp+0x62], r5
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 5e              stsp16	[sp+0x5e], r5
 f5 2e                 cmp	r7, r2
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 98              stsp16	[sp+0x98], r7
 f0 35 a0              ldsp16	r5, [sp+0xa0]
 0d                    mov	r7, r5
 f9 ec                 and	r7, r3
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 8e              stsp16	[sp+0x8e], r7
 0d                    mov	r7, r5
 fa a8                 lsr16i	r7, 0x8
 f9 ec                 and	r7, r3
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 70              stsp16	[sp+0x70], r7
 f5 26                 cmp	r5, r2
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d a0              stsp16	[sp+0xa0], r5
 f0 35 9e              ldsp16	r5, [sp+0x9e]
 0d                    mov	r7, r5
 f9 ec                 and	r7, r3
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 6c              stsp16	[sp+0x6c], r7
 0d                    mov	r7, r5
 fa a8                 lsr16i	r7, 0x8
 f9 ec                 and	r7, r3
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 66              stsp16	[sp+0x66], r7
 f5 26                 cmp	r5, r2
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 9e              stsp16	[sp+0x9e], r5
 f0 36 9c              ldsp16	r6, [sp+0x9c]
 06                    mov	r5, r6
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 5c              stsp16	[sp+0x5c], r5
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 5a              stsp16	[sp+0x5a], r5
 f5 2a                 cmp	r6, r2
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 9c              stsp16	[sp+0x9c], r6
 f0 36 94              ldsp16	r6, [sp+0x94]
 06                    mov	r5, r6
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 54              stsp16	[sp+0x54], r5
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f5 2a                 cmp	r6, r2
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 94              stsp16	[sp+0x94], r6
 f0 36 9a              ldsp16	r6, [sp+0x9a]
 0e                    mov	r7, r6
 f9 ec                 and	r7, r3
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 58              stsp16	[sp+0x58], r7
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 f9 ec                 and	r7, r3
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 56              stsp16	[sp+0x56], r7
 f5 2a                 cmp	r6, r2
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 9a              stsp16	[sp+0x9a], r6
 f0 37 90              ldsp16	r7, [sp+0x90]
 0b                    mov	r6, r7
 f9 cc                 and	r6, r3
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 52              stsp16	[sp+0x52], r6
 0b                    mov	r6, r7
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ca 37                 addi.s8	r6, 0x37
 f5 2e                 cmp	r7, r2
 fc 34                 cmov.ult	r6, r4
 fa a8                 lsr16i	r7, 0x8
 f9 ec                 and	r7, r3
 f9 1d                 or	r0, r7
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 38                 cmov.ult	r7, r0
 c0 52                 ldi8	r4, 0x52
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 c0 37                 ldi8	r4, 0x37
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4e                 ldi8	r4, 0x4e
 d7 00                 sys	debug_putc
 c0 50                 ldi8	r4, 0x50
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 94              ldsp16	r4, [sp+0x94]
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 4e              ldsp16	r4, [sp+0x4e]
 d7 00                 sys	debug_putc
 f0 34 54              ldsp16	r4, [sp+0x54]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4e                 ldi8	r4, 0x4e
 d7 00                 sys	debug_putc
 c0 54                 ldi8	r4, 0x54
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 96              ldsp16	r4, [sp+0x96]
 d7 00                 sys	debug_putc
 f0 34 60              ldsp16	r4, [sp+0x60]
 d7 00                 sys	debug_putc
 f0 34 84              ldsp16	r4, [sp+0x84]
 d7 00                 sys	debug_putc
 f0 34 68              ldsp16	r4, [sp+0x68]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4e                 ldi8	r4, 0x4e
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 98              ldsp16	r4, [sp+0x98]
 d7 00                 sys	debug_putc
 f0 34 5e              ldsp16	r4, [sp+0x5e]
 d7 00                 sys	debug_putc
 f0 34 82              ldsp16	r4, [sp+0x82]
 d7 00                 sys	debug_putc
 f0 34 62              ldsp16	r4, [sp+0x62]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4e                 ldi8	r4, 0x4e
 d7 00                 sys	debug_putc
 c0 5a                 ldi8	r4, 0x5a
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 6e              ldsp16	r4, [sp+0x6e]
 d7 00                 sys	debug_putc
 f0 34 72              ldsp16	r4, [sp+0x72]
 d7 00                 sys	debug_putc
 f0 34 86              ldsp16	r4, [sp+0x86]
 d7 00                 sys	debug_putc
 f0 34 74              ldsp16	r4, [sp+0x74]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f0 34 64              ldsp16	r4, [sp+0x64]
 d7 00                 sys	debug_putc
 f0 34 52              ldsp16	r4, [sp+0x52]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 54                 ldi8	r4, 0x54
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 9a              ldsp16	r4, [sp+0x9a]
 d7 00                 sys	debug_putc
 f0 34 56              ldsp16	r4, [sp+0x56]
 d7 00                 sys	debug_putc
 f0 34 7a              ldsp16	r4, [sp+0x7a]
 d7 00                 sys	debug_putc
 f0 34 58              ldsp16	r4, [sp+0x58]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 5a                 ldi8	r4, 0x5a
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 9c              ldsp16	r4, [sp+0x9c]
 d7 00                 sys	debug_putc
 f0 34 5a              ldsp16	r4, [sp+0x5a]
 d7 00                 sys	debug_putc
 f0 34 80              ldsp16	r4, [sp+0x80]
 d7 00                 sys	debug_putc
 f0 34 5c              ldsp16	r4, [sp+0x5c]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 9e              ldsp16	r4, [sp+0x9e]
 d7 00                 sys	debug_putc
 f0 34 66              ldsp16	r4, [sp+0x66]
 d7 00                 sys	debug_putc
 f0 34 78              ldsp16	r4, [sp+0x78]
 d7 00                 sys	debug_putc
 f0 34 6c              ldsp16	r4, [sp+0x6c]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 44                 ldi8	r4, 0x44
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 a0              ldsp16	r4, [sp+0xa0]
 d7 00                 sys	debug_putc
 f0 34 70              ldsp16	r4, [sp+0x70]
 d7 00                 sys	debug_putc
 f0 34 6a              ldsp16	r4, [sp+0x6a]
 d7 00                 sys	debug_putc
 f0 34 8e              ldsp16	r4, [sp+0x8e]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4c                 ldi8	r4, 0x4c
 d7 00                 sys	debug_putc
 c0 50                 ldi8	r4, 0x50
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 76              ldsp16	r4, [sp+0x76]
 d7 00                 sys	debug_putc
 f0 34 92              ldsp16	r4, [sp+0x92]
 d7 00                 sys	debug_putc
 f0 34 88              ldsp16	r4, [sp+0x88]
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4c                 ldi8	r4, 0x4c
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 7c              ldsp16	r4, [sp+0x7c]
 d7 00                 sys	debug_putc
 f0 34 7e              ldsp16	r4, [sp+0x7e]
 d7 00                 sys	debug_putc
 f0 34 8a              ldsp16	r4, [sp+0x8a]
 d7 00                 sys	debug_putc
 f0 34 8c              ldsp16	r4, [sp+0x8c]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c4 03 01              ldi16	r4, 0x103
 c5 19 01              ldi16	r5, 0x119
 f0 46 18 01           ldm8u	r6, [0x118]
 ce 5a                 cmpi.s8	r6, 0x5a
 f8 06                 cset.eq	r6
 f2 30                 sub	r0, r0
 f1 0e                 mov	r1, r6
 f7 0f                 ld8u	r7, [r5+]
 f4 a7                 tst8	r7
 f1 28                 mov	r6, r0
 fb 31                 cmov.eq	r6, r1
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f0                 brne8	avm_test_main+3065
 c0 09                 ldi8	r4, 0x9
 f0 05 2d 03           ldi16	r1, 0x32d
 f0 17 e4              leasp	r7, 0xe4
 f0 45 23 03           ldm8u	r5, [0x323]
 f0 3d 98              stsp16	[sp+0x98], r5
 f0 45 22 03           ldm8u	r5, [0x322]
 f0 3d 9e              stsp16	[sp+0x9e], r5
 f0 45 21 03           ldm8u	r5, [0x321]
 f0 3d 9c              stsp16	[sp+0x9c], r5
 f0 45 20 03           ldm8u	r5, [0x320]
 f0 3d 9a              stsp16	[sp+0x9a], r5
 f0 45 1e 02           ldm8u	r5, [0x21e]
 f0 3d a0              stsp16	[sp+0xa0], r5
 f0 45 1d 02           ldm8u	r5, [0x21d]
 f0 3d 94              stsp16	[sp+0x94], r5
 f0 45 1c 02           ldm8u	r5, [0x21c]
 f0 3d 96              stsp16	[sp+0x96], r5
 f0 00 01              ldi8	r0, 0x1
 f0 6c 63              ld8u	r3, [r1+]
 f7 1a                 ld8u	r2, [r7+]
 f6 2c                 tst16	r4
 f8 0d                 cset.ne	r5
 f4 b4                 dec16	r4
 f5 13                 cmp	r2, r3
 d1 06                 brne8	avm_test_main+3163
 f9 a0                 and	r5, r0
 f4 a5                 tst8	r5
 d1 eb                 brne8	avm_test_main+3142
 c0 01                 ldi8	r4, 0x1
 f0 37 a0              ldsp16	r7, [sp+0xa0]
 f1 77                 zext8	r7
 c1 a5                 ldi8	r5, 0xa5
 3d                    cmp	r7, r5
 f8 05                 cset.eq	r5
 f5 13                 cmp	r2, r3
 db 6c 01              brne16	avm_test_main+3544
 f0 3d 92              stsp16	[sp+0x92], r5
 f0 3e a0              stsp16	[sp+0xa0], r6
 c2 06                 ldi8	r6, 0x6
 c7 37 03              ldi16	r7, 0x337
 f0 13 dd              leasp	r3, 0xdd
 f0 01 01              ldi8	r1, 0x1
 f7 1d                 ld8u	r5, [r7+]
 f0 6c 47              ld8u	r2, [r3+]
 f6 2e                 tst16	r6
 f8 08                 cset.ne	r0
 f4 b6                 dec16	r6
 f5 15                 cmp	r2, r5
 d1 06                 brne8	avm_test_main+3218
 f9 04                 and	r0, r1
 f4 a0                 tst8	r0
 d1 eb                 brne8	avm_test_main+3197
 f5 15                 cmp	r2, r5
 db 41 01              brne16	avm_test_main+3544
 c2 05                 ldi8	r6, 0x5
 f0 07 3e 03           ldi16	r3, 0x33e
 f0 11 d7              leasp	r1, 0xd7
 c3 01                 ldi8	r7, 0x1
 f0 6c 47              ld8u	r2, [r3+]
 f0 6c 03              ld8u	r0, [r1+]
 f6 2e                 tst16	r6
 f8 0d                 cset.ne	r5
 f4 b6                 dec16	r6
 f5 02                 cmp	r0, r2
 d1 05                 brne8	avm_test_main+3255
 87                    and	r5, r7
 f4 a5                 tst8	r5
 d1 eb                 brne8	avm_test_main+3234
 f5 02                 cmp	r0, r2
 db 1c 01              brne16	avm_test_main+3544
 f0 11 d2              leasp	r1, 0xd2
 c1 04                 ldi8	r5, 0x4
 c2 01                 ldi8	r6, 0x1
 f0 6c 03              ld8u	r0, [r1+]
 f6 2d                 tst16	r5
 f8 0f                 cset.ne	r7
 f4 b5                 dec16	r5
 f0 0c 3c              cmpi.s8	r0, 0x3c
 d1 05                 brne8	avm_test_main+3286
 8e                    and	r7, r6
 f4 a7                 tst8	r7
 d1 ed                 brne8	avm_test_main+3267
 f0 1d c6              ldsp8u	r5, [sp+0xc6]
 f0 0c 3c              cmpi.s8	r0, 0x3c
 db f9 00              brne16	avm_test_main+3544
 f1 75                 zext8	r5
 cd 72                 cmpi.s8	r5, 0x72
 db f2 00              brne16	avm_test_main+3544
 c3 72                 ldi8	r7, 0x72
 c5 45 03              ldi16	r5, 0x345
 f0 16 c6              leasp	r6, 0xc6
 f0 31 a0              ldsp16	r1, [sp+0xa0]
 f4 a7                 tst8	r7
 d0 0e                 breq8	avm_test_main+3331
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+3313
 e0 d5 00              jmp16	avm_test_main+3544
 f0 1d ba              ldsp8u	r5, [sp+0xba]
 cd 73                 cmpi.s8	r5, 0x73
 db cd 00              brne16	avm_test_main+3544
 c3 73                 ldi8	r7, 0x73
 c5 4d 03              ldi16	r5, 0x34d
 f0 16 ba              leasp	r6, 0xba
 f4 a7                 tst8	r7
 d0 0e                 breq8	avm_test_main+3365
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+3347
 e0 b3 00              jmp16	avm_test_main+3544
 f0 1d b2              ldsp8u	r5, [sp+0xb2]
 cd 69                 cmpi.s8	r5, 0x69
 db ab 00              brne16	avm_test_main+3544
 c3 69                 ldi8	r7, 0x69
 c5 54 03              ldi16	r5, 0x354
 f0 16 b2              leasp	r6, 0xb2
 f4 a7                 tst8	r7
 d0 0e                 breq8	avm_test_main+3399
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+3381
 e0 91 00              jmp16	avm_test_main+3544
 f0 1d aa              ldsp8u	r5, [sp+0xaa]
 cd 6f                 cmpi.s8	r5, 0x6f
 db 89 00              brne16	avm_test_main+3544
 c3 6f                 ldi8	r7, 0x6f
 c5 58 03              ldi16	r5, 0x358
 f0 16 aa              leasp	r6, 0xaa
 f4 a7                 tst8	r7
 d0 0d                 breq8	avm_test_main+3432
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+3415
 d4 70                 jmp8	avm_test_main+3544
 f0 02 01              ldi8	r2, 0x1
 f0 1c a2              ldsp8u	r4, [sp+0xa2]
 cc 67                 cmpi.s8	r4, 0x67
 f1 22                 mov	r4, r2
 d1 36                 brne8	avm_test_main+3498
 c2 67                 ldi8	r6, 0x67
 c4 5c 03              ldi16	r4, 0x35c
 f0 15 a2              leasp	r5, 0xa2
 f2 30                 sub	r0, r0
 f4 a6                 tst8	r6
 d0 0c                 breq8	avm_test_main+3470
 f7 07                 ld8u	r7, [r4+]
 ed ca 21              ld8u	r6, [r5+1]
 f4 ad                 inc16	r5
 3b                    cmp	r6, r7
 d0 f2                 breq8	avm_test_main+3454
 d4 03                 jmp8	avm_test_main+3473
 f0 30 92              ldsp16	r0, [sp+0x92]
 c0 01                 ldi8	r4, 0x1
 f9 82                 xor	r4, r0
 f0 37 94              ldsp16	r7, [sp+0x94]
 f1 77                 zext8	r7
 c1 a5                 ldi8	r5, 0xa5
 09                    mov	r6, r5
 3e                    cmp	r7, r6
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 f0 34 96              ldsp16	r4, [sp+0x96]
 f1 74                 zext8	r4
 32                    cmp	r4, r6
 f8 0c                 cset.ne	r4
 91                    or	r4, r5
 f6 29                 tst16	r1
 f8 06                 cset.eq	r6
 98                    or	r6, r4
 f0 35 98              ldsp16	r5, [sp+0x98]
 f1 75                 zext8	r5
 c0 b6                 ldi8	r4, 0xb6
 34                    cmp	r5, r4
 f8 0d                 cset.ne	r5
 f0 34 9a              ldsp16	r4, [sp+0x9a]
 f1 74                 zext8	r4
 cc 67                 cmpi.s8	r4, 0x67
 f8 0c                 cset.ne	r4
 92                    or	r4, r6
 f0 36 9c              ldsp16	r6, [sp+0x9c]
 f1 76                 zext8	r6
 ce 6f                 cmpi.s8	r6, 0x6f
 f8 0e                 cset.ne	r6
 98                    or	r6, r4
 f0 34 9e              ldsp16	r4, [sp+0x9e]
 f4 a4                 tst8	r4
 f8 0c                 cset.ne	r4
 92                    or	r4, r6
 91                    or	r4, r5
 f9 88                 and	r4, r2
 d6 7f                 adjsp	0x7f
 d6 6f                 adjsp	0x6f
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
