
trap_lookup.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 trap_lookup.c
00000000 l    d  .text.__avm_trap_lookup	00000000 .text.__avm_trap_lookup
00000000 l     F .text.open_section	00000140 open_section
00000000 l     F .text.read_uleb128	00000131 read_uleb128
00000000 l    d  .text.open_section	00000000 .text.open_section
00000000 l    d  .text.read_uleb128	00000000 .text.read_uleb128
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.__avm_trap_lookup	000007fc __avm_trap_lookup
00000000         *UND*	00000000 __avm_mulsi3
00000000         *UND*	00000000 __avm_umulhisi3

Disassembly of section .text.__avm_trap_lookup:

<__avm_trap_lookup>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 a2                 adjsp	-0x5e
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 0e                    mov	r7, r6
 cb 06                 addi.s8	r7, 0x6
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 6b 4e              st32	[r7], q1
 0e                    mov	r7, r6
 f7 5a                 st16	[r7+], r2
 f3 0f                 st8	[r7], r3
 0e                    mov	r7, r6
 cb 03                 addi.s8	r7, 0x3
 f7 5a                 st16	[r7+], r2
 f3 0f                 st8	[r7], r3
 f0 00 0f              ldi8	r0, 0xf
 f2 39                 sub	r1, r1
 f0 63 80              ldp24	q2, [q0]
 f0 3a 24              stsp16	[sp+0x24], r2
 f0 3b 26              stsp16	[sp+0x26], r3
 f0 00 2e              ldi8	r0, 0x2e
 f0 05 00 ff           ldi16	r1, 0xff00
 f7 62                 add32	q0, q2
 f0 02 2f              ldi8	r2, 0x2f
 f0 07 00 ff           ldi16	r3, 0xff00
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L0>:
 f0 60 e8              ldp8u	r7, [q2]
 cf 41                 cmpi.s8	r7, 0x41
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L1>:
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f2 62                 mov32	q0, q2
 f7 61                 add32	q0, q1
 f0 60 e0              ldp8u	r7, [q0]
 cf 56                 cmpi.s8	r7, 0x56
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L2>:
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 62                 add32	q0, q2
 f0 60 e0              ldp8u	r7, [q0]
 cf 44                 cmpi.s8	r7, 0x44
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L3>:
 f0 02 03              ldi8	r2, 0x3
 f2 4b                 sub	r3, r3
 f2 62                 mov32	q0, q2
 f7 61                 add32	q0, q1
 f0 60 e0              ldp8u	r7, [q0]
 cf 31                 cmpi.s8	r7, 0x31
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L4>:
 f0 02 04              ldi8	r2, 0x4
 f2 4b                 sub	r3, r3
 f2 62                 mov32	q0, q2
 f7 61                 add32	q0, q1
 f0 63 00              ldp24	q0, [q0]
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
 f0 00 07              ldi8	r0, 0x7
 f2 39                 sub	r1, r1
 f7 62                 add32	q0, q2
 f0 60 e0              ldp8u	r7, [q0]
 cf 05                 cmpi.s8	r7, 0x5
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L5>:
 f0 00 08              ldi8	r0, 0x8
 f2 39                 sub	r1, r1
 f7 62                 add32	q0, q2
 f0 60 e0              ldp8u	r7, [q0]
 f4 a7                 tst8	r7
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L6>:
 f0 00 09              ldi8	r0, 0x9
 f2 39                 sub	r1, r1
 f7 62                 add32	q0, q2
 f0 63 00              ldp24	q0, [q0]
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xe0
<L7>:
 d6 5e                 adjsp	0x5e
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
 f7 72                 sub32	q0, q2
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 f0 69 04              cmp32	q0, q1
 f0 00 2f              ldi8	r0, 0x2f
 f2 39                 sub	r1, r1
 d8 04                 bruge8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L9>:
 f0 02 0c              ldi8	r2, 0xc
 f2 4b                 sub	r3, r3
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 f7 66                 add32	q1, q2
 f0 3a 12              stsp16	[sp+0x12], r2
 f0 3b 14              stsp16	[sp+0x14], r3
 a0                    xor	r4, r4
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f0 38 20              stsp16	[sp+0x20], r0
 f0 39 22              stsp16	[sp+0x22], r1
 f0 00 07              ldi8	r0, 0x7
 0c                    mov	r7, r4
 fe 38                 mul16	r7, r0
 f1 17                 mov	r2, r7
 f2 4b                 sub	r3, r3
 0c                    mov	r7, r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f7 66                 add32	q1, q2
 f2 61                 mov32	q0, q1
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f0 63 80              ldp24	q2, [q0]
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f2 61                 mov32	q0, q1
 c0 04                 ldi8	r4, 0x4
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f0 63 80              ldp24	q2, [q0]
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 30 20              ldsp16	r0, [sp+0x20]
 f0 31 22              ldsp16	r1, [sp+0x22]
 f0 60 84              ldp8u	r4, [q1]
 f4 53                 stsp16	[sp+0x4], r7
 f4 af                 inc16	r7
 f0 3c 16              stsp16	[sp+0x16], r4
 3c                    cmp	r7, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 d0 04                 breq8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L10>:
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 f0 69 40              cmp32	q1, q0
 d0 04                 breq8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L11>:
 d6 fa                 adjsp	-0x6
 f0 17 2a              leasp	r7, 0x2a
 f4 53                 stsp16	[sp+0x4], r7
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f2 64                 mov32	q1, q0
 f7 66                 add32	q1, q2
 f0 17 3e              leasp	r7, 0x3e
 03                    mov	r4, r7
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6b                 mov32	q3, q1
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
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f7 62                 add32	q0, q2
 f0 34 16              ldsp16	r4, [sp+0x16]
 cc 05                 cmpi.s8	r4, 0x5
 d0 04                 breq8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x125
