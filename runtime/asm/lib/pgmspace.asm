
pgmspace.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 pgmspace.c
00000000 l    d  .text.memchr_P	00000000 .text.memchr_P
00000000 l    d  .text.strchr_P	00000000 .text.strchr_P
00000000 l    d  .text.strrchr_P	00000000 .text.strrchr_P
00000000 l    d  .text.strnlen_P	00000000 .text.strnlen_P
00000000 l    d  .text.strncmp_P	00000000 .text.strncmp_P
00000000 l    d  .text.strstr_P	00000000 .text.strstr_P
00000000 l    d  .text.strspn_P	00000000 .text.strspn_P
00000000 l    d  .text.strcspn_P	00000000 .text.strcspn_P
00000000 l    d  .text.strpbrk_P	00000000 .text.strpbrk_P
00000000 l    d  .text.strtok_rP	00000000 .text.strtok_rP
00000000 l    d  .text.memcpy_P	00000000 .text.memcpy_P
00000000 l    d  .text.memcmp_P	00000000 .text.memcmp_P
00000000 l    d  .text.strcmp_P	00000000 .text.strcmp_P
00000000 l    d  .text.strlen_P	00000000 .text.strlen_P
00000000 l    d  .text.strncpy_P	00000000 .text.strncpy_P
00000000 l    d  .text.strncat_P	00000000 .text.strncat_P
00000000 l    d  .text.strcpy_P	00000000 .text.strcpy_P
00000000 l    d  .text.strcat_P	00000000 .text.strcat_P
00000000 g     F .text.memchr_P	0000003b memchr_P
00000000 g     F .text.strchr_P	00000024 strchr_P
00000000 g     F .text.strrchr_P	00000025 strrchr_P
00000000 g     F .text.strnlen_P	0000002f strnlen_P
00000000 g     F .text.strncmp_P	00000034 strncmp_P
00000000 g     F .text.strstr_P	00000062 strstr_P
00000000 g     F .text.strspn_P	0000006a strspn_P
00000000 g     F .text.strcspn_P	00000062 strcspn_P
00000000 g     F .text.strpbrk_P	00000061 strpbrk_P
00000000 g     F .text.strtok_rP	000000d6 strtok_rP
00000000 g     F .text.memcpy_P	0000000b memcpy_P
00000000 g     F .text.memcmp_P	00000005 memcmp_P
00000000 g     F .text.strcmp_P	00000003 strcmp_P
00000000 g     F .text.strlen_P	00000005 strlen_P
00000000 g     F .text.strncpy_P	0000000b strncpy_P
00000000 g     F .text.strncat_P	0000000b strncat_P
00000000 g     F .text.strcpy_P	0000000c strcpy_P
00000000 g     F .text.strcat_P	0000000c strcat_P

Disassembly of section .text.memchr_P:

<memchr_P>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	memchr_P
		R_AVM_FAR24	.text.memchr_P+0x34
<L0>:
 f1 76                 zext8	r6
 f0 60 40              ldp8u	r2, [q0]
 f5 16                 cmp	r2, r6
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	memchr_P
		R_AVM_FAR24	.text.memchr_P+0x32
<L1>:
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f7 61                 add32	q0, q1
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	memchr_P
		R_AVM_FAR24	.text.memchr_P+0x12
<L2>:
 e2 00 00 00           jmpf	memchr_P
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.memchr_P+0x34
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.strchr_P:

<strchr_P>:
 b1                    push16	r1
 b0                    push16	r0
 f1 76                 zext8	r6
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f0 60 e8              ldp8u	r7, [q2]
 3e                    cmp	r7, r6
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strchr_P
		R_AVM_FAR24	.text.strchr_P+0x1f
<L0>:
 f7 68                 add32	q2, q0
 f4 a7                 tst8	r7
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strchr_P
		R_AVM_FAR24	.text.strchr_P+0x9
<L1>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f1 75                 zext8	r5
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

Disassembly of section .text.strrchr_P:

