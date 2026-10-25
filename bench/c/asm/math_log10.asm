
math_log10.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 math_log10.c
00000100 l     O .data	00000004 input
00000104 l     O .data	00000004 result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 ef_log10.c
000004ed l       .init_array	00000000 .hidden __init_array_end
000004ed l       .init_array	00000000 .hidden __init_array_start
000004ed l       .fini_array	00000000 .hidden __fini_array_start
000004ed l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	0000004c avm_test_main
00000313 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000315 g     F .text	000001d8 log10f

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
 e1 f5 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 ed 04              ldi16	r4, 0x4ed
 c1 00                 ldi8	r5, 0x0
 c6 ed 04              ldi16	r6, 0x4ed
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 ed 04           ldi16	r0, 0x4ed
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 ed 04           ldi16	r2, 0x4ed
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
 c4 ed 04              ldi16	r4, 0x4ed
 c1 00                 ldi8	r5, 0x0
 c6 ed 04              ldi16	r6, 0x4ed
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 ed 04           ldi16	r2, 0x4ed
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 ed 04           ldi16	r0, 0x4ed
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
 d5 22                 call8	log10f
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 03                 fadd	q0, q3
 ff 06                 fadd	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 b4                 dec16	r4
 f4 a4                 tst8	r4
 d1 dc                 brne8	-0x24 <L0>
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

<log10f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e8                 adjsp	-0x18
 aa                    xor	r6, r6
 c7 80 80              ldi16	r7, 0x8080
 f2 62                 mov32	q0, q2
 f7 63                 add32	q0, q3
 f0 69 c0              cmp32	q3, q0
 d2 13                 brult8	0x13 <L0>
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 ff c8 68              fcmp	r6, q2, q0
 f6 2e                 tst16	r6
 db a4 01              brne16	0x1a4 <L6>
 a0                    xor	r4, r4
 c5 80 ff              ldi16	r5, 0xff80
 e0 96 01              jmp16	406 <L5>
<L0>:
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 7f              ldi8	r3, 0x7f
 f0 69 48              cmp32	q1, q2
 d2 0d                 brult8	0xd <L1>
 f2 30                 sub	r0, r0
 f0 05 00 4c           ldi16	r1, 0x4c00
 ff 28                 fmul	q2, q0
 c6 68 ff              ldi16	r6, 0xff68
 d4 03                 jmp8	0x3 <L2>
<L1>:
 c6 81 ff              ldi16	r6, 0xff81
