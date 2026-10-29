
stdlib_strtoull.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 stdlib_strtoull.c
00000100 l     O .data	00000003 call
00000113 l     O .data	00000010 bases
00000103 l     O .data	00000010 inputs
00000123 l     O .data	00000008 result_sink
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 stdlib.c
00000329 l     F .text	00000295 parse_ullong
00000000 l    df *ABS*	00000000 avm.c
00000000 l    df *ABS*	00000000 ctype.c
00000000 l    df *ABS*	00000000 strtof.c
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 integer.c
00000000 l    df *ABS*	00000000 wide_integer.c
00000905 l       .init_array	00000000 .hidden __init_array_end
00000905 l       .init_array	00000000 .hidden __init_array_start
00000905 l       .fini_array	00000000 .hidden __fini_array_start
00000905 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	000000c0 avm_test_main
00000637 g     F .text	00000065 __avm_terminate
00000327 g     F .text	00000002 avm_halt
0000017e g     O .data	00000002 __avm_errno
000005be g     F .text	0000006d strtoull
0000062b g     F .text	0000000c isspace
00000000  w      *UND*	00000000 __avm_run_local_dtors
0000077e g     F .text	00000187 __avm_udivmoddi4
000006e7 g     F .text	00000097 __avm_muldi3
0000069c g     F .text	0000004b __avm_umulhisi3

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
 e1 21 04              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 04 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 05 09              ldi16	r4, 0x905
 c1 00                 ldi8	r5, 0x0
 c6 05 09              ldi16	r6, 0x905
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 05 09           ldi16	r0, 0x905
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 05 09           ldi16	r2, 0x905
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
 d6 f4                 adjsp	-0xc
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 aa                    xor	r6, r6
 d7 01                 sys	debug_break
 f0 05 00 01           ldi16	r1, 0x100
 f1 06                 mov	r0, r6
 f2 69                 mov32	q2, q1
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
<L0>:
 f0 38 00              stsp16	[sp+0x0], r0
 02                    mov	r4, r6
<L1>:
 f4 50                 stsp16	[sp+0x4], r4
 f0 5e 7e 01           stm16	[0x17e], r6
 0c                    mov	r7, r4
 c5 13 01              ldi16	r5, 0x113
 1d                    add	r7, r5
 04                    mov	r5, r4
 c6 03 01              ldi16	r6, 0x103
 16                    add	r5, r6
 61                    ld16	r4, [r5]
 f4 48                 stsp16	[sp+0x2], r4
 6b                    ld16	r6, [r7]
 f1 25                 mov	r5, r1
 f7 28                 ld16	r0, [r5+]
 f5 35                 ld8u	r1, [r5]
 f0 15 0a              leasp	r5, 0xa
 e8                    callp	q0
 f2 63                 mov32	q0, q3
 f7 61                 add32	q0, q1
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f7 6e                 add32	q3, q2
 f0 69 c8              cmp32	q3, q2
 f8 14                 cset.ult	r4
 f1 14                 mov	r2, r4
 f2 4b                 sub	r3, r3
 f7 64                 add32	q1, q0
 f0 54 7e 01           ldm16	r4, [0x17e]
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f7 63                 add32	q0, q3
 f0 69 0c              cmp32	q0, q3
 f8 16                 cset.ult	r6
 02                    mov	r4, r6
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 0a                 ldsp16	r6, [sp+0x2]
 22                    sub	r4, r6
 08                    mov	r6, r4
 0c                    mov	r7, r4
 fa ef                 asr16i	r7, 0xf
 fa bf                 asr16i	r4, 0xf
 f1 14                 mov	r2, r4
 f1 1c                 mov	r3, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f7 66                 add32	q1, q2
 f7 6c                 add32	q3, q0
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f0 69 c0              cmp32	q3, q0
 aa                    xor	r6, r6
 f8 14                 cset.ult	r4
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 f7 61                 add32	q0, q1
 f2 64                 mov32	q1, q0
 c7 00 01              ldi16	r7, 0x100
 f1 0f                 mov	r1, r7
 c8 02                 addi.s8	r4, 0x2
 cc 10                 cmpi.s8	r4, 0x10
 d1 82                 brne8	-0x7e <L1>
 f0 30 00              ldsp16	r0, [sp+0x0]
 f4 a8                 inc16	r0
 f0 0c 10              cmpi.s8	r0, 0x10
 db 73 ff              brne16	-0x8d <L0>
 c4 23 01              ldi16	r4, 0x123
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f0 6b c8              st32	[r4], q3
 c4 27 01              ldi16	r4, 0x127
 f0 6b 48              st32	[r4], q1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<parse_ullong>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ce                 adjsp	-0x32
 f1 16                 mov	r2, r6
 09                    mov	r6, r5
 f1 04                 mov	r0, r4
 f0 34 49              ldsp16	r4, [sp+0x49]
 f0 35 4b              ldsp16	r5, [sp+0x4b]
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 34 45              ldsp16	r4, [sp+0x45]
 f0 35 47              ldsp16	r5, [sp+0x47]
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 34 41              ldsp16	r4, [sp+0x41]
 f0 35 43              ldsp16	r5, [sp+0x43]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 3d              ldsp16	r4, [sp+0x3d]
 f0 35 3f              ldsp16	r5, [sp+0x3f]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 34 4f              ldsp16	r4, [sp+0x4f]
 f0 31 4d              ldsp16	r1, [sp+0x4d]
 a5                    xor	r5, r5
 ee b2 20              st16	[r1+0], r5
 f4 68                 stsp16	[sp+0xa], r4
 71                    st16	[r4], r5
 f6 2e                 tst16	r6
 d0 02                 breq8	0x2 <L0>
 f5 58                 st16	[r6], r0
