
stdio_scan_stdin.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 stdio_scan_stdin.c
00000000 l    d  .text.vscanf	00000000 .text.vscanf
00000000 l    d  .text.scanf	00000000 .text.scanf
00000000 g     F .text.vscanf	00000009 vscanf
00000000         *UND*	00000000 __avm_stdin
00000000         *UND*	00000000 vfscanf
00000000 g     F .text.scanf	00000013 scanf

Disassembly of section .text.vscanf:

<vscanf>:
 09                    mov	r6, r5
 04                    mov	r5, r4
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	__avm_stdin
 e2 00 00 00           jmpf	vscanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	vfscanf

Disassembly of section .text.scanf:

<scanf>:
 d6 fe                 adjsp	-0x2
 f4 15                 ldsp16	r5, [sp+0x5]
 f0 16 07              leasp	r6, 0x7
 f4 42                 stsp16	[sp+0x0], r6
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	__avm_stdin
 e3 00 00 00           callf	scanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	vfscanf
 d6 02                 adjsp	0x2
 ef                    ret
