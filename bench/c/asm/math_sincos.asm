
math_sincos.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000323 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 math_sincos.c
00000100 l     O .data	00000080 inputs
00000180 l     O .data	00000100 results
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 sf_sincos.c
00000000 l    df *ABS*	00000000 stdlib.c
00000000 l    df *ABS*	00000000 avm.c
00000000 l    df *ABS*	00000000 ctype.c
00000000 l    df *ABS*	00000000 strtof.c
00000000 l    df *ABS*	00000000 integer.c
00000000 l    df *ABS*	00000000 wide_integer.c
000005d7 l       .init_array	00000000 .hidden __init_array_end
000005d7 l       .init_array	00000000 .hidden __init_array_start
000005d7 l       .fini_array	00000000 .hidden __fini_array_start
000005d7 l       .fini_array	00000000 .hidden __fini_array_end
00000300 g     F .text	00000023 _start
00000367 g     F .text	00000167 avm_test_main
000004d0 g     F .text	00000065 __avm_terminate
000004ce g     F .text	00000002 avm_halt
00000535 g     F .text	000000a2 sincosf
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000280 g     O .data	00000002 __avm_errno

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
 e1 ba 01              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 ab 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 d7 05              ldi16	r4, 0x5d7
 c1 00                 ldi8	r5, 0x0
 c6 d7 05              ldi16	r6, 0x5d7
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 d7 05           ldi16	r0, 0x5d7
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 d7 05           ldi16	r2, 0x5d7
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
 c5 a0 c0              ldi16	r5, 0xc0a0
 f0 04 00 01           ldi16	r0, 0x100
 f0 6b 80              st32	[r0], q2
 c5 96 c0              ldi16	r5, 0xc096
 c6 04 01              ldi16	r6, 0x104
 f0 6b 8c              st32	[r6], q2
 c5 8c c0              ldi16	r5, 0xc08c
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 c5 82 c0              ldi16	r5, 0xc082
 c6 0c 01              ldi16	r6, 0x10c
 f0 6b 8c              st32	[r6], q2
 c5 70 c0              ldi16	r5, 0xc070
 c6 10 01              ldi16	r6, 0x110
 f0 6b 8c              st32	[r6], q2
 c5 5c c0              ldi16	r5, 0xc05c
 c6 14 01              ldi16	r6, 0x114
 f0 6b 8c              st32	[r6], q2
 c5 48 c0              ldi16	r5, 0xc048
 c6 18 01              ldi16	r6, 0x118
 f0 6b 8c              st32	[r6], q2
 c5 34 c0              ldi16	r5, 0xc034
 c6 1c 01              ldi16	r6, 0x11c
 f0 6b 8c              st32	[r6], q2
 c5 20 c0              ldi16	r5, 0xc020
 c6 20 01              ldi16	r6, 0x120
 f0 6b 8c              st32	[r6], q2
 c5 0c c0              ldi16	r5, 0xc00c
 c6 24 01              ldi16	r6, 0x124
 f0 6b 8c              st32	[r6], q2
 c5 f0 bf              ldi16	r5, 0xbff0
 c6 28 01              ldi16	r6, 0x128
 f0 6b 8c              st32	[r6], q2
 c5 c8 bf              ldi16	r5, 0xbfc8
 c6 2c 01              ldi16	r6, 0x12c
 f0 6b 8c              st32	[r6], q2
 c5 a0 bf              ldi16	r5, 0xbfa0
 c6 30 01              ldi16	r6, 0x130
 f0 6b 8c              st32	[r6], q2
 c5 70 bf              ldi16	r5, 0xbf70
 c6 34 01              ldi16	r6, 0x134
 f0 6b 8c              st32	[r6], q2
 c5 20 bf              ldi16	r5, 0xbf20
 c6 38 01              ldi16	r6, 0x138
 f0 6b 8c              st32	[r6], q2
 c5 a0 be              ldi16	r5, 0xbea0
 c6 3c 01              ldi16	r6, 0x13c
 f0 6b 8c              st32	[r6], q2
 a5                    xor	r5, r5
 c6 40 01              ldi16	r6, 0x140
 f0 6b 8c              st32	[r6], q2
 c5 a0 3e              ldi16	r5, 0x3ea0
 c6 44 01              ldi16	r6, 0x144
 f0 6b 8c              st32	[r6], q2
 c5 20 3f              ldi16	r5, 0x3f20
 c6 48 01              ldi16	r6, 0x148
 f0 6b 8c              st32	[r6], q2
 c5 70 3f              ldi16	r5, 0x3f70
 c6 4c 01              ldi16	r6, 0x14c
 f0 6b 8c              st32	[r6], q2
 c5 a0 3f              ldi16	r5, 0x3fa0
 c6 50 01              ldi16	r6, 0x150
 f0 6b 8c              st32	[r6], q2
 c5 c8 3f              ldi16	r5, 0x3fc8
 c6 54 01              ldi16	r6, 0x154
 f0 6b 8c              st32	[r6], q2
 c5 f0 3f              ldi16	r5, 0x3ff0
 c6 58 01              ldi16	r6, 0x158
 f0 6b 8c              st32	[r6], q2
 c5 0c 40              ldi16	r5, 0x400c
 c6 5c 01              ldi16	r6, 0x15c
 f0 6b 8c              st32	[r6], q2
 c5 20 40              ldi16	r5, 0x4020
 c6 60 01              ldi16	r6, 0x160
 f0 6b 8c              st32	[r6], q2
 c5 34 40              ldi16	r5, 0x4034
 c6 64 01              ldi16	r6, 0x164
 f0 6b 8c              st32	[r6], q2
 c5 48 40              ldi16	r5, 0x4048
 c6 68 01              ldi16	r6, 0x168
 f0 6b 8c              st32	[r6], q2
 c5 5c 40              ldi16	r5, 0x405c
 c6 6c 01              ldi16	r6, 0x16c
 f0 6b 8c              st32	[r6], q2
 c5 70 40              ldi16	r5, 0x4070
 c6 70 01              ldi16	r6, 0x170
 f0 6b 8c              st32	[r6], q2
 c5 82 40              ldi16	r5, 0x4082
 c6 74 01              ldi16	r6, 0x174
 f0 6b 8c              st32	[r6], q2
 c5 8c 40              ldi16	r5, 0x408c
 c6 78 01              ldi16	r6, 0x178
 f0 6b 8c              st32	[r6], q2
 c5 96 40              ldi16	r5, 0x4096
 c6 7c 01              ldi16	r6, 0x17c
 f0 6b 8c              st32	[r6], q2
 f2 39                 sub	r1, r1
 f0 06 84 01           ldi16	r2, 0x184
 d7 01                 sys	debug_break
 f0 03 80              ldi8	r3, 0x80
