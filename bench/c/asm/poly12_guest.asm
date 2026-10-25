
poly12_guest.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 poly12_guest.c
00000100 l     O .data	00000004 result
00000104 l     O .data	00000080 inputs
00000000 l    df *ABS*	00000000 runtime.c
00000460 l       .init_array	00000000 .hidden __init_array_end
00000460 l       .init_array	00000000 .hidden __init_array_start
00000460 l       .fini_array	00000000 .hidden __fini_array_start
00000460 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000197 avm_test_main
0000045e g     F .text	00000002 avm_halt
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
 e1 40 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 60 04              ldi16	r4, 0x460
 c1 00                 ldi8	r5, 0x0
 c6 60 04              ldi16	r6, 0x460
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 60 04           ldi16	r0, 0x460
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 60 04           ldi16	r2, 0x460
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
 c4 60 04              ldi16	r4, 0x460
 c1 00                 ldi8	r5, 0x0
 c6 60 04              ldi16	r6, 0x460
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 60 04           ldi16	r2, 0x460
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 60 04           ldi16	r0, 0x460
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
 aa                    xor	r6, r6
 c7 80 3e              ldi16	r7, 0x3e80
 c4 04 01              ldi16	r4, 0x104
 f0 6b c8              st32	[r4], q3
 c7 88 3e              ldi16	r7, 0x3e88
 c5 08 01              ldi16	r5, 0x108
 f0 6b ca              st32	[r5], q3
 c7 90 3e              ldi16	r7, 0x3e90
 c5 0c 01              ldi16	r5, 0x10c
 f0 6b ca              st32	[r5], q3
 c7 98 3e              ldi16	r7, 0x3e98
 c5 10 01              ldi16	r5, 0x110
 f0 6b ca              st32	[r5], q3
 c7 a0 3e              ldi16	r7, 0x3ea0
 c5 14 01              ldi16	r5, 0x114
 f0 6b ca              st32	[r5], q3
 c7 a8 3e              ldi16	r7, 0x3ea8
 c5 18 01              ldi16	r5, 0x118
 f0 6b ca              st32	[r5], q3
 c7 b0 3e              ldi16	r7, 0x3eb0
 c5 1c 01              ldi16	r5, 0x11c
 f0 6b ca              st32	[r5], q3
 c7 b8 3e              ldi16	r7, 0x3eb8
 c5 20 01              ldi16	r5, 0x120
 f0 6b ca              st32	[r5], q3
 c7 c0 3e              ldi16	r7, 0x3ec0
 c5 24 01              ldi16	r5, 0x124
 f0 6b ca              st32	[r5], q3
 c7 c8 3e              ldi16	r7, 0x3ec8
 c5 28 01              ldi16	r5, 0x128
 f0 6b ca              st32	[r5], q3
 c7 d0 3e              ldi16	r7, 0x3ed0
 c5 2c 01              ldi16	r5, 0x12c
 f0 6b ca              st32	[r5], q3
 c7 d8 3e              ldi16	r7, 0x3ed8
 c5 30 01              ldi16	r5, 0x130
 f0 6b ca              st32	[r5], q3
 c7 e0 3e              ldi16	r7, 0x3ee0
 c5 34 01              ldi16	r5, 0x134
 f0 6b ca              st32	[r5], q3
 c7 e8 3e              ldi16	r7, 0x3ee8
 c5 38 01              ldi16	r5, 0x138
 f0 6b ca              st32	[r5], q3
 c7 f0 3e              ldi16	r7, 0x3ef0
 c5 3c 01              ldi16	r5, 0x13c
 f0 6b ca              st32	[r5], q3
 c7 f8 3e              ldi16	r7, 0x3ef8
 c5 40 01              ldi16	r5, 0x140
 f0 6b ca              st32	[r5], q3
 c7 00 3f              ldi16	r7, 0x3f00
 c5 44 01              ldi16	r5, 0x144
 f0 6b ca              st32	[r5], q3
 c7 04 3f              ldi16	r7, 0x3f04
 c5 48 01              ldi16	r5, 0x148
 f0 6b ca              st32	[r5], q3
 c7 08 3f              ldi16	r7, 0x3f08
 c5 4c 01              ldi16	r5, 0x14c
 f0 6b ca              st32	[r5], q3
 c7 0c 3f              ldi16	r7, 0x3f0c
 c5 50 01              ldi16	r5, 0x150
 f0 6b ca              st32	[r5], q3
 c7 10 3f              ldi16	r7, 0x3f10
 c5 54 01              ldi16	r5, 0x154
 f0 6b ca              st32	[r5], q3
 c7 14 3f              ldi16	r7, 0x3f14
 c5 58 01              ldi16	r5, 0x158
 f0 6b ca              st32	[r5], q3
 c7 18 3f              ldi16	r7, 0x3f18
 c5 5c 01              ldi16	r5, 0x15c
 f0 6b ca              st32	[r5], q3
 c7 1c 3f              ldi16	r7, 0x3f1c
 c5 60 01              ldi16	r5, 0x160
 f0 6b ca              st32	[r5], q3
 c7 20 3f              ldi16	r7, 0x3f20
 c5 64 01              ldi16	r5, 0x164
 f0 6b ca              st32	[r5], q3
 c7 24 3f              ldi16	r7, 0x3f24
 c5 68 01              ldi16	r5, 0x168
 f0 6b ca              st32	[r5], q3
 c7 28 3f              ldi16	r7, 0x3f28
 c5 6c 01              ldi16	r5, 0x16c
 f0 6b ca              st32	[r5], q3
 c7 2c 3f              ldi16	r7, 0x3f2c
 c5 70 01              ldi16	r5, 0x170
 f0 6b ca              st32	[r5], q3
 c7 30 3f              ldi16	r7, 0x3f30
 c5 74 01              ldi16	r5, 0x174
 f0 6b ca              st32	[r5], q3
 c7 34 3f              ldi16	r7, 0x3f34
 c5 78 01              ldi16	r5, 0x178
 f0 6b ca              st32	[r5], q3
 c7 38 3f              ldi16	r7, 0x3f38
 c5 7c 01              ldi16	r5, 0x17c
 f0 6b ca              st32	[r5], q3
 c7 3c 3f              ldi16	r7, 0x3f3c
 c5 80 01              ldi16	r5, 0x180
 f0 6b ca              st32	[r5], q3
 af                    xor	r7, r7
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
<L0>:
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 50                 stsp16	[sp+0x4], r4
 04                    mov	r5, r4
 c4 04 01              ldi16	r4, 0x104
 14                    add	r5, r4
 f0 6a 0a              ld32	q0, [r5]
 f2 64                 mov32	q1, q0
 a0                    xor	r4, r4
 c5 80 be              ldi16	r5, 0xbe80
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 27                 fmul	q1, q3
 c5 00 3e              ldi16	r5, 0x3e00
 ff 06                 fadd	q1, q2
 ff 24                 fmul	q1, q0
 07                    mov	r5, r7
 ff 06                 fadd	q1, q2
 ff 24                 fmul	q1, q0
 c7 00 3e              ldi16	r7, 0x3e00
 ff 07                 fadd	q1, q3
 ff 24                 fmul	q1, q0
 ff 06                 fadd	q1, q2
 ff 24                 fmul	q1, q0
 ff 07                 fadd	q1, q3
 ff 24                 fmul	q1, q0
 ff 06                 fadd	q1, q2
 ff 24                 fmul	q1, q0
 ff 07                 fadd	q1, q3
 ff 24                 fmul	q1, q0
 ff 06                 fadd	q1, q2
 ff 24                 fmul	q1, q0
 ff 07                 fadd	q1, q3
 ff 24                 fmul	q1, q0
 ff 06                 fadd	q1, q2
 ff 24                 fmul	q1, q0
 ff 07                 fadd	q1, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 24                 fmul	q1, q0
 ff 06                 fadd	q1, q2
 ff 0d                 fadd	q3, q1
 f4 10                 ldsp16	r4, [sp+0x4]
 c8 04                 addi.s8	r4, 0x4
 c1 80                 ldi8	r5, 0x80
 31                    cmp	r4, r5
 d1 a4                 brne8	-0x5c <L0>
 c4 00 01              ldi16	r4, 0x100
 f0 6b c8              st32	[r4], q3
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
