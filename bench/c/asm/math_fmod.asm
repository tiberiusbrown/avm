
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
0000067a l       .init_array	00000000 .hidden __init_array_end
0000067a l       .init_array	00000000 .hidden __init_array_start
0000067a l       .fini_array	00000000 .hidden __fini_array_start
0000067a l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000062 avm_test_main
00000329 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
0000032b g     F .text	000002f7 fmodf
00000622 g     F .text	0000002c __avm_ashlsi3
0000064e g     F .text	0000002c __avm_lshrsi3

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
 e1 0b 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 7a 06              ldi16	r4, 0x67a
 c1 00                 ldi8	r5, 0x0
 c6 7a 06              ldi16	r6, 0x67a
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 7a 06           ldi16	r0, 0x67a
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 7a 06           ldi16	r2, 0x67a
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
 c4 7a 06              ldi16	r4, 0x67a
 c1 00                 ldi8	r5, 0x0
 c6 7a 06              ldi16	r6, 0x67a
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 7a 06           ldi16	r2, 0x67a
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 7a 06           ldi16	r0, 0x67a
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
 d6 f6                 adjsp	-0xa
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 c2 20                 ldi8	r6, 0x20
 d7 01                 sys	debug_break
 f2 30                 sub	r0, r0
 f0 05 00 3d           ldi16	r1, 0x3d00
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f2 62                 mov32	q0, q2
<L0>:
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 62                 stsp16	[sp+0x8], r6
 f2 68                 mov32	q2, q0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 02                 fmul
 c6 00 01              ldi16	r6, 0x100
 f0 6a cc              ld32	q3, [r6]
 ff 00                 fadd
 aa                    xor	r6, r6
 c7 40 3f              ldi16	r7, 0x3f40
 d5 2e                 call8	fmodf
 f2 66                 mov32	q1, q2
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 b6                 dec16	r6
 f4 a6                 tst8	r6
 d1 c8                 brne8	-0x38 <L0>
 c6 04 01              ldi16	r6, 0x104
 f0 6b 8c              st32	[r6], q2
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0a                 adjsp	0xa
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
 d6 f4                 adjsp	-0xc
 f2 62                 mov32	q0, q2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f2 67                 mov32	q1, q3
 ff 09                 fabs	q1
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f2 6b                 mov32	q3, q1
 f0 69 48              cmp32	q1, q2
 d0 2f                 breq8	0x2f <L0>
 f2 68                 mov32	q2, q0
 ff 0a                 fabs	q2
 f2 64                 mov32	q1, q0
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 7f 7f           ldi16	r1, 0x7f7f
 f0 69 08              cmp32	q0, q2
 f2 61                 mov32	q0, q1
 d2 1a                 brult8	0x1a <L0>
 f0 00 01              ldi8	r0, 0x1
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 c0              cmp32	q3, q0
 f2 61                 mov32	q0, q1
 d8 0c                 bruge8	0xc <L0>
 f2 67                 mov32	q1, q3
 f0 69 84              cmp32	q2, q1
 d8 14                 bruge8	0x14 <L1>
 f2 68                 mov32	q2, q0
 e0 a8 02              jmp16	680 <L28>
<L0>:
 f2 68                 mov32	q2, q0
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 03                 fdiv
 e0 99 02              jmp16	665 <L28>
<L1>:
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 f0 69 84              cmp32	q2, q1
 d1 10                 brne8	0x10 <L3>
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 aa                    xor	r6, r6
 af                    xor	r7, r7
<L2>:
 f0 69 0c              cmp32	q0, q3
 fb 65                 cmov.ne	r4, r5
 04                    mov	r5, r4
 a0                    xor	r4, r4
 e0 7c 02              jmp16	636 <L28>
