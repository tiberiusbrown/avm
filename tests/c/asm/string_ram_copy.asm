
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
00000220 g     F .text	0000093c avm_test_main
00000b5c g     F .text	00000002 avm_halt
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
 e1 46 09              call16	avm_halt

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
 f0 12 86              leasp	r2, 0x86
 c5 00 01              ldi16	r5, 0x100
 c2 08                 ldi8	r6, 0x8
 f1 22                 mov	r4, r2
 d5 90                 call8	test_call_strncpy
 f0 14 7f              leasp	r4, 0x7f
 c5 04 01              ldi16	r5, 0x104
 c2 03                 ldi8	r6, 0x3
 d5 86                 call8	test_call_strncpy
 f0 14 79              leasp	r4, 0x79
 c5 0b 01              ldi16	r5, 0x10b
 c2 04                 ldi8	r6, 0x4
 e1 7b ff              call16	test_call_strncpy
 f0 14 74              leasp	r4, 0x74
 c5 0f 01              ldi16	r5, 0x10f
 aa                    xor	r6, r6
 e1 71 ff              call16	test_call_strncpy
 c5 17 01              ldi16	r5, 0x117
 f0 17 68              leasp	r7, 0x68
 03                    mov	r4, r7
 c2 0c                 ldi8	r6, 0xc
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
 f0 04 6f 61           ldi16	r0, 0x616f
 f0 01 6b              ldi8	r1, 0x6b
 f0 38 4c              stsp16	[sp+0x4c], r0
 f0 39 4e              stsp16	[sp+0x4e], r1
 f0 3c 50              stsp16	[sp+0x50], r4
 f0 3d 52              stsp16	[sp+0x52], r5
 f0 3c 48              stsp16	[sp+0x48], r4
 f0 3d 4a              stsp16	[sp+0x4a], r5
 f0 3c 44              stsp16	[sp+0x44], r4
 f0 3d 46              stsp16	[sp+0x46], r5
 c5 2f 01              ldi16	r5, 0x12f
 03                    mov	r4, r7
 c2 08                 ldi8	r6, 0x8
 e1 26 ff              call16	test_call_strncat
 c5 34 01              ldi16	r5, 0x134
 f1 23                 mov	r4, r3
 c2 03                 ldi8	r6, 0x3
 e1 1c ff              call16	test_call_strncat
 f0 14 54              leasp	r4, 0x54
 c5 3b 01              ldi16	r5, 0x13b
 aa                    xor	r6, r6
 e1 12 ff              call16	test_call_strncat
 f0 14 4c              leasp	r4, 0x4c
 c5 40 01              ldi16	r5, 0x140
 c2 04                 ldi8	r6, 0x4
 e1 07 ff              call16	test_call_strncat
 f0 14 44              leasp	r4, 0x44
 c5 41 01              ldi16	r5, 0x141
 c2 02                 ldi8	r6, 0x2
 e1 fc fe              call16	test_call_strncat
 c4 6d 05              ldi16	r4, 0x56d
 f0 1d 74              ldsp8u	r5, [sp+0x74]
 a4                    xor	r5, r4
 f1 04                 mov	r0, r4
 fa 45                 lsl16i	r5, 0x5
 c9 74                 addi.s8	r5, 0x74
 f0 1c 75              ldsp8u	r4, [sp+0x75]
 a1                    xor	r4, r5
 c8 14                 addi.s8	r4, 0x14
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 1d 76              ldsp8u	r5, [sp+0x76]
 a4                    xor	r5, r4
 c9 25                 addi.s8	r5, 0x25
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1c 77              ldsp8u	r4, [sp+0x77]
 a1                    xor	r4, r5
 c8 36                 addi.s8	r4, 0x36
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 1d 78              ldsp8u	r5, [sp+0x78]
 a4                    xor	r5, r4
 c9 47                 addi.s8	r5, 0x47
 f0 3d 30              stsp16	[sp+0x30], r5
 f0 01 30              ldi8	r1, 0x30
 01                    mov	r4, r5
 f1 74                 zext8	r4
 08                    mov	r6, r4
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a5                 or	r5, r1
 ca 37                 addi.s8	r6, 0x37
 c3 a0                 ldi8	r7, 0xa0
 33                    cmp	r4, r7
 fc 35                 cmov.ult	r6, r5
 f0 3e 3a              stsp16	[sp+0x3a], r6
 f0 1c 7f              ldsp8u	r4, [sp+0x7f]
 f9 82                 xor	r4, r0
 fa 35                 lsl16i	r4, 0x5
 c8 74                 addi.s8	r4, 0x74
 f0 1d 80              ldsp8u	r5, [sp+0x80]
 a4                    xor	r5, r4
 c9 14                 addi.s8	r5, 0x14
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1e 81              ldsp8u	r6, [sp+0x81]
 a9                    xor	r6, r5
 ca 25                 addi.s8	r6, 0x25
 02                    mov	r4, r6
 fa 7b                 lsr16i	r4, 0xb
 fa 55                 lsl16i	r6, 0x5
 98                    or	r6, r4
 f0 1d 82              ldsp8u	r5, [sp+0x82]
 a6                    xor	r5, r6
 c9 36                 addi.s8	r5, 0x36
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1e 83              ldsp8u	r6, [sp+0x83]
 a9                    xor	r6, r5
 ca 47                 addi.s8	r6, 0x47
 02                    mov	r4, r6
 fa 7b                 lsr16i	r4, 0xb
 fa 55                 lsl16i	r6, 0x5
 98                    or	r6, r4
 f0 1d 84              ldsp8u	r5, [sp+0x84]
 a6                    xor	r5, r6
 c9 58                 addi.s8	r5, 0x58
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1c 85              ldsp8u	r4, [sp+0x85]
 a1                    xor	r4, r5
 c8 69                 addi.s8	r4, 0x69
 f0 3c 2c              stsp16	[sp+0x2c], r4
 04                    mov	r5, r4
 f1 75                 zext8	r5
 37                    cmp	r5, r7
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 38              stsp16	[sp+0x38], r5
 f0 1c 79              ldsp8u	r4, [sp+0x79]
 f9 82                 xor	r4, r0
 fa 35                 lsl16i	r4, 0x5
 c8 74                 addi.s8	r4, 0x74
 f0 1d 7a              ldsp8u	r5, [sp+0x7a]
 a4                    xor	r5, r4
 c9 14                 addi.s8	r5, 0x14
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1e 7b              ldsp8u	r6, [sp+0x7b]
 a9                    xor	r6, r5
 ca 25                 addi.s8	r6, 0x25
 02                    mov	r4, r6
 fa 7b                 lsr16i	r4, 0xb
 fa 55                 lsl16i	r6, 0x5
 98                    or	r6, r4
 f0 1d 7c              ldsp8u	r5, [sp+0x7c]
 a6                    xor	r5, r6
 c9 36                 addi.s8	r5, 0x36
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1e 7d              ldsp8u	r6, [sp+0x7d]
 a9                    xor	r6, r5
 ca 47                 addi.s8	r6, 0x47
 02                    mov	r4, r6
 fa 7b                 lsr16i	r4, 0xb
 fa 55                 lsl16i	r6, 0x5
 98                    or	r6, r4
 f0 1d 7e              ldsp8u	r5, [sp+0x7e]
 a6                    xor	r5, r6
 c9 58                 addi.s8	r5, 0x58
 f0 3d 2a              stsp16	[sp+0x2a], r5
 f1 75                 zext8	r5
 37                    cmp	r5, r7
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 36              stsp16	[sp+0x36], r5
 f0 1c 54              ldsp8u	r4, [sp+0x54]
 f9 82                 xor	r4, r0
 fa 35                 lsl16i	r4, 0x5
 c8 74                 addi.s8	r4, 0x74
 f0 1d 55              ldsp8u	r5, [sp+0x55]
 a4                    xor	r5, r4
 c9 14                 addi.s8	r5, 0x14
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1e 56              ldsp8u	r6, [sp+0x56]
 a9                    xor	r6, r5
 ca 25                 addi.s8	r6, 0x25
 02                    mov	r4, r6
 fa 7b                 lsr16i	r4, 0xb
 fa 55                 lsl16i	r6, 0x5
 98                    or	r6, r4
 f0 1d 57              ldsp8u	r5, [sp+0x57]
 a6                    xor	r5, r6
 c9 36                 addi.s8	r5, 0x36
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1e 58              ldsp8u	r6, [sp+0x58]
 a9                    xor	r6, r5
 ca 47                 addi.s8	r6, 0x47
 02                    mov	r4, r6
 fa 7b                 lsr16i	r4, 0xb
 fa 55                 lsl16i	r6, 0x5
 98                    or	r6, r4
 f0 1d 59              ldsp8u	r5, [sp+0x59]
 a6                    xor	r5, r6
 c9 58                 addi.s8	r5, 0x58
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1e 5a              ldsp8u	r6, [sp+0x5a]
 a9                    xor	r6, r5
 ca 69                 addi.s8	r6, 0x69
 02                    mov	r4, r6
 fa 7b                 lsr16i	r4, 0xb
 fa 55                 lsl16i	r6, 0x5
 98                    or	r6, r4
 f0 1d 5b              ldsp8u	r5, [sp+0x5b]
 a6                    xor	r5, r6
 c9 7a                 addi.s8	r5, 0x7a
 f0 3d 42              stsp16	[sp+0x42], r5
 f1 75                 zext8	r5
 37                    cmp	r5, r7
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 34              stsp16	[sp+0x34], r5
 f0 1c 4c              ldsp8u	r4, [sp+0x4c]
 f9 82                 xor	r4, r0
 fa 35                 lsl16i	r4, 0x5
 c8 74                 addi.s8	r4, 0x74
 f0 1d 4d              ldsp8u	r5, [sp+0x4d]
 a4                    xor	r5, r4
 c9 14                 addi.s8	r5, 0x14
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1e 4e              ldsp8u	r6, [sp+0x4e]
 a9                    xor	r6, r5
 ca 25                 addi.s8	r6, 0x25
 02                    mov	r4, r6
 fa 7b                 lsr16i	r4, 0xb
 fa 55                 lsl16i	r6, 0x5
 98                    or	r6, r4
 f0 1d 4f              ldsp8u	r5, [sp+0x4f]
 a6                    xor	r5, r6
 c9 36                 addi.s8	r5, 0x36
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1e 50              ldsp8u	r6, [sp+0x50]
 a9                    xor	r6, r5
 ca 47                 addi.s8	r6, 0x47
 02                    mov	r4, r6
 fa 7b                 lsr16i	r4, 0xb
 fa 55                 lsl16i	r6, 0x5
 98                    or	r6, r4
 f0 1d 51              ldsp8u	r5, [sp+0x51]
 a6                    xor	r5, r6
 c9 58                 addi.s8	r5, 0x58
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1e 52              ldsp8u	r6, [sp+0x52]
 a9                    xor	r6, r5
 ca 69                 addi.s8	r6, 0x69
 02                    mov	r4, r6
 fa 7b                 lsr16i	r4, 0xb
 fa 55                 lsl16i	r6, 0x5
 98                    or	r6, r4
 f0 1d 53              ldsp8u	r5, [sp+0x53]
 a6                    xor	r5, r6
 c9 7a                 addi.s8	r5, 0x7a
 f0 3d 40              stsp16	[sp+0x40], r5
 f1 75                 zext8	r5
 37                    cmp	r5, r7
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 32              stsp16	[sp+0x32], r5
 f0 1c 44              ldsp8u	r4, [sp+0x44]
 f9 82                 xor	r4, r0
 fa 35                 lsl16i	r4, 0x5
 c8 74                 addi.s8	r4, 0x74
 f0 1d 45              ldsp8u	r5, [sp+0x45]
 a4                    xor	r5, r4
 c9 14                 addi.s8	r5, 0x14
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1e 46              ldsp8u	r6, [sp+0x46]
 a9                    xor	r6, r5
 ca 25                 addi.s8	r6, 0x25
 02                    mov	r4, r6
 fa 7b                 lsr16i	r4, 0xb
 fa 55                 lsl16i	r6, 0x5
 98                    or	r6, r4
 f0 1d 47              ldsp8u	r5, [sp+0x47]
 a6                    xor	r5, r6
 c9 36                 addi.s8	r5, 0x36
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1e 48              ldsp8u	r6, [sp+0x48]
 a9                    xor	r6, r5
 ca 47                 addi.s8	r6, 0x47
 02                    mov	r4, r6
 fa 7b                 lsr16i	r4, 0xb
 fa 55                 lsl16i	r6, 0x5
 98                    or	r6, r4
 f0 1d 49              ldsp8u	r5, [sp+0x49]
 a6                    xor	r5, r6
 c9 58                 addi.s8	r5, 0x58
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1e 4a              ldsp8u	r6, [sp+0x4a]
 a9                    xor	r6, r5
 ca 69                 addi.s8	r6, 0x69
 02                    mov	r4, r6
 fa 7b                 lsr16i	r4, 0xb
 fa 55                 lsl16i	r6, 0x5
 98                    or	r6, r4
 f0 1d 4b              ldsp8u	r5, [sp+0x4b]
 a6                    xor	r5, r6
 c9 7a                 addi.s8	r5, 0x7a
 f0 3d 3e              stsp16	[sp+0x3e], r5
 f1 75                 zext8	r5
 37                    cmp	r5, r7
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 2e              stsp16	[sp+0x2e], r5
 f0 1c 86              ldsp8u	r4, [sp+0x86]
 f9 82                 xor	r4, r0
 fa 35                 lsl16i	r4, 0x5
 c8 74                 addi.s8	r4, 0x74
 f0 1d 87              ldsp8u	r5, [sp+0x87]
 a4                    xor	r5, r4
 c9 14                 addi.s8	r5, 0x14
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1e 88              ldsp8u	r6, [sp+0x88]
 a9                    xor	r6, r5
 ca 25                 addi.s8	r6, 0x25
 02                    mov	r4, r6
 fa 7b                 lsr16i	r4, 0xb
 fa 55                 lsl16i	r6, 0x5
 98                    or	r6, r4
 f0 1d 89              ldsp8u	r5, [sp+0x89]
 a6                    xor	r5, r6
 c9 36                 addi.s8	r5, 0x36
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1e 8a              ldsp8u	r6, [sp+0x8a]
 a9                    xor	r6, r5
 ca 47                 addi.s8	r6, 0x47
 02                    mov	r4, r6
 fa 7b                 lsr16i	r4, 0xb
 fa 55                 lsl16i	r6, 0x5
 98                    or	r6, r4
 f0 1d 8b              ldsp8u	r5, [sp+0x8b]
 a6                    xor	r5, r6
 c9 58                 addi.s8	r5, 0x58
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1e 8c              ldsp8u	r6, [sp+0x8c]
 a9                    xor	r6, r5
 ca 69                 addi.s8	r6, 0x69
 02                    mov	r4, r6
 fa 7b                 lsr16i	r4, 0xb
 fa 55                 lsl16i	r6, 0x5
 98                    or	r6, r4
 f0 1f 8d              ldsp8u	r7, [sp+0x8d]
 ae                    xor	r7, r6
 cb 7a                 addi.s8	r7, 0x7a
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 1d 8e              ldsp8u	r5, [sp+0x8e]
 a7                    xor	r5, r7
 f0 03 8b              ldi8	r3, 0x8b
 f2 27                 add	r5, r3
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1e 8f              ldsp8u	r6, [sp+0x8f]
 a9                    xor	r6, r5
 f0 00 9c              ldi8	r0, 0x9c
 f2 28                 add	r6, r0
 06                    mov	r5, r6
 f1 75                 zext8	r5
 c0 a0                 ldi8	r4, 0xa0
 34                    cmp	r5, r4
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 28              stsp16	[sp+0x28], r5
 f0 1c 68              ldsp8u	r4, [sp+0x68]
 c5 6d 05              ldi16	r5, 0x56d
 a1                    xor	r4, r5
 fa 35                 lsl16i	r4, 0x5
 c8 74                 addi.s8	r4, 0x74
 f0 1d 69              ldsp8u	r5, [sp+0x69]
 a4                    xor	r5, r4
 c9 14                 addi.s8	r5, 0x14
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1f 6a              ldsp8u	r7, [sp+0x6a]
 ad                    xor	r7, r5
 cb 25                 addi.s8	r7, 0x25
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 1d 6b              ldsp8u	r5, [sp+0x6b]
 a7                    xor	r5, r7
 c9 36                 addi.s8	r5, 0x36
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1f 6c              ldsp8u	r7, [sp+0x6c]
 ad                    xor	r7, r5
 cb 47                 addi.s8	r7, 0x47
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 1d 6d              ldsp8u	r5, [sp+0x6d]
 a7                    xor	r5, r7
 c9 58                 addi.s8	r5, 0x58
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1f 6e              ldsp8u	r7, [sp+0x6e]
 ad                    xor	r7, r5
 cb 69                 addi.s8	r7, 0x69
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 1d 6f              ldsp8u	r5, [sp+0x6f]
 a7                    xor	r5, r7
 c9 7a                 addi.s8	r5, 0x7a
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1f 70              ldsp8u	r7, [sp+0x70]
 ad                    xor	r7, r5
 f2 2f                 add	r7, r3
 03                    mov	r4, r7
 fa 7b                 lsr16i	r4, 0xb
 fa 65                 lsl16i	r7, 0x5
 9c                    or	r7, r4
 f0 1c 71              ldsp8u	r4, [sp+0x71]
 a3                    xor	r4, r7
 f2 20                 add	r4, r0
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 1d 72              ldsp8u	r5, [sp+0x72]
 a4                    xor	r5, r4
 f0 03 ad              ldi8	r3, 0xad
 f2 27                 add	r5, r3
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1c 73              ldsp8u	r4, [sp+0x73]
 a1                    xor	r4, r5
 c3 be                 ldi8	r7, 0xbe
 13                    add	r4, r7
 f0 3c 24              stsp16	[sp+0x24], r4
 04                    mov	r5, r4
 f1 75                 zext8	r5
 c0 a0                 ldi8	r4, 0xa0
 34                    cmp	r5, r4
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 26              stsp16	[sp+0x26], r5
 f0 1d 5c              ldsp8u	r5, [sp+0x5c]
 c4 6d 05              ldi16	r4, 0x56d
 a4                    xor	r5, r4
 fa 45                 lsl16i	r5, 0x5
 c9 74                 addi.s8	r5, 0x74
 f0 1c 5d              ldsp8u	r4, [sp+0x5d]
 a1                    xor	r4, r5
 c8 14                 addi.s8	r4, 0x14
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 1d 5e              ldsp8u	r5, [sp+0x5e]
 a4                    xor	r5, r4
 c9 25                 addi.s8	r5, 0x25
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1c 5f              ldsp8u	r4, [sp+0x5f]
 a1                    xor	r4, r5
 c8 36                 addi.s8	r4, 0x36
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 1d 60              ldsp8u	r5, [sp+0x60]
 a4                    xor	r5, r4
 c9 47                 addi.s8	r5, 0x47
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1c 61              ldsp8u	r4, [sp+0x61]
 a1                    xor	r4, r5
 c8 58                 addi.s8	r4, 0x58
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 1d 62              ldsp8u	r5, [sp+0x62]
 a4                    xor	r5, r4
 c9 69                 addi.s8	r5, 0x69
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1c 63              ldsp8u	r4, [sp+0x63]
 a1                    xor	r4, r5
 c8 7a                 addi.s8	r4, 0x7a
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 1d 64              ldsp8u	r5, [sp+0x64]
 a4                    xor	r5, r4
 c0 8b                 ldi8	r4, 0x8b
 14                    add	r5, r4
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1c 65              ldsp8u	r4, [sp+0x65]
 a1                    xor	r4, r5
 f2 20                 add	r4, r0
 04                    mov	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 fa 35                 lsl16i	r4, 0x5
 91                    or	r4, r5
 f0 1d 66              ldsp8u	r5, [sp+0x66]
 a4                    xor	r5, r4
 f2 27                 add	r5, r3
 01                    mov	r4, r5
 fa 7b                 lsr16i	r4, 0xb
 fa 45                 lsl16i	r5, 0x5
 94                    or	r5, r4
 f0 1c 67              ldsp8u	r4, [sp+0x67]
 a1                    xor	r4, r5
 13                    add	r4, r7
 f0 3c 3c              stsp16	[sp+0x3c], r4
 04                    mov	r5, r4
 f1 75                 zext8	r5
 c0 a0                 ldi8	r4, 0xa0
 34                    cmp	r5, r4
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 00 0f              ldi8	r0, 0xf
 f0 35 30              ldsp16	r5, [sp+0x30]
 0d                    mov	r7, r5
 f9 e0                 and	r7, r0
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 20              stsp16	[sp+0x20], r7
 0d                    mov	r7, r5
 fa a8                 lsr16i	r7, 0x8
 f9 e0                 and	r7, r0
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 1e              stsp16	[sp+0x1e], r7
 0d                    mov	r7, r5
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 cb 37                 addi.s8	r7, 0x37
 f0 07 00 a0           ldi16	r3, 0xa000
 f5 27                 cmp	r5, r3
 fc 3c                 cmov.ult	r7, r4
 f0 3f 1c              stsp16	[sp+0x1c], r7
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 0d                    mov	r7, r5
 f9 e0                 and	r7, r0
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 1a              stsp16	[sp+0x1a], r7
 0d                    mov	r7, r5
 fa a8                 lsr16i	r7, 0x8
 f9 e0                 and	r7, r0
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 14              stsp16	[sp+0x14], r7
 0d                    mov	r7, r5
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 cb 37                 addi.s8	r7, 0x37
 f5 27                 cmp	r5, r3
 fc 3c                 cmov.ult	r7, r4
 f0 3f 12              stsp16	[sp+0x12], r7
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 0d                    mov	r7, r5
 f9 e0                 and	r7, r0
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 16              stsp16	[sp+0x16], r7
 0d                    mov	r7, r5
 fa a8                 lsr16i	r7, 0x8
 f9 e0                 and	r7, r0
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 10              stsp16	[sp+0x10], r7
 0d                    mov	r7, r5
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 cb 37                 addi.s8	r7, 0x37
 f5 27                 cmp	r5, r3
 fc 3c                 cmov.ult	r7, r4
 f4 73                 stsp16	[sp+0xc], r7
 f0 35 3e              ldsp16	r5, [sp+0x3e]
 0d                    mov	r7, r5
 f9 e0                 and	r7, r0
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 30              stsp16	[sp+0x30], r7
 0d                    mov	r7, r5
 fa a8                 lsr16i	r7, 0x8
 f9 e0                 and	r7, r0
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 2c              stsp16	[sp+0x2c], r7
 f5 27                 cmp	r5, r3
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 3e              stsp16	[sp+0x3e], r5
 f0 35 40              ldsp16	r5, [sp+0x40]
 0d                    mov	r7, r5
 f9 e0                 and	r7, r0
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 2a              stsp16	[sp+0x2a], r7
 0d                    mov	r7, r5
 fa a8                 lsr16i	r7, 0x8
 f9 e0                 and	r7, r0
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 18              stsp16	[sp+0x18], r7
 f5 27                 cmp	r5, r3
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 40              stsp16	[sp+0x40], r5
 f0 35 42              ldsp16	r5, [sp+0x42]
 0d                    mov	r7, r5
 f9 e0                 and	r7, r0
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f4 7b                 stsp16	[sp+0xe], r7
 0d                    mov	r7, r5
 fa a8                 lsr16i	r7, 0x8
 f9 e0                 and	r7, r0
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f4 6b                 stsp16	[sp+0xa], r7
 f5 27                 cmp	r5, r3
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f0 3d 42              stsp16	[sp+0x42], r5
 0e                    mov	r7, r6
 07                    mov	r5, r7
 f9 a0                 and	r5, r0
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 fa 98                 lsr16i	r6, 0x8
 f9 c0                 and	r6, r0
 02                    mov	r4, r6
 f9 85                 or	r4, r1
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f5 2f                 cmp	r7, r3
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f4 43                 stsp16	[sp+0x0], r7
 f0 37 3c              ldsp16	r7, [sp+0x3c]
 03                    mov	r4, r7
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 f9 a5                 or	r5, r1
 cc 0a                 cmpi.s8	r4, 0xa
 c8 37                 addi.s8	r4, 0x37
 fc 25                 cmov.ult	r4, r5
 f4 60                 stsp16	[sp+0x8], r4
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f9 a0                 and	r5, r0
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 59                 stsp16	[sp+0x6], r5
 f5 2f                 cmp	r7, r3
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 85                 or	r4, r1
 cb 37                 addi.s8	r7, 0x37
 fc 3c                 cmov.ult	r7, r4
 f0 3f 3c              stsp16	[sp+0x3c], r7
 f0 37 24              ldsp16	r7, [sp+0x24]
 07                    mov	r5, r7
 f9 a0                 and	r5, r0
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 07                    mov	r5, r7
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 85                 or	r4, r1
 c9 37                 addi.s8	r5, 0x37
 f5 2f                 cmp	r7, r3
 fc 2c                 cmov.ult	r5, r4
 fa a8                 lsr16i	r7, 0x8
 f9 e0                 and	r7, r0
 f9 3d                 or	r1, r7
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 39                 cmov.ult	r7, r1
 c0 52                 ldi8	r4, 0x52
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
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
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f0 34 28              ldsp16	r4, [sp+0x28]
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4e                 ldi8	r4, 0x4e
 d7 00                 sys	debug_putc
 c0 54                 ldi8	r4, 0x54
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 00                 sys	debug_putc
 f0 34 14              ldsp16	r4, [sp+0x14]
 d7 00                 sys	debug_putc
 f0 34 38              ldsp16	r4, [sp+0x38]
 d7 00                 sys	debug_putc
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4e                 ldi8	r4, 0x4e
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 f0 34 36              ldsp16	r4, [sp+0x36]
 d7 00                 sys	debug_putc
 f0 34 16              ldsp16	r4, [sp+0x16]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4e                 ldi8	r4, 0x4e
 d7 00                 sys	debug_putc
 c0 5a                 ldi8	r4, 0x5a
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 d7 00                 sys	debug_putc
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 d7 00                 sys	debug_putc
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 d7 00                 sys	debug_putc
 f0 34 20              ldsp16	r4, [sp+0x20]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f0 34 26              ldsp16	r4, [sp+0x26]
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 54                 ldi8	r4, 0x54
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f0 34 22              ldsp16	r4, [sp+0x22]
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 5a                 ldi8	r4, 0x5a
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 42              ldsp16	r4, [sp+0x42]
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f0 34 34              ldsp16	r4, [sp+0x34]
 d7 00                 sys	debug_putc
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 40              ldsp16	r4, [sp+0x40]
 d7 00                 sys	debug_putc
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 00                 sys	debug_putc
 f0 34 32              ldsp16	r4, [sp+0x32]
 d7 00                 sys	debug_putc
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 44                 ldi8	r4, 0x44
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 d7 00                 sys	debug_putc
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 d7 00                 sys	debug_putc
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 d7 00                 sys	debug_putc
 f0 34 30              ldsp16	r4, [sp+0x30]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 09                 ldi8	r4, 0x9
 c5 44 01              ldi16	r5, 0x144
 c3 01                 ldi8	r7, 0x1
 f7 08                 ld8u	r0, [r5+]
 f0 6c 25              ld8u	r1, [r2+]
 f6 2c                 tst16	r4
 f8 0e                 cset.ne	r6
 f4 b4                 dec16	r4
 f5 08                 cmp	r1, r0
 d1 05                 brne8	avm_test_main+2077
 8b                    and	r6, r7
 f4 a6                 tst8	r6
 d1 ec                 brne8	avm_test_main+2057
 c0 01                 ldi8	r4, 0x1
 f5 08                 cmp	r1, r0
 db 0f 01              brne16	avm_test_main+2355
 c1 06                 ldi8	r5, 0x6
 f0 05 4e 01           ldi16	r1, 0x14e
 f0 13 7f              leasp	r3, 0x7f
 c3 01                 ldi8	r7, 0x1
 f0 6c 03              ld8u	r0, [r1+]
 f0 6c 47              ld8u	r2, [r3+]
 f6 2d                 tst16	r5
 f8 0e                 cset.ne	r6
 f4 b5                 dec16	r5
 f5 10                 cmp	r2, r0
 d1 05                 brne8	avm_test_main+2116
 8b                    and	r6, r7
 f4 a6                 tst8	r6
 d1 eb                 brne8	avm_test_main+2095
 f5 10                 cmp	r2, r0
 db ea 00              brne16	avm_test_main+2355
 c1 05                 ldi8	r5, 0x5
 f0 05 55 01           ldi16	r1, 0x155
 f0 13 79              leasp	r3, 0x79
 c3 01                 ldi8	r7, 0x1
 f0 6c 03              ld8u	r0, [r1+]
 f0 6c 47              ld8u	r2, [r3+]
 f6 2d                 tst16	r5
 f8 0e                 cset.ne	r6
 f4 b5                 dec16	r5
 f5 10                 cmp	r2, r0
 d1 05                 brne8	avm_test_main+2153
 8b                    and	r6, r7
 f4 a6                 tst8	r6
 d1 eb                 brne8	avm_test_main+2132
 f5 10                 cmp	r2, r0
 db c5 00              brne16	avm_test_main+2355
 f0 11 74              leasp	r1, 0x74
 c1 04                 ldi8	r5, 0x4
 c2 01                 ldi8	r6, 0x1
 f0 6c 03              ld8u	r0, [r1+]
 f6 2d                 tst16	r5
 f8 0f                 cset.ne	r7
 f4 b5                 dec16	r5
 f0 0c 3c              cmpi.s8	r0, 0x3c
 d1 05                 brne8	avm_test_main+2184
 8e                    and	r7, r6
 f4 a7                 tst8	r7
 d1 ed                 brne8	avm_test_main+2165
 f0 1d 68              ldsp8u	r5, [sp+0x68]
 f0 0c 3c              cmpi.s8	r0, 0x3c
 db a2 00              brne16	avm_test_main+2355
 f1 75                 zext8	r5
 cd 72                 cmpi.s8	r5, 0x72
 db 9b 00              brne16	avm_test_main+2355
 c3 72                 ldi8	r7, 0x72
 c5 5c 01              ldi16	r5, 0x15c
 f0 16 68              leasp	r6, 0x68
 f4 a7                 tst8	r7
 d0 0e                 breq8	avm_test_main+2226
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+2208
 e0 81 00              jmp16	avm_test_main+2355
 f0 1d 5c              ldsp8u	r5, [sp+0x5c]
 cd 73                 cmpi.s8	r5, 0x73
 d1 7a                 brne8	avm_test_main+2355
 c3 73                 ldi8	r7, 0x73
 c5 64 01              ldi16	r5, 0x164
 f0 16 5c              leasp	r6, 0x5c
 f4 a7                 tst8	r7
 d0 0d                 breq8	avm_test_main+2258
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+2241
 d4 61                 jmp8	avm_test_main+2355
 f0 1d 54              ldsp8u	r5, [sp+0x54]
 cd 69                 cmpi.s8	r5, 0x69
 d1 5a                 brne8	avm_test_main+2355
 c3 69                 ldi8	r7, 0x69
 c5 6b 01              ldi16	r5, 0x16b
 f0 16 54              leasp	r6, 0x54
 f4 a7                 tst8	r7
 d0 0d                 breq8	avm_test_main+2290
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+2273
 d4 41                 jmp8	avm_test_main+2355
 f0 1d 4c              ldsp8u	r5, [sp+0x4c]
 cd 6f                 cmpi.s8	r5, 0x6f
 d1 3a                 brne8	avm_test_main+2355
 c3 6f                 ldi8	r7, 0x6f
 c5 6f 01              ldi16	r5, 0x16f
 f0 16 4c              leasp	r6, 0x4c
 f4 a7                 tst8	r7
 d0 0d                 breq8	avm_test_main+2322
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+2305
 d4 21                 jmp8	avm_test_main+2355
 f0 1d 44              ldsp8u	r5, [sp+0x44]
 cd 67                 cmpi.s8	r5, 0x67
 d1 1a                 brne8	avm_test_main+2355
 c3 67                 ldi8	r7, 0x67
 c5 42 01              ldi16	r5, 0x142
 f0 16 44              leasp	r6, 0x44
 f4 a7                 tst8	r7
 d0 0d                 breq8	avm_test_main+2354
 f7 08                 ld8u	r0, [r5+]
 ed ec 21              ld8u	r7, [r6+1]
 f4 ae                 inc16	r6
 f5 2c                 cmp	r7, r0
 d0 f1                 breq8	avm_test_main+2337
 d4 01                 jmp8	avm_test_main+2355
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
