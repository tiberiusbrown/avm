
math_kf_rem_pio2.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 kf_rem_pio2.c
00000000 l    d  .text.__kernel_rem_pio2f	00000000 .text.__kernel_rem_pio2f
00000000 l     O .rodata.avm_reduce_windows	00000500 avm_reduce_windows
00000000 l    d  .rodata.avm_reduce_windows	00000000 .rodata.avm_reduce_windows
00000000 g     F .text.__kernel_rem_pio2f	0000071b __kernel_rem_pio2f

Disassembly of section .text.__kernel_rem_pio2f:

<__kernel_rem_pio2f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 c4                 adjsp	-0x3c
 f0 3e 36              stsp16	[sp+0x36], r6
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 3c 38              stsp16	[sp+0x38], r4
 f0 3d 3a              stsp16	[sp+0x3a], r5
 01                    mov	r4, r5
 04                    mov	r5, r4
 fa 87                 lsr16i	r5, 0x7
 c2 0a                 ldi8	r6, 0xa
 f3 16                 mulu8.w	r5, r6
 c6 80 ff              ldi16	r6, 0xff80
 98                    or	r6, r4
 f4 62                 stsp16	[sp+0x8], r6
 fa 38                 lsl16i	r4, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 f0 3e 32              stsp16	[sp+0x32], r6
 fa 98                 lsr16i	r6, 0x8
 98                    or	r6, r4
 f4 7a                 stsp16	[sp+0xe], r6
 f1 15                 mov	r2, r5
 f2 4b                 sub	r3, r3
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	.rodata.avm_reduce_windows-0x4f6
 c1 00                 ldi8	r5, 0x0
		R_AVM_PROG_HI8	.rodata.avm_reduce_windows-0x4f6
 f7 69                 add32	q2, q1
 f0 64 c8              ldp32	q3, [q2]
 02                    mov	r4, r6
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 3d 2e              stsp16	[sp+0x2e], r5
 03                    mov	r4, r7
 a5                    xor	r5, r5
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f0 35 32              ldsp16	r5, [sp+0x32]
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 0c                    mov	r7, r4
 01                    mov	r4, r5
 04                    mov	r5, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 3a                 ldsp16	r6, [sp+0xe]
 f4 41                 stsp16	[sp+0x0], r5
 f4 4a                 stsp16	[sp+0x2], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f4 68                 stsp16	[sp+0xa], r4
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 04                    mov	r5, r4
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 3e 14              stsp16	[sp+0x14], r6
 f4 00                 ldsp16	r4, [sp+0x0]
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 19                    add	r6, r5
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f0 37 14              ldsp16	r7, [sp+0x14]
 f6 3d                 mul8	r7, r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 1c                    add	r7, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f1 74                 zext8	r4
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f1 74                 zext8	r4
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 35 16              ldsp16	r5, [sp+0x16]
 f6 31                 mul8	r4, r5
 13                    add	r4, r7
 fa 78                 lsr16i	r4, 0x8
 12                    add	r4, r6
 08                    mov	r6, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f4 4b                 stsp16	[sp+0x2], r7
 f0 3e 1e              stsp16	[sp+0x1e], r6
 f4 69                 stsp16	[sp+0xa], r5
 f4 40                 stsp16	[sp+0x0], r4
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	.rodata.avm_reduce_windows-0x4f2
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	.rodata.avm_reduce_windows-0x4f2
 f7 6d                 add32	q3, q1
 f0 64 8c              ldp32	q2, [q3]
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3d 24              stsp16	[sp+0x24], r5
 0c                    mov	r7, r4
 0b                    mov	r6, r7
 af                    xor	r7, r7
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 3f 18              stsp16	[sp+0x18], r7
 f0 37 14              ldsp16	r7, [sp+0x14]
 f4 08                 ldsp16	r4, [sp+0x2]
 f3 1c                 mulu8.w	r7, r4
 fa a8                 lsr16i	r7, 0x8
 02                    mov	r4, r6
 f4 01                 ldsp16	r5, [sp+0x0]
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 13                    add	r4, r7
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 0e                    mov	r7, r6
 f4 29                 ldsp16	r5, [sp+0xa]
 f3 1d                 mulu8.w	r7, r5
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 f0 34 16              ldsp16	r4, [sp+0x16]
 f1 74                 zext8	r4
 f0 3c 2a              stsp16	[sp+0x2a], r4
 f4 01                 ldsp16	r5, [sp+0x0]
 f1 75                 zext8	r5
 f6 31                 mul8	r4, r5
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 11                    add	r4, r5
 f4 09                 ldsp16	r5, [sp+0x2]
 f1 75                 zext8	r5
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 35 14              ldsp16	r5, [sp+0x14]
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f6 36                 mul8	r5, r6
 14                    add	r5, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 f1 74                 zext8	r4
 f0 36 10              ldsp16	r6, [sp+0x10]
 f6 38                 mul8	r6, r4
 19                    add	r6, r5
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 02                    mov	r4, r6
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 03                 ldsp16	r7, [sp+0x0]
 f4 43                 stsp16	[sp+0x0], r7
 f4 6a                 stsp16	[sp+0xa], r6
 f0 3c 10              stsp16	[sp+0x10], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 36 16              ldsp16	r6, [sp+0x16]
 02                    mov	r4, r6
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 fa 98                 lsr16i	r6, 0x8
 f0 3e 26              stsp16	[sp+0x26], r6
 f4 01                 ldsp16	r5, [sp+0x0]
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f0 37 14              ldsp16	r7, [sp+0x14]
 f4 28                 ldsp16	r4, [sp+0xa]
 f3 1c                 mulu8.w	r7, r4
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 74                 zext8	r4
 06                    mov	r5, r6
 f6 31                 mul8	r4, r5
 f0 35 10              ldsp16	r5, [sp+0x10]
 11                    add	r4, r5
 f4 09                 ldsp16	r5, [sp+0x2]
 f1 75                 zext8	r5
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 f0 36 10              ldsp16	r6, [sp+0x10]
 f6 36                 mul8	r5, r6
 14                    add	r5, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 f1 74                 zext8	r4
 f0 36 14              ldsp16	r6, [sp+0x14]
 f6 38                 mul8	r6, r4
 02                    mov	r4, r6
 11                    add	r4, r5
 f0 3c 14              stsp16	[sp+0x14], r4
 fa 78                 lsr16i	r4, 0x8
 13                    add	r4, r7
 08                    mov	r6, r4
 f4 0b                 ldsp16	r7, [sp+0x2]
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 01                 ldsp16	r5, [sp+0x0]
 f0 3e 20              stsp16	[sp+0x20], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 41                 stsp16	[sp+0x0], r5
 f4 68                 stsp16	[sp+0xa], r4
 f0 35 24              ldsp16	r5, [sp+0x24]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 34 26              ldsp16	r4, [sp+0x26]
 f3 1c                 mulu8.w	r7, r4
 fa a8                 lsr16i	r7, 0x8
 f0 34 10              ldsp16	r4, [sp+0x10]
 08                    mov	r6, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 f0 34 16              ldsp16	r4, [sp+0x16]
 f4 29                 ldsp16	r5, [sp+0xa]
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 12                    add	r4, r6
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f4 03                 ldsp16	r7, [sp+0x0]
 f1 77                 zext8	r7
 f6 37                 mul8	r5, r7
 f0 34 20              ldsp16	r4, [sp+0x20]
 14                    add	r5, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f1 74                 zext8	r4
 f0 36 26              ldsp16	r6, [sp+0x26]
 f6 32                 mul8	r4, r6
 11                    add	r4, r5
 f4 2b                 ldsp16	r7, [sp+0xa]
 07                    mov	r5, r7
 f1 75                 zext8	r5
 f0 36 2a              ldsp16	r6, [sp+0x2a]
 f6 39                 mul8	r6, r5
 18                    add	r6, r4
 f0 3e 2a              stsp16	[sp+0x2a], r6
 fa 98                 lsr16i	r6, 0x8
 f0 34 16              ldsp16	r4, [sp+0x16]
 18                    add	r6, r4
 02                    mov	r4, r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 01                 ldsp16	r5, [sp+0x0]
 f0 3c 20              stsp16	[sp+0x20], r4
 f4 6b                 stsp16	[sp+0xa], r7
 f4 4a                 stsp16	[sp+0x2], r6
 f4 41                 stsp16	[sp+0x0], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 04                    mov	r5, r4
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 08                    mov	r6, r4
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 f0 3f 16              stsp16	[sp+0x16], r7
 f4 02                 ldsp16	r6, [sp+0x0]
 f3 1e                 mulu8.w	r7, r6
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 f4 2a                 ldsp16	r6, [sp+0xa]
 f0 34 26              ldsp16	r4, [sp+0x26]
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 f4 03                 ldsp16	r7, [sp+0x0]
 f1 77                 zext8	r7
 f0 35 16              ldsp16	r5, [sp+0x16]
 f6 37                 mul8	r5, r7
 f0 34 20              ldsp16	r4, [sp+0x20]
 14                    add	r5, r4
 f4 0b                 ldsp16	r7, [sp+0x2]
 f1 77                 zext8	r7
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f6 33                 mul8	r4, r7
 11                    add	r4, r5
 f4 29                 ldsp16	r5, [sp+0xa]
 f1 75                 zext8	r5
 f0 37 26              ldsp16	r7, [sp+0x26]
 f6 37                 mul8	r5, r7
 14                    add	r5, r4
 f0 3d 34              stsp16	[sp+0x34], r5
 fa 88                 lsr16i	r5, 0x8
 16                    add	r5, r6
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f4 6b                 stsp16	[sp+0xa], r7
 f0 3d 30              stsp16	[sp+0x30], r5
 f4 4a                 stsp16	[sp+0x2], r6
 f4 40                 stsp16	[sp+0x0], r4
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	.rodata.avm_reduce_windows-0x4ee
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	.rodata.avm_reduce_windows-0x4ee
 f7 6d                 add32	q3, q1
 f0 62 8c              ldp16	r4, [q3]
 f0 3c 20              stsp16	[sp+0x20], r4
 a5                    xor	r5, r5
 f0 3c 26              stsp16	[sp+0x26], r4
 f0 3d 28              stsp16	[sp+0x28], r5
 f0 37 16              ldsp16	r7, [sp+0x16]
 f4 08                 ldsp16	r4, [sp+0x2]
 f3 1c                 mulu8.w	r7, r4
 fa a8                 lsr16i	r7, 0x8
 f0 34 26              ldsp16	r4, [sp+0x26]
 f4 01                 ldsp16	r5, [sp+0x0]
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 13                    add	r4, r7
 f0 36 26              ldsp16	r6, [sp+0x26]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 f4 03                 ldsp16	r7, [sp+0x0]
 f1 77                 zext8	r7
 f6 37                 mul8	r5, r7
 f0 36 10              ldsp16	r6, [sp+0x10]
 0e                    mov	r7, r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 f3 1e                 mulu8.w	r7, r6
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 f0 34 30              ldsp16	r4, [sp+0x30]
 14                    add	r5, r4
 f4 0a                 ldsp16	r6, [sp+0x2]
 f1 76                 zext8	r6
 f0 34 16              ldsp16	r4, [sp+0x16]
 f6 32                 mul8	r4, r6
 11                    add	r4, r5
 f4 29                 ldsp16	r5, [sp+0xa]
 f1 75                 zext8	r5
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f6 39                 mul8	r6, r5
 18                    add	r6, r4
 f0 3e 1e              stsp16	[sp+0x1e], r6
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 13                    add	r4, r7
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 69                 stsp16	[sp+0xa], r5
 f0 3c 30              stsp16	[sp+0x30], r4
 f4 4b                 stsp16	[sp+0x2], r7
 f4 42                 stsp16	[sp+0x0], r6
 f0 34 14              ldsp16	r4, [sp+0x14]
 f1 74                 zext8	r4
 f0 36 2a              ldsp16	r6, [sp+0x2a]
 fa 58                 lsl16i	r6, 0x8
 98                    or	r6, r4
 0e                    mov	r7, r6
 f0 36 34              ldsp16	r6, [sp+0x34]
 f1 76                 zext8	r6
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 01                    mov	r4, r5
 fa 38                 lsl16i	r4, 0x8
 92                    or	r4, r6
 c2 80                 ldi8	r6, 0x80
 86                    and	r5, r6
 f1 17                 mov	r2, r7
 f1 1c                 mov	r3, r4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f7 7d                 sub32	q3, q1
 fa 87                 lsr16i	r5, 0x7
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f4 a5                 tst8	r5
 fb 32                 cmov.eq	r6, r2
 fb 3b                 cmov.eq	r7, r3
 f2 30                 sub	r0, r0
 f0 01 01              ldi8	r1, 0x1
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_rem_pio2f
		R_AVM_FAR24	.text.__kernel_rem_pio2f+0x352