<L13>:
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 69 08              cmp32	q0, q2
 d0 04                 breq8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L14>:
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
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
 f0 36 58              ldsp16	r6, [sp+0x58]
 f4 52                 stsp16	[sp+0x4], r6
 f1 16                 mov	r2, r6
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 d0 04                 breq8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L15>:
 f0 30 40              ldsp16	r0, [sp+0x40]
 f0 31 42              ldsp16	r1, [sp+0x42]
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
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 3b 1e              stsp16	[sp+0x1e], r3
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
 f0 34 54              ldsp16	r4, [sp+0x54]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x37c
<L19>:
 f0 36 38              ldsp16	r6, [sp+0x38]
 f0 37 3a              ldsp16	r7, [sp+0x3a]
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 08                    mov	r6, r4
 af                    xor	r7, r7
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f7 7e                 sub32	q3, q2
 f7 83                 lsr32.1	q3
 f7 6e                 add32	q3, q2
 f2 67                 mov32	q1, q3
 f7 65                 add32	q1, q1
 f7 65                 add32	q1, q1
 f7 65                 add32	q1, q1
 f7 67                 add32	q1, q3
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f7 69                 add32	q2, q1
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 f0 69 40              cmp32	q1, q0
 f0 32 20              ldsp16	r2, [sp+0x20]
 f0 33 22              ldsp16	r3, [sp+0x22]
 fc 22                 cmov.ult	r4, r2
 fc 2b                 cmov.ult	r5, r3
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 fc 06                 cmov.ult	r0, r6
 fc 0f                 cmov.ult	r1, r7
 f0 38 06              stsp16	[sp+0x6], r0
 f0 39 08              stsp16	[sp+0x8], r1
 f2 6a                 mov32	q3, q0
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x259
<L20>:
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f0 33 0c              ldsp16	r3, [sp+0xc]
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 69 80              cmp32	q2, q0
 d1 04                 brne8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x37c
