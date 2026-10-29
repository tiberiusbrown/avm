
complex_cacosh.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 complex_cacosh.c
00000100 l     O .data	00000008 result
00000108 l     O .data	00000004 input_real
0000010c l     O .data	00000004 input_imag
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 inverse.c
00000317 l     F .text	000004c2 cx_acos
00000000 l    df *ABS*	00000000 sf_fabs.c
00000000 l    df *ABS*	00000000 ef_acosh.c
00000000 l    df *ABS*	00000000 ef_log.c
00000000 l    df *ABS*	00000000 stdlib.c
00000000 l    df *ABS*	00000000 avm.c
00000000 l    df *ABS*	00000000 ctype.c
00000000 l    df *ABS*	00000000 strtof.c
00000000 l    df *ABS*	00000000 sf_copysign.c
00000000 l    df *ABS*	00000000 ef_sqrt.c
000009d3 l     F .text	00000025 avm_sqrt_special
00000000 l    df *ABS*	00000000 ef_acos.c
00000000 l    df *ABS*	00000000 math.c
00000000 l    df *ABS*	00000000 ef_log1p.c
00000000 l    df *ABS*	00000000 ef_atan2.c
00000000 l    df *ABS*	00000000 ef_asin.c
00000000 l    df *ABS*	00000000 ef_asinh.c
00000000 l    df *ABS*	00000000 ef_hypot.c
00000000 l    df *ABS*	00000000 ef_atanh.c
00000000 l    df *ABS*	00000000 integer.c
00000000 l    df *ABS*	00000000 wide_integer.c
00000efb l       .init_array	00000000 .hidden __init_array_end
00000efb l       .init_array	00000000 .hidden __init_array_start
00000efb l       .fini_array	00000000 .hidden __fini_array_start
00000efb l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	00000049 avm_test_main
000002b2 g     F .text	00000065 __avm_terminate
000002b0 g     F .text	00000002 avm_halt
000007d9 g     F .text	0000004e cacoshf
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000ad5 g     F .text	0000006c fminf
00000b41 g     F .text	0000005e fmaxf
00000110 g     O .data	00000002 __avm_errno
0000082a g     F .text	00000093 acoshf
00000b9f g     F .text	00000135 log1pf
000009f8 g     F .text	000000dd acosf
00000cd4 g     F .text	00000227 atan2f
000008bd g     F .text	000000f8 logf
000009ca g     F .text	00000009 sqrtf
000009b5 g     F .text	00000015 copysignf
00000827 g     F .text	00000003 fabsf

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
 e1 9c 00              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 8d 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 fb 0e              ldi16	r4, 0xefb
 c1 00                 ldi8	r5, 0x0
 c6 fb 0e              ldi16	r6, 0xefb
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 fb 0e           ldi16	r0, 0xefb
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 fb 0e           ldi16	r2, 0xefb
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
 d6 e8                 adjsp	-0x18
 c4 08 01              ldi16	r4, 0x108
 f0 6a 88              ld32	q2, [r4]
 c6 0c 01              ldi16	r6, 0x10c
 f0 6a cc              ld32	q3, [r6]
 d7 01                 sys	debug_break
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 14 10              leasp	r4, 0x10
 f0 15 08              leasp	r5, 0x8
 e1 47 05              call16	cacoshf
 c4 00 01              ldi16	r4, 0x100
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f0 6b c8              st32	[r4], q3
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 c6 04 01              ldi16	r6, 0x104
 f0 6b 8c              st32	[r6], q2
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 18                 adjsp	0x18
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
 e1 39 fd              call16	-711 <__avm_run_local_dtors>
