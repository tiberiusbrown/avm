
math_kf_rem_pio2.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 kf_rem_pio2.c
00000000 l    d  .text.__kernel_rem_pio2f	00000000 .text.__kernel_rem_pio2f
00000000 g     F .text.__kernel_rem_pio2f	0000078c __kernel_rem_pio2f
00000000         *UND*	00000000 __avm_mulsi3
00000000         *UND*	00000000 __avm_lshrsi3
00000000         *UND*	00000000 __avm_ashlsi3

Disassembly of section .text.__kernel_rem_pio2f:

<__kernel_rem_pio2f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 b3                 adjsp	-0x4d
 f0 3e 20              stsp16	[sp+0x20], r6
 f2 62                 mov32	q0, q2
 c0 7f                 ldi8	r4, 0x7f
 f9 84                 and	r4, r1
 c1 80                 ldi8	r5, 0x80
 94                    or	r5, r4
 f1 20                 mov	r4, r0
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 c2 61                 ldi8	r6, 0x61
 af                    xor	r7, r7
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 01                    mov	r4, r5
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 c5                 ldi8	r6, 0xc5
 af                    xor	r7, r7
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f7 69                 add32	q2, q1
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 14              ldsp16	r4, [sp+0x14]
 08                    mov	r6, r4
 f0 2e 26              stsp8	[sp+0x26], r6
 f0 38 22              stsp16	[sp+0x22], r0
 f0 39 24              stsp16	[sp+0x24], r1
 f1 21                 mov	r4, r1
 fa 77                 lsr16i	r4, 0x7
 f1 74                 zext8	r4
 c5 96 01              ldi16	r5, 0x196
 08                    mov	r6, r4
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 09                    mov	r6, r5
 28                    sub	r6, r4
 c0 07                 ldi8	r4, 0x7
 06                    mov	r5, r6
 84                    and	r5, r4
 f0 3d 14              stsp16	[sp+0x14], r5
 fa 93                 lsr16i	r6, 0x3
 f0 14 26              leasp	r4, 0x26
 f0 3c 10              stsp16	[sp+0x10], r4
 18                    add	r6, r4
 f0 3e 18              stsp16	[sp+0x18], r6
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 0c                    mov	r7, r4
 f0 2f 27              stsp8	[sp+0x27], r7
 01                    mov	r4, r5
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 bb                 ldi8	r6, 0xbb
 af                    xor	r7, r7
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f7 69                 add32	q2, q1
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 01                    mov	r4, r5
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 de                 ldi8	r6, 0xde
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 2c 28              stsp8	[sp+0x28], r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 ab                 ldi8	r6, 0xab
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 2c 29              stsp8	[sp+0x29], r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 50                 stsp16	[sp+0x4], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 63                 ldi8	r6, 0x63
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 2c 2a              stsp8	[sp+0x2a], r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 51                 ldi8	r6, 0x51
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 2c 2b              stsp8	[sp+0x2b], r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 50                 stsp16	[sp+0x4], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 fe                 ldi8	r6, 0xfe
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 2c 2c              stsp8	[sp+0x2c], r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 41                 ldi8	r6, 0x41
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 2c 2d              stsp8	[sp+0x2d], r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 50                 stsp16	[sp+0x4], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 90                 ldi8	r6, 0x90
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 2c 2e              stsp8	[sp+0x2e], r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 43                 ldi8	r6, 0x43
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 2c 2f              stsp8	[sp+0x2f], r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 50                 stsp16	[sp+0x4], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 3c                 ldi8	r6, 0x3c
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 2c 30              stsp8	[sp+0x30], r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 99                 ldi8	r6, 0x99
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 2c 31              stsp8	[sp+0x31], r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 50                 stsp16	[sp+0x4], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 95                 ldi8	r6, 0x95
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 2c 32              stsp8	[sp+0x32], r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 62                 ldi8	r6, 0x62
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 2c 33              stsp8	[sp+0x33], r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 50                 stsp16	[sp+0x4], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 db                 ldi8	r6, 0xdb
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 2c 34              stsp8	[sp+0x34], r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 c0                 ldi8	r6, 0xc0
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 2c 35              stsp8	[sp+0x35], r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 50                 stsp16	[sp+0x4], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 dd                 ldi8	r6, 0xdd
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 2c 36              stsp8	[sp+0x36], r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 34                 ldi8	r6, 0x34
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 2c 37              stsp8	[sp+0x37], r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 50                 stsp16	[sp+0x4], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 f5                 ldi8	r6, 0xf5
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 2c 38              stsp8	[sp+0x38], r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 d1                 ldi8	r6, 0xd1
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 2c 39              stsp8	[sp+0x39], r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 50                 stsp16	[sp+0x4], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 57                 ldi8	r6, 0x57
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 2c 3a              stsp8	[sp+0x3a], r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 27                 ldi8	r6, 0x27
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 2c 3b              stsp8	[sp+0x3b], r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 50                 stsp16	[sp+0x4], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 fc                 ldi8	r6, 0xfc
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 2c 3c              stsp8	[sp+0x3c], r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 29                 ldi8	r6, 0x29
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 2c 3d              stsp8	[sp+0x3d], r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 50                 stsp16	[sp+0x4], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 15                 ldi8	r6, 0x15
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 2c 3e              stsp8	[sp+0x3e], r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 44                 ldi8	r6, 0x44
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 2c 3f              stsp8	[sp+0x3f], r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 50                 stsp16	[sp+0x4], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 4e                 ldi8	r6, 0x4e
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 2c 40              stsp8	[sp+0x40], r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 6e                 ldi8	r6, 0x6e
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 2c 41              stsp8	[sp+0x41], r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 50                 stsp16	[sp+0x4], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 83                 ldi8	r6, 0x83
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 2c 42              stsp8	[sp+0x42], r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 c2 f9                 ldi8	r6, 0xf9
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f7 69                 add32	q2, q1
 f4 12                 ldsp16	r6, [sp+0x4]
 f0 2e 43              stsp8	[sp+0x43], r6
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f4 42                 stsp16	[sp+0x0], r6
 09                    mov	r6, r5
 af                    xor	r7, r7
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 fa 58                 lsl16i	r6, 0x8
 f4 03                 ldsp16	r7, [sp+0x0]
 9b                    or	r6, r7
 f4 52                 stsp16	[sp+0x4], r6
 f0 2c 44              stsp8	[sp+0x44], r4
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 fa 98                 lsr16i	r6, 0x8
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 14                 mov	r2, r4
 f1 1e                 mov	r3, r6
 c2 a2                 ldi8	r6, 0xa2
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f7 69                 add32	q2, q1
 f0 3c 45              stsp16	[sp+0x45], r4
 f0 3d 47              stsp16	[sp+0x47], r5
 f0 34 18              ldsp16	r4, [sp+0x18]
 48                    ld8u	r6, [r4]
 f0 35 14              ldsp16	r5, [sp+0x14]
 fa 19                 lsr16v	r6, r5
 cd 07                 cmpi.s8	r5, 0x7
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_rem_pio2f
		R_AVM_FAR24	.text.__kernel_rem_pio2f+0x53e
