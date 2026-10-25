
bitfields.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 bitfields.c
00000100 l     O .data	00000002 bitfields_result
00000102 l     O .data	00000078 entries
00000000 l    df *ABS*	00000000 runtime.c
00000670 l       .init_array	00000000 .hidden __init_array_end
00000670 l       .init_array	00000000 .hidden __init_array_start
00000670 l       .fini_array	00000000 .hidden __fini_array_start
00000670 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	000003a7 avm_test_main
0000066e g     F .text	00000002 avm_halt
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
 e1 50 04              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 70 06              ldi16	r4, 0x670
 c1 00                 ldi8	r5, 0x0
 c6 70 06              ldi16	r6, 0x670
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 70 06           ldi16	r0, 0x670
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 70 06           ldi16	r2, 0x670
 f0 03 00              ldi8	r3, 0x0
<L0>:
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	-0x13 <L0>
<L1>:
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
 d0 03                 breq8	0x3 <L0>
 e1 89 fd              call16	-631 <__avm_run_local_dtors>
<L0>:
 c4 70 06              ldi16	r4, 0x670
 c1 00                 ldi8	r5, 0x0
 c6 70 06              ldi16	r6, 0x670
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 70 06           ldi16	r2, 0x670
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 70 06           ldi16	r0, 0x670
 f0 01 00              ldi8	r1, 0x0
<L1>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	-0x13 <L1>
<L2>:
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	0x3 <L3>
 e1 40 fd              call16	-704 <__avm_run_local_dtors>
