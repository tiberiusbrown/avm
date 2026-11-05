
stdio_scan_integer.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 stdio_scan_integer.c
00000000 l    d  .text.__avm_scan_count	00000000 .text.__avm_scan_count
00000000 l    d  .text.__avm_scan_integer	00000000 .text.__avm_scan_integer
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.__avm_scan_count	00000073 __avm_scan_count
00000000 g     F .text.__avm_scan_integer	000007fb __avm_scan_integer
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
 f1 14                 mov	r2, r4
 f0 6a 80              ld32	q2, [r0]
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 ed a0 26              ld8u	r5, [r0+6]
 cd 69                 cmpi.s8	r5, 0x69
 f8 01                 cset.eq	r1
 cd 64                 cmpi.s8	r5, 0x64
 f8 03                 cset.eq	r3
 aa                    xor	r6, r6
 f0 3e 24              stsp16	[sp+0x24], r6
 cd 6f                 cmpi.s8	r5, 0x6f
 d3 04                 brslt8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x60
<L0>:
 cd 58                 cmpi.s8	r5, 0x58
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x78
<L1>:
 cd 62                 cmpi.s8	r5, 0x62
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x13f
<L2>:
 cd 69                 cmpi.s8	r5, 0x69
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x84
<L3>:
 f0 3e 28              stsp16	[sp+0x28], r6
 c3 08                 ldi8	r7, 0x8
 c2 01                 ldi8	r6, 0x1
 f4 42                 stsp16	[sp+0x0], r6
 cc ff                 cmpi.s8	r4, -0x1
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x698
<L4>:
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x93
 cd 6f                 cmpi.s8	r5, 0x6f
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x7e
<L5>:
 cd 70                 cmpi.s8	r5, 0x70
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x78
<L6>:
 cd 78                 cmpi.s8	r5, 0x78
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x84
<L7>:
 c3 10                 ldi8	r7, 0x10
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x86
 c3 08                 ldi8	r7, 0x8
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x86
 c3 0a                 ldi8	r7, 0xa
 f4 42                 stsp16	[sp+0x0], r6
 f0 3f 28              stsp16	[sp+0x28], r7
 cc ff                 cmpi.s8	r4, -0x1
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x698
<L8>:
 f0 3e 14              stsp16	[sp+0x14], r6
 f4 73                 stsp16	[sp+0xc], r7
 f0 3a 2c              stsp16	[sp+0x2c], r2
 f0 3d 2e              stsp16	[sp+0x2e], r5
 cc 2d                 cmpi.s8	r4, 0x2d
 d1 04                 brne8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0xae
<L9>:
 cc 2b                 cmpi.s8	r4, 0x2b
 d0 04                 breq8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0xd3
<L10>:
 f1 14                 mov	r2, r4
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 f7 6e                 add32	q3, q2
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f0 3f 1c              stsp16	[sp+0x1c], r7
 f0 0e 2d              cmpi.s8	r2, 0x2d
 f8 04                 cset.eq	r4
 f0 3c 24              stsp16	[sp+0x24], r4
 f1 27                 mov	r5, r3
 f9 a5                 or	r5, r1
 f0 38 34              stsp16	[sp+0x34], r0
 ed c0 25              ld8u	r6, [r0+5]
 ce 04                 cmpi.s8	r6, 0x4
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f4 51                 stsp16	[sp+0x4], r5
 d3 04                 brslt8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x117
<L11>:
 ce 01                 cmpi.s8	r6, 0x1
 d1 04                 brne8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x14a
<L12>:
 ce 02                 cmpi.s8	r6, 0x2
 d1 04                 brne8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x15b
<L13>:
 ce 03                 cmpi.s8	r6, 0x3
 d0 04                 breq8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x16d
<L14>:
 c2 01                 ldi8	r6, 0x1
 89                    and	r6, r5
 c7 ff 7f              ldi16	r7, 0x7fff
 f4 a6                 tst8	r6
 c4 ff ff              ldi16	r4, 0xffff
 08                    mov	r6, r4
 fb 77                 cmov.ne	r6, r7
 0e                    mov	r7, r6
 08                    mov	r6, r4
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x17e
 ca fc                 addi.s8	r6, -0x4
 ce 02                 cmpi.s8	r6, 0x2
 d2 04                 brult8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x16d
