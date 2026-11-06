
stdio_scan_integer.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 stdio_scan_integer.c
00000000 l    d  .text.__avm_scan_count	00000000 .text.__avm_scan_count
00000000 l    d  .text.__avm_scan_integer	00000000 .text.__avm_scan_integer
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.__avm_scan_count	00000073 __avm_scan_count
00000000 g     F .text.__avm_scan_integer	00000865 __avm_scan_integer
00000000         *UND*	00000000 __avm_scan_peek
00000000         *UND*	00000000 __avm_scan_take
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
 d6 cc                 adjsp	-0x34
 f1 06                 mov	r0, r6
 f1 0d                 mov	r1, r5
 f0 6a c2              ld32	q3, [r1]
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 3c 28              stsp16	[sp+0x28], r4
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f4 40                 stsp16	[sp+0x0], r4
 ed a2 26              ld8u	r5, [r1+6]
 cd 69                 cmpi.s8	r5, 0x69
 f8 03                 cset.eq	r3
 cd 64                 cmpi.s8	r5, 0x64
 f8 02                 cset.eq	r2
 a0                    xor	r4, r4
 f0 3c 24              stsp16	[sp+0x24], r4
 cd 6f                 cmpi.s8	r5, 0x6f
 d3 04                 brslt8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x56
<L0>:
 cd 58                 cmpi.s8	r5, 0x58
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x6e
<L1>:
 cd 62                 cmpi.s8	r5, 0x62
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x13b
<L2>:
 cd 69                 cmpi.s8	r5, 0x69
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x7c
<L3>:
 f0 3c 12              stsp16	[sp+0x12], r4
 c2 08                 ldi8	r6, 0x8
 c3 01                 ldi8	r7, 0x1
 f4 53                 stsp16	[sp+0x4], r7
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x84
 cd 6f                 cmpi.s8	r5, 0x6f
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x75
<L4>:
 cd 70                 cmpi.s8	r5, 0x70
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x6e
<L5>:
 cd 78                 cmpi.s8	r5, 0x78
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x7c
<L6>:
 c2 10                 ldi8	r6, 0x10
 af                    xor	r7, r7
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x7f
 c2 08                 ldi8	r6, 0x8
 af                    xor	r7, r7
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x7f
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 f4 53                 stsp16	[sp+0x4], r7
 f0 3e 12              stsp16	[sp+0x12], r6
 f4 00                 ldsp16	r4, [sp+0x0]
 cc ff                 cmpi.s8	r4, -0x1
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x707
<L7>:
 f4 63                 stsp16	[sp+0x8], r7
 f0 3e 20              stsp16	[sp+0x20], r6
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 2d                 cmpi.s8	r4, 0x2d
 f0 3d 2a              stsp16	[sp+0x2a], r5
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0xaa
<L8>:
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 2b                 cmpi.s8	r4, 0x2b
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0xca
<L9>:
 f0 34 28              ldsp16	r4, [sp+0x28]
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f7 6e                 add32	q3, q2
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 2d                 cmpi.s8	r4, 0x2d
 f8 04                 cset.eq	r4
 f0 3c 24              stsp16	[sp+0x24], r4
 f9 4d                 or	r2, r3
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 39 30              stsp16	[sp+0x30], r1
 ed c2 25              ld8u	r6, [r1+5]
 ce 04                 cmpi.s8	r6, 0x4
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 38 32              stsp16	[sp+0x32], r0
 d3 04                 brslt8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x112
<L10>:
 ce 01                 cmpi.s8	r6, 0x1
 d1 04                 brne8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x147
<L11>:
 ce 02                 cmpi.s8	r6, 0x2
 d1 04                 brne8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x15b
<L12>:
 ce 03                 cmpi.s8	r6, 0x3
 d0 04                 breq8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x16f
<L13>:
 c2 01                 ldi8	r6, 0x1
 f4 01                 ldsp16	r5, [sp+0x0]
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
		R_AVM_FAR24	.text.__avm_scan_integer+0x180
 ca fc                 addi.s8	r6, -0x4
 ce 02                 cmpi.s8	r6, 0x2
 d2 04                 brult8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x16f