<strrchr_P>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f1 76                 zext8	r6
 f2 64                 mov32	q1, q0
 f0 65 e4              ldp8u	r7, [q1+]
 3e                    cmp	r7, r6
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 f4 a7                 tst8	r7
 f2 61                 mov32	q0, q1
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strrchr_P
		R_AVM_FAR24	.text.strrchr_P+0xc
<L0>:
 f1 75                 zext8	r5
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.strnlen_P:

<strnlen_P>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strnlen_P
		R_AVM_FAR24	.text.strnlen_P+0x2a
<L0>:
 f1 14                 mov	r2, r4
 f2 4b                 sub	r3, r3
 f7 64                 add32	q1, q0
 f0 60 a4              ldp8u	r5, [q1]
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strnlen_P
		R_AVM_FAR24	.text.strnlen_P+0x2a
<L1>:
 f4 ac                 inc16	r4
 38                    cmp	r6, r4
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strnlen_P
		R_AVM_FAR24	.text.strnlen_P+0xf
<L2>:
 02                    mov	r4, r6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.strncmp_P:

<strncmp_P>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f4 25                 ldsp16	r5, [sp+0x9]
 f2 30                 sub	r0, r0
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strncmp_P
		R_AVM_FAR24	.text.strncmp_P+0x2c
<L0>:
 f0 65 4c              ldp8u	r2, [q3+]
 f7 01                 ld8u	r1, [r4+]
 f4 b5                 dec16	r5
 f4 a1                 tst8	r1
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strncmp_P
		R_AVM_FAR24	.text.strncmp_P+0x26
<L1>:
 f5 0a                 cmp	r1, r2
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strncmp_P
		R_AVM_FAR24	.text.strncmp_P+0x7
<L2>:
 f2 3a                 sub	r1, r2
 e2 00 00 00           jmpf	strncmp_P
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strncmp_P+0x2e
 f1 08                 mov	r1, r0
 f1 21                 mov	r4, r1
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

Disassembly of section .text.strstr_P:

<strstr_P>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f0 60 2c              ldp8u	r1, [q3]
 f4 a1                 tst8	r1
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strstr_P
		R_AVM_FAR24	.text.strstr_P+0x5b
<L0>:
 f2 30                 sub	r0, r0
 44                    ld8u	r5, [r4]
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strstr_P
		R_AVM_FAR24	.text.strstr_P+0x59
<L1>:
 f0 39 00              stsp16	[sp+0x0], r1
 f2 67                 mov32	q1, q3
 04                    mov	r5, r4
 f5 34                 ld8u	r0, [r5]
 f5 01                 cmp	r0, r1
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strstr_P
		R_AVM_FAR24	.text.strstr_P+0x44
<L2>:
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f7 64                 add32	q1, q0
 f4 ad                 inc16	r5
 f0 60 24              ldp8u	r1, [q1]
 f4 a1                 tst8	r1
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strstr_P
		R_AVM_FAR24	.text.strstr_P+0x22
<L3>:
 e2 00 00 00           jmpf	strstr_P
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strstr_P+0x5b
 ed a8 21              ld8u	r5, [r4+1]
 f4 ac                 inc16	r4
 f4 a5                 tst8	r5
 f0 31 00              ldsp16	r1, [sp+0x0]
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strstr_P
		R_AVM_FAR24	.text.strstr_P+0x1f
<L4>:
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	strstr_P
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strstr_P+0x5b
 f1 20                 mov	r4, r0
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.strspn_P:

<strspn_P>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 04                    mov	r5, r4
 41                    ld8u	r4, [r5]
 f4 a4                 tst8	r4
 f4 59                 stsp16	[sp+0x6], r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strspn_P
		R_AVM_FAR24	.text.strspn_P+0x5f
<L0>:
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f4 51                 stsp16	[sp+0x4], r5
 f2 67                 mov32	q1, q3
 f0 60 a4              ldp8u	r5, [q1]
 34                    cmp	r5, r4
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strspn_P
		R_AVM_FAR24	.text.strspn_P+0x39
