
bitfields.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 bitfields.c
00000100 l     O .data	00000078 entries
00000178 l     O .data	00000002 bitfields_result
00000000 l    df *ABS*	00000000 runtime.c
00000673 l       .init_array	00000000 .hidden __init_array_end
00000673 l       .init_array	00000000 .hidden __init_array_start
00000673 l       .fini_array	00000000 .hidden __fini_array_start
00000673 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	000003aa avm_test_main
00000671 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 c1 00              call16	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 d5 51                 call8	avm_run_destructors
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 53 04              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 73 06              ldi16	r4, 0x673
 c1 00                 ldi8	r5, 0x0
 c6 73 06              ldi16	r6, 0x673
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	avm_run_constructors+61
 f0 04 73 06           ldi16	r0, 0x673
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 73 06           ldi16	r2, 0x673
 f0 03 00              ldi8	r3, 0x0
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	avm_run_constructors+42
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
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+21
 e1 89 fd              call16	-631
 c4 73 06              ldi16	r4, 0x673
 c1 00                 ldi8	r5, 0x0
 c6 73 06              ldi16	r6, 0x673
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	avm_run_destructors+79
 f0 06 73 06           ldi16	r2, 0x673
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 73 06           ldi16	r0, 0x673
 f0 01 00              ldi8	r1, 0x0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	avm_run_destructors+60
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+94
 e1 40 fd              call16	-704
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 f0 04 00 fc           ldi16	r0, 0xfc00
 f0 54 0d 01           ldm16	r4, [0x10d]
 f9 80                 and	r4, r0
 f0 01 2c              ldi8	r1, 0x2c
 f9 31                 or	r1, r4
 f0 54 0a 01           ldm16	r4, [0x10a]
 f9 80                 and	r4, r0
 c6 21 02              ldi16	r6, 0x221
 98                    or	r6, r4
 f0 54 07 01           ldm16	r4, [0x107]
 f9 80                 and	r4, r0
 c3 16                 ldi8	r7, 0x16
 9c                    or	r7, r4
 f0 55 04 01           ldm16	r5, [0x104]
 f9 a0                 and	r5, r0
 c4 0b 02              ldi16	r4, 0x20b
 91                    or	r4, r5
 c1 90                 ldi8	r5, 0x90
 f0 4d 00 01           stm8	[0x100], r5
 c1 99                 ldi8	r5, 0x99
 f0 4d 03 01           stm8	[0x103], r5
 c1 a2                 ldi8	r5, 0xa2
 f0 4d 06 01           stm8	[0x106], r5
 c1 ab                 ldi8	r5, 0xab
 f0 4d 09 01           stm8	[0x109], r5
 c1 b4                 ldi8	r5, 0xb4
 f0 4d 0c 01           stm8	[0x10c], r5
 c1 bd                 ldi8	r5, 0xbd
 f0 4d 0f 01           stm8	[0x10f], r5
 f0 55 01 01           ldm16	r5, [0x101]
 f9 a0                 and	r5, r0
 f0 5d 01 01           stm16	[0x101], r5
 f0 5c 04 01           stm16	[0x104], r4
 f0 5f 07 01           stm16	[0x107], r7
 f0 5e 0a 01           stm16	[0x10a], r6
 f0 59 0d 01           stm16	[0x10d], r1
 f0 54 10 01           ldm16	r4, [0x110]
 f9 80                 and	r4, r0
 c5 37 02              ldi16	r5, 0x237
 94                    or	r5, r4
 f0 5d 10 01           stm16	[0x110], r5
 c2 c6                 ldi8	r6, 0xc6
 f0 4e 12 01           stm8	[0x112], r6
 f0 54 13 01           ldm16	r4, [0x113]
 c1 cf                 ldi8	r5, 0xcf
 f0 4d 15 01           stm8	[0x115], r5
 f9 80                 and	r4, r0
 c1 42                 ldi8	r5, 0x42
 94                    or	r5, r4
 f0 5d 13 01           stm16	[0x113], r5
 c0 d0                 ldi8	r4, 0xd0
 f0 55 16 01           ldm16	r5, [0x116]
 f0 4c 18 01           stm8	[0x118], r4
 f9 a0                 and	r5, r0
 c4 4d 02              ldi16	r4, 0x24d
 91                    or	r4, r5
 f0 5c 16 01           stm16	[0x116], r4
 c0 d9                 ldi8	r4, 0xd9
 f0 55 19 01           ldm16	r5, [0x119]
 f0 4c 1b 01           stm8	[0x11b], r4
 f9 a0                 and	r5, r0
 c0 58                 ldi8	r4, 0x58
 91                    or	r4, r5
 f0 5c 19 01           stm16	[0x119], r4
 c0 e2                 ldi8	r4, 0xe2
 f0 55 1c 01           ldm16	r5, [0x11c]
 f0 4c 1e 01           stm8	[0x11e], r4
 f9 a0                 and	r5, r0
 c4 63 02              ldi16	r4, 0x263
 91                    or	r4, r5
 f0 5c 1c 01           stm16	[0x11c], r4
 c0 eb                 ldi8	r4, 0xeb
 f0 55 1f 01           ldm16	r5, [0x11f]
 f0 4c 21 01           stm8	[0x121], r4
 f9 a0                 and	r5, r0
 c0 6e                 ldi8	r4, 0x6e
 91                    or	r4, r5
 f0 5c 1f 01           stm16	[0x11f], r4
 c0 f4                 ldi8	r4, 0xf4
 f0 55 22 01           ldm16	r5, [0x122]
 f0 4c 24 01           stm8	[0x124], r4
 f9 a0                 and	r5, r0
 c4 79 02              ldi16	r4, 0x279
 91                    or	r4, r5
 f0 5c 22 01           stm16	[0x122], r4
 c0 fd                 ldi8	r4, 0xfd
 f0 55 25 01           ldm16	r5, [0x125]
 f0 4c 27 01           stm8	[0x127], r4
 f9 a0                 and	r5, r0
 c0 84                 ldi8	r4, 0x84
 91                    or	r4, r5
 f0 5c 25 01           stm16	[0x125], r4
 c0 06                 ldi8	r4, 0x6
 f0 55 28 01           ldm16	r5, [0x128]
 f0 4c 2a 01           stm8	[0x12a], r4
 f9 a0                 and	r5, r0
 c4 8f 02              ldi16	r4, 0x28f
 91                    or	r4, r5
 f0 5c 28 01           stm16	[0x128], r4
 c0 0f                 ldi8	r4, 0xf
 f0 55 2b 01           ldm16	r5, [0x12b]
 f0 4c 2d 01           stm8	[0x12d], r4
 f9 a0                 and	r5, r0
 c0 9a                 ldi8	r4, 0x9a
 91                    or	r4, r5
 f0 5c 2b 01           stm16	[0x12b], r4
 f0 01 10              ldi8	r1, 0x10
 f0 54 2e 01           ldm16	r4, [0x12e]
 f0 49 30 01           stm8	[0x130], r1
 f9 80                 and	r4, r0
 c5 a5 02              ldi16	r5, 0x2a5
 94                    or	r5, r4
 f0 5d 2e 01           stm16	[0x12e], r5
 c0 19                 ldi8	r4, 0x19
 f0 55 31 01           ldm16	r5, [0x131]
 f0 4c 33 01           stm8	[0x133], r4
 f9 a0                 and	r5, r0
 c0 b0                 ldi8	r4, 0xb0
 91                    or	r4, r5
 f0 5c 31 01           stm16	[0x131], r4
 c0 22                 ldi8	r4, 0x22
 f0 55 34 01           ldm16	r5, [0x134]
 f0 4c 36 01           stm8	[0x136], r4
 f9 a0                 and	r5, r0
 c4 bb 02              ldi16	r4, 0x2bb
 91                    or	r4, r5
 f0 5c 34 01           stm16	[0x134], r4
 c0 2b                 ldi8	r4, 0x2b
 f0 55 37 01           ldm16	r5, [0x137]
 f0 4c 39 01           stm8	[0x139], r4
 f9 a0                 and	r5, r0
 96                    or	r5, r6
 f0 5d 37 01           stm16	[0x137], r5
 c0 34                 ldi8	r4, 0x34
 f0 55 3a 01           ldm16	r5, [0x13a]
 f0 4c 3c 01           stm8	[0x13c], r4
 f9 a0                 and	r5, r0
 c4 d1 02              ldi16	r4, 0x2d1
 91                    or	r4, r5
 f0 5c 3a 01           stm16	[0x13a], r4
 c0 3d                 ldi8	r4, 0x3d
 f0 55 3d 01           ldm16	r5, [0x13d]
 f0 4c 3f 01           stm8	[0x13f], r4
 f9 a0                 and	r5, r0
 c0 dc                 ldi8	r4, 0xdc
 91                    or	r4, r5
 f0 5c 3d 01           stm16	[0x13d], r4
 c0 46                 ldi8	r4, 0x46
 f0 55 40 01           ldm16	r5, [0x140]
 f0 4c 42 01           stm8	[0x142], r4
 f9 a0                 and	r5, r0
 c4 e7 02              ldi16	r4, 0x2e7
 91                    or	r4, r5
 f0 5c 40 01           stm16	[0x140], r4
 c0 4f                 ldi8	r4, 0x4f
 f0 55 43 01           ldm16	r5, [0x143]
 f0 4c 45 01           stm8	[0x145], r4
 f9 a0                 and	r5, r0
 c0 f2                 ldi8	r4, 0xf2
 91                    or	r4, r5
 f0 5c 43 01           stm16	[0x143], r4
 c0 50                 ldi8	r4, 0x50
 f0 55 46 01           ldm16	r5, [0x146]
 f0 4c 48 01           stm8	[0x148], r4
 f9 a0                 and	r5, r0
 c4 fd 02              ldi16	r4, 0x2fd
 91                    or	r4, r5
 f0 5c 46 01           stm16	[0x146], r4
 c0 59                 ldi8	r4, 0x59
 f0 55 49 01           ldm16	r5, [0x149]
 f0 4c 4b 01           stm8	[0x14b], r4
 f9 a0                 and	r5, r0
 c4 08 01              ldi16	r4, 0x108
 91                    or	r4, r5
 f0 5c 49 01           stm16	[0x149], r4
 c0 62                 ldi8	r4, 0x62
 f0 55 4c 01           ldm16	r5, [0x14c]
 f0 4c 4e 01           stm8	[0x14e], r4
 f9 a0                 and	r5, r0
 c4 13 03              ldi16	r4, 0x313
 91                    or	r4, r5
 f0 5c 4c 01           stm16	[0x14c], r4
 c0 6b                 ldi8	r4, 0x6b
 f0 55 4f 01           ldm16	r5, [0x14f]
 f0 4c 51 01           stm8	[0x151], r4
 f9 a0                 and	r5, r0
 c4 1e 01              ldi16	r4, 0x11e
 91                    or	r4, r5
 f0 5c 4f 01           stm16	[0x14f], r4
 c0 74                 ldi8	r4, 0x74
 f0 55 52 01           ldm16	r5, [0x152]
 f0 4c 54 01           stm8	[0x154], r4
 f9 a0                 and	r5, r0
 c4 29 03              ldi16	r4, 0x329
 91                    or	r4, r5
 f0 5c 52 01           stm16	[0x152], r4
 c0 95                 ldi8	r4, 0x95
 f0 55 55 01           ldm16	r5, [0x155]
 f0 4c 57 01           stm8	[0x157], r4
 f9 a0                 and	r5, r0
 c4 34 01              ldi16	r4, 0x134
 91                    or	r4, r5
 f0 5c 55 01           stm16	[0x155], r4
 c0 9e                 ldi8	r4, 0x9e
 f0 55 58 01           ldm16	r5, [0x158]
 f0 4c 5a 01           stm8	[0x15a], r4
 f9 a0                 and	r5, r0
 c4 3f 03              ldi16	r4, 0x33f
 91                    or	r4, r5
 f0 5c 58 01           stm16	[0x158], r4
 c0 a7                 ldi8	r4, 0xa7
 f0 55 5b 01           ldm16	r5, [0x15b]
 f0 4c 5d 01           stm8	[0x15d], r4
 f9 a0                 and	r5, r0
 c4 4a 01              ldi16	r4, 0x14a
 91                    or	r4, r5
 f0 5c 5b 01           stm16	[0x15b], r4
 c0 a8                 ldi8	r4, 0xa8
 f0 55 5e 01           ldm16	r5, [0x15e]
 f0 4c 60 01           stm8	[0x160], r4
 f9 a0                 and	r5, r0
 c4 55 03              ldi16	r4, 0x355
 91                    or	r4, r5
 f0 5c 5e 01           stm16	[0x15e], r4
 c0 b1                 ldi8	r4, 0xb1
 f0 55 61 01           ldm16	r5, [0x161]
 f0 4c 63 01           stm8	[0x163], r4
 f9 a0                 and	r5, r0
 c4 60 01              ldi16	r4, 0x160
 91                    or	r4, r5
 f0 5c 61 01           stm16	[0x161], r4
 c0 ba                 ldi8	r4, 0xba
 f0 55 64 01           ldm16	r5, [0x164]
 f0 4c 66 01           stm8	[0x166], r4
 f9 a0                 and	r5, r0
 c4 6b 03              ldi16	r4, 0x36b
 91                    or	r4, r5
 f0 5c 64 01           stm16	[0x164], r4
 c0 c3                 ldi8	r4, 0xc3
 f0 55 67 01           ldm16	r5, [0x167]
 f0 4c 69 01           stm8	[0x169], r4
 f9 a0                 and	r5, r0
 c4 76 01              ldi16	r4, 0x176
 91                    or	r4, r5
 f0 5c 67 01           stm16	[0x167], r4
 c0 cc                 ldi8	r4, 0xcc
 f0 55 6a 01           ldm16	r5, [0x16a]
 f0 4c 6c 01           stm8	[0x16c], r4
 f9 a0                 and	r5, r0
 c4 81 03              ldi16	r4, 0x381
 91                    or	r4, r5
 f0 5c 6a 01           stm16	[0x16a], r4
 c0 d5                 ldi8	r4, 0xd5
 f0 55 6d 01           ldm16	r5, [0x16d]
 f0 4c 6f 01           stm8	[0x16f], r4
 f9 a0                 and	r5, r0
 c4 8c 01              ldi16	r4, 0x18c
 91                    or	r4, r5
 f0 5c 6d 01           stm16	[0x16d], r4
 c0 de                 ldi8	r4, 0xde
 f0 55 70 01           ldm16	r5, [0x170]
 f0 4c 72 01           stm8	[0x172], r4
 f9 a0                 and	r5, r0
 c4 97 03              ldi16	r4, 0x397
 91                    or	r4, r5
 f0 5c 70 01           stm16	[0x170], r4
 c0 e7                 ldi8	r4, 0xe7
 f0 55 73 01           ldm16	r5, [0x173]
 f0 4c 75 01           stm8	[0x175], r4
 f9 a0                 and	r5, r0
 c4 a2 01              ldi16	r4, 0x1a2
 91                    or	r4, r5
 f0 5c 73 01           stm16	[0x173], r4
 f0 54 76 01           ldm16	r4, [0x176]
 f9 80                 and	r4, r0
 c5 ad 03              ldi16	r5, 0x3ad
 94                    or	r5, r4
 f0 5d 76 01           stm16	[0x176], r5
 aa                    xor	r6, r6
 d7 01                 sys	debug_break
 c0 28                 ldi8	r4, 0x28
 f4 40                 stsp16	[sp+0x0], r4
 02                    mov	r4, r6
 f4 4a                 stsp16	[sp+0x2], r6
 f4 01                 ldsp16	r5, [sp+0x0]
 f0 07 01 01           ldi16	r3, 0x101
 f4 51                 stsp16	[sp+0x4], r5
 ed e6 1f              ld8u	r7, [r3-1]
 07                    mov	r5, r7
 f6 45                 sext8	r5
 fa c3                 asr16i	r5, 0x3
 c6 f1 ff              ldi16	r6, 0xfff1
 cd 0f                 cmpi.s8	r5, 0xf
 fd 31                 cmov.slt	r6, r1
 f0 00 07              ldi8	r0, 0x7
 f9 1c                 and	r0, r7
 19                    add	r6, r5
 ed 56 20              ld16	r2, [r3+0]
 f1 26                 mov	r5, r2
 f2 24                 add	r5, r0
 f4 ad                 inc16	r5
 0d                    mov	r7, r5
 fa 69                 lsl16i	r7, 0x9
 f0 05 00 02           ldi16	r1, 0x200
 f9 3c                 and	r1, r7
 c7 00 fe              ldi16	r7, 0xfe00
 f9 e8                 and	r7, r2
 f0 06 ff 01           ldi16	r2, 0x1ff
 f9 54                 and	r2, r5
 f9 e9                 or	r7, r2
 f9 e6                 xor	r7, r1
 f0 01 01              ldi8	r1, 0x1
 07                    mov	r5, r7
 fa 89                 lsr16i	r5, 0x9
 f9 a4                 and	r5, r1
 f0 01 10              ldi8	r1, 0x10
 f2 14                 add	r2, r4
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 ca 88                 addi.s8	r6, -0x78
 02                    mov	r4, r6
 f6 44                 sext8	r4
 fa b3                 asr16i	r4, 0x3
 f2 22                 add	r4, r2
 f9 c1                 or	r6, r0
 ee f6 20              st16	[r3+0], r7
 ee c6 1f              st8	[r3-1], r6
 11                    add	r4, r5
 f4 11                 ldsp16	r5, [sp+0x4]
 f0 0b 03              addi.s8	r3, 0x3
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 9b                 brne8	avm_test_main+812
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 ae                 inc16	r6
 06                    mov	r5, r6
 f1 75                 zext8	r5
 cd 14                 cmpi.s8	r5, 0x14
 d1 88                 brne8	avm_test_main+804
 f0 5c 78 01           stm16	[0x178], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
