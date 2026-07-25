
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/fixed_point.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 fixed_point.c
00000100 l     O .data	00000100 bodies
00000200 l     O .data	00000002 fixed_point_result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 integer.c
00000300 g     F .text	00000016 _start
00000316 g     F .text	000000de avm_test_main
000003f4 g     F .text	00000002 avm_halt
000003f6 g     F .text	000000c6 __avm_mulsi3

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
 e1 de 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f2 42                 sub	r2, r2
 f0 00 80              ldi8	r0, 0x80
 c6 38 ff              ldi16	r6, 0xff38
 f0 05 fd ff           ldi16	r1, 0xfffd
 c5 00 f0              ldi16	r5, 0xf000
 c7 04 01              ldi16	r7, 0x104
 c4 00 01              ldi16	r4, 0x100
 f4 58                 stsp16	[sp+0x6], r4
 f0 03 07              ldi8	r3, 0x7
 ee be 1c              st16	[r7-4], r5
 f4 18                 ldsp16	r4, [sp+0x6]
 14                    add	r5, r4
 f1 22                 mov	r4, r2
 ec 63                 urem16	r4, r3
 f2 52                 sub	r4, r2
 f2 21                 add	r4, r1
 7c                    st16	[r7], r4
 ee 1e 22              st16	[r7+2], r0
 ee de 1e              st16	[r7-2], r6
 cb 08                 addi.s8	r7, 0x8
 f4 a9                 inc16	r1
 f0 08 05              addi.s8	r0, 0x5
 f4 aa                 inc16	r2
 ca 11                 addi.s8	r6, 0x11
 c4 58 01              ldi16	r4, 0x158
 38                    cmp	r6, r4
 d1 da                 brne8	avm_test_main+32
 a5                    xor	r5, r5
 d7 01                 sys	debug_break
 f1 0d                 mov	r1, r5
 d4 0b                 jmp8	avm_test_main+88
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 40                 cmpi.s8	r4, 0x40
 d0 78                 breq8	avm_test_main+208
 f4 41                 stsp16	[sp+0x0], r5
 c2 20                 ldi8	r6, 0x20
 f0 07 04 01           ldi16	r3, 0x104
 d4 1c                 jmp8	avm_test_main+126
 c4 00 80              ldi16	r4, 0x8000
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 8c              cmp32	q2, q3
 fd 26                 cmov.slt	r4, r6
 fd 2f                 cmov.slt	r5, r7
 f4 1a                 ldsp16	r6, [sp+0x6]
 f0 0b 08              addi.s8	r3, 0x8
 f2 0c                 add	r1, r4
 f9 22                 xor	r1, r0
 f4 b6                 dec16	r6
 f4 a6                 tst8	r6
 d0 cf                 breq8	avm_test_main+77
 f4 5a                 stsp16	[sp+0x6], r6
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
 d5 45                 call8	__avm_mulsi3
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
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 fa b8                 asr16i	r4, 0x8
 0c                    mov	r7, r4
 aa                    xor	r6, r6
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 98                    or	r6, r4
 9d                    or	r7, r5
 ee 16 1e              st16	[r3-2], r0
 c4 ff 7f              ldi16	r4, 0x7fff
 a5                    xor	r5, r5
 f0 69 8c              cmp32	q2, q3
 d9 97                 brsge8	avm_test_main+98
 c4 ff 7f              ldi16	r4, 0x7fff
 d4 9f                 jmp8	avm_test_main+111
 f0 59 00 02           stm16	[0x200], r1
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

<__avm_mulsi3>:
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	-0x12
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 fa 7f                 lsr16i	r4, 0xf
 f2 20                 add	r4, r0
 f4 58                 stsp16	[sp+0x6], r4
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f1 07                 mov	r0, r7
 f2 39                 sub	r1, r1
 02                    mov	r4, r6
 fa 7f                 lsr16i	r4, 0xf
 f2 20                 add	r4, r0
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 fe 26                 mul16	r4, r6
 f4 40                 stsp16	[sp+0x0], r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 1a                 ldsp16	r6, [sp+0x6]
 fe 34                 mul16	r6, r4
 f4 5a                 stsp16	[sp+0x6], r6
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f4 4a                 stsp16	[sp+0x2], r6
 f1 74                 zext8	r4
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 38                 ldsp16	r4, [sp+0xe]
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f3 18                 mulu8.w	r6, r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 3b                 mulsu8.w	r6, r7
 f4 72                 stsp16	[sp+0xc], r6
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 fa 78                 lsr16i	r4, 0x8
 0c                    mov	r7, r4
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 2e                 muls8.w	r7, r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f3 32                 mulsu8.w	r4, r6
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 08                    mov	r6, r4
 fa d8                 asr16i	r6, 0x8
 f4 0b                 ldsp16	r7, [sp+0x2]
 1b                    add	r6, r7
 f4 30                 ldsp16	r4, [sp+0xc]
 fa b8                 asr16i	r4, 0x8
 12                    add	r4, r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 12                    add	r4, r6
 f4 58                 stsp16	[sp+0x6], r4
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 18                    add	r6, r4
 f4 72                 stsp16	[sp+0xc], r6
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 fa 38                 lsl16i	r4, 0x8
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 04                    mov	r5, r4
 f4 61                 stsp16	[sp+0x8], r5
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 23                 ldsp16	r7, [sp+0x8]
 1e                    add	r7, r6
 f4 63                 stsp16	[sp+0x8], r7
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 38                    cmp	r6, r4
 f8 17                 cset.ult	r7
 f4 18                 ldsp16	r4, [sp+0x6]
 1c                    add	r7, r4
 f4 01                 ldsp16	r5, [sp+0x0]
 1d                    add	r7, r5
 f4 31                 ldsp16	r5, [sp+0xc]
 fa 48                 lsl16i	r5, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 16                    add	r5, r6
 f4 71                 stsp16	[sp+0xc], r5
 f4 22                 ldsp16	r6, [sp+0x8]
 36                    cmp	r5, r6
 f8 15                 cset.ult	r5
 17                    add	r5, r7
 0d                    mov	r7, r5
 aa                    xor	r6, r6
 f4 30                 ldsp16	r4, [sp+0xc]
 a5                    xor	r5, r5
 92                    or	r4, r6
 97                    or	r5, r7
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
