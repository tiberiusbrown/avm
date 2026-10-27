
math_ef_fmod.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_fmod.c
00000000 l    d  .text.fmodf	00000000 .text.fmodf
00000000 g     F .text.fmodf	00000370 fmodf
00000000         *UND*	00000000 __avm_ashlsi3
00000000         *UND*	00000000 __avm_lshrsi3

Disassembly of section .text.fmodf:

<fmodf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f2 62                 mov32	q0, q2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f2 67                 mov32	q1, q3
 ff 09                 fabs	q1
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f2 6b                 mov32	q3, q1
 f0 69 48              cmp32	q1, q2
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x59
<L0>:
 f2 68                 mov32	q2, q0
 ff 0a                 fabs	q2
 f2 64                 mov32	q1, q0
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 7f 7f           ldi16	r1, 0x7f7f
 f0 69 08              cmp32	q0, q2
 f2 61                 mov32	q0, q1
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x59
<L1>:
 f0 00 01              ldi8	r0, 0x1
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 c0              cmp32	q3, q0
 f2 61                 mov32	q0, q1
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x59
<L2>:
 f2 67                 mov32	q1, q3
 f0 69 84              cmp32	q2, q1
 d2 04                 brult8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x69
<L3>:
 f2 68                 mov32	q2, q0
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x369
 f2 68                 mov32	q2, q0
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 03                 fdiv
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x369
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 f0 69 84              cmp32	q2, q1
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x8b
<L4>:
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 fb 65                 cmov.ne	r4, r5
 04                    mov	r5, r4
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x369
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f2 30                 sub	r0, r0
 f0 01 80              ldi8	r1, 0x80
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0xbe
<L5>:
 f2 6b                 mov32	q3, q1
 f7 6c                 add32	q3, q0
 f0 69 8c              cmp32	q2, q3
 d2 04                 brult8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0xbe