<L0>:
 f6 2a                 tst16	r2
 d0 17                 breq8	0x17 <L1>
 f1 22                 mov	r4, r2
 c8 db                 addi.s8	r4, -0x25
 cc dd                 cmpi.s8	r4, -0x23
 d8 0f                 bruge8	0xf <L1>
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 c0 16                 ldi8	r4, 0x16
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e0 fd 01              jmp16	509 <L20>
<L1>:
 f0 3e 24              stsp16	[sp+0x24], r6
<L2>:
 f1 18                 mov	r3, r0
 f0 6c 81              ld8u	r4, [r0+]
 e1 92 02              call16	isspace
 f6 2c                 tst16	r4
 d1 f4                 brne8	-0xc <L2>
 ed 86 20              ld8u	r4, [r3+0]
 cc 2b                 cmpi.s8	r4, 0x2b
 d0 04                 breq8	0x4 <L3>
 cc 2d                 cmpi.s8	r4, 0x2d
 d1 09                 brne8	0x9 <L4>
<L3>:
 cc 2d                 cmpi.s8	r4, 0x2d
 f8 04                 cset.eq	r4
 ee 92 20              st16	[r1+0], r4
 f1 18                 mov	r3, r0
<L4>:
 c0 2f                 ldi8	r4, 0x2f
 f9 88                 and	r4, r2
 f4 a4                 tst8	r4
 d1 42                 brne8	0x42 <L7>
 ed 86 20              ld8u	r4, [r3+0]
 cc 30                 cmpi.s8	r4, 0x30
 d1 35                 brne8	0x35 <L5>
 ed 86 21              ld8u	r4, [r3+1]
 c1 20                 ldi8	r5, 0x20
 94                    or	r5, r4
 c0 08                 ldi8	r4, 0x8
 cd 78                 cmpi.s8	r5, 0x78
 d1 2b                 brne8	0x2b <L6>
 c3 10                 ldi8	r7, 0x10
 f1 27                 mov	r5, r3
 c9 02                 addi.s8	r5, 0x2
 f0 3d 2e              stsp16	[sp+0x2e], r5
 ed a6 22              ld8u	r5, [r3+2]
 09                    mov	r6, r5
 ca d0                 addi.s8	r6, -0x30
 f1 76                 zext8	r6
 ce 0a                 cmpi.s8	r6, 0xa
 d2 1f                 brult8	0x1f <L8>
 09                    mov	r6, r5
 ca 9f                 addi.s8	r6, -0x61
 f1 76                 zext8	r6
 ce 1a                 cmpi.s8	r6, 0x1a
 dd bd 01              bruge16	0x1bd <L23>
 c6 a9 ff              ldi16	r6, 0xffa9
 19                    add	r6, r5
 ce 10                 cmpi.s8	r6, 0x10
 d8 04                 bruge8	0x4 <L6>
 d4 0b                 jmp8	0xb <L8>
