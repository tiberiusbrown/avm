
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/string_progmem_copy.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 string_progmem_copy.c
00000f46 l     O .rodata	00000004 p_cat
00000f4a l     O .rodata	00000007 p_abcdef
00000f51 l     O .rodata	00000004 p_dog
00000f55 l     O .rodata	00000008 p_ignored
00000100 l     O .data	0000000c .L__const.avm_test_main.full
0000010c l     O .data	0000000c .L__const.avm_test_main.cut
00000f5d l     O .rodata	00000005 p_wood
00000f62 l     O .rodata	00000007 p_flower
00000f69 l     O .rodata	00000005 p_berg
00000f6e l     O .rodata	00000001 p_empty
00000f6f l     O .rodata	00000003 p_go
00000118 l     O .data	00000107 avm_test_main.long_pad
00000f72 l     O .rodata	00000002 p_z
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
00000424 g     F .text	00000b20 avm_test_main
00000f44 g     F .text	00000002 avm_halt
00000416 g     F .text	00000007 test_call_strncpy_P
0000041d g     F .text	00000007 test_call_strncat_P

Disassembly of section .text:

<_start>:
 d5 22                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 fb 2e                 cmov.eq	r5, r6
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 2e 0b              call16	avm_halt

<test_call_strncpy_P>:
 f1 77                 zext8	r7
 f4 0d                 ldsp16	r5, [sp+0x3]
 d7 16                 sys	strncpy_p
 ef                    ret

