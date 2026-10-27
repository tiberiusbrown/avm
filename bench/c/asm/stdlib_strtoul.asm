
stdlib_strtoul.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 stdlib_strtoul.c
00000113 l     O .data	00000010 bases
00000103 l     O .data	00000010 inputs
00000100 l     O .data	00000003 call
00000123 l     O .data	00000004 result_sink
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 stdlib.c
000002f0 l     F .text	000001ac parse_ulong
00000000 l    df *ABS*	00000000 ctype.c
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 integer.c
00000000 l    df *ABS*	00000000 wide_integer.c
00000631 l       .init_array	00000000 .hidden __init_array_end
00000631 l       .init_array	00000000 .hidden __init_array_start
00000631 l       .fini_array	00000000 .hidden __fini_array_start
00000631 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	00000087 avm_test_main
000004ee g     F .text	00000065 __avm_terminate
000002ee g     F .text	00000002 avm_halt
00000166 g     O .data	00000002 __avm_errno
0000049c g     F .text	00000046 strtoul
000004e2 g     F .text	0000000c isspace
00000000  w      *UND*	00000000 __avm_run_local_dtors
000005bf g     F .text	00000072 __avm_udivmodsi4
00000553 g     F .text	0000006c __avm_mulsi3

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
 e1 d8 02              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 cb 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 31 06              ldi16	r4, 0x631
 c1 00                 ldi8	r5, 0x0
 c6 31 06              ldi16	r6, 0x631
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 31 06           ldi16	r0, 0x631
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 31 06           ldi16	r2, 0x631
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
 d6 f8                 adjsp	-0x8
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f2 4b                 sub	r3, r3
 d7 01                 sys	debug_break
 c6 13 01              ldi16	r6, 0x113
 c7 03 01              ldi16	r7, 0x103
 f0 06 00 01           ldi16	r2, 0x100
 f1 03                 mov	r0, r3
<L0>:
 f0 38 00              stsp16	[sp+0x0], r0
 f1 0b                 mov	r1, r3
<L1>:
 f0 5b 66 01           stm16	[0x166], r3
 f1 21                 mov	r4, r1
 12                    add	r4, r6
 f1 25                 mov	r5, r1
 17                    add	r5, r7
 f5 44                 ld16	r0, [r5]
 68                    ld16	r6, [r4]
 f1 22                 mov	r4, r2
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 f0 15 06              leasp	r5, 0x6
 f1 20                 mov	r4, r0
 e9                    callp	q1
 f0 06 00 01           ldi16	r2, 0x100
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f7 6b                 add32	q2, q3
 f0 56 66 01           ldm16	r6, [0x166]
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 a5                    xor	r5, r5
 f1 1d                 mov	r3, r5
 f4 18                 ldsp16	r4, [sp+0x6]
 f2 50                 sub	r4, r0
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 f7 6b                 add32	q2, q3
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 c7 03 01              ldi16	r7, 0x103
 c6 13 01              ldi16	r6, 0x113
 f0 09 02              addi.s8	r1, 0x2
 f0 0d 10              cmpi.s8	r1, 0x10
 d1 b8                 brne8	-0x48 <L1>
 f0 30 00              ldsp16	r0, [sp+0x0]
 f4 a8                 inc16	r0
 f0 0c 10              cmpi.s8	r0, 0x10
 d1 a9                 brne8	-0x57 <L0>
 c4 23 01              ldi16	r4, 0x123
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f0 6b c8              st32	[r4], q3
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<parse_ulong>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e8                 adjsp	-0x18
 f1 0e                 mov	r1, r6
 f1 04                 mov	r0, r4
 f0 36 27              ldsp16	r6, [sp+0x27]
 f0 37 29              ldsp16	r7, [sp+0x29]
 f0 32 23              ldsp16	r2, [sp+0x23]
 f0 33 25              ldsp16	r3, [sp+0x25]
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 3b 04              stsp16	[sp+0x4], r3
 f0 34 2d              ldsp16	r4, [sp+0x2d]
 f0 33 2b              ldsp16	r3, [sp+0x2b]
 f2 42                 sub	r2, r2
 ee 56 20              st16	[r3+0], r2
 f4 58                 stsp16	[sp+0x6], r4
 f5 52                 st16	[r4], r2
 f6 2d                 tst16	r5
 d0 02                 breq8	0x2 <L0>
 f5 54                 st16	[r5], r0
