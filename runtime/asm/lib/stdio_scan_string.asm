
stdio_scan_string.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 stdio_scan_string.c
00000000 l    d  .text.vsscanf	00000000 .text.vsscanf
00000000 l     F .text.string_read	00000014 string_read
00000000 l     F .text.string_unread	00000006 string_unread
00000000 l    d  .text.string_read	00000000 .text.string_read
00000000 l    d  .text.string_unread	00000000 .text.string_unread
00000000 l    d  .text.sscanf	00000000 .text.sscanf
00000000 g     F .text.vsscanf	00000044 vsscanf
00000000         *UND*	00000000 __avm_vscan
00000000 g     F .text.sscanf	0000004f sscanf

Disassembly of section .text.vsscanf:

<vsscanf>:
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	-0x12
 f4 60                 stsp16	[sp+0x8], r4
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	.text.string_read
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	.text.string_read
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 29 0e              stsp8	[sp+0xe], r1
 f1 20                 mov	r4, r0
 f1 38                 stsp8	[sp+0x2], r4
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	.text.string_unread
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	.text.string_unread
 f0 38 0f              stsp16	[sp+0xf], r0
 f0 29 11              stsp8	[sp+0x11], r1
 f1 20                 mov	r4, r0
 f1 44                 stsp8	[sp+0x5], r4
 f0 14 08              leasp	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 f4 68                 stsp16	[sp+0xa], r4
 f4 34                 ldsp16	r4, [sp+0xd]
 f4 4c                 stsp16	[sp+0x3], r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 f4 58                 stsp16	[sp+0x6], r4
 f0 14 00              leasp	r4, 0x0
 e3 00 00 00           callf	vsscanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_vscan
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

Disassembly of section .text.string_read:

<string_read>:
 64                    ld16	r5, [r4]
 49                    ld8u	r6, [r5]
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	string_read
		R_AVM_FAR24	.text.string_read+0x10
<L0>:
 09                    mov	r6, r5
 f4 ae                 inc16	r6
 72                    st16	[r4], r6
 41                    ld8u	r4, [r5]
 ef                    ret
 c4 ff ff              ldi16	r4, 0xffff
 ef                    ret

Disassembly of section .text.string_unread:

<string_unread>:
 68                    ld16	r6, [r4]
 f4 b6                 dec16	r6
 72                    st16	[r4], r6
 01                    mov	r4, r5
 ef                    ret

Disassembly of section .text.sscanf:

<sscanf>:
 b1                    push16	r1
 b0                    push16	r0
 d6 ec                 adjsp	-0x14
 f0 35 1d              ldsp16	r5, [sp+0x1d]
 f0 34 1b              ldsp16	r4, [sp+0x1b]
 f0 16 1f              leasp	r6, 0x1f
 f4 62                 stsp16	[sp+0x8], r6
 f4 68                 stsp16	[sp+0xa], r4
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	.text.string_read
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	.text.string_read
 f0 38 0e              stsp16	[sp+0xe], r0
 f0 29 10              stsp8	[sp+0x10], r1
 f1 20                 mov	r4, r0
 f1 38                 stsp8	[sp+0x2], r4
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	.text.string_unread
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	.text.string_unread
 f0 38 11              stsp16	[sp+0x11], r0
 f0 29 13              stsp8	[sp+0x13], r1
 f1 20                 mov	r4, r0
 f1 44                 stsp8	[sp+0x5], r4
 f0 14 0a              leasp	r4, 0xa
 f4 40                 stsp16	[sp+0x0], r4
 f4 70                 stsp16	[sp+0xc], r4
 f4 3c                 ldsp16	r4, [sp+0xf]
 f4 4c                 stsp16	[sp+0x3], r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 f4 58                 stsp16	[sp+0x6], r4
 f0 14 00              leasp	r4, 0x0
 e3 00 00 00           callf	sscanf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_vscan
 d6 14                 adjsp	0x14
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
