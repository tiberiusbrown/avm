
eh_context.o:	file format elf32-avm

SYMBOL TABLE:
00000000 g     F .text	0000001b __avm_eh_install_context

Disassembly of section .text:

<__avm_eh_install_context>:
 ed d8 22              ld16	r6, [r4+2]
 ed e8 24              ld8u	r7, [r4+4]
 ed 18 25              ld16	r0, [r4+5]
 ed 38 27              ld16	r1, [r4+7]
 ed 58 29              ld16	r2, [r4+9]
 ed 78 2b              ld16	r3, [r4+11]
 64                    ld16	r5, [r4]
 f1 8d                 setsp	r5
 ed 98 2d              ld16	r4, [r4+13]
 c1 01                 ldi8	r5, 0x1
 e7                    jmpp	q3
