
aggregate_args.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 aggregate_args.c
00000100 l     O .data	00000080 items
000003ae l     F .text	00000064 combine
00000180 l     O .data	00000004 aggregate_args_result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 integer.c
00000513 l       .init_array	00000000 .hidden __init_array_end
00000513 l       .init_array	00000000 .hidden __init_array_start
00000513 l       .fini_array	00000000 .hidden __fini_array_start
00000513 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	000000e7 avm_test_main
00000412 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000414 g     F .text	0000007f __avm_mulsi3

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
 e1 f4 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 13 05              ldi16	r4, 0x513
 c1 00                 ldi8	r5, 0x0
 c6 13 05              ldi16	r6, 0x513
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 13 05           ldi16	r0, 0x513
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 13 05           ldi16	r2, 0x513
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
 c4 13 05              ldi16	r4, 0x513
 c1 00                 ldi8	r5, 0x0
 c6 13 05              ldi16	r6, 0x513
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 13 05           ldi16	r2, 0x513
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 13 05           ldi16	r0, 0x513
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
 d6 e2                 adjsp	-0x1e
 f0 04 00 01           ldi16	r0, 0x100
 f1 20                 mov	r4, r0
 c6 93 04              ldi16	r6, 0x493
 c3 00                 ldi8	r7, 0x0
 c1 80                 ldi8	r5, 0x80
 d7 10                 sys	memcpy_p
 aa                    xor	r6, r6
 af                    xor	r7, r7
 a5                    xor	r5, r5
 d7 01                 sys	debug_break
 c0 05                 ldi8	r4, 0x5
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 05 04 01           ldi16	r1, 0x104
 f0 07 05 01           ldi16	r3, 0x105
<L0>:
 f0 3d 18              stsp16	[sp+0x18], r5
 f1 10                 mov	r2, r0
 f0 35 1a              ldsp16	r5, [sp+0x1a]
<L1>:
 f4 51                 stsp16	[sp+0x4], r5
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 15                    add	r5, r5
 15                    add	r5, r5
 15                    add	r5, r5
 c0 78                 ldi8	r4, 0x78
 81                    and	r4, r5
 f0 6a c4              ld32	q3, [r2]
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f1 26                 mov	r5, r2
 c9 04                 addi.s8	r5, 0x4
 f0 6a ca              ld32	q3, [r5]
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 08                    mov	r6, r4
 f2 29                 add	r6, r1
 f1 14                 mov	r2, r4
 f2 13                 add	r2, r3
 0c                    mov	r7, r4
 c5 07 01              ldi16	r5, 0x107
 1d                    add	r7, r5
 f4 5b                 stsp16	[sp+0x6], r7
 0c                    mov	r7, r4
 f2 2c                 add	r7, r0
 f1 04                 mov	r0, r4
 c5 01 01              ldi16	r5, 0x101
 f2 05                 add	r0, r5
 ed a0 25              ld8u	r5, [r0+5]
 f1 69                 stsp8	[sp+0xe], r5
 ed a4 20              ld8u	r5, [r2+0]
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f1 65                 stsp8	[sp+0xd], r5
 46                    ld8u	r5, [r6]
 f1 61                 stsp8	[sp+0xc], r5
 ed 80 22              ld8u	r4, [r0+2]
 f1 5c                 stsp8	[sp+0xb], r4
 ed 80 21              ld8u	r4, [r0+1]
 f0 07 05 01           ldi16	r3, 0x105
 f1 58                 stsp8	[sp+0xa], r4
 ed 80 20              ld8u	r4, [r0+0]
 f1 54                 stsp8	[sp+0x9], r4
 43                    ld8u	r4, [r7]
 f1 50                 stsp8	[sp+0x8], r4
 f4 18                 ldsp16	r4, [sp+0x6]
 40                    ld8u	r4, [r4]
 f1 6c                 stsp8	[sp+0xf], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 08                    mov	r6, r4
 fa 9c                 lsr16i	r6, 0xc
 01                    mov	r4, r5
 04                    mov	r5, r4
 fa 44                 lsl16i	r5, 0x4
 96                    or	r5, r6
 f1 05                 mov	r0, r5
 aa                    xor	r6, r6
 f9 c1                 or	r6, r0
 f0 05 04 01           ldi16	r1, 0x104
 f0 04 00 01           ldi16	r0, 0x100
 f0 14 10              leasp	r4, 0x10
 f0 15 08              leasp	r5, 0x8
 d5 2f                 call8	combine
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f7 6e                 add32	q3, q2
 f4 11                 ldsp16	r5, [sp+0x4]
 f0 0a 08              addi.s8	r2, 0x8
 f4 ad                 inc16	r5
 cd 15                 cmpi.s8	r5, 0x15
 db 65 ff              brne16	-0x9b <L1>
 f0 35 18              ldsp16	r5, [sp+0x18]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 14                 cmpi.s8	r4, 0x14
 db 50 ff              brne16	-0xb0 <L0>
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
 d0 0b                 breq8	0xb <L0>
 f0 6a 82              ld32	q2, [r1]
 ed d2 24              ld16	r6, [r1+4]
 af                    xor	r7, r7
 d5 4a                 call8	__avm_mulsi3
 d4 03                 jmp8	0x3 <L1>