<L5>:
 c0 0a                 ldi8	r4, 0xa
<L6>:
 f6 2a                 tst16	r2
 fb 14                 cmov.eq	r2, r4
<L7>:
 f0 3b 2e              stsp16	[sp+0x2e], r3
 f1 2e                 mov	r7, r2
<L8>:
 ed 92 20              ld16	r4, [r1+0]
 f6 2c                 tst16	r4
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f1 17                 mov	r2, r7
 f0 3a 0c              stsp16	[sp+0xc], r2
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 fb 26                 cmov.eq	r4, r6
 fb 2f                 cmov.eq	r5, r7
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 fb 30                 cmov.eq	r6, r0
 fb 39                 cmov.eq	r7, r1
 d6 f6                 adjsp	-0xa
 f0 10 30              leasp	r0, 0x30
 f0 38 08              stsp16	[sp+0x8], r0
 f2 39                 sub	r1, r1
 f0 3a 2a              stsp16	[sp+0x2a], r2
 f0 39 2c              stsp16	[sp+0x2c], r1
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 39 02              stsp16	[sp+0x2], r1
 f2 30                 sub	r0, r0
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3d 24              stsp16	[sp+0x24], r5
 f0 3e 26              stsp16	[sp+0x26], r6
 f0 3f 28              stsp16	[sp+0x28], r7
 e1 29 03              call16	__avm_udivmoddi4
 d6 0a                 adjsp	0xa
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 34 26              ldsp16	r4, [sp+0x26]
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f2 42                 sub	r2, r2
 f0 33 2e              ldsp16	r3, [sp+0x2e]
 d4 09                 jmp8	0x9 <L11>
<L9>:
 c0 01                 ldi8	r4, 0x1
 f4 29                 ldsp16	r5, [sp+0xa]
 74                    st16	[r5], r4
<L10>:
 f4 b2                 dec16	r2
 f4 ab                 inc16	r3
<L11>:
 f4 33                 ldsp16	r7, [sp+0xc]
 ed c6 20              ld8u	r6, [r3+0]
 02                    mov	r4, r6
 c8 d0                 addi.s8	r4, -0x30
 f1 74                 zext8	r4
 cc 0a                 cmpi.s8	r4, 0xa
 d8 0d                 bruge8	0xd <L12>
 ca d0                 addi.s8	r6, -0x30
 3b                    cmp	r6, r7
 d2 31                 brult8	0x31 <L14>
 f6 2a                 tst16	r2
 da fd 00              breq16	0xfd <L21>
 e0 d2 00              jmp16	210 <L18>
<L12>:
 02                    mov	r4, r6
 c8 9f                 addi.s8	r4, -0x61
 f1 74                 zext8	r4
 cc 1a                 cmpi.s8	r4, 0x1a
 d8 0d                 bruge8	0xd <L13>
 ca a9                 addi.s8	r6, -0x57
 3b                    cmp	r6, r7
 d2 1b                 brult8	0x1b <L14>
 f6 2a                 tst16	r2
 da e7 00              breq16	0xe7 <L21>
 e0 bc 00              jmp16	188 <L18>
<L13>:
 02                    mov	r4, r6
 c8 c9                 addi.s8	r4, -0x37
 ca bf                 addi.s8	r6, -0x41
 f1 76                 zext8	r6
 c5 ff ff              ldi16	r5, 0xffff
 ce 1a                 cmpi.s8	r6, 0x1a
 fc 2c                 cmov.ult	r5, r4
 09                    mov	r6, r5
 3b                    cmp	r6, r7
 dd a5 00              bruge16	0xa5 <L17>
<L14>:
 f4 62                 stsp16	[sp+0x8], r6
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 69 c8              cmp32	q3, q2
 f8 14                 cset.ult	r4
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 f0 69 c0              cmp32	q3, q0
 f8 15                 cset.ult	r5
 f0 69 0c              cmp32	q0, q3
 fb 2c                 cmov.eq	r5, r4
 f4 a5                 tst8	r5
 d1 91                 brne8	-0x6f <L9>
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 f0 3a 30              stsp16	[sp+0x30], r2
 f0 3b 2e              stsp16	[sp+0x2e], r3
 f2 6a                 mov32	q3, q0
 f2 64                 mov32	q1, q0
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f2 61                 mov32	q0, q1
 98                    or	r6, r4
 9d                    or	r7, r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 f0 33 2e              ldsp16	r3, [sp+0x2e]
 f0 32 30              ldsp16	r2, [sp+0x30]
 d1 09                 brne8	0x9 <L15>
 f0 36 12              ldsp16	r6, [sp+0x12]
 f4 23                 ldsp16	r7, [sp+0x8]
 3b                    cmp	r6, r7
 dc 59 ff              brult16	-0xa7 <L9>
