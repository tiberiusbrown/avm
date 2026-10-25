
divmod.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 divmod.c
00000100 l     O .data	00000004 divmod_result
00000104 l     O .data	00000010 wide_numerators
00000114 l     O .data	00000010 wide_denominators
00000124 l     O .data	00000020 unsigned_numerators
00000144 l     O .data	00000020 unsigned_denominators
00000164 l     O .data	00000020 signed_numerators
00000184 l     O .data	00000020 signed_denominators
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 integer.c
000005b9 l       .init_array	00000000 .hidden __init_array_end
000005b9 l       .init_array	00000000 .hidden __init_array_start
000005b9 l       .fini_array	00000000 .hidden __fini_array_start
000005b9 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	0000027e avm_test_main
00000545 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000547 g     F .text	00000072 __avm_udivmodsi4

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 c1 00              call16	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 d5 51                 call8	avm_run_destructors
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 27 03              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 b9 05              ldi16	r4, 0x5b9
 c1 00                 ldi8	r5, 0x0
 c6 b9 05              ldi16	r6, 0x5b9
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 b9 05           ldi16	r0, 0x5b9
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 b9 05           ldi16	r2, 0x5b9
 f0 03 00              ldi8	r3, 0x0
<L0>:
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	-0x13 <L0>
<L1>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_run_destructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	0x3 <L0>
 e1 89 fd              call16	-631 <__avm_run_local_dtors>
<L0>:
 c4 b9 05              ldi16	r4, 0x5b9
 c1 00                 ldi8	r5, 0x0
 c6 b9 05              ldi16	r6, 0x5b9
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 b9 05           ldi16	r2, 0x5b9
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 b9 05           ldi16	r0, 0x5b9
 f0 01 00              ldi8	r1, 0x0
