
sys_strcmp.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000031e l     F .text	00000044 avm_run_constructors
00000362 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 sys_strcmp.c
00000100 l     O .data	00000041 last_diff
00000141 l     O .data	00000001 empty
00000142 l     O .data	00000002 benchmark_result
00000144 l     O .data	00000011 prefix
00000155 l     O .data	00000041 equal_lhs
00000196 l     O .data	00000041 equal_rhs
000001d7 l     O .data	00000041 first_diff
00000000 l    df *ABS*	00000000 runtime.c
00000488 l       .init_array	00000000 .hidden __init_array_end
00000488 l       .init_array	00000000 .hidden __init_array_start
00000488 l       .fini_array	00000000 .hidden __fini_array_start
00000488 l       .fini_array	00000000 .hidden __fini_array_end
00000300 g     F .text	0000001e _start
000003c7 g     F .text	000000bf avm_test_main
00000486 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors

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
 e1 68 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 88 04              ldi16	r4, 0x488
 c1 00                 ldi8	r5, 0x0
 c6 88 04              ldi16	r6, 0x488
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 88 04           ldi16	r0, 0x488
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 88 04           ldi16	r2, 0x488
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
 e1 89 fc              call16	-887 <__avm_run_local_dtors>
<L0>:
 c4 88 04              ldi16	r4, 0x488
 c1 00                 ldi8	r5, 0x0
 c6 88 04              ldi16	r6, 0x488
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 88 04           ldi16	r2, 0x488
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 88 04           ldi16	r0, 0x488
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
 e1 40 fc              call16	-960 <__avm_run_local_dtors>
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
 d6 fc                 adjsp	-0x4
 f0 00 61              ldi8	r0, 0x61
 a0                    xor	r4, r4
 c1 4f                 ldi8	r5, 0x4f
 f4 49                 stsp16	[sp+0x2], r5
 c1 1a                 ldi8	r5, 0x1a
 f4 41                 stsp16	[sp+0x0], r5
 f0 06 55 01           ldi16	r2, 0x155
 f0 07 00 01           ldi16	r3, 0x100
 f0 05 44 01           ldi16	r1, 0x144
 04                    mov	r5, r4
 d4 0a                 jmp8	0xa <L1>
<L0>:
 f4 ac                 inc16	r4
 f4 a8                 inc16	r0
 f4 ad                 inc16	r5
 cd 40                 cmpi.s8	r5, 0x40
 d0 30                 breq8	0x30 <L2>
<L1>:
 08                    mov	r6, r4
 f4 0b                 ldsp16	r7, [sp+0x2]
 f3 1b                 mulu8.w	r6, r7
 fa 9b                 lsr16i	r6, 0xb
 f4 03                 ldsp16	r7, [sp+0x0]
 f3 1b                 mulu8.w	r6, r7
 0c                    mov	r7, r4
 2e                    sub	r7, r6
 2c                    sub	r7, r4
 f2 2c                 add	r7, r0
 09                    mov	r6, r5
 f2 2a                 add	r6, r2
 5b                    st8	[r6], r7
 ee ec 61              st8	[r6+65], r7
 ee ec a2              st8	[r6+130], r7
 09                    mov	r6, r5
 f2 2b                 add	r6, r3
 5b                    st8	[r6], r7
 cd 10                 cmpi.s8	r5, 0x10
 d8 d4                 bruge8	-0x2c <L0>
 09                    mov	r6, r5
 f2 29                 add	r6, r1
 5b                    st8	[r6], r7
 f4 ac                 inc16	r4
 f4 a8                 inc16	r0
 f4 ad                 inc16	r5
 cd 40                 cmpi.s8	r5, 0x40
 d1 d0                 brne8	-0x30 <L1>
<L2>:
 c4 00 7a              ldi16	r4, 0x7a00
 f0 5c d6 01           stm16	[0x1d6], r4
 c0 7a                 ldi8	r4, 0x7a
 f0 5c 3f 01           stm16	[0x13f], r4
 f2 30                 sub	r0, r0
 f0 48 17 02           stm8	[0x217], r0
 f0 48 95 01           stm8	[0x195], r0
 f0 48 54 01           stm8	[0x154], r0
 f0 48 41 01           stm8	[0x141], r0
 d7 01                 sys	debug_break
 c5 41 01              ldi16	r5, 0x141
 01                    mov	r4, r5
 d7 19                 sys	strcmp
 0c                    mov	r7, r4
 c5 96 01              ldi16	r5, 0x196
 f1 22                 mov	r4, r2
 d7 19                 sys	strcmp
 08                    mov	r6, r4
 1b                    add	r6, r7
 f1 22                 mov	r4, r2
 c5 d7 01              ldi16	r5, 0x1d7
 d7 19                 sys	strcmp
 0c                    mov	r7, r4
 1e                    add	r7, r6
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 d7 19                 sys	strcmp
 f1 1c                 mov	r3, r4
 f2 1f                 add	r3, r7
 f1 21                 mov	r4, r1
 c5 96 01              ldi16	r5, 0x196
 d7 19                 sys	strcmp
 08                    mov	r6, r4
 f2 2b                 add	r6, r3
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 d7 19                 sys	strcmp
 12                    add	r4, r6
 f0 5c 42 01           stm16	[0x142], r4
 d7 01                 sys	debug_break
 f1 20                 mov	r4, r0
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
