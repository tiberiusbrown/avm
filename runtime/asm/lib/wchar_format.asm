
wchar_format.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 wchar_format.c
00000000 l    d  .text.vfwprintf	00000000 .text.vfwprintf
00000000 l    d  .text.vswprintf	00000000 .text.vswprintf
00000000 l    d  .text.vwprintf	00000000 .text.vwprintf
00000000 l    d  .text.fwprintf	00000000 .text.fwprintf
00000000 l    d  .text.swprintf	00000000 .text.swprintf
00000000 l    d  .text.wprintf	00000000 .text.wprintf
00000000 g     F .text.vfwprintf	00000077 vfwprintf
00000000         *UND*	00000000 __avm_errno
00000000 g     F .text.vswprintf	00000018 vswprintf
00000000 g     F .text.vwprintf	0000005f vwprintf
00000000         *UND*	00000000 __avm_stdout
00000000 g     F .text.fwprintf	00000073 fwprintf
00000000 g     F .text.swprintf	00000022 swprintf
00000000 g     F .text.wprintf	00000063 wprintf

Disassembly of section .text.vfwprintf:

<vfwprintf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f1 16                 mov	r2, r6
 f0 04 ff ff           ldi16	r0, 0xffff
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	vfwprintf
		R_AVM_FAR24	.text.vfwprintf+0x36
<L0>:
 f5 33                 ld8u	r3, [r4]
 c3 22                 ldi8	r7, 0x22
 f9 ec                 and	r7, r3
 cf 02                 cmpi.s8	r7, 0x2
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	vfwprintf
		R_AVM_FAR24	.text.vfwprintf+0x3c
<L1>:
 f0 0f 40              cmpi.s8	r3, 0x40
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	vfwprintf
		R_AVM_FAR24	.text.vfwprintf+0x42
<L2>:
 c7 80 ff              ldi16	r7, 0xff80
 f9 7d                 or	r3, r7
 f1 0c                 mov	r1, r4
 f3 03                 st8	[r4], r3
 e2 00 00 00           jmpf	vfwprintf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.vfwprintf+0x50
 c1 09                 ldi8	r5, 0x9
 e2 00 00 00           jmpf	vfwprintf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.vfwprintf+0x6c
 c1 09                 ldi8	r5, 0x9
 e2 00 00 00           jmpf	vfwprintf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.vfwprintf+0x67
 f1 2f                 mov	r7, r3
 f6 47                 sext8	r7
 cf c0                 cmpi.s8	r7, -0x40
 d3 04                 brslt8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	vfwprintf
		R_AVM_FAR24	.text.vfwprintf+0x65
<L3>:
 f1 0c                 mov	r1, r4
 09                    mov	r6, r5
 d7 3d                 sys	debug_printfv
 f1 04                 mov	r0, r4
 f6 28                 tst16	r0
 d3 04                 brslt8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	vfwprintf
		R_AVM_FAR24	.text.vfwprintf+0x70
<L4>:
 c1 05                 ldi8	r5, 0x5
 f1 21                 mov	r4, r1
 e2 00 00 00           jmpf	vfwprintf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.vfwprintf+0x67
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

Disassembly of section .text.vswprintf:

<vswprintf>:
 b2                    push16	r2
 b0                    push16	r0
 f1 05                 mov	r0, r5
 f1 17                 mov	r2, r7
 d7 2f                 sys	vsnprintf
 08                    mov	r6, r4
 c4 ff ff              ldi16	r4, 0xffff
 f6 2e                 tst16	r6
 0c                    mov	r7, r4
 fd 7e                 cmov.sge	r7, r6
 f5 28                 cmp	r6, r0
 fc 27                 cmov.ult	r4, r7
 b8                    pop16	r0
 ba                    pop16	r2
 ef                    ret

Disassembly of section .text.vwprintf:

<vwprintf>:
 b2                    push16	r2
 b0                    push16	r0
 f1 04                 mov	r0, r4
 c4 ff ff              ldi16	r4, 0xffff
 c2 22                 ldi8	r6, 0x22
 f0 47 00 00           ldm8u	r7, [0x0]
		R_AVM_DATA16	__avm_stdout
 8b                    and	r6, r7
 ce 02                 cmpi.s8	r6, 0x2
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	vwprintf
		R_AVM_FAR24	.text.vwprintf+0x2a
<L0>:
 cf 40                 cmpi.s8	r7, 0x40
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	vwprintf
		R_AVM_FAR24	.text.vwprintf+0x30
<L1>:
 c4 80 ff              ldi16	r4, 0xff80
 9c                    or	r7, r4
 f0 4f 00 00           stm8	[0x0], r7
		R_AVM_DATA16	__avm_stdout
 e2 00 00 00           jmpf	vwprintf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.vwprintf+0x3b
 c1 09                 ldi8	r5, 0x9
 e2 00 00 00           jmpf	vwprintf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.vwprintf+0x51
 0b                    mov	r6, r7
 f6 46                 sext8	r6
 ce c0                 cmpi.s8	r6, -0x40
 d3 04                 brslt8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	vwprintf
		R_AVM_FAR24	.text.vwprintf+0x4f
<L2>:
 f1 28                 mov	r6, r0
 f1 15                 mov	r2, r5
 d7 3d                 sys	debug_printfv
 f6 2c                 tst16	r4
 d3 04                 brslt8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	vwprintf
		R_AVM_FAR24	.text.vwprintf+0x5c
