
stdlib_atoll.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 stdlib_atoll.c
00000103 l     O .data	00000010 inputs
00000100 l     O .data	00000003 call
00000113 l     O .data	00000008 result_sink
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 stdlib.c
00000000 l    df *ABS*	00000000 avm.c
00000000 l    df *ABS*	00000000 ctype.c
00000000 l    df *ABS*	00000000 strtof.c
00000000 l    df *ABS*	00000000 strtof_internal.c
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 integer.c
00000000 l    df *ABS*	00000000 wide_integer.c
0000071c l       .init_array	00000000 .hidden __init_array_end
0000071c l       .init_array	00000000 .hidden __init_array_start
0000071c l       .fini_array	00000000 .hidden __fini_array_start
0000071c l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	0000005d avm_test_main
000004b4 g     F .text	00000065 __avm_terminate
000002c4 g     F .text	00000002 avm_halt
000002c6 g     F .text	000001e2 atoll
000004a8 g     F .text	0000000c isspace
00000000  w      *UND*	00000000 __avm_run_local_dtors
0000015f g     O .data	00000002 __avm_errno
00000564 g     F .text	00000097 __avm_muldi3
000005fb g     F .text	00000121 __avm_umoddi3
00000519 g     F .text	0000004b __avm_umulhisi3

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
 e1 9e 02              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 a1 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 1c 07              ldi16	r4, 0x71c
 c1 00                 ldi8	r5, 0x0
 c6 1c 07              ldi16	r6, 0x71c
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 1c 07           ldi16	r0, 0x71c
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 1c 07           ldi16	r2, 0x71c
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
 d6 fc                 adjsp	-0x4
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 c5 03 01              ldi16	r5, 0x103
 c6 00 01              ldi16	r6, 0x100
 0c                    mov	r7, r4
 f2 64                 mov32	q1, q0
<L0>:
 f4 43                 stsp16	[sp+0x0], r7
 a0                    xor	r4, r4
<L1>:
 f4 48                 stsp16	[sp+0x2], r4
 11                    add	r4, r5
 60                    ld16	r4, [r4]
 06                    mov	r5, r6
 f7 2e                 ld16	r6, [r5+]
 4d                    ld8u	r7, [r5]
 eb                    callp	q3
 f7 6c                 add32	q3, q0
 f7 66                 add32	q1, q2
 f0 69 48              cmp32	q1, q2
 c5 03 01              ldi16	r5, 0x103
 f8 14                 cset.ult	r4
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f4 08                 ldsp16	r4, [sp+0x2]
 f7 63                 add32	q0, q3
 c6 00 01              ldi16	r6, 0x100
 c8 02                 addi.s8	r4, 0x2
 cc 10                 cmpi.s8	r4, 0x10
 d1 da                 brne8	-0x26 <L1>
 f4 03                 ldsp16	r7, [sp+0x0]
 f4 af                 inc16	r7
 cf 10                 cmpi.s8	r7, 0x10
 d1 cf                 brne8	-0x31 <L0>
 c4 13 01              ldi16	r4, 0x113
 f0 6b 48              st32	[r4], q1
 c4 17 01              ldi16	r4, 0x117
 f0 6b 08              st32	[r4], q0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<atoll>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e2                 adjsp	-0x1e
 f1 04                 mov	r0, r4
<L0>:
 f1 08                 mov	r1, r0
 f0 6c 81              ld8u	r4, [r0+]
 e1 d2 01              call16	isspace
 f6 2c                 tst16	r4
 d1 f4                 brne8	-0xc <L0>
 ed c2 20              ld8u	r6, [r1+0]
 ce 2b                 cmpi.s8	r6, 0x2b
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 c3 01                 ldi8	r7, 0x1
 d0 12                 breq8	0x12 <L1>
 ce 2d                 cmpi.s8	r6, 0x2d
 d1 21                 brne8	0x21 <L2>
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 f1 08                 mov	r1, r0
 a0                    xor	r4, r4
 f0 3c 12              stsp16	[sp+0x12], r4
 f2 69                 mov32	q2, q1
 d4 22                 jmp8	0x22 <L3>
<L1>:
 f0 3f 12              stsp16	[sp+0x12], r7
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f1 08                 mov	r1, r0
 d4 0f                 jmp8	0xf <L3>
