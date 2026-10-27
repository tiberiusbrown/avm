
math_trig_probe_refine_cancel.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 math_trig_probe_refine_cancel.c
00000100 l     O .data	00000020 probe_inputs
00000120 l     O .data	00000020 probe_quotients
00000140 l     O .data	00000004 remainder_result
00000144 l     O .data	00000004 quadrant_result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000373 l       .init_array	00000000 .hidden __init_array_end
00000373 l       .init_array	00000000 .hidden __init_array_start
00000373 l       .fini_array	00000000 .hidden __fini_array_start
00000373 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	000000a5 avm_test_main
0000030e g     F .text	00000065 __avm_terminate
0000030c g     F .text	00000002 avm_halt
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
 e1 f8 00              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 e9 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 73 03              ldi16	r4, 0x373
 c1 00                 ldi8	r5, 0x0
 c6 73 03              ldi16	r6, 0x373
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 73 03           ldi16	r0, 0x373
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 73 03           ldi16	r2, 0x373
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
 d6 f0                 adjsp	-0x10
 a0                    xor	r4, r4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 d7 01                 sys	debug_break
 c1 1c                 ldi8	r5, 0x1c
 f4 41                 stsp16	[sp+0x0], r5
<L0>:
 f0 38 02              stsp16	[sp+0x2], r0
 f0 39 04              stsp16	[sp+0x4], r1
 f4 68                 stsp16	[sp+0xa], r4
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 10                    add	r4, r4
 10                    add	r4, r4
 f4 01                 ldsp16	r5, [sp+0x0]
 81                    and	r4, r5
 04                    mov	r5, r4
 c6 20 01              ldi16	r6, 0x120
 16                    add	r5, r6
 c6 00 01              ldi16	r6, 0x100
 12                    add	r4, r6
 f0 6a 48              ld32	q1, [r4]
 f0 6a 8a              ld32	q2, [r5]
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 ff 0c                 s16tof
 f2 62                 mov32	q0, q2
 c6 80 0f              ldi16	r6, 0xf80
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 09                 fabs	q1
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 c6 00 44              ldi16	r6, 0x4400
 c7 35 b7              ldi16	r7, 0xb735
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 c6 09 a3              ldi16	r6, 0xa309
 c7 85 ae              ldi16	r7, 0xae85
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 ff 00                 fadd
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f2 62                 mov32	q0, q2
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f0 32 06              ldsp16	r2, [sp+0x6]
 f9 88                 and	r4, r2
 f7 6e                 add32	q3, q2
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 ac                 inc16	r4
 cc 20                 cmpi.s8	r4, 0x20
 d1 84                 brne8	-0x7c <L0>
 c4 40 01              ldi16	r4, 0x140
 f0 6b 08              st32	[r4], q0
 c4 44 01              ldi16	r4, 0x144
 f0 6b c8              st32	[r4], q3
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 10                 adjsp	0x10
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
 e1 dd fc              call16	-803 <__avm_run_local_dtors>
<L0>:
 c4 73 03              ldi16	r4, 0x373
 c1 00                 ldi8	r5, 0x0
 c6 73 03              ldi16	r6, 0x373
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 73 03           ldi16	r2, 0x373
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 73 03           ldi16	r0, 0x373
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
 e1 94 fc              call16	-876 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
