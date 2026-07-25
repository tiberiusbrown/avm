
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
00000316 g     F .text	0000012f avm_test_main
00000445 g     F .text	00000002 avm_halt
00000447 g     F .text	000000c6 __avm_mulsi3

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
 e1 2f 01              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ea                 adjsp	-0x16
 f2 30                 sub	r0, r0
 f0 01 f0              ldi8	r1, 0xf0
 c5 60 f0              ldi16	r5, 0xf060
 f0 06 40 01           ldi16	r2, 0x140
 c4 80 01              ldi16	r4, 0x180
 c7 00 01              ldi16	r7, 0x100
 f4 53                 stsp16	[sp+0x4], r7
 f1 2c                 mov	r7, r0
 f4 63                 stsp16	[sp+0x8], r7
 f0 39 0c              stsp16	[sp+0xc], r1
 f4 79                 stsp16	[sp+0xe], r5
 f1 24                 mov	r5, r0
 f4 12                 ldsp16	r6, [sp+0x4]
 16                    add	r5, r6
 f3 05                 st8	[r5], r1
 f0 07 20 01           ldi16	r3, 0x120
 f1 24                 mov	r5, r0
 f0 3b 02              stsp16	[sp+0x2], r3
 f2 27                 add	r5, r3
 57                    st8	[r5], r7
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f0 6d 75              st16	[r2+], r3
 f0 3a 12              stsp16	[sp+0x12], r2
 c1 fb                 ldi8	r5, 0xfb
 f2 27                 add	r5, r3
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 06 ec ff           ldi16	r2, 0xffec
 f0 07 ff ff           ldi16	r3, 0xffff
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 f7 67                 add32	q1, q3
 f0 6b 48              st32	[r4], q1
 f4 23                 ldsp16	r7, [sp+0x8]
 f0 31 0c              ldsp16	r1, [sp+0xc]
 f0 32 12              ldsp16	r2, [sp+0x12]
 c8 04                 addi.s8	r4, 0x4
 f4 a9                 inc16	r1
 cb 05                 addi.s8	r7, 0x5
 f4 a8                 inc16	r0
 f0 0c 20              cmpi.s8	r0, 0x20
 d1 aa                 brne8	avm_test_main+28
 a0                    xor	r4, r4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 d7 01                 sys	debug_break
 04                    mov	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 f0 05 40 01           ldi16	r1, 0x140
 f0 06 80 01           ldi16	r2, 0x180
 f2 30                 sub	r0, r0
 f0 3a 06              stsp16	[sp+0x6], r2
 f4 11                 ldsp16	r5, [sp+0x4]
 f1 20                 mov	r4, r0
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f1 24                 mov	r5, r0
 f4 0a                 ldsp16	r6, [sp+0x2]
 16                    add	r5, r6
 45                    ld8u	r5, [r5]
 f4 79                 stsp16	[sp+0xe], r5
 f6 44                 sext8	r4
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 c6 01 01              ldi16	r6, 0x101
 af                    xor	r7, r7
 e1 8a 00              call16	__avm_mulsi3
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 ed 92 20              ld16	r4, [r1+0]
 f4 70                 stsp16	[sp+0xc], r4
 f0 6c 53              ld16	r2, [r1+]
 f4 38                 ldsp16	r4, [sp+0xe]
 08                    mov	r6, r4
 af                    xor	r7, r7
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f7 6e                 add32	q3, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 6e                 add32	q3, q2
 f1 22                 mov	r4, r2
 a5                    xor	r5, r5
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f4 30                 ldsp16	r4, [sp+0xc]
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 32 12              ldsp16	r2, [sp+0x12]
 f0 33 14              ldsp16	r3, [sp+0x14]
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f7 69                 add32	q2, q1
 f0 32 06              ldsp16	r2, [sp+0x6]
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
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 0a 04              addi.s8	r2, 0x4
 f4 a8                 inc16	r0
 f0 0c 20              cmpi.s8	r0, 0x20
 db 7d ff              brne16	avm_test_main+138
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 10                 cmpi.s8	r4, 0x10
 db 65 ff              brne16	avm_test_main+126
 c4 00 02              ldi16	r4, 0x200
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 f0 6b c8              st32	[r4], q3
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 16                 adjsp	0x16
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
