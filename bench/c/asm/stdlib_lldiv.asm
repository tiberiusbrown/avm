
stdlib_lldiv.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 stdlib_lldiv.c
00000143 l     O .data	00000040 denominators
00000100 l     O .data	00000003 call
00000103 l     O .data	00000040 numerators
00000183 l     O .data	00000008 result_sink
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 stdlib.c
00000000 l    df *ABS*	00000000 avm.c
00000000 l    df *ABS*	00000000 ctype.c
00000000 l    df *ABS*	00000000 strtof.c
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 integer.c
00000000 l    df *ABS*	00000000 wide_integer.c
00000719 l       .init_array	00000000 .hidden __init_array_end
00000719 l       .init_array	00000000 .hidden __init_array_start
00000719 l       .fini_array	00000000 .hidden __fini_array_start
00000719 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	000000e0 avm_test_main
000003aa g     F .text	00000065 __avm_terminate
00000347 g     F .text	00000002 avm_halt
00000349 g     F .text	00000061 lldiv
00000000  w      *UND*	00000000 __avm_run_local_dtors
0000040f g     F .text	0000030a __avm_divmoddi4

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d5 1b                 call8	avm_run_constructors
 d5 5d                 call8	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 e1 94 01              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 24 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 19 07              ldi16	r4, 0x719
 c1 00                 ldi8	r5, 0x0
 c6 19 07              ldi16	r6, 0x719
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 19 07           ldi16	r0, 0x719
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 19 07           ldi16	r2, 0x719
 f0 03 00              ldi8	r3, 0x0
<L0>:
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	-0x13 <L0>
<L1>:
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
 d6 e4                 adjsp	-0x1c
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 c7 47 01              ldi16	r7, 0x147
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f2 61                 mov32	q0, q1
<L0>:
 a0                    xor	r4, r4
 08                    mov	r6, r4
<L1>:
 f4 42                 stsp16	[sp+0x0], r6
 02                    mov	r4, r6
 13                    add	r4, r7
 f0 6a 88              ld32	q2, [r4]
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 c6 00 01              ldi16	r6, 0x100
 f7 34                 ld16	r4, [r6+]
 46                    ld8u	r5, [r6]
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 d6 f0                 adjsp	-0x10
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 c5 43 01              ldi16	r5, 0x143
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 c5 07 01              ldi16	r5, 0x107
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 c5 03 01              ldi16	r5, 0x103
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 14 1a              leasp	r4, 0x1a
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 eb                    callp	q3
 d6 10                 adjsp	0x10
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f7 68                 add32	q2, q0
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 f7 67                 add32	q1, q3
 f0 69 4c              cmp32	q1, q3
 c7 47 01              ldi16	r7, 0x147
 f8 16                 cset.ult	r6
 f1 06                 mov	r0, r6
 f2 39                 sub	r1, r1
 f7 62                 add32	q0, q2
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 f7 68                 add32	q2, q0
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f7 69                 add32	q2, q1
 f0 69 84              cmp32	q2, q1
 f8 16                 cset.ult	r6
 f1 06                 mov	r0, r6
 f2 39                 sub	r1, r1
 f4 02                 ldsp16	r6, [sp+0x0]
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
 f7 61                 add32	q0, q1
 ca 08                 addi.s8	r6, 0x8
 ce 40                 cmpi.s8	r6, 0x40
 f2 66                 mov32	q1, q2
 db 5e ff              brne16	-0xa2 <L1>
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f4 ae                 inc16	r6
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f1 76                 zext8	r6
 ce 10                 cmpi.s8	r6, 0x10
 f2 66                 mov32	q1, q2
 db 4b ff              brne16	-0xb5 <L0>
 c6 83 01              ldi16	r6, 0x183
 f0 6b 8c              st32	[r6], q2
 c4 87 01              ldi16	r4, 0x187
 f0 6b 08              st32	[r4], q0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 1c                 adjsp	0x1c
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<lldiv>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f1 04                 mov	r0, r4
 d6 f6                 adjsp	-0xa
 f0 14 0a              leasp	r4, 0xa
 f4 60                 stsp16	[sp+0x8], r4
 f0 34 29              ldsp16	r4, [sp+0x29]
 f0 35 2b              ldsp16	r5, [sp+0x2b]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 34 25              ldsp16	r4, [sp+0x25]
 f0 35 27              ldsp16	r5, [sp+0x27]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 1d              ldsp16	r4, [sp+0x1d]
 f0 35 1f              ldsp16	r5, [sp+0x1f]
 f0 36 21              ldsp16	r6, [sp+0x21]
 f0 37 23              ldsp16	r7, [sp+0x23]
 e1 94 00              call16	__avm_divmoddi4
 d6 0a                 adjsp	0xa
 f1 08                 mov	r1, r0
 f0 09 0c              addi.s8	r1, 0xc
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 6b 42              st32	[r1], q1
 f1 08                 mov	r1, r0
 f0 09 04              addi.s8	r1, 0x4
 f0 6b c2              st32	[r1], q3
 f0 6b 80              st32	[r0], q2
 f1 20                 mov	r4, r0
 c8 08                 addi.s8	r4, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 6b c8              st32	[r4], q3
 f1 20                 mov	r4, r0
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_terminate>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	0x3 <L0>
 e1 41 fc              call16	-959 <__avm_run_local_dtors>
