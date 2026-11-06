
stdio_scan_core.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 stdio_scan_core.c
00000000 l    d  .text.__avm_scan_peek	00000000 .text.__avm_scan_peek
00000000 l    d  .text.__avm_scan_take	00000000 .text.__avm_scan_take
00000000 l    d  .text.__avm_scan_finish	00000000 .text.__avm_scan_finish
00000000 l    d  .text.__avm_scan_skip_space	00000000 .text.__avm_scan_skip_space
00000000 l    d  .text.__avm_vscan	00000000 .text.__avm_vscan
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.__avm_scan_peek	00000026 __avm_scan_peek
00000000 g     F .text.__avm_scan_take	00000045 __avm_scan_take
00000000 g     F .text.__avm_scan_finish	00000024 __avm_scan_finish
00000000 g     F .text.__avm_scan_skip_space	00000085 __avm_scan_skip_space
00000000         *UND*	00000000 isspace
00000000 g     F .text.__avm_vscan	00000916 __avm_vscan
00000000         *UND*	00000000 __avm_mulsi3
00000000         *UND*	00000000 __avm_udivsi3
00000000         *UND*	00000000 __avm_scan_count
00000000         *UND*	00000000 __avm_scan_integer
00000000         *UND*	00000000 __avm_scan_float

Disassembly of section .text.__avm_scan_peek:

<__avm_scan_peek>:
 b0                    push16	r0
 ed a8 30              ld8u	r5, [r4+16]
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_peek
		R_AVM_FAR24	.text.__avm_scan_peek+0x11
<L0>:
 ed 98 2e              ld16	r4, [r4+14]
 b8                    pop16	r0
 ef                    ret
 04                    mov	r5, r4
 c9 02                 addi.s8	r5, 0x2
 f7 2e                 ld16	r6, [r5+]
 4d                    ld8u	r7, [r5]
 64                    ld16	r5, [r4]
 f1 04                 mov	r0, r4
 01                    mov	r4, r5
 eb                    callp	q3
 c1 01                 ldi8	r5, 0x1
 ee a0 30              st8	[r0+16], r5
 ee 90 2e              st16	[r0+14], r4
 b8                    pop16	r0
 ef                    ret

Disassembly of section .text.__avm_scan_take:

<__avm_scan_take>:
 b3                    push16	r3
 b2                    push16	r2
 b0                    push16	r0
 f1 04                 mov	r0, r4
 ed 80 30              ld8u	r4, [r0+16]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_take
		R_AVM_FAR24	.text.__avm_scan_take+0x17
<L0>:
 ed 90 2e              ld16	r4, [r0+14]
 e2 00 00 00           jmpf	__avm_scan_take
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_take+0x25
 f1 20                 mov	r4, r0
 c8 02                 addi.s8	r4, 0x2
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 ed 90 20              ld16	r4, [r0+0]
 eb                    callp	q3
 ee 90 2e              st16	[r0+14], r4
 a5                    xor	r5, r5
 ee a0 30              st8	[r0+16], r5
 cc ff                 cmpi.s8	r4, -0x1
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_take
		R_AVM_FAR24	.text.__avm_scan_take+0x41
<L1>:
 f0 08 08              addi.s8	r0, 0x8
 f0 6a c0              ld32	q3, [r0]
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f7 67                 add32	q1, q3
 f0 6b 40              st32	[r0], q1
 b8                    pop16	r0
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.__avm_scan_finish:

<__avm_scan_finish>:
 b1                    push16	r1
 b0                    push16	r0
 ed a8 30              ld8u	r5, [r4+16]
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_finish
		R_AVM_FAR24	.text.__avm_scan_finish+0x21
<L0>:
 ed b8 2e              ld16	r5, [r4+14]
 cd ff                 cmpi.s8	r5, -0x1
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_finish
		R_AVM_FAR24	.text.__avm_scan_finish+0x21
<L1>:
 68                    ld16	r6, [r4]
 c8 05                 addi.s8	r4, 0x5
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 02                    mov	r4, r6
 e8                    callp	q0
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

Disassembly of section .text.__avm_scan_skip_space:

<__avm_scan_skip_space>:
 b3                    push16	r3
 b2                    push16	r2
 b0                    push16	r0
 f1 04                 mov	r0, r4
 ed 80 30              ld8u	r4, [r0+16]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_skip_space
		R_AVM_FAR24	.text.__avm_scan_skip_space+0x66
<L0>:
 ed 90 2e              ld16	r4, [r0+14]
 cc ff                 cmpi.s8	r4, -0x1
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_skip_space
		R_AVM_FAR24	.text.__avm_scan_skip_space+0x81
<L1>:
 f1 74                 zext8	r4
 e3 00 00 00           callf	__avm_scan_skip_space
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	isspace
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_skip_space
		R_AVM_FAR24	.text.__avm_scan_skip_space+0x81
