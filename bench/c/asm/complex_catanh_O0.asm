
complex_catanh_O0.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 complex_catanh_O0.c
00000100 l     O .data	00000008 result
00000108 l     O .data	00000004 input_real
0000010c l     O .data	00000004 input_imag
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 inverse.c
00000000 l    df *ABS*	00000000 sf_fabs.c
00000000 l    df *ABS*	00000000 ef_acosh.c
00000000 l    df *ABS*	00000000 ef_log.c
00000000 l    df *ABS*	00000000 stdlib.c
00000000 l    df *ABS*	00000000 avm.c
00000000 l    df *ABS*	00000000 ctype.c
00000000 l    df *ABS*	00000000 strtof.c
00000000 l    df *ABS*	00000000 sf_copysign.c
00000000 l    df *ABS*	00000000 ef_sqrt.c
00000000 l    df *ABS*	00000000 ef_acos.c
00000000 l    df *ABS*	00000000 math.c
00000000 l    df *ABS*	00000000 ef_log1p.c
00000000 l    df *ABS*	00000000 ef_atan2.c
00000000 l    df *ABS*	00000000 ef_asin.c
00000000 l    df *ABS*	00000000 ef_asinh.c
00000000 l    df *ABS*	00000000 ef_hypot.c
00000ca7 l     F .text	000002a2 avm_hypot_overflows
00000000 l    df *ABS*	00000000 ef_atanh.c
00000000 l    df *ABS*	00000000 integer.c
00000000 l    df *ABS*	00000000 wide_integer.c
00000fe8 l       .init_array	00000000 .hidden __init_array_end
00000fe8 l       .init_array	00000000 .hidden __init_array_start
00000fe8 l       .fini_array	00000000 .hidden __fini_array_start
00000fe8 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	0000007b avm_test_main
000002e4 g     F .text	00000065 __avm_terminate
000002e2 g     F .text	00000002 avm_halt
00000349 g     F .text	000002c5 catanhf
00000000  w      *UND*	00000000 __avm_run_local_dtors
0000071e g     F .text	0000005e fmaxf
00000110 g     O .data	00000002 __avm_errno
00000f49 g     F .text	0000009f atanhf
0000077c g     F .text	00000135 log1pf
000008b1 g     F .text	00000227 atan2f
00000ad8 g     F .text	000001cf hypotf
00000611 g     F .text	000000f8 logf
00000709 g     F .text	00000015 copysignf
0000060e g     F .text	00000003 fabsf

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
 e1 ce 00              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 bf 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 e8 0f              ldi16	r4, 0xfe8
 c1 00                 ldi8	r5, 0x0
 c6 e8 0f              ldi16	r6, 0xfe8
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 e8 0f           ldi16	r0, 0xfe8
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 e8 0f           ldi16	r2, 0xfe8
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
 b1                    push16	r1
 b0                    push16	r0
 d6 e0                 adjsp	-0x20
 c4 08 01              ldi16	r4, 0x108
 f0 6a 88              ld32	q2, [r4]
 c6 0c 01              ldi16	r6, 0x10c
 f0 6a cc              ld32	q3, [r6]
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 d7 01                 sys	debug_break
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f3 5c                 ldsp8u	r4, [sp+0x7]
 f1 6c                 stsp8	[sp+0xf], r4
 f3 58                 ldsp8u	r4, [sp+0x6]
 f1 68                 stsp8	[sp+0xe], r4
 f3 54                 ldsp8u	r4, [sp+0x5]
 f1 64                 stsp8	[sp+0xd], r4
 f3 50                 ldsp8u	r4, [sp+0x4]
 f1 60                 stsp8	[sp+0xc], r4
 f3 4c                 ldsp8u	r4, [sp+0x3]
 f1 5c                 stsp8	[sp+0xb], r4
 f3 48                 ldsp8u	r4, [sp+0x2]
 f1 58                 stsp8	[sp+0xa], r4
 f3 44                 ldsp8u	r4, [sp+0x1]
 f1 54                 stsp8	[sp+0x9], r4
 f3 40                 ldsp8u	r4, [sp+0x0]
 f1 50                 stsp8	[sp+0x8], r4
 f0 14 18              leasp	r4, 0x18
 f0 15 08              leasp	r5, 0x8
 e1 87 00              call16	catanhf
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 c6 00 01              ldi16	r6, 0x100
 f0 6b 8c              st32	[r6], q2
 c4 04 01              ldi16	r4, 0x104
 f0 6b 08              st32	[r4], q0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 20                 adjsp	0x20
 b8                    pop16	r0
 b9                    pop16	r1
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
 e1 07 fd              call16	-761 <__avm_run_local_dtors>
<L0>:
 c4 e8 0f              ldi16	r4, 0xfe8
 c1 00                 ldi8	r5, 0x0
 c6 e8 0f              ldi16	r6, 0xfe8
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 e8 0f           ldi16	r2, 0xfe8
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 e8 0f           ldi16	r0, 0xfe8
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
 e1 be fc              call16	-834 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<catanhf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 dc                 adjsp	-0x24
 f4 40                 stsp16	[sp+0x0], r4
 f4 48                 stsp16	[sp+0x2], r4
 f0 6a ca              ld32	q3, [r5]
 c9 04                 addi.s8	r5, 0x4
 f0 6a 4a              ld32	q1, [r5]
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 f0 04 00 ff           ldi16	r0, 0xff00
 f9 82                 xor	r4, r0
 07                    mov	r5, r7
 15                    add	r5, r5
 f9 a2                 xor	r5, r0
 f1 06                 mov	r0, r6
 f9 15                 or	r0, r5
 f1 0a                 mov	r1, r2
 f9 31                 or	r1, r4
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 02                    mov	r4, r6
 07                    mov	r5, r7
 e1 95 02              call16	fabsf
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f2 69                 mov32	q2, q1
 e1 86 02              call16	fabsf
 f6 29                 tst16	r1
 f8 06                 cset.eq	r6
 f6 28                 tst16	r0
 d0 4b                 breq8	0x4b <L0>
 c3 01                 ldi8	r7, 0x1
 8b                    and	r6, r7
 f4 a6                 tst8	r6
 d1 44                 brne8	0x44 <L0>
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f1 28                 mov	r6, r0
 f7 8e                 bool	r6
 f1 2d                 mov	r7, r1
 1f                    add	r7, r7
 9e                    or	r7, r6
 f0 06 00 ff           ldi16	r2, 0xff00
 f5 17                 cmp	r2, r7
 d2 61                 brult8	0x61 <L2>
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f7 8e                 bool	r6
 1f                    add	r7, r7
 9e                    or	r7, r6
 f5 17                 cmp	r2, r7
 d2 55                 brult8	0x55 <L2>
 09                    mov	r6, r5
 1a                    add	r6, r6
 98                    or	r6, r4
 f6 2e                 tst16	r6
 d1 79                 brne8	0x79 <L4>
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 14                 fcmp
 f6 2e                 tst16	r6
 db 10 01              brne16	0x110 <L5>
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f2 6a                 mov32	q3, q0
 e1 31 03              call16	copysignf
 e0 13 01              jmp16	275 <L6>
