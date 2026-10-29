
math_pow_extreme.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000323 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 math_pow_extreme.c
00000180 l     O .data	00000080 results
00000100 l     O .data	00000080 inputs
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 ef_pow.c
000009a4 l     F .text	00000957 avm_pow_boundary
00000000 l    df *ABS*	00000000 stdlib.c
00000000 l    df *ABS*	00000000 avm.c
00000000 l    df *ABS*	00000000 ctype.c
00000000 l    df *ABS*	00000000 strtof.c
00000000 l    df *ABS*	00000000 integer.c
00000000 l    df *ABS*	00000000 wide_integer.c
000012fb l       .init_array	00000000 .hidden __init_array_end
000012fb l       .init_array	00000000 .hidden __init_array_start
000012fb l       .fini_array	00000000 .hidden __fini_array_start
000012fb l       .fini_array	00000000 .hidden __fini_array_end
00000300 g     F .text	00000023 _start
00000367 g     F .text	0000003e avm_test_main
000003a7 g     F .text	00000065 __avm_terminate
000003a5 g     F .text	00000002 avm_halt
0000040c g     F .text	00000598 powf
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000200 g     O .data	00000002 __avm_errno

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
 c4 fb 12              ldi16	r4, 0x12fb
 c1 00                 ldi8	r5, 0x0
 c6 fb 12              ldi16	r6, 0x12fb
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 fb 12           ldi16	r0, 0x12fb
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 fb 12           ldi16	r2, 0x12fb
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
 e1 44 fc              call16	-956 <__avm_run_local_dtors>
<L0>:
 c4 fb 12              ldi16	r4, 0x12fb
 c1 00                 ldi8	r5, 0x0
 c6 fb 12              ldi16	r6, 0x12fb
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 fb 12           ldi16	r2, 0x12fb
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 fb 12           ldi16	r0, 0x12fb
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
 e1 fb fb              call16	-1029 <__avm_run_local_dtors>
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
 d6 de                 adjsp	-0x22
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 f2 62                 mov32	q0, q2
 ff 08                 fabs	q0
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 c4              cmp32	q3, q1
 d0 70                 breq8	0x70 <L2>
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 68                 mov32	q2, q0
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 0c              cmp32	q0, q3
 f8 12                 cset.ult	r2
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 69 08              cmp32	q0, q2
 d2 7c                 brult8	0x7c <L4>
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 c0 01                 ldi8	r4, 0x1
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 c8              cmp32	q3, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 d8 6c                 bruge8	0x6c <L4>
 f0 69 80              cmp32	q2, q0
 db 9f 00              brne16	0x9f <L8>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f0 69 08              cmp32	q0, q2
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 d1 0c                 brne8	0xc <L0>
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c4              cmp32	q3, q1
 df c9 04              brsge16	0x4c9 <L42>
<L0>:
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f0 69 0c              cmp32	q0, q3
 d0 38                 breq8	0x38 <L3>
<L1>:
 f1 2b                 mov	r6, r3
 fa 9f                 lsr16i	r6, 0xf
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 f0 69 40              cmp32	q1, q0
 f8 17                 cset.ult	r7
 3e                    cmp	r7, r6
 d0 5e                 breq8	0x5e <L7>
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 d4 58                 jmp8	0x58 <L7>
<L2>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 02 01              ldi8	r2, 0x1
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 04              cmp32	q0, q1
 d2 10                 brult8	0x10 <L3>
 f2 42                 sub	r2, r2
 f0 03 40              ldi8	r3, 0x40
 f9 74                 and	r3, r5
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 40              cmp32	q1, q0
 d0 36                 breq8	0x36 <L6>
<L3>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 d4 32                 jmp8	0x32 <L7>
<L4>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 69 c8              cmp32	q3, q2
 d1 1b                 brne8	0x1b <L5>
 c6 ff ff              ldi16	r6, 0xffff
 f9 5a                 xor	r2, r6
 c3 40                 ldi8	r7, 0x40
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f9 e4                 and	r7, r1
 0b                    mov	r6, r7
 fa 96                 lsr16i	r6, 0x6
 f9 c9                 or	r6, r2
 c3 01                 ldi8	r7, 0x1
 8e                    and	r7, r6
 f4 a7                 tst8	r7
 d1 0a                 brne8	0xa <L7>
