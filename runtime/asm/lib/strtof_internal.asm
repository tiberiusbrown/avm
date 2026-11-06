
strtof_internal.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 strtof_internal.c
00000000 l    d  .text.__avm_hex_value	00000000 .text.__avm_hex_value
00000000 l    d  .text.__avm_decimal_value	00000000 .text.__avm_decimal_value
00000000 l     O .rodata.__avm_decimal_value.powers	00000018 __avm_decimal_value.powers
00000000 l    d  .rodata.__avm_decimal_value.powers	00000000 .rodata.__avm_decimal_value.powers
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.__avm_hex_value	00000287 __avm_hex_value
00000000         *UND*	00000000 __avm_ashlsi3
00000000         *UND*	00000000 __avm_lshrsi3
00000000 g     F .text.__avm_decimal_value	000000fb __avm_decimal_value

Disassembly of section .text.__avm_hex_value:

<__avm_hex_value>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 08                    mov	r6, r4
 0d                    mov	r7, r5
 c4 ff ff              ldi16	r4, 0xffff
 a5                    xor	r5, r5
 f2 42                 sub	r2, r2
 f0 00 10              ldi8	r0, 0x10
 f0 69 8c              cmp32	q2, q3
 fc 10                 cmov.ult	r2, r0
 f2 39                 sub	r1, r1
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 fc 37                 cmov.ult	r6, r7
 fc 39                 cmov.ult	r7, r1
 f0 34 19              ldsp16	r4, [sp+0x19]
 f4 50                 stsp16	[sp+0x4], r4
 f0 04 00 01           ldi16	r0, 0x100
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_hex_value
		R_AVM_FAR24	.text.__avm_hex_value+0x4a
<L0>:
 c0 08                 ldi8	r4, 0x8
 f9 51                 or	r2, r4
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 09                    mov	r6, r5
 0c                    mov	r7, r4
 c0 10                 ldi8	r4, 0x10
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_hex_value
		R_AVM_FAR24	.text.__avm_hex_value+0x69
<L1>:
 02                    mov	r4, r6
 fa 74                 lsr16i	r4, 0x4
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 4c                 lsl16i	r5, 0xc
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 74                 lsr16i	r4, 0x4
 09                    mov	r6, r5
 0c                    mov	r7, r4
 f0 0a 04              addi.s8	r2, 0x4
 c0 04                 ldi8	r4, 0x4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_hex_value
		R_AVM_FAR24	.text.__avm_hex_value+0x88
<L2>:
 02                    mov	r4, r6
 fa 72                 lsr16i	r4, 0x2
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 4e                 lsl16i	r5, 0xe
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 72                 lsr16i	r4, 0x2
 09                    mov	r6, r5
 0c                    mov	r7, r4
 f0 0a 02              addi.s8	r2, 0x2
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f0 69 8c              cmp32	q2, q3
 f8 10                 cset.ult	r0
 f2 02                 add	r0, r2
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f7 6e                 add32	q3, q2
 c0 7f                 ldi8	r4, 0x7f
 a5                    xor	r5, r5
 f0 69 8c              cmp32	q2, q3
 d3 04                 brslt8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_hex_value
		R_AVM_FAR24	.text.__avm_hex_value+0xaf
<L3>:
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 e2 00 00 00           jmpf	__avm_hex_value
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_hex_value+0x1fc
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 06 6a ff           ldi16	r2, 0xff6a
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 69 c4              cmp32	q3, q1
 d9 04                 brsge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_hex_value
		R_AVM_FAR24	.text.__avm_hex_value+0x1fc
<L4>:
 f0 06 81 ff           ldi16	r2, 0xff81
 f0 07 ff ff           ldi16	r3, 0xffff
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 4c              cmp32	q1, q3
 d9 04                 brsge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_hex_value
		R_AVM_FAR24	.text.__avm_hex_value+0x117
<L5>:
 f0 06 6b ff           ldi16	r2, 0xff6b
 f4 2a                 ldsp16	r6, [sp+0xa]
 f2 46                 sub	r2, r6
 f0 0e 01              cmpi.s8	r2, 0x1
 d9 04                 brsge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_hex_value
		R_AVM_FAR24	.text.__avm_hex_value+0x19e
<L6>:
 f0 0e 21              cmpi.s8	r2, 0x21
 d2 04                 brult8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_hex_value
		R_AVM_FAR24	.text.__avm_hex_value+0x1fc
<L7>:
 c4 4b ff              ldi16	r4, 0xff4b
 38                    cmp	r6, r4
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_hex_value
		R_AVM_FAR24	.text.__avm_hex_value+0x203
