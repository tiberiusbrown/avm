
math_exp2.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000222 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 math_exp2.c
000003d5 l     O .rodata	00000040 inputs
00000100 l     O .data	00000004 result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 ef_exp2.c
00000000 l    df *ABS*	00000000 stdlib.c
00000000 l    df *ABS*	00000000 avm.c
00000000 l    df *ABS*	00000000 ctype.c
00000000 l    df *ABS*	00000000 strtof.c
00000000 l    df *ABS*	00000000 integer.c
00000000 l    df *ABS*	00000000 wide_integer.c
00000415 l       .init_array	00000000 .hidden __init_array_end
00000415 l       .init_array	00000000 .hidden __init_array_start
00000415 l       .fini_array	00000000 .hidden __fini_array_start
00000415 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000022 _start
00000266 g     F .text	00000035 avm_test_main
0000029d g     F .text	00000065 __avm_terminate
0000029b g     F .text	00000002 avm_halt
00000302 g     F .text	000000d3 exp2f
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000104 g     O .data	00000002 __avm_errno

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d5 1a                 call8	avm_run_constructors
 d5 5c                 call8	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 e1 87 00              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 d5 79                 call8	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 15 04              ldi16	r4, 0x415
 c1 00                 ldi8	r5, 0x0
 c6 15 04              ldi16	r6, 0x415
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 15 04           ldi16	r0, 0x415
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 15 04           ldi16	r2, 0x415
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
 f0 06 d5 03           ldi16	r2, 0x3d5
 f0 03 00              ldi8	r3, 0x0
<L0>:
 f1 20                 mov	r4, r0
 f9 84                 and	r4, r1
 10                    add	r4, r4
 10                    add	r4, r4
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 64 88              ldp32	q2, [q2]
 d5 7c                 call8	exp2f
 c6 00 01              ldi16	r6, 0x100
 f0 6b 8c              st32	[r6], q2
 f4 a8                 inc16	r0
 f0 0c 20              cmpi.s8	r0, 0x20
 d1 e5                 brne8	-0x1b <L0>
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
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
 e1 4e fd              call16	-690 <__avm_run_local_dtors>
<L0>:
 c4 15 04              ldi16	r4, 0x415
 c1 00                 ldi8	r5, 0x0
 c6 15 04              ldi16	r6, 0x415
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 15 04           ldi16	r2, 0x415
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 15 04           ldi16	r0, 0x415
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
 e1 05 fd              call16	-763 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<exp2f>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f0 06 80 7f           ldi16	r2, 0x7f80
 f5 2e                 cmp	r7, r2
 d8 7a                 bruge8	0x7a <L2>
 09                    mov	r6, r5
 c7 00 43              ldi16	r7, 0x4300
 3b                    cmp	r6, r7
 df 92 00              brsge16	0x92 <L3>
 c7 16 c3              ldi16	r7, 0xc316
 3b                    cmp	r6, r7
 dd 97 00              bruge16	0x97 <L4>
 c6 00 80              ldi16	r6, 0x8000
 89                    and	r6, r5
 f2 30                 sub	r0, r0
 c7 00 3f              ldi16	r7, 0x3f00
 f0 05 00 bf           ldi16	r1, 0xbf00
 f5 28                 cmp	r6, r0
 fb 79                 cmov.ne	r7, r1
 aa                    xor	r6, r6
 f2 62                 mov32	q0, q2
 ff 00                 fadd
 ff 0e                 ftos16
 f4 40                 stsp16	[sp+0x0], r4
 ff 0c                 s16tof
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 01                 fsub
 ff 15 05 66 01 1d 3c 23 fe 64 3d bc 01 76 3e 96 70 31 3f 00 00 80 3f  fpoly	5, 0.00958285294, 0.0559064262, 0.240240991, 0.693124175, 1.0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 01                 ldsp16	r5, [sp+0x0]
 cd 83                 cmpi.s8	r5, -0x7d
 d3 07                 brslt8	0x7 <L0>
 fa 47                 lsl16i	r5, 0x7
 a0                    xor	r4, r4
 f7 6b                 add32	q2, q3
 d4 1d                 jmp8	0x1d <L1>
<L0>:
 fa 47                 lsl16i	r5, 0x7
 c4 00 32              ldi16	r4, 0x3200
 11                    add	r4, r5
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f7 6b                 add32	q2, q3
 aa                    xor	r6, r6
 c7 80 0d              ldi16	r7, 0xd80
 ff 02                 fmul
 09                    mov	r6, r5
 f9 c8                 and	r6, r2
 c7 80 80              ldi16	r7, 0x8080
 1e                    add	r7, r6
 c6 ff 80              ldi16	r6, 0x80ff
 3b                    cmp	r6, r7
 d8 42                 bruge8	0x42 <L6>
<L1>:
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret
<L2>:
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 c0              cmp32	q3, q0
 d1 2b                 brne8	0x2b <L5>
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c8              cmp32	q3, q2
 fd 04                 cmov.slt	r0, r4
 fd 0d                 cmov.slt	r1, r5
 f2 68                 mov32	q2, q0
 d4 da                 jmp8	-0x26 <L1>
<L3>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 04 01           stm16	[0x104], r4
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 d4 ce                 jmp8	-0x32 <L1>
<L4>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 04 01           stm16	[0x104], r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d4 c4                 jmp8	-0x3c <L1>
<L5>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 d4 be                 jmp8	-0x42 <L1>
<L6>:
 c2 22                 ldi8	r6, 0x22
 f0 5e 04 01           stm16	[0x104], r6
 d4 b6                 jmp8	-0x4a <L1>
