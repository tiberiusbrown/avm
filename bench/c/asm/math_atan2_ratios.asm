
math_atan2_ratios.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000323 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 math_atan2_ratios.c
00000100 l     O .data	00000100 inputs
00000200 l     O .data	00000004 result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 ef_atan2.c
00000637 l       .init_array	00000000 .hidden __init_array_end
00000637 l       .init_array	00000000 .hidden __init_array_start
00000637 l       .fini_array	00000000 .hidden __fini_array_start
00000637 l       .fini_array	00000000 .hidden __fini_array_end
00000300 g     F .text	00000023 _start
00000367 g     F .text	00000042 avm_test_main
000003ab g     F .text	00000065 __avm_terminate
000003a9 g     F .text	00000002 avm_halt
00000410 g     F .text	00000227 atan2f
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
 e1 95 00              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 86 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 37 06              ldi16	r4, 0x637
 c1 00                 ldi8	r5, 0x0
 c6 37 06              ldi16	r6, 0x637
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 37 06           ldi16	r0, 0x637
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 37 06           ldi16	r2, 0x637
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
 f2 39                 sub	r1, r1
 f2 42                 sub	r2, r2
 d7 01                 sys	debug_break
 f0 07 00 01           ldi16	r3, 0x100
<L0>:
 f1 22                 mov	r4, r2
 c5 00 01              ldi16	r5, 0x100
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 f1 2a                 mov	r6, r2
 c7 04 01              ldi16	r7, 0x104
 1b                    add	r6, r7
 f0 6a cc              ld32	q3, [r6]
 e1 84 00              call16	atan2f
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f0 0a 08              addi.s8	r2, 0x8
 f5 13                 cmp	r2, r3
 d1 dc                 brne8	-0x24 <L0>
 c4 00 02              ldi16	r4, 0x200
 f0 6b 08              st32	[r4], q0
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
 e1 40 fc              call16	-960 <__avm_run_local_dtors>
<L0>:
 c4 37 06              ldi16	r4, 0x637
 c1 00                 ldi8	r5, 0x0
 c6 37 06              ldi16	r6, 0x637
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 37 06           ldi16	r2, 0x637
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 37 06           ldi16	r0, 0x637
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
 e1 f7 fb              call16	-1033 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<atan2f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f2 63                 mov32	q0, q3
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 ff 08                 fabs	q0
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 c0              cmp32	q3, q0
 d2 45                 brult8	0x45 <L0>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 0b                 fabs	q3
 f0 02 01              ldi8	r2, 0x1
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 c4              cmp32	q3, q1
 d8 35                 bruge8	0x35 <L0>
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 c4              cmp32	q3, q1
 d0 35                 breq8	0x35 <L1>
 f0 69 04              cmp32	q0, q1
 d0 56                 breq8	0x56 <L2>
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 c4              cmp32	q3, q1
 d1 60                 brne8	0x60 <L3>
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c4 c9 3f              ldi16	r4, 0x3fc9
 c5 49 3f              ldi16	r5, 0x3f49
 f0 69 04              cmp32	q0, q1
 fb 25                 cmov.eq	r4, r5
 c5 db 0f              ldi16	r5, 0xfdb
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 e0 75 01              jmp16	373 <L11>
<L0>:
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 00                 fadd
 e0 9a 01              jmp16	410 <L12>
<L1>:
 c6 00 80              ldi16	r6, 0x8000
 89                    and	r6, r5
 f2 30                 sub	r0, r0
 c7 49 40              ldi16	r7, 0x4049
 f0 05 49 c0           ldi16	r1, 0xc049
 f5 28                 cmp	r6, r0
 fb 79                 cmov.ne	r7, r1
 c6 db 0f              ldi16	r6, 0xfdb
 f2 39                 sub	r1, r1
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 69 40              cmp32	q1, q0
 fd 26                 cmov.slt	r4, r6
 fd 2f                 cmov.slt	r5, r7
 e0 74 01              jmp16	372 <L12>
<L2>:
 c4 00 80              ldi16	r4, 0x8000
 81                    and	r4, r5
 a5                    xor	r5, r5
 c6 c9 3f              ldi16	r6, 0x3fc9
 c7 c9 bf              ldi16	r7, 0xbfc9
 31                    cmp	r4, r5
 fb 77                 cmov.ne	r6, r7
 c4 db 0f              ldi16	r4, 0xfdb
 06                    mov	r5, r6
 e0 5f 01              jmp16	351 <L12>
