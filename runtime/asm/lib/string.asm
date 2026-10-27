
string.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 string.c
00000000 l    d  .text.memchr	00000000 .text.memchr
00000000 l    d  .text.strncmp	00000000 .text.strncmp
00000000 l    d  .text.strchr	00000000 .text.strchr
00000000 l    d  .text.strrchr	00000000 .text.strrchr
00000000 l    d  .text.strstr	00000000 .text.strstr
00000000 l    d  .text.strspn	00000000 .text.strspn
00000000 l    d  .text.strcspn	00000000 .text.strcspn
00000000 l    d  .text.strpbrk	00000000 .text.strpbrk
00000000 l    d  .text.strnlen	00000000 .text.strnlen
00000000 l    d  .text.strtok_r	00000000 .text.strtok_r
00000000 l    d  .text.strtok	00000000 .text.strtok
00000000 l     O .data.strtok_next	00000002 strtok_next
00000000 l    d  .text.strtok_P	00000000 .text.strtok_P
00000000 l    d  .text.memcpy	00000000 .text.memcpy
00000000 l    d  .text.memset	00000000 .text.memset
00000000 l    d  .text.memmove	00000000 .text.memmove
00000000 l    d  .text.memcmp	00000000 .text.memcmp
00000000 l    d  .text.strcmp	00000000 .text.strcmp
00000000 l    d  .text.strlen	00000000 .text.strlen
00000000 l    d  .text.strncpy	00000000 .text.strncpy
00000000 l    d  .text.strncat	00000000 .text.strncat
00000000 l    d  .text.strcpy	00000000 .text.strcpy
00000000 l    d  .text.strcat	00000000 .text.strcat
00000000 l    d  .data.strtok_next	00000000 .data.strtok_next
00000000 g     F .text.memchr	0000002a memchr
00000000 g     F .text.strncmp	0000002e strncmp
00000000 g     F .text.strchr	00000017 strchr
00000000 g     F .text.strrchr	00000019 strrchr
00000000 g     F .text.strstr	0000004e strstr
00000000 g     F .text.strspn	0000003c strspn
00000000 g     F .text.strcspn	00000038 strcspn
00000000 g     F .text.strpbrk	00000034 strpbrk
00000000 g     F .text.strnlen	00000020 strnlen
00000000 g     F .text.strtok_r	00000098 strtok_r
00000000 g     F .text.strtok	00000099 strtok
00000000 g     F .text.strtok_P	00000010 strtok_P
00000000         *UND*	00000000 strtok_rP
00000000 g     F .text.memcpy	00000005 memcpy
00000000 g     F .text.memset	00000005 memset
00000000 g     F .text.memmove	00000005 memmove
00000000 g     F .text.memcmp	00000003 memcmp
00000000 g     F .text.strcmp	00000003 strcmp
00000000 g     F .text.strlen	00000003 strlen
00000000 g     F .text.strncpy	00000005 strncpy
00000000 g     F .text.strncat	00000005 strncat
00000000 g     F .text.strcpy	00000008 strcpy
00000000 g     F .text.strcat	00000008 strcat

Disassembly of section .text.memchr:

<memchr>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 a0                    xor	r4, r4
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	memchr
		R_AVM_FAR24	.text.memchr+0x24
<L0>:
 f1 75                 zext8	r5
 ed e0 20              ld8u	r7, [r0+0]
 3d                    cmp	r7, r5
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	memchr
		R_AVM_FAR24	.text.memchr+0x26
<L1>:
 f4 a8                 inc16	r0
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	memchr
		R_AVM_FAR24	.text.memchr+0xe
<L2>:
 b8                    pop16	r0
 ef                    ret
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 ef                    ret

Disassembly of section .text.strncmp:

<strncmp>:
 b1                    push16	r1
 b0                    push16	r0
 f2 30                 sub	r0, r0
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strncmp
		R_AVM_FAR24	.text.strncmp+0x28
<L0>:
 f7 09                 ld8u	r1, [r5+]
 f7 07                 ld8u	r7, [r4+]
 f4 b6                 dec16	r6
 f4 a7                 tst8	r7
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strncmp
		R_AVM_FAR24	.text.strncmp+0x22
<L1>:
 f5 2d                 cmp	r7, r1
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strncmp
		R_AVM_FAR24	.text.strncmp+0x4
<L2>:
 f2 5d                 sub	r7, r1
 e2 00 00 00           jmpf	strncmp
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strncmp+0x2a
 f1 2c                 mov	r7, r0
 03                    mov	r4, r7
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

