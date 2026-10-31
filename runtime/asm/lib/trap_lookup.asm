
trap_lookup.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 trap_lookup.c
00000000 l    d  .text.__avm_trap_lookup	00000000 .text.__avm_trap_lookup
00000000 l     F .text.open_section	0000011a open_section
00000000 l     F .text.read_uleb128	000000b7 read_uleb128
00000000 l    d  .text.open_section	00000000 .text.open_section
00000000 l    d  .text.read_uleb128	00000000 .text.read_uleb128
00000000 g     F .text.__avm_trap_lookup	000009c2 __avm_trap_lookup
00000000         *UND*	00000000 __avm_mulsi3
00000000         *UND*	00000000 __avm_ashlsi3
00000000         *UND*	00000000 __avm_umulhisi3

Disassembly of section .text.__avm_trap_lookup:

<__avm_trap_lookup>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 a6                 adjsp	-0x5a
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 a5                    xor	r5, r5
 ee bc 68              st16	[r6+72], r5
 c0 3f                 ldi8	r4, 0x3f
 ee 9c 48              st16	[r6+40], r4
 78                    st16	[r6], r4
 f4 42                 stsp16	[sp+0x0], r6
 02                    mov	r4, r6
 c8 44                 addi.s8	r4, 0x44
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 6b 08              st32	[r4], q0
 f0 02 0f              ldi8	r2, 0xf
 f2 4b                 sub	r3, r3
 f0 63 c4              ldp24	q3, [q1]
 f0 38 20              stsp16	[sp+0x20], r0
 f0 39 22              stsp16	[sp+0x22], r1
 f0 00 2e              ldi8	r0, 0x2e
 f0 05 00 ff           ldi16	r1, 0xff00
 f7 63                 add32	q0, q3
 f0 02 2f              ldi8	r2, 0x2f
 f0 07 00 ff           ldi16	r3, 0xff00
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L0>:
 f0 60 8c              ldp8u	r4, [q3]
 cc 41                 cmpi.s8	r4, 0x41
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L1>:
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f2 63                 mov32	q0, q3
 f7 61                 add32	q0, q1
 f0 60 80              ldp8u	r4, [q0]
 cc 56                 cmpi.s8	r4, 0x56
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L2>:
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 63                 add32	q0, q3
 f0 60 80              ldp8u	r4, [q0]
 cc 44                 cmpi.s8	r4, 0x44
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L3>:
 f0 02 03              ldi8	r2, 0x3
 f2 4b                 sub	r3, r3
 f2 63                 mov32	q0, q3
 f7 61                 add32	q0, q1
 f0 60 80              ldp8u	r4, [q0]
 cc 31                 cmpi.s8	r4, 0x31
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L4>:
 f0 02 04              ldi8	r2, 0x4
 f2 4b                 sub	r3, r3
 f2 63                 mov32	q0, q3
 f7 61                 add32	q0, q1
 f0 63 00              ldp24	q0, [q0]
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
 f0 00 07              ldi8	r0, 0x7
 f2 39                 sub	r1, r1
 f7 63                 add32	q0, q3
 f0 60 80              ldp8u	r4, [q0]
 cc 05                 cmpi.s8	r4, 0x5
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L5>:
 f0 00 08              ldi8	r0, 0x8
 f2 39                 sub	r1, r1
 f7 63                 add32	q0, q3
 f0 60 80              ldp8u	r4, [q0]
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L6>:
 f0 00 09              ldi8	r0, 0x9
 f2 39                 sub	r1, r1
 f7 63                 add32	q0, q3
 f0 63 00              ldp24	q0, [q0]
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xe0
<L7>:
 d6 5a                 adjsp	0x5a
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f0 02 2f              ldi8	r2, 0x2f
 f2 4b                 sub	r3, r3
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L8>:
 f2 30                 sub	r0, r0
 f0 05 00 01           ldi16	r1, 0x100
 f7 73                 sub32	q0, q3
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 f0 69 04              cmp32	q0, q1
 f0 02 2f              ldi8	r2, 0x2f
 f2 4b                 sub	r3, r3
 d8 04                 bruge8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L9>:
 f4 00                 ldsp16	r4, [sp+0x0]
 c8 28                 addi.s8	r4, 0x28
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 00 0c              ldi8	r0, 0xc
 f2 39                 sub	r1, r1
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f7 63                 add32	q0, q3
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 c0 07                 ldi8	r4, 0x7
 0d                    mov	r7, r5
 f3 1c                 mulu8.w	r7, r4
 f1 07                 mov	r0, r7
 f2 39                 sub	r1, r1
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f7 63                 add32	q0, q3
 f0 38 06              stsp16	[sp+0x6], r0
 f0 39 08              stsp16	[sp+0x8], r1
 f2 6b                 mov32	q3, q1
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f7 61                 add32	q0, q1
 f2 67                 mov32	q1, q3
 f0 63 c0              ldp24	q3, [q0]
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 c2 04                 ldi8	r6, 0x4
 af                    xor	r7, r7
 f7 63                 add32	q0, q3
 f0 63 c0              ldp24	q3, [q0]
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f0 60 cc              ldp8u	r6, [q3]
 01                    mov	r4, r5
 f4 ac                 inc16	r4
 f4 5a                 stsp16	[sp+0x6], r6
 32                    cmp	r4, r6
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 d0 04                 breq8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L10>:
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 f0 69 04              cmp32	q0, q1
 d0 04                 breq8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L11>:
 d6 fa                 adjsp	-0x6
 f0 14 26              leasp	r4, 0x26
 f4 50                 stsp16	[sp+0x4], r4
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f2 63                 mov32	q0, q3
 f2 6b                 mov32	q3, q1
 f7 6c                 add32	q3, q0
 f0 14 3a              leasp	r4, 0x3a
 e3 00 00 00           callf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.open_section
 d6 06                 adjsp	0x6
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 f4 a7                 tst8	r7
 d1 04                 brne8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L12>:
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f7 66                 add32	q1, q2
 f4 19                 ldsp16	r5, [sp+0x6]
 cd 05                 cmpi.s8	r5, 0x5
 d0 04                 breq8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x129