<L5>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
<L6>:
 ff 00                 fadd
<L7>:
 d6 22                 adjsp	0x22
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L8>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 7f 3f              ldi16	r5, 0x3f7f
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f0 69 84              cmp32	q2, q1
 d3 24                 brslt8	0x24 <L9>
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 f0 69 48              cmp32	q1, q2
 d0 62                 breq8	0x62 <L12>
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 f0 69 48              cmp32	q1, q2
 d1 41                 brne8	0x41 <L11>
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 69 84              cmp32	q2, q1
 de b1 00              brslt16	0xb1 <L16>
 ff 16                 fsqrt
 d4 c4                 jmp8	-0x3c <L7>
<L9>:
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 f0 69 48              cmp32	q1, q2
 d0 64                 breq8	0x64 <L13>
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f0 69 48              cmp32	q1, q2
 d1 1d                 brne8	0x1d <L11>
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f7 6b                 add32	q2, q3
 c6 fe ff              ldi16	r6, 0xfffe
 c3 7f                 ldi8	r7, 0x7f
 f0 69 c8              cmp32	q3, q2
 dd f4 03              bruge16	0x3f4 <L43>
<L10>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 d4 95                 jmp8	-0x6b <L7>
<L11>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 69 8c              cmp32	q2, q3
 d9 69                 brsge8	0x69 <L15>
 c0 01                 ldi8	r4, 0x1
 f0 3c 10              stsp16	[sp+0x10], r4
 aa                    xor	r6, r6
 e0 09 01              jmp16	265 <L25>
<L12>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f0 69 08              cmp32	q0, q2
 da d1 03              breq16	0x3d1 <L44>
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 03                 fdiv
 c6 ff ff              ldi16	r6, 0xffff
 c7 7f 7f              ldi16	r7, 0x7f7f
 f0 69 c0              cmp32	q3, q0
 dc 59 ff              brult16	-0xa7 <L7>
 d4 22                 jmp8	0x22 <L14>
<L13>:
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 66                 add32	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 c6 fe ff              ldi16	r6, 0xfffe
 c7 7f 7f              ldi16	r7, 0x7f7f
 f0 69 c4              cmp32	q3, q1
 dc 35 ff              brult16	-0xcb <L7>
<L14>:
 c7 80 7f              ldi16	r7, 0x7f80
 8d                    and	r7, r5
 c6 80 80              ldi16	r6, 0x8080
 1b                    add	r6, r7
 c7 ff 80              ldi16	r7, 0x80ff
 3e                    cmp	r7, r6
 dc 26 ff              brult16	-0xda <L7>
 c2 22                 ldi8	r6, 0x22
 f0 5e 00 02           stm16	[0x200], r6
 e0 1d ff              jmp16	-227 <L7>
<L15>:
 03                    mov	r4, r7
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 d4 02                 jmp8	0x2 <L17>
<L16>:
 c0 01                 ldi8	r4, 0x1
<L17>:
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 c6 ff ff              ldi16	r6, 0xffff
 c7 7f 4b              ldi16	r7, 0x4b7f
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 69 c8              cmp32	q3, q2
 d8 08                 bruge8	0x8 <L18>
 c0 01                 ldi8	r4, 0x1
 f0 3c 10              stsp16	[sp+0x10], r4
 aa                    xor	r6, r6
 d4 7e                 jmp8	0x7e <L24>
