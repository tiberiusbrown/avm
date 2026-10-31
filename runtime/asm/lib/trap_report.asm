
trap_report.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 trap_report.c
00000000 l    d  .text.__avm_trap_report	00000000 .text.__avm_trap_report
00000000         *UND*	00000000 __avm_framebuffer
00000000 g     F .text.__avm_trap_report	0000001c __avm_trap_report
00000000         *UND*	00000000 memset

Disassembly of section .text.__avm_trap_report:

<__avm_trap_report>:
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	__avm_framebuffer
 a5                    xor	r5, r5
 c6 00 04              ldi16	r6, 0x400
 e3 00 00 00           callf	__avm_trap_report
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	memset
 c0 08                 ldi8	r4, 0x8
 c1 08                 ldi8	r5, 0x8
 c2 10                 ldi8	r6, 0x10
 c3 08                 ldi8	r7, 0x8
 d7 27                 sys	draw_filled_rect_white
 a0                    xor	r4, r4
 d7 1d                 sys	display
 e2 00 00 00           jmpf	__avm_trap_report
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_trap_report+0x18
