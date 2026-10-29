
math_trig_polynomials.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 math_trig_polynomials.c
00000100 l     O .data	00000004 result
00000104 l     O .data	00000080 inputs
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
0000046b l       .init_array	00000000 .hidden __init_array_end
0000046b l       .init_array	00000000 .hidden __init_array_start
0000046b l       .fini_array	00000000 .hidden __fini_array_start
0000046b l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	0000019d avm_test_main
00000406 g     F .text	00000065 __avm_terminate
00000404 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d5 1b                 call8	avm_run_constructors
 d5 5d                 call8	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 e1 f0 01              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 e1 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 6b 04              ldi16	r4, 0x46b
 c1 00                 ldi8	r5, 0x0
 c6 6b 04              ldi16	r6, 0x46b
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 6b 04           ldi16	r0, 0x46b
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 6b 04           ldi16	r2, 0x46b
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

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 a0                    xor	r4, r4
 c5 40 bf              ldi16	r5, 0xbf40
 c6 04 01              ldi16	r6, 0x104
 f0 6b 8c              st32	[r6], q2
 c5 34 bf              ldi16	r5, 0xbf34
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 c5 28 bf              ldi16	r5, 0xbf28
 c6 0c 01              ldi16	r6, 0x10c
 f0 6b 8c              st32	[r6], q2
 c5 1c bf              ldi16	r5, 0xbf1c
 c6 10 01              ldi16	r6, 0x110
 f0 6b 8c              st32	[r6], q2
 c5 10 bf              ldi16	r5, 0xbf10
 c6 14 01              ldi16	r6, 0x114
 f0 6b 8c              st32	[r6], q2
 c5 04 bf              ldi16	r5, 0xbf04
 c6 18 01              ldi16	r6, 0x118
 f0 6b 8c              st32	[r6], q2
 c5 f0 be              ldi16	r5, 0xbef0
 c6 1c 01              ldi16	r6, 0x11c
 f0 6b 8c              st32	[r6], q2
 c5 d8 be              ldi16	r5, 0xbed8
 c6 20 01              ldi16	r6, 0x120
 f0 6b 8c              st32	[r6], q2
 c5 c0 be              ldi16	r5, 0xbec0
 c6 24 01              ldi16	r6, 0x124
 f0 6b 8c              st32	[r6], q2
 c5 a8 be              ldi16	r5, 0xbea8
 c6 28 01              ldi16	r6, 0x128
 f0 6b 8c              st32	[r6], q2
 c5 90 be              ldi16	r5, 0xbe90
 c6 2c 01              ldi16	r6, 0x12c
 f0 6b 8c              st32	[r6], q2
 c5 70 be              ldi16	r5, 0xbe70
 c6 30 01              ldi16	r6, 0x130
 f0 6b 8c              st32	[r6], q2
 c5 40 be              ldi16	r5, 0xbe40
 c6 34 01              ldi16	r6, 0x134
 f0 6b 8c              st32	[r6], q2
 c5 10 be              ldi16	r5, 0xbe10
 c6 38 01              ldi16	r6, 0x138
 f0 6b 8c              st32	[r6], q2
 c5 c0 bd              ldi16	r5, 0xbdc0
 c6 3c 01              ldi16	r6, 0x13c
 f0 6b 8c              st32	[r6], q2
 c5 40 bd              ldi16	r5, 0xbd40
 c6 40 01              ldi16	r6, 0x140
 f0 6b 8c              st32	[r6], q2
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 c4 44 01              ldi16	r4, 0x144
 f0 6b 08              st32	[r4], q0
 a0                    xor	r4, r4
 c5 40 3d              ldi16	r5, 0x3d40
 c6 48 01              ldi16	r6, 0x148
 f0 6b 8c              st32	[r6], q2
 c5 c0 3d              ldi16	r5, 0x3dc0
 c6 4c 01              ldi16	r6, 0x14c
 f0 6b 8c              st32	[r6], q2
 c5 10 3e              ldi16	r5, 0x3e10
 c6 50 01              ldi16	r6, 0x150
 f0 6b 8c              st32	[r6], q2
 c5 40 3e              ldi16	r5, 0x3e40
 c6 54 01              ldi16	r6, 0x154
 f0 6b 8c              st32	[r6], q2
 c5 70 3e              ldi16	r5, 0x3e70
 c6 58 01              ldi16	r6, 0x158
 f0 6b 8c              st32	[r6], q2
 c5 90 3e              ldi16	r5, 0x3e90
 c6 5c 01              ldi16	r6, 0x15c
 f0 6b 8c              st32	[r6], q2
 c5 a8 3e              ldi16	r5, 0x3ea8
 c6 60 01              ldi16	r6, 0x160
 f0 6b 8c              st32	[r6], q2
 c5 c0 3e              ldi16	r5, 0x3ec0
 c6 64 01              ldi16	r6, 0x164
 f0 6b 8c              st32	[r6], q2
 c5 d8 3e              ldi16	r5, 0x3ed8
 c6 68 01              ldi16	r6, 0x168
 f0 6b 8c              st32	[r6], q2
 c5 f0 3e              ldi16	r5, 0x3ef0
 c6 6c 01              ldi16	r6, 0x16c
 f0 6b 8c              st32	[r6], q2
 c5 04 3f              ldi16	r5, 0x3f04
 c6 70 01              ldi16	r6, 0x170
 f0 6b 8c              st32	[r6], q2
 c5 10 3f              ldi16	r5, 0x3f10
 c6 74 01              ldi16	r6, 0x174
 f0 6b 8c              st32	[r6], q2
 c5 1c 3f              ldi16	r5, 0x3f1c
 c6 78 01              ldi16	r6, 0x178
 f0 6b 8c              st32	[r6], q2
 c5 28 3f              ldi16	r5, 0x3f28
 c6 7c 01              ldi16	r6, 0x17c
 f0 6b 8c              st32	[r6], q2
 c5 34 3f              ldi16	r5, 0x3f34
 c6 80 01              ldi16	r6, 0x180
 f0 6b 8c              st32	[r6], q2
 d7 01                 sys	debug_break
 c1 80                 ldi8	r5, 0x80
 f4 41                 stsp16	[sp+0x0], r5