<L14>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 c0 01                 ldi8	r4, 0x1
 f4 01                 ldsp16	r5, [sp+0x0]
 81                    and	r4, r5
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f4 a4                 tst8	r4
 f0 04 ff ff           ldi16	r0, 0xffff
 f1 20                 mov	r4, r0
 fb 61                 cmov.ne	r4, r1
 f1 0c                 mov	r1, r4
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x182
 c2 02                 ldi8	r6, 0x2
 c0 01                 ldi8	r4, 0x1
 f4 50                 stsp16	[sp+0x4], r4
 a0                    xor	r4, r4
 0c                    mov	r7, r4
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x81
 c2 01                 ldi8	r6, 0x1
 f4 01                 ldsp16	r5, [sp+0x0]
 89                    and	r6, r5
 c3 ff                 ldi8	r7, 0xff
 f0 00 7f              ldi8	r0, 0x7f
 f4 a6                 tst8	r6
 fb 78                 cmov.ne	r7, r0
 0b                    mov	r6, r7
 af                    xor	r7, r7
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x180
 c2 01                 ldi8	r6, 0x1
 f4 01                 ldsp16	r5, [sp+0x0]
 89                    and	r6, r5
 c7 ff 7f              ldi16	r7, 0x7fff
 f4 a6                 tst8	r6
 c6 ff ff              ldi16	r6, 0xffff
 fb 77                 cmov.ne	r6, r7
 af                    xor	r7, r7
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x180
 c0 01                 ldi8	r4, 0x1
 f4 01                 ldsp16	r5, [sp+0x0]
 81                    and	r4, r5
 c6 ff 7f              ldi16	r6, 0x7fff
 f4 a4                 tst8	r4
 c4 ff ff              ldi16	r4, 0xffff
 fb 66                 cmov.ne	r4, r6
 08                    mov	r6, r4
 af                    xor	r7, r7
 f2 61                 mov32	q0, q1
 f0 34 24              ldsp16	r4, [sp+0x24]
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 81                    and	r4, r5
 a5                    xor	r5, r5
 f7 6b                 add32	q2, q3
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 69 8c              cmp32	q2, q3
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 69 84              cmp32	q2, q1
 d1 04                 brne8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x22a
<L15>:
 f0 34 28              ldsp16	r4, [sp+0x28]
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 cc 30                 cmpi.s8	r4, 0x30
 d0 04                 breq8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x22a
<L16>:
 f0 33 28              ldsp16	r3, [sp+0x28]
 f1 23                 mov	r4, r3
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f7 62                 add32	q0, q2
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 f8 0c                 cset.ne	r4
 f4 11                 ldsp16	r5, [sp+0x4]
 84                    and	r5, r4
 cd 01                 cmpi.s8	r5, 0x1
 f0 32 30              ldsp16	r2, [sp+0x30]
 d0 04                 breq8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x30e
<L17>:
 f1 23                 mov	r4, r3
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 cc 62                 cmpi.s8	r4, 0x62
 d1 04                 brne8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x205
<L18>:
 f1 23                 mov	r4, r3
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 cc 42                 cmpi.s8	r4, 0x42
 d0 04                 breq8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x7ac
<L19>:
 f1 23                 mov	r4, r3
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c4 fe ff              ldi16	r4, 0xfffe
 c5 ff ff              ldi16	r5, 0xffff
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f7 6e                 add32	q3, q2
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 c2 01                 ldi8	r6, 0x1
 c0 02                 ldi8	r4, 0x2
 f2 42                 sub	r2, r2
 f1 0b                 mov	r1, r3
 f1 1c                 mov	r3, r4
 02                    mov	r4, r6
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x360
 a0                    xor	r4, r4
 f4 50                 stsp16	[sp+0x4], r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 a4                 tst8	r4
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 32 30              ldsp16	r2, [sp+0x30]
 f0 33 12              ldsp16	r3, [sp+0x12]
 d0 04                 breq8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x263
<L20>:
 f0 0f 08              cmpi.s8	r3, 0x8
 d1 04                 brne8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x349
<L21>:
 f0 0f 10              cmpi.s8	r3, 0x10
 f0 31 28              ldsp16	r1, [sp+0x28]
 d1 04                 brne8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x343
<L22>:
 f0 0f 0a              cmpi.s8	r3, 0xa
 d0 04                 breq8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x357
<L23>:
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 ed 84 25              ld8u	r4, [r2+5]
 cc 04                 cmpi.s8	r4, 0x4
 d3 04                 brslt8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x2b6
