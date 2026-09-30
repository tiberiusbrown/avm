
sys_strcmp_p.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 sys_strcmp_p.c
00000100 l     O .data	00000041 lhs
000003b5 l     O .rodata	00000001 p_empty
00000141 l     O .data	00000001 .L.str.1
00000438 l     O .rodata	00000041 p_last_diff
000003f7 l     O .rodata	00000041 p_first_diff
000003b6 l     O .rodata	00000041 p_equal
00000479 l     O .rodata	00000011 p_prefix
00000142 l     O .data	00000002 benchmark_result
00000000 l    df *ABS*	00000000 runtime.c
0000048a l       .init_array	00000000 .hidden __init_array_end
0000048a l       .init_array	00000000 .hidden __init_array_start
0000048a l       .fini_array	00000000 .hidden __fini_array_start
0000048a l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	000000dc avm_test_main
000003b3 g     F .text	00000002 avm_halt
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
 e1 95 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 8a 04              ldi16	r4, 0x48a
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 8a 04              ldi16	r6, 0x48a
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 8a 04           ldi16	r0, 0x48a
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 8a 04           ldi16	r2, 0x48a
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
 c4 8a 04              ldi16	r4, 0x48a
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 8a 04              ldi16	r6, 0x48a
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 8a 04           ldi16	r2, 0x48a
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 8a 04           ldi16	r0, 0x48a
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
 b1                    push16	r1
 b0                    push16	r0
 c4 6d 6e              ldi16	r4, 0x6e6d
 c5 6f 70              ldi16	r5, 0x706f
 c6 3c 01              ldi16	r6, 0x13c
 f0 6b 8c              st32	[r6], q2
 c6 2c 01              ldi16	r6, 0x12c
 f0 6b 8c              st32	[r6], q2
 c6 1c 01              ldi16	r6, 0x11c
 f0 6b 8c              st32	[r6], q2
 c6 0c 01              ldi16	r6, 0x10c
 f0 6b 8c              st32	[r6], q2
 c4 69 6a              ldi16	r4, 0x6a69
 c5 6b 6c              ldi16	r5, 0x6c6b
 c6 38 01              ldi16	r6, 0x138
 f0 6b 8c              st32	[r6], q2
 c6 28 01              ldi16	r6, 0x128
 f0 6b 8c              st32	[r6], q2
 c6 18 01              ldi16	r6, 0x118
 f0 6b 8c              st32	[r6], q2
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 c4 65 66              ldi16	r4, 0x6665
 c5 67 68              ldi16	r5, 0x6867
 c6 34 01              ldi16	r6, 0x134
 f0 6b 8c              st32	[r6], q2
 c6 24 01              ldi16	r6, 0x124
 f0 6b 8c              st32	[r6], q2
 c6 14 01              ldi16	r6, 0x114
 f0 6b 8c              st32	[r6], q2
 c6 04 01              ldi16	r6, 0x104
 f0 6b 8c              st32	[r6], q2
 c6 61 62              ldi16	r6, 0x6261
 c7 63 64              ldi16	r7, 0x6463
 c4 30 01              ldi16	r4, 0x130
 f0 6b c8              st32	[r4], q3
 c4 20 01              ldi16	r4, 0x120
 f0 6b c8              st32	[r4], q3
 c4 10 01              ldi16	r4, 0x110
 f0 6b c8              st32	[r4], q3
 f0 04 00 01           ldi16	r0, 0x100
 f0 6b c0              st32	[r0], q3
 a0                    xor	r4, r4
 f0 4c 40 01           stm8	[0x140], r4
 d7 01                 sys	debug_break
 c6 b5 03              ldi16	r6, 0x3b5
 c3 00                 ldi8	r7, 0x0
 c4 41 01              ldi16	r4, 0x141
 d7 14                 sys	strcmp_p
 f1 0c                 mov	r1, r4
 c6 38 04              ldi16	r6, 0x438
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 d7 14                 sys	strcmp_p
 f1 14                 mov	r2, r4
 c6 f7 03              ldi16	r6, 0x3f7
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 d7 14                 sys	strcmp_p
 f1 1c                 mov	r3, r4
 c6 b6 03              ldi16	r6, 0x3b6
 c3 00                 ldi8	r7, 0x0
 f1 20                 mov	r4, r0
 d7 14                 sys	strcmp_p
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f0 4c 10 01           stm8	[0x110], r4
 f1 20                 mov	r4, r0
 d7 14                 sys	strcmp_p
 c3 61                 ldi8	r7, 0x61
 f0 4f 10 01           stm8	[0x110], r7
 f2 25                 add	r5, r1
 f2 27                 add	r5, r3
 f2 26                 add	r5, r2
 14                    add	r5, r4
 c6 79 04              ldi16	r6, 0x479
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