<L0>:
 c4 fb 0e              ldi16	r4, 0xefb
 c1 00                 ldi8	r5, 0x0
 c6 fb 0e              ldi16	r6, 0xefb
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 fb 0e           ldi16	r2, 0xefb
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 fb 0e           ldi16	r0, 0xefb
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
 e1 f0 fc              call16	-784 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<cx_acos>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 da                 adjsp	-0x26
 f4 40                 stsp16	[sp+0x0], r4
 f0 30 31              ldsp16	r0, [sp+0x31]
 f0 31 33              ldsp16	r1, [sp+0x33]
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 02                    mov	r4, r6
 07                    mov	r5, r7
 e1 f9 04              call16	fabsf
 f2 66                 mov32	q1, q2
 f0 38 06              stsp16	[sp+0x6], r0
 f0 39 08              stsp16	[sp+0x8], r1
 f2 68                 mov32	q2, q0
 e1 ec 04              call16	fabsf
 f2 62                 mov32	q0, q2
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 c6 00 ff              ldi16	r6, 0xff00
 a2                    xor	r4, r6
 f1 27                 mov	r5, r3
 15                    add	r5, r5
 a6                    xor	r5, r6
 f0 3a 0a              stsp16	[sp+0xa], r2
 f0 3b 0c              stsp16	[sp+0xc], r3
 f1 2a                 mov	r6, r2
 99                    or	r6, r5
 f1 24                 mov	r5, r0
 94                    or	r5, r4
 f0 38 0e              stsp16	[sp+0xe], r0
 f0 39 10              stsp16	[sp+0x10], r1
 f6 2d                 tst16	r5
 f8 04                 cset.eq	r4
 f6 2e                 tst16	r6
 d0 50                 breq8	0x50 <L0>
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d1 49                 brne8	0x49 <L0>
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 ff 14                 fcmp
 ce 02                 cmpi.s8	r6, 0x2
 da 2e 04              breq16	0x42e <L14>
 f4 81                 lsl16.1	r1
 f9 21                 or	r1, r0
 f6 29                 tst16	r1
 db b6 00              brne16	0xb6 <L1>
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 de 26 01              brslt16	0x126 <L4>
 f2 66                 mov32	q1, q2
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f2 6a                 mov32	q3, q0
 ff 14                 fcmp
 c4 db 0f              ldi16	r4, 0xfdb
 c5 49 40              ldi16	r5, 0x4049
 ce ff                 cmpi.s8	r6, -0x1
 fb 04                 cmov.eq	r0, r4
 fb 0d                 cmov.eq	r1, r5
 f2 69                 mov32	q2, q1
 e1 7b 04              call16	acoshf
 e0 f1 00              jmp16	241 <L2>
<L0>:
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 06 00 ff           ldi16	r2, 0xff00
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 e1 f4 05              call16	copysignf
 ff 06                 fneg	q2
 f4 02                 ldsp16	r6, [sp+0x0]
 ca 04                 addi.s8	r6, 0x4
 f0 6b 8c              st32	[r6], q2
 f4 81                 lsl16.1	r1
 f9 2a                 xor	r1, r2
 f9 05                 or	r0, r1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 06 db 0f           ldi16	r2, 0xfdb
 f0 07 49 3f           ldi16	r3, 0x3f49
 f6 28                 tst16	r0
 fb 32                 cmov.eq	r6, r2
 fb 3b                 cmov.eq	r7, r3
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f0 33 0c              ldsp16	r3, [sp+0xc]
 f4 83                 lsl16.1	r3
 c4 00 ff              ldi16	r4, 0xff00
 f9 72                 xor	r3, r4
 f9 4d                 or	r2, r3
 f0 04 db 0f           ldi16	r0, 0xfdb
 f0 05 c9 3f           ldi16	r1, 0x3fc9
 f6 2a                 tst16	r2
 fb 06                 cmov.eq	r0, r6
 fb 0f                 cmov.eq	r1, r7
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
 f2 69                 mov32	q2, q1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff 14                 fcmp
 f4 6a                 stsp16	[sp+0xa], r6
 c4 db 0f              ldi16	r4, 0xfdb
 c5 49 40              ldi16	r5, 0x4049
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f4 2a                 ldsp16	r6, [sp+0xa]
 ce ff                 cmpi.s8	r6, -0x1
 fb 04                 cmov.eq	r0, r4
 fb 0d                 cmov.eq	r1, r5
 f2 69                 mov32	q2, q1
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 ff 14                 fcmp
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 ce 02                 cmpi.s8	r6, 0x2
 fb 04                 cmov.eq	r0, r4
 fb 0d                 cmov.eq	r1, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 6b 08              st32	[r4], q0
 e0 02 01              jmp16	258 <L7>
<L1>:
 c6 a9 5f              ldi16	r6, 0x5fa9
 c7 63 58              ldi16	r7, 0x5863
 f0 30 0a              ldsp16	r0, [sp+0xa]
 f0 31 0c              ldsp16	r1, [sp+0xc]
 f2 68                 mov32	q2, q0
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 da 86 00              breq16	0x86 <L5>
 c6 a9 5f              ldi16	r6, 0x5fa9
 c7 63 58              ldi16	r7, 0x5863
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d0 75                 breq8	0x75 <L5>
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f2 68                 mov32	q2, q0
 ff 14                 fcmp
 f6 2e                 tst16	r6
 db d6 00              brne16	0xd6 <L8>
 c6 ac c5              ldi16	r6, 0xc5ac
 c7 27 37              ldi16	r7, 0x3727
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 db c4 00              brne16	0xc4 <L8>
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 ff 14                 fcmp
 f1 16                 mov	r2, r6
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 e1 3c 05              call16	sqrtf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 c4 db 0f              ldi16	r4, 0xfdb
 c5 49 40              ldi16	r5, 0x4049
 ff 01                 fsub
 f2 62                 mov32	q0, q2
 f0 0e 01              cmpi.s8	r2, 0x1
 fb 06                 cmov.eq	r0, r6
 fb 0f                 cmov.eq	r1, r7
 02                    mov	r4, r6
 07                    mov	r5, r7
