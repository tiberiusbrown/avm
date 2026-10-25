
math_sin.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 math_sin.c
00000100 l     O .data	00000004 input
00000104 l     O .data	00000004 result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 sf_sin.c
00000000 l    df *ABS*	00000000 ef_rem_pio2.c
00000000 l    df *ABS*	00000000 kf_rem_pio2.c
00000000 l    df *ABS*	00000000 integer.c
0000121c l       .init_array	00000000 .hidden __init_array_end
0000121c l       .init_array	00000000 .hidden __init_array_start
0000121c l       .fini_array	00000000 .hidden __fini_array_start
0000121c l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	0000004c avm_test_main
00000313 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000315 g     F .text	00000471 sinf
00000786 g     F .text	00000282 __ieee754_rem_pio2f
00000a08 g     F .text	00000750 __kernel_rem_pio2f
000011b0 g     F .text	0000006c __avm_mulsi3
00001184 g     F .text	0000002c __avm_lshrsi3
00001158 g     F .text	0000002c __avm_ashlsi3

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
 e1 f5 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 1c 12              ldi16	r4, 0x121c
 c1 00                 ldi8	r5, 0x0
 c6 1c 12              ldi16	r6, 0x121c
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 1c 12           ldi16	r0, 0x121c
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 1c 12           ldi16	r2, 0x121c
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
 e1 89 fd              call16	-631 <__avm_run_local_dtors>
<L0>:
 c4 1c 12              ldi16	r4, 0x121c
 c1 00                 ldi8	r5, 0x0
 c6 1c 12              ldi16	r6, 0x121c
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 1c 12           ldi16	r2, 0x121c
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 1c 12           ldi16	r0, 0x121c
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
 e1 40 fd              call16	-704 <__avm_run_local_dtors>
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
 d6 fa                 adjsp	-0x6
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 c0 20                 ldi8	r4, 0x20
 d7 01                 sys	debug_break
 aa                    xor	r6, r6
 c7 00 3d              ldi16	r7, 0x3d00
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 64                 mov32	q1, q0
<L0>:
 f4 50                 stsp16	[sp+0x4], r4
 f2 68                 mov32	q2, q0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 2b                 fmul	q2, q3
 c6 00 01              ldi16	r6, 0x100
 f0 6a cc              ld32	q3, [r6]
 ff 0b                 fadd	q2, q3
 d5 22                 call8	sinf
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 03                 fadd	q0, q3
 ff 06                 fadd	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 b4                 dec16	r4
 f4 a4                 tst8	r4
 d1 dc                 brne8	-0x24 <L0>
 c4 04 01              ldi16	r4, 0x104
 f0 6b 48              st32	[r4], q1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<sinf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e4                 adjsp	-0x1c
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 f0 06 d8 0f           ldi16	r2, 0xfd8
 f0 07 49 3f           ldi16	r3, 0x3f49
 f0 69 4c              cmp32	q1, q3
 d2 69                 brult8	0x69 <L0>
 f2 30                 sub	r0, r0
 f0 05 00 32           ldi16	r1, 0x3200
 f0 69 c0              cmp32	q3, q0
 dc 3d 04              brult16	0x43d <L11>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2f                 fmul	q3, q3
 f0 04 d3 c9           ldi16	r0, 0xc9d3
 f0 05 2e 2f           ldi16	r1, 0x2f2e
 f2 67                 mov32	q1, q3
 ff 24                 fmul	q1, q0
 f0 04 34 2f           ldi16	r0, 0x2f34
 f0 05 d7 b2           ldi16	r1, 0xb2d7
 ff 04                 fadd	q1, q0
 f2 63                 mov32	q0, q3
 ff 21                 fmul	q0, q1
 f0 06 1b ef           ldi16	r2, 0xef1b
 f0 07 38 36           ldi16	r3, 0x3638
 ff 01                 fadd	q0, q1
 f2 67                 mov32	q1, q3
 ff 24                 fmul	q1, q0
 f0 04 01 0d           ldi16	r0, 0xd01
 f0 05 50 b9           ldi16	r1, 0xb950
 ff 04                 fadd	q1, q0
 f2 63                 mov32	q0, q3
 ff 21                 fmul	q0, q1
 f0 06 89 88           ldi16	r2, 0x8889
 f0 07 08 3c           ldi16	r3, 0x3c08
 ff 01                 fadd	q0, q1
 f2 67                 mov32	q1, q3
 ff 24                 fmul	q1, q0
 f0 04 ab aa           ldi16	r0, 0xaaab
 f0 05 2a be           ldi16	r1, 0xbe2a
 ff 04                 fadd	q1, q0
 f2 62                 mov32	q0, q2
 ff 23                 fmul	q0, q3
 ff 21                 fmul	q0, q1
 ff 08                 fadd	q2, q0
 e0 e0 03              jmp16	992 <L11>
