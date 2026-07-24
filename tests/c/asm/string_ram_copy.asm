
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
00000220 g     F .text	0000096c avm_test_main
00000b8c g     F .text	00000002 avm_halt
00000216 g     F .text	00000005 test_call_strncpy
0000021b g     F .text	00000005 test_call_strncat

Disassembly of section .text:

<_start>:
 d5 1e                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 01                    mov	r4, r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 76 09              call16	avm_halt

<test_call_strncpy>:
 0c                    mov	r7, r4
 d7 1b                 sys	strncpy
 03                    mov	r4, r7
 ef                    ret

<test_call_strncat>:
 0c                    mov	r7, r4
 d7 1c                 sys	strncat
 03                    mov	r4, r7
 ef                    ret

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 80                 adjsp	-0x80
 d6 ee                 adjsp	-0x12
 c4 a5 a5              ldi16	r4, 0xa5a5
 f0 3c 90              stsp16	[sp+0x90], r4
 c4 a5 a5              ldi16	r4, 0xa5a5
 c5 a5 a5              ldi16	r5, 0xa5a5
 f0 3c 8c              stsp16	[sp+0x8c], r4
 f0 3d 8e              stsp16	[sp+0x8e], r5
 f0 3c 88              stsp16	[sp+0x88], r4
 f0 3d 8a              stsp16	[sp+0x8a], r5
 c4 cc cc              ldi16	r4, 0xcccc
 c1 cc                 ldi8	r5, 0xcc
 f0 3c 85              stsp16	[sp+0x85], r4
 f0 2d 87              stsp8	[sp+0x87], r5
 c4 cc cc              ldi16	r4, 0xcccc
 c5 cc cc              ldi16	r5, 0xcccc
 f0 3c 81              stsp16	[sp+0x81], r4
 f0 3d 83              stsp16	[sp+0x83], r5
 c4 7e 7e              ldi16	r4, 0x7e7e
 f0 3c 7f              stsp16	[sp+0x7f], r4
 c4 7e 7e              ldi16	r4, 0x7e7e
 c5 7e 7e              ldi16	r5, 0x7e7e
 f0 3c 7b              stsp16	[sp+0x7b], r4
 f0 3d 7d              stsp16	[sp+0x7d], r5
 c0 3c                 ldi8	r4, 0x3c
 f0 2c 7a              stsp8	[sp+0x7a], r4
 c4 3c 3c              ldi16	r4, 0x3c3c
 c5 3c 3c              ldi16	r5, 0x3c3c
 f0 3c 76              stsp16	[sp+0x76], r4
 f0 3d 78              stsp16	[sp+0x78], r5
 f0 14 88              leasp	r4, 0x88
 c5 00 01              ldi16	r5, 0x100
 c2 08                 ldi8	r6, 0x8
 d5 92                 call8	test_call_strncpy
 f0 14 81              leasp	r4, 0x81
 c5 04 01              ldi16	r5, 0x104
 c2 03                 ldi8	r6, 0x3
 d5 88                 call8	test_call_strncpy
 f0 14 7b              leasp	r4, 0x7b
 c5 0b 01              ldi16	r5, 0x10b
 f0 00 04              ldi8	r0, 0x4
 f1 28                 mov	r6, r0
 e1 7a ff              call16	test_call_strncpy
 f0 14 76              leasp	r4, 0x76
 c5 0f 01              ldi16	r5, 0x10f
 f2 39                 sub	r1, r1
 f1 29                 mov	r6, r1
 e1 6d ff              call16	test_call_strncpy
 c3 0c                 ldi8	r7, 0xc
 c5 17 01              ldi16	r5, 0x117
 f0 12 6a              leasp	r2, 0x6a
 f1 22                 mov	r4, r2
 0b                    mov	r6, r7
 d7 0f                 sys	memcpy
 c5 23 01              ldi16	r5, 0x123
 f0 13 5e              leasp	r3, 0x5e
 f1 23                 mov	r4, r3
 d7 0f                 sys	memcpy
 c4 69 63              ldi16	r4, 0x6369
 c1 65                 ldi8	r5, 0x65
 f0 3c 56              stsp16	[sp+0x56], r4
 f0 3d 58              stsp16	[sp+0x58], r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 5a              stsp16	[sp+0x5a], r4
 f0 3d 5c              stsp16	[sp+0x5c], r5
 c6 6f 61              ldi16	r6, 0x616f
 c3 6b                 ldi8	r7, 0x6b
 f0 3e 4e              stsp16	[sp+0x4e], r6
 f0 3f 50              stsp16	[sp+0x50], r7
 f0 3c 52              stsp16	[sp+0x52], r4
 f0 3d 54              stsp16	[sp+0x54], r5
 f0 3c 4a              stsp16	[sp+0x4a], r4
 f0 3d 4c              stsp16	[sp+0x4c], r5
 f0 3c 46              stsp16	[sp+0x46], r4
 f0 3d 48              stsp16	[sp+0x48], r5
 c5 2f 01              ldi16	r5, 0x12f
 f1 22                 mov	r4, r2
 c2 08                 ldi8	r6, 0x8
 e1 21 ff              call16	test_call_strncat
 c5 34 01              ldi16	r5, 0x134
 f1 23                 mov	r4, r3
 c2 03                 ldi8	r6, 0x3
 e1 17 ff              call16	test_call_strncat
 f0 14 56              leasp	r4, 0x56
 c5 3b 01              ldi16	r5, 0x13b
 f1 29                 mov	r6, r1
 e1 0c ff              call16	test_call_strncat
 f0 14 4e              leasp	r4, 0x4e
 c5 40 01              ldi16	r5, 0x140
 f1 28                 mov	r6, r0
 e1 01 ff              call16	test_call_strncat
 f0 14 46              leasp	r4, 0x46
 c5 41 01              ldi16	r5, 0x141
 c2 02                 ldi8	r6, 0x2
 e1 f6 fe              call16	test_call_strncat
 c5 2b 6d              ldi16	r5, 0x6d2b
 c6 f2 ff              ldi16	r6, 0xfff2
 f0 00 0e              ldi8	r0, 0xe
 f0 1c 7a              ldsp8u	r4, [sp+0x7a]
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 1c 79              ldsp8u	r4, [sp+0x79]
 f0 3c 30              stsp16	[sp+0x30], r4
 f0 1c 78              ldsp8u	r4, [sp+0x78]
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 1c 77              ldsp8u	r4, [sp+0x77]
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 1c 76              ldsp8u	r4, [sp+0x76]
 f0 3c 42              stsp16	[sp+0x42], r4
 f0 1c 80              ldsp8u	r4, [sp+0x80]
 f0 3c 36              stsp16	[sp+0x36], r4
 f0 1c 7f              ldsp8u	r4, [sp+0x7f]
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 1c 7e              ldsp8u	r4, [sp+0x7e]
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 1c 7d              ldsp8u	r4, [sp+0x7d]
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 1c 7c              ldsp8u	r4, [sp+0x7c]
 f4 78                 stsp16	[sp+0xe], r4
 f0 1c 7b              ldsp8u	r4, [sp+0x7b]
 f0 3c 40              stsp16	[sp+0x40], r4
 f0 1c 87              ldsp8u	r4, [sp+0x87]
 f0 3c 38              stsp16	[sp+0x38], r4
 f0 1c 86              ldsp8u	r4, [sp+0x86]
 f4 70                 stsp16	[sp+0xc], r4
 f0 1c 85              ldsp8u	r4, [sp+0x85]
 f4 68                 stsp16	[sp+0xa], r4
 f0 1c 84              ldsp8u	r4, [sp+0x84]
 f4 60                 stsp16	[sp+0x8], r4
 f0 1c 83              ldsp8u	r4, [sp+0x83]
 f4 58                 stsp16	[sp+0x6], r4
 f0 1c 82              ldsp8u	r4, [sp+0x82]
 f4 50                 stsp16	[sp+0x4], r4
 f0 1c 81              ldsp8u	r4, [sp+0x81]
 f0 3c 3e              stsp16	[sp+0x3e], r4
 f0 1c 91              ldsp8u	r4, [sp+0x91]
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 1c 90              ldsp8u	r4, [sp+0x90]
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 1c 8f              ldsp8u	r4, [sp+0x8f]
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 1c 8e              ldsp8u	r4, [sp+0x8e]
 f0 3c 26              stsp16	[sp+0x26], r4
 f0 1c 8d              ldsp8u	r4, [sp+0x8d]
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 1c 8c              ldsp8u	r4, [sp+0x8c]
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 1c 8b              ldsp8u	r4, [sp+0x8b]
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 1c 8a              ldsp8u	r4, [sp+0x8a]
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 1c 89              ldsp8u	r4, [sp+0x89]
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 1c 88              ldsp8u	r4, [sp+0x88]
 f0 3c 2a              stsp16	[sp+0x2a], r4
 f0 01 be              ldi8	r1, 0xbe
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 6c 65              ld8u	r3, [r2+]
 f9 76                 xor	r3, r5
 f0 08 ef              addi.s8	r0, -0x11
 ca 11                 addi.s8	r6, 0x11
 06                    mov	r5, r6
 f2 27                 add	r5, r3
 f5 29                 cmp	r6, r1
 d1 e9                 brne8	avm_test_main+435
 f2 2b                 add	r6, r3
 f0 3e 32              stsp16	[sp+0x32], r6
 c5 2b 6d              ldi16	r5, 0x6d2b
 c4 f2 ff              ldi16	r4, 0xfff2
 f0 3c 44              stsp16	[sp+0x44], r4
 c0 0e                 ldi8	r4, 0xe
 f0 17 5e              leasp	r7, 0x5e
 09                    mov	r6, r5
 fa 9b                 lsr16i	r6, 0xb
 fa 45                 lsl16i	r5, 0x5
 96                    or	r5, r6
 f7 1a                 ld8u	r2, [r7+]
 f9 56                 xor	r2, r5
 c8 ef                 addi.s8	r4, -0x11
 f0 36 44              ldsp16	r6, [sp+0x44]
 ca 11                 addi.s8	r6, 0x11
 06                    mov	r5, r6
 f2 26                 add	r5, r2
 f0 3e 44              stsp16	[sp+0x44], r6
 f5 29                 cmp	r6, r1
 d1 e5                 brne8	avm_test_main+477
 f2 48                 sub	r3, r0
 f1 27                 mov	r5, r3
 f1 75                 zext8	r5
 0d                    mov	r7, r5
 fa a4                 lsr16i	r7, 0x4
 f0 01 30              ldi8	r1, 0x30
 0b                    mov	r6, r7
 f9 c5                 or	r6, r1
 cb 37                 addi.s8	r7, 0x37
 f0 00 a0              ldi8	r0, 0xa0
 f5 24                 cmp	r5, r0
 fc 3e                 cmov.ult	r7, r6
 f0 3f 3a              stsp16	[sp+0x3a], r7
 f1 26                 mov	r5, r2
 24                    sub	r5, r4
 f0 3d 20              stsp16	[sp+0x20], r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 0c                    mov	r7, r4
 fa a4                 lsr16i	r7, 0x4
 07                    mov	r5, r7
 f9 a5                 or	r5, r1
 cb 37                 addi.s8	r7, 0x37
 f5 20                 cmp	r4, r0
 fc 3d                 cmov.ult	r7, r5
 f0 3f 3c              stsp16	[sp+0x3c], r7
 c4 6d 05              ldi16	r4, 0x56d
 f0 35 3e              ldsp16	r5, [sp+0x3e]
 a4                    xor	r5, r4
 08                    mov	r6, r4
 fa 45                 lsl16i	r5, 0x5
 c9 74                 addi.s8	r5, 0x74
 f4 10                 ldsp16	r4, [sp+0x4]
 a4                    xor	r5, r4
 c9 14                 addi.s8	r5, 0x14
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 a4                    xor	r5, r4
 c9 25                 addi.s8	r5, 0x25
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 a4                    xor	r5, r4
 c9 36                 addi.s8	r5, 0x36
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 a4                    xor	r5, r4
 c9 47                 addi.s8	r5, 0x47
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f4 30                 ldsp16	r4, [sp+0xc]
 a4                    xor	r5, r4
 c9 58                 addi.s8	r5, 0x58
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 38              ldsp16	r4, [sp+0x38]
 a4                    xor	r5, r4
 c9 69                 addi.s8	r5, 0x69
 f0 3d 3e              stsp16	[sp+0x3e], r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 0c                    mov	r7, r4
 fa a4                 lsr16i	r7, 0x4
 07                    mov	r5, r7
 f9 a5                 or	r5, r1
 cb 37                 addi.s8	r7, 0x37
 f5 20                 cmp	r4, r0
 fc 3d                 cmov.ult	r7, r5
 f0 3f 38              stsp16	[sp+0x38], r7
 f0 35 40              ldsp16	r5, [sp+0x40]
 a6                    xor	r5, r6
 fa 45                 lsl16i	r5, 0x5
 c9 74                 addi.s8	r5, 0x74
 f4 38                 ldsp16	r4, [sp+0xe]
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
 f0 34 12              ldsp16	r4, [sp+0x12]
 a4                    xor	r5, r4
 c9 36                 addi.s8	r5, 0x36
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 a4                    xor	r5, r4
 c9 47                 addi.s8	r5, 0x47
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 36              ldsp16	r4, [sp+0x36]
 a4                    xor	r5, r4
 c9 58                 addi.s8	r5, 0x58
 f0 3d 40              stsp16	[sp+0x40], r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 04                    mov	r5, r4
 fa 84                 lsr16i	r5, 0x4
 0d                    mov	r7, r5
 f9 e5                 or	r7, r1
 c9 37                 addi.s8	r5, 0x37
 f5 20                 cmp	r4, r0
 fc 2f                 cmov.ult	r5, r7
 f0 3d 36              stsp16	[sp+0x36], r5
 f0 35 42              ldsp16	r5, [sp+0x42]
 a6                    xor	r5, r6
 fa 45                 lsl16i	r5, 0x5
 c9 74                 addi.s8	r5, 0x74
 f0 34 16              ldsp16	r4, [sp+0x16]
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
 f0 34 30              ldsp16	r4, [sp+0x30]
 a4                    xor	r5, r4
 c9 36                 addi.s8	r5, 0x36
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 34              ldsp16	r4, [sp+0x34]
 a4                    xor	r5, r4
 c9 47                 addi.s8	r5, 0x47
 f0 3d 42              stsp16	[sp+0x42], r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 0c                    mov	r7, r4
 fa a4                 lsr16i	r7, 0x4
 07                    mov	r5, r7
 f9 a5                 or	r5, r1
 cb 37                 addi.s8	r7, 0x37
 f5 20                 cmp	r4, r0
 fc 3d                 cmov.ult	r7, r5
 f0 3f 34              stsp16	[sp+0x34], r7
 f0 1d 56              ldsp8u	r5, [sp+0x56]
 0e                    mov	r7, r6
 a7                    xor	r5, r7
 fa 45                 lsl16i	r5, 0x5
 c9 74                 addi.s8	r5, 0x74
 f0 1c 57              ldsp8u	r4, [sp+0x57]
 a1                    xor	r4, r5
 c8 14                 addi.s8	r4, 0x14
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 1d 58              ldsp8u	r5, [sp+0x58]
 a4                    xor	r5, r4
 c9 25                 addi.s8	r5, 0x25
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1c 59              ldsp8u	r4, [sp+0x59]
 a1                    xor	r4, r5
 c8 36                 addi.s8	r4, 0x36
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 1d 5a              ldsp8u	r5, [sp+0x5a]
 a4                    xor	r5, r4
 c9 47                 addi.s8	r5, 0x47
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1c 5b              ldsp8u	r4, [sp+0x5b]
 a1                    xor	r4, r5
 c8 58                 addi.s8	r4, 0x58
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 1d 5c              ldsp8u	r5, [sp+0x5c]
 a4                    xor	r5, r4
 c9 69                 addi.s8	r5, 0x69
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1c 5d              ldsp8u	r4, [sp+0x5d]
 a1                    xor	r4, r5
 c8 7a                 addi.s8	r4, 0x7a
 f0 3c 14              stsp16	[sp+0x14], r4
 f1 74                 zext8	r4
 08                    mov	r6, r4
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a5                 or	r5, r1
 ca 37                 addi.s8	r6, 0x37
 f5 20                 cmp	r4, r0
 fc 35                 cmov.ult	r6, r5
 f0 3e 30              stsp16	[sp+0x30], r6
 f0 1d 4e              ldsp8u	r5, [sp+0x4e]
 a7                    xor	r5, r7
 fa 45                 lsl16i	r5, 0x5
 c9 74                 addi.s8	r5, 0x74
 f0 1c 4f              ldsp8u	r4, [sp+0x4f]
 a1                    xor	r4, r5
 c8 14                 addi.s8	r4, 0x14
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 1d 50              ldsp8u	r5, [sp+0x50]
 a4                    xor	r5, r4
 c9 25                 addi.s8	r5, 0x25
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1c 51              ldsp8u	r4, [sp+0x51]
 a1                    xor	r4, r5
 c8 36                 addi.s8	r4, 0x36
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 1d 52              ldsp8u	r5, [sp+0x52]
 a4                    xor	r5, r4
 c9 47                 addi.s8	r5, 0x47
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1c 53              ldsp8u	r4, [sp+0x53]
 a1                    xor	r4, r5
 c8 58                 addi.s8	r4, 0x58
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 1d 54              ldsp8u	r5, [sp+0x54]
 a4                    xor	r5, r4
 c9 69                 addi.s8	r5, 0x69
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1c 55              ldsp8u	r4, [sp+0x55]
 a1                    xor	r4, r5
 c8 7a                 addi.s8	r4, 0x7a
 f0 3c 12              stsp16	[sp+0x12], r4
 f1 74                 zext8	r4
 08                    mov	r6, r4
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a5                 or	r5, r1
 ca 37                 addi.s8	r6, 0x37
 f5 20                 cmp	r4, r0
 fc 35                 cmov.ult	r6, r5
 f0 3e 22              stsp16	[sp+0x22], r6
 f0 1d 46              ldsp8u	r5, [sp+0x46]
 a7                    xor	r5, r7
 fa 45                 lsl16i	r5, 0x5
 c9 74                 addi.s8	r5, 0x74
 f0 1c 47              ldsp8u	r4, [sp+0x47]
 a1                    xor	r4, r5
 c8 14                 addi.s8	r4, 0x14
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 1d 48              ldsp8u	r5, [sp+0x48]
 a4                    xor	r5, r4
 c9 25                 addi.s8	r5, 0x25
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1c 49              ldsp8u	r4, [sp+0x49]
 a1                    xor	r4, r5
 c8 36                 addi.s8	r4, 0x36
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 1d 4a              ldsp8u	r5, [sp+0x4a]
 a4                    xor	r5, r4
 c9 47                 addi.s8	r5, 0x47
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1c 4b              ldsp8u	r4, [sp+0x4b]
 a1                    xor	r4, r5
 c8 58                 addi.s8	r4, 0x58
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 1d 4c              ldsp8u	r5, [sp+0x4c]
 a4                    xor	r5, r4
 c9 69                 addi.s8	r5, 0x69
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1c 4d              ldsp8u	r4, [sp+0x4d]
 a1                    xor	r4, r5
 c8 7a                 addi.s8	r4, 0x7a
 f0 3c 10              stsp16	[sp+0x10], r4
 f1 74                 zext8	r4
 08                    mov	r6, r4
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a5                 or	r5, r1
 ca 37                 addi.s8	r6, 0x37
 f5 20                 cmp	r4, r0
 fc 35                 cmov.ult	r6, r5
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 a7                    xor	r5, r7
 fa 45                 lsl16i	r5, 0x5
 c9 74                 addi.s8	r5, 0x74
 f0 34 18              ldsp16	r4, [sp+0x18]
 a4                    xor	r5, r4
 c9 14                 addi.s8	r5, 0x14
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 a4                    xor	r5, r4
 c9 25                 addi.s8	r5, 0x25
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 a4                    xor	r5, r4
 c9 36                 addi.s8	r5, 0x36
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 a4                    xor	r5, r4
 c9 47                 addi.s8	r5, 0x47
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 24              ldsp16	r4, [sp+0x24]
 a4                    xor	r5, r4
 c9 58                 addi.s8	r5, 0x58
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 26              ldsp16	r4, [sp+0x26]
 a4                    xor	r5, r4
 c9 69                 addi.s8	r5, 0x69
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 28              ldsp16	r4, [sp+0x28]
 a4                    xor	r5, r4
 c9 7a                 addi.s8	r5, 0x7a
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 a4                    xor	r5, r4
 c0 8b                 ldi8	r4, 0x8b
 11                    add	r4, r5
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 35 2e              ldsp16	r5, [sp+0x2e]
 a1                    xor	r4, r5
 c1 9c                 ldi8	r5, 0x9c
 14                    add	r5, r4
 f0 3d 24              stsp16	[sp+0x24], r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 08                    mov	r6, r4
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a5                 or	r5, r1
 ca 37                 addi.s8	r6, 0x37
 f5 20                 cmp	r4, r0
 fc 35                 cmov.ult	r6, r5
 f0 3e 26              stsp16	[sp+0x26], r6
 f0 00 0f              ldi8	r0, 0xf
 f9 60                 and	r3, r0
 f1 23                 mov	r4, r3
 f9 85                 or	r4, r1
 f1 27                 mov	r5, r3
 c9 37                 addi.s8	r5, 0x37
 f0 0f 0a              cmpi.s8	r3, 0xa
 fc 2c                 cmov.ult	r5, r4
 f0 3d 2e              stsp16	[sp+0x2e], r5
 f0 37 32              ldsp16	r7, [sp+0x32]
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 a5                 or	r5, r1
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f0 3e 2c              stsp16	[sp+0x2c], r6
 07                    mov	r5, r7
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 f0 07 00 a0           ldi16	r3, 0xa000
 f5 2f                 cmp	r7, r3
 fc 2c                 cmov.ult	r5, r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 f0 35 20              ldsp16	r5, [sp+0x20]
 f9 a0                 and	r5, r0
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 09                    mov	r6, r5
 ca 37                 addi.s8	r6, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 34                 cmov.ult	r6, r4
 f0 3e 32              stsp16	[sp+0x32], r6
 f0 35 44              ldsp16	r5, [sp+0x44]
 f2 26                 add	r5, r2
 09                    mov	r6, r5
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 85                 or	r4, r1
 ca 37                 addi.s8	r6, 0x37
 f5 27                 cmp	r5, r3
 fc 34                 cmov.ult	r6, r4
 f0 3e 44              stsp16	[sp+0x44], r6
 fa 88                 lsr16i	r5, 0x8
 f9 a0                 and	r5, r0
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 09                    mov	r6, r5
 ca 37                 addi.s8	r6, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 34                 cmov.ult	r6, r4
 f0 3e 28              stsp16	[sp+0x28], r6
 f0 36 3e              ldsp16	r6, [sp+0x3e]
 02                    mov	r4, r6
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 a5                 or	r5, r1
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3d                 cmov.ult	r7, r5
 f0 3f 20              stsp16	[sp+0x20], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 a5                 or	r5, r1
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3d                 cmov.ult	r7, r5
 f0 3f 1c              stsp16	[sp+0x1c], r7
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 f5 2b                 cmp	r6, r3
 fc 2c                 cmov.ult	r5, r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 36 40              ldsp16	r6, [sp+0x40]
 02                    mov	r4, r6
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 a5                 or	r5, r1
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3d                 cmov.ult	r7, r5
 f0 3f 1e              stsp16	[sp+0x1e], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 a5                 or	r5, r1
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3d                 cmov.ult	r7, r5
 f4 73                 stsp16	[sp+0xc], r7
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 f5 2b                 cmp	r6, r3
 fc 2c                 cmov.ult	r5, r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 36 42              ldsp16	r6, [sp+0x42]
 02                    mov	r4, r6
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 a5                 or	r5, r1
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3d                 cmov.ult	r7, r5
 f0 3f 18              stsp16	[sp+0x18], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 a5                 or	r5, r1
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3d                 cmov.ult	r7, r5
 f4 63                 stsp16	[sp+0x8], r7
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 f5 2b                 cmp	r6, r3
 fc 2c                 cmov.ult	r5, r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 36 10              ldsp16	r6, [sp+0x10]
 02                    mov	r4, r6
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 a5                 or	r5, r1
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3d                 cmov.ult	r7, r5
 f0 3f 42              stsp16	[sp+0x42], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 a5                 or	r5, r1
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3d                 cmov.ult	r7, r5
 f0 3f 40              stsp16	[sp+0x40], r7
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 f5 2b                 cmp	r6, r3
 fc 2c                 cmov.ult	r5, r4
 f0 3d 3e              stsp16	[sp+0x3e], r5
 f0 36 12              ldsp16	r6, [sp+0x12]
 02                    mov	r4, r6
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 a5                 or	r5, r1
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3d                 cmov.ult	r7, r5
 f0 3f 1a              stsp16	[sp+0x1a], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 a5                 or	r5, r1
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3d                 cmov.ult	r7, r5
 f0 3f 10              stsp16	[sp+0x10], r7
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 f5 2b                 cmp	r6, r3
 fc 2c                 cmov.ult	r5, r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 36 14              ldsp16	r6, [sp+0x14]
 02                    mov	r4, r6
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 a5                 or	r5, r1
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3d                 cmov.ult	r7, r5
 f4 53                 stsp16	[sp+0x4], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 a5                 or	r5, r1
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3d                 cmov.ult	r7, r5
 f4 4b                 stsp16	[sp+0x2], r7
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 f5 2b                 cmp	r6, r3
 fc 2c                 cmov.ult	r5, r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 37 24              ldsp16	r7, [sp+0x24]
 03                    mov	r4, r7
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 a5                 or	r5, r1
 08                    mov	r6, r4
 ca 37                 addi.s8	r6, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 35                 cmov.ult	r6, r5
 f4 42                 stsp16	[sp+0x0], r6
 0b                    mov	r6, r7
 fa 9c                 lsr16i	r6, 0xc
 06                    mov	r5, r6
 f9 a5                 or	r5, r1
 ca 37                 addi.s8	r6, 0x37
 f5 2f                 cmp	r7, r3
 fc 35                 cmov.ult	r6, r5
 fa a8                 lsr16i	r7, 0x8
 f9 e0                 and	r7, r0
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 07                    mov	r5, r7
 c9 37                 addi.s8	r5, 0x37
 cf 0a                 cmpi.s8	r7, 0xa
 fc 2c                 cmov.ult	r5, r4
 c0 52                 ldi8	r4, 0x52
 d7 00                 sys	debug_putc
 f0 03 46              ldi8	r3, 0x46
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 f0 00 3d              ldi8	r0, 0x3d
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f0 02 0a              ldi8	r2, 0xa
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f0 01 4e              ldi8	r1, 0x4e
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 c0 50                 ldi8	r4, 0x50
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f0 34 26              ldsp16	r4, [sp+0x26]
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 c3 54                 ldi8	r7, 0x54
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 00                 sys	debug_putc
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 d7 00                 sys	debug_putc
 f0 34 38              ldsp16	r4, [sp+0x38]
 d7 00                 sys	debug_putc
 f0 34 20              ldsp16	r4, [sp+0x20]
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 c2 45                 ldi8	r6, 0x45
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 f0 34 36              ldsp16	r4, [sp+0x36]
 d7 00                 sys	debug_putc
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 f0 01 5a              ldi8	r1, 0x5a
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 f0 34 34              ldsp16	r4, [sp+0x34]
 d7 00                 sys	debug_putc
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 c1 43                 ldi8	r5, 0x43
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 d7 00                 sys	debug_putc
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 d7 00                 sys	debug_putc
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 d7 00                 sys	debug_putc
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f0 34 44              ldsp16	r4, [sp+0x44]
 d7 00                 sys	debug_putc
 f0 34 28              ldsp16	r4, [sp+0x28]
 d7 00                 sys	debug_putc
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 d7 00                 sys	debug_putc
 f0 34 32              ldsp16	r4, [sp+0x32]
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f0 34 14              ldsp16	r4, [sp+0x14]
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 f0 34 30              ldsp16	r4, [sp+0x30]
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 f0 34 22              ldsp16	r4, [sp+0x22]
 d7 00                 sys	debug_putc
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 44                 ldi8	r4, 0x44
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 d7 00                 sys	debug_putc
 f0 34 40              ldsp16	r4, [sp+0x40]
 d7 00                 sys	debug_putc
 f0 34 16              ldsp16	r4, [sp+0x16]
 d7 00                 sys	debug_putc
 f0 34 42              ldsp16	r4, [sp+0x42]
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 c0 09                 ldi8	r4, 0x9
 f0 06 44 01           ldi16	r2, 0x144
 f0 16 88              leasp	r6, 0x88
 c1 01                 ldi8	r5, 0x1
 f0 6c 05              ld8u	r0, [r2+]
 f7 11                 ld8u	r1, [r6+]
 f6 2c                 tst16	r4
 f8 0f                 cset.ne	r7
 f4 b4                 dec16	r4
 f5 08                 cmp	r1, r0
 d1 05                 brne8	avm_test_main+2104
 8d                    and	r7, r5
 f4 a7                 tst8	r7
 d1 ec                 brne8	avm_test_main+2084
 c0 01                 ldi8	r4, 0x1
 f5 08                 cmp	r1, r0
 db 24 01              brne16	avm_test_main+2403
 c1 06                 ldi8	r5, 0x6
 f0 06 4e 01           ldi16	r2, 0x14e
 f0 13 81              leasp	r3, 0x81
 c3 01                 ldi8	r7, 0x1
 f0 6c 05              ld8u	r0, [r2+]
 f0 6c 27              ld8u	r1, [r3+]
 f6 2d                 tst16	r5
 f8 0e                 cset.ne	r6
 f4 b5                 dec16	r5
 f5 08                 cmp	r1, r0
 d1 05                 brne8	avm_test_main+2143
 8b                    and	r6, r7
 f4 a6                 tst8	r6
 d1 eb                 brne8	avm_test_main+2122
 f5 08                 cmp	r1, r0
 db ff 00              brne16	avm_test_main+2403
 c1 05                 ldi8	r5, 0x5
 f0 06 55 01           ldi16	r2, 0x155
 f0 13 7b              leasp	r3, 0x7b
 c3 01                 ldi8	r7, 0x1
 f0 6c 05              ld8u	r0, [r2+]
 f0 6c 27              ld8u	r1, [r3+]
 f6 2d                 tst16	r5
 f8 0e                 cset.ne	r6
 f4 b5                 dec16	r5
 f5 08                 cmp	r1, r0
 d1 05                 brne8	avm_test_main+2180
 8b                    and	r6, r7
 f4 a6                 tst8	r6
 d1 eb                 brne8	avm_test_main+2159
 f5 08                 cmp	r1, r0
 db da 00              brne16	avm_test_main+2403
 f0 11 76              leasp	r1, 0x76
 c1 04                 ldi8	r5, 0x4
 c2 01                 ldi8	r6, 0x1
 f0 6c 03              ld8u	r0, [r1+]
 f6 2d                 tst16	r5
 f8 0f                 cset.ne	r7
 f4 b5                 dec16	r5
 f0 0c 3c              cmpi.s8	r0, 0x3c
 d1 05                 brne8	avm_test_main+2211
 8e                    and	r7, r6
 f4 a7                 tst8	r7
 d1 ed                 brne8	avm_test_main+2192
 f0 1d 6a              ldsp8u	r5, [sp+0x6a]
 f0 0c 3c              cmpi.s8	r0, 0x3c
 db b7 00              brne16	avm_test_main+2403
 f1 75                 zext8	r5
 cd 72                 cmpi.s8	r5, 0x72
 db b0 00              brne16	avm_test_main+2403
 c3 72                 ldi8	r7, 0x72
 c5 5c 01              ldi16	r5, 0x15c
 f0 11 6a              leasp	r1, 0x6a
 f4 a7                 tst8	r7
 d0 12                 breq8	avm_test_main+2257
 f7 08                 ld8u	r0, [r5+]
 f1 29                 mov	r6, r1
 f4 ae                 inc16	r6
 ed e2 21              ld8u	r7, [r1+1]
 f5 2c                 cmp	r7, r0
 f1 0e                 mov	r1, r6
 d0 ed                 breq8	avm_test_main+2235
 e0 92 00              jmp16	avm_test_main+2403
 f0 1d 5e              ldsp8u	r5, [sp+0x5e]
 cd 73                 cmpi.s8	r5, 0x73
 db 8a 00              brne16	avm_test_main+2403
 c3 73                 ldi8	r7, 0x73
 c5 64 01              ldi16	r5, 0x164
 f0 11 5e              leasp	r1, 0x5e
 f4 a7                 tst8	r7
 d0 11                 breq8	avm_test_main+2294
 f7 08                 ld8u	r0, [r5+]
 f1 29                 mov	r6, r1
 f4 ae                 inc16	r6
 ed e2 21              ld8u	r7, [r1+1]
 f5 2c                 cmp	r7, r0
 f1 0e                 mov	r1, r6
 d0 ed                 breq8	avm_test_main+2273
 d4 6d                 jmp8	avm_test_main+2403
 f0 1d 56              ldsp8u	r5, [sp+0x56]
 cd 69                 cmpi.s8	r5, 0x69
 d1 66                 brne8	avm_test_main+2403
 c3 69                 ldi8	r7, 0x69
 c5 6b 01              ldi16	r5, 0x16b
 f0 11 56              leasp	r1, 0x56
 f4 a7                 tst8	r7
 d0 11                 breq8	avm_test_main+2330
 f7 08                 ld8u	r0, [r5+]
 f1 29                 mov	r6, r1
 f4 ae                 inc16	r6
 ed e2 21              ld8u	r7, [r1+1]
 f5 2c                 cmp	r7, r0
 f1 0e                 mov	r1, r6
 d0 ed                 breq8	avm_test_main+2309
 d4 49                 jmp8	avm_test_main+2403
 f0 1d 4e              ldsp8u	r5, [sp+0x4e]
 cd 6f                 cmpi.s8	r5, 0x6f
 d1 42                 brne8	avm_test_main+2403
 c3 6f                 ldi8	r7, 0x6f
 c5 6f 01              ldi16	r5, 0x16f
 f0 11 4e              leasp	r1, 0x4e
 f4 a7                 tst8	r7
 d0 11                 breq8	avm_test_main+2366
 f7 08                 ld8u	r0, [r5+]
 f1 29                 mov	r6, r1
 f4 ae                 inc16	r6
 ed e2 21              ld8u	r7, [r1+1]
 f5 2c                 cmp	r7, r0
 f1 0e                 mov	r1, r6
 d0 ed                 breq8	avm_test_main+2345
 d4 25                 jmp8	avm_test_main+2403
 f0 1d 46              ldsp8u	r5, [sp+0x46]
 cd 67                 cmpi.s8	r5, 0x67
 d1 1e                 brne8	avm_test_main+2403
 c3 67                 ldi8	r7, 0x67
 c5 42 01              ldi16	r5, 0x142
 f0 11 46              leasp	r1, 0x46
 f4 a7                 tst8	r7
 d0 11                 breq8	avm_test_main+2402
 f7 08                 ld8u	r0, [r5+]
 f1 29                 mov	r6, r1
 f4 ae                 inc16	r6
 ed e2 21              ld8u	r7, [r1+1]
 f5 2c                 cmp	r7, r0
 f1 0e                 mov	r1, r6
 d0 ed                 breq8	avm_test_main+2381
 d4 01                 jmp8	avm_test_main+2403
 a0                    xor	r4, r4
 d6 7f                 adjsp	0x7f
 d6 13                 adjsp	0x13
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
