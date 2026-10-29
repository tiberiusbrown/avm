
stdio_scan_integer.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 stdio_scan_integer.c
00000000 l    d  .text.__avm_scan_count	00000000 .text.__avm_scan_count
00000000 l    d  .text.__avm_scan_integer	00000000 .text.__avm_scan_integer
00000000 g     F .text.__avm_scan_count	00000073 __avm_scan_count
00000000 g     F .text.__avm_scan_integer	0000076c __avm_scan_integer
00000000         *UND*	00000000 __avm_scan_peek
00000000         *UND*	00000000 __avm_scan_take
00000000         *UND*	00000000 __avm_lshrdi3
00000000         *UND*	00000000 __avm_mulsi3

Disassembly of section .text.__avm_scan_count:

<__avm_scan_count>:
 b0                    push16	r0
 f4 15                 ldsp16	r5, [sp+0x5]
 cc 04                 cmpi.s8	r4, 0x4
 d3 04                 brslt8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_count
		R_AVM_FAR24	.text.__avm_scan_count+0x31
<L0>:
 cc 01                 cmpi.s8	r4, 0x1
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_count
		R_AVM_FAR24	.text.__avm_scan_count+0x66
<L1>:
 cc 02                 cmpi.s8	r4, 0x2
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_count
		R_AVM_FAR24	.text.__avm_scan_count+0x43
<L2>:
 cc 03                 cmpi.s8	r4, 0x3
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_count
		R_AVM_FAR24	.text.__avm_scan_count+0x43
<L3>:
 f5 44                 ld16	r0, [r5]
 f1 20                 mov	r4, r0
 c8 02                 addi.s8	r4, 0x2
 74                    st16	[r5], r4
 ed 90 20              ld16	r4, [r0+0]
 e2 00 00 00           jmpf	__avm_scan_count
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_count+0x61
 cc 04                 cmpi.s8	r4, 0x4
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_count
		R_AVM_FAR24	.text.__avm_scan_count+0x50
<L4>:
 cc 05                 cmpi.s8	r4, 0x5
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_count
		R_AVM_FAR24	.text.__avm_scan_count+0x50
<L5>:
 cc 07                 cmpi.s8	r4, 0x7
 f5 44                 ld16	r0, [r5]
 f1 20                 mov	r4, r0
 c8 02                 addi.s8	r4, 0x2
 74                    st16	[r5], r4
 ed 90 20              ld16	r4, [r0+0]
 72                    st16	[r4], r6
 b8                    pop16	r0
 ef                    ret
 f5 44                 ld16	r0, [r5]
 f1 20                 mov	r4, r0
 c8 02                 addi.s8	r4, 0x2
 74                    st16	[r5], r4
 ed 90 20              ld16	r4, [r0+0]
 f0 6b c8              st32	[r4], q3
 c8 04                 addi.s8	r4, 0x4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 6b c8              st32	[r4], q3
 b8                    pop16	r0
 ef                    ret
 f5 44                 ld16	r0, [r5]
 f1 20                 mov	r4, r0
 c8 02                 addi.s8	r4, 0x2
 74                    st16	[r5], r4
 ed 90 20              ld16	r4, [r0+0]
 52                    st8	[r4], r6
 b8                    pop16	r0
 ef                    ret

Disassembly of section .text.__avm_scan_integer:

<__avm_scan_integer>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ca                 adjsp	-0x36
 f0 3e 2a              stsp16	[sp+0x2a], r6
 f1 05                 mov	r0, r5
 f0 6a c0              ld32	q3, [r0]
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f4 60                 stsp16	[sp+0x8], r4
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 ed a0 26              ld8u	r5, [r0+6]
 cd 69                 cmpi.s8	r5, 0x69
 f8 01                 cset.eq	r1
 cd 64                 cmpi.s8	r5, 0x64
 f8 03                 cset.eq	r3
 f2 42                 sub	r2, r2
 c2 08                 ldi8	r6, 0x8
 cd 6f                 cmpi.s8	r5, 0x6f
 d9 04                 brsge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x52