<L1>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	-0x13 <L1>
<L2>:
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	0x3 <L3>
 e1 40 fd              call16	-704 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 c4 e8 03              ldi16	r4, 0x3e8
 f0 5c 24 01           stm16	[0x124], r4
 f0 02 03              ldi8	r2, 0x3
 f0 5a 44 01           stm16	[0x144], r2
 c4 50 fb              ldi16	r4, 0xfb50
 f0 5c 64 01           stm16	[0x164], r4
 f0 5a 84 01           stm16	[0x184], r2
 c4 71 04              ldi16	r4, 0x471
 f0 5c 26 01           stm16	[0x126], r4
 f0 03 04              ldi8	r3, 0x4
 f0 5b 46 01           stm16	[0x146], r3
 c4 c1 fb              ldi16	r4, 0xfbc1
 f0 5c 66 01           stm16	[0x166], r4
 f0 5b 86 01           stm16	[0x186], r3
 c4 fa 04              ldi16	r4, 0x4fa
 f0 5c 28 01           stm16	[0x128], r4
 f0 00 05              ldi8	r0, 0x5
 f0 58 48 01           stm16	[0x148], r0
 c4 32 fc              ldi16	r4, 0xfc32
 f0 5c 68 01           stm16	[0x168], r4
 f0 58 88 01           stm16	[0x188], r0
 c4 83 05              ldi16	r4, 0x583
 f0 5c 2a 01           stm16	[0x12a], r4
 c3 06                 ldi8	r7, 0x6
 f0 5f 4a 01           stm16	[0x14a], r7
 c4 a3 fc              ldi16	r4, 0xfca3
 f0 5c 6a 01           stm16	[0x16a], r4
 f0 5f 8a 01           stm16	[0x18a], r7
 c4 0c 06              ldi16	r4, 0x60c
 f0 5c 2c 01           stm16	[0x12c], r4
 c0 07                 ldi8	r4, 0x7
 f0 5c 4c 01           stm16	[0x14c], r4
 c5 14 fd              ldi16	r5, 0xfd14
 f0 5d 6c 01           stm16	[0x16c], r5
 f0 5c 8c 01           stm16	[0x18c], r4
 c5 95 06              ldi16	r5, 0x695
 f0 5d 2e 01           stm16	[0x12e], r5
 c2 08                 ldi8	r6, 0x8
 f0 5e 4e 01           stm16	[0x14e], r6
 c5 85 fd              ldi16	r5, 0xfd85
 f0 5d 6e 01           stm16	[0x16e], r5
 f0 5e 8e 01           stm16	[0x18e], r6
 c5 1e 07              ldi16	r5, 0x71e
 f0 5d 30 01           stm16	[0x130], r5
 c2 09                 ldi8	r6, 0x9
 f0 5e 50 01           stm16	[0x150], r6
 c5 f6 fd              ldi16	r5, 0xfdf6
 f0 5d 70 01           stm16	[0x170], r5
 f0 5e 90 01           stm16	[0x190], r6
 c5 a7 07              ldi16	r5, 0x7a7
 f0 5d 32 01           stm16	[0x132], r5
 c1 0a                 ldi8	r5, 0xa
 f0 5d 52 01           stm16	[0x152], r5
 f0 05 67 fe           ldi16	r1, 0xfe67
 f0 59 72 01           stm16	[0x172], r1
 f0 5d 92 01           stm16	[0x192], r5
 c5 30 08              ldi16	r5, 0x830
 f0 5d 34 01           stm16	[0x134], r5
 c1 0b                 ldi8	r5, 0xb
 f0 5d 54 01           stm16	[0x154], r5
 c6 d8 fe              ldi16	r6, 0xfed8
 f0 5e 74 01           stm16	[0x174], r6
 f0 5d 94 01           stm16	[0x194], r5
 c5 b9 08              ldi16	r5, 0x8b9
 f0 5d 36 01           stm16	[0x136], r5
 c1 0c                 ldi8	r5, 0xc
 f0 5d 56 01           stm16	[0x156], r5
 c5 49 ff              ldi16	r5, 0xff49
 f0 5d 76 01           stm16	[0x176], r5
 f0 5a 96 01           stm16	[0x196], r2
 c5 42 09              ldi16	r5, 0x942
 f0 5d 38 01           stm16	[0x138], r5
 c1 0d                 ldi8	r5, 0xd
 f0 5d 58 01           stm16	[0x158], r5
 c5 ba ff              ldi16	r5, 0xffba
 f0 5d 78 01           stm16	[0x178], r5
 f0 5b 98 01           stm16	[0x198], r3
 c5 cb 09              ldi16	r5, 0x9cb
 f0 5d 3a 01           stm16	[0x13a], r5
 f0 5a 5a 01           stm16	[0x15a], r2
 c1 2b                 ldi8	r5, 0x2b
 f0 5d 7a 01           stm16	[0x17a], r5
 f0 58 9a 01           stm16	[0x19a], r0
 c5 54 0a              ldi16	r5, 0xa54
 f0 5d 3c 01           stm16	[0x13c], r5
 f0 5b 5c 01           stm16	[0x15c], r3
 c1 9c                 ldi8	r5, 0x9c
 f0 5d 7c 01           stm16	[0x17c], r5
 f0 5f 9c 01           stm16	[0x19c], r7
 c5 dd 0a              ldi16	r5, 0xadd
 f0 5d 3e 01           stm16	[0x13e], r5
 f0 58 5e 01           stm16	[0x15e], r0
 c5 0d 01              ldi16	r5, 0x10d
 f0 5d 7e 01           stm16	[0x17e], r5
 f0 5c 9e 01           stm16	[0x19e], r4
 c5 66 0b              ldi16	r5, 0xb66
 f0 5d 40 01           stm16	[0x140], r5
 f0 5f 60 01           stm16	[0x160], r7
 c5 7e 01              ldi16	r5, 0x17e
 f0 5d 80 01           stm16	[0x180], r5
 c1 08                 ldi8	r5, 0x8
 f0 5d a0 01           stm16	[0x1a0], r5
 c5 ef 0b              ldi16	r5, 0xbef
 f0 5d 42 01           stm16	[0x142], r5
 f0 5c 62 01           stm16	[0x162], r4
 c4 ef 01              ldi16	r4, 0x1ef
 f0 5c 82 01           stm16	[0x182], r4
 c0 09                 ldi8	r4, 0x9
 f0 5c a2 01           stm16	[0x1a2], r4
 c4 78 56              ldi16	r4, 0x5678
 c5 34 12              ldi16	r5, 0x1234
 c6 04 01              ldi16	r6, 0x104
 f0 6b 8c              st32	[r6], q2
 c4 01 01              ldi16	r4, 0x101
 a5                    xor	r5, r5
 c6 14 01              ldi16	r6, 0x114
 f0 6b 8c              st32	[r6], q2
 c4 7b 58              ldi16	r4, 0x587b
 c5 35 12              ldi16	r5, 0x1235
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 c4 13 01              ldi16	r4, 0x113
 a5                    xor	r5, r5
 c6 18 01              ldi16	r6, 0x118
 f0 6b 8c              st32	[r6], q2
 c4 7e 5a              ldi16	r4, 0x5a7e
 c5 36 12              ldi16	r5, 0x1236
 c6 0c 01              ldi16	r6, 0x10c
 f0 6b 8c              st32	[r6], q2
 c4 25 01              ldi16	r4, 0x125
 a5                    xor	r5, r5
 c6 1c 01              ldi16	r6, 0x11c
 f0 6b 8c              st32	[r6], q2
 c4 81 5c              ldi16	r4, 0x5c81
 c5 37 12              ldi16	r5, 0x1237
 c6 10 01              ldi16	r6, 0x110
 f0 6b 8c              st32	[r6], q2
 c4 37 01              ldi16	r4, 0x137
 a5                    xor	r5, r5
 c6 20 01              ldi16	r6, 0x120
 f0 6b 8c              st32	[r6], q2
 a0                    xor	r4, r4
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 d7 01                 sys	debug_break
<L0>:
 f4 40                 stsp16	[sp+0x0], r4
 a0                    xor	r4, r4
 04                    mov	r5, r4
