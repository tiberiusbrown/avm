
math_kf_rem_pio2.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 kf_rem_pio2.c
00000000 l    d  .text.__kernel_rem_pio2f	00000000 .text.__kernel_rem_pio2f
00000000 g     F .text.__kernel_rem_pio2f	00000ca0 __kernel_rem_pio2f
00000000         *UND*	00000000 __avm_ashlsi3

Disassembly of section .text.__kernel_rem_pio2f:

<__kernel_rem_pio2f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 b3                 adjsp	-0x4d
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
 09                    mov	r6, r5
 af                    xor	r7, r7
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 02                    mov	r4, r6
 fa 38                 lsl16i	r4, 0x8
 91                    or	r4, r5
 f4 60                 stsp16	[sp+0x8], r4
 c3 61                 ldi8	r7, 0x61
 f4 00                 ldsp16	r4, [sp+0x0]
 04                    mov	r5, r4
 f3 17                 mulu8.w	r5, r7
 f0 2d 22              stsp8	[sp+0x22], r5
 c4 80 ff              ldi16	r4, 0xff80
 92                    or	r4, r6
 fa 88                 lsr16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 71                 stsp16	[sp+0xc], r5
 f4 63                 stsp16	[sp+0x8], r7
 f4 50                 stsp16	[sp+0x4], r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 0b                    mov	r6, r7
 c0 61                 ldi8	r4, 0x61
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 c3 c5                 ldi8	r7, 0xc5
 f4 00                 ldsp16	r4, [sp+0x0]
 04                    mov	r5, r4
 03                    mov	r4, r7
 f3 14                 mulu8.w	r5, r4
 fa 88                 lsr16i	r5, 0x8
 16                    add	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 f6 3c                 mul8	r7, r4
 f4 30                 ldsp16	r4, [sp+0xc]
 1c                    add	r7, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f1 74                 zext8	r4
 c2 61                 ldi8	r6, 0x61
 f6 32                 mul8	r4, r6
 13                    add	r4, r7
 f0 2c 23              stsp8	[sp+0x23], r4
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 63                 stsp16	[sp+0x8], r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 07                    mov	r5, r7
 c2 c5                 ldi8	r6, 0xc5
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 c2 bb                 ldi8	r6, 0xbb
 f3 1e                 mulu8.w	r7, r6
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 f4 12                 ldsp16	r6, [sp+0x4]
 c1 61                 ldi8	r5, 0x61
 f3 19                 mulu8.w	r6, r5
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 f4 72                 stsp16	[sp+0xc], r6
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 c1 bb                 ldi8	r5, 0xbb
 f6 3d                 mul8	r7, r5
 1c                    add	r7, r4
 f4 21                 ldsp16	r5, [sp+0x8]
 f1 75                 zext8	r5
 c0 c5                 ldi8	r4, 0xc5
 f6 34                 mul8	r5, r4
 17                    add	r5, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 74                 zext8	r4
 c2 61                 ldi8	r6, 0x61
 f6 32                 mul8	r4, r6
 11                    add	r4, r5
 f0 2c 24              stsp8	[sp+0x24], r4
 fa 78                 lsr16i	r4, 0x8
 f4 31                 ldsp16	r5, [sp+0xc]
 11                    add	r4, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 63                 stsp16	[sp+0x8], r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 07                    mov	r5, r7
 c2 bb                 ldi8	r6, 0xbb
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 c3 de                 ldi8	r7, 0xde
 f3 1b                 mulu8.w	r6, r7
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 f0 3f 10              stsp16	[sp+0x10], r7
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 71                 stsp16	[sp+0xc], r5
 c1 c5                 ldi8	r5, 0xc5
 f4 33                 ldsp16	r7, [sp+0xc]
 f3 1d                 mulu8.w	r7, r5
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f0 37 10              ldsp16	r7, [sp+0x10]
 17                    add	r5, r7
 c3 fe                 ldi8	r7, 0xfe
 8b                    and	r6, r7
 18                    add	r6, r4
 f4 23                 ldsp16	r7, [sp+0x8]
 f1 77                 zext8	r7
 c0 bb                 ldi8	r4, 0xbb
 f6 3c                 mul8	r7, r4
 1e                    add	r7, r6
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 74                 zext8	r4
 c2 c5                 ldi8	r6, 0xc5
 f6 32                 mul8	r4, r6
 13                    add	r4, r7
 f0 2c 25              stsp8	[sp+0x25], r4
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 63                 stsp16	[sp+0x8], r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c1 ab                 ldi8	r5, 0xab
 f3 19                 mulu8.w	r6, r5
 fa 98                 lsr16i	r6, 0x8
 07                    mov	r5, r7
 c3 de                 ldi8	r7, 0xde
 f3 17                 mulu8.w	r5, r7
 f0 3d 10              stsp16	[sp+0x10], r5
 0d                    mov	r7, r5
 fa a8                 lsr16i	r7, 0x8
 1e                    add	r7, r6
 f4 11                 ldsp16	r5, [sp+0x4]
 c2 bb                 ldi8	r6, 0xbb
 f3 16                 mulu8.w	r5, r6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 f4 72                 stsp16	[sp+0xc], r6
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 c2 ab                 ldi8	r6, 0xab
 f6 3e                 mul8	r7, r6
 1c                    add	r7, r4
 c0 fe                 ldi8	r4, 0xfe
 f0 35 10              ldsp16	r5, [sp+0x10]
 84                    and	r5, r4
 17                    add	r5, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 74                 zext8	r4
 c2 bb                 ldi8	r6, 0xbb
 f6 32                 mul8	r4, r6
 11                    add	r4, r5
 f0 2c 26              stsp8	[sp+0x26], r4
 fa 78                 lsr16i	r4, 0x8
 f4 31                 ldsp16	r5, [sp+0xc]
 11                    add	r4, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 63                 stsp16	[sp+0x8], r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 07                    mov	r5, r7
 c2 ab                 ldi8	r6, 0xab
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 c2 63                 ldi8	r6, 0x63
 f3 1e                 mulu8.w	r7, r6
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 f4 12                 ldsp16	r6, [sp+0x4]
 c1 de                 ldi8	r5, 0xde
 f3 19                 mulu8.w	r6, r5
 f4 72                 stsp16	[sp+0xc], r6
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 17                    add	r5, r7
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 c2 63                 ldi8	r6, 0x63
 f6 3e                 mul8	r7, r6
 1c                    add	r7, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f1 74                 zext8	r4
 c2 ab                 ldi8	r6, 0xab
 f6 32                 mul8	r4, r6
 13                    add	r4, r7
 c2 fe                 ldi8	r6, 0xfe
 f4 33                 ldsp16	r7, [sp+0xc]
 8e                    and	r7, r6
 1c                    add	r7, r4
 f0 2f 27              stsp8	[sp+0x27], r7
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 73                 stsp16	[sp+0xc], r7
 f4 62                 stsp16	[sp+0x8], r6
 f4 51                 stsp16	[sp+0x4], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 06                    mov	r5, r6
 c0 63                 ldi8	r4, 0x63
 f3 14                 mulu8.w	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 02                    mov	r4, r6
 c2 51                 ldi8	r6, 0x51
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 07                    mov	r5, r7
 c2 ab                 ldi8	r6, 0xab
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f4 02                 ldsp16	r6, [sp+0x0]
 02                    mov	r4, r6
 f1 74                 zext8	r4
 c2 51                 ldi8	r6, 0x51
 f6 32                 mul8	r4, r6
 f4 32                 ldsp16	r6, [sp+0xc]
 12                    add	r4, r6
 f4 22                 ldsp16	r6, [sp+0x8]
 f1 76                 zext8	r6
 c3 63                 ldi8	r7, 0x63
 f6 3b                 mul8	r6, r7
 18                    add	r6, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 74                 zext8	r4
 c3 ab                 ldi8	r7, 0xab
 f6 33                 mul8	r4, r7
 12                    add	r4, r6
 f0 2c 28              stsp8	[sp+0x28], r4
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 63                 stsp16	[sp+0x8], r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 07                    mov	r5, r7
 c2 51                 ldi8	r6, 0x51
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 c3 fe                 ldi8	r7, 0xfe
 f3 1b                 mulu8.w	r6, r7
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 f0 3f 10              stsp16	[sp+0x10], r7
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 71                 stsp16	[sp+0xc], r5
 c1 63                 ldi8	r5, 0x63
 f4 33                 ldsp16	r7, [sp+0xc]
 f3 1d                 mulu8.w	r7, r5
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f0 37 10              ldsp16	r7, [sp+0x10]
 17                    add	r5, r7
 c3 fe                 ldi8	r7, 0xfe
 8b                    and	r6, r7
 18                    add	r6, r4
 f4 23                 ldsp16	r7, [sp+0x8]
 f1 77                 zext8	r7
 c0 51                 ldi8	r4, 0x51
 f6 3c                 mul8	r7, r4
 1e                    add	r7, r6
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 74                 zext8	r4
 c2 63                 ldi8	r6, 0x63
 f6 32                 mul8	r4, r6
 13                    add	r4, r7
 f0 2c 29              stsp8	[sp+0x29], r4
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 63                 stsp16	[sp+0x8], r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c1 41                 ldi8	r5, 0x41
 f3 19                 mulu8.w	r6, r5
 fa 98                 lsr16i	r6, 0x8
 c1 fe                 ldi8	r5, 0xfe
 f3 1d                 mulu8.w	r7, r5
 f0 3f 10              stsp16	[sp+0x10], r7
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 16                    add	r5, r6
 f4 13                 ldsp16	r7, [sp+0x4]
 c2 51                 ldi8	r6, 0x51
 f3 1e                 mulu8.w	r7, r6
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 f4 73                 stsp16	[sp+0xc], r7
 f4 02                 ldsp16	r6, [sp+0x0]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 c2 41                 ldi8	r6, 0x41
 f6 36                 mul8	r5, r6
 14                    add	r5, r4
 c0 fe                 ldi8	r4, 0xfe
 f0 36 10              ldsp16	r6, [sp+0x10]
 88                    and	r6, r4
 19                    add	r6, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 74                 zext8	r4
 c1 51                 ldi8	r5, 0x51
 f6 31                 mul8	r4, r5
 12                    add	r4, r6
 f0 2c 2a              stsp8	[sp+0x2a], r4
 fa 78                 lsr16i	r4, 0x8
 f4 31                 ldsp16	r5, [sp+0xc]
 11                    add	r4, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 13                 ldsp16	r7, [sp+0x4]
 f4 61                 stsp16	[sp+0x8], r5
 f4 53                 stsp16	[sp+0x4], r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 09                    mov	r6, r5
 c1 41                 ldi8	r5, 0x41
 f3 19                 mulu8.w	r6, r5
 fa 98                 lsr16i	r6, 0x8
 06                    mov	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 c2 90                 ldi8	r6, 0x90
 f3 1e                 mulu8.w	r7, r6
 f0 3f 10              stsp16	[sp+0x10], r7
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 f4 73                 stsp16	[sp+0xc], r7
 f4 13                 ldsp16	r7, [sp+0x4]
 c1 fe                 ldi8	r5, 0xfe
 f3 1d                 mulu8.w	r7, r5
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f4 32                 ldsp16	r6, [sp+0xc]
 16                    add	r5, r6
 f4 71                 stsp16	[sp+0xc], r5
 f0 00 f0              ldi8	r0, 0xf0
 f0 35 10              ldsp16	r5, [sp+0x10]
 f9 a0                 and	r5, r0
 14                    add	r5, r4
 09                    mov	r6, r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f1 74                 zext8	r4
 c1 41                 ldi8	r5, 0x41
 f6 31                 mul8	r4, r5
 12                    add	r4, r6
 c1 fe                 ldi8	r5, 0xfe
 8d                    and	r7, r5
 1c                    add	r7, r4
 f0 2f 2b              stsp8	[sp+0x2b], r7
 fa a8                 lsr16i	r7, 0x8
 f4 30                 ldsp16	r4, [sp+0xc]
 1c                    add	r7, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 62                 stsp16	[sp+0x8], r6
 f4 51                 stsp16	[sp+0x4], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c2 43                 ldi8	r6, 0x43
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 22                 ldsp16	r6, [sp+0x8]
 c1 90                 ldi8	r5, 0x90
 f3 19                 mulu8.w	r6, r5
 f0 3e 10              stsp16	[sp+0x10], r6
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 70                 stsp16	[sp+0xc], r4
 c0 41                 ldi8	r4, 0x41
 f4 32                 ldsp16	r6, [sp+0xc]
 f3 18                 mulu8.w	r6, r4
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f4 70                 stsp16	[sp+0xc], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 74                 zext8	r4
 c1 43                 ldi8	r5, 0x43
 f6 31                 mul8	r4, r5
 13                    add	r4, r7
 f0 35 10              ldsp16	r5, [sp+0x10]
 f9 a0                 and	r5, r0
 14                    add	r5, r4
 09                    mov	r6, r5
 f4 11                 ldsp16	r5, [sp+0x4]
 01                    mov	r4, r5
 f1 74                 zext8	r4
 c3 41                 ldi8	r7, 0x41
 f6 33                 mul8	r4, r7
 12                    add	r4, r6
 f0 2c 2c              stsp8	[sp+0x2c], r4
 fa 78                 lsr16i	r4, 0x8
 f4 32                 ldsp16	r6, [sp+0xc]
 12                    add	r4, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 63                 stsp16	[sp+0x8], r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c1 43                 ldi8	r5, 0x43
 f3 1d                 mulu8.w	r7, r5
 fa a8                 lsr16i	r7, 0x8
 07                    mov	r5, r7
 c3 3c                 ldi8	r7, 0x3c
 f3 1b                 mulu8.w	r6, r7
 f0 3e 10              stsp16	[sp+0x10], r6
 fa 98                 lsr16i	r6, 0x8
 19                    add	r6, r5
 f4 72                 stsp16	[sp+0xc], r6
 f4 12                 ldsp16	r6, [sp+0x4]
 c1 90                 ldi8	r5, 0x90
 f3 19                 mulu8.w	r6, r5
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 33                 ldsp16	r7, [sp+0xc]
 17                    add	r5, r7
 f4 71                 stsp16	[sp+0xc], r5
 c1 fc                 ldi8	r5, 0xfc
 f0 37 10              ldsp16	r7, [sp+0x10]
 8d                    and	r7, r5
 1c                    add	r7, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f1 74                 zext8	r4
 c1 43                 ldi8	r5, 0x43
 f6 31                 mul8	r4, r5
 13                    add	r4, r7
 f9 c0                 and	r6, r0
 18                    add	r6, r4
 f0 2e 2d              stsp8	[sp+0x2d], r6
 fa 98                 lsr16i	r6, 0x8
 f4 30                 ldsp16	r4, [sp+0xc]
 18                    add	r6, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 63                 stsp16	[sp+0x8], r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c3 99                 ldi8	r7, 0x99
 f3 13                 mulu8.w	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f4 23                 ldsp16	r7, [sp+0x8]
 c1 3c                 ldi8	r5, 0x3c
 f3 1d                 mulu8.w	r7, r5
 f0 3f 10              stsp16	[sp+0x10], r7
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 70                 stsp16	[sp+0xc], r4
 c0 43                 ldi8	r4, 0x43
 f4 33                 ldsp16	r7, [sp+0xc]
 f3 1c                 mulu8.w	r7, r4
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f4 70                 stsp16	[sp+0xc], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 74                 zext8	r4
 c1 99                 ldi8	r5, 0x99
 f6 31                 mul8	r4, r5
 12                    add	r4, r6
 c1 fc                 ldi8	r5, 0xfc
 f0 36 10              ldsp16	r6, [sp+0x10]
 89                    and	r6, r5
 18                    add	r6, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 74                 zext8	r4
 c1 43                 ldi8	r5, 0x43
 f6 31                 mul8	r4, r5
 12                    add	r4, r6
 f0 2c 2e              stsp8	[sp+0x2e], r4
 fa 78                 lsr16i	r4, 0x8
 f4 31                 ldsp16	r5, [sp+0xc]
 11                    add	r4, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 13                 ldsp16	r7, [sp+0x4]
 f4 61                 stsp16	[sp+0x8], r5
 f4 53                 stsp16	[sp+0x4], r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 09                    mov	r6, r5
 c1 99                 ldi8	r5, 0x99
 f3 19                 mulu8.w	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f4 72                 stsp16	[sp+0xc], r6
 f4 02                 ldsp16	r6, [sp+0x0]
 06                    mov	r5, r6
 c2 95                 ldi8	r6, 0x95
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 32                 ldsp16	r6, [sp+0xc]
 16                    add	r5, r6
 c2 3c                 ldi8	r6, 0x3c
 f3 1e                 mulu8.w	r7, r6
 f4 73                 stsp16	[sp+0xc], r7
 0b                    mov	r6, r7
 fa 98                 lsr16i	r6, 0x8
 19                    add	r6, r5
 f0 3e 10              stsp16	[sp+0x10], r6
 f4 02                 ldsp16	r6, [sp+0x0]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 c2 95                 ldi8	r6, 0x95
 f6 36                 mul8	r5, r6
 14                    add	r5, r4
 f4 22                 ldsp16	r6, [sp+0x8]
 02                    mov	r4, r6
 f1 74                 zext8	r4
 c3 99                 ldi8	r7, 0x99
 f6 33                 mul8	r4, r7
 11                    add	r4, r5
 c1 fc                 ldi8	r5, 0xfc
 f4 33                 ldsp16	r7, [sp+0xc]
 8d                    and	r7, r5
 1c                    add	r7, r4
 f0 2f 2f              stsp8	[sp+0x2f], r7
 fa a8                 lsr16i	r7, 0x8
 f0 34 10              ldsp16	r4, [sp+0x10]
 1c                    add	r7, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 73                 stsp16	[sp+0xc], r7
 f4 62                 stsp16	[sp+0x8], r6
 f4 51                 stsp16	[sp+0x4], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 06                    mov	r5, r6
 c0 95                 ldi8	r4, 0x95
 f3 14                 mulu8.w	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 02                    mov	r4, r6
 c2 62                 ldi8	r6, 0x62
 f3 12                 mulu8.w	r4, r6
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 19                    add	r6, r5
 07                    mov	r5, r7
 c3 99                 ldi8	r7, 0x99
 f3 17                 mulu8.w	r5, r7
 fa 88                 lsr16i	r5, 0x8
 16                    add	r5, r6
 c2 fe                 ldi8	r6, 0xfe
 82                    and	r4, r6
 f4 32                 ldsp16	r6, [sp+0xc]
 12                    add	r4, r6
 f4 22                 ldsp16	r6, [sp+0x8]
 f1 76                 zext8	r6
 c3 95                 ldi8	r7, 0x95
 f6 3b                 mul8	r6, r7
 18                    add	r6, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 74                 zext8	r4
 c3 99                 ldi8	r7, 0x99
 f6 33                 mul8	r4, r7
 12                    add	r4, r6
 f0 2c 30              stsp8	[sp+0x30], r4
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 63                 stsp16	[sp+0x8], r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c1 db                 ldi8	r5, 0xdb
 f3 19                 mulu8.w	r6, r5
 fa 98                 lsr16i	r6, 0x8
 c1 62                 ldi8	r5, 0x62
 f3 1d                 mulu8.w	r7, r5
 f0 3f 10              stsp16	[sp+0x10], r7
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 16                    add	r5, r6
 f4 13                 ldsp16	r7, [sp+0x4]
 c2 95                 ldi8	r6, 0x95
 f3 1e                 mulu8.w	r7, r6
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 f4 73                 stsp16	[sp+0xc], r7
 f4 02                 ldsp16	r6, [sp+0x0]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 c2 db                 ldi8	r6, 0xdb
 f6 36                 mul8	r5, r6
 14                    add	r5, r4
 c0 fe                 ldi8	r4, 0xfe
 f0 36 10              ldsp16	r6, [sp+0x10]
 88                    and	r6, r4
 19                    add	r6, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 74                 zext8	r4
 c1 95                 ldi8	r5, 0x95
 f6 31                 mul8	r4, r5
 12                    add	r4, r6
 f0 2c 31              stsp8	[sp+0x31], r4
 fa 78                 lsr16i	r4, 0x8
 f4 31                 ldsp16	r5, [sp+0xc]
 11                    add	r4, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 13                 ldsp16	r7, [sp+0x4]
 f4 61                 stsp16	[sp+0x8], r5
 f4 53                 stsp16	[sp+0x4], r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 09                    mov	r6, r5
 c1 db                 ldi8	r5, 0xdb
 f3 19                 mulu8.w	r6, r5
 fa 98                 lsr16i	r6, 0x8
 06                    mov	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 c2 c0                 ldi8	r6, 0xc0
 f3 1e                 mulu8.w	r7, r6
 f0 3f 10              stsp16	[sp+0x10], r7
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 f4 73                 stsp16	[sp+0xc], r7
 f4 13                 ldsp16	r7, [sp+0x4]
 c1 62                 ldi8	r5, 0x62
 f3 1d                 mulu8.w	r7, r5
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f4 32                 ldsp16	r6, [sp+0xc]
 16                    add	r5, r6
 f4 71                 stsp16	[sp+0xc], r5
 c1 c0                 ldi8	r5, 0xc0
 f0 36 10              ldsp16	r6, [sp+0x10]
 89                    and	r6, r5
 18                    add	r6, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f1 74                 zext8	r4
 c1 db                 ldi8	r5, 0xdb
 f6 31                 mul8	r4, r5
 12                    add	r4, r6
 c1 fe                 ldi8	r5, 0xfe
 8d                    and	r7, r5
 1c                    add	r7, r4
 f0 2f 32              stsp8	[sp+0x32], r7
 fa a8                 lsr16i	r7, 0x8
 f4 30                 ldsp16	r4, [sp+0xc]
 1c                    add	r7, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 62                 stsp16	[sp+0x8], r6
 f4 51                 stsp16	[sp+0x4], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c2 dd                 ldi8	r6, 0xdd
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 22                 ldsp16	r6, [sp+0x8]
 c1 c0                 ldi8	r5, 0xc0
 f3 19                 mulu8.w	r6, r5
 f0 3e 10              stsp16	[sp+0x10], r6
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 70                 stsp16	[sp+0xc], r4
 c0 db                 ldi8	r4, 0xdb
 f4 32                 ldsp16	r6, [sp+0xc]
 f3 18                 mulu8.w	r6, r4
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f4 70                 stsp16	[sp+0xc], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 74                 zext8	r4
 c1 dd                 ldi8	r5, 0xdd
 f6 31                 mul8	r4, r5
 13                    add	r4, r7
 c1 c0                 ldi8	r5, 0xc0
 f0 36 10              ldsp16	r6, [sp+0x10]
 89                    and	r6, r5
 18                    add	r6, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 74                 zext8	r4
 c1 db                 ldi8	r5, 0xdb
 f6 31                 mul8	r4, r5
 12                    add	r4, r6
 f0 2c 33              stsp8	[sp+0x33], r4
 fa 78                 lsr16i	r4, 0x8
 f4 31                 ldsp16	r5, [sp+0xc]
 11                    add	r4, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 13                 ldsp16	r7, [sp+0x4]
 f4 61                 stsp16	[sp+0x8], r5
 f4 53                 stsp16	[sp+0x4], r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 09                    mov	r6, r5
 c1 dd                 ldi8	r5, 0xdd
 f3 19                 mulu8.w	r6, r5
 fa 98                 lsr16i	r6, 0x8
 06                    mov	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 c2 34                 ldi8	r6, 0x34
 f3 1e                 mulu8.w	r7, r6
 f0 3f 10              stsp16	[sp+0x10], r7
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 f4 73                 stsp16	[sp+0xc], r7
 f4 13                 ldsp16	r7, [sp+0x4]
 c1 c0                 ldi8	r5, 0xc0
 f3 1d                 mulu8.w	r7, r5
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f4 32                 ldsp16	r6, [sp+0xc]
 16                    add	r5, r6
 f4 71                 stsp16	[sp+0xc], r5
 c1 fc                 ldi8	r5, 0xfc
 f0 36 10              ldsp16	r6, [sp+0x10]
 89                    and	r6, r5
 18                    add	r6, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f1 74                 zext8	r4
 c1 dd                 ldi8	r5, 0xdd
 f6 31                 mul8	r4, r5
 12                    add	r4, r6
 c1 c0                 ldi8	r5, 0xc0
 8d                    and	r7, r5
 1c                    add	r7, r4
 f0 2f 34              stsp8	[sp+0x34], r7
 fa a8                 lsr16i	r7, 0x8
 f4 30                 ldsp16	r4, [sp+0xc]
 1c                    add	r7, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 62                 stsp16	[sp+0x8], r6
 f4 51                 stsp16	[sp+0x4], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c2 f5                 ldi8	r6, 0xf5
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 22                 ldsp16	r6, [sp+0x8]
 c1 34                 ldi8	r5, 0x34
 f3 19                 mulu8.w	r6, r5
 f0 3e 10              stsp16	[sp+0x10], r6
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 70                 stsp16	[sp+0xc], r4
 c0 dd                 ldi8	r4, 0xdd
 f4 32                 ldsp16	r6, [sp+0xc]
 f3 18                 mulu8.w	r6, r4
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f4 70                 stsp16	[sp+0xc], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 74                 zext8	r4
 c1 f5                 ldi8	r5, 0xf5
 f6 31                 mul8	r4, r5
 13                    add	r4, r7
 c1 fc                 ldi8	r5, 0xfc
 f0 36 10              ldsp16	r6, [sp+0x10]
 89                    and	r6, r5
 18                    add	r6, r4
 f4 11                 ldsp16	r5, [sp+0x4]
 01                    mov	r4, r5
 f1 74                 zext8	r4
 c3 dd                 ldi8	r7, 0xdd
 f6 33                 mul8	r4, r7
 12                    add	r4, r6
 f0 2c 35              stsp8	[sp+0x35], r4
 fa 78                 lsr16i	r4, 0x8
 f4 32                 ldsp16	r6, [sp+0xc]
 12                    add	r4, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 63                 stsp16	[sp+0x8], r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 07                    mov	r5, r7
 c2 f5                 ldi8	r6, 0xf5
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 c2 d1                 ldi8	r6, 0xd1
 f3 1e                 mulu8.w	r7, r6
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 f4 12                 ldsp16	r6, [sp+0x4]
 c1 34                 ldi8	r5, 0x34
 f3 19                 mulu8.w	r6, r5
 f4 72                 stsp16	[sp+0xc], r6
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 17                    add	r5, r7
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 c2 d1                 ldi8	r6, 0xd1
 f6 3e                 mul8	r7, r6
 1c                    add	r7, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f1 74                 zext8	r4
 c2 f5                 ldi8	r6, 0xf5
 f6 32                 mul8	r4, r6
 13                    add	r4, r7
 c2 fc                 ldi8	r6, 0xfc
 f4 33                 ldsp16	r7, [sp+0xc]
 8e                    and	r7, r6
 1c                    add	r7, r4
 f0 2f 36              stsp8	[sp+0x36], r7
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 73                 stsp16	[sp+0xc], r7
 f4 62                 stsp16	[sp+0x8], r6
 f4 51                 stsp16	[sp+0x4], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 06                    mov	r5, r6
 c0 d1                 ldi8	r4, 0xd1
 f3 14                 mulu8.w	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 02                    mov	r4, r6
 c2 57                 ldi8	r6, 0x57
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 07                    mov	r5, r7
 c2 f5                 ldi8	r6, 0xf5
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f4 02                 ldsp16	r6, [sp+0x0]
 02                    mov	r4, r6
 f1 74                 zext8	r4
 c2 57                 ldi8	r6, 0x57
 f6 32                 mul8	r4, r6
 f4 32                 ldsp16	r6, [sp+0xc]
 12                    add	r4, r6
 f4 22                 ldsp16	r6, [sp+0x8]
 f1 76                 zext8	r6
 c3 d1                 ldi8	r7, 0xd1
 f6 3b                 mul8	r6, r7
 18                    add	r6, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 74                 zext8	r4
 c3 f5                 ldi8	r7, 0xf5
 f6 33                 mul8	r4, r7
 12                    add	r4, r6
 f0 2c 37              stsp8	[sp+0x37], r4
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 63                 stsp16	[sp+0x8], r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 07                    mov	r5, r7
 c2 57                 ldi8	r6, 0x57
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 c2 27                 ldi8	r6, 0x27
 f3 1e                 mulu8.w	r7, r6
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 f4 12                 ldsp16	r6, [sp+0x4]
 c1 d1                 ldi8	r5, 0xd1
 f3 19                 mulu8.w	r6, r5
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 f4 72                 stsp16	[sp+0xc], r6
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 c1 27                 ldi8	r5, 0x27
 f6 3d                 mul8	r7, r5
 1c                    add	r7, r4
 f4 21                 ldsp16	r5, [sp+0x8]
 f1 75                 zext8	r5
 c0 57                 ldi8	r4, 0x57
 f6 34                 mul8	r5, r4
 17                    add	r5, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 74                 zext8	r4
 c2 d1                 ldi8	r6, 0xd1
 f6 32                 mul8	r4, r6
 11                    add	r4, r5
 f0 2c 38              stsp8	[sp+0x38], r4
 fa 78                 lsr16i	r4, 0x8
 f4 31                 ldsp16	r5, [sp+0xc]
 11                    add	r4, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 63                 stsp16	[sp+0x8], r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 07                    mov	r5, r7
 c2 27                 ldi8	r6, 0x27
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 c2 fc                 ldi8	r6, 0xfc
 f3 1e                 mulu8.w	r7, r6
 0b                    mov	r6, r7
 fa 98                 lsr16i	r6, 0x8
 19                    add	r6, r5
 f0 3e 10              stsp16	[sp+0x10], r6
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 71                 stsp16	[sp+0xc], r5
 c1 57                 ldi8	r5, 0x57
 f4 32                 ldsp16	r6, [sp+0xc]
 f3 19                 mulu8.w	r6, r5
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f0 36 10              ldsp16	r6, [sp+0x10]
 16                    add	r5, r6
 c2 fc                 ldi8	r6, 0xfc
 8e                    and	r7, r6
 1c                    add	r7, r4
 f4 22                 ldsp16	r6, [sp+0x8]
 f1 76                 zext8	r6
 c0 27                 ldi8	r4, 0x27
 f6 38                 mul8	r6, r4
 1b                    add	r6, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 74                 zext8	r4
 c3 57                 ldi8	r7, 0x57
 f6 33                 mul8	r4, r7
 12                    add	r4, r6
 f0 2c 39              stsp8	[sp+0x39], r4
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 63                 stsp16	[sp+0x8], r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c1 29                 ldi8	r5, 0x29
 f3 19                 mulu8.w	r6, r5
 fa 98                 lsr16i	r6, 0x8
 c1 fc                 ldi8	r5, 0xfc
 f3 1d                 mulu8.w	r7, r5
 f0 3f 10              stsp16	[sp+0x10], r7
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 16                    add	r5, r6
 f4 13                 ldsp16	r7, [sp+0x4]
 c2 27                 ldi8	r6, 0x27
 f3 1e                 mulu8.w	r7, r6
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 f4 73                 stsp16	[sp+0xc], r7
 f4 02                 ldsp16	r6, [sp+0x0]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 c2 29                 ldi8	r6, 0x29
 f6 36                 mul8	r5, r6
 14                    add	r5, r4
 c0 fc                 ldi8	r4, 0xfc
 f0 36 10              ldsp16	r6, [sp+0x10]
 88                    and	r6, r4
 19                    add	r6, r5
 0e                    mov	r7, r6
 f4 11                 ldsp16	r5, [sp+0x4]
 01                    mov	r4, r5
 f1 74                 zext8	r4
 c2 27                 ldi8	r6, 0x27
 f6 32                 mul8	r4, r6
 13                    add	r4, r7
 f0 2c 3a              stsp8	[sp+0x3a], r4
 fa 78                 lsr16i	r4, 0x8
 f4 32                 ldsp16	r6, [sp+0xc]
 12                    add	r4, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 63                 stsp16	[sp+0x8], r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 07                    mov	r5, r7
 c2 29                 ldi8	r6, 0x29
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 c3 15                 ldi8	r7, 0x15
 f3 1b                 mulu8.w	r6, r7
 fa 98                 lsr16i	r6, 0x8
 19                    add	r6, r5
 f4 13                 ldsp16	r7, [sp+0x4]
 c1 fc                 ldi8	r5, 0xfc
 f3 1d                 mulu8.w	r7, r5
 f4 73                 stsp16	[sp+0xc], r7
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 16                    add	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f1 76                 zext8	r6
 c3 15                 ldi8	r7, 0x15
 f6 3b                 mul8	r6, r7
 18                    add	r6, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f1 74                 zext8	r4
 c3 29                 ldi8	r7, 0x29
 f6 33                 mul8	r4, r7
 12                    add	r4, r6
 c2 fc                 ldi8	r6, 0xfc
 f4 33                 ldsp16	r7, [sp+0xc]
 8e                    and	r7, r6
 1c                    add	r7, r4
 f0 2f 3b              stsp8	[sp+0x3b], r7
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 73                 stsp16	[sp+0xc], r7
 f4 62                 stsp16	[sp+0x8], r6
 f4 51                 stsp16	[sp+0x4], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 06                    mov	r5, r6
 c0 15                 ldi8	r4, 0x15
 f3 14                 mulu8.w	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 02                    mov	r4, r6
 c2 44                 ldi8	r6, 0x44
 f3 12                 mulu8.w	r4, r6
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 19                    add	r6, r5
 07                    mov	r5, r7
 c3 29                 ldi8	r7, 0x29
 f3 17                 mulu8.w	r5, r7
 fa 88                 lsr16i	r5, 0x8
 16                    add	r5, r6
 c2 fc                 ldi8	r6, 0xfc
 82                    and	r4, r6
 f4 32                 ldsp16	r6, [sp+0xc]
 12                    add	r4, r6
 f4 22                 ldsp16	r6, [sp+0x8]
 f1 76                 zext8	r6
 c3 15                 ldi8	r7, 0x15
 f6 3b                 mul8	r6, r7
 18                    add	r6, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 74                 zext8	r4
 c3 29                 ldi8	r7, 0x29
 f6 33                 mul8	r4, r7
 12                    add	r4, r6
 f0 2c 3c              stsp8	[sp+0x3c], r4
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 13                 ldsp16	r7, [sp+0x4]
 f4 53                 stsp16	[sp+0x4], r7
 f4 61                 stsp16	[sp+0x8], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 09                    mov	r6, r5
 c1 44                 ldi8	r5, 0x44
 f3 19                 mulu8.w	r6, r5
 f0 3e 10              stsp16	[sp+0x10], r6
 fa 98                 lsr16i	r6, 0x8
 f4 72                 stsp16	[sp+0xc], r6
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 c1 4e                 ldi8	r5, 0x4e
 f3 1d                 mulu8.w	r7, r5
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f4 32                 ldsp16	r6, [sp+0xc]
 16                    add	r5, r6
 f0 3d 18              stsp16	[sp+0x18], r5
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 72                 stsp16	[sp+0xc], r6
 c2 15                 ldi8	r6, 0x15
 f4 31                 ldsp16	r5, [sp+0xc]
 f3 16                 mulu8.w	r5, r6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f0 35 18              ldsp16	r5, [sp+0x18]
 19                    add	r6, r5
 f4 72                 stsp16	[sp+0xc], r6
 c1 fe                 ldi8	r5, 0xfe
 8d                    and	r7, r5
 1c                    add	r7, r4
 c0 fc                 ldi8	r4, 0xfc
 f0 35 10              ldsp16	r5, [sp+0x10]
 84                    and	r5, r4
 17                    add	r5, r7
 f4 12                 ldsp16	r6, [sp+0x4]
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 c0 15                 ldi8	r4, 0x15
 f6 3c                 mul8	r7, r4
 1d                    add	r7, r5
 f0 2f 3d              stsp8	[sp+0x3d], r7
 fa a8                 lsr16i	r7, 0x8
 f4 30                 ldsp16	r4, [sp+0xc]
 1c                    add	r7, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 61                 stsp16	[sp+0x8], r5
 f4 52                 stsp16	[sp+0x4], r6
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 09                    mov	r6, r5
 c0 4e                 ldi8	r4, 0x4e
 f3 18                 mulu8.w	r6, r4
 f4 72                 stsp16	[sp+0xc], r6
 fa 98                 lsr16i	r6, 0x8
 f4 00                 ldsp16	r4, [sp+0x0]
 c1 6e                 ldi8	r5, 0x6e
 f3 11                 mulu8.w	r4, r5
 f0 3c 18              stsp16	[sp+0x18], r4
 fa 78                 lsr16i	r4, 0x8
 12                    add	r4, r6
 f0 3c 10              stsp16	[sp+0x10], r4
 f4 10                 ldsp16	r4, [sp+0x4]
 c2 44                 ldi8	r6, 0x44
 f3 12                 mulu8.w	r4, r6
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 35 10              ldsp16	r5, [sp+0x10]
 19                    add	r6, r5
 f0 3e 10              stsp16	[sp+0x10], r6
 c2 fe                 ldi8	r6, 0xfe
 f0 35 18              ldsp16	r5, [sp+0x18]
 86                    and	r5, r6
 17                    add	r5, r7
 f4 33                 ldsp16	r7, [sp+0xc]
 8e                    and	r7, r6
 1d                    add	r7, r5
 c1 fc                 ldi8	r5, 0xfc
 81                    and	r4, r5
 13                    add	r4, r7
 f0 2c 3e              stsp8	[sp+0x3e], r4
 fa 78                 lsr16i	r4, 0x8
 f0 35 10              ldsp16	r5, [sp+0x10]
 11                    add	r4, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 63                 stsp16	[sp+0x8], r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c1 83                 ldi8	r5, 0x83
 0e                    mov	r7, r6
 f3 1d                 mulu8.w	r7, r5
 fa a8                 lsr16i	r7, 0x8
 f4 21                 ldsp16	r5, [sp+0x8]
 c2 6e                 ldi8	r6, 0x6e
 f3 16                 mulu8.w	r5, r6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 f0 3e 10              stsp16	[sp+0x10], r6
 f4 12                 ldsp16	r6, [sp+0x4]
 c3 4e                 ldi8	r7, 0x4e
 f3 1b                 mulu8.w	r6, r7
 f4 72                 stsp16	[sp+0xc], r6
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 f0 36 10              ldsp16	r6, [sp+0x10]
 1e                    add	r7, r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f4 02                 ldsp16	r6, [sp+0x0]
 f1 76                 zext8	r6
 c3 83                 ldi8	r7, 0x83
 f6 3b                 mul8	r6, r7
 18                    add	r6, r4
 c0 fe                 ldi8	r4, 0xfe
 84                    and	r5, r4
 16                    add	r5, r6
 f4 33                 ldsp16	r7, [sp+0xc]
 8c                    and	r7, r4
 1d                    add	r7, r5
 f0 2f 3f              stsp8	[sp+0x3f], r7
 fa a8                 lsr16i	r7, 0x8
 f0 34 10              ldsp16	r4, [sp+0x10]
 1c                    add	r7, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 73                 stsp16	[sp+0xc], r7
 f4 62                 stsp16	[sp+0x8], r6
 f4 51                 stsp16	[sp+0x4], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 06                    mov	r5, r6
 c0 83                 ldi8	r4, 0x83
 f3 14                 mulu8.w	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 02                    mov	r4, r6
 c2 f9                 ldi8	r6, 0xf9
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 07                    mov	r5, r7
 c2 6e                 ldi8	r6, 0x6e
 f3 16                 mulu8.w	r5, r6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 18                    add	r6, r4
 f0 3e 10              stsp16	[sp+0x10], r6
 f4 02                 ldsp16	r6, [sp+0x0]
 02                    mov	r4, r6
 f1 74                 zext8	r4
 c2 f9                 ldi8	r6, 0xf9
 f6 32                 mul8	r4, r6
 f4 32                 ldsp16	r6, [sp+0xc]
 12                    add	r4, r6
 f4 23                 ldsp16	r7, [sp+0x8]
 f1 77                 zext8	r7
 c2 83                 ldi8	r6, 0x83
 f6 3e                 mul8	r7, r6
 1c                    add	r7, r4
 c0 fe                 ldi8	r4, 0xfe
 84                    and	r5, r4
 17                    add	r5, r7
 f0 2d 40              stsp8	[sp+0x40], r5
 fa 88                 lsr16i	r5, 0x8
 f0 34 10              ldsp16	r4, [sp+0x10]
 14                    add	r5, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 13                 ldsp16	r7, [sp+0x4]
 f4 60                 stsp16	[sp+0x8], r4
 f4 53                 stsp16	[sp+0x4], r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 08                    mov	r6, r4
 c0 f9                 ldi8	r4, 0xf9
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f4 72                 stsp16	[sp+0xc], r6
 c0 a2                 ldi8	r4, 0xa2
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 f3 1c                 mulu8.w	r7, r4
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f4 32                 ldsp16	r6, [sp+0xc]
 12                    add	r4, r6
 f4 70                 stsp16	[sp+0xc], r4
 f4 10                 ldsp16	r4, [sp+0x4]
 c2 83                 ldi8	r6, 0x83
 f3 12                 mulu8.w	r4, r6
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f4 30                 ldsp16	r4, [sp+0xc]
 18                    add	r6, r4
 c0 fe                 ldi8	r4, 0xfe
 8c                    and	r7, r4
 1d                    add	r7, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 f1 75                 zext8	r5
 c0 f9                 ldi8	r4, 0xf9
 f6 34                 mul8	r5, r4
 17                    add	r5, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 74                 zext8	r4
 c3 83                 ldi8	r7, 0x83
 f6 33                 mul8	r4, r7
 11                    add	r4, r5
 f0 2c 41              stsp8	[sp+0x41], r4
 fa 78                 lsr16i	r4, 0x8
 12                    add	r4, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 51                 stsp16	[sp+0x4], r5
 f4 63                 stsp16	[sp+0x8], r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 09                    mov	r6, r5
 c1 f9                 ldi8	r5, 0xf9
 f3 19                 mulu8.w	r6, r5
 fa 98                 lsr16i	r6, 0x8
 c1 a2                 ldi8	r5, 0xa2
 f3 1d                 mulu8.w	r7, r5
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 16                    add	r5, r6
 f4 71                 stsp16	[sp+0xc], r5
 f4 12                 ldsp16	r6, [sp+0x4]
 f1 76                 zext8	r6
 c1 f9                 ldi8	r5, 0xf9
 f6 39                 mul8	r6, r5
 c1 fe                 ldi8	r5, 0xfe
 8d                    and	r7, r5
 1c                    add	r7, r4
 1e                    add	r7, r6
 f0 2f 42              stsp8	[sp+0x42], r7
 fa a8                 lsr16i	r7, 0x8
 f4 30                 ldsp16	r4, [sp+0xc]
 1c                    add	r7, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 51                 stsp16	[sp+0x4], r5
 f4 62                 stsp16	[sp+0x8], r6
 c2 a2                 ldi8	r6, 0xa2
 f3 16                 mulu8.w	r5, r6
 c2 fe                 ldi8	r6, 0xfe
 89                    and	r6, r5
 1b                    add	r6, r7
 f0 2e 43              stsp8	[sp+0x43], r6
 fa 98                 lsr16i	r6, 0x8
 0d                    mov	r7, r5
 fa a8                 lsr16i	r7, 0x8
 1e                    add	r7, r6
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 43                 stsp16	[sp+0x0], r7
 f0 36 14              ldsp16	r6, [sp+0x14]
 fa 97                 lsr16i	r6, 0x7
 f1 76                 zext8	r6
 c5 96 01              ldi16	r5, 0x196
 02                    mov	r4, r6
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 26                    sub	r5, r6
 f0 01 07              ldi8	r1, 0x7
 0d                    mov	r7, r5
 f9 e4                 and	r7, r1
 fa 83                 lsr16i	r5, 0x3
 f0 10 22              leasp	r0, 0x22
 f2 24                 add	r5, r0
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 2c 44              stsp8	[sp+0x44], r4
 41                    ld8u	r4, [r5]
 fa 13                 lsr16v	r4, r7
 cf 07                 cmpi.s8	r7, 0x7
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_rem_pio2f
		R_AVM_FAR24	.text.__kernel_rem_pio2f+0xa24