Disassembly of section .text.strchr:

<strchr>:
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 4c                    ld8u	r7, [r4]
 3d                    cmp	r7, r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strchr
		R_AVM_FAR24	.text.strchr+0x16
<L0>:
 f4 ac                 inc16	r4
 f4 a7                 tst8	r7
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strchr
		R_AVM_FAR24	.text.strchr+0x3
<L1>:
 02                    mov	r4, r6
 ef                    ret

Disassembly of section .text.strrchr:

<strrchr>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 a0                    xor	r4, r4
 f1 75                 zext8	r5
 f1 2c                 mov	r7, r0
 f7 1e                 ld8u	r6, [r7+]
 39                    cmp	r6, r5
 fb 20                 cmov.eq	r4, r0
 f4 a6                 tst8	r6
 f1 07                 mov	r0, r7
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strrchr
		R_AVM_FAR24	.text.strrchr+0x8
<L0>:
 b8                    pop16	r0
 ef                    ret

Disassembly of section .text.strstr:

<strstr>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f5 35                 ld8u	r1, [r5]
 f4 a1                 tst8	r1
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strstr
		R_AVM_FAR24	.text.strstr+0x49
<L0>:
 f2 30                 sub	r0, r0
 48                    ld8u	r6, [r4]
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strstr
		R_AVM_FAR24	.text.strstr+0x47
<L1>:
 f1 1d                 mov	r3, r5
 f1 11                 mov	r2, r1
 08                    mov	r6, r4
 4e                    ld8u	r7, [r6]
 f5 2e                 cmp	r7, r2
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strstr
		R_AVM_FAR24	.text.strstr+0x3a
<L2>:
 f4 ae                 inc16	r6
 ed 46 21              ld8u	r2, [r3+1]
 f4 ab                 inc16	r3
 f4 a2                 tst8	r2
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strstr
		R_AVM_FAR24	.text.strstr+0x1e
<L3>:
 e2 00 00 00           jmpf	strstr
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strstr+0x49
 ed c8 21              ld8u	r6, [r4+1]
 f4 ac                 inc16	r4
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strstr
		R_AVM_FAR24	.text.strstr+0x19
<L4>:
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.strspn:

<strspn>:
 b1                    push16	r1
 b0                    push16	r0
 f5 31                 ld8u	r1, [r4]
 f4 a1                 tst8	r1
 f1 04                 mov	r0, r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strspn
		R_AVM_FAR24	.text.strspn+0x35
<L0>:
 f1 04                 mov	r0, r4
 09                    mov	r6, r5
 4e                    ld8u	r7, [r6]
 f5 2d                 cmp	r7, r1
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strspn
		R_AVM_FAR24	.text.strspn+0x28
<L1>:
 f4 ae                 inc16	r6
 f4 a7                 tst8	r7
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strspn
		R_AVM_FAR24	.text.strspn+0x11
<L2>:
 e2 00 00 00           jmpf	strspn
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strspn+0x35
 ed 20 21              ld8u	r1, [r0+1]
 f4 a8                 inc16	r0
 f4 a1                 tst8	r1
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strspn
		R_AVM_FAR24	.text.strspn+0x10
<L3>:
 f2 34                 sub	r0, r4
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

Disassembly of section .text.strcspn:

<strcspn>:
 b1                    push16	r1
 b0                    push16	r0
 f5 31                 ld8u	r1, [r4]
 f4 a1                 tst8	r1
 f1 04                 mov	r0, r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strcspn
		R_AVM_FAR24	.text.strcspn+0x31
<L0>:
 f1 04                 mov	r0, r4
 09                    mov	r6, r5
 4e                    ld8u	r7, [r6]
 f5 2d                 cmp	r7, r1
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strcspn
		R_AVM_FAR24	.text.strcspn+0x31
<L1>:
 f4 ae                 inc16	r6
 f4 a7                 tst8	r7
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strcspn
		R_AVM_FAR24	.text.strcspn+0x11
<L2>:
 ed 20 21              ld8u	r1, [r0+1]
 f4 a8                 inc16	r0
 f4 a1                 tst8	r1
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strcspn
		R_AVM_FAR24	.text.strcspn+0x10
<L3>:
 f2 34                 sub	r0, r4
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

Disassembly of section .text.strpbrk:

<strpbrk>:
 b0                    push16	r0
 f5 30                 ld8u	r0, [r4]
 f4 a0                 tst8	r0
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strpbrk
		R_AVM_FAR24	.text.strpbrk+0x2c