<L15>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 c0 01                 ldi8	r4, 0x1
 81                    and	r4, r5
 c5 ff 7f              ldi16	r5, 0x7fff
 f4 a4                 tst8	r4
 f0 06 ff ff           ldi16	r2, 0xffff
 f1 22                 mov	r4, r2
 fb 65                 cmov.ne	r4, r5
 f4 11                 ldsp16	r5, [sp+0x4]
 f1 1c                 mov	r3, r4
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x180
 c3 02                 ldi8	r7, 0x2
 c2 01                 ldi8	r6, 0x1
 f4 42                 stsp16	[sp+0x0], r6
 aa                    xor	r6, r6
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x88
 c2 01                 ldi8	r6, 0x1
 89                    and	r6, r5
 c3 ff                 ldi8	r7, 0xff
 c0 7f                 ldi8	r4, 0x7f
 f4 a6                 tst8	r6
 fb 7c                 cmov.ne	r7, r4
 0b                    mov	r6, r7
 af                    xor	r7, r7
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x17e
 c2 01                 ldi8	r6, 0x1
 89                    and	r6, r5
 c7 ff 7f              ldi16	r7, 0x7fff
 f4 a6                 tst8	r6
 c6 ff ff              ldi16	r6, 0xffff
 fb 77                 cmov.ne	r6, r7
 af                    xor	r7, r7
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x17e
 c0 01                 ldi8	r4, 0x1
 81                    and	r4, r5
 c5 ff 7f              ldi16	r5, 0x7fff
 f4 a4                 tst8	r4
 c4 ff ff              ldi16	r4, 0xffff
 fb 65                 cmov.ne	r4, r5
 f4 11                 ldsp16	r5, [sp+0x4]
 08                    mov	r6, r4
 af                    xor	r7, r7
 f2 64                 mov32	q1, q0
 f0 34 24              ldsp16	r4, [sp+0x24]
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 81                    and	r4, r5
 a5                    xor	r5, r5
 f7 6b                 add32	q2, q3
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 69 8c              cmp32	q2, q3
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 f0 69 80              cmp32	q2, q0
 d1 04                 brne8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x22c
<L16>:
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 cc 30                 cmpi.s8	r4, 0x30
 d0 04                 breq8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x22c
<L17>:
 f0 31 2c              ldsp16	r1, [sp+0x2c]
 f1 21                 mov	r4, r1
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 f7 66                 add32	q1, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 f8 0e                 cset.ne	r6
 f4 03                 ldsp16	r7, [sp+0x0]
 8e                    and	r7, r6
 cf 01                 cmpi.s8	r7, 0x1
 f0 30 34              ldsp16	r0, [sp+0x34]
 d0 04                 breq8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x30f
<L18>:
 f1 21                 mov	r4, r1
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 cc 62                 cmpi.s8	r4, 0x62
 d1 04                 brne8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x207
<L19>:
 f1 21                 mov	r4, r1
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 cc 42                 cmpi.s8	r4, 0x42
 d0 04                 breq8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x744
<L20>:
 f1 21                 mov	r4, r1
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c4 fe ff              ldi16	r4, 0xfffe
 c5 ff ff              ldi16	r5, 0xffff
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 f7 6e                 add32	q3, q2
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f0 3f 1c              stsp16	[sp+0x1c], r7
 c2 01                 ldi8	r6, 0x1
 f0 03 02              ldi8	r3, 0x2
 f2 42                 sub	r2, r2
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x35b
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 f4 a4                 tst8	r4
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 f0 30 34              ldsp16	r0, [sp+0x34]
 d0 04                 breq8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x26a
<L21>:
 f0 33 28              ldsp16	r3, [sp+0x28]
 f0 0f 08              cmpi.s8	r3, 0x8
 d1 04                 brne8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x344
<L22>:
 f0 0f 10              cmpi.s8	r3, 0x10
 f0 32 00              ldsp16	r2, [sp+0x0]
 d1 04                 brne8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x33e
<L23>:
 f0 0f 0a              cmpi.s8	r3, 0xa
 d0 04                 breq8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x353
<L24>:
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 ed 80 25              ld8u	r4, [r0+5]
 cc 04                 cmpi.s8	r4, 0x4
 d3 04                 brslt8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x2ba
<L25>:
 cc 01                 cmpi.s8	r4, 0x1
 f0 32 04              ldsp16	r2, [sp+0x4]
 d1 04                 brne8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x38e
<L26>:
 cc 02                 cmpi.s8	r4, 0x2
 d1 04                 brne8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x301
<L27>:
 cc 03                 cmpi.s8	r4, 0x3
 d0 04                 breq8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x301
