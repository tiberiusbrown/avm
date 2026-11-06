
rotate32.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 f0 00 01              ldi8	r0, 0x1
 a0                    xor	r4, r4
 f0 05 14 01           ldi16	r1, 0x114
 f0 06 04 01           ldi16	r2, 0x104
 f1 1c                 mov	r3, r4
<L0>:
 f4 68                 stsp16	[sp+0xa], r4
 c1 09                 ldi8	r5, 0x9
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f4 2a                 ldsp16	r6, [sp+0xa]
 28                    sub	r6, r4
 c1 fe                 ldi8	r5, 0xfe
 89                    and	r6, r5
 f4 8e                 lsr16.1	r6
 18                    add	r6, r4
 f4 62                 stsp16	[sp+0x8], r6
 f1 23                 mov	r4, r3
 a5                    xor	r5, r5
 c6 04 03              ldi16	r6, 0x304
 c7 02 01              ldi16	r7, 0x102
 e1 ba 0b              call16	__avm_mulsi3
 c6 78 56              ldi16	r6, 0x5678
 c7 34 12              ldi16	r7, 0x1234
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 f0 6b c2              st32	[r1], q3
 f4 21                 ldsp16	r5, [sp+0x8]
 fa 84                 lsr16i	r5, 0x4
 c0 1f                 ldi8	r4, 0x1f
 f3 14                 mulu8.w	r5, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 21                    sub	r4, r5
 f4 29                 ldsp16	r5, [sp+0xa]
 21                    sub	r4, r5
 f2 20                 add	r4, r0
 f0 6d 85              st8	[r2+], r4
 01                    mov	r4, r5
 f0 09 04              addi.s8	r1, 0x4
 c8 07                 addi.s8	r4, 0x7
 f0 08 07              addi.s8	r0, 0x7
 f4 ab                 inc16	r3
 f0 0f 10              cmpi.s8	r3, 0x10
 d1 b3                 brne8	-0x4d <L0>
 a5                    xor	r5, r5
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 d7 01                 sys	debug_break
<L1>:
 f4 41                 stsp16	[sp+0x0], r5
 c0 10                 ldi8	r4, 0x10
 f4 60                 stsp16	[sp+0x8], r4
 f0 04 04 01           ldi16	r0, 0x104
 f0 05 14 01           ldi16	r1, 0x114
<L2>:
 f0 6a 82              ld32	q2, [r1]
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 f0 6c c1              ld8u	r6, [r0+]
 e1 06 0b              call16	__avm_rotlsi3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 09                    mov	r6, r5
 fa 78                 lsr16i	r4, 0x8
 0e                    mov	r7, r6
 fa 68                 lsl16i	r7, 0x8
 9c                    or	r7, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 fa 38                 lsl16i	r4, 0x8
 f4 48                 stsp16	[sp+0x2], r4
 f4 28                 ldsp16	r4, [sp+0xa]
 04                    mov	r5, r4
 f4 6a                 stsp16	[sp+0xa], r6
 f4 71                 stsp16	[sp+0xc], r5
 fa 98                 lsr16i	r6, 0x8
 f4 08                 ldsp16	r4, [sp+0x2]
 98                    or	r6, r4
 f7 6d                 add32	q3, q1
 f4 28                 ldsp16	r4, [sp+0xa]
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f7 6d                 add32	q3, q1
 f0 09 04              addi.s8	r1, 0x4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 b4                 dec16	r4
 f4 60                 stsp16	[sp+0x8], r4
 f6 2c                 tst16	r4
 f2 67                 mov32	q1, q3
 d1 b5                 brne8	-0x4b <L2>
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 cd 18                 cmpi.s8	r5, 0x18
 d1 9f                 brne8	-0x61 <L1>
 c4 00 01              ldi16	r4, 0x100
 f0 6b c8              st32	[r4], q3
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

<__avm_rotlsi3>:
 b0                    push16	r0
 c3 1f                 ldi8	r7, 0x1f
 8b                    and	r6, r7
 ce 10                 cmpi.s8	r6, 0x10
 d2 05                 brult8	0x5 <L0>
 0c                    mov	r7, r4
 01                    mov	r4, r5
 07                    mov	r5, r7
 ca f0                 addi.s8	r6, -0x10
<L0>:
 f6 2e                 tst16	r6
 d0 13                 breq8	0x13 <L1>
 0c                    mov	r7, r4
 f1 05                 mov	r0, r5
 fa 02                 shl16v	r4, r6
 fa 06                 shl16v	r5, r6
 f6 4e                 neg16	r6
 ca 10                 addi.s8	r6, 0x10
 fa 1e                 lsr16v	r7, r6
 97                    or	r5, r7
 f1 2c                 mov	r7, r0
 fa 1e                 lsr16v	r7, r6
 93                    or	r4, r7
<L1>:
 b8                    pop16	r0
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
