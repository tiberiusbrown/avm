
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/mixed_width.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 mixed_width.c
00000140 l     O .data	00000040 signed_words
00000180 l     O .data	00000080 wide_values
00000100 l     O .data	00000020 signed_bytes
00000120 l     O .data	00000020 unsigned_bytes
00000200 l     O .data	00000004 mixed_width_result
00000000 l    df *ABS*	00000000 integer.c
00000000 l    df *ABS*	00000000 runtime.c
00000300 g     F .text	00000016 _start
00000316 g     F .text	0000011e avm_test_main
000004e5 g     F .text	00000002 avm_halt
00000434 g     F .text	000000b1 __avm_mulsi3

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
 e1 cf 01              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	-0x12
 a5                    xor	r5, r5
 c2 f0                 ldi8	r6, 0xf0
 c7 60 f0              ldi16	r7, 0xf060
 f0 05 40 01           ldi16	r1, 0x140
 c4 80 01              ldi16	r4, 0x180
 f1 1d                 mov	r3, r5
 f4 79                 stsp16	[sp+0xe], r5
 f4 63                 stsp16	[sp+0x8], r7
 f0 04 00 01           ldi16	r0, 0x100
 f2 24                 add	r5, r0
 56                    st8	[r5], r6
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 06 20 01           ldi16	r2, 0x120
 f2 26                 add	r5, r2
 f0 3b 0c              stsp16	[sp+0xc], r3
 f3 07                 st8	[r5], r3
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 6d 53              st16	[r1+], r2
 f0 39 04              stsp16	[sp+0x4], r1
 c3 fb                 ldi8	r7, 0xfb
 f2 2e                 add	r7, r2
 f4 39                 ldsp16	r5, [sp+0xe]
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f0 06 ec ff           ldi16	r2, 0xffec
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f7 64                 add32	q1, q0
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 6b 48              st32	[r4], q1
 f0 31 04              ldsp16	r1, [sp+0x4]
 c8 04                 addi.s8	r4, 0x4
 f4 ae                 inc16	r6
 f0 33 0c              ldsp16	r3, [sp+0xc]
 f0 0b 05              addi.s8	r3, 0x5
 f4 ad                 inc16	r5
 cd 20                 cmpi.s8	r5, 0x20
 d1 a7                 brne8	avm_test_main+21
 a0                    xor	r4, r4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 d7 01                 sys	debug_break
 04                    mov	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 f0 05 80 01           ldi16	r1, 0x180
 f0 06 40 01           ldi16	r2, 0x140
 f1 1a                 mov	r3, r2
 f2 30                 sub	r0, r0
 f1 20                 mov	r4, r0
 c5 00 01              ldi16	r5, 0x100
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f1 24                 mov	r5, r0
 c6 20 01              ldi16	r6, 0x120
 16                    add	r5, r6
 45                    ld8u	r5, [r5]
 f4 71                 stsp16	[sp+0xc], r5
 f6 44                 sext8	r4
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 c6 01 01              ldi16	r6, 0x101
 af                    xor	r7, r7
 d5 7c                 call8	__avm_mulsi3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 ed 96 20              ld16	r4, [r3+0]
 f4 60                 stsp16	[sp+0x8], r4
 f0 6c 57              ld16	r2, [r3+]
 f0 3b 02              stsp16	[sp+0x2], r3
 f4 30                 ldsp16	r4, [sp+0xc]
 08                    mov	r6, r4
 af                    xor	r7, r7
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
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
 f0 33 02              ldsp16	r3, [sp+0x2]
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
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 09 04              addi.s8	r1, 0x4
 f4 a8                 inc16	r0
 f0 0c 20              cmpi.s8	r0, 0x20
 d1 8a                 brne8	avm_test_main+135
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 10                 cmpi.s8	r4, 0x10
 db 70 ff              brne16	avm_test_main+121
 c4 00 02              ldi16	r4, 0x200
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 f0 6b c8              st32	[r4], q3
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 12                 adjsp	0x12
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

<avm_halt>:
 d4 fe                 jmp8	avm_halt
