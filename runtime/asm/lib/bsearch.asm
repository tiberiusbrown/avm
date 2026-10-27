
bsearch.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 bsearch.c
00000000 l    d  .text.bsearch	00000000 .text.bsearch
00000000 g     F .text.bsearch	00000080 bsearch

Disassembly of section .text.bsearch:

<bsearch>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f4 59                 stsp16	[sp+0x6], r5
 f4 50                 stsp16	[sp+0x4], r4
 f2 39                 sub	r1, r1
 f0 34 15              ldsp16	r4, [sp+0x15]
 f0 1d 17              ldsp8u	r5, [sp+0x17]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	bsearch
		R_AVM_FAR24	.text.bsearch+0x77
<L0>:
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	bsearch
		R_AVM_FAR24	.text.bsearch+0x77
<L1>:
 f2 4b                 sub	r3, r3
 e2 00 00 00           jmpf	bsearch
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.bsearch+0x38
 f1 2a                 mov	r6, r2
 f1 2c                 mov	r7, r0
 f5 1e                 cmp	r3, r6
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	bsearch
		R_AVM_FAR24	.text.bsearch+0x75
<L2>:
 f4 62                 stsp16	[sp+0x8], r6
 f1 16                 mov	r2, r6
 f2 43                 sub	r2, r3
 f4 8a                 lsr16.1	r2
 f2 13                 add	r2, r3
 f1 0a                 mov	r1, r2
 f1 07                 mov	r0, r7
 fe 0f                 mul16	r1, r7
 f4 18                 ldsp16	r4, [sp+0x6]
 f2 0c                 add	r1, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 25                 mov	r5, r1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 eb                    callp	q3
 f6 2c                 tst16	r4
 d9 04                 brsge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	bsearch
		R_AVM_FAR24	.text.bsearch+0x2c
<L3>:
 f6 2c                 tst16	r4
 f1 2c                 mov	r7, r0
 f4 22                 ldsp16	r6, [sp+0x8]
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	bsearch
		R_AVM_FAR24	.text.bsearch+0x77
<L4>:
 f4 aa                 inc16	r2
 f1 1a                 mov	r3, r2
 f5 1e                 cmp	r3, r6
 d8 04                 bruge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	bsearch
		R_AVM_FAR24	.text.bsearch+0x38
<L5>:
 f2 39                 sub	r1, r1
 f1 21                 mov	r4, r1
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
