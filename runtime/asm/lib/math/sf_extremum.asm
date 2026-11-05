
math_sf_extremum.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_extremum.c
00000000 l    d  .text.fmaximumf	00000000 .text.fmaximumf
00000000 l     F .text.unlikely.avm_extremum_nan	0000009e avm_extremum_nan
00000000 l    d  .text.fminimumf	00000000 .text.fminimumf
00000000 l    d  .text.fmaximum_magf	00000000 .text.fmaximum_magf
00000000 l    d  .text.fminimum_magf	00000000 .text.fminimum_magf
00000000 l    d  .text.fmaximum_numf	00000000 .text.fmaximum_numf
00000000 l    d  .text.fminimum_numf	00000000 .text.fminimum_numf
00000000 l    d  .text.fmaximum_mag_numf	00000000 .text.fmaximum_mag_numf
00000000 l    d  .text.fminimum_mag_numf	00000000 .text.fminimum_mag_numf
00000000 l    d  .text.unlikely.avm_extremum_nan	00000000 .text.unlikely.avm_extremum_nan
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.fmaximumf	0000007c fmaximumf
00000000 g     F .text.fminimumf	0000007c fminimumf
00000000 g     F .text.fmaximum_magf	000000ac fmaximum_magf
00000000 g     F .text.fminimum_magf	00000092 fminimum_magf
00000000 g     F .text.fmaximum_numf	0000007d fmaximum_numf
00000000 g     F .text.fminimum_numf	0000007d fminimum_numf
00000000 g     F .text.fmaximum_mag_numf	000000ad fmaximum_mag_numf
00000000 g     F .text.fminimum_mag_numf	00000093 fminimum_mag_numf

Disassembly of section .text.fmaximumf:

<fmaximumf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f9 80                 and	r4, r0
 f9 a4                 and	r5, r1
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaximumf
		R_AVM_FAR24	.text.fmaximumf+0x69
<L0>:
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 f0 02 01              ldi8	r2, 0x1
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 04              cmp32	q0, q1
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaximumf
		R_AVM_FAR24	.text.fmaximumf+0x69
<L1>:
 f9 11                 or	r0, r4
 f9 35                 or	r1, r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaximumf
		R_AVM_FAR24	.text.fmaximumf+0x5c
<L2>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f2 63                 mov32	q0, q3
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 fb 04                 cmov.eq	r0, r4
 fb 0d                 cmov.eq	r1, r5
 f2 68                 mov32	q2, q0
 e2 00 00 00           jmpf	fmaximumf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmaximumf+0x62
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 82                    and	r4, r6
 87                    and	r5, r7
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 d6 fe                 adjsp	-0x2
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 e3 00 00 00           callf	fmaximumf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.unlikely.avm_extremum_nan
 d6 02                 adjsp	0x2
 e2 00 00 00           jmpf	fmaximumf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmaximumf+0x62

Disassembly of section .text.fminimumf:

<fminimumf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f9 80                 and	r4, r0
 f9 a4                 and	r5, r1
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fminimumf
		R_AVM_FAR24	.text.fminimumf+0x69
<L0>:
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 f0 02 01              ldi8	r2, 0x1
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 04              cmp32	q0, q1
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fminimumf
		R_AVM_FAR24	.text.fminimumf+0x69
<L1>:
 f9 11                 or	r0, r4
 f9 35                 or	r1, r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fminimumf
		R_AVM_FAR24	.text.fminimumf+0x5c
<L2>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f2 63                 mov32	q0, q3
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 fb 04                 cmov.eq	r0, r4
 fb 0d                 cmov.eq	r1, r5
 f2 68                 mov32	q2, q0
 e2 00 00 00           jmpf	fminimumf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fminimumf+0x62
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 92                    or	r4, r6
 97                    or	r5, r7
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 d6 fe                 adjsp	-0x2
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 e3 00 00 00           callf	fminimumf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.unlikely.avm_extremum_nan
 d6 02                 adjsp	0x2
 e2 00 00 00           jmpf	fminimumf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fminimumf+0x62

Disassembly of section .text.fmaximum_magf:

<fmaximum_magf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f9 c8                 and	r6, r2
 f9 ec                 and	r7, r3
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaximum_magf
		R_AVM_FAR24	.text.fmaximum_magf+0x95
<L0>:
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 f0 00 01              ldi8	r0, 0x1
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 40              cmp32	q1, q0
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaximum_magf
		R_AVM_FAR24	.text.fmaximum_magf+0x95
<L1>:
 f0 69 c4              cmp32	q3, q1
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaximum_magf
		R_AVM_FAR24	.text.fmaximum_magf+0x71
<L2>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaximum_magf
		R_AVM_FAR24	.text.fmaximum_magf+0x80