<L0>:
 ed 88 21              ld8u	r4, [r4+1]
 10                    add	r4, r4
 98                    or	r6, r4
 f0 3e 14              stsp16	[sp+0x14], r6
 c6 76 01              ldi16	r6, 0x176
 f4 20                 ldsp16	r4, [sp+0x8]
 28                    sub	r6, r4
 02                    mov	r4, r6
 fa 73                 lsr16i	r4, 0x3
 f0 31 10              ldsp16	r1, [sp+0x10]
 f2 0c                 add	r1, r4
 c0 07                 ldi8	r4, 0x7
 88                    and	r6, r4
 f4 72                 stsp16	[sp+0xc], r6
 af                    xor	r7, r7
 f0 6a 82              ld32	q2, [r1]
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_lshrsi3
 f4 33                 ldsp16	r7, [sp+0xc]
 f4 a7                 tst8	r7
 f0 00 20              ldi8	r0, 0x20
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_rem_pio2f
		R_AVM_FAR24	.text.__kernel_rem_pio2f+0x585
<L1>:
 f1 28                 mov	r6, r0
 2b                    sub	r6, r7
 f2 66                 mov32	q1, q2
 af                    xor	r7, r7
 ed 82 24              ld8u	r4, [r1+4]
 a5                    xor	r5, r5
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f9 51                 or	r2, r4
 f9 75                 or	r3, r5
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 e2 00 00 00           jmpf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__kernel_rem_pio2f+0x589
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 c0 03                 ldi8	r4, 0x3
 f0 3c 10              stsp16	[sp+0x10], r4
 c6 56 01              ldi16	r6, 0x156
 f4 20                 ldsp16	r4, [sp+0x8]
 28                    sub	r6, r4
 02                    mov	r4, r6
 fa 73                 lsr16i	r4, 0x3
 f0 11 26              leasp	r1, 0x26
 f2 0c                 add	r1, r4
 c0 07                 ldi8	r4, 0x7
 88                    and	r6, r4
 f4 62                 stsp16	[sp+0x8], r6
 af                    xor	r7, r7
 f0 6a 82              ld32	q2, [r1]
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_lshrsi3
 f2 66                 mov32	q1, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_rem_pio2f
		R_AVM_FAR24	.text.__kernel_rem_pio2f+0x5c6