<L2>:
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 e1 0b 05              call16	copysignf
 f4 02                 ldsp16	r6, [sp+0x0]
<L3>:
 f0 6b 0c              st32	[r6], q0
 ff 06                 fneg	q2
 ca 04                 addi.s8	r6, 0x4
 e0 80 00              jmp16	128 <L6>
<L4>:
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 e1 3b 05              call16	acosf
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 ff 04                 fneg	q0
 f4 03                 ldsp16	r7, [sp+0x0]
 0b                    mov	r6, r7
 ca 04                 addi.s8	r6, 0x4
 f0 6b 0c              st32	[r6], q0
 f0 6b 8e              st32	[r7], q2
 d4 67                 jmp8	0x67 <L7>
<L5>:
 f2 68                 mov32	q2, q0
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 f2 6b                 mov32	q3, q1
 e1 62 06              call16	fmaxf
 f2 6a                 mov32	q3, q0
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6b                 mov32	q3, q1
 e1 eb 05              call16	fminf
 f2 6a                 mov32	q3, q0
 ff 03                 fdiv
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 e1 c8 03              call16	logf
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 e1 9f 06              call16	log1pf
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 c6 18 72              ldi16	r6, 0x7218
 c7 31 3f              ldi16	r7, 0x3f31
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 e1 b2 07              call16	atan2f
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 e1 88 04              call16	copysignf
 f4 02                 ldsp16	r6, [sp+0x0]
 f0 6b 4c              st32	[r6], q1
 ca 04                 addi.s8	r6, 0x4
 ff 06                 fneg	q2
<L6>:
 f0 6b 8c              st32	[r6], q2
<L7>:
 d6 26                 adjsp	0x26
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L8>:
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3d 24              stsp16	[sp+0x24], r5
 e1 d6 02              call16	fabsf
 f2 66                 mov32	q1, q2
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 e1 cc 02              call16	fabsf
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f2 69                 mov32	q2, q1
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 f0 3a 1a              stsp16	[sp+0x1a], r2
 f0 3b 1c              stsp16	[sp+0x1c], r3
 f2 61                 mov32	q0, q1
 f0 32 12              ldsp16	r2, [sp+0x12]
 f1 1f                 mov	r3, r7
 fb 02                 cmov.eq	r0, r2
 fb 0b                 cmov.eq	r1, r3
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 f9 81                 or	r4, r0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f6 2c                 tst16	r4
 02                    mov	r4, r6
 07                    mov	r5, r7
 d0 29                 breq8	0x29 <L9>
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 f2 6b                 mov32	q3, q1
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 fb 14                 cmov.eq	r2, r4
 fb 1d                 cmov.eq	r3, r5
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 03                 fdiv
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 00                 fadd
 e1 1c 04              call16	sqrtf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
<L9>:
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 ff 00                 fadd
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 e1 5a 02              call16	fabsf
 f2 62                 mov32	q0, q2
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 e1 50 02              call16	fabsf
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 f0 38 1a              stsp16	[sp+0x1a], r0
 f0 39 1c              stsp16	[sp+0x1c], r1
 f2 6b                 mov32	q3, q1
 fb 02                 cmov.eq	r0, r2
 fb 0b                 cmov.eq	r1, r3
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 f9 81                 or	r4, r0
 f6 2c                 tst16	r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d0 29                 breq8	0x29 <L10>
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 f2 67                 mov32	q1, q3
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 fb 14                 cmov.eq	r2, r4
 fb 1d                 cmov.eq	r3, r5
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 03                 fdiv
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 00                 fadd
 e1 af 03              call16	sqrtf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
<L10>:
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f0 30 16              ldsp16	r0, [sp+0x16]
 f0 31 18              ldsp16	r1, [sp+0x18]
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f0 33 0c              ldsp16	r3, [sp+0xc]
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 f2 68                 mov32	q2, q0
 ff 03                 fdiv
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f2 69                 mov32	q2, q1
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 14                 fcmp
 ce 02                 cmpi.s8	r6, 0x2
 f2 61                 mov32	q0, q1
 d2 44                 brult8	0x44 <L11>
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f2 62                 mov32	q0, q2
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f0 37 20              ldsp16	r7, [sp+0x20]
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 f2 69                 mov32	q2, q1
 ff 03                 fdiv
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d4 40                 jmp8	0x40 <L12>
<L11>:
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f0 37 20              ldsp16	r7, [sp+0x20]
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 f2 69                 mov32	q2, q1
 ff 03                 fdiv
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 ff 00                 fadd
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
<L12>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 e1 c0 02              call16	sqrtf
 f2 62                 mov32	q0, q2
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 ff 00                 fadd
 e1 af 02              call16	sqrtf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 e1 ac 05              call16	atan2f
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 f2 68                 mov32	q2, q0
 e1 93 02              call16	sqrtf
 f2 66                 mov32	q1, q2
 aa                    xor	r6, r6
 c7 00 40              ldi16	r7, 0x4000
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 e1 86 02              call16	sqrtf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 e1 4c 04              call16	log1pf
 f4 81                 lsl16.1	r1
 f9 21                 or	r1, r0
 f6 29                 tst16	r1
 d1 39                 brne8	0x39 <L13>
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f2 62                 mov32	q0, q2
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 ff 14                 fcmp
 f2 68                 mov32	q2, q0
 ce ff                 cmpi.s8	r6, -0x1
 d1 27                 brne8	0x27 <L13>
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 ff 01                 fsub
 e1 50 02              call16	sqrtf
 f2 62                 mov32	q0, q2
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 35 24              ldsp16	r5, [sp+0x24]
 e1 45 02              call16	sqrtf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 ff 03                 fdiv