<L2>:
 f4 52                 stsp16	[sp+0x4], r6
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 f0 04 20 fb           ldi16	r0, 0xfb20
 f0 01 4a              ldi8	r1, 0x4a
 f7 61                 add32	q0, q1
 c2 80                 ldi8	r6, 0x80
 f9 c4                 and	r6, r1
 f9 79                 or	r3, r6
 09                    mov	r6, r5
 fa 97                 lsr16i	r6, 0x7
 f4 10                 ldsp16	r4, [sp+0x4]
 18                    add	r6, r4
 f1 21                 mov	r4, r1
 fa 77                 lsr16i	r4, 0x7
 12                    add	r4, r6
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f9 ca                 xor	r6, r2
 f9 ee                 xor	r7, r3
 f2 30                 sub	r0, r0
 f0 05 80 bf           ldi16	r1, 0xbf80
 ff 0c                 fadd	q3, q0
 f0 05 80 3d           ldi16	r1, 0x3d80
 f2 67                 mov32	q1, q3
 ff 65                 fabs	q1
 ff c8 04              fcmp	r0, q1, q0
 ff c0 42              s16tof	q2, r4
 f0 06 db 27           ldi16	r2, 0x27db
 f0 07 54 35           ldi16	r3, 0x3554
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 ff 29                 fmul	q2, q1
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 0c 01              cmpi.s8	r0, 0x1
 de bc 00              brslt16	0xbc <L3>
 f2 30                 sub	r0, r0
 f0 05 00 40           ldi16	r1, 0x4000
 f2 67                 mov32	q1, q3
 ff 04                 fadd	q1, q0
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 39                 fdiv	q2, q1
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 ff 2a                 fmul	q2, q2
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 ff 2a                 fmul	q2, q2
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 06 97 88           ldi16	r2, 0x8897
 f0 07 17 3e           ldi16	r3, 0x3e17
 f2 62                 mov32	q0, q2
 ff 21                 fmul	q0, q1
 f0 06 25 33           ldi16	r2, 0x3325
 f0 07 3a 3e           ldi16	r3, 0x3e3a
 ff 01                 fadd	q0, q1
 f2 66                 mov32	q1, q2
 ff 24                 fmul	q1, q0
 f0 04 25 49           ldi16	r0, 0x4925
 f0 05 92 3e           ldi16	r1, 0x3e92
 ff 04                 fadd	q1, q0
 f2 62                 mov32	q0, q2
 ff 21                 fmul	q0, q1
 f0 06 ab aa           ldi16	r2, 0xaaab
 f0 07 2a 3f           ldi16	r3, 0x3f2a
 ff 01                 fadd	q0, q1
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 f0 06 4f d0           ldi16	r2, 0xd04f
 f0 07 1c 3e           ldi16	r3, 0x3e1c
 f2 62                 mov32	q0, q2
 ff 21                 fmul	q0, q1
 f0 06 29 8e           ldi16	r2, 0x8e29
 f0 07 63 3e           ldi16	r3, 0x3e63
 ff 01                 fadd	q0, q1
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 ff 26                 fmul	q1, q2
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 66                 mov32	q1, q2
 ff 24                 fmul	q1, q0
 f0 04 cd cc           ldi16	r0, 0xcccd
 f0 05 cc 3e           ldi16	r1, 0x3ecc
 ff 04                 fadd	q1, q0
 ff 29                 fmul	q2, q1
 f2 30                 sub	r0, r0
 f0 05 00 3f           ldi16	r1, 0x3f00
 f2 67                 mov32	q1, q3
 ff 24                 fmul	q1, q0
 f2 63                 mov32	q0, q3
 ff 21                 fmul	q0, q1
 f2 64                 mov32	q1, q0
 ff 06                 fadd	q1, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 ff 06                 fadd	q1, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 29                 fmul	q2, q1
 ff 18                 fsub	q2, q0
 ff 0e                 fadd	q3, q2
 d4 44                 jmp8	0x44 <L4>
<L3>:
 f0 04 ab aa           ldi16	r0, 0xaaab
 f0 05 2a 3e           ldi16	r1, 0x3e2a
 f2 67                 mov32	q1, q3
 ff 24                 fmul	q1, q0
 f0 04 cd cc           ldi16	r0, 0xcccd
 f0 05 4c be           ldi16	r1, 0xbe4c
 ff 04                 fadd	q1, q0
 f2 63                 mov32	q0, q3
 ff 21                 fmul	q0, q1
 f2 42                 sub	r2, r2
 f0 07 80 3e           ldi16	r3, 0x3e80
 ff 01                 fadd	q0, q1
 f2 67                 mov32	q1, q3
 ff 24                 fmul	q1, q0
 f0 04 ab aa           ldi16	r0, 0xaaab
 f0 05 aa be           ldi16	r1, 0xbeaa
 ff 04                 fadd	q1, q0
 f2 63                 mov32	q0, q3
 ff 21                 fmul	q0, q1
 f2 42                 sub	r2, r2
 f0 07 00 3f           ldi16	r3, 0x3f00
 ff 01                 fadd	q0, q1
 f2 67                 mov32	q1, q3
 ff 25                 fmul	q1, q1
 ff 24                 fmul	q1, q0
 ff 1d                 fsub	q3, q1
<L4>:
 f0 04 80 20           ldi16	r0, 0x2080
 f0 05 9a 3e           ldi16	r1, 0x3e9a
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 ff 24                 fmul	q1, q0
 f0 04 d9 5b           ldi16	r0, 0x5bd9
 f0 05 de 3e           ldi16	r1, 0x3ede
 ff 2c                 fmul	q3, q0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 0b                 fadd	q2, q3
 ff 06                 fadd	q1, q2
 f2 69                 mov32	q2, q1
<L5>:
 d6 18                 adjsp	0x18
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L6>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c8              cmp32	q3, q2
 d9 04                 brsge8	0x4 <L7>
 ff 0a                 fadd	q2, q2
 d4 ea                 jmp8	-0x16 <L5>
<L7>:
 ff 1a                 fsub	q2, q2
 ff 38                 fdiv	q2, q0
 d4 e4                 jmp8	-0x1c <L5>
