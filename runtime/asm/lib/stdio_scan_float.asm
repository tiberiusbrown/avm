
stdio_scan_float.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 stdio_scan_float.c
00000000 l    d  .text.__avm_scan_float	00000000 .text.__avm_scan_float
00000000 l     O .rodata.str1.1	00000028 __avm_scan_float.threshold
00000000 l    d  .rodata.str1.1	00000000 .rodata.str1.1
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.__avm_scan_float	000008dd __avm_scan_float
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
 d6 ce                 adjsp	-0x32
 f0 6a 0a              ld32	q0, [r5]
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x7e
<L0>:
 f0 3d 20              stsp16	[sp+0x20], r5
 f0 3e 22              stsp16	[sp+0x22], r6
 f1 14                 mov	r2, r4
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 cc ff                 cmpi.s8	r4, -0x1
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x8c1
<L1>:
 cc 2b                 cmpi.s8	r4, 0x2b
 f0 03 01              ldi8	r3, 0x1
 a5                    xor	r5, r5
 f4 69                 stsp16	[sp+0xa], r5
 af                    xor	r7, r7
 f0 3a 0e              stsp16	[sp+0xe], r2
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x48
<L2>:
 cc 2d                 cmpi.s8	r4, 0x2d
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x85
<L3>:
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 f0 3e 26              stsp16	[sp+0x26], r6
 f0 3f 28              stsp16	[sp+0x28], r7
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
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x8d
<L4>:
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 f0 3e 2a              stsp16	[sp+0x2a], r6
 f0 3f 2c              stsp16	[sp+0x2c], r7
 c2 01                 ldi8	r6, 0x1
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f0 3b 04              stsp16	[sp+0x4], r3
 aa                    xor	r6, r6
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x32a
 c4 ff ff              ldi16	r4, 0xffff
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x8c1
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 26              stsp16	[sp+0x26], r4
 f0 3d 28              stsp16	[sp+0x28], r5
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f1 04                 mov	r0, r4
 c0 20                 ldi8	r4, 0x20
 f9 11                 or	r0, r4
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f0 0c 6e              cmpi.s8	r0, 0x6e
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x1f3
<L5>:
 f0 0c 69              cmpi.s8	r0, 0x69
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x29b
<L6>:
 f0 05 df ff           ldi16	r1, 0xffdf
 f9 84                 and	r4, r1
 04                    mov	r5, r4
 a0                    xor	r4, r4
 cd 49                 cmpi.s8	r5, 0x49
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x8c1
<L7>:
 f1 04                 mov	r0, r4
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x855
<L8>:
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f9 84                 and	r4, r1
 cc 4e                 cmpi.s8	r4, 0x4e
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x855
<L9>:
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x855
<L10>:
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f9 84                 and	r4, r1
 cc 46                 cmpi.s8	r4, 0x46
 d0 04                 breq8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x855
<L11>:
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x8cd
<L12>:
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f9 84                 and	r4, r1
 cc 49                 cmpi.s8	r4, 0x49
 d0 04                 breq8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x8cd
<L13>:
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f9 84                 and	r4, r1
 cc 49                 cmpi.s8	r4, 0x49
 d0 04                 breq8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x855
<L14>:
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c0 04                 ldi8	r4, 0x4
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x855
<L15>:
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f9 84                 and	r4, r1
 cc 4e                 cmpi.s8	r4, 0x4e
 d0 04                 breq8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x855
<L16>:
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x855
<L17>:
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f9 84                 and	r4, r1
 cc 49                 cmpi.s8	r4, 0x49
 d0 04                 breq8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x855
<L18>:
 f4 38                 ldsp16	r4, [sp+0xe]
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x855
<L19>:
 f4 38                 ldsp16	r4, [sp+0xe]
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f9 84                 and	r4, r1
 cc 54                 cmpi.s8	r4, 0x54
 d0 04                 breq8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x855
<L20>:
 f4 38                 ldsp16	r4, [sp+0xe]
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c0 07                 ldi8	r4, 0x7
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x855
<L21>:
 f4 38                 ldsp16	r4, [sp+0xe]
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f9 84                 and	r4, r1
 cc 59                 cmpi.s8	r4, 0x59
 f1 20                 mov	r4, r0
 d0 04                 breq8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x8c1