<L0>:
 0d                    mov	r7, r5
 4b                    ld8u	r6, [r7]
 f5 28                 cmp	r6, r0
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strpbrk
		R_AVM_FAR24	.text.strpbrk+0x2c
<L1>:
 f4 af                 inc16	r7
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strpbrk
		R_AVM_FAR24	.text.strpbrk+0xc
<L2>:
 ed 08 21              ld8u	r0, [r4+1]
 f4 ac                 inc16	r4
 f4 a0                 tst8	r0
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strpbrk
		R_AVM_FAR24	.text.strpbrk+0xb
<L3>:
 44                    ld8u	r5, [r4]
 aa                    xor	r6, r6
 f4 a5                 tst8	r5
 fb 26                 cmov.eq	r4, r6
 b8                    pop16	r0
 ef                    ret

Disassembly of section .text.strnlen:

<strnlen>:
 08                    mov	r6, r4
 a0                    xor	r4, r4
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strnlen
		R_AVM_FAR24	.text.strnlen+0x1f
<L0>:
 4e                    ld8u	r7, [r6]
 f4 a7                 tst8	r7
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strnlen
		R_AVM_FAR24	.text.strnlen+0x1f
<L1>:
 f4 ae                 inc16	r6
 f4 ac                 inc16	r4
 34                    cmp	r5, r4
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strnlen
		R_AVM_FAR24	.text.strnlen+0xa
<L2>:
 01                    mov	r4, r5
 ef                    ret

Disassembly of section .text.strtok_r:

<strtok_r>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtok_r
		R_AVM_FAR24	.text.strtok_r+0x14
<L0>:
 62                    ld16	r4, [r6]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtok_r
		R_AVM_FAR24	.text.strtok_r+0x93
<L1>:
 f5 30                 ld8u	r0, [r4]
 f4 a0                 tst8	r0
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtok_r
		R_AVM_FAR24	.text.strtok_r+0x44
<L2>:
 0d                    mov	r7, r5
 f5 3d                 ld8u	r1, [r7]
 f5 08                 cmp	r1, r0
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtok_r
		R_AVM_FAR24	.text.strtok_r+0x37
<L3>:
 f4 af                 inc16	r7
 f4 a1                 tst8	r1
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtok_r
		R_AVM_FAR24	.text.strtok_r+0x1f
<L4>:
 e2 00 00 00           jmpf	strtok_r
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtok_r+0x44
 ed 08 21              ld8u	r0, [r4+1]
 f4 ac                 inc16	r4
 f4 a0                 tst8	r0
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtok_r
		R_AVM_FAR24	.text.strtok_r+0x1e
<L5>:
 f5 31                 ld8u	r1, [r4]
 f4 a1                 tst8	r1
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtok_r
		R_AVM_FAR24	.text.strtok_r+0x89
<L6>:
 f1 04                 mov	r0, r4
 0d                    mov	r7, r5
 f5 3e                 ld8u	r2, [r7]
 f5 11                 cmp	r2, r1
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtok_r
		R_AVM_FAR24	.text.strtok_r+0x72
<L7>:
 f4 af                 inc16	r7
 f4 a2                 tst8	r2
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtok_r
		R_AVM_FAR24	.text.strtok_r+0x51
<L8>:
 ed 20 21              ld8u	r1, [r0+1]
 f4 a8                 inc16	r0
 f4 a1                 tst8	r1
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtok_r
		R_AVM_FAR24	.text.strtok_r+0x50
<L9>:
 f2 34                 sub	r0, r4
 f2 04                 add	r0, r4
 ed a0 20              ld8u	r5, [r0+0]
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtok_r
		R_AVM_FAR24	.text.strtok_r+0x8d
<L10>:
 a5                    xor	r5, r5
 f0 6d a1              st8	[r0+], r5
 e2 00 00 00           jmpf	strtok_r
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtok_r+0x8d
 a5                    xor	r5, r5
 f1 04                 mov	r0, r4
 01                    mov	r4, r5
 f5 58                 st16	[r6], r0
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	strtok_r
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtok_r+0x8f

Disassembly of section .text.strtok:

<strtok>:
 b1                    push16	r1
 b0                    push16	r0
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtok
		R_AVM_FAR24	.text.strtok+0x16
<L0>:
 f0 54 00 00           ldm16	r4, [0x0]
		R_AVM_DATA16	.data.strtok_next
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtok
		R_AVM_FAR24	.text.strtok+0x94