<L6>:
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 ff 0a                 fabs	q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 07                 fneg	q3
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x35c
 c6 ff ff              ldi16	r6, 0xffff
 c3 7f                 ldi8	r7, 0x7f
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x115
<L7>:
 09                    mov	r6, r5
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x11f
<L8>:
 0e                    mov	r7, r6
 f4 8f                 lsr16.1	r7
 9e                    or	r7, r6
 0b                    mov	r6, r7
 fa 92                 lsr16i	r6, 0x2
 9b                    or	r6, r7
 0e                    mov	r7, r6
 fa a4                 lsr16i	r7, 0x4
 9e                    or	r7, r6
 0b                    mov	r6, r7
 fa 98                 lsr16i	r6, 0x8
 9b                    or	r6, r7
 c7 ff ff              ldi16	r7, 0xffff
 ae                    xor	r7, r6
 f0 04 55 55           ldi16	r0, 0x5555
 0b                    mov	r6, r7
 f4 8e                 lsr16.1	r6
 f9 c0                 and	r6, r0
 2e                    sub	r7, r6
 f0 04 33 33           ldi16	r0, 0x3333
 0b                    mov	r6, r7
 f9 c0                 and	r6, r0
 fa a2                 lsr16i	r7, 0x2
 f9 e0                 and	r7, r0
 1e                    add	r7, r6
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 1b                    add	r6, r7
 c7 0f 0f              ldi16	r7, 0xf0f
 8e                    and	r7, r6
 0b                    mov	r6, r7
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 c3 1f                 ldi8	r7, 0x1f
 8e                    and	r7, r6
 c6 8a ff              ldi16	r6, 0xff8a
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x15c
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 ca 81                 addi.s8	r6, -0x7f
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x15d
 08                    mov	r6, r4
 f4 8e                 lsr16.1	r6
 98                    or	r6, r4
 0e                    mov	r7, r6
 fa a2                 lsr16i	r7, 0x2
 9e                    or	r7, r6
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 9b                    or	r6, r7
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 9e                    or	r7, r6
 0b                    mov	r6, r7
 c7 ff ff              ldi16	r7, 0xffff
 ae                    xor	r7, r6
 f0 04 55 55           ldi16	r0, 0x5555
 0b                    mov	r6, r7
 f4 8e                 lsr16.1	r6
 f9 c0                 and	r6, r0
 2e                    sub	r7, r6
 f0 04 33 33           ldi16	r0, 0x3333
 0b                    mov	r6, r7
 f9 c0                 and	r6, r0
 fa a2                 lsr16i	r7, 0x2
 f9 e0                 and	r7, r0
 1e                    add	r7, r6
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 1b                    add	r6, r7
 c7 0f 0f              ldi16	r7, 0xf0f
 8e                    and	r7, r6
 0b                    mov	r6, r7
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 c3 1f                 ldi8	r7, 0x1f
 8e                    and	r7, r6
 c6 7a ff              ldi16	r6, 0xff7a
 2b                    sub	r6, r7
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 c6 ff ff              ldi16	r6, 0xffff
 c3 7f                 ldi8	r7, 0x7f
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x1b9
<L9>:
 f1 2b                 mov	r6, r3
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x1c4
<L10>:
 0e                    mov	r7, r6
 f4 8f                 lsr16.1	r7
 9e                    or	r7, r6
 0b                    mov	r6, r7
 fa 92                 lsr16i	r6, 0x2
 9b                    or	r6, r7
 0e                    mov	r7, r6
 fa a4                 lsr16i	r7, 0x4
 9e                    or	r7, r6
 0b                    mov	r6, r7
 fa 98                 lsr16i	r6, 0x8
 9b                    or	r6, r7
 c7 ff ff              ldi16	r7, 0xffff
 ae                    xor	r7, r6
 f0 04 55 55           ldi16	r0, 0x5555
 0b                    mov	r6, r7
 f4 8e                 lsr16.1	r6
 f9 c0                 and	r6, r0
 2e                    sub	r7, r6
 f0 04 33 33           ldi16	r0, 0x3333
 0b                    mov	r6, r7
 f9 c0                 and	r6, r0
 fa a2                 lsr16i	r7, 0x2
 f9 e0                 and	r7, r0
 1e                    add	r7, r6
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 1b                    add	r6, r7
 c7 0f 0f              ldi16	r7, 0xf0f
 8e                    and	r7, r6
 0b                    mov	r6, r7
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 c3 1f                 ldi8	r7, 0x1f
 8e                    and	r7, r6
 c6 8a ff              ldi16	r6, 0xff8a
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x203
 f1 2b                 mov	r6, r3
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 ca 81                 addi.s8	r6, -0x7f
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x204
 f1 2a                 mov	r6, r2
 f4 8e                 lsr16.1	r6
 f9 c9                 or	r6, r2
 0e                    mov	r7, r6
 fa a2                 lsr16i	r7, 0x2
 9e                    or	r7, r6
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 9b                    or	r6, r7
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 9e                    or	r7, r6
 0b                    mov	r6, r7
 c7 ff ff              ldi16	r7, 0xffff
 ae                    xor	r7, r6
 f0 04 55 55           ldi16	r0, 0x5555
 0b                    mov	r6, r7
 f4 8e                 lsr16.1	r6
 f9 c0                 and	r6, r0
 2e                    sub	r7, r6
 f0 04 33 33           ldi16	r0, 0x3333
 0b                    mov	r6, r7
 f9 c0                 and	r6, r0
 fa a2                 lsr16i	r7, 0x2
 f9 e0                 and	r7, r0
 1e                    add	r7, r6
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 1b                    add	r6, r7
 c7 0f 0f              ldi16	r7, 0xf0f
 8e                    and	r7, r6
 0b                    mov	r6, r7
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 c3 1f                 ldi8	r7, 0x1f
 8e                    and	r7, r6
 c6 7a ff              ldi16	r6, 0xff7a
 2b                    sub	r6, r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 22                 ldsp16	r6, [sp+0x8]
 ce 82                 cmpi.s8	r6, -0x7e
 c7 82 ff              ldi16	r7, 0xff82
 f0 00 7f              ldi8	r0, 0x7f
 f0 01 80              ldi8	r1, 0x80
 d9 04                 brsge8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x295
<L11>:
 f9 a0                 and	r5, r0
 f9 a5                 or	r5, r1
 f1 04                 mov	r0, r4
 f1 0d                 mov	r1, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 82                 cmpi.s8	r4, -0x7e
 d3 04                 brslt8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x2b2