<L3>:
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
 f0 54 0f 01           ldm16	r4, [0x10f]
 f9 80                 and	r4, r0
 f0 01 2c              ldi8	r1, 0x2c
 f9 31                 or	r1, r4
 f0 54 0c 01           ldm16	r4, [0x10c]
 f9 80                 and	r4, r0
 c6 21 02              ldi16	r6, 0x221
 98                    or	r6, r4
 f0 54 09 01           ldm16	r4, [0x109]
 f9 80                 and	r4, r0
 c3 16                 ldi8	r7, 0x16
 9c                    or	r7, r4
 f0 55 06 01           ldm16	r5, [0x106]
 f9 a0                 and	r5, r0
 c4 0b 02              ldi16	r4, 0x20b
 91                    or	r4, r5
 c1 90                 ldi8	r5, 0x90
 f0 4d 02 01           stm8	[0x102], r5
 c1 99                 ldi8	r5, 0x99
 f0 4d 05 01           stm8	[0x105], r5
 c1 a2                 ldi8	r5, 0xa2
 f0 4d 08 01           stm8	[0x108], r5
 c1 ab                 ldi8	r5, 0xab
 f0 4d 0b 01           stm8	[0x10b], r5
 c1 b4                 ldi8	r5, 0xb4
 f0 4d 0e 01           stm8	[0x10e], r5
 c1 bd                 ldi8	r5, 0xbd
 f0 4d 11 01           stm8	[0x111], r5
 f0 55 03 01           ldm16	r5, [0x103]
 f9 a0                 and	r5, r0
 f0 5d 03 01           stm16	[0x103], r5
 f0 5c 06 01           stm16	[0x106], r4
 f0 5f 09 01           stm16	[0x109], r7
 f0 5e 0c 01           stm16	[0x10c], r6
 f0 59 0f 01           stm16	[0x10f], r1
 f0 54 12 01           ldm16	r4, [0x112]
 f9 80                 and	r4, r0
 c5 37 02              ldi16	r5, 0x237
 94                    or	r5, r4
 f0 5d 12 01           stm16	[0x112], r5
 c2 c6                 ldi8	r6, 0xc6
 f0 4e 14 01           stm8	[0x114], r6
 f0 54 15 01           ldm16	r4, [0x115]
 c1 cf                 ldi8	r5, 0xcf
 f0 4d 17 01           stm8	[0x117], r5
 f9 80                 and	r4, r0
 c1 42                 ldi8	r5, 0x42
 94                    or	r5, r4
 f0 5d 15 01           stm16	[0x115], r5
 c0 d0                 ldi8	r4, 0xd0
 f0 55 18 01           ldm16	r5, [0x118]
 f0 4c 1a 01           stm8	[0x11a], r4
 f9 a0                 and	r5, r0
 c4 4d 02              ldi16	r4, 0x24d
 91                    or	r4, r5
 f0 5c 18 01           stm16	[0x118], r4
 c0 d9                 ldi8	r4, 0xd9
 f0 55 1b 01           ldm16	r5, [0x11b]
 f0 4c 1d 01           stm8	[0x11d], r4
 f9 a0                 and	r5, r0
 c0 58                 ldi8	r4, 0x58
 91                    or	r4, r5
 f0 5c 1b 01           stm16	[0x11b], r4
 c0 e2                 ldi8	r4, 0xe2
 f0 55 1e 01           ldm16	r5, [0x11e]
 f0 4c 20 01           stm8	[0x120], r4
 f9 a0                 and	r5, r0
 c4 63 02              ldi16	r4, 0x263
 91                    or	r4, r5
 f0 5c 1e 01           stm16	[0x11e], r4
 c0 eb                 ldi8	r4, 0xeb
 f0 55 21 01           ldm16	r5, [0x121]
 f0 4c 23 01           stm8	[0x123], r4
 f9 a0                 and	r5, r0
 c0 6e                 ldi8	r4, 0x6e
 91                    or	r4, r5
 f0 5c 21 01           stm16	[0x121], r4
 c0 f4                 ldi8	r4, 0xf4
 f0 55 24 01           ldm16	r5, [0x124]
 f0 4c 26 01           stm8	[0x126], r4
 f9 a0                 and	r5, r0
 c4 79 02              ldi16	r4, 0x279
 91                    or	r4, r5
 f0 5c 24 01           stm16	[0x124], r4
 c0 fd                 ldi8	r4, 0xfd
 f0 55 27 01           ldm16	r5, [0x127]
 f0 4c 29 01           stm8	[0x129], r4
 f9 a0                 and	r5, r0
 c0 84                 ldi8	r4, 0x84
 91                    or	r4, r5
 f0 5c 27 01           stm16	[0x127], r4
 c0 06                 ldi8	r4, 0x6
 f0 55 2a 01           ldm16	r5, [0x12a]
 f0 4c 2c 01           stm8	[0x12c], r4
 f9 a0                 and	r5, r0
 c4 8f 02              ldi16	r4, 0x28f
 91                    or	r4, r5
 f0 5c 2a 01           stm16	[0x12a], r4
 c0 0f                 ldi8	r4, 0xf
 f0 55 2d 01           ldm16	r5, [0x12d]
 f0 4c 2f 01           stm8	[0x12f], r4
 f9 a0                 and	r5, r0
 c0 9a                 ldi8	r4, 0x9a
 91                    or	r4, r5
 f0 5c 2d 01           stm16	[0x12d], r4
 f0 01 10              ldi8	r1, 0x10
 f0 54 30 01           ldm16	r4, [0x130]
 f0 49 32 01           stm8	[0x132], r1
 f9 80                 and	r4, r0
 c5 a5 02              ldi16	r5, 0x2a5
 94                    or	r5, r4
 f0 5d 30 01           stm16	[0x130], r5
 c0 19                 ldi8	r4, 0x19
 f0 55 33 01           ldm16	r5, [0x133]
 f0 4c 35 01           stm8	[0x135], r4
 f9 a0                 and	r5, r0
 c0 b0                 ldi8	r4, 0xb0
 91                    or	r4, r5
 f0 5c 33 01           stm16	[0x133], r4
 c0 22                 ldi8	r4, 0x22
 f0 55 36 01           ldm16	r5, [0x136]
 f0 4c 38 01           stm8	[0x138], r4
 f9 a0                 and	r5, r0
 c4 bb 02              ldi16	r4, 0x2bb
 91                    or	r4, r5
 f0 5c 36 01           stm16	[0x136], r4
 c0 2b                 ldi8	r4, 0x2b
 f0 55 39 01           ldm16	r5, [0x139]
 f0 4c 3b 01           stm8	[0x13b], r4
 f9 a0                 and	r5, r0
 96                    or	r5, r6
 f0 5d 39 01           stm16	[0x139], r5
 c0 34                 ldi8	r4, 0x34
 f0 55 3c 01           ldm16	r5, [0x13c]
 f0 4c 3e 01           stm8	[0x13e], r4
 f9 a0                 and	r5, r0
 c4 d1 02              ldi16	r4, 0x2d1
 91                    or	r4, r5
 f0 5c 3c 01           stm16	[0x13c], r4
 c0 3d                 ldi8	r4, 0x3d
 f0 55 3f 01           ldm16	r5, [0x13f]
 f0 4c 41 01           stm8	[0x141], r4
 f9 a0                 and	r5, r0
 c0 dc                 ldi8	r4, 0xdc
 91                    or	r4, r5
 f0 5c 3f 01           stm16	[0x13f], r4
 c0 46                 ldi8	r4, 0x46
 f0 55 42 01           ldm16	r5, [0x142]
 f0 4c 44 01           stm8	[0x144], r4
 f9 a0                 and	r5, r0
 c4 e7 02              ldi16	r4, 0x2e7
 91                    or	r4, r5
 f0 5c 42 01           stm16	[0x142], r4
 c0 4f                 ldi8	r4, 0x4f
 f0 55 45 01           ldm16	r5, [0x145]
 f0 4c 47 01           stm8	[0x147], r4
 f9 a0                 and	r5, r0
 c0 f2                 ldi8	r4, 0xf2
 91                    or	r4, r5
 f0 5c 45 01           stm16	[0x145], r4
 c0 50                 ldi8	r4, 0x50
 f0 55 48 01           ldm16	r5, [0x148]
 f0 4c 4a 01           stm8	[0x14a], r4
 f9 a0                 and	r5, r0
 c4 fd 02              ldi16	r4, 0x2fd
 91                    or	r4, r5
 f0 5c 48 01           stm16	[0x148], r4
 c0 59                 ldi8	r4, 0x59
 f0 55 4b 01           ldm16	r5, [0x14b]
 f0 4c 4d 01           stm8	[0x14d], r4
 f9 a0                 and	r5, r0
 c4 08 01              ldi16	r4, 0x108
 91                    or	r4, r5
 f0 5c 4b 01           stm16	[0x14b], r4
 c0 62                 ldi8	r4, 0x62
 f0 55 4e 01           ldm16	r5, [0x14e]
 f0 4c 50 01           stm8	[0x150], r4
 f9 a0                 and	r5, r0
 c4 13 03              ldi16	r4, 0x313
 91                    or	r4, r5
 f0 5c 4e 01           stm16	[0x14e], r4
 c0 6b                 ldi8	r4, 0x6b
 f0 55 51 01           ldm16	r5, [0x151]
 f0 4c 53 01           stm8	[0x153], r4
 f9 a0                 and	r5, r0
 c4 1e 01              ldi16	r4, 0x11e
 91                    or	r4, r5
 f0 5c 51 01           stm16	[0x151], r4
 c0 74                 ldi8	r4, 0x74
 f0 55 54 01           ldm16	r5, [0x154]
 f0 4c 56 01           stm8	[0x156], r4
 f9 a0                 and	r5, r0
 c4 29 03              ldi16	r4, 0x329
 91                    or	r4, r5
 f0 5c 54 01           stm16	[0x154], r4
 c0 95                 ldi8	r4, 0x95
 f0 55 57 01           ldm16	r5, [0x157]
 f0 4c 59 01           stm8	[0x159], r4
 f9 a0                 and	r5, r0
 c4 34 01              ldi16	r4, 0x134
 91                    or	r4, r5
 f0 5c 57 01           stm16	[0x157], r4
 c0 9e                 ldi8	r4, 0x9e
 f0 55 5a 01           ldm16	r5, [0x15a]
 f0 4c 5c 01           stm8	[0x15c], r4
 f9 a0                 and	r5, r0
 c4 3f 03              ldi16	r4, 0x33f
 91                    or	r4, r5
 f0 5c 5a 01           stm16	[0x15a], r4
 c0 a7                 ldi8	r4, 0xa7
 f0 55 5d 01           ldm16	r5, [0x15d]
 f0 4c 5f 01           stm8	[0x15f], r4
 f9 a0                 and	r5, r0
 c4 4a 01              ldi16	r4, 0x14a
 91                    or	r4, r5
 f0 5c 5d 01           stm16	[0x15d], r4
 c0 a8                 ldi8	r4, 0xa8
 f0 55 60 01           ldm16	r5, [0x160]
 f0 4c 62 01           stm8	[0x162], r4
 f9 a0                 and	r5, r0
 c4 55 03              ldi16	r4, 0x355
 91                    or	r4, r5
 f0 5c 60 01           stm16	[0x160], r4
 c0 b1                 ldi8	r4, 0xb1
 f0 55 63 01           ldm16	r5, [0x163]
 f0 4c 65 01           stm8	[0x165], r4
 f9 a0                 and	r5, r0
 c4 60 01              ldi16	r4, 0x160
 91                    or	r4, r5
 f0 5c 63 01           stm16	[0x163], r4
 c0 ba                 ldi8	r4, 0xba
 f0 55 66 01           ldm16	r5, [0x166]
 f0 4c 68 01           stm8	[0x168], r4
 f9 a0                 and	r5, r0
 c4 6b 03              ldi16	r4, 0x36b
 91                    or	r4, r5
 f0 5c 66 01           stm16	[0x166], r4
 c0 c3                 ldi8	r4, 0xc3
 f0 55 69 01           ldm16	r5, [0x169]
 f0 4c 6b 01           stm8	[0x16b], r4
 f9 a0                 and	r5, r0
 c4 76 01              ldi16	r4, 0x176
 91                    or	r4, r5
 f0 5c 69 01           stm16	[0x169], r4
 c0 cc                 ldi8	r4, 0xcc
 f0 55 6c 01           ldm16	r5, [0x16c]
 f0 4c 6e 01           stm8	[0x16e], r4
 f9 a0                 and	r5, r0
 c4 81 03              ldi16	r4, 0x381
 91                    or	r4, r5
 f0 5c 6c 01           stm16	[0x16c], r4
 c0 d5                 ldi8	r4, 0xd5
 f0 55 6f 01           ldm16	r5, [0x16f]
 f0 4c 71 01           stm8	[0x171], r4
 f9 a0                 and	r5, r0
 c4 8c 01              ldi16	r4, 0x18c
 91                    or	r4, r5
 f0 5c 6f 01           stm16	[0x16f], r4
 c0 de                 ldi8	r4, 0xde
 f0 55 72 01           ldm16	r5, [0x172]
 f0 4c 74 01           stm8	[0x174], r4
 f9 a0                 and	r5, r0
 c4 97 03              ldi16	r4, 0x397
 91                    or	r4, r5
 f0 5c 72 01           stm16	[0x172], r4
 c0 e7                 ldi8	r4, 0xe7
 f0 55 75 01           ldm16	r5, [0x175]
 f0 4c 77 01           stm8	[0x177], r4
 f9 a0                 and	r5, r0
 c4 a2 01              ldi16	r4, 0x1a2
 91                    or	r4, r5
 f0 5c 75 01           stm16	[0x175], r4
 f0 54 78 01           ldm16	r4, [0x178]
 f9 80                 and	r4, r0
 c5 ad 03              ldi16	r5, 0x3ad
 94                    or	r5, r4
 f0 5d 78 01           stm16	[0x178], r5
 af                    xor	r7, r7
 d7 01                 sys	debug_break
 c0 28                 ldi8	r4, 0x28
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
<L0>:
 f4 48                 stsp16	[sp+0x2], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 07 03 01           ldi16	r3, 0x103