<L13>:
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 69 48              cmp32	q1, q2
 d0 04                 breq8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L14>:
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 08                    mov	r6, r4
 fa 96                 lsr16i	r6, 0x6
 01                    mov	r4, r5
 04                    mov	r5, r4
 fa 4a                 lsl16i	r5, 0xa
 96                    or	r5, r6
 fa 76                 lsr16i	r4, 0x6
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f0 36 54              ldsp16	r6, [sp+0x54]
 f4 7a                 stsp16	[sp+0xe], r6
 f1 16                 mov	r2, r6
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 d0 04                 breq8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L15>:
 f0 30 3c              ldsp16	r0, [sp+0x3c]
 f0 31 3e              ldsp16	r1, [sp+0x3e]
 f0 63 80              ldp24	q2, [q0]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 04                 breq8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L16>:
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f0 63 88              ldp24	q2, [q2]
 f0 69 8c              cmp32	q2, q3
 d0 04                 breq8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L17>:
 f0 3a 06              stsp16	[sp+0x6], r2
 f0 3b 08              stsp16	[sp+0x8], r3
 c0 0b                 ldi8	r4, 0xb
 a5                    xor	r5, r5
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 f7 68                 add32	q2, q0
 f0 60 88              ldp8u	r4, [q2]
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L18>:
 f0 34 50              ldsp16	r4, [sp+0x50]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x3a3
<L19>:
 f0 36 34              ldsp16	r6, [sp+0x34]
 f0 37 36              ldsp16	r7, [sp+0x36]
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 3f 26              stsp16	[sp+0x26], r7
 a5                    xor	r5, r5
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 3a 0a              stsp16	[sp+0xa], r2
 f0 3b 0c              stsp16	[sp+0xc], r3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 7d                 sub32	q3, q1
 f7 83                 lsr32.1	q3
 f7 6d                 add32	q3, q1
 f2 63                 mov32	q0, q3
 f7 60                 add32	q0, q0
 f7 60                 add32	q0, q0
 f7 60                 add32	q0, q0
 f7 63                 add32	q0, q3
 f0 32 24              ldsp16	r2, [sp+0x24]
 f0 33 26              ldsp16	r3, [sp+0x26]
 f7 61                 add32	q0, q1
 f0 63 00              ldp24	q0, [q0]
 f0 38 12              stsp16	[sp+0x12], r0
 f0 39 14              stsp16	[sp+0x14], r1
 f2 67                 mov32	q1, q3
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f7 64                 add32	q1, q0
 f0 30 02              ldsp16	r0, [sp+0x2]
 f0 31 04              ldsp16	r1, [sp+0x4]
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f0 69 08              cmp32	q0, q2
 f0 30 0a              ldsp16	r0, [sp+0xa]
 f0 31 0c              ldsp16	r1, [sp+0xc]
 fc 10                 cmov.ult	r2, r0
 fc 19                 cmov.ult	r3, r1
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 fc 26                 cmov.ult	r4, r6
 fc 2f                 cmov.ult	r5, r7
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x260
<L20>:
 f0 30 24              ldsp16	r0, [sp+0x24]
 f0 31 26              ldsp16	r1, [sp+0x26]
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f2 6b                 mov32	q3, q1
 f0 69 48              cmp32	q1, q2
 d1 04                 brne8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x3a3
