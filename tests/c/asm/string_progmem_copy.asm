
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/string_progmem_copy.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 string_progmem_copy.c
00001226 l     O .rodata	00000004 p_cat
0000122a l     O .rodata	00000007 p_abcdef
00001231 l     O .rodata	00000004 p_dog
00001235 l     O .rodata	00000008 p_ignored
00000100 l     O .data	0000000c .L__const.avm_test_main.full
0000010c l     O .data	0000000c .L__const.avm_test_main.cut
0000123d l     O .rodata	00000005 p_wood
00001242 l     O .rodata	00000007 p_flower
00001249 l     O .rodata	00000005 p_berg
0000124e l     O .rodata	00000001 p_empty
0000124f l     O .rodata	00000003 p_go
00000118 l     O .data	00000107 avm_test_main.long_pad
00001252 l     O .rodata	00000002 p_z
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
00000430 g     F .text	00000df4 avm_test_main
00001224 g     F .text	00000002 avm_halt
00000416 g     F .text	0000000d test_call_strncpy_P
00000423 g     F .text	0000000d test_call_strncat_P

Disassembly of section .text:

<_start>:
 d5 2e                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 01                    mov	r4, r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 0e 0e              call16	avm_halt

<test_call_strncpy_P>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 f1 77                 zext8	r7
 f4 15                 ldsp16	r5, [sp+0x5]
 d7 16                 sys	strncpy_p
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 ef                    ret

