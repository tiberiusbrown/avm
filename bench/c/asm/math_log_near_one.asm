
math_log_near_one.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 math_log_near_one.c
00000100 l     O .data	00000080 inputs
00000180 l     O .data	00000004 result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 ef_log.c
0000044f l       .init_array	00000000 .hidden __init_array_end
0000044f l       .init_array	00000000 .hidden __init_array_start
0000044f l       .fini_array	00000000 .hidden __fini_array_start
0000044f l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000031 avm_test_main
000002f8 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000002fa g     F .text	00000155 logf

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
 c4 4f 04              ldi16	r4, 0x44f
 c1 00                 ldi8	r5, 0x0
 c6 4f 04              ldi16	r6, 0x44f
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 4f 04           ldi16	r0, 0x44f
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 4f 04           ldi16	r2, 0x44f
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
 c4 4f 04              ldi16	r4, 0x44f
 c1 00                 ldi8	r5, 0x0
 c6 4f 04              ldi16	r6, 0x44f
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 4f 04           ldi16	r2, 0x44f
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 4f 04           ldi16	r0, 0x44f
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
 d5 19                 call8	logf
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

<logf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 aa                    xor	r6, r6
 c7 80 80              ldi16	r7, 0x8080
 f2 62                 mov32	q0, q2
 f7 63                 add32	q0, q3
 f0 69 c0              cmp32	q3, q0
 d2 13                 brult8	0x13 <L0>
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 ff c8 68              fcmp	r6, q2, q0
 f6 2e                 tst16	r6
 db 21 01              brne16	0x121 <L6>
 a0                    xor	r4, r4
 c5 80 ff              ldi16	r5, 0xff80
 e0 13 01              jmp16	275 <L5>
<L0>:
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 7f              ldi8	r3, 0x7f
 f0 69 48              cmp32	q1, q2
 d2 0d                 brult8	0xd <L1>
 f2 30                 sub	r0, r0
 f0 05 00 4c           ldi16	r1, 0x4c00
 ff 28                 fmul	q2, q0
 c7 68 ff              ldi16	r7, 0xff68
 d4 03                 jmp8	0x3 <L2>
<L1>:
 c7 81 ff              ldi16	r7, 0xff81
<L2>:
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 f0 04 20 fb           ldi16	r0, 0xfb20
 f0 01 4a              ldi8	r1, 0x4a
 f7 61                 add32	q0, q1
 c2 80                 ldi8	r6, 0x80
 f9 c4                 and	r6, r1
 f9 79                 or	r3, r6
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 13                    add	r4, r7
 f1 29                 mov	r6, r1
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 18                    add	r6, r4
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f9 ca                 xor	r6, r2
 f9 ee                 xor	r7, r3
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 ff 0e                 fadd	q3, q2
 c5 80 3d              ldi16	r5, 0x3d80
 f2 63                 mov32	q0, q3
 ff 64                 fabs	q0
 ff c8 42              fcmp	r4, q0, q2
 cc 01                 cmpi.s8	r4, 0x1
 d3 7a                 brslt8	0x7a <L3>
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 f2 63                 mov32	q0, q3
 ff 02                 fadd	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 38                 fdiv	q2, q0
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 62                 mov32	q0, q2
 ff 20                 fmul	q0, q0
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 ff 20                 fmul	q0, q0
 f2 68                 mov32	q2, q0
 ff ca 04 97 88 17 3e 25 33 3a 3e 25 49 92 3e ab aa 2a 3f      fpoly	4, 0.147981986, 0.181835726, 0.285714298, 0.666666686
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 ff 26                 fmul	q1, q2
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f2 68                 mov32	q2, q0
 ff ca 03 4f d0 1c 3e 29 8e 63 3e cd cc cc 3e  fpoly	3, 0.153138384, 0.222221985, 0.400000006
 ff 22                 fmul	q0, q2
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 f2 67                 mov32	q1, q3
 ff 26                 fmul	q1, q2
 f2 69                 mov32	q2, q1
 f2 67                 mov32	q1, q3
 ff 26                 fmul	q1, q2
 f2 69                 mov32	q2, q1
 ff 08                 fadd	q2, q0
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 08                 fadd	q2, q0
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 ff 22                 fmul	q0, q2
 ff 11                 fsub	q0, q1
 ff 0c                 fadd	q3, q0
 d4 21                 jmp8	0x21 <L4>
<L3>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 05 ab aa 2a 3e cd cc 4c be 00 00 80 3e ab aa aa be 00 00 00 3f  fpoly	5, 0.166666672, -0.200000003, 0.25, -0.333333343, 0.5
 f2 63                 mov32	q0, q3
 ff 20                 fmul	q0, q0
 ff 22                 fmul	q0, q2
 ff 1c                 fsub	q3, q0
<L4>:
 f4 20                 ldsp16	r4, [sp+0x8]
 ff c0 40              s16tof	q0, r4
 f0 06 80 71           ldi16	r2, 0x7180
 f0 07 31 3f           ldi16	r3, 0x3f31
 f2 68                 mov32	q2, q0
 ff 29                 fmul	q2, q1
 f0 06 d1 f7           ldi16	r2, 0xf7d1
 f0 07 17 37           ldi16	r3, 0x3717
 ff 21                 fmul	q0, q1
 ff 03                 fadd	q0, q3
 ff 08                 fadd	q2, q0
<L5>:
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L6>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c8              cmp32	q3, q2
 d9 04                 brsge8	0x4 <L7>
 ff 0a                 fadd	q2, q2
 d4 ea                 jmp8	-0x16 <L5>
<L7>:
 ff 1a                 fsub	q2, q2
 ff 38                 fdiv	q2, q0
 d4 e4                 jmp8	-0x1c <L5>