<L2>:
 ed 80 30              ld8u	r4, [r0+16]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_skip_space
		R_AVM_FAR24	.text.__avm_scan_skip_space+0x3b
<L3>:
 ed 90 2e              ld16	r4, [r0+14]
 e2 00 00 00           jmpf	__avm_scan_skip_space
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_skip_space+0x49
 f1 20                 mov	r4, r0
 c8 02                 addi.s8	r4, 0x2
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 ed 90 20              ld16	r4, [r0+0]
 eb                    callp	q3
 ee 90 2e              st16	[r0+14], r4
 a5                    xor	r5, r5
 ee a0 30              st8	[r0+16], r5
 cc ff                 cmpi.s8	r4, -0x1
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_skip_space
		R_AVM_FAR24	.text.__avm_scan_skip_space+0x66
<L4>:
 f1 20                 mov	r4, r0
 c8 08                 addi.s8	r4, 0x8
 f0 6a c8              ld32	q3, [r4]
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f7 67                 add32	q1, q3
 f0 6b 48              st32	[r4], q1
 f1 20                 mov	r4, r0
 c8 02                 addi.s8	r4, 0x2
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 ed 90 20              ld16	r4, [r0+0]
 eb                    callp	q3
 c1 01                 ldi8	r5, 0x1
 ee a0 30              st8	[r0+16], r5
 ee 90 2e              st16	[r0+14], r4
 cc ff                 cmpi.s8	r4, -0x1
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_skip_space
		R_AVM_FAR24	.text.__avm_scan_skip_space+0x1b
<L5>:
 b8                    pop16	r0
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.__avm_vscan:

<__avm_vscan>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d2                 adjsp	-0x2e
 f1 05                 mov	r0, r5
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 6a c8              ld32	q3, [r4]
 c8 04                 addi.s8	r4, 0x4
 f0 6a 88              ld32	q2, [r4]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 14 08              leasp	r4, 0x8
 a5                    xor	r5, r5
 c2 09                 ldi8	r6, 0x9
 d7 11                 sys	memset
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 3c 26              stsp16	[sp+0x26], r4
 c0 01                 ldi8	r4, 0x1
 ed 20 20              ld8u	r1, [r0+0]
 f4 a1                 tst8	r1
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x6e
<L0>:
 f1 0c                 mov	r1, r4
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x8a0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
 c1 01                 ldi8	r5, 0x1
 f0 2d 10              stsp8	[sp+0x10], r5
 f4 78                 stsp16	[sp+0xe], r4
 f5 21                 cmp	r4, r1
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x8d1
<L1>:
 a0                    xor	r4, r4
 f0 2c 10              stsp8	[sp+0x10], r4
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f7 6e                 add32	q3, q2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 ed 20 20              ld8u	r1, [r0+0]
 f4 a1                 tst8	r1
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x896
<L2>:
 f1 21                 mov	r4, r1
 e3 00 00 00           callf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	isspace
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0xa6
<L3>:
 ed 80 21              ld8u	r4, [r0+1]
 f4 a8                 inc16	r0
 e3 00 00 00           callf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	isspace
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x7c
<L4>:
 f0 1c 10              ldsp8u	r4, [sp+0x10]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0xc3
<L5>:
 f4 38                 ldsp16	r4, [sp+0xe]
 cc ff                 cmpi.s8	r4, -0x1
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x63
<L6>:
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0xd9
 f1 24                 mov	r5, r0
 f4 ad                 inc16	r5
 f0 0d 25              cmpi.s8	r1, 0x25
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0xf8
<L7>:
 41                    ld8u	r4, [r5]
 cc 25                 cmpi.s8	r4, 0x25
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x11c
<L8>:
 f0 08 02              addi.s8	r0, 0x2
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0xfa
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
 c1 01                 ldi8	r5, 0x1
 f0 2d 10              stsp8	[sp+0x10], r5
 f4 78                 stsp16	[sp+0xe], r4
 cc ff                 cmpi.s8	r4, -0x1
 d1 04                 brne8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x63
<L9>:
 f1 74                 zext8	r4
 e3 00 00 00           callf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	isspace
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x63
<L10>:
 f0 1c 10              ldsp8u	r4, [sp+0x10]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x1e7
<L11>:
 f4 38                 ldsp16	r4, [sp+0xe]
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x1f0
 f1 05                 mov	r0, r5
 f0 1c 10              ldsp8u	r4, [sp+0x10]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x3c
<L12>:
 f4 38                 ldsp16	r4, [sp+0xe]
 f5 21                 cmp	r4, r1
 d1 04                 brne8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x52