<test_call_strncat_P>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 f1 77                 zext8	r7
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
 c6 26 12              ldi16	r6, 0x1226
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 e6              leasp	r4, 0xe6
 e1 79 ff              call16	test_call_strncpy_P
 d6 02                 adjsp	0x2
 c6 2a 12              ldi16	r6, 0x122a
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 d6 fe                 adjsp	-0x2
 c0 03                 ldi8	r4, 0x3
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 df              leasp	r4, 0xdf
 e1 64 ff              call16	test_call_strncpy_P
 d6 02                 adjsp	0x2
 c6 31 12              ldi16	r6, 0x1231
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 d6 fe                 adjsp	-0x2
 f0 02 04              ldi8	r2, 0x4
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 14 d9              leasp	r4, 0xd9
 e1 4d ff              call16	test_call_strncpy_P
 d6 02                 adjsp	0x2
 c6 35 12              ldi16	r6, 0x1235
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 d6 fe                 adjsp	-0x2
 f2 39                 sub	r1, r1
 f0 39 00              stsp16	[sp+0x0], r1
 f0 14 d4              leasp	r4, 0xd4
 e1 37 ff              call16	test_call_strncpy_P
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
 c6 3d 12              ldi16	r6, 0x123d
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 23                 mov	r4, r3
 e1 ea fe              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 d6 fe                 adjsp	-0x2
 c0 03                 ldi8	r4, 0x3
 f4 40                 stsp16	[sp+0x0], r4
 c6 42 12              ldi16	r6, 0x1242
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 e1 d6 fe              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 d6 fe                 adjsp	-0x2
 f0 39 00              stsp16	[sp+0x0], r1
 c6 49 12              ldi16	r6, 0x1249
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 b4              leasp	r4, 0xb4
 e1 c2 fe              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 d6 fe                 adjsp	-0x2
 f0 3a 00              stsp16	[sp+0x0], r2
 c6 4e 12              ldi16	r6, 0x124e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 ac              leasp	r4, 0xac
 e1 ae fe              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 d6 fe                 adjsp	-0x2
 f0 00 02              ldi8	r0, 0x2
 f0 38 00              stsp16	[sp+0x0], r0
 f0 06 4f 12           ldi16	r2, 0x124f
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 f0 14 a4              leasp	r4, 0xa4
 f2 6b                 mov32	q3, q1
 e1 93 fe              call16	test_call_strncat_P
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
 c6 52 12              ldi16	r6, 0x1252
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 05 18 01           ldi16	r1, 0x118
 f1 21                 mov	r4, r1
 e1 5d fe              call16	test_call_strncpy_P
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
 e1 24 fe              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 c4 2b 6d              ldi16	r4, 0x6d2b
 c6 f2 ff              ldi16	r6, 0xfff2
 f0 03 0e              ldi8	r3, 0xe
 f0 1d a9              ldsp8u	r5, [sp+0xa9]
 f0 3d 6c              stsp16	[sp+0x6c], r5
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
 f0 3d 7a              stsp16	[sp+0x7a], r5
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
 f0 3d 78              stsp16	[sp+0x78], r5
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
 f0 3d 6a              stsp16	[sp+0x6a], r5
 f0 1d bc              ldsp8u	r5, [sp+0xbc]
 f0 3d 68              stsp16	[sp+0x68], r5
 f0 1d bb              ldsp8u	r5, [sp+0xbb]
 f0 3d 66              stsp16	[sp+0x66], r5
 f0 1d ba              ldsp8u	r5, [sp+0xba]
 f0 3d 98              stsp16	[sp+0x98], r5
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
 f0 3d 96              stsp16	[sp+0x96], r5
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
 f0 3d 94              stsp16	[sp+0x94], r5
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
 f0 3d 92              stsp16	[sp+0x92], r5
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 6c e3              ld8u	r7, [r1+]
 ac                    xor	r7, r4
 f0 0b ef              addi.s8	r3, -0x11
 ca 11                 addi.s8	r6, 0x11
 02                    mov	r4, r6
 13                    add	r4, r7
 c5 69 11              ldi16	r5, 0x1169
 39                    cmp	r6, r5
 d1 e9                 brne8	avm_test_main+923
 f0 3f 9a              stsp16	[sp+0x9a], r7
 1b                    add	r6, r7
 c4 2b 6d              ldi16	r4, 0x6d2b
 c5 f2 ff              ldi16	r5, 0xfff2
 f0 01 0e              ldi8	r1, 0xe
 0c                    mov	r7, r4
 fa ab                 lsr16i	r7, 0xb
 fa 35                 lsl16i	r4, 0x5
 93                    or	r4, r7
 f0 6c 41              ld8u	r2, [r0+]
 f9 52                 xor	r2, r4
 f0 09 ef              addi.s8	r1, -0x11
 c9 11                 addi.s8	r5, 0x11
 01                    mov	r4, r5
 f2 22                 add	r4, r2
 c7 e0 11              ldi16	r7, 0x11e0
 37                    cmp	r5, r7
 d1 e7                 brne8	avm_test_main+959
 f0 37 9a              ldsp16	r7, [sp+0x9a]
 f2 5f                 sub	r7, r3
 f0 3f 9a              stsp16	[sp+0x9a], r7
 f1 77                 zext8	r7
 f0 3f 8a              stsp16	[sp+0x8a], r7
 fa a4                 lsr16i	r7, 0x4
 f0 00 30              ldi8	r0, 0x30
 f0 3f 8c              stsp16	[sp+0x8c], r7
 f0 34 8c              ldsp16	r4, [sp+0x8c]
 f9 81                 or	r4, r0
 f0 3c 8c              stsp16	[sp+0x8c], r4
 cb 37                 addi.s8	r7, 0x37
 f0 03 a0              ldi8	r3, 0xa0
 f0 34 8a              ldsp16	r4, [sp+0x8a]
 f5 23                 cmp	r4, r3
 f0 34 8c              ldsp16	r4, [sp+0x8c]
 fc 3c                 cmov.ult	r7, r4
 f0 3f 88              stsp16	[sp+0x88], r7
 f1 2e                 mov	r7, r2
 f2 5d                 sub	r7, r1
 f0 3f 8c              stsp16	[sp+0x8c], r7
 f1 77                 zext8	r7
 f4 43                 stsp16	[sp+0x0], r7
 fa a4                 lsr16i	r7, 0x4
 f0 3f 8a              stsp16	[sp+0x8a], r7
 f0 34 8a              ldsp16	r4, [sp+0x8a]
 f9 81                 or	r4, r0
 f0 3c 8a              stsp16	[sp+0x8a], r4
 cb 37                 addi.s8	r7, 0x37
 f4 00                 ldsp16	r4, [sp+0x0]
 f5 23                 cmp	r4, r3
 f0 34 8a              ldsp16	r4, [sp+0x8a]
 fc 3c                 cmov.ult	r7, r4
 f0 3f 8a              stsp16	[sp+0x8a], r7
 c4 6d 05              ldi16	r4, 0x56d
 f0 37 8e              ldsp16	r7, [sp+0x8e]
 ac                    xor	r7, r4
 f1 0c                 mov	r1, r4
 fa 65                 lsl16i	r7, 0x5
 cb 74                 addi.s8	r7, 0x74
 f4 08                 ldsp16	r4, [sp+0x2]
 ac                    xor	r7, r4
 cb 14                 addi.s8	r7, 0x14
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 ac                    xor	r7, r4
 cb 25                 addi.s8	r7, 0x25
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 ac                    xor	r7, r4
 cb 36                 addi.s8	r7, 0x36
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 86              ldsp16	r4, [sp+0x86]
 ac                    xor	r7, r4
 cb 47                 addi.s8	r7, 0x47
 f0 3f 8e              stsp16	[sp+0x8e], r7
 f1 77                 zext8	r7
 f5 2f                 cmp	r7, r3
 fa a4                 lsr16i	r7, 0x4
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 86              stsp16	[sp+0x86], r7
 f0 37 94              ldsp16	r7, [sp+0x94]
 f9 e6                 xor	r7, r1
 fa 65                 lsl16i	r7, 0x5
 cb 74                 addi.s8	r7, 0x74
 f4 20                 ldsp16	r4, [sp+0x8]
 ac                    xor	r7, r4
 cb 14                 addi.s8	r7, 0x14
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 ac                    xor	r7, r4
 cb 25                 addi.s8	r7, 0x25
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f4 30                 ldsp16	r4, [sp+0xc]
 ac                    xor	r7, r4
 cb 36                 addi.s8	r7, 0x36
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f4 38                 ldsp16	r4, [sp+0xe]
 ac                    xor	r7, r4
 cb 47                 addi.s8	r7, 0x47
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 ac                    xor	r7, r4
 cb 58                 addi.s8	r7, 0x58
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 84              ldsp16	r4, [sp+0x84]
 ac                    xor	r7, r4
 cb 69                 addi.s8	r7, 0x69
 f0 3f 94              stsp16	[sp+0x94], r7
 f1 77                 zext8	r7
 f5 2f                 cmp	r7, r3
 fa a4                 lsr16i	r7, 0x4
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 84              stsp16	[sp+0x84], r7
 f0 37 96              ldsp16	r7, [sp+0x96]
 f9 e6                 xor	r7, r1
 fa 65                 lsl16i	r7, 0x5
 cb 74                 addi.s8	r7, 0x74
 f0 34 12              ldsp16	r4, [sp+0x12]
 ac                    xor	r7, r4
 cb 14                 addi.s8	r7, 0x14
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 ac                    xor	r7, r4
 cb 25                 addi.s8	r7, 0x25
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 16              ldsp16	r4, [sp+0x16]
 ac                    xor	r7, r4
 cb 36                 addi.s8	r7, 0x36
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 18              ldsp16	r4, [sp+0x18]
 ac                    xor	r7, r4
 cb 47                 addi.s8	r7, 0x47
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 82              ldsp16	r4, [sp+0x82]
 ac                    xor	r7, r4
 cb 58                 addi.s8	r7, 0x58
 f0 3f 96              stsp16	[sp+0x96], r7
 f1 77                 zext8	r7
 f5 2f                 cmp	r7, r3
 fa a4                 lsr16i	r7, 0x4
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 82              stsp16	[sp+0x82], r7
 f0 37 9c              ldsp16	r7, [sp+0x9c]
 f9 e6                 xor	r7, r1
 fa 65                 lsl16i	r7, 0x5
 cb 74                 addi.s8	r7, 0x74
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 ac                    xor	r7, r4
 cb 14                 addi.s8	r7, 0x14
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 ac                    xor	r7, r4
 cb 25                 addi.s8	r7, 0x25
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 ac                    xor	r7, r4
 cb 36                 addi.s8	r7, 0x36
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 20              ldsp16	r4, [sp+0x20]
 ac                    xor	r7, r4
 cb 47                 addi.s8	r7, 0x47
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 22              ldsp16	r4, [sp+0x22]
 ac                    xor	r7, r4
 cb 58                 addi.s8	r7, 0x58
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 24              ldsp16	r4, [sp+0x24]
 ac                    xor	r7, r4
 cb 69                 addi.s8	r7, 0x69
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 80              ldsp16	r4, [sp+0x80]
 ac                    xor	r7, r4
 cb 7a                 addi.s8	r7, 0x7a
 f0 3f 9c              stsp16	[sp+0x9c], r7
 f1 77                 zext8	r7
 f5 2f                 cmp	r7, r3
 fa a4                 lsr16i	r7, 0x4
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 80              stsp16	[sp+0x80], r7
 f0 37 9e              ldsp16	r7, [sp+0x9e]
 f9 e6                 xor	r7, r1
 fa 65                 lsl16i	r7, 0x5
 cb 74                 addi.s8	r7, 0x74
 f0 34 26              ldsp16	r4, [sp+0x26]
 ac                    xor	r7, r4
 cb 14                 addi.s8	r7, 0x14
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 28              ldsp16	r4, [sp+0x28]
 ac                    xor	r7, r4
 cb 25                 addi.s8	r7, 0x25
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 ac                    xor	r7, r4
 cb 36                 addi.s8	r7, 0x36
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 ac                    xor	r7, r4
 cb 47                 addi.s8	r7, 0x47
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 ac                    xor	r7, r4
 cb 58                 addi.s8	r7, 0x58
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 30              ldsp16	r4, [sp+0x30]
 ac                    xor	r7, r4
 cb 69                 addi.s8	r7, 0x69
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 7a              ldsp16	r4, [sp+0x7a]
 ac                    xor	r7, r4
 cb 7a                 addi.s8	r7, 0x7a
 f0 3f 9e              stsp16	[sp+0x9e], r7
 f1 77                 zext8	r7
 f5 2f                 cmp	r7, r3
 fa a4                 lsr16i	r7, 0x4
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 7a              stsp16	[sp+0x7a], r7
 f0 37 a0              ldsp16	r7, [sp+0xa0]
 f9 e6                 xor	r7, r1
 fa 65                 lsl16i	r7, 0x5
 cb 74                 addi.s8	r7, 0x74
 f0 34 32              ldsp16	r4, [sp+0x32]
 ac                    xor	r7, r4
 cb 14                 addi.s8	r7, 0x14
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 34              ldsp16	r4, [sp+0x34]
 ac                    xor	r7, r4
 cb 25                 addi.s8	r7, 0x25
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 38              ldsp16	r4, [sp+0x38]
 ac                    xor	r7, r4
 cb 36                 addi.s8	r7, 0x36
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 ac                    xor	r7, r4
 cb 47                 addi.s8	r7, 0x47
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 40              ldsp16	r4, [sp+0x40]
 ac                    xor	r7, r4
 cb 58                 addi.s8	r7, 0x58
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 44              ldsp16	r4, [sp+0x44]
 ac                    xor	r7, r4
 cb 69                 addi.s8	r7, 0x69
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 6c              ldsp16	r4, [sp+0x6c]
 ac                    xor	r7, r4
 cb 7a                 addi.s8	r7, 0x7a
 f0 3f a0              stsp16	[sp+0xa0], r7
 f1 77                 zext8	r7
 f5 2f                 cmp	r7, r3
 fa a4                 lsr16i	r7, 0x4
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 6c              stsp16	[sp+0x6c], r7
 f0 37 92              ldsp16	r7, [sp+0x92]
 f9 e6                 xor	r7, r1
 fa 65                 lsl16i	r7, 0x5
 cb 74                 addi.s8	r7, 0x74
 f0 34 36              ldsp16	r4, [sp+0x36]
 ac                    xor	r7, r4
 cb 14                 addi.s8	r7, 0x14
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 ac                    xor	r7, r4
 cb 25                 addi.s8	r7, 0x25
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 ac                    xor	r7, r4
 cb 36                 addi.s8	r7, 0x36
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 42              ldsp16	r4, [sp+0x42]
 ac                    xor	r7, r4
 cb 47                 addi.s8	r7, 0x47
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 46              ldsp16	r4, [sp+0x46]
 ac                    xor	r7, r4
 cb 58                 addi.s8	r7, 0x58
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 48              ldsp16	r4, [sp+0x48]
 ac                    xor	r7, r4
 cb 69                 addi.s8	r7, 0x69
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 4a              ldsp16	r4, [sp+0x4a]
 ac                    xor	r7, r4
 cb 7a                 addi.s8	r7, 0x7a
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 4c              ldsp16	r4, [sp+0x4c]
 ac                    xor	r7, r4
 f0 03 8b              ldi8	r3, 0x8b
 f2 2f                 add	r7, r3
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 4e              ldsp16	r4, [sp+0x4e]
 ac                    xor	r7, r4
 f0 01 9c              ldi8	r1, 0x9c
 f2 2d                 add	r7, r1
 f0 3f 92              stsp16	[sp+0x92], r7
 f1 77                 zext8	r7
 c0 a0                 ldi8	r4, 0xa0
 3c                    cmp	r7, r4
 fa a4                 lsr16i	r7, 0x4
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 4e              stsp16	[sp+0x4e], r7
 f0 37 90              ldsp16	r7, [sp+0x90]
 c4 6d 05              ldi16	r4, 0x56d
 ac                    xor	r7, r4
 fa 65                 lsl16i	r7, 0x5
 cb 74                 addi.s8	r7, 0x74
 f0 34 50              ldsp16	r4, [sp+0x50]
 ac                    xor	r7, r4
 cb 14                 addi.s8	r7, 0x14
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 52              ldsp16	r4, [sp+0x52]
 ac                    xor	r7, r4
 cb 25                 addi.s8	r7, 0x25
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 54              ldsp16	r4, [sp+0x54]
 ac                    xor	r7, r4
 cb 36                 addi.s8	r7, 0x36
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 56              ldsp16	r4, [sp+0x56]
 ac                    xor	r7, r4
 cb 47                 addi.s8	r7, 0x47
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 58              ldsp16	r4, [sp+0x58]
 ac                    xor	r7, r4
 cb 58                 addi.s8	r7, 0x58
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 5a              ldsp16	r4, [sp+0x5a]
 ac                    xor	r7, r4
 cb 69                 addi.s8	r7, 0x69
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 5c              ldsp16	r4, [sp+0x5c]
 ac                    xor	r7, r4
 cb 7a                 addi.s8	r7, 0x7a
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 5e              ldsp16	r4, [sp+0x5e]
 ac                    xor	r7, r4
 f2 2f                 add	r7, r3
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 60              ldsp16	r4, [sp+0x60]
 ac                    xor	r7, r4
 f2 2d                 add	r7, r1
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 62              ldsp16	r4, [sp+0x62]
 ac                    xor	r7, r4
 f0 03 ad              ldi8	r3, 0xad
 f2 2f                 add	r7, r3
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 64              ldsp16	r4, [sp+0x64]
 ac                    xor	r7, r4
 f0 01 be              ldi8	r1, 0xbe
 f2 2d                 add	r7, r1
 f0 3f 90              stsp16	[sp+0x90], r7
 f1 77                 zext8	r7
 c0 a0                 ldi8	r4, 0xa0
 3c                    cmp	r7, r4
 fa a4                 lsr16i	r7, 0x4
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 64              stsp16	[sp+0x64], r7
 f0 37 98              ldsp16	r7, [sp+0x98]
 c4 6d 05              ldi16	r4, 0x56d
 ac                    xor	r7, r4
 fa 65                 lsl16i	r7, 0x5
 cb 74                 addi.s8	r7, 0x74
 f0 34 66              ldsp16	r4, [sp+0x66]
 ac                    xor	r7, r4
 cb 14                 addi.s8	r7, 0x14
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 68              ldsp16	r4, [sp+0x68]
 ac                    xor	r7, r4
 cb 25                 addi.s8	r7, 0x25
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 6a              ldsp16	r4, [sp+0x6a]
 ac                    xor	r7, r4
 cb 36                 addi.s8	r7, 0x36
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 6e              ldsp16	r4, [sp+0x6e]
 ac                    xor	r7, r4
 cb 47                 addi.s8	r7, 0x47
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 70              ldsp16	r4, [sp+0x70]
 ac                    xor	r7, r4
 cb 58                 addi.s8	r7, 0x58
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 72              ldsp16	r4, [sp+0x72]
 ac                    xor	r7, r4
 cb 69                 addi.s8	r7, 0x69
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 74              ldsp16	r4, [sp+0x74]
 ac                    xor	r7, r4
 cb 7a                 addi.s8	r7, 0x7a
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 76              ldsp16	r4, [sp+0x76]
 ac                    xor	r7, r4
 c0 8b                 ldi8	r4, 0x8b
 1c                    add	r7, r4
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 78              ldsp16	r4, [sp+0x78]
 ac                    xor	r7, r4
 c0 9c                 ldi8	r4, 0x9c
 1c                    add	r7, r4
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 7c              ldsp16	r4, [sp+0x7c]
 ac                    xor	r7, r4
 f2 2f                 add	r7, r3
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 34 7e              ldsp16	r4, [sp+0x7e]
 ac                    xor	r7, r4
 f2 2d                 add	r7, r1
 f0 3f 98              stsp16	[sp+0x98], r7
 03                    mov	r4, r7
 f1 74                 zext8	r4
 c3 a0                 ldi8	r7, 0xa0
 33                    cmp	r4, r7
 fa 74                 lsr16i	r4, 0x4
 0c                    mov	r7, r4
 f9 e1                 or	r7, r0
 c8 37                 addi.s8	r4, 0x37
 fc 27                 cmov.ult	r4, r7
 f0 3c 76              stsp16	[sp+0x76], r4
 f0 03 0f              ldi8	r3, 0xf
 f0 34 8c              ldsp16	r4, [sp+0x8c]
 f9 8c                 and	r4, r3
 f1 0c                 mov	r1, r4
 f9 21                 or	r1, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 21                 cmov.ult	r4, r1
 f0 3c 8c              stsp16	[sp+0x8c], r4
 f2 26                 add	r5, r2
 01                    mov	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f9 8c                 and	r4, r3
 0c                    mov	r7, r4
 f9 e1                 or	r7, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 27                 cmov.ult	r4, r7
 f0 3c 7e              stsp16	[sp+0x7e], r4
 01                    mov	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 0c                    mov	r7, r4
 f9 e1                 or	r7, r0
 c8 37                 addi.s8	r4, 0x37
 f0 06 00 a0           ldi16	r2, 0xa000
 f5 26                 cmp	r5, r2
 fc 27                 cmov.ult	r4, r7
 f0 3c 7c              stsp16	[sp+0x7c], r4
 f0 35 9a              ldsp16	r5, [sp+0x9a]
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 9a              stsp16	[sp+0x9a], r5
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 78              stsp16	[sp+0x78], r5
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 f5 2a                 cmp	r6, r2
 fc 2c                 cmov.ult	r5, r4
 f0 3d 74              stsp16	[sp+0x74], r5
 f0 35 8e              ldsp16	r5, [sp+0x8e]
 09                    mov	r6, r5
 f9 cc                 and	r6, r3
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 72              stsp16	[sp+0x72], r6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f9 cc                 and	r6, r3
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 70              stsp16	[sp+0x70], r6
 09                    mov	r6, r5
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ca 37                 addi.s8	r6, 0x37
 f5 26                 cmp	r5, r2
 fc 34                 cmov.ult	r6, r4
 f0 3e 6a              stsp16	[sp+0x6a], r6
 f0 35 94              ldsp16	r5, [sp+0x94]
 09                    mov	r6, r5
 f9 cc                 and	r6, r3
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 66              stsp16	[sp+0x66], r6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f9 cc                 and	r6, r3
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 5e              stsp16	[sp+0x5e], r6
 f5 26                 cmp	r5, r2
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 94              stsp16	[sp+0x94], r5
 f0 35 96              ldsp16	r5, [sp+0x96]
 09                    mov	r6, r5
 f9 cc                 and	r6, r3
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 60              stsp16	[sp+0x60], r6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f9 cc                 and	r6, r3
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 5c              stsp16	[sp+0x5c], r6
 f5 26                 cmp	r5, r2
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 96              stsp16	[sp+0x96], r5
 f0 35 a0              ldsp16	r5, [sp+0xa0]
 09                    mov	r6, r5
 f9 cc                 and	r6, r3
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 8e              stsp16	[sp+0x8e], r6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f9 cc                 and	r6, r3
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 6e              stsp16	[sp+0x6e], r6
 f5 26                 cmp	r5, r2
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d a0              stsp16	[sp+0xa0], r5
 f0 35 9e              ldsp16	r5, [sp+0x9e]
 09                    mov	r6, r5
 f9 cc                 and	r6, r3
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 68              stsp16	[sp+0x68], r6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f9 cc                 and	r6, r3
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 62              stsp16	[sp+0x62], r6
 f5 26                 cmp	r5, r2
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 9e              stsp16	[sp+0x9e], r5
 f0 35 9c              ldsp16	r5, [sp+0x9c]
 09                    mov	r6, r5
 f9 cc                 and	r6, r3
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 5a              stsp16	[sp+0x5a], r6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f9 cc                 and	r6, r3
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 58              stsp16	[sp+0x58], r6
 f5 26                 cmp	r5, r2
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 9c              stsp16	[sp+0x9c], r5
 f0 35 92              ldsp16	r5, [sp+0x92]
 09                    mov	r6, r5
 f9 cc                 and	r6, r3
 02                    mov	r4, r6
 f9 81                 or	r4, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 50              stsp16	[sp+0x50], r6
 01                    mov	r4, r5
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f9 cc                 and	r6, r3
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f5 22                 cmp	r4, r2
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 92              stsp16	[sp+0x92], r4
 f0 37 98              ldsp16	r7, [sp+0x98]
 03                    mov	r4, r7
 f9 8c                 and	r4, r3
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 56              stsp16	[sp+0x56], r4
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 8c                 and	r4, r3
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f0 3c 54              stsp16	[sp+0x54], r4
 f5 2e                 cmp	r7, r2
 fa ac                 lsr16i	r7, 0xc
 07                    mov	r5, r7
 f9 a1                 or	r5, r0
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 98              stsp16	[sp+0x98], r7
 f0 34 90              ldsp16	r4, [sp+0x90]
 0c                    mov	r7, r4
 f9 ec                 and	r7, r3
 07                    mov	r5, r7
 f9 a1                 or	r5, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 52              stsp16	[sp+0x52], r7
 0c                    mov	r7, r4
 fa ac                 lsr16i	r7, 0xc
 07                    mov	r5, r7
 f9 a1                 or	r5, r0
 cb 37                 addi.s8	r7, 0x37
 f5 22                 cmp	r4, r2
 fc 3d                 cmov.ult	r7, r5
 fa 78                 lsr16i	r4, 0x8
 f9 8c                 and	r4, r3
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 04                    mov	r5, r4
 c0 52                 ldi8	r4, 0x52
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 d7 00                 sys	debug_putc
 f0 02 3d              ldi8	r2, 0x3d
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 37                 ldi8	r4, 0x37
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f0 01 0a              ldi8	r1, 0xa
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 f0 00 4e              ldi8	r0, 0x4e
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 50                 ldi8	r4, 0x50
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f0 34 92              ldsp16	r4, [sp+0x92]
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f0 34 4e              ldsp16	r4, [sp+0x4e]
 d7 00                 sys	debug_putc
 f0 34 50              ldsp16	r4, [sp+0x50]
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c2 54                 ldi8	r6, 0x54
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f0 34 94              ldsp16	r4, [sp+0x94]
 d7 00                 sys	debug_putc
 f0 34 5e              ldsp16	r4, [sp+0x5e]
 d7 00                 sys	debug_putc
 f0 34 84              ldsp16	r4, [sp+0x84]
 d7 00                 sys	debug_putc
 f0 34 66              ldsp16	r4, [sp+0x66]
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f0 34 96              ldsp16	r4, [sp+0x96]
 d7 00                 sys	debug_putc
 f0 34 5c              ldsp16	r4, [sp+0x5c]
 d7 00                 sys	debug_putc
 f0 34 82              ldsp16	r4, [sp+0x82]
 d7 00                 sys	debug_putc
 f0 34 60              ldsp16	r4, [sp+0x60]
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f0 00 5a              ldi8	r0, 0x5a
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f0 34 6a              ldsp16	r4, [sp+0x6a]
 d7 00                 sys	debug_putc
 f0 34 70              ldsp16	r4, [sp+0x70]
 d7 00                 sys	debug_putc
 f0 34 86              ldsp16	r4, [sp+0x86]
 d7 00                 sys	debug_putc
 f0 34 72              ldsp16	r4, [sp+0x72]
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 f0 03 43              ldi8	r3, 0x43
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 64              ldsp16	r4, [sp+0x64]
 d7 00                 sys	debug_putc
 f0 34 52              ldsp16	r4, [sp+0x52]
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f0 34 98              ldsp16	r4, [sp+0x98]
 d7 00                 sys	debug_putc
 f0 34 54              ldsp16	r4, [sp+0x54]
 d7 00                 sys	debug_putc
 f0 34 76              ldsp16	r4, [sp+0x76]
 d7 00                 sys	debug_putc
 f0 34 56              ldsp16	r4, [sp+0x56]
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f0 34 9c              ldsp16	r4, [sp+0x9c]
 d7 00                 sys	debug_putc
 f0 34 58              ldsp16	r4, [sp+0x58]
 d7 00                 sys	debug_putc
 f0 34 80              ldsp16	r4, [sp+0x80]
 d7 00                 sys	debug_putc
 f0 34 5a              ldsp16	r4, [sp+0x5a]
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f0 34 9e              ldsp16	r4, [sp+0x9e]
 d7 00                 sys	debug_putc
 f0 34 62              ldsp16	r4, [sp+0x62]
 d7 00                 sys	debug_putc
 f0 34 7a              ldsp16	r4, [sp+0x7a]
 d7 00                 sys	debug_putc
 f0 34 68              ldsp16	r4, [sp+0x68]
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 c0 44                 ldi8	r4, 0x44
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f0 34 a0              ldsp16	r4, [sp+0xa0]
 d7 00                 sys	debug_putc
 f0 34 6e              ldsp16	r4, [sp+0x6e]
 d7 00                 sys	debug_putc
 f0 34 6c              ldsp16	r4, [sp+0x6c]
 d7 00                 sys	debug_putc
 f0 34 8e              ldsp16	r4, [sp+0x8e]
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 c1 4c                 ldi8	r5, 0x4c
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 50                 ldi8	r4, 0x50
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f0 34 74              ldsp16	r4, [sp+0x74]
 d7 00                 sys	debug_putc
 f0 34 78              ldsp16	r4, [sp+0x78]
 d7 00                 sys	debug_putc
 f0 34 88              ldsp16	r4, [sp+0x88]
 d7 00                 sys	debug_putc
 f0 34 9a              ldsp16	r4, [sp+0x9a]
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f0 34 7c              ldsp16	r4, [sp+0x7c]
 d7 00                 sys	debug_putc
 f0 34 7e              ldsp16	r4, [sp+0x7e]
 d7 00                 sys	debug_putc
 f0 34 8a              ldsp16	r4, [sp+0x8a]
 d7 00                 sys	debug_putc
 f0 34 8c              ldsp16	r4, [sp+0x8c]
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
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
 d1 f0                 brne8	avm_test_main+3084
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
 d1 06                 brne8	avm_test_main+3182
 f9 a0                 and	r5, r0
 f4 a5                 tst8	r5
 d1 eb                 brne8	avm_test_main+3161
 c0 01                 ldi8	r4, 0x1
 f0 37 a0              ldsp16	r7, [sp+0xa0]
 f1 77                 zext8	r7
 c1 a5                 ldi8	r5, 0xa5
 3d                    cmp	r7, r5
 f8 05                 cset.eq	r5
 f5 13                 cmp	r2, r3
 db 6c 01              brne16	avm_test_main+3563
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
 d1 06                 brne8	avm_test_main+3237
 f9 04                 and	r0, r1
 f4 a0                 tst8	r0
 d1 eb                 brne8	avm_test_main+3216
 f5 15                 cmp	r2, r5
 db 41 01              brne16	avm_test_main+3563
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
 d1 05                 brne8	avm_test_main+3274
 87                    and	r5, r7
 f4 a5                 tst8	r5
 d1 eb                 brne8	avm_test_main+3253
 f5 02                 cmp	r0, r2
 db 1c 01              brne16	avm_test_main+3563
 f0 11 d2              leasp	r1, 0xd2
 c1 04                 ldi8	r5, 0x4
 c2 01                 ldi8	r6, 0x1
 f0 6c 03              ld8u	r0, [r1+]
 f6 2d                 tst16	r5
 f8 0f                 cset.ne	r7
 f4 b5                 dec16	r5
 f0 0c 3c              cmpi.s8	r0, 0x3c
 d1 05                 brne8	avm_test_main+3305
 8e                    and	r7, r6
 f4 a7                 tst8	r7
 d1 ed                 brne8	avm_test_main+3286
 f0 1d c6              ldsp8u	r5, [sp+0xc6]
 f0 0c 3c              cmpi.s8	r0, 0x3c
 db f9 00              brne16	avm_test_main+3563
 f1 75                 zext8	r5
 cd 72                 cmpi.s8	r5, 0x72
 db f2 00              brne16	avm_test_main+3563
 c3 72                 ldi8	r7, 0x72
 c5 45 03              ldi16	r5, 0x345
 f0 16 c6              leasp	r6, 0xc6
 f0 31 a0              ldsp16	r1, [sp+0xa0]
 f4 a7                 tst8	r7
 d0 0e                 breq8	avm_test_main+3350
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+3332
 e0 d5 00              jmp16	avm_test_main+3563
 f0 1d ba              ldsp8u	r5, [sp+0xba]
 cd 73                 cmpi.s8	r5, 0x73
 db cd 00              brne16	avm_test_main+3563
 c3 73                 ldi8	r7, 0x73
 c5 4d 03              ldi16	r5, 0x34d
 f0 16 ba              leasp	r6, 0xba
 f4 a7                 tst8	r7
 d0 0e                 breq8	avm_test_main+3384
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+3366
 e0 b3 00              jmp16	avm_test_main+3563
 f0 1d b2              ldsp8u	r5, [sp+0xb2]
 cd 69                 cmpi.s8	r5, 0x69
 db ab 00              brne16	avm_test_main+3563
 c3 69                 ldi8	r7, 0x69
 c5 54 03              ldi16	r5, 0x354
 f0 16 b2              leasp	r6, 0xb2
 f4 a7                 tst8	r7
 d0 0e                 breq8	avm_test_main+3418
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+3400
 e0 91 00              jmp16	avm_test_main+3563
 f0 1d aa              ldsp8u	r5, [sp+0xaa]
 cd 6f                 cmpi.s8	r5, 0x6f
 db 89 00              brne16	avm_test_main+3563
 c3 6f                 ldi8	r7, 0x6f
 c5 58 03              ldi16	r5, 0x358
 f0 16 aa              leasp	r6, 0xaa
 f4 a7                 tst8	r7
 d0 0d                 breq8	avm_test_main+3451
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+3434
 d4 70                 jmp8	avm_test_main+3563
 f0 02 01              ldi8	r2, 0x1
 f0 1c a2              ldsp8u	r4, [sp+0xa2]
 cc 67                 cmpi.s8	r4, 0x67
 f1 22                 mov	r4, r2
 d1 36                 brne8	avm_test_main+3517
 c2 67                 ldi8	r6, 0x67
 c4 5c 03              ldi16	r4, 0x35c
 f0 15 a2              leasp	r5, 0xa2
 f2 30                 sub	r0, r0
 f4 a6                 tst8	r6
 d0 0c                 breq8	avm_test_main+3489
 f7 07                 ld8u	r7, [r4+]
 ed ca 21              ld8u	r6, [r5+1]
 f4 ad                 inc16	r5
 3b                    cmp	r6, r7
 d0 f2                 breq8	avm_test_main+3473
 d4 03                 jmp8	avm_test_main+3492
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