<L2>:
 f0 3f 12              stsp16	[sp+0x12], r7
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
<L3>:
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 d6 f8                 adjsp	-0x8
 f0 02 0a              ldi8	r2, 0xa
 f2 4b                 sub	r3, r3
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f2 42                 sub	r2, r2
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 3e 20              stsp16	[sp+0x20], r6
 f0 3f 22              stsp16	[sp+0x22], r7
 e1 bc 02              call16	__avm_umoddi3
 d6 08                 adjsp	0x8
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 3a 00              stsp16	[sp+0x0], r2
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 d4 0d                 jmp8	0xd <L6>
<L4>:
 f1 14                 mov	r2, r4
<L5>:
 f0 31 1c              ldsp16	r1, [sp+0x1c]
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 b4                 dec16	r4
 f4 40                 stsp16	[sp+0x0], r4
 f4 a9                 inc16	r1
<L6>:
 ed a2 20              ld8u	r5, [r1+0]
 01                    mov	r4, r5
 c8 d0                 addi.s8	r4, -0x30
 f1 74                 zext8	r4
 cc 0a                 cmpi.s8	r4, 0xa
 d8 04                 bruge8	0x4 <L7>
 c9 d0                 addi.s8	r5, -0x30
 d4 1b                 jmp8	0x1b <L8>
<L7>:
 01                    mov	r4, r5
 c8 9f                 addi.s8	r4, -0x61
 f1 74                 zext8	r4
 cc 1a                 cmpi.s8	r4, 0x1a
 dc d1 00              brult16	0xd1 <L11>
 01                    mov	r4, r5
 c8 bf                 addi.s8	r4, -0x41
 f1 74                 zext8	r4
 cc 1a                 cmpi.s8	r4, 0x1a
 dd c7 00              bruge16	0xc7 <L11>
 c9 c9                 addi.s8	r5, -0x37
 cd 0a                 cmpi.s8	r5, 0xa
 dd c0 00              bruge16	0xc0 <L11>
<L8>:
 f4 49                 stsp16	[sp+0x2], r5
 f0 39 1c              stsp16	[sp+0x1c], r1
 f0 3a 10              stsp16	[sp+0x10], r2
 c4 cc cc              ldi16	r4, 0xcccc
 c5 cc cc              ldi16	r5, 0xcccc
 f0 69 8c              cmp32	q2, q3
 f8 14                 cset.ult	r4
 f0 04 cc cc           ldi16	r0, 0xcccc
 f0 05 cc 0c           ldi16	r1, 0xccc
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f0 69 04              cmp32	q0, q1
 f8 15                 cset.ult	r5
 f0 69 40              cmp32	q1, q0
 fb 2c                 cmov.eq	r5, r4
 c0 01                 ldi8	r4, 0x1
 f4 a5                 tst8	r5
 d1 97                 brne8	-0x69 <L4>
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 02                    mov	r4, r6
 07                    mov	r5, r7
 c6 cc cc              ldi16	r6, 0xcccc
 c7 cc cc              ldi16	r7, 0xcccc
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 f9 42                 xor	r2, r0
 f9 66                 xor	r3, r1
 f9 51                 or	r2, r4
 f9 75                 or	r3, r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 f0 30 02              ldsp16	r0, [sp+0x2]
 d1 20                 brne8	0x20 <L9>
 f4 22                 ldsp16	r6, [sp+0x8]
 f5 28                 cmp	r6, r0
 d8 1a                 bruge8	0x1a <L9>
 f0 02 01              ldi8	r2, 0x1
 c6 cc cc              ldi16	r6, 0xcccc
 c7 cc cc              ldi16	r7, 0xcccc
 f0 04 cc cc           ldi16	r0, 0xcccc
 f0 05 cc 0c           ldi16	r1, 0xccc
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 e0 59 ff              jmp16	-167 <L5>
<L9>:
 f0 36 10              ldsp16	r6, [sp+0x10]
 f6 2e                 tst16	r6
 d0 0a                 breq8	0xa <L10>
 f0 02 01              ldi8	r2, 0x1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 e0 48 ff              jmp16	-184 <L5>
<L10>:
 d6 f8                 adjsp	-0x8
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c0 0a                 ldi8	r4, 0xa
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 e1 40 01              call16	__avm_muldi3
 d6 08                 adjsp	0x8
 f2 66                 mov32	q1, q2
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 f7 6d                 add32	q3, q1
 f0 69 c4              cmp32	q3, q1
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f7 68                 add32	q2, q0
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 42                 sub	r2, r2
 e0 0a ff              jmp16	-246 <L5>
