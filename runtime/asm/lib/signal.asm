
signal.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 signal.c
00000000 l    d  .text.signal	00000000 .text.signal
00000000 l     O .data.handlers	00000012 handlers
00000000 l    d  .text.raise	00000000 .text.raise
00000000 l    d  .text.__avm_signal_abort	00000000 .text.__avm_signal_abort
00000000 l    d  .data.handlers	00000000 .data.handlers
00000000 g     F .text.signal	00000048 signal
00000000         *UND*	00000000 __avm_errno
00000000 g     F .text.raise	00000058 raise
00000000         *UND*	00000000 avm_halt
00000000 g     F .text.__avm_signal_abort	00000032 __avm_signal_abort

Disassembly of section .text.signal:

<signal>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f1 04                 mov	r0, r4
 c8 f9                 addi.s8	r4, -0x7
 cc fa                 cmpi.s8	r4, -0x6
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	signal
		R_AVM_FAR24	.text.signal+0x3d
<L0>:
 f2 67                 mov32	q1, q3
 f1 73                 zext8	r3
 f0 69 48              cmp32	q1, q2
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	signal
		R_AVM_FAR24	.text.signal+0x3d
<L1>:
 f1 20                 mov	r4, r0
 10                    add	r4, r4
 f2 20                 add	r4, r0
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_DATA16	.data.handlers-0x3
 f2 04                 add	r0, r4
 f1 08                 mov	r1, r0
 f0 6c 93              ld16	r4, [r1+]
 ed a2 20              ld8u	r5, [r1+0]
 f0 6d d1              st16	[r0+], r6
 ee e0 20              st8	[r0+0], r7
 e2 00 00 00           jmpf	signal
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.signal+0x43
 c2 16                 ldi8	r6, 0x16
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.raise:

<raise>:
 b3                    push16	r3
 b2                    push16	r2
 b0                    push16	r0
 04                    mov	r5, r4
 c9 f9                 addi.s8	r5, -0x7
 c6 f9 ff              ldi16	r6, 0xfff9
 39                    cmp	r6, r5
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	raise
		R_AVM_FAR24	.text.raise+0x1e
<L0>:
 c0 16                 ldi8	r4, 0x16
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 f0 04 ff ff           ldi16	r0, 0xffff
 e2 00 00 00           jmpf	raise
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.raise+0x4e
 04                    mov	r5, r4
 15                    add	r5, r5
 14                    add	r5, r4
 c6 00 00              ldi16	r6, 0x0
		R_AVM_DATA16	.data.handlers-0x3
 19                    add	r6, r5
 f2 30                 sub	r0, r0
 f7 32                 ld16	r2, [r6+]
 f5 3b                 ld8u	r3, [r6]
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	raise
		R_AVM_FAR24	.text.raise+0x4e
<L1>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	raise
		R_AVM_FAR24	.text.raise+0x54
<L2>:
 c6 00 00              ldi16	r6, 0x0
		R_AVM_DATA16	.data.handlers
 16                    add	r5, r6
 c9 fd                 addi.s8	r5, -0x3
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f7 4e                 st16	[r5+], r6
 57                    st8	[r5], r7
 e9                    callp	q1
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 e3 00 00 00           callf	raise
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_halt

Disassembly of section .text.__avm_signal_abort:

<__avm_signal_abort>:
 b1                    push16	r1
 b0                    push16	r0
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	.data.handlers
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_signal_abort
		R_AVM_FAR24	.text.__avm_signal_abort+0x2b
<L0>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_signal_abort
		R_AVM_FAR24	.text.__avm_signal_abort+0x2e
<L1>:
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	.data.handlers
 f7 40                 st16	[r4+], r0
 f3 01                 st8	[r4], r1
 c0 01                 ldi8	r4, 0x1
 eb                    callp	q3
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 e3 00 00 00           callf	__avm_signal_abort
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_halt
