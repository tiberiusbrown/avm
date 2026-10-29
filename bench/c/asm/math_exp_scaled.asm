
math_exp_scaled.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000222 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 math_exp_scaled.c
00000100 l     O .data	00000080 inputs
00000180 l     O .data	00000004 result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 ef_exp.c
00000000 l    df *ABS*	00000000 stdlib.c
00000000 l    df *ABS*	00000000 avm.c
00000000 l    df *ABS*	00000000 ctype.c
00000000 l    df *ABS*	00000000 strtof.c
00000000 l    df *ABS*	00000000 integer.c
00000000 l    df *ABS*	00000000 wide_integer.c
0000041e l       .init_array	00000000 .hidden __init_array_end
0000041e l       .init_array	00000000 .hidden __init_array_start
0000041e l       .fini_array	00000000 .hidden __fini_array_start
0000041e l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000022 _start
00000266 g     F .text	00000038 avm_test_main
000002a0 g     F .text	00000065 __avm_terminate
0000029e g     F .text	00000002 avm_halt
00000305 g     F .text	00000119 expf
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000184 g     O .data	00000002 __avm_errno

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
 e1 8a 00              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 d5 7c                 call8	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 1e 04              ldi16	r4, 0x41e
 c1 00                 ldi8	r5, 0x0
 c6 1e 04              ldi16	r6, 0x41e
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 1e 04           ldi16	r0, 0x41e
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 1e 04           ldi16	r2, 0x41e
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
 f0 03 80              ldi8	r3, 0x80
<L0>:
 f1 22                 mov	r4, r2
 c5 00 01              ldi16	r5, 0x100
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 e1 84 00              call16	expf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f0 0a 04              addi.s8	r2, 0x4
 f5 13                 cmp	r2, r3
 d1 e5                 brne8	-0x1b <L0>
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
 e1 4b fd              call16	-693 <__avm_run_local_dtors>
<L0>:
 c4 1e 04              ldi16	r4, 0x41e
 c1 00                 ldi8	r5, 0x0
 c6 1e 04              ldi16	r6, 0x41e
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 1e 04           ldi16	r2, 0x41e
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 1e 04           ldi16	r0, 0x41e
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
 e1 02 fd              call16	-766 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<expf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f2 62                 mov32	q0, q2
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 c4 80 7f              ldi16	r4, 0x7f80
 f5 1c                 cmp	r3, r4
 d2 1b                 brult8	0x1b <L0>
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 48              cmp32	q1, q2
 d1 50                 brne8	0x50 <L3>
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c0              cmp32	q3, q0
 fd 20                 cmov.slt	r4, r0
 fd 29                 cmov.slt	r5, r1
 e0 dc 00              jmp16	220 <L7>
<L0>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d3 18                 brslt8	0x18 <L1>
 c6 18 72              ldi16	r6, 0x7218
 c7 b1 42              ldi16	r7, 0x42b1
 f0 69 4c              cmp32	q1, q3
 d2 0d                 brult8	0xd <L1>
 c0 22                 ldi8	r4, 0x22
 f0 5c 84 01           stm16	[0x184], r4
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 e0 bd 00              jmp16	189 <L7>
<L1>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c0              cmp32	q3, q0
 d3 1d                 brslt8	0x1d <L4>
 c6 b6 f1              ldi16	r6, 0xf1b6
 c7 cf 42              ldi16	r7, 0x42cf
 f0 69 4c              cmp32	q1, q3
 d2 12                 brult8	0x12 <L4>
<L2>:
 c2 22                 ldi8	r6, 0x22
 f0 5e 84 01           stm16	[0x184], r6
 e0 9e 00              jmp16	158 <L7>
<L3>:
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 e0 95 00              jmp16	149 <L7>
<L4>:
 c6 3b aa              ldi16	r6, 0xaa3b
 c7 b8 3f              ldi16	r7, 0x3fb8
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 c6 18 72              ldi16	r6, 0x7218
 c7 b1 3e              ldi16	r7, 0x3eb1
 f0 69 c4              cmp32	q3, q1
 d8 61                 bruge8	0x61 <L5>
 f1 29                 mov	r6, r1
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
 ff 15 05 66 01 1d 3c 23 fe 64 3d bc 01 76 3e 96 70 31 3f 00 00 80 3f  fpoly	5, 0.00958285294, 0.0559064262, 0.240240991, 0.693124175, 1.0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 01                 ldsp16	r5, [sp+0x0]
 cd 83                 cmpi.s8	r5, -0x7d
 d9 3c                 brsge8	0x3c <L6>
 fa 47                 lsl16i	r5, 0x7
 c4 00 32              ldi16	r4, 0x3200
 11                    add	r4, r5
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f7 6b                 add32	q2, q3
 aa                    xor	r6, r6
 c7 80 0d              ldi16	r7, 0xd80
 ff 02                 fmul
 09                    mov	r6, r5
 c7 80 7f              ldi16	r7, 0x7f80
 8b                    and	r6, r7
 c7 80 80              ldi16	r7, 0x8080
 1e                    add	r7, r6
 c6 ff 80              ldi16	r6, 0x80ff
 3b                    cmp	r6, r7
 dd 7a ff              bruge16	-0x86 <L2>
 d4 1f                 jmp8	0x1f <L7>
<L5>:
 ff 15 05 66 01 1d 3c 23 fe 64 3d bc 01 76 3e 96 70 31 3f 00 00 80 3f  fpoly	5, 0.00958285294, 0.0559064262, 0.240240991, 0.693124175, 1.0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a5                    xor	r5, r5
<L6>:
 fa 47                 lsl16i	r5, 0x7
 a0                    xor	r4, r4
 f7 6b                 add32	q2, q3
<L7>:
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