<L1>:
 f4 49                 stsp16	[sp+0x2], r5
 c4 24 01              ldi16	r4, 0x124
 14                    add	r5, r4
 65                    ld16	r5, [r5]
 f4 0a                 ldsp16	r6, [sp+0x2]
 c4 44 01              ldi16	r4, 0x144
 18                    add	r6, r4
 6a                    ld16	r6, [r6]
 0d                    mov	r7, r5
 ec 3e                 udiv16	r7, r6
 f1 07                 mov	r0, r7
 f2 39                 sub	r1, r1
 f7 61                 add32	q0, q1
 fe 3e                 mul16	r7, r6
 27                    sub	r5, r7
 09                    mov	r6, r5
 af                    xor	r7, r7
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f4 09                 ldsp16	r5, [sp+0x2]
 c4 64 01              ldi16	r4, 0x164
 14                    add	r5, r4
 f5 46                 ld16	r2, [r5]
 f4 08                 ldsp16	r4, [sp+0x2]
 c5 84 01              ldi16	r5, 0x184
 11                    add	r4, r5
 60                    ld16	r4, [r4]
 f1 26                 mov	r5, r2
 ec ac                 sdiv16	r5, r4
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 f7 63                 add32	q0, q3
 fe 2c                 mul16	r5, r4
 f2 45                 sub	r2, r5
 f4 09                 ldsp16	r5, [sp+0x2]
 f2 4b                 sub	r3, r3
 f9 42                 xor	r2, r0
 f9 66                 xor	r3, r1
 c9 02                 addi.s8	r5, 0x2
 cd 20                 cmpi.s8	r5, 0x20
 d1 b5                 brne8	-0x4b <L1>
 f2 30                 sub	r0, r0
 f0 05 14 01           ldi16	r1, 0x114
<L2>:
 d6 fe                 adjsp	-0x2
 f0 14 06              leasp	r4, 0x6
 f4 40                 stsp16	[sp+0x0], r4
 f1 20                 mov	r4, r0
 c5 04 01              ldi16	r5, 0x104
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 f1 28                 mov	r6, r0
 f2 29                 add	r6, r1
 f0 6a cc              ld32	q3, [r6]
 d5 31                 call8	__avm_udivmodsi4
 d6 02                 adjsp	0x2
 f7 69                 add32	q2, q1
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 f0 08 04              addi.s8	r0, 0x4
 f0 0c 10              cmpi.s8	r0, 0x10
 d1 d1                 brne8	-0x2f <L2>
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 ac                 inc16	r4
 cc 04                 cmpi.s8	r4, 0x4
 db 73 ff              brne16	-0x8d <L0>
 c4 00 01              ldi16	r4, 0x100
 f0 6b 48              st32	[r4], q1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

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
 d0 46                 breq8	0x46 <L1>
 c2 20                 ldi8	r6, 0x20
 f4 6a                 stsp16	[sp+0xa], r6
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f2 67                 mov32	q1, q3
 f0 38 02              stsp16	[sp+0x2], r0
 f0 39 04              stsp16	[sp+0x4], r1
 f2 63                 mov32	q0, q3
<L0>:
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
 d1 cc                 brne8	-0x34 <L0>
 d4 0a                 jmp8	0xa <L2>
<L1>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f2 66                 mov32	q1, q2
<L2>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 6b 48              st32	[r4], q1
 f2 68                 mov32	q2, q0
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
