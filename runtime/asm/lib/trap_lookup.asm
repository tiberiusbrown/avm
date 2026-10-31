
trap_lookup.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 trap_lookup.c
00000000 l    d  .text.__avm_trap_lookup	00000000 .text.__avm_trap_lookup
00000000 g     F .text.__avm_trap_lookup	000004a4 __avm_trap_lookup
00000000         *UND*	00000000 __avm_umulhisi3
00000000         *UND*	00000000 __avm_mulsi3

Disassembly of section .text.__avm_trap_lookup:

<__avm_trap_lookup>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d8                 adjsp	-0x28
 0e                    mov	r7, r6
 cb 44                 addi.s8	r7, 0x44
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 6b 0e              st32	[r7], q0
 af                    xor	r7, r7
 ee fc 68              st16	[r6+72], r7
 c3 3f                 ldi8	r7, 0x3f
 ee fc 48              st16	[r6+40], r7
 7b                    st16	[r6], r7
 f0 00 11              ldi8	r0, 0x11
 f0 60 e0              ldp8u	r7, [q0]
 f1 07                 mov	r0, r7
 f0 02 0f              ldi8	r2, 0xf
 f2 4b                 sub	r3, r3
 f0 62 e4              ldp16	r7, [q1]
 f1 17                 mov	r2, r7
 f1 18                 mov	r3, r0
 f0 00 17              ldi8	r0, 0x17
 f0 05 00 ff           ldi16	r1, 0xff00
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f7 61                 add32	q0, q1
 f0 02 18              ldi8	r2, 0x18
 f0 07 00 ff           ldi16	r3, 0xff00
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x49d
<L0>:
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f0 60 e0              ldp8u	r7, [q0]
 cf 41                 cmpi.s8	r7, 0x41
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x49d
<L1>:
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f7 61                 add32	q0, q1
 f0 60 e0              ldp8u	r7, [q0]
 cf 56                 cmpi.s8	r7, 0x56
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x49d
<L2>:
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f7 61                 add32	q0, q1
 f0 60 e0              ldp8u	r7, [q0]
 cf 44                 cmpi.s8	r7, 0x44
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x49d
<L3>:
 f0 02 03              ldi8	r2, 0x3
 f2 4b                 sub	r3, r3
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f7 61                 add32	q0, q1
 f0 60 e0              ldp8u	r7, [q0]
 cf 31                 cmpi.s8	r7, 0x31
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x49d
<L4>:
 f0 00 07              ldi8	r0, 0x7
 f2 39                 sub	r1, r1
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f7 61                 add32	q0, q1
 f0 60 e0              ldp8u	r7, [q0]
 f4 a7                 tst8	r7
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x49d
<L5>:
 f0 00 15              ldi8	r0, 0x15
 f2 39                 sub	r1, r1
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 62                 add32	q0, q2
 f0 02 17              ldi8	r2, 0x17
 f2 4b                 sub	r3, r3
 f7 66                 add32	q1, q2
 f0 60 44              ldp8u	r2, [q1]
 f0 62 e0              ldp16	r7, [q0]
 f9 e9                 or	r7, r2
 f6 2f                 tst16	r7
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x49d
<L6>:
 f0 00 0c              ldi8	r0, 0xc
 f2 39                 sub	r1, r1
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f7 61                 add32	q0, q1
 f0 63 00              ldp24	q0, [q0]
 c0 18                 ldi8	r4, 0x18
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x49d
<L7>:
 f0 00 0f              ldi8	r0, 0xf
 f2 39                 sub	r1, r1
 f2 64                 mov32	q1, q0
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 66                 add32	q1, q2
 f0 00 08              ldi8	r0, 0x8
 f7 62                 add32	q0, q2
 f0 3a 20              stsp16	[sp+0x20], r2
 f0 3b 22              stsp16	[sp+0x22], r3
 f0 63 44              ldp24	q1, [q1]
 f0 62 80              ldp16	r4, [q0]
 f4 70                 stsp16	[sp+0xc], r4
 a5                    xor	r5, r5
 f2 62                 mov32	q0, q2
 f7 60                 add32	q0, q0
 f7 60                 add32	q0, q0
 f7 60                 add32	q0, q0
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f7 62                 add32	q0, q2
 c0 18                 ldi8	r4, 0x18
 f7 62                 add32	q0, q2
 f0 69 40              cmp32	q1, q0
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x49d
<L8>:
 f0 00 0a              ldi8	r0, 0xa
 f2 39                 sub	r1, r1
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 62                 add32	q0, q2
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f0 3a 24              stsp16	[sp+0x24], r2
 f0 3b 26              stsp16	[sp+0x26], r3
 f0 00 04              ldi8	r0, 0x4
 f2 39                 sub	r1, r1
 f7 62                 add32	q0, q2
 f0 02 12              ldi8	r2, 0x12
 f2 4b                 sub	r3, r3
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 63 80              ldp24	q2, [q0]
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 32 24              ldsp16	r2, [sp+0x24]
 f0 33 26              ldsp16	r3, [sp+0x26]
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f0 62 e8              ldp16	r7, [q2]
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f1 07                 mov	r0, r7
 f2 39                 sub	r1, r1
 c3 0c                 ldi8	r7, 0xc
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f1 20                 mov	r4, r0
 07                    mov	r5, r7
 f0 3e 1c              stsp16	[sp+0x1c], r6
 e3 00 00 00           callf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_umulhisi3
 f2 61                 mov32	q0, q1
 f7 69                 add32	q2, q1
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f0 32 18              ldsp16	r2, [sp+0x18]
 f0 33 1a              ldsp16	r3, [sp+0x1a]
 f0 69 48              cmp32	q1, q2
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x49d
<L9>:
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x49d
<L10>:
 a0                    xor	r4, r4
 c5 00 01              ldi16	r5, 0x100
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f7 79                 sub32	q2, q1
 f2 67                 mov32	q1, q3
 f0 69 84              cmp32	q2, q1
 c2 18                 ldi8	r6, 0x18
 af                    xor	r7, r7
 d8 04                 bruge8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x49d
