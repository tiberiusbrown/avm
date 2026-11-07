
stdlib_strtoul.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 aa                    xor	r6, r6
 af                    xor	r7, r7
 a5                    xor	r5, r5
 d7 01                 sys	debug_break
 f0 04 10 0b           ldi16	r0, 0xb10
 f0 06 00 0b           ldi16	r2, 0xb00
 f0 07 00 01           ldi16	r3, 0x100
 f1 0d                 mov	r1, r5
<L0>:
 f0 39 00              stsp16	[sp+0x0], r1
 f1 0d                 mov	r1, r5
<L1>:
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 f0 5d 07 01           stm16	[0x107], r5
 f1 21                 mov	r4, r1
 f2 20                 add	r4, r0
 f1 25                 mov	r5, r1
 f2 26                 add	r5, r2
 f5 44                 ld16	r0, [r5]
 68                    ld16	r6, [r4]
 f1 23                 mov	r4, r3
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 f0 15 06              leasp	r5, 0x6
 f1 20                 mov	r4, r0
 e9                    callp	q1
 f0 07 00 01           ldi16	r3, 0x100
 f0 06 00 0b           ldi16	r2, 0xb00
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f7 6e                 add32	q3, q2
 f0 54 07 01           ldm16	r4, [0x107]
 a5                    xor	r5, r5
 f7 6b                 add32	q2, q3
 f4 1a                 ldsp16	r6, [sp+0x6]
 f2 58                 sub	r6, r0
 f0 04 10 0b           ldi16	r0, 0xb10
 0e                    mov	r7, r6
 fa ef                 asr16i	r7, 0xf
 f7 6e                 add32	q3, q2
 a5                    xor	r5, r5
 f0 09 02              addi.s8	r1, 0x2
 f0 0d 10              cmpi.s8	r1, 0x10
 d1 b6                 brne8	-0x4a <L1>
 f0 31 00              ldsp16	r1, [sp+0x0]
 f4 a9                 inc16	r1
 f0 0d 10              cmpi.s8	r1, 0x10
 d1 a7                 brne8	-0x59 <L0>
 c4 03 01              ldi16	r4, 0x103
 f0 6b c8              st32	[r4], q3
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<parse_ulong>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e8                 adjsp	-0x18
 f1 0e                 mov	r1, r6
 f1 04                 mov	r0, r4
 f0 36 27              ldsp16	r6, [sp+0x27]
 f0 37 29              ldsp16	r7, [sp+0x29]
 f0 32 23              ldsp16	r2, [sp+0x23]
 f0 33 25              ldsp16	r3, [sp+0x25]
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 3b 04              stsp16	[sp+0x4], r3
 f0 34 2d              ldsp16	r4, [sp+0x2d]
 f0 33 2b              ldsp16	r3, [sp+0x2b]
 f2 42                 sub	r2, r2
 ee 56 20              st16	[r3+0], r2
 f4 58                 stsp16	[sp+0x6], r4
 f5 52                 st16	[r4], r2
 f6 2d                 tst16	r5
 d0 02                 breq8	0x2 <L0>
 f5 54                 st16	[r5], r0
<L0>:
 f6 29                 tst16	r1
 d0 0f                 breq8	0xf <L1>
 f1 21                 mov	r4, r1
 c8 db                 addi.s8	r4, -0x25
 cc dd                 cmpi.s8	r4, -0x23
 d8 07                 bruge8	0x7 <L1>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 c2 16                 ldi8	r6, 0x16
 e0 80 01              jmp16	384 <L21>
<L1>:
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3d 12              stsp16	[sp+0x12], r5
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
<L2>:
 f1 10                 mov	r2, r0
 f0 6c 81              ld8u	r4, [r0+]
 e1 c2 01              call16	isspace
 f6 2c                 tst16	r4
 d1 f4                 brne8	-0xc <L2>
 ed 84 20              ld8u	r4, [r2+0]
 cc 2b                 cmpi.s8	r4, 0x2b
 d0 04                 breq8	0x4 <L3>
 cc 2d                 cmpi.s8	r4, 0x2d
 d1 09                 brne8	0x9 <L4>
<L3>:
 cc 2d                 cmpi.s8	r4, 0x2d
 f8 04                 cset.eq	r4
 ee 96 20              st16	[r3+0], r4
 f1 10                 mov	r2, r0
