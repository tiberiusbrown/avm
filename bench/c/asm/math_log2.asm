
math_log2.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 math_log2.c
00000100 l     O .data	00000004 input
00000104 l     O .data	00000004 result
00000000 l    df *ABS*	00000000 math.c
00000000 l    df *ABS*	00000000 runtime.c
000008f5 l       .init_array	00000000 .hidden __init_array_end
000008f5 l       .init_array	00000000 .hidden __init_array_start
000008f5 l       .fini_array	00000000 .hidden __fini_array_start
000008f5 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	0000004c avm_test_main
000008f3 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000313 g     F .text	000005e0 log2f

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
 e1 d5 06              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 f5 08              ldi16	r4, 0x8f5
 c1 00                 ldi8	r5, 0x0
 c6 f5 08              ldi16	r6, 0x8f5
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 f5 08           ldi16	r0, 0x8f5
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 f5 08           ldi16	r2, 0x8f5
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
 c4 f5 08              ldi16	r4, 0x8f5
 c1 00                 ldi8	r5, 0x0
 c6 f5 08              ldi16	r6, 0x8f5
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 f5 08           ldi16	r2, 0x8f5
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 f5 08           ldi16	r0, 0x8f5
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
 d5 20                 call8	log2f
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

<log2f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e0                 adjsp	-0x20
 f2 66                 mov32	q1, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f0 69 48              cmp32	q1, q2
 d1 05                 brne8	0x5 <L0>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e0 46 03              jmp16	838 <L14>
<L0>:
 a0                    xor	r4, r4
 c5 80 80              ldi16	r5, 0x8080
 f2 61                 mov32	q0, q1
 f7 62                 add32	q0, q2
 f0 69 80              cmp32	q2, q0
 d2 11                 brult8	0x11 <L1>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 ff c8 66              fcmp	r6, q1, q2
 f6 2e                 tst16	r6
 db fc 01              brne16	0x1fc <L4>
 a0                    xor	r4, r4
 c5 80 ff              ldi16	r5, 0xff80
 e0 28 03              jmp16	808 <L14>
<L1>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 01 7f              ldi8	r1, 0x7f
 f0 69 04              cmp32	q0, q1
 d2 0b                 brult8	0xb <L2>
 a0                    xor	r4, r4
 c5 00 4c              ldi16	r5, 0x4c00
 ff 26                 fmul	q1, q2
 c4 68 ff              ldi16	r4, 0xff68
 d4 03                 jmp8	0x3 <L3>
<L2>:
 c4 81 ff              ldi16	r4, 0xff81