<L13>:
 cc ff                 cmpi.s8	r4, -0x1
 f2 39                 sub	r1, r1
 c4 ff ff              ldi16	r4, 0xffff
 fb 0c                 cmov.eq	r1, r4
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x8ab
 a0                    xor	r4, r4
 f0 3c 19              stsp16	[sp+0x19], r4
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 3e 15              stsp16	[sp+0x15], r6
 f0 3f 17              stsp16	[sp+0x17], r7
 f1 15                 mov	r2, r5
 41                    ld8u	r4, [r5]
 cc 2a                 cmpi.s8	r4, 0x2a
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f1 1c                 mov	r3, r4
 d0 04                 breq8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x149
<L14>:
 c0 01                 ldi8	r4, 0x1
 f0 2c 19              stsp8	[sp+0x19], r4
 ed 60 22              ld8u	r3, [r0+2]
 f0 08 02              addi.s8	r0, 0x2
 f1 10                 mov	r2, r0
 f1 27                 mov	r5, r3
 c9 d0                 addi.s8	r5, -0x30
 f1 75                 zext8	r5
 f0 3d 20              stsp16	[sp+0x20], r5
 cd 0a                 cmpi.s8	r5, 0xa
 d2 04                 brult8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x27a
<L15>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 38 15              stsp16	[sp+0x15], r0
 f0 39 17              stsp16	[sp+0x17], r1
 ed 64 20              ld8u	r3, [r2+0]
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x19b
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f2 62                 mov32	q0, q2
 f0 34 11              ldsp16	r4, [sp+0x11]
 f0 35 13              ldsp16	r5, [sp+0x13]
 f7 62                 add32	q0, q2
 f0 38 15              stsp16	[sp+0x15], r0
 f0 39 17              stsp16	[sp+0x17], r1
 ed 64 20              ld8u	r3, [r2+0]
 f1 27                 mov	r5, r3
 c9 d0                 addi.s8	r5, -0x30
 f1 75                 zext8	r5
 cd 0a                 cmpi.s8	r5, 0xa
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 d2 04                 brult8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x26f
<L16>:
 f0 0b d0              addi.s8	r3, -0x30
 f1 23                 mov	r4, r3
 a5                    xor	r5, r5
 f0 3c 11              stsp16	[sp+0x11], r4
 f0 3d 13              stsp16	[sp+0x13], r5
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 e3 00 00 00           callf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_udivsi3
 f4 aa                 inc16	r2
 f0 69 80              cmp32	q2, q0
 d2 04                 brult8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x16b
<L17>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 3e 15              stsp16	[sp+0x15], r6
 f0 3f 17              stsp16	[sp+0x17], r7
 ed 64 20              ld8u	r3, [r2+0]
 f1 27                 mov	r5, r3
 c9 d0                 addi.s8	r5, -0x30
 f1 75                 zext8	r5
 cd 0a                 cmpi.s8	r5, 0xa
 f2 63                 mov32	q0, q3
 d8 04                 bruge8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x19b
<L18>:
 f0 0f 6c              cmpi.s8	r3, 0x6c
 d9 04                 brsge8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x2a5
<L19>:
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x283
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
 f4 78                 stsp16	[sp+0xe], r4
 a5                    xor	r5, r5
 f0 2d 10              stsp8	[sp+0x10], r5
 cc ff                 cmpi.s8	r4, -0x1
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 d1 04                 brne8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x20b
<L20>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 69                 add32	q2, q1
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
 f0 01 01              ldi8	r1, 0x1
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x220
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
 f0 29 10              stsp8	[sp+0x10], r1
 f4 78                 stsp16	[sp+0xe], r4
 cc ff                 cmpi.s8	r4, -0x1
 d1 04                 brne8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x63
<L21>:
 f1 74                 zext8	r4
 e3 00 00 00           callf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	isspace
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x63
<L22>:
 f0 1c 10              ldsp8u	r4, [sp+0x10]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x24c
<L23>:
 f4 38                 ldsp16	r4, [sp+0xe]
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x255
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
 f4 78                 stsp16	[sp+0xe], r4
 a5                    xor	r5, r5
 f0 2d 10              stsp8	[sp+0x10], r5
 cc ff                 cmpi.s8	r4, -0x1
 d1 04                 brne8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x219
<L24>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 69                 add32	q2, q1
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x219
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 d1 04                 brne8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x89d
<L25>:
 f0 0f 6c              cmpi.s8	r3, 0x6c
 d9 04                 brsge8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x2a5
<L26>:
 f0 0f 77              cmpi.s8	r3, 0x77
 d3 04                 brslt8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x2c7
<L27>:
 f0 0f 6c              cmpi.s8	r3, 0x6c
 d1 04                 brne8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x343
<L28>:
 f0 0f 74              cmpi.s8	r3, 0x74
 d0 04                 breq8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x4cd
