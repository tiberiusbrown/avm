
qsort.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 qsort.c
00000000 l    d  .text.qsort	00000000 .text.qsort
00000000 g     F .text.qsort	000001cb qsort

Disassembly of section .text.qsort:

<qsort>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	-0x12
 f0 30 1d              ldsp16	r0, [sp+0x1d]
 f0 19 1f              ldsp8u	r1, [sp+0x1f]
 f0 38 0e              stsp16	[sp+0xe], r0
 f0 39 10              stsp16	[sp+0x10], r1
 f1 06                 mov	r0, r6
 08                    mov	r6, r4
 cd 02                 cmpi.s8	r5, 0x2
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	qsort
		R_AVM_FAR24	.text.qsort+0x1c4
<L0>:
 f6 28                 tst16	r0
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	qsort
		R_AVM_FAR24	.text.qsort+0x1c4
<L1>:
 0d                    mov	r7, r5
 f4 b7                 dec16	r7
 01                    mov	r4, r5
 f4 8c                 lsr16.1	r4
 f4 71                 stsp16	[sp+0xc], r5
 c9 fe                 addi.s8	r5, -0x2
 f4 8d                 lsr16.1	r5
 f4 51                 stsp16	[sp+0x4], r5
 f4 4a                 stsp16	[sp+0x2], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 38 08              stsp16	[sp+0x8], r0
 e2 00 00 00           jmpf	qsort
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.qsort+0x48
 f4 28                 ldsp16	r4, [sp+0xa]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	qsort
		R_AVM_FAR24	.text.qsort+0xe8
<L2>:
 f4 b4                 dec16	r4
 f4 68                 stsp16	[sp+0xa], r4
 33                    cmp	r4, r7
 d2 04                 brult8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	qsort
		R_AVM_FAR24	.text.qsort+0x3e
<L3>:
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 11                 ldsp16	r5, [sp+0x4]
 34                    cmp	r5, r4
 04                    mov	r5, r4
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	qsort
		R_AVM_FAR24	.text.qsort+0x3e
<L4>:
 f1 1d                 mov	r3, r5
 fe 18                 mul16	r3, r0
 f2 1e                 add	r3, r6
 15                    add	r5, r5
 f1 15                 mov	r2, r5
 c0 01                 ldi8	r4, 0x1
 f9 51                 or	r2, r4
 f5 17                 cmp	r2, r7
 d2 04                 brult8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	qsort
		R_AVM_FAR24	.text.qsort+0x93
<L5>:
 f1 22                 mov	r4, r2
 fe 20                 mul16	r4, r0
 12                    add	r4, r6
 c9 02                 addi.s8	r5, 0x2
 f4 41                 stsp16	[sp+0x0], r5
 fe 28                 mul16	r5, r0
 16                    add	r5, r6
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 e8                    callp	q0
 f4 0a                 ldsp16	r6, [sp+0x2]
 f6 2c                 tst16	r4
 f4 00                 ldsp16	r4, [sp+0x0]
 fd 14                 cmov.slt	r2, r4
 e2 00 00 00           jmpf	qsort
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.qsort+0x99
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 f0 3a 00              stsp16	[sp+0x0], r2
 f4 20                 ldsp16	r4, [sp+0x8]
 fe 14                 mul16	r2, r4
 f2 16                 add	r2, r6
 f1 23                 mov	r4, r3
 f1 26                 mov	r5, r2
 e8                    callp	q0
 f4 0a                 ldsp16	r6, [sp+0x2]
 f6 2c                 tst16	r4
 f0 30 08              ldsp16	r0, [sp+0x8]
 f4 1b                 ldsp16	r7, [sp+0x6]
 d3 04                 brslt8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	qsort
		R_AVM_FAR24	.text.qsort+0x3e
<L6>:
 f1 0e                 mov	r1, r6
 f1 20                 mov	r4, r0
 ed a6 20              ld8u	r5, [r3+0]
 ed c4 20              ld8u	r6, [r2+0]
 f0 6d c7              st8	[r3+], r6
 f0 6d a5              st8	[r2+], r5
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	qsort
		R_AVM_FAR24	.text.qsort+0xba
<L7>:
 f4 01                 ldsp16	r5, [sp+0x0]
 37                    cmp	r5, r7
 f1 29                 mov	r6, r1
 d2 04                 brult8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	qsort
		R_AVM_FAR24	.text.qsort+0x3e
