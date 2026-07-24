
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/string_progmem_copy.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 string_progmem_copy.c
0000118a l     O .rodata	00000004 p_cat
0000118e l     O .rodata	00000007 p_abcdef
00001195 l     O .rodata	00000004 p_dog
00001199 l     O .rodata	00000008 p_ignored
00000100 l     O .data	0000000c .L__const.avm_test_main.full
0000010c l     O .data	0000000c .L__const.avm_test_main.cut
000011a1 l     O .rodata	00000005 p_wood
000011a6 l     O .rodata	00000007 p_flower
000011ad l     O .rodata	00000005 p_berg
000011b2 l     O .rodata	00000001 p_empty
000011b3 l     O .rodata	00000003 p_go
00000118 l     O .data	00000107 avm_test_main.long_pad
000011b6 l     O .rodata	00000002 p_z
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
00000436 g     F .text	00000d52 avm_test_main
00001188 g     F .text	00000002 avm_halt
00000416 g     F .text	00000010 test_call_strncpy_P
00000426 g     F .text	00000010 test_call_strncat_P

Disassembly of section .text:

<_start>:
 d5 34                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 fb 2e                 cmov.eq	r5, r6
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 72 0d              call16	avm_halt

<test_call_strncpy_P>:
 b0                    push16	r0
 f1 77                 zext8	r7
 f0 30 05              ldsp16	r0, [sp+0x5]
 04                    mov	r5, r4
 b4                    push16	r4
 01                    mov	r4, r5
 f1 24                 mov	r5, r0
 d7 16                 sys	strncpy_p
 b8                    pop16	r0
 bc                    pop16	r4
 ef                    ret