<L0>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 e1 25 03              call16	copysignf
 f2 62                 mov32	q0, q2
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 02                    mov	r4, r6
 f7 8c                 bool	r4
 07                    mov	r5, r7
 15                    add	r5, r5
 94                    or	r5, r4
 c4 00 ff              ldi16	r4, 0xff00
 31                    cmp	r4, r5
 d2 0b                 brult8	0xb <L1>
 c4 db 0f              ldi16	r4, 0xfdb
 c5 c9 3f              ldi16	r5, 0x3fc9
 e1 0a 03              call16	copysignf
 08                    mov	r6, r4
 0d                    mov	r7, r5
<L1>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 6b 08              st32	[r4], q0
 c8 04                 addi.s8	r4, 0x4
 f0 6b c8              st32	[r4], q3
 e0 f7 01              jmp16	503 <L13>
<L2>:
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 f9 81                 or	r4, r0
 f6 2c                 tst16	r4
 d1 11                 brne8	0x11 <L3>
 f4 02                 ldsp16	r6, [sp+0x0]
 f0 6b 0c              st32	[r6], q0
 ca 04                 addi.s8	r6, 0x4
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 f0 6b 8c              st32	[r6], q2
 e0 dd 01              jmp16	477 <L13>
<L3>:
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 f4 02                 ldsp16	r6, [sp+0x0]
 f0 6b 8c              st32	[r6], q2
 ca 04                 addi.s8	r6, 0x4
 f0 6b 8c              st32	[r6], q2
 e0 cc 01              jmp16	460 <L13>
<L4>:
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 c6 6b 0b              ldi16	r6, 0xb6b
 c7 5e 5d              ldi16	r7, 0x5d5e
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 da b2 00              breq16	0xb2 <L7>
 c6 6b 0b              ldi16	r6, 0xb6b
 c7 5e 5d              ldi16	r7, 0x5d5e
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 da 9f 00              breq16	0x9f <L7>
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f2 69                 mov32	q2, q1
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 3b 1e              stsp16	[sp+0x1e], r3
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 00                 fadd
 c6 60 42              ldi16	r6, 0x4260
 c7 a2 0d              ldi16	r7, 0xda2
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 db d5 00              brne16	0xd5 <L10>
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 00                 fadd
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 f2 6b                 mov32	q3, q1
 e1 1d 06              call16	hypotf
 e1 53 01              call16	logf
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f2 6b                 mov32	q3, q1
 e1 0b 06              call16	hypotf
 e1 41 01              call16	logf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 01                 fsub
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 e0 d2 00              jmp16	210 <L11>
<L5>:
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 d1 66                 brne8	0x66 <L8>
 f2 68                 mov32	q2, q0
 e1 5b 0a              call16	atanhf
<L6>:
 f4 03                 ldsp16	r7, [sp+0x0]
 0b                    mov	r6, r7
 ca 04                 addi.s8	r6, 0x4
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f0 6b 0c              st32	[r6], q0
 f0 6b 8e              st32	[r7], q2
 e0 03 01              jmp16	259 <L13>
<L7>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 f2 6b                 mov32	q3, q1
 e1 0d 02              call16	fmaxf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 f2 67                 mov32	q1, q3
 f0 3a 14              stsp16	[sp+0x14], r2
 f0 3b 16              stsp16	[sp+0x16], r3
 ff 03                 fdiv
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 6b                 mov32	q3, q1
 ff 03                 fdiv
 f2 66                 mov32	q1, q2
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 03                 fdiv
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 03                 fdiv
 d4 17                 jmp8	0x17 <L9>
<L8>:
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 ff 03                 fdiv
 e1 1c 02              call16	log1pf
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 02                 fmul
<L9>:
 f2 6a                 mov32	q3, q0
 e1 9e 01              call16	copysignf
 f2 62                 mov32	q0, q2
 c4 db 0f              ldi16	r4, 0xfdb
 c5 c9 3f              ldi16	r5, 0x3fc9
 d4 7e                 jmp8	0x7e <L12>
<L10>:
 aa                    xor	r6, r6
 c7 80 40              ldi16	r7, 0x4080
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 ff 03                 fdiv
 e1 e8 01              call16	log1pf
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 c7 80 3e              ldi16	r7, 0x3e80
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
<L11>:
 ff 02                 fmul
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 ff 02                 fmul
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 f2 6b                 mov32	q3, q1
 e1 d3 02              call16	atan2f
 f2 66                 mov32	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 6a                 mov32	q3, q0
 e1 20 01              call16	copysignf
 f2 62                 mov32	q0, q2
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 f2 69                 mov32	q2, q1
 ff 02                 fmul
<L12>:
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 e1 0f 01              call16	copysignf
 f4 03                 ldsp16	r7, [sp+0x0]
 0b                    mov	r6, r7
 ca 04                 addi.s8	r6, 0x4
 f0 6b 8c              st32	[r6], q2
 f0 6b 0e              st32	[r7], q0
