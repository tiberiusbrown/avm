
poly12_native.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 poly12_native.c
00000100 l     O .data	00000004 result
00000104 l     O .data	00000080 inputs
00000000 l    df *ABS*	00000000 runtime.c
00000448 l       .init_array	00000000 .hidden __init_array_end
00000448 l       .init_array	00000000 .hidden __init_array_start
00000448 l       .fini_array	00000000 .hidden __fini_array_start
00000448 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	0000017f avm_test_main
00000446 g     F .text	00000002 avm_halt
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
 e1 28 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 48 04              ldi16	r4, 0x448
 c1 00                 ldi8	r5, 0x0
 c6 48 04              ldi16	r6, 0x448
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 48 04           ldi16	r0, 0x448
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 48 04           ldi16	r2, 0x448
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
 c4 48 04              ldi16	r4, 0x448
 c1 00                 ldi8	r5, 0x0
 c6 48 04              ldi16	r6, 0x448
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 48 04           ldi16	r2, 0x448
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 48 04           ldi16	r0, 0x448
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
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 a0                    xor	r4, r4
 c5 80 3e              ldi16	r5, 0x3e80
 f0 06 04 01           ldi16	r2, 0x104
 f0 6b 84              st32	[r2], q2
 c5 88 3e              ldi16	r5, 0x3e88
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 c5 90 3e              ldi16	r5, 0x3e90
 c6 0c 01              ldi16	r6, 0x10c
 f0 6b 8c              st32	[r6], q2
 c5 98 3e              ldi16	r5, 0x3e98
 c6 10 01              ldi16	r6, 0x110
 f0 6b 8c              st32	[r6], q2
 c5 a0 3e              ldi16	r5, 0x3ea0
 c6 14 01              ldi16	r6, 0x114
 f0 6b 8c              st32	[r6], q2
 c5 a8 3e              ldi16	r5, 0x3ea8
 c6 18 01              ldi16	r6, 0x118
 f0 6b 8c              st32	[r6], q2
 c5 b0 3e              ldi16	r5, 0x3eb0
 c6 1c 01              ldi16	r6, 0x11c
 f0 6b 8c              st32	[r6], q2
 c5 b8 3e              ldi16	r5, 0x3eb8
 c6 20 01              ldi16	r6, 0x120
 f0 6b 8c              st32	[r6], q2
 c5 c0 3e              ldi16	r5, 0x3ec0
 c6 24 01              ldi16	r6, 0x124
 f0 6b 8c              st32	[r6], q2
 c5 c8 3e              ldi16	r5, 0x3ec8
 c6 28 01              ldi16	r6, 0x128
 f0 6b 8c              st32	[r6], q2
 c5 d0 3e              ldi16	r5, 0x3ed0
 c6 2c 01              ldi16	r6, 0x12c
 f0 6b 8c              st32	[r6], q2
 c5 d8 3e              ldi16	r5, 0x3ed8
 c6 30 01              ldi16	r6, 0x130
 f0 6b 8c              st32	[r6], q2
 c5 e0 3e              ldi16	r5, 0x3ee0
 c6 34 01              ldi16	r6, 0x134
 f0 6b 8c              st32	[r6], q2
 c5 e8 3e              ldi16	r5, 0x3ee8
 c6 38 01              ldi16	r6, 0x138
 f0 6b 8c              st32	[r6], q2
 c5 f0 3e              ldi16	r5, 0x3ef0
 c6 3c 01              ldi16	r6, 0x13c
 f0 6b 8c              st32	[r6], q2
 c5 f8 3e              ldi16	r5, 0x3ef8
 c6 40 01              ldi16	r6, 0x140
 f0 6b 8c              st32	[r6], q2
 c5 00 3f              ldi16	r5, 0x3f00
 c6 44 01              ldi16	r6, 0x144
 f0 6b 8c              st32	[r6], q2
 c5 04 3f              ldi16	r5, 0x3f04
 c6 48 01              ldi16	r6, 0x148
 f0 6b 8c              st32	[r6], q2
 c5 08 3f              ldi16	r5, 0x3f08
 c6 4c 01              ldi16	r6, 0x14c
 f0 6b 8c              st32	[r6], q2
 c5 0c 3f              ldi16	r5, 0x3f0c
 c6 50 01              ldi16	r6, 0x150
 f0 6b 8c              st32	[r6], q2
 c5 10 3f              ldi16	r5, 0x3f10
 c6 54 01              ldi16	r6, 0x154
 f0 6b 8c              st32	[r6], q2
 c5 14 3f              ldi16	r5, 0x3f14
 c6 58 01              ldi16	r6, 0x158
 f0 6b 8c              st32	[r6], q2
 c5 18 3f              ldi16	r5, 0x3f18
 c6 5c 01              ldi16	r6, 0x15c
 f0 6b 8c              st32	[r6], q2
 c5 1c 3f              ldi16	r5, 0x3f1c
 c6 60 01              ldi16	r6, 0x160
 f0 6b 8c              st32	[r6], q2
 c5 20 3f              ldi16	r5, 0x3f20
 c6 64 01              ldi16	r6, 0x164
 f0 6b 8c              st32	[r6], q2
 c5 24 3f              ldi16	r5, 0x3f24
 c6 68 01              ldi16	r6, 0x168
 f0 6b 8c              st32	[r6], q2
 c5 28 3f              ldi16	r5, 0x3f28
 c6 6c 01              ldi16	r6, 0x16c
 f0 6b 8c              st32	[r6], q2
 c5 2c 3f              ldi16	r5, 0x3f2c
 c6 70 01              ldi16	r6, 0x170
 f0 6b 8c              st32	[r6], q2
 c5 30 3f              ldi16	r5, 0x3f30
 c6 74 01              ldi16	r6, 0x174
 f0 6b 8c              st32	[r6], q2
 c5 34 3f              ldi16	r5, 0x3f34
 c6 78 01              ldi16	r6, 0x178
 f0 6b 8c              st32	[r6], q2
 c5 38 3f              ldi16	r5, 0x3f38
 c6 7c 01              ldi16	r6, 0x17c
 f0 6b 8c              st32	[r6], q2
 c5 3c 3f              ldi16	r5, 0x3f3c
 c6 80 01              ldi16	r6, 0x180
 f0 6b 8c              st32	[r6], q2
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 af                    xor	r7, r7
 d7 01                 sys	debug_break
 c2 80                 ldi8	r6, 0x80
<L0>:
 03                    mov	r4, r7
 f2 22                 add	r4, r2
 f0 6a 88              ld32	q2, [r4]
 ff ca 0d 00 00 80 be 00 00 00 3e 00 00 80 be 00 00 00 3e 00 00 80 be 00 00 00 3e 00 00 80 be 00 00 00 3e 00 00 80 be 00 00 00 3e 00 00 80 be 00 00 00 3e 00 00 80 be  fpoly	13, -0.25, 0.125, -0.25, 0.125, -0.25, 0.125, -0.25, 0.125, -0.25, 0.125, -0.25, 0.125, -0.25
 ff 02                 fadd	q0, q2
 cb 04                 addi.s8	r7, 0x4
 3e                    cmp	r7, r6
 d1 bc                 brne8	-0x44 <L0>
 c4 00 01              ldi16	r4, 0x100
 f0 6b 08              st32	[r4], q0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