<L1>:
 f7 64                 add32	q1, q0
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strspn_P
		R_AVM_FAR24	.text.strspn_P+0x21
<L2>:
 e2 00 00 00           jmpf	strspn_P
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strspn_P+0x5d
 f1 73                 zext8	r3
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strspn_P
		R_AVM_FAR24	.text.strspn_P+0x5d
<L3>:
 f4 11                 ldsp16	r5, [sp+0x4]
 ed 8a 21              ld8u	r4, [r5+1]
 f4 ad                 inc16	r5
 f4 a4                 tst8	r4
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strspn_P
		R_AVM_FAR24	.text.strspn_P+0x1d
<L4>:
 e2 00 00 00           jmpf	strspn_P
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strspn_P+0x5f
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 18                 ldsp16	r4, [sp+0x6]
 24                    sub	r5, r4
 01                    mov	r4, r5
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.strcspn_P:

<strcspn_P>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 48                    ld8u	r6, [r4]
 f4 a6                 tst8	r6
 f4 40                 stsp16	[sp+0x0], r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strcspn_P
		R_AVM_FAR24	.text.strcspn_P+0x58
<L0>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 e2 00 00 00           jmpf	strcspn_P
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strcspn_P+0x3a
 f1 73                 zext8	r3
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strcspn_P
		R_AVM_FAR24	.text.strcspn_P+0x58
<L1>:
 ed c8 21              ld8u	r6, [r4+1]
 f4 ac                 inc16	r4
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strcspn_P
		R_AVM_FAR24	.text.strcspn_P+0x58
<L2>:
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
 f0 60 a4              ldp8u	r5, [q1]
 36                    cmp	r5, r6
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strcspn_P
		R_AVM_FAR24	.text.strcspn_P+0x20
<L3>:
 f7 64                 add32	q1, q0
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strcspn_P
		R_AVM_FAR24	.text.strcspn_P+0x40
<L4>:
 e2 00 00 00           jmpf	strcspn_P
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strcspn_P+0x2d
 f4 01                 ldsp16	r5, [sp+0x0]
 21                    sub	r4, r5
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.strpbrk_P:

<strpbrk_P>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 48                    ld8u	r6, [r4]
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strpbrk_P
		R_AVM_FAR24	.text.strpbrk_P+0x54
<L0>:
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 e2 00 00 00           jmpf	strpbrk_P
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strpbrk_P+0x36
 f1 71                 zext8	r1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strpbrk_P
		R_AVM_FAR24	.text.strpbrk_P+0x54
<L1>:
 ed c8 21              ld8u	r6, [r4+1]
 f4 ac                 inc16	r4
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strpbrk_P
		R_AVM_FAR24	.text.strpbrk_P+0x54
<L2>:
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f0 60 a0              ldp8u	r5, [q0]
 36                    cmp	r5, r6
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strpbrk_P
		R_AVM_FAR24	.text.strpbrk_P+0x1c
<L3>:
 f7 61                 add32	q0, q1
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strpbrk_P
		R_AVM_FAR24	.text.strpbrk_P+0x3c
<L4>:
 e2 00 00 00           jmpf	strpbrk_P
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strpbrk_P+0x29
 44                    ld8u	r5, [r4]
 aa                    xor	r6, r6
 f4 a5                 tst8	r5
 fb 26                 cmov.eq	r4, r6
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.strtok_rP:

<strtok_rP>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 35 13              ldsp16	r5, [sp+0x13]
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtok_rP
		R_AVM_FAR24	.text.strtok_rP+0x1e
<L0>:
 61                    ld16	r4, [r5]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtok_rP
		R_AVM_FAR24	.text.strtok_rP+0xd1
<L1>:
 f4 49                 stsp16	[sp+0x2], r5
 f5 32                 ld8u	r2, [r4]
 f4 a2                 tst8	r2
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtok_rP
		R_AVM_FAR24	.text.strtok_rP+0x68
<L2>:
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 60 ac              ldp8u	r5, [q3]
 f5 26                 cmp	r5, r2
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtok_rP
		R_AVM_FAR24	.text.strtok_rP+0x4c