<L0>:
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 c4              cmp32	q3, q1
 dd e4 00              bruge16	0xe4 <L1>
 f0 16 0c              leasp	r6, 0xc
 e1 d5 03              call16	__ieee754_rem_pio2f
 c2 03                 ldi8	r6, 0x3
 88                    and	r6, r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 ce 02                 cmpi.s8	r6, 0x2
 df d3 00              brsge16	0xd3 <L2>
 f4 a6                 tst8	r6
 db 9c 01              brne16	0x19c <L3>
 aa                    xor	r6, r6
 c7 00 32              ldi16	r7, 0x3200
 f0 69 0c              cmp32	q0, q3
 dc af 03              brult16	0x3af <L11>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2f                 fmul	q3, q3
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 04 d3 c9           ldi16	r0, 0xc9d3
 f0 05 2e 2f           ldi16	r1, 0x2f2e
 f2 67                 mov32	q1, q3
 ff 24                 fmul	q1, q0
 f0 04 34 2f           ldi16	r0, 0x2f34
 f0 05 d7 b2           ldi16	r1, 0xb2d7
 ff 04                 fadd	q1, q0
 f2 63                 mov32	q0, q3
 ff 21                 fmul	q0, q1
 f0 06 1b ef           ldi16	r2, 0xef1b
 f0 07 38 36           ldi16	r3, 0x3638
 ff 01                 fadd	q0, q1
 f2 67                 mov32	q1, q3
 ff 24                 fmul	q1, q0
 f0 04 01 0d           ldi16	r0, 0xd01
 f0 05 50 b9           ldi16	r1, 0xb950
 ff 04                 fadd	q1, q0
 f2 63                 mov32	q0, q3
 ff 21                 fmul	q0, q1
 f0 06 89 88           ldi16	r2, 0x8889
 f0 07 08 3c           ldi16	r3, 0x3c08
 ff 01                 fadd	q0, q1
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 f2 66                 mov32	q1, q2
 ff 27                 fmul	q1, q3
 f0 04 ab aa           ldi16	r0, 0xaaab
 f0 05 2a 3e           ldi16	r1, 0x3e2a
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f2 61                 mov32	q0, q1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 23                 fmul	q0, q3
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 ff 24                 fmul	q1, q0
 f0 3a 18              stsp16	[sp+0x18], r2
 f0 3b 1a              stsp16	[sp+0x1a], r3
 f2 30                 sub	r0, r0
 f0 05 00 3f           ldi16	r1, 0x3f00
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 ff 21                 fmul	q0, q1
 f0 32 18              ldsp16	r2, [sp+0x18]
 f0 33 1a              ldsp16	r3, [sp+0x1a]
 ff 11                 fsub	q0, q1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 2c                 fmul	q3, q0
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 ff 1c                 fsub	q3, q0
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 ff 0c                 fadd	q3, q0
 ff 1b                 fsub	q2, q3
 e0 f0 02              jmp16	752 <L11>
<L1>:
 ff 1a                 fsub	q2, q2
 e0 eb 02              jmp16	747 <L11>
<L2>:
 ce 02                 cmpi.s8	r6, 0x2
 db df 00              brne16	0xdf <L4>
 aa                    xor	r6, r6
 c7 00 32              ldi16	r7, 0x3200
 f0 69 0c              cmp32	q0, q3
 dc da 02              brult16	0x2da <L10>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2f                 fmul	q3, q3
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 04 d3 c9           ldi16	r0, 0xc9d3
 f0 05 2e 2f           ldi16	r1, 0x2f2e
 f2 67                 mov32	q1, q3
 ff 24                 fmul	q1, q0
 f0 04 34 2f           ldi16	r0, 0x2f34
 f0 05 d7 b2           ldi16	r1, 0xb2d7
 ff 04                 fadd	q1, q0
 f2 63                 mov32	q0, q3
 ff 21                 fmul	q0, q1
 f0 06 1b ef           ldi16	r2, 0xef1b
 f0 07 38 36           ldi16	r3, 0x3638
 ff 01                 fadd	q0, q1
 f2 67                 mov32	q1, q3
 ff 24                 fmul	q1, q0
 f0 04 01 0d           ldi16	r0, 0xd01
 f0 05 50 b9           ldi16	r1, 0xb950
 ff 04                 fadd	q1, q0
 f2 63                 mov32	q0, q3
 ff 21                 fmul	q0, q1
 f0 06 89 88           ldi16	r2, 0x8889
 f0 07 08 3c           ldi16	r3, 0x3c08
 ff 01                 fadd	q0, q1
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 f2 66                 mov32	q1, q2
 ff 27                 fmul	q1, q3
 f0 04 ab aa           ldi16	r0, 0xaaab
 f0 05 2a 3e           ldi16	r1, 0x3e2a
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f2 61                 mov32	q0, q1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 23                 fmul	q0, q3
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 ff 24                 fmul	q1, q0
 f0 3a 18              stsp16	[sp+0x18], r2
 f0 3b 1a              stsp16	[sp+0x1a], r3
 f2 30                 sub	r0, r0
 f0 05 00 3f           ldi16	r1, 0x3f00
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 ff 21                 fmul	q0, q1
 f0 32 18              ldsp16	r2, [sp+0x18]
 f0 33 1a              ldsp16	r3, [sp+0x1a]
 ff 11                 fsub	q0, q1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 2c                 fmul	q3, q0
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 ff 1c                 fsub	q3, q0
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 ff 0c                 fadd	q3, q0
 ff 1b                 fsub	q2, q3
 e0 1b 02              jmp16	539 <L10>