<L21>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 f7 6a                 add32	q2, q2
 f7 6a                 add32	q2, q2
 f7 6a                 add32	q2, q2
 f7 6b                 add32	q2, q3
 f2 6b                 mov32	q3, q1
 f7 6e                 add32	q3, q2
 c4 fa ff              ldi16	r4, 0xfffa
 c5 ff ff              ldi16	r5, 0xffff
 f2 67                 mov32	q1, q3
 f7 6b                 add32	q2, q3
 f0 63 c8              ldp24	q3, [q2]
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 8c              cmp32	q2, q3
 d2 04                 brult8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x37c
<L22>:
 c4 f7 ff              ldi16	r4, 0xfff7
 c5 ff ff              ldi16	r5, 0xffff
 f7 66                 add32	q1, q2
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 63 88              ldp24	q2, [q2]
 f0 36 4c              ldsp16	r6, [sp+0x4c]
 f0 37 4e              ldsp16	r7, [sp+0x4e]
 f7 6e                 add32	q3, q2
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 3f 26              stsp16	[sp+0x26], r7
 f0 32 50              ldsp16	r2, [sp+0x50]
 f0 33 52              ldsp16	r3, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f0 14 30              leasp	r4, 0x30
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 26              leasp	r4, 0x26
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x375
<L23>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 36 2e              ldsp16	r6, [sp+0x2e]
 f0 37 30              ldsp16	r7, [sp+0x30]
 f0 69 c0              cmp32	q3, q0
 d1 04                 brne8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x375
<L24>:
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 f7 76                 sub32	q1, q2
 f0 69 c4              cmp32	q3, q1
 d2 04                 brult8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x375
<L25>:
 f7 6e                 add32	q3, q2
 f0 60 cc              ldp8u	r6, [q3]
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x375
<L26>:
 c6 ff ff              ldi16	r6, 0xffff
 c3 ff                 ldi8	r7, 0xff
 82                    and	r4, r6
 87                    and	r5, r7
 f2 62                 mov32	q0, q2
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f7 40                 st16	[r4+], r0
 f3 01                 st8	[r4], r1
 f4 10                 ldsp16	r4, [sp+0x4]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L27>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 c2 0c                 ldi8	r6, 0xc
 af                    xor	r7, r7
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f2 63                 mov32	q0, q3
 f7 72                 sub32	q0, q2
 f7 80                 lsr32.1	q0
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 e3 00 00 00           callf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f7 6b                 add32	q2, q3
 f0 63 88              ldp24	q2, [q2]
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f2 68                 mov32	q2, q0
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 32 20              ldsp16	r2, [sp+0x20]
 f0 33 22              ldsp16	r3, [sp+0x22]
 f0 69 c4              cmp32	q3, q1
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 fc 26                 cmov.ult	r4, r6
 fc 2f                 cmov.ult	r5, r7
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 fc 30                 cmov.ult	r6, r0
 fc 39                 cmov.ult	r7, r1
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x396
<L28>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d1 04                 brne8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L29>:
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
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 c4 f7 ff              ldi16	r4, 0xfff7
 c5 ff ff              ldi16	r5, 0xffff
 f7 69                 add32	q2, q1
 f0 63 88              ldp24	q2, [q2]
 c6 fa ff              ldi16	r6, 0xfffa
 c7 ff ff              ldi16	r7, 0xffff
 f7 6d                 add32	q3, q1
 f0 62 cc              ldp16	r6, [q3]
 f4 52                 stsp16	[sp+0x4], r6
 f0 04 fc ff           ldi16	r0, 0xfffc
 f0 05 ff ff           ldi16	r1, 0xffff
 f2 6b                 mov32	q3, q1
 f7 6c                 add32	q3, q0
 f0 63 cc              ldp24	q3, [q3]
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f0 36 44              ldsp16	r6, [sp+0x44]
 f0 37 46              ldsp16	r7, [sp+0x46]
 f7 6e                 add32	q3, q2
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 66                 add32	q1, q2
 f0 60 a4              ldp8u	r5, [q1]
 f4 a5                 tst8	r5
 f8 0c                 cset.ne	r4
 f0 30 48              ldsp16	r0, [sp+0x48]
 f0 31 4a              ldsp16	r1, [sp+0x4a]
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 f0 69 c0              cmp32	q3, q0
 d2 04                 brult8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x727
