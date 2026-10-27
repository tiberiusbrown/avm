
aliasing.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 aliasing.c
000002b2 l     F .text	00000033 overlap
00000100 l     O .data	00000002 aliasing_result
00000102 l     O .data	00000041 buffer
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
0000034c l       .init_array	00000000 .hidden __init_array_end
0000034c l       .init_array	00000000 .hidden __init_array_start
0000034c l       .fini_array	00000000 .hidden __fini_array_start
0000034c l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	0000004b avm_test_main
000002e7 g     F .text	00000065 __avm_terminate
000002e5 g     F .text	00000002 avm_halt
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
 e1 d1 00              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 c2 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 4c 03              ldi16	r4, 0x34c
 c1 00                 ldi8	r5, 0x0
 c6 4c 03              ldi16	r6, 0x34c
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 4c 03           ldi16	r0, 0x34c
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 4c 03           ldi16	r2, 0x34c
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
 c4 02 01              ldi16	r4, 0x102
 c1 03                 ldi8	r5, 0x3
 c2 41                 ldi8	r6, 0x41
<L0>:
 f6 05                 st8	[r4+], r5
 c9 13                 addi.s8	r5, 0x13
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f6                 brne8	-0xa <L0>
 f2 42                 sub	r2, r2
 f0 00 14              ldi8	r0, 0x14
 d7 01                 sys	debug_break
<L1>:
 f0 05 02 01           ldi16	r1, 0x102
 f1 21                 mov	r4, r1
 f0 05 03 01           ldi16	r1, 0x103
 f1 25                 mov	r5, r1
 d5 21                 call8	overlap
 f1 1c                 mov	r3, r4
 f9 6a                 xor	r3, r2
 f1 21                 mov	r4, r1
 c5 02 01              ldi16	r5, 0x102
 d5 16                 call8	overlap
 f1 14                 mov	r2, r4
 f2 13                 add	r2, r3
 f4 b0                 dec16	r0
 f4 a0                 tst8	r0
 d1 dd                 brne8	-0x23 <L1>
 f0 5a 00 01           stm16	[0x100], r2
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<overlap>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 aa                    xor	r6, r6
 f1 16                 mov	r2, r6
<L0>:
 f1 05                 mov	r0, r5
 f2 02                 add	r0, r2
 f1 0c                 mov	r1, r4
 f2 0a                 add	r1, r2
 ed e2 20              ld8u	r7, [r1+0]
 ed 60 20              ld8u	r3, [r0+0]
 f2 2f                 add	r7, r3
 ee e2 20              st8	[r1+0], r7
 f9 ee                 xor	r7, r3
 ee e0 20              st8	[r0+0], r7
 f1 77                 zext8	r7
 1e                    add	r7, r6
 ed c2 20              ld8u	r6, [r1+0]
 1b                    add	r6, r7
 f4 aa                 inc16	r2
 f0 0e 40              cmpi.s8	r2, 0x40
 d1 da                 brne8	-0x26 <L0>
 02                    mov	r4, r6
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
 e1 04 fd              call16	-764 <__avm_run_local_dtors>
<L0>:
 c4 4c 03              ldi16	r4, 0x34c
 c1 00                 ldi8	r5, 0x0
 c6 4c 03              ldi16	r6, 0x34c
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 4c 03           ldi16	r2, 0x34c
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 4c 03           ldi16	r0, 0x34c
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
 e1 bb fc              call16	-837 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