<L12>:
 c4 82 ff              ldi16	r4, 0xff82
 f4 02                 ldsp16	r6, [sp+0x0]
 22                    sub	r4, r6
 08                    mov	r6, r4
 af                    xor	r7, r7
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f2 66                 mov32	q1, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 22                 ldsp16	r6, [sp+0x8]
 32                    cmp	r4, r6
 d1 04                 brne8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x2c4
<L13>:
 22                    sub	r4, r6
 f2 6b                 mov32	q3, q1
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x263
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f7 60                 add32	q0, q0
 f4 ac                 inc16	r4
 f6 2c                 tst16	r4
 f8 05                 cset.eq	r5
 cd 01                 cmpi.s8	r5, 0x1
 d1 04                 brne8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x2c6
<L14>:
 f4 60                 stsp16	[sp+0x8], r4
 f2 64                 mov32	q1, q0
 f7 77                 sub32	q1, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 d9 04                 brsge8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x24f
<L15>:
 f0 69 08              cmp32	q0, q2
 f2 61                 mov32	q0, q1
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 20                 ldsp16	r4, [sp+0x8]
 d0 04                 breq8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x253
<L16>:
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x80
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f1 07                 mov	r0, r7
 f2 36                 sub	r0, r6
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 e3 00 00 00           callf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 cc 82                 cmpi.s8	r4, -0x7e
 d9 04                 brsge8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x22d
<L17>:
 c1 7f                 ldi8	r5, 0x7f
 f9 ac                 and	r5, r3
 c2 80                 ldi8	r6, 0x80
 96                    or	r5, r6
 f1 1d                 mov	r3, r5
 f4 22                 ldsp16	r6, [sp+0x8]
 32                    cmp	r4, r6
 d0 04                 breq8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x248
<L18>:
 f2 6b                 mov32	q3, q1
 f2 68                 mov32	q2, q0
 f7 7b                 sub32	q2, q3
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 fd 20                 cmov.slt	r4, r0
 fd 29                 cmov.slt	r5, r1
 f0 69 84              cmp32	q2, q1
 d1 04                 brne8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x30c
<L19>:
 c6 ff ff              ldi16	r6, 0xffff
 c3 7f                 ldi8	r7, 0x7f
 f0 69 c8              cmp32	q3, q2
 d9 04                 brsge8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x31f
<L20>:
 aa                    xor	r6, r6
 c3 80                 ldi8	r7, 0x80
 f2 63                 mov32	q0, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 b6                 dec16	r6
 f7 6a                 add32	q2, q2
 f0 69 80              cmp32	q2, q0
 d9 04                 brsge8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x2f3
<L21>:
 ce 82                 cmpi.s8	r6, -0x7e
 d9 04                 brsge8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x344
<L22>:
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x329
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 69 c4              cmp32	q3, q1
 fb 65                 cmov.ne	r4, r5
 04                    mov	r5, r4
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x369
 f4 02                 ldsp16	r6, [sp+0x0]
 ce 82                 cmpi.s8	r6, -0x7e
 d9 04                 brsge8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmodf
		R_AVM_FAR24	.text.fmodf+0x344
<L23>:
 fa 57                 lsl16i	r6, 0x7
 c7 80 3f              ldi16	r7, 0x3f80
 1e                    add	r7, r6
 f2 30                 sub	r0, r0
 f0 05 80 ff           ldi16	r1, 0xff80
 f7 68                 add32	q2, q0
 f0 31 06              ldsp16	r1, [sp+0x6]
 f9 35                 or	r1, r5
 f9 3d                 or	r1, r7
 f1 25                 mov	r5, r1
 e2 00 00 00           jmpf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmodf+0x369
 c7 82 ff              ldi16	r7, 0xff82
 2e                    sub	r7, r6
 0b                    mov	r6, r7
 af                    xor	r7, r7
 e3 00 00 00           callf	fmodf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_lshrsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff 7f              ldi16	r5, 0x7fff
 82                    and	r4, r6
 87                    and	r5, r7
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 07                 fneg	q3
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f0 69 04              cmp32	q0, q1
 fb 66                 cmov.ne	r4, r6
 fb 6f                 cmov.ne	r5, r7
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
