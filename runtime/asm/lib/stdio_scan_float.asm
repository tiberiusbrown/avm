
stdio_scan_float.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 stdio_scan_float.c
00000000 l    d  .text.__avm_scan_float	00000000 .text.__avm_scan_float
00000000 l     O .rodata.str1.1	00000028 __avm_scan_float.threshold
00000000 l    d  .rodata.str1.1	00000000 .rodata.str1.1
00000000 g     F .text.__avm_scan_float	00000993 __avm_scan_float
00000000         *UND*	00000000 __avm_scan_peek
00000000         *UND*	00000000 __avm_scan_take
00000000         *UND*	00000000 __avm_mulsi3
00000000         *UND*	00000000 __avm_decimal_value
00000000         *UND*	00000000 __avm_hex_value
00000000  w      *UND*	00000000 __avm_errno
00000000         *UND*	00000000 isalnum

Disassembly of section .text.__avm_scan_float:

<__avm_scan_float>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d0                 adjsp	-0x30
 f1 1e                 mov	r3, r6
 f1 15                 mov	r2, r5
 f0 6a 04              ld32	q0, [r2]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x7e
<L0>:
 f4 68                 stsp16	[sp+0xa], r4
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 cc ff                 cmpi.s8	r4, -0x1
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x756
<L1>:
 cc 2b                 cmpi.s8	r4, 0x2b
 c1 01                 ldi8	r5, 0x1
 f0 3d 14              stsp16	[sp+0x14], r5
 af                    xor	r7, r7
 f0 3a 2c              stsp16	[sp+0x2c], r2
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x43
<L2>:
 cc 2d                 cmpi.s8	r4, 0x2d
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x85
<L3>:
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 3f 26              stsp16	[sp+0x26], r7
 f4 28                 ldsp16	r4, [sp+0xa]
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 62                 add32	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x8d
<L4>:
 f0 3b 2e              stsp16	[sp+0x2e], r3
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 f0 3e 28              stsp16	[sp+0x28], r6
 f0 3f 2a              stsp16	[sp+0x2a], r7
 c2 01                 ldi8	r6, 0x1
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f4 62                 stsp16	[sp+0x8], r6
 f0 30 0a              ldsp16	r0, [sp+0xa]
 aa                    xor	r6, r6
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x206
 c4 ff ff              ldi16	r4, 0xffff
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x756
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f0 30 0a              ldsp16	r0, [sp+0xa]
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f1 14                 mov	r2, r4
 c0 20                 ldi8	r4, 0x20
 f9 51                 or	r2, r4
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f0 0e 6e              cmpi.s8	r2, 0x6e
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0xe7
<L5>:
 f0 0e 69              cmpi.s8	r2, 0x69
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x114
<L6>:
 f0 05 df ff           ldi16	r1, 0xffdf
 f9 84                 and	r4, r1
 04                    mov	r5, r4
 a0                    xor	r4, r4
 cd 49                 cmpi.s8	r5, 0x49
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x756
<L7>:
 f1 10                 mov	r2, r0
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x19b
<L8>:
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x756
 f0 05 df ff           ldi16	r1, 0xffdf
 f9 84                 and	r4, r1
 04                    mov	r5, r4
 a0                    xor	r4, r4
 cd 4e                 cmpi.s8	r5, 0x4e
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x756
<L9>:
 f1 10                 mov	r2, r0
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 d0 04                 breq8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x1c6
<L10>:
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x756
 f0 3b 2e              stsp16	[sp+0x2e], r3
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 f0 3e 28              stsp16	[sp+0x28], r6
 f0 3f 2a              stsp16	[sp+0x2a], r7
 c2 01                 ldi8	r6, 0x1
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 cc 30                 cmpi.s8	r4, 0x30
 d0 04                 breq8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x18e
<L11>:
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 f1 10                 mov	r2, r0
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 62                 add32	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d1 04                 brne8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x1f1
<L12>:
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 c5 df ff              ldi16	r5, 0xffdf
 84                    and	r5, r4
 cd 58                 cmpi.s8	r5, 0x58
 d0 04                 breq8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x1fa
