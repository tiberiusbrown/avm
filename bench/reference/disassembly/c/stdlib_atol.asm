
stdlib_atol.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 c0 10                 ldi8	r4, 0x10
 d7 01                 sys	debug_break
<L0>:
 f4 40                 stsp16	[sp+0x0], r4
 c4 00 01              ldi16	r4, 0x100
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 c4 1e 0b              ldi16	r4, 0xb1e
 eb                    callp	q3
 f2 66                 mov32	q1, q2
 f7 64                 add32	q1, q0
 c4 00 01              ldi16	r4, 0x100
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 c4 09 0b              ldi16	r4, 0xb09
 eb                    callp	q3
 f2 62                 mov32	q0, q2
 f7 61                 add32	q0, q1
 c4 00 01              ldi16	r4, 0x100
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 c4 0c 0b              ldi16	r4, 0xb0c
 eb                    callp	q3
 f2 66                 mov32	q1, q2
 f7 64                 add32	q1, q0
 c4 00 01              ldi16	r4, 0x100
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 c4 2b 0b              ldi16	r4, 0xb2b
 eb                    callp	q3
 f2 62                 mov32	q0, q2
 f7 61                 add32	q0, q1
 c4 00 01              ldi16	r4, 0x100
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 c4 20 0b              ldi16	r4, 0xb20
 eb                    callp	q3
 f2 66                 mov32	q1, q2
 f7 64                 add32	q1, q0
 c4 00 01              ldi16	r4, 0x100
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 c4 12 0b              ldi16	r4, 0xb12
 eb                    callp	q3
 f2 62                 mov32	q0, q2
 f7 61                 add32	q0, q1
 c4 00 01              ldi16	r4, 0x100
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 c4 11 0b              ldi16	r4, 0xb11
 eb                    callp	q3
 f2 66                 mov32	q1, q2
 f7 64                 add32	q1, q0
 c4 00 01              ldi16	r4, 0x100
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 c4 00 0b              ldi16	r4, 0xb00
 eb                    callp	q3
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f7 61                 add32	q0, q1
 f4 b4                 dec16	r4
 f4 a4                 tst8	r4
 d1 86                 brne8	-0x7a <L0>
 c4 03 01              ldi16	r4, 0x103
 f0 6b 08              st32	[r4], q0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<atol>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 f1 14                 mov	r2, r4
<L0>:
 f1 1a                 mov	r3, r2
 f0 6c 85              ld8u	r4, [r2+]
 e1 fe 00              call16	isspace
 f6 2c                 tst16	r4
 d1 f4                 brne8	-0xc <L0>
 ed 86 20              ld8u	r4, [r3+0]
 cc 2b                 cmpi.s8	r4, 0x2b
 aa                    xor	r6, r6
 c1 01                 ldi8	r5, 0x1
 d0 0e                 breq8	0xe <L1>
 cc 2d                 cmpi.s8	r4, 0x2d
 d1 16                 brne8	0x16 <L2>
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f1 1a                 mov	r3, r2
 f4 52                 stsp16	[sp+0x4], r6
 d4 14                 jmp8	0x14 <L3>
<L1>:
 f4 51                 stsp16	[sp+0x4], r5
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff 7f              ldi16	r5, 0x7fff
 f1 1a                 mov	r3, r2
 d4 08                 jmp8	0x8 <L3>
<L2>:
 f4 51                 stsp16	[sp+0x4], r5
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff 7f              ldi16	r5, 0x7fff
<L3>:
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 e1 45 0d              call16	__avm_umodsi3
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 af                    xor	r7, r7
 0b                    mov	r6, r7
 d4 06                 jmp8	0x6 <L6>
<L4>:
 f2 62                 mov32	q0, q2
<L5>:
 f4 b6                 dec16	r6
 f4 ab                 inc16	r3
<L6>:
 ed 46 20              ld8u	r2, [r3+0]
 f1 22                 mov	r4, r2
 c8 d0                 addi.s8	r4, -0x30
 f1 74                 zext8	r4
 cc 0a                 cmpi.s8	r4, 0xa
 f4 7b                 stsp16	[sp+0xe], r7
 d8 12                 bruge8	0x12 <L7>
 f0 0a d0              addi.s8	r2, -0x30
 c3 01                 ldi8	r7, 0x1
 c4 cc cc              ldi16	r4, 0xcccc
 c5 cc 0c              ldi16	r5, 0xccc
 f0 69 80              cmp32	q2, q0
 d2 dd                 brult8	-0x23 <L5>
 d4 29                 jmp8	0x29 <L8>
