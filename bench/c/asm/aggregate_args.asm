
aggregate_args.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 aggregate_args.c
00000100 l     O .data	00000080 items
00000372 l     F .text	0000004c combine
00000180 l     O .data	00000004 aggregate_args_result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 integer.c
000004b6 l       .init_array	00000000 .hidden __init_array_end
000004b6 l       .init_array	00000000 .hidden __init_array_start
000004b6 l       .fini_array	00000000 .hidden __fini_array_start
000004b6 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	000000ab avm_test_main
000003be g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000003c0 g     F .text	00000076 __avm_mulsi3

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
 e1 a0 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 b6 04              ldi16	r4, 0x4b6
 c1 00                 ldi8	r5, 0x0
 c6 b6 04              ldi16	r6, 0x4b6
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 b6 04           ldi16	r0, 0x4b6
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 b6 04           ldi16	r2, 0x4b6
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
 c4 b6 04              ldi16	r4, 0x4b6
 c1 00                 ldi8	r5, 0x0
 c6 b6 04              ldi16	r6, 0x4b6
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 b6 04           ldi16	r2, 0x4b6
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 b6 04           ldi16	r0, 0x4b6
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
 d6 ea                 adjsp	-0x16
 c4 00 01              ldi16	r4, 0x100
 c6 36 04              ldi16	r6, 0x436
 c3 00                 ldi8	r7, 0x0
 c1 80                 ldi8	r5, 0x80
 d7 10                 sys	memcpy_p
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f2 39                 sub	r1, r1
 d7 01                 sys	debug_break
 c0 05                 ldi8	r4, 0x5
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 07 07 01           ldi16	r3, 0x107
<L0>:
 f0 04 00 01           ldi16	r0, 0x100
 f0 32 14              ldsp16	r2, [sp+0x14]
<L1>:
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 6a 80              ld32	q2, [r0]
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f1 20                 mov	r4, r0
 c8 04                 addi.s8	r4, 0x4
 f0 6a 88              ld32	q2, [r4]
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f1 26                 mov	r5, r2
 15                    add	r5, r5
 15                    add	r5, r5
 15                    add	r5, r5
 c0 78                 ldi8	r4, 0x78
 81                    and	r4, r5
 f2 23                 add	r4, r3
 ed a8 1f              ld8u	r5, [r4-1]
 f1 59                 stsp8	[sp+0xa], r5
 ed a8 1e              ld8u	r5, [r4-2]
 f1 55                 stsp8	[sp+0x9], r5
 ed a8 1d              ld8u	r5, [r4-3]
 f1 51                 stsp8	[sp+0x8], r5
 ed a8 1c              ld8u	r5, [r4-4]
 f1 4d                 stsp8	[sp+0x7], r5
 ed a8 1b              ld8u	r5, [r4-5]
 f1 49                 stsp8	[sp+0x6], r5
 ed a8 1a              ld8u	r5, [r4-6]
 f1 45                 stsp8	[sp+0x5], r5
 ed a8 19              ld8u	r5, [r4-7]
 f1 41                 stsp8	[sp+0x4], r5
 40                    ld8u	r4, [r4]
 f1 5c                 stsp8	[sp+0xb], r4
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 f4 0b                 ldsp16	r7, [sp+0x2]
 0b                    mov	r6, r7
 fa 54                 lsl16i	r6, 0x4
 98                    or	r6, r4
 f0 14 0c              leasp	r4, 0xc
 f0 15 04              leasp	r5, 0x4
 d5 2a                 call8	combine
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f7 6e                 add32	q3, q2
 f0 08 08              addi.s8	r0, 0x8
 f4 aa                 inc16	r2
 f0 0e 15              cmpi.s8	r2, 0x15
 d1 97                 brne8	-0x69 <L1>
 f4 a9                 inc16	r1
 f1 21                 mov	r4, r1
 f1 74                 zext8	r4
 cc 14                 cmpi.s8	r4, 0x14
 d1 86                 brne8	-0x7a <L0>
 c4 80 01              ldi16	r4, 0x180
 f0 6b c8              st32	[r4], q3
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 16                 adjsp	0x16
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
 f1 16                 mov	r2, r6
 f1 05                 mov	r0, r5
 f1 0c                 mov	r1, r4
 ed 82 27              ld8u	r4, [r1+7]
 f4 a4                 tst8	r4
 d0 0b                 breq8	0xb <L0>
 f0 6a 82              ld32	q2, [r1]
 ed d2 24              ld16	r6, [r1+4]
 af                    xor	r7, r7
 d5 34                 call8	__avm_mulsi3
 d4 03                 jmp8	0x3 <L1>
<L0>:
 f1 22                 mov	r4, r2
 a5                    xor	r5, r5
<L1>:
 ed c0 27              ld8u	r6, [r0+7]
 f4 a6                 tst8	r6
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
 fa 38                 lsl16i	r4, 0x8
 f1 14                 mov	r2, r4
 f2 4b                 sub	r3, r3
 f7 67                 add32	q1, q3
 ed 80 26              ld8u	r4, [r0+6]
 f7 69                 add32	q2, q1
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
 03                    mov	r4, r7
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
