
short_circuit.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 short_circuit.c
00000100 l     O .data	00000002 short_circuit_result
00000102 l     O .data	00000040 first
00000142 l     O .data	00000040 second
00000000 l    df *ABS*	00000000 runtime.c
000004f5 l       .init_array	00000000 .hidden __init_array_end
000004f5 l       .init_array	00000000 .hidden __init_array_start
000004f5 l       .fini_array	00000000 .hidden __fini_array_start
000004f5 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	0000022c avm_test_main
000004f3 g     F .text	00000002 avm_halt
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
 e1 d5 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 f5 04              ldi16	r4, 0x4f5
 c1 00                 ldi8	r5, 0x0
 c6 f5 04              ldi16	r6, 0x4f5
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 f5 04           ldi16	r0, 0x4f5
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 f5 04           ldi16	r2, 0x4f5
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
 c4 f5 04              ldi16	r4, 0x4f5
 c1 00                 ldi8	r5, 0x0
 c6 f5 04              ldi16	r6, 0x4f5
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 f5 04           ldi16	r2, 0x4f5
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 f5 04           ldi16	r0, 0x4f5
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
 d6 fe                 adjsp	-0x2
 c4 1d 28              ldi16	r4, 0x281d
 c5 33 3e              ldi16	r5, 0x3e33
 c6 44 01              ldi16	r6, 0x144
 f0 6b 8c              st32	[r6], q2
 c4 25 36              ldi16	r4, 0x3625
 c5 47 58              ldi16	r5, 0x5847
 c6 04 01              ldi16	r6, 0x104
 f0 6b 8c              st32	[r6], q2
 c4 49 54              ldi16	r4, 0x5449
 c5 5f 6a              ldi16	r5, 0x6a5f
 c6 48 01              ldi16	r6, 0x148
 f0 6b 8c              st32	[r6], q2
 c4 69 7a              ldi16	r4, 0x7a69
 c5 8b 9c              ldi16	r5, 0x9c8b
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 c4 75 80              ldi16	r4, 0x8075
 c5 8b 96              ldi16	r5, 0x968b
 c6 4c 01              ldi16	r6, 0x14c
 f0 6b 8c              st32	[r6], q2
 c4 cf e0              ldi16	r4, 0xe0cf
 c1 f1                 ldi8	r5, 0xf1
 c6 0e 01              ldi16	r6, 0x10e
 f7 54                 st16	[r6+], r4
 59                    st8	[r6], r5
 c4 a1 ac              ldi16	r4, 0xaca1
 c5 b7 c2              ldi16	r5, 0xc2b7
 c6 50 01              ldi16	r6, 0x150
 f0 6b 8c              st32	[r6], q2
 c4 02 13              ldi16	r4, 0x1302
 c5 24 35              ldi16	r5, 0x3524
 c6 11 01              ldi16	r6, 0x111
 f0 6b 8c              st32	[r6], q2
 c4 cd d8              ldi16	r4, 0xd8cd
 c5 e3 ee              ldi16	r5, 0xeee3
 c6 54 01              ldi16	r6, 0x154
 f0 6b 8c              st32	[r6], q2
 c4 46 57              ldi16	r4, 0x5746
 c5 68 79              ldi16	r5, 0x7968
 c6 15 01              ldi16	r6, 0x115
 f0 6b 8c              st32	[r6], q2
 c4 f9 04              ldi16	r4, 0x4f9
 c5 0f 1a              ldi16	r5, 0x1a0f
 c6 58 01              ldi16	r6, 0x158
 f0 6b 8c              st32	[r6], q2
 c4 8a 9b              ldi16	r4, 0x9b8a
 c5 ac bd              ldi16	r5, 0xbdac
 c6 19 01              ldi16	r6, 0x119
 f0 6b 8c              st32	[r6], q2
 c4 03 14              ldi16	r4, 0x1403
 f0 5c 02 01           stm16	[0x102], r4
 c4 07 12              ldi16	r4, 0x1207
 f0 5c 42 01           stm16	[0x142], r4
 c4 ad be              ldi16	r4, 0xbead
 f0 5c 0c 01           stm16	[0x10c], r4
 c4 25 30              ldi16	r4, 0x3025
 f0 5c 5c 01           stm16	[0x15c], r4
 c0 ce                 ldi8	r4, 0xce
 f0 4c 1d 01           stm8	[0x11d], r4
 c4 3b 46              ldi16	r4, 0x463b
 c1 51                 ldi8	r5, 0x51
 c6 5e 01              ldi16	r6, 0x15e
 f7 54                 st16	[r6+], r4
 59                    st8	[r6], r5
 c4 df f0              ldi16	r4, 0xf0df
 c1 01                 ldi8	r5, 0x1
 c6 1e 01              ldi16	r6, 0x11e
 f7 54                 st16	[r6+], r4
 59                    st8	[r6], r5
 c4 5c 67              ldi16	r4, 0x675c
 c5 72 7d              ldi16	r5, 0x7d72
 c6 61 01              ldi16	r6, 0x161
 f0 6b 8c              st32	[r6], q2
 c4 12 23              ldi16	r4, 0x2312
 c5 34 45              ldi16	r5, 0x4534
 c6 21 01              ldi16	r6, 0x121
 f0 6b 8c              st32	[r6], q2
 c4 88 93              ldi16	r4, 0x9388
 c5 9e a9              ldi16	r5, 0xa99e
 c6 65 01              ldi16	r6, 0x165
 f0 6b 8c              st32	[r6], q2
 c4 56 67              ldi16	r4, 0x6756
 c5 78 89              ldi16	r5, 0x8978
 c6 25 01              ldi16	r6, 0x125
 f0 6b 8c              st32	[r6], q2
 c4 b4 bf              ldi16	r4, 0xbfb4
 c5 ca d5              ldi16	r5, 0xd5ca
 c6 69 01              ldi16	r6, 0x169
 f0 6b 8c              st32	[r6], q2
 c4 9a ab              ldi16	r4, 0xab9a
 c5 bc cd              ldi16	r5, 0xcdbc
 c6 29 01              ldi16	r6, 0x129
 f0 6b 8c              st32	[r6], q2
 c4 e0 eb              ldi16	r4, 0xebe0
 c5 f6 01              ldi16	r5, 0x1f6
 c6 6d 01              ldi16	r6, 0x16d
 f0 6b 8c              st32	[r6], q2
 c4 de ef              ldi16	r4, 0xefde
 c5 00 11              ldi16	r5, 0x1100
 c6 2d 01              ldi16	r6, 0x12d
 f0 6b 8c              st32	[r6], q2
 c4 0c 17              ldi16	r4, 0x170c
 c5 22 2d              ldi16	r5, 0x2d22
 c6 71 01              ldi16	r6, 0x171
 f0 6b 8c              st32	[r6], q2
 c4 22 33              ldi16	r4, 0x3322
 c5 44 55              ldi16	r5, 0x5544
 c6 31 01              ldi16	r6, 0x131
 f0 6b 8c              st32	[r6], q2
 c4 38 43              ldi16	r4, 0x4338
 c5 4e 59              ldi16	r5, 0x594e
 c6 75 01              ldi16	r6, 0x175
 f0 6b 8c              st32	[r6], q2
 c4 66 77              ldi16	r4, 0x7766
 c5 88 99              ldi16	r5, 0x9988
 c6 35 01              ldi16	r6, 0x135
 f0 6b 8c              st32	[r6], q2
 c4 64 6f              ldi16	r4, 0x6f64
 f0 5c 79 01           stm16	[0x179], r4
 c4 aa bb              ldi16	r4, 0xbbaa
 f0 5c 39 01           stm16	[0x139], r4
 c0 7a                 ldi8	r4, 0x7a
 f0 4c 7b 01           stm8	[0x17b], r4
 c0 cc                 ldi8	r4, 0xcc
 f0 4c 3b 01           stm8	[0x13b], r4
 c0 85                 ldi8	r4, 0x85
 f0 4c 7c 01           stm8	[0x17c], r4
 c0 dd                 ldi8	r4, 0xdd
 f0 4c 3c 01           stm8	[0x13c], r4
 c0 90                 ldi8	r4, 0x90
 f0 4c 7d 01           stm8	[0x17d], r4
 c0 ee                 ldi8	r4, 0xee
 f0 4c 3d 01           stm8	[0x13d], r4
 c0 9b                 ldi8	r4, 0x9b
 f0 4c 7e 01           stm8	[0x17e], r4
 c0 ff                 ldi8	r4, 0xff
 f0 4c 3e 01           stm8	[0x13e], r4
 c0 a6                 ldi8	r4, 0xa6
 f0 4c 7f 01           stm8	[0x17f], r4
 c0 10                 ldi8	r4, 0x10
 f0 4c 3f 01           stm8	[0x13f], r4
 c0 b1                 ldi8	r4, 0xb1
 f0 4c 80 01           stm8	[0x180], r4
 c0 21                 ldi8	r4, 0x21
 f0 4c 40 01           stm8	[0x140], r4
 c0 bc                 ldi8	r4, 0xbc
 f0 4c 81 01           stm8	[0x181], r4
 c0 32                 ldi8	r4, 0x32
 f0 4c 41 01           stm8	[0x141], r4
 f2 4b                 sub	r3, r3
 d7 01                 sys	debug_break
 f1 27                 mov	r5, r3
 f0 01 80              ldi8	r1, 0x80
 d4 0b                 jmp8	0xb <L1>