<L3>:
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 aa                    xor	r6, r6
 c7 00 32              ldi16	r7, 0x3200
 f0 69 0c              cmp32	q0, q3
 d8 1e                 bruge8	0x1e <L5>
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 e0 07 02              jmp16	519 <L11>
<L4>:
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 aa                    xor	r6, r6
 c7 00 32              ldi16	r7, 0x3200
 f0 69 0c              cmp32	q0, q3
 dd a2 00              bruge16	0xa2 <L6>
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 e0 ee 01              jmp16	494 <L10>
<L5>:
 f0 3a 14              stsp16	[sp+0x14], r2
 f0 3b 16              stsp16	[sp+0x16], r3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2f                 fmul	q3, q3
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 06 4e d7           ldi16	r2, 0xd74e
 f0 07 47 ad           ldi16	r3, 0xad47
 ff 2d                 fmul	q3, q1
 f0 06 f6 74           ldi16	r2, 0x74f6
 f0 07 0f 31           ldi16	r3, 0x310f
 ff 0d                 fadd	q3, q1
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 ff 27                 fmul	q1, q3
 c6 7c f2              ldi16	r6, 0xf27c
 c7 93 b4              ldi16	r7, 0xb493
 ff 07                 fadd	q1, q3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 2d                 fmul	q3, q1
 f0 06 01 0d           ldi16	r2, 0xd01
 f0 07 d0 37           ldi16	r3, 0x37d0
 ff 0d                 fadd	q3, q1
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 ff 27                 fmul	q1, q3
 c6 61 0b              ldi16	r6, 0xb61
 c7 b6 ba              ldi16	r7, 0xbab6
 ff 07                 fadd	q1, q3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 2d                 fmul	q3, q1
 f0 06 ab aa           ldi16	r2, 0xaaab
 f0 07 2a 3d           ldi16	r3, 0x3d2a
 ff 0d                 fadd	q3, q1
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 ff 27                 fmul	q1, q3
 c6 99 99              ldi16	r6, 0x9999
 c7 99 3e              ldi16	r7, 0x3e99
 f0 69 c0              cmp32	q3, q0
 dc be 00              brult16	0xbe <L7>
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 2b                 fmul	q2, q3
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f2 6a                 mov32	q3, q0
 ff 2d                 fmul	q3, q1
 ff 1b                 fsub	q2, q3
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 23                 fmul	q0, q3
 ff 02                 fadd	q0, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 ff 18                 fsub	q2, q0
 e0 55 01              jmp16	341 <L11>
<L6>:
 f0 3a 14              stsp16	[sp+0x14], r2
 f0 3b 16              stsp16	[sp+0x16], r3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2f                 fmul	q3, q3
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 06 4e d7           ldi16	r2, 0xd74e
 f0 07 47 ad           ldi16	r3, 0xad47
 ff 2d                 fmul	q3, q1
 f0 06 f6 74           ldi16	r2, 0x74f6
 f0 07 0f 31           ldi16	r3, 0x310f
 ff 0d                 fadd	q3, q1
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 ff 27                 fmul	q1, q3
 c6 7c f2              ldi16	r6, 0xf27c
 c7 93 b4              ldi16	r7, 0xb493
 ff 07                 fadd	q1, q3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 2d                 fmul	q3, q1
 f0 06 01 0d           ldi16	r2, 0xd01
 f0 07 d0 37           ldi16	r3, 0x37d0
 ff 0d                 fadd	q3, q1
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 ff 27                 fmul	q1, q3
 c6 61 0b              ldi16	r6, 0xb61
 c7 b6 ba              ldi16	r7, 0xbab6
 ff 07                 fadd	q1, q3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 2d                 fmul	q3, q1
 f0 06 ab aa           ldi16	r2, 0xaaab
 f0 07 2a 3d           ldi16	r3, 0x3d2a
 ff 0d                 fadd	q3, q1
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 ff 27                 fmul	q1, q3
 c6 99 99              ldi16	r6, 0x9999
 c7 99 3e              ldi16	r7, 0x3e99
 f0 69 c0              cmp32	q3, q0
 dc 81 00              brult16	0x81 <L8>
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 2b                 fmul	q2, q3
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f2 6a                 mov32	q3, q0
 ff 2d                 fmul	q3, q1
 ff 1b                 fsub	q2, q3
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 23                 fmul	q0, q3
 ff 02                 fadd	q0, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 e0 b8 00              jmp16	184 <L9>
<L7>:
 aa                    xor	r6, r6
 c7 00 ff              ldi16	r7, 0xff00
 f7 6c                 add32	q3, q0
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 aa                    xor	r6, r6
 c7 48 3f              ldi16	r7, 0x3f48
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c7 90 3e              ldi16	r7, 0x3e90
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c0              cmp32	q3, q0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 fc 30                 cmov.ult	r6, r0
 fc 39                 cmov.ult	r7, r1
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 2b                 fmul	q2, q3
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f2 6a                 mov32	q3, q0
 ff 2d                 fmul	q3, q1
 ff 1b                 fsub	q2, q3
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 23                 fmul	q0, q3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 13                 fsub	q0, q3
 ff 02                 fadd	q0, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 ff 1b                 fsub	q2, q3
 ff 18                 fsub	q2, q0
 d4 5e                 jmp8	0x5e <L11>
<L8>:
 aa                    xor	r6, r6
 c7 00 ff              ldi16	r7, 0xff00
 f7 6c                 add32	q3, q0
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 aa                    xor	r6, r6
 c7 48 3f              ldi16	r7, 0x3f48
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c7 90 3e              ldi16	r7, 0x3e90
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c0              cmp32	q3, q0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 fc 30                 cmov.ult	r6, r0
 fc 39                 cmov.ult	r7, r1
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 2b                 fmul	q2, q3
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f2 6a                 mov32	q3, q0
 ff 2d                 fmul	q3, q1
 ff 1b                 fsub	q2, q3
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 23                 fmul	q0, q3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 13                 fsub	q0, q3
 ff 02                 fadd	q0, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 ff 1b                 fsub	q2, q3
<L9>:
 ff 18                 fsub	q2, q0
<L10>:
 ff 62                 fneg	q2
