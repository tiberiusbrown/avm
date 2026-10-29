
math_tgamma_negative.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000222 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 math_tgamma_negative.c
000009ce l     O .rodata	00000040 inputs
00000100 l     O .data	00000004 result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 ef_gamma.c
00000303 l     F .text	000000c7 avm_gamma_positive_small
000003ca l     F .text	0000008e avm_lgamma_stirling
00000458 l     F .text	00000127 avm_gamma_reflection_small
0000057f l     F .text	000000ad avm_lgamma_reflection_large
00000000 l    df *ABS*	00000000 stdlib.c
00000000 l    df *ABS*	00000000 avm.c
00000000 l    df *ABS*	00000000 ctype.c
00000000 l    df *ABS*	00000000 strtof.c
00000000 l    df *ABS*	00000000 ef_exp.c
00000000 l    df *ABS*	00000000 ef_log.c
00000000 l    df *ABS*	00000000 integer.c
00000000 l    df *ABS*	00000000 wide_integer.c
00000a0e l       .init_array	00000000 .hidden __init_array_end
00000a0e l       .init_array	00000000 .hidden __init_array_start
00000a0e l       .fini_array	00000000 .hidden __fini_array_start
00000a0e l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000022 _start
00000266 g     F .text	00000036 avm_test_main
0000029e g     F .text	00000065 __avm_terminate
0000029c g     F .text	00000002 avm_halt
0000062c g     F .text	000001a5 tgammaf
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000104 g     O .data	00000002 __avm_errno
000008d6 g     F .text	000000f8 logf
000007d1 g     F .text	00000105 __avm_expf_noerrno

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
 e1 88 00              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 d5 7a                 call8	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 0e 0a              ldi16	r4, 0xa0e
 c1 00                 ldi8	r5, 0x0
 c6 0e 0a              ldi16	r6, 0xa0e
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 0e 0a           ldi16	r0, 0xa0e
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 0e 0a           ldi16	r2, 0xa0e
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
 f0 06 ce 09           ldi16	r2, 0x9ce
 f0 03 00              ldi8	r3, 0x0
<L0>:
 f1 20                 mov	r4, r0
 f9 84                 and	r4, r1
 10                    add	r4, r4
 10                    add	r4, r4
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 64 88              ldp32	q2, [q2]
 e1 a5 03              call16	tgammaf
 c6 00 01              ldi16	r6, 0x100
 f0 6b 8c              st32	[r6], q2
 f4 a8                 inc16	r0
 f0 0c 20              cmpi.s8	r0, 0x20
 d1 e4                 brne8	-0x1c <L0>
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
 e1 4d fd              call16	-691 <__avm_run_local_dtors>
<L0>:
 c4 0e 0a              ldi16	r4, 0xa0e
 c1 00                 ldi8	r5, 0x0
 c6 0e 0a              ldi16	r6, 0xa0e
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 0e 0a           ldi16	r2, 0xa0e
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 0e 0a           ldi16	r0, 0xa0e
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
 e1 04 fd              call16	-764 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_gamma_positive_small>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 f2 6b                 mov32	q3, q1
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 d1 53                 brne8	0x53 <L1>
 f2 68                 mov32	q2, q0
 ff 15 07 23 77 16 bd 49 d6 26 3e ac 19 ab be f6 2f e1 3e 9d 4b fa be dd a9 d2 3e 2a c4 13 bf  fpoly	7, -0.0367347114, 0.162926808, -0.334180236, 0.439819038, -0.488858134, 0.411452204, -0.577211976
 f2 66                 mov32	q1, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 00                 fadd
 f2 6a                 mov32	q3, q0
 ff 03                 fdiv
 d4 6d                 jmp8	0x6d <L2>
