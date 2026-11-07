
math_tgamma.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 30                 sub	r0, r0
 d7 01                 sys	debug_break
 f0 06 a8 14           ldi16	r2, 0x14a8
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
 e1 10 0e              call16	tgammaf
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
 e1 1c 03              call16	logf
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 69                 mov32	q2, q1
 ff 15 03 01 0d 50 3a 61 0b 36 bb ab aa aa 3d  fpoly	3, 7.93650805E-4, -0.00277777785, 0.0833333358
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 68                 mov32	q2, q0
 e1 fe 02              call16	logf
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
 e0 54 01              jmp16	340 <L9>
<L0>:
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 80              cmp32	q2, q0
 da 48 01              breq16	0x148 <L9>
 f2 30                 sub	r0, r0
 f0 05 80 ff           ldi16	r1, 0xff80
 f0 69 80              cmp32	q2, q0
 d1 0d                 brne8	0xd <L2>
<L1>:
 c0 21                 ldi8	r4, 0x21
 f0 5c 04 01           stm16	[0x104], r4
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 e0 30 01              jmp16	304 <L9>
<L2>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d0 2f                 breq8	0x2f <L4>
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 36           ldi16	r3, 0x36ff
 f0 69 4c              cmp32	q1, q3
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
 db 01 01              brne16	0x101 <L9>
<L3>:
 c2 22                 ldi8	r6, 0x22
 f0 5e 04 01           stm16	[0x104], r6
 e0 f8 00              jmp16	248 <L9>
<L4>:
 c2 22                 ldi8	r6, 0x22
 f0 5e 04 01           stm16	[0x104], r6
 c6 80 7f              ldi16	r6, 0x7f80
 99                    or	r6, r5
 06                    mov	r5, r6
 e0 ea 00              jmp16	234 <L9>
<L5>:
 f0 69 80              cmp32	q2, q0
 d3 13                 brslt8	0x13 <L6>
 aa                    xor	r6, r6
 c7 00 41              ldi16	r7, 0x4100
 f2 62                 mov32	q0, q2
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 db b4 00              brne16	0xb4 <L7>
 e1 15 fc              call16	avm_gamma_positive_small
 e0 d2 00              jmp16	210 <L9>
<L6>:
 f2 30                 sub	r0, r0
 f0 05 00 4b           ldi16	r1, 0x4b00
 f0 69 c0              cmp32	q3, q0
 d8 8a                 bruge8	-0x76 <L1>
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f2 66                 mov32	q1, q2
 ff 05                 fneg	q1
 f2 69                 mov32	q2, q1
 ff 13                 ftou32
 f4 50                 stsp16	[sp+0x4], r4
 ff 11                 u32tof
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 14                 fcmp
 f6 2e                 tst16	r6
 da 6d ff              breq16	-0x93 <L1>
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
 d3 89                 brslt8	-0x77 <L3>
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
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 aa                    xor	r6, r6
 c7 e0 c0              ldi16	r7, 0xc0e0
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 14                 fcmp
 f2 68                 mov32	q2, q0
 ce 01                 cmpi.s8	r6, 0x1
 d1 32                 brne8	0x32 <L10>
 f2 6b                 mov32	q3, q1
 e1 cb fc              call16	avm_gamma_reflection_small
 d4 3d                 jmp8	0x3d <L11>
<L7>:
 c6 10 29              ldi16	r6, 0x2910
 c7 0c 42              ldi16	r7, 0x420c
 f0 69 0c              cmp32	q0, q3
 d8 0f                 bruge8	0xf <L8>
 e1 27 fc              call16	avm_lgamma_stirling
 d5 32                 call8	__avm_expf_noerrno
 c6 80 7f              ldi16	r6, 0x7f80
 a9                    xor	r6, r5
 0c                    mov	r7, r4
 9e                    or	r7, r6
 f6 2f                 tst16	r7
 d1 0a                 brne8	0xa <L9>
<L8>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 04 01           stm16	[0x104], r4
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
<L9>:
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L10>:
 f2 6b                 mov32	q3, q1
 e1 cc fd              call16	avm_lgamma_reflection_large
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
 d2 1d                 brult8	0x1d <L0>
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 0c              cmp32	q0, q3
 d1 48                 brne8	0x48 <L2>
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 69 08              cmp32	q0, q2
 fd 34                 cmov.slt	r6, r4
 fd 3d                 cmov.slt	r7, r5
 e0 c0 00              jmp16	192 <L6>
<L0>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d3 12                 brslt8	0x12 <L1>
 c6 17 72              ldi16	r6, 0x7217
 c7 b1 42              ldi16	r7, 0x42b1
 f0 69 c0              cmp32	q3, q0
 d8 07                 bruge8	0x7 <L1>
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 e0 a9 00              jmp16	169 <L7>
<L1>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c8              cmp32	q3, q2
 d3 17                 brslt8	0x17 <L3>
 c6 b5 f1              ldi16	r6, 0xf1b5
 c7 cf 42              ldi16	r7, 0x42cf
 f0 69 c0              cmp32	q3, q0
 d8 0c                 bruge8	0xc <L3>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e0 8e 00              jmp16	142 <L7>
<L2>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 e0 87 00              jmp16	135 <L7>
<L3>:
 c6 3b aa              ldi16	r6, 0xaa3b
 c7 b8 3f              ldi16	r7, 0x3fb8
 f2 66                 mov32	q1, q2
 ff 02                 fmul
 c6 18 72              ldi16	r6, 0x7218
 c7 b1 3e              ldi16	r7, 0x3eb1
 f0 69 c0              cmp32	q3, q0
 d8 53                 bruge8	0x53 <L4>
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
 d9 2e                 brsge8	0x2e <L5>
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
 d4 1f                 jmp8	0x1f <L7>
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
<L7>:
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