<L0>:
 f1 21                 mov	r4, r1
 f2 20                 add	r4, r0
 f0 6a 88              ld32	q2, [r4]
 f0 16 04              leasp	r6, 0x4
 f0 17 00              leasp	r7, 0x0
 e1 8d 00              call16	sincosf
 f1 22                 mov	r4, r2
 c8 fc                 addi.s8	r4, -0x4
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 6b c8              st32	[r4], q3
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 6b 84              st32	[r2], q2
 f0 0a 08              addi.s8	r2, 0x8
 f0 09 04              addi.s8	r1, 0x4
 f5 0b                 cmp	r1, r3
 d1 d4                 brne8	-0x2c <L0>
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
 e1 1b fb              call16	-1253 <__avm_run_local_dtors>
<L0>:
 c4 d7 05              ldi16	r4, 0x5d7
 c1 00                 ldi8	r5, 0x0
 c6 d7 05              ldi16	r6, 0x5d7
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 d7 05           ldi16	r2, 0x5d7
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 d7 05           ldi16	r0, 0x5d7
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
 e1 d2 fa              call16	-1326 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<sincosf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f4 63                 stsp16	[sp+0x8], r7
 f4 5a                 stsp16	[sp+0x6], r6
 09                    mov	r6, r5
 c7 ff 7f              ldi16	r7, 0x7fff
 8e                    and	r7, r6
 c6 80 7f              ldi16	r6, 0x7f80
 3e                    cmp	r7, r6
 d0 7f                 breq8	0x7f <L1>
<L0>:
 ff 1d                 frempio2
 f2 62                 mov32	q0, q2
 c0 02                 ldi8	r4, 0x2
 82                    and	r4, r6
 f4 68                 stsp16	[sp+0xa], r4
 c0 01                 ldi8	r4, 0x1
 82                    and	r4, r6
 f4 50                 stsp16	[sp+0x4], r4
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 ff 16 03 70 8e 05 3c b1 9f 2a be e8 ff 7f 3f  fpoly	3, 0.00815163552, -0.166624799, 0.999998569
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 ff 16 04 bf 12 b2 ba 76 9e 2a 3d d0 ff ff be 00 00 80 3f      fpoly	4, -0.0013585909, 0.0416550264, -0.499998569, 1.0
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 13                 ldsp16	r7, [sp+0x4]
 f4 a7                 tst8	r7
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 f2 66                 mov32	q1, q2
 ff 05                 fneg	q1
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 a6                 tst8	r6
 fb 14                 cmov.eq	r2, r4
 fb 1d                 cmov.eq	r3, r5
 f4 1a                 ldsp16	r6, [sp+0x6]
 f0 6b 4c              st32	[r6], q1
 ff 04                 fneg	q0
 f4 a7                 tst8	r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 fb 04                 cmov.eq	r0, r4
 fb 0d                 cmov.eq	r1, r5
 f2 68                 mov32	q2, q0
 ff 06                 fneg	q2
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 a6                 tst8	r6
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 f4 22                 ldsp16	r6, [sp+0x8]
 f0 6b 8c              st32	[r6], q2
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L1>:
 f6 2c                 tst16	r4
 db 7c ff              brne16	-0x84 <L0>
 c2 21                 ldi8	r6, 0x21
 f0 5e 80 02           stm16	[0x280], r6
 e0 73 ff              jmp16	-141 <L0>
