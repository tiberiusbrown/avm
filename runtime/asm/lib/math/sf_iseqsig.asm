
math_sf_iseqsig.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_iseqsig.c
00000000 l    d  .text.__avm_iseqsigf	00000000 .text.__avm_iseqsigf
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.__avm_iseqsigf	00000055 __avm_iseqsigf
00000000         *UND*	00000000 __avm_errno

Disassembly of section .text.__avm_iseqsigf:

<__avm_iseqsigf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f2 66                 mov32	q1, q2
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff 7f              ldi16	r5, 0x7fff
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_iseqsigf
		R_AVM_FAR24	.text.__avm_iseqsigf+0x4a
<L0>:
 82                    and	r4, r6
 87                    and	r5, r7
 f0 00 01              ldi8	r0, 0x1
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 80              cmp32	q2, q0
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_iseqsigf
		R_AVM_FAR24	.text.__avm_iseqsigf+0x4a
<L1>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 14                 fcmp
 f6 2e                 tst16	r6
 f8 04                 cset.eq	r4
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c0 21                 ldi8	r4, 0x21
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	__avm_iseqsigf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_iseqsigf+0x43
