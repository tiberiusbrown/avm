
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/divmod.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 divmod.c
00000160 l     O .data	00000020 signed_denominators
00000140 l     O .data	00000020 signed_numerators
00000120 l     O .data	00000020 unsigned_denominators
00000100 l     O .data	00000020 unsigned_numerators
00000180 l     O .data	00000010 wide_numerators
00000190 l     O .data	00000010 wide_denominators
000001a0 l     O .data	00000004 divmod_result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 integer.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	0000017e avm_test_main
00000394 g     F .text	00000002 avm_halt
000004ca g     F .text	00000014 __avm_udivsi3
00000396 g     F .text	000000ad __avm_mulsi3
00000443 g     F .text	00000087 __avm_udivmodsi4

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 fb 2e                 cmov.eq	r5, r6
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 7e 01              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	_start+12
 a5                    xor	r5, r5
 c6 60 01              ldi16	r6, 0x160
 c4 40 01              ldi16	r4, 0x140
 f4 70                 stsp16	[sp+0xc], r4
 c4 20 01              ldi16	r4, 0x120
 f4 68                 stsp16	[sp+0xa], r4
 f0 04 00 01           ldi16	r0, 0x100
 f0 07 e8 03           ldi16	r3, 0x3e8
 f0 05 50 fb           ldi16	r1, 0xfb50
 f1 15                 mov	r2, r5
 f4 62                 stsp16	[sp+0x8], r6
 f1 2f                 mov	r7, r3
 01                    mov	r4, r5
 f1 74                 zext8	r4
 f0 07 fa ff           ldi16	r3, 0xfffa
 c2 03                 ldi8	r6, 0x3
 cc 09                 cmpi.s8	r4, 0x9
 fc 1e                 cmov.ult	r3, r6
 c6 f8 ff              ldi16	r6, 0xfff8
 cc 0b                 cmpi.s8	r4, 0xb
 c0 03                 ldi8	r4, 0x3
 fc 34                 cmov.ult	r6, r4
 f2 2a                 add	r6, r2
 f0 6d f1              st16	[r0+], r7
 f4 28                 ldsp16	r4, [sp+0xa]
 f7 46                 st16	[r4+], r6
 f4 68                 stsp16	[sp+0xa], r4
 f4 22                 ldsp16	r6, [sp+0x8]
 f2 1a                 add	r3, r2
 f4 30                 ldsp16	r4, [sp+0xc]
 f7 41                 st16	[r4+], r1
 f4 70                 stsp16	[sp+0xc], r4
 f7 53                 st16	[r6+], r3
 f0 03 89              ldi8	r3, 0x89
 f2 1f                 add	r3, r7
 f0 09 71              addi.s8	r1, 0x71
 f4 aa                 inc16	r2
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 10                 cmpi.s8	r4, 0x10
 d1 bc                 brne8	avm_test_main+34
 c4 78 56              ldi16	r4, 0x5678
 c5 34 12              ldi16	r5, 0x1234
 c6 80 01              ldi16	r6, 0x180
 f0 6b 8c              st32	[r6], q2
 c4 01 01              ldi16	r4, 0x101
 a5                    xor	r5, r5
 c6 90 01              ldi16	r6, 0x190
 f0 6b 8c              st32	[r6], q2
 c4 7b 58              ldi16	r4, 0x587b
 c5 35 12              ldi16	r5, 0x1235
 c6 84 01              ldi16	r6, 0x184
 f0 6b 8c              st32	[r6], q2
 c4 13 01              ldi16	r4, 0x113
 a5                    xor	r5, r5
 c6 94 01              ldi16	r6, 0x194
 f0 6b 8c              st32	[r6], q2
 c4 7e 5a              ldi16	r4, 0x5a7e
 c5 36 12              ldi16	r5, 0x1236
 c6 88 01              ldi16	r6, 0x188
 f0 6b 8c              st32	[r6], q2
 c4 25 01              ldi16	r4, 0x125
 a5                    xor	r5, r5
 c6 98 01              ldi16	r6, 0x198
 f0 6b 8c              st32	[r6], q2
 c4 81 5c              ldi16	r4, 0x5c81
 c5 37 12              ldi16	r5, 0x1237
 c6 8c 01              ldi16	r6, 0x18c
 f0 6b 8c              st32	[r6], q2
 c4 37 01              ldi16	r4, 0x137
 a5                    xor	r5, r5
 c6 9c 01              ldi16	r6, 0x19c
 f0 6b 8c              st32	[r6], q2
 a5                    xor	r5, r5
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 d7 01                 sys	debug_break
 f4 41                 stsp16	[sp+0x0], r5
 c4 60 01              ldi16	r4, 0x160
 c6 40 01              ldi16	r6, 0x140
 c7 20 01              ldi16	r7, 0x120
 f0 05 00 01           ldi16	r1, 0x100
 c1 10                 ldi8	r5, 0x10
 f4 49                 stsp16	[sp+0x2], r5
 f0 6c b3              ld16	r5, [r1+]
 f0 39 06              stsp16	[sp+0x6], r1
 f7 38                 ld16	r0, [r7+]
 f4 63                 stsp16	[sp+0x8], r7
 f7 31                 ld16	r1, [r6+]
 f4 6a                 stsp16	[sp+0xa], r6
 f7 26                 ld16	r6, [r4+]
 f4 52                 stsp16	[sp+0x4], r6
 f4 70                 stsp16	[sp+0xc], r4
 01                    mov	r4, r5
 ec 20                 udiv16	r4, r0
 08                    mov	r6, r4
 af                    xor	r7, r7
 f7 6d                 add32	q3, q1
 fe 20                 mul16	r4, r0
 24                    sub	r5, r4
 01                    mov	r4, r5
 a5                    xor	r5, r5
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 f1 11                 mov	r2, r1
 f0 33 04              ldsp16	r3, [sp+0x4]
 ec 93                 sdiv16	r2, r3
 f1 2a                 mov	r6, r2
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 30                 ldsp16	r4, [sp+0xc]
 fe 13                 mul16	r2, r3
 f2 3a                 sub	r1, r2
 f1 11                 mov	r2, r1
 f2 4b                 sub	r3, r3
 f0 31 06              ldsp16	r1, [sp+0x6]
 f9 5a                 xor	r2, r6
 f9 7e                 xor	r3, r7
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 b5                 dec16	r5
 f4 a5                 tst8	r5
 d1 b3                 brne8	avm_test_main+214
 c4 90 01              ldi16	r4, 0x190
 c5 80 01              ldi16	r5, 0x180
 c2 04                 ldi8	r6, 0x4
 f4 5a                 stsp16	[sp+0x6], r6
 f4 61                 stsp16	[sp+0x8], r5
 f4 68                 stsp16	[sp+0xa], r4
 f0 6a 0a              ld32	q0, [r5]
 f0 6a 88              ld32	q2, [r4]
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 68                 mov32	q2, q0
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 e1 70 01              call16	__avm_udivsi3
 f7 66                 add32	q1, q2
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 d5 34                 call8	__avm_mulsi3
 f4 1a                 ldsp16	r6, [sp+0x6]
 f7 72                 sub32	q0, q2
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 28                 ldsp16	r4, [sp+0xa]
 f9 42                 xor	r2, r0
 f9 66                 xor	r3, r1
 c9 04                 addi.s8	r5, 0x4
 c8 04                 addi.s8	r4, 0x4
 f4 b6                 dec16	r6
 f4 a6                 tst8	r6
 d1 c9                 brne8	avm_test_main+299
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 04                 cmpi.s8	r4, 0x4
 db 57 ff              brne16	avm_test_main+197
 c4 a0 01              ldi16	r4, 0x1a0
 f0 6b 48              st32	[r4], q1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 10                 adjsp	__avm_mulsi3+9
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<__avm_mulsi3>:
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	avm_test_main+370
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 08                    mov	r6, r4
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 fa 9f                 lsr16i	r6, 0xf
 f2 28                 add	r6, r0
 f4 72                 stsp16	[sp+0xc], r6
 f0 37 10              ldsp16	r7, [sp+0x10]
 f1 07                 mov	r0, r7
 f2 39                 sub	r1, r1
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 fa 9f                 lsr16i	r6, 0xf
 f2 28                 add	r6, r0
 fe 34                 mul16	r6, r4
 f4 4a                 stsp16	[sp+0x2], r6
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f4 32                 ldsp16	r6, [sp+0xc]
 fe 34                 mul16	r6, r4
 f4 72                 stsp16	[sp+0xc], r6
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f4 42                 stsp16	[sp+0x0], r6
 f1 74                 zext8	r4
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 04                    mov	r5, r4
 f1 75                 zext8	r5
 01                    mov	r4, r5
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 f3 12                 mulu8.w	r4, r6
 f4 68                 stsp16	[sp+0xa], r4
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 f3 3d                 mulsu8.w	r7, r5
 f4 63                 stsp16	[sp+0x8], r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 fa 78                 lsr16i	r4, 0x8
 0c                    mov	r7, r4
 f3 2e                 muls8.w	r7, r6
 f4 53                 stsp16	[sp+0x4], r7
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 f3 32                 mulsu8.w	r4, r6
 08                    mov	r6, r4
 fa d8                 asr16i	r6, 0x8
 f4 13                 ldsp16	r7, [sp+0x4]
 1b                    add	r6, r7
 f4 23                 ldsp16	r7, [sp+0x8]
 fa e8                 asr16i	r7, 0x8
 1e                    add	r7, r6
 f4 32                 ldsp16	r6, [sp+0xc]
 1e                    add	r7, r6
 f4 73                 stsp16	[sp+0xc], r7
 08                    mov	r6, r4
 fa 58                 lsl16i	r6, 0x8
 f4 52                 stsp16	[sp+0x4], r6
 f4 7a                 stsp16	[sp+0xe], r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 3b                 ldsp16	r7, [sp+0xe]
 1e                    add	r7, r6
 f4 7b                 stsp16	[sp+0xe], r7
 f4 3a                 ldsp16	r6, [sp+0xe]
 f4 13                 ldsp16	r7, [sp+0x4]
 3b                    cmp	r6, r7
 f8 16                 cset.ult	r6
 f4 33                 ldsp16	r7, [sp+0xc]
 1b                    add	r6, r7
 f4 0b                 ldsp16	r7, [sp+0x2]
 1b                    add	r6, r7
 f4 23                 ldsp16	r7, [sp+0x8]
 13                    add	r4, r7
 fa 38                 lsl16i	r4, 0x8
 f4 2b                 ldsp16	r7, [sp+0xa]
 13                    add	r4, r7
 f4 3b                 ldsp16	r7, [sp+0xe]
 33                    cmp	r4, r7
 f8 17                 cset.ult	r7
 1e                    add	r7, r6
 aa                    xor	r6, r6
 a5                    xor	r5, r5
 92                    or	r4, r6
 97                    or	r5, r7
 d6 12                 adjsp	__avm_udivmodsi4+15
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<__avm_udivmodsi4>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	__avm_mulsi3+167
 f0 30 17              ldsp16	r0, [sp+0x17]
 f0 38 00              stsp16	[sp+0x0], r0
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 c4              cmp32	q3, q1
 d0 56                 breq8	__avm_udivmodsi4+107
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 c2 20                 ldi8	r6, 0x20
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 d4 10                 jmp8	__avm_udivmodsi4+51
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f2 64                 mov32	q1, q0
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d0 44                 breq8	__avm_udivmodsi4+119
 f4 5a                 stsp16	[sp+0x6], r6
 f7 65                 add32	q1, q1
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f1 06                 mov	r0, r6
 f2 39                 sub	r1, r1
 f9 09                 or	r0, r2
 f9 2d                 or	r1, r3
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f7 65                 add32	q1, q1
 f7 6a                 add32	q2, q2
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f0 69 0c              cmp32	q0, q3
 d2 cd                 brult8	__avm_udivmodsi4+35
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f9 59                 or	r2, r6
 f9 7d                 or	r3, r7
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f7 73                 sub32	q0, q3
 d4 be                 jmp8	__avm_udivmodsi4+41
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f2 66                 mov32	q1, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 6b 48              st32	[r4], q1
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 d6 0c                 adjsp	__avm_udivsi3+7
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_udivsi3>:
 b0                    push16	r0
 d6 fc                 adjsp	__avm_udivmodsi4+134
 d6 fe                 adjsp	__avm_udivsi3+3
 f0 10 02              leasp	r0, 0x2
 f0 38 00              stsp16	[sp+0x0], r0
 e1 6b ff              call16	__avm_udivmodsi4
 d6 02                 adjsp	__avm_udivsi3+18
 d6 04                 adjsp	__avm_udivsi3+22
 b8                    pop16	r0
 ef                    ret