<L11>:
 f4 30                 ldsp16	r4, [sp+0xc]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x326
<L12>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 6e                 add32	q3, q2
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f2 69                 mov32	q2, q1
 f2 67                 mov32	q1, q3
 f7 76                 sub32	q1, q2
 f7 81                 lsr32.1	q1
 f7 66                 add32	q1, q2
 f2 61                 mov32	q0, q1
 f7 60                 add32	q0, q0
 f7 60                 add32	q0, q0
 f7 60                 add32	q0, q0
 f7 61                 add32	q0, q1
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f7 63                 add32	q0, q3
 f0 63 00              ldp24	q0, [q0]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c0              cmp32	q3, q0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 fc 32                 cmov.ult	r6, r2
 fc 3b                 cmov.ult	r7, r3
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f7 64                 add32	q1, q0
 fc 14                 cmov.ult	r2, r4
 fc 1d                 cmov.ult	r3, r5
 f0 69 4c              cmp32	q1, q3
 d8 04                 bruge8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x1f9
<L13>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 69 48              cmp32	q1, q2
 f0 30 24              ldsp16	r0, [sp+0x24]
 f0 31 26              ldsp16	r1, [sp+0x26]
 d1 04                 brne8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x326
<L14>:
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f2 69                 mov32	q2, q1
 f7 6a                 add32	q2, q2
 f7 6a                 add32	q2, q2
 f7 6a                 add32	q2, q2
 f7 69                 add32	q2, q1
 f0 32 20              ldsp16	r2, [sp+0x20]
 f0 33 22              ldsp16	r3, [sp+0x22]
 f7 66                 add32	q1, q2
 f0 3a 20              stsp16	[sp+0x20], r2
 f0 3b 22              stsp16	[sp+0x22], r3
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 63 88              ldp24	q2, [q2]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 d2 04                 brult8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x326
<L15>:
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 f7 6e                 add32	q3, q2
 f0 63 0c              ldp24	q0, [q3]
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f0 69 0c              cmp32	q0, q3
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 d8 04                 bruge8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x30e
<L16>:
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f0 69 0c              cmp32	q0, q3
 d2 04                 brult8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x30e
<L17>:
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f7 78                 sub32	q2, q0
 f7 61                 add32	q0, q1
 f0 02 27              ldi8	r2, 0x27
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 fc 14                 cmov.ult	r2, r4
 aa                    xor	r6, r6
 f1 1e                 mov	r3, r6
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f2 6a                 mov32	q3, q0
 f1 26                 mov	r5, r2
 d7 10                 sys	memcpy_p
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 44                    ld8u	r5, [r4]
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x318
<L18>:
 f4 ac                 inc16	r4
 f4 ab                 inc16	r3
 f5 1a                 cmp	r3, r2
 d8 04                 bruge8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x2e0
<L19>:
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f2 14                 add	r2, r4
 a0                    xor	r4, r4
 ee 84 20              st8	[r2+0], r4
 c0 27                 ldi8	r4, 0x27
 a5                    xor	r5, r5
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 69 c8              cmp32	q3, q2
 d2 04                 brult8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x318
