
wide_mul.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e6                 adjsp	-0x1a
 c4 78 56              ldi16	r4, 0x5678
 c5 34 12              ldi16	r5, 0x1234
 c6 0c 01              ldi16	r6, 0x10c
 f0 6b 8c              st32	[r6], q2
 c4 f0 de              ldi16	r4, 0xdef0
 c5 bc 9a              ldi16	r5, 0x9abc
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 c4 98 ba              ldi16	r4, 0xba98
 c5 dc fe              ldi16	r5, 0xfedc
 c6 14 01              ldi16	r6, 0x114
 f0 6b 8c              st32	[r6], q2
 c4 11 32              ldi16	r4, 0x3211
 c5 54 76              ldi16	r5, 0x7654
 c6 10 01              ldi16	r6, 0x110
 f0 6b 8c              st32	[r6], q2
 c0 01                 ldi8	r4, 0x1
 c1 01                 ldi8	r5, 0x1
 c6 1c 01              ldi16	r6, 0x11c
 f0 6b 8c              st32	[r6], q2
 c6 18 01              ldi16	r6, 0x118
 f0 6b 8c              st32	[r6], q2
 c5 00 80              ldi16	r5, 0x8000
 c6 24 01              ldi16	r6, 0x124
 f0 6b 8c              st32	[r6], q2
 c4 ff ff              ldi16	r4, 0xffff
 a5                    xor	r5, r5
 c6 20 01              ldi16	r6, 0x120
 f0 6b 8c              st32	[r6], q2
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 c0 04                 ldi8	r4, 0x4
 d7 01                 sys	debug_break
<L0>:
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 3f 18              stsp16	[sp+0x18], r7
 f4 50                 stsp16	[sp+0x4], r4
 d6 f8                 adjsp	-0x8
 c4 0c 01              ldi16	r4, 0x10c
 f0 6a 88              ld32	q2, [r4]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c4 08 01              ldi16	r4, 0x108
 f0 6a 88              ld32	q2, [r4]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c4 10 01              ldi16	r4, 0x110
 f2 61                 mov32	q0, q1
 f1 1c                 mov	r3, r4
 f0 6a 86              ld32	q2, [r3]
 f0 06 14 01           ldi16	r2, 0x114
 f0 6a c4              ld32	q3, [r2]
 e1 46 0c              call16	__avm_muldi3
 d6 08                 adjsp	0x8
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 d6 f8                 adjsp	-0x8
 f0 6a 84              ld32	q2, [r2]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 6a 86              ld32	q2, [r3]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 07 18 01           ldi16	r3, 0x118
 f0 6a 86              ld32	q2, [r3]
 f0 06 1c 01           ldi16	r2, 0x11c
 f0 6a c4              ld32	q3, [r2]
 e1 19 0c              call16	__avm_muldi3
 d6 08                 adjsp	0x8
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 d6 f8                 adjsp	-0x8
 f0 6a 84              ld32	q2, [r2]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 6a 86              ld32	q2, [r3]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c4 20 01              ldi16	r4, 0x120
 f0 6a 88              ld32	q2, [r4]
 f0 06 24 01           ldi16	r2, 0x124
 f0 6a c4              ld32	q3, [r2]
 e1 ee 0b              call16	__avm_muldi3
 d6 08                 adjsp	0x8
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 d6 f8                 adjsp	-0x8
 f0 6a 44              ld32	q1, [r2]
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 c4 20 01              ldi16	r4, 0x120
 f0 6a 48              ld32	q1, [r4]
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 f0 30 1e              ldsp16	r0, [sp+0x1e]
 f0 31 20              ldsp16	r1, [sp+0x20]
 f0 32 1a              ldsp16	r2, [sp+0x1a]
 f0 33 1c              ldsp16	r3, [sp+0x1c]
 f9 42                 xor	r2, r0
 f9 66                 xor	r3, r1
 f2 61                 mov32	q0, q1
 f0 32 12              ldsp16	r2, [sp+0x12]
 f0 33 14              ldsp16	r3, [sp+0x14]
 f9 0a                 xor	r0, r2
 f9 2e                 xor	r1, r3
 f0 32 16              ldsp16	r2, [sp+0x16]
 f0 33 18              ldsp16	r3, [sp+0x18]
 f9 8a                 xor	r4, r2
 f9 ae                 xor	r5, r3
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 f9 8a                 xor	r4, r2
 f9 ae                 xor	r5, r3
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f9 1a                 xor	r0, r6
 f9 3e                 xor	r1, r7
 c4 08 01              ldi16	r4, 0x108
 f0 6a 88              ld32	q2, [r4]
 c6 0c 01              ldi16	r6, 0x10c
 f0 6a cc              ld32	q3, [r6]
 e1 82 0b              call16	__avm_muldi3
 d6 08                 adjsp	0x8
 f2 66                 mov32	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f9 42                 xor	r2, r0
 f9 66                 xor	r3, r1
 f4 b4                 dec16	r4
 f4 a4                 tst8	r4
 db ef fe              brne16	-0x111 <L0>
 c4 00 01              ldi16	r4, 0x100
 f0 6b 48              st32	[r4], q1
 c4 04 01              ldi16	r4, 0x104
 f0 6b c8              st32	[r4], q3
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 1a                 adjsp	0x1a
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<memset>:
 0c                    mov	r7, r4
 d7 11                 sys	memset
 03                    mov	r4, r7
 ef                    ret

