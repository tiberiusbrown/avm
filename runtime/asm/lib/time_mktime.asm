
time_mktime.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 time_mktime.c
00000000 l    d  .text.mktime	00000000 .text.mktime
00000000 g     F .text.mktime	000001a4 mktime
00000000         *UND*	00000000 __avm_time_floor
00000000         *UND*	00000000 __avm_mulsi3
00000000         *UND*	00000000 __avm_time_days
00000000         *UND*	00000000 __avm_muldi3
00000000         *UND*	00000000 __avm_time_split

Disassembly of section .text.mktime:

<mktime>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d8                 adjsp	-0x28
 ed 18 2a              ld16	r0, [r4+10]
 ed b8 28              ld16	r5, [r4+8]
 f1 14                 mov	r2, r4
 01                    mov	r4, r5
 fa cf                 asr16i	r5, 0xf
 c2 0c                 ldi8	r6, 0xc
 af                    xor	r7, r7
 e3 00 00 00           callf	mktime
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_time_floor
 f1 28                 mov	r6, r0
 f1 2c                 mov	r7, r0
 fa ef                 asr16i	r7, 0xf
 f7 6e                 add32	q3, q2
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c6 f4 ff              ldi16	r6, 0xfff4
 c7 ff ff              ldi16	r7, 0xffff
 e3 00 00 00           callf	mktime
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f2 62                 mov32	q0, q2
 c4 6c 07              ldi16	r4, 0x76c
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f7 6b                 add32	q2, q3
 ed d4 28              ld16	r6, [r2+8]
 f0 3a 14              stsp16	[sp+0x14], r2
 0e                    mov	r7, r6
 fa ef                 asr16i	r7, 0xf
 f7 6c                 add32	q3, q0
 d6 fc                 adjsp	-0x4
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f7 6c                 add32	q3, q0
 e3 00 00 00           callf	mktime
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_time_days
 d6 04                 adjsp	0x4
 d6 f8                 adjsp	-0x8
 c6 80 51              ldi16	r6, 0x5180
 c3 01                 ldi8	r7, 0x1
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 09                    mov	r6, r5
 fa df                 asr16i	r6, 0xf
 f1 06                 mov	r0, r6
 f1 0e                 mov	r1, r6
 ed d4 26              ld16	r6, [r2+6]
 0e                    mov	r7, r6
 fa ef                 asr16i	r7, 0xf
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 0b                    mov	r6, r7
 fa df                 asr16i	r6, 0xf
 f1 16                 mov	r2, r6
 f1 1e                 mov	r3, r6
 f7 64                 add32	q1, q0
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f7 6b                 add32	q2, q3
 f0 69 8c              cmp32	q2, q3
 f8 16                 cset.ult	r6
 af                    xor	r7, r7
 f7 6d                 add32	q3, q1
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 e3 00 00 00           callf	mktime
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_muldi3
 d6 08                 adjsp	0x8
 f2 66                 mov32	q1, q2
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 d6 f8                 adjsp	-0x8
 c4 10 0e              ldi16	r4, 0xe10
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 ed 90 24              ld16	r4, [r0+4]
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 09                    mov	r6, r5
 fa df                 asr16i	r6, 0xf
 0e                    mov	r7, r6
 e3 00 00 00           callf	mktime
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_muldi3
 d6 08                 adjsp	0x8
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 d6 f8                 adjsp	-0x8
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c0 3c                 ldi8	r4, 0x3c
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 ed 90 22              ld16	r4, [r0+2]
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 09                    mov	r6, r5
 fa df                 asr16i	r6, 0xf
 0e                    mov	r7, r6
 e3 00 00 00           callf	mktime
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_muldi3
 d6 08                 adjsp	0x8
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f1 20                 mov	r4, r0
 60                    ld16	r4, [r4]
 f4 50                 stsp16	[sp+0x4], r4
 d6 fe                 adjsp	-0x2
 f0 14 18              leasp	r4, 0x18
 f0 3c 10              stsp16	[sp+0x10], r4
 f4 40                 stsp16	[sp+0x0], r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 f7 62                 add32	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 66                 add32	q1, q2
 f0 69 48              cmp32	q1, q2
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f7 6b                 add32	q2, q3
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f7 6d                 add32	q3, q1
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 f0 69 c4              cmp32	q3, q1
 f8 16                 cset.ult	r6
 f1 16                 mov	r2, r6
 f2 4b                 sub	r3, r3
 f7 66                 add32	q1, q2
 f4 18                 ldsp16	r4, [sp+0x6]
 08                    mov	r6, r4
 0c                    mov	r7, r4
 fa ef                 asr16i	r7, 0xf
 03                    mov	r4, r7
 fa bf                 asr16i	r4, 0xf
 f1 04                 mov	r0, r4
 f1 0c                 mov	r1, r4
 f7 61                 add32	q0, q1
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f7 6e                 add32	q3, q2
 f0 69 c8              cmp32	q3, q2
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f0 06 80 ae           ldi16	r2, 0xae80
 f0 07 fe ff           ldi16	r3, 0xfffe
 f7 67                 add32	q1, q3
 f0 69 4c              cmp32	q1, q3
 f8 14                 cset.ult	r4
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f4 08                 ldsp16	r4, [sp+0x2]
 f7 62                 add32	q0, q2
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 62                 add32	q0, q2
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	mktime
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_time_split
 d6 02                 adjsp	0x2
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	mktime
		R_AVM_FAR24	.text.mktime+0x193
<L0>:
 f0 34 14              ldsp16	r4, [sp+0x14]
 f4 39                 ldsp16	r5, [sp+0xe]
 c2 12                 ldi8	r6, 0x12
 d7 0f                 sys	memcpy
 f2 69                 mov32	q2, q1
 e2 00 00 00           jmpf	mktime
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.mktime+0x19b
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f2 62                 mov32	q0, q2
 f2 6a                 mov32	q3, q0
 d6 28                 adjsp	0x28
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