<L4>:
 f0 3b 08              stsp16	[sp+0x8], r3
 c0 2f                 ldi8	r4, 0x2f
 f9 84                 and	r4, r1
 f4 a4                 tst8	r4
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 d1 49                 brne8	0x49 <L6>
 ed c4 20              ld8u	r6, [r2+0]
 ce 30                 cmpi.s8	r6, 0x30
 d1 42                 brne8	0x42 <L6>
 ed c4 21              ld8u	r6, [r2+1]
 c3 20                 ldi8	r7, 0x20
 9e                    or	r7, r6
 cf 78                 cmpi.s8	r7, 0x78
 d1 38                 brne8	0x38 <L6>
 f0 00 10              ldi8	r0, 0x10
 f1 1a                 mov	r3, r2
 f0 0b 02              addi.s8	r3, 0x2
 ed c4 22              ld8u	r6, [r2+2]
 0e                    mov	r7, r6
 cb d0                 addi.s8	r7, -0x30
 f1 77                 zext8	r7
 cf 0a                 cmpi.s8	r7, 0xa
 d2 61                 brult8	0x61 <L11>
 0e                    mov	r7, r6
 cb 9f                 addi.s8	r7, -0x61
 f1 77                 zext8	r7
 cf 1a                 cmpi.s8	r7, 0x1a
 d8 0a                 bruge8	0xa <L5>
 c7 a9 ff              ldi16	r7, 0xffa9
 1e                    add	r7, r6
 cf 10                 cmpi.s8	r7, 0x10
 d2 50                 brult8	0x50 <L11>
 d4 11                 jmp8	0x11 <L6>
<L5>:
 0e                    mov	r7, r6
 cb bf                 addi.s8	r7, -0x41
 f1 77                 zext8	r7
 cf 1a                 cmpi.s8	r7, 0x1a
 d8 08                 bruge8	0x8 <L6>
 c7 c9 ff              ldi16	r7, 0xffc9
 1e                    add	r7, r6
 cf 10                 cmpi.s8	r7, 0x10
 d2 3d                 brult8	0x3d <L11>
<L6>:
 c2 3d                 ldi8	r6, 0x3d
 f9 c4                 and	r6, r1
 f4 a6                 tst8	r6
 d0 06                 breq8	0x6 <L7>
 f1 1a                 mov	r3, r2
 f1 01                 mov	r0, r1
 d4 2f                 jmp8	0x2f <L11>
<L7>:
 ed c4 20              ld8u	r6, [r2+0]
 ce 30                 cmpi.s8	r6, 0x30
 d1 1f                 brne8	0x1f <L8>
 ed c4 21              ld8u	r6, [r2+1]
 c3 20                 ldi8	r7, 0x20
 9e                    or	r7, r6
 f0 00 08              ldi8	r0, 0x8
 cf 62                 cmpi.s8	r7, 0x62
 d1 15                 brne8	0x15 <L9>
 ed c4 22              ld8u	r6, [r2+2]
 c3 fe                 ldi8	r7, 0xfe
 8e                    and	r7, r6
 cf 30                 cmpi.s8	r7, 0x30
 d1 0b                 brne8	0xb <L9>
 f0 00 02              ldi8	r0, 0x2
 f0 0a 02              addi.s8	r2, 0x2
 d4 07                 jmp8	0x7 <L10>
<L8>:
 f0 00 0a              ldi8	r0, 0xa
<L9>:
 f6 29                 tst16	r1
 fb 41                 cmov.ne	r0, r1
<L10>:
 f1 1a                 mov	r3, r2
<L11>:
 f4 22                 ldsp16	r6, [sp+0x8]
 6a                    ld16	r6, [r6]
 f6 2e                 tst16	r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 fb 26                 cmov.eq	r4, r6
 fb 2f                 cmov.eq	r5, r7
 d6 fe                 adjsp	-0x2
 f0 16 16              leasp	r6, 0x16
 f4 42                 stsp16	[sp+0x0], r6
 f0 38 04              stsp16	[sp+0x4], r0
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 e1 74 0c              call16	__avm_udivmodsi4
 d6 02                 adjsp	0x2
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 36 14              ldsp16	r6, [sp+0x14]
 f4 62                 stsp16	[sp+0x8], r6
 f4 1b                 ldsp16	r7, [sp+0x6]
 d4 0b                 jmp8	0xb <L14>
