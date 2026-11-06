
math_lgamma_negative.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 30                 sub	r0, r0
 d7 01                 sys	debug_break
 f0 06 74 13           ldi16	r2, 0x1374
 f0 03 00              ldi8	r3, 0x0
 f0 05 00 01           ldi16	r1, 0x100
<L0>:
 f1 20                 mov	r4, r0
 c1 0f                 ldi8	r5, 0xf
 81                    and	r4, r5
 10                    add	r4, r4
 10                    add	r4, r4
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 64 88              ldp32	q2, [q2]
 e1 c2 0a              call16	lgammaf
 f0 6b 82              st32	[r1], q2
 f4 a8                 inc16	r0
 f0 0c 20              cmpi.s8	r0, 0x20
 d1 e6                 brne8	-0x1a <L0>
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<memset>:
 0c                    mov	r7, r4
 d7 11                 sys	memset
 03                    mov	r4, r7
 ef                    ret

<lgammaf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 f2 62                 mov32	q0, q2
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 c0 01                 ldi8	r4, 0x1
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 48              cmp32	q1, q2
 d2 08                 brult8	0x8 <L0>
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 d4 61                 jmp8	0x61 <L5>
<L0>:
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 48              cmp32	q1, q2
 d0 58                 breq8	0x58 <L5>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 d1 0c                 brne8	0xc <L2>
<L1>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 04 01           stm16	[0x104], r4
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 d4 45                 jmp8	0x45 <L5>
<L2>:
 f0 69 08              cmp32	q0, q2
 d3 2d                 brslt8	0x2d <L3>
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f2 68                 mov32	q2, q0
 ff 14                 fcmp
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f6 2e                 tst16	r6
 d0 32                 breq8	0x32 <L5>
 aa                    xor	r6, r6
 c7 00 40              ldi16	r7, 0x4000
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 ff 14                 fcmp
 f2 69                 mov32	q2, q1
 f6 2e                 tst16	r6
 d0 22                 breq8	0x22 <L5>
 aa                    xor	r6, r6
 c7 00 37              ldi16	r7, 0x3700
 f2 68                 mov32	q2, q0
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 db ad 00              brne16	0xad <L7>
 d4 0e                 jmp8	0xe <L4>
<L3>:
 aa                    xor	r6, r6
 c7 00 b7              ldi16	r7, 0xb700
 f2 68                 mov32	q2, q0
 ff 14                 fcmp
 ff 06                 fneg	q2
 ce 01                 cmpi.s8	r6, 0x1
 d1 0c                 brne8	0xc <L6>
<L4>:
 e1 27 04              call16	logf
 ff 06                 fneg	q2
<L5>:
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L6>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 c5 00 4b              ldi16	r5, 0x4b00
 f0 69 48              cmp32	q1, q2
 d8 9d                 bruge8	-0x63 <L1>
 f2 67                 mov32	q1, q3
 f2 69                 mov32	q2, q1
 ff 13                 ftou32
 ff 11                 u32tof
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 ff 14                 fcmp
 f6 2e                 tst16	r6
 d0 87                 breq8	-0x79 <L1>
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 ff 01                 fsub
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 14                 fcmp
 f4 42                 stsp16	[sp+0x0], r6
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 ff 01                 fsub
 f4 02                 ldsp16	r6, [sp+0x0]
 ce 01                 cmpi.s8	r6, 0x1
 f4 0a                 ldsp16	r6, [sp+0x2]
 fd 74                 cmov.sge	r6, r4
 fd 7d                 cmov.sge	r7, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 02                 fmul
 ff 15 06 b5 c0 19 bb 03 34 d6 3c 72 54 43 be 5a ce 4f 3f 33 8d d2 bf 00 00 80 3f      fpoly	6, -0.00234608096, 0.026147848, -0.190751821, 0.811742424, -1.64493406, 1.0
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 ff 02                 fmul
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 aa                    xor	r6, r6
 c7 e0 c0              ldi16	r7, 0xc0e0
 f2 68                 mov32	q2, q0
 ff 14                 fcmp
 f2 69                 mov32	q2, q1
 ce 01                 cmpi.s8	r6, 0x1
 d1 46                 brne8	0x46 <L9>
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 e1 ae 01              call16	avm_gamma_reflection_small
 e1 90 03              call16	logf
 e0 68 ff              jmp16	-152 <L5>