<L3>:
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f2 30                 sub	r0, r0
 f0 01 80              ldi8	r1, 0x80
 f0 69 40              cmp32	q1, q0
 d2 1a                 brult8	0x1a <L4>
 f2 6b                 mov32	q3, q1
 f7 6c                 add32	q3, q0
 f0 69 8c              cmp32	q2, q3
 d8 11                 bruge8	0x11 <L4>
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 ff 0a                 fabs	q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 07                 fneg	q3
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 e0 45 02              jmp16	581 <L27>
<L4>:
 c6 ff ff              ldi16	r6, 0xffff
 c3 7f                 ldi8	r7, 0x7f
 f0 69 c8              cmp32	q3, q2
 d2 43                 brult8	0x43 <L5>
 09                    mov	r6, r5
 f6 2e                 tst16	r6
 d0 46                 breq8	0x46 <L6>
 0e                    mov	r7, r6
 f4 8f                 lsr16.1	r7
 9e                    or	r7, r6
 0b                    mov	r6, r7
 fa 92                 lsr16i	r6, 0x2
 9b                    or	r6, r7
 0e                    mov	r7, r6
 fa a4                 lsr16i	r7, 0x4
 9e                    or	r7, r6
 0b                    mov	r6, r7
 fa 98                 lsr16i	r6, 0x8
 9b                    or	r6, r7
 c7 ff ff              ldi16	r7, 0xffff
 ae                    xor	r7, r6
 f0 04 55 55           ldi16	r0, 0x5555
 0b                    mov	r6, r7
 f4 8e                 lsr16.1	r6
 f9 c0                 and	r6, r0
 2e                    sub	r7, r6
 f0 04 33 33           ldi16	r0, 0x3333
 0b                    mov	r6, r7
 f9 c0                 and	r6, r0
 fa a2                 lsr16i	r7, 0x2
 f9 e0                 and	r7, r0
 1e                    add	r7, r6
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 1b                    add	r6, r7
 c7 0f 0f              ldi16	r7, 0xf0f
 8e                    and	r7, r6
 0b                    mov	r6, r7
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 c3 1f                 ldi8	r7, 0x1f
 8e                    and	r7, r6
 c6 8a ff              ldi16	r6, 0xff8a
 d4 45                 jmp8	0x45 <L7>
<L5>:
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 ca 81                 addi.s8	r6, -0x7f
 d4 3e                 jmp8	0x3e <L8>
<L6>:
 08                    mov	r6, r4
 f4 8e                 lsr16.1	r6
 98                    or	r6, r4
 0e                    mov	r7, r6
 fa a2                 lsr16i	r7, 0x2
 9e                    or	r7, r6
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 9b                    or	r6, r7
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 9e                    or	r7, r6
 0b                    mov	r6, r7
 c7 ff ff              ldi16	r7, 0xffff
 ae                    xor	r7, r6
 f0 04 55 55           ldi16	r0, 0x5555
 0b                    mov	r6, r7
 f4 8e                 lsr16.1	r6
 f9 c0                 and	r6, r0
 2e                    sub	r7, r6
 f0 04 33 33           ldi16	r0, 0x3333
 0b                    mov	r6, r7
 f9 c0                 and	r6, r0
 fa a2                 lsr16i	r7, 0x2
 f9 e0                 and	r7, r0
 1e                    add	r7, r6
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 1b                    add	r6, r7
 c7 0f 0f              ldi16	r7, 0xf0f
 8e                    and	r7, r6
 0b                    mov	r6, r7
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 c3 1f                 ldi8	r7, 0x1f
 8e                    and	r7, r6
 c6 7a ff              ldi16	r6, 0xff7a
<L7>:
 2b                    sub	r6, r7
