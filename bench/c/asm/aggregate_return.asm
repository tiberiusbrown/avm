
aggregate_return.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 aggregate_return.c
00000100 l     O .data	00000002 aggregate_seed
00000351 l     F .text	0000005f advance
00000102 l     O .data	00000004 aggregate_return_result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 integer.c
00000458 l       .init_array	00000000 .hidden __init_array_end
00000458 l       .init_array	00000000 .hidden __init_array_start
00000458 l       .fini_array	00000000 .hidden __fini_array_start
00000458 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	0000008a avm_test_main
000003b0 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000003b2 g     F .text	000000a6 __avm_mulsi3

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
 e1 92 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 58 04              ldi16	r4, 0x458
 c1 00                 ldi8	r5, 0x0
 c6 58 04              ldi16	r6, 0x458
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 58 04           ldi16	r0, 0x458
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 58 04           ldi16	r2, 0x458
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
 c4 58 04              ldi16	r4, 0x458
 c1 00                 ldi8	r5, 0x0
 c6 58 04              ldi16	r6, 0x458
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 58 04           ldi16	r2, 0x458
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 58 04           ldi16	r0, 0x458
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
 d6 dd                 adjsp	-0x23
 d7 01                 sys	debug_break
 c4 78 56              ldi16	r4, 0x5678
 c5 34 12              ldi16	r5, 0x1234
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 c0 07                 ldi8	r4, 0x7
 f0 2c 10              stsp8	[sp+0x10], r4
 c4 aa 55              ldi16	r4, 0x55aa
 f4 78                 stsp16	[sp+0xe], r4
 f0 54 00 01           ldm16	r4, [0x100]
 f4 70                 stsp16	[sp+0xc], r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 00 03              ldi8	r0, 0x3
 c6 03 01              ldi16	r6, 0x103
 f4 42                 stsp16	[sp+0x0], r6