<L0>:
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 18                 cmpi.s8	r4, 0x18
 d0 49                 breq8	0x49 <L5>
<L1>:
 f4 41                 stsp16	[sp+0x0], r5
 a5                    xor	r5, r5
 d4 09                 jmp8	0x9 <L3>
<L2>:
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 f9 7a                 xor	r3, r6
 cd 40                 cmpi.s8	r5, 0x40
 d0 e7                 breq8	-0x19 <L0>
<L3>:
 01                    mov	r4, r5
 c6 02 01              ldi16	r6, 0x102
 12                    add	r4, r6
 48                    ld8u	r6, [r4]
 c0 07                 ldi8	r4, 0x7
 82                    and	r4, r6
 f4 a4                 tst8	r4
 01                    mov	r4, r5
 c7 42 01              ldi16	r7, 0x142
 13                    add	r4, r7
 d0 0a                 breq8	0xa <L4>
 f5 30                 ld8u	r0, [r4]
 f2 42                 sub	r2, r2
 f5 08                 cmp	r1, r0
 fc 16                 cmov.ult	r2, r6
 f2 1a                 add	r3, r2
<L4>:
 f4 a6                 tst8	r6
 f4 ad                 inc16	r5
 d0 d5                 breq8	-0x2b <L2>
 40                    ld8u	r4, [r4]
 c3 03                 ldi8	r7, 0x3
 8c                    and	r7, r4
 f4 a7                 tst8	r7
 d0 cd                 breq8	-0x33 <L2>
 c0 3f                 ldi8	r4, 0x3f
 81                    and	r4, r5
 c7 02 01              ldi16	r7, 0x102
 13                    add	r4, r7
 40                    ld8u	r4, [r4]
 32                    cmp	r4, r6
 d0 c2                 breq8	-0x3e <L2>
 cd 40                 cmpi.s8	r5, 0x40
 d1 c7                 brne8	-0x39 <L3>
 d4 ac                 jmp8	-0x54 <L0>
<L5>:
 f0 5b 00 01           stm16	[0x100], r3
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
