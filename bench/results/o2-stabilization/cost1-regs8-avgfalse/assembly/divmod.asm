
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
00000216 g     F .text	00000152 avm_test_main
00000368 g     F .text	00000002 avm_halt
0000049a g     F .text	00000014 __avm_udivsi3
0000036a g     F .text	000000ad __avm_mulsi3
00000417 g     F .text	00000083 __avm_udivmodsi4

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
 e1 52 01              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	_start+18
 a0                    xor	r4, r4
 f0 06 50 fb           ldi16	r2, 0xfb50
 c6 e8 03              ldi16	r6, 0x3e8
 c7 00 01              ldi16	r7, 0x100
 c5 20 01              ldi16	r5, 0x120
 f4 59                 stsp16	[sp+0x6], r5
 c5 40 01              ldi16	r5, 0x140
 f0 04 60 01           ldi16	r0, 0x160
 f1 0e                 mov	r1, r6
 c6 f8 ff              ldi16	r6, 0xfff8
 cc 0b                 cmpi.s8	r4, 0xb
 f0 03 03              ldi8	r3, 0x3
 fc 33                 cmov.ult	r6, r3
 18                    add	r6, r4
 f7 59                 st16	[r7+], r1
 f1 1d                 mov	r3, r5
 f4 19                 ldsp16	r5, [sp+0x6]
 f7 4e                 st16	[r5+], r6
 f4 59                 stsp16	[sp+0x6], r5
 f1 27                 mov	r5, r3
 c6 fa ff              ldi16	r6, 0xfffa
 cc 09                 cmpi.s8	r4, 0x9
 f1 1f                 mov	r3, r7
 c3 03                 ldi8	r7, 0x3
 fc 37                 cmov.ult	r6, r7
 f1 2f                 mov	r7, r3
 18                    add	r6, r4
 f7 4a                 st16	[r5+], r2
 f0 6d d1              st16	[r0+], r6
 c2 89                 ldi8	r6, 0x89
 f2 29                 add	r6, r1
 f0 0a 71              addi.s8	r2, 0x71
 f4 ac                 inc16	r4
 cc 10                 cmpi.s8	r4, 0x10
 d1 c7                 brne8	avm_test_main+29
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
 a0                    xor	r4, r4
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 d7 01                 sys	debug_break
 04                    mov	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 a0                    xor	r4, r4
 c5 00 01              ldi16	r5, 0x100
 14                    add	r5, r4
 65                    ld16	r5, [r5]
 c6 20 01              ldi16	r6, 0x120
 18                    add	r6, r4
 6a                    ld16	r6, [r6]
 0d                    mov	r7, r5
 ec 3e                 udiv16	r7, r6
 f1 07                 mov	r0, r7
 f2 39                 sub	r1, r1
 f7 61                 add32	q0, q1
 fe 3e                 mul16	r7, r6
 27                    sub	r5, r7
 f1 15                 mov	r2, r5
 f2 4b                 sub	r3, r3
 f9 42                 xor	r2, r0
 f9 66                 xor	r3, r1
 c5 40 01              ldi16	r5, 0x140
 14                    add	r5, r4
 65                    ld16	r5, [r5]
 c6 60 01              ldi16	r6, 0x160
 18                    add	r6, r4
 6a                    ld16	r6, [r6]
 0d                    mov	r7, r5
 ec be                 sdiv16	r7, r6
 f1 07                 mov	r0, r7
 f2 39                 sub	r1, r1
 f7 61                 add32	q0, q1
 fe 3e                 mul16	r7, r6
 27                    sub	r5, r7
 f1 15                 mov	r2, r5
 f2 4b                 sub	r3, r3
 f9 42                 xor	r2, r0
 f9 66                 xor	r3, r1
 c8 02                 addi.s8	r4, 0x2
 cc 20                 cmpi.s8	r4, 0x20
 d1 be                 brne8	avm_test_main+185
 f2 30                 sub	r0, r0
 c4 80 01              ldi16	r4, 0x180
 f2 20                 add	r4, r0
 f0 6a 88              ld32	q2, [r4]
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 c6 90 01              ldi16	r6, 0x190
 f2 28                 add	r6, r0
 f0 6a cc              ld32	q3, [r6]
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 e1 68 01              call16	__avm_udivsi3
 f7 66                 add32	q1, q2
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 d5 30                 call8	__avm_mulsi3
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f7 7e                 sub32	q3, q2
 f9 5a                 xor	r2, r6
 f9 7e                 xor	r3, r7
 f0 08 04              addi.s8	r0, 0x4
 f0 0c 10              cmpi.s8	r0, 0x10
 d1 c7                 brne8	avm_test_main+253
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 04                 cmpi.s8	r4, 0x4
 db 74 ff              brne16	avm_test_main+182
 c4 a0 01              ldi16	r4, 0x1a0
 f0 6b 48              st32	[r4], q1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0a                 adjsp	__avm_mulsi3+3
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
 d6 ee                 adjsp	avm_test_main+326
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
 f2 66                 mov32	q1, q2
 f0 34 17              ldsp16	r4, [sp+0x17]
 f4 40                 stsp16	[sp+0x0], r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d0 57                 breq8	__avm_udivmodsi4+107
 c0 20                 ldi8	r4, 0x20
 f4 58                 stsp16	[sp+0x6], r4
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f2 68                 mov32	q2, q0
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f7 6a                 add32	q2, q2
 f1 2b                 mov	r6, r3
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 af                    xor	r7, r7
 98                    or	r6, r4
 9d                    or	r7, r5
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f0 69 c8              cmp32	q3, q2
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 fc 54                 cmov.uge	r2, r4
 fc 5d                 cmov.uge	r3, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f7 79                 sub32	q2, q1
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
 f0 69 c4              cmp32	q3, q1
 f8 1e                 cset.uge	r6
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f7 65                 add32	q1, q1
 f7 60                 add32	q0, q0
 af                    xor	r7, r7
 f9 19                 or	r0, r6
 f9 3d                 or	r1, r7
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 b6                 dec16	r6
 f4 5a                 stsp16	[sp+0x6], r6
 f6 2e                 tst16	r6
 d1 b9                 brne8	__avm_udivmodsi4+34
 d4 0a                 jmp8	__avm_udivmodsi4+117
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f2 69                 mov32	q2, q1
 f4 02                 ldsp16	r6, [sp+0x0]
 f0 6b 8c              st32	[r6], q2
 f2 68                 mov32	q2, q0
 d6 0c                 adjsp	__avm_udivsi3+7
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_udivsi3>:
 b0                    push16	r0
 d6 fc                 adjsp	__avm_udivmodsi4+130
 d6 fe                 adjsp	__avm_udivsi3+3
 f0 10 02              leasp	r0, 0x2
 f0 38 00              stsp16	[sp+0x0], r0
 e1 6f ff              call16	__avm_udivmodsi4
 d6 02                 adjsp	__avm_udivsi3+18
 d6 04                 adjsp	__avm_udivsi3+22
 b8                    pop16	r0
 ef                    ret