<L0>:
 c4 19 07              ldi16	r4, 0x719
 c1 00                 ldi8	r5, 0x0
 c6 19 07              ldi16	r6, 0x719
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 19 07           ldi16	r2, 0x719
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 19 07           ldi16	r0, 0x719
 f0 01 00              ldi8	r1, 0x0
<L1>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	-0x13 <L1>
<L2>:
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	0x3 <L3>
 e1 f8 fb              call16	-1032 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_divmoddi4>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 c8                 adjsp	-0x38
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 f0 32 47              ldsp16	r2, [sp+0x47]
 f0 33 49              ldsp16	r3, [sp+0x49]
 f0 30 43              ldsp16	r0, [sp+0x43]
 f0 31 45              ldsp16	r1, [sp+0x45]
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 f0 3a 2c              stsp16	[sp+0x2c], r2
 f0 3b 2e              stsp16	[sp+0x2e], r3
 f9 09                 or	r0, r2
 f9 2d                 or	r1, r3
 f0 34 4b              ldsp16	r4, [sp+0x4b]
 f0 3c 22              stsp16	[sp+0x22], r4
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 d0 0f                 breq8	0xf <L0>
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 8c              cmp32	q2, q3
 d9 1d                 brsge8	0x1d <L1>
 f2 63                 mov32	q0, q3
 d4 57                 jmp8	0x57 <L2>
<L0>:
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 3a 1a              stsp16	[sp+0x1a], r2
 f0 3b 1c              stsp16	[sp+0x1c], r3
 f2 63                 mov32	q0, q3
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 e0 91 02              jmp16	657 <L14>
<L1>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 38 1a              stsp16	[sp+0x1a], r0
 f0 39 1c              stsp16	[sp+0x1c], r1
 f0 30 24              ldsp16	r0, [sp+0x24]
 f0 31 26              ldsp16	r1, [sp+0x26]
 f0 69 08              cmp32	q0, q2
 f2 62                 mov32	q0, q2
 f0 32 1a              ldsp16	r2, [sp+0x1a]
 f1 1a                 mov	r3, r2
 fb 42                 cmov.ne	r0, r2
 fb 4b                 cmov.ne	r1, r3
 f7 73                 sub32	q0, q3
 f0 32 24              ldsp16	r2, [sp+0x24]
 f0 33 26              ldsp16	r3, [sp+0x26]
 f7 79                 sub32	q2, q1
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
<L2>:
 0b                    mov	r6, r7
 af                    xor	r7, r7
 f0 3e 28              stsp16	[sp+0x28], r6
 f0 3f 2a              stsp16	[sp+0x2a], r7
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 f0 69 8c              cmp32	q2, q3
 d9 08                 brsge8	0x8 <L3>
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 d4 2d                 jmp8	0x2d <L4>
<L3>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f0 69 c8              cmp32	q3, q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 fb 72                 cmov.ne	r6, r2
 fb 7b                 cmov.ne	r7, r3
 f0 32 2c              ldsp16	r2, [sp+0x2c]
 f0 33 2e              ldsp16	r3, [sp+0x2e]
 f7 7d                 sub32	q3, q1
 f0 32 16              ldsp16	r2, [sp+0x16]
 f0 33 18              ldsp16	r3, [sp+0x18]
 f7 79                 sub32	q2, q1
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
<L4>:
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 3e 30              stsp16	[sp+0x30], r6
 f0 3f 32              stsp16	[sp+0x32], r7
 92                    or	r4, r6
 97                    or	r5, r7
 f0 69 84              cmp32	q2, q1
 d1 4f                 brne8	0x4f <L6>
 f0 38 0e              stsp16	[sp+0xe], r0
 f0 39 10              stsp16	[sp+0x10], r1
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 3a 1e              stsp16	[sp+0x1e], r2
 f0 3b 20              stsp16	[sp+0x20], r3
<L5>:
 f0 36 28              ldsp16	r6, [sp+0x28]
 fa 9f                 lsr16i	r6, 0xf
 f4 42                 stsp16	[sp+0x0], r6
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f0 3f 1c              stsp16	[sp+0x1c], r7
 f0 36 28              ldsp16	r6, [sp+0x28]
 fa 9f                 lsr16i	r6, 0xf
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 38                    cmp	r6, r4
 db 4d 01              brne16	0x14d <L11>
 f0 3a 1a              stsp16	[sp+0x1a], r2
 f0 3b 1c              stsp16	[sp+0x1c], r3
 f0 32 1e              ldsp16	r2, [sp+0x1e]
 f0 33 20              ldsp16	r3, [sp+0x20]
 e0 6f 01              jmp16	367 <L12>