<L0>:
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 66                 mov32	q1, q2
<L1>:
 aa                    xor	r6, r6
 c7 00 40              ldi16	r7, 0x4000
 f2 68                 mov32	q2, q0
 ff 14                 fcmp
 ce 02                 cmpi.s8	r6, 0x2
 d2 e2                 brult8	-0x1e <L0>
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 15 07 23 77 16 bd 49 d6 26 3e ac 19 ab be f6 2f e1 3e 9d 4b fa be dd a9 d2 3e 2a c4 13 bf  fpoly	7, -0.0367347114, 0.162926808, -0.334180236, 0.439819038, -0.488858134, 0.411452204, -0.577211976
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
<L2>:
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_lgamma_stirling>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 f2 66                 mov32	q1, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6b                 mov32	q3, q1
 ff 03                 fdiv
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 ff 15 03 01 0d 50 3a 61 0b 36 bb ab aa aa 3d  fpoly	3, 7.93650805E-4, -0.00277777785, 0.0833333358
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 aa                    xor	r6, r6
 c7 00 bf              ldi16	r7, 0xbf00
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 c7 80 7b              ldi16	r7, 0x7b80
 f2 69                 mov32	q2, q1
 ff 14                 fcmp
 f4 42                 stsp16	[sp+0x0], r6
 e1 c9 04              call16	logf
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 02                 cmpi.s8	r4, 0x2
 d2 0e                 brult8	0xe <L0>
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 d4 16                 jmp8	0x16 <L1>
<L0>:
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 ff 02                 fmul
 aa                    xor	r6, r6
 c7 00 bf              ldi16	r7, 0xbf00
 ff 00                 fadd
<L1>:
 c6 8e 3f              ldi16	r6, 0x3f8e
 c7 6b 3f              ldi16	r7, 0x3f6b
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_gamma_reflection_small>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 62                 mov32	q0, q2
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 14                 fcmp
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 ce ff                 cmpi.s8	r6, -0x1
 d1 3e                 brne8	0x3e <L0>
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 15 07 23 77 16 bd 49 d6 26 3e ac 19 ab be f6 2f e1 3e 9d 4b fa be dd a9 d2 3e 2a c4 13 bf  fpoly	7, -0.0367347114, 0.162926808, -0.334180236, 0.439819038, -0.488858134, 0.411452204, -0.577211976
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 e0 b6 00              jmp16	182 <L3>
<L0>:
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 d1 53                 brne8	0x53 <L2>
 f2 68                 mov32	q2, q0
 ff 15 07 23 77 16 bd 49 d6 26 3e ac 19 ab be f6 2f e1 3e 9d 4b fa be dd a9 d2 3e 2a c4 13 bf  fpoly	7, -0.0367347114, 0.162926808, -0.334180236, 0.439819038, -0.488858134, 0.411452204, -0.577211976
 f2 66                 mov32	q1, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 00                 fadd
 f2 6a                 mov32	q3, q0
 ff 03                 fdiv
 d4 67                 jmp8	0x67 <L3>
<L1>:
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 66                 mov32	q1, q2
<L2>:
 aa                    xor	r6, r6
 c7 00 40              ldi16	r7, 0x4000
 f2 68                 mov32	q2, q0
 ff 14                 fcmp
 ce 02                 cmpi.s8	r6, 0x2
 d2 e2                 brult8	-0x1e <L1>
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 15 07 23 77 16 bd 49 d6 26 3e ac 19 ab be f6 2f e1 3e 9d 4b fa be dd a9 d2 3e 2a c4 13 bf  fpoly	7, -0.0367347114, 0.162926808, -0.334180236, 0.439819038, -0.488858134, 0.411452204, -0.577211976
 ff 02                 fmul
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
<L3>:
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 03                 fdiv
 f2 6a                 mov32	q3, q0
 ff 03                 fdiv
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_lgamma_reflection_large>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 03                 fdiv
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 e1 2e 03              call16	logf
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 69                 mov32	q2, q1
 ff 15 03 01 0d 50 3a 61 0b 36 bb ab aa aa 3d  fpoly	3, 7.93650805E-4, -0.00277777785, 0.0833333358
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 68                 mov32	q2, q0
 e1 10 03              call16	logf
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 aa                    xor	r6, r6
 c7 00 bf              ldi16	r7, 0xbf00
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 c7 80 7b              ldi16	r7, 0x7b80
 f2 68                 mov32	q2, q0
 ff 14                 fcmp
 ce 02                 cmpi.s8	r6, 0x2
 d2 0e                 brult8	0xe <L0>
 f2 69                 mov32	q2, q1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 d4 16                 jmp8	0x16 <L1>
