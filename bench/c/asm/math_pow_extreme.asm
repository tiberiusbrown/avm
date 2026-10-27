
math_pow_extreme.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 math_pow_extreme.c
00000180 l     O .data	00000080 results
00000100 l     O .data	00000080 inputs
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 ef_pow.c
000007e6 l     F .text	0000095f avm_pow_boundary
00001145 l       .init_array	00000000 .hidden __init_array_end
00001145 l       .init_array	00000000 .hidden __init_array_start
00001145 l       .fini_array	00000000 .hidden __fini_array_start
00001145 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	0000003e avm_test_main
000002a7 g     F .text	00000065 __avm_terminate
000002a5 g     F .text	00000002 avm_halt
0000030c g     F .text	000004da powf
00000000  w      *UND*	00000000 __avm_run_local_dtors

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
 e1 91 00              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 82 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 45 11              ldi16	r4, 0x1145
 c1 00                 ldi8	r5, 0x0
 c6 45 11              ldi16	r6, 0x1145
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 45 11           ldi16	r0, 0x1145
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 45 11           ldi16	r2, 0x1145
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
 f2 30                 sub	r0, r0
 f0 05 80 01           ldi16	r1, 0x180
 d7 01                 sys	debug_break
 f0 02 78              ldi8	r2, 0x78
 f0 07 00 01           ldi16	r3, 0x100
<L0>:
 f1 20                 mov	r4, r0
 10                    add	r4, r4
 10                    add	r4, r4
 10                    add	r4, r4
 f9 88                 and	r4, r2
 08                    mov	r6, r4
 c5 04 01              ldi16	r5, 0x104
 19                    add	r6, r5
 f2 23                 add	r4, r3
 f0 6a 88              ld32	q2, [r4]
 f0 6a cc              ld32	q3, [r6]
 d5 7c                 call8	powf
 f0 6b 82              st32	[r1], q2
 f0 09 04              addi.s8	r1, 0x4
 f4 a8                 inc16	r0
 f0 0c 20              cmpi.s8	r0, 0x20
 d1 dd                 brne8	-0x23 <L0>
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

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
 e1 44 fd              call16	-700 <__avm_run_local_dtors>
<L0>:
 c4 45 11              ldi16	r4, 0x1145
 c1 00                 ldi8	r5, 0x0
 c6 45 11              ldi16	r6, 0x1145
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 45 11           ldi16	r2, 0x1145
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 45 11           ldi16	r0, 0x1145
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
 e1 fb fc              call16	-773 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<powf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e0                 adjsp	-0x20
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 f2 66                 mov32	q1, q2
 ff 09                 fabs	q1
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d0 54                 breq8	0x54 <L0>
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 0c              cmp32	q0, q3
 f8 14                 cset.ult	r4
 f4 60                 stsp16	[sp+0x8], r4
 f0 69 04              cmp32	q0, q1
 d2 64                 brult8	0x64 <L2>
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 c0 01                 ldi8	r4, 0x1
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 c8              cmp32	q3, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 d8 54                 bruge8	0x54 <L2>
 f0 69 80              cmp32	q2, q0
 db 8b 00              brne16	0x8b <L7>
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f0 69 4c              cmp32	q1, q3
 d0 3d                 breq8	0x3d <L1>
 f2 61                 mov32	q0, q1
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 84              cmp32	q2, q1
 f8 24                 cset.slt	r4
 f0 69 c0              cmp32	q3, q0
 f8 16                 cset.ult	r6
 38                    cmp	r6, r4
 d0 62                 breq8	0x62 <L6>
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 d4 5a                 jmp8	0x5a <L6>
<L0>:
 c2 01                 ldi8	r6, 0x1
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 4c              cmp32	q1, q3
 d2 14                 brult8	0x14 <L1>
 f2 30                 sub	r0, r0
 f0 01 40              ldi8	r1, 0x40
 f9 34                 and	r1, r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 d1 06                 brne8	0x6 <L1>
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 d4 38                 jmp8	0x38 <L4>
<L1>:
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 d4 34                 jmp8	0x34 <L6>
<L2>:
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 69 84              cmp32	q2, q1
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 d1 19                 brne8	0x19 <L3>
 c6 ff ff              ldi16	r6, 0xffff
 f4 23                 ldsp16	r7, [sp+0x8]
 ae                    xor	r7, r6
 f4 63                 stsp16	[sp+0x8], r7
 c3 40                 ldi8	r7, 0x40
 f9 e4                 and	r7, r1
 0b                    mov	r6, r7
 fa 96                 lsr16i	r6, 0x6
 f4 23                 ldsp16	r7, [sp+0x8]
 9b                    or	r6, r7
 c3 01                 ldi8	r7, 0x1
 8e                    and	r7, r6
 f4 a7                 tst8	r7
 d1 06                 brne8	0x6 <L6>
