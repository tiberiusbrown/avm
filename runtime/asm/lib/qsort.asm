
qsort.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 qsort.c
00000000 l    d  .text.qsort	00000000 .text.qsort
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.qsort	000001c0 qsort

Disassembly of section .text.qsort:

<qsort>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	-0x12
 0d                    mov	r7, r5
 f1 0c                 mov	r1, r4
 f0 34 1d              ldsp16	r4, [sp+0x1d]
 f0 1d 1f              ldsp8u	r5, [sp+0x1f]
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 cf 02                 cmpi.s8	r7, 0x2
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	qsort
		R_AVM_FAR24	.text.qsort+0x1b9
<L0>:
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	qsort
		R_AVM_FAR24	.text.qsort+0x1b9
<L1>:
 f1 07                 mov	r0, r7
 f4 b0                 dec16	r0
 03                    mov	r4, r7
 f4 8c                 lsr16.1	r4
 f4 73                 stsp16	[sp+0xc], r7
 cb fe                 addi.s8	r7, -0x2
 f4 8f                 lsr16.1	r7
 f4 63                 stsp16	[sp+0x8], r7
 f0 39 04              stsp16	[sp+0x4], r1
 f0 38 06              stsp16	[sp+0x6], r0
 f4 42                 stsp16	[sp+0x0], r6
 e2 00 00 00           jmpf	qsort
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.qsort+0x49
 f4 28                 ldsp16	r4, [sp+0xa]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	qsort
		R_AVM_FAR24	.text.qsort+0xd9
<L2>:
 f4 b4                 dec16	r4
 f4 21                 ldsp16	r5, [sp+0x8]
 34                    cmp	r5, r4
 f4 68                 stsp16	[sp+0xa], r4
 04                    mov	r5, r4
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	qsort
		R_AVM_FAR24	.text.qsort+0x3f
<L3>:
 f1 1d                 mov	r3, r5
 fe 1e                 mul16	r3, r6
 f2 19                 add	r3, r1
 15                    add	r5, r5
 f1 15                 mov	r2, r5
 c0 01                 ldi8	r4, 0x1
 f9 51                 or	r2, r4
 f5 10                 cmp	r2, r0
 d2 04                 brult8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	qsort
		R_AVM_FAR24	.text.qsort+0x8d
<L4>:
 f1 22                 mov	r4, r2
 fe 26                 mul16	r4, r6
 f2 21                 add	r4, r1
 c9 02                 addi.s8	r5, 0x2
 f4 49                 stsp16	[sp+0x2], r5
 fe 2e                 mul16	r5, r6
 f2 25                 add	r5, r1
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 e8                    callp	q0
 f4 11                 ldsp16	r5, [sp+0x4]
 f6 2c                 tst16	r4
 f4 08                 ldsp16	r4, [sp+0x2]
 fd 14                 cmov.slt	r2, r4
 e2 00 00 00           jmpf	qsort
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.qsort+0x95
 f1 25                 mov	r5, r1
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 f0 3a 02              stsp16	[sp+0x2], r2
 f4 00                 ldsp16	r4, [sp+0x0]
 fe 14                 mul16	r2, r4
 f2 15                 add	r2, r5
 f1 23                 mov	r4, r3
 f1 26                 mov	r5, r2
 e8                    callp	q0
 f0 31 04              ldsp16	r1, [sp+0x4]
 f6 2c                 tst16	r4
 f4 02                 ldsp16	r6, [sp+0x0]
 f0 30 06              ldsp16	r0, [sp+0x6]
 d3 04                 brslt8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	qsort
		R_AVM_FAR24	.text.qsort+0x3f
<L5>:
 02                    mov	r4, r6
 ed a6 20              ld8u	r5, [r3+0]
 ed e4 20              ld8u	r7, [r2+0]
 f0 6d e7              st8	[r3+], r7
 f0 6d a5              st8	[r2+], r5
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	qsort
		R_AVM_FAR24	.text.qsort+0xb4
<L6>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 09                 ldsp16	r5, [sp+0x2]
 31                    cmp	r4, r5
 d2 04                 brult8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	qsort
		R_AVM_FAR24	.text.qsort+0x57