<L0>:
 f6 29                 tst16	r1
 d0 0f                 breq8	0xf <L1>
 f1 21                 mov	r4, r1
 c8 db                 addi.s8	r4, -0x25
 cc dd                 cmpi.s8	r4, -0x23
 d8 07                 bruge8	0x7 <L1>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 c2 16                 ldi8	r6, 0x16
 e0 43 01              jmp16	323 <L19>
<L1>:
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3d 12              stsp16	[sp+0x12], r5
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
<L2>:
 f1 10                 mov	r2, r0
 f0 6c 81              ld8u	r4, [r0+]
 e1 9b 01              call16	isspace
 f6 2c                 tst16	r4
 d1 f4                 brne8	-0xc <L2>
 ed 84 20              ld8u	r4, [r2+0]
 cc 2b                 cmpi.s8	r4, 0x2b
 d0 04                 breq8	0x4 <L3>
 cc 2d                 cmpi.s8	r4, 0x2d
 d1 09                 brne8	0x9 <L4>
<L3>:
 cc 2d                 cmpi.s8	r4, 0x2d
 f8 04                 cset.eq	r4
 ee 96 20              st16	[r3+0], r4
 f1 10                 mov	r2, r0
<L4>:
 c0 2f                 ldi8	r4, 0x2f
 f9 84                 and	r4, r1
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L5>
 f1 23                 mov	r4, r3
 d4 46                 jmp8	0x46 <L8>
<L5>:
 ed 84 20              ld8u	r4, [r2+0]
 cc 30                 cmpi.s8	r4, 0x30
 d1 36                 brne8	0x36 <L6>
 f1 23                 mov	r4, r3
 ed c4 21              ld8u	r6, [r2+1]
 c1 20                 ldi8	r5, 0x20
 96                    or	r5, r6
 f0 00 08              ldi8	r0, 0x8
 cd 78                 cmpi.s8	r5, 0x78
 d1 2c                 brne8	0x2c <L7>
 c3 10                 ldi8	r7, 0x10
 f1 1a                 mov	r3, r2
 f0 0b 02              addi.s8	r3, 0x2
 ed a4 22              ld8u	r5, [r2+2]
 09                    mov	r6, r5
 ca d0                 addi.s8	r6, -0x30
 f1 76                 zext8	r6
 ce 0a                 cmpi.s8	r6, 0xa
 d2 21                 brult8	0x21 <L9>
 09                    mov	r6, r5
 ca 9f                 addi.s8	r6, -0x61
 f1 76                 zext8	r6
 ce 1a                 cmpi.s8	r6, 0x1a
 dd e8 00              bruge16	0xe8 <L22>
 c6 a9 ff              ldi16	r6, 0xffa9
 19                    add	r6, r5
 ce 10                 cmpi.s8	r6, 0x10
 d8 07                 bruge8	0x7 <L7>
 d4 0d                 jmp8	0xd <L9>
<L6>:
 f1 23                 mov	r4, r3
 f0 00 0a              ldi8	r0, 0xa
<L7>:
 f6 29                 tst16	r1
 fb 08                 cmov.eq	r1, r0
<L8>:
 f1 1a                 mov	r3, r2
 f1 2d                 mov	r7, r1
<L9>:
 60                    ld16	r4, [r4]
 f6 2c                 tst16	r4
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f0 30 02              ldsp16	r0, [sp+0x2]
 f0 31 04              ldsp16	r1, [sp+0x4]
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 d6 fe                 adjsp	-0x2
 f0 16 16              leasp	r6, 0x16
 f4 42                 stsp16	[sp+0x0], r6
 f4 53                 stsp16	[sp+0x4], r7
 0b                    mov	r6, r7
 af                    xor	r7, r7
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 e1 e0 01              call16	__avm_udivmodsi4
 d6 02                 adjsp	0x2
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 36 14              ldsp16	r6, [sp+0x14]
 f4 62                 stsp16	[sp+0x8], r6
 f4 1b                 ldsp16	r7, [sp+0x6]
 d4 0b                 jmp8	0xb <L12>
<L10>:
 c2 01                 ldi8	r6, 0x1
 7e                    st16	[r7], r6
<L11>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 b6                 dec16	r6
 f4 42                 stsp16	[sp+0x0], r6
 f4 ab                 inc16	r3