<L22>:
 f4 38                 ldsp16	r4, [sp+0xe]
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x830
 f0 04 df ff           ldi16	r0, 0xffdf
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 a0                    xor	r4, r4
 cd 4e                 cmpi.s8	r5, 0x4e
 d0 04                 breq8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x8c1
<L23>:
 f1 0c                 mov	r1, r4
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x8bf
<L24>:
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f9 80                 and	r4, r0
 cc 41                 cmpi.s8	r4, 0x41
 d0 04                 breq8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x8bf
<L25>:
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x8bf
<L26>:
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f9 80                 and	r4, r0
 cc 4e                 cmpi.s8	r4, 0x4e
 d0 04                 breq8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x8bf
<L27>:
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x8d5
<L28>:
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 cc 28                 cmpi.s8	r4, 0x28
 d0 04                 breq8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x8d5
<L29>:
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c4 fc ff              ldi16	r4, 0xfffc
 c5 ff ff              ldi16	r5, 0xffff
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f7 66                 add32	q1, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 d1 04                 brne8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x8bf
<L30>:
 f0 30 0e              ldsp16	r0, [sp+0xe]
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x87c
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 f0 3e 2a              stsp16	[sp+0x2a], r6
 f0 3f 2c              stsp16	[sp+0x2c], r7
 c2 01                 ldi8	r6, 0x1
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 cc 30                 cmpi.s8	r4, 0x30
 d0 04                 breq8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x30e
<L31>:
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
 d1 04                 brne8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x31a
<L32>:
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 c5 df ff              ldi16	r5, 0xffdf
 84                    and	r5, r4
 cd 58                 cmpi.s8	r5, 0x58
 d0 04                 breq8	0x4 <L33>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x322
<L33>:
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
 f0 3e 2a              stsp16	[sp+0x2a], r6
 f0 3f 2c              stsp16	[sp+0x2c], r7
 aa                    xor	r6, r6
 f4 52                 stsp16	[sp+0x4], r6
 c2 04                 ldi8	r6, 0x4
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 aa                    xor	r6, r6
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x32a
 f0 3b 04              stsp16	[sp+0x4], r3
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 aa                    xor	r6, r6
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x32a
 f0 3b 04              stsp16	[sp+0x4], r3
 aa                    xor	r6, r6
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x328
 f2 68                 mov32	q2, q0
 f0 3b 04              stsp16	[sp+0x4], r3
 aa                    xor	r6, r6
 f1 1e                 mov	r3, r6
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3e 24              stsp16	[sp+0x24], r6
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d1 04                 brne8	0x4 <L34>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x3bf
<L34>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f4 2a                 ldsp16	r6, [sp+0xa]
 f6 2e                 tst16	r6
 f8 08                 cset.ne	r0
 d0 04                 breq8	0x4 <L35>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x39a
<L35>:
 cc 2e                 cmpi.s8	r4, 0x2e
 d0 04                 breq8	0x4 <L36>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x39a
<L36>:
 f1 22                 mov	r4, r2
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
 d1 04                 brne8	0x4 <L37>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x3bb
<L37>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 c2 01                 ldi8	r6, 0x1
 f1 06                 mov	r0, r6
 f1 14                 mov	r2, r4
 f0 0a d0              addi.s8	r2, -0x30
 f0 0e 0a              cmpi.s8	r2, 0xa
 f1 2f                 mov	r7, r3
 d2 04                 brult8	0x4 <L38>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x3ce
<L38>:
 f0 0e 0a              cmpi.s8	r2, 0xa
 f8 2c                 cset.sge	r4
 f6 2a                 tst16	r2
 d9 04                 brsge8	0x4 <L39>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x667
<L39>:
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x3eb
 c0 01                 ldi8	r4, 0x1
 f4 68                 stsp16	[sp+0xa], r4
 c4 ff ff              ldi16	r4, 0xffff
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 2a                 ldsp16	r6, [sp+0xa]
 f6 2e                 tst16	r6
 f8 08                 cset.ne	r0
 f1 2f                 mov	r7, r3
 c1 20                 ldi8	r5, 0x20
 91                    or	r4, r5
 04                    mov	r5, r4
 c9 9f                 addi.s8	r5, -0x61
 c8 a9                 addi.s8	r4, -0x57
 f0 06 ff ff           ldi16	r2, 0xffff
 cd 06                 cmpi.s8	r5, 0x6
 fc 14                 cmov.ult	r2, r4
 f0 0e 0a              cmpi.s8	r2, 0xa
 f8 2c                 cset.sge	r4
 f6 2a                 tst16	r2
 d9 04                 brsge8	0x4 <L40>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x667