<L11>:
 d6 1c                 adjsp	0x1c
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__ieee754_rem_pio2f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e6                 adjsp	-0x1a
 f1 06                 mov	r0, r6
 f2 66                 mov32	q1, q2
 ff 66                 fabs	q2
 c6 d8 0f              ldi16	r6, 0xfd8
 c7 49 3f              ldi16	r7, 0x3f49
 f0 69 c8              cmp32	q3, q2
 d2 0e                 brult8	0xe <L0>
 f0 6b 40              st32	[r0], q1
 f0 08 04              addi.s8	r0, 0x4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 6b 80              st32	[r0], q2
 e0 56 02              jmp16	598 <L13>
<L0>:
 c6 e3 cb              ldi16	r6, 0xcbe3
 c7 16 40              ldi16	r7, 0x4016
 f0 69 c8              cmp32	q3, q2
 d2 36                 brult8	0x36 <L1>
 c6 f0 ff              ldi16	r6, 0xfff0
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 de 81 01              brslt16	0x181 <L3>
 c4 80 0f              ldi16	r4, 0xf80
 c5 c9 bf              ldi16	r5, 0xbfc9
 ff 06                 fadd	q1, q2
 c4 d0 0f              ldi16	r4, 0xfd0
 c5 c9 3f              ldi16	r5, 0x3fc9
 f0 69 c8              cmp32	q3, q2
 db 8d 01              brne16	0x18d <L4>
 c4 00 44              ldi16	r4, 0x4400
 c5 35 b7              ldi16	r5, 0xb735
 ff 06                 fadd	q1, q2
 c4 08 a3              ldi16	r4, 0xa308
 c5 85 ae              ldi16	r5, 0xae85
 e0 82 01              jmp16	386 <L5>
<L1>:
 c6 80 0f              ldi16	r6, 0xf80
 c7 49 43              ldi16	r7, 0x4349
 f0 69 c8              cmp32	q3, q2
 dc 3a 01              brult16	0x13a <L2>
 c6 84 f9              ldi16	r6, 0xf984
 c7 22 3f              ldi16	r7, 0x3f22
 f0 38 0c              stsp16	[sp+0xc], r0
 f2 62                 mov32	q0, q2
 ff 23                 fmul	q0, q3
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 03                 fadd	q0, q3
 ff c6 00              ftos32	q0, q0
 f1 28                 mov	r6, r0
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 ff c0 03              s16tof	q3, r0
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 04 80 0f           ldi16	r0, 0xf80
 f0 05 c9 bf           ldi16	r1, 0xbfc9
 ff 2c                 fmul	q3, q0
 f2 62                 mov32	q0, q2
 ff 03                 fadd	q0, q3
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 c6 43 44              ldi16	r6, 0x4443
 c7 35 37              ldi16	r7, 0x3735
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 2c                 fmul	q3, q0
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 ff 13                 fsub	q0, q3
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 f1 29                 mov	r6, r1
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 c2 ff                 ldi8	r6, 0xff
 f0 30 04              ldsp16	r0, [sp+0x4]
 f1 0f                 mov	r1, r7
 f9 18                 and	r0, r6
 f0 38 04              stsp16	[sp+0x4], r0
 f4 32                 ldsp16	r6, [sp+0xc]
 f0 30 16              ldsp16	r0, [sp+0x16]
 f0 31 18              ldsp16	r1, [sp+0x18]
 f0 6b 0c              st32	[r6], q0
 01                    mov	r4, r5
 a5                    xor	r5, r5
 fa 77                 lsr16i	r4, 0x7
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f7 7b                 sub32	q2, q3
 cc 09                 cmpi.s8	r4, 0x9
 de 2e 01              brslt16	0x12e <L10>
 c6 00 44              ldi16	r6, 0x4400
 c7 35 37              ldi16	r7, 0x3735
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 2b                 fmul	q2, q3
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f2 6a                 mov32	q3, q0
 ff 1e                 fsub	q3, q2
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 ff 13                 fsub	q0, q3
 ff 12                 fsub	q0, q2
 c4 08 a3              ldi16	r4, 0xa308
 c5 85 2e              ldi16	r5, 0x2e85
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 2b                 fmul	q2, q3
 ff 18                 fsub	q2, q0
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 ff 12                 fsub	q0, q2
 f4 32                 ldsp16	r6, [sp+0xc]
 f0 6b 0c              st32	[r6], q0
 f1 29                 mov	r6, r1
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 c0 ff                 ldi8	r4, 0xff
 88                    and	r6, r4
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 f7 7b                 sub32	q2, q3
 cc 1a                 cmpi.s8	r4, 0x1a
 de bf 00              brslt16	0xbf <L9>
 c6 00 a3              ldi16	r6, 0xa300
 c7 85 2e              ldi16	r7, 0x2e85
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 2b                 fmul	q2, q3
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f2 6a                 mov32	q3, q0
 ff 1e                 fsub	q3, q2
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 ff 13                 fsub	q0, q3
 ff 12                 fsub	q0, q2
 c4 32 31              ldi16	r4, 0x3132
 c5 8d 24              ldi16	r5, 0x248d
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 2e                 fmul	q3, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 18                 fsub	q2, q0
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 ff 12                 fsub	q0, q2
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 f4 32                 ldsp16	r6, [sp+0xc]
 f0 6b 0c              st32	[r6], q0
 e0 8e 00              jmp16	142 <L11>