<L0>:
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 aa                    xor	r6, r6
 c7 00 bf              ldi16	r7, 0xbf00
 ff 00                 fadd
<L1>:
 c6 8e 3f              ldi16	r6, 0x3f8e
 c7 6b 3f              ldi16	r7, 0x3f6b
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 06                 fneg	q2
 ff 01                 fsub
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<tgammaf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f0 00 01              ldi8	r0, 0x1
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 c0              cmp32	q3, q0
 d2 07                 brult8	0x7 <L0>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 e0 66 01              jmp16	358 <L9>
<L0>:
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 84              cmp32	q2, q1
 da 5a 01              breq16	0x15a <L9>
 f2 30                 sub	r0, r0
 f0 05 80 ff           ldi16	r1, 0xff80
 f0 69 80              cmp32	q2, q0
 d1 0d                 brne8	0xd <L2>
<L1>:
 c0 21                 ldi8	r4, 0x21
 f0 5c 04 01           stm16	[0x104], r4
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 e0 42 01              jmp16	322 <L9>
<L2>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d0 2f                 breq8	0x2f <L4>
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 36           ldi16	r1, 0x36ff
 f0 69 0c              cmp32	q0, q3
 d2 30                 brult8	0x30 <L5>
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 03                 fdiv
 09                    mov	r6, r5
 1a                    add	r6, r6
 c7 00 ff              ldi16	r7, 0xff00
 ae                    xor	r7, r6
 08                    mov	r6, r4
 9b                    or	r6, r7
 f6 2e                 tst16	r6
 db 13 01              brne16	0x113 <L9>
<L3>:
 c2 22                 ldi8	r6, 0x22
 f0 5e 04 01           stm16	[0x104], r6
 e0 0a 01              jmp16	266 <L9>
<L4>:
 c2 22                 ldi8	r6, 0x22
 f0 5e 04 01           stm16	[0x104], r6
 c6 80 7f              ldi16	r6, 0x7f80
 99                    or	r6, r5
 06                    mov	r5, r6
 e0 fc 00              jmp16	252 <L9>
<L5>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 d3 15                 brslt8	0x15 <L6>
 aa                    xor	r6, r6
 c7 00 41              ldi16	r7, 0x4100
 f2 62                 mov32	q0, q2
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 db c2 00              brne16	0xc2 <L7>
 f2 68                 mov32	q2, q0
 e1 31 fc              call16	avm_gamma_positive_small
 e0 de 00              jmp16	222 <L9>
<L6>:
 f2 30                 sub	r0, r0
 f0 05 00 4b           ldi16	r1, 0x4b00
 f0 69 c0              cmp32	q3, q0
 d8 84                 bruge8	-0x7c <L1>
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f2 66                 mov32	q1, q2
 ff 05                 fneg	q1
 f2 69                 mov32	q2, q1
 ff 13                 ftou32
 f4 50                 stsp16	[sp+0x4], r4
 f4 5b                 stsp16	[sp+0x6], r7
 ff 11                 u32tof
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 14                 fcmp
 f6 2e                 tst16	r6
 da 65 ff              breq16	-0x9b <L1>
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 aa                    xor	r6, r6
 c7 2c c2              ldi16	r7, 0xc22c
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 14                 fcmp
 c4 ff ff              ldi16	r4, 0xffff
 f0 30 04              ldsp16	r0, [sp+0x4]
 f9 82                 xor	r4, r0
 fa 3f                 lsl16i	r4, 0xf
 04                    mov	r5, r4
 a0                    xor	r4, r4
 ce 01                 cmpi.s8	r6, 0x1
 d3 81                 brslt8	-0x7f <L3>
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 61                 mov32	q0, q1
 f2 68                 mov32	q2, q0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 14                 fcmp
 f4 42                 stsp16	[sp+0x0], r6
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f4 02                 ldsp16	r6, [sp+0x0]
 ce 01                 cmpi.s8	r6, 0x1
 fd 54                 cmov.sge	r2, r4
 fd 5d                 cmov.sge	r3, r5
 f2 69                 mov32	q2, q1
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 ff 15 06 b5 c0 19 bb 03 34 d6 3c 72 54 43 be 5a ce 4f 3f 33 8d d2 bf 00 00 80 3f      fpoly	6, -0.00234608096, 0.026147848, -0.190751821, 0.811742424, -1.64493406, 1.0
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 aa                    xor	r6, r6
 c7 e0 c0              ldi16	r7, 0xc0e0
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 14                 fcmp
 f4 62                 stsp16	[sp+0x8], r6
 f2 69                 mov32	q2, q1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 20                 ldsp16	r4, [sp+0x8]
 cc 01                 cmpi.s8	r4, 0x1
 d1 32                 brne8	0x32 <L10>
 f2 68                 mov32	q2, q0
 e1 cb fc              call16	avm_gamma_reflection_small
 d4 3d                 jmp8	0x3d <L11>