<L28>:
 c0 01                 ldi8	r4, 0x1
 f9 88                 and	r4, r2
 f0 04 99 99           ldi16	r0, 0x9999
 f0 05 99 19           ldi16	r1, 0x1999
 c6 cc cc              ldi16	r6, 0xcccc
 c7 cc 0c              ldi16	r7, 0xccc
 f4 a4                 tst8	r4
 fb 46                 cmov.ne	r0, r6
 fb 4f                 cmov.ne	r1, r7
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 30              stsp16	[sp+0x30], r4
 f0 3d 32              stsp16	[sp+0x32], r5
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x3ab
 c8 fc                 addi.s8	r4, -0x4
 cc 02                 cmpi.s8	r4, 0x2
 f0 32 04              ldsp16	r2, [sp+0x4]
 d2 04                 brult8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x301
<L29>:
 c0 01                 ldi8	r4, 0x1
 f9 88                 and	r4, r2
 f0 04 99 99           ldi16	r0, 0x9999
 f0 05 99 19           ldi16	r1, 0x1999
 c6 cc cc              ldi16	r6, 0xcccc
 c7 cc 0c              ldi16	r7, 0xccc
 f4 a4                 tst8	r4
 fb 46                 cmov.ne	r0, r6
 fb 4f                 cmov.ne	r1, r7
 f0 38 30              stsp16	[sp+0x30], r0
 f0 39 32              stsp16	[sp+0x32], r1
 f0 04 99 99           ldi16	r0, 0x9999
 f0 05 99 99           ldi16	r1, 0x9999
 c4 cc cc              ldi16	r4, 0xcccc
 c5 cc cc              ldi16	r5, 0xcccc
 fb 44                 cmov.ne	r0, r4
 fb 4d                 cmov.ne	r1, r5
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x3a8
 c0 01                 ldi8	r4, 0x1
 f9 88                 and	r4, r2
 c5 99 19              ldi16	r5, 0x1999
 c6 cc 0c              ldi16	r6, 0xccc
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x396
 c3 01                 ldi8	r7, 0x1
 f4 43                 stsp16	[sp+0x0], r7
 8b                    and	r6, r7
 f4 a6                 tst8	r6
 f4 32                 ldsp16	r6, [sp+0xc]
 f0 3e 28              stsp16	[sp+0x28], r6
 d1 04                 brne8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x243
<L30>:
 f0 34 28              ldsp16	r4, [sp+0x28]
 cc 10                 cmpi.s8	r4, 0x10
 d1 04                 brne8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x754
<L31>:
 cc 08                 cmpi.s8	r4, 0x8
 d1 04                 brne8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x754
<L32>:
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 f2 69                 mov32	q2, q1
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x243
 c2 04                 ldi8	r6, 0x4
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x355
 c2 03                 ldi8	r6, 0x3
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f0 32 00              ldsp16	r2, [sp+0x0]
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x35b
 c2 01                 ldi8	r6, 0x1
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 d6 fe                 adjsp	-0x2
 f4 42                 stsp16	[sp+0x0], r6
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 f2 68                 mov32	q2, q0
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_lshrdi3
 d6 02                 adjsp	0x2
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 3e 30              stsp16	[sp+0x30], r6
 f0 3f 32              stsp16	[sp+0x32], r7
 f1 23                 mov	r4, r3
 f4 b4                 dec16	r4
 f9 80                 and	r4, r0
 f0 3c 1e              stsp16	[sp+0x1e], r4
 a0                    xor	r4, r4
 f0 3c 26              stsp16	[sp+0x26], r4
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x3c6
 c0 01                 ldi8	r4, 0x1
 f9 88                 and	r4, r2
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
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 32 04              ldsp16	r2, [sp+0x4]
 c0 01                 ldi8	r4, 0x1
 f0 3c 26              stsp16	[sp+0x26], r4
 f9 50                 and	r2, r4
 f0 34 24              ldsp16	r4, [sp+0x24]
 c8 07                 addi.s8	r4, 0x7
 c1 05                 ldi8	r5, 0x5
 f4 a2                 tst8	r2
 fb 6c                 cmov.ne	r5, r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 03 0a              ldi8	r3, 0xa
 f0 32 00              ldsp16	r2, [sp+0x0]
 f4 a2                 tst8	r2
 f8 01                 cset.eq	r1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 f0 69 8c              cmp32	q2, q3
 d1 04                 brne8	0x4 <L33>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x625