<L2>:
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 8c              cmp32	q2, q3
 d8 48                 bruge8	0x48 <L6>
 f2 69                 mov32	q2, q1
 f1 28                 mov	r6, r0
 d6 1a                 adjsp	0x1a
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 e0 c0 00              jmp16	__kernel_rem_pio2f
<L3>:
 c4 80 0f              ldi16	r4, 0xf80
 c5 c9 3f              ldi16	r5, 0x3fc9
 ff 06                 fadd	q1, q2
 c4 d0 0f              ldi16	r4, 0xfd0
 f0 69 c8              cmp32	q3, q2
 d1 39                 brne8	0x39 <L7>
 c4 00 44              ldi16	r4, 0x4400
 c5 35 37              ldi16	r5, 0x3735
 ff 06                 fadd	q1, q2
 c4 08 a3              ldi16	r4, 0xa308
 c5 85 2e              ldi16	r5, 0x2e85
 d4 2f                 jmp8	0x2f <L8>
<L4>:
 c4 43 44              ldi16	r4, 0x4443
 c5 35 b7              ldi16	r5, 0xb735
<L5>:
 f2 6b                 mov32	q3, q1
 ff 0e                 fadd	q3, q2
 f0 6b c0              st32	[r0], q3
 ff 17                 fsub	q1, q3
 ff 06                 fadd	q1, q2
 f0 08 04              addi.s8	r0, 0x4
 f0 6b 40              st32	[r0], q1
 c0 01                 ldi8	r4, 0x1
 d4 7e                 jmp8	0x7e <L13>
<L6>:
 ff 15                 fsub	q1, q1
 f0 6b 40              st32	[r0], q1
 f0 08 04              addi.s8	r0, 0x4
 f0 6b 40              st32	[r0], q1
 a0                    xor	r4, r4
 d4 70                 jmp8	0x70 <L13>
<L7>:
 c4 43 44              ldi16	r4, 0x4443
 c5 35 37              ldi16	r5, 0x3735
<L8>:
 f2 6b                 mov32	q3, q1
 ff 0e                 fadd	q3, q2
 f0 6b c0              st32	[r0], q3
 ff 17                 fsub	q1, q3
 ff 06                 fadd	q1, q2
 f0 08 04              addi.s8	r0, 0x4
 f0 6b 40              st32	[r0], q1
 c4 ff ff              ldi16	r4, 0xffff
 d4 54                 jmp8	0x54 <L13>
<L9>:
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
<L10>:
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
<L11>:
 f0 30 16              ldsp16	r0, [sp+0x16]
 f0 31 18              ldsp16	r1, [sp+0x18]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 1c                 fsub	q3, q0
 ff 1e                 fsub	q3, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 c8 04                 addi.s8	r4, 0x4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 6b c8              st32	[r4], q3
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 84              cmp32	q2, q1
 d9 05                 brsge8	0x5 <L12>
 f0 34 12              ldsp16	r4, [sp+0x12]
 d4 18                 jmp8	0x18 <L13>
<L12>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 63                 fneg	q3
 f4 31                 ldsp16	r5, [sp+0xc]
 01                    mov	r4, r5
 c8 04                 addi.s8	r4, 0x4
 f0 6b c8              st32	[r4], q3
 ff 60                 fneg	q0
 f0 6b 0a              st32	[r5], q0
 a0                    xor	r4, r4
 f0 36 12              ldsp16	r6, [sp+0x12]
 22                    sub	r4, r6