<L13>:
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c4 fe ff              ldi16	r4, 0xfffe
 c5 ff ff              ldi16	r5, 0xffff
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f7 6e                 add32	q3, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 c2 10                 ldi8	r6, 0x10
 af                    xor	r7, r7
 f0 3e 28              stsp16	[sp+0x28], r6
 f0 3f 2a              stsp16	[sp+0x2a], r7
 aa                    xor	r6, r6
 f4 62                 stsp16	[sp+0x8], r6
 c2 04                 ldi8	r6, 0x4
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f1 02                 mov	r0, r2
 aa                    xor	r6, r6
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x206
 c0 01                 ldi8	r4, 0x1
 f4 60                 stsp16	[sp+0x8], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 aa                    xor	r6, r6
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x206
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f9 84                 and	r4, r1
 cc 4e                 cmpi.s8	r4, 0x4e
 d0 04                 breq8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x75d
<L14>:
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 d0 04                 breq8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x76c
<L15>:
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x756
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f9 84                 and	r4, r1
 cc 41                 cmpi.s8	r4, 0x41
 d0 04                 breq8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x762
<L16>:
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 d0 04                 breq8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x7da
<L17>:
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x756
 c2 01                 ldi8	r6, 0x1
 f4 62                 stsp16	[sp+0x8], r6
 aa                    xor	r6, r6
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x201
 f2 68                 mov32	q2, q0
 c2 01                 ldi8	r6, 0x1
 f4 62                 stsp16	[sp+0x8], r6
 aa                    xor	r6, r6
 f0 3e 14              stsp16	[sp+0x14], r6
 f1 02                 mov	r0, r2
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3e 22              stsp16	[sp+0x22], r6
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 d1 04                 brne8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x29b
<L18>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f1 20                 mov	r4, r0
 f1 0e                 mov	r1, r6
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f6 29                 tst16	r1
 f8 0f                 cset.ne	r7
 d0 04                 breq8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x279
<L19>:
 cc 2e                 cmpi.s8	r4, 0x2e
 d0 04                 breq8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x279
<L20>:
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d1 04                 brne8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x2a1
<L21>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f0 01 01              ldi8	r1, 0x1
 f1 2d                 mov	r7, r1
 f1 04                 mov	r0, r4
 f0 08 d0              addi.s8	r0, -0x30
 f0 0c 0a              cmpi.s8	r0, 0xa
 f0 36 14              ldsp16	r6, [sp+0x14]
 d2 04                 brult8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x2b4
<L22>:
 f0 0c 0a              cmpi.s8	r0, 0xa
 f8 2c                 cset.sge	r4
 f6 28                 tst16	r0
 d9 04                 brsge8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x55b
<L23>:
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x2d1
 f1 0e                 mov	r1, r6
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x2a4
 f0 01 01              ldi8	r1, 0x1
 c4 ff ff              ldi16	r4, 0xffff
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f6 29                 tst16	r1
 f8 0f                 cset.ne	r7
 f0 36 14              ldsp16	r6, [sp+0x14]
 c1 20                 ldi8	r5, 0x20
 91                    or	r4, r5
 04                    mov	r5, r4
 c9 9f                 addi.s8	r5, -0x61
 c8 a9                 addi.s8	r4, -0x57
 f0 04 ff ff           ldi16	r0, 0xffff
 cd 06                 cmpi.s8	r5, 0x6
 fc 04                 cmov.ult	r0, r4
 f0 0c 0a              cmpi.s8	r0, 0xa
 f8 2c                 cset.sge	r4
 f6 28                 tst16	r0
 d9 04                 brsge8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x55b
<L24>:
 f4 21                 ldsp16	r5, [sp+0x8]
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x55b
<L25>:
 f0 39 1e              stsp16	[sp+0x1e], r1
 f4 28                 ldsp16	r4, [sp+0xa]
 f1 0f                 mov	r1, r7
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c4 00 36              ldi16	r4, 0x3600
 c5 65 c4              ldi16	r5, 0xc465
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 69 84              cmp32	q2, q1
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 fd 26                 cmov.slt	r4, r6
 fd 2f                 cmov.slt	r5, r7
 c2 01                 ldi8	r6, 0x1
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f4 a1                 tst8	r1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 fb 74                 cmov.ne	r6, r4
 fb 7d                 cmov.ne	r7, r5
 f7 77                 sub32	q1, q3
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 c4              cmp32	q3, q1
 d0 04                 breq8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x453