<L24>:
 cc 01                 cmpi.s8	r4, 0x1
 f0 31 28              ldsp16	r1, [sp+0x28]
 f0 30 00              ldsp16	r0, [sp+0x0]
 d1 04                 brne8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x3d6
<L25>:
 cc 02                 cmpi.s8	r4, 0x2
 d1 04                 brne8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x300
<L26>:
 cc 03                 cmpi.s8	r4, 0x3
 d0 04                 breq8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x300
<L27>:
 c0 01                 ldi8	r4, 0x1
 f9 80                 and	r4, r0
 f0 06 99 99           ldi16	r2, 0x9999
 f0 07 99 19           ldi16	r3, 0x1999
 c6 cc cc              ldi16	r6, 0xcccc
 c7 cc 0c              ldi16	r7, 0xccc
 f4 a4                 tst8	r4
 fb 56                 cmov.ne	r2, r6
 fb 5f                 cmov.ne	r3, r7
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 3b 1e              stsp16	[sp+0x1e], r3
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 3d 2e              stsp16	[sp+0x2e], r5
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x3f2
 c8 fc                 addi.s8	r4, -0x4
 cc 02                 cmpi.s8	r4, 0x2
 f0 31 28              ldsp16	r1, [sp+0x28]
 f0 30 00              ldsp16	r0, [sp+0x0]
 d2 04                 brult8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x300
<L28>:
 c0 01                 ldi8	r4, 0x1
 f9 80                 and	r4, r0
 f0 06 99 99           ldi16	r2, 0x9999
 f0 07 99 19           ldi16	r3, 0x1999
 c6 cc cc              ldi16	r6, 0xcccc
 c7 cc 0c              ldi16	r7, 0xccc
 f4 a4                 tst8	r4
 fb 56                 cmov.ne	r2, r6
 fb 5f                 cmov.ne	r3, r7
 f0 3a 2c              stsp16	[sp+0x2c], r2
 f0 3b 2e              stsp16	[sp+0x2e], r3
 f0 06 99 99           ldi16	r2, 0x9999
 f0 07 99 99           ldi16	r3, 0x9999
 c4 cc cc              ldi16	r4, 0xcccc
 c5 cc cc              ldi16	r5, 0xcccc
 fb 54                 cmov.ne	r2, r4
 fb 5d                 cmov.ne	r3, r5
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 3b 1e              stsp16	[sp+0x1e], r3
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x3f2
 c0 01                 ldi8	r4, 0x1
 f9 80                 and	r4, r0
 c5 99 19              ldi16	r5, 0x1999
 c6 cc 0c              ldi16	r6, 0xccc
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x3de
 c1 01                 ldi8	r5, 0x1
 f4 51                 stsp16	[sp+0x4], r5
 81                    and	r4, r5
 f4 a4                 tst8	r4
 f0 33 20              ldsp16	r3, [sp+0x20]
 d1 04                 brne8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x241
<L29>:
 f0 0f 10              cmpi.s8	r3, 0x10
 d1 04                 brne8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x7bc
<L30>:
 f0 0f 08              cmpi.s8	r3, 0x8
 d1 04                 brne8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x7bc
<L31>:
 c0 01                 ldi8	r4, 0x1
 f4 50                 stsp16	[sp+0x4], r4
 f2 6a                 mov32	q3, q0
 f0 0f 08              cmpi.s8	r3, 0x8
 d0 04                 breq8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x24a
