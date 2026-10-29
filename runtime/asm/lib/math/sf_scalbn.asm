
math_sf_scalbn.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 sf_scalbn.c
00000000 l    d  .text.scalblnf	00000000 .text.scalblnf
00000000 l    d  .text.scalbnf	00000000 .text.scalbnf
00000000 g     F .text.scalblnf	00000184 scalblnf
00000000         *UND*	00000000 __avm_errno
00000000 g     F .text.scalbnf	00000107 scalbnf

Disassembly of section .text.scalblnf:

<scalblnf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f2 67                 mov32	q1, q3
 f0 04 14 01           ldi16	r0, 0x114
 f2 39                 sub	r1, r1
 f0 69 04              cmp32	q0, q1
 d3 04                 brslt8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalblnf
		R_AVM_FAR24	.text.scalblnf+0x2e
<L0>:
 f0 06 15 01           ldi16	r2, 0x115
 f1 05                 mov	r0, r5
 f4 80                 lsl16.1	r0
 0c                    mov	r7, r4
 f9 e1                 or	r7, r0
 f6 2f                 tst16	r7
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalblnf
		R_AVM_FAR24	.text.scalblnf+0x4d
<L1>:
 e2 00 00 00           jmpf	scalblnf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.scalblnf+0x11b
 f0 04 eb fe           ldi16	r0, 0xfeeb
 f0 05 ff ff           ldi16	r1, 0xffff
 c6 ea fe              ldi16	r6, 0xfeea
 f0 69 40              cmp32	q1, q0
 fd 16                 cmov.slt	r2, r6
 f1 05                 mov	r0, r5
 f4 80                 lsl16.1	r0
 0c                    mov	r7, r4
 f9 e1                 or	r7, r0
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalblnf
		R_AVM_FAR24	.text.scalblnf+0x11b
<L2>:
 f2 62                 mov32	q0, q2
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f1 29                 mov	r6, r1
 fa 97                 lsr16i	r6, 0x7
 f1 76                 zext8	r6
 f0 03 ff              ldi8	r3, 0xff
 f4 42                 stsp16	[sp+0x0], r6
 f4 49                 stsp16	[sp+0x2], r5
 f5 2b                 cmp	r6, r3
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalblnf
		R_AVM_FAR24	.text.scalblnf+0x76
<L3>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 e2 00 00 00           jmpf	scalblnf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.scalblnf+0x11b
 f6 2a                 tst16	r2
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalblnf
		R_AVM_FAR24	.text.scalblnf+0xe3
<L4>:
 c7 15 01              ldi16	r7, 0x115
 f5 17                 cmp	r2, r7
 d3 04                 brslt8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalblnf
		R_AVM_FAR24	.text.scalblnf+0x122
<L5>:
 c7 ea fe              ldi16	r7, 0xfeea
 f5 2e                 cmp	r7, r2
 d3 04                 brslt8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalblnf
		R_AVM_FAR24	.text.scalblnf+0x13e
<L6>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalblnf
		R_AVM_FAR24	.text.scalblnf+0xbc
<L7>:
 f2 30                 sub	r0, r0
 f0 05 00 4c           ldi16	r1, 0x4c00
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f1 21                 mov	r4, r1
 fa 77                 lsr16i	r4, 0x7
 f1 74                 zext8	r4
 c8 e7                 addi.s8	r4, -0x19
 f2 22                 add	r4, r2
 f5 23                 cmp	r4, r3
 d3 04                 brslt8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalblnf
		R_AVM_FAR24	.text.scalblnf+0x151
<L8>:
 cc 01                 cmpi.s8	r4, 0x1
 d9 04                 brsge8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalblnf
		R_AVM_FAR24	.text.scalblnf+0xeb
<L9>:
 c6 7f 80              ldi16	r6, 0x807f
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f9 cc                 and	r6, r3
 fa 37                 lsl16i	r4, 0x7
 92                    or	r4, r6
 04                    mov	r5, r4
 f1 22                 mov	r4, r2
 e2 00 00 00           jmpf	scalblnf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.scalblnf+0x11b
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 e2 00 00 00           jmpf	scalblnf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.scalblnf+0x11b
 cc e9                 cmpi.s8	r4, -0x17
 08                    mov	r6, r4
 d9 04                 brsge8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalblnf
		R_AVM_FAR24	.text.scalblnf+0x166
<L10>:
 c7 7f 80              ldi16	r7, 0x807f
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 8d                    and	r7, r5
 fa 57                 lsl16i	r6, 0x7
 c5 80 0c              ldi16	r5, 0xc80
 16                    add	r5, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 c7 00 33              ldi16	r7, 0x3300
 ff 02                 fmul
 c7 80 7f              ldi16	r7, 0x7f80
 8d                    and	r7, r5
 c6 80 80              ldi16	r6, 0x8080
 1b                    add	r6, r7
 c7 ff 80              ldi16	r7, 0x80ff
 3e                    cmp	r7, r6
 d2 04                 brult8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalblnf
		R_AVM_FAR24	.text.scalblnf+0x17a
