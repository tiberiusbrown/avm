
stdlib_atol.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 stdlib_atol.c
00000100 l     O .data	00000003 call
00000103 l     O .data	00000004 result_sink
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 stdlib.c
00000000 l    df *ABS*	00000000 avm.c
00000000 l    df *ABS*	00000000 ctype.c
00000000 l    df *ABS*	00000000 strtof.c
00000000 l    df *ABS*	00000000 strtof_internal.c
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 integer.c
00000000 l    df *ABS*	00000000 wide_integer.c
0000055d l       .init_array	00000000 .hidden __init_array_end
0000055d l       .init_array	00000000 .hidden __init_array_start
0000055d l       .fini_array	00000000 .hidden __fini_array_start
0000055d l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	00000098 avm_test_main
00000407 g     F .text	00000065 __avm_terminate
000002ff g     F .text	00000002 avm_halt
00000301 g     F .text	000000fa atol
000003fb g     F .text	0000000c isspace
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000139 g     O .data	00000002 __avm_errno
000004d4 g     F .text	00000072 __avm_udivmodsi4
0000046c g     F .text	00000068 __avm_mulsi3
00000546 g     F .text	00000017 __avm_umodsi3

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
 e1 f1 01              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 dc 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 5d 05              ldi16	r4, 0x55d
 c1 00                 ldi8	r5, 0x0
 c6 5d 05              ldi16	r6, 0x55d
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 5d 05           ldi16	r0, 0x55d
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 5d 05           ldi16	r2, 0x55d
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
 d6 fe                 adjsp	-0x2
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 c0 10                 ldi8	r4, 0x10
 d7 01                 sys	debug_break
<L0>:
 f4 40                 stsp16	[sp+0x0], r4
 c4 00 01              ldi16	r4, 0x100
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 c4 07 01              ldi16	r4, 0x107
 eb                    callp	q3
 f2 66                 mov32	q1, q2
 f7 64                 add32	q1, q0
 c4 00 01              ldi16	r4, 0x100
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 c4 09 01              ldi16	r4, 0x109
 eb                    callp	q3
 f2 62                 mov32	q0, q2
 f7 61                 add32	q0, q1
 c4 00 01              ldi16	r4, 0x100
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 c4 0c 01              ldi16	r4, 0x10c
 eb                    callp	q3
 f2 66                 mov32	q1, q2
 f7 64                 add32	q1, q0
 c4 00 01              ldi16	r4, 0x100
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 c4 11 01              ldi16	r4, 0x111
 eb                    callp	q3
 f2 62                 mov32	q0, q2
 f7 61                 add32	q0, q1
 c4 00 01              ldi16	r4, 0x100
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 c4 18 01              ldi16	r4, 0x118
 eb                    callp	q3
 f2 66                 mov32	q1, q2
 f7 64                 add32	q1, q0
 c4 00 01              ldi16	r4, 0x100
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 c4 23 01              ldi16	r4, 0x123
 eb                    callp	q3
 f2 62                 mov32	q0, q2
 f7 61                 add32	q0, q1
 c4 00 01              ldi16	r4, 0x100
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 c4 2f 01              ldi16	r4, 0x12f
 eb                    callp	q3
 f2 66                 mov32	q1, q2
 f7 64                 add32	q1, q0
 c4 00 01              ldi16	r4, 0x100
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 c4 30 01              ldi16	r4, 0x130
 eb                    callp	q3
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f7 61                 add32	q0, q1
 f4 b4                 dec16	r4
 f4 a4                 tst8	r4
 d1 86                 brne8	-0x7a <L0>
 c4 03 01              ldi16	r4, 0x103
 f0 6b 08              st32	[r4], q0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<atol>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 f1 14                 mov	r2, r4
<L0>:
 f1 1a                 mov	r3, r2
 f0 6c 85              ld8u	r4, [r2+]
 e1 ea 00              call16	isspace
 f6 2c                 tst16	r4
 d1 f4                 brne8	-0xc <L0>
 ed 86 20              ld8u	r4, [r3+0]
 cc 2b                 cmpi.s8	r4, 0x2b
 f2 39                 sub	r1, r1
 c1 01                 ldi8	r5, 0x1
 d0 0f                 breq8	0xf <L1>
 cc 2d                 cmpi.s8	r4, 0x2d
 d1 17                 brne8	0x17 <L2>
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f1 1a                 mov	r3, r2
 f0 39 04              stsp16	[sp+0x4], r1
 d4 14                 jmp8	0x14 <L3>