<L0>:
 cd 6f                 cmpi.s8	r5, 0x6f
 f1 2e                 mov	r7, r2
 f0 3e 26              stsp16	[sp+0x26], r6
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x81
<L1>:
 cd 70                 cmpi.s8	r5, 0x70
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x74
<L2>:
 cd 78                 cmpi.s8	r5, 0x78
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x7a
<L3>:
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x74
 cd 58                 cmpi.s8	r5, 0x58
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x74
<L4>:
 cd 69                 cmpi.s8	r5, 0x69
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x7a
<L5>:
 af                    xor	r7, r7
 f0 3f 26              stsp16	[sp+0x26], r7
 c3 01                 ldi8	r7, 0x1
 cc ff                 cmpi.s8	r4, -0x1
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x674
<L6>:
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x89
 c2 10                 ldi8	r6, 0x10
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x7c
 c2 0a                 ldi8	r6, 0xa
 f1 2e                 mov	r7, r2
 f0 3e 26              stsp16	[sp+0x26], r6
 cc ff                 cmpi.s8	r4, -0x1
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x674
<L7>:
 f0 3f 28              stsp16	[sp+0x28], r7
 f0 3d 2e              stsp16	[sp+0x2e], r5
 cc 2d                 cmpi.s8	r4, 0x2d
 f0 38 34              stsp16	[sp+0x34], r0
 f4 52                 stsp16	[sp+0x4], r6
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0xa4
<L8>:
 cc 2b                 cmpi.s8	r4, 0x2b
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0xc8
<L9>:
 f1 04                 mov	r0, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f7 6e                 add32	q3, q2
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f0 0c 2d              cmpi.s8	r0, 0x2d
 f0 30 34              ldsp16	r0, [sp+0x34]
 f8 02                 cset.eq	r2
 f9 65                 or	r3, r1
 ed 80 25              ld8u	r4, [r0+5]
 cc 04                 cmpi.s8	r4, 0x4
 f0 00 01              ldi8	r0, 0x1
 f0 3a 2c              stsp16	[sp+0x2c], r2
 d3 04                 brslt8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x10d
<L10>:
 cc 01                 cmpi.s8	r4, 0x1
 d1 04                 brne8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x13f
<L11>:
 cc 02                 cmpi.s8	r4, 0x2
 d1 04                 brne8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x157
<L12>:
 cc 03                 cmpi.s8	r4, 0x3
 d0 04                 breq8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x171
<L13>:
 c0 01                 ldi8	r4, 0x1
 f9 8c                 and	r4, r3
 c7 ff 7f              ldi16	r7, 0x7fff
 f4 a4                 tst8	r4
 c6 ff ff              ldi16	r6, 0xffff
 02                    mov	r4, r6
 fb 67                 cmov.ne	r4, r7
 0c                    mov	r7, r4
 f1 27                 mov	r5, r3
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x187
 c8 fc                 addi.s8	r4, -0x4
 cc 02                 cmpi.s8	r4, 0x2
 d2 04                 brult8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x171
<L14>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f1 23                 mov	r4, r3
 f9 80                 and	r4, r0
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f4 a4                 tst8	r4
 f0 04 ff ff           ldi16	r0, 0xffff
 f1 20                 mov	r4, r0
 fb 61                 cmov.ne	r4, r1
 f1 27                 mov	r5, r3
 f0 38 00              stsp16	[sp+0x0], r0
 f0 3c 02              stsp16	[sp+0x2], r4
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x18d
 c0 01                 ldi8	r4, 0x1
 f9 8c                 and	r4, r3
 c3 ff                 ldi8	r7, 0xff
 c2 7f                 ldi8	r6, 0x7f
 f4 a4                 tst8	r4
 fb 7e                 cmov.ne	r7, r6
 0b                    mov	r6, r7
 af                    xor	r7, r7
 f1 27                 mov	r5, r3
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x187
 c0 01                 ldi8	r4, 0x1
 f9 8c                 and	r4, r3
 c6 ff 7f              ldi16	r6, 0x7fff
 f4 a4                 tst8	r4
 c4 ff ff              ldi16	r4, 0xffff
 fb 66                 cmov.ne	r4, r6
 08                    mov	r6, r4
 af                    xor	r7, r7
 f1 27                 mov	r5, r3
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x187
 f1 23                 mov	r4, r3
 f9 80                 and	r4, r0
 c6 ff 7f              ldi16	r6, 0x7fff
 f4 a4                 tst8	r4
 c4 ff ff              ldi16	r4, 0xffff
 fb 66                 cmov.ne	r4, r6
 08                    mov	r6, r4
 af                    xor	r7, r7
 f1 27                 mov	r5, r3
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 f6 2c                 tst16	r4
 f8 0b                 cset.ne	r3
 f4 69                 stsp16	[sp+0xa], r5
 f9 74                 and	r3, r5
 f1 23                 mov	r4, r3
 a5                    xor	r5, r5
 f7 6b                 add32	q2, q3
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 69 8c              cmp32	q2, q3
 f8 16                 cset.ult	r6
 02                    mov	r4, r6
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f7 6b                 add32	q2, q3
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 69 80              cmp32	q2, q0
 f0 32 04              ldsp16	r2, [sp+0x4]
 d1 04                 brne8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x25c