<L30>:
 f0 34 56              ldsp16	r4, [sp+0x56]
 f0 3c 32              stsp16	[sp+0x32], r4
 f2 39                 sub	r1, r1
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 39 36              stsp16	[sp+0x36], r1
 f4 a5                 tst8	r5
 f8 0c                 cset.ne	r4
 f0 3c 2c              stsp16	[sp+0x2c], r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 c0 40                 ldi8	r4, 0x40
 a5                    xor	r5, r5
 f0 30 20              ldsp16	r0, [sp+0x20]
 f0 31 22              ldsp16	r1, [sp+0x22]
 f0 69 08              cmp32	q0, q2
 d1 04                 brne8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L31>:
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 3a 2e              stsp16	[sp+0x2e], r2
 f0 3b 30              stsp16	[sp+0x30], r3
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f7 68                 add32	q2, q0
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 f0 3a 5a              stsp16	[sp+0x5a], r2
 f0 3b 5c              stsp16	[sp+0x5c], r3
 f0 61 8c              ldp8s	r4, [q3]
 f4 78                 stsp16	[sp+0xe], r4
 f4 a4                 tst8	r4
 d9 04                 brsge8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x5c3
<L32>:
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 69 84              cmp32	q2, q1
 d1 04                 brne8	0x4 <L33>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L33>:
 f4 3a                 ldsp16	r6, [sp+0xe]
 f1 76                 zext8	r6
 c0 0f                 ldi8	r4, 0xf
 82                    and	r4, r6
 f4 ac                 inc16	r4
 a5                    xor	r5, r5
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 3d 30              stsp16	[sp+0x30], r5
 fa 94                 lsr16i	r6, 0x4
 f1 06                 mov	r0, r6
 f2 39                 sub	r1, r1
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f7 63                 add32	q0, q3
 c4 fc ff              ldi16	r4, 0xfffc
 c5 ff ff              ldi16	r5, 0xffff
 f7 62                 add32	q0, q2
 f0 38 0e              stsp16	[sp+0xe], r0
 f0 39 10              stsp16	[sp+0x10], r1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 6a                 stsp16	[sp+0xa], r6
 f4 71                 stsp16	[sp+0xc], r5
 aa                    xor	r6, r6
 c7 00 ff              ldi16	r7, 0xff00
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f7 6e                 add32	q3, q2
 f0 00 01              ldi8	r0, 0x1
 f0 05 00 ff           ldi16	r1, 0xff00
 f0 69 c0              cmp32	q3, q0
 c0 01                 ldi8	r4, 0x1
 f0 3c 12              stsp16	[sp+0x12], r4
 d8 04                 bruge8	0x4 <L34>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L34>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 01 ff              ldi8	r1, 0xff
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f7 73                 sub32	q0, q3
 f0 32 2e              ldsp16	r2, [sp+0x2e]
 f0 33 30              ldsp16	r3, [sp+0x30]
 f2 6b                 mov32	q3, q1
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 6e                 add32	q3, q2
 f0 69 c0              cmp32	q3, q0
 d2 04                 brult8	0x4 <L35>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L35>:
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f7 69                 add32	q2, q1
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 37 26              ldsp16	r7, [sp+0x26]
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 69 08              cmp32	q0, q2
 d8 04                 bruge8	0x4 <L36>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x739
<L36>:
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 f7 68                 add32	q2, q0
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 f0 69 c8              cmp32	q3, q2
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 50                 stsp16	[sp+0x4], r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 3c 2c              stsp16	[sp+0x2c], r4
 d8 04                 bruge8	0x4 <L37>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x498
