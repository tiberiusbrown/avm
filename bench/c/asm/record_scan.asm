
record_scan.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f0 07 e8 03           ldi16	r3, 0x3e8
 f0 04 02 01           ldi16	r0, 0x102
 c3 fa                 ldi8	r7, 0xfa
 a5                    xor	r5, r5
 f0 01 fb              ldi8	r1, 0xfb
 f0 02 03              ldi8	r2, 0x3
<L0>:
 f4 43                 stsp16	[sp+0x0], r7
 0d                    mov	r7, r5
 c0 75                 ldi8	r4, 0x75
 f3 1c                 mulu8.w	r7, r4
 fa a8                 lsr16i	r7, 0x8
 01                    mov	r4, r5
 23                    sub	r4, r7
 c2 fe                 ldi8	r6, 0xfe
 88                    and	r6, r4
 f4 8e                 lsr16.1	r6
 1b                    add	r6, r7
 fa 93                 lsr16i	r6, 0x3
 c0 0b                 ldi8	r4, 0xb
 f3 18                 mulu8.w	r6, r4
 c0 4f                 ldi8	r4, 0x4f
 0d                    mov	r7, r5
 f3 1c                 mulu8.w	r7, r4
 fa aa                 lsr16i	r7, 0xa
 c0 0d                 ldi8	r4, 0xd
 f3 1c                 mulu8.w	r7, r4
 c0 5a                 ldi8	r4, 0x5a
 a1                    xor	r4, r5
 ee 80 20              st8	[r0+0], r4
 01                    mov	r4, r5
 23                    sub	r4, r7
 f4 03                 ldsp16	r7, [sp+0x0]
 21                    sub	r4, r5
 13                    add	r4, r7
 ee 80 1e              st8	[r0-2], r4
 01                    mov	r4, r5
 22                    sub	r4, r6
 21                    sub	r4, r5
 f2 21                 add	r4, r1
 ee 80 1f              st8	[r0-1], r4
 ee 40 21              st8	[r0+1], r2
 f0 0a 07              addi.s8	r2, 0x7
 f4 a9                 inc16	r1
 f4 ad                 inc16	r5
 f4 af                 inc16	r7
 ee 70 22              st16	[r0+2], r3
 f0 08 06              addi.s8	r0, 0x6
 f0 0b 1d              addi.s8	r3, 0x1d
 c4 58 09              ldi16	r4, 0x958
 f5 1c                 cmp	r3, r4
 d1 ab                 brne8	-0x55 <L0>
 f2 39                 sub	r1, r1
 d7 01                 sys	debug_break
 f1 21                 mov	r4, r1
 f1 11                 mov	r2, r1
 f1 19                 mov	r3, r1
 d4 07                 jmp8	0x7 <L2>
<L1>:
 f4 a9                 inc16	r1
 f0 0d 20              cmpi.s8	r1, 0x20
 d0 37                 breq8	0x37 <L5>
<L2>:
 c2 30                 ldi8	r6, 0x30
 c5 00 01              ldi16	r5, 0x100
 d4 12                 jmp8	0x12 <L4>
<L3>:
 0c                    mov	r7, r4
 ed 9a 24              ld16	r4, [r5+4]
 f4 b4                 dec16	r4
 ee 9a 24              st16	[r5+4], r4
 a3                    xor	r4, r7
 c9 06                 addi.s8	r5, 0x6
 f4 b6                 dec16	r6
 f4 a6                 tst8	r6
 d0 e0                 breq8	-0x20 <L1>
<L4>:
 ed ea 21              ld8u	r7, [r5+1]
 f6 47                 sext8	r7
 f2 17                 add	r2, r7
 4d                    ld8u	r7, [r5]
 f6 47                 sext8	r7
 f2 1f                 add	r3, r7
 ed ea 22              ld8u	r7, [r5+2]
 f0 00 01              ldi8	r0, 0x1
 f9 1c                 and	r0, r7
 f4 a0                 tst8	r0
 d0 d6                 breq8	-0x2a <L3>
 ed ea 23              ld8u	r7, [r5+3]
 13                    add	r4, r7
 d4 d0                 jmp8	-0x30 <L3>
<L5>:
 f9 4e                 xor	r2, r3
 f9 52                 xor	r2, r4
 f0 5a 20 02           stm16	[0x220], r2
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 02                 adjsp	0x2
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
