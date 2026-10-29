
builtins_integer.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 integer.c
00000000 l    d  .text.__avm_ashlsi3	00000000 .text.__avm_ashlsi3
00000000 l    d  .text.__avm_lshrsi3	00000000 .text.__avm_lshrsi3
00000000 l    d  .text.__avm_ashrsi3	00000000 .text.__avm_ashrsi3
00000000 l    d  .text.__avm_rotlsi3	00000000 .text.__avm_rotlsi3
00000000 l    d  .text.__avm_rotrsi3	00000000 .text.__avm_rotrsi3
00000000 l    d  .text.__avm_mulhisi3	00000000 .text.__avm_mulhisi3
00000000 l    d  .text.__avm_umulhisi3	00000000 .text.__avm_umulhisi3
00000000 l    d  .text.__avm_mulsi3	00000000 .text.__avm_mulsi3
00000000 l    d  .text.__avm_udivmodsi4	00000000 .text.__avm_udivmodsi4
00000000 l    d  .text.__avm_udivsi3	00000000 .text.__avm_udivsi3
00000000 l    d  .text.__avm_umodsi3	00000000 .text.__avm_umodsi3
00000000 l    d  .text.__avm_divmodsi4	00000000 .text.__avm_divmodsi4
00000000 l    d  .text.__avm_divsi3	00000000 .text.__avm_divsi3
00000000 l    d  .text.__avm_modsi3	00000000 .text.__avm_modsi3
00000000 g     F .text.__avm_ashlsi3	0000002c __avm_ashlsi3
00000000 g     F .text.__avm_lshrsi3	0000002c __avm_lshrsi3
00000000 g     F .text.__avm_ashrsi3	0000002b __avm_ashrsi3
00000000 g     F .text.__avm_rotlsi3	00000026 __avm_rotlsi3
00000000 g     F .text.__avm_rotrsi3	00000026 __avm_rotrsi3
00000000 g     F .text.__avm_mulhisi3	00000047 __avm_mulhisi3
00000000 g     F .text.__avm_umulhisi3	0000004b __avm_umulhisi3
00000000 g     F .text.__avm_mulsi3	00000068 __avm_mulsi3
00000000 g     F .text.__avm_udivmodsi4	0000007c __avm_udivmodsi4
00000000 g     F .text.__avm_udivsi3	00000015 __avm_udivsi3
00000000 g     F .text.__avm_umodsi3	00000019 __avm_umodsi3
00000000 g     F .text.__avm_divmodsi4	0000008f __avm_divmodsi4
00000000 g     F .text.__avm_divsi3	00000064 __avm_divsi3
00000000 g     F .text.__avm_modsi3	00000049 __avm_modsi3

Disassembly of section .text.__avm_ashlsi3:

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

Disassembly of section .text.__avm_lshrsi3:

<__avm_lshrsi3>:
 f6 2f                 tst16	r7
 d1 23                 brne8	0x23 <L1>
 ce 10                 cmpi.s8	r6, 0x10
 d8 12                 bruge8	0x12 <L0>
 f6 2e                 tst16	r6
 d0 1f                 breq8	0x1f <L2>
 0d                    mov	r7, r5
 fa 12                 lsr16v	r4, r6
 fa 16                 lsr16v	r5, r6
 f6 4e                 neg16	r6
 ca 10                 addi.s8	r6, 0x10
 fa 0e                 shl16v	r7, r6
 93                    or	r4, r7
 d4 11                 jmp8	0x11 <L2>
<L0>:
 ce 20                 cmpi.s8	r6, 0x20
 d8 09                 bruge8	0x9 <L1>
 ca f0                 addi.s8	r6, -0x10
 fa 16                 lsr16v	r5, r6
 01                    mov	r4, r5
 c1 00                 ldi8	r5, 0x0
 d4 04                 jmp8	0x4 <L2>
<L1>:
 c0 00                 ldi8	r4, 0x0
 c1 00                 ldi8	r5, 0x0
<L2>:
 ef                    ret

Disassembly of section .text.__avm_ashrsi3:

<__avm_ashrsi3>:
 f6 2f                 tst16	r7
 d1 23                 brne8	0x23 <L1>
 ce 10                 cmpi.s8	r6, 0x10
 d8 12                 bruge8	0x12 <L0>
 f6 2e                 tst16	r6
 d0 1e                 breq8	0x1e <L2>
 0d                    mov	r7, r5
 fa 12                 lsr16v	r4, r6
 fa 26                 asr16v	r5, r6
 f6 4e                 neg16	r6
 ca 10                 addi.s8	r6, 0x10
 fa 0e                 shl16v	r7, r6
 93                    or	r4, r7
 d4 10                 jmp8	0x10 <L2>
<L0>:
 ce 20                 cmpi.s8	r6, 0x20
 d8 09                 bruge8	0x9 <L1>
 ca f0                 addi.s8	r6, -0x10
 01                    mov	r4, r5
 fa 22                 asr16v	r4, r6
 fa cf                 asr16i	r5, 0xf
 d4 03                 jmp8	0x3 <L2>
<L1>:
 fa cf                 asr16i	r5, 0xf
 01                    mov	r4, r5
<L2>:
 ef                    ret

Disassembly of section .text.__avm_rotlsi3:

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

Disassembly of section .text.__avm_rotrsi3:

<__avm_rotrsi3>:
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
 fa 12                 lsr16v	r4, r6
 fa 16                 lsr16v	r5, r6
 f6 4e                 neg16	r6
 ca 10                 addi.s8	r6, 0x10
 fa 0e                 shl16v	r7, r6
 97                    or	r5, r7
 f1 2c                 mov	r7, r0
 fa 0e                 shl16v	r7, r6
 93                    or	r4, r7
<L1>:
 b8                    pop16	r0
 ef                    ret

Disassembly of section .text.__avm_mulhisi3:

<__avm_mulhisi3>:
 d6 fa                 adjsp	-0x6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f4 4a                 stsp16	[sp+0x2], r6
 f1 75                 zext8	r5
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 f3 19                 mulu8.w	r6, r5
 f4 52                 stsp16	[sp+0x4], r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 3b                 mulsu8.w	r6, r7
 f4 42                 stsp16	[sp+0x0], r6
 fa 78                 lsr16i	r4, 0x8
 f4 0b                 ldsp16	r7, [sp+0x2]
 08                    mov	r6, r4
 f3 2b                 muls8.w	r6, r7
 f3 31                 mulsu8.w	r4, r5
 04                    mov	r5, r4
 fa c8                 asr16i	r5, 0x8
 16                    add	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 fa e8                 asr16i	r7, 0x8
 1d                    add	r7, r5
 f4 4b                 stsp16	[sp+0x2], r7
 18                    add	r6, r4
 fa 38                 lsl16i	r4, 0x8
 f4 11                 ldsp16	r5, [sp+0x4]
 0c                    mov	r7, r4
 1d                    add	r7, r5
 07                    mov	r5, r7
 34                    cmp	r5, r4
 f8 14                 cset.ult	r4
 f4 0b                 ldsp16	r7, [sp+0x2]
 13                    add	r4, r7
 fa 58                 lsl16i	r6, 0x8
 f4 13                 ldsp16	r7, [sp+0x4]
 1b                    add	r6, r7
 39                    cmp	r6, r5
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 02                    mov	r4, r6
 d6 06                 adjsp	0x6
 ef                    ret

Disassembly of section .text.__avm_umulhisi3:

<__avm_umulhisi3>:
 d6 f8                 adjsp	-0x8
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f4 52                 stsp16	[sp+0x4], r6
 f1 75                 zext8	r5
 f4 41                 stsp16	[sp+0x0], r5
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 f3 19                 mulu8.w	r6, r5
 f4 5a                 stsp16	[sp+0x6], r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f3 1b                 mulu8.w	r6, r7
 fa 78                 lsr16i	r4, 0x8
 f4 11                 ldsp16	r5, [sp+0x4]
 0c                    mov	r7, r4
 f3 1d                 mulu8.w	r7, r5
 f4 4b                 stsp16	[sp+0x2], r7
 f4 01                 ldsp16	r5, [sp+0x0]
 f3 11                 mulu8.w	r4, r5
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 f4 09                 ldsp16	r5, [sp+0x2]
 1d                    add	r7, r5
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 17                    add	r5, r7
 f4 51                 stsp16	[sp+0x4], r5
 18                    add	r6, r4
 fa 38                 lsl16i	r4, 0x8
 f4 1b                 ldsp16	r7, [sp+0x6]
 04                    mov	r5, r4
 17                    add	r5, r7
 0d                    mov	r7, r5
 3c                    cmp	r7, r4
 f8 14                 cset.ult	r4
 f4 11                 ldsp16	r5, [sp+0x4]
 11                    add	r4, r5
 fa 58                 lsl16i	r6, 0x8
 f4 19                 ldsp16	r5, [sp+0x6]
 19                    add	r6, r5
 3b                    cmp	r6, r7
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 02                    mov	r4, r6
 d6 08                 adjsp	0x8
 ef                    ret