<L40>:
 f4 11                 ldsp16	r5, [sp+0x4]
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L41>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x667
<L41>:
 f4 6a                 stsp16	[sp+0xa], r6
 f4 38                 ldsp16	r4, [sp+0xe]
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c4 00 36              ldi16	r4, 0x3600
 c5 65 c4              ldi16	r5, 0xc465
 f1 18                 mov	r3, r0
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 f0 69 80              cmp32	q2, q0
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 fd 26                 cmov.slt	r4, r6
 fd 2f                 cmov.slt	r5, r7
 c2 01                 ldi8	r6, 0x1
 f0 3e 14              stsp16	[sp+0x14], r6
 f4 a3                 tst8	r3
 aa                    xor	r6, r6
 af                    xor	r7, r7
 fb 74                 cmov.ne	r6, r4
 fb 7d                 cmov.ne	r7, r5
 f7 73                 sub32	q0, q3
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d0 04                 breq8	0x4 <L42>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x570
<L42>:
 f6 2a                 tst16	r2
 d0 04                 breq8	0x4 <L43>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x570
<L43>:
 f0 69 80              cmp32	q2, q0
 d1 04                 brne8	0x4 <L44>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x4cd
<L44>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f4 2a                 ldsp16	r6, [sp+0xa]
 f6 2e                 tst16	r6
 f8 0b                 cset.ne	r3
 d0 04                 breq8	0x4 <L45>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x4ad
<L45>:
 cc 2e                 cmpi.s8	r4, 0x2e
 d0 04                 breq8	0x4 <L46>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x4ad
<L46>:
 f1 22                 mov	r4, r2
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
 f0 36 14              ldsp16	r6, [sp+0x14]
 d1 04                 brne8	0x4 <L47>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x4cf
<L47>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 c2 01                 ldi8	r6, 0x1
 f1 1e                 mov	r3, r6
 f1 04                 mov	r0, r4
 f0 08 d0              addi.s8	r0, -0x30
 f0 0c 0a              cmpi.s8	r0, 0xa
 d2 04                 brult8	0x4 <L48>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x4e0
<L48>:
 f0 0c 0a              cmpi.s8	r0, 0xa
 f8 2c                 cset.sge	r4
 af                    xor	r7, r7
 f6 28                 tst16	r0
 d9 04                 brsge8	0x4 <L49>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x65f
<L49>:
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x4fe
 f4 2a                 ldsp16	r6, [sp+0xa]
 c4 ff ff              ldi16	r4, 0xffff
 f6 2e                 tst16	r6
 f8 0b                 cset.ne	r3
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
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
 af                    xor	r7, r7
 f6 28                 tst16	r0
 d9 04                 brsge8	0x4 <L50>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x65f
<L50>:
 f4 11                 ldsp16	r5, [sp+0x4]
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L51>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x659
<L51>:
 f4 6a                 stsp16	[sp+0xa], r6
 f4 38                 ldsp16	r4, [sp+0xe]
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 f0 38 2e              stsp16	[sp+0x2e], r0
 f0 3b 10              stsp16	[sp+0x10], r3
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 c4 00 36              ldi16	r4, 0x3600
 c5 65 c4              ldi16	r5, 0xc465
 f0 69 84              cmp32	q2, q1
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f2 68                 mov32	q2, q0
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 fd 26                 cmov.slt	r4, r6
 fd 2f                 cmov.slt	r5, r7
 f0 36 10              ldsp16	r6, [sp+0x10]
 f4 a6                 tst8	r6
 f2 6a                 mov32	q3, q0
 fb 74                 cmov.ne	r6, r4
 fb 7d                 cmov.ne	r7, r5
 f7 77                 sub32	q1, q3
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 3b 1e              stsp16	[sp+0x1e], r3
 f0 32 2e              ldsp16	r2, [sp+0x2e]
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 f6 2a                 tst16	r2
 d1 04                 brne8	0x4 <L52>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x455
<L52>:
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f2 63                 mov32	q0, q3
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x576
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L53>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x5c5
<L53>:
 c0 09                 ldi8	r4, 0x9
 f0 35 18              ldsp16	r5, [sp+0x18]
 cd 27                 cmpi.s8	r5, 0x27
 d2 04                 brult8	0x4 <L54>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x5e5