<L11>:
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c4 00 80              ldi16	r4, 0x8000
 f4 1b                 ldsp16	r7, [sp+0x6]
 83                    and	r4, r7
 a5                    xor	r5, r5
 c6 80 7f              ldi16	r6, 0x7f80
 c7 80 ff              ldi16	r7, 0xff80
 31                    cmp	r4, r5
 fb 77                 cmov.ne	r6, r7
 c0 22                 ldi8	r4, 0x22
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 06                    mov	r5, r6
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	scalblnf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.scalblnf+0x11b
 c2 22                 ldi8	r6, 0x22
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 f4 19                 ldsp16	r5, [sp+0x6]
 8d                    and	r7, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 e2 00 00 00           jmpf	scalblnf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.scalblnf+0x11b
 c0 22                 ldi8	r4, 0x22
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 c4 00 80              ldi16	r4, 0x8000
 f4 1b                 ldsp16	r7, [sp+0x6]
 83                    and	r4, r7
 c5 80 7f              ldi16	r5, 0x7f80
 94                    or	r5, r4
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	scalblnf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.scalblnf+0x11b
 c2 22                 ldi8	r6, 0x22
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 82                    and	r4, r6
 87                    and	r5, r7
 e2 00 00 00           jmpf	scalblnf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.scalblnf+0x11b
 c2 22                 ldi8	r6, 0x22
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 e2 00 00 00           jmpf	scalblnf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.scalblnf+0x11b

Disassembly of section .text.scalbnf:

<scalbnf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f1 16                 mov	r2, r6
 09                    mov	r6, r5
 1a                    add	r6, r6
 0c                    mov	r7, r4
 9e                    or	r7, r6
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalbnf
		R_AVM_FAR24	.text.scalbnf+0xaa
<L0>:
 09                    mov	r6, r5
 fa 97                 lsr16i	r6, 0x7
 f1 76                 zext8	r6
 f0 03 ff              ldi8	r3, 0xff
 f5 2b                 cmp	r6, r3
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalbnf
		R_AVM_FAR24	.text.scalbnf+0x2a
<L1>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 e2 00 00 00           jmpf	scalbnf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.scalbnf+0xaa
 f6 2a                 tst16	r2
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalbnf
		R_AVM_FAR24	.text.scalbnf+0xaa
<L2>:
 c7 15 01              ldi16	r7, 0x115
 f5 17                 cmp	r2, r7
 d3 04                 brslt8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalbnf
		R_AVM_FAR24	.text.scalbnf+0xaf
<L3>:
 c7 ea fe              ldi16	r7, 0xfeea
 f5 2e                 cmp	r7, r2
 d3 04                 brslt8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalbnf
		R_AVM_FAR24	.text.scalbnf+0xc9
<L4>:
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalbnf
		R_AVM_FAR24	.text.scalbnf+0x61
<L5>:
 f2 30                 sub	r0, r0
 f0 05 00 4c           ldi16	r1, 0x4c00
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 09                    mov	r6, r5
 fa 97                 lsr16i	r6, 0x7
 f1 76                 zext8	r6
 ca e7                 addi.s8	r6, -0x19
 f2 2a                 add	r6, r2
 f5 2b                 cmp	r6, r3
 d3 04                 brslt8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalbnf
		R_AVM_FAR24	.text.scalbnf+0xda
<L6>:
 ce 01                 cmpi.s8	r6, 0x1
 d9 04                 brsge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalbnf
		R_AVM_FAR24	.text.scalbnf+0x7f
<L7>:
 c7 7f 80              ldi16	r7, 0x807f
 8d                    and	r7, r5
 fa 57                 lsl16i	r6, 0x7
 9b                    or	r6, r7
 06                    mov	r5, r6
 e2 00 00 00           jmpf	scalbnf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.scalbnf+0xaa
 ce e9                 cmpi.s8	r6, -0x17
 d9 04                 brsge8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalbnf
		R_AVM_FAR24	.text.scalbnf+0xed
<L8>:
 c7 7f 80              ldi16	r7, 0x807f
 8d                    and	r7, r5
 fa 57                 lsl16i	r6, 0x7
 c5 80 0c              ldi16	r5, 0xc80
 16                    add	r5, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 c7 00 33              ldi16	r7, 0x3300
 ff 02                 fmul
 c7 80 7f              ldi16	r7, 0x7f80
 8d                    and	r7, r5
 c6 80 80              ldi16	r6, 0x8080
 1b                    add	r6, r7
 c7 ff 80              ldi16	r7, 0x80ff
 3e                    cmp	r7, r6
 d2 04                 brult8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	scalbnf
		R_AVM_FAR24	.text.scalbnf+0xfd
<L9>:
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c4 00 80              ldi16	r4, 0x8000
 81                    and	r4, r5
 a5                    xor	r5, r5
 c6 80 7f              ldi16	r6, 0x7f80
 c7 80 ff              ldi16	r7, 0xff80
 31                    cmp	r4, r5
 fb 77                 cmov.ne	r6, r7
 c0 22                 ldi8	r4, 0x22
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 06                    mov	r5, r6
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	scalbnf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.scalbnf+0xaa
 c2 22                 ldi8	r6, 0x22
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 8d                    and	r7, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 e2 00 00 00           jmpf	scalbnf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.scalbnf+0xaa
 c0 22                 ldi8	r4, 0x22
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	__avm_errno
 c4 00 80              ldi16	r4, 0x8000
 81                    and	r4, r5
 c5 80 7f              ldi16	r5, 0x7f80
 94                    or	r5, r4
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	scalbnf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.scalbnf+0xaa
 c2 22                 ldi8	r6, 0x22
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 82                    and	r4, r6
 87                    and	r5, r7
 e2 00 00 00           jmpf	scalbnf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.scalbnf+0xaa
 c2 22                 ldi8	r6, 0x22
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 e2 00 00 00           jmpf	scalbnf
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.scalbnf+0xaa
