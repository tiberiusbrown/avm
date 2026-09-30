
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/wide_mul.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 wide_mul.c
00000100 l     O .data	00000020 factors
00000120 l     O .data	00000008 result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 wide_integer.c
00000000 l    df *ABS*	00000000 integer.c
000005cf l       .init_array	00000000 .hidden __init_array_end
000005cf l       .init_array	00000000 .hidden __init_array_start
000005cf l       .fini_array	00000000 .hidden __fini_array_start
000005cf l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000193 avm_test_main
0000046a g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
0000046c g     F .text	000000b2 __avm_muldi3
0000051e g     F .text	000000b1 __avm_mulsi3

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 d1 00              call16	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 d5 57                 call8	avm_run_destructors
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 4c 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 cf 05              ldi16	r4, 0x5cf
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 cf 05              ldi16	r6, 0x5cf
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 cf 05           ldi16	r0, 0x5cf
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 cf 05           ldi16	r2, 0x5cf
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	avm_run_constructors+48
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_run_destructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+23
 e1 81 fd              call16	-639
 c4 cf 05              ldi16	r4, 0x5cf
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 cf 05              ldi16	r6, 0x5cf
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 cf 05           ldi16	r2, 0x5cf
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 cf 05           ldi16	r0, 0x5cf
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	avm_run_destructors+68
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+104
 e1 30 fd              call16	-720
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e6                 adjsp	-0x1a
 c4 78 56              ldi16	r4, 0x5678
 c5 34 12              ldi16	r5, 0x1234
 c6 04 01              ldi16	r6, 0x104
 f0 6b 8c              st32	[r6], q2
 c4 f0 de              ldi16	r4, 0xdef0
 c5 bc 9a              ldi16	r5, 0x9abc
 c6 00 01              ldi16	r6, 0x100
 f0 6b 8c              st32	[r6], q2
 c4 98 ba              ldi16	r4, 0xba98
 c5 dc fe              ldi16	r5, 0xfedc
 c6 0c 01              ldi16	r6, 0x10c
 f0 6b 8c              st32	[r6], q2
 c4 11 32              ldi16	r4, 0x3211
 c5 54 76              ldi16	r5, 0x7654
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 c0 01                 ldi8	r4, 0x1
 c1 01                 ldi8	r5, 0x1
 c6 14 01              ldi16	r6, 0x114
 f0 6b 8c              st32	[r6], q2
 c6 10 01              ldi16	r6, 0x110
 f0 6b 8c              st32	[r6], q2
 c0 01                 ldi8	r4, 0x1
 c5 00 80              ldi16	r5, 0x8000
 c6 1c 01              ldi16	r6, 0x11c
 f0 6b 8c              st32	[r6], q2
 c4 ff ff              ldi16	r4, 0xffff
 a5                    xor	r5, r5
 c6 18 01              ldi16	r6, 0x118
 f0 6b 8c              st32	[r6], q2
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 c0 04                 ldi8	r4, 0x4
 d7 01                 sys	debug_break
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f0 3c 14              stsp16	[sp+0x14], r4
 d6 f8                 adjsp	-0x8
 c4 04 01              ldi16	r4, 0x104
 f0 6a 88              ld32	q2, [r4]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c4 00 01              ldi16	r4, 0x100
 f0 6a 88              ld32	q2, [r4]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c4 08 01              ldi16	r4, 0x108
 f1 0c                 mov	r1, r4
 f0 6a 82              ld32	q2, [r1]
 c6 0c 01              ldi16	r6, 0x10c
 f1 06                 mov	r0, r6
 f0 6a c0              ld32	q3, [r0]
 e1 fd 00              call16	__avm_muldi3
 d6 08                 adjsp	0x8
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 d6 f8                 adjsp	-0x8
 f0 6a 80              ld32	q2, [r0]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 6a 82              ld32	q2, [r1]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c4 10 01              ldi16	r4, 0x110
 f1 0c                 mov	r1, r4
 f0 6a 82              ld32	q2, [r1]
 c6 14 01              ldi16	r6, 0x114
 f1 06                 mov	r0, r6
 f0 6a c0              ld32	q3, [r0]
 e1 ce 00              call16	__avm_muldi3
 d6 08                 adjsp	0x8
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 d6 f8                 adjsp	-0x8
 f0 6a 80              ld32	q2, [r0]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 6a 82              ld32	q2, [r1]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c4 18 01              ldi16	r4, 0x118
 f0 6a 88              ld32	q2, [r4]
 c6 1c 01              ldi16	r6, 0x11c
 f1 06                 mov	r0, r6
 f0 6a c0              ld32	q3, [r0]
 e1 a3 00              call16	__avm_muldi3
 d6 08                 adjsp	0x8
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 d6 f8                 adjsp	-0x8
 f0 6a 00              ld32	q0, [r0]
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 c4 18 01              ldi16	r4, 0x118
 f0 6a 08              ld32	q0, [r4]
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f0 35 20              ldsp16	r5, [sp+0x20]
 f9 8a                 xor	r4, r2
 f9 ae                 xor	r5, r3
 f0 32 14              ldsp16	r2, [sp+0x14]
 f0 33 16              ldsp16	r3, [sp+0x16]
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 f9 42                 xor	r2, r0
 f9 66                 xor	r3, r1
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f9 42                 xor	r2, r0
 f9 66                 xor	r3, r1
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
 f9 5a                 xor	r2, r6
 f9 7e                 xor	r3, r7
 f2 61                 mov32	q0, q1
 c4 00 01              ldi16	r4, 0x100
 f0 6a 88              ld32	q2, [r4]
 c6 04 01              ldi16	r6, 0x104
 f0 6a cc              ld32	q3, [r6]
 d5 34                 call8	__avm_muldi3
 d6 08                 adjsp	0x8
 f2 66                 mov32	q1, q2
 f0 34 14              ldsp16	r4, [sp+0x14]
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 30 16              ldsp16	r0, [sp+0x16]
 f0 31 18              ldsp16	r1, [sp+0x18]
 f9 42                 xor	r2, r0
 f9 66                 xor	r3, r1
 f4 b4                 dec16	r4
 f4 a4                 tst8	r4
 db e9 fe              brne16	avm_test_main+102
 c4 20 01              ldi16	r4, 0x120
 f0 6b 48              st32	[r4], q1
 c4 24 01              ldi16	r4, 0x124
 f0 6b c8              st32	[r4], q3
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 1a                 adjsp	0x1a
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<__avm_muldi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d6                 adjsp	-0x2a
 f0 30 35              ldsp16	r0, [sp+0x35]
 f0 31 37              ldsp16	r1, [sp+0x37]
 f0 32 39              ldsp16	r2, [sp+0x39]
 f0 33 3b              ldsp16	r3, [sp+0x3b]
 f0 3e 26              stsp16	[sp+0x26], r6
 f0 3f 28              stsp16	[sp+0x28], r7
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3d 24              stsp16	[sp+0x24], r5
 f0 3a 1e              stsp16	[sp+0x1e], r2
 f0 3b 20              stsp16	[sp+0x20], r3
 f0 38 1a              stsp16	[sp+0x1a], r0
 f0 39 1c              stsp16	[sp+0x1c], r1
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 a0                    xor	r4, r4
 f0 00 04              ldi8	r0, 0x4
 f0 12 12              leasp	r2, 0x12
 f4 40                 stsp16	[sp+0x0], r4
 10                    add	r4, r4
 f0 15 22              leasp	r5, 0x22
 14                    add	r5, r4
 f0 11 1a              leasp	r1, 0x1a
 61                    ld16	r4, [r5]
 a5                    xor	r5, r5
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 38 04              stsp16	[sp+0x4], r0
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 6c 93              ld16	r4, [r1+]
 a5                    xor	r5, r5
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 d5 4c                 call8	__avm_mulsi3
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 ed d4 20              ld16	r6, [r2+0]
 af                    xor	r7, r7
 f1 22                 mov	r4, r2
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 f7 6d                 add32	q3, q1
 f1 14                 mov	r2, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f7 6e                 add32	q3, q2
 02                    mov	r4, r6
 f0 6d 95              st16	[r2+], r4
 03                    mov	r4, r7
 a5                    xor	r5, r5
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d1 cb                 brne8	__avm_muldi3+87
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 0a 02              addi.s8	r2, 0x2
 f0 30 04              ldsp16	r0, [sp+0x4]
 f4 b0                 dec16	r0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 ac                 inc16	r4
 cc 04                 cmpi.s8	r4, 0x4
 d1 a0                 brne8	__avm_muldi3+63
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 d6 2a                 adjsp	0x2a
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
