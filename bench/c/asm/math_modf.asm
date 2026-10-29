
math_modf.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 math_modf.c
000003d1 l     O .rodata	00000040 inputs
00000100 l     O .data	00000004 result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 sf_decompose.c
00000000 l    df *ABS*	00000000 stdlib.c
00000000 l    df *ABS*	00000000 avm.c
00000000 l    df *ABS*	00000000 ctype.c
00000000 l    df *ABS*	00000000 strtof.c
00000000 l    df *ABS*	00000000 strtof_internal.c
00000000 l    df *ABS*	00000000 sf_scalbn.c
00000000 l    df *ABS*	00000000 integer.c
00000000 l    df *ABS*	00000000 wide_integer.c
00000411 l       .init_array	00000000 .hidden __init_array_end
00000411 l       .init_array	00000000 .hidden __init_array_start
00000411 l       .fini_array	00000000 .hidden __fini_array_start
00000411 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	00000047 avm_test_main
000002b0 g     F .text	00000065 __avm_terminate
000002ae g     F .text	00000002 avm_halt
00000315 g     F .text	000000bc modff
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
 e1 9a 00              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 8b 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 11 04              ldi16	r4, 0x411
 c1 00                 ldi8	r5, 0x0
 c6 11 04              ldi16	r6, 0x411
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 11 04           ldi16	r0, 0x411
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 11 04           ldi16	r2, 0x411
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
 d6 fa                 adjsp	-0x6
 f2 30                 sub	r0, r0
 d7 01                 sys	debug_break
 c0 0f                 ldi8	r4, 0xf
 f4 40                 stsp16	[sp+0x0], r4
 f0 06 d1 03           ldi16	r2, 0x3d1
 f0 03 00              ldi8	r3, 0x0
 f0 05 00 01           ldi16	r1, 0x100
<L0>:
 f1 20                 mov	r4, r0
 f4 01                 ldsp16	r5, [sp+0x0]
 81                    and	r4, r5
 10                    add	r4, r4
 10                    add	r4, r4
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 64 88              ldp32	q2, [q2]
 f0 16 02              leasp	r6, 0x2
 e1 82 00              call16	modff
 f0 6b 82              st32	[r1], q2
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f0 6b 82              st32	[r1], q2
 f4 a8                 inc16	r0
 f0 0c 20              cmpi.s8	r0, 0x20
 d1 dc                 brne8	-0x24 <L0>
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
 e1 3b fd              call16	-709 <__avm_run_local_dtors>
<L0>:
 c4 11 04              ldi16	r4, 0x411
 c1 00                 ldi8	r5, 0x0
 c6 11 04              ldi16	r6, 0x411
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 11 04           ldi16	r2, 0x411
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 11 04           ldi16	r0, 0x411
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
 e1 f2 fc              call16	-782 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<modff>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 f4 72                 stsp16	[sp+0xc], r6
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f2 42                 sub	r2, r2
 f0 07 00 80           ldi16	r3, 0x8000
 f9 74                 and	r3, r5
 f1 29                 mov	r6, r1
 fa 97                 lsr16i	r6, 0x7
 ce 7f                 cmpi.s8	r6, 0x7f
 d8 08                 bruge8	0x8 <L0>
 f4 32                 ldsp16	r6, [sp+0xc]
 f0 6b 4c              st32	[r6], q1
 e0 89 00              jmp16	137 <L5>
<L0>:
 c3 96                 ldi8	r7, 0x96
 3b                    cmp	r6, r7
 d2 20                 brult8	0x20 <L1>
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 c0              cmp32	q3, q0
 fc 14                 cmov.ult	r2, r4
 fc 1d                 cmov.ult	r3, r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 6b c8              st32	[r4], q3
 f2 69                 mov32	q2, q1
 d4 64                 jmp8	0x64 <L5>
<L1>:
 c3 85                 ldi8	r7, 0x85
 3e                    cmp	r7, r6
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 d2 0b                 brult8	0xb <L2>
 ca 81                 addi.s8	r6, -0x7f
 c3 7f                 ldi8	r7, 0x7f
 fa 1e                 lsr16v	r7, r6
 c6 ff ff              ldi16	r6, 0xffff
 d4 0b                 jmp8	0xb <L3>
<L2>:
 c7 7a ff              ldi16	r7, 0xff7a
 1b                    add	r6, r7
 c7 ff ff              ldi16	r7, 0xffff
 fa 1e                 lsr16v	r7, r6
 0b                    mov	r6, r7
 af                    xor	r7, r7
<L3>:
 f1 06                 mov	r0, r6
 f1 0f                 mov	r1, r7
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 88                    and	r6, r4
 8d                    and	r7, r5
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 6b c0              st32	[r0], q3
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f0 69 40              cmp32	q1, q0
 d0 04                 breq8	0x4 <L4>
 ff 01                 fsub
 d4 04                 jmp8	0x4 <L5>
<L4>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
<L5>:
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
