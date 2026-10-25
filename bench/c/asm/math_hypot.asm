
math_hypot.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 math_hypot.c
00000100 l     O .data	00000004 input
00000104 l     O .data	00000004 result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 ef_hypot.c
00000000 l    df *ABS*	00000000 ef_sqrt.c
0000055c l     O .rodata	00000800 sqrt_table
00000d5c l       .init_array	00000000 .hidden __init_array_end
00000d5c l       .init_array	00000000 .hidden __init_array_start
00000d5c l       .fini_array	00000000 .hidden __fini_array_start
00000d5c l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000050 avm_test_main
00000317 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000319 g     F .text	000000fb hypotf
00000414 g     F .text	00000148 sqrtf

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
 c4 5c 0d              ldi16	r4, 0xd5c
 c1 00                 ldi8	r5, 0x0
 c6 5c 0d              ldi16	r6, 0xd5c
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 5c 0d           ldi16	r0, 0xd5c
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 5c 0d           ldi16	r2, 0xd5c
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
 c4 5c 0d              ldi16	r4, 0xd5c
 c1 00                 ldi8	r5, 0x0
 c6 5c 0d              ldi16	r6, 0xd5c
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 5c 0d           ldi16	r2, 0xd5c
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 5c 0d           ldi16	r0, 0xd5c
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
 d5 22                 call8	hypotf
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

<hypotf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f2 62                 mov32	q0, q2
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff 7f              ldi16	r5, 0x7fff
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 88                    and	r6, r4
 8d                    and	r7, r5
 f2 67                 mov32	q1, q3
 f7 74                 sub32	q1, q0
 f1 23                 mov	r4, r3
 fa bf                 asr16i	r4, 0xf
 04                    mov	r5, r4
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 f7 76                 sub32	q1, q2
 f0 69 0c              cmp32	q0, q3
 f2 68                 mov32	q2, q0
 fc 26                 cmov.ult	r4, r6
 fc 2f                 cmov.ult	r5, r7
 f0 69 c0              cmp32	q3, q0
 fc 06                 cmov.ult	r0, r6
 fc 0f                 cmov.ult	r1, r7
 c2 01                 ldi8	r6, 0x1
 c7 00 0f              ldi16	r7, 0xf00
 f0 69 4c              cmp32	q1, q3
 d3 05                 brslt8	0x5 <L0>
 ff 08                 fadd	q2, q0
 e0 b2 00              jmp16	178 <L6>
<L0>:
 c2 01                 ldi8	r6, 0x1
 c7 80 58              ldi16	r7, 0x5880
 f0 69 8c              cmp32	q2, q3
 d2 16                 brult8	0x16 <L1>
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 8c              cmp32	q2, q3
 d8 4a                 bruge8	0x4a <L3>
 aa                    xor	r6, r6
 c7 00 de              ldi16	r7, 0xde00
 f7 6b                 add32	q2, q3
 f7 63                 add32	q0, q3
 c2 44                 ldi8	r6, 0x44
 af                    xor	r7, r7
 d4 02                 jmp8	0x2 <L2>
<L1>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
<L2>:
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c6 ff ff              ldi16	r6, 0xffff
 c7 7f 26              ldi16	r7, 0x267f
 f0 69 c0              cmp32	q3, q0
 d3 5c                 brslt8	0x5c <L5>
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 d0 7a                 breq8	0x7a <L6>
 c6 ff ff              ldi16	r6, 0xffff
 c3 7f                 ldi8	r7, 0x7f
 f0 69 c0              cmp32	q3, q0
 d3 31                 brslt8	0x31 <L4>
 aa                    xor	r6, r6
 c7 80 7e              ldi16	r7, 0x7e80
 ff 2b                 fmul	q2, q3
 ff 23                 fmul	q0, q3
 f0 06 82 ff           ldi16	r2, 0xff82
 f4 02                 ldsp16	r6, [sp+0x0]
 f9 59                 or	r2, r6
 c7 ff ff              ldi16	r7, 0xffff
 f1 2a                 mov	r6, r2
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 d4 30                 jmp8	0x30 <L5>
<L3>:
 f2 66                 mov32	q1, q2
 ff 04                 fadd	q1, q0
 f0 69 8c              cmp32	q2, q3
 fb 16                 cmov.eq	r2, r6
 fb 1f                 cmov.eq	r3, r7
 f0 69 0c              cmp32	q0, q3
 fb 16                 cmov.eq	r2, r6
 fb 1f                 cmov.eq	r3, r7
 f2 69                 mov32	q2, q1
 d4 3f                 jmp8	0x3f <L6>
<L4>:
 f0 06 bc ff           ldi16	r2, 0xffbc
 f0 07 ff ff           ldi16	r3, 0xffff
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f7 6d                 add32	q3, q1
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 aa                    xor	r6, r6
 c7 00 22              ldi16	r7, 0x2200
 f7 6b                 add32	q2, q3
 f7 63                 add32	q0, q3
