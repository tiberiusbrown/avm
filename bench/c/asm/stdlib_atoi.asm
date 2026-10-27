
stdlib_atoi.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 stdlib_atoi.c
00000100 l     O .data	00000003 call
00000103 l     O .data	00000002 result_sink
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 stdlib.c
00000000 l    df *ABS*	00000000 ctype.c
00000000 l    df *ABS*	00000000 integer.c
00000000 l    df *ABS*	00000000 wide_integer.c
00000421 l       .init_array	00000000 .hidden __init_array_end
00000421 l       .init_array	00000000 .hidden __init_array_start
00000421 l       .fini_array	00000000 .hidden __fini_array_start
00000421 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000089 avm_test_main
00000350 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000352 g     F .text	000000c3 atoi
00000415 g     F .text	0000000c isspace
0000012d g     O .data	00000002 __avm_errno

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
 e1 32 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 21 04              ldi16	r4, 0x421
 c1 00                 ldi8	r5, 0x0
 c6 21 04              ldi16	r6, 0x421
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 21 04           ldi16	r0, 0x421
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 21 04           ldi16	r2, 0x421
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
 c4 21 04              ldi16	r4, 0x421
 c1 00                 ldi8	r5, 0x0
 c6 21 04              ldi16	r6, 0x421
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 21 04           ldi16	r2, 0x421
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 21 04           ldi16	r0, 0x421
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
 f2 30                 sub	r0, r0
 f0 02 10              ldi8	r2, 0x10
 d7 01                 sys	debug_break
 f0 07 00 01           ldi16	r3, 0x100
<L0>:
 f1 23                 mov	r4, r3
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 c4 05 01              ldi16	r4, 0x105
 eb                    callp	q3
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 23                 mov	r4, r3
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 c4 07 01              ldi16	r4, 0x107
 eb                    callp	q3
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f1 23                 mov	r4, r3
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 c4 0a 01              ldi16	r4, 0x10a
 eb                    callp	q3
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 23                 mov	r4, r3
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 c4 0f 01              ldi16	r4, 0x10f
 eb                    callp	q3
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f1 23                 mov	r4, r3
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 c4 16 01              ldi16	r4, 0x116
 eb                    callp	q3
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 23                 mov	r4, r3
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 c4 1c 01              ldi16	r4, 0x11c
 eb                    callp	q3
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f1 23                 mov	r4, r3
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 c4 23 01              ldi16	r4, 0x123
 eb                    callp	q3
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 f1 23                 mov	r4, r3
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 c4 24 01              ldi16	r4, 0x124
 eb                    callp	q3
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f4 b2                 dec16	r2
 f4 a2                 tst8	r2
 d1 92                 brne8	-0x6e <L0>
 f0 58 03 01           stm16	[0x103], r0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<atoi>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f1 04                 mov	r0, r4
<L0>:
 f1 08                 mov	r1, r0
 f0 6c 81              ld8u	r4, [r0+]
 e1 b3 00              call16	isspace
 f6 2c                 tst16	r4
 d1 f4                 brne8	-0xc <L0>
 ed 82 20              ld8u	r4, [r1+0]
 cc 2b                 cmpi.s8	r4, 0x2b
 aa                    xor	r6, r6
 d0 0f                 breq8	0xf <L1>
 cc 2d                 cmpi.s8	r4, 0x2d
 d1 12                 brne8	0x12 <L2>
 c0 01                 ldi8	r4, 0x1
 f4 48                 stsp16	[sp+0x2], r4
 c4 00 80              ldi16	r4, 0x8000
 f1 08                 mov	r1, r0
 d4 0c                 jmp8	0xc <L4>
<L1>:
 c4 ff 7f              ldi16	r4, 0x7fff
 f1 08                 mov	r1, r0
 d4 03                 jmp8	0x3 <L3>
<L2>:
 c4 ff 7f              ldi16	r4, 0x7fff
<L3>:
 f4 4a                 stsp16	[sp+0x2], r6
<L4>:
 c1 0a                 ldi8	r5, 0xa
 f4 40                 stsp16	[sp+0x0], r4
 f1 04                 mov	r0, r4
 ec 45                 urem16	r0, r5
 0e                    mov	r7, r6
 f1 1e                 mov	r3, r6
 d4 17                 jmp8	0x17 <L8>
<L5>:
 f1 27                 mov	r5, r3
 f1 16                 mov	r2, r6
 c2 0a                 ldi8	r6, 0xa
 fe 2e                 mul16	r5, r6
 11                    add	r4, r5
 f6 2a                 tst16	r2
 fb 1c                 cmov.eq	r3, r4
<L6>:
 f1 27                 mov	r5, r3
<L7>:
 f4 b7                 dec16	r7
 f4 a9                 inc16	r1
 f1 2a                 mov	r6, r2
 f1 1d                 mov	r3, r5
<L8>:
 ed 82 20              ld8u	r4, [r1+0]
 04                    mov	r5, r4
 c9 d0                 addi.s8	r5, -0x30
 f1 75                 zext8	r5
 cd 0a                 cmpi.s8	r5, 0xa
 d8 0e                 bruge8	0xe <L9>
 c8 d0                 addi.s8	r4, -0x30
 f0 02 01              ldi8	r2, 0x1
 c5 cc 0c              ldi16	r5, 0xccc
 f5 27                 cmp	r5, r3
 d2 de                 brult8	-0x22 <L6>
 d4 22                 jmp8	0x22 <L10>
<L9>:
 04                    mov	r5, r4
 c9 9f                 addi.s8	r5, -0x61
 f1 75                 zext8	r5
 cd 1a                 cmpi.s8	r5, 0x1a
 d2 23                 brult8	0x23 <L11>
 04                    mov	r5, r4
 c9 bf                 addi.s8	r5, -0x41
 f1 75                 zext8	r5
 cd 1a                 cmpi.s8	r5, 0x1a
 d8 1a                 bruge8	0x1a <L11>
 c8 c9                 addi.s8	r4, -0x37
 cc 0a                 cmpi.s8	r4, 0xa
 d8 14                 bruge8	0x14 <L11>
 f0 02 01              ldi8	r2, 0x1
 c5 cc 0c              ldi16	r5, 0xccc
 f5 27                 cmp	r5, r3
 d2 ba                 brult8	-0x46 <L6>
<L10>:
 f5 1d                 cmp	r3, r5
 d1 a9                 brne8	-0x57 <L5>
 f5 04                 cmp	r0, r4
 d2 b4                 brult8	-0x4c <L7>
 d4 a3                 jmp8	-0x5d <L5>
<L11>:
 a5                    xor	r5, r5
 f6 2f                 tst16	r7
 01                    mov	r4, r5
 d0 0e                 breq8	0xe <L12>
 f6 2e                 tst16	r6
 f1 23                 mov	r4, r3
 d0 08                 breq8	0x8 <L12>
 c0 22                 ldi8	r4, 0x22
 f0 5c 2d 01           stm16	[0x12d], r4
 f4 00                 ldsp16	r4, [sp+0x0]
<L12>:
 24                    sub	r5, r4
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 a6                 tst8	r6
 fb 65                 cmov.ne	r4, r5
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<isspace>:
 cc 20                 cmpi.s8	r4, 0x20
 f8 05                 cset.eq	r5
 c8 f7                 addi.s8	r4, -0x9
 cc 05                 cmpi.s8	r4, 0x5
 f8 14                 cset.ult	r4
 91                    or	r4, r5
 ef                    ret