<L3>:
 f2 6a                 mov32	q3, q0
<L4>:
 ff 00                 fadd
<L5>:
 f2 66                 mov32	q1, q2
<L6>:
 f2 69                 mov32	q2, q1
 d6 20                 adjsp	0x20
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L7>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 7f 3f              ldi16	r5, 0x3f7f
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 8c              cmp32	q2, q3
 d3 21                 brslt8	0x21 <L8>
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 f0 69 c8              cmp32	q3, q2
 d0 52                 breq8	0x52 <L10>
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 f0 69 c8              cmp32	q3, q2
 d1 2b                 brne8	0x2b <L9>
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 69 8c              cmp32	q2, q3
 d3 5a                 brslt8	0x5a <L13>
 ff 17                 fsqrt
 d4 c5                 jmp8	-0x3b <L5>
<L8>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f0 69 c8              cmp32	q3, q2
 d0 3e                 breq8	0x3e <L11>
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 f0 69 c8              cmp32	q3, q2
 d1 0a                 brne8	0xa <L9>
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 d4 a9                 jmp8	-0x57 <L5>
<L9>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 69 8c              cmp32	q2, q3
 d9 25                 brsge8	0x25 <L12>
 c3 01                 ldi8	r7, 0x1
 f4 63                 stsp16	[sp+0x8], r7
 f0 69 40              cmp32	q1, q0
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 da d5 00              breq16	0xd5 <L20>
 e0 cd 00              jmp16	205 <L19>
<L10>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 03                 fdiv
 e0 7e ff              jmp16	-130 <L5>
<L11>:
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 e0 77 ff              jmp16	-137 <L6>
<L12>:
 03                    mov	r4, r7
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 d4 02                 jmp8	0x2 <L14>
<L13>:
 c0 01                 ldi8	r4, 0x1
<L14>:
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 c6 ff ff              ldi16	r6, 0xffff
 c7 7f 4b              ldi16	r7, 0x4b7f
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 69 c8              cmp32	q3, q2
 d8 11                 bruge8	0x11 <L15>
 c0 01                 ldi8	r4, 0x1
 f4 60                 stsp16	[sp+0x8], r4
 c3 01                 ldi8	r7, 0x1
 f0 69 40              cmp32	q1, q0
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 da 91 00              breq16	0x91 <L20>
 e0 89 00              jmp16	137 <L19>
