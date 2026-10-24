
sys_strncpy.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 sys_strncpy.c
00000104 l     O .data	00000009 source8
00000100 l     O .data	00000004 source3
0000010d l     O .data	00000021 source32
0000012e l     O .data	00000001 destination0
0000012f l     O .data	00000002 n0
00000131 l     O .data	00000002 destination1
00000133 l     O .data	00000002 n1
00000135 l     O .data	00000008 destination_pad8
0000013d l     O .data	00000002 n8
0000013f l     O .data	00000008 destination_exact8
00000147 l     O .data	00000008 destination_trunc8
0000014f l     O .data	00000020 destination_pad32
0000016f l     O .data	00000002 n32
00000171 l     O .data	00000002 benchmark_result
00000000 l    df *ABS*	00000000 runtime.c
0000038c l       .init_array	00000000 .hidden __init_array_end
0000038c l       .init_array	00000000 .hidden __init_array_start
0000038c l       .fini_array	00000000 .hidden __fini_array_start
0000038c l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	000000a2 avm_test_main
00000369 g     F .text	00000002 avm_halt
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
 e1 4b 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 8c 03              ldi16	r4, 0x38c
 c1 00                 ldi8	r5, 0x0
 c6 8c 03              ldi16	r6, 0x38c
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 8c 03           ldi16	r0, 0x38c
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 8c 03           ldi16	r2, 0x38c
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
 c4 8c 03              ldi16	r4, 0x38c
 c1 00                 ldi8	r5, 0x0
 c6 8c 03              ldi16	r6, 0x38c
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 8c 03           ldi16	r2, 0x38c
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 8c 03           ldi16	r0, 0x38c
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
 c4 65 66              ldi16	r4, 0x6665
 c5 67 68              ldi16	r5, 0x6867
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 c4 61 62              ldi16	r4, 0x6261
 c5 63 64              ldi16	r5, 0x6463
 f0 07 04 01           ldi16	r3, 0x104
 f0 6b 86              st32	[r3], q2
 c4 61 62              ldi16	r4, 0x6261
 c1 63                 ldi8	r5, 0x63
 f0 06 00 01           ldi16	r2, 0x100
 f0 6b 84              st32	[r2], q2
 f2 30                 sub	r0, r0
 f0 48 0c 01           stm8	[0x10c], r0
 f0 05 0d 01           ldi16	r1, 0x10d
 f1 21                 mov	r4, r1
 c6 6b 03              ldi16	r6, 0x36b
 c3 00                 ldi8	r7, 0x0
 c1 21                 ldi8	r5, 0x21
 d7 10                 sys	memcpy_p
 d7 01                 sys	debug_break
 c4 2e 01              ldi16	r4, 0x12e
 f0 56 2f 01           ldm16	r6, [0x12f]
 f1 25                 mov	r5, r1
 d7 1b                 sys	strncpy
 c4 31 01              ldi16	r4, 0x131
 f0 56 33 01           ldm16	r6, [0x133]
 d7 1b                 sys	strncpy
 c4 35 01              ldi16	r4, 0x135
 f0 56 3d 01           ldm16	r6, [0x13d]
 f1 26                 mov	r5, r2
 d7 1b                 sys	strncpy
 c4 3f 01              ldi16	r4, 0x13f
 f0 55 3d 01           ldm16	r5, [0x13d]
 f1 27                 mov	r5, r3
 d7 1b                 sys	strncpy
 c4 47 01              ldi16	r4, 0x147
 f0 55 3d 01           ldm16	r5, [0x13d]
 f1 25                 mov	r5, r1
 d7 1b                 sys	strncpy
 c4 4f 01              ldi16	r4, 0x14f
 f0 56 6f 01           ldm16	r6, [0x16f]
 f1 26                 mov	r5, r2
 d7 1b                 sys	strncpy
 f0 44 3c 01           ldm8u	r4, [0x13c]
 f0 45 31 01           ldm8u	r5, [0x131]
 14                    add	r5, r4
 f0 44 4e 01           ldm8u	r4, [0x14e]
 11                    add	r4, r5
 f0 45 6e 01           ldm8u	r5, [0x16e]
 14                    add	r5, r4
 c9 06                 addi.s8	r5, 0x6
 f0 5d 71 01           stm16	[0x171], r5
 d7 01                 sys	debug_break
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
