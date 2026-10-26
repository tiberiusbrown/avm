
math_sqrt_mantissas.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 math_sqrt_mantissas.c
00000100 l     O .data	00000004 result
00000104 l     O .data	00000080 inputs
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 ef_sqrt.c
00000504 l     O .rodata	00002000 sqrt_table
00002504 l       .init_array	00000000 .hidden __init_array_end
00002504 l       .init_array	00000000 .hidden __init_array_start
00002504 l       .fini_array	00000000 .hidden __fini_array_start
00002504 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000179 avm_test_main
00000440 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000442 g     F .text	000000c2 sqrtf

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
 e1 22 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 04 25              ldi16	r4, 0x2504
 c1 00                 ldi8	r5, 0x0
 c6 04 25              ldi16	r6, 0x2504
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 04 25           ldi16	r0, 0x2504
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 04 25           ldi16	r2, 0x2504
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
 c4 04 25              ldi16	r4, 0x2504
 c1 00                 ldi8	r5, 0x0
 c6 04 25              ldi16	r6, 0x2504
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 04 25           ldi16	r2, 0x2504
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 04 25           ldi16	r0, 0x2504
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
 c0 01                 ldi8	r4, 0x1
 c5 80 3f              ldi16	r5, 0x3f80
 c6 04 01              ldi16	r6, 0x104
 f0 6b 8c              st32	[r6], q2
 c5 00 40              ldi16	r5, 0x4000
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 c4 ff ff              ldi16	r4, 0xffff
 c5 8f 3f              ldi16	r5, 0x3f8f
 c6 0c 01              ldi16	r6, 0x10c
 f0 6b 8c              st32	[r6], q2
 c5 0f 40              ldi16	r5, 0x400f
 c6 10 01              ldi16	r6, 0x110
 f0 6b 8c              st32	[r6], q2
 c0 01                 ldi8	r4, 0x1
 c5 90 3f              ldi16	r5, 0x3f90
 c6 14 01              ldi16	r6, 0x114
 f0 6b 8c              st32	[r6], q2
 c5 10 40              ldi16	r5, 0x4010
 c6 18 01              ldi16	r6, 0x118
 f0 6b 8c              st32	[r6], q2
 c4 ff ff              ldi16	r4, 0xffff
 c5 9f 3f              ldi16	r5, 0x3f9f
 c6 1c 01              ldi16	r6, 0x11c
 f0 6b 8c              st32	[r6], q2
 c5 1f 40              ldi16	r5, 0x401f
 c6 20 01              ldi16	r6, 0x120
 f0 6b 8c              st32	[r6], q2
 c0 01                 ldi8	r4, 0x1
 c5 a0 3f              ldi16	r5, 0x3fa0
 c6 24 01              ldi16	r6, 0x124
 f0 6b 8c              st32	[r6], q2
 c5 20 40              ldi16	r5, 0x4020
 c6 28 01              ldi16	r6, 0x128
 f0 6b 8c              st32	[r6], q2
 c4 ff ff              ldi16	r4, 0xffff
 c5 af 3f              ldi16	r5, 0x3faf
 c6 2c 01              ldi16	r6, 0x12c
 f0 6b 8c              st32	[r6], q2
 c5 2f 40              ldi16	r5, 0x402f
 c6 30 01              ldi16	r6, 0x130
 f0 6b 8c              st32	[r6], q2
 c0 01                 ldi8	r4, 0x1
 c5 b0 3f              ldi16	r5, 0x3fb0
 c6 34 01              ldi16	r6, 0x134
 f0 6b 8c              st32	[r6], q2
 c5 30 40              ldi16	r5, 0x4030
 c6 38 01              ldi16	r6, 0x138
 f0 6b 8c              st32	[r6], q2
 c4 ff ff              ldi16	r4, 0xffff
 c5 bf 3f              ldi16	r5, 0x3fbf
 c6 3c 01              ldi16	r6, 0x13c
 f0 6b 8c              st32	[r6], q2
 c5 3f 40              ldi16	r5, 0x403f
 c6 40 01              ldi16	r6, 0x140
 f0 6b 8c              st32	[r6], q2
 c0 01                 ldi8	r4, 0x1
 c5 c0 3f              ldi16	r5, 0x3fc0
 c6 44 01              ldi16	r6, 0x144
 f0 6b 8c              st32	[r6], q2
 c5 40 40              ldi16	r5, 0x4040
 c6 48 01              ldi16	r6, 0x148
 f0 6b 8c              st32	[r6], q2
 c4 ff ff              ldi16	r4, 0xffff
 c5 cf 3f              ldi16	r5, 0x3fcf
 c6 4c 01              ldi16	r6, 0x14c
 f0 6b 8c              st32	[r6], q2
 c5 4f 40              ldi16	r5, 0x404f
 c6 50 01              ldi16	r6, 0x150
 f0 6b 8c              st32	[r6], q2
 c0 01                 ldi8	r4, 0x1
 c5 d0 3f              ldi16	r5, 0x3fd0
 c6 54 01              ldi16	r6, 0x154
 f0 6b 8c              st32	[r6], q2
 c5 50 40              ldi16	r5, 0x4050
 c6 58 01              ldi16	r6, 0x158
 f0 6b 8c              st32	[r6], q2
 c4 ff ff              ldi16	r4, 0xffff
 c5 df 3f              ldi16	r5, 0x3fdf
 c6 5c 01              ldi16	r6, 0x15c
 f0 6b 8c              st32	[r6], q2
 c5 5f 40              ldi16	r5, 0x405f
 c6 60 01              ldi16	r6, 0x160
 f0 6b 8c              st32	[r6], q2
 c0 01                 ldi8	r4, 0x1
 c5 e0 3f              ldi16	r5, 0x3fe0
 c6 64 01              ldi16	r6, 0x164
 f0 6b 8c              st32	[r6], q2
 c5 60 40              ldi16	r5, 0x4060
 c6 68 01              ldi16	r6, 0x168
 f0 6b 8c              st32	[r6], q2
 c4 ff ff              ldi16	r4, 0xffff
 c5 ef 3f              ldi16	r5, 0x3fef
 c6 6c 01              ldi16	r6, 0x16c
 f0 6b 8c              st32	[r6], q2
 c5 6f 40              ldi16	r5, 0x406f
 c6 70 01              ldi16	r6, 0x170
 f0 6b 8c              st32	[r6], q2
 c0 01                 ldi8	r4, 0x1
 c5 f0 3f              ldi16	r5, 0x3ff0
 c6 74 01              ldi16	r6, 0x174
 f0 6b 8c              st32	[r6], q2
 c5 70 40              ldi16	r5, 0x4070
 c6 78 01              ldi16	r6, 0x178
 f0 6b 8c              st32	[r6], q2
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff 3f              ldi16	r5, 0x3fff
 c6 7c 01              ldi16	r6, 0x17c
 f0 6b 8c              st32	[r6], q2
 c5 7f 40              ldi16	r5, 0x407f
 c6 80 01              ldi16	r6, 0x180
 f0 6b 8c              st32	[r6], q2
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f2 39                 sub	r1, r1
 d7 01                 sys	debug_break
 f0 00 80              ldi8	r0, 0x80