<L37>:
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_trap_lookup+0x739
 f4 38                 ldsp16	r4, [sp+0xe]
 cc 80                 cmpi.s8	r4, -0x80
 d0 04                 breq8	0x4 <L38>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x657
<L38>:
 d6 fe                 adjsp	-0x2
 f0 14 30              leasp	r4, 0x30
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 26              leasp	r4, 0x26
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 e3 00 00 00           callf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L39>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L39>:
 d6 fe                 adjsp	-0x2
 f0 14 5c              leasp	r4, 0x5c
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 26              leasp	r4, 0x26
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 e3 00 00 00           callf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L40>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L40>:
 f0 30 5a              ldsp16	r0, [sp+0x5a]
 f0 31 5c              ldsp16	r1, [sp+0x5c]
 f0 34 34              ldsp16	r4, [sp+0x34]
 f0 35 36              ldsp16	r5, [sp+0x36]
 f1 28                 mov	r6, r0
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 f0 69 08              cmp32	q0, q2
 d2 04                 brult8	0x4 <L41>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L41>:
 d6 fe                 adjsp	-0x2
 f0 14 2a              leasp	r4, 0x2a
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 26              leasp	r4, 0x26
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 e3 00 00 00           callf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L42>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L42>:
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_trap_lookup+0x523
 c2 ff                 ldi8	r6, 0xff
 f4 38                 ldsp16	r4, [sp+0xe]
 a5                    xor	r5, r5
 82                    and	r4, r6
 f4 3a                 ldsp16	r6, [sp+0xe]
 ce 93                 cmpi.s8	r6, -0x6d
 d8 04                 bruge8	0x4 <L43>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x68e
<L43>:
 c6 6e ff              ldi16	r6, 0xff6e
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 3d 30              stsp16	[sp+0x30], r5
 a0                    xor	r4, r4
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 6a                 stsp16	[sp+0xa], r6
 f4 71                 stsp16	[sp+0xc], r5
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_trap_lookup+0x543
 c6 82 ff              ldi16	r6, 0xff82
 f4 3b                 ldsp16	r7, [sp+0xe]
 3b                    cmp	r6, r7
 d8 04                 bruge8	0x4 <L44>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x6c8
<L44>:
 d6 fe                 adjsp	-0x2
 f0 14 30              leasp	r4, 0x30
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 26              leasp	r4, 0x26
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 e3 00 00 00           callf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L45>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L45>:
 f4 38                 ldsp16	r4, [sp+0xe]
 cc 82                 cmpi.s8	r4, -0x7e
 d1 04                 brne8	0x4 <L46>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x675
