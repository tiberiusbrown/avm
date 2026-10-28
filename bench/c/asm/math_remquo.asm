
math_remquo.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 math_remquo.c
0000046d l     O .rodata	00000040 inputs
00000100 l     O .data	00000002 integer_result
00000102 l     O .data	00000004 result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 ef_remquo.c
00000000 l    df *ABS*	00000000 stdlib.c
00000000 l    df *ABS*	00000000 avm.c
00000000 l    df *ABS*	00000000 ctype.c
00000000 l    df *ABS*	00000000 strtof.c
00000000 l    df *ABS*	00000000 integer.c
00000000 l    df *ABS*	00000000 wide_integer.c
000004ad l       .init_array	00000000 .hidden __init_array_end
000004ad l       .init_array	00000000 .hidden __init_array_start
000004ad l       .fini_array	00000000 .hidden __fini_array_start
000004ad l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	0000004f avm_test_main
000002b8 g     F .text	00000065 __avm_terminate
000002b6 g     F .text	00000002 avm_halt
0000031d g     F .text	00000150 remquof
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000106 g     O .data	00000002 __avm_errno

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
 e1 a2 00              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 93 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 ad 04              ldi16	r4, 0x4ad
 c1 00                 ldi8	r5, 0x0
 c6 ad 04              ldi16	r6, 0x4ad
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 ad 04           ldi16	r0, 0x4ad
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 ad 04           ldi16	r2, 0x4ad
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
 d6 fe                 adjsp	-0x2
 f2 42                 sub	r2, r2
 d7 01                 sys	debug_break
 f0 03 0f              ldi8	r3, 0xf
 f2 30                 sub	r0, r0
 f0 05 d0 3f           ldi16	r1, 0x3fd0
<L0>:
 d6 fe                 adjsp	-0x2
 f0 14 02              leasp	r4, 0x2
 f4 40                 stsp16	[sp+0x0], r4
 f1 22                 mov	r4, r2
 f9 8c                 and	r4, r3
 10                    add	r4, r4
 10                    add	r4, r4
 a5                    xor	r5, r5
 c6 6d 04              ldi16	r6, 0x46d
 c3 00                 ldi8	r7, 0x0
 f7 6b                 add32	q2, q3
 f0 64 88              ldp32	q2, [q2]
 f2 6a                 mov32	q3, q0
 e1 86 00              call16	remquof
 d6 02                 adjsp	0x2
 c6 02 01              ldi16	r6, 0x102
 f0 6b 8c              st32	[r6], q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 5c 00 01           stm16	[0x100], r4
 f4 aa                 inc16	r2
 f0 0e 20              cmpi.s8	r2, 0x20
 d1 ce                 brne8	-0x32 <L0>
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 02                 adjsp	0x2
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
 e1 33 fd              call16	-717 <__avm_run_local_dtors>
<L0>:
 c4 ad 04              ldi16	r4, 0x4ad
 c1 00                 ldi8	r5, 0x0
 c6 ad 04              ldi16	r6, 0x4ad
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 ad 04           ldi16	r2, 0x4ad
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 ad 04           ldi16	r0, 0x4ad
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
 e1 ea fc              call16	-790 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<remquof>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ec                 adjsp	-0x14
 f2 66                 mov32	q1, q2
 f0 30 1f              ldsp16	r0, [sp+0x1f]
 f2 39                 sub	r1, r1
 f0 38 12              stsp16	[sp+0x12], r0
 ee 30 20              st16	[r0+0], r1
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 ff 09                 fabs	q1
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 84              cmp32	q2, q1
 d2 3e                 brult8	0x3e <L0>
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 0b                 fabs	q3
 f0 00 01              ldi8	r0, 0x1
 f0 05 80 7f           ldi16	r1, 0x7f80
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 69 c0              cmp32	q3, q0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d8 28                 bruge8	0x28 <L0>
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 4c              cmp32	q1, q3
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 da fa 00              breq16	0xfa <L10>
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 da f2 00              breq16	0xf2 <L10>
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 0c              cmp32	q0, q3
 d1 10                 brne8	0x10 <L1>
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 e0 db 00              jmp16	219 <L9>
<L0>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 00                 fadd
 e0 d2 00              jmp16	210 <L9>
<L1>:
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 aa                    xor	r6, r6
 c7 00 41              ldi16	r7, 0x4100
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 1c                 fmod
 f2 66                 mov32	q1, q2
 f0 3a 0a              stsp16	[sp+0xa], r2
 f0 3b 0c              stsp16	[sp+0xc], r3
 aa                    xor	r6, r6
 c7 80 40              ldi16	r7, 0x4080
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 c1 04                 ldi8	r5, 0x4
 f0 69 4c              cmp32	q1, q3
 a0                    xor	r4, r4
 fc 2c                 cmov.ult	r5, r4
 f4 61                 stsp16	[sp+0x8], r5
 f2 69                 mov32	q2, q1
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 fc 14                 cmov.ult	r2, r4
 fc 1d                 cmov.ult	r3, r5
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 69 4c              cmp32	q1, q3
 d8 15                 bruge8	0x15 <L2>
 f2 6b                 mov32	q3, q1
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 69 c0              cmp32	q3, q0
 d8 20                 bruge8	0x20 <L3>
 f2 68                 mov32	q2, q0
 ff 01                 fsub
 f0 69 8c              cmp32	q2, q3
 d2 37                 brult8	0x37 <L6>
 d4 28                 jmp8	0x28 <L5>
<L2>:
 c0 02                 ldi8	r4, 0x2
 f4 21                 ldsp16	r5, [sp+0x8]
 94                    or	r5, r4
 f4 61                 stsp16	[sp+0x8], r5
 f2 69                 mov32	q2, q1
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 69 c0              cmp32	q3, q0
 d2 0a                 brult8	0xa <L4>
<L3>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 aa                 inc16	r2
<L4>:
 f2 68                 mov32	q2, q0
 ff 01                 fsub
 f0 69 8c              cmp32	q2, q3
 d2 0d                 brult8	0xd <L6>
<L5>:
 f0 69 c8              cmp32	q3, q2
 d1 16                 brne8	0x16 <L7>
 c0 01                 ldi8	r4, 0x1
 f9 88                 and	r4, r2
 f4 a4                 tst8	r4
 d0 0e                 breq8	0xe <L7>
<L6>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 aa                 inc16	r2
 d4 04                 jmp8	0x4 <L8>
<L7>:
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
<L8>:
 c0 07                 ldi8	r4, 0x7
 f9 88                 and	r4, r2
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 f9 1a                 xor	r0, r6
 f9 3e                 xor	r1, r7
 a5                    xor	r5, r5
 24                    sub	r5, r4
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 fd 25                 cmov.slt	r4, r5
 f0 35 12              ldsp16	r5, [sp+0x12]
 74                    st16	[r5], r4
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 87                    and	r5, r7
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 a2                    xor	r4, r6
 a7                    xor	r5, r7
<L9>:
 d6 14                 adjsp	0x14
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L10>:
 c0 21                 ldi8	r4, 0x21
 f0 5c 06 01           stm16	[0x106], r4
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 d4 ed                 jmp8	-0x13 <L9>
