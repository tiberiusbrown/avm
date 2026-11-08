
wide_compare.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ea                 adjsp	-0x16
 c4 10 32              ldi16	r4, 0x3210
 c5 54 76              ldi16	r5, 0x7654
 c6 02 01              ldi16	r6, 0x102
 f0 6b 8c              st32	[r6], q2
 f0 04 98 ba           ldi16	r0, 0xba98
 f0 05 dc fe           ldi16	r1, 0xfedc
 c4 06 01              ldi16	r4, 0x106
 f0 6b 08              st32	[r4], q0
 c4 ea 72              ldi16	r4, 0x72ea
 c5 fb ff              ldi16	r5, 0xfffb
 c6 46 01              ldi16	r6, 0x146
 f0 6b 8c              st32	[r6], q2
 c4 cc 50              ldi16	r4, 0x50cc
 c5 d9 61              ldi16	r5, 0x61d9
 c6 42 01              ldi16	r6, 0x142
 f0 6b 8c              st32	[r6], q2
 f0 06 30 32           ldi16	r2, 0x3230
 f0 07 54 76           ldi16	r3, 0x7654
 c4 0a 01              ldi16	r4, 0x10a
 f0 6b 48              st32	[r4], q1
 c4 0e 01              ldi16	r4, 0x10e
 f0 6b 08              st32	[r4], q0
 c4 2f 96              ldi16	r4, 0x962f
 c5 fc ff              ldi16	r5, 0xfffc
 c6 4e 01              ldi16	r6, 0x14e
 f0 6b 8c              st32	[r6], q2
 c4 99 fc              ldi16	r4, 0xfc99
 c5 62 c9              ldi16	r5, 0xc962
 c6 4a 01              ldi16	r6, 0x14a
 f0 6b 8c              st32	[r6], q2
 c4 90 32              ldi16	r4, 0x3290
 c5 54 76              ldi16	r5, 0x7654
 c6 12 01              ldi16	r6, 0x112
 f0 6b 8c              st32	[r6], q2
 c4 16 01              ldi16	r4, 0x116
 f0 6b 08              st32	[r4], q0
 f2 64                 mov32	q1, q0
 c4 75 b9              ldi16	r4, 0xb975
 c5 fd ff              ldi16	r5, 0xfffd
 c6 56 01              ldi16	r6, 0x156
 f0 6b 8c              st32	[r6], q2
 c4 66 a8              ldi16	r4, 0xa866
 c5 ec 30              ldi16	r5, 0x30ec
 c6 52 01              ldi16	r6, 0x152
 f0 6b 8c              st32	[r6], q2
 c4 90 33              ldi16	r4, 0x3390
 c5 54 76              ldi16	r5, 0x7654
 c6 1a 01              ldi16	r6, 0x11a
 f0 6b 8c              st32	[r6], q2
 c4 1e 01              ldi16	r4, 0x11e
 f0 6b 48              st32	[r4], q1
 c4 ba dc              ldi16	r4, 0xdcba
 c5 fe ff              ldi16	r5, 0xfffe
 c6 5e 01              ldi16	r6, 0x15e
 f0 6b 8c              st32	[r6], q2
 c4 33 54              ldi16	r4, 0x5433
 c5 76 98              ldi16	r5, 0x9876
 c6 5a 01              ldi16	r6, 0x15a
 f0 6b 8c              st32	[r6], q2
 c4 10 36              ldi16	r4, 0x3610
 c5 54 76              ldi16	r5, 0x7654
 c6 22 01              ldi16	r6, 0x122
 f0 6b 8c              st32	[r6], q2
 c4 26 01              ldi16	r4, 0x126
 f0 6b 48              st32	[r4], q1
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 c4 66 01              ldi16	r4, 0x166
 f0 6b 08              st32	[r4], q0
 c4 62 01              ldi16	r4, 0x162
 f0 6b 08              st32	[r4], q0
 c4 10 38              ldi16	r4, 0x3810
 c6 2a 01              ldi16	r6, 0x12a
 f0 6b 8c              st32	[r6], q2
 c4 2e 01              ldi16	r4, 0x12e
 f0 6b 48              st32	[r4], q1
 c4 45 23              ldi16	r4, 0x2345
 c1 01                 ldi8	r5, 0x1
 c6 6e 01              ldi16	r6, 0x16e
 f0 6b 8c              st32	[r6], q2
 c4 cd ab              ldi16	r4, 0xabcd
 c5 89 67              ldi16	r5, 0x6789
 c6 6a 01              ldi16	r6, 0x16a
 f0 6b 8c              st32	[r6], q2
 c4 10 2a              ldi16	r4, 0x2a10
 c5 54 76              ldi16	r5, 0x7654
 c6 32 01              ldi16	r6, 0x132
 f0 6b 8c              st32	[r6], q2
 c4 36 01              ldi16	r4, 0x136
 f0 6b 48              st32	[r4], q1
 c4 8a 46              ldi16	r4, 0x468a
 c1 02                 ldi8	r5, 0x2
 c6 76 01              ldi16	r6, 0x176
 f0 6b 8c              st32	[r6], q2
 c4 9a 57              ldi16	r4, 0x579a
 c5 13 cf              ldi16	r5, 0xcf13
 c6 72 01              ldi16	r6, 0x172
 f0 6b 8c              st32	[r6], q2
 c4 3e 01              ldi16	r4, 0x13e
 f0 6b 48              st32	[r4], q1
 c4 10 0a              ldi16	r4, 0xa10
 c5 54 76              ldi16	r5, 0x7654
 c6 3a 01              ldi16	r6, 0x13a
 f0 6b 8c              st32	[r6], q2
 c4 d0 69              ldi16	r4, 0x69d0
 c1 03                 ldi8	r5, 0x3
 c6 7e 01              ldi16	r6, 0x17e
 f0 6b 8c              st32	[r6], q2
 c4 67 03              ldi16	r4, 0x367
 c5 9d 36              ldi16	r5, 0x369d
 c6 7a 01              ldi16	r6, 0x17a
 f0 6b 8c              st32	[r6], q2
 a5                    xor	r5, r5
 d7 01                 sys	debug_break
 09                    mov	r6, r5
