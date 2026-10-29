
time_calendar.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 time_calendar.c
00000000 l    d  .text.__avm_time_floor	00000000 .text.__avm_time_floor
00000000 l    d  .text.__avm_time_days	00000000 .text.__avm_time_days
00000000 l    d  .text.__avm_time_civil	00000000 .text.__avm_time_civil
00000000 l    d  .text.__avm_time_split	00000000 .text.__avm_time_split
00000000 g     F .text.__avm_time_floor	0000001d __avm_time_floor
00000000         *UND*	00000000 __avm_divmodsi4
00000000 g     F .text.__avm_time_days	000000d8 __avm_time_days
00000000         *UND*	00000000 __avm_mulsi3
00000000         *UND*	00000000 __avm_divsi3
00000000 g     F .text.__avm_time_civil	00000143 __avm_time_civil
00000000 g     F .text.__avm_time_split	00000347 __avm_time_split
00000000         *UND*	00000000 __avm_divmoddi4
00000000         *UND*	00000000 __avm_modsi3
00000000         *UND*	00000000 __avm_udivmodsi4
00000000         *UND*	00000000 __avm_udivsi3

Disassembly of section .text.__avm_time_floor:

<__avm_time_floor>:
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 d6 fe                 adjsp	-0x2
 f0 10 02              leasp	r0, 0x2
 f0 38 00              stsp16	[sp+0x0], r0
 e3 00 00 00           callf	__avm_time_floor
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_divmodsi4
 d6 02                 adjsp	0x2
 f4 0b                 ldsp16	r7, [sp+0x2]
 0b                    mov	r6, r7
 fa df                 asr16i	r6, 0xf
 0e                    mov	r7, r6
 f7 6b                 add32	q2, q3
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 ef                    ret

Disassembly of section .text.__avm_time_days:

<__avm_time_days>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f2 63                 mov32	q0, q3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 02 02              ldi8	r2, 0x2
 f2 4b                 sub	r3, r3
 c0 09                 ldi8	r4, 0x9
 a5                    xor	r5, r5
 c6 fd ff              ldi16	r6, 0xfffd
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 40              cmp32	q1, q0
 fd 26                 cmov.slt	r4, r6
 fd 2f                 cmov.slt	r5, r7
 f7 68                 add32	q2, q0
 c2 99                 ldi8	r6, 0x99
 af                    xor	r7, r7
 e3 00 00 00           callf	__avm_time_days
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f7 69                 add32	q2, q1
 c2 05                 ldi8	r6, 0x5
 af                    xor	r7, r7
 e3 00 00 00           callf	__avm_time_days
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_divsi3
 f2 66                 mov32	q1, q2
 d6 fe                 adjsp	-0x2
 f0 14 0a              leasp	r4, 0xa
 f4 40                 stsp16	[sp+0x0], r4
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 f8 24                 cset.slt	r4
 08                    mov	r6, r4
 af                    xor	r7, r7
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f7 7b                 sub32	q2, q3
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 36 19              ldsp16	r6, [sp+0x19]
 f0 37 1b              ldsp16	r7, [sp+0x1b]
 f7 67                 add32	q1, q3
 c6 90 01              ldi16	r6, 0x190
 af                    xor	r7, r7
 e3 00 00 00           callf	__avm_time_days
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_divmodsi4
 d6 02                 adjsp	0x2
 f2 62                 mov32	q0, q2
 f4 29                 ldsp16	r5, [sp+0xa]
 01                    mov	r4, r5
 fa bf                 asr16i	r4, 0xf
 04                    mov	r5, r4
 f7 62                 add32	q0, q2
 c6 b1 3a              ldi16	r6, 0x3ab1
 c3 02                 ldi8	r7, 0x2
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__avm_time_days
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f7 69                 add32	q2, q1
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c6 70 fe              ldi16	r6, 0xfe70
 c7 ff ff              ldi16	r7, 0xffff
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__avm_time_days
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f2 66                 mov32	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f7 66                 add32	q1, q2
 c6 6d 01              ldi16	r6, 0x16d
 af                    xor	r7, r7
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	__avm_time_days
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f1 23                 mov	r4, r3
 fa bf                 asr16i	r4, 0xf
 a5                    xor	r5, r5
 fa 7e                 lsr16i	r4, 0xe
 f7 69                 add32	q2, q1
 08                    mov	r6, r4
 fa 92                 lsr16i	r6, 0x2
 01                    mov	r4, r5
 04                    mov	r5, r4
 fa 4e                 lsl16i	r5, 0xe
 96                    or	r5, r6
 fa b2                 asr16i	r4, 0x2
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 f7 62                 add32	q0, q2
 c6 9c ff              ldi16	r6, 0xff9c
 c7 ff ff              ldi16	r7, 0xffff
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	__avm_time_days
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_divsi3
 f7 68                 add32	q2, q0
 c6 93 05              ldi16	r6, 0x593
 c7 f5 ff              ldi16	r7, 0xfff5
 f7 6b                 add32	q2, q3
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.__avm_time_civil:

<__avm_time_civil>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 f4 53                 stsp16	[sp+0x4], r7
 f4 5a                 stsp16	[sp+0x6], r6
 d6 fe                 adjsp	-0x2
 f0 16 0e              leasp	r6, 0xe
 f4 42                 stsp16	[sp+0x0], r6
 f0 06 6c fa           ldi16	r2, 0xfa6c
 f0 03 0a              ldi8	r3, 0xa
 f7 66                 add32	q1, q2
 c6 b1 3a              ldi16	r6, 0x3ab1
 c3 02                 ldi8	r7, 0x2
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	__avm_time_civil
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_divmodsi4
 d6 02                 adjsp	0x2
 f4 3b                 ldsp16	r7, [sp+0xe]
 0b                    mov	r6, r7
 fa df                 asr16i	r6, 0xf
 0e                    mov	r7, r6
 f7 6b                 add32	q2, q3
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c6 4f c5              ldi16	r6, 0xc54f
 c7 fd ff              ldi16	r7, 0xfffd
 e3 00 00 00           callf	__avm_time_civil
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f2 62                 mov32	q0, q2
 f7 61                 add32	q0, q1
 c6 4c fa              ldi16	r6, 0xfa4c
 c7 ff ff              ldi16	r7, 0xffff
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__avm_time_civil
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_divsi3
 f2 66                 mov32	q1, q2
 f7 64                 add32	q1, q0
 c6 ac 8e              ldi16	r6, 0x8eac
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__avm_time_civil
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_divsi3
 f7 69                 add32	q2, q1
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 c6 50 c5              ldi16	r6, 0xc550
 c7 fd ff              ldi16	r7, 0xfffd
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__avm_time_civil
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_divsi3
 f2 66                 mov32	q1, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 66                 add32	q1, q2
 f2 69                 mov32	q2, q1
 c6 4c fa              ldi16	r6, 0xfa4c
 c7 ff ff              ldi16	r7, 0xffff
 e3 00 00 00           callf	__avm_time_civil
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_divsi3
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 c6 94 8e              ldi16	r6, 0x8e94
 af                    xor	r7, r7
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	__avm_time_civil
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_divsi3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f7 6c                 add32	q3, q0
 f7 6e                 add32	q3, q2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 c6 6d 01              ldi16	r6, 0x16d
 af                    xor	r7, r7
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	__avm_time_civil
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_divsi3
 f2 66                 mov32	q1, q2
 c6 93 fe              ldi16	r6, 0xfe93
 c7 ff ff              ldi16	r7, 0xffff
 e3 00 00 00           callf	__avm_time_civil
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f2 62                 mov32	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 62                 add32	q0, q2
 c6 90 01              ldi16	r6, 0x190
 af                    xor	r7, r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 e3 00 00 00           callf	__avm_time_civil
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f7 69                 add32	q2, q1
 f0 36 1b              ldsp16	r6, [sp+0x1b]
 f4 62                 stsp16	[sp+0x8], r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 f0 6b 8c              st32	[r6], q2
 f2 68                 mov32	q2, q0
 f7 6a                 add32	q2, q2
 f7 6a                 add32	q2, q2
 f7 68                 add32	q2, q0
 f0 02 02              ldi8	r2, 0x2
 f2 4b                 sub	r3, r3
 f7 69                 add32	q2, q1
 c2 99                 ldi8	r6, 0x99
 af                    xor	r7, r7
 e3 00 00 00           callf	__avm_time_civil
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_divsi3
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c2 99                 ldi8	r6, 0x99
 af                    xor	r7, r7
 e3 00 00 00           callf	__avm_time_civil
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f7 69                 add32	q2, q1
 c6 fb ff              ldi16	r6, 0xfffb
 c7 ff ff              ldi16	r7, 0xffff
 e3 00 00 00           callf	__avm_time_civil
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_divsi3
 f0 06 32 01           ldi16	r2, 0x132
 c6 f7 ff              ldi16	r6, 0xfff7
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 04              cmp32	q0, q1
 f0 02 03              ldi8	r2, 0x3
 fd 32                 cmov.slt	r6, r2
 fd 3b                 cmov.slt	r7, r3
 f7 68                 add32	q2, q0
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f7 62                 add32	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f0 6b 08              st32	[r4], q0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 6e                 add32	q3, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 6b c8              st32	[r4], q3
 f0 69 c4              cmp32	q3, q1
 f8 24                 cset.slt	r4
 a5                    xor	r5, r5
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 6a c0              ld32	q3, [r0]
 f7 6e                 add32	q3, q2
 f0 6b c0              st32	[r0], q3
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.__avm_time_split:

<__avm_time_split>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ca                 adjsp	-0x36
 d6 f6                 adjsp	-0xa
 f0 10 38              leasp	r0, 0x38
 f0 38 08              stsp16	[sp+0x8], r0
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 04 80 51           ldi16	r0, 0x5180
 f0 01 01              ldi8	r1, 0x1
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e3 00 00 00           callf	__avm_time_split
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_divmoddi4
 d6 0a                 adjsp	0xa
 f0 32 41              ldsp16	r2, [sp+0x41]
 f0 3a 18              stsp16	[sp+0x18], r2
 f0 32 2e              ldsp16	r2, [sp+0x2e]
 f0 33 30              ldsp16	r3, [sp+0x30]
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 69 04              cmp32	q0, q1
 d3 04                 brslt8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_time_split
		R_AVM_FAR24	.text.__avm_time_split+0x56
<L0>:
 f0 3a 2a              stsp16	[sp+0x2a], r2
 f0 3b 2c              stsp16	[sp+0x2c], r3
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 e2 00 00 00           jmpf	__avm_time_split
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_time_split+0x7f
 f0 04 80 51           ldi16	r0, 0x5180
 f0 01 01              ldi8	r1, 0x1
 f7 64                 add32	q1, q0
 f0 3a 2a              stsp16	[sp+0x2a], r2
 f0 3b 2c              stsp16	[sp+0x2c], r3
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f7 68                 add32	q2, q0
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f8 04                 cset.eq	r4
 a5                    xor	r5, r5
 f7 7e                 sub32	q3, q2
 c4 ff d2              ldi16	r4, 0xd2ff
 c5 ce fe              ldi16	r5, 0xfece
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f7 69                 add32	q2, q1
 f0 04 ff a5           ldi16	r0, 0xa5ff
 f0 05 9d fd           ldi16	r1, 0xfd9d
 f0 69 80              cmp32	q2, q0
 f8 10                 cset.ult	r0
 f0 69 84              cmp32	q2, q1
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f7 6b                 add32	q2, q3
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 f0 69 8c              cmp32	q2, q3
 f8 0d                 cset.ne	r5
 fb 28                 cmov.eq	r5, r0
 a0                    xor	r4, r4
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_time_split
		R_AVM_FAR24	.text.__avm_time_split+0x340