<L0>:
 f1 21                 mov	r4, r1
 c5 04 01              ldi16	r5, 0x104
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 d5 19                 call8	sqrtf
 ff 06                 fadd	q1, q2
 f0 09 04              addi.s8	r1, 0x4
 f5 08                 cmp	r1, r0
 d1 ec                 brne8	-0x14 <L0>
 c4 00 01              ldi16	r4, 0x100
 f0 6b 48              st32	[r4], q1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<sqrtf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 da a3 00              breq16	0xa3 <L4>
 f0 69 80              cmp32	q2, q0
 d3 10                 brslt8	0x10 <L0>
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 c0              cmp32	q3, q0
 d2 0c                 brult8	0xc <L1>
 ff 0a                 fadd	q2, q2
 e0 8e 00              jmp16	142 <L4>
<L0>:
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 e0 87 00              jmp16	135 <L4>
<L1>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 01 7f              ldi8	r1, 0x7f
 f0 69 0c              cmp32	q0, q3
 d2 0b                 brult8	0xb <L2>
 aa                    xor	r6, r6
 c7 80 4b              ldi16	r7, 0x4b80
 ff 2b                 fmul	q2, q3
 c6 e8 ff              ldi16	r6, 0xffe8
 d4 01                 jmp8	0x1 <L3>
<L2>:
 aa                    xor	r6, r6
<L3>:
 f4 5a                 stsp16	[sp+0x6], r6
 f0 00 7f              ldi8	r0, 0x7f
 f9 14                 and	r0, r5
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 ca 81                 addi.s8	r6, -0x7f
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 c1 01                 ldi8	r5, 0x1
 86                    and	r5, r6
 fa 47                 lsl16i	r5, 0x7
 f9 a1                 or	r5, r0
 c2 08                 ldi8	r6, 0x8
 f4 42                 stsp16	[sp+0x0], r6
 f1 14                 mov	r2, r4
 f1 1d                 mov	r3, r5
 fa 7b                 lsr16i	r4, 0xb
 f1 2b                 mov	r6, r3
 fa 55                 lsl16i	r6, 0x5
 98                    or	r6, r4
 f0 04 f8 1f           ldi16	r0, 0x1ff8
 f2 39                 sub	r1, r1
 f9 18                 and	r0, r6
 c6 04 05              ldi16	r6, 0x504
 c3 00                 ldi8	r7, 0x0
 f7 6c                 add32	q3, q0
 f0 14 08              leasp	r4, 0x8
 f4 01                 ldsp16	r5, [sp+0x0]
 d7 10                 sys	memcpy_p
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f7 61                 add32	q0, q1
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 08                 ldsp16	r4, [sp+0x2]
 12                    add	r4, r6
 c6 00 c0              ldi16	r6, 0xc000
 c7 ff 7f              ldi16	r7, 0x7fff
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 ff 13                 fsub	q0, q3
 08                    mov	r6, r4
 fa 56                 lsl16i	r6, 0x6
 c4 80 ff              ldi16	r4, 0xff80
 82                    and	r4, r6
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 2c                 fmul	q3, q0
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 ff 07                 fadd	q1, q3
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f7 69                 add32	q2, q1
<L4>:
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