<test_call_strncat_P>:
 b0                    push16	r0
 f1 77                 zext8	r7
 f0 30 05              ldsp16	r0, [sp+0x5]
 04                    mov	r5, r4
 b4                    push16	r4
 01                    mov	r4, r5
 f1 24                 mov	r5, r0
 d7 17                 sys	strncat_p
 b8                    pop16	r0
 bc                    pop16	r4
 ef                    ret

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 80                 adjsp	-0x80
 d6 b2                 adjsp	-0x4e
 c4 a5 a5              ldi16	r4, 0xa5a5
 f0 3c cc              stsp16	[sp+0xcc], r4
 c4 a5 a5              ldi16	r4, 0xa5a5
 c5 a5 a5              ldi16	r5, 0xa5a5
 f0 3c c8              stsp16	[sp+0xc8], r4
 f0 3d ca              stsp16	[sp+0xca], r5
 f0 3c c4              stsp16	[sp+0xc4], r4
 f0 3d c6              stsp16	[sp+0xc6], r5
 c4 cc cc              ldi16	r4, 0xcccc
 c1 cc                 ldi8	r5, 0xcc
 f0 3c c1              stsp16	[sp+0xc1], r4
 f0 2d c3              stsp8	[sp+0xc3], r5
 c4 cc cc              ldi16	r4, 0xcccc
 c5 cc cc              ldi16	r5, 0xcccc
 f0 3c bd              stsp16	[sp+0xbd], r4
 f0 3d bf              stsp16	[sp+0xbf], r5
 c4 7e 7e              ldi16	r4, 0x7e7e
 f0 3c bb              stsp16	[sp+0xbb], r4
 c4 7e 7e              ldi16	r4, 0x7e7e
 c5 7e 7e              ldi16	r5, 0x7e7e
 f0 3c b7              stsp16	[sp+0xb7], r4
 f0 3d b9              stsp16	[sp+0xb9], r5
 c0 3c                 ldi8	r4, 0x3c
 f0 2c b6              stsp8	[sp+0xb6], r4
 c4 3c 3c              ldi16	r4, 0x3c3c
 c5 3c 3c              ldi16	r5, 0x3c3c
 f0 3c b2              stsp16	[sp+0xb2], r4
 f0 3d b4              stsp16	[sp+0xb4], r5
 d6 fe                 adjsp	avm_test_main+90
 c0 08                 ldi8	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 c6 8a 11              ldi16	r6, 0x118a
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 c6              leasp	r4, 0xc6
 e1 73 ff              call16	test_call_strncpy_P
 d6 02                 adjsp	avm_test_main+113
 c6 8e 11              ldi16	r6, 0x118e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 d6 fe                 adjsp	avm_test_main+118
 c0 03                 ldi8	r4, 0x3
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 bf              leasp	r4, 0xbf
 e1 5e ff              call16	test_call_strncpy_P
 d6 02                 adjsp	avm_test_main+134
 c6 95 11              ldi16	r6, 0x1195
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 d6 fe                 adjsp	avm_test_main+139
 c0 04                 ldi8	r4, 0x4
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 b9              leasp	r4, 0xb9
 e1 49 ff              call16	test_call_strncpy_P
 d6 02                 adjsp	avm_test_main+155
 c6 99 11              ldi16	r6, 0x1199
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 d6 fe                 adjsp	avm_test_main+160
 f2 39                 sub	r1, r1
 f0 39 00              stsp16	[sp+0x0], r1
 f0 14 b4              leasp	r4, 0xb4
 e1 33 ff              call16	test_call_strncpy_P
 d6 02                 adjsp	avm_test_main+177
 c1 0c                 ldi8	r5, 0xc
 c6 00 01              ldi16	r6, 0x100
 f0 14 a6              leasp	r4, 0xa6
 0c                    mov	r7, r4
 b4                    push16	r4
 b5                    push16	r5
 03                    mov	r4, r7
 f1 05                 mov	r0, r5
 06                    mov	r5, r6
 f1 28                 mov	r6, r0
 d7 0f                 sys	memcpy
 bd                    pop16	r5
 bc                    pop16	r4
 c6 0c 01              ldi16	r6, 0x10c
 f0 10 9a              leasp	r0, 0x9a
 f1 2c                 mov	r7, r0
 b4                    push16	r4
 03                    mov	r4, r7
 f1 15                 mov	r2, r5
 06                    mov	r5, r6
 f1 2a                 mov	r6, r2
 d7 0f                 sys	memcpy
 c6 69 63              ldi16	r6, 0x6369
 c3 65                 ldi8	r7, 0x65
 f0 3e 92              stsp16	[sp+0x92], r6
 f0 3f 94              stsp16	[sp+0x94], r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 3e 96              stsp16	[sp+0x96], r6
 f0 3f 98              stsp16	[sp+0x98], r7
 f0 06 6f 61           ldi16	r2, 0x616f
 f0 03 6b              ldi8	r3, 0x6b
 f0 3a 8a              stsp16	[sp+0x8a], r2
 f0 3b 8c              stsp16	[sp+0x8c], r3
 f0 3e 8e              stsp16	[sp+0x8e], r6
 f0 3f 90              stsp16	[sp+0x90], r7
 f0 3e 86              stsp16	[sp+0x86], r6
 f0 3f 88              stsp16	[sp+0x88], r7
 f0 3e 82              stsp16	[sp+0x82], r6
 f0 3f 84              stsp16	[sp+0x84], r7
 d6 fe                 adjsp	avm_test_main+263
 c1 08                 ldi8	r5, 0x8
 bc                    pop16	r4
 f4 41                 stsp16	[sp+0x0], r5
 c6 a1 11              ldi16	r6, 0x11a1
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 e1 d8 fe              call16	test_call_strncat_P
 d6 02                 adjsp	avm_test_main+284
 d6 fe                 adjsp	avm_test_main+282
 c0 03                 ldi8	r4, 0x3
 f4 40                 stsp16	[sp+0x0], r4
 c6 a6 11              ldi16	r6, 0x11a6
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 e1 c4 fe              call16	test_call_strncat_P
 d6 02                 adjsp	avm_test_main+304
 d6 fe                 adjsp	avm_test_main+302
 f0 39 00              stsp16	[sp+0x0], r1
 c6 ad 11              ldi16	r6, 0x11ad
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 94              leasp	r4, 0x94
 e1 b0 fe              call16	test_call_strncat_P
 d6 02                 adjsp	avm_test_main+324
 d6 fe                 adjsp	avm_test_main+322
 c0 04                 ldi8	r4, 0x4
 f4 40                 stsp16	[sp+0x0], r4
 c6 b2 11              ldi16	r6, 0x11b2
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 8c              leasp	r4, 0x8c
 e1 9b fe              call16	test_call_strncat_P
 d6 02                 adjsp	avm_test_main+345
 d6 fe                 adjsp	avm_test_main+343
 f0 00 02              ldi8	r0, 0x2
 f0 38 00              stsp16	[sp+0x0], r0
 c6 b3 11              ldi16	r6, 0x11b3
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 84              leasp	r4, 0x84
 e1 84 fe              call16	test_call_strncat_P
 d6 02                 adjsp	avm_test_main+368
 c4 07 01              ldi16	r4, 0x107
 c5 18 01              ldi16	r5, 0x118
 c2 a5                 ldi8	r6, 0xa5
 f6 0e                 st8	[r5+], r6
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f8                 brne8	avm_test_main+374
 d6 fe                 adjsp	avm_test_main+382
 c4 04 01              ldi16	r4, 0x104
 f4 40                 stsp16	[sp+0x0], r4
 c6 b6 11              ldi16	r6, 0x11b6
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 18 01              ldi16	r4, 0x118
 e1 4e fe              call16	test_call_strncpy_P
 d6 02                 adjsp	avm_test_main+406
 c4 01 01              ldi16	r4, 0x101
 c5 1f 02              ldi16	r5, 0x21f
 c2 64                 ldi8	r6, 0x64
 f6 0e                 st8	[r5+], r6
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f8                 brne8	avm_test_main+412
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
 d6 fe                 adjsp	avm_test_main+456
 f0 38 00              stsp16	[sp+0x0], r0
 c6 b3 11              ldi16	r6, 0x11b3
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 c4 1f 02              ldi16	r4, 0x21f
 e1 16 fe              call16	test_call_strncat_P
 d6 02                 adjsp	avm_test_main+478
 c6 2b 6d              ldi16	r6, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 01 0e              ldi8	r1, 0xe
 f0 15 a6              leasp	r5, 0xa6
 f0 1c b6              ldsp8u	r4, [sp+0xb6]
 f0 3c 52              stsp16	[sp+0x52], r4
 f0 1c b5              ldsp8u	r4, [sp+0xb5]
 f0 3c 46              stsp16	[sp+0x46], r4
 f0 1c b4              ldsp8u	r4, [sp+0xb4]
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 1c b3              ldsp8u	r4, [sp+0xb3]
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 1c b2              ldsp8u	r4, [sp+0xb2]
 f0 3c 7e              stsp16	[sp+0x7e], r4
 f0 1c bc              ldsp8u	r4, [sp+0xbc]
 f0 3c 5c              stsp16	[sp+0x5c], r4
 f0 1c bb              ldsp8u	r4, [sp+0xbb]
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 1c ba              ldsp8u	r4, [sp+0xba]
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 1c b9              ldsp8u	r4, [sp+0xb9]
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 1c b8              ldsp8u	r4, [sp+0xb8]
 f4 78                 stsp16	[sp+0xe], r4
 f0 1c b7              ldsp8u	r4, [sp+0xb7]
 f0 3c 7c              stsp16	[sp+0x7c], r4
 f0 1c c3              ldsp8u	r4, [sp+0xc3]
 f0 3c 5e              stsp16	[sp+0x5e], r4
 f0 1c c2              ldsp8u	r4, [sp+0xc2]
 f4 68                 stsp16	[sp+0xa], r4
 f0 1c c1              ldsp8u	r4, [sp+0xc1]
 f4 58                 stsp16	[sp+0x6], r4
 f0 1c c0              ldsp8u	r4, [sp+0xc0]
 f4 50                 stsp16	[sp+0x4], r4
 f0 1c bf              ldsp8u	r4, [sp+0xbf]
 f4 48                 stsp16	[sp+0x2], r4
 f0 1c be              ldsp8u	r4, [sp+0xbe]
 f4 40                 stsp16	[sp+0x0], r4
 f0 1c bd              ldsp8u	r4, [sp+0xbd]
 f0 3c 7a              stsp16	[sp+0x7a], r4
 f0 1c cd              ldsp8u	r4, [sp+0xcd]
 f0 3c 5a              stsp16	[sp+0x5a], r4
 f0 1c cc              ldsp8u	r4, [sp+0xcc]
 f0 3c 58              stsp16	[sp+0x58], r4
 f0 1c cb              ldsp8u	r4, [sp+0xcb]
 f0 3c 54              stsp16	[sp+0x54], r4
 f0 1c ca              ldsp8u	r4, [sp+0xca]
 f0 3c 50              stsp16	[sp+0x50], r4
 f0 1c c9              ldsp8u	r4, [sp+0xc9]
 f0 3c 4e              stsp16	[sp+0x4e], r4
 f0 1c c8              ldsp8u	r4, [sp+0xc8]
 f0 3c 4c              stsp16	[sp+0x4c], r4
 f0 1c c7              ldsp8u	r4, [sp+0xc7]
 f0 3c 4a              stsp16	[sp+0x4a], r4
 f0 1c c6              ldsp8u	r4, [sp+0xc6]
 f0 3c 48              stsp16	[sp+0x48], r4
 f0 1c c5              ldsp8u	r4, [sp+0xc5]
 f0 3c 44              stsp16	[sp+0x44], r4
 f0 1c c4              ldsp8u	r4, [sp+0xc4]
 f0 3c 56              stsp16	[sp+0x56], r4
 f0 00 be              ldi8	r0, 0xbe
 02                    mov	r4, r6
 fa 7b                 lsr16i	r4, 0xb
 fa 55                 lsl16i	r6, 0x5
 98                    or	r6, r4
 f7 0c                 ld8u	r4, [r5+]
 a2                    xor	r4, r6
 f0 09 ef              addi.s8	r1, -0x11
 cb 11                 addi.s8	r7, 0x11
 0b                    mov	r6, r7
 18                    add	r6, r4
 f5 2c                 cmp	r7, r0
 d1 ec                 brne8	avm_test_main+653
 f0 3c 74              stsp16	[sp+0x74], r4
 1c                    add	r7, r4
 f0 3f 6e              stsp16	[sp+0x6e], r7
 c6 2b 6d              ldi16	r6, 0x6d2b
 c4 f2 ff              ldi16	r4, 0xfff2
 f0 03 0e              ldi8	r3, 0xe
 f0 15 9a              leasp	r5, 0x9a
 0e                    mov	r7, r6
 fa ab                 lsr16i	r7, 0xb
 fa 55                 lsl16i	r6, 0x5
 9b                    or	r6, r7
 f7 0f                 ld8u	r7, [r5+]
 ae                    xor	r7, r6
 f0 0b ef              addi.s8	r3, -0x11
 c8 11                 addi.s8	r4, 0x11
 08                    mov	r6, r4
 1b                    add	r6, r7
 f5 20                 cmp	r4, r0
 d1 ec                 brne8	avm_test_main+692
 f0 39 68              stsp16	[sp+0x68], r1
 f0 3f 70              stsp16	[sp+0x70], r7
 13                    add	r4, r7
 f0 3c 6a              stsp16	[sp+0x6a], r4
 c4 2b 6d              ldi16	r4, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 02 0e              ldi8	r2, 0xe
 f0 04 18 01           ldi16	r0, 0x118
 f0 1d 89              ldsp8u	r5, [sp+0x89]
 f0 3d 40              stsp16	[sp+0x40], r5
 f0 1d 88              ldsp8u	r5, [sp+0x88]
 f0 3d 3e              stsp16	[sp+0x3e], r5
 f0 1d 87              ldsp8u	r5, [sp+0x87]
 f0 3d 3c              stsp16	[sp+0x3c], r5
 f0 1d 86              ldsp8u	r5, [sp+0x86]
 f0 3d 38              stsp16	[sp+0x38], r5
 f0 1d 85              ldsp8u	r5, [sp+0x85]
 f0 3d 36              stsp16	[sp+0x36], r5
 f0 1d 84              ldsp8u	r5, [sp+0x84]
 f0 3d 34              stsp16	[sp+0x34], r5
 f0 1d 83              ldsp8u	r5, [sp+0x83]
 f0 3d 32              stsp16	[sp+0x32], r5
 f0 1d 82              ldsp8u	r5, [sp+0x82]
 f0 3d 60              stsp16	[sp+0x60], r5
 f0 1d 91              ldsp8u	r5, [sp+0x91]
 f0 3d 42              stsp16	[sp+0x42], r5
 f0 1d 90              ldsp8u	r5, [sp+0x90]
 f0 3d 30              stsp16	[sp+0x30], r5
 f0 1d 8f              ldsp8u	r5, [sp+0x8f]
 f0 3d 2e              stsp16	[sp+0x2e], r5
 f0 1d 8e              ldsp8u	r5, [sp+0x8e]
 f0 3d 2c              stsp16	[sp+0x2c], r5
 f0 1d 8d              ldsp8u	r5, [sp+0x8d]
 f0 3d 2a              stsp16	[sp+0x2a], r5
 f0 1d 8c              ldsp8u	r5, [sp+0x8c]
 f0 3d 28              stsp16	[sp+0x28], r5
 f0 1d 8b              ldsp8u	r5, [sp+0x8b]
 f0 3d 26              stsp16	[sp+0x26], r5
 f0 1d 8a              ldsp8u	r5, [sp+0x8a]
 f0 3d 76              stsp16	[sp+0x76], r5
 f0 1d 99              ldsp8u	r5, [sp+0x99]
 f0 3d 20              stsp16	[sp+0x20], r5
 f0 1d 98              ldsp8u	r5, [sp+0x98]
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 1d 97              ldsp8u	r5, [sp+0x97]
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f0 1d 96              ldsp8u	r5, [sp+0x96]
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 1d 95              ldsp8u	r5, [sp+0x95]
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 1d 94              ldsp8u	r5, [sp+0x94]
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 1d 93              ldsp8u	r5, [sp+0x93]
 f4 71                 stsp16	[sp+0xc], r5
 f0 1d 92              ldsp8u	r5, [sp+0x92]
 f0 3d 78              stsp16	[sp+0x78], r5
 07                    mov	r5, r7
 0c                    mov	r7, r4
 fa ab                 lsr16i	r7, 0xb
 fa 35                 lsl16i	r4, 0x5
 93                    or	r4, r7
 f0 6c c1              ld8u	r6, [r0+]
 a8                    xor	r6, r4
 f0 0a ef              addi.s8	r2, -0x11
 c9 11                 addi.s8	r5, 0x11
 01                    mov	r4, r5
 12                    add	r4, r6
 c7 69 11              ldi16	r7, 0x1169
 37                    cmp	r5, r7
 d1 e9                 brne8	avm_test_main+879
 f0 3e 72              stsp16	[sp+0x72], r6
 16                    add	r5, r6
 f0 3d 6c              stsp16	[sp+0x6c], r5
 c7 2b 6d              ldi16	r7, 0x6d2b
 c4 f2 ff              ldi16	r4, 0xfff2
 f0 3c 80              stsp16	[sp+0x80], r4
 f0 00 0e              ldi8	r0, 0xe
 c4 1f 02              ldi16	r4, 0x21f
 07                    mov	r5, r7
 fa 8b                 lsr16i	r5, 0xb
 fa 65                 lsl16i	r7, 0x5
 9d                    or	r7, r5
 f7 05                 ld8u	r5, [r4+]
 a7                    xor	r5, r7
 f0 08 ef              addi.s8	r0, -0x11
 f0 36 80              ldsp16	r6, [sp+0x80]
 ca 11                 addi.s8	r6, 0x11
 0e                    mov	r7, r6
 f1 0d                 mov	r1, r5
 1d                    add	r7, r5
 c5 e0 11              ldi16	r5, 0x11e0
 f0 3e 80              stsp16	[sp+0x80], r6
 39                    cmp	r6, r5
 d1 e2                 brne8	avm_test_main+924
 f0 34 74              ldsp16	r4, [sp+0x74]
 f0 35 68              ldsp16	r5, [sp+0x68]
 21                    sub	r4, r5
 f0 3c 74              stsp16	[sp+0x74], r4
 f1 74                 zext8	r4
 0c                    mov	r7, r4
 fa a4                 lsr16i	r7, 0x4
 c2 30                 ldi8	r6, 0x30
 07                    mov	r5, r7
 96                    or	r5, r6
 cb 37                 addi.s8	r7, 0x37
 c2 a0                 ldi8	r6, 0xa0
 32                    cmp	r4, r6
 fc 3d                 cmov.ult	r7, r5
 f0 3f 64              stsp16	[sp+0x64], r7
 f0 34 70              ldsp16	r4, [sp+0x70]
 f2 53                 sub	r4, r3
 f0 3c 70              stsp16	[sp+0x70], r4
 f1 74                 zext8	r4
 0c                    mov	r7, r4
 fa a4                 lsr16i	r7, 0x4
 07                    mov	r5, r7
 f0 03 30              ldi8	r3, 0x30
 f9 ad                 or	r5, r3
 cb 37                 addi.s8	r7, 0x37
 32                    cmp	r4, r6
 fc 3d                 cmov.ult	r7, r5
 f0 3f 62              stsp16	[sp+0x62], r7
 f0 34 72              ldsp16	r4, [sp+0x72]
 f2 52                 sub	r4, r2
 f0 3c 72              stsp16	[sp+0x72], r4
 f1 74                 zext8	r4
 0c                    mov	r7, r4
 fa a4                 lsr16i	r7, 0x4
 07                    mov	r5, r7
 f9 ad                 or	r5, r3
 cb 37                 addi.s8	r7, 0x37
 f1 16                 mov	r2, r6
 f5 22                 cmp	r4, r2
 fc 3d                 cmov.ult	r7, r5
 f0 3f 68              stsp16	[sp+0x68], r7
 f0 39 3a              stsp16	[sp+0x3a], r1
 f2 38                 sub	r1, r0
 f0 39 08              stsp16	[sp+0x8], r1
 f1 21                 mov	r4, r1
 f1 74                 zext8	r4
 08                    mov	r6, r4
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f5 22                 cmp	r4, r2
 f1 02                 mov	r0, r2
 fc 35                 cmov.ult	r6, r5
 f0 3e 66              stsp16	[sp+0x66], r6
 f0 06 6d 05           ldi16	r2, 0x56d
 f0 35 7a              ldsp16	r5, [sp+0x7a]
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
 f4 28                 ldsp16	r4, [sp+0xa]
 a4                    xor	r5, r4
 c9 58                 addi.s8	r5, 0x58
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 5e              ldsp16	r4, [sp+0x5e]
 a4                    xor	r5, r4
 c9 69                 addi.s8	r5, 0x69
 f0 3d 7a              stsp16	[sp+0x7a], r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 08                    mov	r6, r4
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f5 20                 cmp	r4, r0
 fc 35                 cmov.ult	r6, r5
 f0 3e 5e              stsp16	[sp+0x5e], r6
 f0 35 7c              ldsp16	r5, [sp+0x7c]
 f9 aa                 xor	r5, r2
 fa 45                 lsl16i	r5, 0x5
 c9 74                 addi.s8	r5, 0x74
 f4 38                 ldsp16	r4, [sp+0xe]
 a4                    xor	r5, r4
 c9 14                 addi.s8	r5, 0x14
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 a4                    xor	r5, r4
 c9 25                 addi.s8	r5, 0x25
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 16              ldsp16	r4, [sp+0x16]
 a4                    xor	r5, r4
 c9 36                 addi.s8	r5, 0x36
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 a4                    xor	r5, r4
 c9 47                 addi.s8	r5, 0x47
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 5c              ldsp16	r4, [sp+0x5c]
 a4                    xor	r5, r4
 c9 58                 addi.s8	r5, 0x58
 f0 3d 7c              stsp16	[sp+0x7c], r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 08                    mov	r6, r4
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f5 20                 cmp	r4, r0
 fc 35                 cmov.ult	r6, r5
 f0 3e 5c              stsp16	[sp+0x5c], r6
 f0 35 7e              ldsp16	r5, [sp+0x7e]
 f9 aa                 xor	r5, r2
 fa 45                 lsl16i	r5, 0x5
 c9 74                 addi.s8	r5, 0x74
 f0 34 22              ldsp16	r4, [sp+0x22]
 a4                    xor	r5, r4
 c9 14                 addi.s8	r5, 0x14
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 24              ldsp16	r4, [sp+0x24]
 a4                    xor	r5, r4
 c9 25                 addi.s8	r5, 0x25
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 46              ldsp16	r4, [sp+0x46]
 a4                    xor	r5, r4
 c9 36                 addi.s8	r5, 0x36
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 52              ldsp16	r4, [sp+0x52]
 a4                    xor	r5, r4
 c9 47                 addi.s8	r5, 0x47
 f0 3d 7e              stsp16	[sp+0x7e], r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 08                    mov	r6, r4
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f5 20                 cmp	r4, r0
 fc 35                 cmov.ult	r6, r5
 f0 3e 52              stsp16	[sp+0x52], r6
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
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 a4                    xor	r5, r4
 c9 58                 addi.s8	r5, 0x58
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 a4                    xor	r5, r4
 c9 69                 addi.s8	r5, 0x69
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 20              ldsp16	r4, [sp+0x20]
 a4                    xor	r5, r4
 c9 7a                 addi.s8	r5, 0x7a
 f0 3d 78              stsp16	[sp+0x78], r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 08                    mov	r6, r4
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f5 20                 cmp	r4, r0
 fc 35                 cmov.ult	r6, r5
 f0 3e 46              stsp16	[sp+0x46], r6
 f0 35 76              ldsp16	r5, [sp+0x76]
 f9 aa                 xor	r5, r2
 fa 45                 lsl16i	r5, 0x5
 c9 74                 addi.s8	r5, 0x74
 f0 34 26              ldsp16	r4, [sp+0x26]
 a4                    xor	r5, r4
 c9 14                 addi.s8	r5, 0x14
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 28              ldsp16	r4, [sp+0x28]
 a4                    xor	r5, r4
 c9 25                 addi.s8	r5, 0x25
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 a4                    xor	r5, r4
 c9 36                 addi.s8	r5, 0x36
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 a4                    xor	r5, r4
 c9 47                 addi.s8	r5, 0x47
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 a4                    xor	r5, r4
 c9 58                 addi.s8	r5, 0x58
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 30              ldsp16	r4, [sp+0x30]
 a4                    xor	r5, r4
 c9 69                 addi.s8	r5, 0x69
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 42              ldsp16	r4, [sp+0x42]
 a4                    xor	r5, r4
 c9 7a                 addi.s8	r5, 0x7a
 f0 3d 76              stsp16	[sp+0x76], r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 08                    mov	r6, r4
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 f5 20                 cmp	r4, r0
 fc 35                 cmov.ult	r6, r5
 f0 3e 42              stsp16	[sp+0x42], r6
 f0 36 60              ldsp16	r6, [sp+0x60]
 f9 ca                 xor	r6, r2
 fa 55                 lsl16i	r6, 0x5
 ca 74                 addi.s8	r6, 0x74
 f0 34 32              ldsp16	r4, [sp+0x32]
 a8                    xor	r6, r4
 ca 14                 addi.s8	r6, 0x14
 02                    mov	r4, r6
 fa 7b                 lsr16i	r4, 0xb
 fa 55                 lsl16i	r6, 0x5
 98                    or	r6, r4
 f0 34 34              ldsp16	r4, [sp+0x34]
 a8                    xor	r6, r4
 ca 25                 addi.s8	r6, 0x25
 02                    mov	r4, r6
 fa 7b                 lsr16i	r4, 0xb
 fa 55                 lsl16i	r6, 0x5
 98                    or	r6, r4
 f0 34 36              ldsp16	r4, [sp+0x36]
 a8                    xor	r6, r4
 ca 36                 addi.s8	r6, 0x36
 02                    mov	r4, r6
 fa 7b                 lsr16i	r4, 0xb
 fa 55                 lsl16i	r6, 0x5
 98                    or	r6, r4
 f0 34 38              ldsp16	r4, [sp+0x38]
 a8                    xor	r6, r4
 ca 47                 addi.s8	r6, 0x47
 02                    mov	r4, r6
 fa 7b                 lsr16i	r4, 0xb
 fa 55                 lsl16i	r6, 0x5
 98                    or	r6, r4
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 a8                    xor	r6, r4
 ca 58                 addi.s8	r6, 0x58
 02                    mov	r4, r6
 fa 7b                 lsr16i	r4, 0xb
 fa 55                 lsl16i	r6, 0x5
 98                    or	r6, r4
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 a8                    xor	r6, r4
 ca 69                 addi.s8	r6, 0x69
 02                    mov	r4, r6
 fa 7b                 lsr16i	r4, 0xb
 fa 55                 lsl16i	r6, 0x5
 98                    or	r6, r4
 f0 34 40              ldsp16	r4, [sp+0x40]
 a8                    xor	r6, r4
 ca 7a                 addi.s8	r6, 0x7a
 06                    mov	r5, r6
 f1 75                 zext8	r5
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 0c                    mov	r7, r4
 f9 ed                 or	r7, r3
 c8 37                 addi.s8	r4, 0x37
 f5 24                 cmp	r5, r0
 fc 27                 cmov.ult	r4, r7
 f0 3c 60              stsp16	[sp+0x60], r4
 f0 35 56              ldsp16	r5, [sp+0x56]
 f9 aa                 xor	r5, r2
 fa 45                 lsl16i	r5, 0x5
 c9 74                 addi.s8	r5, 0x74
 f0 34 44              ldsp16	r4, [sp+0x44]
 a4                    xor	r5, r4
 c9 14                 addi.s8	r5, 0x14
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 48              ldsp16	r4, [sp+0x48]
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
 f0 34 4c              ldsp16	r4, [sp+0x4c]
 a4                    xor	r5, r4
 c9 47                 addi.s8	r5, 0x47
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 4e              ldsp16	r4, [sp+0x4e]
 a4                    xor	r5, r4
 c9 58                 addi.s8	r5, 0x58
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 50              ldsp16	r4, [sp+0x50]
 a4                    xor	r5, r4
 c9 69                 addi.s8	r5, 0x69
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 54              ldsp16	r4, [sp+0x54]
 a4                    xor	r5, r4
 c9 7a                 addi.s8	r5, 0x7a
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 58              ldsp16	r4, [sp+0x58]
 a4                    xor	r5, r4
 c0 8b                 ldi8	r4, 0x8b
 11                    add	r4, r5
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 35 5a              ldsp16	r5, [sp+0x5a]
 a1                    xor	r4, r5
 c1 9c                 ldi8	r5, 0x9c
 14                    add	r5, r4
 f0 3d 4e              stsp16	[sp+0x4e], r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 0c                    mov	r7, r4
 fa a4                 lsr16i	r7, 0x4
 07                    mov	r5, r7
 f9 ad                 or	r5, r3
 cb 37                 addi.s8	r7, 0x37
 f5 20                 cmp	r4, r0
 fc 3d                 cmov.ult	r7, r5
 f0 3f 56              stsp16	[sp+0x56], r7
 f0 34 6e              ldsp16	r4, [sp+0x6e]
 fa 78                 lsr16i	r4, 0x8
 f0 00 0f              ldi8	r0, 0xf
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3d                 cmov.ult	r7, r5
 f0 3f 5a              stsp16	[sp+0x5a], r7
 f0 37 6e              ldsp16	r7, [sp+0x6e]
 07                    mov	r5, r7
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 f0 05 00 a0           ldi16	r1, 0xa000
 f5 2d                 cmp	r7, r1
 fc 2c                 cmov.ult	r5, r4
 f0 3d 6e              stsp16	[sp+0x6e], r5
 f0 35 70              ldsp16	r5, [sp+0x70]
 f9 a0                 and	r5, r0
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 0d                    mov	r7, r5
 cb 37                 addi.s8	r7, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 3c                 cmov.ult	r7, r4
 f0 3f 70              stsp16	[sp+0x70], r7
 f0 34 6a              ldsp16	r4, [sp+0x6a]
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3d                 cmov.ult	r7, r5
 f0 3f 58              stsp16	[sp+0x58], r7
 f0 35 74              ldsp16	r5, [sp+0x74]
 f9 a0                 and	r5, r0
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 0d                    mov	r7, r5
 cb 37                 addi.s8	r7, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 3c                 cmov.ult	r7, r4
 f0 3f 4c              stsp16	[sp+0x4c], r7
 f0 37 6a              ldsp16	r7, [sp+0x6a]
 07                    mov	r5, r7
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 f5 2d                 cmp	r7, r1
 fc 2c                 cmov.ult	r5, r4
 f0 3d 54              stsp16	[sp+0x54], r5
 f4 21                 ldsp16	r5, [sp+0x8]
 f9 a0                 and	r5, r0
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 0d                    mov	r7, r5
 cb 37                 addi.s8	r7, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 3c                 cmov.ult	r7, r4
 f0 3f 50              stsp16	[sp+0x50], r7
 f0 35 80              ldsp16	r5, [sp+0x80]
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 14                    add	r5, r4
 0d                    mov	r7, r5
 fa a8                 lsr16i	r7, 0x8
 f9 e0                 and	r7, r0
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 f0 3c 80              stsp16	[sp+0x80], r4
 03                    mov	r4, r7
 c8 37                 addi.s8	r4, 0x37
 cf 0a                 cmpi.s8	r7, 0xa
 f0 37 80              ldsp16	r7, [sp+0x80]
 fc 27                 cmov.ult	r4, r7
 f0 3c 74              stsp16	[sp+0x74], r4
 0d                    mov	r7, r5
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 cb 37                 addi.s8	r7, 0x37
 f5 25                 cmp	r5, r1
 fc 3c                 cmov.ult	r7, r4
 f0 3f 6a              stsp16	[sp+0x6a], r7
 f0 35 72              ldsp16	r5, [sp+0x72]
 f9 a0                 and	r5, r0
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 f1 15                 mov	r2, r5
 f0 0a 37              addi.s8	r2, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 14                 cmov.ult	r2, r4
 f0 34 6c              ldsp16	r4, [sp+0x6c]
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3d                 cmov.ult	r7, r5
 f0 3f 72              stsp16	[sp+0x72], r7
 f0 37 6c              ldsp16	r7, [sp+0x6c]
 07                    mov	r5, r7
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 f5 2d                 cmp	r7, r1
 fc 2c                 cmov.ult	r5, r4
 f0 3d 6c              stsp16	[sp+0x6c], r5
 f0 35 7a              ldsp16	r5, [sp+0x7a]
 f9 a0                 and	r5, r0
 0d                    mov	r7, r5
 f9 ed                 or	r7, r3
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 27                 cmov.ult	r4, r7
 f0 3c 4a              stsp16	[sp+0x4a], r4
 f0 34 7a              ldsp16	r4, [sp+0x7a]
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 0c                    mov	r7, r4
 f9 ed                 or	r7, r3
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2f                 cmov.ult	r5, r7
 f0 3d 48              stsp16	[sp+0x48], r5
 f0 37 7a              ldsp16	r7, [sp+0x7a]
 07                    mov	r5, r7
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 f5 2d                 cmp	r7, r1
 fc 2c                 cmov.ult	r5, r4
 f0 3d 40              stsp16	[sp+0x40], r5
 f0 35 7c              ldsp16	r5, [sp+0x7c]
 f9 a0                 and	r5, r0
 0d                    mov	r7, r5
 f9 ed                 or	r7, r3
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 27                 cmov.ult	r4, r7
 f0 3c 44              stsp16	[sp+0x44], r4
 f0 34 7c              ldsp16	r4, [sp+0x7c]
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 0c                    mov	r7, r4
 f9 ed                 or	r7, r3
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2f                 cmov.ult	r5, r7
 f0 3d 3c              stsp16	[sp+0x3c], r5
 f0 37 7c              ldsp16	r7, [sp+0x7c]
 07                    mov	r5, r7
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 f5 2d                 cmp	r7, r1
 fc 2c                 cmov.ult	r5, r4
 f0 3d 36              stsp16	[sp+0x36], r5
 f0 35 7e              ldsp16	r5, [sp+0x7e]
 f9 a0                 and	r5, r0
 0d                    mov	r7, r5
 f9 ed                 or	r7, r3
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 27                 cmov.ult	r4, r7
 f0 3c 38              stsp16	[sp+0x38], r4
 f0 34 7e              ldsp16	r4, [sp+0x7e]
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 0c                    mov	r7, r4
 f9 ed                 or	r7, r3
 04                    mov	r5, r4
 c9 37                 addi.s8	r5, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 2f                 cmov.ult	r5, r7
 f0 3d 32              stsp16	[sp+0x32], r5
 f0 37 7e              ldsp16	r7, [sp+0x7e]
 07                    mov	r5, r7
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 f5 2d                 cmp	r7, r1
 fc 2c                 cmov.ult	r5, r4
 f0 3d 30              stsp16	[sp+0x30], r5
 02                    mov	r4, r6
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3d                 cmov.ult	r7, r5
 f0 3f 3e              stsp16	[sp+0x3e], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3d                 cmov.ult	r7, r5
 f0 3f 3a              stsp16	[sp+0x3a], r7
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 f5 29                 cmp	r6, r1
 fc 2c                 cmov.ult	r5, r4
 f0 3d 34              stsp16	[sp+0x34], r5
 f0 36 76              ldsp16	r6, [sp+0x76]
 02                    mov	r4, r6
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3d                 cmov.ult	r7, r5
 f0 3f 2e              stsp16	[sp+0x2e], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3d                 cmov.ult	r7, r5
 f0 3f 2c              stsp16	[sp+0x2c], r7
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 f5 29                 cmp	r6, r1
 fc 2c                 cmov.ult	r5, r4
 f0 3d 76              stsp16	[sp+0x76], r5
 f0 36 78              ldsp16	r6, [sp+0x78]
 02                    mov	r4, r6
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3d                 cmov.ult	r7, r5
 f0 3f 2a              stsp16	[sp+0x2a], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3d                 cmov.ult	r7, r5
 f0 3f 28              stsp16	[sp+0x28], r7
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 8d                 or	r4, r3
 c9 37                 addi.s8	r5, 0x37
 f5 29                 cmp	r6, r1
 fc 2c                 cmov.ult	r5, r4
 f0 3d 78              stsp16	[sp+0x78], r5
 f0 36 4e              ldsp16	r6, [sp+0x4e]
 02                    mov	r4, r6
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3d                 cmov.ult	r7, r5
 f0 3f 26              stsp16	[sp+0x26], r7
 0e                    mov	r7, r6
 fa ac                 lsr16i	r7, 0xc
 07                    mov	r5, r7
 f9 ad                 or	r5, r3
 cb 37                 addi.s8	r7, 0x37
 f5 29                 cmp	r6, r1
 fc 3d                 cmov.ult	r7, r5
 fa 98                 lsr16i	r6, 0x8
 f9 c0                 and	r6, r0
 06                    mov	r5, r6
 02                    mov	r4, r6
 f9 ad                 or	r5, r3
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 c1 52                 ldi8	r5, 0x52
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c1 46                 ldi8	r5, 0x46
 01                    mov	r4, r5
 f0 3c 7a              stsp16	[sp+0x7a], r4
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 f0 3c 7e              stsp16	[sp+0x7e], r4
 f0 34 7e              ldsp16	r4, [sp+0x7e]
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 c1 37                 ldi8	r5, 0x37
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 7a              ldsp16	r4, [sp+0x7a]
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 f0 3c 80              stsp16	[sp+0x80], r4
 f0 34 80              ldsp16	r4, [sp+0x80]
 d7 00                 sys	debug_putc
 c1 4e                 ldi8	r5, 0x4e
 01                    mov	r4, r5
 f0 3c 7c              stsp16	[sp+0x7c], r4
 d7 00                 sys	debug_putc
 c1 50                 ldi8	r5, 0x50
 01                    mov	r4, r5
 f0 3c 4e              stsp16	[sp+0x4e], r4
 d7 00                 sys	debug_putc
 f0 34 7e              ldsp16	r4, [sp+0x7e]
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f0 34 56              ldsp16	r4, [sp+0x56]
 d7 00                 sys	debug_putc
 f0 34 26              ldsp16	r4, [sp+0x26]
 d7 00                 sys	debug_putc
 f0 34 80              ldsp16	r4, [sp+0x80]
 d7 00                 sys	debug_putc
 f0 34 7c              ldsp16	r4, [sp+0x7c]
 d7 00                 sys	debug_putc
 c0 54                 ldi8	r4, 0x54
 f0 3c 56              stsp16	[sp+0x56], r4
 d7 00                 sys	debug_putc
 f0 34 7e              ldsp16	r4, [sp+0x7e]
 d7 00                 sys	debug_putc
 f0 34 40              ldsp16	r4, [sp+0x40]
 d7 00                 sys	debug_putc
 f0 34 48              ldsp16	r4, [sp+0x48]
 d7 00                 sys	debug_putc
 f0 34 5e              ldsp16	r4, [sp+0x5e]
 d7 00                 sys	debug_putc
 f0 34 4a              ldsp16	r4, [sp+0x4a]
 d7 00                 sys	debug_putc
 f0 34 80              ldsp16	r4, [sp+0x80]
 d7 00                 sys	debug_putc
 f0 34 7c              ldsp16	r4, [sp+0x7c]
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 f0 3c 5e              stsp16	[sp+0x5e], r4
 d7 00                 sys	debug_putc
 f0 34 7e              ldsp16	r4, [sp+0x7e]
 d7 00                 sys	debug_putc
 f0 34 36              ldsp16	r4, [sp+0x36]
 d7 00                 sys	debug_putc
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 d7 00                 sys	debug_putc
 f0 34 5c              ldsp16	r4, [sp+0x5c]
 d7 00                 sys	debug_putc
 f0 34 44              ldsp16	r4, [sp+0x44]
 d7 00                 sys	debug_putc
 f0 34 80              ldsp16	r4, [sp+0x80]
 d7 00                 sys	debug_putc
 f0 34 7c              ldsp16	r4, [sp+0x7c]
 d7 00                 sys	debug_putc
 c0 5a                 ldi8	r4, 0x5a
 f0 3c 5c              stsp16	[sp+0x5c], r4
 d7 00                 sys	debug_putc
 f0 34 7e              ldsp16	r4, [sp+0x7e]
 d7 00                 sys	debug_putc
 f0 35 30              ldsp16	r5, [sp+0x30]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 32              ldsp16	r5, [sp+0x32]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 52              ldsp16	r5, [sp+0x52]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 38              ldsp16	r5, [sp+0x38]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 80              ldsp16	r4, [sp+0x80]
 d7 00                 sys	debug_putc
 c1 43                 ldi8	r5, 0x43
 01                    mov	r4, r5
 f0 3c 7c              stsp16	[sp+0x7c], r4
 d7 00                 sys	debug_putc
 f0 34 7a              ldsp16	r4, [sp+0x7a]
 d7 00                 sys	debug_putc
 f0 34 7e              ldsp16	r4, [sp+0x7e]
 d7 00                 sys	debug_putc
 f0 35 6e              ldsp16	r5, [sp+0x6e]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 5a              ldsp16	r5, [sp+0x5a]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 64              ldsp16	r5, [sp+0x64]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 4c              ldsp16	r5, [sp+0x4c]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 80              ldsp16	r4, [sp+0x80]
 d7 00                 sys	debug_putc
 f0 34 7c              ldsp16	r4, [sp+0x7c]
 d7 00                 sys	debug_putc
 f0 34 56              ldsp16	r4, [sp+0x56]
 d7 00                 sys	debug_putc
 f0 34 7e              ldsp16	r4, [sp+0x7e]
 d7 00                 sys	debug_putc
 f0 35 54              ldsp16	r5, [sp+0x54]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 58              ldsp16	r5, [sp+0x58]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 62              ldsp16	r5, [sp+0x62]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 70              ldsp16	r5, [sp+0x70]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 80              ldsp16	r4, [sp+0x80]
 d7 00                 sys	debug_putc
 f0 34 7c              ldsp16	r4, [sp+0x7c]
 d7 00                 sys	debug_putc
 f0 34 5c              ldsp16	r4, [sp+0x5c]
 d7 00                 sys	debug_putc
 f0 34 7e              ldsp16	r4, [sp+0x7e]
 d7 00                 sys	debug_putc
 f0 34 78              ldsp16	r4, [sp+0x78]
 d7 00                 sys	debug_putc
 f0 34 28              ldsp16	r4, [sp+0x28]
 d7 00                 sys	debug_putc
 f0 34 46              ldsp16	r4, [sp+0x46]
 d7 00                 sys	debug_putc
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 d7 00                 sys	debug_putc
 f0 34 80              ldsp16	r4, [sp+0x80]
 d7 00                 sys	debug_putc
 f0 34 7c              ldsp16	r4, [sp+0x7c]
 d7 00                 sys	debug_putc
 f0 34 5e              ldsp16	r4, [sp+0x5e]
 d7 00                 sys	debug_putc
 f0 34 7e              ldsp16	r4, [sp+0x7e]
 d7 00                 sys	debug_putc
 f0 34 76              ldsp16	r4, [sp+0x76]
 d7 00                 sys	debug_putc
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 d7 00                 sys	debug_putc
 f0 34 42              ldsp16	r4, [sp+0x42]
 d7 00                 sys	debug_putc
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 d7 00                 sys	debug_putc
 f0 34 80              ldsp16	r4, [sp+0x80]
 d7 00                 sys	debug_putc
 f0 34 7c              ldsp16	r4, [sp+0x7c]
 d7 00                 sys	debug_putc
 c0 44                 ldi8	r4, 0x44
 d7 00                 sys	debug_putc
 f0 34 7e              ldsp16	r4, [sp+0x7e]
 d7 00                 sys	debug_putc
 f0 34 34              ldsp16	r4, [sp+0x34]
 d7 00                 sys	debug_putc
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 d7 00                 sys	debug_putc
 f0 34 60              ldsp16	r4, [sp+0x60]
 d7 00                 sys	debug_putc
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 d7 00                 sys	debug_putc
 f0 34 80              ldsp16	r4, [sp+0x80]
 d7 00                 sys	debug_putc
 c0 4c                 ldi8	r4, 0x4c
 f0 3c 7a              stsp16	[sp+0x7a], r4
 d7 00                 sys	debug_putc
 f0 34 4e              ldsp16	r4, [sp+0x4e]
 d7 00                 sys	debug_putc
 f0 34 7e              ldsp16	r4, [sp+0x7e]
 d7 00                 sys	debug_putc
 f0 35 6c              ldsp16	r5, [sp+0x6c]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 72              ldsp16	r5, [sp+0x72]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 35 68              ldsp16	r5, [sp+0x68]
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f0 34 80              ldsp16	r4, [sp+0x80]
 d7 00                 sys	debug_putc
 f0 34 7a              ldsp16	r4, [sp+0x7a]
 d7 00                 sys	debug_putc
 f0 34 7c              ldsp16	r4, [sp+0x7c]
 d7 00                 sys	debug_putc
 f0 34 7e              ldsp16	r4, [sp+0x7e]
 d7 00                 sys	debug_putc
 f0 34 6a              ldsp16	r4, [sp+0x6a]
 d7 00                 sys	debug_putc
 f0 34 74              ldsp16	r4, [sp+0x74]
 d7 00                 sys	debug_putc
 f0 34 66              ldsp16	r4, [sp+0x66]
 d7 00                 sys	debug_putc
 f0 34 50              ldsp16	r4, [sp+0x50]
 d7 00                 sys	debug_putc
 f0 34 80              ldsp16	r4, [sp+0x80]
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
 d1 f0                 brne8	avm_test_main+2904
 c0 09                 ldi8	r4, 0x9
 f0 05 2d 03           ldi16	r1, 0x32d
 f0 17 c4              leasp	r7, 0xc4
 f0 45 23 03           ldm8u	r5, [0x323]
 f0 3d 78              stsp16	[sp+0x78], r5
 f0 45 22 03           ldm8u	r5, [0x322]
 f0 3d 7e              stsp16	[sp+0x7e], r5
 f0 45 21 03           ldm8u	r5, [0x321]
 f0 3d 7c              stsp16	[sp+0x7c], r5
 f0 45 20 03           ldm8u	r5, [0x320]
 f0 3d 7a              stsp16	[sp+0x7a], r5
 f0 45 1e 02           ldm8u	r5, [0x21e]
 f0 3d 80              stsp16	[sp+0x80], r5
 f0 45 1d 02           ldm8u	r5, [0x21d]
 f0 3d 74              stsp16	[sp+0x74], r5
 f0 45 1c 02           ldm8u	r5, [0x21c]
 f0 3d 76              stsp16	[sp+0x76], r5
 f0 00 01              ldi8	r0, 0x1
 f0 6c 63              ld8u	r3, [r1+]
 f7 1a                 ld8u	r2, [r7+]
 f6 2c                 tst16	r4
 f8 0d                 cset.ne	r5
 f4 b4                 dec16	r4
 f5 13                 cmp	r2, r3
 d1 06                 brne8	avm_test_main+3002
 f9 a0                 and	r5, r0
 f4 a5                 tst8	r5
 d1 eb                 brne8	avm_test_main+2981
 c0 01                 ldi8	r4, 0x1
 f0 37 80              ldsp16	r7, [sp+0x80]
 f1 77                 zext8	r7
 c1 a5                 ldi8	r5, 0xa5
 3d                    cmp	r7, r5
 f8 05                 cset.eq	r5
 f5 13                 cmp	r2, r3
 db 7e 01              brne16	avm_test_main+3401
 f0 3d 72              stsp16	[sp+0x72], r5
 f0 3e 80              stsp16	[sp+0x80], r6
 c2 06                 ldi8	r6, 0x6
 c7 37 03              ldi16	r7, 0x337
 f0 13 bd              leasp	r3, 0xbd
 f0 01 01              ldi8	r1, 0x1
 f7 1d                 ld8u	r5, [r7+]
 f0 6c 47              ld8u	r2, [r3+]
 f6 2e                 tst16	r6
 f8 08                 cset.ne	r0
 f4 b6                 dec16	r6
 f5 15                 cmp	r2, r5
 d1 06                 brne8	avm_test_main+3057
 f9 04                 and	r0, r1
 f4 a0                 tst8	r0
 d1 eb                 brne8	avm_test_main+3036
 f5 15                 cmp	r2, r5
 db 53 01              brne16	avm_test_main+3401
 c2 05                 ldi8	r6, 0x5
 f0 07 3e 03           ldi16	r3, 0x33e
 f0 11 b7              leasp	r1, 0xb7
 c3 01                 ldi8	r7, 0x1
 f0 6c 47              ld8u	r2, [r3+]
 f0 6c 03              ld8u	r0, [r1+]
 f6 2e                 tst16	r6
 f8 0d                 cset.ne	r5
 f4 b6                 dec16	r6
 f5 02                 cmp	r0, r2
 d1 05                 brne8	avm_test_main+3094
 87                    and	r5, r7
 f4 a5                 tst8	r5
 d1 eb                 brne8	avm_test_main+3073
 f5 02                 cmp	r0, r2
 db 2e 01              brne16	avm_test_main+3401
 f0 11 b2              leasp	r1, 0xb2
 c1 04                 ldi8	r5, 0x4
 c2 01                 ldi8	r6, 0x1
 f0 6c 03              ld8u	r0, [r1+]
 f6 2d                 tst16	r5
 f8 0f                 cset.ne	r7
 f4 b5                 dec16	r5
 f0 0c 3c              cmpi.s8	r0, 0x3c
 d1 05                 brne8	avm_test_main+3125
 8e                    and	r7, r6
 f4 a7                 tst8	r7
 d1 ed                 brne8	avm_test_main+3106
 f0 1d a6              ldsp8u	r5, [sp+0xa6]
 f0 0c 3c              cmpi.s8	r0, 0x3c
 db 0b 01              brne16	avm_test_main+3401
 f1 75                 zext8	r5
 cd 72                 cmpi.s8	r5, 0x72
 db 04 01              brne16	avm_test_main+3401
 c3 72                 ldi8	r7, 0x72
 c5 45 03              ldi16	r5, 0x345
 f0 11 a6              leasp	r1, 0xa6
 f4 a7                 tst8	r7
 d0 12                 breq8	avm_test_main+3171
 f7 08                 ld8u	r0, [r5+]
 f1 29                 mov	r6, r1
 f4 ae                 inc16	r6
 ed e2 21              ld8u	r7, [r1+1]
 f5 2c                 cmp	r7, r0
 f1 0e                 mov	r1, r6
 d0 ed                 breq8	avm_test_main+3149
 e0 e6 00              jmp16	avm_test_main+3401
 f0 1d 9a              ldsp8u	r5, [sp+0x9a]
 cd 73                 cmpi.s8	r5, 0x73
 db de 00              brne16	avm_test_main+3401
 c3 73                 ldi8	r7, 0x73
 c5 4d 03              ldi16	r5, 0x34d
 f0 11 9a              leasp	r1, 0x9a
 f4 a7                 tst8	r7
 d0 12                 breq8	avm_test_main+3209
 f7 08                 ld8u	r0, [r5+]
 f1 29                 mov	r6, r1
 f4 ae                 inc16	r6
 ed e2 21              ld8u	r7, [r1+1]
 f5 2c                 cmp	r7, r0
 f1 0e                 mov	r1, r6
 d0 ed                 breq8	avm_test_main+3187
 e0 c0 00              jmp16	avm_test_main+3401
 f0 1d 92              ldsp8u	r5, [sp+0x92]
 cd 69                 cmpi.s8	r5, 0x69
 db b8 00              brne16	avm_test_main+3401
 c3 69                 ldi8	r7, 0x69
 c5 54 03              ldi16	r5, 0x354
 f0 11 92              leasp	r1, 0x92
 f4 a7                 tst8	r7
 d0 12                 breq8	avm_test_main+3247
 f7 08                 ld8u	r0, [r5+]
 f1 29                 mov	r6, r1
 f4 ae                 inc16	r6
 ed e2 21              ld8u	r7, [r1+1]
 f5 2c                 cmp	r7, r0
 f1 0e                 mov	r1, r6
 d0 ed                 breq8	avm_test_main+3225
 e0 9a 00              jmp16	avm_test_main+3401
 f0 1d 8a              ldsp8u	r5, [sp+0x8a]
 cd 6f                 cmpi.s8	r5, 0x6f
 db 92 00              brne16	avm_test_main+3401
 c3 6f                 ldi8	r7, 0x6f
 c5 58 03              ldi16	r5, 0x358
 f0 11 8a              leasp	r1, 0x8a
 f4 a7                 tst8	r7
 d0 11                 breq8	avm_test_main+3284
 f7 08                 ld8u	r0, [r5+]
 f1 29                 mov	r6, r1
 f4 ae                 inc16	r6
 ed e2 21              ld8u	r7, [r1+1]
 f5 2c                 cmp	r7, r0
 f1 0e                 mov	r1, r6
 d0 ed                 breq8	avm_test_main+3263
 d4 75                 jmp8	avm_test_main+3401
 f0 02 01              ldi8	r2, 0x1
 f0 1c 82              ldsp8u	r4, [sp+0x82]
 cc 67                 cmpi.s8	r4, 0x67
 f1 22                 mov	r4, r2
 f0 31 80              ldsp16	r1, [sp+0x80]
 d1 38                 brne8	avm_test_main+3355
 c2 67                 ldi8	r6, 0x67
 c4 5c 03              ldi16	r4, 0x35c
 f0 17 82              leasp	r7, 0x82
 f4 a6                 tst8	r6
 d0 11                 breq8	avm_test_main+3328
 f7 00                 ld8u	r0, [r4+]
 07                    mov	r5, r7
 f4 ad                 inc16	r5
 ed ce 21              ld8u	r6, [r7+1]
 f5 28                 cmp	r6, r0
 0d                    mov	r7, r5
 d0 ef                 breq8	avm_test_main+3307
 a0                    xor	r4, r4
 04                    mov	r5, r4
 d4 03                 jmp8	avm_test_main+3331
 f0 35 72              ldsp16	r5, [sp+0x72]
 c0 01                 ldi8	r4, 0x1
 a1                    xor	r4, r5
 f0 37 74              ldsp16	r7, [sp+0x74]
 f1 77                 zext8	r7
 c1 a5                 ldi8	r5, 0xa5
 09                    mov	r6, r5
 3e                    cmp	r7, r6
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 f0 34 76              ldsp16	r4, [sp+0x76]
 f1 74                 zext8	r4
 32                    cmp	r4, r6
 f8 0c                 cset.ne	r4
 91                    or	r4, r5
 f6 29                 tst16	r1
 f8 06                 cset.eq	r6
 98                    or	r6, r4
 f0 35 78              ldsp16	r5, [sp+0x78]
 f1 75                 zext8	r5
 c0 b6                 ldi8	r4, 0xb6
 34                    cmp	r5, r4
 f8 0d                 cset.ne	r5
 f0 34 7a              ldsp16	r4, [sp+0x7a]
 f1 74                 zext8	r4
 cc 67                 cmpi.s8	r4, 0x67
 f8 0c                 cset.ne	r4
 92                    or	r4, r6
 f0 36 7c              ldsp16	r6, [sp+0x7c]
 f1 76                 zext8	r6
 ce 6f                 cmpi.s8	r6, 0x6f
 f8 0e                 cset.ne	r6
 98                    or	r6, r4
 f0 34 7e              ldsp16	r4, [sp+0x7e]
 f4 a4                 tst8	r4
 f8 0c                 cset.ne	r4
 92                    or	r4, r6
 91                    or	r4, r5
 f9 88                 and	r4, r2
 d6 7f                 adjsp	avm_halt+120
 d6 4f                 adjsp	avm_halt+74
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