<L15>:
 c2 01                 ldi8	r6, 0x1
 f4 62                 stsp16	[sp+0x8], r6
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f0 69 8c              cmp32	q2, q3
 d2 45                 brult8	0x45 <L16>
 09                    mov	r6, r5
 0e                    mov	r7, r6
 fa a7                 lsr16i	r7, 0x7
 c1 86                 ldi8	r5, 0x86
 37                    cmp	r5, r7
 d2 46                 brult8	0x46 <L17>
 f0 3f 14              stsp16	[sp+0x14], r7
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 af                    xor	r7, r7
 f6 2c                 tst16	r4
 0b                    mov	r6, r7
 d1 55                 brne8	0x55 <L18>
 f0 34 14              ldsp16	r4, [sp+0x14]
 24                    sub	r5, r4
 f0 3d 14              stsp16	[sp+0x14], r5
 c1 7f                 ldi8	r5, 0x7f
 f4 22                 ldsp16	r6, [sp+0x8]
 86                    and	r5, r6
 c0 80                 ldi8	r4, 0x80
 91                    or	r4, r5
 c5 ff ff              ldi16	r5, 0xffff
 09                    mov	r6, r5
 f0 37 14              ldsp16	r7, [sp+0x14]
 fa 0b                 shl16v	r6, r7
 a9                    xor	r6, r5
 f4 60                 stsp16	[sp+0x8], r4
 88                    and	r6, r4
 af                    xor	r7, r7
 f4 a6                 tst8	r6
 f0 34 14              ldsp16	r4, [sp+0x14]
 0b                    mov	r6, r7
 d1 30                 brne8	0x30 <L18>
 f4 21                 ldsp16	r5, [sp+0x8]
 fa 14                 lsr16v	r5, r4
 c3 01                 ldi8	r7, 0x1
 87                    and	r5, r7
 09                    mov	r6, r5
 d4 26                 jmp8	0x26 <L18>
<L16>:
 af                    xor	r7, r7
 f0 69 40              cmp32	q1, q0
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d0 34                 breq8	0x34 <L20>
 d4 2d                 jmp8	0x2d <L19>
<L17>:
 c1 96                 ldi8	r5, 0x96
 27                    sub	r5, r7
 c7 ff ff              ldi16	r7, 0xffff
 0b                    mov	r6, r7
 fa 09                 shl16v	r6, r5
 ab                    xor	r6, r7
 88                    and	r6, r4
 af                    xor	r7, r7
 f6 2e                 tst16	r6
 0b                    mov	r6, r7
 d1 0b                 brne8	0xb <L18>
 0d                    mov	r7, r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 08                    mov	r6, r4
 fa 1b                 lsr16v	r6, r7
 c3 01                 ldi8	r7, 0x1
 8b                    and	r6, r7
<L18>:
 f0 34 10              ldsp16	r4, [sp+0x10]
 88                    and	r6, r4
 f4 a6                 tst8	r6
 f8 04                 cset.eq	r4
 f4 60                 stsp16	[sp+0x8], r4
 f0 69 40              cmp32	q1, q0
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d0 05                 breq8	0x5 <L20>
<L19>:
 f0 69 48              cmp32	q1, q2
 d1 26                 brne8	0x26 <L21>
<L20>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6b                 mov32	q3, q1
 ff 03                 fdiv
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f0 69 0c              cmp32	q0, q3
 fd 14                 cmov.slt	r2, r4
 fd 1d                 cmov.slt	r3, r5
 f2 69                 mov32	q2, q1
 ff 05                 fneg	q1
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 a6                 tst8	r6
 fb 54                 cmov.ne	r2, r4
 fb 5d                 cmov.ne	r3, r5
 e0 95 fe              jmp16	-363 <L6>
<L21>:
 f4 a7                 tst8	r7
 d0 1c                 breq8	0x1c <L22>
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f0 69 48              cmp32	q1, q2
 d1 22                 brne8	0x22 <L23>
 c4 80 bf              ldi16	r4, 0xbf80
 c5 80 3f              ldi16	r5, 0x3f80
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 a6                 tst8	r6
 fb 65                 cmov.ne	r4, r5
 f1 1c                 mov	r3, r4
 f2 42                 sub	r2, r2
 e0 75 fe              jmp16	-395 <L6>
<L22>:
 c4 c0 7f              ldi16	r4, 0x7fc0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 93                    or	r4, r7
 f1 16                 mov	r2, r6
 f1 1c                 mov	r3, r4
 e0 66 fe              jmp16	-410 <L6>