<L26>:
 f6 28                 tst16	r0
 d0 04                 breq8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x453
<L27>:
 f0 69 84              cmp32	q2, q1
 d1 04                 brne8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x3b8
<L28>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 30 0a              ldsp16	r0, [sp+0xa]
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 f6 29                 tst16	r1
 f8 0f                 cset.ne	r7
 d0 04                 breq8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x398
<L29>:
 cc 2e                 cmpi.s8	r4, 0x2e
 d0 04                 breq8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x398
<L30>:
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 f0 31 1c              ldsp16	r1, [sp+0x1c]
 d1 04                 brne8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x3bb
<L31>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f0 01 01              ldi8	r1, 0x1
 f1 2d                 mov	r7, r1
 f1 04                 mov	r0, r4
 f0 08 d0              addi.s8	r0, -0x30
 f0 0c 0a              cmpi.s8	r0, 0xa
 d2 04                 brult8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x3c8
<L32>:
 f0 0c 0a              cmpi.s8	r0, 0xa
 f8 2c                 cset.sge	r4
 aa                    xor	r6, r6
 f6 28                 tst16	r0
 d9 04                 brsge8	0x4 <L33>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x553
<L33>:
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x3e6
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 c4 ff ff              ldi16	r4, 0xffff
 f6 29                 tst16	r1
 f8 0f                 cset.ne	r7
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 c1 20                 ldi8	r5, 0x20
 91                    or	r4, r5
 04                    mov	r5, r4
 c9 9f                 addi.s8	r5, -0x61
 c8 a9                 addi.s8	r4, -0x57
 f0 04 ff ff           ldi16	r0, 0xffff
 cd 06                 cmpi.s8	r5, 0x6
 fc 04                 cmov.ult	r0, r4
 f0 0c 0a              cmpi.s8	r0, 0xa
 f8 2c                 cset.sge	r4
 aa                    xor	r6, r6
 f6 28                 tst16	r0
 d9 04                 brsge8	0x4 <L34>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x553
<L34>:
 f4 21                 ldsp16	r5, [sp+0x8]
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L35>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x54d
<L35>:
 f0 39 1e              stsp16	[sp+0x1e], r1
 f4 28                 ldsp16	r4, [sp+0xa]
 f0 3f 10              stsp16	[sp+0x10], r7
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 c6 00 36              ldi16	r6, 0x3600
 c7 65 c4              ldi16	r7, 0xc465
 f0 69 c8              cmp32	q3, q2
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 38 14              stsp16	[sp+0x14], r0
 f2 61                 mov32	q0, q1
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 fd 06                 cmov.slt	r0, r6
 fd 0f                 cmov.slt	r1, r7
 f0 36 10              ldsp16	r6, [sp+0x10]
 f4 a6                 tst8	r6
 f2 6b                 mov32	q3, q1
 fb 70                 cmov.ne	r6, r0
 fb 79                 cmov.ne	r7, r1
 f0 30 14              ldsp16	r0, [sp+0x14]
 f7 7b                 sub32	q2, q3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 f6 28                 tst16	r0
 d1 04                 brne8	0x4 <L36>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x33c
<L36>:
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 f2 67                 mov32	q1, q3
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x459
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 a4                 tst8	r4
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 d1 04                 brne8	0x4 <L37>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x4ab
<L37>:
 c0 09                 ldi8	r4, 0x9
 f0 35 18              ldsp16	r5, [sp+0x18]
 cd 27                 cmpi.s8	r5, 0x27
 d2 04                 brult8	0x4 <L38>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x4ce
