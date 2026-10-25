
math_tan.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 math_tan.c
00000100 l     O .data	00000080 inputs
00000180 l     O .data	00000004 result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 sf_tan.c
00000000 l    df *ABS*	00000000 ef_rem_pio2.c
00000000 l    df *ABS*	00000000 kf_rem_pio2.c
00000000 l    df *ABS*	00000000 integer.c
000015fe l       .init_array	00000000 .hidden __init_array_end
000015fe l       .init_array	00000000 .hidden __init_array_start
000015fe l       .fini_array	00000000 .hidden __fini_array_start
000015fe l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000031 avm_test_main
000002f8 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000002fa g     F .text	000003dc tanf
000006d6 g     F .text	00000282 __ieee754_rem_pio2f
00000958 g     F .text	00000c4e __kernel_rem_pio2f
000015d2 g     F .text	0000002c __avm_lshrsi3
000015a6 g     F .text	0000002c __avm_ashlsi3

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
 e1 da 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 fe 15              ldi16	r4, 0x15fe
 c1 00                 ldi8	r5, 0x0
 c6 fe 15              ldi16	r6, 0x15fe
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 fe 15           ldi16	r0, 0x15fe
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 fe 15           ldi16	r2, 0x15fe
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
 c4 fe 15              ldi16	r4, 0x15fe
 c1 00                 ldi8	r5, 0x0
 c6 fe 15              ldi16	r6, 0x15fe
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 fe 15           ldi16	r2, 0x15fe
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 fe 15           ldi16	r0, 0x15fe
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
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f2 42                 sub	r2, r2
 d7 01                 sys	debug_break
 f0 03 80              ldi8	r3, 0x80
<L0>:
 f1 22                 mov	r4, r2
 c5 00 01              ldi16	r5, 0x100
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 d5 19                 call8	tanf
 ff 02                 fadd	q0, q2
 f0 0a 04              addi.s8	r2, 0x4
 f5 13                 cmp	r2, r3
 d1 ec                 brne8	-0x14 <L0>
 c4 80 01              ldi16	r4, 0x180
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

<tanf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d8                 adjsp	-0x28
 f2 66                 mov32	q1, q2
 ff 65                 fabs	q1
 f0 04 da 0f           ldi16	r0, 0xfda
 f0 05 49 3f           ldi16	r1, 0x3f49
 f0 69 04              cmp32	q0, q1
 d2 17                 brult8	0x17 <L0>
 c6 ff ff              ldi16	r6, 0xffff
 c7 7f 31              ldi16	r7, 0x317f
 f0 69 c4              cmp32	q3, q1
 d2 76                 brult8	0x76 <L1>
 ff c2 62              ftos16	r6, q2
 f6 2e                 tst16	r6
 d1 6f                 brne8	0x6f <L1>
 f2 66                 mov32	q1, q2
 e0 51 03              jmp16	849 <L11>
<L0>:
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 4c              cmp32	q1, q3
 dd a7 01              bruge16	0x1a7 <L3>
 f0 16 18              leasp	r6, 0x18
 e1 9e 03              call16	__ieee754_rem_pio2f
 10                    add	r4, r4
 c1 02                 ldi8	r5, 0x2
 81                    and	r4, r5
 f4 50                 stsp16	[sp+0x4], r4
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 67                 fabs	q3
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 7f 31           ldi16	r3, 0x317f
 f0 69 4c              cmp32	q1, q3
 f2 66                 mov32	q1, q2
 dc 7e 01              brult16	0x17e <L4>
 ff c2 51              ftos16	r5, q1
 f6 2d                 tst16	r5
 db 76 01              brne16	0x176 <L4>
 c0 02                 ldi8	r4, 0x2
 f4 11                 ldsp16	r5, [sp+0x4]
 a1                    xor	r4, r5
 06                    mov	r5, r6
 94                    or	r5, r4
 01                    mov	r4, r5
 07                    mov	r5, r7
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 da 97 01              breq16	0x197 <L6>
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 ff 39                 fdiv	q2, q1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 a6                 tst8	r6
 f2 6b                 mov32	q3, q1
 f2 66                 mov32	q1, q2
 fb 16                 cmov.eq	r2, r6
 fb 1f                 cmov.eq	r3, r7
 e0 e7 02              jmp16	743 <L11>
<L1>:
 c6 3f a1              ldi16	r6, 0xa13f
 c7 2c 3f              ldi16	r7, 0x3f2c
 f0 69 c4              cmp32	q3, q1
 f8 16                 cset.ult	r6
 f4 52                 stsp16	[sp+0x4], r6
 c6 40 a1              ldi16	r6, 0xa140
 f0 69 4c              cmp32	q1, q3
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 d2 23                 brult8	0x23 <L2>
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 88                    and	r6, r4
 8d                    and	r7, r5
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 c7 00 80              ldi16	r7, 0x8000
 fb 66                 cmov.ne	r4, r6
 fb 6f                 cmov.ne	r5, r7
 ff 11                 fsub	q0, q1
 c6 68 21              ldi16	r6, 0x2168
 c7 22 33              ldi16	r7, 0x3322
 ff 1e                 fsub	q3, q2
 ff 03                 fadd	q0, q3
 f2 68                 mov32	q2, q0
<L2>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 62                 mov32	q0, q2
 ff 20                 fmul	q0, q0
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 ff 20                 fmul	q0, q0
 c4 84 53              ldi16	r4, 0x5384
 c5 d9 37              ldi16	r5, 0x37d9
 f2 64                 mov32	q1, q0
 ff 26                 fmul	q1, q2
 c4 7a c0              ldi16	r4, 0xc07a
 c5 95 38              ldi16	r5, 0x3895
 ff 06                 fadd	q1, q2
 c6 5f ae              ldi16	r6, 0xae5f
 c7 9b b7              ldi16	r7, 0xb79b
 f2 68                 mov32	q2, q0
 ff 2b                 fmul	q2, q3
 c6 45 f4              ldi16	r6, 0xf445
 c7 a3 38              ldi16	r7, 0x38a3
 ff 0b                 fadd	q2, q3
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 c4 c8 26              ldi16	r4, 0x26c8
 c5 1a 3a              ldi16	r5, 0x3a1a
 ff 0e                 fadd	q3, q2
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f2 68                 mov32	q2, q0
 ff 29                 fmul	q2, q1
 f0 06 b9 37           ldi16	r2, 0x37b9
 f0 07 81 39           ldi16	r3, 0x3981
 ff 09                 fadd	q2, q1
 c2 01                 ldi8	r6, 0x1
 f4 13                 ldsp16	r7, [sp+0x4]
 8e                    and	r7, r6
 f4 53                 stsp16	[sp+0x4], r7
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 c4 48 de              ldi16	r4, 0xde48
 c5 be 3a              ldi16	r5, 0x3abe
 ff 0e                 fadd	q3, q2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f2 68                 mov32	q2, q0
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 2b                 fmul	q2, q3
 c6 16 69              ldi16	r6, 0x6916
 c7 6b 3b              ldi16	r7, 0x3b6b
 ff 0b                 fadd	q2, q3
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 c4 a4 27              ldi16	r4, 0x27a4
 c5 b3 3c              ldi16	r5, 0x3cb3
 ff 0e                 fadd	q3, q2
 f2 64                 mov32	q1, q0
 ff 27                 fmul	q1, q3
 c4 89 88              ldi16	r4, 0x8889
 c5 08 3e              ldi16	r5, 0x3e08
 ff 06                 fadd	q1, q2
 f2 68                 mov32	q2, q0
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 2b                 fmul	q2, q3
 c6 1f 37              ldi16	r6, 0x371f
 c7 11 3c              ldi16	r7, 0x3c11
 ff 0b                 fadd	q2, q3
 ff 22                 fmul	q0, q2
 c4 d1 0d              ldi16	r4, 0xdd1
 c5 5d 3d              ldi16	r5, 0x3d5d
 ff 02                 fadd	q0, q2
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 28                 fmul	q2, q0
 ff 06                 fadd	q1, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 2b                 fmul	q2, q3
 c6 ab aa              ldi16	r6, 0xaaab
 c7 aa 3e              ldi16	r7, 0x3eaa
 f2 62                 mov32	q0, q2
 ff 23                 fmul	q0, q3
 ff 29                 fmul	q2, q1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff 0b                 fadd	q2, q3
 f0 32 14              ldsp16	r2, [sp+0x14]
 f0 33 16              ldsp16	r3, [sp+0x16]
 ff 26                 fmul	q1, q2
 ff 07                 fadd	q1, q3
 ff 01                 fadd	q0, q1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 0c                 fadd	q3, q0
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 a4                 tst8	r4
 d0 58                 breq8	0x58 <L5>
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 67                 mov32	q1, q3
 ff 06                 fadd	q1, q2
 ff 2f                 fmul	q3, q3
 ff 3d                 fdiv	q3, q1
 ff 1c                 fsub	q3, q0
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 ff 13                 fsub	q0, q3
 ff 00                 fadd	q0, q0
 ff 18                 fsub	q2, q0
 f4 3b                 ldsp16	r7, [sp+0xe]
 0b                    mov	r6, r7
 f2 66                 mov32	q1, q2
 e0 8d 01              jmp16	397 <L10>