<L23>:
 a0                    xor	r4, r4
 c5 90 c0              ldi16	r5, 0xc090
 f7 69                 add32	q2, q1
 aa                    xor	r6, r6
 c3 20                 ldi8	r7, 0x20
 f0 69 c8              cmp32	q3, q2
 d2 42                 brult8	0x42 <L24>
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 16 07 25 49 12 3e ab aa 2a be cd cc 4c 3e 00 00 80 be ab aa aa 3e 00 00 00 bf 00 00 80 3f  fpoly	7, 0.142857149, -0.166666672, 0.200000003, -0.25, 0.333333343, -0.5, 1.0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 c6 3b aa              ldi16	r6, 0xaa3b
 c7 b8 3f              ldi16	r7, 0x3fb8
 e0 d0 00              jmp16	208 <L29>
<L24>:
 c6 ff ff              ldi16	r6, 0xffff
 c3 7f                 ldi8	r7, 0x7f
 f0 69 c4              cmp32	q3, q1
 d2 16                 brult8	0x16 <L25>
 f2 63                 mov32	q0, q3
 aa                    xor	r6, r6
 c7 00 4c              ldi16	r7, 0x4c00
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 f2 62                 mov32	q0, q2
 c4 68 ff              ldi16	r4, 0xff68
 f0 3c 10              stsp16	[sp+0x10], r4
 d4 08                 jmp8	0x8 <L26>
<L25>:
 c4 81 ff              ldi16	r4, 0xff81
 f0 3c 10              stsp16	[sp+0x10], r4
 f2 61                 mov32	q0, q1
<L26>:
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 f0 04 20 fb           ldi16	r0, 0xfb20
 f0 01 4a              ldi8	r1, 0x4a
 f7 63                 add32	q0, q3
 c0 80                 ldi8	r4, 0x80
 f9 84                 and	r4, r1
 9c                    or	r7, r4
 02                    mov	r4, r6
 07                    mov	r5, r7
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 c7 80 bf              ldi16	r7, 0xbf80
 ff 00                 fadd
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 35 16              ldsp16	r5, [sp+0x16]
 09                    mov	r6, r5
 fa 97                 lsr16i	r6, 0x7
 f0 34 10              ldsp16	r4, [sp+0x10]
 18                    add	r6, r4
 f1 21                 mov	r4, r1
 fa 77                 lsr16i	r4, 0x7
 12                    add	r4, r6
 ff 0c                 s16tof
 f2 62                 mov32	q0, q2
 c0 01                 ldi8	r4, 0x1
 c5 00 41              ldi16	r5, 0x4100
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 69 c8              cmp32	q3, q2
 d2 29                 brult8	0x29 <L27>
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 16 08 23 54 19 be 0a 5e 71 3e 47 48 7e be 78 e0 92 3e 74 74 b8 be 9c 3c f6 3e 8e aa 38 bf 3a aa b8 3f      fpoly	8, -0.149735019, 0.235710293, -0.248322591, 0.286868811, -0.360263467, 0.480931163, -0.721352458, 1.4426949
 d4 23                 jmp8	0x23 <L28>
<L27>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 16 07 a7 65 34 3e a3 bd 8a be 49 17 97 3e 10 e7 b7 be 96 17 f6 3e 8e ab 38 bf 46 aa b8 3f  fpoly	7, 0.176169023, -0.270978063, 0.295099527, -0.359184742, 0.480648696, -0.721367717, 1.44269633
<L28>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
<L29>:
 ff 02                 fmul
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 c4 00 04              ldi16	r4, 0x400
 c5 00 bd              ldi16	r5, 0xbd00
 f7 68                 add32	q2, q0
 c6 01 06              ldi16	r6, 0x601
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d2 79                 brult8	0x79 <L31>
 c4 00 02              ldi16	r4, 0x200
 c5 ea bc              ldi16	r5, 0xbcea
 f7 62                 add32	q0, q2
 c4 00 04              ldi16	r4, 0x400
 a5                    xor	r5, r5
 f0 69 80              cmp32	q2, q0
 d8 68                 bruge8	0x68 <L31>