<L15>:
 f4 20                 ldsp16	r4, [sp+0x8]
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 cc 30                 cmpi.s8	r4, 0x30
 d0 04                 breq8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x25c
<L16>:
 f4 20                 ldsp16	r4, [sp+0x8]
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f7 62                 add32	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d1 04                 brne8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x340
<L17>:
 f0 0e 10              cmpi.s8	r2, 0x10
 f0 03 01              ldi8	r3, 0x1
 d1 04                 brne8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x20c
<L18>:
 f0 0e 08              cmpi.s8	r2, 0x8
 d0 04                 breq8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x272
<L19>:
 f0 34 34              ldsp16	r4, [sp+0x34]
 ed 88 26              ld8u	r4, [r4+6]
 cc 6f                 cmpi.s8	r4, 0x6f
 d1 04                 brne8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x272
<L20>:
 f4 20                 ldsp16	r4, [sp+0x8]
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 cc 78                 cmpi.s8	r4, 0x78
 d1 04                 brne8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x236
<L21>:
 f4 20                 ldsp16	r4, [sp+0x8]
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 cc 58                 cmpi.s8	r4, 0x58
 d0 04                 breq8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x272
<L22>:
 f4 20                 ldsp16	r4, [sp+0x8]
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c4 fe ff              ldi16	r4, 0xfffe
 c5 ff ff              ldi16	r5, 0xffff
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f7 6e                 add32	q3, q2
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 c0 04                 ldi8	r4, 0x4
 a5                    xor	r5, r5
 f0 02 10              ldi8	r2, 0x10
 f2 4b                 sub	r3, r3
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x356
 f2 4b                 sub	r3, r3
 f0 34 28              ldsp16	r4, [sp+0x28]
 f4 a4                 tst8	r4
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 f0 32 26              ldsp16	r2, [sp+0x26]
 d0 04                 breq8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x28a
<L23>:
 f0 0e 08              cmpi.s8	r2, 0x8
 d1 04                 brne8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x34e
<L24>:
 f0 0e 0a              cmpi.s8	r2, 0xa
 d0 04                 breq8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x32c
<L25>:
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
 f0 34 34              ldsp16	r4, [sp+0x34]
 ed 88 25              ld8u	r4, [r4+5]
 cc 04                 cmpi.s8	r4, 0x4
 d3 04                 brslt8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x2e1
<L26>:
 cc 01                 cmpi.s8	r4, 0x1
 f0 30 0a              ldsp16	r0, [sp+0xa]
 d1 04                 brne8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x38a
<L27>:
 cc 02                 cmpi.s8	r4, 0x2
 d1 04                 brne8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x332
<L28>:
 cc 03                 cmpi.s8	r4, 0x3
 d0 04                 breq8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x332