<L21>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 f7 6a                 add32	q2, q2
 f7 6a                 add32	q2, q2
 f7 6a                 add32	q2, q2
 f7 6b                 add32	q2, q3
 f2 6a                 mov32	q3, q0
 f7 6e                 add32	q3, q2
 c4 fa ff              ldi16	r4, 0xfffa
 c5 ff ff              ldi16	r5, 0xffff
 f2 63                 mov32	q0, q3
 f7 6b                 add32	q2, q3
 f0 63 c8              ldp24	q3, [q2]
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f0 69 8c              cmp32	q2, q3
 d2 04                 brult8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x3a3
<L22>:
 c4 f7 ff              ldi16	r4, 0xfff7
 c5 ff ff              ldi16	r5, 0xffff
 f7 62                 add32	q0, q2
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f0 36 48              ldsp16	r6, [sp+0x48]
 f0 37 4a              ldsp16	r7, [sp+0x4a]
 f0 63 88              ldp24	q2, [q2]
 f7 6e                 add32	q3, q2
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x395
<L23>:
 f0 30 4c              ldsp16	r0, [sp+0x4c]
 f0 31 4e              ldsp16	r1, [sp+0x4e]
 f2 68                 mov32	q2, q0
 f0 69 c0              cmp32	q3, q0
 d2 04                 brult8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x395
<L24>:
 f0 02 01              ldi8	r2, 0x1
 f7 7b                 sub32	q2, q3
 f0 00 27              ldi8	r0, 0x27
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 fc 04                 cmov.ult	r0, r4
 f0 33 00              ldsp16	r3, [sp+0x0]
 f1 23                 mov	r4, r3
 f4 68                 stsp16	[sp+0xa], r4
 f1 24                 mov	r5, r0
 d7 10                 sys	memcpy_p
 f0 0c 02              cmpi.s8	r0, 0x2
 f1 26                 mov	r5, r2
 fc 68                 cmov.uge	r5, r0
 f2 39                 sub	r1, r1
 f1 29                 mov	r6, r1
 29                    sub	r6, r5
 f1 2f                 mov	r7, r3
 c1 48                 ldi8	r5, 0x48
 43                    ld8u	r4, [r7]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x39e
<L25>:
 f4 af                 inc16	r7
 f4 ae                 inc16	r6
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x367
<L26>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f2 06                 add	r0, r6
 ee 20 20              st8	[r0+0], r1
 c2 26                 ldi8	r6, 0x26
 af                    xor	r7, r7
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x39e
<L27>:
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 3f                 ldi8	r5, 0x3f
 51                    st8	[r4], r5
 f2 42                 sub	r2, r2
 c1 01                 ldi8	r5, 0x1
 f4 00                 ldsp16	r4, [sp+0x0]
 14                    add	r5, r4
 f3 06                 st8	[r5], r2
 f4 38                 ldsp16	r4, [sp+0xe]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L28>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 c2 0c                 ldi8	r6, 0xc
 af                    xor	r7, r7
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f2 63                 mov32	q0, q3
 f7 72                 sub32	q0, q2
 f7 80                 lsr32.1	q0
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 e3 00 00 00           callf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f7 6b                 add32	q2, q3
 f0 63 88              ldp24	q2, [q2]
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 f2 68                 mov32	q2, q0
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f0 33 0c              ldsp16	r3, [sp+0xc]
 f0 69 c4              cmp32	q3, q1
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 fc 26                 cmov.ult	r4, r6
 fc 2f                 cmov.ult	r5, r7
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 fc 30                 cmov.ult	r6, r0
 fc 39                 cmov.ult	r7, r1
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x3bc
<L29>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 69 8c              cmp32	q2, q3
 d1 04                 brne8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L30>:
 c2 0c                 ldi8	r6, 0xc
 af                    xor	r7, r7
 e3 00 00 00           callf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f0 32 16              ldsp16	r2, [sp+0x16]
 f0 33 18              ldsp16	r3, [sp+0x18]
 f7 66                 add32	q1, q2
 c4 f4 ff              ldi16	r4, 0xfff4
 c5 ff ff              ldi16	r5, 0xffff
 f7 69                 add32	q2, q1
 f0 63 88              ldp24	q2, [q2]
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 c4 f7 ff              ldi16	r4, 0xfff7
 c5 ff ff              ldi16	r5, 0xffff
 f7 69                 add32	q2, q1
 f0 63 88              ldp24	q2, [q2]
 c6 fa ff              ldi16	r6, 0xfffa
 c7 ff ff              ldi16	r7, 0xffff
 f7 6d                 add32	q3, q1
 f0 62 cc              ldp16	r6, [q3]
 f0 3e 2a              stsp16	[sp+0x2a], r6
 f0 04 fc ff           ldi16	r0, 0xfffc
 f0 05 ff ff           ldi16	r1, 0xffff
 f2 6b                 mov32	q3, q1
 f7 6c                 add32	q3, q0
 f0 63 cc              ldp24	q3, [q3]
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 3f 18              stsp16	[sp+0x18], r7
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f7 67                 add32	q1, q3
 f0 60 e4              ldp8u	r7, [q1]
 f4 a7                 tst8	r7
 f8 0e                 cset.ne	r6
 f0 30 44              ldsp16	r0, [sp+0x44]
 f0 31 46              ldsp16	r1, [sp+0x46]
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
 f0 69 80              cmp32	q2, q0
 d2 04                 brult8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x8ec