<L29>:
 f0 01 07              ldi8	r1, 0x7
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x361
 f0 0f 4c              cmpi.s8	r3, 0x4c
 d1 04                 brne8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x33c
<L30>:
 f0 0f 68              cmpi.s8	r3, 0x68
 d1 04                 brne8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x432
<L31>:
 f0 0f 6a              cmpi.s8	r3, 0x6a
 d0 04                 breq8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x492
<L32>:
 f0 01 05              ldi8	r1, 0x5
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x361
 f0 0f 7a              cmpi.s8	r3, 0x7a
 d1 04                 brne8	0x4 <L33>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x35e
<L33>:
 f0 0f 77              cmpi.s8	r3, 0x77
 d0 04                 breq8	0x4 <L34>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x4d5
<L34>:
 ed c4 21              ld8u	r6, [r2+1]
 f1 02                 mov	r0, r2
 f4 a8                 inc16	r0
 f1 22                 mov	r4, r2
 c8 02                 addi.s8	r4, 0x2
 ce 66                 cmpi.s8	r6, 0x66
 fb 04                 cmov.eq	r0, r4
 f0 01 01              ldi8	r1, 0x1
 c3 02                 ldi8	r7, 0x2
 f1 21                 mov	r4, r1
 fb 27                 cmov.eq	r4, r7
 f2 22                 add	r4, r2
 40                    ld8u	r4, [r4]
 c8 c6                 addi.s8	r4, -0x3a
 f1 74                 zext8	r4
 c1 f7                 ldi8	r5, 0xf7
 31                    cmp	r4, r5
 d8 04                 bruge8	0x4 <L35>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x8e4
<L35>:
 f0 3e 11              stsp16	[sp+0x11], r6
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 ed 40 20              ld8u	r2, [r0+0]
 f0 0a d0              addi.s8	r2, -0x30
 f1 2a                 mov	r6, r2
 f1 76                 zext8	r6
 ce 0a                 cmpi.s8	r6, 0xa
 d2 04                 brult8	0x4 <L36>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x49a
<L36>:
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 e3 00 00 00           callf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 4b                 sub	r3, r3
 c0 ff                 ldi8	r4, 0xff
 a5                    xor	r5, r5
 f9 88                 and	r4, r2
 f7 6b                 add32	q2, q3
 f4 a8                 inc16	r0
 c2 40                 ldi8	r6, 0x40
 af                    xor	r7, r7
 f0 69 c8              cmp32	q3, q2
 d2 04                 brult8	0x4 <L37>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x306
<L37>:
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x8de
 f0 01 08              ldi8	r1, 0x8
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x361
 f0 01 03              ldi8	r1, 0x3
 f0 29 1a              stsp8	[sp+0x1a], r1
 ed 84 21              ld8u	r4, [r2+1]
 cc 6c                 cmpi.s8	r4, 0x6c
 d0 04                 breq8	0x4 <L38>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x44d
<L38>:
 f0 01 04              ldi8	r1, 0x4
 f0 0a 02              addi.s8	r2, 0x2
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x363
 f0 01 06              ldi8	r1, 0x6
 f4 aa                 inc16	r2
 f1 02                 mov	r0, r2
 f0 29 1a              stsp8	[sp+0x1a], r1
 ed 80 20              ld8u	r4, [r0+0]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L39>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x89d
<L39>:
 f0 2c 1b              stsp8	[sp+0x1b], r4
 f1 28                 mov	r6, r0
 f4 ae                 inc16	r6
 cc 5b                 cmpi.s8	r4, 0x5b
 d0 04                 breq8	0x4 <L40>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x397
<L40>:
 46                    ld8u	r5, [r6]
 cd 5e                 cmpi.s8	r5, 0x5e
 f0 3e 2c              stsp16	[sp+0x2c], r6
 d0 04                 breq8	0x4 <L41>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x3b6
<L41>:
 c2 02                 ldi8	r6, 0x2
 ed a0 22              ld8u	r5, [r0+2]
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x3b8
 f1 06                 mov	r0, r6
 a5                    xor	r5, r5
 f1 15                 mov	r2, r5
 f0 3a 2c              stsp16	[sp+0x2c], r2
 cc 5b                 cmpi.s8	r4, 0x5b
 d0 04                 breq8	0x4 <L42>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x3e5
<L42>:
 08                    mov	r6, r4
 ca a8                 addi.s8	r6, -0x58
 ce 10                 cmpi.s8	r6, 0x10
 d8 04                 bruge8	0x4 <L43>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x5d3