<L1>:
 f4 50                 stsp16	[sp+0x4], r4
 ed c6 1f              ld8u	r6, [r3-1]
 06                    mov	r5, r6
 f6 45                 sext8	r5
 fa c3                 asr16i	r5, 0x3
 c4 f1 ff              ldi16	r4, 0xfff1
 cd 0f                 cmpi.s8	r5, 0xf
 fd 21                 cmov.slt	r4, r1
 f0 00 07              ldi8	r0, 0x7
 f9 18                 and	r0, r6
 11                    add	r4, r5
 ed 56 20              ld16	r2, [r3+0]
 f1 26                 mov	r5, r2
 f2 24                 add	r5, r0
 f4 ad                 inc16	r5
 09                    mov	r6, r5
 fa 59                 lsl16i	r6, 0x9
 f0 05 00 02           ldi16	r1, 0x200
 f9 38                 and	r1, r6
 c6 00 fe              ldi16	r6, 0xfe00
 f9 c8                 and	r6, r2
 f0 06 ff 01           ldi16	r2, 0x1ff
 f9 54                 and	r2, r5
 f9 c9                 or	r6, r2
 f9 c6                 xor	r6, r1
 f0 01 01              ldi8	r1, 0x1
 06                    mov	r5, r6
 fa 89                 lsr16i	r5, 0x9
 f9 a4                 and	r5, r1
 f0 01 10              ldi8	r1, 0x10
 f2 17                 add	r2, r7
 10                    add	r4, r4
 10                    add	r4, r4
 10                    add	r4, r4
 c8 88                 addi.s8	r4, -0x78
 0c                    mov	r7, r4
 f6 47                 sext8	r7
 fa e3                 asr16i	r7, 0x3
 f2 2e                 add	r7, r2
 f9 81                 or	r4, r0
 ee d6 20              st16	[r3+0], r6
 ee 86 1f              st8	[r3-1], r4
 f4 10                 ldsp16	r4, [sp+0x4]
 1d                    add	r7, r5
 f0 0b 03              addi.s8	r3, 0x3
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 9b                 brne8	-0x65 <L1>
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 ac                 inc16	r4
 cc 14                 cmpi.s8	r4, 0x14
 d1 8b                 brne8	-0x75 <L0>
 f0 5f 00 01           stm16	[0x100], r7
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
