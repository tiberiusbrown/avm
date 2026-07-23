
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/mixed_width.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 mixed_width.c
00000180 l     O .data	00000080 wide_values
00000140 l     O .data	00000040 signed_words
00000120 l     O .data	00000020 unsigned_bytes
00000100 l     O .data	00000020 signed_bytes
00000200 l     O .data	00000004 mixed_width_result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 integer.c
00000300 g     F .text	00000016 _start
00000316 g     F .text	00000118 avm_test_main
0000042e g     F .text	00000002 avm_halt
00000430 g     F .text	000000ad __avm_mulsi3

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
 e1 18 01              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	_start+10
 c5 80 01              ldi16	r5, 0x180
 c4 40 01              ldi16	r4, 0x140
 c6 20 01              ldi16	r6, 0x120
 c7 00 01              ldi16	r7, 0x100
 f0 06 60 f0           ldi16	r2, 0xf060
 f0 00 f0              ldi8	r0, 0xf0
 f2 39                 sub	r1, r1
 f1 1a                 mov	r3, r2
 f6 18                 st8	[r7+], r0
 f4 6b                 stsp16	[sp+0xa], r7
 f6 11                 st8	[r6+], r1
 f4 72                 stsp16	[sp+0xc], r6
 f7 43                 st16	[r4+], r3
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 02 fb              ldi8	r2, 0xfb
 f2 13                 add	r2, r3
 f1 18                 mov	r3, r0
 f0 0b 10              addi.s8	r3, 0x10
 f1 2b                 mov	r6, r3
 af                    xor	r7, r7
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 c2 ff                 ldi8	r6, 0xff
 af                    xor	r7, r7
 f1 20                 mov	r4, r0
 f1 19                 mov	r3, r1
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 f1 0b                 mov	r1, r3
 f1 04                 mov	r0, r4
 f1 1d                 mov	r3, r5
 c4 ec ff              ldi16	r4, 0xffec
 c5 ff ff              ldi16	r5, 0xffff
 f7 6b                 add32	q2, q3
 f4 2b                 ldsp16	r7, [sp+0xa]
 f4 32                 ldsp16	r6, [sp+0xc]
 f0 6b 86              st32	[r3], q2
 f1 27                 mov	r5, r3
 f0 09 05              addi.s8	r1, 0x5
 c9 04                 addi.s8	r5, 0x4
 f4 a8                 inc16	r0
 f1 20                 mov	r4, r0
 f1 74                 zext8	r4
 cc 10                 cmpi.s8	r4, 0x10
 f0 34 10              ldsp16	r4, [sp+0x10]
 d1 a6                 brne8	avm_test_main+27
 a5                    xor	r5, r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 d7 01                 sys	debug_break
 f4 41                 stsp16	[sp+0x0], r5
 f0 05 80 01           ldi16	r1, 0x180
 f0 04 40 01           ldi16	r0, 0x140
 c4 20 01              ldi16	r4, 0x120
 f0 3c 10              stsp16	[sp+0x10], r4
 c5 00 01              ldi16	r5, 0x100
 c0 20                 ldi8	r4, 0x20
 f4 48                 stsp16	[sp+0x2], r4
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f7 0c                 ld8u	r4, [r5+]
 f4 69                 stsp16	[sp+0xa], r5
 f6 44                 sext8	r4
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 c6 01 01              ldi16	r6, 0x101
 af                    xor	r7, r7
 d5 76                 call8	__avm_mulsi3
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 f7 06                 ld8u	r6, [r4+]
 f0 3c 10              stsp16	[sp+0x10], r4
 ed 90 20              ld16	r4, [r0+0]
 f4 50                 stsp16	[sp+0x4], r4
 f0 6c 51              ld16	r2, [r0+]
 af                    xor	r7, r7
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f7 6e                 add32	q3, q2
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f7 6e                 add32	q3, q2
 f1 22                 mov	r4, r2
 a5                    xor	r5, r5
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f7 69                 add32	q2, q1
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 f0 6a c2              ld32	q3, [r1]
 f6 46                 sext8	r6
 0e                    mov	r7, r6
 fa ef                 asr16i	r7, 0xf
 f7 6e                 add32	q3, q2
 f0 6a 82              ld32	q2, [r1]
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 f7 6b                 add32	q2, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 09 04              addi.s8	r1, 0x4
 f4 b4                 dec16	r4
 f4 a4                 tst8	r4
 d1 93                 brne8	avm_test_main+143
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 10                 cmpi.s8	r4, 0x10
 db 72 ff              brne16	avm_test_main+122
 c4 00 02              ldi16	r4, 0x200
 f0 6b c8              st32	[r4], q3
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 12                 adjsp	__avm_mulsi3+11
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
 d6 ee                 adjsp	avm_test_main+268
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