<L43>:
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x593
 c2 01                 ldi8	r6, 0x1
 f2 06                 add	r0, r6
 cd 5d                 cmpi.s8	r5, 0x5d
 f8 02                 cset.eq	r2
 f2 10                 add	r2, r0
 ed a4 20              ld8u	r5, [r2+0]
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L44>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x89d
<L44>:
 cd 5d                 cmpi.s8	r5, 0x5d
 d1 04                 brne8	0x4 <L45>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x3d9
<L45>:
 f4 aa                 inc16	r2
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x3c0
 f1 02                 mov	r0, r2
 f4 a8                 inc16	r0
 cc 5b                 cmpi.s8	r4, 0x5b
 d1 04                 brne8	0x4 <L46>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x588
<L46>:
 cc 63                 cmpi.s8	r4, 0x63
 d1 04                 brne8	0x4 <L47>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x588
<L47>:
 cc 6e                 cmpi.s8	r4, 0x6e
 d0 04                 breq8	0x4 <L48>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x419
<L48>:
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 cc 2a                 cmpi.s8	r4, 0x2a
 d1 04                 brne8	0x4 <L49>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x634
<L49>:
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 d6 fe                 adjsp	-0x2
 f0 14 28              leasp	r4, 0x28
 f4 40                 stsp16	[sp+0x0], r4
 f1 71                 zext8	r1
 f1 21                 mov	r4, r1
 e3 00 00 00           callf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_count
 d6 02                 adjsp	0x2
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x634
 f0 1c 10              ldsp8u	r4, [sp+0x10]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L50>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x45d
<L50>:
 f4 38                 ldsp16	r4, [sp+0xe]
 cc ff                 cmpi.s8	r4, -0x1
 d1 04                 brne8	0x4 <L51>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x585
<L51>:
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x473
 f0 01 02              ldi8	r1, 0x2
 f0 29 1a              stsp8	[sp+0x1a], r1
 ed 84 21              ld8u	r4, [r2+1]
 cc 68                 cmpi.s8	r4, 0x68
 d0 04                 breq8	0x4 <L52>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x44d
<L52>:
 f0 01 01              ldi8	r1, 0x1
 f0 0a 02              addi.s8	r2, 0x2
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x363
 f4 aa                 inc16	r2
 f1 02                 mov	r0, r2
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L53>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x373
<L53>:
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x89d
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
 c1 01                 ldi8	r5, 0x1
 f0 2d 10              stsp8	[sp+0x10], r5
 f4 78                 stsp16	[sp+0xe], r4
 cc ff                 cmpi.s8	r4, -0x1
 d1 04                 brne8	0x4 <L54>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x585
<L54>:
 f1 74                 zext8	r4
 e3 00 00 00           callf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	isspace
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L55>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x585
<L55>:
 f0 1c 10              ldsp8u	r4, [sp+0x10]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L56>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x4fc
<L56>:
 f4 38                 ldsp16	r4, [sp+0xe]
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x505
 f2 39                 sub	r1, r1
 f1 02                 mov	r0, r2
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x368
 c2 1f                 ldi8	r6, 0x1f
 af                    xor	r7, r7
 f0 69 c8              cmp32	q3, q2
 d9 04                 brsge8	0x4 <L57>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x4dd
<L57>:
 c2 08                 ldi8	r6, 0x8
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d1 04                 brne8	0x4 <L58>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x365
<L58>:
 c2 10                 ldi8	r6, 0x10
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 04                 breq8	0x4 <L59>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x90a
<L59>:
 f0 34 11              ldsp16	r4, [sp+0x11]
 cc 66                 cmpi.s8	r4, 0x66
 f2 39                 sub	r1, r1
 c0 02                 ldi8	r4, 0x2
 fb 0c                 cmov.eq	r1, r4
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x365
 f2 39                 sub	r1, r1
 f1 02                 mov	r0, r2
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x368
 f2 39                 sub	r1, r1
 f1 02                 mov	r0, r2
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x368
 c2 20                 ldi8	r6, 0x20
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d1 04                 brne8	0x4 <L60>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x88f
<L60>:
 c2 40                 ldi8	r6, 0x40
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 04                 breq8	0x4 <L61>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x910
<L61>:
 f0 01 04              ldi8	r1, 0x4
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x365
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
 f4 78                 stsp16	[sp+0xe], r4
 a5                    xor	r5, r5
 f0 2d 10              stsp8	[sp+0x10], r5
 cc ff                 cmpi.s8	r4, -0x1
 d1 04                 brne8	0x4 <L62>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x51e
<L62>:
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f7 6e                 add32	q3, q2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
 f0 01 01              ldi8	r1, 0x1
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x533
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
 f0 29 10              stsp8	[sp+0x10], r1
 f4 78                 stsp16	[sp+0xe], r4
 cc ff                 cmpi.s8	r4, -0x1
 d1 04                 brne8	0x4 <L63>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x585
