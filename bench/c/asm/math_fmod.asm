
math_fmod.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 math_fmod.c
00000100 l     O .data	00000004 input
00000104 l     O .data	00000004 result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 ef_fmod.c
00000000 l    df *ABS*	00000000 integer.c
0000063c l       .init_array	00000000 .hidden __init_array_end
0000063c l       .init_array	00000000 .hidden __init_array_start
0000063c l       .fini_array	00000000 .hidden __fini_array_start
0000063c l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000050 avm_test_main
00000317 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000319 g     F .text	000002cb fmodf
000005e4 g     F .text	0000002c __avm_ashlsi3
00000610 g     F .text	0000002c __avm_lshrsi3

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 c1 00              call16	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 d5 51                 call8	avm_run_destructors
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 f9 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 3c 06              ldi16	r4, 0x63c
 c1 00                 ldi8	r5, 0x0
 c6 3c 06              ldi16	r6, 0x63c
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 3c 06           ldi16	r0, 0x63c
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 3c 06           ldi16	r2, 0x63c
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

<avm_run_destructors>:
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
 e1 89 fd              call16	-631 <__avm_run_local_dtors>
<L0>:
 c4 3c 06              ldi16	r4, 0x63c
 c1 00                 ldi8	r5, 0x0
 c6 3c 06              ldi16	r6, 0x63c
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 3c 06           ldi16	r2, 0x63c
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 3c 06           ldi16	r0, 0x63c
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
 e1 40 fd              call16	-704 <__avm_run_local_dtors>
<L3>:
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
 d6 fa                 adjsp	-0x6
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 c0 20                 ldi8	r4, 0x20
 d7 01                 sys	debug_break
 aa                    xor	r6, r6
 c7 00 3d              ldi16	r7, 0x3d00
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 64                 mov32	q1, q0
<L0>:
 f4 50                 stsp16	[sp+0x4], r4
 f2 68                 mov32	q2, q0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 2b                 fmul	q2, q3
 c6 00 01              ldi16	r6, 0x100
 f0 6a cc              ld32	q3, [r6]
 ff 0b                 fadd	q2, q3
 aa                    xor	r6, r6
 c7 40 3f              ldi16	r7, 0x3f40
 d5 22                 call8	fmodf
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 03                 fadd	q0, q3
 ff 06                 fadd	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 b4                 dec16	r4
 f4 a4                 tst8	r4
 d1 d8                 brne8	-0x28 <L0>
 c4 04 01              ldi16	r4, 0x104
 f0 6b 48              st32	[r4], q1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<fmodf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 f2 67                 mov32	q1, q3
 ff 67                 fabs	q3
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 69 c0              cmp32	q3, q0
 d0 39                 breq8	0x39 <L0>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 67                 fabs	q3
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 7f 7f           ldi16	r1, 0x7f7f
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 69 0c              cmp32	q0, q3
 d2 24                 brult8	0x24 <L0>
 f0 00 01              ldi8	r0, 0x1
 f0 05 80 7f           ldi16	r1, 0x7f80
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 69 c0              cmp32	q3, q0
 d8 14                 bruge8	0x14 <L0>
 f2 66                 mov32	q1, q2
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 69 8c              cmp32	q2, q3
 d8 0c                 bruge8	0xc <L1>
 f2 69                 mov32	q2, q1
 e0 74 02              jmp16	628 <L26>
<L0>:
 ff 29                 fmul	q2, q1
 ff 3a                 fdiv	q2, q2
 e0 6d 02              jmp16	621 <L26>
<L1>:
 f2 30                 sub	r0, r0
 f0 05 00 80           ldi16	r1, 0x8000
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 69 c8              cmp32	q3, q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d1 0c                 brne8	0xc <L2>
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 fb 70                 cmov.ne	r6, r0
 fb 79                 cmov.ne	r7, r1
 e0 46 02              jmp16	582 <L25>
<L2>:
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f2 30                 sub	r0, r0
 f0 01 80              ldi8	r1, 0x80
 f0 69 c0              cmp32	q3, q0
 d2 33                 brult8	0x33 <L3>
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f2 67                 mov32	q1, q3
 f7 64                 add32	q1, q0
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 69 c4              cmp32	q3, q1
 d8 22                 bruge8	0x22 <L3>
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 1e                 fsub	q3, q2
 ff 67                 fabs	q3
 f2 67                 mov32	q1, q3
 ff 61                 fneg	q1
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 80              cmp32	q2, q0
 fb 72                 cmov.ne	r6, r2
 fb 7b                 cmov.ne	r7, r3
 e0 03 02              jmp16	515 <L25>