<L13>:
 f4 08                 ldsp16	r4, [sp+0x2]
 d6 24                 adjsp	0x24
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<fabsf>:
 ff 0a                 fabs	q2
 ef                    ret

<logf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 aa                    xor	r6, r6
 c7 80 80              ldi16	r7, 0x8080
 f2 62                 mov32	q0, q2
 f7 63                 add32	q0, q3
 f0 69 c0              cmp32	q3, q0
 dd 95 00              bruge16	0x95 <L3>
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 01 7f              ldi8	r1, 0x7f
 f0 69 08              cmp32	q0, q2
 d2 0b                 brult8	0xb <L0>
 aa                    xor	r6, r6
 c7 00 4c              ldi16	r7, 0x4c00
 ff 02                 fmul
 c6 68 ff              ldi16	r6, 0xff68
 d4 03                 jmp8	0x3 <L1>
<L0>:
 c6 81 ff              ldi16	r6, 0xff81
<L1>:
 f4 42                 stsp16	[sp+0x0], r6
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f0 06 20 fb           ldi16	r2, 0xfb20
 f0 03 4a              ldi8	r3, 0x4a
 f7 64                 add32	q1, q0
 c3 80                 ldi8	r7, 0x80
 f9 ec                 and	r7, r3
 f9 3d                 or	r1, r7
 f1 28                 mov	r6, r0
 f1 2d                 mov	r7, r1
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f9 1a                 xor	r0, r6
 f9 3e                 xor	r1, r7
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f1 2b                 mov	r6, r3
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 18                    add	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 15 07 a7 65 34 3e a3 bd 8a be 49 17 97 3e 10 e7 b7 be 96 17 f6 3e 8e ab 38 bf 46 aa b8 3f  fpoly	7, 0.176169023, -0.270978063, 0.295099527, -0.359184742, 0.480648696, -0.721367717, 1.44269633
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 ff 0c                 s16tof
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 c6 18 72              ldi16	r6, 0x7218
 c7 31 3f              ldi16	r7, 0x3f31
 ff 02                 fmul
<L2>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L3>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d0 13                 breq8	0x13 <L4>
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 69 08              cmp32	q0, q2
 d9 12                 brsge8	0x12 <L5>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 d4 d5                 jmp8	-0x2b <L2>
<L4>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 10 01           stm16	[0x110], r4
 a0                    xor	r4, r4
 c5 80 ff              ldi16	r5, 0xff80
 d4 c9                 jmp8	-0x37 <L2>
<L5>:
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 0c              cmp32	q0, q3
 d8 07                 bruge8	0x7 <L6>
 c6 c0 7f              ldi16	r6, 0x7fc0
 99                    or	r6, r5
 06                    mov	r5, r6
 d4 b7                 jmp8	-0x49 <L2>
<L6>:
 c2 21                 ldi8	r6, 0x21
 f0 5e 10 01           stm16	[0x110], r6
 c6 c0 7f              ldi16	r6, 0x7fc0
 99                    or	r6, r5
 06                    mov	r5, r6
 d4 aa                 jmp8	-0x56 <L2>

<copysignf>:
 b1                    push16	r1
 b0                    push16	r0
 c6 00 80              ldi16	r6, 0x8000
 8b                    and	r6, r7
 ff 0a                 fabs	q2
 f2 62                 mov32	q0, q2
 ff 04                 fneg	q0
 af                    xor	r7, r7
 3b                    cmp	r6, r7
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<fmaxf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 63                 mov32	q0, q3
 f2 66                 mov32	q1, q2
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 82                    and	r4, r6
 87                    and	r5, r7
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 c8              cmp32	q3, q2
 d2 3e                 brult8	0x3e <L2>
 f2 68                 mov32	q2, q0
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 82                    and	r4, r6
 87                    and	r5, r7
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L0>
 f2 61                 mov32	q0, q1
 d4 27                 jmp8	0x27 <L2>
<L0>:
 f2 68                 mov32	q2, q0
 f9 89                 or	r4, r2
 f9 ad                 or	r5, r3
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 82                    and	r4, r6
 87                    and	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 0e                 breq8	0xe <L1>
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 fb 02                 cmov.eq	r0, r2
 fb 0b                 cmov.eq	r1, r3
 d4 04                 jmp8	0x4 <L2>
<L1>:
 f9 08                 and	r0, r2
 f9 2c                 and	r1, r3
<L2>:
 f2 68                 mov32	q2, q0
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<log1pf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f9 c8                 and	r6, r2
 f9 ec                 and	r7, r3
 f2 30                 sub	r0, r0
 f0 05 80 3e           ldi16	r1, 0x3e80
 f0 69 0c              cmp32	q0, q3
 d2 26                 brult8	0x26 <L0>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 15 06 23 7f 38 be 44 43 5a 3e 99 9d 7f be b9 88 aa 3e 23 00 00 bf 00 00 80 3f      fpoly	6, -0.180172488, 0.213147223, -0.249624625, 0.333074361, -0.500002086, 1.0
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 e0 9a 00              jmp16	154 <L3>
<L0>:
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 c7 80 80              ldi16	r7, 0x8080
 f7 6b                 add32	q2, q3
 f0 69 c8              cmp32	q3, q2
 dd 90 00              bruge16	0x90 <L5>
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 7f              ldi8	r3, 0x7f
 f0 69 40              cmp32	q1, q0
 d2 0f                 brult8	0xf <L1>
 aa                    xor	r6, r6
 c7 00 4c              ldi16	r7, 0x4c00
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 c4 68 ff              ldi16	r4, 0xff68
 d4 03                 jmp8	0x3 <L2>
<L1>:
 c4 81 ff              ldi16	r4, 0xff81