<L15>:
 f4 2a                 ldsp16	r6, [sp+0xa]
 6a                    ld16	r6, [r6]
 f6 2e                 tst16	r6
 d1 3e                 brne8	0x3e <L16>
 d6 f8                 adjsp	-0x8
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6a                 mov32	q3, q0
 e1 ad 01              call16	__avm_muldi3
 d6 08                 adjsp	0x8
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f0 32 30              ldsp16	r2, [sp+0x30]
 f4 22                 ldsp16	r6, [sp+0x8]
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 69 c8              cmp32	q3, q2
 f8 14                 cset.ult	r4
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f7 62                 add32	q0, q2
<L16>:
 f0 33 2e              ldsp16	r3, [sp+0x2e]
 e0 13 ff              jmp16	-237 <L10>
<L17>:
 f6 2a                 tst16	r2
 d0 28                 breq8	0x28 <L21>
<L18>:
 f0 34 24              ldsp16	r4, [sp+0x24]
 f6 2c                 tst16	r4
 d0 02                 breq8	0x2 <L19>
 f5 53                 st16	[r4], r3
<L19>:
 f4 28                 ldsp16	r4, [sp+0xa]
 60                    ld16	r4, [r4]
 f6 2c                 tst16	r4
 d0 22                 breq8	0x22 <L22>
 c0 22                 ldi8	r4, 0x22
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
<L20>:
 f0 5c 7e 01           stm16	[0x17e], r4
 d4 0a                 jmp8	0xa <L22>
<L21>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
<L22>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f2 6a                 mov32	q3, q0
 d6 32                 adjsp	0x32
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L23>:
 09                    mov	r6, r5
 ca bf                 addi.s8	r6, -0x41
 f1 76                 zext8	r6
 ce 1a                 cmpi.s8	r6, 0x1a
 dd 45 fe              bruge16	-0x1bb <L6>
 c6 c9 ff              ldi16	r6, 0xffc9
 19                    add	r6, r5
 ce 10                 cmpi.s8	r6, 0x10
 dc 45 fe              brult16	-0x1bb <L8>
 e0 39 fe              jmp16	-455 <L6>

<strtoull>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 d6 ec                 adjsp	-0x14
 f0 17 14              leasp	r7, 0x14
 f0 3f 12              stsp16	[sp+0x12], r7
 f0 17 16              leasp	r7, 0x16
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 e1 34 fd              call16	parse_ullong
 d6 14                 adjsp	0x14
 f0 32 00              ldsp16	r2, [sp+0x0]
 f6 2a                 tst16	r2
 f2 64                 mov32	q1, q0
 d1 20                 brne8	0x20 <L1>
 f0 30 02              ldsp16	r0, [sp+0x2]
 f6 28                 tst16	r0
 d0 15                 breq8	0x15 <L0>
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 f8 08                 cset.ne	r0
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 f2 61                 mov32	q0, q1
 f7 72                 sub32	q0, q2
 f7 77                 sub32	q1, q3
 d4 04                 jmp8	0x4 <L1>
<L0>:
 f2 62                 mov32	q0, q2
 f2 67                 mov32	q1, q3
<L1>:
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
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
 e1 b4 f9              call16	-1612 <__avm_run_local_dtors>
<L0>:
 c4 05 09              ldi16	r4, 0x905
 c1 00                 ldi8	r5, 0x0
 c6 05 09              ldi16	r6, 0x905
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 05 09           ldi16	r2, 0x905
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 05 09           ldi16	r0, 0x905
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
 e1 6b f9              call16	-1685 <__avm_run_local_dtors>
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