<L32>:
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x349
 c0 04                 ldi8	r4, 0x4
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x359
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 31 28              ldsp16	r1, [sp+0x28]
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x35d
 c0 01                 ldi8	r4, 0x1
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 32 04              ldsp16	r2, [sp+0x4]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 00 0f              ldi8	r0, 0xf
 08                    mov	r6, r4
 f9 c2                 xor	r6, r0
 f0 35 16              ldsp16	r5, [sp+0x16]
 01                    mov	r4, r5
 10                    add	r4, r4
 fa 02                 shl16v	r4, r6
 f4 60                 stsp16	[sp+0x8], r4
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 01                    mov	r4, r5
 10                    add	r4, r4
 fa 02                 shl16v	r4, r6
 f0 36 18              ldsp16	r6, [sp+0x18]
 06                    mov	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 fa 16                 lsr16v	r5, r6
 94                    or	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 f0 34 14              ldsp16	r4, [sp+0x14]
 fa 12                 lsr16v	r4, r6
 f4 21                 ldsp16	r5, [sp+0x8]
 91                    or	r4, r5
 f4 60                 stsp16	[sp+0x8], r4
 c4 ff ff              ldi16	r4, 0xffff
 a8                    xor	r6, r4
 f9 c0                 and	r6, r0
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f7 6a                 add32	q2, q2
 fa 02                 shl16v	r4, r6
 f0 37 16              ldsp16	r7, [sp+0x16]
 07                    mov	r5, r7
 f4 02                 ldsp16	r6, [sp+0x0]
 fa 16                 lsr16v	r5, r6
 94                    or	r5, r4
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 03                    mov	r4, r7
 f4 02                 ldsp16	r6, [sp+0x0]
 fa 12                 lsr16v	r4, r6
 f4 22                 ldsp16	r6, [sp+0x8]
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f4 11                 ldsp16	r5, [sp+0x4]
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 3d 2e              stsp16	[sp+0x2e], r5
 f1 23                 mov	r4, r3
 f4 b4                 dec16	r4
 f0 36 14              ldsp16	r6, [sp+0x14]
 82                    and	r4, r6
 f0 3c 22              stsp16	[sp+0x22], r4
 a0                    xor	r4, r4
 f0 3c 26              stsp16	[sp+0x26], r4
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x40d
 c0 01                 ldi8	r4, 0x1
 f9 80                 and	r4, r0
 c1 19                 ldi8	r5, 0x19
 c2 0c                 ldi8	r6, 0xc
 f4 a4                 tst8	r4
 fb 6e                 cmov.ne	r5, r6
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 3e 2c              stsp16	[sp+0x2c], r6
 f0 3f 2e              stsp16	[sp+0x2e], r7
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 c0 01                 ldi8	r4, 0x1
 f0 3c 26              stsp16	[sp+0x26], r4
 f9 10                 and	r0, r4
 f0 34 24              ldsp16	r4, [sp+0x24]
 c8 07                 addi.s8	r4, 0x7
 c1 05                 ldi8	r5, 0x5
 f4 a0                 tst8	r0
 fb 6c                 cmov.ne	r5, r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 03 0a              ldi8	r3, 0xa
 f0 32 04              ldsp16	r2, [sp+0x4]
 f4 a2                 tst8	r2
 f8 00                 cset.eq	r0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 69 8c              cmp32	q2, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 d1 04                 brne8	0x4 <L33>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x67c
<L33>:
 f0 3b 12              stsp16	[sp+0x12], r3
 aa                    xor	r6, r6
 f0 3e 10              stsp16	[sp+0x10], r6
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x45e
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f2 67                 mov32	q1, q3
 f0 38 10              stsp16	[sp+0x10], r0
 f0 31 28              ldsp16	r1, [sp+0x28]
 f2 30                 sub	r0, r0
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L34>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x690
<L34>:
 f1 21                 mov	r4, r1
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 f1 14                 mov	r2, r4
 f0 0a d0              addi.s8	r2, -0x30
 f0 0e 0a              cmpi.s8	r2, 0xa
 d8 04                 bruge8	0x4 <L35>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x482
<L35>:
 c1 20                 ldi8	r5, 0x20
 91                    or	r4, r5
 04                    mov	r5, r4
 c9 9f                 addi.s8	r5, -0x61
 c8 a9                 addi.s8	r4, -0x57
 cd 06                 cmpi.s8	r5, 0x6
 f0 06 ff ff           ldi16	r2, 0xffff
 fc 14                 cmov.ult	r2, r4
 f6 2a                 tst16	r2
 f0 34 12              ldsp16	r4, [sp+0x12]
 d9 04                 brsge8	0x4 <L36>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x6c9
<L36>:
 f5 14                 cmp	r2, r4
 d3 04                 brslt8	0x4 <L37>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x6c9
