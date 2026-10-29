
math_hypot_scaled.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000323 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 math_hypot_scaled.c
00000100 l     O .data	00000100 inputs
00000200 l     O .data	00000004 result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 ef_hypot.c
000005e0 l     F .text	000002a2 avm_hypot_overflows
00000000 l    df *ABS*	00000000 stdlib.c
00000000 l    df *ABS*	00000000 avm.c
00000000 l    df *ABS*	00000000 ctype.c
00000000 l    df *ABS*	00000000 strtof.c
00000000 l    df *ABS*	00000000 integer.c
00000000 l    df *ABS*	00000000 wide_integer.c
00000882 l       .init_array	00000000 .hidden __init_array_end
00000882 l       .init_array	00000000 .hidden __init_array_start
00000882 l       .fini_array	00000000 .hidden __fini_array_start
00000882 l       .fini_array	00000000 .hidden __fini_array_end
00000300 g     F .text	00000023 _start
00000367 g     F .text	00000042 avm_test_main
000003ab g     F .text	00000065 __avm_terminate
000003a9 g     F .text	00000002 avm_halt
00000410 g     F .text	000001d0 hypotf
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000204 g     O .data	00000002 __avm_errno

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
 e1 95 00              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 86 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 82 08              ldi16	r4, 0x882
 c1 00                 ldi8	r5, 0x0
 c6 82 08              ldi16	r6, 0x882
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 82 08           ldi16	r0, 0x882
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 82 08           ldi16	r2, 0x882
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
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f2 42                 sub	r2, r2
 d7 01                 sys	debug_break
 f0 07 00 01           ldi16	r3, 0x100
<L0>:
 f1 22                 mov	r4, r2
 c5 00 01              ldi16	r5, 0x100
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 f1 2a                 mov	r6, r2
 c7 04 01              ldi16	r7, 0x104
 1b                    add	r6, r7
 f0 6a cc              ld32	q3, [r6]
 e1 84 00              call16	hypotf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f0 0a 08              addi.s8	r2, 0x8
 f5 13                 cmp	r2, r3
 d1 dc                 brne8	-0x24 <L0>
 c4 00 02              ldi16	r4, 0x200
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
 e1 40 fc              call16	-960 <__avm_run_local_dtors>
<L0>:
 c4 82 08              ldi16	r4, 0x882
 c1 00                 ldi8	r5, 0x0
 c6 82 08              ldi16	r6, 0x882
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 82 08           ldi16	r2, 0x882
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 82 08           ldi16	r0, 0x882
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
 e1 f7 fb              call16	-1033 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

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
 ff 17                 fsqrt
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
 ff 17                 fsqrt
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
 e1 a8 00              call16	avm_hypot_overflows
 f4 a4                 tst8	r4
 db 96 00              brne16	0x96 <L8>
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
 d2 49                 brult8	0x49 <L7>
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
 ff 17                 fsqrt
 aa                    xor	r6, r6
 c3 80                 ldi8	r7, 0x80
 ff 02                 fmul
 e0 dd fe              jmp16	-291 <L0>
<L6>:
 aa                    xor	r6, r6
 c7 80 61              ldi16	r7, 0x6180
 ff 02                 fmul
 09                    mov	r6, r5
 c7 80 7f              ldi16	r7, 0x7f80
 8e                    and	r7, r6
 c6 80 80              ldi16	r6, 0x8080
 1b                    add	r6, r7
 c7 ff 80              ldi16	r7, 0x80ff
 3e                    cmp	r7, r6
 dc c7 fe              brult16	-0x139 <L0>
 c2 22                 ldi8	r6, 0x22
 f0 5e 04 02           stm16	[0x204], r6
 e0 be fe              jmp16	-322 <L0>
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
 ff 17                 fsqrt
 aa                    xor	r6, r6
 c7 80 1d              ldi16	r7, 0x1d80
 ff 02                 fmul
 e0 93 fe              jmp16	-365 <L0>
<L8>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 04 02           stm16	[0x204], r4
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 e0 86 fe              jmp16	-378 <L0>

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
