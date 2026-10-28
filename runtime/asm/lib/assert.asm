
assert.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 assert.c
00000000 l    d  .text.__avm_assert_fail	00000000 .text.__avm_assert_fail
00000000 l    d  .rodata..L.avm.flashstr.0	00000000 .rodata..L.avm.flashstr.0
00000000 g     F .text.__avm_assert_fail	00000034 __avm_assert_fail
00000000         *UND*	00000000 abort

Disassembly of section .text.__avm_assert_fail:

<__avm_assert_fail>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f3                 adjsp	-0xd
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f0 19 1e              ldsp8u	r1, [sp+0x1e]
 f0 32 18              ldsp16	r2, [sp+0x18]
 f0 33 1a              ldsp16	r3, [sp+0x1a]
 f0 3a 09              stsp16	[sp+0x9], r2
 f0 3b 0b              stsp16	[sp+0xb], r3
 f4 5a                 stsp16	[sp+0x6], r6
 f1 53                 stsp8	[sp+0x8], r7
 f0 38 03              stsp16	[sp+0x3], r0
 f0 29 05              stsp8	[sp+0x5], r1
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 f0 12 00              leasp	r2, 0x0
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	.rodata..L.avm.flashstr.0
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	.rodata..L.avm.flashstr.0
 d7 37                 sys	debug_printfv_p
 e3 00 00 00           callf	__avm_assert_fail
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	abort