<L3>:
 f4 50                 stsp16	[sp+0x4], r4
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f9 08                 and	r0, r2
 f9 2c                 and	r1, r3
 c4 20 fb              ldi16	r4, 0xfb20
 c1 4a                 ldi8	r5, 0x4a
 f7 68                 add32	q2, q0
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c0 80                 ldi8	r4, 0x80
 0d                    mov	r7, r5
 83                    and	r4, r7
 f9 85                 or	r4, r1
 f0 06 00 3f           ldi16	r2, 0x3f00
 f9 45                 or	r2, r1
 c5 80 3f              ldi16	r5, 0x3f80
 f9 a5                 or	r5, r1
 f1 28                 mov	r6, r0
 0d                    mov	r7, r5
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f1 1a                 mov	r3, r2
 f1 10                 mov	r2, r0
 f0 38 18              stsp16	[sp+0x18], r0
 f0 39 1a              stsp16	[sp+0x1a], r1
 f1 0c                 mov	r1, r4
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 c4 f3 04              ldi16	r4, 0x4f3
 c5 b5 3f              ldi16	r5, 0x3fb5
 f0 69 8c              cmp32	q2, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 fc 22                 cmov.ult	r4, r2
 fc 2b                 cmov.ult	r5, r3
 c2 0f                 ldi8	r6, 0xf
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f0 06 f0 ff           ldi16	r2, 0xfff0
 f0 03 7f              ldi8	r3, 0x7f
 f9 58                 and	r2, r6
 f9 7c                 and	r3, r7
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 f4 0b                 ldsp16	r7, [sp+0x2]
 0b                    mov	r6, r7
 fa 97                 lsr16i	r6, 0x7
 18                    add	r6, r4
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 ff 02                 fadd	q0, q2
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 c4 f3 04              ldi16	r4, 0x4f3
 c5 b5 3f              ldi16	r5, 0x3fb5
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f0 69 80              cmp32	q2, q0
 f8 17                 cset.ult	r7
 f4 29                 ldsp16	r5, [sp+0xa]
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 f4 11                 ldsp16	r5, [sp+0x4]
 11                    add	r4, r5
 13                    add	r4, r7
 ff c0 41              s16tof	q1, r4
 ca 81                 addi.s8	r6, -0x7f
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f0 69 c8              cmp32	q3, q2
 da 5c 01              breq16	0x15c <L5>
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f2 6a                 mov32	q3, q0
 ff 0e                 fadd	q3, q2
 f2 68                 mov32	q2, q0
 ff 3b                 fdiv	q2, q3
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 ff 2a                 fmul	q2, q2
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 ff 2a                 fmul	q2, q2
 f0 06 97 88           ldi16	r2, 0x8897
 f0 07 17 3e           ldi16	r3, 0x3e17
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2d                 fmul	q3, q1
 f0 06 25 33           ldi16	r2, 0x3325
 f0 07 3a 3e           ldi16	r3, 0x3e3a
 ff 0d                 fadd	q3, q1
 f0 06 88 c2           ldi16	r2, 0xc288
 f0 03 35              ldi8	r3, 0x35
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 f7 74                 sub32	q1, q0
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 3b 1e              stsp16	[sp+0x1e], r3
 f0 06 30 5c           ldi16	r2, 0x5c30
 f0 07 cf ff           ldi16	r3, 0xffcf
 f7 64                 add32	q1, q0
 f2 62                 mov32	q0, q2
 ff 23                 fmul	q0, q3
 c6 25 49              ldi16	r6, 0x4925
 c7 92 3e              ldi16	r7, 0x3e92
 ff 03                 fadd	q0, q3
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 c6 4f d0              ldi16	r6, 0xd04f
 c7 1c 3e              ldi16	r7, 0x3e1c
 f2 62                 mov32	q0, q2
 ff 23                 fmul	q0, q3
 c6 29 8e              ldi16	r6, 0x8e29
 c7 63 3e              ldi16	r7, 0x3e63
 ff 03                 fadd	q0, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2c                 fmul	q3, q0
 f0 04 cd cc           ldi16	r0, 0xcccd
 f0 05 cc 3e           ldi16	r1, 0x3ecc
 ff 0c                 fadd	q3, q0
 f2 61                 mov32	q0, q1
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 f9 09                 or	r0, r2
 f9 2d                 or	r1, r3
 f0 38 18              stsp16	[sp+0x18], r0
 f0 39 1a              stsp16	[sp+0x1a], r1
 f2 62                 mov32	q0, q2
 ff 23                 fmul	q0, q3
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 2b                 fmul	q2, q3
 c6 ab aa              ldi16	r6, 0xaaab
 c7 2a 3f              ldi16	r7, 0x3f2a
 ff 0b                 fadd	q2, q3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 2e                 fmul	q3, q2
 ff 03                 fadd	q0, q3
 f4 10                 ldsp16	r4, [sp+0x4]
 ff c0 42              s16tof	q2, r4
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f0 32 18              ldsp16	r2, [sp+0x18]
 f0 33 1a              ldsp16	r3, [sp+0x1a]
 f0 69 4c              cmp32	q1, q3
 de bb 00              brslt16	0xbb <L6>
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f2 61                 mov32	q0, q1
 ff 23                 fmul	q0, q3
 f2 6b                 mov32	q3, q1
 ff 2c                 fmul	q3, q0
 f2 63                 mov32	q0, q3
 f4 12                 ldsp16	r6, [sp+0x4]
 f6 2e                 tst16	r6
 f0 38 18              stsp16	[sp+0x18], r0
 f0 39 1a              stsp16	[sp+0x1a], r1
 da cc 00              breq16	0xcc <L7>
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 03                 fadd	q0, q3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 2c                 fmul	q3, q0
 f0 04 d1 f7           ldi16	r0, 0xf7d1
 f0 05 17 37           ldi16	r1, 0x3717
 f2 66                 mov32	q1, q2
 ff 24                 fmul	q1, q0
 ff 07                 fadd	q1, q3
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 ff 1d                 fsub	q3, q1
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 ff 1c                 fsub	q3, q0
 f0 04 80 71           ldi16	r0, 0x7180
 f0 05 31 3f           ldi16	r1, 0x3f31
 ff 28                 fmul	q2, q0
 ff 1b                 fsub	q2, q3
 e0 23 01              jmp16	291 <L12>