<L0>:
 f0 3d 12              stsp16	[sp+0x12], r5
 c5 42 01              ldi16	r5, 0x142
 f0 04 02 01           ldi16	r0, 0x102
 c3 03                 ldi8	r7, 0x3
<L1>:
 f4 51                 stsp16	[sp+0x4], r5
 f4 4b                 stsp16	[sp+0x2], r7
 f0 38 14              stsp16	[sp+0x14], r0
 f4 62                 stsp16	[sp+0x8], r6
 03                    mov	r4, r7
 c8 06                 addi.s8	r4, 0x6
 c1 07                 ldi8	r5, 0x7
 84                    and	r5, r4
 15                    add	r5, r5
 15                    add	r5, r5
 15                    add	r5, r5
 01                    mov	r4, r5
 c6 02 01              ldi16	r6, 0x102
 12                    add	r4, r6
 f1 28                 mov	r6, r0
 ca 04                 addi.s8	r6, 0x4
 f0 6a 4c              ld32	q1, [r6]
 f0 3a 0a              stsp16	[sp+0xa], r2
 f0 3b 0c              stsp16	[sp+0xc], r3
 f0 6a c0              ld32	q3, [r0]
 f0 6a 08              ld32	q0, [r4]
 f0 69 c0              cmp32	q3, q0
 f8 14                 cset.ult	r4
 c6 06 01              ldi16	r6, 0x106
 16                    add	r5, r6
 f0 6a ca              ld32	q3, [r5]
 f0 69 4c              cmp32	q1, q3
 f8 15                 cset.ult	r5
 fb 2c                 cmov.eq	r5, r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 10                    add	r4, r4
 10                    add	r4, r4
 10                    add	r4, r4
 c2 38                 ldi8	r6, 0x38
 88                    and	r6, r4
 0e                    mov	r7, r6
 c4 46 01              ldi16	r4, 0x146
 1c                    add	r7, r4
 c4 42 01              ldi16	r4, 0x142
 18                    add	r6, r4
 f4 11                 ldsp16	r5, [sp+0x4]
 01                    mov	r4, r5
 c8 04                 addi.s8	r4, 0x4
 f0 6a 08              ld32	q0, [r4]
 f0 6a 8a              ld32	q2, [r5]
 f0 6a 4c              ld32	q1, [r6]
 f0 3a 0e              stsp16	[sp+0xe], r2
 f0 3b 10              stsp16	[sp+0x10], r3
 f0 6a 4e              ld32	q1, [r7]
 f0 69 40              cmp32	q1, q0
 f8 26                 cset.slt	r6
 f4 42                 stsp16	[sp+0x0], r6
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 f0 69 c8              cmp32	q3, q2
 f8 16                 cset.ult	r6
 f0 69 04              cmp32	q0, q1
 f4 03                 ldsp16	r7, [sp+0x0]
 fb 3e                 cmov.eq	r7, r6
 f4 43                 stsp16	[sp+0x0], r7
 f4 33                 ldsp16	r7, [sp+0xc]
 0b                    mov	r6, r7
 fa 9f                 lsr16i	r6, 0xf
 f4 23                 ldsp16	r7, [sp+0x8]
 1e                    add	r7, r6
 0b                    mov	r6, r7
 f4 1b                 ldsp16	r7, [sp+0x6]
 1b                    add	r6, r7
 f4 03                 ldsp16	r7, [sp+0x0]
 1b                    add	r6, r7
 f9 0a                 xor	r0, r2
 f9 2e                 xor	r1, r3
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 f9 8a                 xor	r4, r2
 f9 ae                 xor	r5, r3
 f9 81                 or	r4, r0
 f9 a5                 or	r5, r1
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 30 14              ldsp16	r0, [sp+0x14]
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 f8 04                 cset.eq	r4
 18                    add	r6, r4
 f4 11                 ldsp16	r5, [sp+0x4]
 c9 08                 addi.s8	r5, 0x8
 f0 08 08              addi.s8	r0, 0x8
 f4 af                 inc16	r7
 cf 0b                 cmpi.s8	r7, 0xb
 db 41 ff              brne16	-0xbf <L1>
 f0 35 12              ldsp16	r5, [sp+0x12]
 f4 ad                 inc16	r5
 cd 20                 cmpi.s8	r5, 0x20
 db 2b ff              brne16	-0xd5 <L0>
 f0 5e 00 01           stm16	[0x100], r6
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 16                 adjsp	0x16
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
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