<L33>:
 f2 30                 sub	r0, r0
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 3b 28              stsp16	[sp+0x28], r3
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x416
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f1 06                 mov	r0, r6
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 39                 sub	r1, r1
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 32 1a              ldsp16	r2, [sp+0x1a]
 f0 33 1c              ldsp16	r3, [sp+0x1c]
 f0 69 48              cmp32	q1, q2
 f0 33 28              ldsp16	r3, [sp+0x28]
 d1 04                 brne8	0x4 <L34>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x631
<L34>:
 f0 38 20              stsp16	[sp+0x20], r0
 f0 32 2c              ldsp16	r2, [sp+0x2c]
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f1 04                 mov	r0, r4
 f0 08 d0              addi.s8	r0, -0x30
 f0 0c 0a              cmpi.s8	r0, 0xa
 d8 04                 bruge8	0x4 <L35>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x440
<L35>:
 c1 20                 ldi8	r5, 0x20
 91                    or	r4, r5
 04                    mov	r5, r4
 c9 9f                 addi.s8	r5, -0x61
 c8 a9                 addi.s8	r4, -0x57
 cd 06                 cmpi.s8	r5, 0x6
 f0 04 ff ff           ldi16	r0, 0xffff
 fc 04                 cmov.ult	r0, r4
 f6 28                 tst16	r0
 d9 04                 brsge8	0x4 <L36>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x668
<L36>:
 f5 03                 cmp	r0, r3
 d3 04                 brslt8	0x4 <L37>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x668
<L37>:
 f0 38 14              stsp16	[sp+0x14], r0
 f1 22                 mov	r4, r2
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 69 8c              cmp32	q2, q3
 f8 16                 cset.ult	r6
 f0 30 30              ldsp16	r0, [sp+0x30]
 f0 31 32              ldsp16	r1, [sp+0x32]
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 69 08              cmp32	q0, q2
 f8 17                 cset.ult	r7
 f0 69 80              cmp32	q2, q0
 fb 3e                 cmov.eq	r7, r6
 f4 43                 stsp16	[sp+0x0], r7
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 32 1a              ldsp16	r2, [sp+0x1a]
 f0 33 1c              ldsp16	r3, [sp+0x1c]
 f7 67                 add32	q1, q3
 f0 3a 1a              stsp16	[sp+0x1a], r2
 f0 3b 1c              stsp16	[sp+0x1c], r3
 c2 01                 ldi8	r6, 0x1
 f4 03                 ldsp16	r7, [sp+0x0]
 f4 a7                 tst8	r7
 d0 04                 breq8	0x4 <L38>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x3ec
<L38>:
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
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
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f0 36 14              ldsp16	r6, [sp+0x14]
 32                    cmp	r4, r6
 f8 1e                 cset.uge	r6
 f0 34 20              ldsp16	r4, [sp+0x20]
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L39>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x54d
<L39>:
 96                    or	r5, r6
 c2 01                 ldi8	r6, 0x1
 89                    and	r6, r5
 f4 a6                 tst8	r6
 f0 00 01              ldi8	r0, 0x1
 d1 04                 brne8	0x4 <L40>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x539
<L40>:
 f0 34 26              ldsp16	r4, [sp+0x26]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L41>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x564
<L41>:
 f0 00 0a              ldi8	r0, 0xa
 f2 39                 sub	r1, r1
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 19                 ldsp16	r5, [sp+0x6]
 09                    mov	r6, r5
 0e                    mov	r7, r6
 fa ad                 lsr16i	r7, 0xd
 03                    mov	r4, r7
 a5                    xor	r5, r5
 0e                    mov	r7, r6
 fa af                 lsr16i	r7, 0xf
 f1 17                 mov	r2, r7
 f2 4b                 sub	r3, r3
 f7 66                 add32	q1, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 0c                    mov	r7, r4
 fa ad                 lsr16i	r7, 0xd
 9e                    or	r7, r6
 08                    mov	r6, r4
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
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
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x605
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x400
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f0 00 01              ldi8	r0, 0x1
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x400
 f0 34 28              ldsp16	r4, [sp+0x28]
 cc 10                 cmpi.s8	r4, 0x10
 d1 04                 brne8	0x4 <L42>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x5ba
<L42>:
 cc 08                 cmpi.s8	r4, 0x8
 f4 19                 ldsp16	r5, [sp+0x6]
 01                    mov	r4, r5
 d0 04                 breq8	0x4 <L43>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x5f2
