
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/string_ram_copy.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 string_ram_copy.c
00000100 l     O .data	00000004 .L.str
00000104 l     O .data	00000007 .L.str.1
0000010b l     O .data	00000004 .L.str.2
0000010f l     O .data	00000008 .L.str.3
00000117 l     O .data	0000000c .L__const.avm_test_main.full
00000123 l     O .data	0000000c .L__const.avm_test_main.cut
0000012f l     O .data	00000005 .L.str.4
00000134 l     O .data	00000007 .L.str.5
0000013b l     O .data	00000005 .L.str.6
00000140 l     O .data	00000001 .L.str.7
00000141 l     O .data	00000003 .L.str.8
00000144 l     O .data	0000000a avm_test_main.expect_pad
0000014e l     O .data	00000007 avm_test_main.expect_trunc
00000155 l     O .data	00000006 avm_test_main.expect_exact
0000015b l     O .data	00000008 .L.str.19
00000163 l     O .data	00000007 .L.str.20
0000016a l     O .data	00000004 .L.str.21
0000016e l     O .data	00000004 .L.str.22
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
0000021c g     F .text	00000858 avm_test_main
00000a74 g     F .text	00000002 avm_halt
00000216 g     F .text	00000003 test_call_strncpy
00000219 g     F .text	00000003 test_call_strncat

Disassembly of section .text:

<_start>:
 d5 1a                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 fb 2e                 cmov.eq	r5, r6
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 5e 08              call16	avm_halt

<test_call_strncpy>:
 d7 1b                 sys	strncpy
 ef                    ret