<L29>:
 c0 01                 ldi8	r4, 0x1
 f9 80                 and	r4, r0
 f1 27                 mov	r5, r3
 f0 06 99 99           ldi16	r2, 0x9999
 f0 07 99 19           ldi16	r3, 0x1999
 c6 cc cc              ldi16	r6, 0xcccc
 c7 cc 0c              ldi16	r7, 0xccc
 f4 a4                 tst8	r4
 fb 56                 cmov.ne	r2, r6
 fb 5f                 cmov.ne	r3, r7
 f0 3a 0e              stsp16	[sp+0xe], r2
 f0 3b 10              stsp16	[sp+0x10], r3
 f1 1d                 mov	r3, r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 30              stsp16	[sp+0x30], r4
 f0 3d 32              stsp16	[sp+0x32], r5
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x3a5
 c8 fc                 addi.s8	r4, -0x4
 cc 02                 cmpi.s8	r4, 0x2
 f0 30 0a              ldsp16	r0, [sp+0xa]
 d2 04                 brult8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x332
<L30>:
 c0 01                 ldi8	r4, 0x1
 f9 80                 and	r4, r0
 c6 99 99              ldi16	r6, 0x9999
 c7 99 19              ldi16	r7, 0x1999
 f1 0b                 mov	r1, r3
 f0 06 cc cc           ldi16	r2, 0xcccc
 f0 07 cc 0c           ldi16	r3, 0xccc
 f4 a4                 tst8	r4
 fb 72                 cmov.ne	r6, r2
 fb 7b                 cmov.ne	r7, r3
 f0 3e 30              stsp16	[sp+0x30], r6
 f0 3f 32              stsp16	[sp+0x32], r7
 f0 06 99 99           ldi16	r2, 0x9999
 f0 07 99 99           ldi16	r3, 0x9999
 c4 cc cc              ldi16	r4, 0xcccc
 c5 cc cc              ldi16	r5, 0xcccc
 fb 54                 cmov.ne	r2, r4
 fb 5d                 cmov.ne	r3, r5
 f0 3a 0e              stsp16	[sp+0xe], r2
 f0 3b 10              stsp16	[sp+0x10], r3
 f1 19                 mov	r3, r1
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x3a5
 c0 04                 ldi8	r4, 0x4
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x350
 c0 01                 ldi8	r4, 0x1
 f9 80                 and	r4, r0
 c5 99 19              ldi16	r5, 0x1999
 c6 cc 0c              ldi16	r6, 0xccc
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x392
 f2 62                 mov32	q0, q2
 f0 03 01              ldi8	r3, 0x1
 f0 0e 08              cmpi.s8	r2, 0x8
 d0 04                 breq8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x27b
<L31>:
 c0 03                 ldi8	r4, 0x3
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 f2 68                 mov32	q2, q0
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_lshrdi3
 d6 02                 adjsp	0x2
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 3e 30              stsp16	[sp+0x30], r6
 f0 3f 32              stsp16	[sp+0x32], r7
 f1 22                 mov	r4, r2
 f4 b4                 dec16	r4
 f9 80                 and	r4, r0
 f0 3c 1a              stsp16	[sp+0x1a], r4
 a0                    xor	r4, r4
 f0 3c 24              stsp16	[sp+0x24], r4
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x3bf
 c0 01                 ldi8	r4, 0x1
 f9 80                 and	r4, r0
 c1 19                 ldi8	r5, 0x19
 c2 0c                 ldi8	r6, 0xc
 f4 a4                 tst8	r4
 fb 6e                 cmov.ne	r5, r6
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 3e 30              stsp16	[sp+0x30], r6
 f0 3f 32              stsp16	[sp+0x32], r7
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 c0 01                 ldi8	r4, 0x1
 f0 3c 24              stsp16	[sp+0x24], r4
 f9 10                 and	r0, r4
 f0 31 2c              ldsp16	r1, [sp+0x2c]
 f1 21                 mov	r4, r1
 c8 07                 addi.s8	r4, 0x7
 c1 05                 ldi8	r5, 0x5
 f4 a0                 tst8	r0
 fb 6c                 cmov.ne	r5, r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 02 0a              ldi8	r2, 0xa
 f4 a3                 tst8	r3
 f8 01                 cset.eq	r1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 69 8c              cmp32	q2, q3
 d1 04                 brne8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x601
