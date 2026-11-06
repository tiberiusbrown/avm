
aggregate_byte_dispatch.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f0 05 04 01           ldi16	r1, 0x104
 aa                    xor	r6, r6
 f0 04 00 0b           ldi16	r0, 0xb00
 0e                    mov	r7, r6
 c0 03                 ldi8	r4, 0x3
<L0>:
 f4 42                 stsp16	[sp+0x0], r6
 07                    mov	r5, r7
 c2 07                 ldi8	r6, 0x7
 86                    and	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f2 24                 add	r5, r0
 45                    ld8u	r5, [r5]
 ee a2 1e              st8	[r1-2], r5
 06                    mov	r5, r6
 84                    and	r5, r4
 ee a2 1f              st8	[r1-1], r5
 06                    mov	r5, r6
 fa 82                 lsr16i	r5, 0x2
 84                    and	r5, r4
 ee a2 20              st8	[r1+0], r5
 f4 ae                 inc16	r6
 f0 09 03              addi.s8	r1, 0x3
 f4 af                 inc16	r7
 cf 20                 cmpi.s8	r7, 0x20
 d1 db                 brne8	-0x25 <L0>
 f2 30                 sub	r0, r0
 d7 01                 sys	debug_break
 f1 08                 mov	r1, r0
<L1>:
 f0 03 20              ldi8	r3, 0x20
 f0 06 04 01           ldi16	r2, 0x104
<L2>:
 ed 84 1e              ld8u	r4, [r2-2]
 08                    mov	r6, r4
 ed 84 1f              ld8u	r4, [r2-1]
 fa 38                 lsl16i	r4, 0x8
 92                    or	r4, r6
 ed a4 20              ld8u	r5, [r2+0]
 d5 20                 call8	_ZL8dispatch10ChunkCoord
 f2 0c                 add	r1, r4
 f0 0a 03              addi.s8	r2, 0x3
 f4 b3                 dec16	r3
 f6 2b                 tst16	r3
 d1 e6                 brne8	-0x1a <L2>
 f4 a8                 inc16	r0
 f0 0c 20              cmpi.s8	r0, 0x20
 d1 d8                 brne8	-0x28 <L1>
 f0 59 00 01           stm16	[0x100], r1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<dispatch(ChunkCoord)>:
 08                    mov	r6, r4
 f1 76                 zext8	r6
 ce 01                 cmpi.s8	r6, 0x1
 d1 1a                 brne8	0x1a <L0>
 c3 ff                 ldi8	r7, 0xff
 8d                    and	r7, r5
 0b                    mov	r6, r7
 06                    mov	r5, r6
 15                    add	r5, r5
 16                    add	r5, r6
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 c1 53                 ldi8	r5, 0x53
 c2 25                 ldi8	r6, 0x25
 cc 04                 cmpi.s8	r4, 0x4
 fb 2e                 cmov.eq	r5, r6
 c2 0b                 ldi8	r6, 0xb
 cc 03                 cmpi.s8	r4, 0x3
 01                    mov	r4, r5
 fb 26                 cmov.eq	r4, r6
 ef                    ret
<L0>:
 c0 95                 ldi8	r4, 0x95
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
