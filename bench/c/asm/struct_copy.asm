
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/struct_copy.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 struct_copy.c
00000100 l     O .data	000000c0 input_particles
000001c0 l     O .data	00000004 struct_result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 integer.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	000000cb avm_test_main
000002e1 g     F .text	00000002 avm_halt
000002e3 g     F .text	000000cf __avm_mulsi3

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
 e1 cb 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	_start+20
 f0 00 00              ldi8	r0, 0x0
 f0 01 f4              ldi8	r1, 0xf4
 f0 02 05              ldi8	r2, 0x5
 f0 07 07 01           ldi16	r3, 0x107
 c0 5a                 ldi8	r4, 0x5a
 f4 50                 stsp16	[sp+0x4], r4
 f1 21                 mov	r4, r1
 c8 0c                 addi.s8	r4, 0xc
 f4 11                 ldsp16	r5, [sp+0x4]
 a1                    xor	r4, r5
 f1 27                 mov	r5, r3
 f4 b5                 dec16	r5
 54                    st8	[r5], r4
 f1 20                 mov	r4, r0
 a5                    xor	r5, r5
 c6 03 02              ldi16	r6, 0x203
 c3 01                 ldi8	r7, 0x1
 e1 9f 00              call16	__avm_mulsi3
 aa                    xor	r6, r6
 c3 01                 ldi8	r7, 0x1
 f7 6e                 add32	q3, q2
 f1 23                 mov	r4, r3
 c8 f9                 addi.s8	r4, -0x7
 f0 6b c8              st32	[r4], q3
 f1 23                 mov	r4, r3
 c8 fd                 addi.s8	r4, -0x3
 f5 52                 st16	[r4], r2
 f0 6d 26              st8	[r3], r1
 f0 0b 08              addi.s8	r3, 0x8
 f0 0a 49              addi.s8	r2, 0x49
 f4 a9                 inc16	r1
 f4 a8                 inc16	r0
 f0 0c 18              cmpi.s8	r0, 0x18
 d1 c5                 brne8	avm_test_main+23
 a5                    xor	r5, r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 d7 01                 sys	debug_break
 f4 41                 stsp16	[sp+0x0], r5
 f0 07 07 01           ldi16	r3, 0x107
 c0 18                 ldi8	r4, 0x18
 f4 48                 stsp16	[sp+0x2], r4
 f0 6c 46              ld8u	r2, [r3]
 f6 42                 sext8	r2
 f1 03                 mov	r0, r3
 f0 08 fd              addi.s8	r0, -0x3
 f0 6c 90              ld16	r4, [r0]
 f2 14                 add	r2, r4
 f1 0b                 mov	r1, r3
 f0 09 f9              addi.s8	r1, -0x7
 f0 6a 02              ld32	q0, [r1]
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 a5                    xor	r5, r5
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f7 68                 add32	q2, q0
 f2 62                 mov32	q0, q2
 f7 6c                 add32	q3, q0
 f1 22                 mov	r4, r2
 a5                    xor	r5, r5
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 f1 2b                 mov	r6, r3
 f4 b6                 dec16	r6
 4a                    ld8u	r6, [r6]
 f9 c2                 xor	r6, r0
 f1 06                 mov	r0, r6
 f0 01 00              ldi8	r1, 0x0
 c2 ff                 ldi8	r6, 0xff
 af                    xor	r7, r7
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 f7 6e                 add32	q3, q2
 f4 08                 ldsp16	r4, [sp+0x2]
 f0 0b 08              addi.s8	r3, 0x8
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 af                 brne8	avm_test_main+95
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 10                 cmpi.s8	r4, 0x10
 d1 9c                 brne8	avm_test_main+87
 c4 c0 01              ldi16	r4, 0x1c0
 f0 6b c8              st32	[r4], q3
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 08                 adjsp	__avm_mulsi3+1
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
 d6 ee                 adjsp	avm_test_main+191
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