<L3>:
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f2 6a                 mov32	q3, q0
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 fb 04                 cmov.eq	r0, r4
 fb 0d                 cmov.eq	r1, r5
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e2 00 00 00           jmpf	fmaximum_magf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmaximum_magf+0x8a
 f0 69 4c              cmp32	q1, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 fc 34                 cmov.ult	r6, r4
 fc 3d                 cmov.ult	r7, r5
 e2 00 00 00           jmpf	fmaximum_magf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmaximum_magf+0x86
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 88                    and	r6, r4
 8d                    and	r7, r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 d6 fe                 adjsp	-0x2
 aa                    xor	r6, r6
 f4 42                 stsp16	[sp+0x0], r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 e3 00 00 00           callf	fmaximum_magf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.unlikely.avm_extremum_nan
 d6 02                 adjsp	0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 e2 00 00 00           jmpf	fmaximum_magf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmaximum_magf+0x8a

Disassembly of section .text.fminimum_magf:

<fminimum_magf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f9 88                 and	r4, r2
 f9 ac                 and	r5, r3
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 08              cmp32	q0, q2
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fminimum_magf
		R_AVM_FAR24	.text.fminimum_magf+0x7f
<L0>:
 f9 58                 and	r2, r6
 f9 7c                 and	r3, r7
 f0 00 01              ldi8	r0, 0x1
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 40              cmp32	q1, q0
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fminimum_magf
		R_AVM_FAR24	.text.fminimum_magf+0x7f
<L1>:
 f0 69 84              cmp32	q2, q1
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fminimum_magf
		R_AVM_FAR24	.text.fminimum_magf+0x63
<L2>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fminimum_magf
		R_AVM_FAR24	.text.fminimum_magf+0x72
<L3>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f2 63                 mov32	q0, q3
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 fb 04                 cmov.eq	r0, r4
 fb 0d                 cmov.eq	r1, r5
 f2 68                 mov32	q2, q0
 e2 00 00 00           jmpf	fminimum_magf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fminimum_magf+0x78
 f0 69 48              cmp32	q1, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 fc 26                 cmov.ult	r4, r6
 fc 2f                 cmov.ult	r5, r7
 e2 00 00 00           jmpf	fminimum_magf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fminimum_magf+0x78
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 92                    or	r4, r6
 97                    or	r5, r7
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 d6 fe                 adjsp	-0x2
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 e3 00 00 00           callf	fminimum_magf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.unlikely.avm_extremum_nan
 d6 02                 adjsp	0x2
 e2 00 00 00           jmpf	fminimum_magf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fminimum_magf+0x78

Disassembly of section .text.fmaximum_numf:

<fmaximum_numf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f9 80                 and	r4, r0
 f9 a4                 and	r5, r1
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaximum_numf
		R_AVM_FAR24	.text.fmaximum_numf+0x69
<L0>:
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 f0 02 01              ldi8	r2, 0x1
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 04              cmp32	q0, q1
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaximum_numf
		R_AVM_FAR24	.text.fmaximum_numf+0x69
<L1>:
 f9 11                 or	r0, r4
 f9 35                 or	r1, r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaximum_numf
		R_AVM_FAR24	.text.fmaximum_numf+0x5c
<L2>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f2 63                 mov32	q0, q3
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 fb 04                 cmov.eq	r0, r4
 fb 0d                 cmov.eq	r1, r5
 f2 68                 mov32	q2, q0
 e2 00 00 00           jmpf	fmaximum_numf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmaximum_numf+0x62
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 82                    and	r4, r6
 87                    and	r5, r7
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 d6 fe                 adjsp	-0x2
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 e3 00 00 00           callf	fmaximum_numf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.unlikely.avm_extremum_nan
 d6 02                 adjsp	0x2
 e2 00 00 00           jmpf	fmaximum_numf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmaximum_numf+0x62

Disassembly of section .text.fminimum_numf:

<fminimum_numf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f9 80                 and	r4, r0
 f9 a4                 and	r5, r1
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fminimum_numf
		R_AVM_FAR24	.text.fminimum_numf+0x69
<L0>:
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 f0 02 01              ldi8	r2, 0x1
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 04              cmp32	q0, q1
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fminimum_numf
		R_AVM_FAR24	.text.fminimum_numf+0x69
<L1>:
 f9 11                 or	r0, r4
 f9 35                 or	r1, r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fminimum_numf
		R_AVM_FAR24	.text.fminimum_numf+0x5c
<L2>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f2 63                 mov32	q0, q3
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 fb 04                 cmov.eq	r0, r4
 fb 0d                 cmov.eq	r1, r5
 f2 68                 mov32	q2, q0
 e2 00 00 00           jmpf	fminimum_numf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fminimum_numf+0x62
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 92                    or	r4, r6
 97                    or	r5, r7
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 d6 fe                 adjsp	-0x2
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 e3 00 00 00           callf	fminimum_numf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.unlikely.avm_extremum_nan
 d6 02                 adjsp	0x2
 e2 00 00 00           jmpf	fminimum_numf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fminimum_numf+0x62

Disassembly of section .text.fmaximum_mag_numf:

<fmaximum_mag_numf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f9 c8                 and	r6, r2
 f9 ec                 and	r7, r3
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaximum_mag_numf
		R_AVM_FAR24	.text.fmaximum_mag_numf+0x95
<L0>:
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 f0 00 01              ldi8	r0, 0x1
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 40              cmp32	q1, q0
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaximum_mag_numf
		R_AVM_FAR24	.text.fmaximum_mag_numf+0x95
