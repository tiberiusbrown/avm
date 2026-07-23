
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
000002fc g     F .text	000000ad __avm_mulsi3

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
 e1 e4 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	_start+14
 f2 30                 sub	r0, r0
 f0 05 07 01           ldi16	r1, 0x107
 c1 05                 ldi8	r5, 0x5
 f0 02 ff              ldi8	r2, 0xff
 f2 4b                 sub	r3, r3
 c6 03 02              ldi16	r6, 0x203
 c3 01                 ldi8	r7, 0x1
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f4 71                 stsp16	[sp+0xc], r5
 f1 20                 mov	r4, r0
 a5                    xor	r5, r5
 f9 88                 and	r4, r2
 f9 ac                 and	r5, r3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 e1 ba 00              call16	__avm_mulsi3
 aa                    xor	r6, r6
 c3 01                 ldi8	r7, 0x1
 f7 6e                 add32	q3, q2
 f4 31                 ldsp16	r5, [sp+0xc]
 f1 21                 mov	r4, r1
 c8 f9                 addi.s8	r4, -0x7
 f0 6b c8              st32	[r4], q3
 f1 20                 mov	r4, r0
 c8 f4                 addi.s8	r4, -0xc
 ee 82 20              st8	[r1+0], r4
 c0 5a                 ldi8	r4, 0x5a
 f9 82                 xor	r4, r0
 ee 82 1f              st8	[r1-1], r4
 ee b2 1d              st16	[r1-3], r5
 c9 49                 addi.s8	r5, 0x49
 f0 09 08              addi.s8	r1, 0x8
 f4 a8                 inc16	r0
 f1 20                 mov	r4, r0
 f1 74                 zext8	r4
 cc 18                 cmpi.s8	r4, 0x18
 d1 c2                 brne8	avm_test_main+28
 a5                    xor	r5, r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 d7 01                 sys	debug_break
 f4 41                 stsp16	[sp+0x0], r5
 c4 07 01              ldi16	r4, 0x107
 c1 18                 ldi8	r5, 0x18
 f4 49                 stsp16	[sp+0x2], r5
 f4 70                 stsp16	[sp+0xc], r4
 f5 30                 ld8u	r0, [r4]
 f6 40                 sext8	r0
 f4 30                 ldsp16	r4, [sp+0xc]
 ed 38 1d              ld16	r1, [r4-3]
 f2 01                 add	r0, r1
 f1 11                 mov	r2, r1
 f2 4b                 sub	r3, r3
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 31 0c              ldsp16	r1, [sp+0xc]
 f0 09 f9              addi.s8	r1, -0x7
 f0 6a 82              ld32	q2, [r1]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 69                 add32	q2, q1
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f7 6d                 add32	q3, q1
 f2 39                 sub	r1, r1
 f9 1a                 xor	r0, r6
 f9 3e                 xor	r1, r7
 f4 30                 ldsp16	r4, [sp+0xc]
 ed c8 1f              ld8u	r6, [r4-1]
 f9 ca                 xor	r6, r2
 f0 02 ff              ldi8	r2, 0xff
 f2 4b                 sub	r3, r3
 af                    xor	r7, r7
 f9 c8                 and	r6, r2
 f9 ec                 and	r7, r3
 f7 6c                 add32	q3, q0
 f4 30                 ldsp16	r4, [sp+0xc]
 c8 08                 addi.s8	r4, 0x8
 f4 b5                 dec16	r5
 f4 a5                 tst8	r5
 d1 9d                 brne8	avm_test_main+102
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 10                 cmpi.s8	r4, 0x10
 d1 8b                 brne8	avm_test_main+95
 c4 c0 01              ldi16	r4, 0x1c0
 f0 6b c8              st32	[r4], q3
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0e                 adjsp	__avm_mulsi3+7
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
 d6 ee                 adjsp	avm_test_main+216
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