<L18>:
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f0 69 8c              cmp32	q2, q3
 d2 3f                 brult8	0x3f <L19>
 af                    xor	r7, r7
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 3f 18              stsp16	[sp+0x18], r7
 fa 87                 lsr16i	r5, 0x7
 c2 86                 ldi8	r6, 0x86
 39                    cmp	r6, r5
 d2 38                 brult8	0x38 <L20>
 aa                    xor	r6, r6
 f0 3e 14              stsp16	[sp+0x14], r6
 c2 01                 ldi8	r6, 0x1
 f6 2c                 tst16	r4
 d1 4f                 brne8	0x4f <L23>
 c0 86                 ldi8	r4, 0x86
 21                    sub	r4, r5
 c1 7f                 ldi8	r5, 0x7f
 f0 36 16              ldsp16	r6, [sp+0x16]
 86                    and	r5, r6
 c3 80                 ldi8	r7, 0x80
 9d                    or	r7, r5
 c5 ff ff              ldi16	r5, 0xffff
 09                    mov	r6, r5
 f0 3c 16              stsp16	[sp+0x16], r4
 fa 08                 shl16v	r6, r4
 a9                    xor	r6, r5
 8b                    and	r6, r7
 f4 a6                 tst8	r6
 c2 01                 ldi8	r6, 0x1
 d1 32                 brne8	0x32 <L23>
 f0 34 16              ldsp16	r4, [sp+0x16]
 fa 1c                 lsr16v	r7, r4
 c0 01                 ldi8	r4, 0x1
 83                    and	r4, r7
 d4 24                 jmp8	0x24 <L22>
<L19>:
 c2 01                 ldi8	r6, 0x1
 f0 3e 10              stsp16	[sp+0x10], r6
 d4 2f                 jmp8	0x2f <L24>
<L20>:
 c3 96                 ldi8	r7, 0x96
 2d                    sub	r7, r5
 c5 ff ff              ldi16	r5, 0xffff
 09                    mov	r6, r5
 fa 0b                 shl16v	r6, r7
 a9                    xor	r6, r5
 88                    and	r6, r4
 f6 2e                 tst16	r6
 d0 08                 breq8	0x8 <L21>
 a0                    xor	r4, r4
 f0 3c 14              stsp16	[sp+0x14], r4
 c2 01                 ldi8	r6, 0x1
 d4 0a                 jmp8	0xa <L23>
<L21>:
 04                    mov	r5, r4
 fa 17                 lsr16v	r5, r7
 c0 01                 ldi8	r4, 0x1
 81                    and	r4, r5
<L22>:
 f0 3c 14              stsp16	[sp+0x14], r4
 aa                    xor	r6, r6
<L23>:
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 14              ldsp16	r5, [sp+0x14]
 84                    and	r5, r4
 f4 a5                 tst8	r5
 f8 04                 cset.eq	r4
 f0 3c 10              stsp16	[sp+0x10], r4
<L24>:
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
<L25>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 69 80              cmp32	q2, q0
 f2 62                 mov32	q0, q2
 d0 13                 breq8	0x13 <L26>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d1 2d                 brne8	0x2d <L28>
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 84              cmp32	q2, q1
 df cb 02              brsge16	0x2cb <L45>
<L26>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6a                 mov32	q3, q0
 ff 03                 fdiv
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 fd 04                 cmov.slt	r0, r4
 fd 0d                 cmov.slt	r1, r5
<L27>:
 f2 68                 mov32	q2, q0
 ff 06                 fneg	q2
 f0 36 10              ldsp16	r6, [sp+0x10]
 f4 a6                 tst8	r6
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 e0 35 fe              jmp16	-459 <L7>
<L28>:
 f4 a6                 tst8	r6
 db ae 02              brne16	0x2ae <L46>
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f0 69 08              cmp32	q0, q2
 d1 12                 brne8	0x12 <L29>
 c4 80 bf              ldi16	r4, 0xbf80
 c5 80 3f              ldi16	r5, 0x3f80
 f0 36 10              ldsp16	r6, [sp+0x10]
 f4 a6                 tst8	r6
 fb 65                 cmov.ne	r4, r5
 04                    mov	r5, r4
 a0                    xor	r4, r4
 e0 15 fe              jmp16	-491 <L7>