<L3>:
 ff 1a                 fsub	q2, q2
 f2 66                 mov32	q1, q2
 e0 99 01              jmp16	409 <L11>
<L4>:
 c4 3f a1              ldi16	r4, 0xa13f
 c5 2c 3f              ldi16	r5, 0x3f2c
 f0 69 8c              cmp32	q2, q3
 f8 14                 cset.ult	r4
 f0 3c 14              stsp16	[sp+0x14], r4
 c4 40 a1              ldi16	r4, 0xa140
 f0 69 c8              cmp32	q3, q2
 f0 3a 20              stsp16	[sp+0x20], r2
 f0 3b 22              stsp16	[sp+0x22], r3
 d2 41                 brult8	0x41 <L9>
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 84              cmp32	q2, q1
 d9 18                 brsge8	0x18 <L7>
 f2 69                 mov32	q2, q1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 d4 1a                 jmp8	0x1a <L8>
<L5>:
 f2 67                 mov32	q1, q3
 e0 65 01              jmp16	357 <L11>
<L6>:
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 ff 37                 fdiv	q1, q3
 e0 5a 01              jmp16	346 <L11>
<L7>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 63                 fneg	q3
 f2 69                 mov32	q2, q1
 ff 62                 fneg	q2
<L8>:
 ff 12                 fsub	q0, q2
 f0 06 68 21           ldi16	r2, 0x2168
 f0 07 22 33           ldi16	r3, 0x3322
 ff 17                 fsub	q1, q3
 ff 04                 fadd	q1, q0
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
<L9>:
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f2 61                 mov32	q0, q1
 ff 20                 fmul	q0, q0
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 ff 20                 fmul	q0, q0
 c4 84 53              ldi16	r4, 0x5384
 c5 d9 37              ldi16	r5, 0x37d9
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 c4 7a c0              ldi16	r4, 0xc07a
 c5 95 38              ldi16	r5, 0x3895
 ff 0e                 fadd	q3, q2
 f0 06 5f ae           ldi16	r2, 0xae5f
 f0 07 9b b7           ldi16	r3, 0xb79b
 f2 68                 mov32	q2, q0
 ff 29                 fmul	q2, q1
 f0 06 45 f4           ldi16	r2, 0xf445
 f0 07 a3 38           ldi16	r3, 0x38a3
 ff 09                 fadd	q2, q1
 f2 64                 mov32	q1, q0
 ff 26                 fmul	q1, q2
 c4 c8 26              ldi16	r4, 0x26c8
 c5 1a 3a              ldi16	r5, 0x3a1a
 ff 06                 fadd	q1, q2
 f2 68                 mov32	q2, q0
 ff 2b                 fmul	q2, q3
 c6 b9 37              ldi16	r6, 0x37b9
 c7 81 39              ldi16	r7, 0x3981
 ff 0b                 fadd	q2, q3
 c2 01                 ldi8	r6, 0x1
 f0 37 14              ldsp16	r7, [sp+0x14]
 8e                    and	r7, r6
 f0 3f 14              stsp16	[sp+0x14], r7
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 c4 48 de              ldi16	r4, 0xde48
 c5 be 3a              ldi16	r5, 0x3abe
 ff 0e                 fadd	q3, q2
 f2 68                 mov32	q2, q0
 ff 29                 fmul	q2, q1
 f0 06 16 69           ldi16	r2, 0x6916
 f0 07 6b 3b           ldi16	r3, 0x3b6b
 ff 09                 fadd	q2, q1
 f2 64                 mov32	q1, q0
 ff 26                 fmul	q1, q2
 c4 a4 27              ldi16	r4, 0x27a4
 c5 b3 3c              ldi16	r5, 0x3cb3
 ff 06                 fadd	q1, q2
 f2 68                 mov32	q2, q0
 ff 29                 fmul	q2, q1
 f0 06 89 88           ldi16	r2, 0x8889
 f0 07 08 3e           ldi16	r3, 0x3e08
 ff 09                 fadd	q2, q1
 f2 64                 mov32	q1, q0
 ff 27                 fmul	q1, q3
 c6 1f 37              ldi16	r6, 0x371f
 c7 11 3c              ldi16	r7, 0x3c11
 ff 07                 fadd	q1, q3
 ff 21                 fmul	q0, q1
 c6 d1 0d              ldi16	r6, 0xdd1
 c7 5d 3d              ldi16	r7, 0x3d5d
 ff 03                 fadd	q0, q3
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 f2 6b                 mov32	q3, q1
 ff 2c                 fmul	q3, q0
 ff 0b                 fadd	q2, q3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 2d                 fmul	q3, q1
 f0 06 ab aa           ldi16	r2, 0xaaab
 f0 07 aa 3e           ldi16	r3, 0x3eaa
 f0 3a 24              stsp16	[sp+0x24], r2
 f0 3b 26              stsp16	[sp+0x26], r3
 f2 67                 mov32	q1, q3
 f0 30 24              ldsp16	r0, [sp+0x24]
 f0 31 26              ldsp16	r1, [sp+0x26]
 ff 24                 fmul	q1, q0
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 ff 2e                 fmul	q3, q2
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f2 69                 mov32	q2, q1
 ff 0b                 fadd	q2, q3
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 2e                 fmul	q3, q2
 ff 07                 fadd	q1, q3
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 09                 fadd	q2, q1
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 ff 02                 fadd	q0, q2
 f0 34 14              ldsp16	r4, [sp+0x14]
 f4 a4                 tst8	r4
 d0 41                 breq8	0x41 <L12>
 f4 10                 ldsp16	r4, [sp+0x4]
 c1 01                 ldi8	r5, 0x1
 24                    sub	r5, r4
 ff c0 51              s16tof	q1, r5
 f2 6a                 mov32	q3, q0
 ff 0d                 fadd	q3, q1
 ff 20                 fmul	q0, q0
 ff 33                 fdiv	q0, q3
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 12                 fsub	q0, q2
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 1c                 fsub	q3, q0
 ff 0f                 fadd	q3, q3
 ff 17                 fsub	q1, q3
 f0 37 22              ldsp16	r7, [sp+0x22]
 0b                    mov	r6, r7
 af                    xor	r7, r7
<L10>:
 fa 9e                 lsr16i	r6, 0xe
 af                    xor	r7, r7
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f9 18                 and	r0, r6
 c2 01                 ldi8	r6, 0x1
 f7 7c                 sub32	q3, q0
 ff c4 0f              s32tof	q3, q3
 ff 27                 fmul	q1, q3
<L11>:
 f2 69                 mov32	q2, q1
 d6 28                 adjsp	0x28
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L12>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L13>
 f2 64                 mov32	q1, q0
 d4 ed                 jmp8	-0x13 <L11>
