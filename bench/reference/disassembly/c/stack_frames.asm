
stack_frames.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b1                    push16	r1
 b0                    push16	r0
 d7 01                 sys	debug_break
 f0 50 00 01           ldm16	r0, [0x100]
 f1 20                 mov	r4, r0
 e1 fd 00              call16	outer
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 21                 mov	r4, r1
 f4 ac                 inc16	r4
 e1 f2 00              call16	outer
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f1 20                 mov	r4, r0
 c8 02                 addi.s8	r4, 0x2
 e1 e7 00              call16	outer
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 21                 mov	r4, r1
 c8 03                 addi.s8	r4, 0x3
 e1 dc 00              call16	outer
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f1 20                 mov	r4, r0
 c8 04                 addi.s8	r4, 0x4
 e1 d1 00              call16	outer
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 21                 mov	r4, r1
 c8 05                 addi.s8	r4, 0x5
 e1 c6 00              call16	outer
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f1 20                 mov	r4, r0
 c8 06                 addi.s8	r4, 0x6
 e1 bb 00              call16	outer
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 21                 mov	r4, r1
 c8 07                 addi.s8	r4, 0x7
 e1 b0 00              call16	outer
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f1 20                 mov	r4, r0
 c8 08                 addi.s8	r4, 0x8
 e1 a5 00              call16	outer
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 21                 mov	r4, r1
 c8 09                 addi.s8	r4, 0x9
 e1 9a 00              call16	outer
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f1 20                 mov	r4, r0
 c8 0a                 addi.s8	r4, 0xa
 e1 8f 00              call16	outer
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 21                 mov	r4, r1
 c8 0b                 addi.s8	r4, 0xb
 e1 84 00              call16	outer
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f1 20                 mov	r4, r0
 c8 0c                 addi.s8	r4, 0xc
 d5 7a                 call8	outer
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 21                 mov	r4, r1
 c8 0d                 addi.s8	r4, 0xd
 d5 70                 call8	outer
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f1 20                 mov	r4, r0
 c8 0e                 addi.s8	r4, 0xe
 d5 66                 call8	outer
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 21                 mov	r4, r1
 c8 0f                 addi.s8	r4, 0xf
 d5 5c                 call8	outer
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f1 20                 mov	r4, r0
 c8 10                 addi.s8	r4, 0x10
 d5 52                 call8	outer
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 21                 mov	r4, r1
 c8 11                 addi.s8	r4, 0x11
 d5 48                 call8	outer
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f1 20                 mov	r4, r0
 c8 12                 addi.s8	r4, 0x12
 d5 3e                 call8	outer
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 21                 mov	r4, r1
 c8 13                 addi.s8	r4, 0x13
 d5 34                 call8	outer
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f1 20                 mov	r4, r0
 c8 14                 addi.s8	r4, 0x14
 d5 2a                 call8	outer
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 21                 mov	r4, r1
 c8 15                 addi.s8	r4, 0x15
 d5 20                 call8	outer
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f1 20                 mov	r4, r0
 c8 16                 addi.s8	r4, 0x16
 d5 16                 call8	outer
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 21                 mov	r4, r1
 c8 17                 addi.s8	r4, 0x17
 d5 0c                 call8	outer
 f2 21                 add	r4, r1
 f0 5c 02 01           stm16	[0x102], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<outer>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 f1 04                 mov	r0, r4
 d5 48                 call8	middle
 f4 50                 stsp16	[sp+0x4], r4
 f1 20                 mov	r4, r0
 c8 1f                 addi.s8	r4, 0x1f
 d5 40                 call8	middle
 f4 48                 stsp16	[sp+0x2], r4
 f1 20                 mov	r4, r0
 c8 3e                 addi.s8	r4, 0x3e
 d5 38                 call8	middle
 f4 40                 stsp16	[sp+0x0], r4
 f1 20                 mov	r4, r0
 c8 5d                 addi.s8	r4, 0x5d
 d5 30                 call8	middle
 f1 0c                 mov	r1, r4
 f1 20                 mov	r4, r0
 c8 7c                 addi.s8	r4, 0x7c
 d5 28                 call8	middle
 f1 14                 mov	r2, r4
 c0 9b                 ldi8	r4, 0x9b
 f2 20                 add	r4, r0
 d5 20                 call8	middle
 f1 1c                 mov	r3, r4
 c0 ba                 ldi8	r4, 0xba
 f2 20                 add	r4, r0
 d5 18                 call8	middle
 f9 8e                 xor	r4, r3
 f9 8a                 xor	r4, r2
 f9 86                 xor	r4, r1
 f4 01                 ldsp16	r5, [sp+0x0]
 a1                    xor	r4, r5
 f4 09                 ldsp16	r5, [sp+0x2]
 a1                    xor	r4, r5
 f4 11                 ldsp16	r5, [sp+0x4]
 a1                    xor	r4, r5
 f9 82                 xor	r4, r0
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<middle>:
 b1                    push16	r1
 b0                    push16	r0
 d6 e9                 adjsp	-0x17
 f1 04                 mov	r0, r4
 c8 1e                 addi.s8	r4, 0x1e
 f0 2c 16              stsp8	[sp+0x16], r4
 c8 f3                 addi.s8	r4, -0xd
 f0 2c 15              stsp8	[sp+0x15], r4
 c8 f3                 addi.s8	r4, -0xd
 f0 2c 14              stsp8	[sp+0x14], r4
 c8 f3                 addi.s8	r4, -0xd
 f0 2c 13              stsp8	[sp+0x13], r4
 c8 f3                 addi.s8	r4, -0xd
 f0 2c 12              stsp8	[sp+0x12], r4
 c8 f3                 addi.s8	r4, -0xd
 f0 2c 11              stsp8	[sp+0x11], r4
 c8 f3                 addi.s8	r4, -0xd
 f0 2c 10              stsp8	[sp+0x10], r4
 c8 f3                 addi.s8	r4, -0xd
 f1 6c                 stsp8	[sp+0xf], r4
 c8 f3                 addi.s8	r4, -0xd
 f1 68                 stsp8	[sp+0xe], r4
 c8 f3                 addi.s8	r4, -0xd
 f1 64                 stsp8	[sp+0xd], r4
 c8 f3                 addi.s8	r4, -0xd
 f1 60                 stsp8	[sp+0xc], r4
 c8 f3                 addi.s8	r4, -0xd
 f1 5c                 stsp8	[sp+0xb], r4
 c8 f3                 addi.s8	r4, -0xd
 f1 58                 stsp8	[sp+0xa], r4
 c8 f3                 addi.s8	r4, -0xd
 f1 54                 stsp8	[sp+0x9], r4
 c8 f3                 addi.s8	r4, -0xd
 f1 50                 stsp8	[sp+0x8], r4
 c8 f3                 addi.s8	r4, -0xd
 f1 4c                 stsp8	[sp+0x7], r4
 c8 f3                 addi.s8	r4, -0xd
 f1 48                 stsp8	[sp+0x6], r4
 c8 f3                 addi.s8	r4, -0xd
 f1 44                 stsp8	[sp+0x5], r4
 c8 f3                 addi.s8	r4, -0xd
 f1 40                 stsp8	[sp+0x4], r4
 c8 f3                 addi.s8	r4, -0xd
 f1 3c                 stsp8	[sp+0x3], r4
 c8 f3                 addi.s8	r4, -0xd
 f1 38                 stsp8	[sp+0x2], r4
 c8 f3                 addi.s8	r4, -0xd
 f1 34                 stsp8	[sp+0x1], r4
 f0 28 00              stsp8	[sp+0x0], r0
 f0 14 00              leasp	r4, 0x0
 c1 17                 ldi8	r5, 0x17
 f1 28                 mov	r6, r0
 d5 12                 call8	leaf
 f1 0c                 mov	r1, r4
 f0 14 03              leasp	r4, 0x3
 c1 11                 ldi8	r5, 0x11
 f1 28                 mov	r6, r0
 d5 07                 call8	leaf
 f9 86                 xor	r4, r1
 d6 17                 adjsp	0x17
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<leaf>:
 1a                    add	r6, r6
 f7 07                 ld8u	r7, [r4+]
 ab                    xor	r6, r7
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f6                 brne8	leaf
 02                    mov	r4, r6
 ef                    ret

