
math_ef_log.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 ef_log.c
00000000 l    d  .text.logf	00000000 .text.logf
00000000 g     F .text.logf	00000115 logf
00000000         *UND*	00000000 __avm_errno

Disassembly of section .text.logf:

<logf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 aa                    xor	r6, r6
 c7 80 80              ldi16	r7, 0x8080
 f2 62                 mov32	q0, q2
 f7 63                 add32	q0, q3
 f0 69 c0              cmp32	q3, q0
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	logf
		R_AVM_FAR24	.text.logf+0xb2
<L0>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 01 7f              ldi8	r1, 0x7f
 f0 69 08              cmp32	q0, q2
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	logf
		R_AVM_FAR24	.text.logf+0x34
<L1>:
 aa                    xor	r6, r6
 c7 00 4c              ldi16	r7, 0x4c00
 ff 02                 fmul
 c6 68 ff              ldi16	r6, 0xff68
 e2 00 00 00           jmpf	logf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.logf+0x37
 c6 81 ff              ldi16	r6, 0xff81
 f4 42                 stsp16	[sp+0x0], r6
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f0 06 20 fb           ldi16	r2, 0xfb20
 f0 03 4a              ldi8	r3, 0x4a
 f7 64                 add32	q1, q0
 c3 80                 ldi8	r7, 0x80
 f9 ec                 and	r7, r3
 f9 3d                 or	r1, r7
 f1 28                 mov	r6, r0
 f1 2d                 mov	r7, r1
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f9 1a                 xor	r0, r6
 f9 3e                 xor	r1, r7
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f1 2b                 mov	r6, r3
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 18                    add	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 15 07 a7 65 34 3e a3 bd 8a be 49 17 97 3e 10 e7 b7 be 96 17 f6 3e 8e ab 38 bf 46 aa b8 3f  fpoly	7, 0.176169023, -0.270978063, 0.295099527, -0.359184742, 0.480648696, -0.721367717, 1.44269633
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 ff 0c                 s16tof
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 c6 18 72              ldi16	r6, 0x7218
 c7 31 3f              ldi16	r7, 0x3f31
 ff 02                 fmul
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	logf
		R_AVM_FAR24	.text.logf+0xe0
<L2>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 69 08              cmp32	q0, q2
 d3 04                 brslt8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	logf
		R_AVM_FAR24	.text.logf+0xee
<L3>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 e2 00 00 00           jmpf	logf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.logf+0xab
 c0 22                 ldi8	r4, 0x22
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 a0                    xor	r4, r4
 c5 80 ff              ldi16	r5, 0xff80
 e2 00 00 00           jmpf	logf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.logf+0xab
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 0c              cmp32	q0, q3
 d2 04                 brult8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	logf
		R_AVM_FAR24	.text.logf+0x106
<L4>:
 c6 c0 7f              ldi16	r6, 0x7fc0
 99                    or	r6, r5
 06                    mov	r5, r6
 e2 00 00 00           jmpf	logf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.logf+0xab
 c2 21                 ldi8	r6, 0x21
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 c6 c0 7f              ldi16	r6, 0x7fc0
 99                    or	r6, r5
 06                    mov	r5, r6
 e2 00 00 00           jmpf	logf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.logf+0xab
