
strfrom.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 strfrom.c
00000000 l    d  .text.strfromd	00000000 .text.strfromd
00000000 l    d  .text.strfromf	00000000 .text.strfromf
00000000 l    d  .text.strfroml	00000000 .text.strfroml
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.strfromd	000000c7 strfromd
00000000 g     F .text.strfromf	000000c7 strfromf
00000000 g     F .text.strfroml	000000c7 strfroml

Disassembly of section .text.strfromd:

<strfromd>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f1 16                 mov	r2, r6
 f1 1d                 mov	r3, r5
 f1 04                 mov	r0, r4
 f0 36 13              ldsp16	r6, [sp+0x13]
 f0 37 15              ldsp16	r7, [sp+0x15]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 ed 84 20              ld8u	r4, [r2+0]
 cc 25                 cmpi.s8	r4, 0x25
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfromd
		R_AVM_FAR24	.text.strfromd+0x86
<L0>:
 ed c4 21              ld8u	r6, [r2+1]
 ce 2e                 cmpi.s8	r6, 0x2e
 f1 0a                 mov	r1, r2
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfromd
		R_AVM_FAR24	.text.strfromd+0x44
<L1>:
 f1 22                 mov	r4, r2
 f4 ac                 inc16	r4
 f1 0c                 mov	r1, r4
 f4 ac                 inc16	r4
 48                    ld8u	r6, [r4]
 0e                    mov	r7, r6
 cb d0                 addi.s8	r7, -0x30
 f1 77                 zext8	r7
 cf 0a                 cmpi.s8	r7, 0xa
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfromd
		R_AVM_FAR24	.text.strfromd+0x32
<L2>:
 02                    mov	r4, r6
 c8 bf                 addi.s8	r4, -0x41
 cc 07                 cmpi.s8	r4, 0x7
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfromd
		R_AVM_FAR24	.text.strfromd+0x6c
<L3>:
 ca 9f                 addi.s8	r6, -0x61
 ce 07                 cmpi.s8	r6, 0x7
 d2 04                 brult8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfromd
		R_AVM_FAR24	.text.strfromd+0x86
<L4>:
 c0 01                 ldi8	r4, 0x1
 fa 02                 shl16v	r4, r6
 c2 71                 ldi8	r6, 0x71
 88                    and	r6, r4
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfromd
		R_AVM_FAR24	.text.strfromd+0x86
<L5>:
 e2 00 00 00           jmpf	strfromd
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strfromd+0x7b
 c3 01                 ldi8	r7, 0x1
 fa 0c                 shl16v	r7, r4
 c0 71                 ldi8	r4, 0x71
 83                    and	r4, r7
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfromd
		R_AVM_FAR24	.text.strfromd+0x4f
<L6>:
 ed 82 22              ld8u	r4, [r1+2]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfromd
		R_AVM_FAR24	.text.strfromd+0xab
<L7>:
 f1 22                 mov	r4, r2
 d7 1a                 sys	strlen
 0c                    mov	r7, r4
 f6 2b                 tst16	r3
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfromd
		R_AVM_FAR24	.text.strfromd+0xbf
<L8>:
 f4 b3                 dec16	r3
 f5 2f                 cmp	r7, r3
 fc 1f                 cmov.ult	r3, r7
 f1 20                 mov	r4, r0
 f1 26                 mov	r5, r2
 f1 2b                 mov	r6, r3
 d7 0f                 sys	memcpy
 f2 18                 add	r3, r0
 a0                    xor	r4, r4
 ee 86 20              st8	[r3+0], r4
 e2 00 00 00           jmpf	strfromd
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strfromd+0xbf
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f1 2a                 mov	r6, r2
 f0 12 04              leasp	r2, 0x4
 f1 20                 mov	r4, r0
 f1 27                 mov	r5, r3
 d7 2f                 sys	vsnprintf
 0c                    mov	r7, r4
 03                    mov	r4, r7
 d6 08                 adjsp	0x8
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
 d6 f8                 adjsp	-0x8
 f1 16                 mov	r2, r6
 f1 1d                 mov	r3, r5
 f1 04                 mov	r0, r4
 f0 36 13              ldsp16	r6, [sp+0x13]
 f0 37 15              ldsp16	r7, [sp+0x15]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 ed 84 20              ld8u	r4, [r2+0]
 cc 25                 cmpi.s8	r4, 0x25
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfromf
		R_AVM_FAR24	.text.strfromf+0x86
<L0>:
 ed c4 21              ld8u	r6, [r2+1]
 ce 2e                 cmpi.s8	r6, 0x2e
 f1 0a                 mov	r1, r2
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfromf
		R_AVM_FAR24	.text.strfromf+0x44
<L1>:
 f1 22                 mov	r4, r2
 f4 ac                 inc16	r4
 f1 0c                 mov	r1, r4
 f4 ac                 inc16	r4
 48                    ld8u	r6, [r4]
 0e                    mov	r7, r6
 cb d0                 addi.s8	r7, -0x30
 f1 77                 zext8	r7
 cf 0a                 cmpi.s8	r7, 0xa
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfromf
		R_AVM_FAR24	.text.strfromf+0x32
<L2>:
 02                    mov	r4, r6
 c8 bf                 addi.s8	r4, -0x41
 cc 07                 cmpi.s8	r4, 0x7
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfromf
		R_AVM_FAR24	.text.strfromf+0x6c