<L13>:
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 e1 1a 02              call16	copysignf
 f4 02                 ldsp16	r6, [sp+0x0]
 f0 30 02              ldsp16	r0, [sp+0x2]
 f0 31 04              ldsp16	r1, [sp+0x4]
 e0 06 fd              jmp16	-762 <L3>
<L14>:
 f0 33 00              ldsp16	r3, [sp+0x0]
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 15                    add	r5, r5
 94                    or	r5, r4
 f6 2d                 tst16	r5
 d1 16                 brne8	0x16 <L15>
 c4 db 0f              ldi16	r4, 0xfdb
 c5 c9 3f              ldi16	r5, 0x3fc9
 f0 6b 86              st32	[r3], q2
 f0 0b 04              addi.s8	r3, 0x4
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 f0 6b 86              st32	[r3], q2
 e0 70 fd              jmp16	-656 <L7>
<L15>:
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 f0 6b 86              st32	[r3], q2
 f0 0b 04              addi.s8	r3, 0x4
 f0 6b 86              st32	[r3], q2
 e0 60 fd              jmp16	-672 <L7>

<cacoshf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 f4 50                 stsp16	[sp+0x4], r4
 f0 6a ca              ld32	q3, [r5]
 c9 04                 addi.s8	r5, 0x4
 f0 6a 4a              ld32	q1, [r5]
 d6 fc                 adjsp	-0x4
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f0 14 0a              leasp	r4, 0xa
 e1 20 fb              call16	cx_acos
 d6 04                 adjsp	0x4
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 d5 22                 call8	fabsf
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 e1 a5 01              call16	copysignf
 f4 13                 ldsp16	r7, [sp+0x4]
 0b                    mov	r6, r7
 ca 04                 addi.s8	r6, 0x4
 f0 6b 8c              st32	[r6], q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 6b 8e              st32	[r7], q2
 03                    mov	r4, r7
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<fabsf>:
 ff 0a                 fabs	q2
 ef                    ret

<acoshf>:
 b1                    push16	r1
 b0                    push16	r0
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f0 00 01              ldi8	r0, 0x1
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 c0              cmp32	q3, q0
 d2 07                 brult8	0x7 <L0>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
<L0>:
 09                    mov	r6, r5
 c7 7f 3f              ldi16	r7, 0x3f7f
 3e                    cmp	r7, r6
 d9 62                 brsge8	0x62 <L3>
 c7 80 45              ldi16	r7, 0x4580
 3b                    cmp	r6, r7
 d2 0d                 brult8	0xd <L1>
 d5 67                 call8	logf
 c6 18 72              ldi16	r6, 0x7218
 c7 31 3f              ldi16	r7, 0x3f31
 ff 00                 fadd
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
<L1>:
 c7 00 40              ldi16	r7, 0x4000
 3b                    cmp	r6, r7
 d2 19                 brult8	0x19 <L2>
 f2 62                 mov32	q0, q2
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 ff 00                 fadd
 ff 16                 fsqrt
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 d5 40                 call8	logf
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
<L2>:
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 ff 16                 fsqrt
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 15 05 29 6f 83 3a 4c 1e a7 bb 44 dc 98 3c 34 a9 aa bd 00 00 80 3f  fpoly	5, 0.00100276351, -0.00510004722, 0.0186597183, -0.0833305418, 1.0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
<L3>:
 c0 21                 ldi8	r4, 0x21
 f0 5c 10 01           stm16	[0x110], r4
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<logf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 aa                    xor	r6, r6
 c7 80 80              ldi16	r7, 0x8080
 f2 62                 mov32	q0, q2
 f7 63                 add32	q0, q3
 f0 69 c0              cmp32	q3, q0
 dd 95 00              bruge16	0x95 <L3>
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 01 7f              ldi8	r1, 0x7f
 f0 69 08              cmp32	q0, q2
 d2 0b                 brult8	0xb <L0>
 aa                    xor	r6, r6
 c7 00 4c              ldi16	r7, 0x4c00
 ff 02                 fmul
 c6 68 ff              ldi16	r6, 0xff68
 d4 03                 jmp8	0x3 <L1>
