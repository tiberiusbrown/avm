
record_stride.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 record_stride.c
00000100 l     O .data	00000090 records
00000190 l     O .data	00000001 length
00000191 l     O .data	00000002 record_stride_result
00000000 l    df *ABS*	00000000 runtime.c
000003a7 l       .init_array	00000000 .hidden __init_array_end
000003a7 l       .init_array	00000000 .hidden __init_array_start
000003a7 l       .fini_array	00000000 .hidden __fini_array_start
000003a7 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	000000de avm_test_main
000003a5 g     F .text	00000002 avm_halt
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
 e1 87 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 a7 03              ldi16	r4, 0x3a7
 c1 00                 ldi8	r5, 0x0
 c6 a7 03              ldi16	r6, 0x3a7
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 a7 03           ldi16	r0, 0x3a7
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 a7 03           ldi16	r2, 0x3a7
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
 c4 a7 03              ldi16	r4, 0x3a7
 c1 00                 ldi8	r5, 0x0
 c6 a7 03              ldi16	r6, 0x3a7
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 a7 03           ldi16	r2, 0x3a7
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 a7 03           ldi16	r0, 0x3a7
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
 c4 72 02              ldi16	r4, 0x272
 a5                    xor	r5, r5
 c6 7e 01              ldi16	r6, 0x17e
 f0 6b 8c              st32	[r6], q2
 c4 2b 02              ldi16	r4, 0x22b
 c5 01 01              ldi16	r5, 0x101
 c6 6c 01              ldi16	r6, 0x16c
 f0 6b 8c              st32	[r6], q2
 c4 e4 01              ldi16	r4, 0x1e4
 c5 02 02              ldi16	r5, 0x202
 c6 5a 01              ldi16	r6, 0x15a
 f0 6b 8c              st32	[r6], q2
 c4 9d 01              ldi16	r4, 0x19d
 c5 03 03              ldi16	r5, 0x303
 c6 48 01              ldi16	r6, 0x148
 f0 6b 8c              st32	[r6], q2
 c4 56 01              ldi16	r4, 0x156
 c5 04 04              ldi16	r5, 0x404
 c6 36 01              ldi16	r6, 0x136
 f0 6b 8c              st32	[r6], q2
 c4 0f 01              ldi16	r4, 0x10f
 c5 05 05              ldi16	r5, 0x505
 c6 24 01              ldi16	r6, 0x124
 f0 6b 8c              st32	[r6], q2
 c0 c8                 ldi8	r4, 0xc8
 c5 06 06              ldi16	r5, 0x606
 c6 12 01              ldi16	r6, 0x112
 f0 6b 8c              st32	[r6], q2
 c0 81                 ldi8	r4, 0x81
 c5 07 07              ldi16	r5, 0x707
 f0 04 00 01           ldi16	r0, 0x100
 f0 6b 80              st32	[r0], q2
 c0 79                 ldi8	r4, 0x79
 f0 4c 88 01           stm8	[0x188], r4
 c0 fa                 ldi8	r4, 0xfa
 f0 4c 76 01           stm8	[0x176], r4
 c0 7b                 ldi8	r4, 0x7b
 f0 4c 64 01           stm8	[0x164], r4
 c0 fc                 ldi8	r4, 0xfc
 f0 4c 52 01           stm8	[0x152], r4
 c0 7d                 ldi8	r4, 0x7d
 f0 4c 40 01           stm8	[0x140], r4
 c0 fe                 ldi8	r4, 0xfe
 f0 4c 2e 01           stm8	[0x12e], r4
 c0 7f                 ldi8	r4, 0x7f
 f0 4c 1c 01           stm8	[0x11c], r4
 f2 39                 sub	r1, r1
 f0 49 0a 01           stm8	[0x10a], r1
 d7 01                 sys	debug_break
 f1 11                 mov	r2, r1
 f1 2d                 mov	r7, r1
 d4 0a                 jmp8	0xa <L1>
<L0>:
 f4 aa                 inc16	r2
 f1 22                 mov	r4, r2
 f1 74                 zext8	r4
 cc 20                 cmpi.s8	r4, 0x20
 d0 2f                 breq8	0x2f <L4>
<L1>:
 f0 43 90 01           ldm8u	r3, [0x190]
 f4 a3                 tst8	r3
 d0 ee                 breq8	-0x12 <L0>
 f1 24                 mov	r5, r0
 f1 29                 mov	r6, r1
 d4 08                 jmp8	0x8 <L3>
<L2>:
 c9 12                 addi.s8	r5, 0x12
 f4 ae                 inc16	r6
 f5 2b                 cmp	r6, r3
 d0 e0                 breq8	-0x20 <L0>
<L3>:
 ed 8a 2a              ld8u	r4, [r5+10]
 f4 a4                 tst8	r4
 d0 f1                 breq8	-0xf <L2>
 61                    ld16	r4, [r5]
 1c                    add	r7, r4
 ed 9a 22              ld16	r4, [r5+2]
 13                    add	r4, r7
 12                    add	r4, r6
 0c                    mov	r7, r4
 c9 12                 addi.s8	r5, 0x12
 f4 ae                 inc16	r6
 f5 2b                 cmp	r6, r3
 d1 e9                 brne8	-0x17 <L3>
 d4 c7                 jmp8	-0x39 <L0>
<L4>:
 f0 5f 91 01           stm16	[0x191], r7
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
