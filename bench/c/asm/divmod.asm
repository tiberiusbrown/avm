
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/divmod.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 divmod.c
00000100 l     O .data	00000020 unsigned_numerators
00000120 l     O .data	00000020 unsigned_denominators
00000140 l     O .data	00000020 signed_numerators
00000160 l     O .data	00000020 signed_denominators
00000180 l     O .data	00000010 wide_numerators
00000190 l     O .data	00000010 wide_denominators
000001a0 l     O .data	00000004 divmod_result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 integer.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	0000014c avm_test_main
00000362 g     F .text	00000002 avm_halt
000003be g     F .text	000000ea __avm_mulsi3
0000053a g     F .text	00000014 __avm_udivsi3
00000364 g     F .text	0000002d __avm_ashlsi3
00000391 g     F .text	0000002d __avm_lshrsi3
000004a8 g     F .text	00000092 __avm_udivmodsi4

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
 e1 4c 01              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	_start+16
 a0                    xor	r4, r4
 c5 50 fb              ldi16	r5, 0xfb50
 f0 06 e8 03           ldi16	r2, 0x3e8
 c6 00 01              ldi16	r6, 0x100
 f4 62                 stsp16	[sp+0x8], r6
 c7 20 01              ldi16	r7, 0x120
 f0 04 40 01           ldi16	r0, 0x140
 f0 05 60 01           ldi16	r1, 0x160
 c2 03                 ldi8	r6, 0x3
 f4 53                 stsp16	[sp+0x4], r7
 f1 1a                 mov	r3, r2
 f0 06 f8 ff           ldi16	r2, 0xfff8
 cc 0b                 cmpi.s8	r4, 0xb
 fc 16                 cmov.ult	r2, r6
 f2 14                 add	r2, r4
 f4 23                 ldsp16	r7, [sp+0x8]
 f7 5b                 st16	[r7+], r3
 f4 63                 stsp16	[sp+0x8], r7
 f4 13                 ldsp16	r7, [sp+0x4]
 f7 5a                 st16	[r7+], r2
 f0 06 fa ff           ldi16	r2, 0xfffa
 cc 09                 cmpi.s8	r4, 0x9
 fc 16                 cmov.ult	r2, r6
 f2 14                 add	r2, r4
 f0 6d b1              st16	[r0+], r5
 f0 6d 53              st16	[r1+], r2
 f0 02 89              ldi8	r2, 0x89
 f2 13                 add	r2, r3
 c9 71                 addi.s8	r5, 0x71
 f4 ac                 inc16	r4
 cc 10                 cmpi.s8	r4, 0x10
 d1 cb                 brne8	avm_test_main+32
 f0 02 00              ldi8	r2, 0x0
 f0 07 80 01           ldi16	r3, 0x180
 f0 04 90 01           ldi16	r0, 0x190
 f1 22                 mov	r4, r2
 a5                    xor	r5, r5
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 c6 03 02              ldi16	r6, 0x203
 c3 01                 ldi8	r7, 0x1
 e1 39 01              call16	__avm_mulsi3
 c6 78 56              ldi16	r6, 0x5678
 c7 34 12              ldi16	r7, 0x1234
 f7 6e                 add32	q3, q2
 f0 6b c6              st32	[r3], q3
 c2 12                 ldi8	r6, 0x12
 af                    xor	r7, r7
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 e1 24 01              call16	__avm_mulsi3
 c6 01 01              ldi16	r6, 0x101
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f0 6b c0              st32	[r0], q3
 f0 08 04              addi.s8	r0, 0x4
 f0 0b 04              addi.s8	r3, 0x4
 f4 aa                 inc16	r2
 f0 0e 04              cmpi.s8	r2, 0x4
 d1 c6                 brne8	avm_test_main+96
 a0                    xor	r4, r4
 f0 02 00              ldi8	r2, 0x0
 f0 03 00              ldi8	r3, 0x0
 d7 01                 sys	debug_break
 f4 40                 stsp16	[sp+0x0], r4
 04                    mov	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 c5 00 01              ldi16	r5, 0x100
 14                    add	r5, r4
 65                    ld16	r5, [r5]
 c6 20 01              ldi16	r6, 0x120
 18                    add	r6, r4
 6a                    ld16	r6, [r6]
 0d                    mov	r7, r5
 ec 3e                 udiv16	r7, r6
 f1 07                 mov	r0, r7
 f0 01 00              ldi8	r1, 0x0
 f7 61                 add32	q0, q1
 fe 3e                 mul16	r7, r6
 27                    sub	r5, r7
 09                    mov	r6, r5
 af                    xor	r7, r7
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 c5 40 01              ldi16	r5, 0x140
 14                    add	r5, r4
 65                    ld16	r5, [r5]
 f0 04 60 01           ldi16	r0, 0x160
 f2 04                 add	r0, r4
 f0 6c 50              ld16	r2, [r0]
 f1 1d                 mov	r3, r5
 ec 9a                 sdiv16	r3, r2
 f1 03                 mov	r0, r3
 f0 01 00              ldi8	r1, 0x0
 f7 63                 add32	q0, q3
 fe 1a                 mul16	r3, r2
 f2 57                 sub	r5, r3
 f1 15                 mov	r2, r5
 f0 03 00              ldi8	r3, 0x0
 f9 42                 xor	r2, r0
 f9 66                 xor	r3, r1
 c8 02                 addi.s8	r4, 0x2
 cc 20                 cmpi.s8	r4, 0x20
 d1 b7                 brne8	avm_test_main+170
 f0 00 00              ldi8	r0, 0x0
 c4 80 01              ldi16	r4, 0x180
 f2 20                 add	r4, r0
 f0 6a 88              ld32	q2, [r4]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c6 90 01              ldi16	r6, 0x190
 f2 28                 add	r6, r0
 f0 6a cc              ld32	q3, [r6]
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 e1 0f 02              call16	__avm_udivsi3
 f7 66                 add32	q1, q2
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 e1 8a 00              call16	__avm_mulsi3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f7 7e                 sub32	q3, q2
 f9 5a                 xor	r2, r6
 f9 7e                 xor	r3, r7
 f0 08 04              addi.s8	r0, 0x4
 f0 0c 10              cmpi.s8	r0, 0x10
 d1 c6                 brne8	avm_test_main+246
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 04                 cmpi.s8	r4, 0x4
 db 6a ff              brne16	avm_test_main+166
 c4 a0 01              ldi16	r4, 0x1a0
 f0 6b 48              st32	[r4], q1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0c                 adjsp	__avm_ashlsi3+5
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
 d6 16                 adjsp	__avm_udivmodsi4+17
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_udivmodsi4>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	__avm_mulsi3+224
 f2 63                 mov32	q0, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 34 1b              ldsp16	r4, [sp+0x1b]
 f4 40                 stsp16	[sp+0x0], r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d0 64                 breq8	__avm_udivmodsi4+130
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 f0 00 00              ldi8	r0, 0x0
 f0 01 00              ldi8	r1, 0x0
 c0 20                 ldi8	r4, 0x20
 f4 68                 stsp16	[sp+0xa], r4
 f2 64                 mov32	q1, q0
 c0 1f                 ldi8	r4, 0x1f
 a5                    xor	r5, r5
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 02                    mov	r4, r6
 07                    mov	r5, r7
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 e1 a5 fe              call16	__avm_lshrsi3
 f7 60                 add32	q0, q0
 f9 11                 or	r0, r4
 f9 35                 or	r1, r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 69 08              cmp32	q0, q2
 fc 74                 cmov.uge	r6, r4
 fc 7d                 cmov.uge	r7, r5
 f2 68                 mov32	q2, q0
 f7 7b                 sub32	q2, q3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 69 0c              cmp32	q0, q3
 f8 1e                 cset.uge	r6
 f7 65                 add32	q1, q1
 0a                    mov	r6, r6
 af                    xor	r7, r7
 f9 59                 or	r2, r6
 f9 7d                 or	r3, r7
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f7 6f                 add32	q3, q3
 f0 30 0a              ldsp16	r0, [sp+0xa]
 f4 b0                 dec16	r0
 f0 38 0a              stsp16	[sp+0xa], r0
 f6 28                 tst16	r0
 f2 62                 mov32	q0, q2
 d0 04                 breq8	__avm_udivmodsi4+132
 d4 ae                 jmp8	__avm_udivmodsi4+48
 02                    mov	r4, r6
 07                    mov	r5, r7
 f4 02                 ldsp16	r6, [sp+0x0]
 f0 6b 8c              st32	[r6], q2
 f2 69                 mov32	q2, q1
 d6 10                 adjsp	__avm_udivsi3+11
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_udivsi3>:
 b0                    push16	r0
 d6 fc                 adjsp	__avm_udivmodsi4+145
 d6 fe                 adjsp	__avm_udivsi3+3
 f0 10 02              leasp	r0, 0x2
 f0 38 00              stsp16	[sp+0x0], r0
 e1 60 ff              call16	__avm_udivmodsi4
 d6 02                 adjsp	__avm_udivsi3+18
 d6 04                 adjsp	__avm_udivsi3+22
 b8                    pop16	r0
 ef                    ret