<L0>:
 f1 22                 mov	r4, r2
 a5                    xor	r5, r5
<L1>:
 ed c0 27              ld8u	r6, [r0+7]
 f4 a6                 tst8	r6
 f0 38 00              stsp16	[sp+0x0], r0
 d0 0b                 breq8	0xb <L2>
 f0 6a 40              ld32	q1, [r0]
 ed d0 24              ld16	r6, [r0+4]
 af                    xor	r7, r7
 f7 6d                 add32	q3, q1
 d4 03                 jmp8	0x3 <L3>
<L2>:
 f1 2a                 mov	r6, r2
 af                    xor	r7, r7
<L3>:
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 ed 82 26              ld8u	r4, [r1+6]
 a5                    xor	r5, r5
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 fa 38                 lsl16i	r4, 0x8
 f1 14                 mov	r2, r4
 f2 4b                 sub	r3, r3
 01                    mov	r4, r5
 fa 38                 lsl16i	r4, 0x8
 f1 0c                 mov	r1, r4
 f2 30                 sub	r0, r0
 f9 09                 or	r0, r2
 f9 2d                 or	r1, r3
 f7 63                 add32	q0, q3
 f4 00                 ldsp16	r4, [sp+0x0]
 ed 88 26              ld8u	r4, [r4+6]
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
 d6 f4                 adjsp	-0xc
 f1 05                 mov	r0, r5
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 f2 24                 add	r5, r0
 f4 69                 stsp16	[sp+0xa], r5
 f1 07                 mov	r0, r7
 06                    mov	r5, r6
 fa 8f                 lsr16i	r5, 0xf
 f2 24                 add	r5, r0
 fe 2c                 mul16	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 29                 ldsp16	r5, [sp+0xa]
 fe 2e                 mul16	r5, r6
 f4 69                 stsp16	[sp+0xa], r5
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
 04                    mov	r5, r4
 f4 61                 stsp16	[sp+0x8], r5
 f4 11                 ldsp16	r5, [sp+0x4]
 0c                    mov	r7, r4
 f3 2d                 muls8.w	r7, r5
 f4 63                 stsp16	[sp+0x8], r7
 f3 32                 mulsu8.w	r4, r6
 04                    mov	r5, r4
 fa c8                 asr16i	r5, 0x8
 0b                    mov	r6, r7
 16                    add	r5, r6
 f4 03                 ldsp16	r7, [sp+0x0]
 0b                    mov	r6, r7
 fa d8                 asr16i	r6, 0x8
 19                    add	r6, r5
 f4 29                 ldsp16	r5, [sp+0xa]
 19                    add	r6, r5
 f4 62                 stsp16	[sp+0x8], r6
 1c                    add	r7, r4
 fa 38                 lsl16i	r4, 0x8
 04                    mov	r5, r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 19                 ldsp16	r5, [sp+0x6]
 08                    mov	r6, r4
 19                    add	r6, r5
 f4 6a                 stsp16	[sp+0xa], r6
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
 f1 0d                 mov	r1, r5
 f2 30                 sub	r0, r0
 03                    mov	r4, r7
 a5                    xor	r5, r5
 f9 81                 or	r4, r0
 f9 a5                 or	r5, r1
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