<L1>:
 d6 fe                 adjsp	-0x2
 f0 14 1c              leasp	r4, 0x1c
 f4 40                 stsp16	[sp+0x0], r4
 f0 06 6c fa           ldi16	r2, 0xfa6c
 f0 03 0a              ldi8	r3, 0xa
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f7 66                 add32	q1, q2
 c6 b1 3a              ldi16	r6, 0x3ab1
 c3 02                 ldi8	r7, 0x2
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	__avm_time_split
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_divmodsi4
 d6 02                 adjsp	0x2
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 0b                    mov	r6, r7
 fa df                 asr16i	r6, 0xf
 0e                    mov	r7, r6
 f7 6b                 add32	q2, q3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c6 4f c5              ldi16	r6, 0xc54f
 c7 fd ff              ldi16	r7, 0xfffd
 e3 00 00 00           callf	__avm_time_split
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f2 62                 mov32	q0, q2
 f7 61                 add32	q0, q1
 c6 4c fa              ldi16	r6, 0xfa4c
 c7 ff ff              ldi16	r7, 0xffff
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__avm_time_split
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_divsi3
 f2 66                 mov32	q1, q2
 f7 64                 add32	q1, q0
 c6 ac 8e              ldi16	r6, 0x8eac
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__avm_time_split
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_divsi3
 f7 69                 add32	q2, q1
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c6 50 c5              ldi16	r6, 0xc550
 c7 fd ff              ldi16	r7, 0xfffd
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__avm_time_split
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_divsi3
 f2 66                 mov32	q1, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f2 69                 mov32	q2, q1
 c6 4c fa              ldi16	r6, 0xfa4c
 c7 ff ff              ldi16	r7, 0xffff
 e3 00 00 00           callf	__avm_time_split
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_divsi3
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c6 94 8e              ldi16	r6, 0x8e94
 af                    xor	r7, r7
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	__avm_time_split
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_divsi3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f7 6c                 add32	q3, q0
 f7 6e                 add32	q3, q2
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c6 6d 01              ldi16	r6, 0x16d
 af                    xor	r7, r7
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	__avm_time_split
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_divsi3
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 c6 93 fe              ldi16	r6, 0xfe93
 c7 ff ff              ldi16	r7, 0xffff
 e3 00 00 00           callf	__avm_time_split
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f7 6a                 add32	q2, q2
 f7 6a                 add32	q2, q2
 f7 68                 add32	q2, q0
 c2 02                 ldi8	r6, 0x2
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 c2 99                 ldi8	r6, 0x99
 e3 00 00 00           callf	__avm_time_split
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_divsi3
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c4 32 01              ldi16	r4, 0x132
 a5                    xor	r5, r5
 f0 06 f7 ff           ldi16	r2, 0xfff7
 f0 07 ff ff           ldi16	r3, 0xffff
 c2 03                 ldi8	r6, 0x3
 af                    xor	r7, r7
 f0 38 1e              stsp16	[sp+0x1e], r0
 f0 39 20              stsp16	[sp+0x20], r1
 f0 69 08              cmp32	q0, q2
 fd 16                 cmov.slt	r2, r6
 fd 1f                 cmov.slt	r3, r7
 f2 63                 mov32	q0, q3
 c6 90 01              ldi16	r6, 0x190
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 e3 00 00 00           callf	__avm_time_split
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f7 6b                 add32	q2, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f7 67                 add32	q1, q3
 f1 2a                 mov	r6, r2
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 69 40              cmp32	q1, q0
 f8 26                 cset.slt	r6
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 c4 94 78              ldi16	r4, 0x7894
 c5 ff ff              ldi16	r5, 0xffff
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f7 6b                 add32	q2, q3
 aa                    xor	r6, r6
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 8c              cmp32	q2, q3
 a0                    xor	r4, r4
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_time_split
		R_AVM_FAR24	.text.__avm_time_split+0x340