<test_call_strncat_P>:
 f1 77                 zext8	r7
 f4 0d                 ldsp16	r5, [sp+0x3]
 d7 17                 sys	strncat_p
 ef                    ret

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 80                 adjsp	-0x80
 d6 d6                 adjsp	_start+2
 c0 0a                 ldi8	r4, 0xa
 f0 15 a0              leasp	r5, 0xa0
 c2 a5                 ldi8	r6, 0xa5
 f6 0e                 st8	[r5+], r6
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f8                 brne8	avm_test_main+15
 c0 07                 ldi8	r4, 0x7
 f0 15 99              leasp	r5, 0x99
 c2 cc                 ldi8	r6, 0xcc
 f6 0e                 st8	[r5+], r6
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f8                 brne8	avm_test_main+30
 c0 06                 ldi8	r4, 0x6
 f0 15 93              leasp	r5, 0x93
 c2 7e                 ldi8	r6, 0x7e
 f6 0e                 st8	[r5+], r6
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f8                 brne8	avm_test_main+45
 c0 3c                 ldi8	r4, 0x3c
 f0 2c 92              stsp8	[sp+0x92], r4
 c4 3c 3c              ldi16	r4, 0x3c3c
 c5 3c 3c              ldi16	r5, 0x3c3c
 f0 3c 8e              stsp16	[sp+0x8e], r4
 f0 3d 90              stsp16	[sp+0x90], r5
 d6 fe                 adjsp	avm_test_main+70
 c0 08                 ldi8	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 c6 46 0f              ldi16	r6, 0xf46
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 a2              leasp	r4, 0xa2
 d5 9a                 call8	test_call_strncpy_P
 d6 02                 adjsp	avm_test_main+92
 d6 fe                 adjsp	avm_test_main+90
 c0 03                 ldi8	r4, 0x3
 f4 40                 stsp16	[sp+0x0], r4
 c6 4a 0f              ldi16	r6, 0xf4a
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 9b              leasp	r4, 0x9b
 d5 86                 call8	test_call_strncpy_P
 d6 02                 adjsp	avm_test_main+112
 c6 51 0f              ldi16	r6, 0xf51
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 d6 fe                 adjsp	avm_test_main+117
 c0 04                 ldi8	r4, 0x4
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 95              leasp	r4, 0x95
 e1 71 ff              call16	test_call_strncpy_P
 d6 02                 adjsp	avm_test_main+133
 c6 55 0f              ldi16	r6, 0xf55
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 d6 fe                 adjsp	avm_test_main+138
 f2 4b                 sub	r3, r3
 f0 3b 00              stsp16	[sp+0x0], r3
 f0 14 90              leasp	r4, 0x90
 e1 5b ff              call16	test_call_strncpy_P
 d6 02                 adjsp	avm_test_main+155
 f0 01 0c              ldi8	r1, 0xc
 c5 00 01              ldi16	r5, 0x100
 f0 14 82              leasp	r4, 0x82
 f1 29                 mov	r6, r1
 d7 0f                 sys	memcpy
 f1 04                 mov	r0, r4
 c5 0c 01              ldi16	r5, 0x10c
 f0 14 76              leasp	r4, 0x76
 d7 0f                 sys	memcpy
 f1 14                 mov	r2, r4
 c4 69 63              ldi16	r4, 0x6369
 c1 65                 ldi8	r5, 0x65
 f0 3c 6e              stsp16	[sp+0x6e], r4
 f0 3d 70              stsp16	[sp+0x70], r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 72              stsp16	[sp+0x72], r4
 f0 3d 74              stsp16	[sp+0x74], r5
 c6 6f 61              ldi16	r6, 0x616f
 c3 6b                 ldi8	r7, 0x6b
 f0 3e 66              stsp16	[sp+0x66], r6
 f0 3f 68              stsp16	[sp+0x68], r7
 f0 3c 6a              stsp16	[sp+0x6a], r4
 f0 3d 6c              stsp16	[sp+0x6c], r5
 f0 3c 62              stsp16	[sp+0x62], r4
 f0 3d 64              stsp16	[sp+0x64], r5
 f0 3c 5e              stsp16	[sp+0x5e], r4
 f0 3d 60              stsp16	[sp+0x60], r5
 d6 fe                 adjsp	avm_test_main+226
 c0 08                 ldi8	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 c6 5d 0f              ldi16	r6, 0xf5d
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 e1 05 ff              call16	test_call_strncat_P
 d6 02                 adjsp	avm_test_main+248
 d6 fe                 adjsp	avm_test_main+246
 c0 03                 ldi8	r4, 0x3
 f4 40                 stsp16	[sp+0x0], r4
 c6 62 0f              ldi16	r6, 0xf62
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 22                 mov	r4, r2
 e1 f1 fe              call16	test_call_strncat_P
 d6 02                 adjsp	avm_test_main+268
 d6 fe                 adjsp	avm_test_main+266
 f0 3b 00              stsp16	[sp+0x0], r3
 c6 69 0f              ldi16	r6, 0xf69
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 70              leasp	r4, 0x70
 e1 dd fe              call16	test_call_strncat_P
 d6 02                 adjsp	avm_test_main+288
 d6 fe                 adjsp	avm_test_main+286
 c0 04                 ldi8	r4, 0x4
 f4 40                 stsp16	[sp+0x0], r4
 c6 6e 0f              ldi16	r6, 0xf6e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 68              leasp	r4, 0x68
 e1 c8 fe              call16	test_call_strncat_P
 d6 02                 adjsp	avm_test_main+309
 d6 fe                 adjsp	avm_test_main+307
 f0 00 02              ldi8	r0, 0x2
 f0 38 00              stsp16	[sp+0x0], r0
 c6 6f 0f              ldi16	r6, 0xf6f
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 60              leasp	r4, 0x60
 e1 b1 fe              call16	test_call_strncat_P
 d6 02                 adjsp	avm_test_main+332
 c4 07 01              ldi16	r4, 0x107
 c5 18 01              ldi16	r5, 0x118
 c2 a5                 ldi8	r6, 0xa5
 f6 0e                 st8	[r5+], r6
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f8                 brne8	avm_test_main+338
 d6 fe                 adjsp	avm_test_main+346
 c4 04 01              ldi16	r4, 0x104
 f4 40                 stsp16	[sp+0x0], r4
 c6 72 0f              ldi16	r6, 0xf72
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 18 01              ldi16	r4, 0x118
 e1 84 fe              call16	test_call_strncpy_P
 d6 02                 adjsp	avm_test_main+370
 c4 01 01              ldi16	r4, 0x101
 c5 1f 02              ldi16	r5, 0x21f
 c2 64                 ldi8	r6, 0x64
 f6 0e                 st8	[r5+], r6
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f8                 brne8	avm_test_main+376
 f0 4b 20 03           stm8	[0x320], r3
 c4 21 03              ldi16	r4, 0x321
 c1 b6                 ldi8	r5, 0xb6
 f6 05                 st8	[r4+], r5
 f4 b1                 dec16	r1
 f6 29                 tst16	r1
 d1 f8                 brne8	avm_test_main+393
 d6 fe                 adjsp	avm_test_main+401
 f0 38 00              stsp16	[sp+0x0], r0
 c6 6f 0f              ldi16	r6, 0xf6f
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 1f 02              ldi16	r4, 0x21f
 e1 56 fe              call16	test_call_strncat_P
 d6 02                 adjsp	avm_test_main+423
 c6 2b 6d              ldi16	r6, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 02 0e              ldi8	r2, 0xe
 f0 14 a0              leasp	r4, 0xa0
 f0 00 9c              ldi8	r0, 0x9c
 07                    mov	r5, r7
 0e                    mov	r7, r6
 fa ab                 lsr16i	r7, 0xb
 fa 55                 lsl16i	r6, 0x5
 9b                    or	r6, r7
 0d                    mov	r7, r5
 f7 01                 ld8u	r1, [r4+]
 f9 3a                 xor	r1, r6
 f0 0a ef              addi.s8	r2, -0x11
 cb 11                 addi.s8	r7, 0x11
 0b                    mov	r6, r7
 f2 29                 add	r6, r1
 f5 2c                 cmp	r7, r0
 d1 e8                 brne8	avm_test_main+436
 f0 3a 30              stsp16	[sp+0x30], r2
 f2 2d                 add	r7, r1
 c5 2b 6d              ldi16	r5, 0x6d2b
 c6 f2 ff              ldi16	r6, 0xfff2
 f0 02 0e              ldi8	r2, 0xe
 f0 14 99              leasp	r4, 0x99
 f0 3e 58              stsp16	[sp+0x58], r6
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 f0 36 58              ldsp16	r6, [sp+0x58]
 f7 00                 ld8u	r0, [r4+]
 f9 16                 xor	r0, r5
 f0 0a ef              addi.s8	r2, -0x11
 ca 11                 addi.s8	r6, 0x11
 06                    mov	r5, r6
 f2 24                 add	r5, r0
 ce 69                 cmpi.s8	r6, 0x69
 d1 e4                 brne8	avm_test_main+477
 f0 3a 2e              stsp16	[sp+0x2e], r2
 f2 28                 add	r6, r0
 f0 3e 58              stsp16	[sp+0x58], r6
 c5 2b 6d              ldi16	r5, 0x6d2b
 c6 f2 ff              ldi16	r6, 0xfff2
 f0 03 0e              ldi8	r3, 0xe
 f0 14 93              leasp	r4, 0x93
 f0 3e 56              stsp16	[sp+0x56], r6
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 f0 36 56              ldsp16	r6, [sp+0x56]
 f7 02                 ld8u	r2, [r4+]
 f9 56                 xor	r2, r5
 f0 0b ef              addi.s8	r3, -0x11
 ca 11                 addi.s8	r6, 0x11
 06                    mov	r5, r6
 f2 26                 add	r5, r2
 ce 58                 cmpi.s8	r6, 0x58
 d1 e4                 brne8	avm_test_main+525
 f0 3b 3c              stsp16	[sp+0x3c], r3
 f0 38 4c              stsp16	[sp+0x4c], r0
 f0 3f 38              stsp16	[sp+0x38], r7
 f2 2a                 add	r6, r2
 f0 3e 56              stsp16	[sp+0x56], r6
 c5 2b 6d              ldi16	r5, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 00 0e              ldi8	r0, 0xe
 f0 14 8e              leasp	r4, 0x8e
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 f7 06                 ld8u	r6, [r4+]
 a9                    xor	r6, r5
 f0 08 ef              addi.s8	r0, -0x11
 cb 11                 addi.s8	r7, 0x11
 07                    mov	r5, r7
 16                    add	r5, r6
 cf 47                 cmpi.s8	r7, 0x47
 d1 ec                 brne8	avm_test_main+579
 f0 38 2c              stsp16	[sp+0x2c], r0
 f0 3e 48              stsp16	[sp+0x48], r6
 1e                    add	r7, r6
 f0 3f 36              stsp16	[sp+0x36], r7
 c6 2b 6d              ldi16	r6, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 03 0e              ldi8	r3, 0xe
 f0 15 82              leasp	r5, 0x82
 f0 00 be              ldi8	r0, 0xbe
 02                    mov	r4, r6
 fa 7b                 lsr16i	r4, 0xb
 fa 55                 lsl16i	r6, 0x5
 98                    or	r6, r4
 f7 0c                 ld8u	r4, [r5+]
 a2                    xor	r4, r6
 f0 0b ef              addi.s8	r3, -0x11
 cb 11                 addi.s8	r7, 0x11
 0b                    mov	r6, r7
 18                    add	r6, r4
 f5 2c                 cmp	r7, r0
 d1 ec                 brne8	avm_test_main+624
 f0 3b 28              stsp16	[sp+0x28], r3
 f0 3c 50              stsp16	[sp+0x50], r4
 1c                    add	r7, r4
 f0 3f 3a              stsp16	[sp+0x3a], r7
 c6 2b 6d              ldi16	r6, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 03 0e              ldi8	r3, 0xe
 f0 15 76              leasp	r5, 0x76
 03                    mov	r4, r7
 0e                    mov	r7, r6
 fa ab                 lsr16i	r7, 0xb
 fa 55                 lsl16i	r6, 0x5
 9b                    or	r6, r7
 0c                    mov	r7, r4
 f7 0c                 ld8u	r4, [r5+]
 a2                    xor	r4, r6
 f0 0b ef              addi.s8	r3, -0x11
 cb 11                 addi.s8	r7, 0x11
 0b                    mov	r6, r7
 18                    add	r6, r4
 f5 2c                 cmp	r7, r0
 d1 ea                 brne8	avm_test_main+666
 f0 39 4e              stsp16	[sp+0x4e], r1
 f0 3c 46              stsp16	[sp+0x46], r4
 1c                    add	r7, r4
 c5 2b 6d              ldi16	r5, 0x6d2b
 c6 f2 ff              ldi16	r6, 0xfff2
 f0 01 0e              ldi8	r1, 0xe
 f0 14 6e              leasp	r4, 0x6e
 f0 3e 5c              stsp16	[sp+0x5c], r6
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 f0 36 5c              ldsp16	r6, [sp+0x5c]
 f7 00                 ld8u	r0, [r4+]
 f9 16                 xor	r0, r5
 f0 09 ef              addi.s8	r1, -0x11
 ca 11                 addi.s8	r6, 0x11
 06                    mov	r5, r6
 f2 24                 add	r5, r0
 ce 7a                 cmpi.s8	r6, 0x7a
 d1 e4                 brne8	avm_test_main+707
 f0 39 24              stsp16	[sp+0x24], r1
 f0 38 40              stsp16	[sp+0x40], r0
 f2 28                 add	r6, r0
 f0 3e 5c              stsp16	[sp+0x5c], r6
 c5 2b 6d              ldi16	r5, 0x6d2b
 c6 f2 ff              ldi16	r6, 0xfff2
 f0 00 0e              ldi8	r0, 0xe
 f0 14 66              leasp	r4, 0x66
 f0 3e 5a              stsp16	[sp+0x5a], r6
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 f0 36 5a              ldsp16	r6, [sp+0x5a]
 f7 01                 ld8u	r1, [r4+]
 f9 36                 xor	r1, r5
 f0 08 ef              addi.s8	r0, -0x11
 ca 11                 addi.s8	r6, 0x11
 06                    mov	r5, r6
 f2 25                 add	r5, r1
 ce 7a                 cmpi.s8	r6, 0x7a
 d1 e4                 brne8	avm_test_main+758
 f0 38 20              stsp16	[sp+0x20], r0
 f0 3b 26              stsp16	[sp+0x26], r3
 f0 3a 4a              stsp16	[sp+0x4a], r2
 f0 3f 3e              stsp16	[sp+0x3e], r7
 f2 29                 add	r6, r1
 f0 3e 5a              stsp16	[sp+0x5a], r6
 c5 2b 6d              ldi16	r5, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 00 0e              ldi8	r0, 0xe
 f0 14 5e              leasp	r4, 0x5e
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 f7 06                 ld8u	r6, [r4+]
 a9                    xor	r6, r5
 f0 08 ef              addi.s8	r0, -0x11
 cb 11                 addi.s8	r7, 0x11
 07                    mov	r5, r7
 16                    add	r5, r6
 cf 7a                 cmpi.s8	r7, 0x7a
 d1 ec                 brne8	avm_test_main+815
 f0 3e 42              stsp16	[sp+0x42], r6
 1e                    add	r7, r6
 f0 3f 32              stsp16	[sp+0x32], r7
 c5 2b 6d              ldi16	r5, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 02 0e              ldi8	r2, 0xe
 c4 18 01              ldi16	r4, 0x118
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 f7 03                 ld8u	r3, [r4+]
 f9 76                 xor	r3, r5
 f0 0a ef              addi.s8	r2, -0x11
 cb 11                 addi.s8	r7, 0x11
 07                    mov	r5, r7
 f2 27                 add	r5, r3
 c6 69 11              ldi16	r6, 0x1169
 3e                    cmp	r7, r6
 d1 e8                 brne8	avm_test_main+854
 f0 3b 44              stsp16	[sp+0x44], r3
 f2 2f                 add	r7, r3
 f0 3f 34              stsp16	[sp+0x34], r7
 c6 2b 6d              ldi16	r6, 0x6d2b
 c4 f2 ff              ldi16	r4, 0xfff2
 f0 3c 54              stsp16	[sp+0x54], r4
 f0 03 0e              ldi8	r3, 0xe
 c5 1f 02              ldi16	r5, 0x21f
 0e                    mov	r7, r6
 fa ab                 lsr16i	r7, 0xb
 fa 55                 lsl16i	r6, 0x5
 9b                    or	r6, r7
 f7 0f                 ld8u	r7, [r5+]
 ae                    xor	r7, r6
 f0 0b ef              addi.s8	r3, -0x11
 f0 34 54              ldsp16	r4, [sp+0x54]
 c8 11                 addi.s8	r4, 0x11
 08                    mov	r6, r4
 f0 3f 52              stsp16	[sp+0x52], r7
 1b                    add	r6, r7
 c7 e0 11              ldi16	r7, 0x11e0
 f0 3c 54              stsp16	[sp+0x54], r4
 33                    cmp	r4, r7
 d1 e1                 brne8	avm_test_main+901
 f0 35 4e              ldsp16	r5, [sp+0x4e]
 f0 34 30              ldsp16	r4, [sp+0x30]
 24                    sub	r5, r4
 f0 3d 4e              stsp16	[sp+0x4e], r5
 f1 75                 zext8	r5
 0d                    mov	r7, r5
 fa a4                 lsr16i	r7, 0x4
 c0 30                 ldi8	r4, 0x30
 0b                    mov	r6, r7
 98                    or	r6, r4
 cb 37                 addi.s8	r7, 0x37
 c0 a0                 ldi8	r4, 0xa0
 34                    cmp	r5, r4
 fc 3e                 cmov.ult	r7, r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f0 35 4c              ldsp16	r5, [sp+0x4c]
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 24                    sub	r5, r4
 f0 3d 4c              stsp16	[sp+0x4c], r5
 f1 75                 zext8	r5
 0d                    mov	r7, r5
 fa a4                 lsr16i	r7, 0x4
 0b                    mov	r6, r7
 c0 30                 ldi8	r4, 0x30
 98                    or	r6, r4
 cb 37                 addi.s8	r7, 0x37
 c0 a0                 ldi8	r4, 0xa0
 34                    cmp	r5, r4
 fc 3e                 cmov.ult	r7, r6
 f0 3f 22              stsp16	[sp+0x22], r7
 f0 35 4a              ldsp16	r5, [sp+0x4a]
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 24                    sub	r5, r4
 f0 3d 4a              stsp16	[sp+0x4a], r5
 f1 75                 zext8	r5
 0d                    mov	r7, r5
 fa a4                 lsr16i	r7, 0x4
 0b                    mov	r6, r7
 c0 30                 ldi8	r4, 0x30
 98                    or	r6, r4
 cb 37                 addi.s8	r7, 0x37
 c0 a0                 ldi8	r4, 0xa0
 34                    cmp	r5, r4
 fc 3e                 cmov.ult	r7, r6
 f0 3f 2a              stsp16	[sp+0x2a], r7
 f0 35 48              ldsp16	r5, [sp+0x48]
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 24                    sub	r5, r4
 f0 3d 48              stsp16	[sp+0x48], r5
 f1 75                 zext8	r5
 0d                    mov	r7, r5
 fa a4                 lsr16i	r7, 0x4
 0b                    mov	r6, r7
 c0 30                 ldi8	r4, 0x30
 98                    or	r6, r4
 cb 37                 addi.s8	r7, 0x37
 c0 a0                 ldi8	r4, 0xa0
 34                    cmp	r5, r4
 fc 3e                 cmov.ult	r7, r6
 f0 3f 30              stsp16	[sp+0x30], r7
 f0 36 50              ldsp16	r6, [sp+0x50]
 f0 34 28              ldsp16	r4, [sp+0x28]
 28                    sub	r6, r4
 f0 3e 50              stsp16	[sp+0x50], r6
 f1 76                 zext8	r6
 06                    mov	r5, r6
 fa 84                 lsr16i	r5, 0x4
 0d                    mov	r7, r5
 c0 30                 ldi8	r4, 0x30
 9c                    or	r7, r4
 c9 37                 addi.s8	r5, 0x37
 c0 a0                 ldi8	r4, 0xa0
 38                    cmp	r6, r4
 fc 2f                 cmov.ult	r5, r7
 f0 3d 3c              stsp16	[sp+0x3c], r5
 f0 35 46              ldsp16	r5, [sp+0x46]
 f0 34 26              ldsp16	r4, [sp+0x26]
 24                    sub	r5, r4
 f0 3d 46              stsp16	[sp+0x46], r5
 f1 75                 zext8	r5
 0d                    mov	r7, r5
 fa a4                 lsr16i	r7, 0x4
 0b                    mov	r6, r7
 c0 30                 ldi8	r4, 0x30
 98                    or	r6, r4
 cb 37                 addi.s8	r7, 0x37
 c0 a0                 ldi8	r4, 0xa0
 34                    cmp	r5, r4
 fc 3e                 cmov.ult	r7, r6
 f0 3f 2e              stsp16	[sp+0x2e], r7
 f0 35 40              ldsp16	r5, [sp+0x40]
 f0 34 24              ldsp16	r4, [sp+0x24]
 24                    sub	r5, r4
 f0 3d 40              stsp16	[sp+0x40], r5
 f1 75                 zext8	r5
 0d                    mov	r7, r5
 fa a4                 lsr16i	r7, 0x4
 0b                    mov	r6, r7
 c0 30                 ldi8	r4, 0x30
 98                    or	r6, r4
 cb 37                 addi.s8	r7, 0x37
 c0 a0                 ldi8	r4, 0xa0
 34                    cmp	r5, r4
 fc 3e                 cmov.ult	r7, r6
 f0 3f 28              stsp16	[sp+0x28], r7
 f0 34 20              ldsp16	r4, [sp+0x20]
 f2 3c                 sub	r1, r4
 f1 25                 mov	r5, r1
 f1 75                 zext8	r5
 0d                    mov	r7, r5
 fa a4                 lsr16i	r7, 0x4
 0b                    mov	r6, r7
 c0 30                 ldi8	r4, 0x30
 98                    or	r6, r4
 cb 37                 addi.s8	r7, 0x37
 c0 a0                 ldi8	r4, 0xa0
 34                    cmp	r5, r4
 fc 3e                 cmov.ult	r7, r6
 f0 3f 20              stsp16	[sp+0x20], r7
 f0 35 42              ldsp16	r5, [sp+0x42]
 f2 54                 sub	r5, r0
 f0 3d 42              stsp16	[sp+0x42], r5
 f1 75                 zext8	r5
 0d                    mov	r7, r5
 fa a4                 lsr16i	r7, 0x4
 0b                    mov	r6, r7
 f0 00 30              ldi8	r0, 0x30
 f9 c1                 or	r6, r0
 cb 37                 addi.s8	r7, 0x37
 34                    cmp	r5, r4
 fc 3e                 cmov.ult	r7, r6
 f0 3f 26              stsp16	[sp+0x26], r7
 f0 35 44              ldsp16	r5, [sp+0x44]
 f2 56                 sub	r5, r2
 f0 3d 44              stsp16	[sp+0x44], r5
 f1 75                 zext8	r5
 0d                    mov	r7, r5
 fa a4                 lsr16i	r7, 0x4
 0b                    mov	r6, r7
 f9 c1                 or	r6, r0
 cb 37                 addi.s8	r7, 0x37
 34                    cmp	r5, r4
 fc 3e                 cmov.ult	r7, r6
 f0 3f 2c              stsp16	[sp+0x2c], r7
 f0 32 52              ldsp16	r2, [sp+0x52]
 f2 43                 sub	r2, r3
 f1 22                 mov	r4, r2
 f1 74                 zext8	r4
 08                    mov	r6, r4
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f1 18                 mov	r3, r0
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 c3 a0                 ldi8	r7, 0xa0
 33                    cmp	r4, r7
 fc 35                 cmov.ult	r6, r5
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 00 0f              ldi8	r0, 0xf
 f0 36 4e              ldsp16	r6, [sp+0x4e]
 f9 c0                 and	r6, r0
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 06                    mov	r5, r6
 c9 37                 addi.s8	r5, 0x37
 ce 0a                 cmpi.s8	r6, 0xa
 fc 2c                 cmov.ult	r5, r4
 f0 3d 4e              stsp16	[sp+0x4e], r5
 f0 36 38              ldsp16	r6, [sp+0x38]
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3d                 cmov.ult	r7, r5
 f0 3f 1c              stsp16	[sp+0x1c], r7
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 c7 00 a0              ldi16	r7, 0xa000
 3b                    cmp	r6, r7
 fc 2c                 cmov.ult	r5, r4
 f0 3d 38              stsp16	[sp+0x38], r5
 f0 36 4c              ldsp16	r6, [sp+0x4c]
 f9 c0                 and	r6, r0
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 06                    mov	r5, r6
 c9 37                 addi.s8	r5, 0x37
 ce 0a                 cmpi.s8	r6, 0xa
 fc 2c                 cmov.ult	r5, r4
 f0 3d 4c              stsp16	[sp+0x4c], r5
 f0 36 58              ldsp16	r6, [sp+0x58]
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3d                 cmov.ult	r7, r5
 f0 3f 18              stsp16	[sp+0x18], r7
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 c7 00 a0              ldi16	r7, 0xa000
 3b                    cmp	r6, r7
 fc 2c                 cmov.ult	r5, r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 36 4a              ldsp16	r6, [sp+0x4a]
 f9 c0                 and	r6, r0
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 06                    mov	r5, r6
 c9 37                 addi.s8	r5, 0x37
 ce 0a                 cmpi.s8	r6, 0xa
 fc 2c                 cmov.ult	r5, r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 36 56              ldsp16	r6, [sp+0x56]
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3d                 cmov.ult	r7, r5
 f0 3f 12              stsp16	[sp+0x12], r7
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 c7 00 a0              ldi16	r7, 0xa000
 3b                    cmp	r6, r7
 fc 2c                 cmov.ult	r5, r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 36 48              ldsp16	r6, [sp+0x48]
 f9 c0                 and	r6, r0
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 06                    mov	r5, r6
 c9 37                 addi.s8	r5, 0x37
 ce 0a                 cmpi.s8	r6, 0xa
 fc 2c                 cmov.ult	r5, r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 36 36              ldsp16	r6, [sp+0x36]
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3d                 cmov.ult	r7, r5
 f4 7b                 stsp16	[sp+0xe], r7
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 c7 00 a0              ldi16	r7, 0xa000
 3b                    cmp	r6, r7
 fc 2c                 cmov.ult	r5, r4
 f0 3d 36              stsp16	[sp+0x36], r5
 f9 20                 and	r1, r0
 f1 21                 mov	r4, r1
 f9 8d                 or	r4, r3
 f1 25                 mov	r5, r1
 c9 37                 addi.s8	r5, 0x37
 f0 0d 0a              cmpi.s8	r1, 0xa
 fc 2c                 cmov.ult	r5, r4
 f0 3d 4a              stsp16	[sp+0x4a], r5
 f0 34 5a              ldsp16	r4, [sp+0x5a]
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f0 3e 48              stsp16	[sp+0x48], r6
 f0 36 40              ldsp16	r6, [sp+0x40]
 f9 c0                 and	r6, r0
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 06                    mov	r5, r6
 c9 37                 addi.s8	r5, 0x37
 ce 0a                 cmpi.s8	r6, 0xa
 fc 2c                 cmov.ult	r5, r4
 f0 3d 40              stsp16	[sp+0x40], r5
 f0 34 5c              ldsp16	r4, [sp+0x5c]
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f4 72                 stsp16	[sp+0xc], r6
 f0 36 46              ldsp16	r6, [sp+0x46]
 f9 c0                 and	r6, r0
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 06                    mov	r5, r6
 c9 37                 addi.s8	r5, 0x37
 ce 0a                 cmpi.s8	r6, 0xa
 fc 2c                 cmov.ult	r5, r4
 f0 3d 46              stsp16	[sp+0x46], r5
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f4 6a                 stsp16	[sp+0xa], r6
 f0 35 50              ldsp16	r5, [sp+0x50]
 f9 a0                 and	r5, r0
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 09                    mov	r6, r5
 ca 37                 addi.s8	r6, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 34                 cmov.ult	r6, r4
 f0 3e 50              stsp16	[sp+0x50], r6
 f0 37 3a              ldsp16	r7, [sp+0x3a]
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 08                    mov	r6, r4
 f9 cd                 or	r6, r3
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2e                 cmov.ult	r5, r6
 f4 61                 stsp16	[sp+0x8], r5
 0b                    mov	r6, r7
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ca 37                 addi.s8	r6, 0x37
 f0 05 00 a0           ldi16	r1, 0xa000
 f5 2d                 cmp	r7, r1
 fc 34                 cmov.ult	r6, r4
 f4 4a                 stsp16	[sp+0x2], r6
 f0 37 3e              ldsp16	r7, [sp+0x3e]
 0b                    mov	r6, r7
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ca 37                 addi.s8	r6, 0x37
 f5 2d                 cmp	r7, r1
 fc 34                 cmov.ult	r6, r4
 f4 52                 stsp16	[sp+0x4], r6
 f0 37 5c              ldsp16	r7, [sp+0x5c]
 0b                    mov	r6, r7
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ca 37                 addi.s8	r6, 0x37
 f5 2d                 cmp	r7, r1
 fc 34                 cmov.ult	r6, r4
 f0 3e 3a              stsp16	[sp+0x3a], r6
 f0 37 5a              ldsp16	r7, [sp+0x5a]
 0b                    mov	r6, r7
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ca 37                 addi.s8	r6, 0x37
 f5 2d                 cmp	r7, r1
 fc 34                 cmov.ult	r6, r4
 f0 3e 3e              stsp16	[sp+0x3e], r6
 f0 35 42              ldsp16	r5, [sp+0x42]
 f9 a0                 and	r5, r0
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 09                    mov	r6, r5
 ca 37                 addi.s8	r6, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 34                 cmov.ult	r6, r4
 f0 3e 42              stsp16	[sp+0x42], r6
 f0 36 32              ldsp16	r6, [sp+0x32]
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3d                 cmov.ult	r7, r5
 f4 5b                 stsp16	[sp+0x6], r7
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 f5 29                 cmp	r6, r1
 fc 2c                 cmov.ult	r5, r4
 f0 3d 32              stsp16	[sp+0x32], r5
 f9 40                 and	r2, r0
 f1 22                 mov	r4, r2
 f9 8d                 or	r4, r3
 f1 26                 mov	r5, r2
 c9 37                 addi.s8	r5, 0x37
 f0 0e 0a              cmpi.s8	r2, 0xa
 fc 2c                 cmov.ult	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 f0 37 54              ldsp16	r7, [sp+0x54]
 f0 34 52              ldsp16	r4, [sp+0x52]
 1c                    add	r7, r4
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f0 3e 54              stsp16	[sp+0x54], r6
 07                    mov	r5, r7
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 f5 2d                 cmp	r7, r1
 fc 2c                 cmov.ult	r5, r4
 f0 3d 52              stsp16	[sp+0x52], r5
 f0 35 44              ldsp16	r5, [sp+0x44]
 f9 a0                 and	r5, r0
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 f1 15                 mov	r2, r5
 f0 0a 37              addi.s8	r2, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 14                 cmov.ult	r2, r4
 f0 37 34              ldsp16	r7, [sp+0x34]
 0b                    mov	r6, r7
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 ca 37                 addi.s8	r6, 0x37
 f5 2d                 cmp	r7, r1
 fc 34                 cmov.ult	r6, r4
 fa a8                 lsr16i	r7, 0x8
 f9 e0                 and	r7, r0
 07                    mov	r5, r7
 f9 ad                 or	r5, r3
 03                    mov	r4, r7
 c8 37                 addi.s8	r4, 0x37
 cf 0a                 cmpi.s8	r7, 0xa
 fc 25                 cmov.ult	r4, r5
 0c                    mov	r7, r4
 c0 52                 ldi8	r4, 0x52
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 f0 3c 56              stsp16	[sp+0x56], r4
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 f0 3c 5c              stsp16	[sp+0x5c], r4
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 c0 37                 ldi8	r4, 0x37
 d7 00                 sys	debug_putc
 f0 34 56              ldsp16	r4, [sp+0x56]
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 f0 3c 5a              stsp16	[sp+0x5a], r4
 d7 00                 sys	debug_putc
 c0 4e                 ldi8	r4, 0x4e
 f0 3c 58              stsp16	[sp+0x58], r4
 d7 00                 sys	debug_putc
 c0 50                 ldi8	r4, 0x50
 f0 3c 44              stsp16	[sp+0x44], r4
 d7 00                 sys	debug_putc
 f0 34 5c              ldsp16	r4, [sp+0x5c]
 d7 00                 sys	debug_putc
 f0 34 38              ldsp16	r4, [sp+0x38]
 d7 00                 sys	debug_putc
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 d7 00                 sys	debug_putc
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 d7 00                 sys	debug_putc
 f0 34 4e              ldsp16	r4, [sp+0x4e]
 d7 00                 sys	debug_putc
 f0 34 5a              ldsp16	r4, [sp+0x5a]
 d7 00                 sys	debug_putc
 f0 34 58              ldsp16	r4, [sp+0x58]
 d7 00                 sys	debug_putc
 c0 54                 ldi8	r4, 0x54
 f0 3c 38              stsp16	[sp+0x38], r4
 d7 00                 sys	debug_putc
 f0 34 5c              ldsp16	r4, [sp+0x5c]
 d7 00                 sys	debug_putc
 f0 34 16              ldsp16	r4, [sp+0x16]
 d7 00                 sys	debug_putc
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 00                 sys	debug_putc
 f0 34 22              ldsp16	r4, [sp+0x22]
 d7 00                 sys	debug_putc
 f0 34 4c              ldsp16	r4, [sp+0x4c]
 d7 00                 sys	debug_putc
 f0 34 5a              ldsp16	r4, [sp+0x5a]
 d7 00                 sys	debug_putc
 f0 34 58              ldsp16	r4, [sp+0x58]
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 f0 3c 4e              stsp16	[sp+0x4e], r4
 d7 00                 sys	debug_putc
 f0 34 5c              ldsp16	r4, [sp+0x5c]
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 00                 sys	debug_putc
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 d7 00                 sys	debug_putc
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d7 00                 sys	debug_putc
 f0 34 5a              ldsp16	r4, [sp+0x5a]
 d7 00                 sys	debug_putc
 f0 34 58              ldsp16	r4, [sp+0x58]
 d7 00                 sys	debug_putc
 c0 5a                 ldi8	r4, 0x5a
 f0 3c 4c              stsp16	[sp+0x4c], r4
 d7 00                 sys	debug_putc
 f0 34 5c              ldsp16	r4, [sp+0x5c]
 d7 00                 sys	debug_putc
 f0 34 36              ldsp16	r4, [sp+0x36]
 d7 00                 sys	debug_putc
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 00                 sys	debug_putc
 f0 34 30              ldsp16	r4, [sp+0x30]
 d7 00                 sys	debug_putc
 f0 34 14              ldsp16	r4, [sp+0x14]
 d7 00                 sys	debug_putc
 f0 34 5a              ldsp16	r4, [sp+0x5a]
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 f0 3c 58              stsp16	[sp+0x58], r4
 d7 00                 sys	debug_putc
 f0 34 56              ldsp16	r4, [sp+0x56]
 d7 00                 sys	debug_putc
 f0 34 5c              ldsp16	r4, [sp+0x5c]
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 d7 00                 sys	debug_putc
 f0 34 50              ldsp16	r4, [sp+0x50]
 d7 00                 sys	debug_putc
 f0 34 5a              ldsp16	r4, [sp+0x5a]
 d7 00                 sys	debug_putc
 f0 34 58              ldsp16	r4, [sp+0x58]
 d7 00                 sys	debug_putc
 f0 34 38              ldsp16	r4, [sp+0x38]
 d7 00                 sys	debug_putc
 f0 34 5c              ldsp16	r4, [sp+0x5c]
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 d7 00                 sys	debug_putc
 f0 34 46              ldsp16	r4, [sp+0x46]
 d7 00                 sys	debug_putc
 f0 34 5a              ldsp16	r4, [sp+0x5a]
 d7 00                 sys	debug_putc
 f0 34 58              ldsp16	r4, [sp+0x58]
 d7 00                 sys	debug_putc
 f0 34 4c              ldsp16	r4, [sp+0x4c]
 d7 00                 sys	debug_putc
 f0 34 5c              ldsp16	r4, [sp+0x5c]
 d7 00                 sys	debug_putc
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 f0 34 28              ldsp16	r4, [sp+0x28]
 d7 00                 sys	debug_putc
 f0 34 40              ldsp16	r4, [sp+0x40]
 d7 00                 sys	debug_putc
 f0 34 5a              ldsp16	r4, [sp+0x5a]
 d7 00                 sys	debug_putc
 f0 34 58              ldsp16	r4, [sp+0x58]
 d7 00                 sys	debug_putc
 f0 34 4e              ldsp16	r4, [sp+0x4e]
 d7 00                 sys	debug_putc
 f0 34 5c              ldsp16	r4, [sp+0x5c]
 d7 00                 sys	debug_putc
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 d7 00                 sys	debug_putc
 f0 34 48              ldsp16	r4, [sp+0x48]
 d7 00                 sys	debug_putc
 f0 34 20              ldsp16	r4, [sp+0x20]
 d7 00                 sys	debug_putc
 f0 34 4a              ldsp16	r4, [sp+0x4a]
 d7 00                 sys	debug_putc
 f0 34 5a              ldsp16	r4, [sp+0x5a]
 d7 00                 sys	debug_putc
 f0 34 58              ldsp16	r4, [sp+0x58]
 d7 00                 sys	debug_putc
 c0 44                 ldi8	r4, 0x44
 d7 00                 sys	debug_putc
 f0 34 5c              ldsp16	r4, [sp+0x5c]
 d7 00                 sys	debug_putc
 f0 34 32              ldsp16	r4, [sp+0x32]
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f0 34 26              ldsp16	r4, [sp+0x26]
 d7 00                 sys	debug_putc
 f0 34 42              ldsp16	r4, [sp+0x42]
 d7 00                 sys	debug_putc
 f0 34 5a              ldsp16	r4, [sp+0x5a]
 d7 00                 sys	debug_putc
 c0 4c                 ldi8	r4, 0x4c
 f0 3c 56              stsp16	[sp+0x56], r4
 d7 00                 sys	debug_putc
 f0 34 44              ldsp16	r4, [sp+0x44]
 d7 00                 sys	debug_putc
 f0 34 5c              ldsp16	r4, [sp+0x5c]
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f0 34 5a              ldsp16	r4, [sp+0x5a]
 d7 00                 sys	debug_putc
 f0 34 56              ldsp16	r4, [sp+0x56]
 d7 00                 sys	debug_putc
 f0 34 58              ldsp16	r4, [sp+0x58]
 d7 00                 sys	debug_putc
 f0 34 5c              ldsp16	r4, [sp+0x5c]
 d7 00                 sys	debug_putc
 f0 34 52              ldsp16	r4, [sp+0x52]
 d7 00                 sys	debug_putc
 f0 34 54              ldsp16	r4, [sp+0x54]
 d7 00                 sys	debug_putc
 f0 34 24              ldsp16	r4, [sp+0x24]
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f0 34 5a              ldsp16	r4, [sp+0x5a]
 d7 00                 sys	debug_putc
 c4 03 01              ldi16	r4, 0x103
 c6 19 01              ldi16	r6, 0x119
 f0 45 18 01           ldm8u	r5, [0x118]
 cd 5a                 cmpi.s8	r5, 0x5a
 f8 05                 cset.eq	r5
 f2 30                 sub	r0, r0
 0d                    mov	r7, r5
 f7 15                 ld8u	r5, [r6+]
 f4 a5                 tst8	r5
 f1 24                 mov	r5, r0
 fb 2f                 cmov.eq	r5, r7
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f1                 brne8	avm_test_main+2339
 f0 3d 5a              stsp16	[sp+0x5a], r5
 c0 09                 ldi8	r4, 0x9
 c6 2d 03              ldi16	r6, 0x32d
 f0 17 a0              leasp	r7, 0xa0
 f0 45 23 03           ldm8u	r5, [0x323]
 f0 3d 52              stsp16	[sp+0x52], r5
 f0 45 22 03           ldm8u	r5, [0x322]
 f0 3d 58              stsp16	[sp+0x58], r5
 f0 45 21 03           ldm8u	r5, [0x321]
 f0 3d 56              stsp16	[sp+0x56], r5
 f0 45 20 03           ldm8u	r5, [0x320]
 f0 3d 54              stsp16	[sp+0x54], r5
 f0 45 1e 02           ldm8u	r5, [0x21e]
 f0 3d 5c              stsp16	[sp+0x5c], r5
 f0 45 1d 02           ldm8u	r5, [0x21d]
 f0 3d 4e              stsp16	[sp+0x4e], r5
 f0 45 1c 02           ldm8u	r5, [0x21c]
 f0 3d 50              stsp16	[sp+0x50], r5
 f0 00 01              ldi8	r0, 0x1
 f7 11                 ld8u	r1, [r6+]
 f7 1a                 ld8u	r2, [r7+]
 f6 2c                 tst16	r4
 f8 0b                 cset.ne	r3
 f4 b4                 dec16	r4
 f5 11                 cmp	r2, r1
 d1 06                 brne8	avm_test_main+2437
 f9 60                 and	r3, r0
 f4 a3                 tst8	r3
 d1 ec                 brne8	avm_test_main+2417
 c0 01                 ldi8	r4, 0x1
 f0 36 5c              ldsp16	r6, [sp+0x5c]
 f1 76                 zext8	r6
 c1 a5                 ldi8	r5, 0xa5
 39                    cmp	r6, r5
 f8 05                 cset.eq	r5
 f5 11                 cmp	r2, r1
 db 81 01              brne16	avm_test_main+2839
 f0 3d 5c              stsp16	[sp+0x5c], r5
 c3 06                 ldi8	r7, 0x6
 f0 04 37 03           ldi16	r0, 0x337
 f0 11 99              leasp	r1, 0x99
 c1 01                 ldi8	r5, 0x1
 f0 6c 41              ld8u	r2, [r0+]
 f0 6c 63              ld8u	r3, [r1+]
 f6 2f                 tst16	r7
 f8 0e                 cset.ne	r6
 f4 b7                 dec16	r7
 f5 1a                 cmp	r3, r2
 d1 05                 brne8	avm_test_main+2489
 89                    and	r6, r5
 f4 a6                 tst8	r6
 d1 eb                 brne8	avm_test_main+2468
 f5 1a                 cmp	r3, r2
 db 59 01              brne16	avm_test_main+2839
 c3 05                 ldi8	r7, 0x5
 f0 04 3e 03           ldi16	r0, 0x33e
 f0 11 93              leasp	r1, 0x93
 c1 01                 ldi8	r5, 0x1
 f0 6c 41              ld8u	r2, [r0+]
 f0 6c 63              ld8u	r3, [r1+]
 f6 2f                 tst16	r7
 f8 0e                 cset.ne	r6
 f4 b7                 dec16	r7
 f5 1a                 cmp	r3, r2
 d1 05                 brne8	avm_test_main+2526
 89                    and	r6, r5
 f4 a6                 tst8	r6
 d1 eb                 brne8	avm_test_main+2505
 f5 1a                 cmp	r3, r2
 db 34 01              brne16	avm_test_main+2839
 f0 17 8e              leasp	r7, 0x8e
 f0 01 04              ldi8	r1, 0x4
 c1 01                 ldi8	r5, 0x1
 f7 18                 ld8u	r0, [r7+]
 f6 29                 tst16	r1
 f8 0e                 cset.ne	r6
 f4 b1                 dec16	r1
 f0 0c 3c              cmpi.s8	r0, 0x3c
 d1 05                 brne8	avm_test_main+2557
 89                    and	r6, r5
 f4 a6                 tst8	r6
 d1 ee                 brne8	avm_test_main+2539
 f0 1e 82              ldsp8u	r6, [sp+0x82]
 f0 0c 3c              cmpi.s8	r0, 0x3c
 f2 42                 sub	r2, r2
 db 0f 01              brne16	avm_test_main+2839
 f1 76                 zext8	r6
 ce 72                 cmpi.s8	r6, 0x72
 db 08 01              brne16	avm_test_main+2839
 f0 01 72              ldi8	r1, 0x72
 c7 45 03              ldi16	r7, 0x345
 f0 10 82              leasp	r0, 0x82
 f4 a1                 tst8	r1
 d0 12                 breq8	avm_test_main+2606
 f7 1d                 ld8u	r5, [r7+]
 f1 28                 mov	r6, r0
 f4 ae                 inc16	r6
 ed 20 21              ld8u	r1, [r0+1]
 f5 0d                 cmp	r1, r5
 f1 06                 mov	r0, r6
 d0 ed                 breq8	avm_test_main+2584
 e0 e9 00              jmp16	avm_test_main+2839
 f0 1d 76              ldsp8u	r5, [sp+0x76]
 cd 73                 cmpi.s8	r5, 0x73
 db e1 00              brne16	avm_test_main+2839
 f0 01 73              ldi8	r1, 0x73
 c7 4d 03              ldi16	r7, 0x34d
 f0 10 76              leasp	r0, 0x76
 f4 a1                 tst8	r1
 d0 12                 breq8	avm_test_main+2645
 f7 1d                 ld8u	r5, [r7+]
 f1 28                 mov	r6, r0
 f4 ae                 inc16	r6
 ed 20 21              ld8u	r1, [r0+1]
 f5 0d                 cmp	r1, r5
 f1 06                 mov	r0, r6
 d0 ed                 breq8	avm_test_main+2623
 e0 c2 00              jmp16	avm_test_main+2839
 f0 1d 6e              ldsp8u	r5, [sp+0x6e]
 cd 69                 cmpi.s8	r5, 0x69
 db ba 00              brne16	avm_test_main+2839
 f0 01 69              ldi8	r1, 0x69
 c7 54 03              ldi16	r7, 0x354
 f0 10 6e              leasp	r0, 0x6e
 f4 a1                 tst8	r1
 d0 12                 breq8	avm_test_main+2684
 f7 1d                 ld8u	r5, [r7+]
 f1 28                 mov	r6, r0
 f4 ae                 inc16	r6
 ed 20 21              ld8u	r1, [r0+1]
 f5 0d                 cmp	r1, r5
 f1 06                 mov	r0, r6
 d0 ed                 breq8	avm_test_main+2662
 e0 9b 00              jmp16	avm_test_main+2839
 f0 1d 66              ldsp8u	r5, [sp+0x66]
 cd 6f                 cmpi.s8	r5, 0x6f
 db 93 00              brne16	avm_test_main+2839
 f0 01 6f              ldi8	r1, 0x6f
 c7 58 03              ldi16	r7, 0x358
 f0 10 66              leasp	r0, 0x66
 f4 a1                 tst8	r1
 d0 11                 breq8	avm_test_main+2722
 f7 1d                 ld8u	r5, [r7+]
 f1 28                 mov	r6, r0
 f4 ae                 inc16	r6
 ed 20 21              ld8u	r1, [r0+1]
 f5 0d                 cmp	r1, r5
 f1 06                 mov	r0, r6
 d0 ed                 breq8	avm_test_main+2701
 d4 75                 jmp8	avm_test_main+2839
 f0 01 01              ldi8	r1, 0x1
 f0 1c 5e              ldsp8u	r4, [sp+0x5e]
 cc 67                 cmpi.s8	r4, 0x67
 f1 21                 mov	r4, r1
 d1 38                 brne8	avm_test_main+2790
 f0 00 67              ldi8	r0, 0x67
 c4 5c 03              ldi16	r4, 0x35c
 f0 17 5e              leasp	r7, 0x5e
 f4 a0                 tst8	r0
 d0 0f                 breq8	avm_test_main+2762
 f7 05                 ld8u	r5, [r4+]
 0b                    mov	r6, r7
 f4 ae                 inc16	r6
 ed 0e 21              ld8u	r0, [r7+1]
 f5 05                 cmp	r0, r5
 0e                    mov	r7, r6
 d0 ef                 breq8	avm_test_main+2743
 d4 03                 jmp8	avm_test_main+2765
 f0 32 5c              ldsp16	r2, [sp+0x5c]
 c0 01                 ldi8	r4, 0x1
 f9 8a                 xor	r4, r2
 f0 37 4e              ldsp16	r7, [sp+0x4e]
 f1 77                 zext8	r7
 c1 a5                 ldi8	r5, 0xa5
 09                    mov	r6, r5
 3e                    cmp	r7, r6
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 f0 34 50              ldsp16	r4, [sp+0x50]
 f1 74                 zext8	r4
 32                    cmp	r4, r6
 f8 0c                 cset.ne	r4
 91                    or	r4, r5
 f0 35 5a              ldsp16	r5, [sp+0x5a]
 f6 2d                 tst16	r5
 f8 06                 cset.eq	r6
 98                    or	r6, r4
 f0 35 52              ldsp16	r5, [sp+0x52]
 f1 75                 zext8	r5
 c0 b6                 ldi8	r4, 0xb6
 34                    cmp	r5, r4
 f8 0d                 cset.ne	r5
 f0 34 54              ldsp16	r4, [sp+0x54]
 f1 74                 zext8	r4
 cc 67                 cmpi.s8	r4, 0x67
 f8 0c                 cset.ne	r4
 92                    or	r4, r6
 f0 36 56              ldsp16	r6, [sp+0x56]
 f1 76                 zext8	r6
 ce 6f                 cmpi.s8	r6, 0x6f
 f8 0e                 cset.ne	r6
 98                    or	r6, r4
 f0 34 58              ldsp16	r4, [sp+0x58]
 f4 a4                 tst8	r4
 f8 0c                 cset.ne	r4
 92                    or	r4, r6
 91                    or	r4, r5
 f9 84                 and	r4, r1
 d6 7f                 adjsp	avm_halt+120
 d6 2b                 adjsp	avm_halt+38
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
