
sys_strlen.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000031e l     F .text	00000044 avm_run_constructors
00000362 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 sys_strlen.c
00000103 l     O .data	00000009 length8
0000010c l     O .data	00000021 length32
00000101 l     O .data	00000002 length1
00000100 l     O .data	00000001 length0
0000012d l     O .data	00000101 length256
0000022e l     O .data	00000002 benchmark_result
00000000 l    df *ABS*	00000000 runtime.c
00000467 l       .init_array	00000000 .hidden __init_array_end
00000467 l       .init_array	00000000 .hidden __init_array_start
00000467 l       .fini_array	00000000 .hidden __fini_array_start
00000467 l       .fini_array	00000000 .hidden __fini_array_end
00000300 g     F .text	0000001e _start
000003c7 g     F .text	0000009e avm_test_main
00000465 g     F .text	00000002 avm_halt
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
 e1 47 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 67 04              ldi16	r4, 0x467
 c1 00                 ldi8	r5, 0x0
 c6 67 04              ldi16	r6, 0x467
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 67 04           ldi16	r0, 0x467
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 67 04           ldi16	r2, 0x467
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
 e1 89 fc              call16	-887 <__avm_run_local_dtors>
<L0>:
 c4 67 04              ldi16	r4, 0x467
 c1 00                 ldi8	r5, 0x0
 c6 67 04              ldi16	r6, 0x467
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 67 04           ldi16	r2, 0x467
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 67 04           ldi16	r0, 0x467
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
 e1 40 fc              call16	-960 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_test_main>:
 b1                    push16	r1
 b0                    push16	r0
 c4 63 63              ldi16	r4, 0x6363
 c5 63 63              ldi16	r5, 0x6363
 c6 07 01              ldi16	r6, 0x107
 f0 6b 8c              st32	[r6], q2
 f0 04 03 01           ldi16	r0, 0x103
 f0 6b 80              st32	[r0], q2
 c4 64 64              ldi16	r4, 0x6464
 c5 64 64              ldi16	r5, 0x6464
 c6 28 01              ldi16	r6, 0x128
 f0 6b 8c              st32	[r6], q2
 c6 24 01              ldi16	r6, 0x124
 f0 6b 8c              st32	[r6], q2
 c6 20 01              ldi16	r6, 0x120
 f0 6b 8c              st32	[r6], q2
 c6 1c 01              ldi16	r6, 0x11c
 f0 6b 8c              st32	[r6], q2
 c6 18 01              ldi16	r6, 0x118
 f0 6b 8c              st32	[r6], q2
 c6 14 01              ldi16	r6, 0x114
 f0 6b 8c              st32	[r6], q2
 c6 10 01              ldi16	r6, 0x110
 f0 6b 8c              st32	[r6], q2
 f0 05 0c 01           ldi16	r1, 0x10c
 f0 6b 82              st32	[r1], q2
 c0 62                 ldi8	r4, 0x62
 f0 5c 01 01           stm16	[0x101], r4
 a5                    xor	r5, r5
 f0 4d 00 01           stm8	[0x100], r5
 f0 4d 0b 01           stm8	[0x10b], r5
 f0 4d 2c 01           stm8	[0x12c], r5
 c4 00 01              ldi16	r4, 0x100
 c6 2d 01              ldi16	r6, 0x12d
 c3 65                 ldi8	r7, 0x65
<L0>:
 f6 17                 st8	[r6+], r7
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f8                 brne8	-0x8 <L0>
 f0 4d 2d 02           stm8	[0x22d], r5
 d7 01                 sys	debug_break
 c4 00 01              ldi16	r4, 0x100
 d7 1a                 sys	strlen
 08                    mov	r6, r4
 c4 01 01              ldi16	r4, 0x101
 d7 1a                 sys	strlen
 0c                    mov	r7, r4
 1e                    add	r7, r6
 f1 20                 mov	r4, r0
 d7 1a                 sys	strlen
 08                    mov	r6, r4
 1b                    add	r6, r7
 f1 21                 mov	r4, r1
 d7 1a                 sys	strlen
 0c                    mov	r7, r4
 1e                    add	r7, r6
 c4 2d 01              ldi16	r4, 0x12d
 d7 1a                 sys	strlen
 13                    add	r4, r7
 f0 5c 2e 02           stm16	[0x22e], r4
 d7 01                 sys	debug_break
 01                    mov	r4, r5
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