<L7>:
 c6 10 29              ldi16	r6, 0x2910
 c7 0c 42              ldi16	r7, 0x420c
 f0 69 0c              cmp32	q0, q3
 d8 11                 bruge8	0x11 <L8>
 f2 68                 mov32	q2, q0
 e1 2b fc              call16	avm_lgamma_stirling
 d5 30                 call8	__avm_expf_noerrno
 c6 80 7f              ldi16	r6, 0x7f80
 a9                    xor	r6, r5
 0c                    mov	r7, r4
 9e                    or	r7, r6
 f6 2f                 tst16	r7
 d1 08                 brne8	0x8 <L9>
<L8>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 04 01           stm16	[0x104], r4
 f2 69                 mov32	q2, q1
<L9>:
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L10>:
 f2 68                 mov32	q2, q0
 e1 c0 fd              call16	avm_lgamma_reflection_large
 d5 10                 call8	__avm_expf_noerrno
 c2 7f                 ldi8	r6, 0x7f
 39                    cmp	r6, r5
 d2 06                 brult8	0x6 <L11>
 c2 22                 ldi8	r6, 0x22
 f0 5e 04 01           stm16	[0x104], r6
<L11>:
 f4 1b                 ldsp16	r7, [sp+0x6]
 97                    or	r5, r7
 d4 e2                 jmp8	-0x1e <L9>

<__avm_expf_noerrno>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 c6 80 7f              ldi16	r6, 0x7f80
 f5 0e                 cmp	r1, r6
 d2 1e                 brult8	0x1e <L0>
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 0c              cmp32	q0, q3
 db b4 00              brne16	0xb4 <L3>
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 08              cmp32	q0, q2
 fd 34                 cmov.slt	r6, r4
 fd 3d                 cmov.slt	r7, r5
 e0 c5 00              jmp16	197 <L6>
<L0>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d3 14                 brslt8	0x14 <L1>
 f0 06 17 72           ldi16	r2, 0x7217
 f0 07 b1 42           ldi16	r3, 0x42b1
 f0 69 40              cmp32	q1, q0
 d8 07                 bruge8	0x7 <L1>
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 e0 aa 00              jmp16	170 <L6>
<L1>:
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 69 48              cmp32	q1, q2
 d3 0e                 brslt8	0xe <L2>
 f0 06 b5 f1           ldi16	r2, 0xf1b5
 f0 07 cf 42           ldi16	r3, 0x42cf
 f0 69 40              cmp32	q1, q0
 dc 8f 00              brult16	0x8f <L6>