<__avm_umulhisi3>:
 d6 fa                 adjsp	-0x6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f4 52                 stsp16	[sp+0x4], r6
 f1 75                 zext8	r5
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 f3 19                 mulu8.w	r6, r5
 f4 4a                 stsp16	[sp+0x2], r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f3 1b                 mulu8.w	r6, r7
 f4 42                 stsp16	[sp+0x0], r6
 fa 78                 lsr16i	r4, 0x8
 f4 13                 ldsp16	r7, [sp+0x4]
 08                    mov	r6, r4
 f3 1b                 mulu8.w	r6, r7
 f3 11                 mulu8.w	r4, r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 16                    add	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 fa 38                 lsl16i	r4, 0x8
 f4 09                 ldsp16	r5, [sp+0x2]
 14                    add	r5, r4
 34                    cmp	r5, r4
 f8 14                 cset.ult	r4
 13                    add	r4, r7
 fa 58                 lsl16i	r6, 0x8
 19                    add	r6, r5
 39                    cmp	r6, r5
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 02                    mov	r4, r6
 d6 06                 adjsp	0x6
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
 f4 43                 stsp16	[sp+0x0], r7
 f4 13                 ldsp16	r7, [sp+0x4]
 f3 3d                 mulsu8.w	r7, r5
 f4 5b                 stsp16	[sp+0x6], r7
 fa 78                 lsr16i	r4, 0x8
 0c                    mov	r7, r4
 f4 11                 ldsp16	r5, [sp+0x4]
 f3 2d                 muls8.w	r7, r5
 f3 32                 mulsu8.w	r4, r6
 04                    mov	r5, r4
 fa c8                 asr16i	r5, 0x8
 17                    add	r5, r7
 f4 1a                 ldsp16	r6, [sp+0x6]
 fa d8                 asr16i	r6, 0x8
 19                    add	r6, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 19                    add	r6, r5
 fa 38                 lsl16i	r4, 0x8
 f4 03                 ldsp16	r7, [sp+0x0]
 1c                    add	r7, r4
 3c                    cmp	r7, r4
 f8 14                 cset.ult	r4
 12                    add	r4, r6
 f4 09                 ldsp16	r5, [sp+0x2]
 11                    add	r4, r5
 f4 19                 ldsp16	r5, [sp+0x6]
 fa 48                 lsl16i	r5, 0x8
 1d                    add	r7, r5
 3d                    cmp	r7, r5
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 03                    mov	r4, r7
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<__avm_muldi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 dc                 adjsp	-0x24
 f0 30 2f              ldsp16	r0, [sp+0x2f]
 f0 31 31              ldsp16	r1, [sp+0x31]
 f0 32 33              ldsp16	r2, [sp+0x33]
 f0 33 35              ldsp16	r3, [sp+0x35]
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 3a 20              stsp16	[sp+0x20], r2
 f0 3b 22              stsp16	[sp+0x22], r3
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 00 04              ldi8	r0, 0x4
 f0 11 08              leasp	r1, 0x8
<L0>:
 f4 58                 stsp16	[sp+0x6], r4
 10                    add	r4, r4
 f0 15 10              leasp	r5, 0x10
 14                    add	r5, r4
 f0 16 1c              leasp	r6, 0x1c
 61                    ld16	r4, [r5]
 a5                    xor	r5, r5
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f0 39 18              stsp16	[sp+0x18], r1
 f0 38 1a              stsp16	[sp+0x1a], r0
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
<L1>:
 f7 34                 ld16	r4, [r6+]
 f4 42                 stsp16	[sp+0x0], r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 06                    mov	r5, r6
 e1 04 ff              call16	__avm_umulhisi3
 ed d2 20              ld16	r6, [r1+0]
 af                    xor	r7, r7
 f7 6d                 add32	q3, q1
 f7 6e                 add32	q3, q2
 f0 6d d3              st16	[r1+], r6
 f1 17                 mov	r2, r7
 f2 4b                 sub	r3, r3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d1 df                 brne8	-0x21 <L1>
 f0 31 18              ldsp16	r1, [sp+0x18]
 f0 09 02              addi.s8	r1, 0x2
 f0 30 1a              ldsp16	r0, [sp+0x1a]
 f4 b0                 dec16	r0
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 ac                 inc16	r4
 cc 04                 cmpi.s8	r4, 0x4
 d1 b2                 brne8	-0x4e <L0>
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 d6 24                 adjsp	0x24
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
