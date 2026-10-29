
stdio_control.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 stdio_control.c
00000000 l    d  .text.fclose	00000000 .text.fclose
00000000 l    d  .text.fflush	00000000 .text.fflush
00000000 l    d  .text.setvbuf	00000000 .text.setvbuf
00000000 l    d  .text.setbuf	00000000 .text.setbuf
00000000 g     F .text.fclose	0000002a fclose
00000000         *UND*	00000000 __avm_errno
00000000 g     F .text.fflush	00000024 fflush
00000000 g     F .text.setvbuf	00000037 setvbuf
00000000 g     F .text.setbuf	00000031 setbuf

Disassembly of section .text.fclose:

<fclose>:
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fclose
		R_AVM_FAR24	.text.fclose+0x20
<L0>:
 44                    ld8u	r5, [r4]
 c2 20                 ldi8	r6, 0x20
 0d                    mov	r7, r5
 8e                    and	r7, r6
 f4 a7                 tst8	r7
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fclose
		R_AVM_FAR24	.text.fclose+0x1c
<L1>:
 c3 cc                 ldi8	r7, 0xcc
 87                    and	r5, r7
 96                    or	r5, r6
 51                    st8	[r4], r5
 a0                    xor	r4, r4
 ef                    ret
 c2 08                 ldi8	r6, 0x8
 96                    or	r5, r6
 51                    st8	[r4], r5
 c0 09                 ldi8	r4, 0x9
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 c4 ff ff              ldi16	r4, 0xffff
 ef                    ret

Disassembly of section .text.fflush:

<fflush>:
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fflush
		R_AVM_FAR24	.text.fflush+0x23
<L0>:
 49                    ld8u	r6, [r5]
 c3 22                 ldi8	r7, 0x22
 8e                    and	r7, r6
 cf 02                 cmpi.s8	r7, 0x2
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fflush
		R_AVM_FAR24	.text.fflush+0x23
<L1>:
 c0 08                 ldi8	r4, 0x8
 98                    or	r6, r4
 56                    st8	[r5], r6
 c0 09                 ldi8	r4, 0x9
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 c4 ff ff              ldi16	r4, 0xffff
 ef                    ret

Disassembly of section .text.setvbuf:

<setvbuf>:
 b0                    push16	r0
 f0 00 09              ldi8	r0, 0x9
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	setvbuf
		R_AVM_FAR24	.text.setvbuf+0x2e
<L0>:
 4c                    ld8u	r7, [r4]
 c1 20                 ldi8	r5, 0x20
 87                    and	r5, r7
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	setvbuf
		R_AVM_FAR24	.text.setvbuf+0x23
<L1>:
 ce 02                 cmpi.s8	r6, 0x2
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	setvbuf
		R_AVM_FAR24	.text.setvbuf+0x2b
<L2>:
 a0                    xor	r4, r4
 b8                    pop16	r0
 ef                    ret
 c1 08                 ldi8	r5, 0x8
 9d                    or	r7, r5
 53                    st8	[r4], r7
 e2 00 00 00           jmpf	setvbuf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.setvbuf+0x2e
 f0 00 16              ldi8	r0, 0x16
 f0 58 00 00           stm16	[0x0], r0
		R_AVM_DATA16	__avm_errno
 c4 ff ff              ldi16	r4, 0xffff
 b8                    pop16	r0
 ef                    ret

Disassembly of section .text.setbuf:

<setbuf>:
 b0                    push16	r0
 f0 00 09              ldi8	r0, 0x9
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	setbuf
		R_AVM_FAR24	.text.setbuf+0x2b
<L0>:
 4c                    ld8u	r7, [r4]
 c2 20                 ldi8	r6, 0x20
 8b                    and	r6, r7
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	setbuf
		R_AVM_FAR24	.text.setbuf+0x27
<L1>:
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	setbuf
		R_AVM_FAR24	.text.setbuf+0x2f
<L2>:
 f0 00 16              ldi8	r0, 0x16
 e2 00 00 00           jmpf	setbuf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.setbuf+0x2b
 c1 08                 ldi8	r5, 0x8
 9d                    or	r7, r5
 53                    st8	[r4], r7
 f0 58 00 00           stm16	[0x0], r0
		R_AVM_DATA16	__avm_errno
 b8                    pop16	r0
 ef                    ret
