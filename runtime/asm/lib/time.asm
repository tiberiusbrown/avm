
time.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 time.c
00000000 l    d  .text.clock	00000000 .text.clock
00000000 l    d  .text.time	00000000 .text.time
00000000 l    d  .text.difftime	00000000 .text.difftime
00000000 g     F .text.clock	00000003 clock
00000000 g     F .text.time	0000001f time
00000000 g     F .text.difftime	00000134 difftime

Disassembly of section .text.clock:

<clock>:
 d7 03                 sys	millis32
 ef                    ret

Disassembly of section .text.time:

<time>:
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	time
		R_AVM_FAR24	.text.time+0x16
<L0>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 6b c8              st32	[r4], q3
 c8 04                 addi.s8	r4, 0x4
 f0 6b c8              st32	[r4], q3
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ef                    ret

Disassembly of section .text.difftime:

<difftime>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f2 66                 mov32	q1, q2
 f0 36 1d              ldsp16	r6, [sp+0x1d]
 f0 37 1f              ldsp16	r7, [sp+0x1f]
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f0 69 8c              cmp32	q2, q3
 f8 24                 cset.slt	r4
 f4 40                 stsp16	[sp+0x0], r4
 f0 30 19              ldsp16	r0, [sp+0x19]
 f0 31 1b              ldsp16	r1, [sp+0x1b]
 f0 3a 0a              stsp16	[sp+0xa], r2
 f0 3b 0c              stsp16	[sp+0xc], r3
 f0 69 40              cmp32	q1, q0
 f8 13                 cset.ult	r3
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 f4 18                 ldsp16	r4, [sp+0x6]
 f0 69 8c              cmp32	q2, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 fb 23                 cmov.eq	r4, r3
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	difftime
		R_AVM_FAR24	.text.difftime+0xac
<L0>:
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f7 7b                 sub32	q2, q3
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f0 33 0c              ldsp16	r3, [sp+0xc]
 f0 69 04              cmp32	q0, q1
 f8 16                 cset.ult	r6
 af                    xor	r7, r7
 f7 7b                 sub32	q2, q3
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f7 71                 sub32	q0, q1
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	difftime
		R_AVM_FAR24	.text.difftime+0x109
<L1>:
 a0                    xor	r4, r4
 f4 68                 stsp16	[sp+0xa], r4
 f0 02 01              ldi8	r2, 0x1
 f9 40                 and	r2, r0
 f7 80                 lsr32.1	q0
 f9 41                 or	r2, r0
 02                    mov	r4, r6
 07                    mov	r5, r7
 fa 5f                 lsl16i	r6, 0xf
 f9 c5                 or	r6, r1
 f1 02                 mov	r0, r2
 f1 0e                 mov	r1, r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 ae                 inc16	r6
 f4 6a                 stsp16	[sp+0xa], r6
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f0 69 c8              cmp32	q3, q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 83                 lsr32.1	q3
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	difftime
		R_AVM_FAR24	.text.difftime+0x71
<L2>:
 f4 28                 ldsp16	r4, [sp+0xa]
 fa 37                 lsl16i	r4, 0x7
 04                    mov	r5, r4
 a0                    xor	r4, r4
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f7 6e                 add32	q3, q2
 f2 68                 mov32	q2, q0
 e2 00 00 00           jmpf	difftime
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.difftime+0x129
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f7 7e                 sub32	q3, q2
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f0 69 80              cmp32	q2, q0
 f8 16                 cset.ult	r6
 f1 16                 mov	r2, r6
 f2 4b                 sub	r3, r3
 f4 1a                 ldsp16	r6, [sp+0x6]
 f7 7d                 sub32	q3, q1
 f7 78                 sub32	q2, q0
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 f2 66                 mov32	q1, q2
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	difftime
		R_AVM_FAR24	.text.difftime+0x11a
<L3>:
 a0                    xor	r4, r4
 f4 68                 stsp16	[sp+0xa], r4
 f0 00 01              ldi8	r0, 0x1
 f9 08                 and	r0, r2
 f7 81                 lsr32.1	q1
 f9 09                 or	r0, r2
 02                    mov	r4, r6
 fa 3f                 lsl16i	r4, 0xf
 f9 8d                 or	r4, r3
 f1 10                 mov	r2, r0
 f1 1c                 mov	r3, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 ac                 inc16	r4
 f4 68                 stsp16	[sp+0xa], r4
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f0 69 0c              cmp32	q0, q3
 f7 83                 lsr32.1	q3
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	difftime
		R_AVM_FAR24	.text.difftime+0xdb
<L4>:
 f4 2a                 ldsp16	r6, [sp+0xa]
 e2 00 00 00           jmpf	difftime
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.difftime+0x11b
 a0                    xor	r4, r4
 fa 37                 lsl16i	r4, 0x7
 04                    mov	r5, r4
 a0                    xor	r4, r4
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f7 6e                 add32	q3, q2
 f2 68                 mov32	q2, q0
 e2 00 00 00           jmpf	difftime
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.difftime+0x129
 aa                    xor	r6, r6
 fa 57                 lsl16i	r6, 0x7
 f1 0e                 mov	r1, r6
 f2 30                 sub	r0, r0
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f7 6c                 add32	q3, q0
 f2 69                 mov32	q2, q1
 ff 11                 u32tof
 ff 02                 fmul
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