<L12>:
 c2 01                 ldi8	r6, 0x1
 7e                    st16	[r7], r6
<L13>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 b6                 dec16	r6
 f4 42                 stsp16	[sp+0x0], r6
 f4 ab                 inc16	r3
<L14>:
 ed 46 20              ld8u	r2, [r3+0]
 f1 2a                 mov	r6, r2
 ca d0                 addi.s8	r6, -0x30
 f1 76                 zext8	r6
 ce 0a                 cmpi.s8	r6, 0xa
 d8 05                 bruge8	0x5 <L15>
 f0 0a d0              addi.s8	r2, -0x30
 d4 24                 jmp8	0x24 <L17>
<L15>:
 f1 2a                 mov	r6, r2
 ca 9f                 addi.s8	r6, -0x61
 f1 76                 zext8	r6
 ce 1a                 cmpi.s8	r6, 0x1a
 d8 05                 bruge8	0x5 <L16>
 f0 0a a9              addi.s8	r2, -0x57
 d4 15                 jmp8	0x15 <L17>
<L16>:
 f1 2a                 mov	r6, r2
 ca c9                 addi.s8	r6, -0x37
 f0 0a bf              addi.s8	r2, -0x41
 f1 72                 zext8	r2
 c7 ff ff              ldi16	r7, 0xffff
 f0 0e 1a              cmpi.s8	r2, 0x1a
 fc 3e                 cmov.ult	r7, r6
 f1 17                 mov	r2, r7
 f4 1b                 ldsp16	r7, [sp+0x6]
<L17>:
 f4 0a                 ldsp16	r6, [sp+0x2]
 f5 16                 cmp	r2, r6
 d8 27                 bruge8	0x27 <L19>
 f0 69 08              cmp32	q0, q2
 d2 b4                 brult8	-0x4c <L12>
 f0 69 80              cmp32	q2, q0
 d1 06                 brne8	0x6 <L18>
 f4 22                 ldsp16	r6, [sp+0x8]
 f5 2a                 cmp	r6, r2
 d2 a9                 brult8	-0x57 <L12>
<L18>:
 6b                    ld16	r6, [r7]
 f6 2e                 tst16	r6
 d1 a7                 brne8	-0x59 <L13>
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 e1 a2 0b              call16	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f1 22                 mov	r4, r2
 a5                    xor	r5, r5
 f7 6b                 add32	q2, q3
 f4 1b                 ldsp16	r7, [sp+0x6]
 d4 95                 jmp8	-0x6b <L13>
<L19>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f6 2e                 tst16	r6
 d0 1b                 breq8	0x1b <L22>
 f0 36 12              ldsp16	r6, [sp+0x12]
 f6 2e                 tst16	r6
 d0 02                 breq8	0x2 <L20>
 f5 5b                 st16	[r6], r3
<L20>:
 6b                    ld16	r6, [r7]
 f6 2e                 tst16	r6
 d0 0f                 breq8	0xf <L23>
 c2 22                 ldi8	r6, 0x22
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
<L21>:
 f0 5e 07 01           stm16	[0x107], r6
 d4 02                 jmp8	0x2 <L23>
<L22>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
<L23>:
 d6 18                 adjsp	0x18
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<strtoul>:
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 d6 f4                 adjsp	-0xc
 f0 17 0c              leasp	r7, 0xc
 f4 6b                 stsp16	[sp+0xa], r7
 f0 17 0e              leasp	r7, 0xe
 f4 63                 stsp16	[sp+0x8], r7
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e1 06 fe              call16	parse_ulong
 d6 0c                 adjsp	0xc
 f4 02                 ldsp16	r6, [sp+0x0]
 f6 2e                 tst16	r6
 d1 10                 brne8	0x10 <L1>
 f4 0a                 ldsp16	r6, [sp+0x2]
 f6 2e                 tst16	r6
 d0 08                 breq8	0x8 <L0>
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f7 72                 sub32	q0, q2
 d4 02                 jmp8	0x2 <L1>
<L0>:
 f2 62                 mov32	q0, q2
<L1>:
 f2 68                 mov32	q2, q0
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
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
