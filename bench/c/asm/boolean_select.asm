
boolean_select.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 boolean_select.c
00000100 l     O .data	00000040 coordinates
00000140 l     O .data	00000002 boolean_select_result
00000000 l    df *ABS*	00000000 runtime.c
000003dd l       .init_array	00000000 .hidden __init_array_end
000003dd l       .init_array	00000000 .hidden __init_array_start
000003dd l       .fini_array	00000000 .hidden __fini_array_start
000003dd l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000114 avm_test_main
000003db g     F .text	00000002 avm_halt
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
 e1 bd 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 dd 03              ldi16	r4, 0x3dd
 c1 00                 ldi8	r5, 0x0
 c6 dd 03              ldi16	r6, 0x3dd
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 dd 03           ldi16	r0, 0x3dd
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 dd 03           ldi16	r2, 0x3dd
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
 c4 dd 03              ldi16	r4, 0x3dd
 c1 00                 ldi8	r5, 0x0
 c6 dd 03              ldi16	r6, 0x3dd
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 dd 03           ldi16	r2, 0x3dd
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 dd 03           ldi16	r0, 0x3dd
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
 d6 fc                 adjsp	-0x4
 c4 d5 f0              ldi16	r4, 0xf0d5
 c5 da f8              ldi16	r5, 0xf8da
 c6 3c 01              ldi16	r6, 0x13c
 f0 6b 8c              st32	[r6], q2
 c4 cb e0              ldi16	r4, 0xe0cb
 c5 d0 e8              ldi16	r5, 0xe8d0
 c6 38 01              ldi16	r6, 0x138
 f0 6b 8c              st32	[r6], q2
 c4 c1 d0              ldi16	r4, 0xd0c1
 c5 c6 d8              ldi16	r5, 0xd8c6
 c6 34 01              ldi16	r6, 0x134
 f0 6b 8c              st32	[r6], q2
 c4 b7 c0              ldi16	r4, 0xc0b7
 c5 bc c8              ldi16	r5, 0xc8bc
 c6 30 01              ldi16	r6, 0x130
 f0 6b 8c              st32	[r6], q2
 c4 ad b0              ldi16	r4, 0xb0ad
 c5 b2 b8              ldi16	r5, 0xb8b2
 c6 2c 01              ldi16	r6, 0x12c
 f0 6b 8c              st32	[r6], q2
 c4 a3 a0              ldi16	r4, 0xa0a3
 c5 a8 a8              ldi16	r5, 0xa8a8
 c6 28 01              ldi16	r6, 0x128
 f0 6b 8c              st32	[r6], q2
 c4 99 90              ldi16	r4, 0x9099
 c5 9e 98              ldi16	r5, 0x989e
 c6 24 01              ldi16	r6, 0x124
 f0 6b 8c              st32	[r6], q2
 c4 8f 80              ldi16	r4, 0x808f
 c5 94 88              ldi16	r5, 0x8894
 c6 20 01              ldi16	r6, 0x120
 f0 6b 8c              st32	[r6], q2
 c4 85 70              ldi16	r4, 0x7085
 c5 8a 78              ldi16	r5, 0x788a
 c6 1c 01              ldi16	r6, 0x11c
 f0 6b 8c              st32	[r6], q2
 c4 7b 60              ldi16	r4, 0x607b
 c5 80 68              ldi16	r5, 0x6880
 c6 18 01              ldi16	r6, 0x118
 f0 6b 8c              st32	[r6], q2
 c4 71 50              ldi16	r4, 0x5071
 c5 76 58              ldi16	r5, 0x5876
 c6 14 01              ldi16	r6, 0x114
 f0 6b 8c              st32	[r6], q2
 c4 67 40              ldi16	r4, 0x4067
 c5 6c 48              ldi16	r5, 0x486c
 c6 10 01              ldi16	r6, 0x110
 f0 6b 8c              st32	[r6], q2
 c4 5d 30              ldi16	r4, 0x305d
 c5 62 38              ldi16	r5, 0x3862
 c6 0c 01              ldi16	r6, 0x10c
 f0 6b 8c              st32	[r6], q2
 c4 53 20              ldi16	r4, 0x2053
 c5 58 28              ldi16	r5, 0x2858
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 c4 49 10              ldi16	r4, 0x1049
 c5 4e 18              ldi16	r5, 0x184e
 c6 04 01              ldi16	r6, 0x104
 f0 6b 8c              st32	[r6], q2
 c0 3f                 ldi8	r4, 0x3f
 c5 44 08              ldi16	r5, 0x844
 c6 00 01              ldi16	r6, 0x100
 f0 6b 8c              st32	[r6], q2
 f2 4b                 sub	r3, r3
 d7 01                 sys	debug_break
 c0 20                 ldi8	r4, 0x20
 f4 40                 stsp16	[sp+0x0], r4
 f1 2f                 mov	r7, r3
 f1 2b                 mov	r6, r3
<L0>:
 f4 4a                 stsp16	[sp+0x2], r6
 f4 02                 ldsp16	r6, [sp+0x0]
 c4 00 01              ldi16	r4, 0x100
<L1>:
 f5 40                 ld16	r0, [r4]
 f1 08                 mov	r1, r0
 f0 09 c0              addi.s8	r1, -0x40
 f5 01                 cmp	r0, r1
 fc 0b                 cmov.ult	r1, r3
 f1 24                 mov	r5, r0
 c9 80                 addi.s8	r5, -0x80
 f5 05                 cmp	r0, r5
 fc 2b                 cmov.ult	r5, r3
 17                    add	r5, r7
 f9 a6                 xor	r5, r1
 f0 08 25              addi.s8	r0, 0x25
 f7 40                 st16	[r4+], r0
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 0d                    mov	r7, r5
 d1 de                 brne8	-0x22 <L1>
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 ae                 inc16	r6
 02                    mov	r4, r6
 f1 74                 zext8	r4
 cc 20                 cmpi.s8	r4, 0x20
 0d                    mov	r7, r5
 d1 cb                 brne8	-0x35 <L0>
 f0 5d 40 01           stm16	[0x140], r5
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