<test_call_strncat>:
 d7 1c                 sys	strncat
 ef                    ret

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 80                 adjsp	-0x80
 d6 e8                 adjsp	_start+12
 c0 0a                 ldi8	r4, 0xa
 f0 15 8e              leasp	r5, 0x8e
 c2 a5                 ldi8	r6, 0xa5
 f6 0e                 st8	[r5+], r6
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f8                 brne8	avm_test_main+15
 c0 07                 ldi8	r4, 0x7
 f0 15 87              leasp	r5, 0x87
 c2 cc                 ldi8	r6, 0xcc
 f6 0e                 st8	[r5+], r6
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f8                 brne8	avm_test_main+30
 c0 06                 ldi8	r4, 0x6
 f0 15 81              leasp	r5, 0x81
 c2 7e                 ldi8	r6, 0x7e
 f6 0e                 st8	[r5+], r6
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f8                 brne8	avm_test_main+45
 c0 3c                 ldi8	r4, 0x3c
 f0 2c 80              stsp8	[sp+0x80], r4
 c4 3c 3c              ldi16	r4, 0x3c3c
 c5 3c 3c              ldi16	r5, 0x3c3c
 f0 3c 7c              stsp16	[sp+0x7c], r4
 f0 3d 7e              stsp16	[sp+0x7e], r5
 f0 12 8e              leasp	r2, 0x8e
 c5 00 01              ldi16	r5, 0x100
 c2 08                 ldi8	r6, 0x8
 f1 22                 mov	r4, r2
 d5 a8                 call8	test_call_strncpy
 f0 14 87              leasp	r4, 0x87
 c5 04 01              ldi16	r5, 0x104
 c2 03                 ldi8	r6, 0x3
 d5 9e                 call8	test_call_strncpy
 f0 14 81              leasp	r4, 0x81
 c5 0b 01              ldi16	r5, 0x10b
 c2 04                 ldi8	r6, 0x4
 d5 94                 call8	test_call_strncpy
 f0 14 7c              leasp	r4, 0x7c
 c5 0f 01              ldi16	r5, 0x10f
 aa                    xor	r6, r6
 d5 8b                 call8	test_call_strncpy
 c2 0c                 ldi8	r6, 0xc
 c5 17 01              ldi16	r5, 0x117
 f0 14 70              leasp	r4, 0x70
 d7 0f                 sys	memcpy
 0c                    mov	r7, r4
 c5 23 01              ldi16	r5, 0x123
 f0 14 64              leasp	r4, 0x64
 d7 0f                 sys	memcpy
 f1 1c                 mov	r3, r4
 c4 69 63              ldi16	r4, 0x6369
 c1 65                 ldi8	r5, 0x65
 f0 3c 5c              stsp16	[sp+0x5c], r4
 f0 3d 5e              stsp16	[sp+0x5e], r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 60              stsp16	[sp+0x60], r4
 f0 3d 62              stsp16	[sp+0x62], r5
 f0 04 6f 61           ldi16	r0, 0x616f
 f0 01 6b              ldi8	r1, 0x6b
 f0 38 54              stsp16	[sp+0x54], r0
 f0 39 56              stsp16	[sp+0x56], r1
 f0 3c 58              stsp16	[sp+0x58], r4
 f0 3d 5a              stsp16	[sp+0x5a], r5
 f0 3c 50              stsp16	[sp+0x50], r4
 f0 3d 52              stsp16	[sp+0x52], r5
 f0 3c 4c              stsp16	[sp+0x4c], r4
 f0 3d 4e              stsp16	[sp+0x4e], r5
 c5 2f 01              ldi16	r5, 0x12f
 03                    mov	r4, r7
 c2 08                 ldi8	r6, 0x8
 e1 3e ff              call16	test_call_strncat
 c5 34 01              ldi16	r5, 0x134
 f1 23                 mov	r4, r3
 c2 03                 ldi8	r6, 0x3
 e1 34 ff              call16	test_call_strncat
 f0 14 5c              leasp	r4, 0x5c
 c5 3b 01              ldi16	r5, 0x13b
 aa                    xor	r6, r6
 e1 2a ff              call16	test_call_strncat
 f0 14 54              leasp	r4, 0x54
 c5 40 01              ldi16	r5, 0x140
 c2 04                 ldi8	r6, 0x4
 e1 1f ff              call16	test_call_strncat
 f0 14 4c              leasp	r4, 0x4c
 c5 41 01              ldi16	r5, 0x141
 c2 02                 ldi8	r6, 0x2
 e1 14 ff              call16	test_call_strncat
 c4 2b 6d              ldi16	r4, 0x6d2b
 c6 f2 ff              ldi16	r6, 0xfff2
 f0 00 0e              ldi8	r0, 0xe
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 6c e5              ld8u	r7, [r2+]
 ac                    xor	r7, r4
 f0 08 ef              addi.s8	r0, -0x11
 ca 11                 addi.s8	r6, 0x11
 02                    mov	r4, r6
 13                    add	r4, r7
 c1 9c                 ldi8	r5, 0x9c
 39                    cmp	r6, r5
 d1 ea                 brne8	avm_test_main+242
 f0 38 36              stsp16	[sp+0x36], r0
 f0 3f 42              stsp16	[sp+0x42], r7
 1b                    add	r6, r7
 f0 3e 34              stsp16	[sp+0x34], r6
 c5 2b 6d              ldi16	r5, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 00 0e              ldi8	r0, 0xe
 f0 14 87              leasp	r4, 0x87
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
 cf 69                 cmpi.s8	r7, 0x69
 d1 ec                 brne8	avm_test_main+286
 f0 38 26              stsp16	[sp+0x26], r0
 f0 3e 40              stsp16	[sp+0x40], r6
 1e                    add	r7, r6
 c5 2b 6d              ldi16	r5, 0x6d2b
 c6 f2 ff              ldi16	r6, 0xfff2
 f0 01 0e              ldi8	r1, 0xe
 f0 14 81              leasp	r4, 0x81
 f0 3e 4a              stsp16	[sp+0x4a], r6
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 f0 36 4a              ldsp16	r6, [sp+0x4a]
 f7 00                 ld8u	r0, [r4+]
 f9 16                 xor	r0, r5
 f0 09 ef              addi.s8	r1, -0x11
 ca 11                 addi.s8	r6, 0x11
 06                    mov	r5, r6
 f2 24                 add	r5, r0
 ce 58                 cmpi.s8	r6, 0x58
 d1 e4                 brne8	avm_test_main+325
 f0 39 24              stsp16	[sp+0x24], r1
 f0 3f 32              stsp16	[sp+0x32], r7
 f0 38 3e              stsp16	[sp+0x3e], r0
 f2 28                 add	r6, r0
 f0 3e 4a              stsp16	[sp+0x4a], r6
 c5 2b 6d              ldi16	r5, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 00 0e              ldi8	r0, 0xe
 f0 14 7c              leasp	r4, 0x7c
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
 d1 ec                 brne8	avm_test_main+379
 f0 38 20              stsp16	[sp+0x20], r0
 f0 3e 3c              stsp16	[sp+0x3c], r6
 1e                    add	r7, r6
 f0 3f 30              stsp16	[sp+0x30], r7
 c6 2b 6d              ldi16	r6, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 02 0e              ldi8	r2, 0xe
 f0 15 70              leasp	r5, 0x70
 f0 00 be              ldi8	r0, 0xbe
 02                    mov	r4, r6
 fa 7b                 lsr16i	r4, 0xb
 fa 55                 lsl16i	r6, 0x5
 98                    or	r6, r4
 f7 09                 ld8u	r1, [r5+]
 f9 3a                 xor	r1, r6
 f0 0a ef              addi.s8	r2, -0x11
 cb 11                 addi.s8	r7, 0x11
 0b                    mov	r6, r7
 f2 29                 add	r6, r1
 f5 2c                 cmp	r7, r0
 d1 ea                 brne8	avm_test_main+424
 f2 2d                 add	r7, r1
 f0 3f 2a              stsp16	[sp+0x2a], r7
 c5 2b 6d              ldi16	r5, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 03 0e              ldi8	r3, 0xe
 f0 16 64              leasp	r6, 0x64
 03                    mov	r4, r7
 0d                    mov	r7, r5
 fa ab                 lsr16i	r7, 0xb
 fa 45                 lsl16i	r5, 0x5
 97                    or	r5, r7
 0c                    mov	r7, r4
 f7 14                 ld8u	r4, [r6+]
 a1                    xor	r4, r5
 f0 0b ef              addi.s8	r3, -0x11
 cb 11                 addi.s8	r7, 0x11
 07                    mov	r5, r7
 14                    add	r5, r4
 f5 2c                 cmp	r7, r0
 d1 ea                 brne8	avm_test_main+463
 f0 3b 1a              stsp16	[sp+0x1a], r3
 f0 3c 3a              stsp16	[sp+0x3a], r4
 1c                    add	r7, r4
 f0 3f 28              stsp16	[sp+0x28], r7
 c5 2b 6d              ldi16	r5, 0x6d2b
 c7 f2 ff              ldi16	r7, 0xfff2
 f0 00 0e              ldi8	r0, 0xe
 f0 16 5c              leasp	r6, 0x5c
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f7 14                 ld8u	r4, [r6+]
 a1                    xor	r4, r5
 f0 08 ef              addi.s8	r0, -0x11
 cb 11                 addi.s8	r7, 0x11
 07                    mov	r5, r7
 14                    add	r5, r4
 cf 7a                 cmpi.s8	r7, 0x7a
 d1 ec                 brne8	avm_test_main+507
 f0 39 44              stsp16	[sp+0x44], r1
 f0 3c 38              stsp16	[sp+0x38], r4
 1c                    add	r7, r4
 f0 3f 2e              stsp16	[sp+0x2e], r7
 c5 2b 6d              ldi16	r5, 0x6d2b
 c4 f2 ff              ldi16	r4, 0xfff2
 f0 03 0e              ldi8	r3, 0xe
 f0 16 54              leasp	r6, 0x54
 0d                    mov	r7, r5
 fa ab                 lsr16i	r7, 0xb
 fa 45                 lsl16i	r5, 0x5
 97                    or	r5, r7
 f7 17                 ld8u	r7, [r6+]
 ad                    xor	r7, r5
 f0 0b ef              addi.s8	r3, -0x11
 c8 11                 addi.s8	r4, 0x11
 04                    mov	r5, r4
 17                    add	r5, r7
 cc 7a                 cmpi.s8	r4, 0x7a
 d1 ec                 brne8	avm_test_main+549
 f0 3a 1e              stsp16	[sp+0x1e], r2
 13                    add	r4, r7
 f0 3c 2c              stsp16	[sp+0x2c], r4
 c6 2b 6d              ldi16	r6, 0x6d2b
 c4 f2 ff              ldi16	r4, 0xfff2
 f0 3c 48              stsp16	[sp+0x48], r4
 f0 01 0e              ldi8	r1, 0xe
 f0 15 4c              leasp	r5, 0x4c
 02                    mov	r4, r6
 fa 7b                 lsr16i	r4, 0xb
 fa 55                 lsl16i	r6, 0x5
 98                    or	r6, r4
 f7 0a                 ld8u	r2, [r5+]
 f9 5a                 xor	r2, r6
 f0 09 ef              addi.s8	r1, -0x11
 f0 34 48              ldsp16	r4, [sp+0x48]
 c8 11                 addi.s8	r4, 0x11
 08                    mov	r6, r4
 f0 3a 46              stsp16	[sp+0x46], r2
 f2 2a                 add	r6, r2
 f0 3c 48              stsp16	[sp+0x48], r4
 cc 7a                 cmpi.s8	r4, 0x7a
 d1 e1                 brne8	avm_test_main+591
 f0 35 42              ldsp16	r5, [sp+0x42]
 f0 34 36              ldsp16	r4, [sp+0x36]
 24                    sub	r5, r4
 f0 3d 42              stsp16	[sp+0x42], r5
 f1 75                 zext8	r5
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 f0 02 30              ldi8	r2, 0x30
 08                    mov	r6, r4
 f9 c9                 or	r6, r2
 c8 37                 addi.s8	r4, 0x37
 f0 02 a0              ldi8	r2, 0xa0
 f5 26                 cmp	r5, r2
 fc 26                 cmov.ult	r4, r6
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 35 40              ldsp16	r5, [sp+0x40]
 f0 34 26              ldsp16	r4, [sp+0x26]
 24                    sub	r5, r4
 f0 3d 40              stsp16	[sp+0x40], r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 f0 3c 26              stsp16	[sp+0x26], r4
 fa 74                 lsr16i	r4, 0x4
 f0 3c 36              stsp16	[sp+0x36], r4
 c2 30                 ldi8	r6, 0x30
 f0 35 36              ldsp16	r5, [sp+0x36]
 96                    or	r5, r6
 f0 3d 36              stsp16	[sp+0x36], r5
 c8 37                 addi.s8	r4, 0x37
 f0 35 26              ldsp16	r5, [sp+0x26]
 f5 26                 cmp	r5, r2
 f0 35 36              ldsp16	r5, [sp+0x36]
 fc 25                 cmov.ult	r4, r5
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 35 3e              ldsp16	r5, [sp+0x3e]
 f0 34 24              ldsp16	r4, [sp+0x24]
 24                    sub	r5, r4
 f0 3d 3e              stsp16	[sp+0x3e], r5
 f1 75                 zext8	r5
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 08                    mov	r6, r4
 f0 02 30              ldi8	r2, 0x30
 f9 c9                 or	r6, r2
 f0 3e 36              stsp16	[sp+0x36], r6
 c8 37                 addi.s8	r4, 0x37
 c2 a0                 ldi8	r6, 0xa0
 36                    cmp	r5, r6
 f0 35 36              ldsp16	r5, [sp+0x36]
 fc 25                 cmov.ult	r4, r5
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 35 3c              ldsp16	r5, [sp+0x3c]
 f0 34 20              ldsp16	r4, [sp+0x20]
 24                    sub	r5, r4
 f0 3d 3c              stsp16	[sp+0x3c], r5
 f1 75                 zext8	r5
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 08                    mov	r6, r4
 f9 c9                 or	r6, r2
 c8 37                 addi.s8	r4, 0x37
 f0 02 a0              ldi8	r2, 0xa0
 f5 26                 cmp	r5, r2
 fc 26                 cmov.ult	r4, r6
 f0 3c 26              stsp16	[sp+0x26], r4
 f0 35 44              ldsp16	r5, [sp+0x44]
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 24                    sub	r5, r4
 f0 3d 44              stsp16	[sp+0x44], r5
 f1 75                 zext8	r5
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 08                    mov	r6, r4
 f0 02 30              ldi8	r2, 0x30
 f9 c9                 or	r6, r2
 f0 3e 36              stsp16	[sp+0x36], r6
 c8 37                 addi.s8	r4, 0x37
 c2 a0                 ldi8	r6, 0xa0
 36                    cmp	r5, r6
 f0 35 36              ldsp16	r5, [sp+0x36]
 fc 25                 cmov.ult	r4, r5
 f0 3c 36              stsp16	[sp+0x36], r4
 f0 35 3a              ldsp16	r5, [sp+0x3a]
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 24                    sub	r5, r4
 f0 3d 3a              stsp16	[sp+0x3a], r5
 f1 75                 zext8	r5
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 08                    mov	r6, r4
 f9 c9                 or	r6, r2
 c8 37                 addi.s8	r4, 0x37
 f0 02 a0              ldi8	r2, 0xa0
 f5 26                 cmp	r5, r2
 fc 26                 cmov.ult	r4, r6
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 35 38              ldsp16	r5, [sp+0x38]
 f2 54                 sub	r5, r0
 f0 3d 38              stsp16	[sp+0x38], r5
 f1 75                 zext8	r5
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 08                    mov	r6, r4
 f0 02 30              ldi8	r2, 0x30
 f9 c9                 or	r6, r2
 c8 37                 addi.s8	r4, 0x37
 f0 00 a0              ldi8	r0, 0xa0
 f5 24                 cmp	r5, r0
 fc 26                 cmov.ult	r4, r6
 f0 3c 20              stsp16	[sp+0x20], r4
 f2 5f                 sub	r7, r3
 07                    mov	r5, r7
 f1 75                 zext8	r5
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 08                    mov	r6, r4
 f9 c9                 or	r6, r2
 c8 37                 addi.s8	r4, 0x37
 f5 24                 cmp	r5, r0
 f1 18                 mov	r3, r0
 fc 26                 cmov.ult	r4, r6
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 30 46              ldsp16	r0, [sp+0x46]
 f1 24                 mov	r5, r0
 f2 55                 sub	r5, r1
 f4 49                 stsp16	[sp+0x2], r5
 f1 75                 zext8	r5
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 08                    mov	r6, r4
 f9 c9                 or	r6, r2
 c8 37                 addi.s8	r4, 0x37
 f5 27                 cmp	r5, r3
 fc 26                 cmov.ult	r4, r6
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 01 0f              ldi8	r1, 0xf
 f0 36 42              ldsp16	r6, [sp+0x42]
 f9 c4                 and	r6, r1
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 02                    mov	r4, r6
 c8 37                 addi.s8	r4, 0x37
 ce 0a                 cmpi.s8	r6, 0xa
 fc 25                 cmov.ult	r4, r5
 f0 3c 42              stsp16	[sp+0x42], r4
 f0 35 34              ldsp16	r5, [sp+0x34]
 fa 88                 lsr16i	r5, 0x8
 f9 a4                 and	r5, r1
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 26                 cmov.ult	r4, r6
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 36 34              ldsp16	r6, [sp+0x34]
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 c8 37                 addi.s8	r4, 0x37
 f0 07 00 a0           ldi16	r3, 0xa000
 f5 2b                 cmp	r6, r3
 fc 25                 cmov.ult	r4, r5
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 36 40              ldsp16	r6, [sp+0x40]
 f9 c4                 and	r6, r1
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 02                    mov	r4, r6
 c8 37                 addi.s8	r4, 0x37
 ce 0a                 cmpi.s8	r6, 0xa
 fc 25                 cmov.ult	r4, r5
 f0 3c 40              stsp16	[sp+0x40], r4
 f0 35 32              ldsp16	r5, [sp+0x32]
 fa 88                 lsr16i	r5, 0x8
 f9 a4                 and	r5, r1
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 26                 cmov.ult	r4, r6
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 36 32              ldsp16	r6, [sp+0x32]
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 c8 37                 addi.s8	r4, 0x37
 f5 2b                 cmp	r6, r3
 fc 25                 cmov.ult	r4, r5
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 36 3e              ldsp16	r6, [sp+0x3e]
 f9 c4                 and	r6, r1
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 02                    mov	r4, r6
 c8 37                 addi.s8	r4, 0x37
 ce 0a                 cmpi.s8	r6, 0xa
 fc 25                 cmov.ult	r4, r5
 f0 3c 32              stsp16	[sp+0x32], r4
 f0 35 4a              ldsp16	r5, [sp+0x4a]
 fa 88                 lsr16i	r5, 0x8
 f9 a4                 and	r5, r1
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 26                 cmov.ult	r4, r6
 f4 78                 stsp16	[sp+0xe], r4
 f0 36 4a              ldsp16	r6, [sp+0x4a]
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 c8 37                 addi.s8	r4, 0x37
 f5 2b                 cmp	r6, r3
 fc 25                 cmov.ult	r4, r5
 f4 70                 stsp16	[sp+0xc], r4
 f0 36 3c              ldsp16	r6, [sp+0x3c]
 f9 c4                 and	r6, r1
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 02                    mov	r4, r6
 c8 37                 addi.s8	r4, 0x37
 ce 0a                 cmpi.s8	r6, 0xa
 fc 25                 cmov.ult	r4, r5
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 35 30              ldsp16	r5, [sp+0x30]
 fa 88                 lsr16i	r5, 0x8
 f9 a4                 and	r5, r1
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 26                 cmov.ult	r4, r6
 f4 68                 stsp16	[sp+0xa], r4
 f0 36 30              ldsp16	r6, [sp+0x30]
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 c8 37                 addi.s8	r4, 0x37
 f5 2b                 cmp	r6, r3
 fc 25                 cmov.ult	r4, r5
 f0 3c 30              stsp16	[sp+0x30], r4
 f9 e4                 and	r7, r1
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 03                    mov	r4, r7
 c8 37                 addi.s8	r4, 0x37
 cf 0a                 cmpi.s8	r7, 0xa
 fc 25                 cmov.ult	r4, r5
 f0 3c 3e              stsp16	[sp+0x3e], r4
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 fa 88                 lsr16i	r5, 0x8
 f1 01                 mov	r0, r1
 f9 a0                 and	r5, r0
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 0d                    mov	r7, r5
 cb 37                 addi.s8	r7, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 3e                 cmov.ult	r7, r6
 f0 3f 3c              stsp16	[sp+0x3c], r7
 f0 34 38              ldsp16	r4, [sp+0x38]
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f0 3e 38              stsp16	[sp+0x38], r6
 f0 35 2e              ldsp16	r5, [sp+0x2e]
 fa 88                 lsr16i	r5, 0x8
 f9 a0                 and	r5, r0
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 0d                    mov	r7, r5
 cb 37                 addi.s8	r7, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 3e                 cmov.ult	r7, r6
 f4 63                 stsp16	[sp+0x8], r7
 f0 36 3a              ldsp16	r6, [sp+0x3a]
 f9 c0                 and	r6, r0
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 0e                    mov	r7, r6
 cb 37                 addi.s8	r7, 0x37
 ce 0a                 cmpi.s8	r6, 0xa
 fc 3d                 cmov.ult	r7, r5
 f0 3f 3a              stsp16	[sp+0x3a], r7
 f0 37 28              ldsp16	r7, [sp+0x28]
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f9 a0                 and	r5, r0
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 26                 cmov.ult	r4, r6
 f4 58                 stsp16	[sp+0x6], r4
 f0 36 44              ldsp16	r6, [sp+0x44]
 f9 c0                 and	r6, r0
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 f1 0e                 mov	r1, r6
 f0 09 37              addi.s8	r1, 0x37
 ce 0a                 cmpi.s8	r6, 0xa
 fc 0d                 cmov.ult	r1, r5
 03                    mov	r4, r7
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 c8 37                 addi.s8	r4, 0x37
 f5 2f                 cmp	r7, r3
 fc 25                 cmov.ult	r4, r5
 f4 50                 stsp16	[sp+0x4], r4
 f0 36 2e              ldsp16	r6, [sp+0x2e]
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 c8 37                 addi.s8	r4, 0x37
 f5 2b                 cmp	r6, r3
 fc 25                 cmov.ult	r4, r5
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 c8 37                 addi.s8	r4, 0x37
 f5 2b                 cmp	r6, r3
 fc 25                 cmov.ult	r4, r5
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f4 42                 stsp16	[sp+0x0], r6
 f0 36 48              ldsp16	r6, [sp+0x48]
 f0 34 46              ldsp16	r4, [sp+0x46]
 18                    add	r6, r4
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 f5 2b                 cmp	r6, r3
 fc 2c                 cmov.ult	r5, r4
 f0 3d 2c              stsp16	[sp+0x2c], r5
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 0d                    mov	r7, r5
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 89                 or	r4, r2
 cb 37                 addi.s8	r7, 0x37
 f5 27                 cmp	r5, r3
 fc 3c                 cmov.ult	r7, r4
 f4 4b                 stsp16	[sp+0x2], r7
 fa 88                 lsr16i	r5, 0x8
 f9 a0                 and	r5, r0
 0d                    mov	r7, r5
 f9 e9                 or	r7, r2
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 27                 cmov.ult	r4, r7
 0c                    mov	r7, r4
 fa 98                 lsr16i	r6, 0x8
 f9 c0                 and	r6, r0
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 06                    mov	r5, r6
 c9 37                 addi.s8	r5, 0x37
 ce 0a                 cmpi.s8	r6, 0xa
 fc 2c                 cmov.ult	r5, r4
 c0 52                 ldi8	r4, 0x52
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 f0 3c 44              stsp16	[sp+0x44], r4
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 f0 3c 4a              stsp16	[sp+0x4a], r4
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 f0 34 44              ldsp16	r4, [sp+0x44]
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 f0 3c 48              stsp16	[sp+0x48], r4
 d7 00                 sys	debug_putc
 c0 4e                 ldi8	r4, 0x4e
 f0 3c 46              stsp16	[sp+0x46], r4
 d7 00                 sys	debug_putc
 c0 50                 ldi8	r4, 0x50
 d7 00                 sys	debug_putc
 f0 34 4a              ldsp16	r4, [sp+0x4a]
 d7 00                 sys	debug_putc
 f0 34 34              ldsp16	r4, [sp+0x34]
 d7 00                 sys	debug_putc
 f0 34 16              ldsp16	r4, [sp+0x16]
 d7 00                 sys	debug_putc
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 00                 sys	debug_putc
 f0 34 42              ldsp16	r4, [sp+0x42]
 d7 00                 sys	debug_putc
 f0 34 48              ldsp16	r4, [sp+0x48]
 d7 00                 sys	debug_putc
 f0 34 46              ldsp16	r4, [sp+0x46]
 d7 00                 sys	debug_putc
 c0 54                 ldi8	r4, 0x54
 f0 3c 34              stsp16	[sp+0x34], r4
 d7 00                 sys	debug_putc
 f0 34 4a              ldsp16	r4, [sp+0x4a]
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 00                 sys	debug_putc
 f0 34 14              ldsp16	r4, [sp+0x14]
 d7 00                 sys	debug_putc
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 d7 00                 sys	debug_putc
 f0 34 40              ldsp16	r4, [sp+0x40]
 d7 00                 sys	debug_putc
 f0 34 48              ldsp16	r4, [sp+0x48]
 d7 00                 sys	debug_putc
 f0 34 46              ldsp16	r4, [sp+0x46]
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 f0 3c 42              stsp16	[sp+0x42], r4
 d7 00                 sys	debug_putc
 f0 34 4a              ldsp16	r4, [sp+0x4a]
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 00                 sys	debug_putc
 f0 34 22              ldsp16	r4, [sp+0x22]
 d7 00                 sys	debug_putc
 f0 34 32              ldsp16	r4, [sp+0x32]
 d7 00                 sys	debug_putc
 f0 34 48              ldsp16	r4, [sp+0x48]
 d7 00                 sys	debug_putc
 f0 34 46              ldsp16	r4, [sp+0x46]
 d7 00                 sys	debug_putc
 c0 5a                 ldi8	r4, 0x5a
 f0 3c 40              stsp16	[sp+0x40], r4
 d7 00                 sys	debug_putc
 f0 34 4a              ldsp16	r4, [sp+0x4a]
 d7 00                 sys	debug_putc
 f0 34 30              ldsp16	r4, [sp+0x30]
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f0 34 26              ldsp16	r4, [sp+0x26]
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 f0 34 48              ldsp16	r4, [sp+0x48]
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 f0 3c 46              stsp16	[sp+0x46], r4
 d7 00                 sys	debug_putc
 f0 34 44              ldsp16	r4, [sp+0x44]
 d7 00                 sys	debug_putc
 f0 34 4a              ldsp16	r4, [sp+0x4a]
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f0 34 36              ldsp16	r4, [sp+0x36]
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 f0 34 48              ldsp16	r4, [sp+0x48]
 d7 00                 sys	debug_putc
 f0 34 46              ldsp16	r4, [sp+0x46]
 d7 00                 sys	debug_putc
 f0 34 34              ldsp16	r4, [sp+0x34]
 d7 00                 sys	debug_putc
 f0 34 4a              ldsp16	r4, [sp+0x4a]
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f0 34 24              ldsp16	r4, [sp+0x24]
 d7 00                 sys	debug_putc
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 d7 00                 sys	debug_putc
 f0 34 48              ldsp16	r4, [sp+0x48]
 d7 00                 sys	debug_putc
 f0 34 46              ldsp16	r4, [sp+0x46]
 d7 00                 sys	debug_putc
 f0 34 40              ldsp16	r4, [sp+0x40]
 d7 00                 sys	debug_putc
 f0 34 4a              ldsp16	r4, [sp+0x4a]
 d7 00                 sys	debug_putc
 f0 34 28              ldsp16	r4, [sp+0x28]
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 f0 34 20              ldsp16	r4, [sp+0x20]
 d7 00                 sys	debug_putc
 f0 34 38              ldsp16	r4, [sp+0x38]
 d7 00                 sys	debug_putc
 f0 34 48              ldsp16	r4, [sp+0x48]
 d7 00                 sys	debug_putc
 f0 34 46              ldsp16	r4, [sp+0x46]
 d7 00                 sys	debug_putc
 f0 34 42              ldsp16	r4, [sp+0x42]
 d7 00                 sys	debug_putc
 f0 34 4a              ldsp16	r4, [sp+0x4a]
 d7 00                 sys	debug_putc
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 d7 00                 sys	debug_putc
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 d7 00                 sys	debug_putc
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d7 00                 sys	debug_putc
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 d7 00                 sys	debug_putc
 f0 34 48              ldsp16	r4, [sp+0x48]
 d7 00                 sys	debug_putc
 f0 34 46              ldsp16	r4, [sp+0x46]
 d7 00                 sys	debug_putc
 c0 44                 ldi8	r4, 0x44
 d7 00                 sys	debug_putc
 f0 34 4a              ldsp16	r4, [sp+0x4a]
 d7 00                 sys	debug_putc
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f0 34 48              ldsp16	r4, [sp+0x48]
 d7 00                 sys	debug_putc
 c0 09                 ldi8	r4, 0x9
 c5 44 01              ldi16	r5, 0x144
 f0 16 8e              leasp	r6, 0x8e
 f0 02 01              ldi8	r2, 0x1
 f7 0f                 ld8u	r7, [r5+]
 f7 10                 ld8u	r0, [r6+]
 f6 2c                 tst16	r4
 f8 09                 cset.ne	r1
 f4 b4                 dec16	r4
 f5 07                 cmp	r0, r7
 d1 06                 brne8	avm_test_main+1830
 f9 28                 and	r1, r2
 f4 a1                 tst8	r1
 d1 ec                 brne8	avm_test_main+1810
 c0 01                 ldi8	r4, 0x1
 f5 07                 cmp	r0, r7
 db 22 01              brne16	avm_test_main+2127
 c1 06                 ldi8	r5, 0x6
 c6 4e 01              ldi16	r6, 0x14e
 f0 17 87              leasp	r7, 0x87
 f0 03 01              ldi8	r3, 0x1
 f7 10                 ld8u	r0, [r6+]
 f7 19                 ld8u	r1, [r7+]
 f6 2d                 tst16	r5
 f8 0a                 cset.ne	r2
 f4 b5                 dec16	r5
 f5 08                 cmp	r1, r0
 d1 06                 brne8	avm_test_main+1868
 f9 4c                 and	r2, r3
 f4 a2                 tst8	r2
 d1 ec                 brne8	avm_test_main+1848
 f5 08                 cmp	r1, r0
 db fe 00              brne16	avm_test_main+2127
 c1 05                 ldi8	r5, 0x5
 c6 55 01              ldi16	r6, 0x155
 f0 17 81              leasp	r7, 0x81
 f0 03 01              ldi8	r3, 0x1
 f7 10                 ld8u	r0, [r6+]
 f7 19                 ld8u	r1, [r7+]
 f6 2d                 tst16	r5
 f8 0a                 cset.ne	r2
 f4 b5                 dec16	r5
 f5 08                 cmp	r1, r0
 d1 06                 brne8	avm_test_main+1904
 f9 4c                 and	r2, r3
 f4 a2                 tst8	r2
 d1 ec                 brne8	avm_test_main+1884
 f5 08                 cmp	r1, r0
 db da 00              brne16	avm_test_main+2127
 f0 15 7c              leasp	r5, 0x7c
 f0 01 04              ldi8	r1, 0x4
 f0 00 01              ldi8	r0, 0x1
 f7 0e                 ld8u	r6, [r5+]
 f6 29                 tst16	r1
 f8 0f                 cset.ne	r7
 f4 b1                 dec16	r1
 ce 3c                 cmpi.s8	r6, 0x3c
 d1 06                 brne8	avm_test_main+1936
 f9 e0                 and	r7, r0
 f4 a7                 tst8	r7
 d1 ee                 brne8	avm_test_main+1918
 f0 1d 70              ldsp8u	r5, [sp+0x70]
 ce 3c                 cmpi.s8	r6, 0x3c
 db b7 00              brne16	avm_test_main+2127
 f1 75                 zext8	r5
 cd 72                 cmpi.s8	r5, 0x72
 db b0 00              brne16	avm_test_main+2127
 c3 72                 ldi8	r7, 0x72
 c5 5c 01              ldi16	r5, 0x15c
 f0 16 70              leasp	r6, 0x70
 f4 a7                 tst8	r7
 d0 12                 breq8	avm_test_main+1981
 f7 08                 ld8u	r0, [r5+]
 f1 0e                 mov	r1, r6
 f4 a9                 inc16	r1
 ed ec 21              ld8u	r7, [r6+1]
 f5 2c                 cmp	r7, r0
 f1 29                 mov	r6, r1
 d0 ed                 breq8	avm_test_main+1959
 e0 92 00              jmp16	avm_test_main+2127
 f0 1d 64              ldsp8u	r5, [sp+0x64]
 cd 73                 cmpi.s8	r5, 0x73
 db 8a 00              brne16	avm_test_main+2127
 c3 73                 ldi8	r7, 0x73
 c5 64 01              ldi16	r5, 0x164
 f0 16 64              leasp	r6, 0x64
 f4 a7                 tst8	r7
 d0 11                 breq8	avm_test_main+2018
 f7 08                 ld8u	r0, [r5+]
 f1 0e                 mov	r1, r6
 f4 a9                 inc16	r1
 ed ec 21              ld8u	r7, [r6+1]
 f5 2c                 cmp	r7, r0
 f1 29                 mov	r6, r1
 d0 ed                 breq8	avm_test_main+1997
 d4 6d                 jmp8	avm_test_main+2127
 f0 1d 5c              ldsp8u	r5, [sp+0x5c]
 cd 69                 cmpi.s8	r5, 0x69
 d1 66                 brne8	avm_test_main+2127
 c3 69                 ldi8	r7, 0x69
 c5 6b 01              ldi16	r5, 0x16b
 f0 16 5c              leasp	r6, 0x5c
 f4 a7                 tst8	r7
 d0 11                 breq8	avm_test_main+2054
 f7 08                 ld8u	r0, [r5+]
 f1 0e                 mov	r1, r6
 f4 a9                 inc16	r1
 ed ec 21              ld8u	r7, [r6+1]
 f5 2c                 cmp	r7, r0
 f1 29                 mov	r6, r1
 d0 ed                 breq8	avm_test_main+2033
 d4 49                 jmp8	avm_test_main+2127
 f0 1d 54              ldsp8u	r5, [sp+0x54]
 cd 6f                 cmpi.s8	r5, 0x6f
 d1 42                 brne8	avm_test_main+2127
 c3 6f                 ldi8	r7, 0x6f
 c5 6f 01              ldi16	r5, 0x16f
 f0 16 54              leasp	r6, 0x54
 f4 a7                 tst8	r7
 d0 11                 breq8	avm_test_main+2090
 f7 08                 ld8u	r0, [r5+]
 f1 0e                 mov	r1, r6
 f4 a9                 inc16	r1
 ed ec 21              ld8u	r7, [r6+1]
 f5 2c                 cmp	r7, r0
 f1 29                 mov	r6, r1
 d0 ed                 breq8	avm_test_main+2069
 d4 25                 jmp8	avm_test_main+2127
 f0 1d 4c              ldsp8u	r5, [sp+0x4c]
 cd 67                 cmpi.s8	r5, 0x67
 d1 1e                 brne8	avm_test_main+2127
 c3 67                 ldi8	r7, 0x67
 c5 42 01              ldi16	r5, 0x142
 f0 16 4c              leasp	r6, 0x4c
 f4 a7                 tst8	r7
 d0 11                 breq8	avm_test_main+2126
 f7 08                 ld8u	r0, [r5+]
 f1 0e                 mov	r1, r6
 f4 a9                 inc16	r1
 ed ec 21              ld8u	r7, [r6+1]
 f5 2c                 cmp	r7, r0
 f1 29                 mov	r6, r1
 d0 ed                 breq8	avm_test_main+2105
 d4 01                 jmp8	avm_test_main+2127
 a0                    xor	r4, r4
 d6 7f                 adjsp	avm_halt+120
 d6 19                 adjsp	avm_halt+20
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