<L20>:
 c0 3f                 ldi8	r4, 0x3f
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 74                    st16	[r5], r4
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_trap_lookup+0x320
 c0 01                 ldi8	r4, 0x1
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 ee 8a 68              st8	[r5+72], r4
 f0 30 24              ldsp16	r0, [sp+0x24]
 f0 31 26              ldsp16	r1, [sp+0x26]
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f6 2c                 tst16	r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 d1 04                 brne8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x49d
<L21>:
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 ca 28                 addi.s8	r6, 0x28
 f0 3e 20              stsp16	[sp+0x20], r6
 f7 62                 add32	q0, q2
 f0 38 24              stsp16	[sp+0x24], r0
 f0 39 26              stsp16	[sp+0x26], r1
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 c0 0c                 ldi8	r4, 0xc
 a5                    xor	r5, r5
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f2 6b                 mov32	q3, q1
 f2 66                 mov32	q1, q2
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f7 77                 sub32	q1, q3
 f7 81                 lsr32.1	q1
 f7 67                 add32	q1, q3
 f2 69                 mov32	q2, q1
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 e3 00 00 00           callf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 30 24              ldsp16	r0, [sp+0x24]
 f0 31 26              ldsp16	r1, [sp+0x26]
 f7 68                 add32	q2, q0
 f0 63 88              ldp24	q2, [q2]
 f0 69 c8              cmp32	q3, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 fc 22                 cmov.ult	r4, r2
 fc 2b                 cmov.ult	r5, r3
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f7 64                 add32	q1, q0
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 fc 10                 cmov.ult	r2, r0
 fc 19                 cmov.ult	r3, r1
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x356
<L22>:
 f0 30 24              ldsp16	r0, [sp+0x24]
 f0 31 26              ldsp16	r1, [sp+0x26]
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 d1 04                 brne8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x49d
<L23>:
 c0 0c                 ldi8	r4, 0xc
 a5                    xor	r5, r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 69                 mov32	q2, q1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 e3 00 00 00           callf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f7 62                 add32	q0, q2
 c4 f7 ff              ldi16	r4, 0xfff7
 c5 ff ff              ldi16	r5, 0xffff
 f2 6a                 mov32	q3, q0
 f7 68                 add32	q2, q0
 f0 63 88              ldp24	q2, [q2]
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f0 69 08              cmp32	q0, q2
 d2 04                 brult8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x49d
<L24>:
 c4 f4 ff              ldi16	r4, 0xfff4
 c5 ff ff              ldi16	r5, 0xffff
 f7 6e                 add32	q3, q2
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 3f 26              stsp16	[sp+0x26], r7
 f7 6b                 add32	q2, q3
 f0 63 88              ldp24	q2, [q2]
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x476
<L25>:
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f0 69 8c              cmp32	q2, q3
 d2 04                 brult8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x476
<L26>:
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f7 6e                 add32	q3, q2
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 f7 72                 sub32	q0, q2
 f0 02 1b              ldi8	r2, 0x1b
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 fc 10                 cmov.ult	r2, r0
 f0 30 20              ldsp16	r0, [sp+0x20]
 f1 20                 mov	r4, r0
 f1 26                 mov	r5, r2
 d7 10                 sys	memcpy_p
 a0                    xor	r4, r4
 f1 24                 mov	r5, r0
 49                    ld8u	r6, [r5]
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x482
<L27>:
 f4 ad                 inc16	r5
 f4 ac                 inc16	r4
 f5 22                 cmp	r4, r2
 d8 04                 bruge8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x448
<L28>:
 f0 35 20              ldsp16	r5, [sp+0x20]
 f2 26                 add	r5, r2
 a0                    xor	r4, r4
 54                    st8	[r5], r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 c2 1b                 ldi8	r6, 0x1b
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d2 04                 brult8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x482
<L29>:
 c0 3f                 ldi8	r4, 0x3f
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 ee 9a 48              st16	[r5+40], r4
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_trap_lookup+0x49d
 c0 09                 ldi8	r4, 0x9
 a5                    xor	r5, r5
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 37 26              ldsp16	r7, [sp+0x26]
 f7 6e                 add32	q3, q2
 f0 63 8c              ldp24	q2, [q3]
 c2 01                 ldi8	r6, 0x1
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 ee ce 69              st8	[r7+73], r6
 cb 44                 addi.s8	r7, 0x44
 f0 6b 8e              st32	[r7], q2
 d6 28                 adjsp	0x28
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