<L46>:
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_trap_lookup+0x6d6
 c6 7e ff              ldi16	r6, 0xff7e
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 3d 30              stsp16	[sp+0x30], r5
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 69 84              cmp32	q2, q1
 d1 04                 brne8	0x4 <L47>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L47>:
 d6 fe                 adjsp	-0x2
 f0 14 5c              leasp	r4, 0x5c
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 26              leasp	r4, 0x26
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 e3 00 00 00           callf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L48>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L48>:
 f0 30 5a              ldsp16	r0, [sp+0x5a]
 f0 31 5c              ldsp16	r1, [sp+0x5c]
 f1 28                 mov	r6, r0
 c0 01                 ldi8	r4, 0x1
 88                    and	r6, r4
 f6 4e                 neg16	r6
 0e                    mov	r7, r6
 fa ef                 asr16i	r7, 0xf
 f7 80                 lsr32.1	q0
 f9 1a                 xor	r0, r6
 f9 3e                 xor	r1, r7
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f7 63                 add32	q0, q3
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_trap_lookup+0x517
 f0 35 56              ldsp16	r5, [sp+0x56]
 f0 3d 32              stsp16	[sp+0x32], r5
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L49>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L49>:
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_trap_lookup+0x748
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 f4 a4                 tst8	r4
 f8 0c                 cset.ne	r4
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L50>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L50>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 35 32              ldsp16	r5, [sp+0x32]
 31                    cmp	r4, r5
 d2 04                 brult8	0x4 <L51>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L51>:
 f4 10                 ldsp16	r4, [sp+0x4]
 a5                    xor	r5, r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6f                 add32	q3, q3
 f7 6e                 add32	q3, q2
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 f0 35 3e              ldsp16	r5, [sp+0x3e]
 f7 6b                 add32	q2, q3
 f0 63 88              ldp24	q2, [q2]
 f0 36 4c              ldsp16	r6, [sp+0x4c]
 f0 37 4e              ldsp16	r7, [sp+0x4e]
 f7 6e                 add32	q3, q2
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 3f 26              stsp16	[sp+0x26], r7
 f0 30 50              ldsp16	r0, [sp+0x50]
 f0 31 52              ldsp16	r1, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f0 14 30              leasp	r4, 0x30
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 26              leasp	r4, 0x26
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L52>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x7c7
<L52>:
 f0 36 2e              ldsp16	r6, [sp+0x2e]
 f0 37 30              ldsp16	r7, [sp+0x30]
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L53>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x7c7
<L53>:
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 f7 72                 sub32	q0, q2
 f0 69 c0              cmp32	q3, q0
 d2 04                 brult8	0x4 <L54>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x7c7
<L54>:
 f7 6e                 add32	q3, q2
 f0 60 cc              ldp8u	r6, [q3]
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L55>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0x7d5
<L55>:
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 c8 03                 addi.s8	r4, 0x3
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 ca 03                 addi.s8	r6, 0x3
 f7 54                 st16	[r6+], r4
 59                    st8	[r6], r5
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d1 04                 brne8	0x4 <L56>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_trap_lookup
		R_AVM_FAR24	.text.__avm_trap_lookup+0xd9
<L56>:
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 c8 06                 addi.s8	r4, 0x6
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
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
 f4 60                 stsp16	[sp+0x8], r4
 f0 34 19              ldsp16	r4, [sp+0x19]
 f0 32 15              ldsp16	r2, [sp+0x15]
 f0 33 17              ldsp16	r3, [sp+0x17]
 cd 04                 cmpi.s8	r5, 0x4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	open_section
		R_AVM_FAR24	.text.open_section+0x34
<L0>:
 cd 03                 cmpi.s8	r5, 0x3
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	open_section
		R_AVM_FAR24	.text.open_section+0x47
<L1>:
 f0 00 03              ldi8	r0, 0x3
 f2 39                 sub	r1, r1
 f0 69 40              cmp32	q1, q0
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	open_section
		R_AVM_FAR24	.text.open_section+0x8d
<L2>:
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	open_section
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.open_section+0xb7
 f7 67                 add32	q1, q3
 f4 20                 ldsp16	r4, [sp+0x8]
 04                    mov	r5, r4
 c9 18                 addi.s8	r5, 0x18
 f0 6b 4a              st32	[r5], q1
 c8 14                 addi.s8	r4, 0x14
 f0 6b c8              st32	[r4], q3
 e2 00 00 00           jmpf	open_section
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.open_section+0xb5
 a0                    xor	r4, r4
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	open_section
		R_AVM_FAR24	.text.open_section+0xb7
<L3>:
 f0 62 8c              ldp16	r4, [q3]
 f4 58                 stsp16	[sp+0x6], r4
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	open_section
		R_AVM_FAR24	.text.open_section+0xbe
<L4>:
 cd 01                 cmpi.s8	r5, 0x1
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	open_section
		R_AVM_FAR24	.text.open_section+0xec