<L38>:
 f0 35 22              ldsp16	r5, [sp+0x22]
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L39>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x4c6
<L39>:
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 35 18              ldsp16	r5, [sp+0x18]
 09                    mov	r6, r5
 af                    xor	r7, r7
 f0 06 00 00           ldi16	r2, 0x0
		R_AVM_PROG_LO16	.rodata.str1.1
 f0 03 00              ldi8	r3, 0x0
		R_AVM_PROG_HI8	.rodata.str1.1
 f7 6d                 add32	q3, q1
 f0 61 ac              ldp8s	r5, [q3]
 c9 d0                 addi.s8	r5, -0x30
 f5 05                 cmp	r0, r5
 d0 04                 breq8	0x4 <L40>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x4b1
<L40>:
 a5                    xor	r5, r5
 f0 3d 22              stsp16	[sp+0x22], r5
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x4bd
 c0 08                 ldi8	r4, 0x8
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x4ce
 c7 ff ff              ldi16	r7, 0xffff
 c2 01                 ldi8	r6, 0x1
 f5 24                 cmp	r5, r0
 fd 3e                 cmov.slt	r7, r6
 f0 3f 22              stsp16	[sp+0x22], r7
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 35 18              ldsp16	r5, [sp+0x18]
 f4 ad                 inc16	r5
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 34                    cmp	r5, r4
 d8 04                 bruge8	0x4 <L41>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x51a
<L41>:
 c4 00 ca              ldi16	r4, 0xca00
 c5 9a 3b              ldi16	r5, 0x3b9a
 f1 2c                 mov	r7, r0
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 48              cmp32	q1, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 fd 04                 cmov.slt	r0, r4
 fd 0d                 cmov.slt	r1, r5
 f7 61                 add32	q0, q1
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 34 16              ldsp16	r4, [sp+0x16]
 93                    or	r4, r7
 f0 3c 16              stsp16	[sp+0x16], r4
 a0                    xor	r4, r4
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 30 0a              ldsp16	r0, [sp+0xa]
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 d0 04                 breq8	0x4 <L42>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x22f
<L42>:
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x29b
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f0 36 28              ldsp16	r6, [sp+0x28]
 f0 37 2a              ldsp16	r7, [sp+0x2a]
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f2 39                 sub	r1, r1
 f7 62                 add32	q0, q2
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 a0                    xor	r4, r4
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f4 ac                 inc16	r4
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x502
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x555
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 01 01              ldi8	r1, 0x1
 a0                    xor	r4, r4
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L43>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x756
<L43>:
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 84              cmp32	q2, q1
 d1 04                 brne8	0x4 <L44>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x690
<L44>:
 f0 3a 1e              stsp16	[sp+0x1e], r2
 f0 3b 20              stsp16	[sp+0x20], r3
 f0 00 70              ldi8	r0, 0x70
 c0 65                 ldi8	r4, 0x65
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 a5                 tst8	r5
 fb 44                 cmov.ne	r0, r4
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 c1 20                 ldi8	r5, 0x20
 91                    or	r4, r5
 f5 20                 cmp	r4, r0
 d0 04                 breq8	0x4 <L45>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x690
<L45>:
 f0 39 14              stsp16	[sp+0x14], r1
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 62                 add32	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d1 04                 brne8	0x4 <L46>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x767
<L46>:
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f1 1c                 mov	r3, r4
 f0 0f 2d              cmpi.s8	r3, 0x2d
 d1 04                 brne8	0x4 <L47>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x5d9
<L47>:
 f0 0f 2b              cmpi.s8	r3, 0x2b
 d0 04                 breq8	0x4 <L48>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x600
<L48>:
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c4 fe ff              ldi16	r4, 0xfffe
 c5 ff ff              ldi16	r5, 0xffff
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f7 62                 add32	q0, q2
 f0 0f 2d              cmpi.s8	r3, 0x2d
 f8 0c                 cset.ne	r4
 f0 3c 14              stsp16	[sp+0x14], r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d1 04                 brne8	0x4 <L49>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x80d
<L49>:
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 04                    mov	r5, r4
 c8 d0                 addi.s8	r4, -0x30
 cc 0a                 cmpi.s8	r4, 0xa
 a0                    xor	r4, r4
 d2 04                 brult8	0x4 <L50>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x756
<L50>:
 f1 15                 mov	r2, r5
 c4 ff e0              ldi16	r4, 0xe0ff
 c5 f5 05              ldi16	r5, 0x5f5
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f0 37 20              ldsp16	r7, [sp+0x20]
 f0 69 8c              cmp32	q2, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 d9 04                 brsge8	0x4 <L51>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x645
