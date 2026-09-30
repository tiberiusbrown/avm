
aggregate_args.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 aggregate_args.c
00000100 l     O .data	00000080 items
00000501 l     F .text	0000006c combine
00000180 l     O .data	00000004 aggregate_args_result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 integer.c
00000620 l       .init_array	00000000 .hidden __init_array_end
00000620 l       .init_array	00000000 .hidden __init_array_start
00000620 l       .fini_array	00000000 .hidden __fini_array_start
00000620 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	0000023a avm_test_main
0000056d g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
0000056f g     F .text	000000b1 __avm_mulsi3

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
 e1 4f 03              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 20 06              ldi16	r4, 0x620
 c1 00                 ldi8	r5, 0x0
 c6 20 06              ldi16	r6, 0x620
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	avm_run_constructors+61
 f0 04 20 06           ldi16	r0, 0x620
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 20 06           ldi16	r2, 0x620
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
 c4 20 06              ldi16	r4, 0x620
 c1 00                 ldi8	r5, 0x0
 c6 20 06              ldi16	r6, 0x620
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	avm_run_destructors+79
 f0 06 20 06           ldi16	r2, 0x620
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 20 06           ldi16	r0, 0x620
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
 d6 e2                 adjsp	-0x1e
 c0 2e                 ldi8	r4, 0x2e
 c5 55 01              ldi16	r5, 0x155
 c6 7c 01              ldi16	r6, 0x17c
 f0 6b 8c              st32	[r6], q2
 c4 ff 12              ldi16	r4, 0x12ff
 a5                    xor	r5, r5
 c6 78 01              ldi16	r6, 0x178
 f0 6b 8c              st32	[r6], q2
 c0 2b                 ldi8	r4, 0x2b
 c1 54                 ldi8	r5, 0x54
 c6 74 01              ldi16	r6, 0x174
 f0 6b 8c              st32	[r6], q2
 c4 ee 12              ldi16	r4, 0x12ee
 a5                    xor	r5, r5
 c6 70 01              ldi16	r6, 0x170
 f0 6b 8c              st32	[r6], q2
 c0 28                 ldi8	r4, 0x28
 c5 57 01              ldi16	r5, 0x157
 c6 6c 01              ldi16	r6, 0x16c
 f0 6b 8c              st32	[r6], q2
 c4 dd 12              ldi16	r4, 0x12dd
 a5                    xor	r5, r5
 c6 68 01              ldi16	r6, 0x168
 f0 6b 8c              st32	[r6], q2
 c0 25                 ldi8	r4, 0x25
 c1 56                 ldi8	r5, 0x56
 c6 64 01              ldi16	r6, 0x164
 f0 6b 8c              st32	[r6], q2
 c4 cc 12              ldi16	r4, 0x12cc
 a5                    xor	r5, r5
 c6 60 01              ldi16	r6, 0x160
 f0 6b 8c              st32	[r6], q2
 c0 22                 ldi8	r4, 0x22
 c5 51 01              ldi16	r5, 0x151
 c6 5c 01              ldi16	r6, 0x15c
 f0 6b 8c              st32	[r6], q2
 c4 bb 12              ldi16	r4, 0x12bb
 a5                    xor	r5, r5
 c6 58 01              ldi16	r6, 0x158
 f0 6b 8c              st32	[r6], q2
 c0 1f                 ldi8	r4, 0x1f
 c1 50                 ldi8	r5, 0x50
 c6 54 01              ldi16	r6, 0x154
 f0 6b 8c              st32	[r6], q2
 c4 aa 12              ldi16	r4, 0x12aa
 a5                    xor	r5, r5
 c6 50 01              ldi16	r6, 0x150
 f0 6b 8c              st32	[r6], q2
 c0 1c                 ldi8	r4, 0x1c
 c5 53 01              ldi16	r5, 0x153
 c6 4c 01              ldi16	r6, 0x14c
 f0 6b 8c              st32	[r6], q2
 c4 99 12              ldi16	r4, 0x1299
 a5                    xor	r5, r5
 c6 48 01              ldi16	r6, 0x148
 f0 6b 8c              st32	[r6], q2
 c0 19                 ldi8	r4, 0x19
 c1 52                 ldi8	r5, 0x52
 c6 44 01              ldi16	r6, 0x144
 f0 6b 8c              st32	[r6], q2
 c4 88 12              ldi16	r4, 0x1288
 a5                    xor	r5, r5
 c6 40 01              ldi16	r6, 0x140
 f0 6b 8c              st32	[r6], q2
 c0 16                 ldi8	r4, 0x16
 c5 5d 01              ldi16	r5, 0x15d
 c6 3c 01              ldi16	r6, 0x13c
 f0 6b 8c              st32	[r6], q2
 c4 77 12              ldi16	r4, 0x1277
 a5                    xor	r5, r5
 c6 38 01              ldi16	r6, 0x138
 f0 6b 8c              st32	[r6], q2
 c0 13                 ldi8	r4, 0x13
 c1 5c                 ldi8	r5, 0x5c
 c6 34 01              ldi16	r6, 0x134
 f0 6b 8c              st32	[r6], q2
 c4 66 12              ldi16	r4, 0x1266
 a5                    xor	r5, r5
 c6 30 01              ldi16	r6, 0x130
 f0 6b 8c              st32	[r6], q2
 c0 10                 ldi8	r4, 0x10
 c5 5f 01              ldi16	r5, 0x15f
 c6 2c 01              ldi16	r6, 0x12c
 f0 6b 8c              st32	[r6], q2
 c4 55 12              ldi16	r4, 0x1255
 a5                    xor	r5, r5
 c6 28 01              ldi16	r6, 0x128
 f0 6b 8c              st32	[r6], q2
 c0 0d                 ldi8	r4, 0xd
 c1 5e                 ldi8	r5, 0x5e
 c6 24 01              ldi16	r6, 0x124
 f0 6b 8c              st32	[r6], q2
 c4 44 12              ldi16	r4, 0x1244
 a5                    xor	r5, r5
 c6 20 01              ldi16	r6, 0x120
 f0 6b 8c              st32	[r6], q2
 c0 0a                 ldi8	r4, 0xa
 c5 59 01              ldi16	r5, 0x159
 c6 1c 01              ldi16	r6, 0x11c
 f0 6b 8c              st32	[r6], q2
 c4 33 12              ldi16	r4, 0x1233
 a5                    xor	r5, r5
 c6 18 01              ldi16	r6, 0x118
 f0 6b 8c              st32	[r6], q2
 c0 07                 ldi8	r4, 0x7
 c1 58                 ldi8	r5, 0x58
 c6 14 01              ldi16	r6, 0x114
 f0 6b 8c              st32	[r6], q2
 c4 22 12              ldi16	r4, 0x1222
 a5                    xor	r5, r5
 c6 10 01              ldi16	r6, 0x110
 f0 6b 8c              st32	[r6], q2
 c0 04                 ldi8	r4, 0x4
 c5 5b 01              ldi16	r5, 0x15b
 c6 0c 01              ldi16	r6, 0x10c
 f0 6b 8c              st32	[r6], q2
 c4 11 12              ldi16	r4, 0x1211
 a5                    xor	r5, r5
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 c0 01                 ldi8	r4, 0x1
 c1 5a                 ldi8	r5, 0x5a
 f0 04 04 01           ldi16	r0, 0x104
 f0 6b 80              st32	[r0], q2
 c4 00 12              ldi16	r4, 0x1200
 a5                    xor	r5, r5
 f0 05 00 01           ldi16	r1, 0x100
 f0 6b 82              st32	[r1], q2
 aa                    xor	r6, r6
 af                    xor	r7, r7
 a5                    xor	r5, r5
 d7 01                 sys	debug_break
 c0 05                 ldi8	r4, 0x5
 f4 40                 stsp16	[sp+0x0], r4
 f0 06 05 01           ldi16	r2, 0x105
 f4 49                 stsp16	[sp+0x2], r5
 f1 19                 mov	r3, r1
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 61                 stsp16	[sp+0x8], r5
 f0 3b 06              stsp16	[sp+0x6], r3
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 f4 21                 ldsp16	r5, [sp+0x8]
 15                    add	r5, r5
 15                    add	r5, r5
 15                    add	r5, r5
 c0 78                 ldi8	r4, 0x78
 81                    and	r4, r5
 f0 6a c6              ld32	q3, [r3]
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 3f 18              stsp16	[sp+0x18], r7
 f1 27                 mov	r5, r3
 c9 04                 addi.s8	r5, 0x4
 f0 6a ca              ld32	q3, [r5]
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f0 3f 1c              stsp16	[sp+0x1c], r7
 08                    mov	r6, r4
 f2 28                 add	r6, r0
 f1 1c                 mov	r3, r4
 f2 1a                 add	r3, r2
 f1 14                 mov	r2, r4
 c5 06 01              ldi16	r5, 0x106
 f2 15                 add	r2, r5
 0c                    mov	r7, r4
 c5 07 01              ldi16	r5, 0x107
 1d                    add	r7, r5
 f4 53                 stsp16	[sp+0x4], r7
 0c                    mov	r7, r4
 f2 2d                 add	r7, r1
 f1 04                 mov	r0, r4
 c5 01 01              ldi16	r5, 0x101
 f2 05                 add	r0, r5
 f1 0c                 mov	r1, r4
 c5 02 01              ldi16	r5, 0x102
 f2 0d                 add	r1, r5
 c5 03 01              ldi16	r5, 0x103
 11                    add	r4, r5
 ed a4 20              ld8u	r5, [r2+0]
 f0 06 05 01           ldi16	r2, 0x105
 f0 2d 14              stsp8	[sp+0x14], r5
 ed a6 20              ld8u	r5, [r3+0]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 2d 13              stsp8	[sp+0x13], r5
 46                    ld8u	r5, [r6]
 f0 2d 12              stsp8	[sp+0x12], r5
 40                    ld8u	r4, [r4]
 f0 2c 11              stsp8	[sp+0x11], r4
 ed 82 20              ld8u	r4, [r1+0]
 f0 2c 10              stsp8	[sp+0x10], r4
 ed 80 20              ld8u	r4, [r0+0]
 f1 6c                 stsp8	[sp+0xf], r4
 43                    ld8u	r4, [r7]
 f1 68                 stsp8	[sp+0xe], r4
 f4 10                 ldsp16	r4, [sp+0x4]
 40                    ld8u	r4, [r4]
 f0 2c 15              stsp8	[sp+0x15], r4
 f4 28                 ldsp16	r4, [sp+0xa]
 08                    mov	r6, r4
 fa 9c                 lsr16i	r6, 0xc
 f4 31                 ldsp16	r5, [sp+0xc]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 0c                    mov	r7, r4
 fa 64                 lsl16i	r7, 0x4
 9e                    or	r7, r6
 f1 07                 mov	r0, r7
 f2 39                 sub	r1, r1
 fa 7c                 lsr16i	r4, 0xc
 0c                    mov	r7, r4
 aa                    xor	r6, r6
 f9 c1                 or	r6, r0
 f9 e5                 or	r7, r1
 f0 05 00 01           ldi16	r1, 0x100
 f0 04 04 01           ldi16	r0, 0x104
 f0 14 16              leasp	r4, 0x16
 f0 15 0e              leasp	r5, 0xe
 d5 2e                 call8	combine
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 f7 6e                 add32	q3, q2
 f4 21                 ldsp16	r5, [sp+0x8]
 f0 0b 08              addi.s8	r3, 0x8
 f4 ad                 inc16	r5
 cd 15                 cmpi.s8	r5, 0x15
 db 45 ff              brne16	avm_test_main+355
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 14                 cmpi.s8	r4, 0x14
 db 33 ff              brne16	avm_test_main+349
 c4 80 01              ldi16	r4, 0x180
 f0 6b c8              st32	[r4], q3
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 1e                 adjsp	0x1e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<combine>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 f1 16                 mov	r2, r6
 f1 05                 mov	r0, r5
 f1 0c                 mov	r1, r4
 ed 82 27              ld8u	r4, [r1+7]
 f4 a4                 tst8	r4
 d0 0b                 breq8	combine+30
 f0 6a 82              ld32	q2, [r1]
 ed d2 24              ld16	r6, [r1+4]
 af                    xor	r7, r7
 d5 52                 call8	__avm_mulsi3
 d4 03                 jmp8	combine+33
 f1 22                 mov	r4, r2
 a5                    xor	r5, r5
 ed c0 27              ld8u	r6, [r0+7]
 f4 a6                 tst8	r6
 f0 38 00              stsp16	[sp+0x0], r0
 d0 0b                 breq8	combine+54
 f0 6a 40              ld32	q1, [r0]
 ed d0 24              ld16	r6, [r0+4]
 af                    xor	r7, r7
 f7 6d                 add32	q3, q1
 d4 03                 jmp8	combine+57
 f1 2a                 mov	r6, r2
 af                    xor	r7, r7
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 ed 82 26              ld8u	r4, [r1+6]
 a5                    xor	r5, r5
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 fa 38                 lsl16i	r4, 0x8
 f1 14                 mov	r2, r4
 f2 4b                 sub	r3, r3
 f4 11                 ldsp16	r5, [sp+0x4]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 fa 38                 lsl16i	r4, 0x8
 f1 0c                 mov	r1, r4
 f2 30                 sub	r0, r0
 f9 09                 or	r0, r2
 f9 2d                 or	r1, r3
 f7 63                 add32	q0, q3
 f4 00                 ldsp16	r4, [sp+0x0]
 ed 88 26              ld8u	r4, [r4+6]
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<__avm_mulsi3>:
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	-0x12
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 fa 7f                 lsr16i	r4, 0xf
 f2 20                 add	r4, r0
 f4 68                 stsp16	[sp+0xa], r4
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f1 07                 mov	r0, r7
 f2 39                 sub	r1, r1
 02                    mov	r4, r6
 fa 7f                 lsr16i	r4, 0xf
 f2 20                 add	r4, r0
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 fe 26                 mul16	r4, r6
 f4 40                 stsp16	[sp+0x0], r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 2a                 ldsp16	r6, [sp+0xa]
 fe 34                 mul16	r6, r4
 f4 6a                 stsp16	[sp+0xa], r6
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f4 4a                 stsp16	[sp+0x2], r6
 f1 74                 zext8	r4
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f4 18                 ldsp16	r4, [sp+0x6]
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f3 18                 mulu8.w	r6, r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 3b                 mulsu8.w	r6, r7
 f0 3e 10              stsp16	[sp+0x10], r6
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 fa 78                 lsr16i	r4, 0x8
 0c                    mov	r7, r4
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 2e                 muls8.w	r7, r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f3 32                 mulsu8.w	r4, r6
 08                    mov	r6, r4
 fa d8                 asr16i	r6, 0x8
 f4 1b                 ldsp16	r7, [sp+0x6]
 1b                    add	r6, r7
 f0 37 10              ldsp16	r7, [sp+0x10]
 fa e8                 asr16i	r7, 0x8
 1e                    add	r7, r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 1e                    add	r7, r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 36 10              ldsp16	r6, [sp+0x10]
 18                    add	r6, r4
 f0 3e 10              stsp16	[sp+0x10], r6
 fa 38                 lsl16i	r4, 0x8
 08                    mov	r6, r4
 f4 72                 stsp16	[sp+0xc], r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 33                 ldsp16	r7, [sp+0xc]
 1e                    add	r7, r6
 f4 73                 stsp16	[sp+0xc], r7
 f4 32                 ldsp16	r6, [sp+0xc]
 38                    cmp	r6, r4
 f8 14                 cset.ult	r4
 f4 29                 ldsp16	r5, [sp+0xa]
 11                    add	r4, r5
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f0 35 10              ldsp16	r5, [sp+0x10]
 fa 48                 lsl16i	r5, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 16                    add	r5, r6
 f0 3d 10              stsp16	[sp+0x10], r5
 f4 32                 ldsp16	r6, [sp+0xc]
 36                    cmp	r5, r6
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 0d                    mov	r7, r5
 aa                    xor	r6, r6
 f0 34 10              ldsp16	r4, [sp+0x10]
 a5                    xor	r5, r5
 92                    or	r4, r6
 97                    or	r5, r7
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
