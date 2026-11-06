
libcxx_hash.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 hash.cpp
00000000 l    d  .text._ZNSt3__112__next_primeEj	00000000 .text._ZNSt3__112__next_primeEj
00000000 l     O .flash._ZNSt3__112_GLOBAL__N_112small_primesE	00000060 std::__1::(anonymous namespace)::small_primes
00000000 l     O .flash._ZNSt3__112_GLOBAL__N_17indicesE	00000060 std::__1::(anonymous namespace)::indices
00000000 l     O .flash._ZNSt3__112_GLOBAL__N_110incrementsE	00000030 std::__1::(anonymous namespace)::increments
00000000 l    d  .flash._ZNSt3__112_GLOBAL__N_112small_primesE	00000000 .flash._ZNSt3__112_GLOBAL__N_112small_primesE
00000000 l    d  .flash._ZNSt3__112_GLOBAL__N_17indicesE	00000000 .flash._ZNSt3__112_GLOBAL__N_17indicesE
00000000 l    d  .flash._ZNSt3__112_GLOBAL__N_110incrementsE	00000000 .flash._ZNSt3__112_GLOBAL__N_110incrementsE
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text._ZNSt3__112__next_primeEj	00000107 std::__1::__next_prime(unsigned int)

Disassembly of section .text._ZNSt3__112__next_primeEj:

<std::__1::__next_prime(unsigned int)>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 c1 d3                 ldi8	r5, 0xd3
 34                    cmp	r5, r4
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__112__next_primeEj
		R_AVM_FAR24	.text._ZNSt3__112__next_primeEj+0x44
<L0>:
 c2 30                 ldi8	r6, 0x30
 f0 06 00 00           ldi16	r2, 0x0
		R_AVM_DATA16	.flash._ZNSt3__112_GLOBAL__N_112small_primesE
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 fe ff           ldi16	r1, 0xfffe
 0e                    mov	r7, r6
 f4 8f                 lsr16.1	r7
 f1 1f                 mov	r3, r7
 f9 62                 xor	r3, r0
 f2 1e                 add	r3, r6
 f9 c4                 and	r6, r1
 f2 2a                 add	r6, r2
 f7 35                 ld16	r5, [r6+]
 34                    cmp	r5, r4
 fc 3b                 cmov.ult	r7, r3
 fc 16                 cmov.ult	r2, r6
 f6 2f                 tst16	r7
 0b                    mov	r6, r7
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__112__next_primeEj
		R_AVM_FAR24	.text._ZNSt3__112__next_primeEj+0x1e
<L1>:
 ed 94 20              ld16	r4, [r2+0]
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f0 02 30              ldi8	r2, 0x30
 f0 07 00 00           ldi16	r3, 0x0
		R_AVM_DATA16	.flash._ZNSt3__112_GLOBAL__N_17indicesE
 c1 d2                 ldi8	r5, 0xd2
 f1 0c                 mov	r1, r4
 ec 0d                 udiv16	r1, r5
 f0 39 00              stsp16	[sp+0x0], r1
 fe 0d                 mul16	r1, r5
 f2 51                 sub	r4, r1
 f1 2e                 mov	r7, r2
 f4 8f                 lsr16.1	r7
 f0 04 ff ff           ldi16	r0, 0xffff
 f9 1e                 xor	r0, r7
 f2 02                 add	r0, r2
 c5 fe ff              ldi16	r5, 0xfffe
 f9 a8                 and	r5, r2
 f2 27                 add	r5, r3
 f7 2e                 ld16	r6, [r5+]
 38                    cmp	r6, r4
 fc 38                 cmov.ult	r7, r0
 fc 1d                 cmov.ult	r3, r5
 f6 2f                 tst16	r7
 f1 17                 mov	r2, r7
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__112__next_primeEj
		R_AVM_FAR24	.text._ZNSt3__112__next_primeEj+0x5a
<L2>:
 ed 96 20              ld16	r4, [r3+0]
 f2 21                 add	r4, r1
 c5 00 00              ldi16	r5, 0x0
		R_AVM_DATA16	.flash._ZNSt3__112_GLOBAL__N_17indicesE
 f2 4d                 sub	r3, r5
 f4 93                 asr16.1	r3
 f0 05 00 00           ldi16	r1, 0x0
		R_AVM_DATA16	.flash._ZNSt3__112_GLOBAL__N_112small_primesE+0xa
 f0 06 00 00           ldi16	r2, 0x0
		R_AVM_DATA16	.flash._ZNSt3__112_GLOBAL__N_110incrementsE
 c3 2a                 ldi8	r7, 0x2a
 f1 01                 mov	r0, r1
 f0 6c d3              ld16	r6, [r1+]
 04                    mov	r5, r4
 ec 2e                 udiv16	r5, r6
 36                    cmp	r5, r6
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__112__next_primeEj
		R_AVM_FAR24	.text._ZNSt3__112__next_primeEj+0x3d
<L3>:
 fe 2e                 mul16	r5, r6
 31                    cmp	r4, r5
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__112__next_primeEj
		R_AVM_FAR24	.text._ZNSt3__112__next_primeEj+0xe4
<L4>:
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__112__next_primeEj
		R_AVM_FAR24	.text._ZNSt3__112__next_primeEj+0x94
<L5>:
 f2 39                 sub	r1, r1
 c3 d3                 ldi8	r7, 0xd3
 f1 25                 mov	r5, r1
 f2 26                 add	r5, r2
 45                    ld8u	r5, [r5]
 17                    add	r5, r7
 08                    mov	r6, r4
 ec 35                 udiv16	r6, r5
 39                    cmp	r6, r5
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__112__next_primeEj
		R_AVM_FAR24	.text._ZNSt3__112__next_primeEj+0x3d
<L6>:
 0d                    mov	r7, r5
 fe 3e                 mul16	r7, r6
 33                    cmp	r4, r7
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZNSt3__112__next_primeEj
		R_AVM_FAR24	.text._ZNSt3__112__next_primeEj+0xe4
<L7>:
 f4 a9                 inc16	r1
 09                    mov	r6, r5
 ca 02                 addi.s8	r6, 0x2
 f0 0d 30              cmpi.s8	r1, 0x30
 fb 2e                 cmov.eq	r5, r6
 aa                    xor	r6, r6
 fb 0e                 cmov.eq	r1, r6
 0d                    mov	r7, r5
 e2 00 00 00           jmpf	_ZNSt3__112__next_primeEj
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text._ZNSt3__112__next_primeEj+0xb8
 f4 ab                 inc16	r3
 a0                    xor	r4, r4
 f0 0f 30              cmpi.s8	r3, 0x30
 fb 1c                 cmov.eq	r3, r4
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 c5 00 00              ldi16	r5, 0x0
		R_AVM_DATA16	.flash._ZNSt3__112_GLOBAL__N_17indicesE
 11                    add	r4, r5
 f8 05                 cset.eq	r5
 f4 02                 ldsp16	r6, [sp+0x0]
 19                    add	r6, r5
 f4 42                 stsp16	[sp+0x0], r6
 06                    mov	r5, r6
 c2 d2                 ldi8	r6, 0xd2
 fe 2e                 mul16	r5, r6
 60                    ld16	r4, [r4]
 11                    add	r4, r5
 f1 08                 mov	r1, r0
 e2 00 00 00           jmpf	_ZNSt3__112__next_primeEj
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text._ZNSt3__112__next_primeEj+0x90