<L32>:
 f2 30                 sub	r0, r0
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 f0 3a 26              stsp16	[sp+0x26], r2
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x40f
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f1 06                 mov	r0, r6
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 39                 sub	r1, r1
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 f0 69 48              cmp32	q1, q2
 f0 32 26              ldsp16	r2, [sp+0x26]
 d1 04                 brne8	0x4 <L33>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x60d
<L33>:
 f0 38 20              stsp16	[sp+0x20], r0
 f4 20                 ldsp16	r4, [sp+0x8]
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f1 04                 mov	r0, r4
 f0 08 d0              addi.s8	r0, -0x30
 f0 0c 0a              cmpi.s8	r0, 0xa
 d8 04                 bruge8	0x4 <L34>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x436
<L34>:
 c1 20                 ldi8	r5, 0x20
 91                    or	r4, r5
 04                    mov	r5, r4
 c9 9f                 addi.s8	r5, -0x61
 c8 a9                 addi.s8	r4, -0x57
 cd 06                 cmpi.s8	r5, 0x6
 f0 04 ff ff           ldi16	r0, 0xffff
 fc 04                 cmov.ult	r0, r4
 f6 28                 tst16	r0
 d9 04                 brsge8	0x4 <L35>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x644
<L35>:
 f5 02                 cmp	r0, r2
 d3 04                 brslt8	0x4 <L36>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x644
<L36>:
 f0 38 28              stsp16	[sp+0x28], r0
 f4 20                 ldsp16	r4, [sp+0x8]
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 69 8c              cmp32	q2, q3
 f8 16                 cset.ult	r6
 f0 30 30              ldsp16	r0, [sp+0x30]
 f0 31 32              ldsp16	r1, [sp+0x32]
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f0 69 08              cmp32	q0, q2
 f8 17                 cset.ult	r7
 f0 69 80              cmp32	q2, q0
 fb 3e                 cmov.eq	r7, r6
 f4 43                 stsp16	[sp+0x0], r7
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 f7 67                 add32	q1, q3
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 3b 1e              stsp16	[sp+0x1e], r3
 c2 01                 ldi8	r6, 0x1
 f4 03                 ldsp16	r7, [sp+0x0]
 f4 a7                 tst8	r7
 d0 04                 breq8	0x4 <L37>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x3e5
<L37>:
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 f9 ca                 xor	r6, r2
 f9 ee                 xor	r7, r3
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 f8 0d                 cset.ne	r5
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 32 28              ldsp16	r2, [sp+0x28]
 f5 22                 cmp	r4, r2
 f8 1e                 cset.uge	r6
 f0 34 20              ldsp16	r4, [sp+0x20]
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L38>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x567
<L38>:
 96                    or	r5, r6
 c2 01                 ldi8	r6, 0x1
 89                    and	r6, r5
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L39>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x550
<L39>:
 f0 34 24              ldsp16	r4, [sp+0x24]
 f4 a4                 tst8	r4
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 03                    mov	r4, r7
 a5                    xor	r5, r5
 d1 04                 brne8	0x4 <L40>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x57e
<L40>:
 f0 00 0a              ldi8	r0, 0xa
 f2 39                 sub	r1, r1
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 08                    mov	r6, r4
 fa 9d                 lsr16i	r6, 0xd
 02                    mov	r4, r6
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 fa 9f                 lsr16i	r6, 0xf
 f1 16                 mov	r2, r6
 f2 4b                 sub	r3, r3
 f7 66                 add32	q1, q2
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f7 66                 add32	q1, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 10                    add	r4, r4
 10                    add	r4, r4
 10                    add	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 08                    mov	r6, r4
 fa 9d                 lsr16i	r6, 0xd
 f4 6a                 stsp16	[sp+0xa], r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 2b                 ldsp16	r7, [sp+0xa]
 9e                    or	r7, r6
 f4 6b                 stsp16	[sp+0xa], r7
 0c                    mov	r7, r4
 1f                    add	r7, r7
 1f                    add	r7, r7
 1f                    add	r7, r7
 f4 2a                 ldsp16	r6, [sp+0xa]
 ab                    xor	r6, r7
 ae                    xor	r7, r6
 ab                    xor	r6, r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 8c              cmp32	q2, q3
 f8 16                 cset.ult	r6
 f1 06                 mov	r0, r6
 f7 61                 add32	q0, q1
 f0 32 28              ldsp16	r2, [sp+0x28]
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x5e2
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 f0 00 01              ldi8	r0, 0x1
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x3f9
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 f0 00 01              ldi8	r0, 0x1
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x3f9
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 26              ldsp16	r4, [sp+0x26]
 cc 08                 cmpi.s8	r4, 0x8
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 a5                    xor	r5, r5
 f0 3f 20              stsp16	[sp+0x20], r7
 f0 3d 22              stsp16	[sp+0x22], r5
 d0 04                 breq8	0x4 <L41>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x5c0