<L30>:
 f4 19                 ldsp16	r5, [sp+0x6]
 01                    mov	r4, r5
 c5 ff 42              ldi16	r5, 0x42ff
 34                    cmp	r5, r4
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 30 08              ldsp16	r0, [sp+0x8]
 de f6 00              brslt16	0xf6 <L35>
 c5 15 c3              ldi16	r5, 0xc315
 34                    cmp	r5, r4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 dc ed 00              brult16	0xed <L35>
 f1 10                 mov	r2, r0
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f2 68                 mov32	q2, q0
 ff 14                 fcmp
 c4 00 3f              ldi16	r4, 0x3f00
 c5 00 bf              ldi16	r5, 0xbf00
 ce ff                 cmpi.s8	r6, -0x1
 fb 25                 cmov.eq	r4, r5
 0c                    mov	r7, r4
 aa                    xor	r6, r6
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 ff 0e                 ftos16
 f4 40                 stsp16	[sp+0x0], r4
 ff 0c                 s16tof
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 01                 fsub
 f4 03                 ldsp16	r7, [sp+0x0]
 ff 16 05 66 01 1d 3c 23 fe 64 3d bc 01 76 3e 96 70 31 3f 00 00 80 3f  fpoly	5, 0.00958285294, 0.0559064262, 0.240240991, 0.693124175, 1.0
 cf 83                 cmpi.s8	r7, -0x7d
 de 8f 00              brslt16	0x8f <L33>
 fa 67                 lsl16i	r7, 0x7
 aa                    xor	r6, r6
 f7 6e                 add32	q3, q2
 e0 9d 00              jmp16	157 <L34>
<L31>:
 d6 f8                 adjsp	-0x8
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f0 14 20              leasp	r4, 0x20
 f2 6b                 mov32	q3, q1
 e1 9b 00              call16	avm_pow_boundary
 d6 08                 adjsp	0x8
 aa                    xor	r6, r6
 c7 00 43              ldi16	r7, 0x4300
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 ff 14                 fcmp
 f6 2e                 tst16	r6
 d1 2f                 brne8	0x2f <L32>
 c6 3b aa              ldi16	r6, 0xaa3b
 c7 38 b3              ldi16	r7, 0xb338
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 ff 14                 fcmp
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 7f 7f           ldi16	r1, 0x7f7f
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 ce 02                 cmpi.s8	r6, 0x2
 fc 04                 cmov.ult	r0, r4
 fc 0d                 cmov.ult	r1, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 f2 64                 mov32	q1, q0
 ff 05                 fneg	q1
 f4 a5                 tst8	r5
 fb 50                 cmov.ne	r2, r0
 fb 59                 cmov.ne	r3, r1
 e0 51 fc              jmp16	-943 <L6>
<L32>:
 aa                    xor	r6, r6
 c7 16 c3              ldi16	r7, 0xc316
 ff 14                 fcmp
 f6 2e                 tst16	r6
 f0 30 08              ldsp16	r0, [sp+0x8]
 d1 46                 brne8	0x46 <L36>
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 f1 24                 mov	r5, r0
 f8 04                 cset.eq	r4
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f2 64                 mov32	q1, q0
 ff 05                 fneg	q1
 f4 a5                 tst8	r5
 fb 50                 cmov.ne	r2, r0
 fb 59                 cmov.ne	r3, r1
 e0 23 fc              jmp16	-989 <L6>
<L33>:
 fa 67                 lsl16i	r7, 0x7
 c6 00 32              ldi16	r6, 0x3200
 1b                    add	r6, r7
 f1 0e                 mov	r1, r6
 f2 30                 sub	r0, r0
 f7 62                 add32	q0, q2
 aa                    xor	r6, r6
 c7 80 0d              ldi16	r7, 0xd80
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
<L34>:
 f1 02                 mov	r0, r2
