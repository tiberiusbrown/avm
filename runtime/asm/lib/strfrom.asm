
strfrom.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 strfrom.c
00000000 l    d  .text.strfromd	00000000 .text.strfromd
00000000 l    d  .text.strfromf	00000000 .text.strfromf
00000000 l    d  .text.strfroml	00000000 .text.strfroml
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.strfromd	000000c9 strfromd
00000000 g     F .text.strfromf	000000c9 strfromf
00000000 g     F .text.strfroml	000000c9 strfroml

Disassembly of section .text.strfromd:

<strfromd>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f1 0e                 mov	r1, r6
 f1 1d                 mov	r3, r5
 f1 04                 mov	r0, r4
 f0 34 15              ldsp16	r4, [sp+0x15]
 f0 35 17              ldsp16	r5, [sp+0x17]
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 ed 82 20              ld8u	r4, [r1+0]
 cc 25                 cmpi.s8	r4, 0x25
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfromd
		R_AVM_FAR24	.text.strfromd+0x88
<L0>:
 ed e2 21              ld8u	r7, [r1+1]
 cf 2e                 cmpi.s8	r7, 0x2e
 f1 21                 mov	r4, r1
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfromd
		R_AVM_FAR24	.text.strfromd+0x42
<L1>:
 f1 21                 mov	r4, r1
 ed e8 22              ld8u	r7, [r4+2]
 f4 ac                 inc16	r4
 0b                    mov	r6, r7
 ca d0                 addi.s8	r6, -0x30
 f1 76                 zext8	r6
 ce 0a                 cmpi.s8	r6, 0xa
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfromd
		R_AVM_FAR24	.text.strfromd+0x30
<L2>:
 07                    mov	r5, r7
 c9 bf                 addi.s8	r5, -0x41
 cd 07                 cmpi.s8	r5, 0x7
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfromd
		R_AVM_FAR24	.text.strfromd+0x6a
<L3>:
 cb 9f                 addi.s8	r7, -0x61
 cf 07                 cmpi.s8	r7, 0x7
 d2 04                 brult8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfromd
		R_AVM_FAR24	.text.strfromd+0x88
<L4>:
 c2 01                 ldi8	r6, 0x1
 fa 0b                 shl16v	r6, r7
 c3 71                 ldi8	r7, 0x71
 8e                    and	r7, r6
 f4 a7                 tst8	r7
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfromd
		R_AVM_FAR24	.text.strfromd+0x88
<L5>:
 e2 00 00 00           jmpf	strfromd
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strfromd+0x7d
 c2 01                 ldi8	r6, 0x1
 fa 09                 shl16v	r6, r5
 f4 42                 stsp16	[sp+0x0], r6
 c2 71                 ldi8	r6, 0x71
 f4 01                 ldsp16	r5, [sp+0x0]
 89                    and	r6, r5
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfromd
		R_AVM_FAR24	.text.strfromd+0x4d
<L6>:
 ed 88 22              ld8u	r4, [r4+2]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfromd
		R_AVM_FAR24	.text.strfromd+0xad
<L7>:
 f1 21                 mov	r4, r1
 d7 1a                 sys	strlen
 0c                    mov	r7, r4
 f6 2b                 tst16	r3
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfromd
		R_AVM_FAR24	.text.strfromd+0xc1
<L8>:
 f5 2f                 cmp	r7, r3
 f4 b3                 dec16	r3
 fc 1f                 cmov.ult	r3, r7
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 f1 2b                 mov	r6, r3
 d7 0f                 sys	memcpy
 f2 18                 add	r3, r0
 a0                    xor	r4, r4
 ee 86 20              st8	[r3+0], r4
 e2 00 00 00           jmpf	strfromd
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strfromd+0xc1
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 12 06              leasp	r2, 0x6
 f1 20                 mov	r4, r0
 f1 27                 mov	r5, r3
 f1 29                 mov	r6, r1
 d7 2f                 sys	vsnprintf
 0c                    mov	r7, r4
 03                    mov	r4, r7
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.strfromf:

<strfromf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f1 0e                 mov	r1, r6
 f1 1d                 mov	r3, r5
 f1 04                 mov	r0, r4
 f0 34 15              ldsp16	r4, [sp+0x15]
 f0 35 17              ldsp16	r5, [sp+0x17]
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 ed 82 20              ld8u	r4, [r1+0]
 cc 25                 cmpi.s8	r4, 0x25
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfromf
		R_AVM_FAR24	.text.strfromf+0x88
<L0>:
 ed e2 21              ld8u	r7, [r1+1]
 cf 2e                 cmpi.s8	r7, 0x2e
 f1 21                 mov	r4, r1
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfromf
		R_AVM_FAR24	.text.strfromf+0x42
<L1>:
 f1 21                 mov	r4, r1
 ed e8 22              ld8u	r7, [r4+2]
 f4 ac                 inc16	r4
 0b                    mov	r6, r7
 ca d0                 addi.s8	r6, -0x30
 f1 76                 zext8	r6
 ce 0a                 cmpi.s8	r6, 0xa
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfromf
		R_AVM_FAR24	.text.strfromf+0x30
<L2>:
 07                    mov	r5, r7
 c9 bf                 addi.s8	r5, -0x41
 cd 07                 cmpi.s8	r5, 0x7
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfromf
		R_AVM_FAR24	.text.strfromf+0x6a