<L0>:
 c6 81 ff              ldi16	r6, 0xff81
<L1>:
 f4 42                 stsp16	[sp+0x0], r6
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f0 06 20 fb           ldi16	r2, 0xfb20
 f0 03 4a              ldi8	r3, 0x4a
 f7 64                 add32	q1, q0
 c3 80                 ldi8	r7, 0x80
 f9 ec                 and	r7, r3
 f9 3d                 or	r1, r7
 f1 28                 mov	r6, r0
 f1 2d                 mov	r7, r1
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f9 1a                 xor	r0, r6
 f9 3e                 xor	r1, r7
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f1 2b                 mov	r6, r3
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 18                    add	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 15 07 a7 65 34 3e a3 bd 8a be 49 17 97 3e 10 e7 b7 be 96 17 f6 3e 8e ab 38 bf 46 aa b8 3f  fpoly	7, 0.176169023, -0.270978063, 0.295099527, -0.359184742, 0.480648696, -0.721367717, 1.44269633
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 ff 0c                 s16tof
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 c6 18 72              ldi16	r6, 0x7218
 c7 31 3f              ldi16	r7, 0x3f31
 ff 02                 fmul
<L2>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L3>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d0 13                 breq8	0x13 <L4>
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 69 08              cmp32	q0, q2
 d9 12                 brsge8	0x12 <L5>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 d4 d5                 jmp8	-0x2b <L2>
<L4>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 10 01           stm16	[0x110], r4
 a0                    xor	r4, r4
 c5 80 ff              ldi16	r5, 0xff80
 d4 c9                 jmp8	-0x37 <L2>
<L5>:
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 0c              cmp32	q0, q3
 d8 07                 bruge8	0x7 <L6>
 c6 c0 7f              ldi16	r6, 0x7fc0
 99                    or	r6, r5
 06                    mov	r5, r6
 d4 b7                 jmp8	-0x49 <L2>
<L6>:
 c2 21                 ldi8	r6, 0x21
 f0 5e 10 01           stm16	[0x110], r6
 c6 c0 7f              ldi16	r6, 0x7fc0
 99                    or	r6, r5
 06                    mov	r5, r6
 d4 aa                 jmp8	-0x56 <L2>

<copysignf>:
 b1                    push16	r1
 b0                    push16	r0
 c6 00 80              ldi16	r6, 0x8000
 8b                    and	r6, r7
 ff 0a                 fabs	q2
 f2 62                 mov32	q0, q2
 ff 04                 fneg	q0
 af                    xor	r7, r7
 3b                    cmp	r6, r7
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<sqrtf>:
 f6 2d                 tst16	r5
 d3 03                 brslt8	0x3 <L0>
 ff 16                 fsqrt
 ef                    ret
<L0>:
 d4 00                 jmp8	avm_sqrt_special

<avm_sqrt_special>:
 09                    mov	r6, r5
 c7 7f ff              ldi16	r7, 0xff7f
 3d                    cmp	r7, r5
 d8 0b                 bruge8	0xb <L1>
 ce 80                 cmpi.s8	r6, -0x80
 d1 04                 brne8	0x4 <L0>
 f6 2c                 tst16	r4
 d0 0d                 breq8	0xd <L2>
<L0>:
 ff 16                 fsqrt
 ef                    ret
<L1>:
 c7 00 80              ldi16	r7, 0x8000
 3b                    cmp	r6, r7
 d1 04                 brne8	0x4 <L2>
 f6 2c                 tst16	r4
 d0 f3                 breq8	-0xd <L0>
<L2>:
 c2 21                 ldi8	r6, 0x21
 f0 5e 10 01           stm16	[0x110], r6
 ff 16                 fsqrt
 ef                    ret

<acosf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f2 62                 mov32	q0, q2
 f2 6a                 mov32	q3, q0
 ff 0b                 fabs	q3
 c0 01                 ldi8	r4, 0x1
 c5 80 3f              ldi16	r5, 0x3f80
 f0 69 c8              cmp32	q3, q2
 dd a3 00              bruge16	0xa3 <L2>
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 f0 69 8c              cmp32	q2, q3
 d2 39                 brult8	0x39 <L0>
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 15 04 60 4f 3b 3d 30 ef 2b 3d 0b e4 99 3d 5c aa 2a 3e      fpoly	4, 0.0457299948, 0.0419761539, 0.0751419887, 0.166665494
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 c4 db 0f              ldi16	r4, 0xfdb
 c5 c9 3f              ldi16	r5, 0x3fc9
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d4 58                 jmp8	0x58 <L1>
<L0>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 ff 01                 fsub
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 02                 fmul
 ff 16                 fsqrt
 f2 66                 mov32	q1, q2
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 15 04 60 4f 3b 3d 30 ef 2b 3d 0b e4 99 3d 5c aa 2a 3e      fpoly	4, 0.0457299948, 0.0419761539, 0.0751419887, 0.166665494
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 c4 db 0f              ldi16	r4, 0xfdb
 c5 49 40              ldi16	r5, 0x4049
 ff 01                 fsub
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 fd 34                 cmov.slt	r6, r4
 fd 3d                 cmov.slt	r7, r5