<L0>:
 f0 38 02              stsp16	[sp+0x2], r0
 f0 39 04              stsp16	[sp+0x4], r1
 f4 58                 stsp16	[sp+0x6], r4
 c5 04 01              ldi16	r5, 0x104
 11                    add	r4, r5
 f0 6a c8              ld32	q3, [r4]
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 ff 15 03 70 8e 05 3c b1 9f 2a be e8 ff 7f 3f  fpoly	3, 0.00815163552, -0.166624799, 0.999998569
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 15 04 bf 12 b2 ba 76 9e 2a 3d d0 ff ff be 00 00 80 3f      fpoly	4, -0.0013585909, 0.0416550264, -0.499998569, 1.0
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 18                 ldsp16	r4, [sp+0x6]
 c8 04                 addi.s8	r4, 0x4
 f4 01                 ldsp16	r5, [sp+0x0]
 31                    cmp	r4, r5
 d1 a2                 brne8	-0x5e <L0>
 c4 00 01              ldi16	r4, 0x100
 f0 6b 08              st32	[r4], q0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<__avm_terminate>:
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
 e1 e5 fb              call16	-1051 <__avm_run_local_dtors>
<L0>:
 c4 6b 04              ldi16	r4, 0x46b
 c1 00                 ldi8	r5, 0x0
 c6 6b 04              ldi16	r6, 0x46b
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 6b 04           ldi16	r2, 0x46b
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 6b 04           ldi16	r0, 0x46b
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
 e1 9c fb              call16	-1124 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
