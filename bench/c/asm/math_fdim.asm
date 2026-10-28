
math_fdim.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 math_fdim.c
000003ac l     O .rodata	00000040 inputs
00000100 l     O .data	00000004 result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 sf_fdim.c
00000351 l     F .text	0000005b avm_fdim_special
00000000 l    df *ABS*	00000000 stdlib.c
00000000 l    df *ABS*	00000000 avm.c
00000000 l    df *ABS*	00000000 ctype.c
00000000 l    df *ABS*	00000000 strtof.c
00000000 l    df *ABS*	00000000 integer.c
00000000 l    df *ABS*	00000000 wide_integer.c
000003ec l       .init_array	00000000 .hidden __init_array_end
000003ec l       .init_array	00000000 .hidden __init_array_start
000003ec l       .fini_array	00000000 .hidden __fini_array_start
000003ec l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	0000003b avm_test_main
000002a4 g     F .text	00000065 __avm_terminate
000002a2 g     F .text	00000002 avm_halt
00000309 g     F .text	00000048 fdimf
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000104 g     O .data	00000002 __avm_errno

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
 e1 8e 00              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 7f 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 ec 03              ldi16	r4, 0x3ec
 c1 00                 ldi8	r5, 0x0
 c6 ec 03              ldi16	r6, 0x3ec
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 ec 03           ldi16	r0, 0x3ec
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 ec 03           ldi16	r2, 0x3ec
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
 f2 42                 sub	r2, r2
 d7 01                 sys	debug_break
 f0 03 0f              ldi8	r3, 0xf
 f2 30                 sub	r0, r0
 f0 05 d0 3f           ldi16	r1, 0x3fd0
<L0>:
 f1 22                 mov	r4, r2
 f9 8c                 and	r4, r3
 10                    add	r4, r4
 10                    add	r4, r4
 a5                    xor	r5, r5
 c6 ac 03              ldi16	r6, 0x3ac
 c3 00                 ldi8	r7, 0x0
 f7 6b                 add32	q2, q3
 f0 64 88              ldp32	q2, [q2]
 f2 6a                 mov32	q3, q0
 d5 7c                 call8	fdimf
 c6 00 01              ldi16	r6, 0x100
 f0 6b 8c              st32	[r6], q2
 f4 aa                 inc16	r2
 f0 0e 20              cmpi.s8	r2, 0x20
 d1 de                 brne8	-0x22 <L0>
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
 e1 47 fd              call16	-697 <__avm_run_local_dtors>
<L0>:
 c4 ec 03              ldi16	r4, 0x3ec
 c1 00                 ldi8	r5, 0x0
 c6 ec 03              ldi16	r6, 0x3ec
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 ec 03           ldi16	r2, 0x3ec
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 ec 03           ldi16	r0, 0x3ec
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
 e1 fe fc              call16	-770 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<fdimf>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 63                 mov32	q0, q3
 09                    mov	r6, r5
 f0 06 80 7f           ldi16	r2, 0x7f80
 f9 c8                 and	r6, r2
 f5 2a                 cmp	r6, r2
 d0 27                 breq8	0x27 <L1>
 f1 29                 mov	r6, r1
 f9 c8                 and	r6, r2
 f5 2a                 cmp	r6, r2
 d0 1f                 breq8	0x1f <L1>
 f2 6a                 mov32	q3, q0
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d3 11                 brslt8	0x11 <L0>
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 09                    mov	r6, r5
 c7 ff 7f              ldi16	r7, 0x7fff
 8e                    and	r7, r6
 f5 2e                 cmp	r7, r2
 d0 11                 breq8	0x11 <L2>
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret
<L0>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret
<L1>:
 f2 6a                 mov32	q3, q0
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 d4 0a                 jmp8	avm_fdim_special
<L2>:
 c2 22                 ldi8	r6, 0x22
 f0 5e 04 01           stm16	[0x104], r6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<avm_fdim_special>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 f2 66                 mov32	q1, q2
 f9 58                 and	r2, r6
 f9 7c                 and	r3, r7
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 04              cmp32	q0, q1
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 d2 29                 brult8	0x29 <L0>
 f9 c8                 and	r6, r2
 f9 ec                 and	r7, r3
 f0 00 01              ldi8	r0, 0x1
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 c0              cmp32	q3, q0
 d8 19                 bruge8	0x19 <L0>
 f2 6b                 mov32	q3, q1
 ff 14                 fcmp
 f2 61                 mov32	q0, q1
 f1 16                 mov	r2, r6
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 0e 01              cmpi.s8	r2, 0x1
 fb 26                 cmov.eq	r4, r6
 fb 2f                 cmov.eq	r5, r7
 d4 04                 jmp8	0x4 <L1>
<L0>:
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
<L1>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