<L5>:
 ff 2a                 fmul	q2, q2
 ff 20                 fmul	q0, q0
 ff 02                 fadd	q0, q2
 f2 68                 mov32	q2, q0
 d5 22                 call8	sqrtf
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c0              cmp32	q3, q0
 d0 0e                 breq8	0xe <L6>
 fa 57                 lsl16i	r6, 0x7
 0e                    mov	r7, r6
 aa                    xor	r6, r6
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f7 63                 add32	q0, q3
 ff 28                 fmul	q2, q0
<L6>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<sqrtf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 da 29 01              breq16	0x129 <L8>
 f0 69 80              cmp32	q2, q0
 d3 10                 brslt8	0x10 <L0>
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 c0              cmp32	q3, q0
 d2 0c                 brult8	0xc <L1>
 ff 0a                 fadd	q2, q2
 e0 14 01              jmp16	276 <L8>
<L0>:
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 e0 0d 01              jmp16	269 <L8>
<L1>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 01 7f              ldi8	r1, 0x7f
 f0 69 0c              cmp32	q0, q3
 d2 0c                 brult8	0xc <L2>
 aa                    xor	r6, r6
 c7 80 4b              ldi16	r7, 0x4b80
 ff 2b                 fmul	q2, q3
 f0 04 e8 ff           ldi16	r0, 0xffe8
 d4 02                 jmp8	0x2 <L3>
<L2>:
 f2 30                 sub	r0, r0
<L3>:
 f0 01 7f              ldi8	r1, 0x7f
 f9 34                 and	r1, r5
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 ca 81                 addi.s8	r6, -0x7f
 c1 01                 ldi8	r5, 0x1
 86                    and	r5, r6
 fa 47                 lsl16i	r5, 0x7
 f9 a5                 or	r5, r1
 f2 28                 add	r6, r0
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 09                    mov	r6, r5
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 f0 04 f0 07           ldi16	r0, 0x7f0
 f2 39                 sub	r1, r1
 f9 18                 and	r0, r6
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 f7 66                 add32	q1, q2
 a0                    xor	r4, r4
 c5 fe 7f              ldi16	r5, 0x7ffe
 f9 ac                 and	r5, r3
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 ff 16                 fsub	q1, q2
 c4 64 05              ldi16	r4, 0x564
 c1 00                 ldi8	r5, 0x0
 f7 68                 add32	q2, q0
 f0 64 88              ldp32	q2, [q2]
 ff 29                 fmul	q2, q1
 c6 60 05              ldi16	r6, 0x560
 c3 00                 ldi8	r7, 0x0
 f7 6c                 add32	q3, q0
 f0 64 cc              ldp32	q3, [q3]
 ff 0e                 fadd	q3, q2
 ff 27                 fmul	q1, q3
 c4 5c 05              ldi16	r4, 0x55c
 c1 00                 ldi8	r5, 0x0
 f7 68                 add32	q2, q0
 f0 64 c8              ldp32	q3, [q2]
 ff 0d                 fadd	q3, q1
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 f0 69 c8              cmp32	q3, q2
 d1 0a                 brne8	0xa <L4>
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 3f           ldi16	r1, 0x3fff
 d4 73                 jmp8	0x73 <L7>
<L4>:
 c4 00 f0              ldi16	r4, 0xf000
 c5 ff ff              ldi16	r5, 0xffff
 82                    and	r4, r6
 87                    and	r5, r7
 f2 67                 mov32	q1, q3
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f2 61                 mov32	q0, q1
 ff 12                 fsub	q0, q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 0f                 fadd	q3, q3
 ff 2c                 fmul	q3, q0
 ff 2a                 fmul	q2, q2
 ff 25                 fmul	q1, q1
 ff 19                 fsub	q2, q1
 ff 0b                 fadd	q2, q3
 ff 20                 fmul	q0, q0
 ff 02                 fadd	q0, q2
 aa                    xor	r6, r6
 c7 00 34              ldi16	r7, 0x3400
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 2b                 fmul	q2, q3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 1d                 fsub	q3, q1
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 ff 1e                 fsub	q3, q2
 ff 1c                 fsub	q3, q0
 f2 42                 sub	r2, r2
 f0 07 80 27           ldi16	r3, 0x2780
 ff c8 6d              fcmp	r6, q3, q1
 ce 01                 cmpi.s8	r6, 0x1
 d1 0b                 brne8	0xb <L5>
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 d4 1b                 jmp8	0x1b <L6>
<L5>:
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 0b                 fadd	q2, q3
 ff 18                 fsub	q2, q0
 ff c8 49              fcmp	r4, q2, q1
 cc ff                 cmpi.s8	r4, -0x1
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 d1 08                 brne8	0x8 <L7>
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
<L6>:
 f7 62                 add32	q0, q2
<L7>:
 f4 10                 ldsp16	r4, [sp+0x4]
 08                    mov	r6, r4
 fa 56                 lsl16i	r6, 0x6
 c4 80 ff              ldi16	r4, 0xff80
 82                    and	r4, r6
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f7 68                 add32	q2, q0
<L8>:
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
