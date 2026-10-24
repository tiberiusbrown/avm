
aggregate_return.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 aggregate_return.c
00000100 l     O .data	00000002 aggregate_seed
00000350 l     F .text	0000004f advance
00000102 l     O .data	00000004 aggregate_return_result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 integer.c
00000417 l       .init_array	00000000 .hidden __init_array_end
00000417 l       .init_array	00000000 .hidden __init_array_start
00000417 l       .fini_array	00000000 .hidden __fini_array_start
00000417 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000089 avm_test_main
0000039f g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000003a1 g     F .text	00000076 __avm_mulsi3

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
 e1 81 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 17 04              ldi16	r4, 0x417
 c1 00                 ldi8	r5, 0x0
 c6 17 04              ldi16	r6, 0x417
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 17 04           ldi16	r0, 0x417
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 17 04           ldi16	r2, 0x417
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
 c4 17 04              ldi16	r4, 0x417
 c1 00                 ldi8	r5, 0x0
 c6 17 04              ldi16	r6, 0x417
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 17 04           ldi16	r2, 0x417
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 17 04           ldi16	r0, 0x417
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
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 c3 03                 ldi8	r7, 0x3
 c4 03 01              ldi16	r4, 0x103
 f4 58                 stsp16	[sp+0x6], r4
<L0>:
 f4 53                 stsp16	[sp+0x4], r7
 f0 15 08              leasp	r5, 0x8
 f4 41                 stsp16	[sp+0x0], r5
 f0 10 11              leasp	r0, 0x11
 f1 20                 mov	r4, r0
 f4 49                 stsp16	[sp+0x2], r5
 c2 09                 ldi8	r6, 0x9
 d7 0f                 sys	memcpy
 f0 11 1a              leasp	r1, 0x1a
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 0b                    mov	r6, r7
 d5 40                 call8	advance
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 25                 mov	r5, r1
 c2 09                 ldi8	r6, 0x9
 d7 0f                 sys	memcpy
 f4 30                 ldsp16	r4, [sp+0xc]
 08                    mov	r6, r4
 af                    xor	r7, r7
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f7 6c                 add32	q3, q0
 f4 38                 ldsp16	r4, [sp+0xe]
 a5                    xor	r5, r5
 f7 6b                 add32	q2, q3
 f0 1e 10              ldsp8u	r6, [sp+0x10]
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f9 5a                 xor	r2, r6
 f9 7e                 xor	r3, r7
 f4 13                 ldsp16	r7, [sp+0x4]
 f4 af                 inc16	r7
 f4 18                 ldsp16	r4, [sp+0x6]
 3c                    cmp	r7, r4
 d1 b8                 brne8	-0x48 <L0>
 f9 0a                 xor	r0, r2
 f9 2e                 xor	r1, r3
 c6 02 01              ldi16	r6, 0x102
 f0 6b 0c              st32	[r6], q0
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
 d6 fe                 adjsp	-0x2
 f1 16                 mov	r2, r6
 f1 0d                 mov	r1, r5
 f1 04                 mov	r0, r4
 af                    xor	r7, r7
 ed 72 24              ld16	r3, [r1+4]
 f1 23                 mov	r4, r3
 a5                    xor	r5, r5
 d5 3c                 call8	__avm_mulsi3
 f0 6a c2              ld32	q3, [r1]
 f7 6e                 add32	q3, q2
 f2 1a                 add	r3, r2
 ed 82 28              ld8u	r4, [r1+8]
 f2 1c                 add	r3, r4
 f2 22                 add	r4, r2
 ee 82 28              st8	[r1+8], r4
 ee 72 24              st16	[r1+4], r3
 f0 6b c2              st32	[r1], q3
 02                    mov	r4, r6
 fa 79                 lsr16i	r4, 0x9
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 fa 37                 lsl16i	r4, 0x7
 f4 01                 ldsp16	r5, [sp+0x0]
 91                    or	r4, r5
 ed b2 26              ld16	r5, [r1+6]
 a4                    xor	r5, r4
 ee b2 26              st16	[r1+6], r5
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 c2 09                 ldi8	r6, 0x9
 d7 0f                 sys	memcpy
 f1 20                 mov	r4, r0
 d6 02                 adjsp	0x2
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