<L7>:
 aa                    xor	r6, r6
 c7 00 41              ldi16	r7, 0x4100
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 d1 08                 brne8	0x8 <L8>
 d5 37                 call8	avm_gamma_positive_small
 e1 7e 03              call16	logf
 e0 56 ff              jmp16	-170 <L5>
<L8>:
 c4 8e af              ldi16	r4, 0xaf8e
 c5 44 7c              ldi16	r5, 0x7c44
 f0 69 08              cmp32	q0, q2
 dd f9 fe              bruge16	-0x107 <L1>
 f2 68                 mov32	q2, q0
 e1 f1 00              call16	avm_lgamma_stirling
 09                    mov	r6, r5
 1a                    add	r6, r6
 c7 00 ff              ldi16	r7, 0xff00
 ae                    xor	r7, r6
 08                    mov	r6, r4
 9b                    or	r6, r7
 f6 2e                 tst16	r6
 db 38 ff              brne16	-0xc8 <L5>
 c2 22                 ldi8	r6, 0x22
 f0 5e 04 01           stm16	[0x104], r6
 e0 2f ff              jmp16	-209 <L5>
<L9>:
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 e1 9b 02              call16	avm_lgamma_reflection_large
 e0 25 ff              jmp16	-219 <L5>

<avm_gamma_positive_small>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 d1 3f                 brne8	0x3f <L0>
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
 d4 7d                 jmp8	0x7d <L3>
<L0>:
 aa                    xor	r6, r6
 c7 00 40              ldi16	r7, 0x4000
 ff 14                 fcmp
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 ce 02                 cmpi.s8	r6, 0x2
 d8 1e                 bruge8	0x1e <L2>
<L1>:
 f2 68                 mov32	q2, q0
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 aa                    xor	r6, r6
 c7 00 40              ldi16	r7, 0x4000
 ff 14                 fcmp
 ce 02                 cmpi.s8	r6, 0x2
 d2 e2                 brult8	-0x1e <L1>
<L2>:
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
<L3>:
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
 e1 36 02              call16	logf
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
 f2 66                 mov32	q1, q2
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 c6 8e 3f              ldi16	r6, 0x3f8e
 c7 6b 3f              ldi16	r7, 0x3f6b
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
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
 ce ff                 cmpi.s8	r6, -0x1
 d1 42                 brne8	0x42 <L0>
 20                    sub	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 66                 mov32	q1, q2
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
 e0 c4 00              jmp16	196 <L4>
<L0>:
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 d1 3f                 brne8	0x3f <L1>
 ff 15 07 23 77 16 bd 49 d6 26 3e ac 19 ab be f6 2f e1 3e 9d 4b fa be dd a9 d2 3e 2a c4 13 bf  fpoly	7, -0.0367347114, 0.162926808, -0.334180236, 0.439819038, -0.488858134, 0.411452204, -0.577211976
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 00                 fadd
 f2 6b                 mov32	q3, q1
 ff 03                 fdiv
 d4 77                 jmp8	0x77 <L4>
<L1>:
 aa                    xor	r6, r6
 c7 00 40              ldi16	r7, 0x4000
 ff 14                 fcmp
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 ce 02                 cmpi.s8	r6, 0x2
 d8 1e                 bruge8	0x1e <L3>
<L2>:
 f2 69                 mov32	q2, q1
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 aa                    xor	r6, r6
 c7 00 40              ldi16	r7, 0x4000
 ff 14                 fcmp
 ce 02                 cmpi.s8	r6, 0x2
 d2 e2                 brult8	-0x1e <L2>