<L51>:
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f1 2a                 mov	r6, r2
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 c4 d0 ff              ldi16	r4, 0xffd0
 c5 ff ff              ldi16	r5, 0xffff
 f7 6b                 add32	q2, q3
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
 f4 28                 ldsp16	r4, [sp+0xa]
 f1 14                 mov	r2, r4
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 62                 add32	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d1 04                 brne8	0x4 <L52>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x671
<L52>:
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 04                    mov	r5, r4
 c8 d0                 addi.s8	r4, -0x30
 cc 0a                 cmpi.s8	r4, 0xa
 d8 04                 bruge8	0x4 <L53>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x612
<L53>:
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f0 37 20              ldsp16	r7, [sp+0x20]
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f7 77                 sub32	q1, q3
 f0 34 14              ldsp16	r4, [sp+0x14]
 f4 a4                 tst8	r4
 fb 56                 cmov.ne	r2, r6
 fb 5f                 cmov.ne	r3, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f7 66                 add32	q1, q2
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x696
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 34 18              ldsp16	r4, [sp+0x18]
 cc 27                 cmpi.s8	r4, 0x27
 f8 1d                 cset.uge	r5
 f0 34 22              ldsp16	r4, [sp+0x22]
 f4 a4                 tst8	r4
 f8 0c                 cset.ne	r4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f0 69 0c              cmp32	q0, q3
 f0 30 2e              ldsp16	r0, [sp+0x2e]
 f0 31 2c              ldsp16	r1, [sp+0x2c]
 d1 04                 brne8	0x4 <L54>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x6e9
<L54>:
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L55>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x6f1
<L55>:
 91                    or	r4, r5
 d6 fc                 adjsp	-0x4
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f4 41                 stsp16	[sp+0x0], r5
 f0 35 26              ldsp16	r5, [sp+0x26]
 f4 a5                 tst8	r5
 f8 2d                 cset.sge	r5
 84                    and	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_decimal_value
 d6 04                 adjsp	0x4
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x706
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f1 18                 mov	r3, r0
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x734
 d6 fe                 adjsp	-0x2
 f0 34 18              ldsp16	r4, [sp+0x18]
 f4 40                 stsp16	[sp+0x0], r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_hex_value
 d6 02                 adjsp	0x2
 c6 00 00              ldi16	r6, 0x0
		R_AVM_DATA16	__avm_errno
 f6 2e                 tst16	r6
 f1 18                 mov	r3, r0
 d1 04                 brne8	0x4 <L56>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x734
<L56>:
 f1 11                 mov	r2, r1
 aa                    xor	r6, r6
 c7 80 80              ldi16	r7, 0x8080
 f7 6e                 add32	q3, q2
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 80           ldi16	r1, 0x80ff
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L57>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x732
<L57>:
 c2 22                 ldi8	r6, 0x22
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 f1 0a                 mov	r1, r2
 f0 00 01              ldi8	r0, 0x1
 ed e2 24              ld8u	r7, [r1+4]
 f4 a7                 tst8	r7
 d0 04                 breq8	0x4 <L58>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x754
<L58>:
 ed d6 20              ld16	r6, [r3+0]
 0e                    mov	r7, r6
 cb 02                 addi.s8	r7, 0x2
 ee f6 20              st16	[r3+0], r7
 f0 33 26              ldsp16	r3, [sp+0x26]
 f9 ad                 or	r5, r3
 6a                    ld16	r6, [r6]
 f0 6b 8c              st32	[r6], q2
 f1 20                 mov	r4, r0
 d6 30                 adjsp	0x30
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x756
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x756
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x756
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f9 84                 and	r4, r1
 cc 46                 cmpi.s8	r4, 0x46
 d0 04                 breq8	0x4 <L59>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x812
<L59>:
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 c2 03                 ldi8	r6, 0x3
 af                    xor	r7, r7
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f0 69 0c              cmp32	q0, q3
 d1 04                 brne8	0x4 <L60>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x806