<L43>:
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 04                    mov	r5, r4
 fa 8d                 lsr16i	r5, 0xd
 f4 41                 stsp16	[sp+0x0], r5
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 06                    mov	r5, r6
 15                    add	r5, r5
 15                    add	r5, r5
 15                    add	r5, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 94                    or	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 06                    mov	r5, r6
 fa 8d                 lsr16i	r5, 0xd
 f1 17                 mov	r2, r7
 f4 82                 lsl16.1	r2
 f4 82                 lsl16.1	r2
 f4 82                 lsl16.1	r2
 f9 55                 or	r2, r5
 f4 01                 ldsp16	r5, [sp+0x0]
 f1 05                 mov	r0, r5
 f1 0a                 mov	r1, r2
 f0 34 20              ldsp16	r4, [sp+0x20]
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
 02                    mov	r4, r6
 07                    mov	r5, r7
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x605
 f4 19                 ldsp16	r5, [sp+0x6]
 af                    xor	r7, r7
 f4 41                 stsp16	[sp+0x0], r5
 f4 4b                 stsp16	[sp+0x2], r7
 fa 8c                 lsr16i	r5, 0xc
 f0 3d 20              stsp16	[sp+0x20], r5
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 06                    mov	r5, r6
 fa 44                 lsl16i	r5, 0x4
 f0 34 20              ldsp16	r4, [sp+0x20]
 94                    or	r5, r4
 f0 3d 20              stsp16	[sp+0x20], r5
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 0b                    mov	r6, r7
 fa 54                 lsl16i	r6, 0x4
 99                    or	r6, r5
 f0 35 20              ldsp16	r5, [sp+0x20]
 f1 05                 mov	r0, r5
 f1 0e                 mov	r1, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 fa 54                 lsl16i	r6, 0x4
 f4 10                 ldsp16	r4, [sp+0x4]
 04                    mov	r5, r4
 fa 8c                 lsr16i	r5, 0xc
 96                    or	r5, r6
 fa 34                 lsl16i	r4, 0x4
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x605
 fa 7f                 lsr16i	r4, 0xf
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f7 6f                 add32	q3, q3
 92                    or	r4, r6
 f1 04                 mov	r0, r4
 f1 0f                 mov	r1, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f7 6a                 add32	q2, q2
 f0 36 14              ldsp16	r6, [sp+0x14]
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
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x3fe
 f4 a2                 tst8	r2
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 d1 04                 brne8	0x4 <L44>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x697
<L44>:
 c0 01                 ldi8	r4, 0x1
 f0 30 34              ldsp16	r0, [sp+0x34]
 ed a0 24              ld8u	r5, [r0+4]
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L45>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x698
<L45>:
 ed a0 26              ld8u	r5, [r0+6]
 cd 70                 cmpi.s8	r5, 0x70
 d0 04                 breq8	0x4 <L46>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x69f
<L46>:
 f0 37 2a              ldsp16	r7, [sp+0x2a]
 67                    ld16	r5, [r7]
 09                    mov	r6, r5
 ca 02                 addi.s8	r6, 0x2
 7e                    st16	[r7], r6
 aa                    xor	r6, r6
 f0 30 00              ldsp16	r0, [sp+0x0]
 f2 58                 sub	r6, r0
 f0 37 24              ldsp16	r7, [sp+0x24]
 f6 2f                 tst16	r7
 fb 46                 cmov.ne	r0, r6
 65                    ld16	r5, [r5]
 f5 54                 st16	[r5], r0
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x698
 f0 34 20              ldsp16	r4, [sp+0x20]
 f6 2c                 tst16	r4
 f0 32 16              ldsp16	r2, [sp+0x16]
 f0 33 18              ldsp16	r3, [sp+0x18]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 fb 16                 cmov.eq	r2, r6
 fb 1f                 cmov.eq	r3, r7
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 fb 34                 cmov.eq	r6, r4
 fb 3d                 cmov.eq	r7, r5
 f4 a1                 tst8	r1
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 d1 04                 brne8	0x4 <L47>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x631
<L47>:
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
 f0 35 24              ldsp16	r5, [sp+0x24]
 f6 2d                 tst16	r5
 fb 10                 cmov.eq	r2, r0
 fb 19                 cmov.eq	r3, r1
 f0 3a 1a              stsp16	[sp+0x1a], r2
 f0 3b 1c              stsp16	[sp+0x1c], r3
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 f2 61                 mov32	q0, q1
 f8 0d                 cset.ne	r5
 f1 15                 mov	r2, r5
 f7 67                 add32	q1, q3
 f7 71                 sub32	q0, q1
 f0 35 24              ldsp16	r5, [sp+0x24]
 f6 2d                 tst16	r5
 fb 06                 cmov.eq	r0, r6
 fb 0f                 cmov.eq	r1, r7
 f0 35 34              ldsp16	r5, [sp+0x34]
 ed aa 25              ld8u	r5, [r5+5]
 f0 36 2e              ldsp16	r6, [sp+0x2e]
 ce 69                 cmpi.s8	r6, 0x69
 d1 04                 brne8	0x4 <L48>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x6ed