<L3>:
 cb 9f                 addi.s8	r7, -0x61
 cf 07                 cmpi.s8	r7, 0x7
 d2 04                 brult8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfromf
		R_AVM_FAR24	.text.strfromf+0x88
<L4>:
 c2 01                 ldi8	r6, 0x1
 fa 0b                 shl16v	r6, r7
 c3 71                 ldi8	r7, 0x71
 8e                    and	r7, r6
 f4 a7                 tst8	r7
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfromf
		R_AVM_FAR24	.text.strfromf+0x88
<L5>:
 e2 00 00 00           jmpf	strfromf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strfromf+0x7d
 c2 01                 ldi8	r6, 0x1
 fa 09                 shl16v	r6, r5
 f4 42                 stsp16	[sp+0x0], r6
 c2 71                 ldi8	r6, 0x71
 f4 01                 ldsp16	r5, [sp+0x0]
 89                    and	r6, r5
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfromf
		R_AVM_FAR24	.text.strfromf+0x4d
<L6>:
 ed 88 22              ld8u	r4, [r4+2]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfromf
		R_AVM_FAR24	.text.strfromf+0xad
<L7>:
 f1 21                 mov	r4, r1
 d7 1a                 sys	strlen
 0c                    mov	r7, r4
 f6 2b                 tst16	r3
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfromf
		R_AVM_FAR24	.text.strfromf+0xc1
<L8>:
 f5 2f                 cmp	r7, r3
 f4 b3                 dec16	r3
 fc 1f                 cmov.ult	r3, r7
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 f1 2b                 mov	r6, r3
 d7 0f                 sys	memcpy
 f2 18                 add	r3, r0
 a0                    xor	r4, r4
 ee 86 20              st8	[r3+0], r4
 e2 00 00 00           jmpf	strfromf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strfromf+0xc1
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 12 06              leasp	r2, 0x6
 f1 20                 mov	r4, r0
 f1 27                 mov	r5, r3
 f1 29                 mov	r6, r1
 d7 2f                 sys	vsnprintf
 0c                    mov	r7, r4
 03                    mov	r4, r7
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.strfroml:

<strfroml>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f1 0e                 mov	r1, r6
 f1 1d                 mov	r3, r5
 f1 04                 mov	r0, r4
 f0 34 15              ldsp16	r4, [sp+0x15]
 f0 35 17              ldsp16	r5, [sp+0x17]
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 ed 82 20              ld8u	r4, [r1+0]
 cc 25                 cmpi.s8	r4, 0x25
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfroml
		R_AVM_FAR24	.text.strfroml+0x88
<L0>:
 ed e2 21              ld8u	r7, [r1+1]
 cf 2e                 cmpi.s8	r7, 0x2e
 f1 21                 mov	r4, r1
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfroml
		R_AVM_FAR24	.text.strfroml+0x42
<L1>:
 f1 21                 mov	r4, r1
 ed e8 22              ld8u	r7, [r4+2]
 f4 ac                 inc16	r4
 0b                    mov	r6, r7
 ca d0                 addi.s8	r6, -0x30
 f1 76                 zext8	r6
 ce 0a                 cmpi.s8	r6, 0xa
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfroml
		R_AVM_FAR24	.text.strfroml+0x30
<L2>:
 07                    mov	r5, r7
 c9 bf                 addi.s8	r5, -0x41
 cd 07                 cmpi.s8	r5, 0x7
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfroml
		R_AVM_FAR24	.text.strfroml+0x6a
<L3>:
 cb 9f                 addi.s8	r7, -0x61
 cf 07                 cmpi.s8	r7, 0x7
 d2 04                 brult8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfroml
		R_AVM_FAR24	.text.strfroml+0x88
<L4>:
 c2 01                 ldi8	r6, 0x1
 fa 0b                 shl16v	r6, r7
 c3 71                 ldi8	r7, 0x71
 8e                    and	r7, r6
 f4 a7                 tst8	r7
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfroml
		R_AVM_FAR24	.text.strfroml+0x88
<L5>:
 e2 00 00 00           jmpf	strfroml
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strfroml+0x7d
 c2 01                 ldi8	r6, 0x1
 fa 09                 shl16v	r6, r5
 f4 42                 stsp16	[sp+0x0], r6
 c2 71                 ldi8	r6, 0x71
 f4 01                 ldsp16	r5, [sp+0x0]
 89                    and	r6, r5
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfroml
		R_AVM_FAR24	.text.strfroml+0x4d
<L6>:
 ed 88 22              ld8u	r4, [r4+2]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfroml
		R_AVM_FAR24	.text.strfroml+0xad
<L7>:
 f1 21                 mov	r4, r1
 d7 1a                 sys	strlen
 0c                    mov	r7, r4
 f6 2b                 tst16	r3
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfroml
		R_AVM_FAR24	.text.strfroml+0xc1
<L8>:
 f5 2f                 cmp	r7, r3
 f4 b3                 dec16	r3
 fc 1f                 cmov.ult	r3, r7
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 f1 2b                 mov	r6, r3
 d7 0f                 sys	memcpy
 f2 18                 add	r3, r0
 a0                    xor	r4, r4
 ee 86 20              st8	[r3+0], r4
 e2 00 00 00           jmpf	strfroml
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strfroml+0xc1
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 12 06              leasp	r2, 0x6
 f1 20                 mov	r4, r0
 f1 27                 mov	r5, r3
 f1 29                 mov	r6, r1
 d7 2f                 sys	vsnprintf
 0c                    mov	r7, r4
 03                    mov	r4, r7
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
