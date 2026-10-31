
trap_report.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 trap_report.c
00000000 l    d  .text.__avm_trap_report	00000000 .text.__avm_trap_report
00000000 l    d  .rodata..L.avm.flashstr.0	00000000 .rodata..L.avm.flashstr.0
00000000 l    d  .rodata..L.avm.flashstr.1	00000000 .rodata..L.avm.flashstr.1
00000000 l    d  .rodata..L.avm.flashstr.2	00000000 .rodata..L.avm.flashstr.2
00000000 l    d  .rodata..L.avm.flashstr.3	00000000 .rodata..L.avm.flashstr.3
00000000 l    d  .rodata..L.avm.flashstr.4	00000000 .rodata..L.avm.flashstr.4
00000000 l    d  .rodata..L.avm.flashstr.5	00000000 .rodata..L.avm.flashstr.5
00000000 l    d  .rodata..L.avm.flashstr.6	00000000 .rodata..L.avm.flashstr.6
00000000 l    d  .rodata..L.avm.flashstr.7	00000000 .rodata..L.avm.flashstr.7
00000000 l    d  .rodata..L.avm.flashstr.8	00000000 .rodata..L.avm.flashstr.8
00000000 l    d  .rodata..L.avm.flashstr.9	00000000 .rodata..L.avm.flashstr.9
00000000 l    d  .rodata..L.avm.flashstr.10	00000000 .rodata..L.avm.flashstr.10
00000000 l    d  .rodata..L.avm.flashstr.11	00000000 .rodata..L.avm.flashstr.11
00000000 l    d  .rodata..L.avm.flashstr.12	00000000 .rodata..L.avm.flashstr.12
00000000         *UND*	00000000 __avm_text_state
00000000         *UND*	00000000 __avm_framebuffer
00000000 g     F .text.__avm_trap_report	00000132 __avm_trap_report
00000000         *UND*	00000000 __avm_trap_lookup
00000000         *UND*	00000000 memset
00000000         *UND*	00000000 _avm_font_br5n_storage

Disassembly of section .text.__avm_trap_report:

<__avm_trap_report>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 f1 04                 mov	r0, r4
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 f0 05 20 02           ldi16	r1, 0x220
 f2 69                 mov32	q2, q1
 f1 29                 mov	r6, r1
 e3 00 00 00           callf	__avm_trap_report
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_trap_lookup
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	__avm_framebuffer
 a5                    xor	r5, r5
 c6 00 04              ldi16	r6, 0x400
 e3 00 00 00           callf	__avm_trap_report
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	memset
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	_avm_font_br5n_storage
 c1 00                 ldi8	r5, 0x0
		R_AVM_PROG_HI8	_avm_font_br5n_storage
 d7 31                 sys	set_text_font
 a0                    xor	r4, r4
 d7 32                 sys	set_text_mode
 ed 80 23              ld8u	r4, [r0+3]
 cc 01                 cmpi.s8	r4, 0x1
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_report
		R_AVM_FAR24	.text.__avm_trap_report+0x5a
<L0>:
 cc 03                 cmpi.s8	r4, 0x3
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_report
		R_AVM_FAR24	.text.__avm_trap_report+0x51
<L1>:
 cc 02                 cmpi.s8	r4, 0x2
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_report
		R_AVM_FAR24	.text.__avm_trap_report+0x63
