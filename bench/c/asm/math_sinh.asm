
math_sinh.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 math_sinh.c
000004a7 l     O .rodata	00000040 inputs
00000100 l     O .data	00000004 result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 ef_sinh.c
00000000 l    df *ABS*	00000000 ef_exp.c
000004e7 l       .init_array	00000000 .hidden __init_array_end
000004e7 l       .init_array	00000000 .hidden __init_array_start
000004e7 l       .fini_array	00000000 .hidden __fini_array_start
000004e7 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000035 avm_test_main
000002fc g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000002fe g     F .text	000000ac sinhf
000003aa g     F .text	000000fd expf

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
 e1 de 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 e7 04              ldi16	r4, 0x4e7
 c1 00                 ldi8	r5, 0x0
 c6 e7 04              ldi16	r6, 0x4e7
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 e7 04           ldi16	r0, 0x4e7
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 e7 04           ldi16	r2, 0x4e7
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
 c4 e7 04              ldi16	r4, 0x4e7
 c1 00                 ldi8	r5, 0x0
 c6 e7 04              ldi16	r6, 0x4e7
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 e7 04           ldi16	r2, 0x4e7
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 e7 04           ldi16	r0, 0x4e7
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
 d7 01                 sys	debug_break
 f0 01 0f              ldi8	r1, 0xf
 f0 06 a7 04           ldi16	r2, 0x4a7
 f0 03 00              ldi8	r3, 0x0
<L0>:
 f1 20                 mov	r4, r0
 f9 84                 and	r4, r1
 10                    add	r4, r4
 10                    add	r4, r4
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 64 88              ldp32	q2, [q2]
 d5 17                 call8	sinhf
 c6 00 01              ldi16	r6, 0x100
 f0 6b 8c              st32	[r6], q2
 f4 a8                 inc16	r0
 f0 0c 20              cmpi.s8	r0, 0x20
 d1 e5                 brne8	-0x1b <L0>
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<sinhf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 ff 0a                 fabs	q2
 f1 15                 mov	r2, r5
 c6 7f 3f              ldi16	r6, 0x3f7f
 f5 2a                 cmp	r6, r2
 d2 21                 brult8	0x21 <L0>
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 ff 16 04 08 6e 54 39 f2 81 08 3c b1 aa 2a 3e 00 00 80 3f      fpoly	4, 2.02588853E-4, 0.00833176262, 0.166666761, 1.0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 d4 75                 jmp8	0x75 <L5>
<L0>:
 c6 80 7f              ldi16	r6, 0x7f80
 f5 16                 cmp	r2, r6
 d2 08                 brult8	0x8 <L1>
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 d4 66                 jmp8	0x66 <L5>
<L1>:
 c7 0f 41              ldi16	r7, 0x410f
 f5 2e                 cmp	r7, r2
 d2 1a                 brult8	0x1a <L2>
 d5 62                 call8	expf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 ff 03                 fdiv
 f2 66                 mov32	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 02                 fmul
 d4 3f                 jmp8	0x3f <L4>
<L2>:
 f0 06 fd d4           ldi16	r2, 0xd4fd
 f0 07 b2 42           ldi16	r3, 0x42b2
 f0 69 84              cmp32	q2, q1
 d2 14                 brult8	0x14 <L3>
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 a5                    xor	r5, r5
 c7 80 ff              ldi16	r7, 0xff80
 f0 69 08              cmp32	q0, q2
 fb 77                 cmov.ne	r6, r7
 06                    mov	r5, r6
 d4 24                 jmp8	0x24 <L5>
<L3>:
 c6 18 72              ldi16	r6, 0x7218
 c7 31 bf              ldi16	r7, 0xbf31
 ff 00                 fadd
 d5 1f                 call8	expf
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 ff 14                 fcmp
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 7f 7f           ldi16	r3, 0x7f7f
 f6 2e                 tst16	r6
 fb 22                 cmov.eq	r4, r2
 fb 2b                 cmov.eq	r5, r3
<L4>:
 c6 00 80              ldi16	r6, 0x8000
 f9 c4                 and	r6, r1
 96                    or	r5, r6
<L5>:
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<expf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 0c              cmp32	q0, q3
 d2 1a                 brult8	0x1a <L0>
 f0 69 0c              cmp32	q0, q3
 db ae 00              brne16	0xae <L3>
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 08              cmp32	q0, q2
 fd 34                 cmov.slt	r6, r4
 fd 3d                 cmov.slt	r7, r5
 e0 bf 00              jmp16	191 <L6>
<L0>:
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 d3 0e                 brslt8	0xe <L1>
 f0 06 17 72           ldi16	r2, 0x7217
 f0 07 b1 42           ldi16	r3, 0x42b1
 f0 69 40              cmp32	q1, q0
 dc a8 00              brult16	0xa8 <L6>
<L1>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c8              cmp32	q3, q2
 d3 0e                 brslt8	0xe <L2>
 c6 b5 f1              ldi16	r6, 0xf1b5
 c7 cf 42              ldi16	r7, 0x42cf
 f0 69 c0              cmp32	q3, q0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 dc 8f 00              brult16	0x8f <L6>
<L2>:
 c6 3b aa              ldi16	r6, 0xaa3b
 c7 b8 3f              ldi16	r7, 0x3fb8
 f2 66                 mov32	q1, q2
 ff 02                 fmul
 c6 18 72              ldi16	r6, 0x7218
 c7 b1 3e              ldi16	r7, 0x3eb1
 f0 69 c0              cmp32	q3, q0
 d8 5d                 bruge8	0x5d <L4>
 f1 2b                 mov	r6, r3
 fa 9f                 lsr16i	r6, 0xf
 c7 00 3f              ldi16	r7, 0x3f00
 f0 04 00 bf           ldi16	r0, 0xbf00
 f4 a6                 tst8	r6
 fb 78                 cmov.ne	r7, r0
 aa                    xor	r6, r6
 f2 62                 mov32	q0, q2
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
 d9 38                 brsge8	0x38 <L5>
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
 d4 25                 jmp8	0x25 <L6>
<L3>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d4 1d                 jmp8	0x1d <L6>
<L4>:
 ff 16 05 66 01 1d 3c 23 fe 64 3d bc 01 76 3e 96 70 31 3f 00 00 80 3f  fpoly	5, 0.00958285294, 0.0559064262, 0.240240991, 0.693124175, 1.0
 af                    xor	r7, r7
<L5>:
 fa 67                 lsl16i	r7, 0x7
 aa                    xor	r6, r6
 f7 6e                 add32	q3, q2
<L6>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