<L1>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L2>:
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 8c              cmp32	q2, q3
 d8 0a                 bruge8	0xa <L3>
 c4 c0 7f              ldi16	r4, 0x7fc0
 f9 85                 or	r4, r1
 f1 28                 mov	r6, r0
 0c                    mov	r7, r4
 d4 e4                 jmp8	-0x1c <L1>
<L3>:
 c0 21                 ldi8	r4, 0x21
 f0 5c 10 01           stm16	[0x110], r4
 c4 c0 7f              ldi16	r4, 0x7fc0
 f9 85                 or	r4, r1
 f1 28                 mov	r6, r0
 0c                    mov	r7, r4
 d4 d4                 jmp8	-0x2c <L1>

<fminf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f9 88                 and	r4, r2
 f9 ac                 and	r5, r3
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 08              cmp32	q0, q2
 d8 04                 bruge8	0x4 <L0>
 02                    mov	r4, r6
 07                    mov	r5, r7
 d4 40                 jmp8	0x40 <L3>
<L0>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 f9 88                 and	r4, r2
 f9 ac                 and	r5, r3
 f0 69 08              cmp32	q0, q2
 d8 06                 bruge8	0x6 <L1>
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 d4 2f                 jmp8	0x2f <L3>
<L1>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 62                 mov32	q0, q2
 f9 19                 or	r0, r6
 f9 3d                 or	r1, r7
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 40              cmp32	q1, q0
 d0 0e                 breq8	0xe <L2>
 f2 67                 mov32	q1, q3
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 fb 14                 cmov.eq	r2, r4
 fb 1d                 cmov.eq	r3, r5
 f2 69                 mov32	q2, q1
 d4 04                 jmp8	0x4 <L3>
<L2>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
<L3>:
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<fmaxf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 63                 mov32	q0, q3
 f2 66                 mov32	q1, q2
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 82                    and	r4, r6
 87                    and	r5, r7
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 c8              cmp32	q3, q2
 d2 3e                 brult8	0x3e <L2>
 f2 68                 mov32	q2, q0
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 82                    and	r4, r6
 87                    and	r5, r7
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L0>
 f2 61                 mov32	q0, q1
 d4 27                 jmp8	0x27 <L2>
<L0>:
 f2 68                 mov32	q2, q0
 f9 89                 or	r4, r2
 f9 ad                 or	r5, r3
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 82                    and	r4, r6
 87                    and	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 0e                 breq8	0xe <L1>
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 fb 02                 cmov.eq	r0, r2
 fb 0b                 cmov.eq	r1, r3
 d4 04                 jmp8	0x4 <L2>
<L1>:
 f9 08                 and	r0, r2
 f9 2c                 and	r1, r3
<L2>:
 f2 68                 mov32	q2, q0
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<log1pf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f9 c8                 and	r6, r2
 f9 ec                 and	r7, r3
 f2 30                 sub	r0, r0
 f0 05 80 3e           ldi16	r1, 0x3e80
 f0 69 0c              cmp32	q0, q3
 d2 26                 brult8	0x26 <L0>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 15 06 23 7f 38 be 44 43 5a 3e 99 9d 7f be b9 88 aa 3e 23 00 00 bf 00 00 80 3f      fpoly	6, -0.180172488, 0.213147223, -0.249624625, 0.333074361, -0.500002086, 1.0
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 e0 9a 00              jmp16	154 <L3>
<L0>:
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 c7 80 80              ldi16	r7, 0x8080
 f7 6b                 add32	q2, q3
 f0 69 c8              cmp32	q3, q2
 dd 90 00              bruge16	0x90 <L5>
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 7f              ldi8	r3, 0x7f
 f0 69 40              cmp32	q1, q0
 d2 0f                 brult8	0xf <L1>
 aa                    xor	r6, r6
 c7 00 4c              ldi16	r7, 0x4c00
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 c4 68 ff              ldi16	r4, 0xff68
 d4 03                 jmp8	0x3 <L2>
<L1>:
 c4 81 ff              ldi16	r4, 0xff81