<L8>:
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 c6 ff ff              ldi16	r6, 0xffff
 c3 7f                 ldi8	r7, 0x7f
 f0 69 c4              cmp32	q3, q1
 d2 44                 brult8	0x44 <L9>
 f1 2b                 mov	r6, r3
 f6 2e                 tst16	r6
 d0 47                 breq8	0x47 <L10>
 0e                    mov	r7, r6
 f4 8f                 lsr16.1	r7
 9e                    or	r7, r6
 0b                    mov	r6, r7
 fa 92                 lsr16i	r6, 0x2
 9b                    or	r6, r7
 0e                    mov	r7, r6
 fa a4                 lsr16i	r7, 0x4
 9e                    or	r7, r6
 0b                    mov	r6, r7
 fa 98                 lsr16i	r6, 0x8
 9b                    or	r6, r7
 c7 ff ff              ldi16	r7, 0xffff
 ae                    xor	r7, r6
 f0 04 55 55           ldi16	r0, 0x5555
 0b                    mov	r6, r7
 f4 8e                 lsr16.1	r6
 f9 c0                 and	r6, r0
 2e                    sub	r7, r6
 f0 04 33 33           ldi16	r0, 0x3333
 0b                    mov	r6, r7
 f9 c0                 and	r6, r0
 fa a2                 lsr16i	r7, 0x2
 f9 e0                 and	r7, r0
 1e                    add	r7, r6
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 1b                    add	r6, r7
 c7 0f 0f              ldi16	r7, 0xf0f
 8e                    and	r7, r6
 0b                    mov	r6, r7
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 c3 1f                 ldi8	r7, 0x1f
 8e                    and	r7, r6
 c6 8a ff              ldi16	r6, 0xff8a
 d4 48                 jmp8	0x48 <L11>
<L9>:
 f1 2b                 mov	r6, r3
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 ca 81                 addi.s8	r6, -0x7f
 d4 40                 jmp8	0x40 <L12>
<L10>:
 f1 2a                 mov	r6, r2
 f4 8e                 lsr16.1	r6
 f9 c9                 or	r6, r2
 0e                    mov	r7, r6
 fa a2                 lsr16i	r7, 0x2
 9e                    or	r7, r6
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 9b                    or	r6, r7
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 9e                    or	r7, r6
 0b                    mov	r6, r7
 c7 ff ff              ldi16	r7, 0xffff
 ae                    xor	r7, r6
 f0 04 55 55           ldi16	r0, 0x5555
 0b                    mov	r6, r7
 f4 8e                 lsr16.1	r6
 f9 c0                 and	r6, r0
 2e                    sub	r7, r6
 f0 04 33 33           ldi16	r0, 0x3333
 0b                    mov	r6, r7
 f9 c0                 and	r6, r0
 fa a2                 lsr16i	r7, 0x2
 f9 e0                 and	r7, r0
 1e                    add	r7, r6
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 1b                    add	r6, r7
 c7 0f 0f              ldi16	r7, 0xf0f
 8e                    and	r7, r6
 0b                    mov	r6, r7
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 c3 1f                 ldi8	r7, 0x1f
 8e                    and	r7, r6
 c6 7a ff              ldi16	r6, 0xff7a
<L11>:
 2b                    sub	r6, r7
<L12>:
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 22                 ldsp16	r6, [sp+0x8]
 ce 82                 cmpi.s8	r6, -0x7e
 c7 82 ff              ldi16	r7, 0xff82
 f0 00 7f              ldi8	r0, 0x7f
 f0 01 80              ldi8	r1, 0x80
 d3 62                 brslt8	0x62 <L18>
 f9 a0                 and	r5, r0
 f9 a5                 or	r5, r1
 f1 04                 mov	r0, r4
 f1 0d                 mov	r1, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 82                 cmpi.s8	r4, -0x7e
 d9 6c                 brsge8	0x6c <L19>
<L13>:
 c4 82 ff              ldi16	r4, 0xff82
 f4 02                 ldsp16	r6, [sp+0x0]
 22                    sub	r4, r6
 08                    mov	r6, r4
 af                    xor	r7, r7
 f2 69                 mov32	q2, q1
 e1 fd 00              call16	__avm_ashlsi3
 f2 66                 mov32	q1, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 22                 ldsp16	r6, [sp+0x8]
 32                    cmp	r4, r6
 d0 64                 breq8	0x64 <L20>
<L14>:
 22                    sub	r4, r6
 f2 6b                 mov32	q3, q1
 d4 10                 jmp8	0x10 <L17>