<L3>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 01 7f              ldi8	r1, 0x7f
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 69 0c              cmp32	q0, q3
 f0 06 81 ff           ldi16	r2, 0xff81
 f0 07 ff ff           ldi16	r3, 0xffff
 d2 2e                 brult8	0x2e <L5>
 f4 2b                 ldsp16	r7, [sp+0xa]
 0b                    mov	r6, r7
 fa 58                 lsl16i	r6, 0x8
 02                    mov	r4, r6
 f4 22                 ldsp16	r6, [sp+0x8]
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 94                    or	r5, r4
 fa 58                 lsl16i	r6, 0x8
 0d                    mov	r7, r5
 f1 16                 mov	r2, r6
 f1 1f                 mov	r3, r7
 f0 04 82 ff           ldi16	r0, 0xff82
 f0 05 ff ff           ldi16	r1, 0xffff
<L4>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f7 63                 add32	q0, q3
 f7 65                 add32	q1, q1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 c4              cmp32	q3, q1
 d3 ef                 brslt8	-0x11 <L4>
 d4 09                 jmp8	0x9 <L6>
<L5>:
 0b                    mov	r6, r7
 fa 97                 lsr16i	r6, 0x7
 f1 06                 mov	r0, r6
 f2 39                 sub	r1, r1
 f7 61                 add32	q0, q1
<L6>:
 f0 06 82 ff           ldi16	r2, 0xff82
 f0 07 ff ff           ldi16	r3, 0xffff
 c6 ff ff              ldi16	r6, 0xffff
 c3 7f                 ldi8	r7, 0x7f
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 69 c8              cmp32	q3, q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d2 21                 brult8	0x21 <L8>
 02                    mov	r4, r6
 07                    mov	r5, r7
 09                    mov	r6, r5
 fa 58                 lsl16i	r6, 0x8
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 9e                    or	r7, r6
 08                    mov	r6, r4
 fa 58                 lsl16i	r6, 0x8
 f2 69                 mov32	q2, q1
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
<L7>:
 f7 69                 add32	q2, q1
 f7 6f                 add32	q3, q3
 f0 69 4c              cmp32	q1, q3
 d3 f7                 brslt8	-0x9 <L7>
 d4 0d                 jmp8	0xd <L9>
<L8>:
 0b                    mov	r6, r7
 fa 97                 lsr16i	r6, 0x7
 02                    mov	r4, r6
 a5                    xor	r5, r5
 c6 81 ff              ldi16	r6, 0xff81
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
<L9>:
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c6 82 ff              ldi16	r6, 0xff82
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 0c              cmp32	q0, q3
 f0 02 7f              ldi8	r2, 0x7f
 f0 03 80              ldi8	r3, 0x80
 d3 20                 brslt8	0x20 <L11>
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f9 a8                 and	r5, r2
 f9 ad                 or	r5, r3
 f1 14                 mov	r2, r4
 f1 1d                 mov	r3, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 69 8c              cmp32	q2, q3
 d9 25                 brsge8	0x25 <L12>
<L10>:
 f7 7e                 sub32	q3, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 e1 44 01              call16	__avm_ashlsi3
 d4 25                 jmp8	0x25 <L13>
<L11>:
 f7 7c                 sub32	q3, q0
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 e1 39 01              call16	__avm_ashlsi3
 c6 82 ff              ldi16	r6, 0xff82
 c7 ff ff              ldi16	r7, 0xffff
 f2 66                 mov32	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 69 8c              cmp32	q2, q3
 d3 db                 brslt8	-0x25 <L10>
<L12>:
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 c2 7f                 ldi8	r6, 0x7f
 89                    and	r6, r5
 c1 80                 ldi8	r5, 0x80
 99                    or	r6, r5
 06                    mov	r5, r6
<L13>:
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 69 08              cmp32	q0, q2
 d1 42                 brne8	0x42 <L16>
 aa                    xor	r6, r6
 af                    xor	r7, r7
<L14>:
 f2 69                 mov32	q2, q1
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f7 78                 sub32	q2, q0
 f0 69 8c              cmp32	q2, q3
 fd 22                 cmov.slt	r4, r2
 fd 2b                 cmov.slt	r5, r3
 f0 69 8c              cmp32	q2, q3
 da 87 00              breq16	0x87 <L20>
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 01 7f              ldi8	r1, 0x7f
 f0 69 08              cmp32	q0, q2
 de 87 00              brslt16	0x87 <L21>
 f2 30                 sub	r0, r0
 f0 01 80              ldi8	r1, 0x80
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
<L15>:
 f7 6d                 add32	q3, q1
 f7 6a                 add32	q2, q2
 f0 69 80              cmp32	q2, q0
 d3 f7                 brslt8	-0x9 <L15>
 d4 6f                 jmp8	0x6f <L22>
