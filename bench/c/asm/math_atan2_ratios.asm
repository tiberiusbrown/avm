
math_atan2_ratios.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000031e l     F .text	00000044 avm_run_constructors
00000362 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 math_atan2_ratios.c
00000100 l     O .data	00000100 inputs
00000200 l     O .data	00000004 result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 ef_atan2.c
00000660 l       .init_array	00000000 .hidden __init_array_end
00000660 l       .init_array	00000000 .hidden __init_array_start
00000660 l       .fini_array	00000000 .hidden __fini_array_start
00000660 l       .fini_array	00000000 .hidden __fini_array_end
00000300 g     F .text	0000001e _start
000003c7 g     F .text	0000003b avm_test_main
00000402 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000404 g     F .text	0000025c atan2f

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
 e1 e4 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 60 06              ldi16	r4, 0x660
 c1 00                 ldi8	r5, 0x0
 c6 60 06              ldi16	r6, 0x660
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 60 06           ldi16	r0, 0x660
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 60 06           ldi16	r2, 0x660
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
 c4 60 06              ldi16	r4, 0x660
 c1 00                 ldi8	r5, 0x0
 c6 60 06              ldi16	r6, 0x660
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 60 06           ldi16	r2, 0x660
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 60 06           ldi16	r0, 0x660
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
 d5 19                 call8	atan2f
 ff 02                 fadd	q0, q2
 f0 0a 08              addi.s8	r2, 0x8
 f5 13                 cmp	r2, r3
 d1 e3                 brne8	-0x1d <L0>
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

<atan2f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f2 63                 mov32	q0, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 ff 64                 fabs	q0
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 80              cmp32	q2, q0
 d2 4d                 brult8	0x4d <L0>
 f2 67                 mov32	q1, q3
 ff 65                 fabs	q1
 c0 01                 ldi8	r4, 0x1
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 48              cmp32	q1, q2
 d8 3f                 bruge8	0x3f <L0>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 d0 43                 breq8	0x43 <L1>
 f0 69 08              cmp32	q0, q2
 d0 78                 breq8	0x78 <L2>
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 48              cmp32	q1, q2
 db 90 00              brne16	0x90 <L3>
 c4 db 0f              ldi16	r4, 0xfdb
 c5 c9 3f              ldi16	r5, 0x3fc9
 f0 06 db 0f           ldi16	r2, 0xfdb
 f0 07 49 3f           ldi16	r3, 0x3f49
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 04              cmp32	q0, q1
 f1 04                 mov	r0, r4
 f0 31 02              ldsp16	r1, [sp+0x2]
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 e0 8c 01              jmp16	396 <L12>
<L0>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 0e                 fadd	q3, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 e0 c1 01              jmp16	449 <L13>
<L1>:
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 87                    and	r5, r7
 f0 06 db 0f           ldi16	r2, 0xfdb
 f0 07 49 40           ldi16	r3, 0x4049
 f0 04 db 0f           ldi16	r0, 0xfdb
 f0 05 49 c0           ldi16	r1, 0xc049
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 f1 22                 mov	r4, r2
 f4 09                 ldsp16	r5, [sp+0x2]
 fb 54                 cmov.ne	r2, r4
 fb 5d                 cmov.ne	r3, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 69 80              cmp32	q2, q0
 fd 32                 cmov.slt	r6, r2
 fd 3b                 cmov.slt	r7, r3
 02                    mov	r4, r6
 07                    mov	r5, r7
 e0 87 01              jmp16	391 <L13>
<L2>:
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 88                    and	r6, r4
 8d                    and	r7, r5
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 c4 db 0f              ldi16	r4, 0xfdb
 c5 c9 3f              ldi16	r5, 0x3fc9
 f0 06 db 0f           ldi16	r2, 0xfdb
 f0 07 c9 bf           ldi16	r3, 0xbfc9
 f0 69 c0              cmp32	q3, q0
 fb 62                 cmov.ne	r4, r2
 fb 6b                 cmov.ne	r5, r3
 e0 65 01              jmp16	357 <L13>
<L3>:
 f0 69 08              cmp32	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 da 1d 01              breq16	0x11d <L12>
 f0 69 04              cmp32	q0, q1
 d8 2d                 bruge8	0x2d <L4>
 ff 31                 fdiv	q0, q1
 f1 21                 mov	r4, r1
 c5 ff 3e              ldi16	r5, 0x3eff
 34                    cmp	r5, r4
 d2 52                 brult8	0x52 <L5>
 c5 7f 3e              ldi16	r5, 0x3e7f
 34                    cmp	r5, r4
 dc 9c 00              brult16	0x9c <L7>
 f2 68                 mov32	q2, q0
 ff 2a                 fmul	q2, q2
 ff ca 04 16 15 05 be 3e 59 4c 3e 46 aa aa be 00 00 80 3f      fpoly	4, -0.129963249, 0.199559182, -0.333330333, 1.0
 ff 22                 fmul	q0, q2
 e0 e3 00              jmp16	227 <L11>