<L13>:
 f2 42                 sub	r2, r2
 f0 07 80 bf           ldi16	r3, 0xbf80
 ff 34                 fdiv	q1, q0
 c6 00 f0              ldi16	r6, 0xf000
 c7 ff ff              ldi16	r7, 0xffff
 f2 69                 mov32	q2, q1
 82                    and	r4, r6
 87                    and	r5, r7
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 f2 6a                 mov32	q3, q0
 ff 2e                 fmul	q3, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 0b                 fadd	q2, q3
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 13                 fsub	q0, q3
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 18                 fsub	q2, q0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 2b                 fmul	q2, q3
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 ff 02                 fadd	q0, q2
 ff 24                 fmul	q1, q0
 ff 07                 fadd	q1, q3
 d4 a3                 jmp8	-0x5d <L11>

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
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
 09                    mov	r6, r5
 af                    xor	r7, r7
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 02                    mov	r4, r6
 fa 38                 lsl16i	r4, 0x8
 91                    or	r4, r5
 f4 60                 stsp16	[sp+0x8], r4
 c3 61                 ldi8	r7, 0x61
 f4 00                 ldsp16	r4, [sp+0x0]
 04                    mov	r5, r4
 f3 17                 mulu8.w	r5, r7
 f0 2d 22              stsp8	[sp+0x22], r5
 c4 80 ff              ldi16	r4, 0xff80
 92                    or	r4, r6
 fa 88                 lsr16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 71                 stsp16	[sp+0xc], r5
 f4 63                 stsp16	[sp+0x8], r7
 f4 50                 stsp16	[sp+0x4], r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 0b                    mov	r6, r7
 c0 61                 ldi8	r4, 0x61
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 c3 c5                 ldi8	r7, 0xc5
 f4 00                 ldsp16	r4, [sp+0x0]
 04                    mov	r5, r4
 03                    mov	r4, r7
 f3 14                 mulu8.w	r5, r4
 fa 88                 lsr16i	r5, 0x8
 16                    add	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 f6 3c                 mul8	r7, r4
 f4 30                 ldsp16	r4, [sp+0xc]
 1c                    add	r7, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f1 74                 zext8	r4
 c2 61                 ldi8	r6, 0x61
 f6 32                 mul8	r4, r6
 13                    add	r4, r7
 f0 2c 23              stsp8	[sp+0x23], r4
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 63                 stsp16	[sp+0x8], r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 07                    mov	r5, r7
 c2 c5                 ldi8	r6, 0xc5
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 c2 bb                 ldi8	r6, 0xbb
 f3 1e                 mulu8.w	r7, r6
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 f4 12                 ldsp16	r6, [sp+0x4]
 c1 61                 ldi8	r5, 0x61
 f3 19                 mulu8.w	r6, r5
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 f4 72                 stsp16	[sp+0xc], r6
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 c1 bb                 ldi8	r5, 0xbb
 f6 3d                 mul8	r7, r5
 1c                    add	r7, r4
 f4 21                 ldsp16	r5, [sp+0x8]
 f1 75                 zext8	r5
 c0 c5                 ldi8	r4, 0xc5
 f6 34                 mul8	r5, r4
 17                    add	r5, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 74                 zext8	r4
 c2 61                 ldi8	r6, 0x61
 f6 32                 mul8	r4, r6
 11                    add	r4, r5
 f0 2c 24              stsp8	[sp+0x24], r4
 fa 78                 lsr16i	r4, 0x8
 f4 31                 ldsp16	r5, [sp+0xc]
 11                    add	r4, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 63                 stsp16	[sp+0x8], r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 07                    mov	r5, r7
 c2 bb                 ldi8	r6, 0xbb
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 c3 de                 ldi8	r7, 0xde
 f3 1b                 mulu8.w	r6, r7
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 f0 3f 10              stsp16	[sp+0x10], r7
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 71                 stsp16	[sp+0xc], r5
 c1 c5                 ldi8	r5, 0xc5
 f4 33                 ldsp16	r7, [sp+0xc]
 f3 1d                 mulu8.w	r7, r5
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f0 37 10              ldsp16	r7, [sp+0x10]
 17                    add	r5, r7
 c3 fe                 ldi8	r7, 0xfe
 8b                    and	r6, r7
 18                    add	r6, r4
 f4 23                 ldsp16	r7, [sp+0x8]
 f1 77                 zext8	r7
 c0 bb                 ldi8	r4, 0xbb
 f6 3c                 mul8	r7, r4
 1e                    add	r7, r6
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 74                 zext8	r4
 c2 c5                 ldi8	r6, 0xc5
 f6 32                 mul8	r4, r6
 13                    add	r4, r7
 f0 2c 25              stsp8	[sp+0x25], r4
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 63                 stsp16	[sp+0x8], r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c1 ab                 ldi8	r5, 0xab
 f3 19                 mulu8.w	r6, r5
 fa 98                 lsr16i	r6, 0x8
 07                    mov	r5, r7
 c3 de                 ldi8	r7, 0xde
 f3 17                 mulu8.w	r5, r7
 f0 3d 10              stsp16	[sp+0x10], r5
 0d                    mov	r7, r5
 fa a8                 lsr16i	r7, 0x8
 1e                    add	r7, r6
 f4 11                 ldsp16	r5, [sp+0x4]
 c2 bb                 ldi8	r6, 0xbb
 f3 16                 mulu8.w	r5, r6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 f4 72                 stsp16	[sp+0xc], r6
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 c2 ab                 ldi8	r6, 0xab
 f6 3e                 mul8	r7, r6
 1c                    add	r7, r4
 c0 fe                 ldi8	r4, 0xfe
 f0 35 10              ldsp16	r5, [sp+0x10]
 84                    and	r5, r4
 17                    add	r5, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 74                 zext8	r4
 c2 bb                 ldi8	r6, 0xbb
 f6 32                 mul8	r4, r6
 11                    add	r4, r5
 f0 2c 26              stsp8	[sp+0x26], r4
 fa 78                 lsr16i	r4, 0x8
 f4 31                 ldsp16	r5, [sp+0xc]
 11                    add	r4, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 63                 stsp16	[sp+0x8], r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 07                    mov	r5, r7
 c2 ab                 ldi8	r6, 0xab
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 c2 63                 ldi8	r6, 0x63
 f3 1e                 mulu8.w	r7, r6
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 f4 12                 ldsp16	r6, [sp+0x4]
 c1 de                 ldi8	r5, 0xde
 f3 19                 mulu8.w	r6, r5
 f4 72                 stsp16	[sp+0xc], r6
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 17                    add	r5, r7
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 c2 63                 ldi8	r6, 0x63
 f6 3e                 mul8	r7, r6
 1c                    add	r7, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f1 74                 zext8	r4
 c2 ab                 ldi8	r6, 0xab
 f6 32                 mul8	r4, r6
 13                    add	r4, r7
 c2 fe                 ldi8	r6, 0xfe
 f4 33                 ldsp16	r7, [sp+0xc]
 8e                    and	r7, r6
 1c                    add	r7, r4
 f0 2f 27              stsp8	[sp+0x27], r7
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 73                 stsp16	[sp+0xc], r7
 f4 62                 stsp16	[sp+0x8], r6
 f4 51                 stsp16	[sp+0x4], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 06                    mov	r5, r6
 c0 63                 ldi8	r4, 0x63
 f3 14                 mulu8.w	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 02                    mov	r4, r6
 c2 51                 ldi8	r6, 0x51
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 07                    mov	r5, r7
 c2 ab                 ldi8	r6, 0xab
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f4 02                 ldsp16	r6, [sp+0x0]
 02                    mov	r4, r6
 f1 74                 zext8	r4
 c2 51                 ldi8	r6, 0x51
 f6 32                 mul8	r4, r6
 f4 32                 ldsp16	r6, [sp+0xc]
 12                    add	r4, r6
 f4 22                 ldsp16	r6, [sp+0x8]
 f1 76                 zext8	r6
 c3 63                 ldi8	r7, 0x63
 f6 3b                 mul8	r6, r7
 18                    add	r6, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 74                 zext8	r4
 c3 ab                 ldi8	r7, 0xab
 f6 33                 mul8	r4, r7
 12                    add	r4, r6
 f0 2c 28              stsp8	[sp+0x28], r4
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 63                 stsp16	[sp+0x8], r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 07                    mov	r5, r7
 c2 51                 ldi8	r6, 0x51
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 c3 fe                 ldi8	r7, 0xfe
 f3 1b                 mulu8.w	r6, r7
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 f0 3f 10              stsp16	[sp+0x10], r7
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 71                 stsp16	[sp+0xc], r5
 c1 63                 ldi8	r5, 0x63
 f4 33                 ldsp16	r7, [sp+0xc]
 f3 1d                 mulu8.w	r7, r5
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f0 37 10              ldsp16	r7, [sp+0x10]
 17                    add	r5, r7
 c3 fe                 ldi8	r7, 0xfe
 8b                    and	r6, r7
 18                    add	r6, r4
 f4 23                 ldsp16	r7, [sp+0x8]
 f1 77                 zext8	r7
 c0 51                 ldi8	r4, 0x51
 f6 3c                 mul8	r7, r4
 1e                    add	r7, r6
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 74                 zext8	r4
 c2 63                 ldi8	r6, 0x63
 f6 32                 mul8	r4, r6
 13                    add	r4, r7
 f0 2c 29              stsp8	[sp+0x29], r4
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 63                 stsp16	[sp+0x8], r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c1 41                 ldi8	r5, 0x41
 f3 19                 mulu8.w	r6, r5
 fa 98                 lsr16i	r6, 0x8
 c1 fe                 ldi8	r5, 0xfe
 f3 1d                 mulu8.w	r7, r5
 f0 3f 10              stsp16	[sp+0x10], r7
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 16                    add	r5, r6
 f4 13                 ldsp16	r7, [sp+0x4]
 c2 51                 ldi8	r6, 0x51
 f3 1e                 mulu8.w	r7, r6
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 f4 73                 stsp16	[sp+0xc], r7
 f4 02                 ldsp16	r6, [sp+0x0]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 c2 41                 ldi8	r6, 0x41
 f6 36                 mul8	r5, r6
 14                    add	r5, r4
 c0 fe                 ldi8	r4, 0xfe
 f0 36 10              ldsp16	r6, [sp+0x10]
 88                    and	r6, r4
 19                    add	r6, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 74                 zext8	r4
 c1 51                 ldi8	r5, 0x51
 f6 31                 mul8	r4, r5
 12                    add	r4, r6
 f0 2c 2a              stsp8	[sp+0x2a], r4
 fa 78                 lsr16i	r4, 0x8
 f4 31                 ldsp16	r5, [sp+0xc]
 11                    add	r4, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 13                 ldsp16	r7, [sp+0x4]
 f4 61                 stsp16	[sp+0x8], r5
 f4 53                 stsp16	[sp+0x4], r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 09                    mov	r6, r5
 c1 41                 ldi8	r5, 0x41
 f3 19                 mulu8.w	r6, r5
 fa 98                 lsr16i	r6, 0x8
 06                    mov	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 c2 90                 ldi8	r6, 0x90
 f3 1e                 mulu8.w	r7, r6
 f0 3f 10              stsp16	[sp+0x10], r7
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 f4 73                 stsp16	[sp+0xc], r7
 f4 13                 ldsp16	r7, [sp+0x4]
 c1 fe                 ldi8	r5, 0xfe
 f3 1d                 mulu8.w	r7, r5
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f4 32                 ldsp16	r6, [sp+0xc]
 16                    add	r5, r6
 f4 71                 stsp16	[sp+0xc], r5
 f0 00 f0              ldi8	r0, 0xf0
 f0 35 10              ldsp16	r5, [sp+0x10]
 f9 a0                 and	r5, r0
 14                    add	r5, r4
 09                    mov	r6, r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f1 74                 zext8	r4
 c1 41                 ldi8	r5, 0x41
 f6 31                 mul8	r4, r5
 12                    add	r4, r6
 c1 fe                 ldi8	r5, 0xfe
 8d                    and	r7, r5
 1c                    add	r7, r4
 f0 2f 2b              stsp8	[sp+0x2b], r7
 fa a8                 lsr16i	r7, 0x8
 f4 30                 ldsp16	r4, [sp+0xc]
 1c                    add	r7, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 62                 stsp16	[sp+0x8], r6
 f4 51                 stsp16	[sp+0x4], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c2 43                 ldi8	r6, 0x43
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 22                 ldsp16	r6, [sp+0x8]
 c1 90                 ldi8	r5, 0x90
 f3 19                 mulu8.w	r6, r5
 f0 3e 10              stsp16	[sp+0x10], r6
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 70                 stsp16	[sp+0xc], r4
 c0 41                 ldi8	r4, 0x41
 f4 32                 ldsp16	r6, [sp+0xc]
 f3 18                 mulu8.w	r6, r4
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f4 70                 stsp16	[sp+0xc], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 74                 zext8	r4
 c1 43                 ldi8	r5, 0x43
 f6 31                 mul8	r4, r5
 13                    add	r4, r7
 f0 35 10              ldsp16	r5, [sp+0x10]
 f9 a0                 and	r5, r0
 14                    add	r5, r4
 09                    mov	r6, r5
 f4 11                 ldsp16	r5, [sp+0x4]
 01                    mov	r4, r5
 f1 74                 zext8	r4
 c3 41                 ldi8	r7, 0x41
 f6 33                 mul8	r4, r7
 12                    add	r4, r6
 f0 2c 2c              stsp8	[sp+0x2c], r4
 fa 78                 lsr16i	r4, 0x8
 f4 32                 ldsp16	r6, [sp+0xc]
 12                    add	r4, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 63                 stsp16	[sp+0x8], r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c1 43                 ldi8	r5, 0x43
 f3 1d                 mulu8.w	r7, r5
 fa a8                 lsr16i	r7, 0x8
 07                    mov	r5, r7
 c3 3c                 ldi8	r7, 0x3c
 f3 1b                 mulu8.w	r6, r7
 f0 3e 10              stsp16	[sp+0x10], r6
 fa 98                 lsr16i	r6, 0x8
 19                    add	r6, r5
 f4 72                 stsp16	[sp+0xc], r6
 f4 12                 ldsp16	r6, [sp+0x4]
 c1 90                 ldi8	r5, 0x90
 f3 19                 mulu8.w	r6, r5
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 33                 ldsp16	r7, [sp+0xc]
 17                    add	r5, r7
 f4 71                 stsp16	[sp+0xc], r5
 c1 fc                 ldi8	r5, 0xfc
 f0 37 10              ldsp16	r7, [sp+0x10]
 8d                    and	r7, r5
 1c                    add	r7, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f1 74                 zext8	r4
 c1 43                 ldi8	r5, 0x43
 f6 31                 mul8	r4, r5
 13                    add	r4, r7
 f9 c0                 and	r6, r0
 18                    add	r6, r4
 f0 2e 2d              stsp8	[sp+0x2d], r6
 fa 98                 lsr16i	r6, 0x8
 f4 30                 ldsp16	r4, [sp+0xc]
 18                    add	r6, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 63                 stsp16	[sp+0x8], r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c3 99                 ldi8	r7, 0x99
 f3 13                 mulu8.w	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f4 23                 ldsp16	r7, [sp+0x8]
 c1 3c                 ldi8	r5, 0x3c
 f3 1d                 mulu8.w	r7, r5
 f0 3f 10              stsp16	[sp+0x10], r7
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 70                 stsp16	[sp+0xc], r4
 c0 43                 ldi8	r4, 0x43
 f4 33                 ldsp16	r7, [sp+0xc]
 f3 1c                 mulu8.w	r7, r4
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f4 70                 stsp16	[sp+0xc], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 74                 zext8	r4
 c1 99                 ldi8	r5, 0x99
 f6 31                 mul8	r4, r5
 12                    add	r4, r6
 c1 fc                 ldi8	r5, 0xfc
 f0 36 10              ldsp16	r6, [sp+0x10]
 89                    and	r6, r5
 18                    add	r6, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 74                 zext8	r4
 c1 43                 ldi8	r5, 0x43
 f6 31                 mul8	r4, r5
 12                    add	r4, r6
 f0 2c 2e              stsp8	[sp+0x2e], r4
 fa 78                 lsr16i	r4, 0x8
 f4 31                 ldsp16	r5, [sp+0xc]
 11                    add	r4, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 13                 ldsp16	r7, [sp+0x4]
 f4 61                 stsp16	[sp+0x8], r5
 f4 53                 stsp16	[sp+0x4], r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 09                    mov	r6, r5
 c1 99                 ldi8	r5, 0x99
 f3 19                 mulu8.w	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f4 72                 stsp16	[sp+0xc], r6
 f4 02                 ldsp16	r6, [sp+0x0]
 06                    mov	r5, r6
 c2 95                 ldi8	r6, 0x95
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 32                 ldsp16	r6, [sp+0xc]
 16                    add	r5, r6
 c2 3c                 ldi8	r6, 0x3c
 f3 1e                 mulu8.w	r7, r6
 f4 73                 stsp16	[sp+0xc], r7
 0b                    mov	r6, r7
 fa 98                 lsr16i	r6, 0x8
 19                    add	r6, r5
 f0 3e 10              stsp16	[sp+0x10], r6
 f4 02                 ldsp16	r6, [sp+0x0]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 c2 95                 ldi8	r6, 0x95
 f6 36                 mul8	r5, r6
 14                    add	r5, r4
 f4 22                 ldsp16	r6, [sp+0x8]
 02                    mov	r4, r6
 f1 74                 zext8	r4
 c3 99                 ldi8	r7, 0x99
 f6 33                 mul8	r4, r7
 11                    add	r4, r5
 c1 fc                 ldi8	r5, 0xfc
 f4 33                 ldsp16	r7, [sp+0xc]
 8d                    and	r7, r5
 1c                    add	r7, r4
 f0 2f 2f              stsp8	[sp+0x2f], r7
 fa a8                 lsr16i	r7, 0x8
 f0 34 10              ldsp16	r4, [sp+0x10]
 1c                    add	r7, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 73                 stsp16	[sp+0xc], r7
 f4 62                 stsp16	[sp+0x8], r6
 f4 51                 stsp16	[sp+0x4], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 06                    mov	r5, r6
 c0 95                 ldi8	r4, 0x95
 f3 14                 mulu8.w	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 02                    mov	r4, r6
 c2 62                 ldi8	r6, 0x62
 f3 12                 mulu8.w	r4, r6
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 19                    add	r6, r5
 07                    mov	r5, r7
 c3 99                 ldi8	r7, 0x99
 f3 17                 mulu8.w	r5, r7
 fa 88                 lsr16i	r5, 0x8
 16                    add	r5, r6
 c2 fe                 ldi8	r6, 0xfe
 82                    and	r4, r6
 f4 32                 ldsp16	r6, [sp+0xc]
 12                    add	r4, r6
 f4 22                 ldsp16	r6, [sp+0x8]
 f1 76                 zext8	r6
 c3 95                 ldi8	r7, 0x95
 f6 3b                 mul8	r6, r7
 18                    add	r6, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 74                 zext8	r4
 c3 99                 ldi8	r7, 0x99
 f6 33                 mul8	r4, r7
 12                    add	r4, r6
 f0 2c 30              stsp8	[sp+0x30], r4
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 63                 stsp16	[sp+0x8], r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c1 db                 ldi8	r5, 0xdb
 f3 19                 mulu8.w	r6, r5
 fa 98                 lsr16i	r6, 0x8
 c1 62                 ldi8	r5, 0x62
 f3 1d                 mulu8.w	r7, r5
 f0 3f 10              stsp16	[sp+0x10], r7
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 16                    add	r5, r6
 f4 13                 ldsp16	r7, [sp+0x4]
 c2 95                 ldi8	r6, 0x95
 f3 1e                 mulu8.w	r7, r6
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 f4 73                 stsp16	[sp+0xc], r7
 f4 02                 ldsp16	r6, [sp+0x0]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 c2 db                 ldi8	r6, 0xdb
 f6 36                 mul8	r5, r6
 14                    add	r5, r4
 c0 fe                 ldi8	r4, 0xfe
 f0 36 10              ldsp16	r6, [sp+0x10]
 88                    and	r6, r4
 19                    add	r6, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 74                 zext8	r4
 c1 95                 ldi8	r5, 0x95
 f6 31                 mul8	r4, r5
 12                    add	r4, r6
 f0 2c 31              stsp8	[sp+0x31], r4
 fa 78                 lsr16i	r4, 0x8
 f4 31                 ldsp16	r5, [sp+0xc]
 11                    add	r4, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 13                 ldsp16	r7, [sp+0x4]
 f4 61                 stsp16	[sp+0x8], r5
 f4 53                 stsp16	[sp+0x4], r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 09                    mov	r6, r5
 c1 db                 ldi8	r5, 0xdb
 f3 19                 mulu8.w	r6, r5
 fa 98                 lsr16i	r6, 0x8
 06                    mov	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 c2 c0                 ldi8	r6, 0xc0
 f3 1e                 mulu8.w	r7, r6
 f0 3f 10              stsp16	[sp+0x10], r7
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 f4 73                 stsp16	[sp+0xc], r7
 f4 13                 ldsp16	r7, [sp+0x4]
 c1 62                 ldi8	r5, 0x62
 f3 1d                 mulu8.w	r7, r5
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f4 32                 ldsp16	r6, [sp+0xc]
 16                    add	r5, r6
 f4 71                 stsp16	[sp+0xc], r5
 c1 c0                 ldi8	r5, 0xc0
 f0 36 10              ldsp16	r6, [sp+0x10]
 89                    and	r6, r5
 18                    add	r6, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f1 74                 zext8	r4
 c1 db                 ldi8	r5, 0xdb
 f6 31                 mul8	r4, r5
 12                    add	r4, r6
 c1 fe                 ldi8	r5, 0xfe
 8d                    and	r7, r5
 1c                    add	r7, r4
 f0 2f 32              stsp8	[sp+0x32], r7
 fa a8                 lsr16i	r7, 0x8
 f4 30                 ldsp16	r4, [sp+0xc]
 1c                    add	r7, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 62                 stsp16	[sp+0x8], r6
 f4 51                 stsp16	[sp+0x4], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c2 dd                 ldi8	r6, 0xdd
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 22                 ldsp16	r6, [sp+0x8]
 c1 c0                 ldi8	r5, 0xc0
 f3 19                 mulu8.w	r6, r5
 f0 3e 10              stsp16	[sp+0x10], r6
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 70                 stsp16	[sp+0xc], r4
 c0 db                 ldi8	r4, 0xdb
 f4 32                 ldsp16	r6, [sp+0xc]
 f3 18                 mulu8.w	r6, r4
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f4 70                 stsp16	[sp+0xc], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 74                 zext8	r4
 c1 dd                 ldi8	r5, 0xdd
 f6 31                 mul8	r4, r5
 13                    add	r4, r7
 c1 c0                 ldi8	r5, 0xc0
 f0 36 10              ldsp16	r6, [sp+0x10]
 89                    and	r6, r5
 18                    add	r6, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 74                 zext8	r4
 c1 db                 ldi8	r5, 0xdb
 f6 31                 mul8	r4, r5
 12                    add	r4, r6
 f0 2c 33              stsp8	[sp+0x33], r4
 fa 78                 lsr16i	r4, 0x8
 f4 31                 ldsp16	r5, [sp+0xc]
 11                    add	r4, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 13                 ldsp16	r7, [sp+0x4]
 f4 61                 stsp16	[sp+0x8], r5
 f4 53                 stsp16	[sp+0x4], r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 09                    mov	r6, r5
 c1 dd                 ldi8	r5, 0xdd
 f3 19                 mulu8.w	r6, r5
 fa 98                 lsr16i	r6, 0x8
 06                    mov	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 c2 34                 ldi8	r6, 0x34
 f3 1e                 mulu8.w	r7, r6
 f0 3f 10              stsp16	[sp+0x10], r7
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 f4 73                 stsp16	[sp+0xc], r7
 f4 13                 ldsp16	r7, [sp+0x4]
 c1 c0                 ldi8	r5, 0xc0
 f3 1d                 mulu8.w	r7, r5
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f4 32                 ldsp16	r6, [sp+0xc]
 16                    add	r5, r6
 f4 71                 stsp16	[sp+0xc], r5
 c1 fc                 ldi8	r5, 0xfc
 f0 36 10              ldsp16	r6, [sp+0x10]
 89                    and	r6, r5
 18                    add	r6, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f1 74                 zext8	r4
 c1 dd                 ldi8	r5, 0xdd
 f6 31                 mul8	r4, r5
 12                    add	r4, r6
 c1 c0                 ldi8	r5, 0xc0
 8d                    and	r7, r5
 1c                    add	r7, r4
 f0 2f 34              stsp8	[sp+0x34], r7
 fa a8                 lsr16i	r7, 0x8
 f4 30                 ldsp16	r4, [sp+0xc]
 1c                    add	r7, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 62                 stsp16	[sp+0x8], r6
 f4 51                 stsp16	[sp+0x4], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c2 f5                 ldi8	r6, 0xf5
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 22                 ldsp16	r6, [sp+0x8]
 c1 34                 ldi8	r5, 0x34
 f3 19                 mulu8.w	r6, r5
 f0 3e 10              stsp16	[sp+0x10], r6
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 70                 stsp16	[sp+0xc], r4
 c0 dd                 ldi8	r4, 0xdd
 f4 32                 ldsp16	r6, [sp+0xc]
 f3 18                 mulu8.w	r6, r4
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f4 70                 stsp16	[sp+0xc], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 74                 zext8	r4
 c1 f5                 ldi8	r5, 0xf5
 f6 31                 mul8	r4, r5
 13                    add	r4, r7
 c1 fc                 ldi8	r5, 0xfc
 f0 36 10              ldsp16	r6, [sp+0x10]
 89                    and	r6, r5
 18                    add	r6, r4
 f4 11                 ldsp16	r5, [sp+0x4]
 01                    mov	r4, r5
 f1 74                 zext8	r4
 c3 dd                 ldi8	r7, 0xdd
 f6 33                 mul8	r4, r7
 12                    add	r4, r6
 f0 2c 35              stsp8	[sp+0x35], r4
 fa 78                 lsr16i	r4, 0x8
 f4 32                 ldsp16	r6, [sp+0xc]
 12                    add	r4, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 63                 stsp16	[sp+0x8], r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 07                    mov	r5, r7
 c2 f5                 ldi8	r6, 0xf5
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 c2 d1                 ldi8	r6, 0xd1
 f3 1e                 mulu8.w	r7, r6
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 f4 12                 ldsp16	r6, [sp+0x4]
 c1 34                 ldi8	r5, 0x34
 f3 19                 mulu8.w	r6, r5
 f4 72                 stsp16	[sp+0xc], r6
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 17                    add	r5, r7
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 c2 d1                 ldi8	r6, 0xd1
 f6 3e                 mul8	r7, r6
 1c                    add	r7, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f1 74                 zext8	r4
 c2 f5                 ldi8	r6, 0xf5
 f6 32                 mul8	r4, r6
 13                    add	r4, r7
 c2 fc                 ldi8	r6, 0xfc
 f4 33                 ldsp16	r7, [sp+0xc]
 8e                    and	r7, r6
 1c                    add	r7, r4
 f0 2f 36              stsp8	[sp+0x36], r7
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 73                 stsp16	[sp+0xc], r7
 f4 62                 stsp16	[sp+0x8], r6
 f4 51                 stsp16	[sp+0x4], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 06                    mov	r5, r6
 c0 d1                 ldi8	r4, 0xd1
 f3 14                 mulu8.w	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 02                    mov	r4, r6
 c2 57                 ldi8	r6, 0x57
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 07                    mov	r5, r7
 c2 f5                 ldi8	r6, 0xf5
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f4 02                 ldsp16	r6, [sp+0x0]
 02                    mov	r4, r6
 f1 74                 zext8	r4
 c2 57                 ldi8	r6, 0x57
 f6 32                 mul8	r4, r6
 f4 32                 ldsp16	r6, [sp+0xc]
 12                    add	r4, r6
 f4 22                 ldsp16	r6, [sp+0x8]
 f1 76                 zext8	r6
 c3 d1                 ldi8	r7, 0xd1
 f6 3b                 mul8	r6, r7
 18                    add	r6, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 74                 zext8	r4
 c3 f5                 ldi8	r7, 0xf5
 f6 33                 mul8	r4, r7
 12                    add	r4, r6
 f0 2c 37              stsp8	[sp+0x37], r4
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 63                 stsp16	[sp+0x8], r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 07                    mov	r5, r7
 c2 57                 ldi8	r6, 0x57
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 c2 27                 ldi8	r6, 0x27
 f3 1e                 mulu8.w	r7, r6
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 f4 12                 ldsp16	r6, [sp+0x4]
 c1 d1                 ldi8	r5, 0xd1
 f3 19                 mulu8.w	r6, r5
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 f4 72                 stsp16	[sp+0xc], r6
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 c1 27                 ldi8	r5, 0x27
 f6 3d                 mul8	r7, r5
 1c                    add	r7, r4
 f4 21                 ldsp16	r5, [sp+0x8]
 f1 75                 zext8	r5
 c0 57                 ldi8	r4, 0x57
 f6 34                 mul8	r5, r4
 17                    add	r5, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 74                 zext8	r4
 c2 d1                 ldi8	r6, 0xd1
 f6 32                 mul8	r4, r6
 11                    add	r4, r5
 f0 2c 38              stsp8	[sp+0x38], r4
 fa 78                 lsr16i	r4, 0x8
 f4 31                 ldsp16	r5, [sp+0xc]
 11                    add	r4, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 63                 stsp16	[sp+0x8], r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 07                    mov	r5, r7
 c2 27                 ldi8	r6, 0x27
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 c2 fc                 ldi8	r6, 0xfc
 f3 1e                 mulu8.w	r7, r6
 0b                    mov	r6, r7
 fa 98                 lsr16i	r6, 0x8
 19                    add	r6, r5
 f0 3e 10              stsp16	[sp+0x10], r6
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 71                 stsp16	[sp+0xc], r5
 c1 57                 ldi8	r5, 0x57
 f4 32                 ldsp16	r6, [sp+0xc]
 f3 19                 mulu8.w	r6, r5
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f0 36 10              ldsp16	r6, [sp+0x10]
 16                    add	r5, r6
 c2 fc                 ldi8	r6, 0xfc
 8e                    and	r7, r6
 1c                    add	r7, r4
 f4 22                 ldsp16	r6, [sp+0x8]
 f1 76                 zext8	r6
 c0 27                 ldi8	r4, 0x27
 f6 38                 mul8	r6, r4
 1b                    add	r6, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 74                 zext8	r4
 c3 57                 ldi8	r7, 0x57
 f6 33                 mul8	r4, r7
 12                    add	r4, r6
 f0 2c 39              stsp8	[sp+0x39], r4
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 63                 stsp16	[sp+0x8], r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c1 29                 ldi8	r5, 0x29
 f3 19                 mulu8.w	r6, r5
 fa 98                 lsr16i	r6, 0x8
 c1 fc                 ldi8	r5, 0xfc
 f3 1d                 mulu8.w	r7, r5
 f0 3f 10              stsp16	[sp+0x10], r7
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 16                    add	r5, r6
 f4 13                 ldsp16	r7, [sp+0x4]
 c2 27                 ldi8	r6, 0x27
 f3 1e                 mulu8.w	r7, r6
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 f4 73                 stsp16	[sp+0xc], r7
 f4 02                 ldsp16	r6, [sp+0x0]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 c2 29                 ldi8	r6, 0x29
 f6 36                 mul8	r5, r6
 14                    add	r5, r4
 c0 fc                 ldi8	r4, 0xfc
 f0 36 10              ldsp16	r6, [sp+0x10]
 88                    and	r6, r4
 19                    add	r6, r5
 0e                    mov	r7, r6
 f4 11                 ldsp16	r5, [sp+0x4]
 01                    mov	r4, r5
 f1 74                 zext8	r4
 c2 27                 ldi8	r6, 0x27
 f6 32                 mul8	r4, r6
 13                    add	r4, r7
 f0 2c 3a              stsp8	[sp+0x3a], r4
 fa 78                 lsr16i	r4, 0x8
 f4 32                 ldsp16	r6, [sp+0xc]
 12                    add	r4, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 63                 stsp16	[sp+0x8], r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 07                    mov	r5, r7
 c2 29                 ldi8	r6, 0x29
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 c3 15                 ldi8	r7, 0x15
 f3 1b                 mulu8.w	r6, r7
 fa 98                 lsr16i	r6, 0x8
 19                    add	r6, r5
 f4 13                 ldsp16	r7, [sp+0x4]
 c1 fc                 ldi8	r5, 0xfc
 f3 1d                 mulu8.w	r7, r5
 f4 73                 stsp16	[sp+0xc], r7
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 16                    add	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f1 76                 zext8	r6
 c3 15                 ldi8	r7, 0x15
 f6 3b                 mul8	r6, r7
 18                    add	r6, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f1 74                 zext8	r4
 c3 29                 ldi8	r7, 0x29
 f6 33                 mul8	r4, r7
 12                    add	r4, r6
 c2 fc                 ldi8	r6, 0xfc
 f4 33                 ldsp16	r7, [sp+0xc]
 8e                    and	r7, r6
 1c                    add	r7, r4
 f0 2f 3b              stsp8	[sp+0x3b], r7
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 73                 stsp16	[sp+0xc], r7
 f4 62                 stsp16	[sp+0x8], r6
 f4 51                 stsp16	[sp+0x4], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 06                    mov	r5, r6
 c0 15                 ldi8	r4, 0x15
 f3 14                 mulu8.w	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 02                    mov	r4, r6
 c2 44                 ldi8	r6, 0x44
 f3 12                 mulu8.w	r4, r6
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 19                    add	r6, r5
 07                    mov	r5, r7
 c3 29                 ldi8	r7, 0x29
 f3 17                 mulu8.w	r5, r7
 fa 88                 lsr16i	r5, 0x8
 16                    add	r5, r6
 c2 fc                 ldi8	r6, 0xfc
 82                    and	r4, r6
 f4 32                 ldsp16	r6, [sp+0xc]
 12                    add	r4, r6
 f4 22                 ldsp16	r6, [sp+0x8]
 f1 76                 zext8	r6
 c3 15                 ldi8	r7, 0x15
 f6 3b                 mul8	r6, r7
 18                    add	r6, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 74                 zext8	r4
 c3 29                 ldi8	r7, 0x29
 f6 33                 mul8	r4, r7
 12                    add	r4, r6
 f0 2c 3c              stsp8	[sp+0x3c], r4
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 13                 ldsp16	r7, [sp+0x4]
 f4 53                 stsp16	[sp+0x4], r7
 f4 61                 stsp16	[sp+0x8], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 09                    mov	r6, r5
 c1 44                 ldi8	r5, 0x44
 f3 19                 mulu8.w	r6, r5
 f0 3e 10              stsp16	[sp+0x10], r6
 fa 98                 lsr16i	r6, 0x8
 f4 72                 stsp16	[sp+0xc], r6
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 c1 4e                 ldi8	r5, 0x4e
 f3 1d                 mulu8.w	r7, r5
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f4 32                 ldsp16	r6, [sp+0xc]
 16                    add	r5, r6
 f0 3d 18              stsp16	[sp+0x18], r5
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 72                 stsp16	[sp+0xc], r6
 c2 15                 ldi8	r6, 0x15
 f4 31                 ldsp16	r5, [sp+0xc]
 f3 16                 mulu8.w	r5, r6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f0 35 18              ldsp16	r5, [sp+0x18]
 19                    add	r6, r5
 f4 72                 stsp16	[sp+0xc], r6
 c1 fe                 ldi8	r5, 0xfe
 8d                    and	r7, r5
 1c                    add	r7, r4
 c0 fc                 ldi8	r4, 0xfc
 f0 35 10              ldsp16	r5, [sp+0x10]
 84                    and	r5, r4
 17                    add	r5, r7
 f4 12                 ldsp16	r6, [sp+0x4]
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 c0 15                 ldi8	r4, 0x15
 f6 3c                 mul8	r7, r4
 1d                    add	r7, r5
 f0 2f 3d              stsp8	[sp+0x3d], r7
 fa a8                 lsr16i	r7, 0x8
 f4 30                 ldsp16	r4, [sp+0xc]
 1c                    add	r7, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 61                 stsp16	[sp+0x8], r5
 f4 52                 stsp16	[sp+0x4], r6
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 09                    mov	r6, r5
 c0 4e                 ldi8	r4, 0x4e
 f3 18                 mulu8.w	r6, r4
 f4 72                 stsp16	[sp+0xc], r6
 fa 98                 lsr16i	r6, 0x8
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 6e                 ldi8	r5, 0x6e
 f3 11                 mulu8.w	r4, r5
 f0 3c 18              stsp16	[sp+0x18], r4
 fa 78                 lsr16i	r4, 0x8
 12                    add	r4, r6
 f0 3c 10              stsp16	[sp+0x10], r4
 f4 10                 ldsp16	r4, [sp+0x4]
 c2 44                 ldi8	r6, 0x44
 f3 12                 mulu8.w	r4, r6
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 35 10              ldsp16	r5, [sp+0x10]
 19                    add	r6, r5
 f0 3e 10              stsp16	[sp+0x10], r6
 c2 fe                 ldi8	r6, 0xfe
 f0 35 18              ldsp16	r5, [sp+0x18]
 86                    and	r5, r6
 17                    add	r5, r7
 f4 33                 ldsp16	r7, [sp+0xc]
 8e                    and	r7, r6
 1d                    add	r7, r5
 c1 fc                 ldi8	r5, 0xfc
 81                    and	r4, r5
 13                    add	r4, r7
 f0 2c 3e              stsp8	[sp+0x3e], r4
 fa 78                 lsr16i	r4, 0x8
 f0 35 10              ldsp16	r5, [sp+0x10]
 11                    add	r4, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 63                 stsp16	[sp+0x8], r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c1 83                 ldi8	r5, 0x83
 0e                    mov	r7, r6
 f3 1d                 mulu8.w	r7, r5
 fa a8                 lsr16i	r7, 0x8
 f4 21                 ldsp16	r5, [sp+0x8]
 c2 6e                 ldi8	r6, 0x6e
 f3 16                 mulu8.w	r5, r6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 f0 3e 10              stsp16	[sp+0x10], r6
 f4 12                 ldsp16	r6, [sp+0x4]
 c3 4e                 ldi8	r7, 0x4e
 f3 1b                 mulu8.w	r6, r7
 f4 72                 stsp16	[sp+0xc], r6
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 f0 36 10              ldsp16	r6, [sp+0x10]
 1e                    add	r7, r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f4 02                 ldsp16	r6, [sp+0x0]
 f1 76                 zext8	r6
 c3 83                 ldi8	r7, 0x83
 f6 3b                 mul8	r6, r7
 18                    add	r6, r4
 c0 fe                 ldi8	r4, 0xfe
 84                    and	r5, r4
 16                    add	r5, r6
 f4 33                 ldsp16	r7, [sp+0xc]
 8c                    and	r7, r4
 1d                    add	r7, r5
 f0 2f 3f              stsp8	[sp+0x3f], r7
 fa a8                 lsr16i	r7, 0x8
 f0 34 10              ldsp16	r4, [sp+0x10]
 1c                    add	r7, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 73                 stsp16	[sp+0xc], r7
 f4 62                 stsp16	[sp+0x8], r6
 f4 51                 stsp16	[sp+0x4], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 06                    mov	r5, r6
 c0 83                 ldi8	r4, 0x83
 f3 14                 mulu8.w	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 02                    mov	r4, r6
 c2 f9                 ldi8	r6, 0xf9
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 07                    mov	r5, r7
 c2 6e                 ldi8	r6, 0x6e
 f3 16                 mulu8.w	r5, r6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 18                    add	r6, r4
 f0 3e 10              stsp16	[sp+0x10], r6
 f4 02                 ldsp16	r6, [sp+0x0]
 02                    mov	r4, r6
 f1 74                 zext8	r4
 c2 f9                 ldi8	r6, 0xf9
 f6 32                 mul8	r4, r6
 f4 32                 ldsp16	r6, [sp+0xc]
 12                    add	r4, r6
 f4 23                 ldsp16	r7, [sp+0x8]
 f1 77                 zext8	r7
 c2 83                 ldi8	r6, 0x83
 f6 3e                 mul8	r7, r6
 1c                    add	r7, r4
 c0 fe                 ldi8	r4, 0xfe
 84                    and	r5, r4
 17                    add	r5, r7
 f0 2d 40              stsp8	[sp+0x40], r5
 fa 88                 lsr16i	r5, 0x8
 f0 34 10              ldsp16	r4, [sp+0x10]
 14                    add	r5, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 13                 ldsp16	r7, [sp+0x4]
 f4 60                 stsp16	[sp+0x8], r4
 f4 53                 stsp16	[sp+0x4], r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 08                    mov	r6, r4
 c0 f9                 ldi8	r4, 0xf9
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f4 72                 stsp16	[sp+0xc], r6
 c0 a2                 ldi8	r4, 0xa2
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 f3 1c                 mulu8.w	r7, r4
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f4 32                 ldsp16	r6, [sp+0xc]
 12                    add	r4, r6
 f4 70                 stsp16	[sp+0xc], r4
 f4 10                 ldsp16	r4, [sp+0x4]
 c2 83                 ldi8	r6, 0x83
 f3 12                 mulu8.w	r4, r6
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f4 30                 ldsp16	r4, [sp+0xc]
 18                    add	r6, r4
 c0 fe                 ldi8	r4, 0xfe
 8c                    and	r7, r4
 1d                    add	r7, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 f1 75                 zext8	r5
 c0 f9                 ldi8	r4, 0xf9
 f6 34                 mul8	r5, r4
 17                    add	r5, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 74                 zext8	r4
 c3 83                 ldi8	r7, 0x83
 f6 33                 mul8	r4, r7
 11                    add	r4, r5
 f0 2c 41              stsp8	[sp+0x41], r4
 fa 78                 lsr16i	r4, 0x8
 12                    add	r4, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 51                 stsp16	[sp+0x4], r5
 f4 63                 stsp16	[sp+0x8], r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 09                    mov	r6, r5
 c1 f9                 ldi8	r5, 0xf9
 f3 19                 mulu8.w	r6, r5
 fa 98                 lsr16i	r6, 0x8
 c1 a2                 ldi8	r5, 0xa2
 f3 1d                 mulu8.w	r7, r5
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 16                    add	r5, r6
 f4 71                 stsp16	[sp+0xc], r5
 f4 12                 ldsp16	r6, [sp+0x4]
 f1 76                 zext8	r6
 c1 f9                 ldi8	r5, 0xf9
 f6 39                 mul8	r6, r5
 c1 fe                 ldi8	r5, 0xfe
 8d                    and	r7, r5
 1c                    add	r7, r4
 1e                    add	r7, r6
 f0 2f 42              stsp8	[sp+0x42], r7
 fa a8                 lsr16i	r7, 0x8
 f4 30                 ldsp16	r4, [sp+0xc]
 1c                    add	r7, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 51                 stsp16	[sp+0x4], r5
 f4 62                 stsp16	[sp+0x8], r6
 c2 a2                 ldi8	r6, 0xa2
 f3 16                 mulu8.w	r5, r6
 c2 fe                 ldi8	r6, 0xfe
 89                    and	r6, r5
 1b                    add	r6, r7
 f0 2e 43              stsp8	[sp+0x43], r6
 fa 98                 lsr16i	r6, 0x8
 0d                    mov	r7, r5
 fa a8                 lsr16i	r7, 0x8
 1e                    add	r7, r6
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 11                 ldsp16	r5, [sp+0x4]
 f0 34 14              ldsp16	r4, [sp+0x14]
 fa 77                 lsr16i	r4, 0x7
 f1 74                 zext8	r4
 c5 96 01              ldi16	r5, 0x196
 08                    mov	r6, r4
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 24                    sub	r5, r4
 f0 00 07              ldi8	r0, 0x7
 09                    mov	r6, r5
 f9 c0                 and	r6, r0
 fa 83                 lsr16i	r5, 0x3
 f0 11 22              leasp	r1, 0x22
 f2 25                 add	r5, r1
 f0 2f 44              stsp8	[sp+0x44], r7
 4d                    ld8u	r7, [r5]
 fa 1e                 lsr16v	r7, r6
 ce 07                 cmpi.s8	r6, 0x7
 d1 05                 brne8	0x5 <L0>
 ed 8a 21              ld8u	r4, [r5+1]
 10                    add	r4, r4
 9c                    or	r7, r4