<L7>:
 f1 22                 mov	r4, r2
 c8 9f                 addi.s8	r4, -0x61
 f1 74                 zext8	r4
 cc 1a                 cmpi.s8	r4, 0x1a
 d2 5a                 brult8	0x5a <L10>
 f1 22                 mov	r4, r2
 c8 bf                 addi.s8	r4, -0x41
 f1 74                 zext8	r4
 cc 1a                 cmpi.s8	r4, 0x1a
 d8 50                 bruge8	0x50 <L10>
 f0 0a c9              addi.s8	r2, -0x37
 f0 0e 0a              cmpi.s8	r2, 0xa
 d8 48                 bruge8	0x48 <L10>
 c3 01                 ldi8	r7, 0x1
 c4 cc cc              ldi16	r4, 0xcccc
 c5 cc 0c              ldi16	r5, 0xccc
 f0 69 80              cmp32	q2, q0
 d2 b2                 brult8	-0x4e <L5>
<L8>:
 f0 38 0a              stsp16	[sp+0xa], r0
 f0 39 0c              stsp16	[sp+0xc], r1
 f0 69 08              cmp32	q0, q2
 d1 0e                 brne8	0xe <L9>
 f1 06                 mov	r0, r6
 f1 0f                 mov	r1, r7
 f4 1a                 ldsp16	r6, [sp+0x6]
 f1 2d                 mov	r7, r1
 f5 2a                 cmp	r6, r2
 f1 28                 mov	r6, r0
 d2 97                 brult8	-0x69 <L4>
<L9>:
 f4 38                 ldsp16	r4, [sp+0xe]
 f6 2c                 tst16	r4
 f0 30 0a              ldsp16	r0, [sp+0xa]
 f0 31 0c              ldsp16	r1, [sp+0xc]
 d1 8d                 brne8	-0x73 <L5>
 f2 68                 mov32	q2, q0
 f1 06                 mov	r0, r6
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 e1 60 0b              call16	__avm_mulsi3
 f1 28                 mov	r6, r0
 f1 02                 mov	r0, r2
 f2 39                 sub	r1, r1
 f7 62                 add32	q0, q2
 af                    xor	r7, r7
 e0 77 ff              jmp16	-137 <L5>
<L10>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f6 2e                 tst16	r6
 f2 66                 mov32	q1, q2
 d0 14                 breq8	0x14 <L11>
 f4 3a                 ldsp16	r6, [sp+0xe]
 f6 2e                 tst16	r6
 f2 64                 mov32	q1, q0
 d0 0c                 breq8	0xc <L11>
 c2 22                 ldi8	r6, 0x22
 f0 5e 07 01           stm16	[0x107], r6
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
<L11>:
 f7 79                 sub32	q2, q1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 a6                 tst8	r6
 fb 62                 cmov.ne	r4, r2
 fb 6b                 cmov.ne	r5, r3
 d6 10                 adjsp	0x10
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

<__avm_ashlsi3>:
 f6 2f                 tst16	r7
 d1 23                 brne8	0x23 <L1>
 ce 10                 cmpi.s8	r6, 0x10
 d8 12                 bruge8	0x12 <L0>
 f6 2e                 tst16	r6
 d0 1f                 breq8	0x1f <L2>
 0c                    mov	r7, r4
 fa 06                 shl16v	r5, r6
 fa 02                 shl16v	r4, r6
 f6 4e                 neg16	r6
 ca 10                 addi.s8	r6, 0x10
 fa 1e                 lsr16v	r7, r6
 97                    or	r5, r7
 d4 11                 jmp8	0x11 <L2>
<L0>:
 ce 20                 cmpi.s8	r6, 0x20
 d8 09                 bruge8	0x9 <L1>
 ca f0                 addi.s8	r6, -0x10
 fa 02                 shl16v	r4, r6
 04                    mov	r5, r4
 c0 00                 ldi8	r4, 0x0
 d4 04                 jmp8	0x4 <L2>
<L1>:
 c0 00                 ldi8	r4, 0x0
 c1 00                 ldi8	r5, 0x0
<L2>:
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