<L1>:
 f0 69 c4              cmp32	q3, q1
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaximum_mag_numf
		R_AVM_FAR24	.text.fmaximum_mag_numf+0x71
<L2>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fmaximum_mag_numf
		R_AVM_FAR24	.text.fmaximum_mag_numf+0x80
<L3>:
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f2 6a                 mov32	q3, q0
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 fb 04                 cmov.eq	r0, r4
 fb 0d                 cmov.eq	r1, r5
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e2 00 00 00           jmpf	fmaximum_mag_numf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmaximum_mag_numf+0x8a
 f0 69 4c              cmp32	q1, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 fc 34                 cmov.ult	r6, r4
 fc 3d                 cmov.ult	r7, r5
 e2 00 00 00           jmpf	fmaximum_mag_numf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmaximum_mag_numf+0x86
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 88                    and	r6, r4
 8d                    and	r7, r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 d6 fe                 adjsp	-0x2
 c2 01                 ldi8	r6, 0x1
 f4 42                 stsp16	[sp+0x0], r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 e3 00 00 00           callf	fmaximum_mag_numf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.unlikely.avm_extremum_nan
 d6 02                 adjsp	0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 e2 00 00 00           jmpf	fmaximum_mag_numf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fmaximum_mag_numf+0x8a

Disassembly of section .text.fminimum_mag_numf:

<fminimum_mag_numf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f9 88                 and	r4, r2
 f9 ac                 and	r5, r3
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 08              cmp32	q0, q2
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fminimum_mag_numf
		R_AVM_FAR24	.text.fminimum_mag_numf+0x7f
<L0>:
 f9 58                 and	r2, r6
 f9 7c                 and	r3, r7
 f0 00 01              ldi8	r0, 0x1
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 40              cmp32	q1, q0
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fminimum_mag_numf
		R_AVM_FAR24	.text.fminimum_mag_numf+0x7f
<L1>:
 f0 69 84              cmp32	q2, q1
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fminimum_mag_numf
		R_AVM_FAR24	.text.fminimum_mag_numf+0x63
<L2>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fminimum_mag_numf
		R_AVM_FAR24	.text.fminimum_mag_numf+0x72
<L3>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f2 63                 mov32	q0, q3
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 fb 04                 cmov.eq	r0, r4
 fb 0d                 cmov.eq	r1, r5
 f2 68                 mov32	q2, q0
 e2 00 00 00           jmpf	fminimum_mag_numf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fminimum_mag_numf+0x78
 f0 69 48              cmp32	q1, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 fc 26                 cmov.ult	r4, r6
 fc 2f                 cmov.ult	r5, r7
 e2 00 00 00           jmpf	fminimum_mag_numf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fminimum_mag_numf+0x78
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 92                    or	r4, r6
 97                    or	r5, r7
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 d6 fe                 adjsp	-0x2
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 e3 00 00 00           callf	fminimum_mag_numf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.unlikely.avm_extremum_nan
 d6 02                 adjsp	0x2
 e2 00 00 00           jmpf	fminimum_mag_numf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fminimum_mag_numf+0x78

Disassembly of section .text.unlikely.avm_extremum_nan:

<avm_extremum_nan>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 f0 32 15              ldsp16	r2, [sp+0x15]
 f6 2a                 tst16	r2
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_extremum_nan
		R_AVM_FAR24	.text.unlikely.avm_extremum_nan+0x63
<L0>:
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 4c              cmp32	q1, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 f8 16                 cset.ult	r6
 f4 42                 stsp16	[sp+0x0], r6
 c2 01                 ldi8	r6, 0x1
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 8c              cmp32	q2, q3
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_extremum_nan
		R_AVM_FAR24	.text.unlikely.avm_extremum_nan+0x7b
<L1>:
 f9 08                 and	r0, r2
 f9 2c                 and	r1, r3
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_extremum_nan
		R_AVM_FAR24	.text.unlikely.avm_extremum_nan+0x7b
<L2>:
 c2 40                 ldi8	r6, 0x40
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 99                    or	r6, r5
 06                    mov	r5, r6
 e2 00 00 00           jmpf	avm_extremum_nan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.unlikely.avm_extremum_nan+0x97
 f0 00 01              ldi8	r0, 0x1
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_extremum_nan
		R_AVM_FAR24	.text.unlikely.avm_extremum_nan+0x8e
<L3>:
 c2 40                 ldi8	r6, 0x40
 99                    or	r6, r5
 06                    mov	r5, r6
 e2 00 00 00           jmpf	avm_extremum_nan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.unlikely.avm_extremum_nan+0x97
 c0 01                 ldi8	r4, 0x1
 f4 01                 ldsp16	r5, [sp+0x0]
 84                    and	r5, r4
 f4 a5                 tst8	r5
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 fb 62                 cmov.ne	r4, r2
 fb 6b                 cmov.ne	r5, r3
 e2 00 00 00           jmpf	avm_extremum_nan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.unlikely.avm_extremum_nan+0x97
 c0 40                 ldi8	r4, 0x40
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 93                    or	r4, r7
 04                    mov	r5, r4
 02                    mov	r4, r6
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
