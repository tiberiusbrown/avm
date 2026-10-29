
math_ldexp.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000222 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 math_ldexp.c
000003d9 l     O .rodata	00000040 inputs
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
00000419 l       .init_array	00000000 .hidden __init_array_end
00000419 l       .init_array	00000000 .hidden __init_array_start
00000419 l       .fini_array	00000000 .hidden __fini_array_start
00000419 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000022 _start
00000266 g     F .text	00000039 avm_test_main
000002a1 g     F .text	00000065 __avm_terminate
0000029f g     F .text	00000002 avm_halt
00000306 g     F .text	00000002 ldexpf
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000104 g     O .data	00000002 __avm_errno
00000308 g     F .text	000000d1 scalbnf

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
 e1 8b 00              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 d5 7d                 call8	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 19 04              ldi16	r4, 0x419
 c1 00                 ldi8	r5, 0x0
 c6 19 04              ldi16	r6, 0x419
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 19 04           ldi16	r0, 0x419
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 19 04           ldi16	r2, 0x419
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
 f0 04 f0 ff           ldi16	r0, 0xfff0
 d7 01                 sys	debug_break
 f0 01 0f              ldi8	r1, 0xf
 f0 06 d9 03           ldi16	r2, 0x3d9
 f0 03 00              ldi8	r3, 0x0
<L0>:
 f1 20                 mov	r4, r0
 f9 84                 and	r4, r1
 10                    add	r4, r4
 10                    add	r4, r4
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 64 88              ldp32	q2, [q2]
 f1 28                 mov	r6, r0
 d5 7c                 call8	ldexpf
 c6 00 01              ldi16	r6, 0x100
 f0 6b 8c              st32	[r6], q2
 f4 a8                 inc16	r0
 f0 0c 10              cmpi.s8	r0, 0x10
 d1 e3                 brne8	-0x1d <L0>
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
 e1 4a fd              call16	-694 <__avm_run_local_dtors>
<L0>:
 c4 19 04              ldi16	r4, 0x419
 c1 00                 ldi8	r5, 0x0
 c6 19 04              ldi16	r6, 0x419
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 19 04           ldi16	r2, 0x419
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 19 04           ldi16	r0, 0x419
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
 e1 01 fd              call16	-767 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<ldexpf>:
 d4 00                 jmp8	scalbnf

<scalbnf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f1 16                 mov	r2, r6
 09                    mov	r6, r5
 1a                    add	r6, r6
 0c                    mov	r7, r4
 9e                    or	r7, r6
 f6 2f                 tst16	r7
 d0 70                 breq8	0x70 <L3>
 09                    mov	r6, r5
 fa 97                 lsr16i	r6, 0x7
 f1 76                 zext8	r6
 f0 03 ff              ldi8	r3, 0xff
 f5 2b                 cmp	r6, r3
 d1 06                 brne8	0x6 <L0>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 d4 5e                 jmp8	0x5e <L3>
<L0>:
 f6 2a                 tst16	r2
 d0 5a                 breq8	0x5a <L3>
 c7 15 01              ldi16	r7, 0x115
 f5 17                 cmp	r2, r7
 d9 58                 brsge8	0x58 <L4>
 c7 ea fe              ldi16	r7, 0xfeea
 f5 2e                 cmp	r7, r2
 d9 69                 brsge8	0x69 <L5>
 f4 a6                 tst8	r6
 d1 11                 brne8	0x11 <L1>
 f2 30                 sub	r0, r0
 f0 05 00 4c           ldi16	r1, 0x4c00
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 09                    mov	r6, r5
 fa 97                 lsr16i	r6, 0x7
 f1 76                 zext8	r6
 ca e7                 addi.s8	r6, -0x19
<L1>:
 f2 2a                 add	r6, r2
 f5 2b                 cmp	r6, r3
 d9 5d                 brsge8	0x5d <L6>
 ce 01                 cmpi.s8	r6, 0x1
 d3 0a                 brslt8	0xa <L2>
 c7 7f 80              ldi16	r7, 0x807f
 8d                    and	r7, r5
 fa 57                 lsl16i	r6, 0x7
 9b                    or	r6, r7
 06                    mov	r5, r6
 d4 23                 jmp8	0x23 <L3>
<L2>:
 ce e9                 cmpi.s8	r6, -0x17
 d3 5c                 brslt8	0x5c <L7>
 c7 7f 80              ldi16	r7, 0x807f
 8d                    and	r7, r5
 fa 57                 lsl16i	r6, 0x7
 c5 80 0c              ldi16	r5, 0xc80
 16                    add	r5, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 c7 00 33              ldi16	r7, 0x3300
 ff 02                 fmul
 c7 80 7f              ldi16	r7, 0x7f80
 8d                    and	r7, r5
 c6 80 80              ldi16	r6, 0x8080
 1b                    add	r6, r7
 c7 ff 80              ldi16	r7, 0x80ff
 3e                    cmp	r7, r6
 d8 4b                 bruge8	0x4b <L8>
<L3>:
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L4>:
 c4 00 80              ldi16	r4, 0x8000
 81                    and	r4, r5
 a5                    xor	r5, r5
 c6 80 7f              ldi16	r6, 0x7f80
 c7 80 ff              ldi16	r7, 0xff80
 31                    cmp	r4, r5
 fb 77                 cmov.ne	r6, r7
 c0 22                 ldi8	r4, 0x22
 f0 5c 04 01           stm16	[0x104], r4
 06                    mov	r5, r6
 a0                    xor	r4, r4
 d4 e3                 jmp8	-0x1d <L3>
<L5>:
 c2 22                 ldi8	r6, 0x22
 f0 5e 04 01           stm16	[0x104], r6
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 8d                    and	r7, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 d4 d4                 jmp8	-0x2c <L3>
<L6>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 04 01           stm16	[0x104], r4
 c4 00 80              ldi16	r4, 0x8000
 81                    and	r4, r5
 c5 80 7f              ldi16	r5, 0x7f80
 94                    or	r5, r4
 a0                    xor	r4, r4
 d4 c3                 jmp8	-0x3d <L3>
<L7>:
 c2 22                 ldi8	r6, 0x22
 f0 5e 04 01           stm16	[0x104], r6
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 82                    and	r4, r6
 87                    and	r5, r7
 d4 b5                 jmp8	-0x4b <L3>
<L8>:
 c2 22                 ldi8	r6, 0x22
 f0 5e 04 01           stm16	[0x104], r6
 d4 ad                 jmp8	-0x53 <L3>
