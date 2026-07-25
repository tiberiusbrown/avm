
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
00000220 g     F .text	0000092d avm_test_main
00000b4d g     F .text	00000002 avm_halt
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
 e1 37 09              call16	avm_halt

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
 d6 f0                 adjsp	-0x10
 c4 a5 a5              ldi16	r4, 0xa5a5
 f0 3c 8e              stsp16	[sp+0x8e], r4
 c4 a5 a5              ldi16	r4, 0xa5a5
 c5 a5 a5              ldi16	r5, 0xa5a5
 f0 3c 8a              stsp16	[sp+0x8a], r4
 f0 3d 8c              stsp16	[sp+0x8c], r5
 f0 3c 86              stsp16	[sp+0x86], r4
 f0 3d 88              stsp16	[sp+0x88], r5
 c4 cc cc              ldi16	r4, 0xcccc
 c1 cc                 ldi8	r5, 0xcc
 f0 3c 83              stsp16	[sp+0x83], r4
 f0 2d 85              stsp8	[sp+0x85], r5
 c4 cc cc              ldi16	r4, 0xcccc
 c5 cc cc              ldi16	r5, 0xcccc
 f0 3c 7f              stsp16	[sp+0x7f], r4
 f0 3d 81              stsp16	[sp+0x81], r5
 c4 7e 7e              ldi16	r4, 0x7e7e
 f0 3c 7d              stsp16	[sp+0x7d], r4
 c4 7e 7e              ldi16	r4, 0x7e7e
 c5 7e 7e              ldi16	r5, 0x7e7e
 f0 3c 79              stsp16	[sp+0x79], r4
 f0 3d 7b              stsp16	[sp+0x7b], r5
 c0 3c                 ldi8	r4, 0x3c
 f0 2c 78              stsp8	[sp+0x78], r4
 c4 3c 3c              ldi16	r4, 0x3c3c
 c5 3c 3c              ldi16	r5, 0x3c3c
 f0 3c 74              stsp16	[sp+0x74], r4
 f0 3d 76              stsp16	[sp+0x76], r5
 f0 14 86              leasp	r4, 0x86
 c5 00 01              ldi16	r5, 0x100
 c2 08                 ldi8	r6, 0x8
 d5 92                 call8	test_call_strncpy
 f0 14 7f              leasp	r4, 0x7f
 c5 04 01              ldi16	r5, 0x104
 c2 03                 ldi8	r6, 0x3
 d5 88                 call8	test_call_strncpy
 f0 14 79              leasp	r4, 0x79
 c5 0b 01              ldi16	r5, 0x10b
 f0 00 04              ldi8	r0, 0x4
 f1 28                 mov	r6, r0
 e1 7a ff              call16	test_call_strncpy
 f0 14 74              leasp	r4, 0x74
 c5 0f 01              ldi16	r5, 0x10f
 f2 39                 sub	r1, r1
 f1 29                 mov	r6, r1
 e1 6d ff              call16	test_call_strncpy
 c2 0c                 ldi8	r6, 0xc
 c5 17 01              ldi16	r5, 0x117
 f0 12 68              leasp	r2, 0x68
 f1 22                 mov	r4, r2
 d7 0f                 sys	memcpy
 c5 23 01              ldi16	r5, 0x123
 f0 13 5c              leasp	r3, 0x5c
 f1 23                 mov	r4, r3
 d7 0f                 sys	memcpy
 c4 69 63              ldi16	r4, 0x6369
 c1 65                 ldi8	r5, 0x65
 f0 3c 54              stsp16	[sp+0x54], r4
 f0 3d 56              stsp16	[sp+0x56], r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 58              stsp16	[sp+0x58], r4
 f0 3d 5a              stsp16	[sp+0x5a], r5
 c6 6f 61              ldi16	r6, 0x616f
 c3 6b                 ldi8	r7, 0x6b
 f0 3e 4c              stsp16	[sp+0x4c], r6
 f0 3f 4e              stsp16	[sp+0x4e], r7
 f0 3c 50              stsp16	[sp+0x50], r4
 f0 3d 52              stsp16	[sp+0x52], r5
 f0 3c 48              stsp16	[sp+0x48], r4
 f0 3d 4a              stsp16	[sp+0x4a], r5
 f0 3c 44              stsp16	[sp+0x44], r4
 f0 3d 46              stsp16	[sp+0x46], r5
 c5 2f 01              ldi16	r5, 0x12f
 f1 22                 mov	r4, r2
 c2 08                 ldi8	r6, 0x8
 e1 22 ff              call16	test_call_strncat
 c5 34 01              ldi16	r5, 0x134
 f1 23                 mov	r4, r3
 c2 03                 ldi8	r6, 0x3
 e1 18 ff              call16	test_call_strncat
 f0 14 54              leasp	r4, 0x54
 c5 3b 01              ldi16	r5, 0x13b
 f1 29                 mov	r6, r1
 e1 0d ff              call16	test_call_strncat
 f0 14 4c              leasp	r4, 0x4c
 c5 40 01              ldi16	r5, 0x140
 f1 28                 mov	r6, r0
 e1 02 ff              call16	test_call_strncat
 f0 14 44              leasp	r4, 0x44
 c5 41 01              ldi16	r5, 0x141
 c2 02                 ldi8	r6, 0x2
 e1 f7 fe              call16	test_call_strncat
 c7 2b 6d              ldi16	r7, 0x6d2b
 c5 f2 ff              ldi16	r5, 0xfff2
 f0 01 0e              ldi8	r1, 0xe
 f0 1c 78              ldsp8u	r4, [sp+0x78]
 f0 3c 3a              stsp16	[sp+0x3a], r4
 f0 1c 77              ldsp8u	r4, [sp+0x77]
 f0 3c 36              stsp16	[sp+0x36], r4
 f0 1c 76              ldsp8u	r4, [sp+0x76]
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 1c 75              ldsp8u	r4, [sp+0x75]
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 1c 74              ldsp8u	r4, [sp+0x74]
 f0 3c 40              stsp16	[sp+0x40], r4
 f0 1c 7e              ldsp8u	r4, [sp+0x7e]
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 1c 7d              ldsp8u	r4, [sp+0x7d]
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 1c 7c              ldsp8u	r4, [sp+0x7c]
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 1c 7b              ldsp8u	r4, [sp+0x7b]
 f4 78                 stsp16	[sp+0xe], r4
 f0 1c 7a              ldsp8u	r4, [sp+0x7a]
 f4 70                 stsp16	[sp+0xc], r4
 f0 1c 79              ldsp8u	r4, [sp+0x79]
 f0 3c 3e              stsp16	[sp+0x3e], r4
 f0 1c 85              ldsp8u	r4, [sp+0x85]
 f0 3c 30              stsp16	[sp+0x30], r4
 f0 1c 84              ldsp8u	r4, [sp+0x84]
 f4 68                 stsp16	[sp+0xa], r4
 f0 1c 83              ldsp8u	r4, [sp+0x83]
 f4 60                 stsp16	[sp+0x8], r4
 f0 1c 82              ldsp8u	r4, [sp+0x82]
 f4 58                 stsp16	[sp+0x6], r4
 f0 1c 81              ldsp8u	r4, [sp+0x81]
 f4 50                 stsp16	[sp+0x4], r4
 f0 1c 80              ldsp8u	r4, [sp+0x80]
 f4 48                 stsp16	[sp+0x2], r4
 f0 1c 7f              ldsp8u	r4, [sp+0x7f]
 f0 3c 3c              stsp16	[sp+0x3c], r4
 f0 1c 8f              ldsp8u	r4, [sp+0x8f]
 f0 3c 26              stsp16	[sp+0x26], r4
 f0 1c 8e              ldsp8u	r4, [sp+0x8e]
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 1c 8d              ldsp8u	r4, [sp+0x8d]
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 1c 8c              ldsp8u	r4, [sp+0x8c]
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 1c 8b              ldsp8u	r4, [sp+0x8b]
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 1c 8a              ldsp8u	r4, [sp+0x8a]
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 1c 89              ldsp8u	r4, [sp+0x89]
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 1c 88              ldsp8u	r4, [sp+0x88]
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 1c 87              ldsp8u	r4, [sp+0x87]
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 1c 86              ldsp8u	r4, [sp+0x86]
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 03 be              ldi8	r3, 0xbe
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 6c 85              ld8u	r4, [r2+]
 a3                    xor	r4, r7
 f0 09 ef              addi.s8	r1, -0x11
 c9 11                 addi.s8	r5, 0x11
 0d                    mov	r7, r5
 1c                    add	r7, r4
 f5 27                 cmp	r5, r3
 d1 eb                 brne8	avm_test_main+433
 f1 14                 mov	r2, r4
 14                    add	r5, r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 c6 2b 6d              ldi16	r6, 0x6d2b
 c4 f2 ff              ldi16	r4, 0xfff2
 f0 3c 42              stsp16	[sp+0x42], r4
 c0 0e                 ldi8	r4, 0xe
 f0 17 5c              leasp	r7, 0x5c
 06                    mov	r5, r6
 fa 8b                 lsr16i	r5, 0xb
 fa 55                 lsl16i	r6, 0x5
 99                    or	r6, r5
 f7 18                 ld8u	r0, [r7+]
 f9 1a                 xor	r0, r6
 c8 ef                 addi.s8	r4, -0x11
 f0 35 42              ldsp16	r5, [sp+0x42]
 c9 11                 addi.s8	r5, 0x11
 09                    mov	r6, r5
 f2 28                 add	r6, r0
 f0 3d 42              stsp16	[sp+0x42], r5
 f5 27                 cmp	r5, r3
 d1 e5                 brne8	avm_test_main+474
 f1 1a                 mov	r3, r2
 f2 49                 sub	r3, r1
 f1 27                 mov	r5, r3
 f1 75                 zext8	r5
 0d                    mov	r7, r5
 fa a4                 lsr16i	r7, 0x4
 f0 01 30              ldi8	r1, 0x30
 0b                    mov	r6, r7
 f9 c5                 or	r6, r1
 cb 37                 addi.s8	r7, 0x37
 f0 02 a0              ldi8	r2, 0xa0
 f5 26                 cmp	r5, r2
 fc 3e                 cmov.ult	r7, r6
 f0 3f 32              stsp16	[sp+0x32], r7
 f1 24                 mov	r5, r0
 24                    sub	r5, r4
 f0 3d 38              stsp16	[sp+0x38], r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 0c                    mov	r7, r4
 fa a4                 lsr16i	r7, 0x4
 07                    mov	r5, r7
 f9 a5                 or	r5, r1
 cb 37                 addi.s8	r7, 0x37
 f5 22                 cmp	r4, r2
 fc 3d                 cmov.ult	r7, r5
 f0 3f 34              stsp16	[sp+0x34], r7
 c6 6d 05              ldi16	r6, 0x56d
 f0 35 3c              ldsp16	r5, [sp+0x3c]
 a6                    xor	r5, r6
 fa 45                 lsl16i	r5, 0x5
 c9 74                 addi.s8	r5, 0x74
 f4 08                 ldsp16	r4, [sp+0x2]
 a4                    xor	r5, r4
 c9 14                 addi.s8	r5, 0x14
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 a4                    xor	r5, r4
 c9 25                 addi.s8	r5, 0x25
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 a4                    xor	r5, r4
 c9 36                 addi.s8	r5, 0x36
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f4 20                 ldsp16	r4, [sp+0x8]
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
 f0 34 30              ldsp16	r4, [sp+0x30]
 a4                    xor	r5, r4
 c9 69                 addi.s8	r5, 0x69
 f0 3d 3c              stsp16	[sp+0x3c], r5
 f1 75                 zext8	r5
 f5 26                 cmp	r5, r2
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 30              stsp16	[sp+0x30], r5
 f0 35 3e              ldsp16	r5, [sp+0x3e]
 a6                    xor	r5, r6
 fa 45                 lsl16i	r5, 0x5
 c9 74                 addi.s8	r5, 0x74
 f4 30                 ldsp16	r4, [sp+0xc]
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
 f0 34 10              ldsp16	r4, [sp+0x10]
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
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 a4                    xor	r5, r4
 c9 58                 addi.s8	r5, 0x58
 f0 3d 3e              stsp16	[sp+0x3e], r5
 0d                    mov	r7, r5
 f1 77                 zext8	r7
 f5 2e                 cmp	r7, r2
 fa a4                 lsr16i	r7, 0x4
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 2e              stsp16	[sp+0x2e], r7
 f0 35 40              ldsp16	r5, [sp+0x40]
 a6                    xor	r5, r6
 fa 45                 lsl16i	r5, 0x5
 c9 74                 addi.s8	r5, 0x74
 f0 34 28              ldsp16	r4, [sp+0x28]
 a4                    xor	r5, r4
 c9 14                 addi.s8	r5, 0x14
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 a4                    xor	r5, r4
 c9 25                 addi.s8	r5, 0x25
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 36              ldsp16	r4, [sp+0x36]
 a4                    xor	r5, r4
 c9 36                 addi.s8	r5, 0x36
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 a4                    xor	r5, r4
 c9 47                 addi.s8	r5, 0x47
 f0 3d 40              stsp16	[sp+0x40], r5
 0d                    mov	r7, r5
 f1 77                 zext8	r7
 f5 2e                 cmp	r7, r2
 fa a4                 lsr16i	r7, 0x4
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 2c              stsp16	[sp+0x2c], r7
 f0 1d 54              ldsp8u	r5, [sp+0x54]
 a6                    xor	r5, r6
 fa 45                 lsl16i	r5, 0x5
 c9 74                 addi.s8	r5, 0x74
 f0 1c 55              ldsp8u	r4, [sp+0x55]
 a1                    xor	r4, r5
 c8 14                 addi.s8	r4, 0x14
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 1d 56              ldsp8u	r5, [sp+0x56]
 a4                    xor	r5, r4
 c9 25                 addi.s8	r5, 0x25
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1c 57              ldsp8u	r4, [sp+0x57]
 a1                    xor	r4, r5
 c8 36                 addi.s8	r4, 0x36
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 1d 58              ldsp8u	r5, [sp+0x58]
 a4                    xor	r5, r4
 c9 47                 addi.s8	r5, 0x47
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1c 59              ldsp8u	r4, [sp+0x59]
 a1                    xor	r4, r5
 c8 58                 addi.s8	r4, 0x58
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 1d 5a              ldsp8u	r5, [sp+0x5a]
 a4                    xor	r5, r4
 c9 69                 addi.s8	r5, 0x69
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1c 5b              ldsp8u	r4, [sp+0x5b]
 a1                    xor	r4, r5
 c8 7a                 addi.s8	r4, 0x7a
 f0 3c 3a              stsp16	[sp+0x3a], r4
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f5 26                 cmp	r5, r2
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 28              stsp16	[sp+0x28], r5
 f0 1d 4c              ldsp8u	r5, [sp+0x4c]
 a6                    xor	r5, r6
 fa 45                 lsl16i	r5, 0x5
 c9 74                 addi.s8	r5, 0x74
 f0 1c 4d              ldsp8u	r4, [sp+0x4d]
 a1                    xor	r4, r5
 c8 14                 addi.s8	r4, 0x14
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 1d 4e              ldsp8u	r5, [sp+0x4e]
 a4                    xor	r5, r4
 c9 25                 addi.s8	r5, 0x25
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1c 4f              ldsp8u	r4, [sp+0x4f]
 a1                    xor	r4, r5
 c8 36                 addi.s8	r4, 0x36
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 1d 50              ldsp8u	r5, [sp+0x50]
 a4                    xor	r5, r4
 c9 47                 addi.s8	r5, 0x47
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1c 51              ldsp8u	r4, [sp+0x51]
 a1                    xor	r4, r5
 c8 58                 addi.s8	r4, 0x58
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 1d 52              ldsp8u	r5, [sp+0x52]
 a4                    xor	r5, r4
 c9 69                 addi.s8	r5, 0x69
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1c 53              ldsp8u	r4, [sp+0x53]
 a1                    xor	r4, r5
 c8 7a                 addi.s8	r4, 0x7a
 f0 3c 36              stsp16	[sp+0x36], r4
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f5 26                 cmp	r5, r2
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 1d 44              ldsp8u	r5, [sp+0x44]
 a6                    xor	r5, r6
 fa 45                 lsl16i	r5, 0x5
 c9 74                 addi.s8	r5, 0x74
 f0 1c 45              ldsp8u	r4, [sp+0x45]
 a1                    xor	r4, r5
 c8 14                 addi.s8	r4, 0x14
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 1d 46              ldsp8u	r5, [sp+0x46]
 a4                    xor	r5, r4
 c9 25                 addi.s8	r5, 0x25
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1c 47              ldsp8u	r4, [sp+0x47]
 a1                    xor	r4, r5
 c8 36                 addi.s8	r4, 0x36
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 1d 48              ldsp8u	r5, [sp+0x48]
 a4                    xor	r5, r4
 c9 47                 addi.s8	r5, 0x47
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1c 49              ldsp8u	r4, [sp+0x49]
 a1                    xor	r4, r5
 c8 58                 addi.s8	r4, 0x58
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 1d 4a              ldsp8u	r5, [sp+0x4a]
 a4                    xor	r5, r4
 c9 69                 addi.s8	r5, 0x69
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1f 4b              ldsp8u	r7, [sp+0x4b]
 ad                    xor	r7, r5
 cb 7a                 addi.s8	r7, 0x7a
 07                    mov	r5, r7
 f1 75                 zext8	r5
 f5 26                 cmp	r5, r2
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 35 22              ldsp16	r5, [sp+0x22]
 a6                    xor	r5, r6
 fa 45                 lsl16i	r5, 0x5
 c9 74                 addi.s8	r5, 0x74
 f0 34 12              ldsp16	r4, [sp+0x12]
 a4                    xor	r5, r4
 c9 14                 addi.s8	r5, 0x14
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 14              ldsp16	r4, [sp+0x14]
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
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 34 24              ldsp16	r4, [sp+0x24]
 a4                    xor	r5, r4
 c0 8b                 ldi8	r4, 0x8b
 11                    add	r4, r5
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 35 26              ldsp16	r5, [sp+0x26]
 a1                    xor	r4, r5
 c1 9c                 ldi8	r5, 0x9c
 14                    add	r5, r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f1 75                 zext8	r5
 f5 26                 cmp	r5, r2
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 20              stsp16	[sp+0x20], r5
 f0 02 0f              ldi8	r2, 0xf
 f9 68                 and	r3, r2
 f1 23                 mov	r4, r3
 f9 85                 or	r4, r1
 f0 0f 0a              cmpi.s8	r3, 0xa
 f0 0b 37              addi.s8	r3, 0x37
 fc 1c                 cmov.ult	r3, r4
 f0 3b 26              stsp16	[sp+0x26], r3
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 85                 or	r4, r1
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 24              stsp16	[sp+0x24], r6
 09                    mov	r6, r5
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 85                 or	r4, r1
 ca 37                 addi.s8	r6, 0x37
 f0 07 00 a0           ldi16	r3, 0xa000
 f5 27                 cmp	r5, r3
 fc 34                 cmov.ult	r6, r4
 f0 3e 2a              stsp16	[sp+0x2a], r6
 f0 35 38              ldsp16	r5, [sp+0x38]
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 38              stsp16	[sp+0x38], r5
 f0 35 42              ldsp16	r5, [sp+0x42]
 f2 24                 add	r5, r0
 09                    mov	r6, r5
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 85                 or	r4, r1
 ca 37                 addi.s8	r6, 0x37
 f5 27                 cmp	r5, r3
 fc 34                 cmov.ult	r6, r4
 f0 3e 22              stsp16	[sp+0x22], r6
 fa 88                 lsr16i	r5, 0x8
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 42              stsp16	[sp+0x42], r5
 f0 35 3c              ldsp16	r5, [sp+0x3c]
 09                    mov	r6, r5
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 85                 or	r4, r1
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 16              stsp16	[sp+0x16], r6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 85                 or	r4, r1
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 12              stsp16	[sp+0x12], r6
 09                    mov	r6, r5
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 85                 or	r4, r1
 ca 37                 addi.s8	r6, 0x37
 f5 27                 cmp	r5, r3
 fc 34                 cmov.ult	r6, r4
 f4 6a                 stsp16	[sp+0xa], r6
 f0 35 3e              ldsp16	r5, [sp+0x3e]
 09                    mov	r6, r5
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 85                 or	r4, r1
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 14              stsp16	[sp+0x14], r6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 85                 or	r4, r1
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f4 62                 stsp16	[sp+0x8], r6
 f5 27                 cmp	r5, r3
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 3e              stsp16	[sp+0x3e], r5
 f0 35 40              ldsp16	r5, [sp+0x40]
 09                    mov	r6, r5
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 85                 or	r4, r1
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f4 72                 stsp16	[sp+0xc], r6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 85                 or	r4, r1
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f4 52                 stsp16	[sp+0x4], r6
 f5 27                 cmp	r5, r3
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 40              stsp16	[sp+0x40], r5
 07                    mov	r5, r7
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 3c              stsp16	[sp+0x3c], r5
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f5 2f                 cmp	r7, r3
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 18              stsp16	[sp+0x18], r7
 f0 36 36              ldsp16	r6, [sp+0x36]
 06                    mov	r5, r6
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 79                 stsp16	[sp+0xe], r5
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 59                 stsp16	[sp+0x6], r5
 f5 2b                 cmp	r6, r3
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 85                 or	r4, r1
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 36              stsp16	[sp+0x36], r6
 f0 36 3a              ldsp16	r6, [sp+0x3a]
 06                    mov	r5, r6
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f9 a8                 and	r5, r2
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 f5 2b                 cmp	r6, r3
 fa 9c                 lsr16i	r6, 0xc
 02                    mov	r4, r6
 f9 85                 or	r4, r1
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 3e 3a              stsp16	[sp+0x3a], r6
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 09                    mov	r6, r5
 f9 c8                 and	r6, r2
 02                    mov	r4, r6
 f9 85                 or	r4, r1
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 01                    mov	r4, r5
 fa 8c                 lsr16i	r5, 0xc
 0d                    mov	r7, r5
 f9 e5                 or	r7, r1
 c9 37                 addi.s8	r5, 0x37
 f5 23                 cmp	r4, r3
 fc 2f                 cmov.ult	r5, r7
 fa 78                 lsr16i	r4, 0x8
 f9 88                 and	r4, r2
 0c                    mov	r7, r4
 f9 e5                 or	r7, r1
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 27                 cmov.ult	r4, r7
 0c                    mov	r7, r4
 c0 52                 ldi8	r4, 0x52
 d7 00                 sys	debug_putc
 f0 03 46              ldi8	r3, 0x46
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 f0 02 3d              ldi8	r2, 0x3d
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
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
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f0 34 20              ldsp16	r4, [sp+0x20]
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c1 54                 ldi8	r5, 0x54
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 00                 sys	debug_putc
 f0 34 30              ldsp16	r4, [sp+0x30]
 d7 00                 sys	debug_putc
 f0 34 16              ldsp16	r4, [sp+0x16]
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c3 45                 ldi8	r7, 0x45
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 d7 00                 sys	debug_putc
 f0 34 14              ldsp16	r4, [sp+0x14]
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
 f0 34 40              ldsp16	r4, [sp+0x40]
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 c2 43                 ldi8	r6, 0x43
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 d7 00                 sys	debug_putc
 f0 34 24              ldsp16	r4, [sp+0x24]
 d7 00                 sys	debug_putc
 f0 34 32              ldsp16	r4, [sp+0x32]
 d7 00                 sys	debug_putc
 f0 34 26              ldsp16	r4, [sp+0x26]
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f0 34 22              ldsp16	r4, [sp+0x22]
 d7 00                 sys	debug_putc
 f0 34 42              ldsp16	r4, [sp+0x42]
 d7 00                 sys	debug_putc
 f0 34 34              ldsp16	r4, [sp+0x34]
 d7 00                 sys	debug_putc
 f0 34 38              ldsp16	r4, [sp+0x38]
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f0 34 28              ldsp16	r4, [sp+0x28]
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f0 34 36              ldsp16	r4, [sp+0x36]
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d7 00                 sys	debug_putc
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 c0 44                 ldi8	r4, 0x44
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 00                 sys	debug_putc
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 d7 00                 sys	debug_putc
 c1 09                 ldi8	r5, 0x9
 f0 06 44 01           ldi16	r2, 0x144
 f0 13 86              leasp	r3, 0x86
 c0 01                 ldi8	r4, 0x1
 c3 01                 ldi8	r7, 0x1
 f0 6c 05              ld8u	r0, [r2+]
 f0 6c 27              ld8u	r1, [r3+]
 f6 2d                 tst16	r5
 f8 0e                 cset.ne	r6
 f4 b5                 dec16	r5
 f5 08                 cmp	r1, r0
 d1 05                 brne8	avm_test_main+2064
 8b                    and	r6, r7
 f4 a6                 tst8	r6
 d1 eb                 brne8	avm_test_main+2043
 f5 08                 cmp	r1, r0
 db 0f 01              brne16	avm_test_main+2340
 c1 06                 ldi8	r5, 0x6
 f0 06 4e 01           ldi16	r2, 0x14e
 f0 13 7f              leasp	r3, 0x7f
 c3 01                 ldi8	r7, 0x1
 f0 6c 05              ld8u	r0, [r2+]
 f0 6c 27              ld8u	r1, [r3+]
 f6 2d                 tst16	r5
 f8 0e                 cset.ne	r6
 f4 b5                 dec16	r5
 f5 08                 cmp	r1, r0
 d1 05                 brne8	avm_test_main+2101
 8b                    and	r6, r7
 f4 a6                 tst8	r6
 d1 eb                 brne8	avm_test_main+2080
 f5 08                 cmp	r1, r0
 db ea 00              brne16	avm_test_main+2340
 c1 05                 ldi8	r5, 0x5
 f0 06 55 01           ldi16	r2, 0x155
 f0 13 79              leasp	r3, 0x79
 c3 01                 ldi8	r7, 0x1
 f0 6c 05              ld8u	r0, [r2+]
 f0 6c 27              ld8u	r1, [r3+]
 f6 2d                 tst16	r5
 f8 0e                 cset.ne	r6
 f4 b5                 dec16	r5
 f5 08                 cmp	r1, r0
 d1 05                 brne8	avm_test_main+2138
 8b                    and	r6, r7
 f4 a6                 tst8	r6
 d1 eb                 brne8	avm_test_main+2117
 f5 08                 cmp	r1, r0
 db c5 00              brne16	avm_test_main+2340
 f0 11 74              leasp	r1, 0x74
 c1 04                 ldi8	r5, 0x4
 c2 01                 ldi8	r6, 0x1
 f0 6c 03              ld8u	r0, [r1+]
 f6 2d                 tst16	r5
 f8 0f                 cset.ne	r7
 f4 b5                 dec16	r5
 f0 0c 3c              cmpi.s8	r0, 0x3c
 d1 05                 brne8	avm_test_main+2169
 8e                    and	r7, r6
 f4 a7                 tst8	r7
 d1 ed                 brne8	avm_test_main+2150
 f0 1d 68              ldsp8u	r5, [sp+0x68]
 f0 0c 3c              cmpi.s8	r0, 0x3c
 db a2 00              brne16	avm_test_main+2340
 f1 75                 zext8	r5
 cd 72                 cmpi.s8	r5, 0x72
 db 9b 00              brne16	avm_test_main+2340
 c3 72                 ldi8	r7, 0x72
 c5 5c 01              ldi16	r5, 0x15c
 f0 16 68              leasp	r6, 0x68
 f4 a7                 tst8	r7
 d0 0e                 breq8	avm_test_main+2211
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+2193
 e0 81 00              jmp16	avm_test_main+2340
 f0 1d 5c              ldsp8u	r5, [sp+0x5c]
 cd 73                 cmpi.s8	r5, 0x73
 d1 7a                 brne8	avm_test_main+2340
 c3 73                 ldi8	r7, 0x73
 c5 64 01              ldi16	r5, 0x164
 f0 16 5c              leasp	r6, 0x5c
 f4 a7                 tst8	r7
 d0 0d                 breq8	avm_test_main+2243
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+2226
 d4 61                 jmp8	avm_test_main+2340
 f0 1d 54              ldsp8u	r5, [sp+0x54]
 cd 69                 cmpi.s8	r5, 0x69
 d1 5a                 brne8	avm_test_main+2340
 c3 69                 ldi8	r7, 0x69
 c5 6b 01              ldi16	r5, 0x16b
 f0 16 54              leasp	r6, 0x54
 f4 a7                 tst8	r7
 d0 0d                 breq8	avm_test_main+2275
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+2258
 d4 41                 jmp8	avm_test_main+2340
 f0 1d 4c              ldsp8u	r5, [sp+0x4c]
 cd 6f                 cmpi.s8	r5, 0x6f
 d1 3a                 brne8	avm_test_main+2340
 c3 6f                 ldi8	r7, 0x6f
 c5 6f 01              ldi16	r5, 0x16f
 f0 16 4c              leasp	r6, 0x4c
 f4 a7                 tst8	r7
 d0 0d                 breq8	avm_test_main+2307
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+2290
 d4 21                 jmp8	avm_test_main+2340
 f0 1d 44              ldsp8u	r5, [sp+0x44]
 cd 67                 cmpi.s8	r5, 0x67
 d1 1a                 brne8	avm_test_main+2340
 c3 67                 ldi8	r7, 0x67
 c5 42 01              ldi16	r5, 0x142
 f0 16 44              leasp	r6, 0x44
 f4 a7                 tst8	r7
 d0 0d                 breq8	avm_test_main+2339
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+2322
 d4 01                 jmp8	avm_test_main+2340
 a0                    xor	r4, r4
 d6 7f                 adjsp	0x7f
 d6 11                 adjsp	0x11
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
