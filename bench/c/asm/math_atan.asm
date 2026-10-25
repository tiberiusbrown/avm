
math_atan.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 math_atan.c
00000100 l     O .data	00000080 inputs
00000180 l     O .data	00000004 result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 sf_atan.c
0000051b l       .init_array	00000000 .hidden __init_array_end
0000051b l       .init_array	00000000 .hidden __init_array_start
0000051b l       .fini_array	00000000 .hidden __fini_array_start
0000051b l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000031 avm_test_main
000002f8 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000002fa g     F .text	00000221 atanf

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
 c4 1b 05              ldi16	r4, 0x51b
 c1 00                 ldi8	r5, 0x0
 c6 1b 05              ldi16	r6, 0x51b
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 1b 05           ldi16	r0, 0x51b
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 1b 05           ldi16	r2, 0x51b
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
 c4 1b 05              ldi16	r4, 0x51b
 c1 00                 ldi8	r5, 0x0
 c6 1b 05              ldi16	r6, 0x51b
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 1b 05           ldi16	r2, 0x51b
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 1b 05           ldi16	r0, 0x51b
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
 d5 19                 call8	atanf
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

<atanf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	-0x12
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 63                 mov32	q0, q3
 ff 64                 fabs	q0
 a0                    xor	r4, r4
 c5 80 50              ldi16	r5, 0x5080
 f0 69 08              cmp32	q0, q2
 d2 0f                 brult8	0xf <L0>
 c0 01                 ldi8	r4, 0x1
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 08              cmp32	q0, q2
 d2 43                 brult8	0x43 <L1>
 ff 0f                 fadd	q3, q3
 e0 f4 01              jmp16	500 <L9>
<L0>:
 a0                    xor	r4, r4
 c5 e0 3e              ldi16	r5, 0x3ee0
 f0 69 08              cmp32	q0, q2
 f8 12                 cset.ult	r2
 c4 ff ff              ldi16	r4, 0xffff
 c5 df 3e              ldi16	r5, 0x3edf
 f0 69 80              cmp32	q2, q0
 d2 46                 brult8	0x46 <L2>
 a0                    xor	r4, r4
 c5 00 31              ldi16	r5, 0x3100
 f0 69 08              cmp32	q0, q2
 dc d6 01              brult16	0x1d6 <L9>
 f0 3a 04              stsp16	[sp+0x4], r2
 c4 68 21              ldi16	r4, 0x2168
 c5 a2 33              ldi16	r5, 0x33a2
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 a0                    xor	r4, r4
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 e0 9d 00              jmp16	157 <L4>
<L1>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f2 63                 mov32	q0, q3
 c6 db 0f              ldi16	r6, 0xfdb
 c7 c9 bf              ldi16	r7, 0xbfc9
 f0 06 db 0f           ldi16	r2, 0xfdb
 f0 07 c9 3f           ldi16	r3, 0x3fc9
 f0 69 80              cmp32	q2, q0
 fd 32                 cmov.slt	r6, r2
 fd 3b                 cmov.slt	r7, r3
 e0 9a 01              jmp16	410 <L9>
<L2>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 97 3f              ldi16	r5, 0x3f97
 f0 69 80              cmp32	q2, q0
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 3a 04              stsp16	[sp+0x4], r2
 d2 3a                 brult8	0x3a <L3>
 c4 ff ff              ldi16	r4, 0xffff
 c5 2f 3f              ldi16	r5, 0x3f2f
 f0 69 80              cmp32	q2, q0
 d2 6b                 brult8	0x6b <L5>
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 f2 6a                 mov32	q3, q0
 ff 0e                 fadd	q3, q2
 ff 00                 fadd	q0, q0
 c5 80 bf              ldi16	r5, 0xbf80
 ff 02                 fadd	q0, q2
 ff 33                 fdiv	q0, q3
 c4 68 21              ldi16	r4, 0x2168
 c5 a2 33              ldi16	r5, 0x33a2
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 a0                    xor	r4, r4
 f4 68                 stsp16	[sp+0xa], r4
 c0 01                 ldi8	r4, 0x1
 f4 70                 stsp16	[sp+0xc], r4
 e0 89 00              jmp16	137 <L7>
<L3>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 1b 40              ldi16	r5, 0x401b
 f0 69 80              cmp32	q2, q0
 d2 5d                 brult8	0x5d <L6>
 a0                    xor	r4, r4
 c5 c0 bf              ldi16	r5, 0xbfc0
 f2 6a                 mov32	q3, q0
 ff 0e                 fadd	q3, q2
 c5 c0 3f              ldi16	r5, 0x3fc0
 ff 22                 fmul	q0, q2
 c5 80 3f              ldi16	r5, 0x3f80
 ff 02                 fadd	q0, q2
 ff 3c                 fdiv	q3, q0
 c4 b4 0f              ldi16	r4, 0xfb4
 c5 14 33              ldi16	r5, 0x3314
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 c4 5e 98              ldi16	r4, 0x985e
 c5 7b 3f              ldi16	r5, 0x3f7b
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 a0                    xor	r4, r4
<L4>:
 f2 63                 mov32	q0, q3
 f4 70                 stsp16	[sp+0xc], r4
 f4 68                 stsp16	[sp+0xa], r4
 d4 4d                 jmp8	0x4d <L7>