<L2>:
 c6 3b aa              ldi16	r6, 0xaa3b
 c7 b8 3f              ldi16	r7, 0x3fb8
 f2 66                 mov32	q1, q2
 ff 02                 fmul
 c6 18 72              ldi16	r6, 0x7218
 c7 b1 3e              ldi16	r7, 0x3eb1
 f0 69 c0              cmp32	q3, q0
 d8 5d                 bruge8	0x5d <L4>
 f1 2b                 mov	r6, r3
 fa 9f                 lsr16i	r6, 0xf
 c7 00 3f              ldi16	r7, 0x3f00
 f0 04 00 bf           ldi16	r0, 0xbf00
 f4 a6                 tst8	r6
 fb 78                 cmov.ne	r7, r0
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
 f4 03                 ldsp16	r7, [sp+0x0]
 ff 15 05 66 01 1d 3c 23 fe 64 3d bc 01 76 3e 96 70 31 3f 00 00 80 3f  fpoly	5, 0.00958285294, 0.0559064262, 0.240240991, 0.693124175, 1.0
 cf 83                 cmpi.s8	r7, -0x7d
 d9 38                 brsge8	0x38 <L5>
 fa 67                 lsl16i	r7, 0x7
 c6 00 32              ldi16	r6, 0x3200
 1b                    add	r6, r7
 f1 0e                 mov	r1, r6
 f2 30                 sub	r0, r0
 f7 62                 add32	q0, q2
 aa                    xor	r6, r6
 c7 80 0d              ldi16	r7, 0xd80
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d4 25                 jmp8	0x25 <L6>
<L3>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d4 1d                 jmp8	0x1d <L6>
<L4>:
 ff 15 05 66 01 1d 3c 23 fe 64 3d bc 01 76 3e 96 70 31 3f 00 00 80 3f  fpoly	5, 0.00958285294, 0.0559064262, 0.240240991, 0.693124175, 1.0
 af                    xor	r7, r7
<L5>:
 fa 67                 lsl16i	r7, 0x7
 aa                    xor	r6, r6
 f7 6e                 add32	q3, q2
<L6>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<logf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 aa                    xor	r6, r6
 c7 80 80              ldi16	r7, 0x8080
 f2 62                 mov32	q0, q2
 f7 63                 add32	q0, q3
 f0 69 c0              cmp32	q3, q0
 dd 95 00              bruge16	0x95 <L3>
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 01 7f              ldi8	r1, 0x7f
 f0 69 08              cmp32	q0, q2
 d2 0b                 brult8	0xb <L0>
 aa                    xor	r6, r6
 c7 00 4c              ldi16	r7, 0x4c00
 ff 02                 fmul
 c6 68 ff              ldi16	r6, 0xff68
 d4 03                 jmp8	0x3 <L1>
<L0>:
 c6 81 ff              ldi16	r6, 0xff81
<L1>:
 f4 42                 stsp16	[sp+0x0], r6
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f0 06 20 fb           ldi16	r2, 0xfb20
 f0 03 4a              ldi8	r3, 0x4a
 f7 64                 add32	q1, q0
 c3 80                 ldi8	r7, 0x80
 f9 ec                 and	r7, r3
 f9 3d                 or	r1, r7
 f1 28                 mov	r6, r0
 f1 2d                 mov	r7, r1
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f9 1a                 xor	r0, r6
 f9 3e                 xor	r1, r7
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f1 2b                 mov	r6, r3
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 18                    add	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 15 07 a7 65 34 3e a3 bd 8a be 49 17 97 3e 10 e7 b7 be 96 17 f6 3e 8e ab 38 bf 46 aa b8 3f  fpoly	7, 0.176169023, -0.270978063, 0.295099527, -0.359184742, 0.480648696, -0.721367717, 1.44269633
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 ff 0c                 s16tof
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 c6 18 72              ldi16	r6, 0x7218
 c7 31 3f              ldi16	r7, 0x3f31
 ff 02                 fmul
<L2>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L3>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d0 13                 breq8	0x13 <L4>
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 69 08              cmp32	q0, q2
 d9 12                 brsge8	0x12 <L5>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 d4 d5                 jmp8	-0x2b <L2>
<L4>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 04 01           stm16	[0x104], r4
 a0                    xor	r4, r4
 c5 80 ff              ldi16	r5, 0xff80
 d4 c9                 jmp8	-0x37 <L2>
<L5>:
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 0c              cmp32	q0, q3
 d8 07                 bruge8	0x7 <L6>
 c6 c0 7f              ldi16	r6, 0x7fc0
 99                    or	r6, r5
 06                    mov	r5, r6
 d4 b7                 jmp8	-0x49 <L2>
<L6>:
 c2 21                 ldi8	r6, 0x21
 f0 5e 04 01           stm16	[0x104], r6
 c6 c0 7f              ldi16	r6, 0x7fc0
 99                    or	r6, r5
 06                    mov	r5, r6
 d4 aa                 jmp8	-0x56 <L2>