<L54>:
 f0 35 24              ldsp16	r5, [sp+0x24]
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L55>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x5dd
<L55>:
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
 f0 35 18              ldsp16	r5, [sp+0x18]
 09                    mov	r6, r5
 af                    xor	r7, r7
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	.rodata.str1.1
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	.rodata.str1.1
 f7 6c                 add32	q3, q0
 f0 61 ac              ldp8s	r5, [q3]
 c9 d0                 addi.s8	r5, -0x30
 f5 15                 cmp	r2, r5
 d0 04                 breq8	0x4 <L56>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x5cb
<L56>:
 a5                    xor	r5, r5
 f0 3d 24              stsp16	[sp+0x24], r5
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x5d7
 c0 08                 ldi8	r4, 0x8
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x5e5
 c7 ff ff              ldi16	r7, 0xffff
 c2 01                 ldi8	r6, 0x1
 f5 26                 cmp	r5, r2
 fd 3e                 cmov.slt	r7, r6
 f0 3f 24              stsp16	[sp+0x24], r7
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 f0 35 18              ldsp16	r5, [sp+0x18]
 f4 ad                 inc16	r5
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 34                    cmp	r5, r4
 d8 04                 bruge8	0x4 <L57>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x62a
<L57>:
 c4 00 ca              ldi16	r4, 0xca00
 c5 9a 3b              ldi16	r5, 0x3b9a
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 08              cmp32	q0, q2
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 fd 34                 cmov.slt	r6, r4
 fd 3d                 cmov.slt	r7, r5
 f7 6c                 add32	q3, q0
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f0 34 16              ldsp16	r4, [sp+0x16]
 f9 89                 or	r4, r2
 f0 3c 16              stsp16	[sp+0x16], r4
 f2 4b                 sub	r3, r3
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 04                 breq8	0x4 <L58>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x351
<L58>:
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x3bf
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f0 36 2a              ldsp16	r6, [sp+0x2a]
 f0 37 2c              ldsp16	r7, [sp+0x2c]
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f1 2a                 mov	r6, r2
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f2 4b                 sub	r3, r3
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f4 ac                 inc16	r4
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x614
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x661
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 03 01              ldi8	r3, 0x1
 a0                    xor	r4, r4
 f4 a7                 tst8	r7
 d0 04                 breq8	0x4 <L59>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x8c1
<L59>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 80              cmp32	q2, q0
 d1 04                 brne8	0x4 <L60>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x7a0
<L60>:
 f0 38 2e              stsp16	[sp+0x2e], r0
 f0 39 30              stsp16	[sp+0x30], r1
 f0 02 70              ldi8	r2, 0x70
 c0 65                 ldi8	r4, 0x65
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 a5                 tst8	r5
 fb 54                 cmov.ne	r2, r4
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 c1 20                 ldi8	r5, 0x20
 91                    or	r4, r5
 f5 22                 cmp	r4, r2
 d0 04                 breq8	0x4 <L61>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x7a0
<L61>:
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 6e                 add32	q3, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L62>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x85b
<L62>:
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f1 0c                 mov	r1, r4
 f0 0d 2d              cmpi.s8	r1, 0x2d
 d1 04                 brne8	0x4 <L63>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x6e4
<L63>:
 f0 0d 2b              cmpi.s8	r1, 0x2b
 d0 04                 breq8	0x4 <L64>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x70a
<L64>:
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c4 fe ff              ldi16	r4, 0xfffe
 c5 ff ff              ldi16	r5, 0xffff
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f7 6e                 add32	q3, q2
 f0 0d 2d              cmpi.s8	r1, 0x2d
 f8 0b                 cset.ne	r3
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 d1 04                 brne8	0x4 <L65>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x8c8
<L65>:
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f1 14                 mov	r2, r4
 c8 d0                 addi.s8	r4, -0x30
 cc 0a                 cmpi.s8	r4, 0xa
 a0                    xor	r4, r4
 d2 04                 brult8	0x4 <L66>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x8c1
<L66>:
 c6 ff e0              ldi16	r6, 0xe0ff
 c7 f5 05              ldi16	r7, 0x5f5
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 f0 35 30              ldsp16	r5, [sp+0x30]
 f0 69 c8              cmp32	q3, q2
 d9 04                 brsge8	0x4 <L67>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x74c