<L31>:
 f0 30 40              ldsp16	r0, [sp+0x40]
 f0 31 42              ldsp16	r1, [sp+0x42]
 f0 38 0a              stsp16	[sp+0xa], r0
 f0 39 0c              stsp16	[sp+0xc], r1
 f0 36 52              ldsp16	r6, [sp+0x52]
 f0 3e 2e              stsp16	[sp+0x2e], r6
 f2 39                 sub	r1, r1
 f0 3e 56              stsp16	[sp+0x56], r6
 f0 39 58              stsp16	[sp+0x58], r1
 f4 a7                 tst8	r7
 f8 0e                 cset.ne	r6
 f0 3e 2c              stsp16	[sp+0x2c], r6
 c2 40                 ldi8	r6, 0x40
 af                    xor	r7, r7
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 f0 69 0c              cmp32	q0, q3
 d1 04                 brne8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L32>:
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f0 3e 30              stsp16	[sp+0x30], r6
 f0 3f 32              stsp16	[sp+0x32], r7
 f2 62                 mov32	q0, q2
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f7 63                 add32	q0, q3
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 f7 6b                 add32	q2, q3
 f0 61 88              ldp8s	r4, [q2]
 f0 38 20              stsp16	[sp+0x20], r0
 f0 39 22              stsp16	[sp+0x22], r1
 f4 a4                 tst8	r4
 f1 74                 zext8	r4
 d9 04                 brsge8	0x4 <L33>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x5cd
<L33>:
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L34>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L34>:
 04                    mov	r5, r4
 fa 84                 lsr16i	r5, 0x4
 f1 15                 mov	r2, r5
 f2 4b                 sub	r3, r3
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f7 67                 add32	q1, q3
 c6 fc ff              ldi16	r6, 0xfffc
 c7 ff ff              ldi16	r7, 0xffff
 f7 67                 add32	q1, q3
 c1 0f                 ldi8	r5, 0xf
 84                    and	r5, r4
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 a0                    xor	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 f7 69                 add32	q2, q1
 c2 01                 ldi8	r6, 0x1
 c7 00 ff              ldi16	r7, 0xff00
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L35>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L35>:
 c0 01                 ldi8	r4, 0x1
 f0 3c 28              stsp16	[sp+0x28], r4
 c4 ff ff              ldi16	r4, 0xffff
 c1 ff                 ldi8	r5, 0xff
 f0 30 24              ldsp16	r0, [sp+0x24]
 f0 31 26              ldsp16	r1, [sp+0x26]
 f7 78                 sub32	q2, q0
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f7 63                 add32	q0, q3
 f0 69 08              cmp32	q0, q2
 d2 04                 brult8	0x4 <L36>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L36>:
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 37 26              ldsp16	r7, [sp+0x26]
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f7 6e                 add32	q3, q2
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 f0 30 02              ldsp16	r0, [sp+0x2]
 f0 31 04              ldsp16	r1, [sp+0x4]
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 3f 26              stsp16	[sp+0x26], r7
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L37>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x99c
<L37>:
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 f7 6c                 add32	q3, q0
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f0 69 8c              cmp32	q2, q3
 f0 3a 16              stsp16	[sp+0x16], r2
 f0 3b 18              stsp16	[sp+0x18], r3
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 3e 2a              stsp16	[sp+0x2a], r6
 f0 36 28              ldsp16	r6, [sp+0x28]
 f0 3e 2c              stsp16	[sp+0x2c], r6
 d8 04                 bruge8	0x4 <L38>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x4bf
<L38>:
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_trap_lookup+0x99c
 c1 82                 ldi8	r5, 0x82
 31                    cmp	r4, r5
 d1 04                 brne8	0x4 <L39>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x6c1
<L39>:
 c1 81                 ldi8	r5, 0x81
 31                    cmp	r4, r5
 d1 04                 brne8	0x4 <L40>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x64f