<L0>:
 ed aa 21              ld8u	r5, [r5+1]
 15                    add	r5, r5
 91                    or	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 c5 76 01              ldi16	r5, 0x176
 f0 36 14              ldsp16	r6, [sp+0x14]
 26                    sub	r5, r6
 09                    mov	r6, r5
 fa 93                 lsr16i	r6, 0x3
 f2 06                 add	r0, r6
 f9 a4                 and	r5, r1
 f4 71                 stsp16	[sp+0xc], r5
 c0 0f                 ldi8	r4, 0xf
 09                    mov	r6, r5
 a8                    xor	r6, r4
 f4 62                 stsp16	[sp+0x8], r6
 f0 6a c0              ld32	q3, [r0]
 03                    mov	r4, r7
 10                    add	r4, r4
 f4 50                 stsp16	[sp+0x4], r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 11                 ldsp16	r5, [sp+0x4]
 fa 04                 shl16v	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 f4 31                 ldsp16	r5, [sp+0xc]
 fa 19                 lsr16v	r6, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 98                    or	r6, r4
 fa 1d                 lsr16v	r7, r5
 f1 16                 mov	r2, r6
 f1 1f                 mov	r3, r7
 f4 a5                 tst8	r5
 f0 01 20              ldi8	r1, 0x20
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_rem_pio2f
		R_AVM_FAR24	.text.__kernel_rem_pio2f+0xa7c