<L48>:
 ce 64                 cmpi.s8	r6, 0x64
 d0 04                 breq8	0x4 <L49>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x70e
<L49>:
 cd 04                 cmpi.s8	r5, 0x4
 d9 04                 brsge8	0x4 <L50>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x716
<L50>:
 cd 04                 cmpi.s8	r5, 0x4
 f0 37 2a              ldsp16	r7, [sp+0x2a]
 d1 04                 brne8	0x4 <L51>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x7d5
<L51>:
 cd 05                 cmpi.s8	r5, 0x5
 d1 04                 brne8	0x4 <L52>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x7d5
<L52>:
 cd 07                 cmpi.s8	r5, 0x7
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x7c4
 cd 04                 cmpi.s8	r5, 0x4
 d3 04                 brslt8	0x4 <L53>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x7af
<L53>:
 cd 01                 cmpi.s8	r5, 0x1
 f0 37 2a              ldsp16	r7, [sp+0x2a]
 d1 04                 brne8	0x4 <L54>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x7ed
<L54>:
 cd 02                 cmpi.s8	r5, 0x2
 d1 04                 brne8	0x4 <L55>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x7c4
<L55>:
 cd 03                 cmpi.s8	r5, 0x3
 d0 04                 breq8	0x4 <L56>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x7c4
<L56>:
 67                    ld16	r5, [r7]
 09                    mov	r6, r5
 ca 02                 addi.s8	r6, 0x2
 7e                    st16	[r7], r6
 65                    ld16	r5, [r5]
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 f0 6b ca              st32	[r5], q3
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x698
 f0 34 14              ldsp16	r4, [sp+0x14]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L57>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x321
<L57>:
 c0 08                 ldi8	r4, 0x8
 f0 3c 28              stsp16	[sp+0x28], r4
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 ed 80 26              ld8u	r4, [r0+6]
 cc 6f                 cmpi.s8	r4, 0x6f
 d0 04                 breq8	0x4 <L58>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x769
<L58>:
 f2 69                 mov32	q2, q1
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x243
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 cc 78                 cmpi.s8	r4, 0x78
 d1 04                 brne8	0x4 <L59>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x789
<L59>:
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 cc 58                 cmpi.s8	r4, 0x58
 f2 69                 mov32	q2, q1
 d0 04                 breq8	0x4 <L60>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x243
<L60>:
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c4 fe ff              ldi16	r4, 0xfffe
 c5 ff ff              ldi16	r5, 0xffff
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 f7 6e                 add32	q3, q2
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f0 3f 1c              stsp16	[sp+0x1c], r7
 c2 04                 ldi8	r6, 0x4
 f0 03 10              ldi8	r3, 0x10
 f2 42                 sub	r2, r2
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x35b
 cd 04                 cmpi.s8	r5, 0x4
 f0 37 2a              ldsp16	r7, [sp+0x2a]
 d1 04                 brne8	0x4 <L61>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x7d5
<L61>:
 cd 05                 cmpi.s8	r5, 0x5
 d1 04                 brne8	0x4 <L62>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x7d5
<L62>:
 cd 06                 cmpi.s8	r5, 0x6
 67                    ld16	r5, [r7]
 09                    mov	r6, r5
 ca 02                 addi.s8	r6, 0x2
 7e                    st16	[r7], r6
 65                    ld16	r5, [r5]
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 76                    st16	[r5], r6
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x698
 67                    ld16	r5, [r7]
 09                    mov	r6, r5
 ca 02                 addi.s8	r6, 0x2
 7e                    st16	[r7], r6
 65                    ld16	r5, [r5]
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 f0 6b ca              st32	[r5], q3
 c9 04                 addi.s8	r5, 0x4
 f0 6b 0a              st32	[r5], q0
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x698
 67                    ld16	r5, [r7]
 09                    mov	r6, r5
 ca 02                 addi.s8	r6, 0x2
 7e                    st16	[r7], r6
 65                    ld16	r5, [r5]
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 56                    st8	[r5], r6
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x698
