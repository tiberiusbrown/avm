
float_comparisons.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 c4 fa ff              ldi16	r4, 0xfffa
 f4 70                 stsp16	[sp+0xc], r4
 f2 42                 sub	r2, r2
 f0 04 f8 ff           ldi16	r0, 0xfff8
 c4 02 01              ldi16	r4, 0x102
 f4 68                 stsp16	[sp+0xa], r4
 c4 42 01              ldi16	r4, 0x142
<L0>:
 f4 60                 stsp16	[sp+0x8], r4
 f1 20                 mov	r4, r0
 ff 0c                 s16tof
 aa                    xor	r6, r6
 c7 c0 3e              ldi16	r7, 0x3ec0
 ff 02                 fmul
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f0 6b 82              st32	[r1], q2
 c1 0d                 ldi8	r5, 0xd
 f1 22                 mov	r4, r2
 ec 65                 urem16	r4, r5
 f2 52                 sub	r4, r2
 f0 33 0c              ldsp16	r3, [sp+0xc]
 f2 23                 add	r4, r3
 ff 0c                 s16tof
 c7 00 3f              ldi16	r7, 0x3f00
 ff 02                 fmul
 f4 22                 ldsp16	r6, [sp+0x8]
 f0 6b 8c              st32	[r6], q2
 02                    mov	r4, r6
 c8 04                 addi.s8	r4, 0x4
 f0 09 04              addi.s8	r1, 0x4
 f0 39 0a              stsp16	[sp+0xa], r1
 f0 0a 07              addi.s8	r2, 0x7
 f0 0b 07              addi.s8	r3, 0x7
 f0 3b 0c              stsp16	[sp+0xc], r3
 f4 a8                 inc16	r0
 f0 0c 08              cmpi.s8	r0, 0x8
 d1 bc                 brne8	-0x44 <L0>
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 04                    mov	r5, r4
 08                    mov	r6, r4
<L1>:
 f4 41                 stsp16	[sp+0x0], r5
 c5 42 01              ldi16	r5, 0x142
 c7 02 01              ldi16	r7, 0x102
 a0                    xor	r4, r4
 f4 70                 stsp16	[sp+0xc], r4
<L2>:
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f4 69                 stsp16	[sp+0xa], r5
 f0 6a 4e              ld32	q1, [r7]
 f0 6a 0a              ld32	q0, [r5]
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 14                 fcmp
 f4 4a                 stsp16	[sp+0x2], r6
 ce 01                 cmpi.s8	r6, 0x1
 f2 68                 mov32	q2, q0
 fb 22                 cmov.eq	r4, r2
 fb 2b                 cmov.eq	r5, r3
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 14                 fcmp
 c0 07                 ldi8	r4, 0x7
 f4 31                 ldsp16	r5, [sp+0xc]
 81                    and	r4, r5
 ce 02                 cmpi.s8	r6, 0x2
 f8 15                 cset.ult	r5
 fa 04                 shl16v	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 f4 0a                 ldsp16	r6, [sp+0x2]
 ce ff                 cmpi.s8	r6, -0x1
 f2 68                 mov32	q2, q0
 fb 22                 cmov.eq	r4, r2
 fb 2b                 cmov.eq	r5, r3
 f6 2e                 tst16	r6
 f8 06                 cset.eq	r6
 f4 1b                 ldsp16	r7, [sp+0x6]
 1e                    add	r7, r6
 f8 08                 cset.ne	r0
 f2 07                 add	r0, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff 14                 fcmp
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ce ff                 cmpi.s8	r6, -0x1
 f8 06                 cset.eq	r6
 f2 28                 add	r6, r0
 f4 10                 ldsp16	r4, [sp+0x4]
 a8                    xor	r6, r4
 c9 04                 addi.s8	r5, 0x4
 cb 04                 addi.s8	r7, 0x4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 ac                 inc16	r4
 f4 70                 stsp16	[sp+0xc], r4
 cc 10                 cmpi.s8	r4, 0x10
 d1 9d                 brne8	-0x63 <L2>
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 cd 18                 cmpi.s8	r5, 0x18
 d1 8a                 brne8	-0x76 <L1>
 f0 5e 00 01           stm16	[0x100], r6
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0e                 adjsp	0xe
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
