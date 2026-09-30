
packed_fields.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 packed_fields.c
00000100 l     O .data	000000c0 packets
000001c0 l     O .data	00000004 packed_fields_result
00000000 l    df *ABS*	00000000 runtime.c
0000057f l       .init_array	00000000 .hidden __init_array_end
0000057f l       .init_array	00000000 .hidden __init_array_start
0000057f l       .fini_array	00000000 .hidden __fini_array_start
0000057f l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	000002b6 avm_test_main
0000057d g     F .text	00000002 avm_halt
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
 e1 5f 03              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 7f 05              ldi16	r4, 0x57f
 c1 00                 ldi8	r5, 0x0
 c6 7f 05              ldi16	r6, 0x57f
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	avm_run_constructors+61
 f0 04 7f 05           ldi16	r0, 0x57f
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 7f 05           ldi16	r2, 0x57f
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
 c4 7f 05              ldi16	r4, 0x57f
 c1 00                 ldi8	r5, 0x0
 c6 7f 05              ldi16	r6, 0x57f
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	avm_run_destructors+79
 f0 06 7f 05           ldi16	r2, 0x57f
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 7f 05           ldi16	r0, 0x57f
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
 c4 03 66              ldi16	r4, 0x6603
 c5 34 12              ldi16	r5, 0x1234
 c6 b9 01              ldi16	r6, 0x1b9
 f0 6b 8c              st32	[r6], q2
 c4 32 01              ldi16	r4, 0x132
 c5 b3 17              ldi16	r5, 0x17b3
 c6 b5 01              ldi16	r6, 0x1b5
 f0 6b 8c              st32	[r6], q2
 c4 56 65              ldi16	r4, 0x6556
 c5 34 12              ldi16	r5, 0x1234
 c6 b1 01              ldi16	r6, 0x1b1
 f0 6b 8c              st32	[r6], q2
 c4 1b 01              ldi16	r4, 0x11b
 c5 b0 16              ldi16	r5, 0x16b0
 c6 ad 01              ldi16	r6, 0x1ad
 f0 6b 8c              st32	[r6], q2
 c4 a9 64              ldi16	r4, 0x64a9
 c5 34 12              ldi16	r5, 0x1234
 c6 a9 01              ldi16	r6, 0x1a9
 f0 6b 8c              st32	[r6], q2
 c4 04 01              ldi16	r4, 0x104
 c5 b1 15              ldi16	r5, 0x15b1
 c6 a5 01              ldi16	r6, 0x1a5
 f0 6b 8c              st32	[r6], q2
 c4 fc 63              ldi16	r4, 0x63fc
 c5 34 12              ldi16	r5, 0x1234
 c6 a1 01              ldi16	r6, 0x1a1
 f0 6b 8c              st32	[r6], q2
 c0 ed                 ldi8	r4, 0xed
 c5 b6 14              ldi16	r5, 0x14b6
 c6 9d 01              ldi16	r6, 0x19d
 f0 6b 8c              st32	[r6], q2
 c4 4f 63              ldi16	r4, 0x634f
 c5 34 12              ldi16	r5, 0x1234
 c6 99 01              ldi16	r6, 0x199
 f0 6b 8c              st32	[r6], q2
 c0 d6                 ldi8	r4, 0xd6
 c5 b7 13              ldi16	r5, 0x13b7
 c6 95 01              ldi16	r6, 0x195
 f0 6b 8c              st32	[r6], q2
 c4 a2 62              ldi16	r4, 0x62a2
 c5 34 12              ldi16	r5, 0x1234
 c6 91 01              ldi16	r6, 0x191
 f0 6b 8c              st32	[r6], q2
 c0 bf                 ldi8	r4, 0xbf
 c5 b4 12              ldi16	r5, 0x12b4
 c6 8d 01              ldi16	r6, 0x18d
 f0 6b 8c              st32	[r6], q2
 c4 f5 61              ldi16	r4, 0x61f5
 c5 34 12              ldi16	r5, 0x1234
 c6 89 01              ldi16	r6, 0x189
 f0 6b 8c              st32	[r6], q2
 c0 a8                 ldi8	r4, 0xa8
 c5 b5 11              ldi16	r5, 0x11b5
 c6 85 01              ldi16	r6, 0x185
 f0 6b 8c              st32	[r6], q2
 c4 48 61              ldi16	r4, 0x6148
 c5 34 12              ldi16	r5, 0x1234
 c6 81 01              ldi16	r6, 0x181
 f0 6b 8c              st32	[r6], q2
 c0 91                 ldi8	r4, 0x91
 c5 aa 10              ldi16	r5, 0x10aa
 c6 7d 01              ldi16	r6, 0x17d
 f0 6b 8c              st32	[r6], q2
 c4 9b 60              ldi16	r4, 0x609b
 c5 34 12              ldi16	r5, 0x1234
 c6 79 01              ldi16	r6, 0x179
 f0 6b 8c              st32	[r6], q2
 c0 7a                 ldi8	r4, 0x7a
 c5 ab 0f              ldi16	r5, 0xfab
 c6 75 01              ldi16	r6, 0x175
 f0 6b 8c              st32	[r6], q2
 c4 ee 5f              ldi16	r4, 0x5fee
 c5 34 12              ldi16	r5, 0x1234
 c6 71 01              ldi16	r6, 0x171
 f0 6b 8c              st32	[r6], q2
 c0 63                 ldi8	r4, 0x63
 c5 a8 0e              ldi16	r5, 0xea8
 c6 6d 01              ldi16	r6, 0x16d
 f0 6b 8c              st32	[r6], q2
 c4 41 5f              ldi16	r4, 0x5f41
 c5 34 12              ldi16	r5, 0x1234
 c6 69 01              ldi16	r6, 0x169
 f0 6b 8c              st32	[r6], q2
 c0 4c                 ldi8	r4, 0x4c
 c5 a9 0d              ldi16	r5, 0xda9
 c6 65 01              ldi16	r6, 0x165
 f0 6b 8c              st32	[r6], q2
 c4 94 5e              ldi16	r4, 0x5e94
 c5 34 12              ldi16	r5, 0x1234
 c6 61 01              ldi16	r6, 0x161
 f0 6b 8c              st32	[r6], q2
 c0 35                 ldi8	r4, 0x35
 c5 ae 0c              ldi16	r5, 0xcae
 c6 5d 01              ldi16	r6, 0x15d
 f0 6b 8c              st32	[r6], q2
 c4 e7 5d              ldi16	r4, 0x5de7
 c5 34 12              ldi16	r5, 0x1234
 c6 59 01              ldi16	r6, 0x159
 f0 6b 8c              st32	[r6], q2
 c0 1e                 ldi8	r4, 0x1e
 c5 af 0b              ldi16	r5, 0xbaf
 c6 55 01              ldi16	r6, 0x155
 f0 6b 8c              st32	[r6], q2
 c4 3a 5d              ldi16	r4, 0x5d3a
 c5 34 12              ldi16	r5, 0x1234
 c6 51 01              ldi16	r6, 0x151
 f0 6b 8c              st32	[r6], q2
 c0 07                 ldi8	r4, 0x7
 c5 ac 0a              ldi16	r5, 0xaac
 c6 4d 01              ldi16	r6, 0x14d
 f0 6b 8c              st32	[r6], q2
 c4 8d 5c              ldi16	r4, 0x5c8d
 c5 34 12              ldi16	r5, 0x1234
 c6 49 01              ldi16	r6, 0x149
 f0 6b 8c              st32	[r6], q2
 c4 f0 ff              ldi16	r4, 0xfff0
 c5 ad 09              ldi16	r5, 0x9ad
 c6 45 01              ldi16	r6, 0x145
 f0 6b 8c              st32	[r6], q2
 c4 e0 5b              ldi16	r4, 0x5be0
 c5 34 12              ldi16	r5, 0x1234
 c6 41 01              ldi16	r6, 0x141
 f0 6b 8c              st32	[r6], q2
 c4 d9 ff              ldi16	r4, 0xffd9
 c5 a2 08              ldi16	r5, 0x8a2
 c6 3d 01              ldi16	r6, 0x13d
 f0 6b 8c              st32	[r6], q2
 c4 33 5b              ldi16	r4, 0x5b33
 c5 34 12              ldi16	r5, 0x1234
 c6 39 01              ldi16	r6, 0x139
 f0 6b 8c              st32	[r6], q2
 c4 c2 ff              ldi16	r4, 0xffc2
 c5 a3 07              ldi16	r5, 0x7a3
 c6 35 01              ldi16	r6, 0x135
 f0 6b 8c              st32	[r6], q2
 c4 86 5a              ldi16	r4, 0x5a86
 c5 34 12              ldi16	r5, 0x1234
 c6 31 01              ldi16	r6, 0x131
 f0 6b 8c              st32	[r6], q2
 c4 ab ff              ldi16	r4, 0xffab
 c5 a0 06              ldi16	r5, 0x6a0
 c6 2d 01              ldi16	r6, 0x12d
 f0 6b 8c              st32	[r6], q2
 c4 d9 59              ldi16	r4, 0x59d9
 c5 34 12              ldi16	r5, 0x1234
 c6 29 01              ldi16	r6, 0x129
 f0 6b 8c              st32	[r6], q2
 c4 94 ff              ldi16	r4, 0xff94
 c5 a1 05              ldi16	r5, 0x5a1
 c6 25 01              ldi16	r6, 0x125
 f0 6b 8c              st32	[r6], q2
 c4 2c 59              ldi16	r4, 0x592c
 c5 34 12              ldi16	r5, 0x1234
 c6 21 01              ldi16	r6, 0x121
 f0 6b 8c              st32	[r6], q2
 c4 7d ff              ldi16	r4, 0xff7d
 c5 a6 04              ldi16	r5, 0x4a6
 c6 1d 01              ldi16	r6, 0x11d
 f0 6b 8c              st32	[r6], q2
 c4 7f 58              ldi16	r4, 0x587f
 c5 34 12              ldi16	r5, 0x1234
 c6 19 01              ldi16	r6, 0x119
 f0 6b 8c              st32	[r6], q2
 c4 66 ff              ldi16	r4, 0xff66
 c5 a7 03              ldi16	r5, 0x3a7
 c6 15 01              ldi16	r6, 0x115
 f0 6b 8c              st32	[r6], q2
 c4 d2 57              ldi16	r4, 0x57d2
 c5 34 12              ldi16	r5, 0x1234
 c6 11 01              ldi16	r6, 0x111
 f0 6b 8c              st32	[r6], q2
 c4 4f ff              ldi16	r4, 0xff4f
 c5 a4 02              ldi16	r5, 0x2a4
 c6 0d 01              ldi16	r6, 0x10d
 f0 6b 8c              st32	[r6], q2
 c4 25 57              ldi16	r4, 0x5725
 c5 34 12              ldi16	r5, 0x1234
 c6 09 01              ldi16	r6, 0x109
 f0 6b 8c              st32	[r6], q2
 c4 38 ff              ldi16	r4, 0xff38
 c5 a5 01              ldi16	r5, 0x1a5
 c6 05 01              ldi16	r6, 0x105
 f0 6b 8c              st32	[r6], q2
 c4 78 56              ldi16	r4, 0x5678
 c5 34 12              ldi16	r5, 0x1234
 c7 01 01              ldi16	r7, 0x101
 f0 6b 8e              st32	[r7], q2
 c0 b2                 ldi8	r4, 0xb2
 f0 4c bf 01           stm8	[0x1bf], r4
 c4 49 01              ldi16	r4, 0x149
 f0 5c bd 01           stm16	[0x1bd], r4
 a0                    xor	r4, r4
 f0 4c 00 01           stm8	[0x100], r4
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 d7 01                 sys	debug_break
 04                    mov	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 f2 30                 sub	r0, r0
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 3b 04              stsp16	[sp+0x4], r3
 f1 18                 mov	r3, r0
 f2 1e                 add	r3, r6
 f1 08                 mov	r1, r0
 f2 0f                 add	r1, r7
 f0 6a 82              ld32	q2, [r1]
 ed 56 20              ld16	r2, [r3+0]
 f1 2a                 mov	r6, r2
 f1 2e                 mov	r7, r2
 fa ef                 asr16i	r7, 0xf
 f7 6e                 add32	q3, q2
 f1 20                 mov	r4, r0
 c5 07 01              ldi16	r5, 0x107
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 a5                    xor	r5, r5
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 f1 28                 mov	r6, r0
 c7 00 01              ldi16	r7, 0x100
 1b                    add	r6, r7
 4a                    ld8u	r6, [r6]
 f2 2a                 add	r6, r2
 ee d6 20              st16	[r3+0], r6
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
 f0 6b 82              st32	[r1], q2
 af                    xor	r7, r7
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 f7 67                 add32	q1, q3
 c7 01 01              ldi16	r7, 0x101
 c6 05 01              ldi16	r6, 0x105
 f0 08 08              addi.s8	r0, 0x8
 c0 c0                 ldi8	r4, 0xc0
 f5 04                 cmp	r0, r4
 d1 b1                 brne8	avm_test_main+588
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 18                 cmpi.s8	r4, 0x18
 d1 a2                 brne8	avm_test_main+584
 c4 c0 01              ldi16	r4, 0x1c0
 f0 6b 48              st32	[r4], q1
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