<L5>:
 f2 68                 mov32	q2, q0
 f7 6a                 add32	q2, q2
 f7 68                 add32	q2, q0
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 68                 add32	q2, q0
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 69 48              cmp32	q1, q2
 a0                    xor	r4, r4
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	open_section
		R_AVM_FAR24	.text.open_section+0xb7
<L6>:
 e2 00 00 00           jmpf	open_section
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.open_section+0x11c
 f4 58                 stsp16	[sp+0x6], r4
 f0 63 8c              ldp24	q2, [q3]
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 3b 04              stsp16	[sp+0x4], r3
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 6b 84              st32	[r2], q2
 f7 63                 add32	q0, q3
 f4 20                 ldsp16	r4, [sp+0x8]
 04                    mov	r5, r4
 c9 0c                 addi.s8	r5, 0xc
 f0 6b 0a              st32	[r5], q0
 f0 30 02              ldsp16	r0, [sp+0x2]
 f0 31 04              ldsp16	r1, [sp+0x4]
 f7 63                 add32	q0, q3
 c8 10                 addi.s8	r4, 0x10
 f0 6b 08              st32	[r4], q0
 c0 01                 ldi8	r4, 0x1
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f2 68                 mov32	q2, q0
 f7 6a                 add32	q2, q2
 f7 6a                 add32	q2, q2
 f7 6a                 add32	q2, q2
 f7 68                 add32	q2, q0
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 68                 add32	q2, q0
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 69 48              cmp32	q1, q2
 a0                    xor	r4, r4
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	open_section
		R_AVM_FAR24	.text.open_section+0xb7
<L7>:
 f4 20                 ldsp16	r4, [sp+0x8]
 ee 18 3c              st16	[r4+28], r0
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 e2 00 00 00           jmpf	open_section
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.open_section+0x40
 f4 41                 stsp16	[sp+0x0], r5
 c1 0c                 ldi8	r5, 0xc
 f1 20                 mov	r4, r0
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 e3 00 00 00           callf	open_section
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_umulhisi3
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f0 00 02              ldi8	r0, 0x2
 f9 11                 or	r0, r4
 f1 20                 mov	r4, r0
 f0 69 48              cmp32	q1, q2
 a0                    xor	r4, r4
 f0 30 06              ldsp16	r0, [sp+0x6]
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	open_section
		R_AVM_FAR24	.text.open_section+0xb7
<L8>:
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 01                 cmpi.s8	r4, 0x1
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	open_section
		R_AVM_FAR24	.text.open_section+0x12e
<L9>:
 f4 20                 ldsp16	r4, [sp+0x8]
 ee 18 3e              st16	[r4+30], r0
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 c8 04                 addi.s8	r4, 0x4
 e2 00 00 00           jmpf	open_section
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.open_section+0x40
 f4 20                 ldsp16	r4, [sp+0x8]
 ee 18 40              st16	[r4+32], r0
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 c8 08                 addi.s8	r4, 0x8
 e2 00 00 00           jmpf	open_section
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.open_section+0x40

Disassembly of section .text.read_uleb128:

<read_uleb128>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f0 32 1b              ldsp16	r2, [sp+0x1b]
 f0 6a 0a              ld32	q0, [r5]
 f0 69 0c              cmp32	q0, q3
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	read_uleb128
		R_AVM_FAR24	.text.read_uleb128+0xa1
<L0>:
 f0 3a 06              stsp16	[sp+0x6], r2
 f4 61                 stsp16	[sp+0x8], r5
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f7 64                 add32	q1, q0
 f0 61 a0              ldp8s	r5, [q0]
 f4 69                 stsp16	[sp+0xa], r5
 c0 7f                 ldi8	r4, 0x7f
 84                    and	r5, r4
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 a4                 tst8	r4
 d9 04                 brsge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	read_uleb128
		R_AVM_FAR24	.text.read_uleb128+0x4f