<L6>:
 c2 40                 ldi8	r6, 0x40
 f2 69                 mov32	q2, q1
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 d4 4e                 jmp8	0x4e <L9>
<L7>:
 f7 79                 sub32	q2, q1
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f0 69 4c              cmp32	q1, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f7 7e                 sub32	q3, q2
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 f7 76                 sub32	q1, q2
 c0 01                 ldi8	r4, 0x1
 f9 81                 or	r4, r0
 f1 04                 mov	r0, r4
 f0 38 1e              stsp16	[sp+0x1e], r0
 f0 39 20              stsp16	[sp+0x20], r1
 f0 3a 12              stsp16	[sp+0x12], r2
 f0 3b 14              stsp16	[sp+0x14], r3
<L8>:
 f0 33 36              ldsp16	r3, [sp+0x36]
 f4 22                 ldsp16	r6, [sp+0x8]
 f1 16                 mov	r2, r6
 f0 31 1c              ldsp16	r1, [sp+0x1c]
 f4 12                 ldsp16	r6, [sp+0x4]
 f1 06                 mov	r0, r6
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 da 6c ff              breq16	-0x94 <L5>
<L9>:
 f0 38 1a              stsp16	[sp+0x1a], r0
 f0 39 1c              stsp16	[sp+0x1c], r1
 f4 72                 stsp16	[sp+0xc], r6
 f1 29                 mov	r6, r1
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 f7 60                 add32	q0, q0
 f9 c1                 or	r6, r0
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 37 20              ldsp16	r7, [sp+0x20]
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f7 65                 add32	q1, q1
 f0 3a 34              stsp16	[sp+0x34], r2
 f0 3b 36              stsp16	[sp+0x36], r3
 f9 c9                 or	r6, r2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 25                 mov	r5, r1
 f4 49                 stsp16	[sp+0x2], r5
 f0 32 24              ldsp16	r2, [sp+0x24]
 f0 33 26              ldsp16	r3, [sp+0x26]
 f1 23                 mov	r4, r3
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 f7 6f                 add32	q3, q3
 f1 0f                 mov	r1, r7
 f0 38 1a              stsp16	[sp+0x1a], r0
 f0 39 1c              stsp16	[sp+0x1c], r1
 92                    or	r4, r6
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 35 14              ldsp16	r5, [sp+0x14]
 09                    mov	r6, r5
 fa 9f                 lsr16i	r6, 0xf
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 f0 30 1e              ldsp16	r0, [sp+0x1e]
 f0 31 20              ldsp16	r1, [sp+0x20]
 f7 6a                 add32	q2, q2
 98                    or	r6, r4
 02                    mov	r4, r6
 f7 60                 add32	q0, q0
 f7 65                 add32	q1, q1
 f0 3a 24              stsp16	[sp+0x24], r2
 f0 3b 26              stsp16	[sp+0x26], r3
 f0 32 30              ldsp16	r2, [sp+0x30]
 f0 33 32              ldsp16	r3, [sp+0x32]
 de 2d ff              brslt16	-0xd3 <L7>
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 84              cmp32	q2, q1
 d8 14                 bruge8	0x14 <L10>
 f0 38 1e              stsp16	[sp+0x1e], r0
 f0 39 20              stsp16	[sp+0x20], r1
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 e0 47 ff              jmp16	-185 <L8>
<L10>:
 f0 69 84              cmp32	q2, q1
 db 0a ff              brne16	-0xf6 <L7>
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f0 69 4c              cmp32	q1, q3
 f0 32 30              ldsp16	r2, [sp+0x30]
 f0 33 32              ldsp16	r3, [sp+0x32]
 dd f2 fe              bruge16	-0x10e <L7>
 f0 38 1e              stsp16	[sp+0x1e], r0
 f0 39 20              stsp16	[sp+0x20], r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 3a 0e              stsp16	[sp+0xe], r2
 f0 3b 10              stsp16	[sp+0x10], r3
 e0 10 ff              jmp16	-240 <L8>
<L11>:
 f0 3a 34              stsp16	[sp+0x34], r2
 f0 3b 36              stsp16	[sp+0x36], r3
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f0 37 20              ldsp16	r7, [sp+0x20]
 f0 69 c4              cmp32	q3, q1
 f2 69                 mov32	q2, q1
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 f0 30 34              ldsp16	r0, [sp+0x34]
 f0 31 36              ldsp16	r1, [sp+0x36]
 f7 78                 sub32	q2, q0
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f7 77                 sub32	q1, q3
<L12>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 a4                 tst8	r4
 d1 0e                 brne8	0xe <L13>
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 d4 26                 jmp8	0x26 <L14>
<L13>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 f0 69 08              cmp32	q0, q2
 f2 62                 mov32	q0, q2
 fb 46                 cmov.ne	r0, r6
 fb 4f                 cmov.ne	r1, r7
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 f7 73                 sub32	q0, q3
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 f7 7b                 sub32	q2, q3
<L14>:
 f0 36 22              ldsp16	r6, [sp+0x22]
 f0 6b 8c              st32	[r6], q2
 ca 04                 addi.s8	r6, 0x4
 f0 6b 0c              st32	[r6], q0
 f2 69                 mov32	q2, q1
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 d6 38                 adjsp	0x38
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