<L67>:
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
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 3d 30              stsp16	[sp+0x30], r5
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 f7 6e                 add32	q3, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 f2 62                 mov32	q0, q2
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L68>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x784
<L68>:
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f1 14                 mov	r2, r4
 c8 d0                 addi.s8	r4, -0x30
 cc 0a                 cmpi.s8	r4, 0xa
 d8 04                 bruge8	0x4 <L69>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x71d
<L69>:
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 f0 35 30              ldsp16	r5, [sp+0x30]
 f7 72                 sub32	q0, q2
 f4 a3                 tst8	r3
 f2 6a                 mov32	q3, q0
 fb 74                 cmov.ne	r6, r4
 fb 7d                 cmov.ne	r7, r5
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f7 6e                 add32	q3, q2
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x7a6
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f0 34 18              ldsp16	r4, [sp+0x18]
 cc 27                 cmpi.s8	r4, 0x27
 f8 1b                 cset.uge	r3
 f0 34 24              ldsp16	r4, [sp+0x24]
 f4 a4                 tst8	r4
 f8 0a                 cset.ne	r2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f0 69 08              cmp32	q0, q2
 d1 04                 brne8	0x4 <L70>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x830
<L70>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L71>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x7f5
<L71>:
 f9 4d                 or	r2, r3
 d6 fc                 adjsp	-0x4
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f4 40                 stsp16	[sp+0x0], r4
 f0 34 28              ldsp16	r4, [sp+0x28]
 fa 38                 lsl16i	r4, 0x8
 f6 2c                 tst16	r4
 f8 2c                 cset.sge	r4
 f9 88                 and	r4, r2
 f4 48                 stsp16	[sp+0x2], r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_decimal_value
 d6 04                 adjsp	0x4
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x808
 d6 fe                 adjsp	-0x2
 f0 34 18              ldsp16	r4, [sp+0x18]
 f4 40                 stsp16	[sp+0x0], r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_hex_value
 d6 02                 adjsp	0x2
 c6 00 00              ldi16	r6, 0x0
		R_AVM_DATA16	__avm_errno
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L72>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x830
<L72>:
 aa                    xor	r6, r6
 c7 80 80              ldi16	r7, 0x8080
 f7 6e                 add32	q3, q2
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 80           ldi16	r1, 0x80ff
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L73>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x830
<L73>:
 c2 22                 ldi8	r6, 0x22
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_errno
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 00 01              ldi8	r0, 0x1
 ed ec 24              ld8u	r7, [r6+4]
 f4 a7                 tst8	r7
 d0 04                 breq8	0x4 <L74>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x855
<L74>:
 f0 36 22              ldsp16	r6, [sp+0x22]
 f5 49                 ld16	r1, [r6]
 f1 2d                 mov	r7, r1
 cb 02                 addi.s8	r7, 0x2
 7b                    st16	[r6], r7
 f0 37 28              ldsp16	r7, [sp+0x28]
 97                    or	r5, r7
 ed d2 20              ld16	r6, [r1+0]
 f0 6b 8c              st32	[r6], q2
 f1 20                 mov	r4, r0
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x8c1
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x8c1
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 66                 add32	q1, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 d1 04                 brne8	0x4 <L75>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x8bf
<L75>:
 f1 20                 mov	r4, r0
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f1 04                 mov	r0, r4
 f0 0c ff              cmpi.s8	r0, -0x1
 d1 04                 brne8	0x4 <L76>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x8bf
<L76>:
 f1 20                 mov	r4, r0
 f1 74                 zext8	r4
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	isalnum
 f0 0c 5f              cmpi.s8	r0, 0x5f
 d1 04                 brne8	0x4 <L77>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x860
<L77>:
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L78>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x860
<L78>:
 f0 0c 29              cmpi.s8	r0, 0x29
 f1 21                 mov	r4, r1
 d0 04                 breq8	0x4 <L79>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_FAR24	.text.__avm_scan_float+0x8c1
<L79>:
 f4 38                 ldsp16	r4, [sp+0xe]
 e3 00 00 00           callf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x830
 f1 21                 mov	r4, r1
 d6 32                 adjsp	0x32
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x8c1
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x830
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 e2 00 00 00           jmpf	__avm_scan_float
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_float+0x830