<L63>:
 f1 74                 zext8	r4
 e3 00 00 00           callf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	isspace
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L64>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x585
<L64>:
 f0 1c 10              ldsp8u	r4, [sp+0x10]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L65>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x55f
<L65>:
 f4 38                 ldsp16	r4, [sp+0xe]
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x568
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
 f4 78                 stsp16	[sp+0xe], r4
 a5                    xor	r5, r5
 f0 2d 10              stsp8	[sp+0x10], r5
 cc ff                 cmpi.s8	r4, -0x1
 d1 04                 brne8	0x4 <L66>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x52c
<L66>:
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f7 6e                 add32	q3, q2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x52c
 f0 1c 1b              ldsp8u	r4, [sp+0x1b]
 08                    mov	r6, r4
 ca a8                 addi.s8	r6, -0x58
 ce 10                 cmpi.s8	r6, 0x10
 d8 04                 bruge8	0x4 <L67>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x5d3
<L67>:
 04                    mov	r5, r4
 c9 97                 addi.s8	r5, -0x69
 cd 10                 cmpi.s8	r5, 0x10
 d2 04                 brult8	0x4 <L68>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x5b6
<L68>:
 c2 01                 ldi8	r6, 0x1
 fa 09                 shl16v	r6, r5
 c7 c1 90              ldi16	r7, 0x90c1
 8e                    and	r7, r6
 f6 2f                 tst16	r7
 d0 04                 breq8	0x4 <L69>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x5ef
<L69>:
 cd 0a                 cmpi.s8	r5, 0xa
 d1 04                 brne8	0x4 <L70>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x64f
<L70>:
 c8 bf                 addi.s8	r4, -0x41
 cc 07                 cmpi.s8	r4, 0x7
 d2 04                 brult8	0x4 <L71>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x904
<L71>:
 c1 01                 ldi8	r5, 0x1
 fa 04                 shl16v	r5, r4
 c0 71                 ldi8	r4, 0x71
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L72>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x8fe
<L72>:
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x60b
 c1 01                 ldi8	r5, 0x1
 fa 06                 shl16v	r5, r6
 c6 00 e2              ldi16	r6, 0xe200
 89                    and	r6, r5
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L73>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x60b
<L73>:
 c6 01 14              ldi16	r6, 0x1401
 89                    and	r6, r5
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L74>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x643
<L74>:
 f0 14 00              leasp	r4, 0x0
 f0 15 15              leasp	r5, 0x15
 f0 16 26              leasp	r6, 0x26
 e3 00 00 00           callf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_integer
 f1 0c                 mov	r1, r4
 f0 0d 01              cmpi.s8	r1, 0x1
 d0 04                 breq8	0x4 <L75>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x8a0
<L75>:
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x623
 f0 14 00              leasp	r4, 0x0
 f0 15 15              leasp	r5, 0x15
 f0 16 26              leasp	r6, 0x26
 e3 00 00 00           callf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_float
 f1 0c                 mov	r1, r4
 f0 0d 01              cmpi.s8	r1, 0x1
 d0 04                 breq8	0x4 <L76>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x8a0
<L76>:
 f0 1c 19              ldsp8u	r4, [sp+0x19]
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L77>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x634
<L77>:
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 ac                 inc16	r4
 f4 70                 stsp16	[sp+0xc], r4
 ed 20 20              ld8u	r1, [r0+0]
 f4 a1                 tst8	r1
 d0 04                 breq8	0x4 <L78>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x6e
<L78>:
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x89d
 c6 08 08              ldi16	r6, 0x808
 86                    and	r5, r6
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L79>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x593
<L79>:
 f0 35 20              ldsp16	r5, [sp+0x20]
 cd 0a                 cmpi.s8	r5, 0xa
 d8 04                 bruge8	0x4 <L80>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x675
<L80>:
 cc 63                 cmpi.s8	r4, 0x63
 d0 04                 breq8	0x4 <L81>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x675
<L81>:
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3d 24              stsp16	[sp+0x24], r5
 f0 3c 15              stsp16	[sp+0x15], r4
 f0 3d 17              stsp16	[sp+0x17], r5
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x681
 f0 34 15              ldsp16	r4, [sp+0x15]
 f0 35 17              ldsp16	r5, [sp+0x17]
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3d 24              stsp16	[sp+0x24], r5
 f0 1c 19              ldsp8u	r4, [sp+0x19]
 f4 a4                 tst8	r4
 a0                    xor	r4, r4
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3c 1e              stsp16	[sp+0x1e], r4
 d0 04                 breq8	0x4 <L82>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x6ae
