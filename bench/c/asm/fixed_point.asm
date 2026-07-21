
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/fixed_point.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 fixed_point.c
00000100 l     O .data	00000100 bodies
00000200 l     O .data	00000002 fixed_point_result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 integer.c
00000300 g     F .text	00000016 _start
00000316 g     F .text	000000dd avm_test_main
000003f3 g     F .text	00000002 avm_halt
0000041f g     F .text	000000cf __avm_mulsi3
000003f5 g     F .text	0000002a __avm_ashrsi3

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
 e1 dd 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	avm_test_main+2
 f0 02 00              ldi8	r2, 0x0
 c1 80                 ldi8	r5, 0x80
 c6 38 ff              ldi16	r6, 0xff38
 c7 fd ff              ldi16	r7, 0xfffd
 f0 04 00 f0           ldi16	r0, 0xf000
 f0 05 04 01           ldi16	r1, 0x104
 c4 00 01              ldi16	r4, 0x100
 f4 48                 stsp16	[sp+0x2], r4
 f1 19                 mov	r3, r1
 f0 0b fc              addi.s8	r3, -0x4
 f0 6d 16              st16	[r3], r0
 f4 08                 ldsp16	r4, [sp+0x2]
 f2 04                 add	r0, r4
 f0 03 07              ldi8	r3, 0x7
 f1 22                 mov	r4, r2
 ec 23                 udiv16	r4, r3
 fe 23                 mul16	r4, r3
 f1 19                 mov	r3, r1
 f0 0b 02              addi.s8	r3, 0x2
 f0 6d b6              st16	[r3], r5
 f1 19                 mov	r3, r1
 f0 0b fe              addi.s8	r3, -0x2
 f0 6d d6              st16	[r3], r6
 f1 1f                 mov	r3, r7
 f2 4c                 sub	r3, r4
 f0 6d 72              st16	[r1], r3
 f0 09 08              addi.s8	r1, 0x8
 f4 af                 inc16	r7
 c9 05                 addi.s8	r5, 0x5
 f4 aa                 inc16	r2
 ca 11                 addi.s8	r6, 0x11
 c4 58 01              ldi16	r4, 0x158
 38                    cmp	r6, r4
 d1 c3                 brne8	avm_test_main+30
 a5                    xor	r5, r5
 d7 01                 sys	debug_break
 f1 0d                 mov	r1, r5
 f4 41                 stsp16	[sp+0x0], r5
 c0 20                 ldi8	r4, 0x20
 f0 06 04 01           ldi16	r2, 0x104
 f4 48                 stsp16	[sp+0x2], r4
 f0 6c 94              ld16	r4, [r2]
 f1 1a                 mov	r3, r2
 f0 0b fe              addi.s8	r3, -0x2
 f0 6c 16              ld16	r0, [r3]
 f2 04                 add	r0, r4
 f1 22                 mov	r4, r2
 c8 fc                 addi.s8	r4, -0x4
 64                    ld16	r5, [r4]
 f2 24                 add	r5, r0
 71                    st16	[r4], r5
 09                    mov	r6, r5
 0d                    mov	r7, r5
 fa ef                 asr16i	r7, 0xf
 f1 22                 mov	r4, r2
 c8 02                 addi.s8	r4, 0x2
 60                    ld16	r4, [r4]
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 d5 7c                 call8	__avm_mulsi3
 c2 80                 ldi8	r6, 0x80
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f0 6d 16              st16	[r3], r0
 c2 08                 ldi8	r6, 0x8
 af                    xor	r7, r7
 d5 45                 call8	__avm_ashrsi3
 f0 0a 08              addi.s8	r2, 0x8
 c6 ff 7f              ldi16	r6, 0x7fff
 af                    xor	r7, r7
 f0 69 c8              cmp32	q3, q2
 d9 05                 brsge8	avm_test_main+171
 c6 ff 7f              ldi16	r6, 0x7fff
 d4 0d                 jmp8	avm_test_main+184
 c6 00 80              ldi16	r6, 0x8000
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c8              cmp32	q3, q2
 fd 34                 cmov.slt	r6, r4
 fd 3d                 cmov.slt	r7, r5
 f4 08                 ldsp16	r4, [sp+0x2]
 f2 0e                 add	r1, r6
 f9 22                 xor	r1, r0
 f4 b4                 dec16	r4
 f4 a4                 tst8	r4
 d1 a4                 brne8	avm_test_main+104
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 40                 cmpi.s8	r4, 0x40
 d1 91                 brne8	avm_test_main+96
 f0 59 00 02           stm16	[0x200], r1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 04                 adjsp	avm_test_main+220
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<__avm_ashrsi3>:
 b1                    push16	r1
 b0                    push16	r0
 f0 00 1f              ldi8	r0, 0x1f
 f0 01 00              ldi8	r1, 0x0
 f0 69 0c              cmp32	q0, q3
 d8 07                 bruge8	__avm_ashrsi3+20
 c2 1f                 ldi8	r6, 0x1f
 af                    xor	r7, r7
 d5 ee                 call8	__avm_ashrsi3
 d4 13                 jmp8	__avm_ashrsi3+39
 f0 00 00              ldi8	r0, 0x0
 f0 01 00              ldi8	r1, 0x0
 f0 69 c0              cmp32	q3, q0
 d0 08                 breq8	__avm_ashrsi3+39
 f7 86                 asr32.1	q2
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f8                 brne8	__avm_ashrsi3+31
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<__avm_mulsi3>:
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	__avm_ashrsi3+28
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 f1 05                 mov	r0, r5
 f0 01 00              ldi8	r1, 0x0
 08                    mov	r6, r4
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 fa 9f                 lsr16i	r6, 0xf
 f2 28                 add	r6, r0
 f4 62                 stsp16	[sp+0x8], r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 f1 07                 mov	r0, r7
 f0 01 00              ldi8	r1, 0x0
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 fa 9f                 lsr16i	r6, 0xf
 f2 28                 add	r6, r0
 fe 34                 mul16	r6, r4
 f4 4a                 stsp16	[sp+0x2], r6
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f4 22                 ldsp16	r6, [sp+0x8]
 fe 34                 mul16	r6, r4
 f4 62                 stsp16	[sp+0x8], r6
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f4 42                 stsp16	[sp+0x0], r6
 f1 74                 zext8	r4
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 04                    mov	r5, r4
 f1 75                 zext8	r5
 01                    mov	r4, r5
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 f3 12                 mulu8.w	r4, r6
 f4 58                 stsp16	[sp+0x6], r4
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 f3 3d                 mulsu8.w	r7, r5
 f4 53                 stsp16	[sp+0x4], r7
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 fa 78                 lsr16i	r4, 0x8
 0c                    mov	r7, r4
 f3 2e                 muls8.w	r7, r6
 f4 43                 stsp16	[sp+0x0], r7
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 f3 32                 mulsu8.w	r4, r6
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 08                    mov	r6, r4
 fa d8                 asr16i	r6, 0x8
 f4 00                 ldsp16	r4, [sp+0x0]
 18                    add	r6, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 fa b8                 asr16i	r4, 0x8
 12                    add	r4, r6
 f4 22                 ldsp16	r6, [sp+0x8]
 12                    add	r4, r6
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 06                    mov	r5, r6
 fa 48                 lsl16i	r5, 0x8
 f4 61                 stsp16	[sp+0x8], r5
 f4 69                 stsp16	[sp+0xa], r5
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 2b                 ldsp16	r7, [sp+0xa]
 1e                    add	r7, r6
 f4 6b                 stsp16	[sp+0xa], r7
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 22                 ldsp16	r6, [sp+0x8]
 36                    cmp	r5, r6
 f8 10                 cset.ult	r0
 f2 04                 add	r0, r4
 f4 0b                 ldsp16	r7, [sp+0x2]
 f2 07                 add	r0, r7
 f4 13                 ldsp16	r7, [sp+0x4]
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 13                    add	r4, r7
 fa 38                 lsl16i	r4, 0x8
 f4 1b                 ldsp16	r7, [sp+0x6]
 13                    add	r4, r7
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 38                    cmp	r6, r4
 f8 17                 cset.ult	r7
 f2 2c                 add	r7, r0
 0b                    mov	r6, r7
 af                    xor	r7, r7
 0e                    mov	r7, r6
 aa                    xor	r6, r6
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 a5                    xor	r5, r5
 92                    or	r4, r6
 97                    or	r5, r7
 d6 12                 adjsp	__avm_mulsi3+222
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