<L2>:
 f4 40                 stsp16	[sp+0x0], r4
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 c6 20 fb              ldi16	r6, 0xfb20
 c3 4a                 ldi8	r7, 0x4a
 f7 6d                 add32	q3, q1
 c0 80                 ldi8	r4, 0x80
 83                    and	r4, r7
 f9 71                 or	r3, r4
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 f1 21                 mov	r4, r1
 fa 77                 lsr16i	r4, 0x7
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 18                    add	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 15 07 a7 65 34 3e a3 bd 8a be 49 17 97 3e 10 e7 b7 be 96 17 f6 3e 8e ab 38 bf 46 aa b8 3f  fpoly	7, 0.176169023, -0.270978063, 0.295099527, -0.359184742, 0.480648696, -0.721367717, 1.44269633
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 ff 0c                 s16tof
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 c6 18 72              ldi16	r6, 0x7218
 c7 31 3f              ldi16	r7, 0x3f31
<L3>:
 ff 02                 fmul
<L4>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L5>:
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 d0 13                 breq8	0x13 <L6>
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 80              cmp32	q2, q0
 d9 14                 brsge8	0x14 <L7>
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 d4 db                 jmp8	-0x25 <L4>
<L6>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 10 01           stm16	[0x110], r4
 a0                    xor	r4, r4
 c5 80 ff              ldi16	r5, 0xff80
 d4 cf                 jmp8	-0x31 <L4>
<L7>:
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 84              cmp32	q2, q1
 d8 0a                 bruge8	0xa <L8>
 c4 c0 7f              ldi16	r4, 0x7fc0
 f9 85                 or	r4, r1
 04                    mov	r5, r4
 f1 20                 mov	r4, r0
 d4 bc                 jmp8	-0x44 <L4>
<L8>:
 c0 21                 ldi8	r4, 0x21
 f0 5c 10 01           stm16	[0x110], r4
 c4 c0 7f              ldi16	r4, 0x7fc0
 f9 85                 or	r4, r1
 04                    mov	r5, r4
 f1 20                 mov	r4, r0
 d4 ac                 jmp8	-0x54 <L4>

<atan2f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f2 63                 mov32	q0, q3
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 ff 08                 fabs	q0
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 c0              cmp32	q3, q0
 d2 45                 brult8	0x45 <L0>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 0b                 fabs	q3
 f0 02 01              ldi8	r2, 0x1
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 c4              cmp32	q3, q1
 d8 35                 bruge8	0x35 <L0>
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 c4              cmp32	q3, q1
 d0 35                 breq8	0x35 <L1>
 f0 69 04              cmp32	q0, q1
 d0 56                 breq8	0x56 <L2>
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 c4              cmp32	q3, q1
 d1 60                 brne8	0x60 <L3>
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c4 c9 3f              ldi16	r4, 0x3fc9
 c5 49 3f              ldi16	r5, 0x3f49
 f0 69 04              cmp32	q0, q1
 fb 25                 cmov.eq	r4, r5
 c5 db 0f              ldi16	r5, 0xfdb
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 e0 75 01              jmp16	373 <L11>
<L0>:
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 00                 fadd
 e0 9a 01              jmp16	410 <L12>
<L1>:
 c6 00 80              ldi16	r6, 0x8000
 89                    and	r6, r5
 f2 30                 sub	r0, r0
 c7 49 40              ldi16	r7, 0x4049
 f0 05 49 c0           ldi16	r1, 0xc049
 f5 28                 cmp	r6, r0
 fb 79                 cmov.ne	r7, r1
 c6 db 0f              ldi16	r6, 0xfdb
 f2 39                 sub	r1, r1
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 69 40              cmp32	q1, q0
 fd 26                 cmov.slt	r4, r6
 fd 2f                 cmov.slt	r5, r7
 e0 74 01              jmp16	372 <L12>
<L2>:
 c4 00 80              ldi16	r4, 0x8000
 81                    and	r4, r5
 a5                    xor	r5, r5
 c6 c9 3f              ldi16	r6, 0x3fc9
 c7 c9 bf              ldi16	r7, 0xbfc9
 31                    cmp	r4, r5
 fb 77                 cmov.ne	r6, r7
 c4 db 0f              ldi16	r4, 0xfdb
 06                    mov	r5, r6
 e0 5f 01              jmp16	351 <L12>
<L3>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 69 04              cmp32	q0, q1
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f2 69                 mov32	q2, q1
 da 21 01              breq16	0x121 <L11>
 f0 69 0c              cmp32	q0, q3
 d8 34                 bruge8	0x34 <L4>
 f2 68                 mov32	q2, q0
 ff 03                 fdiv
 09                    mov	r6, r5
 c7 ff 3e              ldi16	r7, 0x3eff
 3e                    cmp	r7, r6
 d2 5f                 brult8	0x5f <L5>
 c7 7f 3e              ldi16	r7, 0x3e7f
 3e                    cmp	r7, r6
 dc a5 00              brult16	0xa5 <L7>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 ff 15 04 16 15 05 be 3e 59 4c 3e 46 aa aa be 00 00 80 3f      fpoly	4, -0.129963249, 0.199559182, -0.333330333, 1.0
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 e0 de 00              jmp16	222 <L10>
<L4>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 03                 fdiv
 09                    mov	r6, r5
 c7 ff 3e              ldi16	r7, 0x3eff
 3e                    cmp	r7, r6
 d2 50                 brult8	0x50 <L6>
 c7 7f 3e              ldi16	r7, 0x3e7f
 3e                    cmp	r7, r6
 dc 8e 00              brult16	0x8e <L8>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 ff 15 04 16 15 05 be 3e 59 4c 3e 46 aa aa be 00 00 80 3f      fpoly	4, -0.129963249, 0.199559182, -0.333330333, 1.0
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 e0 b2 00              jmp16	178 <L11>
<L5>:
 c7 3f 3f              ldi16	r7, 0x3f3f
 3e                    cmp	r7, r6
 dc 84 00              brult16	0x84 <L9>
 aa                    xor	r6, r6
 c7 20 bf              ldi16	r7, 0xbf20
 ff 00                 fadd
 ff 15 05 a1 71 d1 3d c3 37 9c 3c ed 79 a5 be fd 17 38 3f 5e 00 0f 3f  fpoly	5, 0.102267511, 0.019069558, -0.323195845, 0.719116032, 0.558599353
 e0 81 00              jmp16	129 <L10>