<L13>:
 d6 1a                 adjsp	0x1a
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__kernel_rem_pio2f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 b3                 adjsp	-0x4d
 f0 3e 20              stsp16	[sp+0x20], r6
 f2 62                 mov32	q0, q2
 c0 7f                 ldi8	r4, 0x7f
 f9 84                 and	r4, r1
 c1 80                 ldi8	r5, 0x80
 94                    or	r5, r4
 f1 20                 mov	r4, r0
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 c2 61                 ldi8	r6, 0x61
 af                    xor	r7, r7
 e1 8a 07              call16	__avm_mulsi3
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 01                    mov	r4, r5
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 c5                 ldi8	r6, 0xc5
 af                    xor	r7, r7
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 e1 6c 07              call16	__avm_mulsi3
 f7 69                 add32	q2, q1
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 14              ldsp16	r4, [sp+0x14]
 08                    mov	r6, r4
 f0 2e 26              stsp8	[sp+0x26], r6
 f0 38 22              stsp16	[sp+0x22], r0
 f0 39 24              stsp16	[sp+0x24], r1
 f1 21                 mov	r4, r1
 fa 77                 lsr16i	r4, 0x7
 f1 74                 zext8	r4
 c5 96 01              ldi16	r5, 0x196
 08                    mov	r6, r4
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 09                    mov	r6, r5
 28                    sub	r6, r4
 c0 07                 ldi8	r4, 0x7
 06                    mov	r5, r6
 84                    and	r5, r4
 f0 3d 14              stsp16	[sp+0x14], r5
 fa 93                 lsr16i	r6, 0x3
 f0 14 26              leasp	r4, 0x26
 f0 3c 10              stsp16	[sp+0x10], r4
 18                    add	r6, r4
 f0 3e 18              stsp16	[sp+0x18], r6
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 0c                    mov	r7, r4
 f0 2f 27              stsp8	[sp+0x27], r7
 01                    mov	r4, r5
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 bb                 ldi8	r6, 0xbb
 af                    xor	r7, r7
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f2 68                 mov32	q2, q0
 e1 12 07              call16	__avm_mulsi3
 f7 69                 add32	q2, q1
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 01                    mov	r4, r5
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 de                 ldi8	r6, 0xde
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 f6 06              call16	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 2c 28              stsp8	[sp+0x28], r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 ab                 ldi8	r6, 0xab
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 cf 06              call16	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 2c 29              stsp8	[sp+0x29], r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 50                 stsp16	[sp+0x4], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 63                 ldi8	r6, 0x63
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 a8 06              call16	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 2c 2a              stsp8	[sp+0x2a], r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 51                 ldi8	r6, 0x51
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 81 06              call16	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 2c 2b              stsp8	[sp+0x2b], r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 50                 stsp16	[sp+0x4], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 fe                 ldi8	r6, 0xfe
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 5a 06              call16	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 2c 2c              stsp8	[sp+0x2c], r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 41                 ldi8	r6, 0x41
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 33 06              call16	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 2c 2d              stsp8	[sp+0x2d], r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 50                 stsp16	[sp+0x4], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 90                 ldi8	r6, 0x90
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 0c 06              call16	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 2c 2e              stsp8	[sp+0x2e], r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 43                 ldi8	r6, 0x43
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 e5 05              call16	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 2c 2f              stsp8	[sp+0x2f], r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 50                 stsp16	[sp+0x4], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 3c                 ldi8	r6, 0x3c
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 be 05              call16	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 2c 30              stsp8	[sp+0x30], r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 99                 ldi8	r6, 0x99
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 97 05              call16	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 2c 31              stsp8	[sp+0x31], r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 50                 stsp16	[sp+0x4], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 95                 ldi8	r6, 0x95
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 70 05              call16	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 2c 32              stsp8	[sp+0x32], r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 62                 ldi8	r6, 0x62
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 49 05              call16	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 2c 33              stsp8	[sp+0x33], r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 50                 stsp16	[sp+0x4], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 db                 ldi8	r6, 0xdb
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 22 05              call16	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 2c 34              stsp8	[sp+0x34], r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 c0                 ldi8	r6, 0xc0
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 fb 04              call16	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 2c 35              stsp8	[sp+0x35], r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 50                 stsp16	[sp+0x4], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 dd                 ldi8	r6, 0xdd
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 d4 04              call16	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 2c 36              stsp8	[sp+0x36], r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 34                 ldi8	r6, 0x34
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 ad 04              call16	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 2c 37              stsp8	[sp+0x37], r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 50                 stsp16	[sp+0x4], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 f5                 ldi8	r6, 0xf5
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 86 04              call16	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 2c 38              stsp8	[sp+0x38], r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 d1                 ldi8	r6, 0xd1
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 5f 04              call16	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 2c 39              stsp8	[sp+0x39], r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 50                 stsp16	[sp+0x4], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 57                 ldi8	r6, 0x57
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 38 04              call16	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 2c 3a              stsp8	[sp+0x3a], r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 27                 ldi8	r6, 0x27
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 11 04              call16	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 2c 3b              stsp8	[sp+0x3b], r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 50                 stsp16	[sp+0x4], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 fc                 ldi8	r6, 0xfc
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 ea 03              call16	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 2c 3c              stsp8	[sp+0x3c], r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 29                 ldi8	r6, 0x29
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 c3 03              call16	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 2c 3d              stsp8	[sp+0x3d], r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 50                 stsp16	[sp+0x4], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 15                 ldi8	r6, 0x15
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 9c 03              call16	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 2c 3e              stsp8	[sp+0x3e], r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 44                 ldi8	r6, 0x44
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 75 03              call16	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 2c 3f              stsp8	[sp+0x3f], r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 50                 stsp16	[sp+0x4], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 4e                 ldi8	r6, 0x4e
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 4e 03              call16	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 2c 40              stsp8	[sp+0x40], r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 6e                 ldi8	r6, 0x6e
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 27 03              call16	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 2c 41              stsp8	[sp+0x41], r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 50                 stsp16	[sp+0x4], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 83                 ldi8	r6, 0x83
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 00 03              call16	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 2c 42              stsp8	[sp+0x42], r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 f9                 ldi8	r6, 0xf9
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 d9 02              call16	__avm_mulsi3
 f7 69                 add32	q2, q1
 f4 12                 ldsp16	r6, [sp+0x4]
 f0 2e 43              stsp8	[sp+0x43], r6
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f4 42                 stsp16	[sp+0x0], r6
 09                    mov	r6, r5
 af                    xor	r7, r7
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 fa 58                 lsl16i	r6, 0x8
 f4 03                 ldsp16	r7, [sp+0x0]
 9b                    or	r6, r7
 f4 52                 stsp16	[sp+0x4], r6
 f0 2c 44              stsp8	[sp+0x44], r4
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 fa 98                 lsr16i	r6, 0x8
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 14                 mov	r2, r4
 f1 1e                 mov	r3, r6
 c2 a2                 ldi8	r6, 0xa2
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 a8 02              call16	__avm_mulsi3
 f7 69                 add32	q2, q1
 f0 3c 45              stsp16	[sp+0x45], r4
 f0 3d 47              stsp16	[sp+0x47], r5
 f0 34 18              ldsp16	r4, [sp+0x18]
 48                    ld8u	r6, [r4]
 f0 35 14              ldsp16	r5, [sp+0x14]
 fa 19                 lsr16v	r6, r5
 cd 07                 cmpi.s8	r5, 0x7
 d1 05                 brne8	0x5 <L0>
 ed 88 21              ld8u	r4, [r4+1]
 10                    add	r4, r4
 98                    or	r6, r4