<L0>:
 f4 43                 stsp16	[sp+0x0], r7
 c6 76 01              ldi16	r6, 0x176
 f0 34 14              ldsp16	r4, [sp+0x14]
 28                    sub	r6, r4
 02                    mov	r4, r6
 fa 73                 lsr16i	r4, 0x3
 f2 0c                 add	r1, r4
 f9 c0                 and	r6, r0
 f4 52                 stsp16	[sp+0x4], r6
 af                    xor	r7, r7
 f0 6a 82              ld32	q2, [r1]
 e1 45 02              call16	__avm_lshrsi3
 f4 13                 ldsp16	r7, [sp+0x4]
 f4 a7                 tst8	r7
 c2 20                 ldi8	r6, 0x20
 d0 17                 breq8	0x17 <L1>
 2b                    sub	r6, r7
 f2 66                 mov32	q1, q2
 af                    xor	r7, r7
 ed 82 24              ld8u	r4, [r1+4]
 a5                    xor	r5, r5
 e1 06 02              call16	__avm_ashlsi3
 f9 51                 or	r2, r4
 f9 75                 or	r3, r5
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 d4 04                 jmp8	0x4 <L2>
<L1>:
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
<L2>:
 f0 02 03              ldi8	r2, 0x3
 c6 56 01              ldi16	r6, 0x156
 f0 34 14              ldsp16	r4, [sp+0x14]
 28                    sub	r6, r4
 02                    mov	r4, r6
 fa 73                 lsr16i	r4, 0x3
 f0 13 22              leasp	r3, 0x22
 f2 1c                 add	r3, r4
 f9 c0                 and	r6, r0
 f4 62                 stsp16	[sp+0x8], r6
 af                    xor	r7, r7
 f0 6a 86              ld32	q2, [r3]
 e1 05 02              call16	__avm_lshrsi3
 f2 62                 mov32	q0, q2
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 a5                 tst8	r5
 d0 10                 breq8	0x10 <L3>
 c0 20                 ldi8	r4, 0x20
 21                    sub	r4, r5
 08                    mov	r6, r4
 af                    xor	r7, r7
 ed 86 24              ld8u	r4, [r3+4]
 a5                    xor	r5, r5
 e1 c5 01              call16	__avm_ashlsi3
 f9 11                 or	r0, r4
 f9 35                 or	r1, r5