<L3>:
 ca 9f                 addi.s8	r6, -0x61
 ce 07                 cmpi.s8	r6, 0x7
 d2 04                 brult8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfromf
		R_AVM_FAR24	.text.strfromf+0x86
<L4>:
 c0 01                 ldi8	r4, 0x1
 fa 02                 shl16v	r4, r6
 c2 71                 ldi8	r6, 0x71
 88                    and	r6, r4
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfromf
		R_AVM_FAR24	.text.strfromf+0x86
<L5>:
 e2 00 00 00           jmpf	strfromf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strfromf+0x7b
 c3 01                 ldi8	r7, 0x1
 fa 0c                 shl16v	r7, r4
 c0 71                 ldi8	r4, 0x71
 83                    and	r4, r7
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfromf
		R_AVM_FAR24	.text.strfromf+0x4f
<L6>:
 ed 82 22              ld8u	r4, [r1+2]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfromf
		R_AVM_FAR24	.text.strfromf+0xab
<L7>:
 f1 22                 mov	r4, r2
 d7 1a                 sys	strlen
 0c                    mov	r7, r4
 f6 2b                 tst16	r3
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfromf
		R_AVM_FAR24	.text.strfromf+0xbf
<L8>:
 f4 b3                 dec16	r3
 f5 2f                 cmp	r7, r3
 fc 1f                 cmov.ult	r3, r7
 f1 20                 mov	r4, r0
 f1 26                 mov	r5, r2
 f1 2b                 mov	r6, r3
 d7 0f                 sys	memcpy
 f2 18                 add	r3, r0
 a0                    xor	r4, r4
 ee 86 20              st8	[r3+0], r4
 e2 00 00 00           jmpf	strfromf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strfromf+0xbf
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f1 2a                 mov	r6, r2
 f0 12 04              leasp	r2, 0x4
 f1 20                 mov	r4, r0
 f1 27                 mov	r5, r3
 d7 2f                 sys	vsnprintf
 0c                    mov	r7, r4
 03                    mov	r4, r7
 d6 08                 adjsp	0x8
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
 d6 f8                 adjsp	-0x8
 f1 16                 mov	r2, r6
 f1 1d                 mov	r3, r5
 f1 04                 mov	r0, r4
 f0 36 13              ldsp16	r6, [sp+0x13]
 f0 37 15              ldsp16	r7, [sp+0x15]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 ed 84 20              ld8u	r4, [r2+0]
 cc 25                 cmpi.s8	r4, 0x25
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfroml
		R_AVM_FAR24	.text.strfroml+0x86
<L0>:
 ed c4 21              ld8u	r6, [r2+1]
 ce 2e                 cmpi.s8	r6, 0x2e
 f1 0a                 mov	r1, r2
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfroml
		R_AVM_FAR24	.text.strfroml+0x44
<L1>:
 f1 22                 mov	r4, r2
 f4 ac                 inc16	r4
 f1 0c                 mov	r1, r4
 f4 ac                 inc16	r4
 48                    ld8u	r6, [r4]
 0e                    mov	r7, r6
 cb d0                 addi.s8	r7, -0x30
 f1 77                 zext8	r7
 cf 0a                 cmpi.s8	r7, 0xa
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfroml
		R_AVM_FAR24	.text.strfroml+0x32
<L2>:
 02                    mov	r4, r6
 c8 bf                 addi.s8	r4, -0x41
 cc 07                 cmpi.s8	r4, 0x7
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfroml
		R_AVM_FAR24	.text.strfroml+0x6c
<L3>:
 ca 9f                 addi.s8	r6, -0x61
 ce 07                 cmpi.s8	r6, 0x7
 d2 04                 brult8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfroml
		R_AVM_FAR24	.text.strfroml+0x86
<L4>:
 c0 01                 ldi8	r4, 0x1
 fa 02                 shl16v	r4, r6
 c2 71                 ldi8	r6, 0x71
 88                    and	r6, r4
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfroml
		R_AVM_FAR24	.text.strfroml+0x86
<L5>:
 e2 00 00 00           jmpf	strfroml
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strfroml+0x7b
 c3 01                 ldi8	r7, 0x1
 fa 0c                 shl16v	r7, r4
 c0 71                 ldi8	r4, 0x71
 83                    and	r4, r7
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfroml
		R_AVM_FAR24	.text.strfroml+0x4f
<L6>:
 ed 82 22              ld8u	r4, [r1+2]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfroml
		R_AVM_FAR24	.text.strfroml+0xab
<L7>:
 f1 22                 mov	r4, r2
 d7 1a                 sys	strlen
 0c                    mov	r7, r4
 f6 2b                 tst16	r3
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strfroml
		R_AVM_FAR24	.text.strfroml+0xbf
<L8>:
 f4 b3                 dec16	r3
 f5 2f                 cmp	r7, r3
 fc 1f                 cmov.ult	r3, r7
 f1 20                 mov	r4, r0
 f1 26                 mov	r5, r2
 f1 2b                 mov	r6, r3
 d7 0f                 sys	memcpy
 f2 18                 add	r3, r0
 a0                    xor	r4, r4
 ee 86 20              st8	[r3+0], r4
 e2 00 00 00           jmpf	strfroml
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strfroml+0xbf
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f1 2a                 mov	r6, r2
 f0 12 04              leasp	r2, 0x4
 f1 20                 mov	r4, r0
 f1 27                 mov	r5, r3
 d7 2f                 sys	vsnprintf
 0c                    mov	r7, r4
 03                    mov	r4, r7
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