<L3>:
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 15 07 23 77 16 bd 49 d6 26 3e ac 19 ab be f6 2f e1 3e 9d 4b fa be dd a9 d2 3e 2a c4 13 bf  fpoly	7, -0.0367347114, 0.162926808, -0.334180236, 0.439819038, -0.488858134, 0.411452204, -0.577211976
 ff 02                 fmul
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
<L4>:
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
 e1 89 00              call16	logf
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 69                 mov32	q2, q1
 ff 15 03 01 0d 50 3a 61 0b 36 bb ab aa aa 3d  fpoly	3, 7.93650805E-4, -0.00277777785, 0.0833333358
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 68                 mov32	q2, q0
 d5 6c                 call8	logf
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
 f2 62                 mov32	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 c6 8e 3f              ldi16	r6, 0x3f8e
 c7 6b 3f              ldi16	r7, 0x3f6b
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
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
 dd 89 00              bruge16	0x89 <L3>
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
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f0 06 20 fb           ldi16	r2, 0xfb20
 f0 03 4a              ldi8	r3, 0x4a
 f7 64                 add32	q1, q0
 c3 80                 ldi8	r7, 0x80
 f9 ec                 and	r7, r3
 f9 3d                 or	r1, r7
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 12                    add	r4, r6
 f1 2b                 mov	r6, r3
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 18                    add	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
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

<__avm_umulhisi3>:
 d6 fa                 adjsp	-0x6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f4 52                 stsp16	[sp+0x4], r6
 f1 75                 zext8	r5
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 f3 19                 mulu8.w	r6, r5
 f4 4a                 stsp16	[sp+0x2], r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f3 1b                 mulu8.w	r6, r7
 f4 42                 stsp16	[sp+0x0], r6
 fa 78                 lsr16i	r4, 0x8
 f4 13                 ldsp16	r7, [sp+0x4]
 08                    mov	r6, r4
 f3 1b                 mulu8.w	r6, r7
 f3 11                 mulu8.w	r4, r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 16                    add	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 fa 38                 lsl16i	r4, 0x8
 f4 09                 ldsp16	r5, [sp+0x2]
 14                    add	r5, r4
 34                    cmp	r5, r4
 f8 14                 cset.ult	r4
 13                    add	r4, r7
 fa 58                 lsl16i	r6, 0x8
 19                    add	r6, r5
 39                    cmp	r6, r5
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 02                    mov	r4, r6
 d6 06                 adjsp	0x6
 ef                    ret

<__avm_mulsi3>:
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f1 05                 mov	r0, r5
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 f2 24                 add	r5, r0
 f4 61                 stsp16	[sp+0x8], r5
 06                    mov	r5, r6
 fa 8f                 lsr16i	r5, 0xf
 17                    add	r5, r7
 fe 2c                 mul16	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 21                 ldsp16	r5, [sp+0x8]
 fe 2e                 mul16	r5, r6
 f4 61                 stsp16	[sp+0x8], r5
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 51                 stsp16	[sp+0x4], r5
 f1 76                 zext8	r6
 04                    mov	r5, r4
 f1 75                 zext8	r5
 0d                    mov	r7, r5
 f3 1e                 mulu8.w	r7, r6
 f4 43                 stsp16	[sp+0x0], r7
 f4 13                 ldsp16	r7, [sp+0x4]
 f3 3d                 mulsu8.w	r7, r5
 f4 5b                 stsp16	[sp+0x6], r7
 fa 78                 lsr16i	r4, 0x8
 0c                    mov	r7, r4
 f4 11                 ldsp16	r5, [sp+0x4]
 f3 2d                 muls8.w	r7, r5
 f3 32                 mulsu8.w	r4, r6
 04                    mov	r5, r4
 fa c8                 asr16i	r5, 0x8
 17                    add	r5, r7
 f4 1a                 ldsp16	r6, [sp+0x6]
 fa d8                 asr16i	r6, 0x8
 19                    add	r6, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 19                    add	r6, r5
 fa 38                 lsl16i	r4, 0x8
 f4 03                 ldsp16	r7, [sp+0x0]
 1c                    add	r7, r4
 3c                    cmp	r7, r4
 f8 14                 cset.ult	r4
 12                    add	r4, r6
 f4 09                 ldsp16	r5, [sp+0x2]
 11                    add	r4, r5
 f4 19                 ldsp16	r5, [sp+0x6]
 fa 48                 lsl16i	r5, 0x8
 1d                    add	r7, r5
 3d                    cmp	r7, r5
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 03                    mov	r4, r7
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
