
stdio_format.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 stdio_format.c
00000000 l    d  .text.vfprintf	00000000 .text.vfprintf
00000000 l    d  .text.fprintf	00000000 .text.fprintf
00000000 g     F .text.vfprintf	00000059 vfprintf
00000000         *UND*	00000000 __avm_errno
00000000 g     F .text.fprintf	00000056 fprintf

Disassembly of section .text.vfprintf:

<vfprintf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f1 16                 mov	r2, r6
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	vfprintf
		R_AVM_FAR24	.text.vfprintf+0x3a
<L0>:
 f5 33                 ld8u	r3, [r4]
 c3 22                 ldi8	r7, 0x22
 f9 ec                 and	r7, r3
 cf 02                 cmpi.s8	r7, 0x2
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	vfprintf
		R_AVM_FAR24	.text.vfprintf+0x43
<L1>:
 c3 40                 ldi8	r7, 0x40
 f9 ed                 or	r7, r3
 f1 0c                 mov	r1, r4
 53                    st8	[r4], r7
 09                    mov	r6, r5
 d7 3d                 sys	debug_printfv
 04                    mov	r5, r4
 f6 2d                 tst16	r5
 d3 04                 brslt8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	vfprintf
		R_AVM_FAR24	.text.vfprintf+0x53
<L2>:
 c2 05                 ldi8	r6, 0x5
 f0 00 48              ldi8	r0, 0x48
 f1 21                 mov	r4, r1
 e2 00 00 00           jmpf	vfprintf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.vfprintf+0x4b
 c5 ff ff              ldi16	r5, 0xffff
 c2 09                 ldi8	r6, 0x9
 e2 00 00 00           jmpf	vfprintf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.vfprintf+0x4f
 c5 ff ff              ldi16	r5, 0xffff
 c2 09                 ldi8	r6, 0x9
 f0 00 08              ldi8	r0, 0x8
 f9 61                 or	r3, r0
 f3 03                 st8	[r4], r3
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 01                    mov	r4, r5
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
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fprintf
		R_AVM_FAR24	.text.fprintf+0x39
<L0>:
 4d                    ld8u	r7, [r5]
 c0 22                 ldi8	r4, 0x22
 83                    and	r4, r7
 cc 02                 cmpi.s8	r4, 0x2
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fprintf
		R_AVM_FAR24	.text.fprintf+0x43
<L1>:
 c0 40                 ldi8	r4, 0x40
 93                    or	r4, r7
 54                    st8	[r5], r4
 d7 3d                 sys	debug_printfv
 f6 2c                 tst16	r4
 d3 04                 brslt8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fprintf
		R_AVM_FAR24	.text.fprintf+0x51
<L2>:
 f0 00 05              ldi8	r0, 0x5
 c2 48                 ldi8	r6, 0x48
 e2 00 00 00           jmpf	fprintf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fprintf+0x4b
 c4 ff ff              ldi16	r4, 0xffff
 f0 00 09              ldi8	r0, 0x9
 e2 00 00 00           jmpf	fprintf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fprintf+0x4d
 c4 ff ff              ldi16	r4, 0xffff
 f0 00 09              ldi8	r0, 0x9
 c2 08                 ldi8	r6, 0x8
 9b                    or	r6, r7
 56                    st8	[r5], r6
 f0 58 00 00           stm16	[0x0], r0
		R_AVM_DATA16	__avm_errno
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 ba                    pop16	r2
 ef                    ret
