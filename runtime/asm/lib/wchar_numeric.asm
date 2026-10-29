
wchar_numeric.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 wchar_numeric.c
00000000 l    d  .text.wcstof	00000000 .text.wcstof
00000000 l    d  .text.wcstod	00000000 .text.wcstod
00000000 l    d  .text.wcstold	00000000 .text.wcstold
00000000 l    d  .text.wcstol	00000000 .text.wcstol
00000000 l    d  .text.wcstoll	00000000 .text.wcstoll
00000000 l    d  .text.wcstoul	00000000 .text.wcstoul
00000000 l    d  .text.wcstoull	00000000 .text.wcstoull
00000000 g     F .text.wcstof	00000022 wcstof
00000000         *UND*	00000000 strtof
00000000 g     F .text.wcstod	00000022 wcstod
00000000         *UND*	00000000 strtod
00000000 g     F .text.wcstold	00000022 wcstold
00000000         *UND*	00000000 strtold
00000000 g     F .text.wcstol	00000022 wcstol
00000000         *UND*	00000000 strtol
00000000 g     F .text.wcstoll	00000025 wcstoll
00000000         *UND*	00000000 strtoll
00000000 g     F .text.wcstoul	00000022 wcstoul
00000000         *UND*	00000000 strtoul
00000000 g     F .text.wcstoull	00000025 wcstoull
00000000         *UND*	00000000 strtoull

Disassembly of section .text.wcstof:

<wcstof>:
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f1 05                 mov	r0, r5
 f0 15 00              leasp	r5, 0x0
 aa                    xor	r6, r6
 f6 28                 tst16	r0
 fb 2e                 cmov.eq	r5, r6
 e3 00 00 00           callf	wcstof
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	strtof
 f6 28                 tst16	r0
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wcstof
		R_AVM_FAR24	.text.wcstof+0x1e
<L0>:
 f4 02                 ldsp16	r6, [sp+0x0]
 ee d0 20              st16	[r0+0], r6
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 ef                    ret

Disassembly of section .text.wcstod:

<wcstod>:
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f1 05                 mov	r0, r5
 f0 15 00              leasp	r5, 0x0
 aa                    xor	r6, r6
 f6 28                 tst16	r0
 fb 2e                 cmov.eq	r5, r6
 e3 00 00 00           callf	wcstod
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	strtod
 f6 28                 tst16	r0
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wcstod
		R_AVM_FAR24	.text.wcstod+0x1e
<L0>:
 f4 02                 ldsp16	r6, [sp+0x0]
 ee d0 20              st16	[r0+0], r6
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 ef                    ret

Disassembly of section .text.wcstold:

<wcstold>:
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f1 05                 mov	r0, r5
 f0 15 00              leasp	r5, 0x0
 aa                    xor	r6, r6
 f6 28                 tst16	r0
 fb 2e                 cmov.eq	r5, r6
 e3 00 00 00           callf	wcstold
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	strtold
 f6 28                 tst16	r0
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wcstold
		R_AVM_FAR24	.text.wcstold+0x1e
<L0>:
 f4 02                 ldsp16	r6, [sp+0x0]
 ee d0 20              st16	[r0+0], r6
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 ef                    ret

Disassembly of section .text.wcstol:

<wcstol>:
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f1 05                 mov	r0, r5
 f0 15 00              leasp	r5, 0x0
 af                    xor	r7, r7
 f6 28                 tst16	r0
 fb 2f                 cmov.eq	r5, r7
 e3 00 00 00           callf	wcstol
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	strtol
 f6 28                 tst16	r0
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wcstol
		R_AVM_FAR24	.text.wcstol+0x1e
<L0>:
 f4 02                 ldsp16	r6, [sp+0x0]
 ee d0 20              st16	[r0+0], r6
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 ef                    ret

Disassembly of section .text.wcstoll:

<wcstoll>:
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f1 05                 mov	r0, r5
 f0 15 00              leasp	r5, 0x0
 af                    xor	r7, r7
 f6 28                 tst16	r0
 fb 2f                 cmov.eq	r5, r7
 e3 00 00 00           callf	wcstoll
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	strtoll
 f6 28                 tst16	r0
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wcstoll
		R_AVM_FAR24	.text.wcstoll+0x20
<L0>:
 f0 31 00              ldsp16	r1, [sp+0x0]
 ee 30 20              st16	[r0+0], r1
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

Disassembly of section .text.wcstoul:

<wcstoul>:
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f1 05                 mov	r0, r5
 f0 15 00              leasp	r5, 0x0
 af                    xor	r7, r7
 f6 28                 tst16	r0
 fb 2f                 cmov.eq	r5, r7
 e3 00 00 00           callf	wcstoul
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	strtoul
 f6 28                 tst16	r0
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wcstoul
		R_AVM_FAR24	.text.wcstoul+0x1e
<L0>:
 f4 02                 ldsp16	r6, [sp+0x0]
 ee d0 20              st16	[r0+0], r6
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 ef                    ret

Disassembly of section .text.wcstoull:

<wcstoull>:
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f1 05                 mov	r0, r5
 f0 15 00              leasp	r5, 0x0
 af                    xor	r7, r7
 f6 28                 tst16	r0
 fb 2f                 cmov.eq	r5, r7
 e3 00 00 00           callf	wcstoull
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	strtoull
 f6 28                 tst16	r0
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wcstoull
		R_AVM_FAR24	.text.wcstoull+0x20
<L0>:
 f0 31 00              ldsp16	r1, [sp+0x0]
 ee 30 20              st16	[r0+0], r1
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