<L12>:
 ed 46 20              ld8u	r2, [r3+0]
 f1 2a                 mov	r6, r2
 ca d0                 addi.s8	r6, -0x30
 f1 76                 zext8	r6
 ce 0a                 cmpi.s8	r6, 0xa
 d8 05                 bruge8	0x5 <L13>
 f0 0a d0              addi.s8	r2, -0x30
 d4 24                 jmp8	0x24 <L15>
<L13>:
 f1 2a                 mov	r6, r2
 ca 9f                 addi.s8	r6, -0x61
 f1 76                 zext8	r6
 ce 1a                 cmpi.s8	r6, 0x1a
 d8 05                 bruge8	0x5 <L14>
 f0 0a a9              addi.s8	r2, -0x57
 d4 15                 jmp8	0x15 <L15>
<L14>:
 f1 2a                 mov	r6, r2
 ca c9                 addi.s8	r6, -0x37
 f0 0a bf              addi.s8	r2, -0x41
 f1 72                 zext8	r2
 c7 ff ff              ldi16	r7, 0xffff
 f0 0e 1a              cmpi.s8	r2, 0x1a
 fc 3e                 cmov.ult	r7, r6
 f1 17                 mov	r2, r7
 f4 1b                 ldsp16	r7, [sp+0x6]
<L15>:
 f4 0a                 ldsp16	r6, [sp+0x2]
 f5 16                 cmp	r2, r6
 d8 27                 bruge8	0x27 <L17>
 f0 69 08              cmp32	q0, q2
 d2 b4                 brult8	-0x4c <L10>
 f0 69 80              cmp32	q2, q0
 d1 06                 brne8	0x6 <L16>
 f4 22                 ldsp16	r6, [sp+0x8]
 f5 2a                 cmp	r6, r2
 d2 a9                 brult8	-0x57 <L10>
<L16>:
 6b                    ld16	r6, [r7]
 f6 2e                 tst16	r6
 d1 a7                 brne8	-0x59 <L11>
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 e1 02 01              call16	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f1 22                 mov	r4, r2
 a5                    xor	r5, r5
 f7 6b                 add32	q2, q3
 f4 1b                 ldsp16	r7, [sp+0x6]
 d4 95                 jmp8	-0x6b <L11>
<L17>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f6 2e                 tst16	r6
 d0 1b                 breq8	0x1b <L20>
 f0 36 12              ldsp16	r6, [sp+0x12]
 f6 2e                 tst16	r6
 d0 02                 breq8	0x2 <L18>
 f5 5b                 st16	[r6], r3
<L18>:
 6b                    ld16	r6, [r7]
 f6 2e                 tst16	r6
 d0 0f                 breq8	0xf <L21>
 c2 22                 ldi8	r6, 0x22
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
<L19>:
 f0 5e 66 01           stm16	[0x166], r6
 d4 02                 jmp8	0x2 <L21>
<L20>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
<L21>:
 d6 18                 adjsp	0x18
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L22>:
 09                    mov	r6, r5
 ca bf                 addi.s8	r6, -0x41
 f1 76                 zext8	r6
 ce 1a                 cmpi.s8	r6, 0x1a
 dd 1d ff              bruge16	-0xe3 <L7>
 c6 c9 ff              ldi16	r6, 0xffc9
 19                    add	r6, r5
 ce 10                 cmpi.s8	r6, 0x10
 dc 1c ff              brult16	-0xe4 <L9>
 e0 11 ff              jmp16	-239 <L7>

<strtoul>:
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 d6 f4                 adjsp	-0xc
 f0 17 0c              leasp	r7, 0xc
 f4 6b                 stsp16	[sp+0xa], r7
 f0 17 0e              leasp	r7, 0xe
 f4 63                 stsp16	[sp+0x8], r7
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e1 2d fe              call16	parse_ulong
 d6 0c                 adjsp	0xc
 f4 02                 ldsp16	r6, [sp+0x0]
 f6 2e                 tst16	r6
 d1 10                 brne8	0x10 <L1>
 f4 0a                 ldsp16	r6, [sp+0x2]
 f6 2e                 tst16	r6
 d0 08                 breq8	0x8 <L0>
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f7 72                 sub32	q0, q2
 d4 02                 jmp8	0x2 <L1>
