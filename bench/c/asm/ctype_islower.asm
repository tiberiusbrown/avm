
ctype_islower.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 ctype_islower.c
00000100 l     O .data	00000003 call
00000103 l     O .data	00000002 ctype_bench_result
00000000 l    df *ABS*	00000000 ctype.c
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
000003b1 l       .init_array	00000000 .hidden __init_array_end
000003b1 l       .init_array	00000000 .hidden __init_array_start
000003b1 l       .fini_array	00000000 .hidden __fini_array_start
000003b1 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	000000dc avm_test_main
0000034c g     F .text	00000065 __avm_terminate
0000034a g     F .text	00000002 avm_halt
00000343 g     F .text	00000007 islower
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
 e1 36 01              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 27 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 b1 03              ldi16	r4, 0x3b1
 c1 00                 ldi8	r5, 0x0
 c6 b1 03              ldi16	r6, 0x3b1
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 b1 03           ldi16	r0, 0x3b1
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 b1 03           ldi16	r2, 0x3b1
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
 f2 39                 sub	r1, r1
 f0 04 ff ff           ldi16	r0, 0xffff
 d7 01                 sys	debug_break
 f0 06 00 01           ldi16	r2, 0x100
 f0 07 00 01           ldi16	r3, 0x100
<L0>:
 f1 22                 mov	r4, r2
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f1 20                 mov	r4, r0
 eb                    callp	q3
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 f2 0c                 add	r1, r4
 f4 a8                 inc16	r0
 f5 03                 cmp	r0, r3
 d1 ec                 brne8	-0x14 <L0>
 f0 04 ff ff           ldi16	r0, 0xffff
<L1>:
 f1 22                 mov	r4, r2
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f1 20                 mov	r4, r0
 eb                    callp	q3
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 f2 0c                 add	r1, r4
 f4 a8                 inc16	r0
 f5 03                 cmp	r0, r3
 d1 ec                 brne8	-0x14 <L1>
 f0 04 ff ff           ldi16	r0, 0xffff
<L2>:
 f1 22                 mov	r4, r2
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f1 20                 mov	r4, r0
 eb                    callp	q3
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 f2 0c                 add	r1, r4
 f4 a8                 inc16	r0
 f5 03                 cmp	r0, r3
 d1 ec                 brne8	-0x14 <L2>
 f0 04 ff ff           ldi16	r0, 0xffff
<L3>:
 f1 22                 mov	r4, r2
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f1 20                 mov	r4, r0
 eb                    callp	q3
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 f2 0c                 add	r1, r4
 f4 a8                 inc16	r0
 f5 03                 cmp	r0, r3
 d1 ec                 brne8	-0x14 <L3>
 f0 04 ff ff           ldi16	r0, 0xffff
<L4>:
 f1 22                 mov	r4, r2
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f1 20                 mov	r4, r0
 eb                    callp	q3
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 f2 0c                 add	r1, r4
 f4 a8                 inc16	r0
 f5 03                 cmp	r0, r3
 d1 ec                 brne8	-0x14 <L4>
 f0 04 ff ff           ldi16	r0, 0xffff
<L5>:
 f1 22                 mov	r4, r2
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f1 20                 mov	r4, r0
 eb                    callp	q3
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 f2 0c                 add	r1, r4
 f4 a8                 inc16	r0
 f5 03                 cmp	r0, r3
 d1 ec                 brne8	-0x14 <L5>
 f0 04 ff ff           ldi16	r0, 0xffff
<L6>:
 f1 22                 mov	r4, r2
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f1 20                 mov	r4, r0
 eb                    callp	q3
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 f2 0c                 add	r1, r4
 f4 a8                 inc16	r0
 f5 03                 cmp	r0, r3
 d1 ec                 brne8	-0x14 <L6>
 f0 04 ff ff           ldi16	r0, 0xffff
<L7>:
 f1 22                 mov	r4, r2
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f1 20                 mov	r4, r0
 eb                    callp	q3
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 f2 0c                 add	r1, r4
 f4 a8                 inc16	r0
 f5 03                 cmp	r0, r3
 d1 ec                 brne8	-0x14 <L7>
 f0 59 03 01           stm16	[0x103], r1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<islower>:
 c8 9f                 addi.s8	r4, -0x61
 cc 1a                 cmpi.s8	r4, 0x1a
 f8 14                 cset.ult	r4
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
 e1 9f fc              call16	-865 <__avm_run_local_dtors>
<L0>:
 c4 b1 03              ldi16	r4, 0x3b1
 c1 00                 ldi8	r5, 0x0
 c6 b1 03              ldi16	r6, 0x3b1
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 b1 03           ldi16	r2, 0x3b1
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 b1 03           ldi16	r0, 0x3b1
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
 e1 56 fc              call16	-938 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
