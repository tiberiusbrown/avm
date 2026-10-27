
pointer_table.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 pointer_table.c
00000100 l     O .data	00000002 pointer_table_result
00000102 l     O .data	00000010 row_pointers
00000112 l     O .data	000000c0 rows
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000461 l       .init_array	00000000 .hidden __init_array_end
00000461 l       .init_array	00000000 .hidden __init_array_start
00000461 l       .fini_array	00000000 .hidden __fini_array_start
00000461 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	000000d3 avm_test_main
0000033c g     F .text	00000065 __avm_terminate
0000033a g     F .text	00000002 avm_halt
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
 e1 26 01              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 17 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 61 04              ldi16	r4, 0x461
 c1 00                 ldi8	r5, 0x0
 c6 61 04              ldi16	r6, 0x461
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 61 04           ldi16	r0, 0x461
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 61 04           ldi16	r2, 0x461
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
 c4 12 01              ldi16	r4, 0x112
 f0 5c 02 01           stm16	[0x102], r4
 c6 a1 03              ldi16	r6, 0x3a1
 c3 00                 ldi8	r7, 0x0
 c1 18                 ldi8	r5, 0x18
 d7 10                 sys	memcpy_p
 f0 05 5a 01           ldi16	r1, 0x15a
 f0 59 04 01           stm16	[0x104], r1
 f0 06 2a 01           ldi16	r2, 0x12a
 f1 22                 mov	r4, r2
 c6 b9 03              ldi16	r6, 0x3b9
 c3 00                 ldi8	r7, 0x0
 d7 10                 sys	memcpy_p
 f0 04 a2 01           ldi16	r0, 0x1a2
 f0 58 06 01           stm16	[0x106], r0
 f0 07 42 01           ldi16	r3, 0x142
 f1 23                 mov	r4, r3
 c6 d1 03              ldi16	r6, 0x3d1
 c3 00                 ldi8	r7, 0x0
 d7 10                 sys	memcpy_p
 f0 5a 08 01           stm16	[0x108], r2
 f1 21                 mov	r4, r1
 c6 e9 03              ldi16	r6, 0x3e9
 c3 00                 ldi8	r7, 0x0
 d7 10                 sys	memcpy_p
 c4 72 01              ldi16	r4, 0x172
 f0 5c 0a 01           stm16	[0x10a], r4
 c6 01 04              ldi16	r6, 0x401
 c3 00                 ldi8	r7, 0x0
 d7 10                 sys	memcpy_p
 f0 05 ba 01           ldi16	r1, 0x1ba
 f0 59 0c 01           stm16	[0x10c], r1
 f0 06 8a 01           ldi16	r2, 0x18a
 f1 22                 mov	r4, r2
 c6 19 04              ldi16	r6, 0x419
 c3 00                 ldi8	r7, 0x0
 d7 10                 sys	memcpy_p
 f0 5b 0e 01           stm16	[0x10e], r3
 f1 20                 mov	r4, r0
 c6 31 04              ldi16	r6, 0x431
 c3 00                 ldi8	r7, 0x0
 d7 10                 sys	memcpy_p
 f0 5a 10 01           stm16	[0x110], r2
 f1 21                 mov	r4, r1
 c6 49 04              ldi16	r6, 0x449
 c3 00                 ldi8	r7, 0x0
 d7 10                 sys	memcpy_p
 aa                    xor	r6, r6
 d7 01                 sys	debug_break
 f0 04 02 01           ldi16	r0, 0x102
 f1 16                 mov	r2, r6
<L0>:
 a5                    xor	r5, r5
 f1 1d                 mov	r3, r5
<L1>:
 0e                    mov	r7, r6
 f2 2e                 add	r7, r2
 c0 18                 ldi8	r4, 0x18
 ec 7c                 urem16	r7, r4
 01                    mov	r4, r5
 f2 20                 add	r4, r0
 f5 40                 ld16	r0, [r4]
 f1 20                 mov	r4, r0
 13                    add	r4, r7
 f5 31                 ld8u	r1, [r4]
 f2 0b                 add	r1, r3
 f3 01                 st8	[r4], r1
 f1 71                 zext8	r1
 f2 0e                 add	r1, r6
 f2 37                 sub	r0, r7
 ed c0 37              ld8u	r6, [r0+23]
 f0 04 02 01           ldi16	r0, 0x102
 f2 29                 add	r6, r1
 f4 ab                 inc16	r3
 c9 02                 addi.s8	r5, 0x2
 cd 10                 cmpi.s8	r5, 0x10
 d1 d4                 brne8	-0x2c <L1>
 f4 aa                 inc16	r2
 f0 0e 20              cmpi.s8	r2, 0x20
 d1 ca                 brne8	-0x36 <L0>
 f0 5e 00 01           stm16	[0x100], r6
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
 e1 af fc              call16	-849 <__avm_run_local_dtors>
<L0>:
 c4 61 04              ldi16	r4, 0x461
 c1 00                 ldi8	r5, 0x0
 c6 61 04              ldi16	r6, 0x461
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 61 04           ldi16	r2, 0x461
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 61 04           ldi16	r0, 0x461
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
 e1 66 fc              call16	-922 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