<L40>:
 c1 80                 ldi8	r5, 0x80
 31                    cmp	r4, r5
 d0 04                 breq8	0x4 <L41>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L41>:
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 69 08              cmp32	q0, q2
 d2 04                 brult8	0x4 <L42>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L42>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f2 42                 sub	r2, r2
 f2 68                 mov32	q2, q0
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 f7 6b                 add32	q2, q3
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f7 63                 add32	q0, q3
 f0 60 68              ldp8u	r3, [q2]
 f1 23                 mov	r4, r3
 c1 7f                 ldi8	r5, 0x7f
 81                    and	r4, r5
 a5                    xor	r5, r5
 f1 2a                 mov	r6, r2
 e3 00 00 00           callf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 98                    or	r6, r4
 9d                    or	r7, r5
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f4 a3                 tst8	r3
 d3 04                 brslt8	0x4 <L43>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x7ae
<L43>:
 f1 22                 mov	r4, r2
 c8 07                 addi.s8	r4, 0x7
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f0 69 0c              cmp32	q0, q3
 d2 04                 brult8	0x4 <L44>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L44>:
 f0 0e 0f              cmpi.s8	r2, 0xf
 f1 14                 mov	r2, r4
 d8 04                 bruge8	0x4 <L45>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x5ff
<L45>:
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L46>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L46>:
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 69 08              cmp32	q0, q2
 d2 04                 brult8	0x4 <L47>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L47>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f2 42                 sub	r2, r2
 f2 68                 mov32	q2, q0
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 f7 6b                 add32	q2, q3
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f7 63                 add32	q0, q3
 f0 60 68              ldp8u	r3, [q2]
 f1 23                 mov	r4, r3
 c1 7f                 ldi8	r5, 0x7f
 81                    and	r4, r5
 a5                    xor	r5, r5
 f1 2a                 mov	r6, r2
 e3 00 00 00           callf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 98                    or	r6, r4
 9d                    or	r7, r5
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f4 a3                 tst8	r3
 d3 04                 brslt8	0x4 <L48>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x730
<L48>:
 f1 22                 mov	r4, r2
 c8 07                 addi.s8	r4, 0x7
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f0 69 0c              cmp32	q0, q3
 d2 04                 brult8	0x4 <L49>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L49>:
 f0 0e 0f              cmpi.s8	r2, 0xf
 f1 14                 mov	r2, r4
 d8 04                 bruge8	0x4 <L50>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x671
<L50>:
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 69 08              cmp32	q0, q2
 d2 04                 brult8	0x4 <L51>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L51>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 3c 12              stsp16	[sp+0x12], r4
 f2 68                 mov32	q2, q0
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 f7 6b                 add32	q2, q3
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f7 63                 add32	q0, q3
 f0 60 48              ldp8u	r2, [q2]
 f1 22                 mov	r4, r2
 c1 7f                 ldi8	r5, 0x7f
 81                    and	r4, r5
 a5                    xor	r5, r5
 f0 36 12              ldsp16	r6, [sp+0x12]
 e3 00 00 00           callf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 98                    or	r6, r4
 9d                    or	r7, r5
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f1 22                 mov	r4, r2
 f4 a2                 tst8	r2
 d3 04                 brslt8	0x4 <L52>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x82e
<L52>:
 f0 34 12              ldsp16	r4, [sp+0x12]
 c8 07                 addi.s8	r4, 0x7
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f0 69 0c              cmp32	q0, q3
 d2 04                 brult8	0x4 <L53>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L53>:
 f0 35 12              ldsp16	r5, [sp+0x12]
 cd 0f                 cmpi.s8	r5, 0xf
 f0 3c 12              stsp16	[sp+0x12], r4
 d8 04                 bruge8	0x4 <L54>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x6d9
<L54>:
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
 f6 43                 sext8	r3
 f4 a2                 tst8	r2
 f8 04                 cset.eq	r4
 f6 2b                 tst16	r3
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 cd 01                 cmpi.s8	r5, 0x1
 d0 04                 breq8	0x4 <L55>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L55>:
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 69 08              cmp32	q0, q2
 d2 04                 brult8	0x4 <L56>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L56>:
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 a0                    xor	r4, r4
 f0 3c 12              stsp16	[sp+0x12], r4
 f2 68                 mov32	q2, q0
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 f7 6b                 add32	q2, q3
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f7 63                 add32	q0, q3
 f0 60 88              ldp8u	r4, [q2]
 f0 3c 28              stsp16	[sp+0x28], r4
 c1 7f                 ldi8	r5, 0x7f
 81                    and	r4, r5
 a5                    xor	r5, r5
 f0 36 12              ldsp16	r6, [sp+0x12]
 e3 00 00 00           callf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f9 51                 or	r2, r4
 f9 75                 or	r3, r5
 f0 35 28              ldsp16	r5, [sp+0x28]
 01                    mov	r4, r5
 f4 a5                 tst8	r5
 d3 04                 brslt8	0x4 <L57>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x85d
