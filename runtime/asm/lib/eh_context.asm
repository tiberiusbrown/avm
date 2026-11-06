
eh_context.o:	file format elf32-avm

SYMBOL TABLE:
00000000 g     F .text	0000001c __avm_eh_install_context

Disassembly of section .text:

<__avm_eh_install_context>:
 f5 30                 ld8u	r0, [r4]
 c6 00 0a              ldi16	r6, 0xa00
 f2 58                 sub	r6, r0
 f1 8e                 setsp	r6
 ed d8 21              ld16	r6, [r4+1]
 ed e8 23              ld8u	r7, [r4+3]
 ed 18 24              ld16	r0, [r4+4]
 ed 38 26              ld16	r1, [r4+6]
 ed 58 28              ld16	r2, [r4+8]
 ed 78 2a              ld16	r3, [r4+10]
 e7                    jmpp	q3