<L11>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f6 2c                 tst16	r4
 d0 20                 breq8	0x20 <L12>
 f6 2a                 tst16	r2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 d0 1a                 breq8	0x1a <L13>
 c0 22                 ldi8	r4, 0x22
 f0 5c 5f 01           stm16	[0x15f], r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 d4 06                 jmp8	0x6 <L13>
<L12>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f2 68                 mov32	q2, q0
<L13>:
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f2 67                 mov32	q1, q3
 f7 76                 sub32	q1, q2
 f0 30 12              ldsp16	r0, [sp+0x12]
 f4 a0                 tst8	r0
 fb 54                 cmov.ne	r2, r4
 fb 5d                 cmov.ne	r3, r5
 f0 69 8c              cmp32	q2, q3
 f8 0c                 cset.ne	r4
 a5                    xor	r5, r5
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f7 68                 add32	q2, q0
 f7 7e                 sub32	q3, q2
 f0 34 12              ldsp16	r4, [sp+0x12]
 f4 a4                 tst8	r4
 fb 70                 cmov.ne	r6, r0
 fb 79                 cmov.ne	r7, r1
 f2 69                 mov32	q2, q1
 d6 1e                 adjsp	0x1e
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
 e1 37 fb              call16	-1225 <__avm_run_local_dtors>
<L0>:
 c4 1c 07              ldi16	r4, 0x71c
 c1 00                 ldi8	r5, 0x0
 c6 1c 07              ldi16	r6, 0x71c
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 1c 07           ldi16	r2, 0x71c
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 1c 07           ldi16	r0, 0x71c
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
 e1 ee fa              call16	-1298 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_umulhisi3>:
 d6 f8                 adjsp	-0x8
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f4 52                 stsp16	[sp+0x4], r6
 f1 75                 zext8	r5
 f4 41                 stsp16	[sp+0x0], r5
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 f3 19                 mulu8.w	r6, r5
 f4 5a                 stsp16	[sp+0x6], r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f3 1b                 mulu8.w	r6, r7
 fa 78                 lsr16i	r4, 0x8
 f4 11                 ldsp16	r5, [sp+0x4]
 0c                    mov	r7, r4
 f3 1d                 mulu8.w	r7, r5
 f4 4b                 stsp16	[sp+0x2], r7
 f4 01                 ldsp16	r5, [sp+0x0]
 f3 11                 mulu8.w	r4, r5
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 f4 09                 ldsp16	r5, [sp+0x2]
 1d                    add	r7, r5
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 17                    add	r5, r7
 f4 51                 stsp16	[sp+0x4], r5
 18                    add	r6, r4
 fa 38                 lsl16i	r4, 0x8
 f4 1b                 ldsp16	r7, [sp+0x6]
 04                    mov	r5, r4
 17                    add	r5, r7
 0d                    mov	r7, r5
 3c                    cmp	r7, r4
 f8 14                 cset.ult	r4
 f4 11                 ldsp16	r5, [sp+0x4]
 11                    add	r4, r5
 fa 58                 lsl16i	r6, 0x8
 f4 19                 ldsp16	r5, [sp+0x6]
 19                    add	r6, r5
 3b                    cmp	r6, r7
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 02                    mov	r4, r6
 d6 08                 adjsp	0x8
 ef                    ret

<__avm_muldi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 dc                 adjsp	-0x24
 f0 30 2f              ldsp16	r0, [sp+0x2f]
 f0 31 31              ldsp16	r1, [sp+0x31]
 f0 32 33              ldsp16	r2, [sp+0x33]
 f0 33 35              ldsp16	r3, [sp+0x35]
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 3a 20              stsp16	[sp+0x20], r2
 f0 3b 22              stsp16	[sp+0x22], r3
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 00 04              ldi8	r0, 0x4
 f0 11 08              leasp	r1, 0x8
