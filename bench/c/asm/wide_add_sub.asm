
wide_add_sub.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 wide_add_sub.c
00000100 l     O .data	00000040 increments
00000140 l     O .data	00000008 wide_add_sub_result
00000000 l    df *ABS*	00000000 runtime.c
00000444 l       .init_array	00000000 .hidden __init_array_end
00000444 l       .init_array	00000000 .hidden __init_array_start
00000444 l       .fini_array	00000000 .hidden __fini_array_start
00000444 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	0000017b avm_test_main
00000442 g     F .text	00000002 avm_halt
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
 e1 24 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 44 04              ldi16	r4, 0x444
 c1 00                 ldi8	r5, 0x0
 c6 44 04              ldi16	r6, 0x444
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	avm_run_constructors+61
 f0 04 44 04           ldi16	r0, 0x444
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 44 04           ldi16	r2, 0x444
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
 c4 44 04              ldi16	r4, 0x444
 c1 00                 ldi8	r5, 0x0
 c6 44 04              ldi16	r6, 0x444
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	avm_run_destructors+79
 f0 06 44 04           ldi16	r2, 0x444
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 44 04           ldi16	r0, 0x444
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
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 a0                    xor	r4, r4
 c5 11 11              ldi16	r5, 0x1111
 c6 04 01              ldi16	r6, 0x104
 f0 6b 8c              st32	[r6], q2
 c0 01                 ldi8	r4, 0x1
 c5 ff ff              ldi16	r5, 0xffff
 c6 00 01              ldi16	r6, 0x100
 f0 6b 8c              st32	[r6], q2
 c4 05 03              ldi16	r4, 0x305
 c5 13 12              ldi16	r5, 0x1213
 c6 0c 01              ldi16	r6, 0x10c
 f0 6b 8c              st32	[r6], q2
 c4 09 07              ldi16	r4, 0x709
 c5 05 05              ldi16	r5, 0x505
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 c4 09 06              ldi16	r4, 0x609
 c5 15 13              ldi16	r5, 0x1315
 c6 14 01              ldi16	r6, 0x114
 f0 6b 8c              st32	[r6], q2
 c4 11 0e              ldi16	r4, 0xe11
 c5 0b 0a              ldi16	r5, 0xa0b
 c6 10 01              ldi16	r6, 0x110
 f0 6b 8c              st32	[r6], q2
 c4 0d 09              ldi16	r4, 0x90d
 c5 17 14              ldi16	r5, 0x1417
 c6 1c 01              ldi16	r6, 0x11c
 f0 6b 8c              st32	[r6], q2
 c4 19 15              ldi16	r4, 0x1519
 c5 11 0f              ldi16	r5, 0xf11
 c6 18 01              ldi16	r6, 0x118
 f0 6b 8c              st32	[r6], q2
 c4 11 0c              ldi16	r4, 0xc11
 c5 19 15              ldi16	r5, 0x1519
 c6 24 01              ldi16	r6, 0x124
 f0 6b 8c              st32	[r6], q2
 c4 21 1c              ldi16	r4, 0x1c21
 c5 17 14              ldi16	r5, 0x1417
 c6 20 01              ldi16	r6, 0x120
 f0 6b 8c              st32	[r6], q2
 c4 15 0f              ldi16	r4, 0xf15
 c5 1b 16              ldi16	r5, 0x161b
 c6 2c 01              ldi16	r6, 0x12c
 f0 6b 8c              st32	[r6], q2
 c4 29 23              ldi16	r4, 0x2329
 c5 1d 19              ldi16	r5, 0x191d
 c6 28 01              ldi16	r6, 0x128
 f0 6b 8c              st32	[r6], q2
 c4 19 12              ldi16	r4, 0x1219
 c5 1d 17              ldi16	r5, 0x171d
 c6 34 01              ldi16	r6, 0x134
 f0 6b 8c              st32	[r6], q2
 c4 31 2a              ldi16	r4, 0x2a31
 c5 23 1e              ldi16	r5, 0x1e23
 c6 30 01              ldi16	r6, 0x130
 f0 6b 8c              st32	[r6], q2
 c4 1d 15              ldi16	r4, 0x151d
 c5 1f 18              ldi16	r5, 0x181f
 c6 3c 01              ldi16	r6, 0x13c
 f0 6b 8c              st32	[r6], q2
 c4 39 31              ldi16	r4, 0x3139
 c5 29 23              ldi16	r5, 0x2329
 c6 38 01              ldi16	r6, 0x138
 f0 6b 8c              st32	[r6], q2
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 c6 f0 ff              ldi16	r6, 0xfff0
 c7 ff ff              ldi16	r7, 0xffff
 a5                    xor	r5, r5
 d7 01                 sys	debug_break
 f0 02 ff              ldi8	r2, 0xff
 f2 4b                 sub	r3, r3
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f4 51                 stsp16	[sp+0x4], r5
 f1 15                 mov	r2, r5
 f2 4b                 sub	r3, r3
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 c0 05                 ldi8	r4, 0x5
 f4 70                 stsp16	[sp+0xc], r4
 f7 65                 add32	q1, q1
 f0 3a 06              stsp16	[sp+0x6], r2
 f0 3b 08              stsp16	[sp+0x8], r3
 c4 00 01              ldi16	r4, 0x100
 04                    mov	r5, r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 29                 ldsp16	r5, [sp+0xa]
 c9 04                 addi.s8	r5, 0x4
 f0 6a 4a              ld32	q1, [r5]
 f7 64                 add32	q1, q0
 f4 28                 ldsp16	r4, [sp+0xa]
 f0 6a 08              ld32	q0, [r4]
 f7 6c                 add32	q3, q0
 f0 69 c0              cmp32	q3, q0
 f8 15                 cset.ult	r5
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 f7 61                 add32	q0, q1
 f4 31                 ldsp16	r5, [sp+0xc]
 f4 71                 stsp16	[sp+0xc], r5
 15                    add	r5, r5
 15                    add	r5, r5
 15                    add	r5, r5
 c0 38                 ldi8	r4, 0x38
 81                    and	r4, r5
 04                    mov	r5, r4
 f2 67                 mov32	q1, q3
 c6 04 01              ldi16	r6, 0x104
 16                    add	r5, r6
 f2 6b                 mov32	q3, q1
 f0 6a 4a              ld32	q1, [r5]
 f7 71                 sub32	q0, q1
 c5 00 01              ldi16	r5, 0x100
 11                    add	r4, r5
 f0 6a 48              ld32	q1, [r4]
 f0 69 c4              cmp32	q3, q1
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f7 72                 sub32	q0, q2
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 7d                 sub32	q3, q1
 c9 08                 addi.s8	r5, 0x8
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 ac                 inc16	r4
 f4 70                 stsp16	[sp+0xc], r4
 cc 0d                 cmpi.s8	r4, 0xd
 d1 a4                 brne8	avm_test_main+253
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 20                 cmpi.s8	r4, 0x20
 db 7a ff              brne16	avm_test_main+223
 c4 40 01              ldi16	r4, 0x140
 f0 6b c8              st32	[r4], q3
 c4 44 01              ldi16	r4, 0x144
 f0 6b 08              st32	[r4], q0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