<L1>:
 f4 51                 stsp16	[sp+0x4], r5
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff 7f              ldi16	r5, 0x7fff
 f1 1a                 mov	r3, r2
 d4 08                 jmp8	0x8 <L3>
<L2>:
 f4 51                 stsp16	[sp+0x4], r5
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff 7f              ldi16	r5, 0x7fff
<L3>:
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 e1 f9 01              call16	__avm_umodsi3
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f1 01                 mov	r0, r1
 d4 0c                 jmp8	0xc <L7>
<L4>:
 f0 01 01              ldi8	r1, 0x1
 08                    mov	r6, r4
 0d                    mov	r7, r5
<L5>:
 f0 30 0a              ldsp16	r0, [sp+0xa]
<L6>:
 f4 b0                 dec16	r0
 f4 ab                 inc16	r3
<L7>:
 ed 46 20              ld8u	r2, [r3+0]
 f1 22                 mov	r4, r2
 c8 d0                 addi.s8	r4, -0x30
 f1 74                 zext8	r4
 cc 0a                 cmpi.s8	r4, 0xa
 d8 05                 bruge8	0x5 <L8>
 f0 0a d0              addi.s8	r2, -0x30
 d4 1c                 jmp8	0x1c <L9>
<L8>:
 f1 22                 mov	r4, r2
 c8 9f                 addi.s8	r4, -0x61
 f1 74                 zext8	r4
 cc 1a                 cmpi.s8	r4, 0x1a
 d2 51                 brult8	0x51 <L12>
 f1 22                 mov	r4, r2
 c8 bf                 addi.s8	r4, -0x41
 f1 74                 zext8	r4
 cc 1a                 cmpi.s8	r4, 0x1a
 d8 47                 bruge8	0x47 <L12>
 f0 0a c9              addi.s8	r2, -0x37
 f0 0e 0a              cmpi.s8	r2, 0xa
 d8 3f                 bruge8	0x3f <L12>
<L9>:
 f0 39 0c              stsp16	[sp+0xc], r1
 f0 01 01              ldi8	r1, 0x1
 c4 cc cc              ldi16	r4, 0xcccc
 c5 cc 0c              ldi16	r5, 0xccc
 f0 69 8c              cmp32	q2, q3
 d2 bd                 brult8	-0x43 <L6>
 f0 38 0a              stsp16	[sp+0xa], r0
 f2 63                 mov32	q0, q3
 f0 69 c8              cmp32	q3, q2
 d1 06                 brne8	0x6 <L10>
 f4 1a                 ldsp16	r6, [sp+0x6]
 f5 2a                 cmp	r6, r2
 d2 a5                 brult8	-0x5b <L4>
<L10>:
 f4 30                 ldsp16	r4, [sp+0xc]
 f6 2c                 tst16	r4
 f2 6a                 mov32	q3, q0
 d0 05                 breq8	0x5 <L11>
 f0 01 01              ldi8	r1, 0x1
 d4 9d                 jmp8	-0x63 <L5>
<L11>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 e1 a5 00              call16	__avm_mulsi3
 f1 2a                 mov	r6, r2
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f2 39                 sub	r1, r1
 d4 8c                 jmp8	-0x74 <L5>
<L12>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f6 28                 tst16	r0
 f2 66                 mov32	q1, q2
 d0 12                 breq8	0x12 <L13>
 f6 29                 tst16	r1
 f2 67                 mov32	q1, q3
 d0 0c                 breq8	0xc <L13>
 c2 22                 ldi8	r6, 0x22
 f0 5e 39 01           stm16	[0x139], r6
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
<L13>:
 f7 79                 sub32	q2, q1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 a6                 tst8	r6
 fb 62                 cmov.ne	r4, r2
 fb 6b                 cmov.ne	r5, r3
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<isspace>:
 cc 20                 cmpi.s8	r4, 0x20
 f8 05                 cset.eq	r5
 c8 f7                 addi.s8	r4, -0x9
 cc 05                 cmpi.s8	r4, 0x5
 f8 14                 cset.ult	r4
 91                    or	r4, r5
 ef                    ret

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
 e1 e4 fb              call16	-1052 <__avm_run_local_dtors>
