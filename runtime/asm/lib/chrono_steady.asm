
chrono_steady.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 chrono_steady.cpp
00000000 l    d  .text._ZNSt3__16chrono12steady_clock3nowEv	00000000 .text._ZNSt3__16chrono12steady_clock3nowEv
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text._ZNSt3__16chrono12steady_clock3nowEv	0000002f std::__1::chrono::steady_clock::now()
00000000         *UND*	00000000 clock
00000000         *UND*	00000000 __avm_muldi3

Disassembly of section .text._ZNSt3__16chrono12steady_clock3nowEv:

<std::__1::chrono::steady_clock::now()>:
 b1                    push16	r1
 b0                    push16	r0
 f1 04                 mov	r0, r4
 e3 00 00 00           callf	_ZNSt3__16chrono12steady_clock3nowEv
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	clock
 d6 f8                 adjsp	-0x8
 c6 40 42              ldi16	r6, 0x4240
 c3 0f                 ldi8	r7, 0xf
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 e3 00 00 00           callf	_ZNSt3__16chrono12steady_clock3nowEv
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_muldi3
 d6 08                 adjsp	0x8
 f1 08                 mov	r1, r0
 f0 09 04              addi.s8	r1, 0x4
 f0 6b c2              st32	[r1], q3
 f0 6b 80              st32	[r0], q2
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
