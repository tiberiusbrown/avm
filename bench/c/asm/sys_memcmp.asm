
sys_memcmp.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000323 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 sys_memcmp.c
00000100 l     O .data	00000040 last_diff
00000140 l     O .data	00000002 n1
00000142 l     O .data	00000002 n64
00000144 l     O .data	00000002 n16
00000146 l     O .data	00000002 n0
00000148 l     O .data	00000002 benchmark_result
0000014a l     O .data	00000040 lhs
0000018a l     O .data	00000040 equal
000001ca l     O .data	00000040 first_diff
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000461 l       .init_array	00000000 .hidden __init_array_end
00000461 l       .init_array	00000000 .hidden __init_array_start
00000461 l       .fini_array	00000000 .hidden __fini_array_start
00000461 l       .fini_array	00000000 .hidden __fini_array_end
00000300 g     F .text	00000023 _start
00000367 g     F .text	00000093 avm_test_main
000003fc g     F .text	00000065 __avm_terminate
000003fa g     F .text	00000002 avm_halt
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
 e1 e6 00              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 d7 00              call16	avm_halt

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
 d6 fe                 adjsp	-0x2
 aa                    xor	r6, r6
 c1 07                 ldi8	r5, 0x7
 c7 4a 01              ldi16	r7, 0x14a
 f0 05 00 01           ldi16	r1, 0x100
<L0>:
 02                    mov	r4, r6
 13                    add	r4, r7
 51                    st8	[r4], r5
 ee a8 60              st8	[r4+64], r5
 ee a8 a0              st8	[r4+128], r5
 02                    mov	r4, r6
 f2 21                 add	r4, r1
 51                    st8	[r4], r5
 c9 0d                 addi.s8	r5, 0xd
 f4 ae                 inc16	r6
 ce 40                 cmpi.s8	r6, 0x40
 d1 eb                 brne8	-0x15 <L0>
 c0 80                 ldi8	r4, 0x80
 f0 45 ca 01           ldm8u	r5, [0x1ca]
 a4                    xor	r5, r4
 f0 4d ca 01           stm8	[0x1ca], r5
 c0 01                 ldi8	r4, 0x1
 f0 45 3f 01           ldm8u	r5, [0x13f]
 a4                    xor	r5, r4
 f0 4d 3f 01           stm8	[0x13f], r5
 d7 01                 sys	debug_break
 c5 8a 01              ldi16	r5, 0x18a
 f0 56 46 01           ldm16	r6, [0x146]
 03                    mov	r4, r7
 d7 18                 sys	memcmp
 f4 40                 stsp16	[sp+0x0], r4
 f0 56 40 01           ldm16	r6, [0x140]
 03                    mov	r4, r7
 d7 18                 sys	memcmp
 f1 04                 mov	r0, r4
 f0 56 42 01           ldm16	r6, [0x142]
 03                    mov	r4, r7
 d7 18                 sys	memcmp
 f1 14                 mov	r2, r4
 c5 ca 01              ldi16	r5, 0x1ca
 f0 54 42 01           ldm16	r4, [0x142]
 03                    mov	r4, r7
 d7 18                 sys	memcmp
 f1 1c                 mov	r3, r4
 f0 54 42 01           ldm16	r4, [0x142]
 03                    mov	r4, r7
 f1 25                 mov	r5, r1
 d7 18                 sys	memcmp
 f1 0c                 mov	r1, r4
 f0 56 44 01           ldm16	r6, [0x144]
 03                    mov	r4, r7
 d7 18                 sys	memcmp
 f4 01                 ldsp16	r5, [sp+0x0]
 f2 05                 add	r0, r5
 f2 02                 add	r0, r2
 f2 03                 add	r0, r3
 f2 01                 add	r0, r1
 f2 04                 add	r0, r4
 f0 58 48 01           stm16	[0x148], r0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 02                 adjsp	0x2
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
 e1 ef fb              call16	-1041 <__avm_run_local_dtors>
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
 e1 a6 fb              call16	-1114 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