Disassembly of section .text.__avm_mulsi3:

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
 f4 5b                 stsp16	[sp+0x6], r7
 f4 13                 ldsp16	r7, [sp+0x4]
 f3 3d                 mulsu8.w	r7, r5
 f4 43                 stsp16	[sp+0x0], r7
 fa 78                 lsr16i	r4, 0x8
 f4 11                 ldsp16	r5, [sp+0x4]
 0c                    mov	r7, r4
 f3 2d                 muls8.w	r7, r5
 f3 32                 mulsu8.w	r4, r6
 04                    mov	r5, r4
 fa c8                 asr16i	r5, 0x8
 17                    add	r5, r7
 f4 03                 ldsp16	r7, [sp+0x0]
 0b                    mov	r6, r7
 fa d8                 asr16i	r6, 0x8
 19                    add	r6, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 19                    add	r6, r5
 f4 62                 stsp16	[sp+0x8], r6
 1c                    add	r7, r4
 fa 38                 lsl16i	r4, 0x8
 f4 19                 ldsp16	r5, [sp+0x6]
 08                    mov	r6, r4
 19                    add	r6, r5
 06                    mov	r5, r6
 34                    cmp	r5, r4
 f8 14                 cset.ult	r4
 f4 22                 ldsp16	r6, [sp+0x8]
 12                    add	r4, r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 12                    add	r4, r6
 fa 68                 lsl16i	r7, 0x8
 f4 1a                 ldsp16	r6, [sp+0x6]
 1e                    add	r7, r6
 3d                    cmp	r7, r5
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 03                    mov	r4, r7
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

Disassembly of section .text.__avm_udivmodsi4:

<__avm_udivmodsi4>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f2 63                 mov32	q0, q3
 f0 36 17              ldsp16	r6, [sp+0x17]
 f4 42                 stsp16	[sp+0x0], r6
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_udivmodsi4
		R_AVM_FAR24	.text.__avm_udivmodsi4+0x64
<L0>:
 c2 20                 ldi8	r6, 0x20
 f4 6a                 stsp16	[sp+0xa], r6
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f2 67                 mov32	q1, q3
 f0 38 02              stsp16	[sp+0x2], r0
 f0 39 04              stsp16	[sp+0x4], r1
 f2 63                 mov32	q0, q3
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f7 65                 add32	q1, q1
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f9 c9                 or	r6, r2
 f1 16                 mov	r2, r6
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f0 69 48              cmp32	q1, q2
 aa                    xor	r6, r6
 fc 74                 cmov.uge	r6, r4
 fc 7d                 cmov.uge	r7, r5
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f7 77                 sub32	q1, q3
 f8 1e                 cset.uge	r6
 f7 60                 add32	q0, q0
 f9 c1                 or	r6, r0
 f7 6a                 add32	q2, q2
 f1 06                 mov	r0, r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 b6                 dec16	r6
 f4 6a                 stsp16	[sp+0xa], r6
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_udivmodsi4
		R_AVM_FAR24	.text.__avm_udivmodsi4+0x28
<L1>:
 e2 00 00 00           jmpf	__avm_udivmodsi4
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_udivmodsi4+0x6e
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f2 66                 mov32	q1, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 6b 48              st32	[r4], q1
 f2 68                 mov32	q2, q0
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.__avm_udivsi3:

<__avm_udivsi3>:
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 d6 fe                 adjsp	-0x2
 f0 10 02              leasp	r0, 0x2
 f0 38 00              stsp16	[sp+0x0], r0
 e3 00 00 00           callf	__avm_udivsi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_udivmodsi4
 d6 02                 adjsp	0x2
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 ef                    ret

