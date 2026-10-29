
complex_trig.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 trig.c
00000000 l    d  .text.csinf	00000000 .text.csinf
00000000 l    d  .text.ccosf	00000000 .text.ccosf
00000000 l    d  .text.ctanf	00000000 .text.ctanf
00000000 g     F .text.csinf	00000082 csinf
00000000         *UND*	00000000 csinhf
00000000 g     F .text.ccosf	0000004b ccosf
00000000         *UND*	00000000 ccoshf
00000000 g     F .text.ctanf	0000004d ctanf
00000000         *UND*	00000000 ctanhf

Disassembly of section .text.csinf:

<csinf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e6                 adjsp	-0x1a
 f4 60                 stsp16	[sp+0x8], r4
 f0 6a 0a              ld32	q0, [r5]
 c9 04                 addi.s8	r5, 0x4
 f0 6a 4a              ld32	q1, [r5]
 f2 69                 mov32	q2, q1
 ff 06                 fneg	q2
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 14 12              leasp	r4, 0x12
 f0 15 0a              leasp	r5, 0xa
 e3 00 00 00           callf	csinf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	csinhf
 c4 80 7f              ldi16	r4, 0x7f80
 f9 30                 and	r1, r4
 f5 0c                 cmp	r1, r4
 f8 04                 cset.eq	r4
 f0 00 01              ldi8	r0, 0x1
 f9 10                 and	r0, r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 ff 06                 fneg	q2
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f4 a0                 tst8	r0
 f2 62                 mov32	q0, q2
 fb 46                 cmov.ne	r0, r6
 fb 4f                 cmov.ne	r1, r7
 f4 83                 lsl16.1	r3
 c6 00 ff              ldi16	r6, 0xff00
 f9 ce                 xor	r6, r3
 f9 59                 or	r2, r6
 f6 2a                 tst16	r2
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 6b c0              st32	[r0], q3
 f1 28                 mov	r6, r0
 ca 04                 addi.s8	r6, 0x4
 f0 6b 8c              st32	[r6], q2
 f1 20                 mov	r4, r0
 d6 1a                 adjsp	0x1a
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.ccosf:

<ccosf>:
 b3                    push16	r3
 b2                    push16	r2
 b0                    push16	r0
 d6 e8                 adjsp	-0x18
 f1 04                 mov	r0, r4
 f0 6a ca              ld32	q3, [r5]
 c9 04                 addi.s8	r5, 0x4
 f0 6a 8a              ld32	q2, [r5]
 ff 06                 fneg	q2
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 14 10              leasp	r4, 0x10
 f0 15 08              leasp	r5, 0x8
 e3 00 00 00           callf	ccosf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	ccoshf
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f1 20                 mov	r4, r0
 c8 04                 addi.s8	r4, 0x4
 f0 6b c8              st32	[r4], q3
 f0 6b 40              st32	[r0], q1
 f1 20                 mov	r4, r0
 d6 18                 adjsp	0x18
 b8                    pop16	r0
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.ctanf:

<ctanf>:
 b3                    push16	r3
 b2                    push16	r2
 b0                    push16	r0
 d6 e8                 adjsp	-0x18
 f1 04                 mov	r0, r4
 f0 6a ca              ld32	q3, [r5]
 c9 04                 addi.s8	r5, 0x4
 f0 6a 8a              ld32	q2, [r5]
 ff 06                 fneg	q2
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 14 10              leasp	r4, 0x10
 f0 15 08              leasp	r5, 0x8
 e3 00 00 00           callf	ctanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	ctanhf
 f0 32 14              ldsp16	r2, [sp+0x14]
 f0 33 16              ldsp16	r3, [sp+0x16]
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 07                 fneg	q3
 f1 20                 mov	r4, r0
 c8 04                 addi.s8	r4, 0x4
 f0 6b c8              st32	[r4], q3
 f0 6b 40              st32	[r0], q1
 f1 20                 mov	r4, r0
 d6 18                 adjsp	0x18
 b8                    pop16	r0
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