<L6>:
 c7 3f 3f              ldi16	r7, 0x3f3f
 3e                    cmp	r7, r6
 dc b9 00              brult16	0xb9 <L13>
 aa                    xor	r6, r6
 c7 20 bf              ldi16	r7, 0xbf20
 ff 00                 fadd
 ff 15 05 a1 71 d1 3d c3 37 9c 3c ed 79 a5 be fd 17 38 3f 5e 00 0f 3f  fpoly	5, 0.102267511, 0.019069558, -0.323195845, 0.719116032, 0.558599353
 d4 65                 jmp8	0x65 <L11>
<L7>:
 aa                    xor	r6, r6
 c7 c0 be              ldi16	r7, 0xbec0
 ff 00                 fadd
 ff 15 05 29 9e 3f 3e ad d1 05 be 09 8f 93 be 92 70 60 3f c7 b0 b7 3e  fpoly	5, 0.187126771, -0.130682662, -0.288200647, 0.876717686, 0.358770579
 d4 3c                 jmp8	0x3c <L10>
<L8>:
 aa                    xor	r6, r6
 c7 c0 be              ldi16	r7, 0xbec0
 ff 00                 fadd
 ff 15 05 29 9e 3f 3e ad d1 05 be 09 8f 93 be 92 70 60 3f c7 b0 b7 3e  fpoly	5, 0.187126771, -0.130682662, -0.288200647, 0.876717686, 0.358770579
 d4 27                 jmp8	0x27 <L11>
<L9>:
 aa                    xor	r6, r6
 c7 60 bf              ldi16	r7, 0xbf60
 ff 00                 fadd
 ff 15 05 d6 da b4 3c 79 68 9e 3d 96 b6 8f be 42 fe 10 3f 3f 05 38 3f  fpoly	5, 0.0220770054, 0.0773477033, -0.280689895, 0.566379666, 0.718830049
<L10>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 c4 db 0f              ldi16	r4, 0xfdb
 c5 c9 3f              ldi16	r5, 0x3fc9
 ff 01                 fsub
<L11>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 c4 db 0f              ldi16	r4, 0xfdb
 c5 49 40              ldi16	r5, 0x4049
 ff 01                 fsub
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f0 69 04              cmp32	q0, q1
 fd 34                 cmov.slt	r6, r4
 fd 3d                 cmov.slt	r7, r5
 f0 04 00 80           ldi16	r0, 0x8000
 f4 09                 ldsp16	r5, [sp+0x2]
 f9 14                 and	r0, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 0a                 fabs	q2
 f2 66                 mov32	q1, q2
 ff 05                 fneg	q1
 aa                    xor	r6, r6
 f5 06                 cmp	r0, r6
 fb 62                 cmov.ne	r4, r2
 fb 6b                 cmov.ne	r5, r3
<L12>:
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L13>:
 aa                    xor	r6, r6
 c7 60 bf              ldi16	r7, 0xbf60
 ff 00                 fadd
 ff 15 05 d6 da b4 3c 79 68 9e 3d 96 b6 8f be 42 fe 10 3f 3f 05 38 3f  fpoly	5, 0.0220770054, 0.0773477033, -0.280689895, 0.566379666, 0.718830049
 d4 ac                 jmp8	-0x54 <L11>

<hypotf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f2 66                 mov32	q1, q2
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 ff 0b                 fabs	q3
 a0                    xor	r4, r4
 c5 80 de              ldi16	r5, 0xde80
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 ff 09                 fabs	q1
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f7 66                 add32	q1, q2
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 3b           ldi16	r1, 0x3bff
 f0 69 04              cmp32	q0, q1
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 3b           ldi16	r3, 0x3bff
 d2 26                 brult8	0x26 <L1>
 f7 6b                 add32	q2, q3
 f0 69 48              cmp32	q1, q2
 d2 1f                 brult8	0x1f <L1>
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 ff 16                 fsqrt
<L0>:
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L1>:
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f0 69 04              cmp32	q0, q1
 d0 e0                 breq8	-0x20 <L0>
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 69 c4              cmp32	q3, q1
 d0 d7                 breq8	-0x29 <L0>
 f0 69 40              cmp32	q1, q0
 d2 1c                 brult8	0x1c <L2>
 c0 01                 ldi8	r4, 0x1
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 c8              cmp32	q3, q2
 d8 12                 bruge8	0x12 <L2>
 f0 69 0c              cmp32	q0, q3
 d8 13                 bruge8	0x13 <L3>
 f2 64                 mov32	q1, q0
 02                    mov	r4, r6
 07                    mov	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 d0 b8                 breq8	-0x48 <L0>
 d4 19                 jmp8	0x19 <L4>
<L2>:
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 d4 b0                 jmp8	-0x50 <L0>
<L3>:
 f2 67                 mov32	q1, q3
 f2 68                 mov32	q2, q0
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f2 63                 mov32	q0, q3
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 d0 9d                 breq8	-0x63 <L0>
<L4>:
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f2 6b                 mov32	q3, q1
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f7 7c                 sub32	q3, q0
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 06           ldi16	r1, 0x6ff
 f0 69 0c              cmp32	q0, q3
 dc 79 ff              brult16	-0x87 <L0>
 aa                    xor	r6, r6
 c7 80 5d              ldi16	r7, 0x5d80
 f0 69 4c              cmp32	q1, q3
 d2 5d                 brult8	0x5d <L5>
 aa                    xor	r6, r6
 c7 80 1d              ldi16	r7, 0x1d80
 f2 66                 mov32	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 ff 16                 fsqrt
 c2 04                 ldi8	r6, 0x4
 c7 80 a2              ldi16	r7, 0xa280
 f7 6e                 add32	q3, q2
 f0 00 08              ldi8	r0, 0x8
 f2 39                 sub	r1, r1
 f0 69 0c              cmp32	q0, q3
 d2 5e                 brult8	0x5e <L6>
 f2 62                 mov32	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e1 a7 00              call16	avm_hypot_overflows
 f4 a4                 tst8	r4
 db 95 00              brne16	0x95 <L8>
 c6 ff ff              ldi16	r6, 0xffff
 c7 7f 5d              ldi16	r7, 0x5d7f
 f2 68                 mov32	q2, q0
 f0 69 c8              cmp32	q3, q2
 d8 3f                 bruge8	0x3f <L6>
 c4 ff ff              ldi16	r4, 0xffff
 c5 7f 7f              ldi16	r5, 0x7f7f
 e0 13 ff              jmp16	-237 <L0>