<L2>:
 f4 40                 stsp16	[sp+0x0], r4
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 c6 20 fb              ldi16	r6, 0xfb20
 c3 4a                 ldi8	r7, 0x4a
 f7 6d                 add32	q3, q1
 c0 80                 ldi8	r4, 0x80
 83                    and	r4, r7
 f9 71                 or	r3, r4
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 f1 21                 mov	r4, r1
 fa 77                 lsr16i	r4, 0x7
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 18                    add	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 15 07 a7 65 34 3e a3 bd 8a be 49 17 97 3e 10 e7 b7 be 96 17 f6 3e 8e ab 38 bf 46 aa b8 3f  fpoly	7, 0.176169023, -0.270978063, 0.295099527, -0.359184742, 0.480648696, -0.721367717, 1.44269633
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 ff 0c                 s16tof
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 c6 18 72              ldi16	r6, 0x7218
 c7 31 3f              ldi16	r7, 0x3f31
<L3>:
 ff 02                 fmul
<L4>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L5>:
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 d0 13                 breq8	0x13 <L6>
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 80              cmp32	q2, q0
 d9 14                 brsge8	0x14 <L7>
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 d4 db                 jmp8	-0x25 <L4>
<L6>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 10 01           stm16	[0x110], r4
 a0                    xor	r4, r4
 c5 80 ff              ldi16	r5, 0xff80
 d4 cf                 jmp8	-0x31 <L4>
<L7>:
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 84              cmp32	q2, q1
 d8 0a                 bruge8	0xa <L8>
 c4 c0 7f              ldi16	r4, 0x7fc0
 f9 85                 or	r4, r1
 04                    mov	r5, r4
 f1 20                 mov	r4, r0
 d4 bc                 jmp8	-0x44 <L4>
<L8>:
 c0 21                 ldi8	r4, 0x21
 f0 5c 10 01           stm16	[0x110], r4
 c4 c0 7f              ldi16	r4, 0x7fc0
 f9 85                 or	r4, r1
 04                    mov	r5, r4
 f1 20                 mov	r4, r0
 d4 ac                 jmp8	-0x54 <L4>

<atan2f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f2 63                 mov32	q0, q3
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 ff 08                 fabs	q0
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 c0              cmp32	q3, q0
 d2 45                 brult8	0x45 <L0>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 0b                 fabs	q3
 f0 02 01              ldi8	r2, 0x1
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 c4              cmp32	q3, q1
 d8 35                 bruge8	0x35 <L0>
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 c4              cmp32	q3, q1
 d0 35                 breq8	0x35 <L1>
 f0 69 04              cmp32	q0, q1
 d0 56                 breq8	0x56 <L2>
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 c4              cmp32	q3, q1
 d1 60                 brne8	0x60 <L3>
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c4 c9 3f              ldi16	r4, 0x3fc9
 c5 49 3f              ldi16	r5, 0x3f49
 f0 69 04              cmp32	q0, q1
 fb 25                 cmov.eq	r4, r5
 c5 db 0f              ldi16	r5, 0xfdb
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 e0 75 01              jmp16	373 <L11>
<L0>:
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 00                 fadd
 e0 9a 01              jmp16	410 <L12>
<L1>:
 c6 00 80              ldi16	r6, 0x8000
 89                    and	r6, r5
 f2 30                 sub	r0, r0
 c7 49 40              ldi16	r7, 0x4049
 f0 05 49 c0           ldi16	r1, 0xc049
 f5 28                 cmp	r6, r0
 fb 79                 cmov.ne	r7, r1
 c6 db 0f              ldi16	r6, 0xfdb
 f2 39                 sub	r1, r1
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 69 40              cmp32	q1, q0
 fd 26                 cmov.slt	r4, r6
 fd 2f                 cmov.slt	r5, r7
 e0 74 01              jmp16	372 <L12>
<L2>:
 c4 00 80              ldi16	r4, 0x8000
 81                    and	r4, r5
 a5                    xor	r5, r5
 c6 c9 3f              ldi16	r6, 0x3fc9
 c7 c9 bf              ldi16	r7, 0xbfc9
 31                    cmp	r4, r5
 fb 77                 cmov.ne	r6, r7
 c4 db 0f              ldi16	r4, 0xfdb
 06                    mov	r5, r6
 e0 5f 01              jmp16	351 <L12>