<L1>:
 f5 30                 ld8u	r0, [r4]
 f4 a0                 tst8	r0
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtok
		R_AVM_FAR24	.text.strtok+0x45
<L2>:
 0d                    mov	r7, r5
 4b                    ld8u	r6, [r7]
 f5 28                 cmp	r6, r0
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtok
		R_AVM_FAR24	.text.strtok+0x38
<L3>:
 f4 af                 inc16	r7
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtok
		R_AVM_FAR24	.text.strtok+0x21
<L4>:
 e2 00 00 00           jmpf	strtok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtok+0x45
 ed 08 21              ld8u	r0, [r4+1]
 f4 ac                 inc16	r4
 f4 a0                 tst8	r0
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtok
		R_AVM_FAR24	.text.strtok+0x20
<L5>:
 f5 31                 ld8u	r1, [r4]
 f4 a1                 tst8	r1
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtok
		R_AVM_FAR24	.text.strtok+0x89
<L6>:
 f1 04                 mov	r0, r4
 09                    mov	r6, r5
 4e                    ld8u	r7, [r6]
 f5 2d                 cmp	r7, r1
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtok
		R_AVM_FAR24	.text.strtok+0x72
<L7>:
 f4 ae                 inc16	r6
 f4 a7                 tst8	r7
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtok
		R_AVM_FAR24	.text.strtok+0x52
<L8>:
 ed 20 21              ld8u	r1, [r0+1]
 f4 a8                 inc16	r0
 f4 a1                 tst8	r1
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtok
		R_AVM_FAR24	.text.strtok+0x51
<L9>:
 f2 34                 sub	r0, r4
 f2 04                 add	r0, r4
 ed a0 20              ld8u	r5, [r0+0]
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	strtok
		R_AVM_FAR24	.text.strtok+0x8d
<L10>:
 a5                    xor	r5, r5
 f0 6d a1              st8	[r0+], r5
 e2 00 00 00           jmpf	strtok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtok+0x8d
 a5                    xor	r5, r5
 f1 04                 mov	r0, r4
 01                    mov	r4, r5
 f0 58 00 00           stm16	[0x0], r0
		R_AVM_DATA16	.data.strtok_next
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	strtok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.strtok+0x91

Disassembly of section .text.strtok_P:

<strtok_P>:
 d6 fe                 adjsp	-0x2
 c5 00 00              ldi16	r5, 0x0
		R_AVM_DATA16	.data.strtok_next
 f4 41                 stsp16	[sp+0x0], r5
 f1 77                 zext8	r7
 e3 00 00 00           callf	strtok_P
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	strtok_rP
 d6 02                 adjsp	0x2
 ef                    ret

Disassembly of section .text.memcpy:

<memcpy>:
 0c                    mov	r7, r4
 d7 0f                 sys	memcpy
 03                    mov	r4, r7
 ef                    ret

Disassembly of section .text.memset:

<memset>:
 0c                    mov	r7, r4
 d7 11                 sys	memset
 03                    mov	r4, r7
 ef                    ret

Disassembly of section .text.memmove:

<memmove>:
 0c                    mov	r7, r4
 d7 12                 sys	memmove
 03                    mov	r4, r7
 ef                    ret

Disassembly of section .text.memcmp:

<memcmp>:
 d7 18                 sys	memcmp
 ef                    ret

Disassembly of section .text.strcmp:

<strcmp>:
 d7 19                 sys	strcmp
 ef                    ret

Disassembly of section .text.strlen:

<strlen>:
 d7 1a                 sys	strlen
 ef                    ret

Disassembly of section .text.strncpy:

<strncpy>:
 0c                    mov	r7, r4
 d7 1b                 sys	strncpy
 03                    mov	r4, r7
 ef                    ret

Disassembly of section .text.strncat:

<strncat>:
 0c                    mov	r7, r4
 d7 1c                 sys	strncat
 03                    mov	r4, r7
 ef                    ret

Disassembly of section .text.strcpy:

<strcpy>:
 0c                    mov	r7, r4
 c6 ff ff              ldi16	r6, 0xffff
 d7 1b                 sys	strncpy
 03                    mov	r4, r7
 ef                    ret

Disassembly of section .text.strcat:

<strcat>:
 0c                    mov	r7, r4
 c6 ff ff              ldi16	r6, 0xffff
 d7 1c                 sys	strncat
 03                    mov	r4, r7
 ef                    ret
