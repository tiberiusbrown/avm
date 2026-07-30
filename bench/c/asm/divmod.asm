
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
00000000 l    df *ABS*	00000000 integer.c
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	0000029f avm_test_main
000005fc g     F .text	00000002 avm_halt
000005e8 g     F .text	00000014 __avm_udivsi3
000004b5 g     F .text	000000b1 __avm_mulsi3
00000566 g     F .text	00000082 __avm_udivmodsi4

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 01                    mov	r4, r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 e6 03              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 c4 e8 03              ldi16	r4, 0x3e8
 f0 5c 00 01           stm16	[0x100], r4
 f0 02 03              ldi8	r2, 0x3
 f0 5a 20 01           stm16	[0x120], r2
 c4 50 fb              ldi16	r4, 0xfb50
 f0 5c 40 01           stm16	[0x140], r4
 f0 5a 60 01           stm16	[0x160], r2
 c4 71 04              ldi16	r4, 0x471
 f0 5c 02 01           stm16	[0x102], r4
 f0 03 04              ldi8	r3, 0x4
 f0 5b 22 01           stm16	[0x122], r3
 c4 c1 fb              ldi16	r4, 0xfbc1
 f0 5c 42 01           stm16	[0x142], r4
 f0 5b 62 01           stm16	[0x162], r3
 c4 fa 04              ldi16	r4, 0x4fa
 f0 5c 04 01           stm16	[0x104], r4
 f0 00 05              ldi8	r0, 0x5
 f0 58 24 01           stm16	[0x124], r0
 c4 32 fc              ldi16	r4, 0xfc32
 f0 5c 44 01           stm16	[0x144], r4
 f0 58 64 01           stm16	[0x164], r0
 c4 83 05              ldi16	r4, 0x583
 f0 5c 06 01           stm16	[0x106], r4
 c3 06                 ldi8	r7, 0x6
 f0 5f 26 01           stm16	[0x126], r7
 c4 a3 fc              ldi16	r4, 0xfca3
 f0 5c 46 01           stm16	[0x146], r4
 f0 5f 66 01           stm16	[0x166], r7
 c4 0c 06              ldi16	r4, 0x60c
 f0 5c 08 01           stm16	[0x108], r4
 c0 07                 ldi8	r4, 0x7
 f0 5c 28 01           stm16	[0x128], r4
 c5 14 fd              ldi16	r5, 0xfd14
 f0 5d 48 01           stm16	[0x148], r5
 f0 5c 68 01           stm16	[0x168], r4
 c5 95 06              ldi16	r5, 0x695
 f0 5d 0a 01           stm16	[0x10a], r5
 c2 08                 ldi8	r6, 0x8
 f0 5e 2a 01           stm16	[0x12a], r6
 c5 85 fd              ldi16	r5, 0xfd85
 f0 5d 4a 01           stm16	[0x14a], r5
 f0 5e 6a 01           stm16	[0x16a], r6
 c5 1e 07              ldi16	r5, 0x71e
 f0 5d 0c 01           stm16	[0x10c], r5
 c2 09                 ldi8	r6, 0x9
 f0 5e 2c 01           stm16	[0x12c], r6
 c5 f6 fd              ldi16	r5, 0xfdf6
 f0 5d 4c 01           stm16	[0x14c], r5
 f0 5e 6c 01           stm16	[0x16c], r6
 c5 a7 07              ldi16	r5, 0x7a7
 f0 5d 0e 01           stm16	[0x10e], r5
 c1 0a                 ldi8	r5, 0xa
 f0 5d 2e 01           stm16	[0x12e], r5
 f0 05 67 fe           ldi16	r1, 0xfe67
 f0 59 4e 01           stm16	[0x14e], r1
 f0 5d 6e 01           stm16	[0x16e], r5
 c5 30 08              ldi16	r5, 0x830
 f0 5d 10 01           stm16	[0x110], r5
 c1 0b                 ldi8	r5, 0xb
 f0 5d 30 01           stm16	[0x130], r5
 c6 d8 fe              ldi16	r6, 0xfed8
 f0 5e 50 01           stm16	[0x150], r6
 f0 5d 70 01           stm16	[0x170], r5
 c5 b9 08              ldi16	r5, 0x8b9
 f0 5d 12 01           stm16	[0x112], r5
 c1 0c                 ldi8	r5, 0xc
 f0 5d 32 01           stm16	[0x132], r5
 c5 49 ff              ldi16	r5, 0xff49
 f0 5d 52 01           stm16	[0x152], r5
 f0 5a 72 01           stm16	[0x172], r2
 c5 42 09              ldi16	r5, 0x942
 f0 5d 14 01           stm16	[0x114], r5
 c1 0d                 ldi8	r5, 0xd
 f0 5d 34 01           stm16	[0x134], r5
 c5 ba ff              ldi16	r5, 0xffba
 f0 5d 54 01           stm16	[0x154], r5
 f0 5b 74 01           stm16	[0x174], r3
 c5 cb 09              ldi16	r5, 0x9cb
 f0 5d 16 01           stm16	[0x116], r5
 f0 5a 36 01           stm16	[0x136], r2
 c1 2b                 ldi8	r5, 0x2b
 f0 5d 56 01           stm16	[0x156], r5
 f0 58 76 01           stm16	[0x176], r0
 c5 54 0a              ldi16	r5, 0xa54
 f0 5d 18 01           stm16	[0x118], r5
 f0 5b 38 01           stm16	[0x138], r3
 c1 9c                 ldi8	r5, 0x9c
 f0 5d 58 01           stm16	[0x158], r5
 f0 5f 78 01           stm16	[0x178], r7
 c5 dd 0a              ldi16	r5, 0xadd
 f0 5d 1a 01           stm16	[0x11a], r5
 f0 58 3a 01           stm16	[0x13a], r0
 c5 0d 01              ldi16	r5, 0x10d
 f0 5d 5a 01           stm16	[0x15a], r5
 f0 5c 7a 01           stm16	[0x17a], r4
 c5 66 0b              ldi16	r5, 0xb66
 f0 5d 1c 01           stm16	[0x11c], r5
 f0 5f 3c 01           stm16	[0x13c], r7
 c5 7e 01              ldi16	r5, 0x17e
 f0 5d 5c 01           stm16	[0x15c], r5
 c1 08                 ldi8	r5, 0x8
 f0 5d 7c 01           stm16	[0x17c], r5
 c5 ef 0b              ldi16	r5, 0xbef
 f0 5d 1e 01           stm16	[0x11e], r5
 f0 5c 3e 01           stm16	[0x13e], r4
 c4 ef 01              ldi16	r4, 0x1ef
 f0 5c 5e 01           stm16	[0x15e], r4
 c0 09                 ldi8	r4, 0x9
 f0 5c 7e 01           stm16	[0x17e], r4
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
 f2 30                 sub	r0, r0
 f1 24                 mov	r5, r0
 c4 00 01              ldi16	r4, 0x100
 14                    add	r5, r4
 f5 45                 ld16	r1, [r5]
 f1 28                 mov	r6, r0
 c4 20 01              ldi16	r4, 0x120
 18                    add	r6, r4
 6a                    ld16	r6, [r6]
 f1 2d                 mov	r7, r1
 ec 3e                 udiv16	r7, r6
 03                    mov	r4, r7
 a5                    xor	r5, r5
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f7 69                 add32	q2, q1
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 fe 3e                 mul16	r7, r6
 f2 3f                 sub	r1, r7
 f1 11                 mov	r2, r1
 f2 4b                 sub	r3, r3
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 f1 24                 mov	r5, r0
 c4 40 01              ldi16	r4, 0x140
 14                    add	r5, r4
 f5 45                 ld16	r1, [r5]
 f1 20                 mov	r4, r0
 c5 60 01              ldi16	r5, 0x160
 11                    add	r4, r5
 60                    ld16	r4, [r4]
 f1 25                 mov	r5, r1
 ec ac                 sdiv16	r5, r4
 09                    mov	r6, r5
 af                    xor	r7, r7
 f7 6d                 add32	q3, q1
 fe 2c                 mul16	r5, r4
 f2 3d                 sub	r1, r5
 f1 11                 mov	r2, r1
 f2 4b                 sub	r3, r3
 f9 5a                 xor	r2, r6
 f9 7e                 xor	r3, r7
 f0 08 02              addi.s8	r0, 0x2
 f0 0c 20              cmpi.s8	r0, 0x20
 d1 a2                 brne8	avm_test_main+486
 f2 30                 sub	r0, r0
 f0 05 90 01           ldi16	r1, 0x190
 f1 20                 mov	r4, r0
 c5 80 01              ldi16	r5, 0x180
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f1 28                 mov	r6, r0
 f2 29                 add	r6, r1
 f0 6a cc              ld32	q3, [r6]
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 e1 69 01              call16	__avm_udivsi3
 f7 66                 add32	q1, q2
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 d5 2e                 call8	__avm_mulsi3
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f7 7e                 sub32	q3, q2
 f9 5a                 xor	r2, r6
 f9 7e                 xor	r3, r7
 f0 08 04              addi.s8	r0, 0x4
 f0 0c 10              cmpi.s8	r0, 0x10
 d1 c7                 brne8	avm_test_main+586
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 04                 cmpi.s8	r4, 0x4
 db 53 ff              brne16	avm_test_main+482
 c4 a0 01              ldi16	r4, 0x1a0
 f0 6b 48              st32	[r4], q1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_mulsi3>:
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	-0x12
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 fa 7f                 lsr16i	r4, 0xf
 f2 20                 add	r4, r0
 f4 68                 stsp16	[sp+0xa], r4
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f1 07                 mov	r0, r7
 f2 39                 sub	r1, r1
 02                    mov	r4, r6
 fa 7f                 lsr16i	r4, 0xf
 f2 20                 add	r4, r0
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 fe 26                 mul16	r4, r6
 f4 40                 stsp16	[sp+0x0], r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 2a                 ldsp16	r6, [sp+0xa]
 fe 34                 mul16	r6, r4
 f4 6a                 stsp16	[sp+0xa], r6
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f4 4a                 stsp16	[sp+0x2], r6
 f1 74                 zext8	r4
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f4 18                 ldsp16	r4, [sp+0x6]
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f3 18                 mulu8.w	r6, r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 3b                 mulsu8.w	r6, r7
 f0 3e 10              stsp16	[sp+0x10], r6
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 fa 78                 lsr16i	r4, 0x8
 0c                    mov	r7, r4
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 2e                 muls8.w	r7, r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f3 32                 mulsu8.w	r4, r6
 08                    mov	r6, r4
 fa d8                 asr16i	r6, 0x8
 f4 1b                 ldsp16	r7, [sp+0x6]
 1b                    add	r6, r7
 f0 37 10              ldsp16	r7, [sp+0x10]
 fa e8                 asr16i	r7, 0x8
 1e                    add	r7, r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 1e                    add	r7, r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 36 10              ldsp16	r6, [sp+0x10]
 18                    add	r6, r4
 f0 3e 10              stsp16	[sp+0x10], r6
 fa 38                 lsl16i	r4, 0x8
 08                    mov	r6, r4
 f4 72                 stsp16	[sp+0xc], r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 33                 ldsp16	r7, [sp+0xc]
 1e                    add	r7, r6
 f4 73                 stsp16	[sp+0xc], r7
 f4 32                 ldsp16	r6, [sp+0xc]
 38                    cmp	r6, r4
 f8 14                 cset.ult	r4
 f4 29                 ldsp16	r5, [sp+0xa]
 11                    add	r4, r5
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f0 35 10              ldsp16	r5, [sp+0x10]
 fa 48                 lsl16i	r5, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 16                    add	r5, r6
 f0 3d 10              stsp16	[sp+0x10], r5
 f4 32                 ldsp16	r6, [sp+0xc]
 36                    cmp	r5, r6
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 0d                    mov	r7, r5
 aa                    xor	r6, r6
 f0 34 10              ldsp16	r4, [sp+0x10]
 a5                    xor	r5, r5
 92                    or	r4, r6
 97                    or	r5, r7
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<__avm_udivmodsi4>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f2 62                 mov32	q0, q2
 f0 34 17              ldsp16	r4, [sp+0x17]
 f4 40                 stsp16	[sp+0x0], r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d0 5c                 breq8	__avm_udivmodsi4+112
 c0 20                 ldi8	r4, 0x20
 f4 58                 stsp16	[sp+0x6], r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f2 66                 mov32	q1, q2
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 f7 65                 add32	q1, q1
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f1 06                 mov	r0, r6
 f2 39                 sub	r1, r1
 f9 09                 or	r0, r2
 f9 2d                 or	r1, r3
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
 f0 69 04              cmp32	q0, q1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 fc 72                 cmov.uge	r6, r2
 fc 7b                 cmov.uge	r7, r3
 f7 73                 sub32	q0, q3
 f8 1e                 cset.uge	r6
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f7 65                 add32	q1, q1
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f7 6a                 add32	q2, q2
 af                    xor	r7, r7
 92                    or	r4, r6
 97                    or	r5, r7
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 b6                 dec16	r6
 f4 5a                 stsp16	[sp+0x6], r6
 f6 2e                 tst16	r6
 f2 64                 mov32	q1, q0
 d1 b8                 brne8	__avm_udivmodsi4+38
 d4 06                 jmp8	__avm_udivmodsi4+118
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f4 02                 ldsp16	r6, [sp+0x0]
 f0 6b 0c              st32	[r6], q0
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_udivsi3>:
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 d6 fe                 adjsp	-0x2
 f0 10 02              leasp	r0, 0x2
 f0 38 00              stsp16	[sp+0x0], r0
 e1 70 ff              call16	__avm_udivmodsi4
 d6 02                 adjsp	0x2
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
