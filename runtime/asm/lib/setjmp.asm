
setjmp.o:	file format elf32-avm

SYMBOL TABLE:
00000000 g     F .text	0000001c __avm_setjmp
0000001c g     F .text	00000021 longjmp

Disassembly of section .text:

<__avm_setjmp>:
 f1 85                 getsp	r5
 71                    st16	[r4], r5
 f4 02                 ldsp16	r6, [sp+0x0]
 ee d8 22              st16	[r4+2], r6
 f3 4a                 ldsp8u	r6, [sp+0x2]
 ee c8 24              st8	[r4+4], r6
 ee 18 25              st16	[r4+5], r0
 ee 38 27              st16	[r4+7], r1
 ee 58 29              st16	[r4+9], r2
 ee 78 2b              st16	[r4+11], r3
 c0 00                 ldi8	r4, 0x0
 ef                    ret

<longjmp>:
 68                    ld16	r6, [r4]
 ed f8 22              ld16	r7, [r4+2]
 7b                    st16	[r6], r7
 ed e8 24              ld8u	r7, [r4+4]
 ee ec 22              st8	[r6+2], r7
 ed 18 25              ld16	r0, [r4+5]
 ed 38 27              ld16	r1, [r4+7]
 ed 58 29              ld16	r2, [r4+9]
 ed 78 2b              ld16	r3, [r4+11]
 01                    mov	r4, r5
 cc 00                 cmpi.s8	r4, 0x0
 d1 02                 brne8	0x2 <L0>
 c0 01                 ldi8	r4, 0x1
<L0>:
 f1 8e                 setsp	r6
 ef                    ret