<memset>:
 0c                    mov	r7, r4
 d7 11                 sys	memset
 03                    mov	r4, r7
 ef                    ret

<__avm_umulhisi3>:
 d6 fa                 adjsp	-0x6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f4 52                 stsp16	[sp+0x4], r6
 f1 75                 zext8	r5
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 f3 19                 mulu8.w	r6, r5
 f4 4a                 stsp16	[sp+0x2], r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f3 1b                 mulu8.w	r6, r7
 f4 42                 stsp16	[sp+0x0], r6
 fa 78                 lsr16i	r4, 0x8
 f4 13                 ldsp16	r7, [sp+0x4]
 08                    mov	r6, r4
 f3 1b                 mulu8.w	r6, r7
 f3 11                 mulu8.w	r4, r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 16                    add	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 fa 38                 lsl16i	r4, 0x8
 f4 09                 ldsp16	r5, [sp+0x2]
 14                    add	r5, r4
 34                    cmp	r5, r4
 f8 14                 cset.ult	r4
 13                    add	r4, r7
 fa 58                 lsl16i	r6, 0x8
 19                    add	r6, r5
 39                    cmp	r6, r5
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 02                    mov	r4, r6
 d6 06                 adjsp	0x6
 ef                    ret

<__avm_mulsi3>:
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f1 05                 mov	r0, r5
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 f2 24                 add	r5, r0
 f4 61                 stsp16	[sp+0x8], r5
 06                    mov	r5, r6
 fa 8f                 lsr16i	r5, 0xf
 17                    add	r5, r7
 fe 2c                 mul16	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 21                 ldsp16	r5, [sp+0x8]
 fe 2e                 mul16	r5, r6
 f4 61                 stsp16	[sp+0x8], r5
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 51                 stsp16	[sp+0x4], r5
 f1 76                 zext8	r6
 04                    mov	r5, r4
 f1 75                 zext8	r5
 0d                    mov	r7, r5
 f3 1e                 mulu8.w	r7, r6
 f4 43                 stsp16	[sp+0x0], r7
 f4 13                 ldsp16	r7, [sp+0x4]
 f3 3d                 mulsu8.w	r7, r5
 f4 5b                 stsp16	[sp+0x6], r7
 fa 78                 lsr16i	r4, 0x8
 0c                    mov	r7, r4
 f4 11                 ldsp16	r5, [sp+0x4]
 f3 2d                 muls8.w	r7, r5
 f3 32                 mulsu8.w	r4, r6
 04                    mov	r5, r4
 fa c8                 asr16i	r5, 0x8
 17                    add	r5, r7
 f4 1a                 ldsp16	r6, [sp+0x6]
 fa d8                 asr16i	r6, 0x8
 19                    add	r6, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 19                    add	r6, r5
 fa 38                 lsl16i	r4, 0x8
 f4 03                 ldsp16	r7, [sp+0x0]
 1c                    add	r7, r4
 3c                    cmp	r7, r4
 f8 14                 cset.ult	r4
 12                    add	r4, r6
 f4 09                 ldsp16	r5, [sp+0x2]
 11                    add	r4, r5
 f4 19                 ldsp16	r5, [sp+0x6]
 fa 48                 lsl16i	r5, 0x8
 1d                    add	r7, r5
 3d                    cmp	r7, r5
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 03                    mov	r4, r7
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
