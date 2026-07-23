
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/fixed_point.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 fixed_point.c
00000100 l     O .data	00000100 bodies
00000200 l     O .data	00000002 fixed_point_result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 integer.c
00000300 g     F .text	00000016 _start
00000316 g     F .text	000000dc avm_test_main
000003f2 g     F .text	00000002 avm_halt
000003f4 g     F .text	000000ad __avm_mulsi3

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
 e1 dc 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	avm_test_main
 f2 39                 sub	r1, r1
 c1 80                 ldi8	r5, 0x80
 c6 38 ff              ldi16	r6, 0xff38
 c7 fd ff              ldi16	r7, 0xfffd
 f0 07 00 f0           ldi16	r3, 0xf000
 f0 04 04 01           ldi16	r0, 0x104
 c4 00 01              ldi16	r4, 0x100
 f4 50                 stsp16	[sp+0x4], r4
 f1 13                 mov	r2, r3
 f4 10                 ldsp16	r4, [sp+0x4]
 f2 14                 add	r2, r4
 ee 70 1c              st16	[r0-4], r3
 f0 03 07              ldi8	r3, 0x7
 f1 21                 mov	r4, r1
 ec 63                 urem16	r4, r3
 f2 51                 sub	r4, r1
 13                    add	r4, r7
 ee 90 20              st16	[r0+0], r4
 ee b0 22              st16	[r0+2], r5
 ee d0 1e              st16	[r0-2], r6
 f0 08 08              addi.s8	r0, 0x8
 f4 af                 inc16	r7
 c9 05                 addi.s8	r5, 0x5
 f4 a9                 inc16	r1
 ca 11                 addi.s8	r6, 0x11
 c4 58 01              ldi16	r4, 0x158
 38                    cmp	r6, r4
 f1 1a                 mov	r3, r2
 d1 d3                 brne8	avm_test_main+31
 a5                    xor	r5, r5
 d7 01                 sys	debug_break
 f1 0d                 mov	r1, r5
 d4 0b                 jmp8	avm_test_main+94
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 40                 cmpi.s8	r4, 0x40
 d0 70                 breq8	avm_test_main+206
 f4 41                 stsp16	[sp+0x0], r5
 c0 20                 ldi8	r4, 0x20
 f0 07 04 01           ldi16	r3, 0x104
 d4 19                 jmp8	avm_test_main+129
 c6 00 80              ldi16	r6, 0x8000
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c8              cmp32	q3, q2
 fd 34                 cmov.slt	r6, r4
 fd 3d                 cmov.slt	r7, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f2 0e                 add	r1, r6
 f9 22                 xor	r1, r0
 f4 b4                 dec16	r4
 f4 a4                 tst8	r4
 d0 d2                 breq8	avm_test_main+83
 f4 50                 stsp16	[sp+0x4], r4
 ed 96 1e              ld16	r4, [r3-2]
 ed 16 20              ld16	r0, [r3+0]
 f2 04                 add	r0, r4
 ed 56 1c              ld16	r2, [r3-4]
 f2 10                 add	r2, r0
 ed 96 22              ld16	r4, [r3+2]
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 f1 2a                 mov	r6, r2
 f1 2e                 mov	r7, r2
 fa ef                 asr16i	r7, 0xf
 d5 40                 call8	__avm_mulsi3
 c2 80                 ldi8	r6, 0x80
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 48                 stsp16	[sp+0x2], r4
 03                    mov	r4, r7
 a5                    xor	r5, r5
 08                    mov	r6, r4
 fa 58                 lsl16i	r6, 0x8
 f4 0b                 ldsp16	r7, [sp+0x2]
 9b                    or	r6, r7
 ee 56 1c              st16	[r3-4], r2
 af                    xor	r7, r7
 fa b8                 asr16i	r4, 0x8
 04                    mov	r5, r4
 a0                    xor	r4, r4
 92                    or	r4, r6
 97                    or	r5, r7
 ee 16 1e              st16	[r3-2], r0
 f0 0b 08              addi.s8	r3, 0x8
 c6 ff 7f              ldi16	r6, 0x7fff
 af                    xor	r7, r7
 f0 69 c8              cmp32	q3, q2
 d9 9f                 brsge8	avm_test_main+104
 c6 ff 7f              ldi16	r6, 0x7fff
 d4 a7                 jmp8	avm_test_main+117
 f0 59 00 02           stm16	[0x200], r1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 06                 adjsp	avm_halt+1
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
 d6 ee                 adjsp	avm_test_main+208
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
 d6 12                 adjsp	__avm_mulsi3+188
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