<L0>:
 f2 62                 mov32	q0, q2
<L1>:
 f2 68                 mov32	q2, q0
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
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
 e1 fd fa              call16	-1283 <__avm_run_local_dtors>
<L0>:
 c4 31 06              ldi16	r4, 0x631
 c1 00                 ldi8	r5, 0x0
 c6 31 06              ldi16	r6, 0x631
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 31 06           ldi16	r2, 0x631
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 31 06           ldi16	r0, 0x631
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
 e1 b4 fa              call16	-1356 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_mulsi3>:
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f1 05                 mov	r0, r5
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 f2 24                 add	r5, r0
 f4 61                 stsp16	[sp+0x8], r5
 f1 07                 mov	r0, r7
 06                    mov	r5, r6
 fa 8f                 lsr16i	r5, 0xf
 f2 24                 add	r5, r0
 fe 2c                 mul16	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 21                 ldsp16	r5, [sp+0x8]
 fe 2e                 mul16	r5, r6
 f4 61                 stsp16	[sp+0x8], r5
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 51                 stsp16	[sp+0x4], r5
 f1 76                 zext8	r6
 04                    mov	r5, r4
 f1 75                 zext8	r5
 0d                    mov	r7, r5
 f3 1e                 mulu8.w	r7, r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 13                 ldsp16	r7, [sp+0x4]
 f3 3d                 mulsu8.w	r7, r5
 f4 43                 stsp16	[sp+0x0], r7
 fa 78                 lsr16i	r4, 0x8
 f4 11                 ldsp16	r5, [sp+0x4]
 0c                    mov	r7, r4
 f3 2d                 muls8.w	r7, r5
 f3 32                 mulsu8.w	r4, r6
 04                    mov	r5, r4
 fa c8                 asr16i	r5, 0x8
 0b                    mov	r6, r7
 16                    add	r5, r6
 f4 03                 ldsp16	r7, [sp+0x0]
 0b                    mov	r6, r7
 fa d8                 asr16i	r6, 0x8
 19                    add	r6, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 19                    add	r6, r5
 f4 62                 stsp16	[sp+0x8], r6
 1c                    add	r7, r4
 fa 38                 lsl16i	r4, 0x8
 f4 19                 ldsp16	r5, [sp+0x6]
 08                    mov	r6, r4
 19                    add	r6, r5
 06                    mov	r5, r6
 34                    cmp	r5, r4
 f8 14                 cset.ult	r4
 f4 22                 ldsp16	r6, [sp+0x8]
 12                    add	r4, r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 12                    add	r4, r6
 fa 68                 lsl16i	r7, 0x8
 f4 1a                 ldsp16	r6, [sp+0x6]
 1e                    add	r7, r6
 3d                    cmp	r7, r5
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 03                    mov	r4, r7
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<__avm_udivmodsi4>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f2 63                 mov32	q0, q3
 f0 36 17              ldsp16	r6, [sp+0x17]
 f4 42                 stsp16	[sp+0x0], r6
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 d0 46                 breq8	0x46 <L1>
 c2 20                 ldi8	r6, 0x20
 f4 6a                 stsp16	[sp+0xa], r6
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f2 67                 mov32	q1, q3
 f0 38 02              stsp16	[sp+0x2], r0
 f0 39 04              stsp16	[sp+0x4], r1
 f2 63                 mov32	q0, q3
<L0>:
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f7 65                 add32	q1, q1
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f9 c9                 or	r6, r2
 f1 16                 mov	r2, r6
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f0 69 48              cmp32	q1, q2
 aa                    xor	r6, r6
 fc 74                 cmov.uge	r6, r4
 fc 7d                 cmov.uge	r7, r5
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f7 77                 sub32	q1, q3
 f8 1e                 cset.uge	r6
 f7 60                 add32	q0, q0
 f9 c1                 or	r6, r0
 f7 6a                 add32	q2, q2
 f1 06                 mov	r0, r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 b6                 dec16	r6
 f4 6a                 stsp16	[sp+0xa], r6
 f6 2e                 tst16	r6
 d1 cc                 brne8	-0x34 <L0>
 d4 0a                 jmp8	0xa <L2>
<L1>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f2 66                 mov32	q1, q2
<L2>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 6b 48              st32	[r4], q1
 f2 68                 mov32	q2, q0
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