<L37>:
 f0 3a 20              stsp16	[sp+0x20], r2
 f1 21                 mov	r4, r1
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 8c              cmp32	q2, q3
 f8 16                 cset.ult	r6
 f0 32 2c              ldsp16	r2, [sp+0x2c]
 f0 33 2e              ldsp16	r3, [sp+0x2e]
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 69 48              cmp32	q1, q2
 f8 17                 cset.ult	r7
 f0 69 84              cmp32	q2, q1
 fb 3e                 cmov.eq	r7, r6
 f4 53                 stsp16	[sp+0x4], r7
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f7 63                 add32	q0, q3
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 f0 00 01              ldi8	r0, 0x1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L38>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x435
<L38>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f9 8a                 xor	r4, r2
 f9 ae                 xor	r5, r3
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 f8 0d                 cset.ne	r5
 f0 36 22              ldsp16	r6, [sp+0x22]
 f0 34 20              ldsp16	r4, [sp+0x20]
 38                    cmp	r6, r4
 f8 1e                 cset.uge	r6
 f0 34 10              ldsp16	r4, [sp+0x10]
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L39>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x596
<L39>:
 96                    or	r5, r6
 c2 01                 ldi8	r6, 0x1
 89                    and	r6, r5
 f4 a6                 tst8	r6
 c0 01                 ldi8	r4, 0x1
 d1 04                 brne8	0x4 <L40>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x580
<L40>:
 f0 34 26              ldsp16	r4, [sp+0x26]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L41>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x5b1
<L41>:
 f0 02 0a              ldi8	r2, 0xa
 f2 4b                 sub	r3, r3
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 09                 ldsp16	r5, [sp+0x2]
 09                    mov	r6, r5
 0e                    mov	r7, r6
 fa ad                 lsr16i	r7, 0xd
 03                    mov	r4, r7
 a5                    xor	r5, r5
 0e                    mov	r7, r6
 fa af                 lsr16i	r7, 0xf
 f1 07                 mov	r0, r7
 f2 39                 sub	r1, r1
 f7 62                 add32	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f7 62                 add32	q0, q2
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 0c                    mov	r7, r4
 fa ad                 lsr16i	r7, 0xd
 9e                    or	r7, r6
 08                    mov	r6, r4
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 69 8c              cmp32	q2, q3
 f8 16                 cset.ult	r6
 f1 16                 mov	r2, r6
 f7 64                 add32	q1, q0
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x653
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f2 67                 mov32	q1, q3
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x5aa
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f2 67                 mov32	q1, q3
 c0 01                 ldi8	r4, 0x1
 f0 3c 10              stsp16	[sp+0x10], r4
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x44a
 f0 34 12              ldsp16	r4, [sp+0x12]
 cc 10                 cmpi.s8	r4, 0x10
 d1 04                 brne8	0x4 <L42>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x608
<L42>:
 cc 08                 cmpi.s8	r4, 0x8
 f4 09                 ldsp16	r5, [sp+0x2]
 01                    mov	r4, r5
 d0 04                 breq8	0x4 <L43>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x640