<L0>:
 c2 02                 ldi8	r6, 0x2
 af                    xor	r7, r7
 f7 6d                 add32	q3, q1
 f0 00 04              ldi8	r0, 0x4
 f0 05 00 80           ldi16	r1, 0x8000
 f0 69 c0              cmp32	q3, q0
 d9 04                 brsge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_rem_pio2f
		R_AVM_FAR24	.text.__kernel_rem_pio2f+0x352
<L1>:
 f0 36 26              ldsp16	r6, [sp+0x26]
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 01                 ldsp16	r5, [sp+0x0]
 f6 34                 mul8	r5, r4
 f0 34 30              ldsp16	r4, [sp+0x30]
 14                    add	r5, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f6 38                 mul8	r6, r4
 19                    add	r6, r5
 f4 28                 ldsp16	r4, [sp+0xa]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f6 3c                 mul8	r7, r4
 1e                    add	r7, r6
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 c1 03                 ldi8	r5, 0x3
 87                    and	r5, r7
 11                    add	r4, r5
 a5                    xor	r5, r5
 24                    sub	r5, r4
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 30 38              ldsp16	r0, [sp+0x38]
 f0 31 3a              ldsp16	r1, [sp+0x3a]
 f0 69 c0              cmp32	q3, q0
 fd 2c                 cmov.slt	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 ff c4 0d              s32tof	q3, q1
 c4 db 0f              ldi16	r4, 0xfdb
 c5 c9 2f              ldi16	r5, 0x2fc9
 ff 2e                 fmul	q3, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 62                 fneg	q2
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 69 40              cmp32	q1, q0
 fd 26                 cmov.slt	r4, r6
 fd 2f                 cmov.slt	r5, r7
 f4 03                 ldsp16	r7, [sp+0x0]
 e2 00 00 00           jmpf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__kernel_rem_pio2f+0x710
 f0 36 32              ldsp16	r6, [sp+0x32]
 f1 76                 zext8	r6
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 04                    mov	r5, r4
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 69                 stsp16	[sp+0xa], r5
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f4 38                 ldsp16	r4, [sp+0xe]
 f4 78                 stsp16	[sp+0xe], r4
 f4 6b                 stsp16	[sp+0xa], r7
 f4 61                 stsp16	[sp+0x8], r5
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 04                    mov	r5, r4
 f4 38                 ldsp16	r4, [sp+0xe]
 f3 14                 mulu8.w	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 fa 98                 lsr16i	r6, 0x8
 f4 42                 stsp16	[sp+0x0], r6
 02                    mov	r4, r6
 f4 12                 ldsp16	r6, [sp+0x4]
 0c                    mov	r7, r4
 f3 1e                 mulu8.w	r7, r6
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 f4 4b                 stsp16	[sp+0x2], r7
 02                    mov	r4, r6
 f1 74                 zext8	r4
 f4 03                 ldsp16	r7, [sp+0x0]
 f6 3c                 mul8	r7, r4
 f4 29                 ldsp16	r5, [sp+0xa]
 1d                    add	r7, r5
 f4 3a                 ldsp16	r6, [sp+0xe]
 f1 76                 zext8	r6
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f4 69                 stsp16	[sp+0xa], r5
 f6 36                 mul8	r5, r6
 17                    add	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f4 0b                 ldsp16	r7, [sp+0x2]
 17                    add	r5, r7
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 38                 ldsp16	r4, [sp+0xe]
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f4 63                 stsp16	[sp+0x8], r7
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 01                 ldsp16	r5, [sp+0x0]
 f3 14                 mulu8.w	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 02                    mov	r4, r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 09                    mov	r6, r5
 12                    add	r4, r6
 f4 48                 stsp16	[sp+0x2], r4
 0b                    mov	r6, r7
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 f0 35 2e              ldsp16	r5, [sp+0x2e]
 f3 12                 mulu8.w	r4, r6
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 02                    mov	r4, r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 12                    add	r4, r6
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f1 76                 zext8	r6
 f4 4a                 stsp16	[sp+0x2], r6
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 74                 zext8	r4
 f6 38                 mul8	r6, r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 18                    add	r6, r4
 f4 39                 ldsp16	r5, [sp+0xe]
 f1 75                 zext8	r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f6 31                 mul8	r4, r5
 12                    add	r4, r6
 f4 23                 ldsp16	r7, [sp+0x8]
 07                    mov	r5, r7
 f1 75                 zext8	r5
 f4 2a                 ldsp16	r6, [sp+0xa]
 f6 39                 mul8	r6, r5
 18                    add	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 18                    add	r6, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 63                 stsp16	[sp+0x8], r7
 f4 6a                 stsp16	[sp+0xa], r6
 f4 79                 stsp16	[sp+0xe], r5
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f3 19                 mulu8.w	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f0 3d 16              stsp16	[sp+0x16], r5
 0c                    mov	r7, r4
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f3 1d                 mulu8.w	r7, r5
 fa a8                 lsr16i	r7, 0x8
 f0 35 14              ldsp16	r5, [sp+0x14]
 1d                    add	r7, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 21                 ldsp16	r5, [sp+0x8]
 f3 19                 mulu8.w	r6, r5
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 f0 34 16              ldsp16	r4, [sp+0x16]
 f6 3c                 mul8	r7, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 1c                    add	r7, r4
 f4 38                 ldsp16	r4, [sp+0xe]
 f1 74                 zext8	r4
 f4 09                 ldsp16	r5, [sp+0x2]
 f6 34                 mul8	r5, r4
 17                    add	r5, r7
 f4 20                 ldsp16	r4, [sp+0x8]
 f1 74                 zext8	r4
 f4 03                 ldsp16	r7, [sp+0x0]
 f6 3c                 mul8	r7, r4
 1d                    add	r7, r5
 f4 43                 stsp16	[sp+0x0], r7
 fa a8                 lsr16i	r7, 0x8
 1e                    add	r7, r6
 f4 6b                 stsp16	[sp+0xa], r7
 f4 38                 ldsp16	r4, [sp+0xe]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f4 6b                 stsp16	[sp+0xa], r7
 f4 61                 stsp16	[sp+0x8], r5
 f4 78                 stsp16	[sp+0xe], r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 0c                    mov	r7, r4
 f0 34 16              ldsp16	r4, [sp+0x16]
 f3 1c                 mulu8.w	r7, r4
 fa a8                 lsr16i	r7, 0x8
 f0 34 22              ldsp16	r4, [sp+0x22]
 08                    mov	r6, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 f4 23                 ldsp16	r7, [sp+0x8]
 f3 13                 mulu8.w	r4, r7
 fa 78                 lsr16i	r4, 0x8
 12                    add	r4, r6
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 34 22              ldsp16	r4, [sp+0x22]
 08                    mov	r6, r4
 f1 76                 zext8	r6
 f0 3e 14              stsp16	[sp+0x14], r6
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f1 74                 zext8	r4
 f6 38                 mul8	r6, r4
 01                    mov	r4, r5
 18                    add	r6, r4
 f4 39                 ldsp16	r5, [sp+0xe]
 f1 75                 zext8	r5
 f0 34 16              ldsp16	r4, [sp+0x16]
 f6 34                 mul8	r5, r4
 16                    add	r5, r6
 03                    mov	r4, r7
 f1 74                 zext8	r4
 f4 0a                 ldsp16	r6, [sp+0x2]
 f6 38                 mul8	r6, r4
 19                    add	r6, r5
 f4 4a                 stsp16	[sp+0x2], r6
 fa 98                 lsr16i	r6, 0x8
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 18                    add	r6, r4
 06                    mov	r5, r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 38                 ldsp16	r4, [sp+0xe]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 63                 stsp16	[sp+0x8], r7
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f4 78                 stsp16	[sp+0xe], r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 36 22              ldsp16	r6, [sp+0x22]
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 34 22              ldsp16	r4, [sp+0x22]
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 f4 6b                 stsp16	[sp+0xa], r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f3 1c                 mulu8.w	r7, r4
 fa a8                 lsr16i	r7, 0x8
 1e                    add	r7, r6
 09                    mov	r6, r5
 f0 34 16              ldsp16	r4, [sp+0x16]
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 74                 zext8	r4
 f4 2b                 ldsp16	r7, [sp+0xa]
 f6 3c                 mul8	r7, r4
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 1c                    add	r7, r4
 f4 38                 ldsp16	r4, [sp+0xe]
 f1 74                 zext8	r4
 f0 35 14              ldsp16	r5, [sp+0x14]
 f6 34                 mul8	r5, r4
 17                    add	r5, r7
 f4 20                 ldsp16	r4, [sp+0x8]
 f1 74                 zext8	r4
 f0 37 16              ldsp16	r7, [sp+0x16]
 f6 33                 mul8	r4, r7
 11                    add	r4, r5
 f0 3c 1e              stsp16	[sp+0x1e], r4
 fa 78                 lsr16i	r4, 0x8
 12                    add	r4, r6
 08                    mov	r6, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 63                 stsp16	[sp+0x8], r7
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f4 79                 stsp16	[sp+0xe], r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 28                 ldsp16	r4, [sp+0xa]
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 f4 12                 ldsp16	r6, [sp+0x4]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 35 16              ldsp16	r5, [sp+0x16]
 11                    add	r4, r5
 f0 36 22              ldsp16	r6, [sp+0x22]
 f0 37 24              ldsp16	r7, [sp+0x24]
 f4 21                 ldsp16	r5, [sp+0x8]
 f3 19                 mulu8.w	r6, r5
 fa 98                 lsr16i	r6, 0x8
 18                    add	r6, r4
 f0 3e 22              stsp16	[sp+0x22], r6
 f0 34 10              ldsp16	r4, [sp+0x10]
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 f0 3f 16              stsp16	[sp+0x16], r7
 f4 10                 ldsp16	r4, [sp+0x4]
 08                    mov	r6, r4
 f1 76                 zext8	r6
 f6 3e                 mul8	r7, r6
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 1d                    add	r7, r5
 f4 3a                 ldsp16	r6, [sp+0xe]
 f1 76                 zext8	r6
 f4 29                 ldsp16	r5, [sp+0xa]
 f6 36                 mul8	r5, r6
 17                    add	r5, r7
 f4 20                 ldsp16	r4, [sp+0x8]
 f1 74                 zext8	r4
 f0 36 14              ldsp16	r6, [sp+0x14]
 f6 38                 mul8	r6, r4
 19                    add	r6, r5
 f0 3e 14              stsp16	[sp+0x14], r6
 fa 98                 lsr16i	r6, 0x8
 f0 34 22              ldsp16	r4, [sp+0x22]
 18                    add	r6, r4
 06                    mov	r5, r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f4 20                 ldsp16	r4, [sp+0x8]
 f0 3d 22              stsp16	[sp+0x22], r5
 f4 7b                 stsp16	[sp+0xe], r7
 f4 60                 stsp16	[sp+0x8], r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 34 10              ldsp16	r4, [sp+0x10]
 f3 13                 mulu8.w	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f0 36 10              ldsp16	r6, [sp+0x10]
 fa 98                 lsr16i	r6, 0x8
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f3 1b                 mulu8.w	r6, r7
 fa 98                 lsr16i	r6, 0x8
 18                    add	r6, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 21                 ldsp16	r5, [sp+0x8]
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 12                    add	r4, r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f1 76                 zext8	r6
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f6 3b                 mul8	r6, r7
 f0 35 22              ldsp16	r5, [sp+0x22]
 19                    add	r6, r5
 f4 3b                 ldsp16	r7, [sp+0xe]
 f1 77                 zext8	r7
 f0 35 16              ldsp16	r5, [sp+0x16]
 f6 37                 mul8	r5, r7
 16                    add	r5, r6
 f4 22                 ldsp16	r6, [sp+0x8]
 f1 76                 zext8	r6
 f4 2b                 ldsp16	r7, [sp+0xa]
 f6 3e                 mul8	r7, r6
 1d                    add	r7, r5
 f4 6b                 stsp16	[sp+0xa], r7
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 09                    mov	r6, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 f0 3f 22              stsp16	[sp+0x22], r7
 f4 7a                 stsp16	[sp+0xe], r6
 f4 61                 stsp16	[sp+0x8], r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 06                    mov	r5, r6
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f3 14                 mulu8.w	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f0 34 20              ldsp16	r4, [sp+0x20]
 f4 12                 ldsp16	r6, [sp+0x4]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f0 35 20              ldsp16	r5, [sp+0x20]
 f1 75                 zext8	r5
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 f6 37                 mul8	r5, r7
 f0 36 10              ldsp16	r6, [sp+0x10]
 f4 23                 ldsp16	r7, [sp+0x8]
 f3 1b                 mulu8.w	r6, r7
 fa 98                 lsr16i	r6, 0x8
 18                    add	r6, r4
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f0 34 22              ldsp16	r4, [sp+0x22]
 14                    add	r5, r4
 f4 38                 ldsp16	r4, [sp+0xe]
 f1 74                 zext8	r4
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f6 32                 mul8	r4, r6
 11                    add	r4, r5
 07                    mov	r5, r7
 f1 75                 zext8	r5
 f0 36 16              ldsp16	r6, [sp+0x16]
 f6 39                 mul8	r6, r5
 18                    add	r6, r4
 f0 3e 16              stsp16	[sp+0x16], r6
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 36 10              ldsp16	r6, [sp+0x10]
 12                    add	r4, r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 63                 stsp16	[sp+0x8], r7
 f4 79                 stsp16	[sp+0xe], r5
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 01                 ldsp16	r5, [sp+0x0]
 f1 75                 zext8	r5
 f4 0a                 ldsp16	r6, [sp+0x2]
 fa 58                 lsl16i	r6, 0x8
 99                    or	r6, r5
 f4 4a                 stsp16	[sp+0x2], r6
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f1 75                 zext8	r5
 f0 36 14              ldsp16	r6, [sp+0x14]
 fa 58                 lsl16i	r6, 0x8
 99                    or	r6, r5
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 35 20              ldsp16	r5, [sp+0x20]
 fa 88                 lsr16i	r5, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 fe 2e                 mul16	r5, r6
 14                    add	r5, r4
 f0 34 20              ldsp16	r4, [sp+0x20]
 f4 3a                 ldsp16	r6, [sp+0xe]
 fe 26                 mul16	r4, r6
 11                    add	r4, r5
 08                    mov	r6, r4
 03                    mov	r4, r7
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 fe 25                 mul16	r4, r5
 12                    add	r4, r6
 c3 03                 ldi8	r7, 0x3
 8c                    and	r7, r4
 f4 29                 ldsp16	r5, [sp+0xa]
 f1 75                 zext8	r5
 c0 80                 ldi8	r4, 0x80
 f0 36 16              ldsp16	r6, [sp+0x16]
 82                    and	r4, r6
 fa 58                 lsl16i	r6, 0x8
 99                    or	r6, r5
 f0 35 14              ldsp16	r5, [sp+0x14]
 f1 05                 mov	r0, r5
 f1 0e                 mov	r1, r6
 fa 77                 lsr16i	r4, 0x7
 f1 14                 mov	r2, r4
 f2 4b                 sub	r3, r3
 f0 3a 0a              stsp16	[sp+0xa], r2
 f0 3b 0c              stsp16	[sp+0xc], r3
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_rem_pio2f
		R_AVM_FAR24	.text.__kernel_rem_pio2f+0x6c8