<L41>:
 f4 00                 ldsp16	r4, [sp+0x0]
 fa 7d                 lsr16i	r4, 0xd
 0e                    mov	r7, r6
 1f                    add	r7, r7
 1f                    add	r7, r7
 1f                    add	r7, r7
 9c                    or	r7, r4
 fa 9d                 lsr16i	r6, 0xd
 f0 34 20              ldsp16	r4, [sp+0x20]
 10                    add	r4, r4
 10                    add	r4, r4
 10                    add	r4, r4
 92                    or	r4, r6
 f1 07                 mov	r0, r7
 f1 0c                 mov	r1, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 10                    add	r4, r4
 10                    add	r4, r4
 10                    add	r4, r4
 f4 12                 ldsp16	r6, [sp+0x4]
 0e                    mov	r7, r6
 fa ad                 lsr16i	r7, 0xd
 9c                    or	r7, r4
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x5e0
 f4 00                 ldsp16	r4, [sp+0x0]
 fa 7c                 lsr16i	r4, 0xc
 0e                    mov	r7, r6
 fa 64                 lsl16i	r7, 0x4
 9c                    or	r7, r4
 fa 9c                 lsr16i	r6, 0xc
 f0 34 20              ldsp16	r4, [sp+0x20]
 fa 34                 lsl16i	r4, 0x4
 92                    or	r4, r6
 f1 07                 mov	r0, r7
 f1 0c                 mov	r1, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 fa 34                 lsl16i	r4, 0x4
 f4 12                 ldsp16	r6, [sp+0x4]
 0e                    mov	r7, r6
 fa ac                 lsr16i	r7, 0xc
 9c                    or	r7, r4
 fa 54                 lsl16i	r6, 0x4
 02                    mov	r4, r6
 07                    mov	r5, r7
 f1 2a                 mov	r6, r2
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f0 69 c8              cmp32	q3, q2
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f2 30                 sub	r0, r0
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x3f7
 f4 a3                 tst8	r3
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 d1 04                 brne8	0x4 <L42>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x673
<L42>:
 c0 01                 ldi8	r4, 0x1
 f0 30 34              ldsp16	r0, [sp+0x34]
 ed a0 24              ld8u	r5, [r0+4]
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L43>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x674
<L43>:
 ed a0 26              ld8u	r5, [r0+6]
 cd 70                 cmpi.s8	r5, 0x70
 d0 04                 breq8	0x4 <L44>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x67b