<L0>:
 f4 58                 stsp16	[sp+0x6], r4
 10                    add	r4, r4
 f0 15 10              leasp	r5, 0x10
 14                    add	r5, r4
 f0 16 1c              leasp	r6, 0x1c
 61                    ld16	r4, [r5]
 a5                    xor	r5, r5
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f0 39 18              stsp16	[sp+0x18], r1
 f0 38 1a              stsp16	[sp+0x1a], r0
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
<L1>:
 f7 34                 ld16	r4, [r6+]
 f4 42                 stsp16	[sp+0x0], r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 06                    mov	r5, r6
 e1 57 ff              call16	__avm_umulhisi3
 ed d2 20              ld16	r6, [r1+0]
 af                    xor	r7, r7
 f7 6d                 add32	q3, q1
 f7 6e                 add32	q3, q2
 f0 6d d3              st16	[r1+], r6
 f1 17                 mov	r2, r7
 f2 4b                 sub	r3, r3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d1 df                 brne8	-0x21 <L1>
 f0 31 18              ldsp16	r1, [sp+0x18]
 f0 09 02              addi.s8	r1, 0x2
 f0 30 1a              ldsp16	r0, [sp+0x1a]
 f4 b0                 dec16	r0
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 ac                 inc16	r4
 cc 04                 cmpi.s8	r4, 0x4
 d1 b2                 brne8	-0x4e <L0>
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 d6 24                 adjsp	0x24
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_umoddi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e2                 adjsp	-0x1e
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 30 2d              ldsp16	r0, [sp+0x2d]
 f0 31 2f              ldsp16	r1, [sp+0x2f]
 f0 34 29              ldsp16	r4, [sp+0x29]
 f0 35 2b              ldsp16	r5, [sp+0x2b]
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 d1 06                 brne8	0x6 <L0>
 f0 69 04              cmp32	q0, q1
 da e9 00              breq16	0xe9 <L6>
<L0>:
 f0 02 40              ldi8	r2, 0x40
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f0 38 12              stsp16	[sp+0x12], r0
 f0 39 14              stsp16	[sp+0x14], r1
 d4 42                 jmp8	0x42 <L3>
<L1>:
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 f7 73                 sub32	q0, q3
 f0 32 1a              ldsp16	r2, [sp+0x1a]
 f0 33 1c              ldsp16	r3, [sp+0x1c]
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 69 4c              cmp32	q1, q3
 f8 15                 cset.ult	r5
 09                    mov	r6, r5
 af                    xor	r7, r7
 f7 73                 sub32	q0, q3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f7 77                 sub32	q1, q3
 f0 3a 1a              stsp16	[sp+0x1a], r2
 f0 3b 1c              stsp16	[sp+0x1c], r3
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
<L2>:
 f0 35 10              ldsp16	r5, [sp+0x10]
 f4 1b                 ldsp16	r7, [sp+0x6]
 08                    mov	r6, r4
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 f1 15                 mov	r2, r5
 da 86 00              breq16	0x86 <L5>
<L3>:
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 32 1a              ldsp16	r2, [sp+0x1a]
 f0 33 1c              ldsp16	r3, [sp+0x1c]
 f1 23                 mov	r4, r3
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f7 60                 add32	q0, q0
 f9 81                 or	r4, r0
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 03                    mov	r4, r7
 fa 7f                 lsr16i	r4, 0xf
 f7 65                 add32	q1, q1
 f9 89                 or	r4, r2
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3b 1c              stsp16	[sp+0x1c], r3
 f1 25                 mov	r5, r1
 f4 49                 stsp16	[sp+0x2], r5
 f0 30 16              ldsp16	r0, [sp+0x16]
 f0 31 18              ldsp16	r1, [sp+0x18]
 f1 21                 mov	r4, r1
 fa 7f                 lsr16i	r4, 0xf
 f7 6f                 add32	q3, q3
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 92                    or	r4, r6
 f7 60                 add32	q0, q0
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 69 c4              cmp32	q3, q1
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 de 6a ff              brslt16	-0x96 <L1>
 f0 32 12              ldsp16	r2, [sp+0x12]
 f0 33 14              ldsp16	r3, [sp+0x14]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c4              cmp32	q3, q1
 d2 1c                 brult8	0x1c <L4>
 f0 69 c4              cmp32	q3, q1
 db 55 ff              brne16	-0xab <L1>
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 32 1a              ldsp16	r2, [sp+0x1a]
 f0 33 1c              ldsp16	r3, [sp+0x1c]
 f0 69 4c              cmp32	q1, q3
 dd 45 ff              bruge16	-0xbb <L1>
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
<L4>:
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 e0 6b ff              jmp16	-149 <L2>
<L5>:
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
<L6>:
 d6 1e                 adjsp	0x1e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