<L1>:
 f1 21                 mov	r4, r1
 21                    sub	r4, r5
 08                    mov	r6, r4
 af                    xor	r7, r7
 ed 80 24              ld8u	r4, [r0+4]
 a5                    xor	r5, r5
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f9 89                 or	r4, r2
 f9 ad                 or	r5, r3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 e2 00 00 00           jmpf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__kernel_rem_pio2f+0xa82
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 c0 03                 ldi8	r4, 0x3
 f4 60                 stsp16	[sp+0x8], r4
 c4 56 01              ldi16	r4, 0x156
 f0 36 14              ldsp16	r6, [sp+0x14]
 22                    sub	r4, r6
 08                    mov	r6, r4
 fa 93                 lsr16i	r6, 0x3
 f0 10 22              leasp	r0, 0x22
 f2 06                 add	r0, r6
 c1 07                 ldi8	r5, 0x7
 81                    and	r4, r5
 f0 3c 14              stsp16	[sp+0x14], r4
 c1 0f                 ldi8	r5, 0xf
 a4                    xor	r5, r4
 f0 6a c0              ld32	q3, [r0]
 03                    mov	r4, r7
 10                    add	r4, r4
 fa 01                 shl16v	r4, r5
 f0 35 14              ldsp16	r5, [sp+0x14]
 fa 19                 lsr16v	r6, r5
 98                    or	r6, r4
 fa 1d                 lsr16v	r7, r5
 f1 16                 mov	r2, r6
 f1 1f                 mov	r3, r7
 01                    mov	r4, r5
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_rem_pio2f
		R_AVM_FAR24	.text.__kernel_rem_pio2f+0xacf