<L44>:
 f0 37 2a              ldsp16	r7, [sp+0x2a]
 67                    ld16	r5, [r7]
 09                    mov	r6, r5
 ca 02                 addi.s8	r6, 0x2
 7e                    st16	[r7], r6
 aa                    xor	r6, r6
 f0 30 00              ldsp16	r0, [sp+0x0]
 f2 58                 sub	r6, r0
 f0 37 2c              ldsp16	r7, [sp+0x2c]
 f6 2f                 tst16	r7
 fb 46                 cmov.ne	r0, r6
 65                    ld16	r5, [r5]
 f5 54                 st16	[r5], r0
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x674
 f0 34 20              ldsp16	r4, [sp+0x20]
 f6 2c                 tst16	r4
 f0 32 16              ldsp16	r2, [sp+0x16]
 f0 33 18              ldsp16	r3, [sp+0x18]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 fb 16                 cmov.eq	r2, r6
 fb 1f                 cmov.eq	r3, r7
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 fb 34                 cmov.eq	r6, r4
 fb 3d                 cmov.eq	r7, r5
 f4 a1                 tst8	r1
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 d1 04                 brne8	0x4 <L45>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x60d
<L45>:
 a0                    xor	r4, r4
 d6 36                 adjsp	0x36
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f7 74                 sub32	q1, q0
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 f6 2d                 tst16	r5
 fb 10                 cmov.eq	r2, r0
 fb 19                 cmov.eq	r3, r1
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 3b 1e              stsp16	[sp+0x1e], r3
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 f2 61                 mov32	q0, q1
 f8 0d                 cset.ne	r5
 f1 15                 mov	r2, r5
 f7 67                 add32	q1, q3
 f7 71                 sub32	q0, q1
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 f6 2d                 tst16	r5
 fb 06                 cmov.eq	r0, r6
 fb 0f                 cmov.eq	r1, r7
 f0 35 34              ldsp16	r5, [sp+0x34]
 ed aa 25              ld8u	r5, [r5+5]
 f0 36 2e              ldsp16	r6, [sp+0x2e]
 ce 69                 cmpi.s8	r6, 0x69
 d1 04                 brne8	0x4 <L46>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x6c9
<L46>:
 ce 64                 cmpi.s8	r6, 0x64
 d0 04                 breq8	0x4 <L47>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x6ea
<L47>:
 cd 04                 cmpi.s8	r5, 0x4
 d9 04                 brsge8	0x4 <L48>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x6f2
<L48>:
 cd 04                 cmpi.s8	r5, 0x4
 f0 37 2a              ldsp16	r7, [sp+0x2a]
 d1 04                 brne8	0x4 <L49>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x746
<L49>:
 cd 05                 cmpi.s8	r5, 0x5
 d1 04                 brne8	0x4 <L50>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x746
<L50>:
 cd 07                 cmpi.s8	r5, 0x7
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x735
 cd 04                 cmpi.s8	r5, 0x4
 d3 04                 brslt8	0x4 <L51>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x720
<L51>:
 cd 01                 cmpi.s8	r5, 0x1
 f0 37 2a              ldsp16	r7, [sp+0x2a]
 d1 04                 brne8	0x4 <L52>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x75e
<L52>:
 cd 02                 cmpi.s8	r5, 0x2
 d1 04                 brne8	0x4 <L53>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x735
<L53>:
 cd 03                 cmpi.s8	r5, 0x3
 d0 04                 breq8	0x4 <L54>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x735
<L54>:
 67                    ld16	r5, [r7]
 09                    mov	r6, r5
 ca 02                 addi.s8	r6, 0x2
 7e                    st16	[r7], r6
 65                    ld16	r5, [r5]
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f0 6b ca              st32	[r5], q3
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x674
 cd 04                 cmpi.s8	r5, 0x4
 f0 37 2a              ldsp16	r7, [sp+0x2a]
 d1 04                 brne8	0x4 <L55>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x746
<L55>:
 cd 05                 cmpi.s8	r5, 0x5
 d1 04                 brne8	0x4 <L56>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x746
<L56>:
 cd 06                 cmpi.s8	r5, 0x6
 67                    ld16	r5, [r7]
 09                    mov	r6, r5
 ca 02                 addi.s8	r6, 0x2
 7e                    st16	[r7], r6
 65                    ld16	r5, [r5]
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 76                    st16	[r5], r6
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x674
 67                    ld16	r5, [r7]
 09                    mov	r6, r5
 ca 02                 addi.s8	r6, 0x2
 7e                    st16	[r7], r6
 65                    ld16	r5, [r5]
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f0 6b ca              st32	[r5], q3
 c9 04                 addi.s8	r5, 0x4
 f0 6b 0a              st32	[r5], q0
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x674
 67                    ld16	r5, [r7]
 09                    mov	r6, r5
 ca 02                 addi.s8	r6, 0x2
 7e                    st16	[r7], r6
 65                    ld16	r5, [r5]
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 56                    st8	[r5], r6
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x674