<L2>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 aa                    xor	r6, r6
 f4 08                 ldsp16	r4, [sp+0x2]
 28                    sub	r6, r4
 f6 2c                 tst16	r4
 f8 04                 cset.eq	r4
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f4 af                 inc16	r7
 e2 00 00 00           jmpf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__kernel_rem_pio2f+0x6cc
 f2 68                 mov32	q2, q0
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 43                 stsp16	[sp+0x0], r7
 ff c1 61              u16tof	q1, r6
 aa                    xor	r6, r6
 c7 80 27              ldi16	r7, 0x2780
 ff 27                 fmul	q1, q3
 ff c5 02              u32tof	q0, q2
 a0                    xor	r4, r4
 c5 80 2f              ldi16	r5, 0x2f80
 ff 22                 fmul	q0, q2
 ff 01                 fadd	q0, q1
 c4 db 0f              ldi16	r4, 0xfdb
 c5 c9 3f              ldi16	r5, 0x3fc9
 ff 22                 fmul	q0, q2
 f0 35 3a              ldsp16	r5, [sp+0x3a]
 09                    mov	r6, r5
 fa 9f                 lsr16i	r6, 0xf
 f2 68                 mov32	q2, q0
 ff 62                 fneg	q2
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f5 16                 cmp	r2, r6
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 aa                    xor	r6, r6
 f4 03                 ldsp16	r7, [sp+0x0]
 2b                    sub	r6, r7
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 32 38              ldsp16	r2, [sp+0x38]
 f0 33 3a              ldsp16	r3, [sp+0x3a]
 f0 69 40              cmp32	q1, q0
 fd 3e                 cmov.slt	r7, r6
 f0 36 36              ldsp16	r6, [sp+0x36]
 7b                    st16	[r6], r7
 d6 3c                 adjsp	0x3c
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