<L43>:
 f4 50                 stsp16	[sp+0x4], r4
 04                    mov	r5, r4
 fa 8d                 lsr16i	r5, 0xd
 f0 3d 10              stsp16	[sp+0x10], r5
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 06                    mov	r5, r6
 15                    add	r5, r5
 15                    add	r5, r5
 15                    add	r5, r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 94                    or	r5, r4
 f0 3d 10              stsp16	[sp+0x10], r5
 06                    mov	r5, r6
 fa 8d                 lsr16i	r5, 0xd
 f1 07                 mov	r0, r7
 f4 80                 lsl16.1	r0
 f4 80                 lsl16.1	r0
 f4 80                 lsl16.1	r0
 f9 15                 or	r0, r5
 f0 35 10              ldsp16	r5, [sp+0x10]
 f1 15                 mov	r2, r5
 f1 18                 mov	r3, r0
 f4 10                 ldsp16	r4, [sp+0x4]
 10                    add	r4, r4
 10                    add	r4, r4
 10                    add	r4, r4
 f4 50                 stsp16	[sp+0x4], r4
 f4 02                 ldsp16	r6, [sp+0x0]
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
		R_AVM_FAR24	.text.__avm_scan_integer+0x653
 f4 09                 ldsp16	r5, [sp+0x2]
 af                    xor	r7, r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 5b                 stsp16	[sp+0x6], r7
 fa 8c                 lsr16i	r5, 0xc
 f0 3d 10              stsp16	[sp+0x10], r5
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 06                    mov	r5, r6
 fa 44                 lsl16i	r5, 0x4
 f0 34 10              ldsp16	r4, [sp+0x10]
 94                    or	r5, r4
 f0 3d 10              stsp16	[sp+0x10], r5
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 0b                    mov	r6, r7
 fa 54                 lsl16i	r6, 0x4
 99                    or	r6, r5
 f0 35 10              ldsp16	r5, [sp+0x10]
 f1 15                 mov	r2, r5
 f1 1e                 mov	r3, r6
 f4 12                 ldsp16	r6, [sp+0x4]
 fa 54                 lsl16i	r6, 0x4
 f4 00                 ldsp16	r4, [sp+0x0]
 04                    mov	r5, r4
 fa 8c                 lsr16i	r5, 0xc
 96                    or	r5, r6
 fa 34                 lsl16i	r4, 0x4
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x653
 fa 7f                 lsr16i	r4, 0xf
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f7 6f                 add32	q3, q3
 92                    or	r4, r6
 f1 14                 mov	r2, r4
 f1 1f                 mov	r3, r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 6a                 add32	q2, q2
 f0 31 28              ldsp16	r1, [sp+0x28]
 f0 36 20              ldsp16	r6, [sp+0x20]
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f0 69 c8              cmp32	q3, q2
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 a0                    xor	r4, r4
 f0 3c 10              stsp16	[sp+0x10], r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 20                 ldsp16	r4, [sp+0x8]
 f2 66                 mov32	q1, q2
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x44d
 f1 22                 mov	r4, r2
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f4 a4                 tst8	r4
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 d1 04                 brne8	0x4 <L44>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x704
<L44>:
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 f0 34 30              ldsp16	r4, [sp+0x30]
 ed a8 24              ld8u	r5, [r4+4]
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L45>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x707
<L45>:
 ed a8 26              ld8u	r5, [r4+6]
 cd 70                 cmpi.s8	r5, 0x70
 d0 04                 breq8	0x4 <L46>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x710
<L46>:
 f0 34 32              ldsp16	r4, [sp+0x32]
 64                    ld16	r5, [r4]
 09                    mov	r6, r5
 ca 02                 addi.s8	r6, 0x2
 72                    st16	[r4], r6
 aa                    xor	r6, r6
 f0 30 04              ldsp16	r0, [sp+0x4]
 f2 58                 sub	r6, r0
 f0 34 24              ldsp16	r4, [sp+0x24]
 f6 2c                 tst16	r4
 fb 46                 cmov.ne	r0, r6
 65                    ld16	r5, [r5]
 f5 54                 st16	[r5], r0
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x707
 f0 34 10              ldsp16	r4, [sp+0x10]
 f6 2c                 tst16	r4
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 fb 26                 cmov.eq	r4, r6
 fb 2f                 cmov.eq	r5, r7
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 fb 34                 cmov.eq	r6, r4
 fb 3d                 cmov.eq	r7, r5
 f4 a0                 tst8	r0
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 67                 mov32	q1, q3
 d1 04                 brne8	0x4 <L47>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x690
<L47>:
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d6 34                 adjsp	0x34
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f2 68                 mov32	q2, q0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f7 7b                 sub32	q2, q3
 f0 36 24              ldsp16	r6, [sp+0x24]
 f6 2e                 tst16	r6
 f4 12                 ldsp16	r6, [sp+0x4]
 fb 74                 cmov.ne	r6, r4
 fb 7d                 cmov.ne	r7, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 69 80              cmp32	q2, q0
 f8 0c                 cset.ne	r4
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f7 72                 sub32	q0, q2
 f0 34 24              ldsp16	r4, [sp+0x24]
 f6 2c                 tst16	r4
 fb 50                 cmov.ne	r2, r0
 fb 59                 cmov.ne	r3, r1
 f0 34 30              ldsp16	r4, [sp+0x30]
 ed a8 25              ld8u	r5, [r4+5]
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 cc 69                 cmpi.s8	r4, 0x69
 d1 04                 brne8	0x4 <L48>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x757
<L48>:
 cc 64                 cmpi.s8	r4, 0x64
 d0 04                 breq8	0x4 <L49>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x77a
<L49>:
 cd 04                 cmpi.s8	r5, 0x4
 d9 04                 brsge8	0x4 <L50>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x782
<L50>:
 cd 04                 cmpi.s8	r5, 0x4
 f0 34 32              ldsp16	r4, [sp+0x32]
 d1 04                 brne8	0x4 <L51>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x842