<L16>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 f7 62                 add32	q0, q2
 aa                    xor	r6, r6
 af                    xor	r7, r7
 d4 17                 jmp8	0x17 <L19>
<L17>:
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
<L18>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 62                 add32	q0, q2
 f7 65                 add32	q1, q1
 d0 9b                 breq8	-0x65 <L14>
<L19>:
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 f2 69                 mov32	q2, q1
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f7 78                 sub32	q2, q0
 f0 69 8c              cmp32	q2, q3
 d3 d4                 brslt8	-0x2c <L17>
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 69 4c              cmp32	q1, q3
 f2 66                 mov32	q1, q2
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 d1 c9                 brne8	-0x37 <L18>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 fb 66                 cmov.ne	r4, r6
 fb 6f                 cmov.ne	r5, r7
 d4 69                 jmp8	0x69 <L26>
<L20>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 8c              cmp32	q2, q3
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 d4 56                 jmp8	0x56 <L24>
<L21>:
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
<L22>:
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 04 82 ff           ldi16	r0, 0xff82
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 69 c0              cmp32	q3, q0
 d3 1e                 brslt8	0x1e <L23>
 f4 12                 ldsp16	r6, [sp+0x4]
 fa 57                 lsl16i	r6, 0x7
 0e                    mov	r7, r6
 aa                    xor	r6, r6
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f7 63                 add32	q0, q3
 f4 0b                 ldsp16	r7, [sp+0x2]
 f1 1f                 mov	r3, r7
 f9 65                 or	r3, r1
 aa                    xor	r6, r6
 c7 80 ff              ldi16	r7, 0xff80
 f7 6b                 add32	q2, q3
 f9 ad                 or	r5, r3
 d4 29                 jmp8	0x29 <L26>
<L23>:
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f7 73                 sub32	q0, q3
 f2 6a                 mov32	q3, q0
 d5 52                 call8	__avm_lshrsi3
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 62                 fneg	q2
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
<L24>:
 fb 74                 cmov.ne	r6, r4
 fb 7d                 cmov.ne	r7, r5
<L25>:
 02                    mov	r4, r6
 07                    mov	r5, r7
<L26>:
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_ashlsi3>:
 f6 2f                 tst16	r7
 d1 23                 brne8	0x23 <L1>
 ce 10                 cmpi.s8	r6, 0x10
 d8 12                 bruge8	0x12 <L0>
 f6 2e                 tst16	r6
 d0 1f                 breq8	0x1f <L2>
 0c                    mov	r7, r4
 fa 06                 shl16v	r5, r6
 fa 02                 shl16v	r4, r6
 f6 4e                 neg16	r6
 ca 10                 addi.s8	r6, 0x10
 fa 1e                 lsr16v	r7, r6
 97                    or	r5, r7
 d4 11                 jmp8	0x11 <L2>
<L0>:
 ce 20                 cmpi.s8	r6, 0x20
 d8 09                 bruge8	0x9 <L1>
 ca f0                 addi.s8	r6, -0x10
 fa 02                 shl16v	r4, r6
 04                    mov	r5, r4
 c0 00                 ldi8	r4, 0x0
 d4 04                 jmp8	0x4 <L2>
<L1>:
 c0 00                 ldi8	r4, 0x0
 c1 00                 ldi8	r5, 0x0
<L2>:
 ef                    ret

<__avm_lshrsi3>:
 f6 2f                 tst16	r7
 d1 23                 brne8	0x23 <L1>
 ce 10                 cmpi.s8	r6, 0x10
 d8 12                 bruge8	0x12 <L0>
 f6 2e                 tst16	r6
 d0 1f                 breq8	0x1f <L2>
 0d                    mov	r7, r5
 fa 12                 lsr16v	r4, r6
 fa 16                 lsr16v	r5, r6
 f6 4e                 neg16	r6
 ca 10                 addi.s8	r6, 0x10
 fa 0e                 shl16v	r7, r6
 93                    or	r4, r7
 d4 11                 jmp8	0x11 <L2>
<L0>:
 ce 20                 cmpi.s8	r6, 0x20
 d8 09                 bruge8	0x9 <L1>
 ca f0                 addi.s8	r6, -0x10
 fa 16                 lsr16v	r5, r6
 01                    mov	r4, r5
 c1 00                 ldi8	r5, 0x0
 d4 04                 jmp8	0x4 <L2>
<L1>:
 c0 00                 ldi8	r4, 0x0
 c1 00                 ldi8	r5, 0x0
<L2>:
 ef                    ret
