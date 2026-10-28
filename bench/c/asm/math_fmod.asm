
math_fmod.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 math_fmod.c
00000100 l     O .data	00000004 input
00000104 l     O .data	00000004 result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 ef_fmod.c
00000358 l     F .text	00000080 avm_fmod_special
00000000 l    df *ABS*	00000000 stdlib.c
00000000 l    df *ABS*	00000000 avm.c
00000000 l    df *ABS*	00000000 ctype.c
00000000 l    df *ABS*	00000000 strtof.c
00000000 l    df *ABS*	00000000 integer.c
00000000 l    df *ABS*	00000000 wide_integer.c
000003d8 l       .init_array	00000000 .hidden __init_array_end
000003d8 l       .init_array	00000000 .hidden __init_array_start
000003d8 l       .fini_array	00000000 .hidden __fini_array_start
000003d8 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	00000063 avm_test_main
000002cc g     F .text	00000065 __avm_terminate
000002ca g     F .text	00000002 avm_halt
00000331 g     F .text	00000027 fmodf
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000108 g     O .data	00000002 __avm_errno

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
 e1 b6 00              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 a7 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 d8 03              ldi16	r4, 0x3d8
 c1 00                 ldi8	r5, 0x0
 c6 d8 03              ldi16	r6, 0x3d8
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 d8 03           ldi16	r0, 0x3d8
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 d8 03           ldi16	r2, 0x3d8
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
 d6 f6                 adjsp	-0xa
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 c2 20                 ldi8	r6, 0x20
 d7 01                 sys	debug_break
 f2 30                 sub	r0, r0
 f0 05 00 3d           ldi16	r1, 0x3d00
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f2 62                 mov32	q0, q2
<L0>:
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 62                 stsp16	[sp+0x8], r6
 f2 68                 mov32	q2, q0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 02                 fmul
 c6 00 01              ldi16	r6, 0x100
 f0 6a cc              ld32	q3, [r6]
 ff 00                 fadd
 aa                    xor	r6, r6
 c7 40 3f              ldi16	r7, 0x3f40
 e1 93 00              call16	fmodf
 f2 66                 mov32	q1, q2
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 b6                 dec16	r6
 f4 a6                 tst8	r6
 d1 c7                 brne8	-0x39 <L0>
 c6 04 01              ldi16	r6, 0x104
 f0 6b 8c              st32	[r6], q2
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0a                 adjsp	0xa
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
 e1 1f fd              call16	-737 <__avm_run_local_dtors>
<L0>:
 c4 d8 03              ldi16	r4, 0x3d8
 c1 00                 ldi8	r5, 0x0
 c6 d8 03              ldi16	r6, 0x3d8
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 d8 03           ldi16	r2, 0x3d8
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 d8 03           ldi16	r0, 0x3d8
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
 e1 d6 fc              call16	-810 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<fmodf>:
 b1                    push16	r1
 b0                    push16	r0
 f1 05                 mov	r0, r5
 f0 05 80 7f           ldi16	r1, 0x7f80
 f9 04                 and	r0, r1
 f5 01                 cmp	r0, r1
 d0 15                 breq8	0x15 <L1>
 f6 2e                 tst16	r6
 d1 0c                 brne8	0xc <L0>
 f1 07                 mov	r0, r7
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f9 20                 and	r1, r0
 f6 29                 tst16	r1
 d0 05                 breq8	0x5 <L1>
<L0>:
 ff 1c                 fmod
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
<L1>:
 b8                    pop16	r0
 b9                    pop16	r1
 d4 00                 jmp8	avm_fmod_special

<avm_fmod_special>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f1 05                 mov	r0, r5
 f0 05 80 7f           ldi16	r1, 0x7f80
 f9 04                 and	r0, r1
 f5 01                 cmp	r0, r1
 d0 15                 breq8	0x15 <L1>
 f1 07                 mov	r0, r7
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f9 20                 and	r1, r0
 f6 29                 tst16	r1
 d0 09                 breq8	0x9 <L1>
<L0>:
 ff 1c                 fmod
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L1>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f2 66                 mov32	q1, q2
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 69 04              cmp32	q0, q1
 d2 d8                 brult8	-0x28 <L0>
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f9 58                 and	r2, r6
 f9 7c                 and	r3, r7
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f0 69 04              cmp32	q0, q1
 d2 c1                 brult8	-0x3f <L0>
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 69 40              cmp32	q1, q0
 d0 0f                 breq8	0xf <L2>
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f0 69 04              cmp32	q0, q1
 d1 a7                 brne8	-0x59 <L0>
<L2>:
 f0 00 21              ldi8	r0, 0x21
 f0 58 08 01           stm16	[0x108], r0
 d4 9e                 jmp8	-0x62 <L0>