<L4>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c4              cmp32	q3, q1
 df a5 00              brsge16	0xa5 <L8>
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 4c              cmp32	q1, q3
 dd f5 00              bruge16	0xf5 <L10>
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 01 7f              ldi8	r1, 0x7f
 f0 69 04              cmp32	q0, q1
 dc 17 01              brult16	0x117 <L15>
 aa                    xor	r6, r6
 c7 00 4c              ldi16	r7, 0x4c00
 ff 27                 fmul	q1, q3
 c6 68 ff              ldi16	r6, 0xff68
 e0 0e 01              jmp16	270 <L16>
<L5>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff c8 6e              fcmp	r6, q3, q2
 f6 2e                 tst16	r6
 d1 7f                 brne8	0x7f <L9>
 f4 12                 ldsp16	r6, [sp+0x4]
 f6 2e                 tst16	r6
 da e8 00              breq16	0xe8 <L13>
 ff c0 62              s16tof	q2, r6
 c6 d1 f7              ldi16	r6, 0xf7d1
 c7 17 37              ldi16	r7, 0x3717
 f2 62                 mov32	q0, q2
 ff 23                 fmul	q0, q3
 c6 80 71              ldi16	r6, 0x7180
 c7 31 3f              ldi16	r7, 0x3f31
 ff 2b                 fmul	q2, q3
 ff 08                 fadd	q2, q0
 e0 ce 00              jmp16	206 <L13>
<L6>:
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f4 12                 ldsp16	r6, [sp+0x4]
 f6 2e                 tst16	r6
 da a9 00              breq16	0xa9 <L11>
 f2 6b                 mov32	q3, q1
 ff 1c                 fsub	q3, q0
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 ff 27                 fmul	q1, q3
 c6 d1 f7              ldi16	r6, 0xf7d1
 c7 17 b7              ldi16	r7, 0xb717
 f2 62                 mov32	q0, q2
 ff 23                 fmul	q0, q3
 ff 04                 fadd	q1, q0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 17                 fsub	q1, q3
 c6 80 71              ldi16	r6, 0x7180
 c7 31 3f              ldi16	r7, 0x3f31
 ff 2b                 fmul	q2, q3
 ff 19                 fsub	q2, q1
 e0 90 00              jmp16	144 <L12>
<L7>:
 f2 68                 mov32	q2, q0
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 0b                 fadd	q2, q3
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 ff 22                 fmul	q0, q2
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 ff 12                 fsub	q0, q2
 ff 04                 fadd	q1, q0
 f2 69                 mov32	q2, q1
 d4 72                 jmp8	0x72 <L12>
<L8>:
 ff 15                 fsub	q1, q1
 ff 36                 fdiv	q1, q2
 f2 69                 mov32	q2, q1
 d4 7a                 jmp8	0x7a <L14>
<L9>:
 c4 ab aa              ldi16	r4, 0xaaab
 c5 aa be              ldi16	r5, 0xbeaa
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f2 63                 mov32	q0, q3
 ff 22                 fmul	q0, q2
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 ff 02                 fadd	q0, q2
 ff 2f                 fmul	q3, q3
 ff 2c                 fmul	q3, q0
 f4 10                 ldsp16	r4, [sp+0x4]
 f6 2c                 tst16	r4
 da e5 01              breq16	0x1e5 <L17>
 ff c0 40              s16tof	q0, r4
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 f0 06 80 71           ldi16	r2, 0x7180
 f0 07 31 3f           ldi16	r3, 0x3f31
 f2 68                 mov32	q2, q0
 ff 29                 fmul	q2, q1
 f0 06 d1 f7           ldi16	r2, 0xf7d1
 f0 07 17 b7           ldi16	r3, 0xb717
 ff 21                 fmul	q0, q1
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 ff 0c                 fadd	q3, q0
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 ff 1c                 fsub	q3, q0
 ff 1b                 fsub	q2, q3
 d4 1e                 jmp8	0x1e <L13>
<L10>:
 ff 05                 fadd	q1, q1
 f2 69                 mov32	q2, q1
 d4 22                 jmp8	0x22 <L14>
<L11>:
 f2 6b                 mov32	q3, q1
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 18                 fsub	q2, q0
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 ff 22                 fmul	q0, q2
 ff 1c                 fsub	q3, q0
 02                    mov	r4, r6
 07                    mov	r5, r7
<L12>:
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
<L13>:
 c6 3b aa              ldi16	r6, 0xaa3b
 c7 b8 3f              ldi16	r7, 0x3fb8
 ff 2b                 fmul	q2, q3
 ff 09                 fadd	q2, q1