<L0>:
 f0 3e 14              stsp16	[sp+0x14], r6
 c6 76 01              ldi16	r6, 0x176
 f4 20                 ldsp16	r4, [sp+0x8]
 28                    sub	r6, r4
 02                    mov	r4, r6
 fa 73                 lsr16i	r4, 0x3
 f0 31 10              ldsp16	r1, [sp+0x10]
 f2 0c                 add	r1, r4
 c0 07                 ldi8	r4, 0x7
 88                    and	r6, r4
 f4 72                 stsp16	[sp+0xc], r6
 af                    xor	r7, r7
 f0 6a 82              ld32	q2, [r1]
 e1 45 02              call16	__avm_lshrsi3
 f4 33                 ldsp16	r7, [sp+0xc]
 f4 a7                 tst8	r7
 f0 00 20              ldi8	r0, 0x20
 d0 19                 breq8	0x19 <L1>
 f1 28                 mov	r6, r0
 2b                    sub	r6, r7
 f2 66                 mov32	q1, q2
 af                    xor	r7, r7
 ed 82 24              ld8u	r4, [r1+4]
 a5                    xor	r5, r5
 e1 03 02              call16	__avm_ashlsi3
 f9 51                 or	r2, r4
 f9 75                 or	r3, r5
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 d4 04                 jmp8	0x4 <L2>
<L1>:
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
<L2>:
 c0 03                 ldi8	r4, 0x3
 f0 3c 10              stsp16	[sp+0x10], r4
 c6 56 01              ldi16	r6, 0x156
 f4 20                 ldsp16	r4, [sp+0x8]
 28                    sub	r6, r4
 02                    mov	r4, r6
 fa 73                 lsr16i	r4, 0x3
 f0 11 26              leasp	r1, 0x26
 f2 0c                 add	r1, r4
 c0 07                 ldi8	r4, 0x7
 88                    and	r6, r4
 f4 62                 stsp16	[sp+0x8], r6
 af                    xor	r7, r7
 f0 6a 82              ld32	q2, [r1]
 e1 00 02              call16	__avm_lshrsi3
 f2 66                 mov32	q1, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 a4                 tst8	r4
 d0 10                 breq8	0x10 <L3>
 f2 34                 sub	r0, r4
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 ed 82 24              ld8u	r4, [r1+4]
 a5                    xor	r5, r5
 e1 c0 01              call16	__avm_ashlsi3
 f9 51                 or	r2, r4
 f9 75                 or	r3, r5
<L3>:
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 10              ldsp16	r5, [sp+0x10]
 81                    and	r4, r5
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 69 0c              cmp32	q0, q3
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 3c 14              stsp16	[sp+0x14], r4
 d9 0a                 brsge8	0xa <L4>
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 02                    mov	r4, r6
 07                    mov	r5, r7
 d4 20                 jmp8	0x20 <L5>
<L4>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 f0 69 40              cmp32	q1, q0
 f8 04                 cset.eq	r4
 a5                    xor	r5, r5
 f7 6b                 add32	q2, q3
 f7 71                 sub32	q0, q1
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f0 36 14              ldsp16	r6, [sp+0x14]
 f4 ae                 inc16	r6
 f0 3e 14              stsp16	[sp+0x14], r6
<L5>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f2 39                 sub	r1, r1
 f1 15                 mov	r2, r5
 f2 4b                 sub	r3, r3
 f9 80                 and	r4, r0
 f9 a4                 and	r5, r1
 ff c5 0e              u32tof	q3, q2
 a0                    xor	r4, r4
 c5 80 2f              ldi16	r5, 0x2f80
 ff 2e                 fmul	q3, q2
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 ff c5 0d              u32tof	q3, q1
 c5 80 37              ldi16	r5, 0x3780
 ff 2e                 fmul	q3, q2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 0e                 fadd	q3, q2
 c4 00 f0              ldi16	r4, 0xf000
 c5 ff ff              ldi16	r5, 0xffff
 82                    and	r4, r6
 87                    and	r5, r7
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f9 10                 and	r0, r4
 ff c5 00              u32tof	q0, q0
 f2 42                 sub	r2, r2
 f0 07 80 1f           ldi16	r3, 0x1f80
 ff 21                 fmul	q0, q1
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 ff c5 08              u32tof	q2, q0
 f2 30                 sub	r0, r0
 f0 05 80 27           ldi16	r1, 0x2780
 ff 28                 fmul	q2, q0
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 35 24              ldsp16	r5, [sp+0x24]
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 f2 63                 mov32	q0, q3
 ff 22                 fmul	q0, q2
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f0 07 c9 3f           ldi16	r3, 0x3fc9
 ff 29                 fmul	q2, q1
 ff 18                 fsub	q2, q0
 f0 04 00 a0           ldi16	r0, 0xa000
 f0 05 fd 39           ldi16	r1, 0x39fd
 f0 32 18              ldsp16	r2, [sp+0x18]
 f0 33 1a              ldsp16	r3, [sp+0x1a]
 ff 24                 fmul	q1, q0
 ff 06                 fadd	q1, q2
 f0 3a 49              stsp16	[sp+0x49], r2
 f0 3b 4b              stsp16	[sp+0x4b], r3
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 ff 09                 fadd	q2, q1
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 c4 69 21              ldi16	r4, 0x2169
 c5 a2 33              ldi16	r5, 0x33a2
 f2 67                 mov32	q1, q3
 ff 26                 fmul	q1, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 1b                 fsub	q2, q3
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 ff 1e                 fsub	q3, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 30                 sub	r0, r0
 f0 05 c9 3f           ldi16	r1, 0x3fc9
 ff 28                 fmul	q2, q0
 f0 30 49              ldsp16	r0, [sp+0x49]
 f0 31 4b              ldsp16	r1, [sp+0x4b]
 ff 08                 fadd	q2, q0
 f0 04 00 a0           ldi16	r0, 0xa000
 f0 05 fd 39           ldi16	r1, 0x39fd
 ff 2c                 fmul	q3, q0
 ff 0e                 fadd	q3, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 ff 08                 fadd	q2, q0
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 ff 02                 fadd	q0, q2
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 ff 22                 fmul	q0, q2
 ff 04                 fadd	q1, q0
 ff 07                 fadd	q1, q3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 09                 fadd	q2, q1
 ff 1e                 fsub	q3, q2
 ff 07                 fadd	q1, q3
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f0 69 c0              cmp32	q3, q0
 d3 04                 brslt8	0x4 <L6>
 ff 61                 fneg	q1
 ff 62                 fneg	q2
