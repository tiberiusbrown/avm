
stdio_position.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 stdio_position.c
00000000 l    d  .text.fseek	00000000 .text.fseek
00000000 l    d  .text.ftell	00000000 .text.ftell
00000000 l    d  .text.fgetpos	00000000 .text.fgetpos
00000000 l    d  .text.fsetpos	00000000 .text.fsetpos
00000000 l    d  .text.rewind	00000000 .text.rewind
00000000 g     F .text.fseek	00000028 fseek
00000000         *UND*	00000000 __avm_errno
00000000 g     F .text.ftell	0000002b ftell
00000000 g     F .text.fgetpos	00000028 fgetpos
00000000 g     F .text.fsetpos	00000028 fsetpos
00000000 g     F .text.rewind	0000002c rewind
00000000         *UND*	00000000 clearerr

Disassembly of section .text.fseek:

<fseek>:
 c1 09                 ldi8	r5, 0x9
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fseek
		R_AVM_FAR24	.text.fseek+0x20
<L0>:
 48                    ld8u	r6, [r4]
 c3 20                 ldi8	r7, 0x20
 8e                    and	r7, r6
 f4 a7                 tst8	r7
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fseek
		R_AVM_FAR24	.text.fseek+0x1c
<L1>:
 c1 1d                 ldi8	r5, 0x1d
 e2 00 00 00           jmpf	fseek
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fseek+0x20
 c3 08                 ldi8	r7, 0x8
 9b                    or	r6, r7
 52                    st8	[r4], r6
 f0 5d 00 00           stm16	[0x0], r5
		R_AVM_DATA16	__avm_errno
 c4 ff ff              ldi16	r4, 0xffff
 ef                    ret

Disassembly of section .text.ftell:

<ftell>:
 c1 09                 ldi8	r5, 0x9
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ftell
		R_AVM_FAR24	.text.ftell+0x20
<L0>:
 48                    ld8u	r6, [r4]
 c3 20                 ldi8	r7, 0x20
 8e                    and	r7, r6
 f4 a7                 tst8	r7
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	ftell
		R_AVM_FAR24	.text.ftell+0x1c
<L1>:
 c1 1d                 ldi8	r5, 0x1d
 e2 00 00 00           jmpf	ftell
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.ftell+0x20
 c3 08                 ldi8	r7, 0x8
 9b                    or	r6, r7
 52                    st8	[r4], r6
 f0 5d 00 00           stm16	[0x0], r5
		R_AVM_DATA16	__avm_errno
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 ef                    ret

Disassembly of section .text.fgetpos:

<fgetpos>:
 c1 09                 ldi8	r5, 0x9
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgetpos
		R_AVM_FAR24	.text.fgetpos+0x20
<L0>:
 48                    ld8u	r6, [r4]
 c3 20                 ldi8	r7, 0x20
 8e                    and	r7, r6
 f4 a7                 tst8	r7
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fgetpos
		R_AVM_FAR24	.text.fgetpos+0x1c
<L1>:
 c1 1d                 ldi8	r5, 0x1d
 e2 00 00 00           jmpf	fgetpos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fgetpos+0x20
 c3 08                 ldi8	r7, 0x8
 9b                    or	r6, r7
 52                    st8	[r4], r6
 f0 5d 00 00           stm16	[0x0], r5
		R_AVM_DATA16	__avm_errno
 c4 ff ff              ldi16	r4, 0xffff
 ef                    ret

Disassembly of section .text.fsetpos:

<fsetpos>:
 c1 09                 ldi8	r5, 0x9
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fsetpos
		R_AVM_FAR24	.text.fsetpos+0x20
<L0>:
 48                    ld8u	r6, [r4]
 c3 20                 ldi8	r7, 0x20
 8e                    and	r7, r6
 f4 a7                 tst8	r7
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fsetpos
		R_AVM_FAR24	.text.fsetpos+0x1c
<L1>:
 c1 1d                 ldi8	r5, 0x1d
 e2 00 00 00           jmpf	fsetpos
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.fsetpos+0x20
 c3 08                 ldi8	r7, 0x8
 9b                    or	r6, r7
 52                    st8	[r4], r6
 f0 5d 00 00           stm16	[0x0], r5
		R_AVM_DATA16	__avm_errno
 c4 ff ff              ldi16	r4, 0xffff
 ef                    ret

Disassembly of section .text.rewind:

<rewind>:
 c1 09                 ldi8	r5, 0x9
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	rewind
		R_AVM_FAR24	.text.rewind+0x24
<L0>:
 48                    ld8u	r6, [r4]
 c3 20                 ldi8	r7, 0x20
 8e                    and	r7, r6
 f4 a7                 tst8	r7
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	rewind
		R_AVM_FAR24	.text.rewind+0x20
<L1>:
 c1 1d                 ldi8	r5, 0x1d
 f0 5d 00 00           stm16	[0x0], r5
		R_AVM_DATA16	__avm_errno
 e2 00 00 00           jmpf	rewind
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	clearerr
 c3 08                 ldi8	r7, 0x8
 9b                    or	r6, r7
 52                    st8	[r4], r6
 f0 5d 00 00           stm16	[0x0], r5
		R_AVM_DATA16	__avm_errno
 e2 00 00 00           jmpf	rewind
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	clearerr
