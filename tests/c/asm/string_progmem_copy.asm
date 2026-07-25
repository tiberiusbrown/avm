
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/string_progmem_copy.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 string_progmem_copy.c
000010ca l     O .rodata	00000004 p_cat
000010ce l     O .rodata	00000007 p_abcdef
000010d5 l     O .rodata	00000004 p_dog
000010d9 l     O .rodata	00000008 p_ignored
00000100 l     O .data	0000000c .L__const.avm_test_main.full
0000010c l     O .data	0000000c .L__const.avm_test_main.cut
000010e1 l     O .rodata	00000005 p_wood
000010e6 l     O .rodata	00000007 p_flower
000010ed l     O .rodata	00000005 p_berg
000010f2 l     O .rodata	00000001 p_empty
000010f3 l     O .rodata	00000003 p_go
00000118 l     O .data	00000107 avm_test_main.long_pad
000010f6 l     O .rodata	00000002 p_z
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
00000430 g     F .text	00000c98 avm_test_main
000010c8 g     F .text	00000002 avm_halt
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
 e1 b2 0c              call16	avm_halt

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
 d6 b4                 adjsp	-0x4c
 c4 a5 a5              ldi16	r4, 0xa5a5
 f0 3c ca              stsp16	[sp+0xca], r4
 c4 a5 a5              ldi16	r4, 0xa5a5
 c5 a5 a5              ldi16	r5, 0xa5a5
 f0 3c c6              stsp16	[sp+0xc6], r4
 f0 3d c8              stsp16	[sp+0xc8], r5
 f0 3c c2              stsp16	[sp+0xc2], r4
 f0 3d c4              stsp16	[sp+0xc4], r5
 c4 cc cc              ldi16	r4, 0xcccc
 c1 cc                 ldi8	r5, 0xcc
 f0 3c bf              stsp16	[sp+0xbf], r4
 f0 2d c1              stsp8	[sp+0xc1], r5
 c4 cc cc              ldi16	r4, 0xcccc
 c5 cc cc              ldi16	r5, 0xcccc
 f0 3c bb              stsp16	[sp+0xbb], r4
 f0 3d bd              stsp16	[sp+0xbd], r5
 c4 7e 7e              ldi16	r4, 0x7e7e
 f0 3c b9              stsp16	[sp+0xb9], r4
 c4 7e 7e              ldi16	r4, 0x7e7e
 c5 7e 7e              ldi16	r5, 0x7e7e
 f0 3c b5              stsp16	[sp+0xb5], r4
 f0 3d b7              stsp16	[sp+0xb7], r5
 c0 3c                 ldi8	r4, 0x3c
 f0 2c b4              stsp8	[sp+0xb4], r4
 c4 3c 3c              ldi16	r4, 0x3c3c
 c5 3c 3c              ldi16	r5, 0x3c3c
 f0 3c b0              stsp16	[sp+0xb0], r4
 f0 3d b2              stsp16	[sp+0xb2], r5
 d6 fe                 adjsp	-0x2
 c0 08                 ldi8	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 c6 ca 10              ldi16	r6, 0x10ca
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 c4              leasp	r4, 0xc4
 e1 79 ff              call16	test_call_strncpy_P
 d6 02                 adjsp	0x2
 c6 ce 10              ldi16	r6, 0x10ce
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 d6 fe                 adjsp	-0x2
 c0 03                 ldi8	r4, 0x3
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 bd              leasp	r4, 0xbd
 e1 64 ff              call16	test_call_strncpy_P
 d6 02                 adjsp	0x2
 c6 d5 10              ldi16	r6, 0x10d5
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 d6 fe                 adjsp	-0x2
 f0 02 04              ldi8	r2, 0x4
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 14 b7              leasp	r4, 0xb7
 e1 4d ff              call16	test_call_strncpy_P
 d6 02                 adjsp	0x2
 c6 d9 10              ldi16	r6, 0x10d9
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 d6 fe                 adjsp	-0x2
 f2 39                 sub	r1, r1
 f0 39 00              stsp16	[sp+0x0], r1
 f0 14 b2              leasp	r4, 0xb2
 e1 37 ff              call16	test_call_strncpy_P
 d6 02                 adjsp	0x2
 c2 0c                 ldi8	r6, 0xc
 c5 00 01              ldi16	r5, 0x100
 f0 13 a4              leasp	r3, 0xa4
 f1 23                 mov	r4, r3
 d7 0f                 sys	memcpy
 c5 0c 01              ldi16	r5, 0x10c
 f0 10 98              leasp	r0, 0x98
 f1 20                 mov	r4, r0
 d7 0f                 sys	memcpy
 c4 69 63              ldi16	r4, 0x6369
 c1 65                 ldi8	r5, 0x65
 f0 3c 90              stsp16	[sp+0x90], r4
 f0 3d 92              stsp16	[sp+0x92], r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 94              stsp16	[sp+0x94], r4
 f0 3d 96              stsp16	[sp+0x96], r5
 c6 6f 61              ldi16	r6, 0x616f
 c3 6b                 ldi8	r7, 0x6b
 f0 3e 88              stsp16	[sp+0x88], r6
 f0 3f 8a              stsp16	[sp+0x8a], r7
 f0 3c 8c              stsp16	[sp+0x8c], r4
 f0 3d 8e              stsp16	[sp+0x8e], r5
 f0 3c 84              stsp16	[sp+0x84], r4
 f0 3d 86              stsp16	[sp+0x86], r5
 f0 3c 80              stsp16	[sp+0x80], r4
 f0 3d 82              stsp16	[sp+0x82], r5
 d6 fe                 adjsp	-0x2
 c0 08                 ldi8	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 c6 e1 10              ldi16	r6, 0x10e1
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 23                 mov	r4, r3
 e1 ea fe              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 d6 fe                 adjsp	-0x2
 c0 03                 ldi8	r4, 0x3
 f4 40                 stsp16	[sp+0x0], r4
 c6 e6 10              ldi16	r6, 0x10e6
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 e1 d6 fe              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 d6 fe                 adjsp	-0x2
 f0 39 00              stsp16	[sp+0x0], r1
 c6 ed 10              ldi16	r6, 0x10ed
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 92              leasp	r4, 0x92
 e1 c2 fe              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 d6 fe                 adjsp	-0x2
 f0 3a 00              stsp16	[sp+0x0], r2
 c6 f2 10              ldi16	r6, 0x10f2
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 8a              leasp	r4, 0x8a
 e1 ae fe              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 d6 fe                 adjsp	-0x2
 f0 00 02              ldi8	r0, 0x2
 f0 38 00              stsp16	[sp+0x0], r0
 f0 06 f3 10           ldi16	r2, 0x10f3
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 f0 14 82              leasp	r4, 0x82
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
 c6 f6 10              ldi16	r6, 0x10f6
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
 c4 1f 02              ldi16	r4, 0x21f
 f0 3c 6a              stsp16	[sp+0x6a], r4
 f2 6b                 mov32	q3, q1
 e1 24 fe              call16	test_call_strncat_P
 d6 02                 adjsp	0x2
 c5 2b 6d              ldi16	r5, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 02 0e              ldi8	r2, 0xe
 f0 14 a4              leasp	r4, 0xa4
 f0 1e b4              ldsp8u	r6, [sp+0xb4]
 f0 3e 54              stsp16	[sp+0x54], r6
 f0 1e b3              ldsp8u	r6, [sp+0xb3]
 f0 3e 4a              stsp16	[sp+0x4a], r6
 f0 1e b2              ldsp8u	r6, [sp+0xb2]
 f0 3e 22              stsp16	[sp+0x22], r6
 f0 1e b1              ldsp8u	r6, [sp+0xb1]
 f0 3e 20              stsp16	[sp+0x20], r6
 f0 1e b0              ldsp8u	r6, [sp+0xb0]
 f0 3e 7c              stsp16	[sp+0x7c], r6
 f0 1e ba              ldsp8u	r6, [sp+0xba]
 f0 3e 5a              stsp16	[sp+0x5a], r6
 f0 1e b9              ldsp8u	r6, [sp+0xb9]
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 1e b8              ldsp8u	r6, [sp+0xb8]
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 1e b7              ldsp8u	r6, [sp+0xb7]
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 1e b6              ldsp8u	r6, [sp+0xb6]
 f4 72                 stsp16	[sp+0xc], r6
 f0 1e b5              ldsp8u	r6, [sp+0xb5]
 f0 3e 78              stsp16	[sp+0x78], r6
 f0 1e c1              ldsp8u	r6, [sp+0xc1]
 f0 3e 5e              stsp16	[sp+0x5e], r6
 f0 1e c0              ldsp8u	r6, [sp+0xc0]
 f4 62                 stsp16	[sp+0x8], r6
 f0 1e bf              ldsp8u	r6, [sp+0xbf]
 f4 5a                 stsp16	[sp+0x6], r6
 f0 1e be              ldsp8u	r6, [sp+0xbe]
 f4 52                 stsp16	[sp+0x4], r6
 f0 1e bd              ldsp8u	r6, [sp+0xbd]
 f4 4a                 stsp16	[sp+0x2], r6
 f0 1e bc              ldsp8u	r6, [sp+0xbc]
 f4 42                 stsp16	[sp+0x0], r6
 f0 1e bb              ldsp8u	r6, [sp+0xbb]
 f0 3e 70              stsp16	[sp+0x70], r6
 f0 1e cb              ldsp8u	r6, [sp+0xcb]
 f0 3e 56              stsp16	[sp+0x56], r6
 f0 1e ca              ldsp8u	r6, [sp+0xca]
 f0 3e 52              stsp16	[sp+0x52], r6
 f0 1e c9              ldsp8u	r6, [sp+0xc9]
 f0 3e 4e              stsp16	[sp+0x4e], r6
 f0 1e c8              ldsp8u	r6, [sp+0xc8]
 f0 3e 4c              stsp16	[sp+0x4c], r6
 f0 1e c7              ldsp8u	r6, [sp+0xc7]
 f0 3e 48              stsp16	[sp+0x48], r6
 f0 1e c6              ldsp8u	r6, [sp+0xc6]
 f0 3e 46              stsp16	[sp+0x46], r6
 f0 1e c5              ldsp8u	r6, [sp+0xc5]
 f0 3e 44              stsp16	[sp+0x44], r6
 f0 1e c4              ldsp8u	r6, [sp+0xc4]
 f0 3e 42              stsp16	[sp+0x42], r6
 f0 1e c3              ldsp8u	r6, [sp+0xc3]
 f0 3e 40              stsp16	[sp+0x40], r6
 f0 1e c2              ldsp8u	r6, [sp+0xc2]
 f0 3e 50              stsp16	[sp+0x50], r6
 f0 00 be              ldi8	r0, 0xbe
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 f7 06                 ld8u	r6, [r4+]
 a9                    xor	r6, r5
 f0 0a ef              addi.s8	r2, -0x11
 cb 11                 addi.s8	r7, 0x11
 07                    mov	r5, r7
 16                    add	r5, r6
 f5 2c                 cmp	r7, r0
 d1 ec                 brne8	avm_test_main+642
 f0 3a 66              stsp16	[sp+0x66], r2
 f0 3e 7a              stsp16	[sp+0x7a], r6
 1e                    add	r7, r6
 f0 3f 5c              stsp16	[sp+0x5c], r7
 c5 2b 6d              ldi16	r5, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 03 0e              ldi8	r3, 0xe
 f0 14 98              leasp	r4, 0x98
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 f7 06                 ld8u	r6, [r4+]
 a9                    xor	r6, r5
 f0 0b ef              addi.s8	r3, -0x11
 cb 11                 addi.s8	r7, 0x11
 07                    mov	r5, r7
 16                    add	r5, r6
 f5 2c                 cmp	r7, r0
 d1 ec                 brne8	avm_test_main+684
 f0 3e 72              stsp16	[sp+0x72], r6
 1e                    add	r7, r6
 f0 3f 58              stsp16	[sp+0x58], r7
 c5 2b 6d              ldi16	r5, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 02 0e              ldi8	r2, 0xe
 f0 1c 87              ldsp8u	r4, [sp+0x87]
 f0 3c 3c              stsp16	[sp+0x3c], r4
 f0 1c 86              ldsp8u	r4, [sp+0x86]
 f0 3c 3a              stsp16	[sp+0x3a], r4
 f0 1c 85              ldsp8u	r4, [sp+0x85]
 f0 3c 38              stsp16	[sp+0x38], r4
 f0 1c 84              ldsp8u	r4, [sp+0x84]
 f0 3c 36              stsp16	[sp+0x36], r4
 f0 1c 83              ldsp8u	r4, [sp+0x83]
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 1c 82              ldsp8u	r4, [sp+0x82]
 f0 3c 32              stsp16	[sp+0x32], r4
 f0 1c 81              ldsp8u	r4, [sp+0x81]
 f0 3c 30              stsp16	[sp+0x30], r4
 f0 1e 80              ldsp8u	r6, [sp+0x80]
 f0 3e 76              stsp16	[sp+0x76], r6
 f0 1c 8f              ldsp8u	r4, [sp+0x8f]
 f0 3c 3e              stsp16	[sp+0x3e], r4
 f0 1c 8e              ldsp8u	r4, [sp+0x8e]
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 1c 8d              ldsp8u	r4, [sp+0x8d]
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 1c 8c              ldsp8u	r4, [sp+0x8c]
 f0 3c 2a              stsp16	[sp+0x2a], r4
 f0 1c 8b              ldsp8u	r4, [sp+0x8b]
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 1c 8a              ldsp8u	r4, [sp+0x8a]
 f0 3c 26              stsp16	[sp+0x26], r4
 f0 1c 89              ldsp8u	r4, [sp+0x89]
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 1e 88              ldsp8u	r6, [sp+0x88]
 f0 3e 6e              stsp16	[sp+0x6e], r6
 f0 1c 97              ldsp8u	r4, [sp+0x97]
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 1c 96              ldsp8u	r4, [sp+0x96]
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 1c 95              ldsp8u	r4, [sp+0x95]
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 1c 94              ldsp8u	r4, [sp+0x94]
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 1c 93              ldsp8u	r4, [sp+0x93]
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 1c 92              ldsp8u	r4, [sp+0x92]
 f4 78                 stsp16	[sp+0xe], r4
 f0 1c 91              ldsp8u	r4, [sp+0x91]
 f4 68                 stsp16	[sp+0xa], r4
 f0 1e 90              ldsp8u	r6, [sp+0x90]
 f0 3e 6c              stsp16	[sp+0x6c], r6
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 f0 6c 03              ld8u	r0, [r1+]
 f9 16                 xor	r0, r5
 f0 0a ef              addi.s8	r2, -0x11
 cb 11                 addi.s8	r7, 0x11
 07                    mov	r5, r7
 f2 24                 add	r5, r0
 c6 69 11              ldi16	r6, 0x1169
 3e                    cmp	r7, r6
 d1 e7                 brne8	avm_test_main+862
 f0 38 74              stsp16	[sp+0x74], r0
 f2 2c                 add	r7, r0
 f0 3f 6a              stsp16	[sp+0x6a], r7
 c7 2b 6d              ldi16	r7, 0x6d2b
 c5 f2 ff              ldi16	r5, 0xfff2
 f0 3d 7e              stsp16	[sp+0x7e], r5
 f0 00 0e              ldi8	r0, 0xe
 f0 35 68              ldsp16	r5, [sp+0x68]
 0b                    mov	r6, r7
 fa 9b                 lsr16i	r6, 0xb
 fa 65                 lsl16i	r7, 0x5
 9e                    or	r7, r6
 f7 09                 ld8u	r1, [r5+]
 f9 3e                 xor	r1, r7
 f0 08 ef              addi.s8	r0, -0x11
 f0 34 7e              ldsp16	r4, [sp+0x7e]
 c8 11                 addi.s8	r4, 0x11
 0c                    mov	r7, r4
 f2 2d                 add	r7, r1
 c6 e0 11              ldi16	r6, 0x11e0
 f0 3c 7e              stsp16	[sp+0x7e], r4
 32                    cmp	r4, r6
 d1 e2                 brne8	avm_test_main+910
 f0 37 7a              ldsp16	r7, [sp+0x7a]
 f0 34 66              ldsp16	r4, [sp+0x66]
 2c                    sub	r7, r4
 f0 3f 7a              stsp16	[sp+0x7a], r7
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 c0 30                 ldi8	r4, 0x30
 06                    mov	r5, r6
 94                    or	r5, r4
 ca 37                 addi.s8	r6, 0x37
 c0 a0                 ldi8	r4, 0xa0
 3c                    cmp	r7, r4
 fc 35                 cmov.ult	r6, r5
 f0 3e 60              stsp16	[sp+0x60], r6
 f0 36 72              ldsp16	r6, [sp+0x72]
 f2 5b                 sub	r6, r3
 f0 3e 72              stsp16	[sp+0x72], r6
 f1 76                 zext8	r6
 0e                    mov	r7, r6
 fa a4                 lsr16i	r7, 0x4
 07                    mov	r5, r7
 f0 03 30              ldi8	r3, 0x30
 f9 ad                 or	r5, r3
 cb 37                 addi.s8	r7, 0x37
 38                    cmp	r6, r4
 fc 3d                 cmov.ult	r7, r5
 f0 3f 62              stsp16	[sp+0x62], r7
 f0 34 74              ldsp16	r4, [sp+0x74]
 f2 52                 sub	r4, r2
 f0 3c 74              stsp16	[sp+0x74], r4
 f1 74                 zext8	r4
 0c                    mov	r7, r4
 fa a4                 lsr16i	r7, 0x4
 0b                    mov	r6, r7
 f9 cd                 or	r6, r3
 cb 37                 addi.s8	r7, 0x37
 f0 02 a0              ldi8	r2, 0xa0
 f5 22                 cmp	r4, r2
 fc 3e                 cmov.ult	r7, r6
 f0 3f 64              stsp16	[sp+0x64], r7
 f1 21                 mov	r4, r1
 f2 50                 sub	r4, r0
 f0 3c 68              stsp16	[sp+0x68], r4
 f1 74                 zext8	r4
 0c                    mov	r7, r4
 fa a4                 lsr16i	r7, 0x4
 07                    mov	r5, r7
 f9 ad                 or	r5, r3
 cb 37                 addi.s8	r7, 0x37
 f5 22                 cmp	r4, r2
 f1 02                 mov	r0, r2
 fc 3d                 cmov.ult	r7, r5
 f0 3f 66              stsp16	[sp+0x66], r7
 f0 06 6d 05           ldi16	r2, 0x56d
 f0 35 70              ldsp16	r5, [sp+0x70]
 f9 aa                 xor	r5, r2
 fa 45                 lsl16i	r5, 0x5
 c9 74                 addi.s8	r5, 0x74
 f4 00                 ldsp16	r4, [sp+0x0]
 a4                    xor	r5, r4
 c9 14                 addi.s8	r5, 0x14
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 a4                    xor	r5, r4
 c9 25                 addi.s8	r5, 0x25
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 a4                    xor	r5, r4
 c9 36                 addi.s8	r5, 0x36
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 a4                    xor	r5, r4
 c9 47                 addi.s8	r5, 0x47
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 a4                    xor	r5, r4
 c9 58                 addi.s8	r5, 0x58
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 5e              ldsp16	r4, [sp+0x5e]
 a4                    xor	r5, r4
 c9 69                 addi.s8	r5, 0x69
 f0 3d 70              stsp16	[sp+0x70], r5
 0d                    mov	r7, r5
 f1 77                 zext8	r7
 f5 2c                 cmp	r7, r0
 fa a4                 lsr16i	r7, 0x4
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 5e              stsp16	[sp+0x5e], r7
 f0 35 78              ldsp16	r5, [sp+0x78]
 f9 aa                 xor	r5, r2
 fa 45                 lsl16i	r5, 0x5
 c9 74                 addi.s8	r5, 0x74
 f4 30                 ldsp16	r4, [sp+0xc]
 a4                    xor	r5, r4
 c9 14                 addi.s8	r5, 0x14
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 a4                    xor	r5, r4
 c9 25                 addi.s8	r5, 0x25
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 a4                    xor	r5, r4
 c9 36                 addi.s8	r5, 0x36
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 18              ldsp16	r4, [sp+0x18]
 a4                    xor	r5, r4
 c9 47                 addi.s8	r5, 0x47
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 5a              ldsp16	r4, [sp+0x5a]
 a4                    xor	r5, r4
 c9 58                 addi.s8	r5, 0x58
 f0 3d 78              stsp16	[sp+0x78], r5
 0d                    mov	r7, r5
 f1 77                 zext8	r7
 f5 2c                 cmp	r7, r0
 fa a4                 lsr16i	r7, 0x4
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 5a              stsp16	[sp+0x5a], r7
 f0 35 7c              ldsp16	r5, [sp+0x7c]
 f9 aa                 xor	r5, r2
 fa 45                 lsl16i	r5, 0x5
 c9 74                 addi.s8	r5, 0x74
 f0 34 20              ldsp16	r4, [sp+0x20]
 a4                    xor	r5, r4
 c9 14                 addi.s8	r5, 0x14
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 22              ldsp16	r4, [sp+0x22]
 a4                    xor	r5, r4
 c9 25                 addi.s8	r5, 0x25
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 4a              ldsp16	r4, [sp+0x4a]
 a4                    xor	r5, r4
 c9 36                 addi.s8	r5, 0x36
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 54              ldsp16	r4, [sp+0x54]
 a4                    xor	r5, r4
 c9 47                 addi.s8	r5, 0x47
 f0 3d 7c              stsp16	[sp+0x7c], r5
 09                    mov	r6, r5
 f1 76                 zext8	r6
 f5 28                 cmp	r6, r0
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 54              stsp16	[sp+0x54], r6
 f0 35 6c              ldsp16	r5, [sp+0x6c]
 f9 aa                 xor	r5, r2
 fa 45                 lsl16i	r5, 0x5
 c9 74                 addi.s8	r5, 0x74
 f4 28                 ldsp16	r4, [sp+0xa]
 a4                    xor	r5, r4
 c9 14                 addi.s8	r5, 0x14
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f4 38                 ldsp16	r4, [sp+0xe]
 a4                    xor	r5, r4
 c9 25                 addi.s8	r5, 0x25
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 a4                    xor	r5, r4
 c9 36                 addi.s8	r5, 0x36
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 16              ldsp16	r4, [sp+0x16]
 a4                    xor	r5, r4
 c9 47                 addi.s8	r5, 0x47
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 a4                    xor	r5, r4
 c9 58                 addi.s8	r5, 0x58
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 a4                    xor	r5, r4
 c9 69                 addi.s8	r5, 0x69
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 a4                    xor	r5, r4
 c9 7a                 addi.s8	r5, 0x7a
 f0 3d 6c              stsp16	[sp+0x6c], r5
 09                    mov	r6, r5
 f1 76                 zext8	r6
 f5 28                 cmp	r6, r0
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 4a              stsp16	[sp+0x4a], r6
 f0 35 6e              ldsp16	r5, [sp+0x6e]
 f9 aa                 xor	r5, r2
 fa 45                 lsl16i	r5, 0x5
 c9 74                 addi.s8	r5, 0x74
 f0 34 24              ldsp16	r4, [sp+0x24]
 a4                    xor	r5, r4
 c9 14                 addi.s8	r5, 0x14
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 26              ldsp16	r4, [sp+0x26]
 a4                    xor	r5, r4
 c9 25                 addi.s8	r5, 0x25
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 28              ldsp16	r4, [sp+0x28]
 a4                    xor	r5, r4
 c9 36                 addi.s8	r5, 0x36
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 a4                    xor	r5, r4
 c9 47                 addi.s8	r5, 0x47
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 a4                    xor	r5, r4
 c9 58                 addi.s8	r5, 0x58
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 a4                    xor	r5, r4
 c9 69                 addi.s8	r5, 0x69
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 a4                    xor	r5, r4
 c9 7a                 addi.s8	r5, 0x7a
 f0 3d 6e              stsp16	[sp+0x6e], r5
 09                    mov	r6, r5
 f1 76                 zext8	r6
 f5 28                 cmp	r6, r0
 fa 94                 lsr16i	r6, 0x4
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 3e              stsp16	[sp+0x3e], r6
 f0 35 76              ldsp16	r5, [sp+0x76]
 f9 aa                 xor	r5, r2
 fa 45                 lsl16i	r5, 0x5
 c9 74                 addi.s8	r5, 0x74
 f0 34 30              ldsp16	r4, [sp+0x30]
 a4                    xor	r5, r4
 c9 14                 addi.s8	r5, 0x14
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 32              ldsp16	r4, [sp+0x32]
 a4                    xor	r5, r4
 c9 25                 addi.s8	r5, 0x25
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 34              ldsp16	r4, [sp+0x34]
 a4                    xor	r5, r4
 c9 36                 addi.s8	r5, 0x36
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 36              ldsp16	r4, [sp+0x36]
 a4                    xor	r5, r4
 c9 47                 addi.s8	r5, 0x47
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 38              ldsp16	r4, [sp+0x38]
 a4                    xor	r5, r4
 c9 58                 addi.s8	r5, 0x58
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 a4                    xor	r5, r4
 c9 69                 addi.s8	r5, 0x69
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 a4                    xor	r5, r4
 c9 7a                 addi.s8	r5, 0x7a
 f0 3d 76              stsp16	[sp+0x76], r5
 f1 75                 zext8	r5
 f5 24                 cmp	r5, r0
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 3c              stsp16	[sp+0x3c], r5
 f0 35 50              ldsp16	r5, [sp+0x50]
 f9 aa                 xor	r5, r2
 fa 45                 lsl16i	r5, 0x5
 c9 74                 addi.s8	r5, 0x74
 f0 34 40              ldsp16	r4, [sp+0x40]
 a4                    xor	r5, r4
 c9 14                 addi.s8	r5, 0x14
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 42              ldsp16	r4, [sp+0x42]
 a4                    xor	r5, r4
 c9 25                 addi.s8	r5, 0x25
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 44              ldsp16	r4, [sp+0x44]
 a4                    xor	r5, r4
 c9 36                 addi.s8	r5, 0x36
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 46              ldsp16	r4, [sp+0x46]
 a4                    xor	r5, r4
 c9 47                 addi.s8	r5, 0x47
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 48              ldsp16	r4, [sp+0x48]
 a4                    xor	r5, r4
 c9 58                 addi.s8	r5, 0x58
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 4c              ldsp16	r4, [sp+0x4c]
 a4                    xor	r5, r4
 c9 69                 addi.s8	r5, 0x69
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 4e              ldsp16	r4, [sp+0x4e]
 a4                    xor	r5, r4
 c9 7a                 addi.s8	r5, 0x7a
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 52              ldsp16	r4, [sp+0x52]
 a4                    xor	r5, r4
 c0 8b                 ldi8	r4, 0x8b
 11                    add	r4, r5
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 35 56              ldsp16	r5, [sp+0x56]
 a1                    xor	r4, r5
 c1 9c                 ldi8	r5, 0x9c
 14                    add	r5, r4
 f0 3d 48              stsp16	[sp+0x48], r5
 f1 75                 zext8	r5
 f5 24                 cmp	r5, r0
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 4c              stsp16	[sp+0x4c], r5
 f0 35 5c              ldsp16	r5, [sp+0x5c]
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f0 00 0f              ldi8	r0, 0xf
 f9 c0                 and	r6, r0
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 56              stsp16	[sp+0x56], r6
 09                    mov	r6, r5
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ca 37                 addi.s8	r6, 0x37
 c7 00 a0              ldi16	r7, 0xa000
 37                    cmp	r5, r7
 fc 34                 cmov.ult	r6, r4
 f0 3e 52              stsp16	[sp+0x52], r6
 f0 35 72              ldsp16	r5, [sp+0x72]
 f9 a0                 and	r5, r0
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 72              stsp16	[sp+0x72], r5
 f0 36 58              ldsp16	r6, [sp+0x58]
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f9 a0                 and	r5, r0
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 50              stsp16	[sp+0x50], r5
 f0 35 7a              ldsp16	r5, [sp+0x7a]
 f9 a0                 and	r5, r0
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 7a              stsp16	[sp+0x7a], r5
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 3b                    cmp	r6, r7
 fc 2c                 cmov.ult	r5, r4
 f0 3d 4e              stsp16	[sp+0x4e], r5
 f0 35 68              ldsp16	r5, [sp+0x68]
 f9 a0                 and	r5, r0
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 68              stsp16	[sp+0x68], r5
 f0 35 7e              ldsp16	r5, [sp+0x7e]
 f2 25                 add	r5, r1
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f9 c0                 and	r6, r0
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 7e              stsp16	[sp+0x7e], r6
 09                    mov	r6, r5
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ca 37                 addi.s8	r6, 0x37
 37                    cmp	r5, r7
 fc 34                 cmov.ult	r6, r4
 f0 3e 5c              stsp16	[sp+0x5c], r6
 f0 35 74              ldsp16	r5, [sp+0x74]
 f9 a0                 and	r5, r0
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 74              stsp16	[sp+0x74], r5
 f0 36 6a              ldsp16	r6, [sp+0x6a]
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f9 a0                 and	r5, r0
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 58              stsp16	[sp+0x58], r5
 3b                    cmp	r6, r7
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 6a              stsp16	[sp+0x6a], r6
 f0 35 70              ldsp16	r5, [sp+0x70]
 09                    mov	r6, r5
 f9 c0                 and	r6, r0
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 42              stsp16	[sp+0x42], r6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f9 c0                 and	r6, r0
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 3a              stsp16	[sp+0x3a], r6
 37                    cmp	r5, r7
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 70              stsp16	[sp+0x70], r5
 f0 35 78              ldsp16	r5, [sp+0x78]
 09                    mov	r6, r5
 f9 c0                 and	r6, r0
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 40              stsp16	[sp+0x40], r6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f9 c0                 and	r6, r0
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 34              stsp16	[sp+0x34], r6
 37                    cmp	r5, r7
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 78              stsp16	[sp+0x78], r5
 f0 35 7c              ldsp16	r5, [sp+0x7c]
 09                    mov	r6, r5
 f9 c0                 and	r6, r0
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 36              stsp16	[sp+0x36], r6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f9 c0                 and	r6, r0
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 30              stsp16	[sp+0x30], r6
 37                    cmp	r5, r7
 0b                    mov	r6, r7
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 7c              stsp16	[sp+0x7c], r5
 f0 37 76              ldsp16	r7, [sp+0x76]
 07                    mov	r5, r7
 f9 a0                 and	r5, r0
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 46              stsp16	[sp+0x46], r5
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f9 a0                 and	r5, r0
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 44              stsp16	[sp+0x44], r5
 3e                    cmp	r7, r6
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 76              stsp16	[sp+0x76], r7
 f0 35 6e              ldsp16	r5, [sp+0x6e]
 0d                    mov	r7, r5
 f9 e0                 and	r7, r0
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 38              stsp16	[sp+0x38], r7
 0d                    mov	r7, r5
 fa a8                 lsr16i	r7, 0x8
 f9 e0                 and	r7, r0
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 32              stsp16	[sp+0x32], r7
 36                    cmp	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 6e              stsp16	[sp+0x6e], r5
 f0 35 6c              ldsp16	r5, [sp+0x6c]
 0d                    mov	r7, r5
 f9 e0                 and	r7, r0
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 2e              stsp16	[sp+0x2e], r7
 0d                    mov	r7, r5
 fa a8                 lsr16i	r7, 0x8
 f9 e0                 and	r7, r0
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 2c              stsp16	[sp+0x2c], r7
 36                    cmp	r5, r6
 f1 16                 mov	r2, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 6c              stsp16	[sp+0x6c], r5
 f0 35 48              ldsp16	r5, [sp+0x48]
 0d                    mov	r7, r5
 f9 e0                 and	r7, r0
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 09                    mov	r6, r5
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ca 37                 addi.s8	r6, 0x37
 f5 26                 cmp	r5, r2
 fc 34                 cmov.ult	r6, r4
 fa 88                 lsr16i	r5, 0x8
 f9 a0                 and	r5, r0
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 c0 52                 ldi8	r4, 0x52
 d7 00                 sys	debug_putc
 f0 00 46              ldi8	r0, 0x46
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f0 02 3d              ldi8	r2, 0x3d
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 c0 37                 ldi8	r4, 0x37
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f0 03 0a              ldi8	r3, 0xa
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 f0 01 4e              ldi8	r1, 0x4e
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 c0 50                 ldi8	r4, 0x50
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 4c              ldsp16	r4, [sp+0x4c]
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 c3 54                 ldi8	r7, 0x54
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f0 34 70              ldsp16	r4, [sp+0x70]
 d7 00                 sys	debug_putc
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 d7 00                 sys	debug_putc
 f0 34 5e              ldsp16	r4, [sp+0x5e]
 d7 00                 sys	debug_putc
 f0 34 42              ldsp16	r4, [sp+0x42]
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 c1 45                 ldi8	r5, 0x45
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f0 34 78              ldsp16	r4, [sp+0x78]
 d7 00                 sys	debug_putc
 f0 34 34              ldsp16	r4, [sp+0x34]
 d7 00                 sys	debug_putc
 f0 34 5a              ldsp16	r4, [sp+0x5a]
 d7 00                 sys	debug_putc
 f0 34 40              ldsp16	r4, [sp+0x40]
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 f0 00 5a              ldi8	r0, 0x5a
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f0 34 7c              ldsp16	r4, [sp+0x7c]
 d7 00                 sys	debug_putc
 f0 34 30              ldsp16	r4, [sp+0x30]
 d7 00                 sys	debug_putc
 f0 34 54              ldsp16	r4, [sp+0x54]
 d7 00                 sys	debug_putc
 f0 34 36              ldsp16	r4, [sp+0x36]
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 c2 43                 ldi8	r6, 0x43
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f0 34 52              ldsp16	r4, [sp+0x52]
 d7 00                 sys	debug_putc
 f0 34 56              ldsp16	r4, [sp+0x56]
 d7 00                 sys	debug_putc
 f0 34 60              ldsp16	r4, [sp+0x60]
 d7 00                 sys	debug_putc
 f0 34 7a              ldsp16	r4, [sp+0x7a]
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f0 34 4e              ldsp16	r4, [sp+0x4e]
 d7 00                 sys	debug_putc
 f0 34 50              ldsp16	r4, [sp+0x50]
 d7 00                 sys	debug_putc
 f0 34 62              ldsp16	r4, [sp+0x62]
 d7 00                 sys	debug_putc
 f0 34 72              ldsp16	r4, [sp+0x72]
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f0 34 6c              ldsp16	r4, [sp+0x6c]
 d7 00                 sys	debug_putc
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 d7 00                 sys	debug_putc
 f0 34 4a              ldsp16	r4, [sp+0x4a]
 d7 00                 sys	debug_putc
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f0 34 6e              ldsp16	r4, [sp+0x6e]
 d7 00                 sys	debug_putc
 f0 34 32              ldsp16	r4, [sp+0x32]
 d7 00                 sys	debug_putc
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 d7 00                 sys	debug_putc
 f0 34 38              ldsp16	r4, [sp+0x38]
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 c0 44                 ldi8	r4, 0x44
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f0 34 76              ldsp16	r4, [sp+0x76]
 d7 00                 sys	debug_putc
 f0 34 44              ldsp16	r4, [sp+0x44]
 d7 00                 sys	debug_putc
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 d7 00                 sys	debug_putc
 f0 34 46              ldsp16	r4, [sp+0x46]
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 c1 4c                 ldi8	r5, 0x4c
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 50                 ldi8	r4, 0x50
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f0 34 6a              ldsp16	r4, [sp+0x6a]
 d7 00                 sys	debug_putc
 f0 34 58              ldsp16	r4, [sp+0x58]
 d7 00                 sys	debug_putc
 f0 34 64              ldsp16	r4, [sp+0x64]
 d7 00                 sys	debug_putc
 f0 34 74              ldsp16	r4, [sp+0x74]
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f0 34 5c              ldsp16	r4, [sp+0x5c]
 d7 00                 sys	debug_putc
 f0 34 7e              ldsp16	r4, [sp+0x7e]
 d7 00                 sys	debug_putc
 f0 34 66              ldsp16	r4, [sp+0x66]
 d7 00                 sys	debug_putc
 f0 34 68              ldsp16	r4, [sp+0x68]
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
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
 d1 f0                 brne8	avm_test_main+2736
 c0 09                 ldi8	r4, 0x9
 f0 05 2d 03           ldi16	r1, 0x32d
 f0 17 c2              leasp	r7, 0xc2
 f0 45 23 03           ldm8u	r5, [0x323]
 f0 3d 76              stsp16	[sp+0x76], r5
 f0 45 22 03           ldm8u	r5, [0x322]
 f0 3d 7c              stsp16	[sp+0x7c], r5
 f0 45 21 03           ldm8u	r5, [0x321]
 f0 3d 7a              stsp16	[sp+0x7a], r5
 f0 45 20 03           ldm8u	r5, [0x320]
 f0 3d 78              stsp16	[sp+0x78], r5
 f0 45 1e 02           ldm8u	r5, [0x21e]
 f0 3d 7e              stsp16	[sp+0x7e], r5
 f0 45 1d 02           ldm8u	r5, [0x21d]
 f0 3d 72              stsp16	[sp+0x72], r5
 f0 45 1c 02           ldm8u	r5, [0x21c]
 f0 3d 74              stsp16	[sp+0x74], r5
 f0 00 01              ldi8	r0, 0x1
 f0 6c 63              ld8u	r3, [r1+]
 f7 1a                 ld8u	r2, [r7+]
 f6 2c                 tst16	r4
 f8 0d                 cset.ne	r5
 f5 13                 cmp	r2, r3
 d1 08                 brne8	avm_test_main+2834
 f4 b4                 dec16	r4
 f9 a0                 and	r5, r0
 f4 a5                 tst8	r5
 d1 eb                 brne8	avm_test_main+2813
 c0 01                 ldi8	r4, 0x1
 f0 37 7e              ldsp16	r7, [sp+0x7e]
 f1 77                 zext8	r7
 c1 a5                 ldi8	r5, 0xa5
 3d                    cmp	r7, r5
 f8 05                 cset.eq	r5
 f5 13                 cmp	r2, r3
 db 6c 01              brne16	avm_test_main+3215
 f0 3d 70              stsp16	[sp+0x70], r5
 f0 3e 7e              stsp16	[sp+0x7e], r6
 c2 06                 ldi8	r6, 0x6
 c7 37 03              ldi16	r7, 0x337
 f0 13 bb              leasp	r3, 0xbb
 f0 01 01              ldi8	r1, 0x1
 f7 1d                 ld8u	r5, [r7+]
 f0 6c 47              ld8u	r2, [r3+]
 f6 2e                 tst16	r6
 f8 08                 cset.ne	r0
 f5 15                 cmp	r2, r5
 d1 08                 brne8	avm_test_main+2889
 f4 b6                 dec16	r6
 f9 04                 and	r0, r1
 f4 a0                 tst8	r0
 d1 eb                 brne8	avm_test_main+2868
 f5 15                 cmp	r2, r5
 db 41 01              brne16	avm_test_main+3215
 c2 05                 ldi8	r6, 0x5
 f0 07 3e 03           ldi16	r3, 0x33e
 f0 11 b5              leasp	r1, 0xb5
 c3 01                 ldi8	r7, 0x1
 f0 6c 47              ld8u	r2, [r3+]
 f0 6c 03              ld8u	r0, [r1+]
 f6 2e                 tst16	r6
 f8 0d                 cset.ne	r5
 f5 02                 cmp	r0, r2
 d1 07                 brne8	avm_test_main+2926
 f4 b6                 dec16	r6
 87                    and	r5, r7
 f4 a5                 tst8	r5
 d1 eb                 brne8	avm_test_main+2905
 f5 02                 cmp	r0, r2
 db 1c 01              brne16	avm_test_main+3215
 f0 11 b0              leasp	r1, 0xb0
 c1 04                 ldi8	r5, 0x4
 c2 01                 ldi8	r6, 0x1
 f0 6c 03              ld8u	r0, [r1+]
 f6 2d                 tst16	r5
 f8 0f                 cset.ne	r7
 f0 0c 3c              cmpi.s8	r0, 0x3c
 d1 07                 brne8	avm_test_main+2957
 f4 b5                 dec16	r5
 8e                    and	r7, r6
 f4 a7                 tst8	r7
 d1 ed                 brne8	avm_test_main+2938
 f0 1d a4              ldsp8u	r5, [sp+0xa4]
 f0 0c 3c              cmpi.s8	r0, 0x3c
 db f9 00              brne16	avm_test_main+3215
 f1 75                 zext8	r5
 cd 72                 cmpi.s8	r5, 0x72
 db f2 00              brne16	avm_test_main+3215
 c3 72                 ldi8	r7, 0x72
 c5 45 03              ldi16	r5, 0x345
 f0 16 a4              leasp	r6, 0xa4
 f0 31 7e              ldsp16	r1, [sp+0x7e]
 f4 a7                 tst8	r7
 d0 0e                 breq8	avm_test_main+3002
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+2984
 e0 d5 00              jmp16	avm_test_main+3215
 f0 1d 98              ldsp8u	r5, [sp+0x98]
 cd 73                 cmpi.s8	r5, 0x73
 db cd 00              brne16	avm_test_main+3215
 c3 73                 ldi8	r7, 0x73
 c5 4d 03              ldi16	r5, 0x34d
 f0 16 98              leasp	r6, 0x98
 f4 a7                 tst8	r7
 d0 0e                 breq8	avm_test_main+3036
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+3018
 e0 b3 00              jmp16	avm_test_main+3215
 f0 1d 90              ldsp8u	r5, [sp+0x90]
 cd 69                 cmpi.s8	r5, 0x69
 db ab 00              brne16	avm_test_main+3215
 c3 69                 ldi8	r7, 0x69
 c5 54 03              ldi16	r5, 0x354
 f0 16 90              leasp	r6, 0x90
 f4 a7                 tst8	r7
 d0 0e                 breq8	avm_test_main+3070
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+3052
 e0 91 00              jmp16	avm_test_main+3215
 f0 1d 88              ldsp8u	r5, [sp+0x88]
 cd 6f                 cmpi.s8	r5, 0x6f
 db 89 00              brne16	avm_test_main+3215
 c3 6f                 ldi8	r7, 0x6f
 c5 58 03              ldi16	r5, 0x358
 f0 16 88              leasp	r6, 0x88
 f4 a7                 tst8	r7
 d0 0d                 breq8	avm_test_main+3103
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+3086
 d4 70                 jmp8	avm_test_main+3215
 f0 02 01              ldi8	r2, 0x1
 f0 1c 80              ldsp8u	r4, [sp+0x80]
 cc 67                 cmpi.s8	r4, 0x67
 f1 22                 mov	r4, r2
 d1 36                 brne8	avm_test_main+3169
 c2 67                 ldi8	r6, 0x67
 c4 5c 03              ldi16	r4, 0x35c
 f0 15 80              leasp	r5, 0x80
 f2 30                 sub	r0, r0
 f4 a6                 tst8	r6
 d0 0c                 breq8	avm_test_main+3141
 f7 07                 ld8u	r7, [r4+]
 ed ca 21              ld8u	r6, [r5+1]
 f4 ad                 inc16	r5
 3b                    cmp	r6, r7
 d0 f2                 breq8	avm_test_main+3125
 d4 03                 jmp8	avm_test_main+3144
 f0 30 70              ldsp16	r0, [sp+0x70]
 c0 01                 ldi8	r4, 0x1
 f9 82                 xor	r4, r0
 f0 37 72              ldsp16	r7, [sp+0x72]
 f1 77                 zext8	r7
 c1 a5                 ldi8	r5, 0xa5
 09                    mov	r6, r5
 3e                    cmp	r7, r6
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 f0 34 74              ldsp16	r4, [sp+0x74]
 f1 74                 zext8	r4
 32                    cmp	r4, r6
 f8 0c                 cset.ne	r4
 91                    or	r4, r5
 f6 29                 tst16	r1
 f8 06                 cset.eq	r6
 98                    or	r6, r4
 f0 35 76              ldsp16	r5, [sp+0x76]
 f1 75                 zext8	r5
 c0 b6                 ldi8	r4, 0xb6
 34                    cmp	r5, r4
 f8 0d                 cset.ne	r5
 f0 34 78              ldsp16	r4, [sp+0x78]
 f1 74                 zext8	r4
 cc 67                 cmpi.s8	r4, 0x67
 f8 0c                 cset.ne	r4
 92                    or	r4, r6
 f0 36 7a              ldsp16	r6, [sp+0x7a]
 f1 76                 zext8	r6
 ce 6f                 cmpi.s8	r6, 0x6f
 f8 0e                 cset.ne	r6
 98                    or	r6, r4
 f0 34 7c              ldsp16	r4, [sp+0x7c]
 f4 a4                 tst8	r4
 f8 0c                 cset.ne	r4
 92                    or	r4, r6
 91                    or	r4, r5
 f9 88                 and	r4, r2
 d6 7f                 adjsp	0x7f
 d6 4d                 adjsp	0x4d
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
