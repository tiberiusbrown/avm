
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
000004ba l       .init_array	00000000 .hidden __init_array_end
000004ba l       .init_array	00000000 .hidden __init_array_start
000004ba l       .fini_array	00000000 .hidden __fini_array_start
000004ba l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000031 avm_test_main
000002f8 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000002fa g     F .text	000001c0 atanf

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
 c4 ba 04              ldi16	r4, 0x4ba
 c1 00                 ldi8	r5, 0x0
 c6 ba 04              ldi16	r6, 0x4ba
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 ba 04           ldi16	r0, 0x4ba
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 ba 04           ldi16	r2, 0x4ba
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
 c4 ba 04              ldi16	r4, 0x4ba
 c1 00                 ldi8	r5, 0x0
 c6 ba 04              ldi16	r6, 0x4ba
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 ba 04           ldi16	r2, 0x4ba
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 ba 04           ldi16	r0, 0x4ba
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
 d6 f4                 adjsp	-0xc
 f2 66                 mov32	q1, q2
 ff 65                 fabs	q1
 aa                    xor	r6, r6
 c7 80 50              ldi16	r7, 0x5080
 f0 69 4c              cmp32	q1, q3
 d2 0f                 brult8	0xf <L0>
 c2 01                 ldi8	r6, 0x1
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 4c              cmp32	q1, q3
 d2 46                 brult8	0x46 <L1>
 ff 0a                 fadd	q2, q2
 e0 97 01              jmp16	407 <L8>
<L0>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 df 3e              ldi16	r7, 0x3edf
 f0 69 c4              cmp32	q3, q1
 d2 52                 brult8	0x52 <L2>
 aa                    xor	r6, r6
 c7 00 31              ldi16	r7, 0x3100
 f0 69 4c              cmp32	q1, q3
 dc 82 01              brult16	0x182 <L8>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2f                 fmul	q3, q3
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 05 d1 51 7f 3d 6e a0 da bd e1 fe 11 3e 16 cb 4c be aa aa aa 3e  fpoly	5, 0.0623338855, -0.106751308, 0.142573848, -0.199993461, 0.333333313
 ff 2e                 fmul	q3, q2
 f2 68                 mov32	q2, q0
 ff 2b                 fmul	q2, q3
 ff 12                 fsub	q0, q2
 f2 68                 mov32	q2, q0
 e0 56 01              jmp16	342 <L8>
<L1>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f2 62                 mov32	q0, q2
 c4 db 0f              ldi16	r4, 0xfdb
 c5 c9 bf              ldi16	r5, 0xbfc9
 f0 06 db 0f           ldi16	r2, 0xfdb
 f0 07 c9 3f           ldi16	r3, 0x3fc9
 f0 69 c0              cmp32	q3, q0
 fd 22                 cmov.slt	r4, r2
 fd 2b                 cmov.slt	r5, r3
 e0 3a 01              jmp16	314 <L8>
<L2>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 97 3f              ldi16	r7, 0x3f97
 f0 69 c4              cmp32	q3, q1
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 d2 52                 brult8	0x52 <L3>
 a0                    xor	r4, r4
 c5 30 3f              ldi16	r5, 0x3f30
 f0 69 48              cmp32	q1, q2
 d8 7a                 bruge8	0x7a <L4>
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 f2 6b                 mov32	q3, q1
 ff 0e                 fadd	q3, q2
 ff 05                 fadd	q1, q1
 c5 80 bf              ldi16	r5, 0xbf80
 ff 06                 fadd	q1, q2
 ff 37                 fdiv	q1, q3
 f2 6b                 mov32	q3, q1
 ff 2f                 fmul	q3, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 05 d1 51 7f 3d 6e a0 da bd e1 fe 11 3e 16 cb 4c be aa aa aa 3e  fpoly	5, 0.0623338855, -0.106751308, 0.142573848, -0.199993461, 0.333333313
 ff 2e                 fmul	q3, q2
 c4 69 37              ldi16	r4, 0x3769
 c5 ac 31              ldi16	r5, 0x31ac
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c4 38 63              ldi16	r4, 0x6338
 c5 ed 3e              ldi16	r5, 0x3eed
 f2 61                 mov32	q0, q1
 ff 23                 fmul	q0, q3
 f2 6b                 mov32	q3, q1
 e0 ba 00              jmp16	186 <L7>
<L3>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 1b 40              ldi16	r7, 0x401b
 f0 69 c4              cmp32	q3, q1
 d2 6c                 brult8	0x6c <L5>
 a0                    xor	r4, r4
 c5 c0 bf              ldi16	r5, 0xbfc0
 f2 6b                 mov32	q3, q1
 ff 0e                 fadd	q3, q2
 c5 c0 3f              ldi16	r5, 0x3fc0
 ff 26                 fmul	q1, q2
 c5 80 3f              ldi16	r5, 0x3f80
 ff 06                 fadd	q1, q2
 ff 3d                 fdiv	q3, q1
 c4 b4 0f              ldi16	r4, 0xfb4
 c5 14 33              ldi16	r5, 0x3314
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c4 5e 98              ldi16	r4, 0x985e
 c5 7b 3f              ldi16	r5, 0x3f7b
 d4 5c                 jmp8	0x5c <L6>
<L4>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6b                 mov32	q3, q1
 ff 0e                 fadd	q3, q2
 c5 80 bf              ldi16	r5, 0xbf80
 ff 06                 fadd	q1, q2
 ff 37                 fdiv	q1, q3
 f2 6b                 mov32	q3, q1
 ff 2f                 fmul	q3, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 05 d1 51 7f 3d 6e a0 da bd e1 fe 11 3e 16 cb 4c be aa aa aa 3e  fpoly	5, 0.0623338855, -0.106751308, 0.142573848, -0.199993461, 0.333333313
 ff 2e                 fmul	q3, q2
 c4 68 21              ldi16	r4, 0x2168
 c5 22 33              ldi16	r5, 0x3322
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c4 da 0f              ldi16	r4, 0xfda
 c5 49 3f              ldi16	r5, 0x3f49
 f2 61                 mov32	q0, q1
 ff 23                 fmul	q0, q3
 f2 6b                 mov32	q3, q1
 d4 43                 jmp8	0x43 <L7>
<L5>:
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 ff 3d                 fdiv	q3, q1
 c4 68 21              ldi16	r4, 0x2168
 c5 a2 33              ldi16	r5, 0x33a2
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
<L6>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 67                 mov32	q1, q3
 ff 2f                 fmul	q3, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 05 d1 51 7f 3d 6e a0 da bd e1 fe 11 3e 16 cb 4c be aa aa aa 3e  fpoly	5, 0.0623338855, -0.106751308, 0.142573848, -0.199993461, 0.333333313
 ff 2e                 fmul	q3, q2
 f2 61                 mov32	q0, q1
 ff 23                 fmul	q0, q3
 f2 6b                 mov32	q3, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
<L7>:
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 ff 11                 fsub	q0, q1
 ff 1c                 fsub	q3, q0
 ff 0b                 fadd	q2, q3
 f2 62                 mov32	q0, q2
 ff 60                 fneg	q0
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 69 c4              cmp32	q3, q1
 fd 20                 cmov.slt	r4, r0
 fd 29                 cmov.slt	r5, r1
<L8>:
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