<L3>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 69 04              cmp32	q0, q1
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f2 69                 mov32	q2, q1
 da 21 01              breq16	0x121 <L11>
 f0 69 0c              cmp32	q0, q3
 d8 34                 bruge8	0x34 <L4>
 f2 68                 mov32	q2, q0
 ff 03                 fdiv
 09                    mov	r6, r5
 c7 ff 3e              ldi16	r7, 0x3eff
 3e                    cmp	r7, r6
 d2 5f                 brult8	0x5f <L5>
 c7 7f 3e              ldi16	r7, 0x3e7f
 3e                    cmp	r7, r6
 dc a5 00              brult16	0xa5 <L7>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 ff 15 04 16 15 05 be 3e 59 4c 3e 46 aa aa be 00 00 80 3f      fpoly	4, -0.129963249, 0.199559182, -0.333330333, 1.0
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 e0 de 00              jmp16	222 <L10>
<L4>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 03                 fdiv
 09                    mov	r6, r5
 c7 ff 3e              ldi16	r7, 0x3eff
 3e                    cmp	r7, r6
 d2 50                 brult8	0x50 <L6>
 c7 7f 3e              ldi16	r7, 0x3e7f
 3e                    cmp	r7, r6
 dc 8e 00              brult16	0x8e <L8>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 ff 15 04 16 15 05 be 3e 59 4c 3e 46 aa aa be 00 00 80 3f      fpoly	4, -0.129963249, 0.199559182, -0.333330333, 1.0
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 e0 b2 00              jmp16	178 <L11>
<L5>:
 c7 3f 3f              ldi16	r7, 0x3f3f
 3e                    cmp	r7, r6
 dc 84 00              brult16	0x84 <L9>
 aa                    xor	r6, r6
 c7 20 bf              ldi16	r7, 0xbf20
 ff 00                 fadd
 ff 15 05 a1 71 d1 3d c3 37 9c 3c ed 79 a5 be fd 17 38 3f 5e 00 0f 3f  fpoly	5, 0.102267511, 0.019069558, -0.323195845, 0.719116032, 0.558599353
 e0 81 00              jmp16	129 <L10>
<L6>:
 c7 3f 3f              ldi16	r7, 0x3f3f
 3e                    cmp	r7, r6
 dc b9 00              brult16	0xb9 <L13>
 aa                    xor	r6, r6
 c7 20 bf              ldi16	r7, 0xbf20
 ff 00                 fadd
 ff 15 05 a1 71 d1 3d c3 37 9c 3c ed 79 a5 be fd 17 38 3f 5e 00 0f 3f  fpoly	5, 0.102267511, 0.019069558, -0.323195845, 0.719116032, 0.558599353
 d4 65                 jmp8	0x65 <L11>
<L7>:
 aa                    xor	r6, r6
 c7 c0 be              ldi16	r7, 0xbec0
 ff 00                 fadd
 ff 15 05 29 9e 3f 3e ad d1 05 be 09 8f 93 be 92 70 60 3f c7 b0 b7 3e  fpoly	5, 0.187126771, -0.130682662, -0.288200647, 0.876717686, 0.358770579
 d4 3c                 jmp8	0x3c <L10>
<L8>:
 aa                    xor	r6, r6
 c7 c0 be              ldi16	r7, 0xbec0
 ff 00                 fadd
 ff 15 05 29 9e 3f 3e ad d1 05 be 09 8f 93 be 92 70 60 3f c7 b0 b7 3e  fpoly	5, 0.187126771, -0.130682662, -0.288200647, 0.876717686, 0.358770579
 d4 27                 jmp8	0x27 <L11>
<L9>:
 aa                    xor	r6, r6
 c7 60 bf              ldi16	r7, 0xbf60
 ff 00                 fadd
 ff 15 05 d6 da b4 3c 79 68 9e 3d 96 b6 8f be 42 fe 10 3f 3f 05 38 3f  fpoly	5, 0.0220770054, 0.0773477033, -0.280689895, 0.566379666, 0.718830049
<L10>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 c4 db 0f              ldi16	r4, 0xfdb
 c5 c9 3f              ldi16	r5, 0x3fc9
 ff 01                 fsub
<L11>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 c4 db 0f              ldi16	r4, 0xfdb
 c5 49 40              ldi16	r5, 0x4049
 ff 01                 fsub
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f0 69 04              cmp32	q0, q1
 fd 34                 cmov.slt	r6, r4
 fd 3d                 cmov.slt	r7, r5
 f0 04 00 80           ldi16	r0, 0x8000
 f4 09                 ldsp16	r5, [sp+0x2]
 f9 14                 and	r0, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 0a                 fabs	q2
 f2 66                 mov32	q1, q2
 ff 05                 fneg	q1
 aa                    xor	r6, r6
 f5 06                 cmp	r0, r6
 fb 62                 cmov.ne	r4, r2
 fb 6b                 cmov.ne	r5, r3
<L12>:
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L13>:
 aa                    xor	r6, r6
 c7 60 bf              ldi16	r7, 0xbf60
 ff 00                 fadd
 ff 15 05 d6 da b4 3c 79 68 9e 3d 96 b6 8f be 42 fe 10 3f 3f 05 38 3f  fpoly	5, 0.0220770054, 0.0773477033, -0.280689895, 0.566379666, 0.718830049
 d4 ac                 jmp8	-0x54 <L11>
