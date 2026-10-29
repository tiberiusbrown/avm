
stdio_format.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 stdio_format.c
00000000 l    d  .text.vfprintf	00000000 .text.vfprintf
00000000 l    d  .text.fprintf	00000000 .text.fprintf
00000000 g     F .text.vfprintf	00000075 vfprintf
00000000         *UND*	00000000 __avm_errno
00000000 g     F .text.fprintf	0000006d fprintf

Disassembly of section .text.vfprintf:

<vfprintf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f1 16                 mov	r2, r6
 f0 04 ff ff           ldi16	r0, 0xffff
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	vfprintf
		R_AVM_FAR24	.text.vfprintf+0x40
<L0>:
 f5 33                 ld8u	r3, [r4]
 c3 22                 ldi8	r7, 0x22
 f9 ec                 and	r7, r3
 cf 02                 cmpi.s8	r7, 0x2
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	vfprintf
		R_AVM_FAR24	.text.vfprintf+0x46
<L1>:
 c3 c0                 ldi8	r7, 0xc0
 f9 ec                 and	r7, r3
 cf 40                 cmpi.s8	r7, 0x40
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	vfprintf
		R_AVM_FAR24	.text.vfprintf+0x4c
<L2>:
 f4 a7                 tst8	r7
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	vfprintf
		R_AVM_FAR24	.text.vfprintf+0x63
<L3>:
 c3 40                 ldi8	r7, 0x40
 f9 7d                 or	r3, r7
 f1 0c                 mov	r1, r4
 f3 03                 st8	[r4], r3
 e2 00 00 00           jmpf	vfprintf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.vfprintf+0x4e
 c1 09                 ldi8	r5, 0x9
 e2 00 00 00           jmpf	vfprintf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.vfprintf+0x6a
 c1 09                 ldi8	r5, 0x9
 e2 00 00 00           jmpf	vfprintf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.vfprintf+0x65
 f1 0c                 mov	r1, r4
 09                    mov	r6, r5
 d7 3d                 sys	debug_printfv
 f1 04                 mov	r0, r4
 f6 28                 tst16	r0
 d3 04                 brslt8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	vfprintf
		R_AVM_FAR24	.text.vfprintf+0x6e
<L4>:
 c1 05                 ldi8	r5, 0x5
 f1 21                 mov	r4, r1
 e2 00 00 00           jmpf	vfprintf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.vfprintf+0x65
 c1 16                 ldi8	r5, 0x16
 c2 08                 ldi8	r6, 0x8
 f9 cd                 or	r6, r3
 52                    st8	[r4], r6
 f0 5d 00 00           stm16	[0x0], r5
		R_AVM_DATA16	__avm_errno
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.fprintf:

<fprintf>:
 b2                    push16	r2
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f4 2e                 ldsp16	r6, [sp+0xb]
 f4 25                 ldsp16	r5, [sp+0x9]
 f0 12 0d              leasp	r2, 0xd
 f0 3a 00              stsp16	[sp+0x0], r2
 c4 ff ff              ldi16	r4, 0xffff
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fprintf
		R_AVM_FAR24	.text.fprintf+0x51
<L0>:
 f5 34                 ld8u	r0, [r5]
 c3 22                 ldi8	r7, 0x22
 f9 e0                 and	r7, r0
 cf 02                 cmpi.s8	r7, 0x2
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fprintf
		R_AVM_FAR24	.text.fprintf+0x57
<L1>:
 c3 c0                 ldi8	r7, 0xc0
 f9 e0                 and	r7, r0
 cf 40                 cmpi.s8	r7, 0x40
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fprintf
		R_AVM_FAR24	.text.fprintf+0x41
<L2>:
 f4 a7                 tst8	r7
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fprintf
		R_AVM_FAR24	.text.fprintf+0x5d
<L3>:
 c0 40                 ldi8	r4, 0x40
 f9 11                 or	r0, r4
 f3 04                 st8	[r5], r0
 d7 3d                 sys	debug_printfv
 f6 2c                 tst16	r4
 d3 04                 brslt8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fprintf
		R_AVM_FAR24	.text.fprintf+0x68
<L4>:
 c2 05                 ldi8	r6, 0x5
 e2 00 00 00           jmpf	fprintf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fprintf+0x5f
 c2 09                 ldi8	r6, 0x9
 e2 00 00 00           jmpf	fprintf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fprintf+0x64
 c2 09                 ldi8	r6, 0x9
 e2 00 00 00           jmpf	fprintf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fprintf+0x5f
 c2 16                 ldi8	r6, 0x16
 c3 08                 ldi8	r7, 0x8
 f9 e1                 or	r7, r0
 57                    st8	[r5], r7
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 ba                    pop16	r2
 ef                    ret