<L3>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 69 04              cmp32	q0, q1
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f2 69                 mov32	q2, q1
 da 21 01              breq16	0x121 <L11>
 f0 69 0c              cmp32	q0, q3
 d8 34                 bruge8	0x34 <L4>
 f2 68                 mov32	q2, q0
 ff 03                 fdiv
 09                    mov	r6, r5
 c7 ff 3e              ldi16	r7, 0x3eff
 3e                    cmp	r7, r6
 d2 5f                 brult8	0x5f <L5>
 c7 7f 3e              ldi16	r7, 0x3e7f
 3e                    cmp	r7, r6
 dc a5 00              brult16	0xa5 <L7>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 ff 15 04 16 15 05 be 3e 59 4c 3e 46 aa aa be 00 00 80 3f      fpoly	4, -0.129963249, 0.199559182, -0.333330333, 1.0
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 e0 de 00              jmp16	222 <L10>
<L4>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 03                 fdiv
 09                    mov	r6, r5
 c7 ff 3e              ldi16	r7, 0x3eff
 3e                    cmp	r7, r6
 d2 50                 brult8	0x50 <L6>
 c7 7f 3e              ldi16	r7, 0x3e7f
 3e                    cmp	r7, r6
 dc 8e 00              brult16	0x8e <L8>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 ff 15 04 16 15 05 be 3e 59 4c 3e 46 aa aa be 00 00 80 3f      fpoly	4, -0.129963249, 0.199559182, -0.333330333, 1.0
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 e0 b2 00              jmp16	178 <L11>
<L5>:
 c7 3f 3f              ldi16	r7, 0x3f3f
 3e                    cmp	r7, r6
 dc 84 00              brult16	0x84 <L9>
 aa                    xor	r6, r6
 c7 20 bf              ldi16	r7, 0xbf20
 ff 00                 fadd
 ff 15 05 a1 71 d1 3d c3 37 9c 3c ed 79 a5 be fd 17 38 3f 5e 00 0f 3f  fpoly	5, 0.102267511, 0.019069558, -0.323195845, 0.719116032, 0.558599353
 e0 81 00              jmp16	129 <L10>
<L6>:
 c7 3f 3f              ldi16	r7, 0x3f3f
 3e                    cmp	r7, r6
 dc b9 00              brult16	0xb9 <L13>
 aa                    xor	r6, r6
 c7 20 bf              ldi16	r7, 0xbf20
 ff 00                 fadd
 ff 15 05 a1 71 d1 3d c3 37 9c 3c ed 79 a5 be fd 17 38 3f 5e 00 0f 3f  fpoly	5, 0.102267511, 0.019069558, -0.323195845, 0.719116032, 0.558599353
 d4 65                 jmp8	0x65 <L11>
<L7>:
 aa                    xor	r6, r6
 c7 c0 be              ldi16	r7, 0xbec0
 ff 00                 fadd
 ff 15 05 29 9e 3f 3e ad d1 05 be 09 8f 93 be 92 70 60 3f c7 b0 b7 3e  fpoly	5, 0.187126771, -0.130682662, -0.288200647, 0.876717686, 0.358770579
 d4 3c                 jmp8	0x3c <L10>
<L8>:
 aa                    xor	r6, r6
 c7 c0 be              ldi16	r7, 0xbec0
 ff 00                 fadd
 ff 15 05 29 9e 3f 3e ad d1 05 be 09 8f 93 be 92 70 60 3f c7 b0 b7 3e  fpoly	5, 0.187126771, -0.130682662, -0.288200647, 0.876717686, 0.358770579
 d4 27                 jmp8	0x27 <L11>
<L9>:
 aa                    xor	r6, r6
 c7 60 bf              ldi16	r7, 0xbf60
 ff 00                 fadd
 ff 15 05 d6 da b4 3c 79 68 9e 3d 96 b6 8f be 42 fe 10 3f 3f 05 38 3f  fpoly	5, 0.0220770054, 0.0773477033, -0.280689895, 0.566379666, 0.718830049
<L10>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 c4 db 0f              ldi16	r4, 0xfdb
 c5 c9 3f              ldi16	r5, 0x3fc9
 ff 01                 fsub
<L11>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 c4 db 0f              ldi16	r4, 0xfdb
 c5 49 40              ldi16	r5, 0x4049
 ff 01                 fsub
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f0 69 04              cmp32	q0, q1
 fd 34                 cmov.slt	r6, r4
 fd 3d                 cmov.slt	r7, r5
 f0 04 00 80           ldi16	r0, 0x8000
 f4 09                 ldsp16	r5, [sp+0x2]
 f9 14                 and	r0, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 0a                 fabs	q2
 f2 66                 mov32	q1, q2
 ff 05                 fneg	q1
 aa                    xor	r6, r6
 f5 06                 cmp	r0, r6
 fb 62                 cmov.ne	r4, r2
 fb 6b                 cmov.ne	r5, r3
<L12>:
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L13>:
 aa                    xor	r6, r6
 c7 60 bf              ldi16	r7, 0xbf60
 ff 00                 fadd
 ff 15 05 d6 da b4 3c 79 68 9e 3d 96 b6 8f be 42 fe 10 3f 3f 05 38 3f  fpoly	5, 0.0220770054, 0.0773477033, -0.280689895, 0.566379666, 0.718830049
 d4 ac                 jmp8	-0x54 <L11>