<L2>:
 f2 3c                 sub	r1, r4
 f1 29                 mov	r6, r1
 af                    xor	r7, r7
 ed 80 24              ld8u	r4, [r0+4]
 a5                    xor	r5, r5
 e3 00 00 00           callf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_ashlsi3
 f9 89                 or	r4, r2
 f9 ad                 or	r5, r3
 e2 00 00 00           jmpf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__kernel_rem_pio2f+0xad1
 f2 69                 mov32	q2, q1
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 03                 ldsp16	r7, [sp+0x0]
 8e                    and	r7, r6
 f4 43                 stsp16	[sp+0x0], r7
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 69 0c              cmp32	q0, q3
 d3 04                 brslt8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_rem_pio2f
		R_AVM_FAR24	.text.__kernel_rem_pio2f+0xaf5
<L3>:
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 e2 00 00 00           jmpf	__kernel_rem_pio2f
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__kernel_rem_pio2f+0xb1d
 f2 63                 mov32	q0, q3
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f9 0a                 xor	r0, r2
 f9 2e                 xor	r1, r3
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 f8 06                 cset.eq	r6
 af                    xor	r7, r7
 f7 6c                 add32	q3, q0
 f7 76                 sub32	q1, q2
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 ac                 inc16	r4
 f4 40                 stsp16	[sp+0x0], r4
 c4 ff ff              ldi16	r4, 0xffff
 a5                    xor	r5, r5
 f1 07                 mov	r0, r7
 f2 39                 sub	r1, r1
 88                    and	r6, r4
 8d                    and	r7, r5
 ff c5 0f              u32tof	q3, q3
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 aa                    xor	r6, r6
 c7 80 2f              ldi16	r7, 0x2f80
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 ff 27                 fmul	q1, q3
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 ff c5 00              u32tof	q0, q0
 c7 80 37              ldi16	r7, 0x3780
 ff 23                 fmul	q0, q3
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 f2 6a                 mov32	q3, q0
 f2 61                 mov32	q0, q1
 ff 0c                 fadd	q3, q0
 f0 04 00 f0           ldi16	r0, 0xf000
 f0 05 ff ff           ldi16	r1, 0xffff
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f9 88                 and	r4, r2
 ff c5 02              u32tof	q0, q2
 a0                    xor	r4, r4
 c5 80 1f              ldi16	r5, 0x1f80
 ff 22                 fmul	q0, q2
 f0 38 49              stsp16	[sp+0x49], r0
 f0 39 4b              stsp16	[sp+0x4b], r1
 f1 23                 mov	r4, r3
 a5                    xor	r5, r5
 ff c5 06              u32tof	q1, q2
 a0                    xor	r4, r4
 c5 80 27              ldi16	r5, 0x2780
 ff 26                 fmul	q1, q2
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f0 35 20              ldsp16	r5, [sp+0x20]
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 f2 67                 mov32	q1, q3
 ff 26                 fmul	q1, q2
 f0 3a 18              stsp16	[sp+0x18], r2
 f0 3b 1a              stsp16	[sp+0x1a], r3
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f2 30                 sub	r0, r0
 f0 05 c9 3f           ldi16	r1, 0x3fc9
 ff 28                 fmul	q2, q0
 ff 19                 fsub	q2, q1
 f0 04 00 a0           ldi16	r0, 0xa000
 f0 05 fd 39           ldi16	r1, 0x39fd
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 ff 24                 fmul	q1, q0
 ff 06                 fadd	q1, q2
 f0 3a 45              stsp16	[sp+0x45], r2
 f0 3b 47              stsp16	[sp+0x47], r3
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 30 49              ldsp16	r0, [sp+0x49]
 f0 31 4b              ldsp16	r1, [sp+0x4b]
 ff 08                 fadd	q2, q0
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 c4 69 21              ldi16	r4, 0x2169
 c5 a2 33              ldi16	r5, 0x33a2
 f2 63                 mov32	q0, q3
 ff 22                 fmul	q0, q2
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 ff 1b                 fsub	q2, q3
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 ff 1e                 fsub	q3, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 42                 sub	r2, r2
 f0 07 c9 3f           ldi16	r3, 0x3fc9
 ff 29                 fmul	q2, q1
 f0 32 45              ldsp16	r2, [sp+0x45]
 f0 33 47              ldsp16	r3, [sp+0x47]
 ff 09                 fadd	q2, q1
 f0 06 00 a0           ldi16	r2, 0xa000
 f0 07 fd 39           ldi16	r3, 0x39fd
 ff 2d                 fmul	q3, q1
 ff 0e                 fadd	q3, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 32 14              ldsp16	r2, [sp+0x14]
 f0 33 16              ldsp16	r3, [sp+0x16]
 ff 09                 fadd	q2, q1
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 ff 06                 fadd	q1, q2
 c4 da 0f              ldi16	r4, 0xfda
 c5 c9 3f              ldi16	r5, 0x3fc9
 ff 26                 fmul	q1, q2
 ff 01                 fadd	q0, q1
 ff 03                 fadd	q0, q3
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 08                 fadd	q2, q0
 ff 1e                 fsub	q3, q2
 ff 03                 fadd	q0, q3
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 69 c4              cmp32	q3, q1
 d9 04                 brsge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__kernel_rem_pio2f
		R_AVM_FAR24	.text.__kernel_rem_pio2f+0xc72
<L4>:
 ff 60                 fneg	q0
 ff 62                 fneg	q2
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 26                    sub	r5, r6
 02                    mov	r4, r6
 f0 32 1e              ldsp16	r2, [sp+0x1e]
 f0 33 20              ldsp16	r3, [sp+0x20]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 fd 25                 cmov.slt	r4, r5
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 6b 4c              st32	[r6], q1
 ca 04                 addi.s8	r6, 0x4
 f0 6b 0c              st32	[r6], q0
 d6 4d                 adjsp	0x4d
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
