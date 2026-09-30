
short_circuit.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 short_circuit.c
00000100 l     O .data	00000040 first
00000140 l     O .data	00000040 second
00000180 l     O .data	00000002 short_circuit_result
00000000 l    df *ABS*	00000000 runtime.c
000004ff l       .init_array	00000000 .hidden __init_array_end
000004ff l       .init_array	00000000 .hidden __init_array_start
000004ff l       .fini_array	00000000 .hidden __fini_array_start
000004ff l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000236 avm_test_main
000004fd g     F .text	00000002 avm_halt
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
 e1 df 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 ff 04              ldi16	r4, 0x4ff
 c1 00                 ldi8	r5, 0x0
 c6 ff 04              ldi16	r6, 0x4ff
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	avm_run_constructors+61
 f0 04 ff 04           ldi16	r0, 0x4ff
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 ff 04           ldi16	r2, 0x4ff
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
 c4 ff 04              ldi16	r4, 0x4ff
 c1 00                 ldi8	r5, 0x0
 c6 ff 04              ldi16	r6, 0x4ff
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	avm_run_destructors+79
 f0 06 ff 04           ldi16	r2, 0x4ff
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 ff 04           ldi16	r0, 0x4ff
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
 d6 fe                 adjsp	-0x2
 c4 25 36              ldi16	r4, 0x3625
 c5 47 58              ldi16	r5, 0x5847
 c6 02 01              ldi16	r6, 0x102
 f0 6b 8c              st32	[r6], q2
 c4 28 33              ldi16	r4, 0x3328
 c5 3e 49              ldi16	r5, 0x493e
 c6 43 01              ldi16	r6, 0x143
 f0 6b 8c              st32	[r6], q2
 c4 69 7a              ldi16	r4, 0x7a69
 c5 8b 9c              ldi16	r5, 0x9c8b
 c6 06 01              ldi16	r6, 0x106
 f0 6b 8c              st32	[r6], q2
 c4 54 5f              ldi16	r4, 0x5f54
 c5 6a 75              ldi16	r5, 0x756a
 c6 47 01              ldi16	r6, 0x147
 f0 6b 8c              st32	[r6], q2
 c4 ad be              ldi16	r4, 0xbead
 c5 cf e0              ldi16	r5, 0xe0cf
 c6 0a 01              ldi16	r6, 0x10a
 f0 6b 8c              st32	[r6], q2
 c4 80 8b              ldi16	r4, 0x8b80
 c5 96 a1              ldi16	r5, 0xa196
 c6 4b 01              ldi16	r6, 0x14b
 f0 6b 8c              st32	[r6], q2
 c4 f1 02              ldi16	r4, 0x2f1
 c5 13 24              ldi16	r5, 0x2413
 c6 0e 01              ldi16	r6, 0x10e
 f0 6b 8c              st32	[r6], q2
 c4 ac b7              ldi16	r4, 0xb7ac
 c5 c2 cd              ldi16	r5, 0xcdc2
 c6 4f 01              ldi16	r6, 0x14f
 f0 6b 8c              st32	[r6], q2
 c4 35 46              ldi16	r4, 0x4635
 c5 57 68              ldi16	r5, 0x6857
 c6 12 01              ldi16	r6, 0x112
 f0 6b 8c              st32	[r6], q2
 c4 d8 e3              ldi16	r4, 0xe3d8
 c5 ee f9              ldi16	r5, 0xf9ee
 c6 53 01              ldi16	r6, 0x153
 f0 6b 8c              st32	[r6], q2
 c4 79 8a              ldi16	r4, 0x8a79
 c5 9b ac              ldi16	r5, 0xac9b
 c6 16 01              ldi16	r6, 0x116
 f0 6b 8c              st32	[r6], q2
 c4 04 0f              ldi16	r4, 0xf04
 c5 1a 25              ldi16	r5, 0x251a
 c6 57 01              ldi16	r6, 0x157
 f0 6b 8c              st32	[r6], q2
 c0 07                 ldi8	r4, 0x7
 f0 4c 40 01           stm8	[0x140], r4
 c4 03 14              ldi16	r4, 0x1403
 f0 5c 00 01           stm16	[0x100], r4
 c4 12 1d              ldi16	r4, 0x1d12
 f0 5c 41 01           stm16	[0x141], r4
 c4 bd ce              ldi16	r4, 0xcebd
 f0 5c 1a 01           stm16	[0x11a], r4
 c0 30                 ldi8	r4, 0x30
 f0 4c 5b 01           stm8	[0x15b], r4
 c0 df                 ldi8	r4, 0xdf
 f0 4c 1c 01           stm8	[0x11c], r4
 c4 3b 46              ldi16	r4, 0x463b
 c5 51 5c              ldi16	r5, 0x5c51
 c6 5c 01              ldi16	r6, 0x15c
 f0 6b 8c              st32	[r6], q2
 c4 12 23              ldi16	r4, 0x2312
 c5 34 45              ldi16	r5, 0x4534
 c6 1f 01              ldi16	r6, 0x11f
 f0 6b 8c              st32	[r6], q2
 c4 67 72              ldi16	r4, 0x7267
 c5 7d 88              ldi16	r5, 0x887d
 c6 60 01              ldi16	r6, 0x160
 f0 6b 8c              st32	[r6], q2
 c4 56 67              ldi16	r4, 0x6756
 c5 78 89              ldi16	r5, 0x8978
 c6 23 01              ldi16	r6, 0x123
 f0 6b 8c              st32	[r6], q2
 c4 93 9e              ldi16	r4, 0x9e93
 c5 a9 b4              ldi16	r5, 0xb4a9
 c6 64 01              ldi16	r6, 0x164
 f0 6b 8c              st32	[r6], q2
 c4 9a ab              ldi16	r4, 0xab9a
 c5 bc cd              ldi16	r5, 0xcdbc
 c6 27 01              ldi16	r6, 0x127
 f0 6b 8c              st32	[r6], q2
 c4 bf ca              ldi16	r4, 0xcabf
 c5 d5 e0              ldi16	r5, 0xe0d5
 c6 68 01              ldi16	r6, 0x168
 f0 6b 8c              st32	[r6], q2
 c4 de ef              ldi16	r4, 0xefde
 c5 00 11              ldi16	r5, 0x1100
 c6 2b 01              ldi16	r6, 0x12b
 f0 6b 8c              st32	[r6], q2
 c4 eb f6              ldi16	r4, 0xf6eb
 c5 01 0c              ldi16	r5, 0xc01
 c6 6c 01              ldi16	r6, 0x16c
 f0 6b 8c              st32	[r6], q2
 c4 22 33              ldi16	r4, 0x3322
 c5 44 55              ldi16	r5, 0x5544
 c6 2f 01              ldi16	r6, 0x12f
 f0 6b 8c              st32	[r6], q2
 c4 17 22              ldi16	r4, 0x2217
 c5 2d 38              ldi16	r5, 0x382d
 c6 70 01              ldi16	r6, 0x170
 f0 6b 8c              st32	[r6], q2
 c4 66 77              ldi16	r4, 0x7766
 c5 88 99              ldi16	r5, 0x9988
 c6 33 01              ldi16	r6, 0x133
 f0 6b 8c              st32	[r6], q2
 c4 43 4e              ldi16	r4, 0x4e43
 c5 59 64              ldi16	r5, 0x6459
 c6 74 01              ldi16	r6, 0x174
 f0 6b 8c              st32	[r6], q2
 c4 f0 01              ldi16	r4, 0x1f0
 f0 5c 1d 01           stm16	[0x11d], r4
 c4 aa bb              ldi16	r4, 0xbbaa
 f0 5c 37 01           stm16	[0x137], r4
 c0 6f                 ldi8	r4, 0x6f
 f0 4c 78 01           stm8	[0x178], r4
 c0 cc                 ldi8	r4, 0xcc
 f0 4c 39 01           stm8	[0x139], r4
 c0 7a                 ldi8	r4, 0x7a
 f0 4c 79 01           stm8	[0x179], r4
 c0 dd                 ldi8	r4, 0xdd
 f0 4c 3a 01           stm8	[0x13a], r4
 c0 85                 ldi8	r4, 0x85
 f0 4c 7a 01           stm8	[0x17a], r4
 c0 ee                 ldi8	r4, 0xee
 f0 4c 3b 01           stm8	[0x13b], r4
 c0 90                 ldi8	r4, 0x90
 f0 4c 7b 01           stm8	[0x17b], r4
 c0 ff                 ldi8	r4, 0xff
 f0 4c 3c 01           stm8	[0x13c], r4
 c0 9b                 ldi8	r4, 0x9b
 f0 4c 7c 01           stm8	[0x17c], r4
 c0 10                 ldi8	r4, 0x10
 f0 4c 3d 01           stm8	[0x13d], r4
 c0 a6                 ldi8	r4, 0xa6
 f0 4c 7d 01           stm8	[0x17d], r4
 c0 21                 ldi8	r4, 0x21
 f0 4c 3e 01           stm8	[0x13e], r4
 c0 b1                 ldi8	r4, 0xb1
 f0 4c 7e 01           stm8	[0x17e], r4
 c0 32                 ldi8	r4, 0x32
 f0 4c 3f 01           stm8	[0x13f], r4
 c0 bc                 ldi8	r4, 0xbc
 f0 4c 7f 01           stm8	[0x17f], r4
 a5                    xor	r5, r5
 d7 01                 sys	debug_break
 f0 05 00 01           ldi16	r1, 0x100
 09                    mov	r6, r5
 f0 02 80              ldi8	r2, 0x80
 d4 0b                 jmp8	avm_test_main+473
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 ae                 inc16	r6
 02                    mov	r4, r6
 f1 74                 zext8	r4
 cc 18                 cmpi.s8	r4, 0x18
 d0 4f                 breq8	avm_test_main+552
 f4 42                 stsp16	[sp+0x0], r6
 f2 30                 sub	r0, r0
 d4 09                 jmp8	avm_test_main+488
 1f                    add	r7, r7
 1f                    add	r7, r7
 1f                    add	r7, r7
 a7                    xor	r5, r7
 f0 0c 40              cmpi.s8	r0, 0x40
 d0 e6                 breq8	avm_test_main+462
 f1 20                 mov	r4, r0
 f2 21                 add	r4, r1
 4c                    ld8u	r7, [r4]
 03                    mov	r4, r7
 c2 07                 ldi8	r6, 0x7
 82                    and	r4, r6
 f4 a4                 tst8	r4
 f1 20                 mov	r4, r0
 c6 40 01              ldi16	r6, 0x140
 12                    add	r4, r6
 d0 0e                 breq8	avm_test_main+521
 f1 29                 mov	r6, r1
 f5 31                 ld8u	r1, [r4]
 f2 4b                 sub	r3, r3
 f5 11                 cmp	r2, r1
 f1 0e                 mov	r1, r6
 fc 1f                 cmov.ult	r3, r7
 f2 27                 add	r5, r3
 f4 a7                 tst8	r7
 f4 a8                 inc16	r0
 d0 d0                 breq8	avm_test_main+479
 40                    ld8u	r4, [r4]
 c2 03                 ldi8	r6, 0x3
 88                    and	r6, r4
 f4 a6                 tst8	r6
 d0 c8                 breq8	avm_test_main+479
 c0 3f                 ldi8	r4, 0x3f
 f9 80                 and	r4, r0
 f2 21                 add	r4, r1
 40                    ld8u	r4, [r4]
 33                    cmp	r4, r7
 d0 be                 breq8	avm_test_main+479
 f0 0c 40              cmpi.s8	r0, 0x40
 d1 c2                 brne8	avm_test_main+488
 d4 a6                 jmp8	avm_test_main+462
 f0 5d 80 01           stm16	[0x180], r5
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