<L2>:
 c0 04                 ldi8	r4, 0x4
 a5                    xor	r5, r5
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f7 6b                 add32	q2, q3
 c2 07                 ldi8	r6, 0x7
 af                    xor	r7, r7
 e3 00 00 00           callf	__avm_time_split
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_modsi3
 f1 1c                 mov	r3, r4
 f0 0b 07              addi.s8	r3, 0x7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 fd 23                 cmov.slt	r4, r3
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 c2 99                 ldi8	r6, 0x99
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 e3 00 00 00           callf	__avm_time_split
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 c2 02                 ldi8	r6, 0x2
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 c6 fb ff              ldi16	r6, 0xfffb
 c7 ff ff              ldi16	r7, 0xffff
 e3 00 00 00           callf	__avm_time_split
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_divsi3
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 d6 fe                 adjsp	-0x2
 f0 14 28              leasp	r4, 0x28
 f4 40                 stsp16	[sp+0x0], r4
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 f7 69                 add32	q2, q1
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 c6 90 01              ldi16	r6, 0x190
 af                    xor	r7, r7
 e3 00 00 00           callf	__avm_time_split
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_divmodsi4
 d6 02                 adjsp	0x2
 f2 62                 mov32	q0, q2
 d6 fe                 adjsp	-0x2
 f0 14 24              leasp	r4, 0x24
 f4 40                 stsp16	[sp+0x0], r4
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f7 6e                 add32	q3, q2
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 01                    mov	r4, r5
 fa bf                 asr16i	r4, 0xf
 04                    mov	r5, r4
 f7 62                 add32	q0, q2
 f0 38 20              stsp16	[sp+0x20], r0
 f0 39 22              stsp16	[sp+0x22], r1
 c4 94 f8              ldi16	r4, 0xf894
 f2 22                 add	r4, r2
 f0 3c 12              stsp16	[sp+0x12], r4
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f7 6b                 add32	q2, q3
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 c2 3c                 ldi8	r6, 0x3c
 af                    xor	r7, r7
 f0 30 2c              ldsp16	r0, [sp+0x2c]
 f0 31 2e              ldsp16	r1, [sp+0x2e]
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__avm_time_split
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_udivmodsi4
 d6 02                 adjsp	0x2
 f2 66                 mov32	q1, q2
 c0 3c                 ldi8	r4, 0x3c
 ec 54                 urem16	r2, r4
 a0                    xor	r4, r4
 f0 33 18              ldsp16	r3, [sp+0x18]
 ee 96 30              st16	[r3+16], r4
 c6 10 0e              ldi16	r6, 0xe10
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__avm_time_split
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_udivsi3
 ee 96 24              st16	[r3+4], r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 b4                 dec16	r4
 ee 96 28              st16	[r3+8], r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 ee 96 2a              st16	[r3+10], r4
 c6 70 fe              ldi16	r6, 0xfe70
 c7 ff ff              ldi16	r7, 0xffff
 f0 30 1e              ldsp16	r0, [sp+0x1e]
 f0 31 20              ldsp16	r1, [sp+0x20]
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__avm_time_split
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 6e                 add32	q3, q2
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c6 4f c5              ldi16	r6, 0xc54f
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__avm_time_split
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f2 62                 mov32	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 62                 add32	q0, q2
 f0 34 22              ldsp16	r4, [sp+0x22]
 ee 96 20              st16	[r3+0], r4
 ee 56 22              st16	[r3+2], r2
 c6 93 fe              ldi16	r6, 0xfe93
 af                    xor	r7, r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 e3 00 00 00           callf	__avm_time_split
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_mulsi3
 f2 66                 mov32	q1, q2
 f7 64                 add32	q1, q0
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 36 18              ldsp16	r6, [sp+0x18]
 ee 9c 26              st16	[r6+6], r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 ee 9c 2c              st16	[r6+12], r4
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f1 21                 mov	r4, r1
 fa bf                 asr16i	r4, 0xf
 a5                    xor	r5, r5
 fa 7e                 lsr16i	r4, 0xe
 f7 68                 add32	q2, q0
 08                    mov	r6, r4
 fa 92                 lsr16i	r6, 0x2
 01                    mov	r4, r5
 fa 3e                 lsl16i	r4, 0xe
 92                    or	r4, r6
 04                    mov	r5, r4
 f7 76                 sub32	q1, q2
 c2 64                 ldi8	r6, 0x64
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	__avm_time_split
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_divsi3
 f7 69                 add32	q2, q1
 c6 3a f9              ldi16	r6, 0xf93a
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f0 35 18              ldsp16	r5, [sp+0x18]
 ee da 2e              st16	[r5+14], r6
 c0 01                 ldi8	r4, 0x1
 d6 36                 adjsp	0x36
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
