
sys_strcmp_p.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 sys_strcmp_p.c
00000100 l     O .data	00000041 lhs
00000336 l     O .rodata	00000001 p_empty
000003b9 l     O .rodata	00000041 p_last_diff
00000378 l     O .rodata	00000041 p_first_diff
00000337 l     O .rodata	00000041 p_equal
000003fa l     O .rodata	00000011 p_prefix
00000142 l     O .data	00000002 benchmark_result
00000000 l    df *ABS*	00000000 runtime.c
0000044c l       .init_array	00000000 .hidden __init_array_end
0000044c l       .init_array	00000000 .hidden __init_array_start
0000044c l       .fini_array	00000000 .hidden __fini_array_start
0000044c l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	0000006d avm_test_main
00000334 g     F .text	00000002 avm_halt
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
 e1 16 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 4c 04              ldi16	r4, 0x44c
 c1 00                 ldi8	r5, 0x0
 c6 4c 04              ldi16	r6, 0x44c
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 4c 04           ldi16	r0, 0x44c
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 4c 04           ldi16	r2, 0x44c
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
 c4 4c 04              ldi16	r4, 0x44c
 c1 00                 ldi8	r5, 0x0
 c6 4c 04              ldi16	r6, 0x44c
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 4c 04           ldi16	r2, 0x44c
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 4c 04           ldi16	r0, 0x44c
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
 f0 04 00 01           ldi16	r0, 0x100
 f1 20                 mov	r4, r0
 c6 0b 04              ldi16	r6, 0x40b
 c3 00                 ldi8	r7, 0x0
 c1 41                 ldi8	r5, 0x41
 d7 10                 sys	memcpy_p
 d7 01                 sys	debug_break
 c6 36 03              ldi16	r6, 0x336
 c3 00                 ldi8	r7, 0x0
 c4 41 01              ldi16	r4, 0x141
 d7 14                 sys	strcmp_p
 f1 14                 mov	r2, r4
 c6 b9 03              ldi16	r6, 0x3b9
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 d7 14                 sys	strcmp_p
 f1 1c                 mov	r3, r4
 c6 78 03              ldi16	r6, 0x378
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 d7 14                 sys	strcmp_p
 f1 0c                 mov	r1, r4
 c6 37 03              ldi16	r6, 0x337
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 d7 14                 sys	strcmp_p
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f0 4c 10 01           stm8	[0x110], r4
 f1 20                 mov	r4, r0
 d7 14                 sys	strcmp_p
 c2 61                 ldi8	r6, 0x61
 f0 4e 10 01           stm8	[0x110], r6
 f2 26                 add	r5, r2
 f2 25                 add	r5, r1
 f2 27                 add	r5, r3
 14                    add	r5, r4
 c6 fa 03              ldi16	r6, 0x3fa
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 d7 14                 sys	strcmp_p
 11                    add	r4, r5
 f0 5c 42 01           stm16	[0x142], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