<L0>:
 c4 5d 05              ldi16	r4, 0x55d
 c1 00                 ldi8	r5, 0x0
 c6 5d 05              ldi16	r6, 0x55d
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 5d 05           ldi16	r2, 0x55d
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 5d 05           ldi16	r0, 0x55d
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
 e1 9b fb              call16	-1125 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_mulsi3>:
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f1 05                 mov	r0, r5
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 f2 24                 add	r5, r0
 f4 61                 stsp16	[sp+0x8], r5
 06                    mov	r5, r6
 fa 8f                 lsr16i	r5, 0xf
 17                    add	r5, r7
 fe 2c                 mul16	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 21                 ldsp16	r5, [sp+0x8]
 fe 2e                 mul16	r5, r6
 f4 61                 stsp16	[sp+0x8], r5
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 51                 stsp16	[sp+0x4], r5
 f1 76                 zext8	r6
 04                    mov	r5, r4
 f1 75                 zext8	r5
 0d                    mov	r7, r5
 f3 1e                 mulu8.w	r7, r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 13                 ldsp16	r7, [sp+0x4]
 f3 3d                 mulsu8.w	r7, r5
 f4 43                 stsp16	[sp+0x0], r7
 fa 78                 lsr16i	r4, 0x8
 f4 11                 ldsp16	r5, [sp+0x4]
 0c                    mov	r7, r4
 f3 2d                 muls8.w	r7, r5
 f3 32                 mulsu8.w	r4, r6
 04                    mov	r5, r4
 fa c8                 asr16i	r5, 0x8
 17                    add	r5, r7
 f4 03                 ldsp16	r7, [sp+0x0]
 0b                    mov	r6, r7
 fa d8                 asr16i	r6, 0x8
 19                    add	r6, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 19                    add	r6, r5
 f4 62                 stsp16	[sp+0x8], r6
 1c                    add	r7, r4
 fa 38                 lsl16i	r4, 0x8
 f4 19                 ldsp16	r5, [sp+0x6]
 08                    mov	r6, r4
 19                    add	r6, r5
 06                    mov	r5, r6
 34                    cmp	r5, r4
 f8 14                 cset.ult	r4
 f4 22                 ldsp16	r6, [sp+0x8]
 12                    add	r4, r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 12                    add	r4, r6
 fa 68                 lsl16i	r7, 0x8
 f4 1a                 ldsp16	r6, [sp+0x6]
 1e                    add	r7, r6
 3d                    cmp	r7, r5
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 03                    mov	r4, r7
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<__avm_udivmodsi4>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f2 63                 mov32	q0, q3
 f0 36 17              ldsp16	r6, [sp+0x17]
 f4 42                 stsp16	[sp+0x0], r6
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 d0 46                 breq8	0x46 <L1>
 c2 20                 ldi8	r6, 0x20
 f4 6a                 stsp16	[sp+0xa], r6
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f2 67                 mov32	q1, q3
 f0 38 02              stsp16	[sp+0x2], r0
 f0 39 04              stsp16	[sp+0x4], r1
 f2 63                 mov32	q0, q3
<L0>:
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f7 65                 add32	q1, q1
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f9 c9                 or	r6, r2
 f1 16                 mov	r2, r6
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f0 69 48              cmp32	q1, q2
 aa                    xor	r6, r6
 fc 74                 cmov.uge	r6, r4
 fc 7d                 cmov.uge	r7, r5
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f7 77                 sub32	q1, q3
 f8 1e                 cset.uge	r6
 f7 60                 add32	q0, q0
 f9 c1                 or	r6, r0
 f7 6a                 add32	q2, q2
 f1 06                 mov	r0, r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 b6                 dec16	r6
 f4 6a                 stsp16	[sp+0xa], r6
 f6 2e                 tst16	r6
 d1 cc                 brne8	-0x34 <L0>
 d4 0a                 jmp8	0xa <L2>
<L1>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f2 66                 mov32	q1, q2
<L2>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 6b 48              st32	[r4], q1
 f2 68                 mov32	q2, q0
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_umodsi3>:
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 d6 fe                 adjsp	-0x2
 f0 10 02              leasp	r0, 0x2
 f0 38 00              stsp16	[sp+0x0], r0
 d5 81                 call8	__avm_udivmodsi4
 d6 02                 adjsp	0x2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 ef                    ret
