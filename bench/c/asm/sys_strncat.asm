
sys_strncat.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 sys_strncat.c
00000100 l     O .data	00000002 n8
00000102 l     O .data	00000002 n4
00000104 l     O .data	00000004 source_short
00000108 l     O .data	00000010 destination_n0
00000118 l     O .data	00000018 destination_short_short
00000130 l     O .data	00000018 destination_truncate
00000148 l     O .data	00000021 source_long
00000169 l     O .data	00000030 destination_long_scan
00000199 l     O .data	00000001 source_empty
0000019a l     O .data	00000002 n0
0000019c l     O .data	00000002 benchmark_result
0000019e l     O .data	00000008 destination_empty_empty
000001a6 l     O .data	00000010 destination_empty_short
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000335 l       .init_array	00000000 .hidden __init_array_end
00000335 l       .init_array	00000000 .hidden __init_array_start
00000335 l       .fini_array	00000000 .hidden __fini_array_start
00000335 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	00000067 avm_test_main
000002d0 g     F .text	00000065 __avm_terminate
000002ce g     F .text	00000002 avm_halt
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
 e1 ba 00              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 ab 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 35 03              ldi16	r4, 0x335
 c1 00                 ldi8	r5, 0x0
 c6 35 03              ldi16	r6, 0x335
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 35 03           ldi16	r0, 0x335
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 35 03           ldi16	r2, 0x335
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
 b0                    push16	r0
 d7 01                 sys	debug_break
 f0 04 04 01           ldi16	r0, 0x104
 c4 08 01              ldi16	r4, 0x108
 f0 56 9a 01           ldm16	r6, [0x19a]
 f1 24                 mov	r5, r0
 d7 1c                 sys	strncat
 c5 99 01              ldi16	r5, 0x199
 c4 9e 01              ldi16	r4, 0x19e
 f0 56 00 01           ldm16	r6, [0x100]
 d7 1c                 sys	strncat
 c4 a6 01              ldi16	r4, 0x1a6
 f0 55 00 01           ldm16	r5, [0x100]
 f1 24                 mov	r5, r0
 d7 1c                 sys	strncat
 c4 18 01              ldi16	r4, 0x118
 f0 57 00 01           ldm16	r7, [0x100]
 d7 1c                 sys	strncat
 c5 48 01              ldi16	r5, 0x148
 c4 30 01              ldi16	r4, 0x130
 f0 56 02 01           ldm16	r6, [0x102]
 d7 1c                 sys	strncat
 c4 69 01              ldi16	r4, 0x169
 f0 56 00 01           ldm16	r6, [0x100]
 f1 24                 mov	r5, r0
 d7 1c                 sys	strncat
 f0 44 22 01           ldm8u	r4, [0x122]
 f0 45 a8 01           ldm8u	r5, [0x1a8]
 14                    add	r5, r4
 f0 44 3b 01           ldm8u	r4, [0x13b]
 11                    add	r4, r5
 f0 45 8b 01           ldm8u	r5, [0x18b]
 14                    add	r5, r4
 c9 06                 addi.s8	r5, 0x6
 f0 5d 9c 01           stm16	[0x19c], r5
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
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
 e1 1b fd              call16	-741 <__avm_run_local_dtors>
<L0>:
 c4 35 03              ldi16	r4, 0x335
 c1 00                 ldi8	r5, 0x0
 c6 35 03              ldi16	r6, 0x335
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 35 03           ldi16	r2, 0x335
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 35 03           ldi16	r0, 0x335
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
 e1 d2 fc              call16	-814 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