<L60>:
 f0 3b 2e              stsp16	[sp+0x2e], r3
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f0 04 df ff           ldi16	r0, 0xffdf
 f9 80                 and	r4, r0
 cc 49                 cmpi.s8	r4, 0x49
 d0 04                 breq8	0x4 <L61>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x8b4
<L61>:
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f9 80                 and	r4, r0
 cc 49                 cmpi.s8	r4, 0x49
 d0 04                 breq8	0x4 <L62>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x8cc
<L62>:
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c0 04                 ldi8	r4, 0x4
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 d0 04                 breq8	0x4 <L63>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x8d6
<L63>:
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x756
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f9 84                 and	r4, r1
 cc 4e                 cmpi.s8	r4, 0x4e
 d0 04                 breq8	0x4 <L64>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x817
<L64>:
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 c2 03                 ldi8	r6, 0x3
 af                    xor	r7, r7
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f0 69 0c              cmp32	q0, q3
 d0 04                 breq8	0x4 <L65>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x81c
<L65>:
 f0 31 2c              ldsp16	r1, [sp+0x2c]
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x734
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x756
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x756
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x756
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 cc 28                 cmpi.s8	r4, 0x28
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 d0 04                 breq8	0x4 <L66>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x8c2
<L66>:
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c4 fc ff              ldi16	r4, 0xfffc
 c5 ff ff              ldi16	r5, 0xffff
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f7 62                 add32	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d1 04                 brne8	0x4 <L67>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x8d1
<L67>:
 f0 32 0a              ldsp16	r2, [sp+0xa]
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x86f
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 62                 add32	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d1 04                 brne8	0x4 <L68>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x906
<L68>:
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f1 14                 mov	r2, r4
 f0 0e ff              cmpi.s8	r2, -0x1
 d1 04                 brne8	0x4 <L69>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x901
<L69>:
 f1 22                 mov	r4, r2
 f1 74                 zext8	r4
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	isalnum
 f0 0e 5f              cmpi.s8	r2, 0x5f
 d1 04                 brne8	0x4 <L70>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x853
<L70>:
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L71>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x853
<L71>:
 f0 0e 29              cmpi.s8	r2, 0x29
 a0                    xor	r4, r4
 d0 04                 breq8	0x4 <L72>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x756
<L72>:
 f4 28                 ldsp16	r4, [sp+0xa]
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 f0 31 2c              ldsp16	r1, [sp+0x2c]
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x734
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 33 2e              ldsp16	r3, [sp+0x2e]
 f0 31 2c              ldsp16	r1, [sp+0x2c]
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x734
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 f1 0e                 mov	r1, r6
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x734
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x756
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x756
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f9 80                 and	r4, r0
 cc 4e                 cmpi.s8	r4, 0x4e
 d0 04                 breq8	0x4 <L73>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x90b
<L73>:
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 d0 04                 breq8	0x4 <L74>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x910
<L74>:
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x756
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x756
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x756
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x756
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f9 80                 and	r4, r0
 cc 49                 cmpi.s8	r4, 0x49
 d0 04                 breq8	0x4 <L75>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x93b
<L75>:
 f4 28                 ldsp16	r4, [sp+0xa]
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 d0 04                 breq8	0x4 <L76>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x940
<L76>:
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x756
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x756
 f4 28                 ldsp16	r4, [sp+0xa]
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 c5 df ff              ldi16	r5, 0xffdf
 81                    and	r4, r5
 cc 54                 cmpi.s8	r4, 0x54
 d0 04                 breq8	0x4 <L77>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x96d
<L77>:
 f4 28                 ldsp16	r4, [sp+0xa]
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c0 07                 ldi8	r4, 0x7
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 d0 04                 breq8	0x4 <L78>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x972
<L78>:
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x756
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x756
 f4 28                 ldsp16	r4, [sp+0xa]
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 c5 df ff              ldi16	r5, 0xffdf
 81                    and	r4, r5
 cc 59                 cmpi.s8	r4, 0x59
 a0                    xor	r4, r4
 d0 04                 breq8	0x4 <L79>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x756
<L79>:
 f4 28                 ldsp16	r4, [sp+0xa]
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x8b8