<L14>:
 d6 20                 adjsp	0x20
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L15>:
 c6 81 ff              ldi16	r6, 0xff81
<L16>:
 f4 42                 stsp16	[sp+0x0], r6
 f9 08                 and	r0, r2
 f9 2c                 and	r1, r3
 c6 20 fb              ldi16	r6, 0xfb20
 c3 4a                 ldi8	r7, 0x4a
 f7 6c                 add32	q3, q0
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 c0 80                 ldi8	r4, 0x80
 83                    and	r4, r7
 f1 2d                 mov	r7, r1
 9c                    or	r7, r4
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f1 0f                 mov	r1, r7
 f1 23                 mov	r4, r3
 a5                    xor	r5, r5
 fa b7                 asr16i	r4, 0x7
 f4 02                 ldsp16	r6, [sp+0x0]
 12                    add	r4, r6
 f4 1b                 ldsp16	r7, [sp+0x6]
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 18                    add	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f9 1a                 xor	r0, r6
 f9 3e                 xor	r1, r7
 c2 0f                 ldi8	r6, 0xf
 af                    xor	r7, r7
 f7 6d                 add32	q3, q1
 f2 64                 mov32	q1, q0
 f0 04 f0 ff           ldi16	r0, 0xfff0
 f0 01 7f              ldi8	r1, 0x7f
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 ff 07                 fadd	q1, q3
 a0                    xor	r4, r4
 f0 69 08              cmp32	q0, q2
 da 30 01              breq16	0x130 <L18>
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 f2 6b                 mov32	q3, q1
 ff 0e                 fadd	q3, q2
 f2 69                 mov32	q2, q1
 ff 3b                 fdiv	q2, q3
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 ff 2a                 fmul	q2, q2
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 ff 2a                 fmul	q2, q2
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 06 97 88           ldi16	r2, 0x8897
 f0 07 17 3e           ldi16	r3, 0x3e17
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2d                 fmul	q3, q1
 f0 06 25 33           ldi16	r2, 0x3325
 f0 07 3a 3e           ldi16	r3, 0x3e3a
 ff 0d                 fadd	q3, q1
 f0 06 88 c2           ldi16	r2, 0xc288
 f0 03 35              ldi8	r3, 0x35
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f7 74                 sub32	q1, q0
 f0 3a 18              stsp16	[sp+0x18], r2
 f0 3b 1a              stsp16	[sp+0x1a], r3
 f0 06 30 5c           ldi16	r2, 0x5c30
 f0 07 cf ff           ldi16	r3, 0xffcf
 f7 64                 add32	q1, q0
 f2 62                 mov32	q0, q2
 ff 23                 fmul	q0, q3
 c6 25 49              ldi16	r6, 0x4925
 c7 92 3e              ldi16	r7, 0x3e92
 ff 03                 fadd	q0, q3
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f0 04 4f d0           ldi16	r0, 0xd04f
 f0 05 1c 3e           ldi16	r1, 0x3e1c
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2c                 fmul	q3, q0
 f0 04 29 8e           ldi16	r0, 0x8e29
 f0 05 63 3e           ldi16	r1, 0x3e63
 ff 0c                 fadd	q3, q0
 f2 62                 mov32	q0, q2
 ff 23                 fmul	q0, q3
 c6 cd cc              ldi16	r6, 0xcccd
 c7 cc 3e              ldi16	r7, 0x3ecc
 ff 03                 fadd	q0, q3
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f9 59                 or	r2, r6
 f9 7d                 or	r3, r7
 f0 3a 18              stsp16	[sp+0x18], r2
 f0 3b 1a              stsp16	[sp+0x1a], r3
 f2 66                 mov32	q1, q2
 ff 24                 fmul	q1, q0
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 2b                 fmul	q2, q3
 c6 ab aa              ldi16	r6, 0xaaab
 c7 2a 3f              ldi16	r7, 0x3f2a
 ff 0b                 fadd	q2, q3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 2e                 fmul	q3, q2
 ff 07                 fadd	q1, q3
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 f4 00                 ldsp16	r4, [sp+0x0]
 ff c0 42              s16tof	q2, r4
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 f0 69 0c              cmp32	q0, q3
 de 8b 00              brslt16	0x8b <L19>
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f2 61                 mov32	q0, q1
 ff 23                 fmul	q0, q3
 f2 6b                 mov32	q3, q1
 ff 2c                 fmul	q3, q0
 f2 63                 mov32	q0, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f6 2e                 tst16	r6
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 da a8 00              breq16	0xa8 <L20>
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 03                 fadd	q0, q3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 2c                 fmul	q3, q0
 f0 04 d1 f7           ldi16	r0, 0xf7d1
 f0 05 17 37           ldi16	r1, 0x3717
 f2 66                 mov32	q1, q2
 ff 24                 fmul	q1, q0
 ff 07                 fadd	q1, q3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 1d                 fsub	q3, q1
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 1c                 fsub	q3, q0
 f0 04 80 71           ldi16	r0, 0x7180
 f0 05 31 3f           ldi16	r1, 0x3f31
 ff 28                 fmul	q2, q0
 ff 1b                 fsub	q2, q3
 e0 76 fe              jmp16	-394 <L14>
