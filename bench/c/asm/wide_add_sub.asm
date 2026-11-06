
wide_add_sub.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 a0                    xor	r4, r4
 c5 11 11              ldi16	r5, 0x1111
 c6 0c 01              ldi16	r6, 0x10c
 f0 6b 8c              st32	[r6], q2
 c0 01                 ldi8	r4, 0x1
 c5 ff ff              ldi16	r5, 0xffff
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 c4 05 03              ldi16	r4, 0x305
 c5 13 12              ldi16	r5, 0x1213
 c6 14 01              ldi16	r6, 0x114
 f0 6b 8c              st32	[r6], q2
 c4 09 07              ldi16	r4, 0x709
 c5 05 05              ldi16	r5, 0x505
 c6 10 01              ldi16	r6, 0x110
 f0 6b 8c              st32	[r6], q2
 c4 09 06              ldi16	r4, 0x609
 c5 15 13              ldi16	r5, 0x1315
 c6 1c 01              ldi16	r6, 0x11c
 f0 6b 8c              st32	[r6], q2
 c4 11 0e              ldi16	r4, 0xe11
 c5 0b 0a              ldi16	r5, 0xa0b
 c6 18 01              ldi16	r6, 0x118
 f0 6b 8c              st32	[r6], q2
 c4 0d 09              ldi16	r4, 0x90d
 c5 17 14              ldi16	r5, 0x1417
 c6 24 01              ldi16	r6, 0x124
 f0 6b 8c              st32	[r6], q2
 c4 19 15              ldi16	r4, 0x1519
 c5 11 0f              ldi16	r5, 0xf11
 c6 20 01              ldi16	r6, 0x120
 f0 6b 8c              st32	[r6], q2
 c4 11 0c              ldi16	r4, 0xc11
 c5 19 15              ldi16	r5, 0x1519
 c6 2c 01              ldi16	r6, 0x12c
 f0 6b 8c              st32	[r6], q2
 c4 21 1c              ldi16	r4, 0x1c21
 c5 17 14              ldi16	r5, 0x1417
 c6 28 01              ldi16	r6, 0x128
 f0 6b 8c              st32	[r6], q2
 c4 15 0f              ldi16	r4, 0xf15
 c5 1b 16              ldi16	r5, 0x161b
 c6 34 01              ldi16	r6, 0x134
 f0 6b 8c              st32	[r6], q2
 c4 29 23              ldi16	r4, 0x2329
 c5 1d 19              ldi16	r5, 0x191d
 c6 30 01              ldi16	r6, 0x130
 f0 6b 8c              st32	[r6], q2
 c4 19 12              ldi16	r4, 0x1219
 c5 1d 17              ldi16	r5, 0x171d
 c6 3c 01              ldi16	r6, 0x13c
 f0 6b 8c              st32	[r6], q2
 c4 31 2a              ldi16	r4, 0x2a31
 c5 23 1e              ldi16	r5, 0x1e23
 c6 38 01              ldi16	r6, 0x138
 f0 6b 8c              st32	[r6], q2
 c4 1d 15              ldi16	r4, 0x151d
 c5 1f 18              ldi16	r5, 0x181f
 c6 44 01              ldi16	r6, 0x144
 f0 6b 8c              st32	[r6], q2
 c4 39 31              ldi16	r4, 0x3139
 c5 29 23              ldi16	r5, 0x2329
 c6 40 01              ldi16	r6, 0x140
 f0 6b 8c              st32	[r6], q2
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 c6 f0 ff              ldi16	r6, 0xfff0
 c7 ff ff              ldi16	r7, 0xffff
 a5                    xor	r5, r5
 d7 01                 sys	debug_break
<L0>:
 f4 41                 stsp16	[sp+0x0], r5
 f1 15                 mov	r2, r5
 f2 4b                 sub	r3, r3
 c0 ff                 ldi8	r4, 0xff
 f9 50                 and	r2, r4
 c0 05                 ldi8	r4, 0x5
 f4 68                 stsp16	[sp+0xa], r4
 f7 65                 add32	q1, q1
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 3b 04              stsp16	[sp+0x4], r3
 c5 08 01              ldi16	r5, 0x108
<L1>:
 f4 61                 stsp16	[sp+0x8], r5
 c9 04                 addi.s8	r5, 0x4
 f0 6a 4a              ld32	q1, [r5]
 f7 64                 add32	q1, q0
 f4 20                 ldsp16	r4, [sp+0x8]
 f0 6a 08              ld32	q0, [r4]
 f7 6c                 add32	q3, q0
 f0 69 c0              cmp32	q3, q0
 f8 15                 cset.ult	r5
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 f7 61                 add32	q0, q1
 f4 29                 ldsp16	r5, [sp+0xa]
 15                    add	r5, r5
 15                    add	r5, r5
 15                    add	r5, r5
 c0 38                 ldi8	r4, 0x38
 81                    and	r4, r5
 f4 58                 stsp16	[sp+0x6], r4
 04                    mov	r5, r4
 c4 0c 01              ldi16	r4, 0x10c
 14                    add	r5, r4
 f0 6a 4a              ld32	q1, [r5]
 f7 71                 sub32	q0, q1
 c5 08 01              ldi16	r5, 0x108
 f4 18                 ldsp16	r4, [sp+0x6]
 11                    add	r4, r5
 f0 6a 48              ld32	q1, [r4]
 f0 69 c4              cmp32	q3, q1
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f7 72                 sub32	q0, q2
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 f7 7d                 sub32	q3, q1
 c9 08                 addi.s8	r5, 0x8
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 ac                 inc16	r4
 f4 68                 stsp16	[sp+0xa], r4
 cc 0d                 cmpi.s8	r4, 0xd
 d1 a8                 brne8	-0x58 <L1>
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 cd 20                 cmpi.s8	r5, 0x20
 d1 87                 brne8	-0x79 <L0>
 c4 00 01              ldi16	r4, 0x100
 f0 6b c8              st32	[r4], q3
 c4 04 01              ldi16	r4, 0x104
 f0 6b 08              st32	[r4], q0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0c                 adjsp	0xc
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