<L4>:
 ff 34                 fdiv	q1, q0
 f1 23                 mov	r4, r3
 c5 ff 3e              ldi16	r5, 0x3eff
 34                    cmp	r5, r4
 d2 4e                 brult8	0x4e <L6>
 c5 7f 3e              ldi16	r5, 0x3e7f
 34                    cmp	r5, r4
 dc 90 00              brult16	0x90 <L8>
 f2 69                 mov32	q2, q1
 ff 2a                 fmul	q2, q2
 ff ca 04 16 15 05 be 3e 59 4c 3e 46 aa aa be 00 00 80 3f      fpoly	4, -0.129963249, 0.199559182, -0.333330333, 1.0
 ff 26                 fmul	q1, q2
 f2 69                 mov32	q2, q1
 e0 bc 00              jmp16	188 <L12>
<L5>:
 c5 3f 3f              ldi16	r5, 0x3f3f
 34                    cmp	r5, r4
 dc 8c 00              brult16	0x8c <L9>
 a0                    xor	r4, r4
 c5 20 bf              ldi16	r5, 0xbf20
 ff 02                 fadd	q0, q2
 f2 68                 mov32	q2, q0
 ff ca 05 a1 71 d1 3d c3 37 9c 3c ed 79 a5 be fd 17 38 3f 5e 00 0f 3f  fpoly	5, 0.102267511, 0.019069558, -0.323195845, 0.719116032, 0.558599353
 e0 89 00              jmp16	137 <L10>
<L6>:
 c5 3f 3f              ldi16	r5, 0x3f3f
 34                    cmp	r5, r4
 dc d3 00              brult16	0xd3 <L14>
 a0                    xor	r4, r4
 c5 20 bf              ldi16	r5, 0xbf20
 ff 06                 fadd	q1, q2
 f2 69                 mov32	q2, q1
 ff ca 05 a1 71 d1 3d c3 37 9c 3c ed 79 a5 be fd 17 38 3f 5e 00 0f 3f  fpoly	5, 0.102267511, 0.019069558, -0.323195845, 0.719116032, 0.558599353
 d4 6b                 jmp8	0x6b <L12>
<L7>:
 a0                    xor	r4, r4
 c5 c0 be              ldi16	r5, 0xbec0
 ff 02                 fadd	q0, q2
 f2 68                 mov32	q2, q0
 ff ca 05 29 9e 3f 3e ad d1 05 be 09 8f 93 be 92 70 60 3f c7 b0 b7 3e  fpoly	5, 0.187126771, -0.130682662, -0.288200647, 0.876717686, 0.358770579
 d4 40                 jmp8	0x40 <L10>
<L8>:
 a0                    xor	r4, r4
 c5 c0 be              ldi16	r5, 0xbec0
 ff 06                 fadd	q1, q2
 f2 69                 mov32	q2, q1
 ff ca 05 29 9e 3f 3e ad d1 05 be 09 8f 93 be 92 70 60 3f c7 b0 b7 3e  fpoly	5, 0.187126771, -0.130682662, -0.288200647, 0.876717686, 0.358770579
 d4 29                 jmp8	0x29 <L12>
<L9>:
 a0                    xor	r4, r4
 c5 60 bf              ldi16	r5, 0xbf60
 ff 02                 fadd	q0, q2
 f2 68                 mov32	q2, q0
 ff ca 05 d6 da b4 3c 79 68 9e 3d 96 b6 8f be 42 fe 10 3f 3f 05 38 3f  fpoly	5, 0.0220770054, 0.0773477033, -0.280689895, 0.566379666, 0.718830049
<L10>:
 f2 62                 mov32	q0, q2
<L11>:
 c4 db 0f              ldi16	r4, 0xfdb
 c5 c9 3f              ldi16	r5, 0x3fc9
 ff 18                 fsub	q2, q0
<L12>:
 f0 04 db 0f           ldi16	r0, 0xfdb
 f0 05 49 40           ldi16	r1, 0x4049
 ff 12                 fsub	q0, q2
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 40              cmp32	q1, q0
 f2 64                 mov32	q1, q0
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 fd 20                 cmov.slt	r4, r0
 fd 29                 cmov.slt	r5, r1
 f2 30                 sub	r0, r0
 f0 05 00 80           ldi16	r1, 0x8000
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 ff 66                 fabs	q2
 f2 62                 mov32	q0, q2
 ff 60                 fneg	q0
 f0 69 c4              cmp32	q3, q1
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
<L13>:
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L14>:
 a0                    xor	r4, r4
 c5 60 bf              ldi16	r5, 0xbf60
 ff 06                 fadd	q1, q2
 f2 69                 mov32	q2, q1
 ff ca 05 d6 da b4 3c 79 68 9e 3d 96 b6 8f be 42 fe 10 3f 3f 05 38 3f  fpoly	5, 0.0220770054, 0.0773477033, -0.280689895, 0.566379666, 0.718830049
 d4 98                 jmp8	-0x68 <L12>