<L8>:
 f4 10                 ldsp16	r4, [sp+0x4]
 31                    cmp	r4, r5
 d2 04                 brult8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	qsort
		R_AVM_FAR24	.text.qsort+0x5f
<L9>:
 e2 00 00 00           jmpf	qsort
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.qsort+0x3e
 f1 10                 mov	r2, r0
 fe 17                 mul16	r2, r7
 f4 30                 ldsp16	r4, [sp+0xc]
 e2 00 00 00           jmpf	qsort
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.qsort+0x106
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f2 40                 sub	r2, r0
 f4 30                 ldsp16	r4, [sp+0xc]
 0c                    mov	r7, r4
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 f4 0a                 ldsp16	r6, [sp+0x2]
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	qsort
		R_AVM_FAR24	.text.qsort+0x1c4
<L10>:
 f1 1c                 mov	r3, r4
 f4 73                 stsp16	[sp+0xc], r7
 02                    mov	r4, r6
 f1 24                 mov	r5, r0
 08                    mov	r6, r4
 f2 2a                 add	r6, r2
 4e                    ld8u	r7, [r6]
 f5 31                 ld8u	r1, [r4]
 53                    st8	[r4], r7
 f3 09                 st8	[r6], r1
 f4 ac                 inc16	r4
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d0 04                 breq8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	qsort
		R_AVM_FAR24	.text.qsort+0x10d
<L11>:
 f0 3a 0a              stsp16	[sp+0xa], r2
 f1 2f                 mov	r7, r3
 03                    mov	r4, r7
 c8 fd                 addi.s8	r4, -0x3
 f4 50                 stsp16	[sp+0x4], r4
 cb fe                 addi.s8	r7, -0x2
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	qsort
		R_AVM_FAR24	.text.qsort+0xf2
<L12>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 8c                 lsr16.1	r4
 f4 50                 stsp16	[sp+0x4], r4
 a5                    xor	r5, r5
 f4 5b                 stsp16	[sp+0x6], r7
 f1 1d                 mov	r3, r5
 fe 18                 mul16	r3, r0
 f4 0a                 ldsp16	r6, [sp+0x2]
 f2 1e                 add	r3, r6
 15                    add	r5, r5
 f1 15                 mov	r2, r5
 c0 01                 ldi8	r4, 0x1
 f9 51                 or	r2, r4
 f5 17                 cmp	r2, r7
 d2 04                 brult8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	qsort
		R_AVM_FAR24	.text.qsort+0x175
<L13>:
 f1 22                 mov	r4, r2
 fe 20                 mul16	r4, r0
 12                    add	r4, r6
 c9 02                 addi.s8	r5, 0x2
 f4 41                 stsp16	[sp+0x0], r5
 fe 28                 mul16	r5, r0
 16                    add	r5, r6
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 e8                    callp	q0
 f4 0a                 ldsp16	r6, [sp+0x2]
 f6 2c                 tst16	r4
 f4 00                 ldsp16	r4, [sp+0x0]
 fd 14                 cmov.slt	r2, r4
 e2 00 00 00           jmpf	qsort
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.qsort+0x17b
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 f0 3a 00              stsp16	[sp+0x0], r2
 f4 20                 ldsp16	r4, [sp+0x8]
 fe 14                 mul16	r2, r4
 f2 16                 add	r2, r6
 f1 23                 mov	r4, r3
 f1 26                 mov	r5, r2
 e8                    callp	q0
 f6 2c                 tst16	r4
 f0 30 08              ldsp16	r0, [sp+0x8]
 f4 1b                 ldsp16	r7, [sp+0x6]
 d3 04                 brslt8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	qsort
		R_AVM_FAR24	.text.qsort+0xf2
<L14>:
 f1 20                 mov	r4, r0
 ed a6 20              ld8u	r5, [r3+0]
 ed c4 20              ld8u	r6, [r2+0]
 f0 6d c7              st8	[r3+], r6
 f0 6d a5              st8	[r2+], r5
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	qsort
		R_AVM_FAR24	.text.qsort+0x198
<L15>:
 f4 01                 ldsp16	r5, [sp+0x0]
 37                    cmp	r5, r7
 d2 04                 brult8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	qsort
		R_AVM_FAR24	.text.qsort+0xf2
<L16>:
 f4 10                 ldsp16	r4, [sp+0x4]
 31                    cmp	r4, r5
 d2 04                 brult8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	qsort
		R_AVM_FAR24	.text.qsort+0x13f
<L17>:
 e2 00 00 00           jmpf	qsort
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.qsort+0xf2
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