<L29>:
 a0                    xor	r4, r4
 c5 90 c0              ldi16	r5, 0xc090
 f7 68                 add32	q2, q0
 aa                    xor	r6, r6
 c3 20                 ldi8	r7, 0x20
 f0 69 c8              cmp32	q3, q2
 d2 40                 brult8	0x40 <L30>
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 15 07 25 49 12 3e ab aa 2a be cd cc 4c 3e 00 00 80 be ab aa aa 3e 00 00 00 bf 00 00 80 3f  fpoly	7, 0.142857149, -0.166666672, 0.200000003, -0.25, 0.333333343, -0.5, 1.0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 c6 3b aa              ldi16	r6, 0xaa3b
 c7 b8 3f              ldi16	r7, 0x3fb8
 e0 d1 00              jmp16	209 <L35>
<L30>:
 c4 ff ff              ldi16	r4, 0xffff
 c1 7f                 ldi8	r5, 0x7f
 f0 69 80              cmp32	q2, q0
 d2 12                 brult8	0x12 <L31>
 aa                    xor	r6, r6
 c7 00 4c              ldi16	r7, 0x4c00
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 c4 68 ff              ldi16	r4, 0xff68
 f0 3c 14              stsp16	[sp+0x14], r4
 d4 08                 jmp8	0x8 <L32>
<L31>:
 c4 81 ff              ldi16	r4, 0xff81
 f0 3c 14              stsp16	[sp+0x14], r4
 f2 64                 mov32	q1, q0
<L32>:
 f0 3a 16              stsp16	[sp+0x16], r2
 f0 3b 18              stsp16	[sp+0x18], r3
 c6 ff ff              ldi16	r6, 0xffff
 c3 7f                 ldi8	r7, 0x7f
 f9 c8                 and	r6, r2
 f9 ec                 and	r7, r3
 f0 06 20 fb           ldi16	r2, 0xfb20
 f0 03 4a              ldi8	r3, 0x4a
 f7 67                 add32	q1, q3
 c0 80                 ldi8	r4, 0x80
 f9 8c                 and	r4, r3
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
 f0 35 18              ldsp16	r5, [sp+0x18]
 09                    mov	r6, r5
 fa 97                 lsr16i	r6, 0x7
 f0 34 14              ldsp16	r4, [sp+0x14]
 18                    add	r6, r4
 f1 23                 mov	r4, r3
 fa 77                 lsr16i	r4, 0x7
 12                    add	r4, r6
 ff 0c                 s16tof
 f2 66                 mov32	q1, q2
 c0 01                 ldi8	r4, 0x1
 c5 00 41              ldi16	r5, 0x4100
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 69 c8              cmp32	q3, q2
 d2 29                 brult8	0x29 <L33>
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 15 08 23 54 19 be 0a 5e 71 3e 47 48 7e be 78 e0 92 3e 74 74 b8 be 9c 3c f6 3e 8e aa 38 bf 3a aa b8 3f      fpoly	8, -0.149735019, 0.235710293, -0.248322591, 0.286868811, -0.360263467, 0.480931163, -0.721352458, 1.4426949
 d4 23                 jmp8	0x23 <L34>
<L33>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 15 07 a7 65 34 3e a3 bd 8a be 49 17 97 3e 10 e7 b7 be 96 17 f6 3e 8e ab 38 bf 46 aa b8 3f  fpoly	7, 0.176169023, -0.270978063, 0.295099527, -0.359184742, 0.480648696, -0.721367717, 1.44269633
<L34>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
<L35>:
 ff 02                 fmul
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 c4 00 04              ldi16	r4, 0x400
 c5 00 bd              ldi16	r5, 0xbd00
 f7 69                 add32	q2, q1
 c6 01 06              ldi16	r6, 0x601
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d2 72                 brult8	0x72 <L37>
 c4 00 02              ldi16	r4, 0x200
 c5 ea bc              ldi16	r5, 0xbcea
 f7 66                 add32	q1, q2
 c4 00 04              ldi16	r4, 0x400
 a5                    xor	r5, r5
 f0 69 84              cmp32	q2, q1
 d8 61                 bruge8	0x61 <L37>
