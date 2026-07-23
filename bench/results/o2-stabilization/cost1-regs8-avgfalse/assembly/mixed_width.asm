
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
00000316 g     F .text	00000112 avm_test_main
00000428 g     F .text	00000002 avm_halt
0000042a g     F .text	000000ad __avm_mulsi3

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
 e1 12 01              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	_start+10
 f2 39                 sub	r1, r1
 f0 02 f0              ldi8	r2, 0xf0
 c4 60 f0              ldi16	r4, 0xf060
 c6 40 01              ldi16	r6, 0x140
 c7 80 01              ldi16	r7, 0x180
 c1 fb                 ldi8	r5, 0xfb
 f4 49                 stsp16	[sp+0x2], r5
 f1 25                 mov	r5, r1
 f4 51                 stsp16	[sp+0x4], r5
 f4 7b                 stsp16	[sp+0xe], r7
 f1 06                 mov	r0, r6
 c6 00 01              ldi16	r6, 0x100
 f2 29                 add	r6, r1
 f1 2e                 mov	r7, r2
 5b                    st8	[r6], r7
 c6 20 01              ldi16	r6, 0x120
 f2 29                 add	r6, r1
 59                    st8	[r6], r5
 f1 28                 mov	r6, r0
 f7 54                 st16	[r6+], r4
 07                    mov	r5, r7
 f4 0b                 ldsp16	r7, [sp+0x2]
 13                    add	r4, r7
 f4 60                 stsp16	[sp+0x8], r4
 f1 21                 mov	r4, r1
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f0 38 0a              stsp16	[sp+0xa], r0
 f0 39 0c              stsp16	[sp+0xc], r1
 f0 04 ec ff           ldi16	r0, 0xffec
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f0 33 0c              ldsp16	r3, [sp+0xc]
 f7 61                 add32	q0, q1
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 6b 0e              st32	[r7], q0
 f4 3b                 ldsp16	r7, [sp+0xe]
 f1 0c                 mov	r1, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 cb 04                 addi.s8	r7, 0x4
 f4 ad                 inc16	r5
 f1 15                 mov	r2, r5
 f4 11                 ldsp16	r5, [sp+0x4]
 c9 05                 addi.s8	r5, 0x5
 f4 a9                 inc16	r1
 f0 0d 20              cmpi.s8	r1, 0x20
 d1 aa                 brne8	avm_test_main+26
 a0                    xor	r4, r4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 d7 01                 sys	debug_break
 04                    mov	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 f0 05 40 01           ldi16	r1, 0x140
 f0 06 80 01           ldi16	r2, 0x180
 f2 30                 sub	r0, r0
 f0 3a 02              stsp16	[sp+0x2], r2
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 c4 00 01              ldi16	r4, 0x100
 f2 20                 add	r4, r0
 40                    ld8u	r4, [r4]
 c5 20 01              ldi16	r5, 0x120
 f2 24                 add	r5, r0
 45                    ld8u	r5, [r5]
 f4 79                 stsp16	[sp+0xe], r5
 f6 44                 sext8	r4
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 c6 01 01              ldi16	r6, 0x101
 af                    xor	r7, r7
 d5 72                 call8	__avm_mulsi3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 ed 92 20              ld16	r4, [r1+0]
 f4 60                 stsp16	[sp+0x8], r4
 f0 6c 53              ld16	r2, [r1+]
 f4 39                 ldsp16	r5, [sp+0xe]
 09                    mov	r6, r5
 af                    xor	r7, r7
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f7 6e                 add32	q3, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f7 6e                 add32	q3, q2
 f1 22                 mov	r4, r2
 a5                    xor	r5, r5
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f4 20                 ldsp16	r4, [sp+0x8]
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 f7 69                 add32	q2, q1
 f0 32 02              ldsp16	r2, [sp+0x2]
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 f0 6a c4              ld32	q3, [r2]
 f6 46                 sext8	r6
 0e                    mov	r7, r6
 fa ef                 asr16i	r7, 0xf
 f7 6e                 add32	q3, q2
 f0 6a 84              ld32	q2, [r2]
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 f7 6b                 add32	q2, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 0a 04              addi.s8	r2, 0x4
 f4 a8                 inc16	r0
 f0 0c 20              cmpi.s8	r0, 0x20
 d1 8c                 brne8	avm_test_main+130
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 10                 cmpi.s8	r4, 0x10
 db 74 ff              brne16	avm_test_main+118
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
 d6 ee                 adjsp	avm_test_main+262
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