<L8>:
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f0 69 8c              cmp32	q2, q3
 d2 04                 brult8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_hex_value
		R_AVM_FAR24	.text.__avm_hex_value+0x24e
<L9>:
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	__avm_hex_value
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_hex_value+0x1fc
 f0 0c 18              cmpi.s8	r0, 0x18
 d2 04                 brult8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_hex_value
		R_AVM_FAR24	.text.__avm_hex_value+0x14e
<L10>:
 f0 01 17              ldi8	r1, 0x17
 f2 38                 sub	r1, r0
 c2 0f                 ldi8	r6, 0xf
 f1 21                 mov	r4, r1
 82                    and	r4, r6
 f4 68                 stsp16	[sp+0xa], r4
 a8                    xor	r6, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 0c                    mov	r7, r4
 f4 8f                 lsr16.1	r7
 fa 1e                 lsr16v	r7, r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 fa 06                 shl16v	r5, r6
 97                    or	r5, r7
 c2 10                 ldi8	r6, 0x10
 f9 38                 and	r1, r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 fa 02                 shl16v	r4, r6
 f4 a1                 tst8	r1
 fb 6c                 cmov.ne	r5, r4
 aa                    xor	r6, r6
 fb 66                 cmov.ne	r4, r6
 e2 00 00 00           jmpf	__avm_hex_value
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_hex_value+0x1cf
 f1 20                 mov	r4, r0
 c8 e8                 addi.s8	r4, -0x18
 f1 14                 mov	r2, r4
 f2 4b                 sub	r3, r3
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	__avm_hex_value
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	__avm_hex_value
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f7 66                 add32	q1, q2
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 f0 08 e9              addi.s8	r0, -0x17
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 e3 00 00 00           callf	__avm_hex_value
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_lshrsi3
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 f0 69 c4              cmp32	q3, q1
 d2 04                 brult8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_hex_value
		R_AVM_FAR24	.text.__avm_hex_value+0x1ae
<L11>:
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 e2 00 00 00           jmpf	__avm_hex_value
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_hex_value+0x1cf
 c0 95                 ldi8	r4, 0x95
 18                    add	r6, r4
 af                    xor	r7, r7
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 e3 00 00 00           callf	__avm_hex_value
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 e2 00 00 00           jmpf	__avm_hex_value
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_hex_value+0x1fc
 f0 69 4c              cmp32	q1, q3
 d0 04                 breq8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_hex_value
		R_AVM_FAR24	.text.__avm_hex_value+0x1cf
<L12>:
 f4 12                 ldsp16	r6, [sp+0x4]
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_hex_value
		R_AVM_FAR24	.text.__avm_hex_value+0x195
<L13>:
 08                    mov	r6, r4
 f0 00 01              ldi8	r0, 0x1
 f9 c0                 and	r6, r0
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_hex_value
		R_AVM_FAR24	.text.__avm_hex_value+0x195
<L14>:
 aa                    xor	r6, r6
 c7 00 01              ldi16	r7, 0x100
 f0 69 8c              cmp32	q2, q3
 f8 06                 cset.eq	r6
 f1 06                 mov	r0, r6
 f2 39                 sub	r1, r1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f7 6c                 add32	q3, q0
 f0 00 7f              ldi8	r0, 0x7f
 f0 69 0c              cmp32	q0, q3
 d9 04                 brsge8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_hex_value
		R_AVM_FAR24	.text.__avm_hex_value+0xa7
<L15>:
 c3 7f                 ldi8	r7, 0x7f
 8d                    and	r7, r5
 fa 57                 lsl16i	r6, 0x7
 9b                    or	r6, r7
 0e                    mov	r7, r6
 08                    mov	r6, r4
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f7 6b                 add32	q2, q3
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c4 6a ff              ldi16	r4, 0xff6a
 22                    sub	r4, r6
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	__avm_hex_value
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	__avm_hex_value
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f7 62                 add32	q0, q2
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f1 2a                 mov	r6, r2
 af                    xor	r7, r7
 e3 00 00 00           callf	__avm_hex_value
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_lshrsi3
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 f0 69 c0              cmp32	q3, q0
 d2 04                 brult8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_hex_value
		R_AVM_FAR24	.text.__avm_hex_value+0x25f
<L16>:
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 e2 00 00 00           jmpf	__avm_hex_value
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_hex_value+0x1fa
 f0 69 c8              cmp32	q3, q2
 f8 05                 cset.eq	r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 81                    and	r4, r5
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	__avm_hex_value
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_hex_value+0x1fc
 f0 69 0c              cmp32	q0, q3
 d0 04                 breq8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_hex_value
		R_AVM_FAR24	.text.__avm_hex_value+0x1fc
