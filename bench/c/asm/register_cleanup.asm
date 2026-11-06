
register_cleanup.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d7 01                 sys	debug_break
 c4 01 01              ldi16	r4, 0x101
 e1 88 00              call16	run
 f2 66                 mov32	q1, q2
 c4 20 01              ldi16	r4, 0x120
 e1 80 00              call16	run
 f2 62                 mov32	q0, q2
 f9 0a                 xor	r0, r2
 f9 2e                 xor	r1, r3
 c4 3f 01              ldi16	r4, 0x13f
 d5 75                 call8	run
 f2 66                 mov32	q1, q2
 f9 42                 xor	r2, r0
 f9 66                 xor	r3, r1
 c4 5e 01              ldi16	r4, 0x15e
 d5 6a                 call8	run
 f2 62                 mov32	q0, q2
 f9 0a                 xor	r0, r2
 f9 2e                 xor	r1, r3
 c4 7d 01              ldi16	r4, 0x17d
 d5 5f                 call8	run
 f2 66                 mov32	q1, q2
 f9 42                 xor	r2, r0
 f9 66                 xor	r3, r1
 c4 9c 01              ldi16	r4, 0x19c
 d5 54                 call8	run
 f2 62                 mov32	q0, q2
 f9 0a                 xor	r0, r2
 f9 2e                 xor	r1, r3
 c4 bb 01              ldi16	r4, 0x1bb
 d5 49                 call8	run
 f2 66                 mov32	q1, q2
 f9 42                 xor	r2, r0
 f9 66                 xor	r3, r1
 c4 da 01              ldi16	r4, 0x1da
 d5 3e                 call8	run
 f2 62                 mov32	q0, q2
 f9 0a                 xor	r0, r2
 f9 2e                 xor	r1, r3
 c4 f9 01              ldi16	r4, 0x1f9
 d5 33                 call8	run
 f2 66                 mov32	q1, q2
 f9 42                 xor	r2, r0
 f9 66                 xor	r3, r1
 c4 18 02              ldi16	r4, 0x218
 d5 28                 call8	run
 f2 62                 mov32	q0, q2
 f9 0a                 xor	r0, r2
 f9 2e                 xor	r1, r3
 c4 37 02              ldi16	r4, 0x237
 d5 1d                 call8	run
 f2 66                 mov32	q1, q2
 f9 42                 xor	r2, r0
 f9 66                 xor	r3, r1
 c4 56 02              ldi16	r4, 0x256
 d5 12                 call8	run
 f9 8a                 xor	r4, r2
 f9 ae                 xor	r5, r3
 c6 00 01              ldi16	r6, 0x100
 f0 6b 8c              st32	[r6], q2
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<run>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f1 04                 mov	r0, r4
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 c0 30                 ldi8	r4, 0x30
 f1 08                 mov	r1, r0
 f0 09 17              addi.s8	r1, 0x17
<L0>:
 f4 48                 stsp16	[sp+0x2], r4
 f0 14 04              leasp	r4, 0x4
 f4 40                 stsp16	[sp+0x0], r4
 f1 25                 mov	r5, r1
 d5 33                 call8	step
 f2 04                 add	r0, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 24                 mov	r5, r0
 d5 2b                 call8	step
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 f7 67                 add32	q1, q3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f7 6d                 add32	q3, q1
 f9 32                 xor	r1, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f1 11                 mov	r2, r1
 f2 4b                 sub	r3, r3
 f7 67                 add32	q1, q3
 f4 b4                 dec16	r4
 f4 a4                 tst8	r4
 d1 d2                 brne8	-0x2e <L0>
 f4 10                 ldsp16	r4, [sp+0x4]
 a5                    xor	r5, r5
 f7 66                 add32	q1, q2
 f4 18                 ldsp16	r4, [sp+0x6]
 f7 69                 add32	q2, q1
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<step>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f1 14                 mov	r2, r4
 c2 07                 ldi8	r6, 0x7
 89                    and	r6, r5
 01                    mov	r4, r5
 c3 0f                 ldi8	r7, 0xf
 ae                    xor	r7, r6
 f4 8d                 lsr16.1	r5
 fa 17                 lsr16v	r5, r7
 0c                    mov	r7, r4
 fa 0e                 shl16v	r7, r6
 0b                    mov	r6, r7
 0d                    mov	r7, r5
 f1 26                 mov	r5, r2
 c9 04                 addi.s8	r5, 0x4
 f0 6a 0a              ld32	q0, [r5]
 f9 1a                 xor	r0, r6
 f9 3e                 xor	r1, r7
 f0 6b 0a              st32	[r5], q0
 ed d4 20              ld16	r6, [r2+0]
 18                    add	r6, r4
 ed b4 22              ld16	r5, [r2+2]
 19                    add	r6, r5
 c9 07                 addi.s8	r5, 0x7
 f1 75                 zext8	r5
 ee b4 22              st16	[r2+2], r5
 ee d4 20              st16	[r2+0], r6
 a6                    xor	r5, r6
 01                    mov	r4, r5
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
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