<L5>:
 f2 62                 mov32	q0, q2
 c4 ff ff              ldi16	r4, 0xffff
 c1 7f                 ldi8	r5, 0x7f
 f0 69 84              cmp32	q2, q1
 d2 48                 brult8	0x48 <L7>
 aa                    xor	r6, r6
 c7 80 7e              ldi16	r7, 0x7e80
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 ff 16                 fsqrt
 aa                    xor	r6, r6
 c3 80                 ldi8	r7, 0x80
 ff 02                 fmul
 e0 dd fe              jmp16	-291 <L0>
<L6>:
 aa                    xor	r6, r6
 c7 80 61              ldi16	r7, 0x6180
 ff 02                 fmul
 c7 80 7f              ldi16	r7, 0x7f80
 8d                    and	r7, r5
 c6 80 80              ldi16	r6, 0x8080
 1b                    add	r6, r7
 c7 ff 80              ldi16	r7, 0x80ff
 3e                    cmp	r7, r6
 dc c8 fe              brult16	-0x138 <L0>
 c2 22                 ldi8	r6, 0x22
 f0 5e 10 01           stm16	[0x110], r6
 e0 bf fe              jmp16	-321 <L0>
<L7>:
 aa                    xor	r6, r6
 c7 80 61              ldi16	r7, 0x6180
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 ff 16                 fsqrt
 aa                    xor	r6, r6
 c7 80 1d              ldi16	r7, 0x1d80
 ff 02                 fmul
 e0 94 fe              jmp16	-364 <L0>
<L8>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 10 01           stm16	[0x110], r4
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 e0 87 fe              jmp16	-377 <L0>

