
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/mixed_width.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 mixed_width.c
00000140 l     O .data	00000040 signed_words
00000180 l     O .data	00000080 wide_values
00000100 l     O .data	00000020 signed_bytes
00000120 l     O .data	00000020 unsigned_bytes
00000200 l     O .data	00000004 mixed_width_result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 integer.c
00000300 g     F .text	00000016 _start
00000316 g     F .text	00000116 avm_test_main
0000042c g     F .text	00000002 avm_halt
00000488 g     F .text	000000ea __avm_mulsi3
0000042e g     F .text	0000002d __avm_ashlsi3
0000045b g     F .text	0000002d __avm_lshrsi3

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 04                    mov	r5, r4
 c0 46                 ldi8	r4, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2d                 tst16	r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 16 01              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ec                 adjsp	_start+8
 a0                    xor	r4, r4
 f0 00 f0              ldi8	r0, 0xf0
 c5 60 f0              ldi16	r5, 0xf060
 c6 40 01              ldi16	r6, 0x140
 f0 05 80 01           ldi16	r1, 0x180
 c3 fb                 ldi8	r7, 0xfb
 f4 5b                 stsp16	[sp+0x6], r7
 f1 14                 mov	r2, r4
 f0 38 0a              stsp16	[sp+0xa], r0
 f0 07 00 01           ldi16	r3, 0x100
 f2 1c                 add	r3, r4
 f0 6d 06              st8	[r3], r0
 f0 07 20 01           ldi16	r3, 0x120
 f2 1c                 add	r3, r4
 f0 6d 46              st8	[r3], r2
 f7 55                 st16	[r7+], r5
 f4 72                 stsp16	[sp+0xc], r6
 f4 1b                 ldsp16	r7, [sp+0x6]
 17                    add	r5, r7
 f1 19                 mov	r3, r1
 f1 04                 mov	r0, r4
 f0 01 00              ldi8	r1, 0x0
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 c6 ec ff              ldi16	r6, 0xffec
 c7 ff ff              ldi16	r7, 0xffff
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f7 6c                 add32	q3, q0
 f1 0b                 mov	r1, r3
 f0 30 0a              ldsp16	r0, [sp+0xa]
 f0 6b c2              st32	[r1], q3
 f4 32                 ldsp16	r6, [sp+0xc]
 f0 09 04              addi.s8	r1, 0x4
 f4 a8                 inc16	r0
 f0 0a 05              addi.s8	r2, 0x5
 f4 ac                 inc16	r4
 cc 20                 cmpi.s8	r4, 0x20
 d1 b1                 brne8	avm_test_main+26
 a0                    xor	r4, r4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 d7 01                 sys	debug_break
 f4 40                 stsp16	[sp+0x0], r4
 04                    mov	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 05 40 01           ldi16	r1, 0x140
 f0 06 80 01           ldi16	r2, 0x180
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 3a 04              stsp16	[sp+0x4], r2
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 c4 00 01              ldi16	r4, 0x100
 f2 20                 add	r4, r0
 40                    ld8u	r4, [r4]
 c5 20 01              ldi16	r5, 0x120
 f2 24                 add	r5, r0
 45                    ld8u	r5, [r5]
 f0 3d 10              stsp16	[sp+0x10], r5
 f6 44                 sext8	r4
 00                    nop
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 c6 01 01              ldi16	r6, 0x101
 af                    xor	r7, r7
 e1 d1 00              call16	__avm_mulsi3
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 6c 92              ld16	r4, [r1]
 f4 68                 stsp16	[sp+0xa], r4
 f0 6c 53              ld16	r2, [r1+]
 f0 35 10              ldsp16	r5, [sp+0x10]
 09                    mov	r6, r5
 af                    xor	r7, r7
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f7 6e                 add32	q3, q2
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f7 6e                 add32	q3, q2
 f1 22                 mov	r4, r2
 a5                    xor	r5, r5
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f4 28                 ldsp16	r4, [sp+0xa]
 00                    nop
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 f7 69                 add32	q2, q1
 f0 32 04              ldsp16	r2, [sp+0x4]
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 f0 6a c4              ld32	q3, [r2]
 f6 46                 sext8	r6
 0a                    mov	r6, r6
 0e                    mov	r7, r6
 fa ef                 asr16i	r7, 0xf
 f7 6e                 add32	q3, q2
 f0 6a 84              ld32	q2, [r2]
 00                    nop
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 f7 6b                 add32	q2, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 0a 04              addi.s8	r2, 0x4
 f4 a8                 inc16	r0
 f0 0c 20              cmpi.s8	r0, 0x20
 d1 84                 brne8	avm_test_main+126
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 10                 cmpi.s8	r4, 0x10
 db 6b ff              brne16	avm_test_main+113
 c4 00 02              ldi16	r4, 0x200
 f0 6b c8              st32	[r4], q3
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 14                 adjsp	__avm_ashlsi3+13
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<__avm_ashlsi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 02 1f              ldi8	r2, 0x1f
 f0 03 00              ldi8	r3, 0x0
 f0 69 4c              cmp32	q1, q3
 d2 15                 brult8	__avm_ashlsi3+40
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d0 0c                 breq8	__avm_ashlsi3+38
 f2 68                 mov32	q2, q0
 f7 6a                 add32	q2, q2
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d0 04                 breq8	__avm_ashlsi3+40
 d4 f6                 jmp8	__avm_ashlsi3+28
 f2 68                 mov32	q2, q0
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_lshrsi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 02 1f              ldi8	r2, 0x1f
 f0 03 00              ldi8	r3, 0x0
 f0 69 4c              cmp32	q1, q3
 d2 15                 brult8	__avm_lshrsi3+40
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d0 0c                 breq8	__avm_lshrsi3+38
 f2 68                 mov32	q2, q0
 f7 82                 lsr32.1	q2
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d0 04                 breq8	__avm_lshrsi3+40
 d4 f6                 jmp8	__avm_lshrsi3+28
 f2 68                 mov32	q2, q0
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_mulsi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ea                 adjsp	__avm_lshrsi3+29
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 00 10              ldi8	r0, 0x10
 f0 01 00              ldi8	r1, 0x0
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f2 6a                 mov32	q3, q0
 d5 b2                 call8	__avm_lshrsi3
 f2 66                 mov32	q1, q2
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f2 6a                 mov32	q3, q0
 d5 a7                 call8	__avm_lshrsi3
 f2 62                 mov32	q0, q2
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 fa 7f                 lsr16i	r4, 0xf
 f2 22                 add	r4, r2
 0c                    mov	r7, r4
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 08                    mov	r6, r4
 fa 9f                 lsr16i	r6, 0xf
 f2 28                 add	r6, r0
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 fe 34                 mul16	r6, r4
 f4 4a                 stsp16	[sp+0x2], r6
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 fe 3c                 mul16	r7, r4
 f4 43                 stsp16	[sp+0x0], r7
 08                    mov	r6, r4
 0d                    mov	r7, r5
 fa 78                 lsr16i	r4, 0x8
 f4 60                 stsp16	[sp+0x8], r4
 f1 76                 zext8	r6
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f1 74                 zext8	r4
 04                    mov	r5, r4
 f3 16                 mulu8.w	r5, r6
 f4 71                 stsp16	[sp+0xc], r5
 f4 21                 ldsp16	r5, [sp+0x8]
 f3 34                 mulsu8.w	r5, r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 fa 78                 lsr16i	r4, 0x8
 0c                    mov	r7, r4
 f4 22                 ldsp16	r6, [sp+0x8]
 f3 2e                 muls8.w	r7, r6
 f4 63                 stsp16	[sp+0x8], r7
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 f3 32                 mulsu8.w	r4, r6
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 08                    mov	r6, r4
 fa d8                 asr16i	r6, 0x8
 f4 20                 ldsp16	r4, [sp+0x8]
 18                    add	r6, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 fa b8                 asr16i	r4, 0x8
 12                    add	r4, r6
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 0e                    mov	r7, r6
 fa 68                 lsl16i	r7, 0x8
 0b                    mov	r6, r7
 f4 31                 ldsp16	r5, [sp+0xc]
 19                    add	r6, r5
 f4 7a                 stsp16	[sp+0xe], r6
 3b                    cmp	r6, r7
 f8 17                 cset.ult	r7
 1c                    add	r7, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 1c                    add	r7, r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f4 2a                 ldsp16	r6, [sp+0xa]
 12                    add	r4, r6
 fa 38                 lsl16i	r4, 0x8
 f4 32                 ldsp16	r6, [sp+0xc]
 12                    add	r4, r6
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f4 3a                 ldsp16	r6, [sp+0xe]
 32                    cmp	r4, r6
 f8 14                 cset.ult	r4
 13                    add	r4, r7
 00                    nop
 a5                    xor	r5, r5
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 e1 cd fe              call16	__avm_ashlsi3
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 0a                    mov	r6, r6
 af                    xor	r7, r7
 92                    or	r4, r6
 97                    or	r5, r7
 d6 16                 adjsp	__avm_mulsi3+251
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
