
math_classify_fpclassify_normal.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 math_classify_fpclassify_normal.c
00000335 l     O .rodata	00000040 inputs
0000029a l     F .text	00000034 classify
00000100 l     O .data	00000002 integer_result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000375 l       .init_array	00000000 .hidden __init_array_end
00000375 l       .init_array	00000000 .hidden __init_array_start
00000375 l       .fini_array	00000000 .hidden __fini_array_start
00000375 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	00000033 avm_test_main
000002d0 g     F .text	00000065 __avm_terminate
000002ce g     F .text	00000002 avm_halt
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
 e1 ba 00              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 ab 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 75 03              ldi16	r4, 0x375
 c1 00                 ldi8	r5, 0x0
 c6 75 03              ldi16	r6, 0x375
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 75 03           ldi16	r0, 0x375
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 75 03           ldi16	r2, 0x375
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
 f2 30                 sub	r0, r0
 d7 01                 sys	debug_break
 f0 01 0f              ldi8	r1, 0xf
 f0 06 35 03           ldi16	r2, 0x335
 f0 03 00              ldi8	r3, 0x0
<L0>:
 f1 20                 mov	r4, r0
 f9 84                 and	r4, r1
 10                    add	r4, r4
 10                    add	r4, r4
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 64 88              ldp32	q2, [q2]
 d5 13                 call8	classify
 f0 5c 00 01           stm16	[0x100], r4
 f4 a8                 inc16	r0
 f0 0c 20              cmpi.s8	r0, 0x20
 d1 e7                 brne8	-0x19 <L0>
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<classify>:
 09                    mov	r6, r5
 1a                    add	r6, r6
 98                    or	r6, r4
 f6 2e                 tst16	r6
 d1 03                 brne8	0x3 <L0>
 c0 02                 ldi8	r4, 0x2
 ef                    ret
<L0>:
 08                    mov	r6, r4
 f7 8e                 bool	r6
 0d                    mov	r7, r5
 1f                    add	r7, r7
 9e                    or	r7, r6
 c6 00 ff              ldi16	r6, 0xff00
 3b                    cmp	r6, r7
 d2 1c                 brult8	0x1c <L2>
 0d                    mov	r7, r5
 1f                    add	r7, r7
 ae                    xor	r7, r6
 08                    mov	r6, r4
 9b                    or	r6, r7
 f6 2e                 tst16	r6
 d1 03                 brne8	0x3 <L1>
 c0 01                 ldi8	r4, 0x1
 ef                    ret
<L1>:
 ff 0a                 fabs	q2
 aa                    xor	r6, r6
 c3 80                 ldi8	r7, 0x80
 ff 14                 fcmp
 c0 03                 ldi8	r4, 0x3
 c1 04                 ldi8	r5, 0x4
 ce ff                 cmpi.s8	r6, -0x1
 fb 65                 cmov.ne	r4, r5
 ef                    ret
<L2>:
 a0                    xor	r4, r4
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
 e1 1b fd              call16	-741 <__avm_run_local_dtors>
<L0>:
 c4 75 03              ldi16	r4, 0x375
 c1 00                 ldi8	r5, 0x0
 c6 75 03              ldi16	r6, 0x375
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 75 03           ldi16	r2, 0x375
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 75 03           ldi16	r0, 0x375
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
 e1 d2 fc              call16	-814 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