<avm_hypot_overflows>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 dc                 adjsp	-0x24
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3d 16              stsp16	[sp+0x16], r5
 0b                    mov	r6, r7
 02                    mov	r4, r6
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 fa 77                 lsr16i	r4, 0x7
 c3 fe                 ldi8	r7, 0xfe
 2c                    sub	r7, r4
 cf 0c                 cmpi.s8	r7, 0xc
 dd 60 02              bruge16	0x260 <L2>
 f0 34 14              ldsp16	r4, [sp+0x14]
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f4 52                 stsp16	[sp+0x4], r6
 f3 12                 mulu8.w	r4, r6
 04                    mov	r5, r4
 08                    mov	r6, r4
 fa 87                 lsr16i	r5, 0x7
 f0 05 fe 01           ldi16	r1, 0x1fe
 f9 a4                 and	r5, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 f3 10                 mulu8.w	r4, r4
 f4 78                 stsp16	[sp+0xe], r4
 f0 00 fd              ldi8	r0, 0xfd
 f0 3f 1e              stsp16	[sp+0x1e], r7
 0c                    mov	r7, r4
 f9 e0                 and	r7, r0
 1d                    add	r7, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 02 7f              ldi8	r2, 0x7f
 f9 88                 and	r4, r2
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f9 88                 and	r4, r2
 f4 40                 stsp16	[sp+0x0], r4
 1a                    add	r6, r6
 f9 c4                 and	r6, r1
 f0 34 14              ldsp16	r4, [sp+0x14]
 04                    mov	r5, r4
 f3 15                 mulu8.w	r5, r5
 f0 3d 22              stsp16	[sp+0x22], r5
 fa 88                 lsr16i	r5, 0x8
 16                    add	r5, r6
 f0 3d 18              stsp16	[sp+0x18], r5
 fa 88                 lsr16i	r5, 0x8
 17                    add	r5, r7
 f4 69                 stsp16	[sp+0xa], r5
 c1 80                 ldi8	r5, 0x80
 f4 02                 ldsp16	r6, [sp+0x0]
 02                    mov	r4, r6
 91                    or	r4, r5
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 99                    or	r6, r5
 f0 3e 10              stsp16	[sp+0x10], r6
 08                    mov	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 0e                    mov	r7, r6
 f0 34 14              ldsp16	r4, [sp+0x14]
 f3 1c                 mulu8.w	r7, r4
 f4 73                 stsp16	[sp+0xc], r7
 03                    mov	r4, r7
 fa 77                 lsr16i	r4, 0x7
 f9 84                 and	r4, r1
 f4 3b                 ldsp16	r7, [sp+0xe]
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 02                    mov	r4, r6
 f4 11                 ldsp16	r5, [sp+0x4]
 f3 11                 mulu8.w	r4, r5
 f4 50                 stsp16	[sp+0x4], r4
 10                    add	r4, r4
 f9 84                 and	r4, r1
 13                    add	r4, r7
 f0 3c 14              stsp16	[sp+0x14], r4
 f4 31                 ldsp16	r5, [sp+0xc]
 15                    add	r5, r5
 f9 a4                 and	r5, r1
 f4 28                 ldsp16	r4, [sp+0xa]
 14                    add	r5, r4
 f4 71                 stsp16	[sp+0xc], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 08                    mov	r6, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f3 18                 mulu8.w	r6, r4
 f0 3e 1c              stsp16	[sp+0x1c], r6
 02                    mov	r4, r6
 fa 77                 lsr16i	r4, 0x7
 f9 84                 and	r4, r1
 f4 1a                 ldsp16	r6, [sp+0x6]
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 79                 stsp16	[sp+0xe], r5
 f3 15                 mulu8.w	r5, r5
 0d                    mov	r7, r5
 09                    mov	r6, r5
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 f4 30                 ldsp16	r4, [sp+0xc]
 fa 78                 lsr16i	r4, 0x8
 f0 35 14              ldsp16	r5, [sp+0x14]
 11                    add	r4, r5
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 f4 39                 ldsp16	r5, [sp+0xe]
 f3 11                 mulu8.w	r4, r5
 f4 68                 stsp16	[sp+0xa], r4
 10                    add	r4, r4
 f9 84                 and	r4, r1
 13                    add	r4, r7
 f0 3c 20              stsp16	[sp+0x20], r4
 f9 c0                 and	r6, r0
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f4 18                 ldsp16	r4, [sp+0x6]
 08                    mov	r6, r4
 f4 38                 ldsp16	r4, [sp+0xe]
 f3 18                 mulu8.w	r6, r4
 0e                    mov	r7, r6
 fa a7                 lsr16i	r7, 0x7
 f9 e4                 and	r7, r1
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 1c                    add	r7, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 fa 77                 lsr16i	r4, 0x7
 f9 84                 and	r4, r1
 f4 50                 stsp16	[sp+0x4], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f6 30                 mul8	r4, r4
 f4 11                 ldsp16	r5, [sp+0x4]
 11                    add	r4, r5
 f0 3c 1a              stsp16	[sp+0x1a], r4
 1a                    add	r6, r6
 f9 c4                 and	r6, r1
 f4 18                 ldsp16	r4, [sp+0x6]
 f3 10                 mulu8.w	r4, r4
 04                    mov	r5, r4
 f9 a0                 and	r5, r0
 f4 51                 stsp16	[sp+0x4], r5
 fa 78                 lsr16i	r4, 0x8
 12                    add	r4, r6
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 10                    add	r4, r4
 f9 84                 and	r4, r1
 12                    add	r4, r6
 f0 3c 1c              stsp16	[sp+0x1c], r4
 fa 78                 lsr16i	r4, 0x8
 f0 35 20              ldsp16	r5, [sp+0x20]
 11                    add	r4, r5
 f4 78                 stsp16	[sp+0xe], r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 fa 78                 lsr16i	r4, 0x8
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 11                    add	r4, r5
 f4 29                 ldsp16	r5, [sp+0xa]
 fa 87                 lsr16i	r5, 0x7
 f9 a4                 and	r5, r1
 f0 36 10              ldsp16	r6, [sp+0x10]
 f6 3a                 mul8	r6, r6
 19                    add	r6, r5
 f4 6a                 stsp16	[sp+0xa], r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f3 1a                 mulu8.w	r6, r6
 f4 42                 stsp16	[sp+0x0], r6
 c6 00 07              ldi16	r6, 0x700
 04                    mov	r5, r4
 86                    and	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 16                    add	r5, r6
 f4 41                 stsp16	[sp+0x0], r5
 f1 74                 zext8	r4
 f0 05 00 3f           ldi16	r1, 0x3f00
 f9 a4                 and	r5, r1
 94                    or	r5, r4
 f4 38                 ldsp16	r4, [sp+0xe]
 fa 78                 lsr16i	r4, 0x8
 f4 2a                 ldsp16	r6, [sp+0xa]
 12                    add	r4, r6
 f0 36 10              ldsp16	r6, [sp+0x10]
 f3 1a                 mulu8.w	r6, r6
 c7 00 07              ldi16	r7, 0x700
 8c                    and	r7, r4
 1e                    add	r7, r6
 f4 6b                 stsp16	[sp+0xa], r7
 f9 3c                 and	r1, r7
 f1 74                 zext8	r4
 f9 85                 or	r4, r1
 15                    add	r5, r5
 15                    add	r5, r5
 f0 36 14              ldsp16	r6, [sp+0x14]
 fa 58                 lsl16i	r6, 0x8
 f4 33                 ldsp16	r7, [sp+0xc]
 f1 77                 zext8	r7
 9e                    or	r7, r6
 fa 9e                 lsr16i	r6, 0xe
 99                    or	r6, r5
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 35 18              ldsp16	r5, [sp+0x18]
 fa 48                 lsl16i	r5, 0x8
 1f                    add	r7, r7
 1f                    add	r7, r7
 f0 3d 18              stsp16	[sp+0x18], r5
 fa 8e                 lsr16i	r5, 0xe
 97                    or	r5, r7
 f4 71                 stsp16	[sp+0xc], r5
 10                    add	r4, r4
 10                    add	r4, r4
 f4 39                 ldsp16	r5, [sp+0xe]
 fa 48                 lsl16i	r5, 0x8
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 f1 77                 zext8	r7
 9d                    or	r7, r5
 fa 8e                 lsr16i	r5, 0xe
 94                    or	r5, r4
 f4 79                 stsp16	[sp+0xe], r5
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 fa 38                 lsl16i	r4, 0x8
 1f                    add	r7, r7
 1f                    add	r7, r7
 09                    mov	r6, r5
 98                    or	r6, r4
 fa 7e                 lsr16i	r4, 0xe
 93                    or	r4, r7
 f4 58                 stsp16	[sp+0x6], r4
 1a                    add	r6, r6
 1a                    add	r6, r6
 f4 52                 stsp16	[sp+0x4], r6
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f4 03                 ldsp16	r7, [sp+0x0]
 fa ae                 lsr16i	r7, 0xe
 f4 28                 ldsp16	r4, [sp+0xa]
 fa 7e                 lsr16i	r4, 0xe
 f4 68                 stsp16	[sp+0xa], r4
 ce 08                 cmpi.s8	r6, 0x8
 1a                    add	r6, r6
 d2 0d                 brult8	0xd <L0>
 a0                    xor	r4, r4
 f0 3c 10              stsp16	[sp+0x10], r4
 ca f0                 addi.s8	r6, -0x10
 f4 30                 ldsp16	r4, [sp+0xc]
 f0 3c 18              stsp16	[sp+0x18], r4
 d4 19                 jmp8	0x19 <L1>