<L36>:
 f4 19                 ldsp16	r5, [sp+0x6]
 01                    mov	r4, r5
 c5 00 43              ldi16	r5, 0x4300
 31                    cmp	r4, r5
 df 49 01              brsge16	0x149 <L47>
 c5 16 c3              ldi16	r5, 0xc316
 31                    cmp	r4, r5
 dd 51 01              bruge16	0x151 <L48>
 aa                    xor	r6, r6
 af                    xor	r7, r7
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
 ff 15 05 66 01 1d 3c 23 fe 64 3d bc 01 76 3e 96 70 31 3f 00 00 80 3f  fpoly	5, 0.00958285294, 0.0559064262, 0.240240991, 0.693124175, 1.0
 cf 83                 cmpi.s8	r7, -0x7d
 d3 60                 brslt8	0x60 <L38>
 fa 67                 lsl16i	r7, 0x7
 f1 0f                 mov	r1, r7
 f2 30                 sub	r0, r0
 f7 62                 add32	q0, q2
 e0 1c fe              jmp16	-484 <L27>
<L37>:
 d6 f8                 adjsp	-0x8
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f0 14 22              leasp	r4, 0x22
 f2 6a                 mov32	q3, q0
 e1 f6 00              call16	avm_pow_boundary
 d6 08                 adjsp	0x8
 aa                    xor	r6, r6
 c7 00 43              ldi16	r7, 0x4300
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 ff 14                 fcmp
 f6 2e                 tst16	r6
 d1 5b                 brne8	0x5b <L40>
 c6 3b aa              ldi16	r6, 0xaa3b
 c7 38 b3              ldi16	r7, 0xb338
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f0 35 20              ldsp16	r5, [sp+0x20]
 ff 14                 fcmp
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 7f 7f           ldi16	r1, 0x7f7f
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 ce 02                 cmpi.s8	r6, 0x2
 fc 04                 cmov.ult	r0, r4
 fc 0d                 cmov.ult	r1, r5
 c4 ff 7f              ldi16	r4, 0x7fff
 f9 84                 and	r4, r1
 31                    cmp	r4, r5
 db c9 fd              brne16	-0x237 <L27>
 d4 27                 jmp8	0x27 <L39>
<L38>:
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
 f2 62                 mov32	q0, q2
 f1 21                 mov	r4, r1
 c5 80 7f              ldi16	r5, 0x7f80
 84                    and	r5, r4
 c4 80 80              ldi16	r4, 0x8080
 11                    add	r4, r5
 c5 ff 80              ldi16	r5, 0x80ff
 34                    cmp	r5, r4
 dc a0 fd              brult16	-0x260 <L27>
<L39>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 00 02           stm16	[0x200], r4
 e0 97 fd              jmp16	-617 <L27>
<L40>:
 aa                    xor	r6, r6
 c7 16 c3              ldi16	r7, 0xc316
 ff 14                 fcmp
 f6 2e                 tst16	r6
 d1 1b                 brne8	0x1b <L41>
 c0 22                 ldi8	r4, 0x22
 f0 5c 00 02           stm16	[0x200], r4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f0 35 20              ldsp16	r5, [sp+0x20]
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 f8 04                 cset.eq	r4
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 e0 72 fd              jmp16	-654 <L27>
<L41>:
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 e0 ee fe              jmp16	-274 <L36>
<L42>:
 c2 22                 ldi8	r6, 0x22
 f0 5e 00 02           stm16	[0x200], r6
 e0 37 fb              jmp16	-1225 <L1>
<L43>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 00 02           stm16	[0x200], r4
 e0 03 fc              jmp16	-1021 <L10>
<L44>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 00 02           stm16	[0x200], r4
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 03                 fdiv
 e0 8b fb              jmp16	-1141 <L7>
<L45>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 00 02           stm16	[0x200], r4
 e0 2c fd              jmp16	-724 <L26>
<L46>:
 c0 21                 ldi8	r4, 0x21
 f0 5c 00 02           stm16	[0x200], r4
 c4 c0 7f              ldi16	r4, 0x7fc0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 93                    or	r4, r7
 04                    mov	r5, r4
 02                    mov	r4, r6
 e0 6f fb              jmp16	-1169 <L7>