<L2>:
 f2 34                 sub	r0, r4
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 ed 82 24              ld8u	r4, [r1+4]
 a5                    xor	r5, r5
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f9 51                 or	r2, r4
 f9 75                 or	r3, r5
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 10              ldsp16	r5, [sp+0x10]
 81                    and	r4, r5
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 69 0c              cmp32	q0, q3
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 3c 14              stsp16	[sp+0x14], r4
 d3 04                 brslt8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_rem_pio2f
		R_AVM_FAR24	.text.__kernel_rem_pio2f+0x5f5
<L3>:
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 02                    mov	r4, r6
 07                    mov	r5, r7
 e2 00 00 00           jmpf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__kernel_rem_pio2f+0x615
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 f0 69 40              cmp32	q1, q0
 f8 04                 cset.eq	r4
 a5                    xor	r5, r5
 f7 6b                 add32	q2, q3
 f7 71                 sub32	q0, q1
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f0 36 14              ldsp16	r6, [sp+0x14]
 f4 ae                 inc16	r6
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 04 ff ff           ldi16	r0, 0xffff
 f2 39                 sub	r1, r1
 f1 15                 mov	r2, r5
 f2 4b                 sub	r3, r3
 f9 80                 and	r4, r0
 f9 a4                 and	r5, r1
 ff c5 0e              u32tof	q3, q2
 a0                    xor	r4, r4
 c5 80 2f              ldi16	r5, 0x2f80
 ff 2e                 fmul	q3, q2
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 ff c5 0d              u32tof	q3, q1
 c5 80 37              ldi16	r5, 0x3780
 ff 2e                 fmul	q3, q2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 0e                 fadd	q3, q2
 c4 00 f0              ldi16	r4, 0xf000
 c5 ff ff              ldi16	r5, 0xffff
 82                    and	r4, r6
 87                    and	r5, r7
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f9 10                 and	r0, r4
 ff c5 00              u32tof	q0, q0
 f2 42                 sub	r2, r2
 f0 07 80 1f           ldi16	r3, 0x1f80
 ff 21                 fmul	q0, q1
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 ff c5 08              u32tof	q2, q0
 f2 30                 sub	r0, r0
 f0 05 80 27           ldi16	r1, 0x2780
 ff 28                 fmul	q2, q0
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 35 24              ldsp16	r5, [sp+0x24]
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 f2 63                 mov32	q0, q3
 ff 22                 fmul	q0, q2
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f0 07 c9 3f           ldi16	r3, 0x3fc9
 ff 29                 fmul	q2, q1
 ff 18                 fsub	q2, q0
 f0 04 00 a0           ldi16	r0, 0xa000
 f0 05 fd 39           ldi16	r1, 0x39fd
 f0 32 18              ldsp16	r2, [sp+0x18]
 f0 33 1a              ldsp16	r3, [sp+0x1a]
 ff 24                 fmul	q1, q0
 ff 06                 fadd	q1, q2
 f0 3a 49              stsp16	[sp+0x49], r2
 f0 3b 4b              stsp16	[sp+0x4b], r3
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 ff 09                 fadd	q2, q1
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 c4 69 21              ldi16	r4, 0x2169
 c5 a2 33              ldi16	r5, 0x33a2
 f2 67                 mov32	q1, q3
 ff 26                 fmul	q1, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 1b                 fsub	q2, q3
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 ff 1e                 fsub	q3, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 30                 sub	r0, r0
 f0 05 c9 3f           ldi16	r1, 0x3fc9
 ff 28                 fmul	q2, q0
 f0 30 49              ldsp16	r0, [sp+0x49]
 f0 31 4b              ldsp16	r1, [sp+0x4b]
 ff 08                 fadd	q2, q0
 f0 04 00 a0           ldi16	r0, 0xa000
 f0 05 fd 39           ldi16	r1, 0x39fd
 ff 2c                 fmul	q3, q0
 ff 0e                 fadd	q3, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 ff 08                 fadd	q2, q0
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 ff 02                 fadd	q0, q2
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 ff 22                 fmul	q0, q2
 ff 04                 fadd	q1, q0
 ff 07                 fadd	q1, q3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 09                 fadd	q2, q1
 ff 1e                 fsub	q3, q2
 ff 07                 fadd	q1, q3
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f0 69 c0              cmp32	q3, q0
 d9 04                 brsge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_rem_pio2f
		R_AVM_FAR24	.text.__kernel_rem_pio2f+0x75d
<L4>:
 ff 61                 fneg	q1
 ff 62                 fneg	q2
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 a5                    xor	r5, r5
 f0 36 14              ldsp16	r6, [sp+0x14]
 26                    sub	r5, r6
 02                    mov	r4, r6
 f0 30 22              ldsp16	r0, [sp+0x22]
 f0 31 24              ldsp16	r1, [sp+0x24]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 fd 25                 cmov.slt	r4, r5
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f0 6b 0c              st32	[r6], q0
 ca 04                 addi.s8	r6, 0x4
 f0 6b 4c              st32	[r6], q1
 d6 4d                 adjsp	0x4d
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