<L3>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f9 88                 and	r4, r2
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 69 4c              cmp32	q1, q3
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f4 40                 stsp16	[sp+0x0], r4
 d9 0a                 brsge8	0xa <L4>
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 02                    mov	r4, r6
 07                    mov	r5, r7
 d4 1e                 jmp8	0x1e <L5>
<L4>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 f0 69 04              cmp32	q0, q1
 f8 04                 cset.eq	r4
 a5                    xor	r5, r5
 f7 6b                 add32	q2, q3
 f7 74                 sub32	q1, q0
 f0 3a 14              stsp16	[sp+0x14], r2
 f0 3b 16              stsp16	[sp+0x16], r3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 ae                 inc16	r6
 f4 42                 stsp16	[sp+0x0], r6
<L5>:
 f0 06 ff ff           ldi16	r2, 0xffff
 f2 4b                 sub	r3, r3
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 f9 88                 and	r4, r2
 f9 ac                 and	r5, r3
 ff c5 0e              u32tof	q3, q2
 a0                    xor	r4, r4
 c5 80 2f              ldi16	r5, 0x2f80
 ff 2e                 fmul	q3, q2
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 ff c5 0c              u32tof	q3, q0
 c5 80 37              ldi16	r5, 0x3780
 ff 2e                 fmul	q3, q2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 ff 0e                 fadd	q3, q2
 c4 00 f0              ldi16	r4, 0xf000
 c5 ff ff              ldi16	r5, 0xffff
 82                    and	r4, r6
 87                    and	r5, r7
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f9 50                 and	r2, r4
 ff c5 05              u32tof	q1, q1
 f2 30                 sub	r0, r0
 f0 05 80 1f           ldi16	r1, 0x1f80
 ff 24                 fmul	q1, q0
 f0 3a 49              stsp16	[sp+0x49], r2
 f0 3b 4b              stsp16	[sp+0x4b], r3
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 ff c5 08              u32tof	q2, q0
 f2 30                 sub	r0, r0
 f0 05 80 27           ldi16	r1, 0x2780
 ff 28                 fmul	q2, q0
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f0 35 20              ldsp16	r5, [sp+0x20]
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 f2 63                 mov32	q0, q3
 ff 22                 fmul	q0, q2
 f0 38 18              stsp16	[sp+0x18], r0
 f0 39 1a              stsp16	[sp+0x1a], r1
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f2 42                 sub	r2, r2
 f0 07 c9 3f           ldi16	r3, 0x3fc9
 ff 29                 fmul	q2, q1
 ff 18                 fsub	q2, q0
 f0 04 00 a0           ldi16	r0, 0xa000
 f0 05 fd 39           ldi16	r1, 0x39fd
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 ff 24                 fmul	q1, q0
 ff 06                 fadd	q1, q2
 f0 3a 45              stsp16	[sp+0x45], r2
 f0 3b 47              stsp16	[sp+0x47], r3
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f0 32 49              ldsp16	r2, [sp+0x49]
 f0 33 4b              ldsp16	r3, [sp+0x4b]
 ff 09                 fadd	q2, q1
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 c4 69 21              ldi16	r4, 0x2169
 c5 a2 33              ldi16	r5, 0x33a2
 f2 67                 mov32	q1, q3
 ff 26                 fmul	q1, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 1b                 fsub	q2, q3
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 1e                 fsub	q3, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 30                 sub	r0, r0
 f0 05 c9 3f           ldi16	r1, 0x3fc9
 ff 28                 fmul	q2, q0
 f0 30 45              ldsp16	r0, [sp+0x45]
 f0 31 47              ldsp16	r1, [sp+0x47]
 ff 08                 fadd	q2, q0
 f0 04 00 a0           ldi16	r0, 0xa000
 f0 05 fd 39           ldi16	r1, 0x39fd
 ff 2c                 fmul	q3, q0
 ff 0e                 fadd	q3, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 ff 08                 fadd	q2, q0
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 ff 02                 fadd	q0, q2
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 ff 22                 fmul	q0, q2
 ff 04                 fadd	q1, q0
 ff 07                 fadd	q1, q3
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 09                 fadd	q2, q1
 ff 1e                 fsub	q3, q2
 ff 07                 fadd	q1, q3
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f0 69 c0              cmp32	q3, q0
 d9 08                 brsge8	0x8 <L6>
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 d4 0a                 jmp8	0xa <L7>
<L6>:
 ff 61                 fneg	q1
 ff 62                 fneg	q2
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 02                 ldsp16	r6, [sp+0x0]
<L7>:
 a5                    xor	r5, r5
 26                    sub	r5, r6
 f0 30 1e              ldsp16	r0, [sp+0x1e]
 f0 31 20              ldsp16	r1, [sp+0x20]
 02                    mov	r4, r6
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 fd 25                 cmov.slt	r4, r5
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
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