<L57>:
 f0 34 12              ldsp16	r4, [sp+0x12]
 c8 07                 addi.s8	r4, 0x7
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f0 69 0c              cmp32	q0, q3
 d2 04                 brult8	0x4 <L58>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L58>:
 f0 35 12              ldsp16	r5, [sp+0x12]
 cd 0f                 cmpi.s8	r5, 0xf
 f0 3c 12              stsp16	[sp+0x12], r4
 d8 04                 bruge8	0x4 <L59>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x75a
<L59>:
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
 f6 43                 sext8	r3
 f4 a2                 tst8	r2
 f8 04                 cset.eq	r4
 f6 2b                 tst16	r3
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 cd 01                 cmpi.s8	r5, 0x1
 d0 04                 breq8	0x4 <L60>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L60>:
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 69 08              cmp32	q0, q2
 d2 04                 brult8	0x4 <L61>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L61>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f2 42                 sub	r2, r2
 f2 68                 mov32	q2, q0
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 f7 6b                 add32	q2, q3
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f7 63                 add32	q0, q3
 f0 60 68              ldp8u	r3, [q2]
 f1 23                 mov	r4, r3
 c1 7f                 ldi8	r5, 0x7f
 81                    and	r4, r5
 a5                    xor	r5, r5
 f1 2a                 mov	r6, r2
 e3 00 00 00           callf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 98                    or	r6, r4
 9d                    or	r7, r5
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 f4 a3                 tst8	r3
 d3 04                 brslt8	0x4 <L62>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x893
<L62>:
 f1 22                 mov	r4, r2
 c8 07                 addi.s8	r4, 0x7
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f0 69 0c              cmp32	q0, q3
 d2 04                 brult8	0x4 <L63>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L63>:
 f0 0e 0f              cmpi.s8	r2, 0xf
 f1 14                 mov	r2, r4
 d8 04                 bruge8	0x4 <L64>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x7da
<L64>:
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
 04                    mov	r5, r4
 f6 45                 sext8	r5
 f0 38 20              stsp16	[sp+0x20], r0
 f0 39 22              stsp16	[sp+0x22], r1
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 a0                    xor	r4, r4
 f0 3c 28              stsp16	[sp+0x28], r4
 f6 2d                 tst16	r5
 d0 04                 breq8	0x4 <L65>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x8e2
<L65>:
 f0 34 12              ldsp16	r4, [sp+0x12]
 f4 a4                 tst8	r4
 a0                    xor	r4, r4
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 d1 04                 brne8	0x4 <L66>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x54c
<L66>:
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
 f6 44                 sext8	r4
 f0 38 20              stsp16	[sp+0x20], r0
 f0 39 22              stsp16	[sp+0x22], r1
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L67>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x878
<L67>:
 f0 34 12              ldsp16	r4, [sp+0x12]
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L68>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L68>:
 c0 01                 ldi8	r4, 0x1
 f9 88                 and	r4, r2
 f6 4c                 neg16	r4
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 f7 81                 lsr32.1	q1
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 f7 66                 add32	q1, q2
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_trap_lookup+0x52a
 f6 43                 sext8	r3
 f0 38 20              stsp16	[sp+0x20], r0
 f0 39 22              stsp16	[sp+0x22], r1
 f4 a2                 tst8	r2
 f8 04                 cset.eq	r4
 f6 2b                 tst16	r3
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 cd 01                 cmpi.s8	r5, 0x1
 d0 04                 breq8	0x4 <L69>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L69>:
 f0 34 56              ldsp16	r4, [sp+0x56]
 f0 35 58              ldsp16	r5, [sp+0x58]
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 f0 69 c8              cmp32	q3, q2
 d2 04                 brult8	0x4 <L70>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L70>:
 f0 14 34              leasp	r4, 0x34
 f0 15 20              leasp	r5, 0x20
 f0 16 30              leasp	r6, 0x30
 e3 00 00 00           callf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.read_uleb128
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L71>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L71>:
 f0 32 30              ldsp16	r2, [sp+0x30]
 f0 33 32              ldsp16	r3, [sp+0x32]
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_trap_lookup+0x533
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_trap_lookup+0x54c
 f0 34 52              ldsp16	r4, [sp+0x52]
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 02 01              ldi8	r2, 0x1
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L72>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L72>:
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 f0 35 2e              ldsp16	r5, [sp+0x2e]
 31                    cmp	r4, r5
 d2 04                 brult8	0x4 <L73>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L73>:
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 a5                    xor	r5, r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6f                 add32	q3, q3
 f7 6e                 add32	q3, q2
 f0 34 38              ldsp16	r4, [sp+0x38]
 f0 35 3a              ldsp16	r5, [sp+0x3a]
 f7 6b                 add32	q2, q3
 f0 36 48              ldsp16	r6, [sp+0x48]
 f0 37 4a              ldsp16	r7, [sp+0x4a]
 f0 63 88              ldp24	q2, [q2]
 f7 6e                 add32	q3, q2
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L74>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x991
<L74>:
 f0 30 4c              ldsp16	r0, [sp+0x4c]
 f0 31 4e              ldsp16	r1, [sp+0x4e]
 f2 68                 mov32	q2, q0
 f0 69 c0              cmp32	q3, q0
 d2 04                 brult8	0x4 <L75>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x991