<L47>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 00 02           stm16	[0x200], r4
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 e0 1b fd              jmp16	-741 <L27>
<L48>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 00 02           stm16	[0x200], r4
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 e0 0e fd              jmp16	-754 <L27>

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
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 7f              ldi8	r3, 0x7f
 f0 30 4d              ldsp16	r0, [sp+0x4d]
 f0 31 4f              ldsp16	r1, [sp+0x4f]
 f2 68                 mov32	q2, q0
 f9 88                 and	r4, r2
 f9 ac                 and	r5, r3
 f2 42                 sub	r2, r2
 f0 03 80              ldi8	r3, 0x80
 f0 69 04              cmp32	q0, q1
 dc e1 00              brult16	0xe1 <L0>
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 db d7 00              brne16	0xd7 <L0>
 f1 21                 mov	r4, r1
 fa 77                 lsr16i	r4, 0x7
 c8 81                 addi.s8	r4, -0x7f
 ff 0c                 s16tof
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c7 00 80              ldi16	r7, 0x8000
 f1 05                 mov	r0, r5
 f9 1c                 and	r0, r7
 aa                    xor	r6, r6
 f5 06                 cmp	r0, r6
 fb 77                 cmov.ne	r6, r7
 f4 52                 stsp16	[sp+0x4], r6
 f0 06 00 f0           ldi16	r2, 0xf000
 f0 07 ff ff           ldi16	r3, 0xffff
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f9 c8                 and	r6, r2
 f9 ec                 and	r7, r3
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 30 28              ldsp16	r0, [sp+0x28]
 f0 31 2a              ldsp16	r1, [sp+0x2a]
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f2 68                 mov32	q2, q0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 02                 fmul
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
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
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 0c                    mov	r7, r4
 aa                    xor	r6, r6
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
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
 e0 2e 08              jmp16	2094 <L3>
<L0>:
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 7f              ldi8	r3, 0x7f
 f0 69 40              cmp32	q1, q0
 d2 1d                 brult8	0x1d <L1>
 f2 30                 sub	r0, r0
 f0 05 00 4c           ldi16	r1, 0x4c00
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 c6 68 ff              ldi16	r6, 0xff68
 f0 3e 10              stsp16	[sp+0x10], r6
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 09                    mov	r6, r5
 fa 97                 lsr16i	r6, 0x7
 f2 69                 mov32	q2, q1
 d4 0b                 jmp8	0xb <L2>
