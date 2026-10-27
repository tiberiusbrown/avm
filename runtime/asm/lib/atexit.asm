
atexit.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 atexit.c
00000000 l    d  .text.atexit	00000000 .text.atexit
00000000 g     F .text.atexit	00000024 atexit
00000000         *UND*	00000000 __avm_atexit_capacity
00000000         *UND*	00000000 __avm_atexit_count
00000000         *UND*	00000000 __avm_register_exit_callback

Disassembly of section .text.atexit:

<atexit>:
 c6 00 00              ldi16	r6, 0x0
		R_AVM_DATA16	__avm_atexit_capacity
 f0 47 00 00           ldm8u	r7, [0x0]
		R_AVM_DATA16	__avm_atexit_count
 3e                    cmp	r7, r6
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	atexit
		R_AVM_FAR24	.text.atexit+0x12
<L0>:
 c4 ff ff              ldi16	r4, 0xffff
 ef                    ret
 f1 75                 zext8	r5
 e3 00 00 00           callf	atexit
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_register_exit_callback
 f0 44 00 00           ldm8u	r4, [0x0]
		R_AVM_DATA16	__avm_atexit_count
 f4 ac                 inc16	r4
 f0 4c 00 00           stm8	[0x0], r4
		R_AVM_DATA16	__avm_atexit_count
 a0                    xor	r4, r4
 ef                    ret
