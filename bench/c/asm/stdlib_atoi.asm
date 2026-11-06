
stdlib_atoi.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 30                 sub	r0, r0
 f0 02 10              ldi8	r2, 0x10
 d7 01                 sys	debug_break
 f0 07 00 01           ldi16	r3, 0x100
<L0>:
 f1 23                 mov	r4, r3
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 c4 1f 0b              ldi16	r4, 0xb1f
 eb                    callp	q3
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 23                 mov	r4, r3
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 c4 0f 0b              ldi16	r4, 0xb0f
 eb                    callp	q3
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f1 23                 mov	r4, r3
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 c4 12 0b              ldi16	r4, 0xb12
 eb                    callp	q3
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 23                 mov	r4, r3
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 c4 21 0b              ldi16	r4, 0xb21
 eb                    callp	q3
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f1 23                 mov	r4, r3
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 c4 00 0b              ldi16	r4, 0xb00
 eb                    callp	q3
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 23                 mov	r4, r3
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 c4 17 0b              ldi16	r4, 0xb17
 eb                    callp	q3
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f1 23                 mov	r4, r3
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 c4 1e 0b              ldi16	r4, 0xb1e
 eb                    callp	q3
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 23                 mov	r4, r3
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 c4 06 0b              ldi16	r4, 0xb06
 eb                    callp	q3
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f4 b2                 dec16	r2
 f4 a2                 tst8	r2
 d1 92                 brne8	-0x6e <L0>
 f0 58 03 01           stm16	[0x103], r0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<atoi>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f1 04                 mov	r0, r4
<L0>:
 f1 08                 mov	r1, r0
 f0 6c 81              ld8u	r4, [r0+]
 e1 b3 00              call16	isspace
 f6 2c                 tst16	r4
 d1 f4                 brne8	-0xc <L0>
 ed 82 20              ld8u	r4, [r1+0]
 cc 2b                 cmpi.s8	r4, 0x2b
 aa                    xor	r6, r6
 d0 0f                 breq8	0xf <L1>
 cc 2d                 cmpi.s8	r4, 0x2d
 d1 12                 brne8	0x12 <L2>
 c0 01                 ldi8	r4, 0x1
 f4 48                 stsp16	[sp+0x2], r4
 c4 00 80              ldi16	r4, 0x8000
 f1 08                 mov	r1, r0
 d4 0c                 jmp8	0xc <L4>
<L1>:
 c4 ff 7f              ldi16	r4, 0x7fff
 f1 08                 mov	r1, r0
 d4 03                 jmp8	0x3 <L3>
<L2>:
 c4 ff 7f              ldi16	r4, 0x7fff
<L3>:
 f4 4a                 stsp16	[sp+0x2], r6
<L4>:
 c1 0a                 ldi8	r5, 0xa
 f4 40                 stsp16	[sp+0x0], r4
 f1 04                 mov	r0, r4
 ec 45                 urem16	r0, r5
 0e                    mov	r7, r6
 f1 1e                 mov	r3, r6
 d4 17                 jmp8	0x17 <L8>
<L5>:
 f1 27                 mov	r5, r3
 f1 16                 mov	r2, r6
 c2 0a                 ldi8	r6, 0xa
 fe 2e                 mul16	r5, r6
 11                    add	r4, r5
 f6 2a                 tst16	r2
 fb 1c                 cmov.eq	r3, r4
<L6>:
 f1 27                 mov	r5, r3
<L7>:
 f4 b7                 dec16	r7
 f4 a9                 inc16	r1
 f1 2a                 mov	r6, r2
 f1 1d                 mov	r3, r5
<L8>:
 ed 82 20              ld8u	r4, [r1+0]
 04                    mov	r5, r4
 c9 d0                 addi.s8	r5, -0x30
 f1 75                 zext8	r5
 cd 0a                 cmpi.s8	r5, 0xa
 d8 0e                 bruge8	0xe <L9>
 c8 d0                 addi.s8	r4, -0x30
 f0 02 01              ldi8	r2, 0x1
 c5 cc 0c              ldi16	r5, 0xccc
 f5 27                 cmp	r5, r3
 d2 de                 brult8	-0x22 <L6>
 d4 22                 jmp8	0x22 <L10>
<L9>:
 04                    mov	r5, r4
 c9 9f                 addi.s8	r5, -0x61
 f1 75                 zext8	r5
 cd 1a                 cmpi.s8	r5, 0x1a
 d2 23                 brult8	0x23 <L11>
 04                    mov	r5, r4
 c9 bf                 addi.s8	r5, -0x41
 f1 75                 zext8	r5
 cd 1a                 cmpi.s8	r5, 0x1a
 d8 1a                 bruge8	0x1a <L11>
 c8 c9                 addi.s8	r4, -0x37
 cc 0a                 cmpi.s8	r4, 0xa
 d8 14                 bruge8	0x14 <L11>
 f0 02 01              ldi8	r2, 0x1
 c5 cc 0c              ldi16	r5, 0xccc
 f5 27                 cmp	r5, r3
 d2 ba                 brult8	-0x46 <L6>
<L10>:
 f5 1d                 cmp	r3, r5
 d1 a9                 brne8	-0x57 <L5>
 f5 04                 cmp	r0, r4
 d2 b4                 brult8	-0x4c <L7>
 d4 a3                 jmp8	-0x5d <L5>
<L11>:
 a5                    xor	r5, r5
 f6 2f                 tst16	r7
 01                    mov	r4, r5
 d0 0e                 breq8	0xe <L12>
 f6 2e                 tst16	r6
 f1 23                 mov	r4, r3
 d0 08                 breq8	0x8 <L12>
 c0 22                 ldi8	r4, 0x22
 f0 5c 05 01           stm16	[0x105], r4
 f4 00                 ldsp16	r4, [sp+0x0]
<L12>:
 24                    sub	r5, r4
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 a6                 tst8	r6
 fb 65                 cmov.ne	r4, r5
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<isspace>:
 cc 20                 cmpi.s8	r4, 0x20
 f8 05                 cset.eq	r5
 c8 f7                 addi.s8	r4, -0x9
 cc 05                 cmpi.s8	r4, 0x5
 f8 14                 cset.ult	r4
 91                    or	r4, r5
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