<L15>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 20                 ldsp16	r4, [sp+0x8]
<L16>:
 f7 60                 add32	q0, q0
 f4 ac                 inc16	r4
 f6 2c                 tst16	r4
 f8 05                 cset.eq	r5
 cd 01                 cmpi.s8	r5, 0x1
 d0 51                 breq8	0x51 <L21>
<L17>:
 f4 60                 stsp16	[sp+0x8], r4
 f2 64                 mov32	q1, q0
 f7 77                 sub32	q1, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 d3 e1                 brslt8	-0x1f <L15>
 f0 69 08              cmp32	q0, q2
 f2 61                 mov32	q0, q1
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 20                 ldsp16	r4, [sp+0x8]
 d1 da                 brne8	-0x26 <L16>
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 e0 29 fe              jmp16	-471 <L2>
<L18>:
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f1 07                 mov	r0, r7
 f2 36                 sub	r0, r6
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 e1 a8 00              call16	__avm_ashlsi3
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 cc 82                 cmpi.s8	r4, -0x7e
 d3 94                 brslt8	-0x6c <L13>
<L19>:
 c1 7f                 ldi8	r5, 0x7f
 f9 ac                 and	r5, r3
 c2 80                 ldi8	r6, 0x80
 96                    or	r5, r6
 f1 1d                 mov	r3, r5
 f4 22                 ldsp16	r6, [sp+0x8]
 32                    cmp	r4, r6
 d1 9c                 brne8	-0x64 <L14>
<L20>:
 f2 6b                 mov32	q3, q1
<L21>:
 f2 68                 mov32	q2, q0
 f7 7b                 sub32	q2, q3
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 fd 20                 cmov.slt	r4, r0
 fd 29                 cmov.slt	r5, r1
 f0 69 84              cmp32	q2, q1
 d0 20                 breq8	0x20 <L23>
 c6 ff ff              ldi16	r6, 0xffff
 c3 7f                 ldi8	r7, 0x7f
 f0 69 c8              cmp32	q3, q2
 d3 27                 brslt8	0x27 <L24>
 aa                    xor	r6, r6
 c3 80                 ldi8	r7, 0x80
 f2 63                 mov32	q0, q3
 f4 02                 ldsp16	r6, [sp+0x0]
<L22>:
 f4 b6                 dec16	r6
 f7 6a                 add32	q2, q2
 f0 69 80              cmp32	q2, q0
 d3 f7                 brslt8	-0x9 <L22>
 ce 82                 cmpi.s8	r6, -0x7e
 d3 32                 brslt8	0x32 <L26>
 d4 17                 jmp8	0x17 <L25>
<L23>:
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 69 c4              cmp32	q3, q1
 fb 65                 cmov.ne	r4, r5
 04                    mov	r5, r4
 a0                    xor	r4, r4
 d4 42                 jmp8	0x42 <L28>
<L24>:
 f4 02                 ldsp16	r6, [sp+0x0]
 ce 82                 cmpi.s8	r6, -0x7e
 d3 19                 brslt8	0x19 <L26>
<L25>:
 fa 57                 lsl16i	r6, 0x7
 c7 80 3f              ldi16	r7, 0x3f80
 1e                    add	r7, r6
 f2 30                 sub	r0, r0
 f0 05 80 ff           ldi16	r1, 0xff80
 f7 68                 add32	q2, q0
 f0 31 06              ldsp16	r1, [sp+0x6]
 f9 35                 or	r1, r5
 f9 3d                 or	r1, r7
 f1 25                 mov	r5, r1
 d4 23                 jmp8	0x23 <L28>
<L26>:
 c7 82 ff              ldi16	r7, 0xff82
 2e                    sub	r7, r6
 0b                    mov	r6, r7
 af                    xor	r7, r7
 d5 4e                 call8	__avm_lshrsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff 7f              ldi16	r5, 0x7fff
 82                    and	r4, r6
 87                    and	r5, r7
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 07                 fneg	q3
<L27>:
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f0 69 04              cmp32	q0, q1
 fb 66                 cmov.ne	r4, r6
 fb 6f                 cmov.ne	r5, r7
<L28>:
 d6 0c                 adjsp	0xc
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
