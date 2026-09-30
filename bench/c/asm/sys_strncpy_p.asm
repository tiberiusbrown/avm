
sys_strncpy_p.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 sys_strncpy_p.c
0000034e l     O .rodata	00000021 source32
00000100 l     O .data	00000001 destination0
00000101 l     O .data	00000002 n0
00000103 l     O .data	00000002 destination1
00000105 l     O .data	00000002 n1
0000036f l     O .rodata	00000004 source3
00000107 l     O .data	00000008 destination_pad8
0000010f l     O .data	00000002 n8
00000373 l     O .rodata	00000009 source8
00000111 l     O .data	00000008 destination_exact8
00000119 l     O .data	00000008 destination_trunc8
00000121 l     O .data	00000020 destination_pad32
00000141 l     O .data	00000002 n32
00000143 l     O .data	00000002 benchmark_result
00000000 l    df *ABS*	00000000 runtime.c
0000037c l       .init_array	00000000 .hidden __init_array_end
0000037c l       .init_array	00000000 .hidden __init_array_start
0000037c l       .fini_array	00000000 .hidden __fini_array_start
0000037c l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000075 avm_test_main
0000034c g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 d1 00              call16	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 d5 57                 call8	avm_run_destructors
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 2e 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 7c 03              ldi16	r4, 0x37c
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 7c 03              ldi16	r6, 0x37c
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 7c 03           ldi16	r0, 0x37c
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 7c 03           ldi16	r2, 0x37c
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	avm_run_constructors+48
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
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+23
 e1 81 fd              call16	-639
 c4 7c 03              ldi16	r4, 0x37c
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 7c 03              ldi16	r6, 0x37c
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 7c 03           ldi16	r2, 0x37c
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 7c 03           ldi16	r0, 0x37c
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	avm_run_destructors+68
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+104
 e1 30 fd              call16	-720
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
 c6 4e 03              ldi16	r6, 0x34e
 c3 00                 ldi8	r7, 0x0
 c4 00 01              ldi16	r4, 0x100
 f0 55 01 01           ldm16	r5, [0x101]
 d7 16                 sys	strncpy_p
 c4 03 01              ldi16	r4, 0x103
 f0 55 05 01           ldm16	r5, [0x105]
 d7 16                 sys	strncpy_p
 f0 06 6f 03           ldi16	r2, 0x36f
 f0 03 00              ldi8	r3, 0x0
 c4 07 01              ldi16	r4, 0x107
 f0 55 0f 01           ldm16	r5, [0x10f]
 f2 6b                 mov32	q3, q1
 d7 16                 sys	strncpy_p
 c6 73 03              ldi16	r6, 0x373
 c3 00                 ldi8	r7, 0x0
 c4 11 01              ldi16	r4, 0x111
 f0 50 0f 01           ldm16	r0, [0x10f]
 d7 16                 sys	strncpy_p
 c4 19 01              ldi16	r4, 0x119
 f0 56 0f 01           ldm16	r6, [0x10f]
 c6 4e 03              ldi16	r6, 0x34e
 c3 00                 ldi8	r7, 0x0
 d7 16                 sys	strncpy_p
 c4 21 01              ldi16	r4, 0x121
 f0 55 41 01           ldm16	r5, [0x141]
 f2 6b                 mov32	q3, q1
 d7 16                 sys	strncpy_p
 f0 44 0e 01           ldm8u	r4, [0x10e]
 f0 45 03 01           ldm8u	r5, [0x103]
 14                    add	r5, r4
 f0 44 20 01           ldm8u	r4, [0x120]
 11                    add	r4, r5
 f0 45 40 01           ldm8u	r5, [0x140]
 14                    add	r5, r4
 c9 06                 addi.s8	r5, 0x6
 f0 5d 43 01           stm16	[0x143], r5
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