<L0>:
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 12 08              leasp	r2, 0x8
 f0 17 11              leasp	r7, 0x11
 03                    mov	r4, r7
 f1 26                 mov	r5, r2
 f4 49                 stsp16	[sp+0x2], r5
 c2 09                 ldi8	r6, 0x9
 d7 0f                 sys	memcpy
 f0 11 1a              leasp	r1, 0x1a
 f1 21                 mov	r4, r1
 07                    mov	r5, r7
 f1 28                 mov	r6, r0
 d5 41                 call8	advance
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 c2 09                 ldi8	r6, 0x9
 d7 0f                 sys	memcpy
 f4 30                 ldsp16	r4, [sp+0xc]
 08                    mov	r6, r4
 af                    xor	r7, r7
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f7 6d                 add32	q3, q1
 f4 38                 ldsp16	r4, [sp+0xe]
 a5                    xor	r5, r5
 f7 6b                 add32	q2, q3
 f0 1e 10              ldsp8u	r6, [sp+0x10]
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 f4 a8                 inc16	r0
 f4 02                 ldsp16	r6, [sp+0x0]
 f5 06                 cmp	r0, r6
 d1 b6                 brne8	-0x4a <L0>
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 c6 02 01              ldi16	r6, 0x102
 f0 6b 4c              st32	[r6], q1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 23                 adjsp	0x23
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<advance>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 f1 16                 mov	r2, r6
 f1 0d                 mov	r1, r5
 f1 04                 mov	r0, r4
 af                    xor	r7, r7
 ed 72 24              ld16	r3, [r1+4]
 f1 23                 mov	r4, r3
 a5                    xor	r5, r5
 d5 4c                 call8	__avm_mulsi3
 f0 6a c2              ld32	q3, [r1]
 f7 6e                 add32	q3, q2
 02                    mov	r4, r6
 fa 79                 lsr16i	r4, 0x9
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 a5                    xor	r5, r5
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 fa 37                 lsl16i	r4, 0x7
 f4 01                 ldsp16	r5, [sp+0x0]
 91                    or	r4, r5
 f2 1a                 add	r3, r2
 ed a2 28              ld8u	r5, [r1+8]
 f2 1d                 add	r3, r5
 f2 26                 add	r5, r2
 ee a2 28              st8	[r1+8], r5
 ee 72 24              st16	[r1+4], r3
 f0 6b c2              st32	[r1], q3
 a5                    xor	r5, r5
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 fa 99                 lsr16i	r6, 0x9
 0e                    mov	r7, r6
 aa                    xor	r6, r6
 98                    or	r6, r4
 9d                    or	r7, r5
 ed 92 26              ld16	r4, [r1+6]
 a2                    xor	r4, r6
 ee 92 26              st16	[r1+6], r4
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 c2 09                 ldi8	r6, 0x9
 d7 0f                 sys	memcpy
 f1 20                 mov	r4, r0
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
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 fa 7f                 lsr16i	r4, 0xf
 f2 20                 add	r4, r0
 f4 58                 stsp16	[sp+0x6], r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f1 07                 mov	r0, r7
 02                    mov	r4, r6
 fa 7f                 lsr16i	r4, 0xf
 f2 20                 add	r4, r0
 f4 22                 ldsp16	r6, [sp+0x8]
 0d                    mov	r7, r5
 fe 26                 mul16	r4, r6
 f0 3c 10              stsp16	[sp+0x10], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 24                 mov	r5, r0
 f4 1a                 ldsp16	r6, [sp+0x6]
 fe 34                 mul16	r6, r4
 f4 5a                 stsp16	[sp+0x6], r6
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f4 72                 stsp16	[sp+0xc], r6
 f1 74                 zext8	r4
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 20                 ldsp16	r4, [sp+0x8]
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f3 18                 mulu8.w	r6, r4
 f4 7a                 stsp16	[sp+0xe], r6
 f4 32                 ldsp16	r6, [sp+0xc]
 f3 3b                 mulsu8.w	r6, r7
 f4 52                 stsp16	[sp+0x4], r6
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 fa 78                 lsr16i	r4, 0x8
 0c                    mov	r7, r4
 f4 32                 ldsp16	r6, [sp+0xc]
 f3 2e                 muls8.w	r7, r6
 f4 63                 stsp16	[sp+0x8], r7
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f3 32                 mulsu8.w	r4, r6
 08                    mov	r6, r4
 fa d8                 asr16i	r6, 0x8
 f4 23                 ldsp16	r7, [sp+0x8]
 1b                    add	r6, r7
 f4 13                 ldsp16	r7, [sp+0x4]
 fa e8                 asr16i	r7, 0x8
 1e                    add	r7, r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 1e                    add	r7, r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 12                 ldsp16	r6, [sp+0x4]
 18                    add	r6, r4
 f4 52                 stsp16	[sp+0x4], r6
 fa 38                 lsl16i	r4, 0x8
 08                    mov	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 3a                 ldsp16	r6, [sp+0xe]
 0c                    mov	r7, r4
 1e                    add	r7, r6
 f4 43                 stsp16	[sp+0x0], r7
 0b                    mov	r6, r7
 38                    cmp	r6, r4
 f8 14                 cset.ult	r4
 f4 19                 ldsp16	r5, [sp+0x6]
 11                    add	r4, r5
 f0 35 10              ldsp16	r5, [sp+0x10]
 11                    add	r4, r5
 f4 11                 ldsp16	r5, [sp+0x4]
 fa 48                 lsl16i	r5, 0x8
 f4 3a                 ldsp16	r6, [sp+0xe]
 16                    add	r5, r6
 f4 51                 stsp16	[sp+0x4], r5
 0b                    mov	r6, r7
 36                    cmp	r5, r6
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 0d                    mov	r7, r5
 aa                    xor	r6, r6
 f4 10                 ldsp16	r4, [sp+0x4]
 a5                    xor	r5, r5
 92                    or	r4, r6
 97                    or	r5, r7
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