<L7>:
 e2 00 00 00           jmpf	qsort
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.qsort+0x3f
 f1 16                 mov	r2, r6
 fe 10                 mul16	r2, r0
 f4 30                 ldsp16	r4, [sp+0xc]
 e2 00 00 00           jmpf	qsort
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.qsort+0xf9
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f2 46                 sub	r2, r6
 f4 30                 ldsp16	r4, [sp+0xc]
 f1 04                 mov	r0, r4
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 f0 31 04              ldsp16	r1, [sp+0x4]
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	qsort
		R_AVM_FAR24	.text.qsort+0x1b9
<L8>:
 f1 1c                 mov	r3, r4
 f0 38 0c              stsp16	[sp+0xc], r0
 f1 21                 mov	r4, r1
 06                    mov	r5, r6
 0c                    mov	r7, r4
 f2 2e                 add	r7, r2
 f5 3c                 ld8u	r0, [r7]
 f5 31                 ld8u	r1, [r4]
 f3 00                 st8	[r4], r0
 f3 0d                 st8	[r7], r1
 f4 ac                 inc16	r4
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	qsort
		R_AVM_FAR24	.text.qsort+0x101
<L9>:
 f0 3a 0a              stsp16	[sp+0xa], r2
 f1 03                 mov	r0, r3
 f0 08 fe              addi.s8	r0, -0x2
 f6 28                 tst16	r0
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	qsort
		R_AVM_FAR24	.text.qsort+0xe3
<L10>:
 f0 0b fd              addi.s8	r3, -0x3
 f4 8b                 lsr16.1	r3
 f0 3b 06              stsp16	[sp+0x6], r3
 a5                    xor	r5, r5
 f0 38 08              stsp16	[sp+0x8], r0
 f1 1d                 mov	r3, r5
 fe 1e                 mul16	r3, r6
 f4 13                 ldsp16	r7, [sp+0x4]
 f2 1f                 add	r3, r7
 15                    add	r5, r5
 f1 15                 mov	r2, r5
 c0 01                 ldi8	r4, 0x1
 f9 51                 or	r2, r4
 f5 10                 cmp	r2, r0
 d2 04                 brult8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	qsort
		R_AVM_FAR24	.text.qsort+0x16a
<L11>:
 f1 22                 mov	r4, r2
 fe 26                 mul16	r4, r6
 13                    add	r4, r7
 c9 02                 addi.s8	r5, 0x2
 f4 49                 stsp16	[sp+0x2], r5
 fe 2e                 mul16	r5, r6
 17                    add	r5, r7
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 e8                    callp	q0
 f4 13                 ldsp16	r7, [sp+0x4]
 f6 2c                 tst16	r4
 f4 08                 ldsp16	r4, [sp+0x2]
 fd 14                 cmov.slt	r2, r4
 e2 00 00 00           jmpf	qsort
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.qsort+0x170
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 f0 3a 02              stsp16	[sp+0x2], r2
 f4 00                 ldsp16	r4, [sp+0x0]
 fe 14                 mul16	r2, r4
 f2 17                 add	r2, r7
 f1 23                 mov	r4, r3
 f1 26                 mov	r5, r2
 e8                    callp	q0
 f6 2c                 tst16	r4
 f4 02                 ldsp16	r6, [sp+0x0]
 f0 30 08              ldsp16	r0, [sp+0x8]
 d3 04                 brslt8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	qsort
		R_AVM_FAR24	.text.qsort+0xe3
<L12>:
 02                    mov	r4, r6
 ed a6 20              ld8u	r5, [r3+0]
 ed e4 20              ld8u	r7, [r2+0]
 f0 6d e7              st8	[r3+], r7
 f0 6d a5              st8	[r2+], r5
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	qsort
		R_AVM_FAR24	.text.qsort+0x18c
<L13>:
 f4 09                 ldsp16	r5, [sp+0x2]
 f5 24                 cmp	r5, r0
 d2 04                 brult8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	qsort
		R_AVM_FAR24	.text.qsort+0xe3
<L14>:
 f4 18                 ldsp16	r4, [sp+0x6]
 31                    cmp	r4, r5
 d2 04                 brult8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	qsort
		R_AVM_FAR24	.text.qsort+0x134
<L15>:
 e2 00 00 00           jmpf	qsort
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.qsort+0xe3
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
