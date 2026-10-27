
sys_memcmp_p.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 sys_memcmp_p.c
0000034a l     O .rodata	00000040 equal
0000038a l     O .rodata	00000040 first_diff
000003ca l     O .rodata	00000040 last_diff
00000100 l     O .data	00000002 n1
00000102 l     O .data	00000002 n64
00000104 l     O .data	00000002 n16
00000106 l     O .data	00000002 n0
00000108 l     O .data	00000002 benchmark_result
0000010a l     O .data	00000040 lhs
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
0000044a l       .init_array	00000000 .hidden __init_array_end
0000044a l       .init_array	00000000 .hidden __init_array_start
0000044a l       .fini_array	00000000 .hidden __fini_array_start
0000044a l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	0000007c avm_test_main
000002e5 g     F .text	00000065 __avm_terminate
000002e3 g     F .text	00000002 avm_halt
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
 e1 cf 00              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 c0 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 4a 04              ldi16	r4, 0x44a
 c1 00                 ldi8	r5, 0x0
 c6 4a 04              ldi16	r6, 0x44a
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 4a 04           ldi16	r0, 0x44a
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 4a 04           ldi16	r2, 0x44a
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
 d6 fc                 adjsp	-0x4
 f0 04 0a 01           ldi16	r0, 0x10a
 f1 20                 mov	r4, r0
 c6 0a 04              ldi16	r6, 0x40a
 c3 00                 ldi8	r7, 0x0
 c1 40                 ldi8	r5, 0x40
 d7 10                 sys	memcpy_p
 d7 01                 sys	debug_break
 c6 4a 03              ldi16	r6, 0x34a
 c3 00                 ldi8	r7, 0x0
 f0 55 06 01           ldm16	r5, [0x106]
 f1 20                 mov	r4, r0
 d7 13                 sys	memcmp_p
 f4 48                 stsp16	[sp+0x2], r4
 f0 55 00 01           ldm16	r5, [0x100]
 f1 20                 mov	r4, r0
 d7 13                 sys	memcmp_p
 f1 0c                 mov	r1, r4
 f0 55 02 01           ldm16	r5, [0x102]
 f1 20                 mov	r4, r0
 d7 13                 sys	memcmp_p
 f4 40                 stsp16	[sp+0x0], r4
 c6 8a 03              ldi16	r6, 0x38a
 c3 00                 ldi8	r7, 0x0
 f0 54 02 01           ldm16	r4, [0x102]
 f1 20                 mov	r4, r0
 d7 13                 sys	memcmp_p
 f1 1c                 mov	r3, r4
 c6 ca 03              ldi16	r6, 0x3ca
 c3 00                 ldi8	r7, 0x0
 f0 54 02 01           ldm16	r4, [0x102]
 f1 20                 mov	r4, r0
 d7 13                 sys	memcmp_p
 f1 14                 mov	r2, r4
 f0 55 04 01           ldm16	r5, [0x104]
 f1 20                 mov	r4, r0
 d7 13                 sys	memcmp_p
 f4 09                 ldsp16	r5, [sp+0x2]
 f2 0d                 add	r1, r5
 f4 01                 ldsp16	r5, [sp+0x0]
 f2 0d                 add	r1, r5
 f2 0b                 add	r1, r3
 f2 0a                 add	r1, r2
 f2 0c                 add	r1, r4
 f0 59 08 01           stm16	[0x108], r1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 04                 adjsp	0x4
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
 e1 06 fd              call16	-762 <__avm_run_local_dtors>
<L0>:
 c4 4a 04              ldi16	r4, 0x44a
 c1 00                 ldi8	r5, 0x0
 c6 4a 04              ldi16	r6, 0x44a
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 4a 04           ldi16	r2, 0x44a
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 4a 04           ldi16	r0, 0x44a
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
 e1 bd fc              call16	-835 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