Disassembly of section .text.__avm_umodsi3:

<__avm_umodsi3>:
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 d6 fe                 adjsp	-0x2
 f0 10 02              leasp	r0, 0x2
 f0 38 00              stsp16	[sp+0x0], r0
 e3 00 00 00           callf	__avm_umodsi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_udivmodsi4
 d6 02                 adjsp	0x2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 ef                    ret

Disassembly of section .text.__avm_divmodsi4:

<__avm_divmodsi4>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f0 30 15              ldsp16	r0, [sp+0x15]
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 c4              cmp32	q3, q1
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_divmodsi4
		R_AVM_FAR24	.text.__avm_divmodsi4+0x7f
<L0>:
 d6 fe                 adjsp	-0x2
 f0 38 02              stsp16	[sp+0x2], r0
 f0 10 08              leasp	r0, 0x8
 f0 38 00              stsp16	[sp+0x0], r0
 f2 62                 mov32	q0, q2
 f1 21                 mov	r4, r1
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 fa bf                 asr16i	r4, 0xf
 04                    mov	r5, r4
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 f7 72                 sub32	q0, q2
 03                    mov	r4, r7
 fa bf                 asr16i	r4, 0xf
 04                    mov	r5, r4
 f2 67                 mov32	q1, q3
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 f7 76                 sub32	q1, q2
 f2 68                 mov32	q2, q0
 f2 63                 mov32	q0, q3
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	__avm_divmodsi4
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_udivmodsi4
 d6 02                 adjsp	0x2
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f9 1a                 xor	r0, r6
 f9 3e                 xor	r1, r7
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f2 6b                 mov32	q3, q1
 f7 7e                 sub32	q3, q2
 f0 69 04              cmp32	q0, q1
 fd 26                 cmov.slt	r4, r6
 fd 2f                 cmov.slt	r5, r7
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f0 69 c4              cmp32	q3, q1
 f7 74                 sub32	q1, q0
 fd 02                 cmov.slt	r0, r2
 fd 0b                 cmov.slt	r1, r3
 f4 02                 ldsp16	r6, [sp+0x0]
 f0 6b 0c              st32	[r6], q0
 e2 00 00 00           jmpf	__avm_divmodsi4
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_divmodsi4+0x88
 f0 6b 80              st32	[r0], q2
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.__avm_divsi3:

<__avm_divsi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_divsi3
		R_AVM_FAR24	.text.__avm_divsi3+0x57
<L0>:
 f2 62                 mov32	q0, q2
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f1 21                 mov	r4, r1
 fa bf                 asr16i	r4, 0xf
 04                    mov	r5, r4
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 f7 72                 sub32	q0, q2
 03                    mov	r4, r7
 fa bf                 asr16i	r4, 0xf
 04                    mov	r5, r4
 f2 67                 mov32	q1, q3
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 f7 76                 sub32	q1, q2
 f2 68                 mov32	q2, q0
 f2 63                 mov32	q0, q3
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	__avm_divsi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_udivsi3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f9 1a                 xor	r0, r6
 f9 3e                 xor	r1, r7
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f2 6b                 mov32	q3, q1
 f7 7e                 sub32	q3, q2
 f0 69 04              cmp32	q0, q1
 fd 26                 cmov.slt	r4, r6
 fd 2f                 cmov.slt	r5, r7
 e2 00 00 00           jmpf	__avm_divsi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_divsi3+0x5d
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.__avm_modsi3:

<__avm_modsi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 c4              cmp32	q3, q1
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_modsi3
		R_AVM_FAR24	.text.__avm_modsi3+0x42
<L0>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 01                    mov	r4, r5
 fa bf                 asr16i	r4, 0xf
 04                    mov	r5, r4
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 f7 72                 sub32	q0, q2
 03                    mov	r4, r7
 fa bf                 asr16i	r4, 0xf
 04                    mov	r5, r4
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 f7 7e                 sub32	q3, q2
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__avm_modsi3
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_umodsi3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c4              cmp32	q3, q1
 f7 76                 sub32	q1, q2
 fd 22                 cmov.slt	r4, r2
 fd 2b                 cmov.slt	r5, r3
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