<L75>:
 f7 7b                 sub32	q2, q3
 f0 00 1b              ldi8	r0, 0x1b
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 fc 04                 cmov.ult	r0, r4
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d7 10                 sys	memcpy_p
 f0 0c 02              cmpi.s8	r0, 0x2
 f1 2a                 mov	r6, r2
 fc 70                 cmov.uge	r6, r0
 a0                    xor	r4, r4
 04                    mov	r5, r4
 26                    sub	r5, r6
 f1 29                 mov	r6, r1
 4e                    ld8u	r7, [r6]
 f4 a7                 tst8	r7
 d1 04                 brne8	0x4 <L76>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x9ae
<L76>:
 f4 ae                 inc16	r6
 f4 ad                 inc16	r5
 f6 2d                 tst16	r5
 d0 04                 breq8	0x4 <L77>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x966
<L77>:
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f2 24                 add	r5, r0
 54                    st8	[r5], r4
 c0 1a                 ldi8	r4, 0x1a
 a5                    xor	r5, r5
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L78>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x9ae
<L78>:
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 3f                 ldi8	r5, 0x3f
 ee b8 48              st16	[r4+40], r5
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 f4 a4                 tst8	r4
 f0 02 01              ldi8	r2, 0x1
 d0 04                 breq8	0x4 <L79>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x8fd
<L79>:
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
 f4 00                 ldsp16	r4, [sp+0x0]
 ee 48 69              st8	[r4+73], r2
 c8 44                 addi.s8	r4, 0x44
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f0 6b c8              st32	[r4], q3
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9

Disassembly of section .text.open_section:

<open_section>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f1 14                 mov	r2, r4
 f0 33 19              ldsp16	r3, [sp+0x19]
 f0 30 15              ldsp16	r0, [sp+0x15]
 f0 31 17              ldsp16	r1, [sp+0x17]
 cd 04                 cmpi.s8	r5, 0x4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	open_section
		R_AVM_FAR24	.text.open_section+0x32
<L0>:
 cd 03                 cmpi.s8	r5, 0x3
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	open_section
		R_AVM_FAR24	.text.open_section+0x45
<L1>:
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	open_section
		R_AVM_FAR24	.text.open_section+0xc2
<L2>:
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	open_section
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.open_section+0x113
 f7 63                 add32	q0, q3
 f1 22                 mov	r4, r2
 c8 18                 addi.s8	r4, 0x18
 f0 6b 08              st32	[r4], q0
 f0 0a 14              addi.s8	r2, 0x14
 f0 6b c4              st32	[r2], q3
 e2 00 00 00           jmpf	open_section
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.open_section+0x111
 f0 3a 08              stsp16	[sp+0x8], r2
 a0                    xor	r4, r4
 f0 02 02              ldi8	r2, 0x2
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	open_section
		R_AVM_FAR24	.text.open_section+0x113
<L3>:
 c0 0c                 ldi8	r4, 0xc
 f0 02 03              ldi8	r2, 0x3
 cd 01                 cmpi.s8	r5, 0x1
 fb 22                 cmov.eq	r4, r2
 f2 4b                 sub	r3, r3
 f0 3c 04              stsp16	[sp+0x4], r4
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 02 09              ldi8	r2, 0x9
 f4 49                 stsp16	[sp+0x2], r5
 f4 a5                 tst8	r5
 f2 69                 mov32	q2, q1
 f0 32 04              ldsp16	r2, [sp+0x4]
 fb 14                 cmov.eq	r2, r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 62 ac              ldp16	r5, [q3]
 f1 22                 mov	r4, r2
 f4 41                 stsp16	[sp+0x0], r5
 e3 00 00 00           callf	open_section
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_umulhisi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 f0 02 02              ldi8	r2, 0x2
 f2 4b                 sub	r3, r3
 f7 6d                 add32	q3, q1
 f0 69 0c              cmp32	q0, q3
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	open_section
		R_AVM_FAR24	.text.open_section+0x113
<L4>:
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	open_section
		R_AVM_FAR24	.text.open_section+0xee
