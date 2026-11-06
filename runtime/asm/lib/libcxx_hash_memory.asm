
libcxx_hash_memory.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 libcxx_hash_memory.cpp
00000000 l    d  .text._ZNSt3__113__hash_memoryEPKvj	00000000 .text._ZNSt3__113__hash_memoryEPKvj
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text._ZNSt3__113__hash_memoryEPKvj	00000029 std::__1::__hash_memory(void const*, unsigned int)

Disassembly of section .text._ZNSt3__113__hash_memoryEPKvj:

<std::__1::__hash_memory(void const*, unsigned int)>:
 b0                    push16	r0
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__113__hash_memoryEPKvj
		R_AVM_FAR24	.text._ZNSt3__113__hash_memoryEPKvj+0x23
<L0>:
 c7 05 15              ldi16	r7, 0x1505
 f0 00 21              ldi8	r0, 0x21
 fe 38                 mul16	r7, r0
 f7 06                 ld8u	r6, [r4+]
 ab                    xor	r6, r7
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 0e                    mov	r7, r6
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__113__hash_memoryEPKvj
		R_AVM_FAR24	.text._ZNSt3__113__hash_memoryEPKvj+0xf
<L1>:
 e2 00 00 00           jmpf	_ZNSt3__113__hash_memoryEPKvj
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text._ZNSt3__113__hash_memoryEPKvj+0x26
 c6 05 15              ldi16	r6, 0x1505
 02                    mov	r4, r6
 b8                    pop16	r0
 ef                    ret