<L2>:
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	.rodata..L.avm.flashstr.10
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	.rodata..L.avm.flashstr.10
 e2 00 00 00           jmpf	__avm_trap_report
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_trap_report+0x68
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	.rodata..L.avm.flashstr.11
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	.rodata..L.avm.flashstr.11
 e2 00 00 00           jmpf	__avm_trap_report
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_trap_report+0x68
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	.rodata..L.avm.flashstr.9
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	.rodata..L.avm.flashstr.9
 e2 00 00 00           jmpf	__avm_trap_report
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_trap_report+0x68
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	.rodata..L.avm.flashstr.12
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	.rodata..L.avm.flashstr.12
 a0                    xor	r4, r4
 c1 05                 ldi8	r5, 0x5
 d7 34                 sys	draw_text_p
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 ed 90 24              ld16	r4, [r0+4]
 f4 50                 stsp16	[sp+0x4], r4
 f0 13 00              leasp	r3, 0x0
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	.rodata..L.avm.flashstr.0
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	.rodata..L.avm.flashstr.0
 f1 13                 mov	r2, r3
 a0                    xor	r4, r4
 c1 0b                 ldi8	r5, 0xb
 d7 36                 sys	draw_textfv_p
 f0 39 00              stsp16	[sp+0x0], r1
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	.rodata..L.avm.flashstr.1
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	.rodata..L.avm.flashstr.1
 a0                    xor	r4, r4
 c1 11                 ldi8	r5, 0x11
 d7 36                 sys	draw_textfv_p
 c4 69 02              ldi16	r4, 0x269
 40                    ld8u	r4, [r4]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_report
		R_AVM_FAR24	.text.__avm_trap_report+0xbf
<L3>:
 c4 48 02              ldi16	r4, 0x248
 f4 40                 stsp16	[sp+0x0], r4
 c4 64 02              ldi16	r4, 0x264
 f0 6a 88              ld32	q2, [r4]
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	.rodata..L.avm.flashstr.2
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	.rodata..L.avm.flashstr.2
 a0                    xor	r4, r4
 c1 17                 ldi8	r5, 0x17
 f1 13                 mov	r2, r3
 d7 36                 sys	draw_textfv_p
 e2 00 00 00           jmpf	__avm_trap_report
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_trap_report+0xc9
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	.rodata..L.avm.flashstr.3
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	.rodata..L.avm.flashstr.3
 a0                    xor	r4, r4
 c1 17                 ldi8	r5, 0x17
 d7 34                 sys	draw_text_p
 ed 90 28              ld16	r4, [r0+8]
 f4 40                 stsp16	[sp+0x0], r4
 ed 90 2a              ld16	r4, [r0+10]
 f4 48                 stsp16	[sp+0x2], r4
 f0 12 00              leasp	r2, 0x0
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	.rodata..L.avm.flashstr.4
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	.rodata..L.avm.flashstr.4
 a0                    xor	r4, r4
 c1 1d                 ldi8	r5, 0x1d
 d7 36                 sys	draw_textfv_p
 ed 90 2c              ld16	r4, [r0+12]
 f4 40                 stsp16	[sp+0x0], r4
 ed 90 2e              ld16	r4, [r0+14]
 f4 48                 stsp16	[sp+0x2], r4
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	.rodata..L.avm.flashstr.5
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	.rodata..L.avm.flashstr.5
 a0                    xor	r4, r4
 c1 23                 ldi8	r5, 0x23
 d7 36                 sys	draw_textfv_p
 ed 90 30              ld16	r4, [r0+16]
 f4 40                 stsp16	[sp+0x0], r4
 ed 90 32              ld16	r4, [r0+18]
 f4 48                 stsp16	[sp+0x2], r4
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	.rodata..L.avm.flashstr.6
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	.rodata..L.avm.flashstr.6
 a0                    xor	r4, r4
 c1 29                 ldi8	r5, 0x29
 d7 36                 sys	draw_textfv_p
 ed 90 34              ld16	r4, [r0+20]
 f4 40                 stsp16	[sp+0x0], r4
 ed 90 36              ld16	r4, [r0+22]
 f4 48                 stsp16	[sp+0x2], r4
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	.rodata..L.avm.flashstr.7
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	.rodata..L.avm.flashstr.7
 a0                    xor	r4, r4
 c1 2f                 ldi8	r5, 0x2f
 d7 36                 sys	draw_textfv_p
 ed 80 26              ld8u	r4, [r0+6]
 f4 40                 stsp16	[sp+0x0], r4
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	.rodata..L.avm.flashstr.8
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	.rodata..L.avm.flashstr.8
 a0                    xor	r4, r4
 c1 35                 ldi8	r5, 0x35
 d7 36                 sys	draw_textfv_p
 a0                    xor	r4, r4
 d7 1d                 sys	display
 e2 00 00 00           jmpf	__avm_trap_report
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_trap_report+0x12e
