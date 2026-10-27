
sys_strlen.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000323 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 sys_strlen.c
00000100 l     O .data	00000101 length256
00000201 l     O .data	00000001 length0
00000202 l     O .data	00000002 length1
00000204 l     O .data	00000002 benchmark_result
00000206 l     O .data	00000009 length8
0000020f l     O .data	00000021 length32
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000470 l       .init_array	00000000 .hidden __init_array_end
00000470 l       .init_array	00000000 .hidden __init_array_start
00000470 l       .fini_array	00000000 .hidden __fini_array_start
00000470 l       .fini_array	00000000 .hidden __fini_array_end
00000300 g     F .text	00000023 _start
00000367 g     F .text	000000a2 avm_test_main
0000040b g     F .text	00000065 __avm_terminate
00000409 g     F .text	00000002 avm_halt
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
 e1 f5 00              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 e6 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 70 04              ldi16	r4, 0x470
 c1 00                 ldi8	r5, 0x0
 c6 70 04              ldi16	r6, 0x470
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 70 04           ldi16	r0, 0x470
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 70 04           ldi16	r2, 0x470
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
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c4 64 64              ldi16	r4, 0x6464
 c5 64 64              ldi16	r5, 0x6464
 c6 2a 02              ldi16	r6, 0x22a
 f0 6b 8c              st32	[r6], q2
 c6 26 02              ldi16	r6, 0x226
 f0 6b 8c              st32	[r6], q2
 c6 22 02              ldi16	r6, 0x222
 f0 6b 8c              st32	[r6], q2
 c6 1e 02              ldi16	r6, 0x21e
 f0 6b 8c              st32	[r6], q2
 c6 1a 02              ldi16	r6, 0x21a
 f0 6b 8c              st32	[r6], q2
 c6 16 02              ldi16	r6, 0x216
 f0 6b 8c              st32	[r6], q2
 c6 12 02              ldi16	r6, 0x212
 f0 6b 8c              st32	[r6], q2
 c4 00 64              ldi16	r4, 0x6400
 c6 0e 02              ldi16	r6, 0x20e
 f0 6b 8c              st32	[r6], q2
 c4 63 63              ldi16	r4, 0x6363
 c5 63 63              ldi16	r5, 0x6363
 c6 0a 02              ldi16	r6, 0x20a
 f0 6b 8c              st32	[r6], q2
 f0 06 06 02           ldi16	r2, 0x206
 f0 6b 84              st32	[r2], q2
 f0 04 00 62           ldi16	r0, 0x6200
 f2 39                 sub	r1, r1
 c4 01 02              ldi16	r4, 0x201
 04                    mov	r5, r4
 f7 48                 st16	[r5+], r0
 f3 05                 st8	[r5], r1
 c1 64                 ldi8	r5, 0x64
 f0 5d 2e 02           stm16	[0x22e], r5
 c5 00 01              ldi16	r5, 0x100
 c7 00 01              ldi16	r7, 0x100
 c2 65                 ldi8	r6, 0x65
<L0>:
 f6 1e                 st8	[r7+], r6
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f8                 brne8	-0x8 <L0>
 a5                    xor	r5, r5
 f0 4d 00 02           stm8	[0x200], r5
 d7 01                 sys	debug_break
 d7 1a                 sys	strlen
 08                    mov	r6, r4
 c4 02 02              ldi16	r4, 0x202
 d7 1a                 sys	strlen
 0c                    mov	r7, r4
 1e                    add	r7, r6
 f1 22                 mov	r4, r2
 d7 1a                 sys	strlen
 08                    mov	r6, r4
 1b                    add	r6, r7
 c4 0f 02              ldi16	r4, 0x20f
 d7 1a                 sys	strlen
 0c                    mov	r7, r4
 1e                    add	r7, r6
 c4 00 01              ldi16	r4, 0x100
 d7 1a                 sys	strlen
 13                    add	r4, r7
 f0 5c 04 02           stm16	[0x204], r4
 d7 01                 sys	debug_break
 01                    mov	r4, r5
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
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
 e1 e0 fb              call16	-1056 <__avm_run_local_dtors>
<L0>:
 c4 70 04              ldi16	r4, 0x470
 c1 00                 ldi8	r5, 0x0
 c6 70 04              ldi16	r6, 0x470
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 70 04           ldi16	r2, 0x470
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 70 04           ldi16	r0, 0x470
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
 e1 97 fb              call16	-1129 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