<L5>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6a                 mov32	q3, q0
 ff 0e                 fadd	q3, q2
 c5 80 bf              ldi16	r5, 0xbf80
 ff 02                 fadd	q0, q2
 ff 33                 fdiv	q0, q3
 c4 68 21              ldi16	r4, 0x2168
 c5 a2 33              ldi16	r5, 0x33a2
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c0 01                 ldi8	r4, 0x1
 f4 68                 stsp16	[sp+0xa], r4
 a0                    xor	r4, r4
 f4 70                 stsp16	[sp+0xc], r4
 d4 21                 jmp8	0x21 <L7>
<L6>:
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 ff 38                 fdiv	q2, q0
 c6 68 21              ldi16	r6, 0x2168
 c7 a2 33              ldi16	r7, 0x33a2
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 aa                    xor	r6, r6
 f2 62                 mov32	q0, q2
 f4 72                 stsp16	[sp+0xc], r6
 f4 6a                 stsp16	[sp+0xa], r6
<L7>:
 f2 64                 mov32	q1, q0
 ff 25                 fmul	q1, q1
 c6 d1 51              ldi16	r6, 0x51d1
 c7 7f 3d              ldi16	r7, 0x3d7f
 f2 69                 mov32	q2, q1
 ff 2b                 fmul	q2, q3
 c6 6e a0              ldi16	r6, 0xa06e
 c7 da bd              ldi16	r7, 0xbdda
 ff 0b                 fadd	q2, q3
 f2 6b                 mov32	q3, q1
 ff 2e                 fmul	q3, q2
 c4 e1 fe              ldi16	r4, 0xfee1
 c5 11 3e              ldi16	r5, 0x3e11
 ff 0e                 fadd	q3, q2
 c0 01                 ldi8	r4, 0x1
 f4 11                 ldsp16	r5, [sp+0x4]
 84                    and	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 f2 69                 mov32	q2, q1
 ff 2b                 fmul	q2, q3
 c6 16 cb              ldi16	r6, 0xcb16
 c7 4c be              ldi16	r7, 0xbe4c
 ff 0b                 fadd	q2, q3
 f2 6b                 mov32	q3, q1
 ff 2e                 fmul	q3, q2
 c4 aa aa              ldi16	r4, 0xaaaa
 c5 aa 3e              ldi16	r5, 0x3eaa
 ff 0e                 fadd	q3, q2
 ff 27                 fmul	q1, q3
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 a4                 tst8	r4
 d0 0a                 breq8	0xa <L8>
 f2 68                 mov32	q2, q0
 ff 29                 fmul	q2, q1
 ff 12                 fsub	q0, q2
 f2 6a                 mov32	q3, q0
 d4 71                 jmp8	0x71 <L9>
<L8>:
 c4 68 21              ldi16	r4, 0x2168
 c5 22 33              ldi16	r5, 0x3322
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 a6                 tst8	r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 fb 74                 cmov.ne	r6, r4
 fb 7d                 cmov.ne	r7, r5
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 c4 da 0f              ldi16	r4, 0xfda
 c5 49 3f              ldi16	r5, 0x3f49
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 fb 74                 cmov.ne	r6, r4
 fb 7d                 cmov.ne	r7, r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c6 38 63              ldi16	r6, 0x6338
 c7 ed 3e              ldi16	r7, 0x3eed
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 a4                 tst8	r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 fb 66                 cmov.ne	r4, r6
 fb 6f                 cmov.ne	r5, r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c4 69 37              ldi16	r4, 0x3769
 c5 ac 31              ldi16	r5, 0x31ac
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 fb 74                 cmov.ne	r6, r4
 fb 7d                 cmov.ne	r7, r5
 f2 68                 mov32	q2, q0
 ff 29                 fmul	q2, q1
 ff 1b                 fsub	q2, q3
 ff 12                 fsub	q0, q2
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 ff 04                 fadd	q1, q0
 f2 69                 mov32	q2, q1
 ff 62                 fneg	q2
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 f0 69 0c              cmp32	q0, q3
 fd 14                 cmov.slt	r2, r4
 fd 1d                 cmov.slt	r3, r5
 f2 6b                 mov32	q3, q1
<L9>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
