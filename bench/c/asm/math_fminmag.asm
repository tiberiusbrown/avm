
math_fminmag.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 math_fminmag.c
000003c7 l     O .rodata	00000040 inputs
00000100 l     O .data	00000004 result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 sf_fminmag.c
00000407 l       .init_array	00000000 .hidden __init_array_end
00000407 l       .init_array	00000000 .hidden __init_array_start
00000407 l       .fini_array	00000000 .hidden __fini_array_start
00000407 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	0000003b avm_test_main
000002a4 g     F .text	00000065 __avm_terminate
000002a2 g     F .text	00000002 avm_halt
00000309 g     F .text	000000be fminmagf
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
 c4 07 04              ldi16	r4, 0x407
 c1 00                 ldi8	r5, 0x0
 c6 07 04              ldi16	r6, 0x407
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 07 04           ldi16	r0, 0x407
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 07 04           ldi16	r2, 0x407
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
 f0 05 d0 bf           ldi16	r1, 0xbfd0
<L0>:
 f1 22                 mov	r4, r2
 f9 8c                 and	r4, r3
 10                    add	r4, r4
 10                    add	r4, r4
 a5                    xor	r5, r5
 c6 c7 03              ldi16	r6, 0x3c7
 c3 00                 ldi8	r7, 0x0
 f7 6b                 add32	q2, q3
 f0 64 88              ldp32	q2, [q2]
 f2 6a                 mov32	q3, q0
 d5 7c                 call8	fminmagf
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
 c4 07 04              ldi16	r4, 0x407
 c1 00                 ldi8	r5, 0x0
 c6 07 04              ldi16	r6, 0x407
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 07 04           ldi16	r2, 0x407
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 07 04           ldi16	r0, 0x407
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

<fminmagf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f2 67                 mov32	q1, q3
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 c4              cmp32	q3, q1
 f8 16                 cset.ult	r6
 f4 52                 stsp16	[sp+0x4], r6
 aa                    xor	r6, r6
 f0 69 c0              cmp32	q3, q0
 f8 16                 cset.ult	r6
 f4 5a                 stsp16	[sp+0x6], r6
 d2 1f                 brult8	0x1f <L0>
 f2 6b                 mov32	q3, q1
 f0 02 01              ldi8	r2, 0x1
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 c4              cmp32	q3, q1
 d8 11                 bruge8	0x11 <L0>
 f0 69 0c              cmp32	q0, q3
 d1 52                 brne8	0x52 <L2>
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 92                    or	r4, r6
 97                    or	r5, r7
 d4 63                 jmp8	0x63 <L4>
<L0>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 42                 sub	r2, r2
 f0 03 40              ldi8	r3, 0x40
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f9 c8                 and	r6, r2
 f9 ec                 and	r7, r3
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 f8 06                 cset.eq	r6
 f0 30 06              ldsp16	r0, [sp+0x6]
 f9 c0                 and	r6, r0
 f4 a6                 tst8	r6
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 d1 17                 brne8	0x17 <L1>
 c4 ff ff              ldi16	r4, 0xffff
 f0 31 04              ldsp16	r1, [sp+0x4]
 f9 32                 xor	r1, r4
 f9 7c                 and	r3, r7
 f1 23                 mov	r4, r3
 fa 76                 lsr16i	r4, 0x6
 f9 85                 or	r4, r1
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d1 19                 brne8	0x19 <L3>
<L1>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 00                 fadd
 d4 1d                 jmp8	0x1d <L4>
<L2>:
 f0 69 c0              cmp32	q3, q0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 fc 34                 cmov.ult	r6, r4
 fc 3d                 cmov.ult	r7, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 d4 0c                 jmp8	0xc <L4>
<L3>:
 f9 14                 and	r0, r5
 f4 a0                 tst8	r0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 fb 66                 cmov.ne	r4, r6
 fb 6f                 cmov.ne	r5, r7
<L4>:
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