<L51>:
 cd 05                 cmpi.s8	r5, 0x5
 d1 04                 brne8	0x4 <L52>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x842
<L52>:
 f2 63                 mov32	q0, q3
 cd 07                 cmpi.s8	r5, 0x7
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x835
 cd 04                 cmpi.s8	r5, 0x4
 d3 04                 brslt8	0x4 <L53>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x81e
<L53>:
 cd 01                 cmpi.s8	r5, 0x1
 f0 34 32              ldsp16	r4, [sp+0x32]
 f2 63                 mov32	q0, q3
 d1 04                 brne8	0x4 <L54>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x858
<L54>:
 cd 02                 cmpi.s8	r5, 0x2
 d1 04                 brne8	0x4 <L55>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x835
<L55>:
 cd 03                 cmpi.s8	r5, 0x3
 d0 04                 breq8	0x4 <L56>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x835
<L56>:
 68                    ld16	r6, [r4]
 06                    mov	r5, r6
 c9 02                 addi.s8	r5, 0x2
 71                    st16	[r4], r5
 62                    ld16	r4, [r6]
 f0 6b 08              st32	[r4], q0
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x707
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 a4                 tst8	r4
 f0 33 12              ldsp16	r3, [sp+0x12]
 d1 04                 brne8	0x4 <L57>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x31e
<L57>:
 f0 03 08              ldi8	r3, 0x8
 c0 01                 ldi8	r4, 0x1
 f4 50                 stsp16	[sp+0x4], r4
 ed 84 26              ld8u	r4, [r2+6]
 cc 6f                 cmpi.s8	r4, 0x6f
 d0 04                 breq8	0x4 <L58>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x7da
<L58>:
 f2 6a                 mov32	q3, q0
 f0 0f 08              cmpi.s8	r3, 0x8
 d0 04                 breq8	0x4 <L59>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x24a
<L59>:
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x349
 f0 34 28              ldsp16	r4, [sp+0x28]
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 cc 78                 cmpi.s8	r4, 0x78
 d1 04                 brne8	0x4 <L60>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x7fa
<L60>:
 f0 34 28              ldsp16	r4, [sp+0x28]
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_peek
 cc 58                 cmpi.s8	r4, 0x58
 f2 6a                 mov32	q3, q0
 d0 04                 breq8	0x4 <L61>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x241
<L61>:
 f0 31 28              ldsp16	r1, [sp+0x28]
 f1 21                 mov	r4, r1
 e3 00 00 00           callf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_scan_take
 c4 fe ff              ldi16	r4, 0xfffe
 c5 ff ff              ldi16	r5, 0xffff
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f7 6e                 add32	q3, q2
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 c0 04                 ldi8	r4, 0x4
 f0 03 10              ldi8	r3, 0x10
 f2 42                 sub	r2, r2
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x360
 cd 04                 cmpi.s8	r5, 0x4
 f0 34 32              ldsp16	r4, [sp+0x32]
 d1 04                 brne8	0x4 <L62>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x842
<L62>:
 cd 05                 cmpi.s8	r5, 0x5
 d1 04                 brne8	0x4 <L63>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_FAR24	.text.__avm_scan_integer+0x842
<L63>:
 f2 63                 mov32	q0, q3
 cd 06                 cmpi.s8	r5, 0x6
 68                    ld16	r6, [r4]
 06                    mov	r5, r6
 c9 02                 addi.s8	r5, 0x2
 71                    st16	[r4], r5
 62                    ld16	r4, [r6]
 f1 24                 mov	r5, r0
 71                    st16	[r4], r5
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x707
 f5 40                 ld16	r0, [r4]
 f1 24                 mov	r5, r0
 c9 02                 addi.s8	r5, 0x2
 71                    st16	[r4], r5
 ed 90 20              ld16	r4, [r0+0]
 f0 6b c8              st32	[r4], q3
 c8 04                 addi.s8	r4, 0x4
 f0 6b 48              st32	[r4], q1
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x707
 68                    ld16	r6, [r4]
 06                    mov	r5, r6
 c9 02                 addi.s8	r5, 0x2
 71                    st16	[r4], r5
 62                    ld16	r4, [r6]
 f1 24                 mov	r5, r0
 51                    st8	[r4], r5
 e2 00 00 00           jmpf	__avm_scan_integer
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_scan_integer+0x707