<L82>:
 f0 34 26              ldsp16	r4, [sp+0x26]
 04                    mov	r5, r4
 c9 02                 addi.s8	r5, 0x2
 f0 3d 26              stsp16	[sp+0x26], r5
 68                    ld16	r6, [r4]
 f0 1c 1a              ldsp8u	r4, [sp+0x1a]
 cc 03                 cmpi.s8	r4, 0x3
 a0                    xor	r4, r4
 04                    mov	r5, r4
 fb 2e                 cmov.eq	r5, r6
 f0 3d 1e              stsp16	[sp+0x1e], r5
 fb 34                 cmov.eq	r6, r4
 f0 3e 20              stsp16	[sp+0x20], r6
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 35 24              ldsp16	r5, [sp+0x24]
 f0 69 8c              cmp32	q2, q3
 d1 04                 brne8	0x4 <L83>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x8ea
<L83>:
 c0 01                 ldi8	r4, 0x1
 f0 3c 28              stsp16	[sp+0x28], r4
 f2 4b                 sub	r3, r3
 f0 3b 11              stsp16	[sp+0x11], r3
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x6f1
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 35 24              ldsp16	r5, [sp+0x24]
 f7 6b                 add32	q2, q3
 c2 01                 ldi8	r6, 0x1
 f0 3e 11              stsp16	[sp+0x11], r6
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3d 24              stsp16	[sp+0x24], r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 f0 39 1e              stsp16	[sp+0x1e], r1
 f0 3b 20              stsp16	[sp+0x20], r3
 d1 04                 brne8	0x4 <L84>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x868
<L84>:
 f0 1c 10              ldsp8u	r4, [sp+0x10]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L85>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x703
<L85>:
 f0 31 0e              ldsp16	r1, [sp+0xe]
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x714
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
 f1 0c                 mov	r1, r4
 c0 01                 ldi8	r4, 0x1
 f0 2c 10              stsp8	[sp+0x10], r4
 f0 39 0e              stsp16	[sp+0xe], r1
 f0 1c 1b              ldsp8u	r4, [sp+0x1b]
 f0 0d ff              cmpi.s8	r1, -0x1
 d1 04                 brne8	0x4 <L86>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x83d
<L86>:
 cc 73                 cmpi.s8	r4, 0x73
 d0 04                 breq8	0x4 <L87>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x73b
<L87>:
 f1 21                 mov	r4, r1
 f1 74                 zext8	r4
 e3 00 00 00           callf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	isspace
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L88>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x857
<L88>:
 f0 1c 1b              ldsp8u	r4, [sp+0x1b]
 cc 5b                 cmpi.s8	r4, 0x5b
 d0 04                 breq8	0x4 <L89>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x7d2
<L89>:
 f0 33 2c              ldsp16	r3, [sp+0x2c]
 ed 86 20              ld8u	r4, [r3+0]
 cc 5e                 cmpi.s8	r4, 0x5e
 f8 05                 cset.eq	r5
 f2 1d                 add	r3, r5
 f5 1a                 cmp	r3, r2
 d1 04                 brne8	0x4 <L90>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x7ca
<L90>:
 f0 3d 2a              stsp16	[sp+0x2a], r5
 aa                    xor	r6, r6
 f1 2f                 mov	r7, r3
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x773
 f5 0c                 cmp	r1, r4
 f8 04                 cset.eq	r4
 f1 1f                 mov	r3, r7
 c1 01                 ldi8	r5, 0x1
 84                    and	r5, r4
 99                    or	r6, r5
 f5 2e                 cmp	r7, r2
 d1 04                 brne8	0x4 <L91>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x7bc
<L91>:
 f7 1c                 ld8u	r4, [r7+]
 f1 27                 mov	r5, r3
 c9 02                 addi.s8	r5, 0x2
 f5 26                 cmp	r5, r2
 d2 04                 brult8	0x4 <L92>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x761
<L92>:
 f0 3b 11              stsp16	[sp+0x11], r3
 f1 1a                 mov	r3, r2
 f1 11                 mov	r2, r1
 f5 3d                 ld8u	r1, [r7]
 f0 0d 2d              cmpi.s8	r1, 0x2d
 f1 0a                 mov	r1, r2
 f1 13                 mov	r2, r3
 f0 33 11              ldsp16	r3, [sp+0x11]
 d0 04                 breq8	0x4 <L93>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x761
<L93>:
 45                    ld8u	r5, [r5]
 34                    cmp	r5, r4
 d8 04                 bruge8	0x4 <L94>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x761
<L94>:
 f5 25                 cmp	r5, r1
 f8 2d                 cset.sge	r5
 f5 0c                 cmp	r1, r4
 f8 2c                 cset.sge	r4
 81                    and	r4, r5
 f0 0b 03              addi.s8	r3, 0x3
 f1 2f                 mov	r7, r3
 c1 01                 ldi8	r5, 0x1
 84                    and	r5, r4
 99                    or	r6, r5
 f5 2e                 cmp	r7, r2
 d0 04                 breq8	0x4 <L95>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x773
