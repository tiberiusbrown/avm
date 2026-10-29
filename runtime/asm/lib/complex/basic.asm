
complex_basic.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 basic.c
00000000 l    d  .text.crealf	00000000 .text.crealf
00000000 l    d  .text.cimagf	00000000 .text.cimagf
00000000 l    d  .text.conjf	00000000 .text.conjf
00000000 l    d  .text.cprojf	00000000 .text.cprojf
00000000 l    d  .text.cabsf	00000000 .text.cabsf
00000000 l    d  .text.cargf	00000000 .text.cargf
00000000 g     F .text.crealf	00000004 crealf
00000000 g     F .text.cimagf	00000006 cimagf
00000000 g     F .text.conjf	00000019 conjf
00000000 g     F .text.cprojf	00000061 cprojf
00000000         *UND*	00000000 copysignf
00000000 g     F .text.cabsf	00000012 cabsf
00000000         *UND*	00000000 hypotf
00000000 g     F .text.cargf	0000000c cargf
00000000         *UND*	00000000 atan2f

Disassembly of section .text.crealf:

<crealf>:
 f0 6a 88              ld32	q2, [r4]
 ef                    ret

Disassembly of section .text.cimagf:

<cimagf>:
 c8 04                 addi.s8	r4, 0x4
 f0 6a 88              ld32	q2, [r4]
 ef                    ret

Disassembly of section .text.conjf:

<conjf>:
 b1                    push16	r1
 b0                    push16	r0
 09                    mov	r6, r5
 ca 04                 addi.s8	r6, 0x4
 f0 6a cc              ld32	q3, [r6]
 f0 6a 0a              ld32	q0, [r5]
 f0 6b 08              st32	[r4], q0
 04                    mov	r5, r4
 c9 04                 addi.s8	r5, 0x4
 ff 07                 fneg	q3
 f0 6b ca              st32	[r5], q3
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

Disassembly of section .text.cprojf:

<cprojf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 0c                    mov	r7, r4
 f0 6a 0a              ld32	q0, [r5]
 f1 29                 mov	r6, r1
 1a                    add	r6, r6
 c4 00 ff              ldi16	r4, 0xff00
 a8                    xor	r6, r4
 f1 20                 mov	r4, r0
 92                    or	r4, r6
 c9 04                 addi.s8	r5, 0x4
 f0 6a 4a              ld32	q1, [r5]
 f1 27                 mov	r5, r3
 15                    add	r5, r5
 c6 00 ff              ldi16	r6, 0xff00
 a6                    xor	r5, r6
 f1 2a                 mov	r6, r2
 99                    or	r6, r5
 f6 2e                 tst16	r6
 f8 05                 cset.eq	r5
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cprojf
		R_AVM_FAR24	.text.cprojf+0x3a
<L0>:
 c0 01                 ldi8	r4, 0x1
 84                    and	r5, r4
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	cprojf
		R_AVM_FAR24	.text.cprojf+0x50
<L1>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f4 43                 stsp16	[sp+0x0], r7
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	cprojf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	copysignf
 f2 66                 mov32	q1, q2
 f4 03                 ldsp16	r7, [sp+0x0]
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 6b 0e              st32	[r7], q0
 07                    mov	r5, r7
 c9 04                 addi.s8	r5, 0x4
 f0 6b 4a              st32	[r5], q1
 03                    mov	r4, r7
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.cabsf:

<cabsf>:
 b1                    push16	r1
 b0                    push16	r0
 f0 6a 08              ld32	q0, [r4]
 c8 04                 addi.s8	r4, 0x4
 f0 6a c8              ld32	q3, [r4]
 f2 68                 mov32	q2, q0
 b8                    pop16	r0
 b9                    pop16	r1
 e2 00 00 00           jmpf	cabsf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	hypotf

Disassembly of section .text.cargf:

<cargf>:
 f0 6a c8              ld32	q3, [r4]
 c8 04                 addi.s8	r4, 0x4
 f0 6a 88              ld32	q2, [r4]
 e2 00 00 00           jmpf	cargf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	atan2f