<__avm_udivmodsi4>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f0 32 13              ldsp16	r2, [sp+0x13]
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d0 0d                 breq8	0xd <L0>
 f0 69 8c              cmp32	q2, q3
 d8 14                 bruge8	0x14 <L1>
 f0 6b 84              st32	[r2], q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e0 d4 00              jmp16	212 <L7>
<L0>:
 f0 6b 84              st32	[r2], q2
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 e0 c8 00              jmp16	200 <L7>
<L1>:
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d1 08                 brne8	0x8 <L2>
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 6b c4              st32	[r2], q3
 e0 b6 00              jmp16	182 <L7>
<L2>:
 f0 3a 04              stsp16	[sp+0x4], r2
 f2 63                 mov32	q0, q3
 f9 11                 or	r0, r4
 f9 35                 or	r1, r5
 f0 06 ff ff           ldi16	r2, 0xffff
 f2 4b                 sub	r3, r3
 f0 69 40              cmp32	q1, q0
 d2 13                 brult8	0x13 <L3>
 04                    mov	r5, r4
 ec 2e                 udiv16	r5, r6
 0d                    mov	r7, r5
 fe 3e                 mul16	r7, r6
 23                    sub	r4, r7
 08                    mov	r6, r4
 af                    xor	r7, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 6b c8              st32	[r4], q3
 01                    mov	r4, r5
 a5                    xor	r5, r5
 e0 8f 00              jmp16	143 <L7>
<L3>:
 f2 62                 mov32	q0, q2
 f1 21                 mov	r4, r1
 ff 0d                 u16tof
 fa 87                 lsr16i	r5, 0x7
 f0 02 8e              ldi8	r2, 0x8e
 f1 1a                 mov	r3, r2
 f2 4d                 sub	r3, r5
 f1 20                 mov	r4, r0
 ff 0d                 u16tof
 fa 87                 lsr16i	r5, 0x7
 c0 9e                 ldi8	r4, 0x9e
 21                    sub	r4, r5
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f6 29                 tst16	r1
 fb 1c                 cmov.eq	r3, r4
 03                    mov	r4, r7
 ff 0d                 u16tof
 fa 87                 lsr16i	r5, 0x7
 f2 45                 sub	r2, r5
 02                    mov	r4, r6
 ff 0d                 u16tof
 fa 87                 lsr16i	r5, 0x7
 c0 9e                 ldi8	r4, 0x9e
 21                    sub	r4, r5
 f6 2f                 tst16	r7
 fb 14                 cmov.eq	r2, r4
 f0 3a 06              stsp16	[sp+0x6], r2
 f1 22                 mov	r4, r2
 f2 53                 sub	r4, r3
 cc ff                 cmpi.s8	r4, -0x1
 d0 42                 breq8	0x42 <L5>
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 e1 87 fe              call16	__avm_ashlsi3
 f2 62                 mov32	q0, q2
 c4 ff ff              ldi16	r4, 0xffff
 f4 1a                 ldsp16	r6, [sp+0x6]
 a8                    xor	r6, r4
 f2 2b                 add	r6, r3
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
<L4>:
 f4 5a                 stsp16	[sp+0x6], r6
 f7 6a                 add32	q2, q2
 f0 69 40              cmp32	q1, q0
 f2 6b                 mov32	q3, q1
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 fc 50                 cmov.uge	r2, r0
 fc 59                 cmov.uge	r3, r1
 f7 7d                 sub32	q3, q1
 f2 67                 mov32	q1, q3
 f8 1e                 cset.uge	r6
 98                    or	r6, r4
 02                    mov	r4, r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 f7 80                 lsr32.1	q0
 f4 ae                 inc16	r6
 f6 2e                 tst16	r6
 d1 dd                 brne8	-0x23 <L4>
 d4 08                 jmp8	0x8 <L6>
<L5>:
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 a0                    xor	r4, r4
 a5                    xor	r5, r5
<L6>:
 f4 12                 ldsp16	r6, [sp+0x4]
 f0 6b 4c              st32	[r6], q1
<L7>:
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_umodsi3>:
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 d6 fe                 adjsp	-0x2
 f0 10 02              leasp	r0, 0x2
 f0 38 00              stsp16	[sp+0x0], r0
 e1 f8 fe              call16	__avm_udivmodsi4
 d6 02                 adjsp	0x2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 ef                    ret