<L1>:
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 1a                 ldsp16	r6, [sp+0x6]
 f0 6b 4a              st32	[r5], q1
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 6b 8c              st32	[r6], q2
 c0 01                 ldi8	r4, 0x1
 e2 00 00 00           jmpf	read_uleb128
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.read_uleb128+0xa1
 f0 69 4c              cmp32	q1, q3
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	read_uleb128
		R_AVM_FAR24	.text.read_uleb128+0xa0
<L2>:
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f0 61 84              ldp8s	r4, [q1]
 f4 68                 stsp16	[sp+0xa], r4
 fa 37                 lsl16i	r4, 0x7
 f4 40                 stsp16	[sp+0x0], r4
 c4 80 3f              ldi16	r4, 0x3f80
 f4 01                 ldsp16	r5, [sp+0x0]
 81                    and	r4, r5
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f9 51                 or	r2, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 f2 4b                 sub	r3, r3
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f4 a4                 tst8	r4
 d9 04                 brsge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	read_uleb128
		R_AVM_FAR24	.text.read_uleb128+0xa8
<L3>:
 a0                    xor	r4, r4
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 1a                 ldsp16	r6, [sp+0x6]
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f6 2f                 tst16	r7
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	read_uleb128
		R_AVM_FAR24	.text.read_uleb128+0x3f
<L4>:
 e2 00 00 00           jmpf	read_uleb128
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.read_uleb128+0xa1
 a0                    xor	r4, r4
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
 f0 69 4c              cmp32	q1, q3
 a0                    xor	r4, r4
 d2 04                 brult8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	read_uleb128
		R_AVM_FAR24	.text.read_uleb128+0xa1
<L5>:
 f0 60 84              ldp8u	r4, [q1]
 f4 68                 stsp16	[sp+0xa], r4
 fa 3e                 lsl16i	r4, 0xe
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f9 89                 or	r4, r2
 f4 70                 stsp16	[sp+0xc], r4
 c1 7f                 ldi8	r5, 0x7f
 f4 28                 ldsp16	r4, [sp+0xa]
 84                    and	r5, r4
 fa 82                 lsr16i	r5, 0x2
 f1 1d                 mov	r3, r5
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 3b 0e              stsp16	[sp+0xe], r3
 f0 02 03              ldi8	r2, 0x3
 f2 4b                 sub	r3, r3
 f7 64                 add32	q1, q0
 f4 a5                 tst8	r5
 d9 04                 brsge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	read_uleb128
		R_AVM_FAR24	.text.read_uleb128+0xf0
<L6>:
 f6 45                 sext8	r5
 f4 69                 stsp16	[sp+0xa], r5
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 1a                 ldsp16	r6, [sp+0x6]
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	read_uleb128
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.read_uleb128+0x92
 f0 69 4c              cmp32	q1, q3
 f4 21                 ldsp16	r5, [sp+0x8]
 d2 04                 brult8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	read_uleb128
		R_AVM_FAR24	.text.read_uleb128+0x12c
<L7>:
 f0 61 c4              ldp8s	r6, [q1]
 f4 a6                 tst8	r6
 a0                    xor	r4, r4
 d9 04                 brsge8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	read_uleb128
		R_AVM_FAR24	.text.read_uleb128+0xa1
<L8>:
 f4 6a                 stsp16	[sp+0xa], r6
 f1 16                 mov	r2, r6
 c2 ff                 ldi8	r6, 0xff
 af                    xor	r7, r7
 f9 c8                 and	r6, r2
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 c2 04                 ldi8	r6, 0x4
 f7 63                 add32	q0, q3
 f4 0a                 ldsp16	r6, [sp+0x2]
 fa 55                 lsl16i	r6, 0x5
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f9 79                 or	r3, r6
 f0 3b 0e              stsp16	[sp+0xe], r3
 f2 64                 mov32	q1, q0
 f4 1a                 ldsp16	r6, [sp+0x6]
 e2 00 00 00           jmpf	read_uleb128
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.read_uleb128+0x92
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	read_uleb128
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.read_uleb128+0xa1