<L0>:
 f0 34 22              ldsp16	r4, [sp+0x22]
 f9 80                 and	r4, r0
 f0 35 18              ldsp16	r5, [sp+0x18]
 94                    or	r5, r4
 15                    add	r5, r5
 15                    add	r5, r5
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 37 14              ldsp16	r7, [sp+0x14]
 f4 30                 ldsp16	r4, [sp+0xc]
 f0 3c 14              stsp16	[sp+0x14], r4
<L1>:
 f0 3e 1e              stsp16	[sp+0x1e], r6
 c4 ff ff              ldi16	r4, 0xffff
 a2                    xor	r4, r6
 c1 0f                 ldi8	r5, 0xf
 84                    and	r5, r4
 f4 71                 stsp16	[sp+0xc], r5
 03                    mov	r4, r7
 f4 40                 stsp16	[sp+0x0], r4
 10                    add	r4, r4
 fa 01                 shl16v	r4, r5
 c1 0e                 ldi8	r5, 0xe
 86                    and	r5, r6
 f0 37 14              ldsp16	r7, [sp+0x14]
 fa 1d                 lsr16v	r7, r5
 9c                    or	r7, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 fa 11                 lsr16v	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 10                    add	r4, r4
 f4 32                 ldsp16	r6, [sp+0xc]
 fa 02                 shl16v	r4, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 92                    or	r4, r6
 f4 40                 stsp16	[sp+0x0], r4
 f1 17                 mov	r2, r7
 f2 4b                 sub	r3, r3
 f0 34 14              ldsp16	r4, [sp+0x14]
 f4 1a                 ldsp16	r6, [sp+0x6]
 f1 06                 mov	r0, r6
 f2 39                 sub	r1, r1
 f7 61                 add32	q0, q1
 f0 36 18              ldsp16	r6, [sp+0x18]
 fa 19                 lsr16v	r6, r5
 10                    add	r4, r4
 f4 31                 ldsp16	r5, [sp+0xc]
 fa 01                 shl16v	r4, r5
 92                    or	r4, r6
 f4 11                 ldsp16	r5, [sp+0x4]
 14                    add	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 34                    cmp	r5, r4
 f8 15                 cset.ult	r5
 09                    mov	r6, r5
 af                    xor	r7, r7
 f7 6c                 add32	q3, q0
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 14                 mov	r2, r4
 f4 38                 ldsp16	r4, [sp+0xe]
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f7 61                 add32	q0, q1
 f0 35 10              ldsp16	r5, [sp+0x10]
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 fa 14                 lsr16v	r5, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 14                    add	r5, r4
 f0 3d 10              stsp16	[sp+0x10], r5
 03                    mov	r4, r7
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f1 05                 mov	r0, r5
 f0 35 10              ldsp16	r5, [sp+0x10]
 f2 05                 add	r0, r5
 f0 0c 03              cmpi.s8	r0, 0x3
 d1 07                 brne8	0x7 <L3>
 cc ff                 cmpi.s8	r4, -0x1
 d0 0f                 breq8	0xf <L5>
<L2>:
 a0                    xor	r4, r4
 d4 05                 jmp8	0x5 <L4>
<L3>:
 f0 0c 04              cmpi.s8	r0, 0x4
 f8 1c                 cset.uge	r4
<L4>:
 d6 24                 adjsp	0x24
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L5>:
 c4 00 fc              ldi16	r4, 0xfc00
 38                    cmp	r6, r4
 d1 08                 brne8	0x8 <L6>
 f4 10                 ldsp16	r4, [sp+0x4]
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 d4 eb                 jmp8	-0x15 <L4>
<L6>:
 32                    cmp	r4, r6
 f8 14                 cset.ult	r4
 d4 e6                 jmp8	-0x1a <L4>

<atanhf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 f2 6a                 mov32	q3, q0
 ff 0b                 fabs	q3
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 f0 69 8c              cmp32	q2, q3
 d2 25                 brult8	0x25 <L0>
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 ff 15 05 3a 6b 32 3e 3a 32 07 3e 0e 60 4d 3e 16 aa aa 3e 00 00 80 3f  fpoly	5, 0.174237162, 0.132027537, 0.200561732, 0.333328903, 1.0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 d4 38                 jmp8	0x38 <L2>
<L0>:
 c0 01                 ldi8	r4, 0x1
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 c8              cmp32	q3, q2
 d2 08                 brult8	0x8 <L1>
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 d4 26                 jmp8	0x26 <L2>
<L1>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f0 69 c8              cmp32	q3, q2
 d8 22                 bruge8	0x22 <L3>
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 00                 fadd
 f2 6b                 mov32	q3, q1
 ff 03                 fdiv
 e1 d1 f7              call16	log1pf
 f0 04 00 80           ldi16	r0, 0x8000
 f9 04                 and	r0, r1
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 02                 fmul
 f9 a1                 or	r5, r0
<L2>:
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L3>:
 f0 00 21              ldi8	r0, 0x21
 f0 02 22              ldi8	r2, 0x22
 f0 69 c8              cmp32	q3, q2
 fb 02                 cmov.eq	r0, r2
 f0 58 10 01           stm16	[0x110], r0
 d1 13                 brne8	0x13 <L4>
 c4 00 80              ldi16	r4, 0x8000
 f9 84                 and	r4, r1
 a5                    xor	r5, r5
 c6 80 7f              ldi16	r6, 0x7f80
 c7 80 ff              ldi16	r7, 0xff80
 31                    cmp	r4, r5
 fb 77                 cmov.ne	r6, r7
 06                    mov	r5, r6
 a0                    xor	r4, r4
 d4 d7                 jmp8	-0x29 <L2>
<L4>:
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 d4 d1                 jmp8	-0x2f <L2>
