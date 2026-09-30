
sys_strncat.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 sys_strncat.c
00000110 l     O .data	00000004 source_short
00000100 l     O .data	00000010 destination_n0
00000114 l     O .data	00000002 n0
0000011e l     O .data	00000001 source_empty
00000116 l     O .data	00000008 destination_empty_empty
0000011f l     O .data	00000002 n8
00000121 l     O .data	00000010 destination_empty_short
00000131 l     O .data	00000018 destination_short_short
00000161 l     O .data	00000021 source_long
00000149 l     O .data	00000018 destination_truncate
00000182 l     O .data	00000002 n4
00000184 l     O .data	00000030 destination_long_scan
000001b4 l     O .data	00000002 benchmark_result
00000000 l    df *ABS*	00000000 runtime.c
00000330 l       .init_array	00000000 .hidden __init_array_end
00000330 l       .init_array	00000000 .hidden __init_array_start
00000330 l       .fini_array	00000000 .hidden __fini_array_start
00000330 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000067 avm_test_main
0000032e g     F .text	00000002 avm_halt
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
 e1 10 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 30 03              ldi16	r4, 0x330
 c1 00                 ldi8	r5, 0x0
 c6 30 03              ldi16	r6, 0x330
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	avm_run_constructors+61
 f0 04 30 03           ldi16	r0, 0x330
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 30 03           ldi16	r2, 0x330
 f0 03 00              ldi8	r3, 0x0
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	avm_run_constructors+42
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
 d0 03                 breq8	avm_run_destructors+21
 e1 89 fd              call16	-631
 c4 30 03              ldi16	r4, 0x330
 c1 00                 ldi8	r5, 0x0
 c6 30 03              ldi16	r6, 0x330
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	avm_run_destructors+79
 f0 06 30 03           ldi16	r2, 0x330
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 30 03           ldi16	r0, 0x330
 f0 01 00              ldi8	r1, 0x0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	avm_run_destructors+60
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+94
 e1 40 fd              call16	-704
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_test_main>:
 b0                    push16	r0
 d7 01                 sys	debug_break
 f0 04 10 01           ldi16	r0, 0x110
 c4 00 01              ldi16	r4, 0x100
 f0 56 14 01           ldm16	r6, [0x114]
 f1 24                 mov	r5, r0
 d7 1c                 sys	strncat
 c5 1e 01              ldi16	r5, 0x11e
 c4 16 01              ldi16	r4, 0x116
 f0 56 1f 01           ldm16	r6, [0x11f]
 d7 1c                 sys	strncat
 c4 21 01              ldi16	r4, 0x121
 f0 55 1f 01           ldm16	r5, [0x11f]
 f1 24                 mov	r5, r0
 d7 1c                 sys	strncat
 c4 31 01              ldi16	r4, 0x131
 f0 57 1f 01           ldm16	r7, [0x11f]
 d7 1c                 sys	strncat
 c5 61 01              ldi16	r5, 0x161
 c4 49 01              ldi16	r4, 0x149
 f0 56 82 01           ldm16	r6, [0x182]
 d7 1c                 sys	strncat
 c4 84 01              ldi16	r4, 0x184
 f0 56 1f 01           ldm16	r6, [0x11f]
 f1 24                 mov	r5, r0
 d7 1c                 sys	strncat
 f0 44 3b 01           ldm8u	r4, [0x13b]
 f0 45 23 01           ldm8u	r5, [0x123]
 14                    add	r5, r4
 f0 44 54 01           ldm8u	r4, [0x154]
 11                    add	r4, r5
 f0 45 a6 01           ldm8u	r5, [0x1a6]
 14                    add	r5, r4
 c9 06                 addi.s8	r5, 0x6
 f0 5d b4 01           stm16	[0x1b4], r5
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