<L95>:
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 38                    cmp	r6, r4
 d1 04                 brne8	0x4 <L96>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x857
<L96>:
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x7d2
 cc 5e                 cmpi.s8	r4, 0x5e
 d0 04                 breq8	0x4 <L97>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x857
<L97>:
 f0 1c 10              ldsp8u	r4, [sp+0x10]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L98>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x7e3
<L98>:
 f4 38                 ldsp16	r4, [sp+0xe]
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x7ec
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
 f4 78                 stsp16	[sp+0xe], r4
 f0 39 11              stsp16	[sp+0x11], r1
 a5                    xor	r5, r5
 f0 3d 28              stsp16	[sp+0x28], r5
 f0 2d 10              stsp8	[sp+0x10], r5
 cc ff                 cmpi.s8	r4, -0x1
 d1 04                 brne8	0x4 <L99>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x80b
<L99>:
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f7 6e                 add32	q3, q2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 34 20              ldsp16	r4, [sp+0x20]
 f6 2c                 tst16	r4
 f2 4b                 sub	r3, r3
 d1 04                 brne8	0x4 <L100>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x81f
<L100>:
 f0 35 11              ldsp16	r5, [sp+0x11]
 f6 05                 st8	[r4+], r5
 f1 1c                 mov	r3, r4
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f6 2c                 tst16	r4
 f2 39                 sub	r1, r1
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 d1 04                 brne8	0x4 <L101>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x6cd
<L101>:
 f0 35 11              ldsp16	r5, [sp+0x11]
 f6 05                 st8	[r4+], r5
 f1 0c                 mov	r1, r4
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x6cd
 cc 63                 cmpi.s8	r4, 0x63
 f8 0c                 cset.ne	r4
 f0 35 11              ldsp16	r5, [sp+0x11]
 84                    and	r5, r4
 f4 a5                 tst8	r5
 f0 33 20              ldsp16	r3, [sp+0x20]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 d1 04                 brne8	0x4 <L102>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x8f0
<L102>:
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x873
 f0 34 28              ldsp16	r4, [sp+0x28]
 f4 a4                 tst8	r4
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 f0 33 20              ldsp16	r3, [sp+0x20]
 d0 04                 breq8	0x4 <L103>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x8f8
<L103>:
 f0 1e 1b              ldsp8u	r6, [sp+0x1b]
 ce 63                 cmpi.s8	r6, 0x63
 d1 04                 brne8	0x4 <L104>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x623
<L104>:
 f6 2b                 tst16	r3
 d1 04                 brne8	0x4 <L105>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x87f
<L105>:
 aa                    xor	r6, r6
 ee c6 20              st8	[r3+0], r6
 f6 29                 tst16	r1
 d1 04                 brne8	0x4 <L106>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x623
<L106>:
 a0                    xor	r4, r4
 ee 82 20              st8	[r1+0], r4
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x623
 f0 01 03              ldi8	r1, 0x3
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x365
 f0 01 01              ldi8	r1, 0x1
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x8a0
 f0 01 01              ldi8	r1, 0x1
 f0 1c 10              ldsp8u	r4, [sp+0x10]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L107>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x8bc
<L107>:
 f4 39                 ldsp16	r5, [sp+0xe]
 cd ff                 cmpi.s8	r5, -0x1
 d1 04                 brne8	0x4 <L108>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_FAR24	.text.__avm_vscan+0x8bc
<L108>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 16                 ldsp16	r6, [sp+0x5]
 f3 5f                 ldsp8u	r7, [sp+0x7]
 eb                    callp	q3
 f4 31                 ldsp16	r5, [sp+0xc]
 c4 ff ff              ldi16	r4, 0xffff
 f6 2d                 tst16	r5
 fb 65                 cmov.ne	r4, r5
 f0 0d ff              cmpi.s8	r1, -0x1
 fb 65                 cmov.ne	r4, r5
 d6 2e                 adjsp	0x2e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 cc ff                 cmpi.s8	r4, -0x1
 f2 39                 sub	r1, r1
 c4 ff ff              ldi16	r4, 0xffff
 fb 0c                 cmov.eq	r1, r4
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x8ab
 f2 39                 sub	r1, r1
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x8a0
 f2 39                 sub	r1, r1
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x8a0
 f2 39                 sub	r1, r1
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x8a0
 f0 05 ff ff           ldi16	r1, 0xffff
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x8a0
 f2 39                 sub	r1, r1
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x8a0
 f2 39                 sub	r1, r1
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x8a0
 f2 39                 sub	r1, r1
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x8a0
 f2 39                 sub	r1, r1
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x8a0
 f2 39                 sub	r1, r1
 e2 00 00 00           jmpf	__avm_vscan
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_vscan+0x8a0