<L17>:
 f4 12                 ldsp16	r6, [sp+0x4]
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_hex_value
		R_AVM_FAR24	.text.__avm_hex_value+0x247
<L18>:
 08                    mov	r6, r4
 f0 00 01              ldi8	r0, 0x1
 f9 c0                 and	r6, r0
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_hex_value
		R_AVM_FAR24	.text.__avm_hex_value+0x1fc
<L19>:
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 e2 00 00 00           jmpf	__avm_hex_value
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_hex_value+0x1fa

Disassembly of section .text.__avm_decimal_value:

<__avm_decimal_value>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 34 17              ldsp16	r4, [sp+0x17]
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 f7 6b                 add32	q2, q3
 f0 32 19              ldsp16	r2, [sp+0x19]
 f0 00 27              ldi8	r0, 0x27
 f2 39                 sub	r1, r1
 f0 69 08              cmp32	q0, q2
 d9 04                 brsge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_decimal_value
		R_AVM_FAR24	.text.__avm_decimal_value+0x34
<L0>:
 f6 2a                 tst16	r2
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_decimal_value
		R_AVM_FAR24	.text.__avm_decimal_value+0x43
<L1>:
 f0 69 80              cmp32	q2, q0
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_decimal_value
		R_AVM_FAR24	.text.__avm_decimal_value+0x43
<L2>:
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f2 69                 mov32	q2, q1
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 c4 ca ff              ldi16	r4, 0xffca
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 c8              cmp32	q3, q2
 d9 04                 brsge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_decimal_value
		R_AVM_FAR24	.text.__avm_decimal_value+0x3a
<L3>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 11                 u32tof
 f2 63                 mov32	q0, q3
 f2 66                 mov32	q1, q2
 af                    xor	r7, r7
 f2 5c                 sub	r7, r0
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 fd 37                 cmov.slt	r6, r7
 f4 52                 stsp16	[sp+0x4], r6
 c2 05                 ldi8	r6, 0x5
 f1 21                 mov	r4, r1
 af                    xor	r7, r7
 fa 7f                 lsr16i	r4, 0xf
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	.rodata.__avm_decimal_value.powers
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	.rodata.__avm_decimal_value.powers
 e2 00 00 00           jmpf	__avm_decimal_value
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_decimal_value+0xa7
 f4 1b                 ldsp16	r7, [sp+0x6]
 0b                    mov	r6, r7
 fa 9e                 lsr16i	r6, 0xe
 1f                    add	r7, r7
 1f                    add	r7, r7
 ab                    xor	r6, r7
 ae                    xor	r7, r6
 ab                    xor	r6, r7
 f7 6c                 add32	q3, q0
 f0 64 cc              ldp32	q3, [q3]
 f2 69                 mov32	q2, q1
 ff 03                 fdiv
 f2 66                 mov32	q1, q2
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 b6                 dec16	r6
 f4 1b                 ldsp16	r7, [sp+0x6]
 f4 af                 inc16	r7
 cf 06                 cmpi.s8	r7, 0x6
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_decimal_value
		R_AVM_FAR24	.text.__avm_decimal_value+0xe3
<L4>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 a4                 tst8	r4
 f4 62                 stsp16	[sp+0x8], r6
 f4 5b                 stsp16	[sp+0x6], r7
 fb 77                 cmov.ne	r6, r7
 f4 13                 ldsp16	r7, [sp+0x4]
 fa 1e                 lsr16v	r7, r6
 c2 01                 ldi8	r6, 0x1
 8b                    and	r6, r7
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_decimal_value
		R_AVM_FAR24	.text.__avm_decimal_value+0x97
<L5>:
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_decimal_value
		R_AVM_FAR24	.text.__avm_decimal_value+0x82
<L6>:
 f4 23                 ldsp16	r7, [sp+0x8]
 0b                    mov	r6, r7
 fa 9e                 lsr16i	r6, 0xe
 1f                    add	r7, r7
 1f                    add	r7, r7
 ab                    xor	r6, r7
 ae                    xor	r7, r6
 ab                    xor	r6, r7
 f7 6c                 add32	q3, q0
 f0 64 cc              ldp32	q3, [q3]
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 f4 22                 ldsp16	r6, [sp+0x8]
 f2 66                 mov32	q1, q2
 e2 00 00 00           jmpf	__avm_decimal_value
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_decimal_value+0x99
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 7f 7f           ldi16	r1, 0x7f7f
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 fb 10                 cmov.eq	r2, r0
 fb 19                 cmov.eq	r3, r1
 e2 00 00 00           jmpf	__avm_decimal_value
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_decimal_value+0x3a