<L5>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 68                 add32	q2, q0
 ce 01                 cmpi.s8	r6, 0x1
 f4 22                 ldsp16	r6, [sp+0x8]
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	open_section
		R_AVM_FAR24	.text.open_section+0x107
<L6>:
 f4 03                 ldsp16	r7, [sp+0x0]
 ee fc 3e              st16	[r6+30], r7
 ca 04                 addi.s8	r6, 0x4
 e2 00 00 00           jmpf	open_section
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.open_section+0x10e
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 04              stsp16	[sp+0x4], r3
 f0 63 4c              ldp24	q1, [q3]
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 6b 48              st32	[r4], q1
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f7 6b                 add32	q2, q3
 f4 23                 ldsp16	r7, [sp+0x8]
 0b                    mov	r6, r7
 ca 0c                 addi.s8	r6, 0xc
 f0 6b 8c              st32	[r6], q2
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f7 62                 add32	q0, q2
 cb 10                 addi.s8	r7, 0x10
 f0 6b 0e              st32	[r7], q0
 e2 00 00 00           jmpf	open_section
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.open_section+0x111
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 01                 ldsp16	r5, [sp+0x0]
 ee b8 3c              st16	[r4+28], r5
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 f0 6b c8              st32	[r4], q3
 e2 00 00 00           jmpf	open_section
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.open_section+0x111
 f4 03                 ldsp16	r7, [sp+0x0]
 ee fc 40              st16	[r6+32], r7
 ca 08                 addi.s8	r6, 0x8
 f0 6b 8c              st32	[r6], q2
 c0 01                 ldi8	r4, 0x1
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.read_uleb128:

<read_uleb128>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 f4 51                 stsp16	[sp+0x4], r5
 f0 6a 0a              ld32	q0, [r5]
 0c                    mov	r7, r4
 c8 10                 addi.s8	r4, 0x10
 f0 6a 88              ld32	q2, [r4]
 f0 69 08              cmp32	q0, q2
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	read_uleb128
		R_AVM_FAR24	.text.read_uleb128+0xa0
<L0>:
 f4 42                 stsp16	[sp+0x0], r6
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 aa                    xor	r6, r6
 03                    mov	r4, r7
 f4 48                 stsp16	[sp+0x2], r4
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f7 64                 add32	q1, q0
 c8 0c                 addi.s8	r4, 0xc
 f0 6a 88              ld32	q2, [r4]
 f7 68                 add32	q2, q0
 f0 60 a8              ldp8u	r5, [q2]
 f4 59                 stsp16	[sp+0x6], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 6b 48              st32	[r4], q1
 c0 7f                 ldi8	r4, 0x7f
 81                    and	r4, r5
 a5                    xor	r5, r5
 f4 72                 stsp16	[sp+0xc], r6
 af                    xor	r7, r7
 e3 00 00 00           callf	read_uleb128
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f9 11                 or	r0, r4
 f9 35                 or	r1, r5
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 a5                 tst8	r5
 d3 04                 brslt8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	read_uleb128
		R_AVM_FAR24	.text.read_uleb128+0x8c
<L1>:
 a0                    xor	r4, r4
 f4 58                 stsp16	[sp+0x6], r4
 f4 31                 ldsp16	r5, [sp+0xc]
 c9 07                 addi.s8	r5, 0x7
 f4 0a                 ldsp16	r6, [sp+0x2]
 02                    mov	r4, r6
 ca 10                 addi.s8	r6, 0x10
 f0 6a cc              ld32	q3, [r6]
 f0 69 4c              cmp32	q1, q3
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	read_uleb128
		R_AVM_FAR24	.text.read_uleb128+0xa3
<L2>:
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f4 32                 ldsp16	r6, [sp+0xc]
 ce 0f                 cmpi.s8	r6, 0xf
 f2 61                 mov32	q0, q1
 09                    mov	r6, r5
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	read_uleb128
		R_AVM_FAR24	.text.read_uleb128+0x26
<L3>:
 e2 00 00 00           jmpf	read_uleb128
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.read_uleb128+0xa3
 f4 30                 ldsp16	r4, [sp+0xc]
 f6 45                 sext8	r5
 f6 2d                 tst16	r5
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	read_uleb128
		R_AVM_FAR24	.text.read_uleb128+0xac
<L4>:
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	read_uleb128
		R_AVM_FAR24	.text.read_uleb128+0xac
<L5>:
 a0                    xor	r4, r4
 f4 58                 stsp16	[sp+0x6], r4
 f4 18                 ldsp16	r4, [sp+0x6]
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 6b 08              st32	[r4], q0
 c0 01                 ldi8	r4, 0x1
 e2 00 00 00           jmpf	read_uleb128
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.read_uleb128+0xa1