<L3>:
 f7 6c                 add32	q3, q0
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtok_rP
		R_AVM_FAR24	.text.strtok_rP+0x33
<L4>:
 e2 00 00 00           jmpf	strtok_rP
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtok_rP+0x68
 f1 77                 zext8	r7
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 c4              cmp32	q3, q1
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtok_rP
		R_AVM_FAR24	.text.strtok_rP+0x68
<L5>:
 ed 48 21              ld8u	r2, [r4+1]
 f4 ac                 inc16	r4
 f4 a2                 tst8	r2
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtok_rP
		R_AVM_FAR24	.text.strtok_rP+0x2f
<L6>:
 f5 32                 ld8u	r2, [r4]
 f4 a2                 tst8	r2
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtok_rP
		R_AVM_FAR24	.text.strtok_rP+0xc5
<L7>:
 f4 40                 stsp16	[sp+0x0], r4
 e2 00 00 00           jmpf	strtok_rP
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtok_rP+0x94
 f1 77                 zext8	r7
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 c4              cmp32	q3, q1
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtok_rP
		R_AVM_FAR24	.text.strtok_rP+0xb1
<L8>:
 ed 48 21              ld8u	r2, [r4+1]
 f4 ac                 inc16	r4
 f4 a2                 tst8	r2
 d1 04                 brne8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtok_rP
		R_AVM_FAR24	.text.strtok_rP+0xb1
<L9>:
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 60 ac              ldp8u	r5, [q3]
 f5 26                 cmp	r5, r2
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtok_rP
		R_AVM_FAR24	.text.strtok_rP+0x78
<L10>:
 f7 6c                 add32	q3, q0
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtok_rP
		R_AVM_FAR24	.text.strtok_rP+0x98
<L11>:
 e2 00 00 00           jmpf	strtok_rP
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtok_rP+0x87
 f4 02                 ldsp16	r6, [sp+0x0]
 22                    sub	r4, r6
 12                    add	r4, r6
 44                    ld8u	r5, [r4]
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtok_rP
		R_AVM_FAR24	.text.strtok_rP+0xc6
<L12>:
 a5                    xor	r5, r5
 f6 05                 st8	[r4+], r5
 e2 00 00 00           jmpf	strtok_rP
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtok_rP+0xc6
 aa                    xor	r6, r6
 f4 09                 ldsp16	r5, [sp+0x2]
 74                    st16	[r5], r4
 02                    mov	r4, r6
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 aa                    xor	r6, r6
 e2 00 00 00           jmpf	strtok_rP
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtok_rP+0xc9

Disassembly of section .text.memcpy_P:

<memcpy_P>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 f4 15                 ldsp16	r5, [sp+0x5]
 d7 10                 sys	memcpy_p
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 ef                    ret

Disassembly of section .text.memcmp_P:

<memcmp_P>:
 f4 0d                 ldsp16	r5, [sp+0x3]
 d7 13                 sys	memcmp_p
 ef                    ret

Disassembly of section .text.strcmp_P:

<strcmp_P>:
 d7 14                 sys	strcmp_p
 ef                    ret

Disassembly of section .text.strlen_P:

<strlen_P>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d7 15                 sys	strlen_p
 ef                    ret

Disassembly of section .text.strncpy_P:

<strncpy_P>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 f4 15                 ldsp16	r5, [sp+0x5]
 d7 16                 sys	strncpy_p
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 ef                    ret

Disassembly of section .text.strncat_P:

<strncat_P>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 f4 15                 ldsp16	r5, [sp+0x5]
 d7 17                 sys	strncat_p
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 ef                    ret

Disassembly of section .text.strcpy_P:

<strcpy_P>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 c5 ff ff              ldi16	r5, 0xffff
 d7 16                 sys	strncpy_p
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 ef                    ret

Disassembly of section .text.strcat_P:

<strcat_P>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 c5 ff ff              ldi16	r5, 0xffff
 d7 17                 sys	strncat_p
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 ef                    ret