<L6>:
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 a5                    xor	r5, r5
 f0 36 14              ldsp16	r6, [sp+0x14]
 26                    sub	r5, r6
 02                    mov	r4, r6
 f0 30 22              ldsp16	r0, [sp+0x22]
 f0 31 24              ldsp16	r1, [sp+0x24]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 fd 25                 cmov.slt	r4, r5
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f0 6b 0c              st32	[r6], q0
 ca 04                 addi.s8	r6, 0x4
 f0 6b 4c              st32	[r6], q1
 d6 4d                 adjsp	0x4d
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_ashlsi3>:
 f6 2f                 tst16	r7
 d1 23                 brne8	0x23 <L1>
 ce 10                 cmpi.s8	r6, 0x10
 d8 12                 bruge8	0x12 <L0>
 f6 2e                 tst16	r6
 d0 1f                 breq8	0x1f <L2>
 0c                    mov	r7, r4
 fa 06                 shl16v	r5, r6
 fa 02                 shl16v	r4, r6
 f6 4e                 neg16	r6
 ca 10                 addi.s8	r6, 0x10
 fa 1e                 lsr16v	r7, r6
 97                    or	r5, r7
 d4 11                 jmp8	0x11 <L2>
<L0>:
 ce 20                 cmpi.s8	r6, 0x20
 d8 09                 bruge8	0x9 <L1>
 ca f0                 addi.s8	r6, -0x10
 fa 02                 shl16v	r4, r6
 04                    mov	r5, r4
 c0 00                 ldi8	r4, 0x0
 d4 04                 jmp8	0x4 <L2>
<L1>:
 c0 00                 ldi8	r4, 0x0
 c1 00                 ldi8	r5, 0x0
<L2>:
 ef                    ret

<__avm_lshrsi3>:
 f6 2f                 tst16	r7
 d1 23                 brne8	0x23 <L1>
 ce 10                 cmpi.s8	r6, 0x10
 d8 12                 bruge8	0x12 <L0>
 f6 2e                 tst16	r6
 d0 1f                 breq8	0x1f <L2>
 0d                    mov	r7, r5
 fa 12                 lsr16v	r4, r6
 fa 16                 lsr16v	r5, r6
 f6 4e                 neg16	r6
 ca 10                 addi.s8	r6, 0x10
 fa 0e                 shl16v	r7, r6
 93                    or	r4, r7
 d4 11                 jmp8	0x11 <L2>
<L0>:
 ce 20                 cmpi.s8	r6, 0x20
 d8 09                 bruge8	0x9 <L1>
 ca f0                 addi.s8	r6, -0x10
 fa 16                 lsr16v	r5, r6
 01                    mov	r4, r5
 c1 00                 ldi8	r5, 0x0
 d4 04                 jmp8	0x4 <L2>
<L1>:
 c0 00                 ldi8	r4, 0x0
 c1 00                 ldi8	r5, 0x0
<L2>:
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
 f1 07                 mov	r0, r7
 06                    mov	r5, r6
 fa 8f                 lsr16i	r5, 0xf
 f2 24                 add	r5, r0
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
 f4 5b                 stsp16	[sp+0x6], r7
 f4 13                 ldsp16	r7, [sp+0x4]
 f3 3d                 mulsu8.w	r7, r5
 f4 43                 stsp16	[sp+0x0], r7
 fa 78                 lsr16i	r4, 0x8
 f4 11                 ldsp16	r5, [sp+0x4]
 0c                    mov	r7, r4
 f3 2d                 muls8.w	r7, r5
 f3 32                 mulsu8.w	r4, r6
 04                    mov	r5, r4
 fa c8                 asr16i	r5, 0x8
 0b                    mov	r6, r7
 16                    add	r5, r6
 f4 03                 ldsp16	r7, [sp+0x0]
 0b                    mov	r6, r7
 fa d8                 asr16i	r6, 0x8
 19                    add	r6, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 19                    add	r6, r5
 f4 62                 stsp16	[sp+0x8], r6
 1c                    add	r7, r4
 fa 38                 lsl16i	r4, 0x8
 f4 19                 ldsp16	r5, [sp+0x6]
 08                    mov	r6, r4
 19                    add	r6, r5
 06                    mov	r5, r6
 34                    cmp	r5, r4
 f8 14                 cset.ult	r4
 f4 22                 ldsp16	r6, [sp+0x8]
 12                    add	r4, r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 12                    add	r4, r6
 fa 68                 lsl16i	r7, 0x8
 f4 1a                 ldsp16	r6, [sp+0x6]
 1e                    add	r7, r6
 3d                    cmp	r7, r5
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 03                    mov	r4, r7
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
