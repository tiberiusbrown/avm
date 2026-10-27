
sys_strncpy_p.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 sys_strncpy_p.c
00000343 l     O .rodata	00000021 source32
00000364 l     O .rodata	00000004 source3
00000368 l     O .rodata	00000009 source8
00000100 l     O .data	00000002 n1
00000102 l     O .data	00000002 n8
00000104 l     O .data	00000002 n32
00000106 l     O .data	00000001 destination0
00000107 l     O .data	00000002 n0
00000109 l     O .data	00000002 destination1
0000010b l     O .data	00000002 benchmark_result
0000010d l     O .data	00000008 destination_pad8
00000115 l     O .data	00000008 destination_exact8
0000011d l     O .data	00000008 destination_trunc8
00000125 l     O .data	00000020 destination_pad32
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000371 l       .init_array	00000000 .hidden __init_array_end
00000371 l       .init_array	00000000 .hidden __init_array_start
00000371 l       .fini_array	00000000 .hidden __fini_array_start
00000371 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	00000075 avm_test_main
000002de g     F .text	00000065 __avm_terminate
000002dc g     F .text	00000002 avm_halt
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
 e1 c8 00              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 b9 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 71 03              ldi16	r4, 0x371
 c1 00                 ldi8	r5, 0x0
 c6 71 03              ldi16	r6, 0x371
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 71 03           ldi16	r0, 0x371
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 71 03           ldi16	r2, 0x371
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
 b0                    push16	r0
 d7 01                 sys	debug_break
 c6 43 03              ldi16	r6, 0x343
 c3 00                 ldi8	r7, 0x0
 c4 06 01              ldi16	r4, 0x106
 f0 55 07 01           ldm16	r5, [0x107]
 d7 16                 sys	strncpy_p
 c4 09 01              ldi16	r4, 0x109
 f0 55 00 01           ldm16	r5, [0x100]
 d7 16                 sys	strncpy_p
 f0 06 64 03           ldi16	r2, 0x364
 f0 03 00              ldi8	r3, 0x0
 c4 0d 01              ldi16	r4, 0x10d
 f0 55 02 01           ldm16	r5, [0x102]
 f2 6b                 mov32	q3, q1
 d7 16                 sys	strncpy_p
 c6 68 03              ldi16	r6, 0x368
 c3 00                 ldi8	r7, 0x0
 c4 15 01              ldi16	r4, 0x115
 f0 50 02 01           ldm16	r0, [0x102]
 d7 16                 sys	strncpy_p
 c4 1d 01              ldi16	r4, 0x11d
 f0 56 02 01           ldm16	r6, [0x102]
 c6 43 03              ldi16	r6, 0x343
 c3 00                 ldi8	r7, 0x0
 d7 16                 sys	strncpy_p
 c4 25 01              ldi16	r4, 0x125
 f0 55 04 01           ldm16	r5, [0x104]
 f2 6b                 mov32	q3, q1
 d7 16                 sys	strncpy_p
 f0 44 14 01           ldm8u	r4, [0x114]
 f0 45 09 01           ldm8u	r5, [0x109]
 14                    add	r5, r4
 f0 44 24 01           ldm8u	r4, [0x124]
 11                    add	r4, r5
 f0 45 44 01           ldm8u	r5, [0x144]
 14                    add	r5, r4
 c9 06                 addi.s8	r5, 0x6
 f0 5d 0b 01           stm16	[0x10b], r5
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
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
 e1 0d fd              call16	-755 <__avm_run_local_dtors>
<L0>:
 c4 71 03              ldi16	r4, 0x371
 c1 00                 ldi8	r5, 0x0
 c6 71 03              ldi16	r6, 0x371
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 71 03           ldi16	r2, 0x371
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 71 03           ldi16	r0, 0x371
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
 e1 c4 fc              call16	-828 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