<L3>:
 c1 05                 ldi8	r5, 0x5
 e2 00 00 00           jmpf	vwprintf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.vwprintf+0x51
 c1 16                 ldi8	r5, 0x16
 f0 5d 00 00           stm16	[0x0], r5
		R_AVM_DATA16	__avm_errno
 c1 08                 ldi8	r5, 0x8
 97                    or	r5, r7
 f0 4d 00 00           stm8	[0x0], r5
		R_AVM_DATA16	__avm_stdout
 b8                    pop16	r0
 ba                    pop16	r2
 ef                    ret

Disassembly of section .text.fwprintf:

<fwprintf>:
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
 e2 00 00 00           jmpf	fwprintf
		R_AVM_FAR24	.text.fwprintf+0x3b
<L0>:
 f5 34                 ld8u	r0, [r5]
 c3 22                 ldi8	r7, 0x22
 f9 e0                 and	r7, r0
 cf 02                 cmpi.s8	r7, 0x2
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fwprintf
		R_AVM_FAR24	.text.fwprintf+0x41
<L1>:
 f0 0c 40              cmpi.s8	r0, 0x40
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fwprintf
		R_AVM_FAR24	.text.fwprintf+0x47
<L2>:
 c4 80 ff              ldi16	r4, 0xff80
 f9 11                 or	r0, r4
 f3 04                 st8	[r5], r0
 e2 00 00 00           jmpf	fwprintf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fwprintf+0x53
 c2 09                 ldi8	r6, 0x9
 e2 00 00 00           jmpf	fwprintf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fwprintf+0x6a
 c2 09                 ldi8	r6, 0x9
 e2 00 00 00           jmpf	fwprintf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fwprintf+0x65
 f1 2c                 mov	r7, r0
 f6 47                 sext8	r7
 cf c0                 cmpi.s8	r7, -0x40
 d3 04                 brslt8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fwprintf
		R_AVM_FAR24	.text.fwprintf+0x63
<L3>:
 d7 3d                 sys	debug_printfv
 f6 2c                 tst16	r4
 d3 04                 brslt8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fwprintf
		R_AVM_FAR24	.text.fwprintf+0x6e
<L4>:
 c2 05                 ldi8	r6, 0x5
 e2 00 00 00           jmpf	fwprintf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fwprintf+0x65
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

Disassembly of section .text.swprintf:

<swprintf>:
 b2                    push16	r2
 d6 fe                 adjsp	-0x2
 f4 2e                 ldsp16	r6, [sp+0xb]
 f4 27                 ldsp16	r7, [sp+0x9]
 f4 1c                 ldsp16	r4, [sp+0x7]
 f0 12 0d              leasp	r2, 0xd
 f0 3a 00              stsp16	[sp+0x0], r2
 07                    mov	r5, r7
 d7 2f                 sys	vsnprintf
 04                    mov	r5, r4
 c4 ff ff              ldi16	r4, 0xffff
 f6 2d                 tst16	r5
 08                    mov	r6, r4
 fd 75                 cmov.sge	r6, r5
 37                    cmp	r5, r7
 fc 26                 cmov.ult	r4, r6
 d6 02                 adjsp	0x2
 ba                    pop16	r2
 ef                    ret

Disassembly of section .text.wprintf:

<wprintf>:
 b2                    push16	r2
 d6 fe                 adjsp	-0x2
 c4 ff ff              ldi16	r4, 0xffff
 f4 1e                 ldsp16	r6, [sp+0x7]
 f0 12 09              leasp	r2, 0x9
 f0 3a 00              stsp16	[sp+0x0], r2
 c3 22                 ldi8	r7, 0x22
 f0 45 00 00           ldm8u	r5, [0x0]
		R_AVM_DATA16	__avm_stdout
 8d                    and	r7, r5
 cf 02                 cmpi.s8	r7, 0x2
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wprintf
		R_AVM_FAR24	.text.wprintf+0x31
<L0>:
 cd 40                 cmpi.s8	r5, 0x40
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wprintf
		R_AVM_FAR24	.text.wprintf+0x37
<L1>:
 c4 80 ff              ldi16	r4, 0xff80
 94                    or	r5, r4
 f0 4d 00 00           stm8	[0x0], r5
		R_AVM_DATA16	__avm_stdout
 e2 00 00 00           jmpf	wprintf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.wprintf+0x42
 c2 09                 ldi8	r6, 0x9
 e2 00 00 00           jmpf	wprintf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.wprintf+0x54
 0d                    mov	r7, r5
 f6 47                 sext8	r7
 cf c0                 cmpi.s8	r7, -0x40
 d3 04                 brslt8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wprintf
		R_AVM_FAR24	.text.wprintf+0x52
<L2>:
 d7 3d                 sys	debug_printfv
 f6 2c                 tst16	r4
 d3 04                 brslt8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	wprintf
		R_AVM_FAR24	.text.wprintf+0x5f
<L3>:
 c2 05                 ldi8	r6, 0x5
 e2 00 00 00           jmpf	wprintf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.wprintf+0x54
 c2 16                 ldi8	r6, 0x16
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 c2 08                 ldi8	r6, 0x8
 99                    or	r6, r5
 f0 4e 00 00           stm8	[0x0], r6
		R_AVM_DATA16	__avm_stdout
 d6 02                 adjsp	0x2
 ba                    pop16	r2
 ef                    ret