<L1>:
 c6 81 ff              ldi16	r6, 0xff81
 f0 3e 10              stsp16	[sp+0x10], r6
 f1 29                 mov	r6, r1
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
<L2>:
 f0 06 20 fb           ldi16	r2, 0xfb20
 f0 03 4a              ldi8	r3, 0x4a
 f7 66                 add32	q1, q2
 c3 80                 ldi8	r7, 0x80
 f9 ec                 and	r7, r3
 97                    or	r5, r7
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 12                    add	r4, r6
 f0 3c 10              stsp16	[sp+0x10], r4
 f2 68                 mov32	q2, q0
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 00                 fadd
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 ff 01                 fsub
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 01                 fsub
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f1 23                 mov	r4, r3
 fa 77                 lsr16i	r4, 0x7
 f0 35 10              ldsp16	r5, [sp+0x10]
 11                    add	r4, r5
 f0 3c 3c              stsp16	[sp+0x3c], r4
 f0 3d 3e              stsp16	[sp+0x3e], r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f0 06 00 f0           ldi16	r2, 0xf000
 f0 07 ff ff           ldi16	r3, 0xffff
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f9 08                 and	r0, r2
 f9 2c                 and	r1, r3
 f0 38 24              stsp16	[sp+0x24], r0
 f0 39 26              stsp16	[sp+0x26], r1
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
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
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 f2 6b                 mov32	q3, q1
 f2 61                 mov32	q0, q1
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 ff 02                 fmul
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 37 26              ldsp16	r7, [sp+0x26]
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
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 37 26              ldsp16	r7, [sp+0x26]
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
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
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
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
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f0 38 24              stsp16	[sp+0x24], r0
 f0 39 26              stsp16	[sp+0x26], r1
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
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
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 03                 fdiv
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
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
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 ff 15 06 f1 f0 70 3d 89 88 88 3d d9 89 9d 3d 8c 2e ba 3d 39 8e e3 3d 25 49 12 3e      fpoly	6, 0.0588235296, 0.0666666701, 0.0769230798, 0.0909090936, 0.111111112, 0.142857149
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f0 04 cd cc           ldi16	r0, 0xcccd
 f0 05 4c be           ldi16	r1, 0xbe4c
 c6 cd cc              ldi16	r6, 0xcccd
 c7 4c 3e              ldi16	r7, 0x3e4c
 ff 00                 fadd
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
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
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
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
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
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
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
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
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 3d 2e              stsp16	[sp+0x2e], r5
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
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
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
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
 f0 30 20              ldsp16	r0, [sp+0x20]
 f0 31 22              ldsp16	r1, [sp+0x22]
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
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 02                 fmul
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 ff 00                 fadd
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 38 24              stsp16	[sp+0x24], r0
 f0 39 26              stsp16	[sp+0x26], r1
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
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f2 68                 mov32	q2, q0
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 37 26              ldsp16	r7, [sp+0x26]
 ff 02                 fmul
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 01                 fsub
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 ff 00                 fadd
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
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
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 37 26              ldsp16	r7, [sp+0x26]
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 3d 36              stsp16	[sp+0x36], r5
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 36 30              ldsp16	r6, [sp+0x30]
 f0 37 32              ldsp16	r7, [sp+0x32]
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 01                 fsub
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
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
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 c6 ab aa              ldi16	r6, 0xaaab
 c7 aa 3e              ldi16	r7, 0x3eaa
 ff 00                 fadd
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 01                 fsub
 c6 ab aa              ldi16	r6, 0xaaab
 c7 aa 3e              ldi16	r7, 0x3eaa
 ff 00                 fadd
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 ff 00                 fadd
 c6 ab aa              ldi16	r6, 0xaaab
 c7 2a b2              ldi16	r7, 0xb22a
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
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
 f0 3e 20              stsp16	[sp+0x20], r6
 f0 3f 22              stsp16	[sp+0x22], r7
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 c4 00 f0              ldi16	r4, 0xf000
 c5 ff ff              ldi16	r5, 0xffff
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 c4 00 f0              ldi16	r4, 0xf000
 c5 ff ff              ldi16	r5, 0xffff
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 02                 fmul
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
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
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
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
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 02                 fmul
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 01                 fsub
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 ff 00                 fadd
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f2 62                 mov32	q0, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
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
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 01                 fsub
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
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
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f2 68                 mov32	q2, q0
 c6 00 b0              ldi16	r6, 0xb000
 c7 23 3a              ldi16	r7, 0x3a23
 ff 02                 fmul
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 00                 fadd
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f2 62                 mov32	q0, q2
 c6 00 a0              ldi16	r6, 0xa000
 c7 38 40              ldi16	r7, 0x4038
 ff 02                 fmul
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 00                 fadd
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 68                 mov32	q2, q0
 c6 00 b0              ldi16	r6, 0xb000
 c7 23 3a              ldi16	r7, 0x3a23
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 c6 60 70              ldi16	r6, 0x7060
 c7 25 33              ldi16	r7, 0x3325
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f2 69                 mov32	q2, q1
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 c6 3b aa              ldi16	r6, 0xaa3b
 c7 38 40              ldi16	r7, 0x4038
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 00                 fadd
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 ff 0c                 s16tof
 f2 62                 mov32	q0, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 ff 00                 fadd
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 01                 fsub
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 01                 fsub
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 32 28              ldsp16	r2, [sp+0x28]
 f0 33 2a              ldsp16	r3, [sp+0x2a]
 f0 04 00 f0           ldi16	r0, 0xf000
 f0 05 ff ff           ldi16	r1, 0xffff
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 00                 fadd
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
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
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 00                 fadd
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
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
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f2 69                 mov32	q2, q1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff 02                 fmul
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
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
