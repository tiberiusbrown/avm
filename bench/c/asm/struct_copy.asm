
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/struct_copy.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 struct_copy.c
00000100 l     O .data	000000c0 input_particles
000001c0 l     O .data	00000004 struct_result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 integer.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	000000e4 avm_test_main
000002fa g     F .text	00000002 avm_halt
000002fc g     F .text	000000c6 __avm_mulsi3

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
 e1 e4 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 f2 42                 sub	r2, r2
 f0 03 f4              ldi8	r3, 0xf4
 f0 00 05              ldi8	r0, 0x5
 f0 05 07 01           ldi16	r1, 0x107
 c4 03 02              ldi16	r4, 0x203
 c1 01                 ldi8	r5, 0x1
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 c0 5a                 ldi8	r4, 0x5a
 f4 60                 stsp16	[sp+0x8], r4
 f1 22                 mov	r4, r2
 a5                    xor	r5, r5
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 e1 bd 00              call16	__avm_mulsi3
 aa                    xor	r6, r6
 c3 01                 ldi8	r7, 0x1
 f7 6e                 add32	q3, q2
 f1 21                 mov	r4, r1
 c8 f9                 addi.s8	r4, -0x7
 f0 6b c8              st32	[r4], q3
 f1 23                 mov	r4, r3
 c8 0c                 addi.s8	r4, 0xc
 f4 21                 ldsp16	r5, [sp+0x8]
 a1                    xor	r4, r5
 ee 82 1f              st8	[r1-1], r4
 ee 62 20              st8	[r1+0], r3
 ee 12 1d              st16	[r1-3], r0
 f0 09 08              addi.s8	r1, 0x8
 f0 08 49              addi.s8	r0, 0x49
 f4 ab                 inc16	r3
 f4 aa                 inc16	r2
 f0 0e 18              cmpi.s8	r2, 0x18
 d1 cb                 brne8	avm_test_main+31
 a5                    xor	r5, r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 d7 01                 sys	debug_break
 f4 41                 stsp16	[sp+0x0], r5
 c0 18                 ldi8	r4, 0x18
 f0 06 07 01           ldi16	r2, 0x107
 f0 3a 0c              stsp16	[sp+0xc], r2
 f4 48                 stsp16	[sp+0x2], r4
 f4 30                 ldsp16	r4, [sp+0xc]
 44                    ld8u	r5, [r4]
 f6 45                 sext8	r5
 f4 30                 ldsp16	r4, [sp+0xc]
 ed 18 1d              ld16	r0, [r4-3]
 f2 24                 add	r5, r0
 f2 39                 sub	r1, r1
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f4 30                 ldsp16	r4, [sp+0xc]
 c8 f9                 addi.s8	r4, -0x7
 f0 6a 08              ld32	q0, [r4]
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f7 64                 add32	q1, q0
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f7 6c                 add32	q3, q0
 01                    mov	r4, r5
 a5                    xor	r5, r5
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 f4 32                 ldsp16	r6, [sp+0xc]
 ed cc 1f              ld8u	r6, [r6-1]
 f9 c2                 xor	r6, r0
 f1 06                 mov	r0, r6
 f2 39                 sub	r1, r1
 c2 ff                 ldi8	r6, 0xff
 af                    xor	r7, r7
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 f7 6e                 add32	q3, q2
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f4 08                 ldsp16	r4, [sp+0x2]
 f0 0a 08              addi.s8	r2, 0x8
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 98                 brne8	avm_test_main+97
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 10                 cmpi.s8	r4, 0x10
 d1 85                 brne8	avm_test_main+89
 c4 c0 01              ldi16	r4, 0x1c0
 f0 6b c8              st32	[r4], q3
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 10                 adjsp	0x10
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