<L35>:
 f2 67                 mov32	q1, q3
 ff 05                 fneg	q1
 f4 a0                 tst8	r0
 fb 56                 cmov.ne	r2, r6
 fb 5f                 cmov.ne	r3, r7
 e0 fe fb              jmp16	-1026 <L6>
<L36>:
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 e0 e5 fe              jmp16	-283 <L30>

<avm_pow_boundary>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 be                 adjsp	-0x42
 f0 3c 40              stsp16	[sp+0x40], r4
 f0 34 51              ldsp16	r4, [sp+0x51]
 f0 35 53              ldsp16	r5, [sp+0x53]
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 01 7f              ldi8	r1, 0x7f
 f0 34 4d              ldsp16	r4, [sp+0x4d]
 f0 35 4f              ldsp16	r5, [sp+0x4f]
 f2 66                 mov32	q1, q2
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 f2 30                 sub	r0, r0
 f0 01 80              ldi8	r1, 0x80
 f0 69 80              cmp32	q2, q0
 dc e7 00              brult16	0xe7 <L0>
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 40              cmp32	q1, q0
 db dd 00              brne16	0xdd <L0>
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 c8 81                 addi.s8	r4, -0x7f
 ff 0c                 s16tof
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 64                 mov32	q1, q0
 f2 30                 sub	r0, r0
 f0 05 00 80           ldi16	r1, 0x8000
 f9 34                 and	r1, r5
 af                    xor	r7, r7
 c6 00 80              ldi16	r6, 0x8000
 f0 69 04              cmp32	q0, q1
 fb 7e                 cmov.ne	r7, r6
 f4 43                 stsp16	[sp+0x0], r7
 f0 06 00 f0           ldi16	r2, 0xf000
 f0 07 ff ff           ldi16	r3, 0xffff
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f9 c8                 and	r6, r2
 f9 ec                 and	r7, r3
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 30 28              ldsp16	r0, [sp+0x28]
 f0 31 2a              ldsp16	r1, [sp+0x2a]
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f2 68                 mov32	q2, q0
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 02                 fmul
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f0 32 28              ldsp16	r2, [sp+0x28]
 f0 33 2a              ldsp16	r3, [sp+0x2a]
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 0c                    mov	r7, r4
 aa                    xor	r6, r6
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 00                 fadd
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f0 32 40              ldsp16	r2, [sp+0x40]
 f0 6b 84              st32	[r2], q2
 f0 36 28              ldsp16	r6, [sp+0x28]
 f0 37 2a              ldsp16	r7, [sp+0x2a]
 e0 30 08              jmp16	2096 <L3>
<L0>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 01 7f              ldi8	r1, 0x7f
 f0 69 08              cmp32	q0, q2
 d2 1d                 brult8	0x1d <L1>
 f2 42                 sub	r2, r2
 f0 07 00 4c           ldi16	r3, 0x4c00
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 c6 68 ff              ldi16	r6, 0xff68
 f0 3e 10              stsp16	[sp+0x10], r6
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 09                    mov	r6, r5
 fa 97                 lsr16i	r6, 0x7
 f2 64                 mov32	q1, q0
 d4 0a                 jmp8	0xa <L2>
