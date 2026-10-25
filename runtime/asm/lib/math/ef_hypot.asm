
math_ef_hypot.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_hypot.c
00000000 l    d  .text.hypotf	00000000 .text.hypotf
00000000 g     F .text.hypotf	000001bf hypotf
00000000         *UND*	00000000 sqrtf

Disassembly of section .text.hypotf:

<hypotf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ec                 adjsp	-0x14
 f2 62                 mov32	q0, q2
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff 7f              ldi16	r5, 0x7fff
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 88                    and	r6, r4
 8d                    and	r7, r5
 f2 67                 mov32	q1, q3
 f7 74                 sub32	q1, q0
 f1 23                 mov	r4, r3
 fa bf                 asr16i	r4, 0xf
 04                    mov	r5, r4
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 f7 76                 sub32	q1, q2
 f0 69 0c              cmp32	q0, q3
 f2 68                 mov32	q2, q0
 fc 26                 cmov.ult	r4, r6
 fc 2f                 cmov.ult	r5, r7
 f0 69 c0              cmp32	q3, q0
 fc 06                 cmov.ult	r0, r6
 fc 0f                 cmov.ult	r1, r7
 c2 01                 ldi8	r6, 0x1
 c7 00 0f              ldi16	r7, 0xf00
 f0 69 4c              cmp32	q1, q3
 d9 04                 brsge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0x47
<L0>:
 ff 08                 fadd	q2, q0
 e2 00 00 00           jmpf	hypotf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.hypotf+0x1b8
 c2 01                 ldi8	r6, 0x1
 c7 80 58              ldi16	r7, 0x5880
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0x71
<L1>:
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 8c              cmp32	q2, q3
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0xd1
<L2>:
 aa                    xor	r6, r6
 c7 00 de              ldi16	r7, 0xde00
 f7 6b                 add32	q2, q3
 f7 63                 add32	q0, q3
 c2 44                 ldi8	r6, 0x44
 af                    xor	r7, r7
 e2 00 00 00           jmpf	hypotf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.hypotf+0x73
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c6 ff ff              ldi16	r6, 0xffff
 c7 7f 26              ldi16	r7, 0x267f
 f0 69 c0              cmp32	q3, q0
 d9 04                 brsge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0x103
<L3>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0x1b8
<L4>:
 c6 ff ff              ldi16	r6, 0xffff
 c3 7f                 ldi8	r7, 0x7f
 f0 69 c0              cmp32	q3, q0
 d9 04                 brsge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0xe9
<L5>:
 aa                    xor	r6, r6
 c7 80 7e              ldi16	r7, 0x7e80
 f2 66                 mov32	q1, q2
 ff 27                 fmul	q1, q3
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 f2 64                 mov32	q1, q0
 ff 27                 fmul	q1, q3
 c6 82 ff              ldi16	r6, 0xff82
 f4 52                 stsp16	[sp+0x4], r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 13                 ldsp16	r7, [sp+0x4]
 9e                    or	r7, r6
 c6 ff ff              ldi16	r6, 0xffff
 ab                    xor	r6, r7
 ae                    xor	r7, r6
 ab                    xor	r6, r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 6b                 mov32	q3, q1
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 e2 00 00 00           jmpf	hypotf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.hypotf+0x107
 f2 66                 mov32	q1, q2
 ff 04                 fadd	q1, q0
 f0 69 8c              cmp32	q2, q3
 fb 16                 cmov.eq	r2, r6
 fb 1f                 cmov.eq	r3, r7
 f0 69 0c              cmp32	q0, q3
 fb 16                 cmov.eq	r2, r6
 fb 1f                 cmov.eq	r3, r7
 f2 69                 mov32	q2, q1
 e2 00 00 00           jmpf	hypotf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.hypotf+0x1b8
 f0 06 bc ff           ldi16	r2, 0xffbc
 f0 07 ff ff           ldi16	r3, 0xffff
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f7 6d                 add32	q3, q1
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 aa                    xor	r6, r6
 c7 00 22              ldi16	r7, 0x2200
 f7 6b                 add32	q2, q3
 f7 63                 add32	q0, q3
 f2 6a                 mov32	q3, q0
 f2 66                 mov32	q1, q2
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 ff 17                 fsub	q1, q3
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 ff c8 67              fcmp	r6, q1, q3
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0x144
<L6>:
 c6 00 f0              ldi16	r6, 0xf000
 c7 ff ff              ldi16	r7, 0xffff
 82                    and	r4, r6
 87                    and	r5, r7
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f2 6a                 mov32	q3, q0
 ff 0e                 fadd	q3, q2
 ff 12                 fsub	q0, q2
 ff 23                 fmul	q0, q3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 2f                 fmul	q3, q3
 ff 0c                 fadd	q3, q0
 ff 2a                 fmul	q2, q2
 ff 0b                 fadd	q2, q3
 e2 00 00 00           jmpf	hypotf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.hypotf+0x195
 c6 00 f0              ldi16	r6, 0xf000
 c7 ff ff              ldi16	r7, 0xffff
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 82                    and	r4, r6
 87                    and	r5, r7
 aa                    xor	r6, r6
 c3 80                 ldi8	r7, 0x80
 f7 6e                 add32	q3, q2
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 18                 fsub	q2, q0
 ff 23                 fmul	q0, q3
 ff 2b                 fmul	q2, q3
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 0f                 fadd	q3, q3
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 1e                 fsub	q3, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 2b                 fmul	q2, q3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 0e                 fadd	q3, q2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f2 6b                 mov32	q3, q1
 ff 63                 fneg	q3
 ff 27                 fmul	q1, q3
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 16                 fsub	q1, q2
 ff 11                 fsub	q0, q1
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	hypotf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	sqrtf
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c0              cmp32	q3, q0
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	hypotf
		R_AVM_FAR24	.text.hypotf+0x1b8
<L7>:
 fa 57                 lsl16i	r6, 0x7
 0e                    mov	r7, r6
 aa                    xor	r6, r6
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f7 63                 add32	q0, q3
 ff 28                 fmul	q2, q0
 d6 14                 adjsp	0x14
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