<__avm_udivmoddi4>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d0                 adjsp	-0x30
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 34 3f              ldsp16	r4, [sp+0x3f]
 f0 35 41              ldsp16	r5, [sp+0x41]
 f0 36 43              ldsp16	r6, [sp+0x43]
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 32 3b              ldsp16	r2, [sp+0x3b]
 f0 33 3d              ldsp16	r3, [sp+0x3d]
 f0 3a 26              stsp16	[sp+0x26], r2
 f0 3b 28              stsp16	[sp+0x28], r3
 f0 69 40              cmp32	q1, q0
 d1 12                 brne8	0x12 <L0>
 f0 69 80              cmp32	q2, q0
 d1 0d                 brne8	0xd <L0>
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f2 64                 mov32	q1, q0
 e0 2a 01              jmp16	298 <L7>
<L0>:
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 02 40              ldi8	r2, 0x40
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f2 62                 mov32	q0, q2
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 d4 3d                 jmp8	0x3d <L4>
<L1>:
 f7 76                 sub32	q1, q2
 f0 30 26              ldsp16	r0, [sp+0x26]
 f0 31 28              ldsp16	r1, [sp+0x28]
 f0 69 c0              cmp32	q3, q0
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f7 76                 sub32	q1, q2
 f0 3a 18              stsp16	[sp+0x18], r2
 f0 3b 1a              stsp16	[sp+0x1a], r3
 f7 7c                 sub32	q3, q0
 c0 01                 ldi8	r4, 0x1
 f0 30 04              ldsp16	r0, [sp+0x4]
 f9 81                 or	r4, r0
 f0 3c 04              stsp16	[sp+0x4], r4
<L2>:
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
<L3>:
 f0 32 2a              ldsp16	r2, [sp+0x2a]
 f0 31 2e              ldsp16	r1, [sp+0x2e]
 f0 36 14              ldsp16	r6, [sp+0x14]
 f1 06                 mov	r0, r6
 f0 34 10              ldsp16	r4, [sp+0x10]
 f4 40                 stsp16	[sp+0x0], r4
 f4 b2                 dec16	r2
 f6 2a                 tst16	r2
 da b0 00              breq16	0xb0 <L6>
<L4>:
 f0 3a 2a              stsp16	[sp+0x2a], r2
 f4 09                 ldsp16	r5, [sp+0x2]
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f7 65                 add32	q1, q1
 f9 c9                 or	r6, r2
 f4 19                 ldsp16	r5, [sp+0x6]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 f7 60                 add32	q0, q0
 f0 38 2c              stsp16	[sp+0x2c], r0
 f0 39 2e              stsp16	[sp+0x2e], r1
 f9 81                 or	r4, r0
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f1 27                 mov	r5, r3
 f4 72                 stsp16	[sp+0xc], r6
 f4 79                 stsp16	[sp+0xe], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 30 20              ldsp16	r0, [sp+0x20]
 f0 31 22              ldsp16	r1, [sp+0x22]
 f1 29                 mov	r6, r1
 fa 9f                 lsr16i	r6, 0xf
 f7 6a                 add32	q2, q2
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 98                    or	r6, r4
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f4 29                 ldsp16	r5, [sp+0xa]
 01                    mov	r4, r5
 fa 7f                 lsr16i	r4, 0xf
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f0 69 c4              cmp32	q3, q1
 f2 67                 mov32	q1, q3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f7 65                 add32	q1, q1
 f9 89                 or	r4, r2
 f1 14                 mov	r2, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f7 6a                 add32	q2, q2
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f7 60                 add32	q0, q0
 f0 38 20              stsp16	[sp+0x20], r0
 f0 39 22              stsp16	[sp+0x22], r1
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 de 40 ff              brslt16	-0xc0 <L1>
 f0 69 48              cmp32	q1, q2
 d8 09                 bruge8	0x9 <L5>
 f0 3a 18              stsp16	[sp+0x18], r2
 f0 3b 1a              stsp16	[sp+0x1a], r3
 e0 54 ff              jmp16	-172 <L2>
<L5>:
 f0 69 48              cmp32	q1, q2
 db 2c ff              brne16	-0xd4 <L1>
 f0 30 26              ldsp16	r0, [sp+0x26]
 f0 31 28              ldsp16	r1, [sp+0x28]
 f0 69 c0              cmp32	q3, q0
 dd 20 ff              bruge16	-0xe0 <L1>
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 e0 39 ff              jmp16	-199 <L3>
<L6>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
<L7>:
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 f0 6b 8c              st32	[r6], q2
 ca 04                 addi.s8	r6, 0x4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 6b 8c              st32	[r6], q2
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 d6 30                 adjsp	0x30
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
