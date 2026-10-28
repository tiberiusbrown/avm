
math_sqrt_mantissas.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 math_sqrt_mantissas.c
00000100 l     O .data	00000004 result
00000104 l     O .data	00000080 inputs
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 ef_sqrt.c
00000458 l     F .text	00000025 avm_sqrt_special
00000000 l    df *ABS*	00000000 stdlib.c
00000000 l    df *ABS*	00000000 avm.c
00000000 l    df *ABS*	00000000 ctype.c
00000000 l    df *ABS*	00000000 strtof.c
00000000 l    df *ABS*	00000000 integer.c
00000000 l    df *ABS*	00000000 wide_integer.c
0000047d l       .init_array	00000000 .hidden __init_array_end
0000047d l       .init_array	00000000 .hidden __init_array_start
0000047d l       .fini_array	00000000 .hidden __fini_array_start
0000047d l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	00000180 avm_test_main
000003e9 g     F .text	00000065 __avm_terminate
000003e7 g     F .text	00000002 avm_halt
0000044e g     F .text	0000000a sqrtf
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000184 g     O .data	00000002 __avm_errno

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
 e1 d3 01              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 c4 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 7d 04              ldi16	r4, 0x47d
 c1 00                 ldi8	r5, 0x0
 c6 7d 04              ldi16	r6, 0x47d
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 7d 04           ldi16	r0, 0x47d
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 7d 04           ldi16	r2, 0x47d
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
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f2 4b                 sub	r3, r3
 d7 01                 sys	debug_break
 f0 02 80              ldi8	r2, 0x80
<L0>:
 f1 23                 mov	r4, r3
 c5 04 01              ldi16	r5, 0x104
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 e1 84 00              call16	sqrtf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f0 0b 04              addi.s8	r3, 0x4
 f5 1a                 cmp	r3, r2
 d1 e5                 brne8	-0x1b <L0>
 c4 00 01              ldi16	r4, 0x100
 f0 6b 08              st32	[r4], q0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
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
 e1 02 fc              call16	-1022 <__avm_run_local_dtors>
<L0>:
 c4 7d 04              ldi16	r4, 0x47d
 c1 00                 ldi8	r5, 0x0
 c6 7d 04              ldi16	r6, 0x47d
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 7d 04           ldi16	r2, 0x47d
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 7d 04           ldi16	r0, 0x47d
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
 e1 b9 fb              call16	-1095 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<sqrtf>:
 09                    mov	r6, r5
 f6 2e                 tst16	r6
 d3 03                 brslt8	0x3 <L0>
 ff 17                 fsqrt
 ef                    ret
<L0>:
 d4 00                 jmp8	avm_sqrt_special

<avm_sqrt_special>:
 09                    mov	r6, r5
 c7 7f ff              ldi16	r7, 0xff7f
 3e                    cmp	r7, r6
 d2 0d                 brult8	0xd <L1>
 f6 2c                 tst16	r4
 d1 11                 brne8	0x11 <L2>
 c7 00 80              ldi16	r7, 0x8000
 3b                    cmp	r6, r7
 d1 0b                 brne8	0xb <L2>
<L0>:
 ff 17                 fsqrt
 ef                    ret
<L1>:
 f6 2c                 tst16	r4
 d1 f9                 brne8	-0x7 <L0>
 ce 80                 cmpi.s8	r6, -0x80
 d1 f5                 brne8	-0xb <L0>
<L2>:
 c2 21                 ldi8	r6, 0x21
 f0 5e 84 01           stm16	[0x184], r6
 ff 17                 fsqrt
 ef                    ret