<L1>:
 c6 81 ff              ldi16	r6, 0xff81
 f0 3e 10              stsp16	[sp+0x10], r6
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
<L2>:
 c4 20 fb              ldi16	r4, 0xfb20
 c1 4a                 ldi8	r5, 0x4a
 f7 69                 add32	q2, q1
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 c0 80                 ldi8	r4, 0x80
 81                    and	r4, r5
 f9 71                 or	r3, r4
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 12                    add	r4, r6
 f0 3c 10              stsp16	[sp+0x10], r4
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f0 3a 24              stsp16	[sp+0x24], r2
 f0 3b 26              stsp16	[sp+0x26], r3
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 ff 01                 fsub
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f4 29                 ldsp16	r5, [sp+0xa]
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 f0 35 10              ldsp16	r5, [sp+0x10]
 11                    add	r4, r5
 f0 3c 3c              stsp16	[sp+0x3c], r4
 f0 3d 3e              stsp16	[sp+0x3e], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f0 06 00 f0           ldi16	r2, 0xf000
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f9 08                 and	r0, r2
 f9 2c                 and	r1, r3
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 ff 03                 fdiv
 f2 62                 mov32	q0, q2
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f9 88                 and	r4, r2
 f9 ac                 and	r5, r3
 f2 66                 mov32	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f2 6b                 mov32	q3, q1
 f2 61                 mov32	q0, q1
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 ff 02                 fmul
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 01                 fsub
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 01                 fsub
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f2 62                 mov32	q0, q2
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f0 38 20              stsp16	[sp+0x20], r0
 f0 39 22              stsp16	[sp+0x22], r1
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f2 68                 mov32	q2, q0
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 03                 fdiv
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 ff 16 06 f1 f0 70 3d 89 88 88 3d d9 89 9d 3d 8c 2e ba 3d 39 8e e3 3d 25 49 12 3e      fpoly	6, 0.0588235296, 0.0666666701, 0.0769230798, 0.0909090936, 0.111111112, 0.142857149
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f0 04 cd cc           ldi16	r0, 0xcccd
 f0 05 4c be           ldi16	r1, 0xbe4c
 c6 cd cc              ldi16	r6, 0xcccd
 c7 4c 3e              ldi16	r7, 0x3e4c
 ff 00                 fadd
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 37 26              ldsp16	r7, [sp+0x26]
 ff 01                 fsub
 c6 cd cc              ldi16	r6, 0xcccd
 c7 4c 3e              ldi16	r7, 0x3e4c
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 c6 cd cc              ldi16	r6, 0xcccd
 c7 4c b1              ldi16	r7, 0xb14c
 ff 00                 fadd
 f0 3c 30              stsp16	[sp+0x30], r4
 f0 3d 32              stsp16	[sp+0x32], r5
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f2 64                 mov32	q1, q0
 c4 00 f0              ldi16	r4, 0xf000
 c5 ff ff              ldi16	r5, 0xffff
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 3b 1e              stsp16	[sp+0x1e], r3
 ff 01                 fsub
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f2 69                 mov32	q2, q1
 ff 01                 fsub
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 3d 2e              stsp16	[sp+0x2e], r5
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f0 3a 34              stsp16	[sp+0x34], r2
 f0 3b 36              stsp16	[sp+0x36], r3
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 30 24              ldsp16	r0, [sp+0x24]
 f0 31 26              ldsp16	r1, [sp+0x26]
 f2 68                 mov32	q2, q0
 f0 32 30              ldsp16	r2, [sp+0x30]
 f0 33 32              ldsp16	r3, [sp+0x32]
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 f2 63                 mov32	q0, q3
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 f0 3c 38              stsp16	[sp+0x38], r4
 f0 3d 3a              stsp16	[sp+0x3a], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 02                 fmul
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 ff 00                 fadd
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 f0 38 20              stsp16	[sp+0x20], r0
 f0 39 22              stsp16	[sp+0x22], r1
 f2 64                 mov32	q1, q0
 c4 00 f0              ldi16	r4, 0xf000
 c5 ff ff              ldi16	r5, 0xffff
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f0 3c 30              stsp16	[sp+0x30], r4
 f0 3d 32              stsp16	[sp+0x32], r5
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 ff 02                 fmul
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 3d 2e              stsp16	[sp+0x2e], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f2 68                 mov32	q2, q0
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 ff 02                 fmul
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 01                 fsub
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 ff 00                 fadd
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 ff 00                 fadd
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f2 68                 mov32	q2, q0
 f0 36 38              ldsp16	r6, [sp+0x38]
 f0 37 3a              ldsp16	r7, [sp+0x3a]
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f0 34 34              ldsp16	r4, [sp+0x34]
 f0 35 36              ldsp16	r5, [sp+0x36]
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 3d 36              stsp16	[sp+0x36], r5
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 37 26              ldsp16	r7, [sp+0x26]
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 36 30              ldsp16	r6, [sp+0x30]
 f0 37 32              ldsp16	r7, [sp+0x32]
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 01                 fsub
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f2 69                 mov32	q2, q1
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 34              ldsp16	r4, [sp+0x34]
 f0 35 36              ldsp16	r5, [sp+0x36]
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f0 04 ab aa           ldi16	r0, 0xaaab
 f0 05 aa be           ldi16	r1, 0xbeaa
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 c6 ab aa              ldi16	r6, 0xaaab
 c7 aa 3e              ldi16	r7, 0x3eaa
 ff 00                 fadd
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 01                 fsub
 c6 ab aa              ldi16	r6, 0xaaab
 c7 aa 3e              ldi16	r7, 0x3eaa
 ff 00                 fadd
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 37 26              ldsp16	r7, [sp+0x26]
 ff 00                 fadd
 c6 ab aa              ldi16	r6, 0xaaab
 c7 2a b2              ldi16	r7, 0xb22a
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 ff 01                 fsub
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 3f 26              stsp16	[sp+0x26], r7
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 c4 00 f0              ldi16	r4, 0xf000
 c5 ff ff              ldi16	r5, 0xffff
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 c4 00 f0              ldi16	r4, 0xf000
 c5 ff ff              ldi16	r5, 0xffff
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 02                 fmul
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 01                 fsub
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 ff 00                 fadd
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 ff 00                 fadd
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f2 69                 mov32	q2, q1
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 02                 fmul
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 01                 fsub
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 ff 00                 fadd
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f2 62                 mov32	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 ff 01                 fsub
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 01                 fsub
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f2 61                 mov32	q0, q1
 c4 00 f0              ldi16	r4, 0xf000
 c5 ff ff              ldi16	r5, 0xffff
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f2 69                 mov32	q2, q1
 c6 3b aa              ldi16	r6, 0xaa3b
 c7 38 40              ldi16	r7, 0x4038
 ff 02                 fmul
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f2 68                 mov32	q2, q0
 c6 00 a0              ldi16	r6, 0xa000
 ff 02                 fmul
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 01                 fsub
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 68                 mov32	q2, q0
 c6 00 b0              ldi16	r6, 0xb000
 c7 23 3a              ldi16	r7, 0x3a23
 ff 02                 fmul
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 00                 fadd
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f2 62                 mov32	q0, q2
 c6 00 a0              ldi16	r6, 0xa000
 c7 38 40              ldi16	r7, 0x4038
 ff 02                 fmul
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 00                 fadd
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 68                 mov32	q2, q0
 c6 00 b0              ldi16	r6, 0xb000
 c7 23 3a              ldi16	r7, 0x3a23
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 c6 60 70              ldi16	r6, 0x7060
 c7 25 33              ldi16	r7, 0x3325
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 69                 mov32	q2, q1
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 c6 3b aa              ldi16	r6, 0xaa3b
 c7 38 40              ldi16	r7, 0x4038
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 00                 fadd
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 ff 0c                 s16tof
 f2 62                 mov32	q0, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 ff 00                 fadd
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 01                 fsub
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 01                 fsub
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 32 28              ldsp16	r2, [sp+0x28]
 f0 33 2a              ldsp16	r3, [sp+0x2a]
 f0 04 00 f0           ldi16	r0, 0xf000
 f0 05 ff ff           ldi16	r1, 0xffff
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 00                 fadd
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 02                 fmul
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 01                 fsub
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 00                 fadd
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f2 62                 mov32	q0, q2
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 00                 fadd
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f2 69                 mov32	q2, q1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff 02                 fmul
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 00                 fadd
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f0 32 40              ldsp16	r2, [sp+0x40]
 f0 6b 84              st32	[r2], q2
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
<L3>:
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 01                 fsub
 f0 0a 04              addi.s8	r2, 0x4
 f0 6b 84              st32	[r2], q2
 d6 42                 adjsp	0x42
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