<L17>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 1b                 fsub	q2, q3
 e0 63 fe              jmp16	-413 <L13>
<L18>:
 ff c8 66              fcmp	r6, q1, q2
 f6 2e                 tst16	r6
 d1 7e                 brne8	0x7e <L21>
 f4 02                 ldsp16	r6, [sp+0x0]
 f6 2e                 tst16	r6
 da 5f fe              breq16	-0x1a1 <L14>
 ff c0 62              s16tof	q2, r6
 c6 d1 f7              ldi16	r6, 0xf7d1
 c7 17 37              ldi16	r7, 0x3717
 f2 62                 mov32	q0, q2
 ff 23                 fmul	q0, q3
 c6 80 71              ldi16	r6, 0x7180
 c7 31 3f              ldi16	r7, 0x3f31
 ff 2b                 fmul	q2, q3
 ff 08                 fadd	q2, q0
 e0 45 fe              jmp16	-443 <L14>
<L19>:
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f4 02                 ldsp16	r6, [sp+0x0]
 f6 2e                 tst16	r6
 da 9a 00              breq16	0x9a <L22>
 f2 6b                 mov32	q3, q1
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 ff 1c                 fsub	q3, q0
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 ff 27                 fmul	q1, q3
 c6 d1 f7              ldi16	r6, 0xf7d1
 c7 17 b7              ldi16	r7, 0xb717
 f2 62                 mov32	q0, q2
 ff 23                 fmul	q0, q3
 ff 04                 fadd	q1, q0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 17                 fsub	q1, q3
 c6 80 71              ldi16	r6, 0x7180
 c7 31 3f              ldi16	r7, 0x3f31
 ff 2b                 fmul	q2, q3
 ff 19                 fsub	q2, q1
 e0 07 fe              jmp16	-505 <L14>
<L20>:
 f2 68                 mov32	q2, q0
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 0b                 fadd	q2, q3
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 ff 22                 fmul	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 12                 fsub	q0, q2
 ff 04                 fadd	q1, q0
 f2 69                 mov32	q2, q1
 e0 e8 fd              jmp16	-536 <L14>
<L21>:
 c4 ab aa              ldi16	r4, 0xaaab
 c5 aa be              ldi16	r5, 0xbeaa
 f2 61                 mov32	q0, q1
 ff 22                 fmul	q0, q2
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 ff 02                 fadd	q0, q2
 f2 6b                 mov32	q3, q1
 ff 2f                 fmul	q3, q3
 ff 2c                 fmul	q3, q0
 f4 00                 ldsp16	r4, [sp+0x0]
 f6 2c                 tst16	r4
 d0 49                 breq8	0x49 <L23>
 ff c0 40              s16tof	q0, r4
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 06 80 71           ldi16	r2, 0x7180
 f0 07 31 3f           ldi16	r3, 0x3f31
 f2 68                 mov32	q2, q0
 ff 29                 fmul	q2, q1
 f0 06 d1 f7           ldi16	r2, 0xf7d1
 f0 07 17 b7           ldi16	r3, 0xb717
 ff 21                 fmul	q0, q1
 ff 0c                 fadd	q3, q0
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 1c                 fsub	q3, q0
 ff 1b                 fsub	q2, q3
 e0 9e fd              jmp16	-610 <L14>
<L22>:
 f2 6b                 mov32	q3, q1
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 ff 18                 fsub	q2, q0
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 ff 22                 fmul	q0, q2
 ff 1c                 fsub	q3, q0
 02                    mov	r4, r6
 07                    mov	r5, r7
 e0 83 fd              jmp16	-637 <L14>
<L23>:
 ff 17                 fsub	q1, q3
 f2 69                 mov32	q2, q1
 e0 7c fd              jmp16	-644 <L14>

<avm_halt>:
 d4 fe                 jmp8	avm_halt
