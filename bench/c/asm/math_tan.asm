
math_tan.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 math_tan.c
00000100 l     O .data	00000080 inputs
00000180 l     O .data	00000004 result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 sf_tan.c
00000000 l    df *ABS*	00000000 kf_rem_pio2.c
00000c37 l     O .rodata	00000500 avm_reduce_windows
00001137 l       .init_array	00000000 .hidden __init_array_end
00001137 l       .init_array	00000000 .hidden __init_array_start
00001137 l       .fini_array	00000000 .hidden __fini_array_start
00001137 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000031 avm_test_main
000002f8 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000002fa g     F .text	00000231 tanf
0000052b g     F .text	0000070c __kernel_rem_pio2f

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
 e1 da 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 37 11              ldi16	r4, 0x1137
 c1 00                 ldi8	r5, 0x0
 c6 37 11              ldi16	r6, 0x1137
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 37 11           ldi16	r0, 0x1137
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 37 11           ldi16	r2, 0x1137
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
 c4 37 11              ldi16	r4, 0x1137
 c1 00                 ldi8	r5, 0x0
 c6 37 11              ldi16	r6, 0x1137
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 37 11           ldi16	r2, 0x1137
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 37 11           ldi16	r0, 0x1137
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
 f2 39                 sub	r1, r1
 f2 42                 sub	r2, r2
 d7 01                 sys	debug_break
 f0 03 80              ldi8	r3, 0x80
<L0>:
 f1 22                 mov	r4, r2
 c5 00 01              ldi16	r5, 0x100
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 d5 19                 call8	tanf
 ff 02                 fadd	q0, q2
 f0 0a 04              addi.s8	r2, 0x4
 f5 13                 cmp	r2, r3
 d1 ec                 brne8	-0x14 <L0>
 c4 80 01              ldi16	r4, 0x180
 f0 6b 08              st32	[r4], q0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<tanf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ea                 adjsp	-0x16
 f2 62                 mov32	q0, q2
 ff 64                 fabs	q0
 c6 da 0f              ldi16	r6, 0xfda
 c7 49 3f              ldi16	r7, 0x3f49
 f0 69 c0              cmp32	q3, q0
 d2 2e                 brult8	0x2e <L0>
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff c8 6b              fcmp	r6, q2, q3
 f6 2e                 tst16	r6
 da f9 01              breq16	0x1f9 <L11>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2f                 fmul	q3, q3
 f2 66                 mov32	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff ca 03 28 48 a9 3d 17 d6 00 3e a9 cf aa 3e  fpoly	3, 0.0826571583, 0.125816688, 0.333615571
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 ff 27                 fmul	q1, q3
 ff 24                 fmul	q1, q0
 ff 09                 fadd	q2, q1
 e0 d5 01              jmp16	469 <L11>
<L0>:
 aa                    xor	r6, r6
 f4 42                 stsp16	[sp+0x0], r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 0c              cmp32	q0, q3
 d2 05                 brult8	0x5 <L1>
 ff 1a                 fsub	q2, q2
 e0 8a 01              jmp16	394 <L8>
<L1>:
 c6 e3 cb              ldi16	r6, 0xcbe3
 c7 16 40              ldi16	r7, 0x4016
 f0 69 c0              cmp32	q3, q0
 d2 32                 brult8	0x32 <L3>
 c2 01                 ldi8	r6, 0x1
 f4 4a                 stsp16	[sp+0x2], r6
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 03                 fadd	q0, q3
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 03                 fadd	q0, q3
<L2>:
 f2 6a                 mov32	q3, q0
 ff 60                 fneg	q0
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 69 48              cmp32	q1, q2
 fd 06                 cmov.slt	r0, r6
 fd 0f                 cmov.slt	r1, r7
 a0                    xor	r4, r4
 f4 09                 ldsp16	r5, [sp+0x2]
 21                    sub	r4, r5
 fd 25                 cmov.slt	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 e0 4f 01              jmp16	335 <L9>
<L3>:
 c6 00 50              ldi16	r6, 0x5000
 c7 c3 47              ldi16	r7, 0x47c3
 f0 69 c0              cmp32	q3, q0
 dc 3c 01              brult16	0x13c <L7>
 c6 83 f9              ldi16	r6, 0xf983
 c7 a2 3f              ldi16	r7, 0x3fa2
 f2 64                 mov32	q1, q0
 ff 27                 fmul	q1, q3
 ff c7 0d              ftou32	q3, q1
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f7 67                 add32	q1, q3
 f0 3a 12              stsp16	[sp+0x12], r2
 f0 3b 14              stsp16	[sp+0x14], r3
 f7 81                 lsr32.1	q1
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 3b 04              stsp16	[sp+0x4], r3
 ff c5 0d              u32tof	q3, q1
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f2 42                 sub	r2, r2
 f0 07 c9 bf           ldi16	r3, 0xbfc9
 ff 2d                 fmul	q3, q1
 f2 64                 mov32	q1, q0
 ff 07                 fadd	q1, q3
 f0 3a 06              stsp16	[sp+0x6], r2
 f0 3b 08              stsp16	[sp+0x8], r3
 c6 22 aa              ldi16	r6, 0xaa22
 c7 fd b9              ldi16	r7, 0xb9fd
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f0 33 0c              ldsp16	r3, [sp+0xc]
 ff 2d                 fmul	q3, q1
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 ff 07                 fadd	q1, q3
 f0 3a 06              stsp16	[sp+0x6], r2
 f0 3b 08              stsp16	[sp+0x8], r3
 c2 03                 ldi8	r6, 0x3
 f0 32 02              ldsp16	r2, [sp+0x2]
 f9 c8                 and	r6, r2
 f4 4a                 stsp16	[sp+0x2], r6
 c6 db 0f              ldi16	r6, 0xfdb
 c7 49 3f              ldi16	r7, 0x3f49
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 ff c8 67              fcmp	r6, q1, q3
 ce 01                 cmpi.s8	r6, 0x1
 d1 22                 brne8	0x22 <L4>
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 ff 07                 fadd	q1, q3
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 07                 fadd	q1, q3
 f0 3a 06              stsp16	[sp+0x6], r2
 f0 3b 08              stsp16	[sp+0x8], r3
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 ae                 inc16	r6
 d4 33                 jmp8	0x33 <L5>
<L4>:
 c6 db 0f              ldi16	r6, 0xfdb
 c7 49 bf              ldi16	r7, 0xbf49
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 ff c8 67              fcmp	r6, q1, q3
 ce ff                 cmpi.s8	r6, -0x1
 d1 22                 brne8	0x22 <L6>
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 ff 07                 fadd	q1, q3
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 33              ldi16	r7, 0x33a2
 ff 07                 fadd	q1, q3
 f0 3a 06              stsp16	[sp+0x6], r2
 f0 3b 08              stsp16	[sp+0x8], r3
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 b6                 dec16	r6
<L5>:
 f4 4a                 stsp16	[sp+0x2], r6
<L6>:
 aa                    xor	r6, r6
 c7 80 f5              ldi16	r7, 0xf580
 f7 6c                 add32	q3, q0
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 f9 c8                 and	r6, r2
 f9 ec                 and	r7, r3
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f0 33 0c              ldsp16	r3, [sp+0xc]
 f0 69 c4              cmp32	q3, q1
 dd 89 00              bruge16	0x89 <L12>
 c6 01 01              ldi16	r6, 0x101
 af                    xor	r7, r7
 f0 32 12              ldsp16	r2, [sp+0x12]
 f0 33 14              ldsp16	r3, [sp+0x14]
 f0 69 c4              cmp32	q3, q1
 d2 33                 brult8	0x33 <L7>
 c6 80 0f              ldi16	r6, 0xf80
 c7 c9 bf              ldi16	r7, 0xbfc9
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 ff 27                 fmul	q1, q3
 ff 01                 fadd	q0, q1
 c6 00 44              ldi16	r6, 0x4400
 c7 35 b7              ldi16	r7, 0xb735
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 ff 27                 fmul	q1, q3
 ff 01                 fadd	q0, q1
 c6 09 a3              ldi16	r6, 0xa309
 c7 85 ae              ldi16	r7, 0xae85
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 ff 27                 fmul	q1, q3
 ff 01                 fadd	q0, q1
 e0 9a fe              jmp16	-358 <L2>
<L7>:
 f0 16 00              leasp	r6, 0x0
 d5 54                 call8	__kernel_rem_pio2f
<L8>:
 f2 62                 mov32	q0, q2
<L9>:
 c0 01                 ldi8	r4, 0x1
 f4 02                 ldsp16	r6, [sp+0x0]
 88                    and	r6, r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 ff c8 42              fcmp	r4, q0, q2
 f6 2c                 tst16	r4
 d0 21                 breq8	0x21 <L10>
 f2 64                 mov32	q1, q0
 ff 25                 fmul	q1, q1
 f2 69                 mov32	q2, q1
 ff ca 03 28 48 a9 3d 17 d6 00 3e a9 cf aa 3e  fpoly	3, 0.0826571583, 0.125816688, 0.333615571
 f4 5a                 stsp16	[sp+0x6], r6
 f2 6a                 mov32	q3, q0
 ff 2d                 fmul	q3, q1
 ff 2e                 fmul	q3, q2
 ff 03                 fadd	q0, q3
 f4 1a                 ldsp16	r6, [sp+0x6]
<L10>:
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 f4 a6                 tst8	r6
 d0 12                 breq8	0x12 <L13>
 ff 38                 fdiv	q2, q0
<L11>:
 d6 16                 adjsp	0x16
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L12>:
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 e0 4a fe              jmp16	-438 <L2>
<L13>:
 f2 68                 mov32	q2, q0
 d6 16                 adjsp	0x16
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__kernel_rem_pio2f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 c4                 adjsp	-0x3c
 f0 3e 36              stsp16	[sp+0x36], r6
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 3c 38              stsp16	[sp+0x38], r4
 f0 3d 3a              stsp16	[sp+0x3a], r5
 01                    mov	r4, r5
 04                    mov	r5, r4
 fa 87                 lsr16i	r5, 0x7
 c2 0a                 ldi8	r6, 0xa
 f3 16                 mulu8.w	r5, r6
 c6 80 ff              ldi16	r6, 0xff80
 98                    or	r6, r4
 f4 62                 stsp16	[sp+0x8], r6
 fa 38                 lsl16i	r4, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 f0 3e 32              stsp16	[sp+0x32], r6
 fa 98                 lsr16i	r6, 0x8
 98                    or	r6, r4
 f4 7a                 stsp16	[sp+0xe], r6
 f1 15                 mov	r2, r5
 f2 4b                 sub	r3, r3
 c4 41 07              ldi16	r4, 0x741
 c1 00                 ldi8	r5, 0x0
 f7 69                 add32	q2, q1
 f0 64 c8              ldp32	q3, [q2]
 02                    mov	r4, r6
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 3d 2e              stsp16	[sp+0x2e], r5
 03                    mov	r4, r7
 a5                    xor	r5, r5
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f0 35 32              ldsp16	r5, [sp+0x32]
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 0c                    mov	r7, r4
 01                    mov	r4, r5
 04                    mov	r5, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 3a                 ldsp16	r6, [sp+0xe]
 f4 41                 stsp16	[sp+0x0], r5
 f4 4a                 stsp16	[sp+0x2], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f4 68                 stsp16	[sp+0xa], r4
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 04                    mov	r5, r4
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 3e 14              stsp16	[sp+0x14], r6
 f4 00                 ldsp16	r4, [sp+0x0]
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 19                    add	r6, r5
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f0 37 14              ldsp16	r7, [sp+0x14]
 f6 3d                 mul8	r7, r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 1c                    add	r7, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f1 74                 zext8	r4
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f1 74                 zext8	r4
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 35 16              ldsp16	r5, [sp+0x16]
 f6 31                 mul8	r4, r5
 13                    add	r4, r7
 fa 78                 lsr16i	r4, 0x8
 12                    add	r4, r6
 08                    mov	r6, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f4 4b                 stsp16	[sp+0x2], r7
 f0 3e 1e              stsp16	[sp+0x1e], r6
 f4 69                 stsp16	[sp+0xa], r5
 f4 40                 stsp16	[sp+0x0], r4
 c6 45 07              ldi16	r6, 0x745
 c3 00                 ldi8	r7, 0x0
 f7 6d                 add32	q3, q1
 f0 64 8c              ldp32	q2, [q3]
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3d 24              stsp16	[sp+0x24], r5
 0c                    mov	r7, r4
 0b                    mov	r6, r7
 af                    xor	r7, r7
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 3f 18              stsp16	[sp+0x18], r7
 f0 37 14              ldsp16	r7, [sp+0x14]
 f4 08                 ldsp16	r4, [sp+0x2]
 f3 1c                 mulu8.w	r7, r4
 fa a8                 lsr16i	r7, 0x8
 02                    mov	r4, r6
 f4 01                 ldsp16	r5, [sp+0x0]
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 13                    add	r4, r7
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 0e                    mov	r7, r6
 f4 29                 ldsp16	r5, [sp+0xa]
 f3 1d                 mulu8.w	r7, r5
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 f0 34 16              ldsp16	r4, [sp+0x16]
 f1 74                 zext8	r4
 f0 3c 2a              stsp16	[sp+0x2a], r4
 f4 01                 ldsp16	r5, [sp+0x0]
 f1 75                 zext8	r5
 f6 31                 mul8	r4, r5
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 11                    add	r4, r5
 f4 09                 ldsp16	r5, [sp+0x2]
 f1 75                 zext8	r5
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 35 14              ldsp16	r5, [sp+0x14]
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f6 36                 mul8	r5, r6
 14                    add	r5, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 f1 74                 zext8	r4
 f0 36 10              ldsp16	r6, [sp+0x10]
 f6 38                 mul8	r6, r4
 19                    add	r6, r5
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 02                    mov	r4, r6
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 03                 ldsp16	r7, [sp+0x0]
 f4 43                 stsp16	[sp+0x0], r7
 f4 6a                 stsp16	[sp+0xa], r6
 f0 3c 10              stsp16	[sp+0x10], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 36 16              ldsp16	r6, [sp+0x16]
 02                    mov	r4, r6
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 fa 98                 lsr16i	r6, 0x8
 f0 3e 26              stsp16	[sp+0x26], r6
 f4 01                 ldsp16	r5, [sp+0x0]
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f0 37 14              ldsp16	r7, [sp+0x14]
 f4 28                 ldsp16	r4, [sp+0xa]
 f3 1c                 mulu8.w	r7, r4
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 74                 zext8	r4
 06                    mov	r5, r6
 f6 31                 mul8	r4, r5
 f0 35 10              ldsp16	r5, [sp+0x10]
 11                    add	r4, r5
 f4 09                 ldsp16	r5, [sp+0x2]
 f1 75                 zext8	r5
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 f0 36 10              ldsp16	r6, [sp+0x10]
 f6 36                 mul8	r5, r6
 14                    add	r5, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 f1 74                 zext8	r4
 f0 36 14              ldsp16	r6, [sp+0x14]
 f6 38                 mul8	r6, r4
 02                    mov	r4, r6
 11                    add	r4, r5
 f0 3c 14              stsp16	[sp+0x14], r4
 fa 78                 lsr16i	r4, 0x8
 13                    add	r4, r7
 08                    mov	r6, r4
 f4 0b                 ldsp16	r7, [sp+0x2]
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 01                 ldsp16	r5, [sp+0x0]
 f0 3e 20              stsp16	[sp+0x20], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 41                 stsp16	[sp+0x0], r5
 f4 68                 stsp16	[sp+0xa], r4
 f0 35 24              ldsp16	r5, [sp+0x24]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 34 26              ldsp16	r4, [sp+0x26]
 f3 1c                 mulu8.w	r7, r4
 fa a8                 lsr16i	r7, 0x8
 f0 34 10              ldsp16	r4, [sp+0x10]
 08                    mov	r6, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 f0 34 16              ldsp16	r4, [sp+0x16]
 f4 29                 ldsp16	r5, [sp+0xa]
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 12                    add	r4, r6
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f4 03                 ldsp16	r7, [sp+0x0]
 f1 77                 zext8	r7
 f6 37                 mul8	r5, r7
 f0 34 20              ldsp16	r4, [sp+0x20]
 14                    add	r5, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f1 74                 zext8	r4
 f0 36 26              ldsp16	r6, [sp+0x26]
 f6 32                 mul8	r4, r6
 11                    add	r4, r5
 f4 2b                 ldsp16	r7, [sp+0xa]
 07                    mov	r5, r7
 f1 75                 zext8	r5
 f0 36 2a              ldsp16	r6, [sp+0x2a]
 f6 39                 mul8	r6, r5
 18                    add	r6, r4
 f0 3e 2a              stsp16	[sp+0x2a], r6
 fa 98                 lsr16i	r6, 0x8
 f0 34 16              ldsp16	r4, [sp+0x16]
 18                    add	r6, r4
 02                    mov	r4, r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 01                 ldsp16	r5, [sp+0x0]
 f0 3c 20              stsp16	[sp+0x20], r4
 f4 6b                 stsp16	[sp+0xa], r7
 f4 4a                 stsp16	[sp+0x2], r6
 f4 41                 stsp16	[sp+0x0], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 04                    mov	r5, r4
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 08                    mov	r6, r4
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 f0 3f 16              stsp16	[sp+0x16], r7
 f4 02                 ldsp16	r6, [sp+0x0]
 f3 1e                 mulu8.w	r7, r6
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 f4 2a                 ldsp16	r6, [sp+0xa]
 f0 34 26              ldsp16	r4, [sp+0x26]
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 f4 03                 ldsp16	r7, [sp+0x0]
 f1 77                 zext8	r7
 f0 35 16              ldsp16	r5, [sp+0x16]
 f6 37                 mul8	r5, r7
 f0 34 20              ldsp16	r4, [sp+0x20]
 14                    add	r5, r4
 f4 0b                 ldsp16	r7, [sp+0x2]
 f1 77                 zext8	r7
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f6 33                 mul8	r4, r7
 11                    add	r4, r5
 f4 29                 ldsp16	r5, [sp+0xa]
 f1 75                 zext8	r5
 f0 37 26              ldsp16	r7, [sp+0x26]
 f6 37                 mul8	r5, r7
 14                    add	r5, r4
 f0 3d 34              stsp16	[sp+0x34], r5
 fa 88                 lsr16i	r5, 0x8
 16                    add	r5, r6
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f4 6b                 stsp16	[sp+0xa], r7
 f0 3d 30              stsp16	[sp+0x30], r5
 f4 4a                 stsp16	[sp+0x2], r6
 f4 40                 stsp16	[sp+0x0], r4
 c6 49 07              ldi16	r6, 0x749
 c3 00                 ldi8	r7, 0x0
 f7 6d                 add32	q3, q1
 f0 62 8c              ldp16	r4, [q3]
 f0 3c 20              stsp16	[sp+0x20], r4
 a5                    xor	r5, r5
 f0 3c 26              stsp16	[sp+0x26], r4
 f0 3d 28              stsp16	[sp+0x28], r5
 f0 37 16              ldsp16	r7, [sp+0x16]
 f4 08                 ldsp16	r4, [sp+0x2]
 f3 1c                 mulu8.w	r7, r4
 fa a8                 lsr16i	r7, 0x8
 f0 34 26              ldsp16	r4, [sp+0x26]
 f4 01                 ldsp16	r5, [sp+0x0]
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 13                    add	r4, r7
 f0 36 26              ldsp16	r6, [sp+0x26]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 f4 03                 ldsp16	r7, [sp+0x0]
 f1 77                 zext8	r7
 f6 37                 mul8	r5, r7
 f0 36 10              ldsp16	r6, [sp+0x10]
 0e                    mov	r7, r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 f3 1e                 mulu8.w	r7, r6
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 f0 34 30              ldsp16	r4, [sp+0x30]
 14                    add	r5, r4
 f4 0a                 ldsp16	r6, [sp+0x2]
 f1 76                 zext8	r6
 f0 34 16              ldsp16	r4, [sp+0x16]
 f6 32                 mul8	r4, r6
 11                    add	r4, r5
 f4 29                 ldsp16	r5, [sp+0xa]
 f1 75                 zext8	r5
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f6 39                 mul8	r6, r5
 18                    add	r6, r4
 f0 3e 1e              stsp16	[sp+0x1e], r6
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 13                    add	r4, r7
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 69                 stsp16	[sp+0xa], r5
 f0 3c 30              stsp16	[sp+0x30], r4
 f4 4b                 stsp16	[sp+0x2], r7
 f4 42                 stsp16	[sp+0x0], r6
 f0 34 14              ldsp16	r4, [sp+0x14]
 f1 74                 zext8	r4
 f0 36 2a              ldsp16	r6, [sp+0x2a]
 fa 58                 lsl16i	r6, 0x8
 98                    or	r6, r4
 0e                    mov	r7, r6
 f0 36 34              ldsp16	r6, [sp+0x34]
 f1 76                 zext8	r6
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 01                    mov	r4, r5
 fa 38                 lsl16i	r4, 0x8
 92                    or	r4, r6
 c2 80                 ldi8	r6, 0x80
 86                    and	r5, r6
 f1 17                 mov	r2, r7
 f1 1c                 mov	r3, r4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f7 7d                 sub32	q3, q1
 fa 87                 lsr16i	r5, 0x7
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f4 a5                 tst8	r5
 fb 32                 cmov.eq	r6, r2
 fb 3b                 cmov.eq	r7, r3
 f2 30                 sub	r0, r0
 f0 01 01              ldi8	r1, 0x1
 f0 69 c0              cmp32	q3, q0
 d2 6b                 brult8	0x6b <L0>
 c2 02                 ldi8	r6, 0x2
 af                    xor	r7, r7
 f7 6d                 add32	q3, q1
 f0 00 04              ldi8	r0, 0x4
 f0 05 00 80           ldi16	r1, 0x8000
 f0 69 c0              cmp32	q3, q0
 d3 5a                 brslt8	0x5a <L0>
 f0 36 26              ldsp16	r6, [sp+0x26]
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 01                 ldsp16	r5, [sp+0x0]
 f6 34                 mul8	r5, r4
 f0 34 30              ldsp16	r4, [sp+0x30]
 14                    add	r5, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f6 38                 mul8	r6, r4
 19                    add	r6, r5
 f4 28                 ldsp16	r4, [sp+0xa]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f6 3c                 mul8	r7, r4
 1e                    add	r7, r6
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 c1 03                 ldi8	r5, 0x3
 87                    and	r5, r7
 11                    add	r4, r5
 a5                    xor	r5, r5
 24                    sub	r5, r4
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 30 38              ldsp16	r0, [sp+0x38]
 f0 31 3a              ldsp16	r1, [sp+0x3a]
 f0 69 c0              cmp32	q3, q0
 fd 2c                 cmov.slt	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 ff c4 0d              s32tof	q3, q1
 c4 db 0f              ldi16	r4, 0xfdb
 c5 c9 2f              ldi16	r5, 0x2fc9
 ff 2e                 fmul	q3, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 62                 fneg	q2
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 69 40              cmp32	q1, q0
 fd 26                 cmov.slt	r4, r6
 fd 2f                 cmov.slt	r5, r7
 f4 03                 ldsp16	r7, [sp+0x0]
 e0 b8 03              jmp16	952 <L3>
<L0>:
 f0 36 32              ldsp16	r6, [sp+0x32]
 f1 76                 zext8	r6
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 04                    mov	r5, r4
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 69                 stsp16	[sp+0xa], r5
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f4 38                 ldsp16	r4, [sp+0xe]
 f4 78                 stsp16	[sp+0xe], r4
 f4 6b                 stsp16	[sp+0xa], r7
 f4 61                 stsp16	[sp+0x8], r5
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 04                    mov	r5, r4
 f4 38                 ldsp16	r4, [sp+0xe]
 f3 14                 mulu8.w	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 fa 98                 lsr16i	r6, 0x8
 f4 42                 stsp16	[sp+0x0], r6
 02                    mov	r4, r6
 f4 12                 ldsp16	r6, [sp+0x4]
 0c                    mov	r7, r4
 f3 1e                 mulu8.w	r7, r6
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 f4 4b                 stsp16	[sp+0x2], r7
 02                    mov	r4, r6
 f1 74                 zext8	r4
 f4 03                 ldsp16	r7, [sp+0x0]
 f6 3c                 mul8	r7, r4
 f4 29                 ldsp16	r5, [sp+0xa]
 1d                    add	r7, r5
 f4 3a                 ldsp16	r6, [sp+0xe]
 f1 76                 zext8	r6
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f4 69                 stsp16	[sp+0xa], r5
 f6 36                 mul8	r5, r6
 17                    add	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f4 0b                 ldsp16	r7, [sp+0x2]
 17                    add	r5, r7
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 38                 ldsp16	r4, [sp+0xe]
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f4 63                 stsp16	[sp+0x8], r7
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 01                 ldsp16	r5, [sp+0x0]
 f3 14                 mulu8.w	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 02                    mov	r4, r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 09                    mov	r6, r5
 12                    add	r4, r6
 f4 48                 stsp16	[sp+0x2], r4
 0b                    mov	r6, r7
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 f0 35 2e              ldsp16	r5, [sp+0x2e]
 f3 12                 mulu8.w	r4, r6
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 02                    mov	r4, r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 12                    add	r4, r6
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f1 76                 zext8	r6
 f4 4a                 stsp16	[sp+0x2], r6
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 74                 zext8	r4
 f6 38                 mul8	r6, r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 18                    add	r6, r4
 f4 39                 ldsp16	r5, [sp+0xe]
 f1 75                 zext8	r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f6 31                 mul8	r4, r5
 12                    add	r4, r6
 f4 23                 ldsp16	r7, [sp+0x8]
 07                    mov	r5, r7
 f1 75                 zext8	r5
 f4 2a                 ldsp16	r6, [sp+0xa]
 f6 39                 mul8	r6, r5
 18                    add	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 18                    add	r6, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 63                 stsp16	[sp+0x8], r7
 f4 6a                 stsp16	[sp+0xa], r6
 f4 79                 stsp16	[sp+0xe], r5
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f3 19                 mulu8.w	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f0 3d 16              stsp16	[sp+0x16], r5
 0c                    mov	r7, r4
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f3 1d                 mulu8.w	r7, r5
 fa a8                 lsr16i	r7, 0x8
 f0 35 14              ldsp16	r5, [sp+0x14]
 1d                    add	r7, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 21                 ldsp16	r5, [sp+0x8]
 f3 19                 mulu8.w	r6, r5
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 f0 34 16              ldsp16	r4, [sp+0x16]
 f6 3c                 mul8	r7, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 1c                    add	r7, r4
 f4 38                 ldsp16	r4, [sp+0xe]
 f1 74                 zext8	r4
 f4 09                 ldsp16	r5, [sp+0x2]
 f6 34                 mul8	r5, r4
 17                    add	r5, r7
 f4 20                 ldsp16	r4, [sp+0x8]
 f1 74                 zext8	r4
 f4 03                 ldsp16	r7, [sp+0x0]
 f6 3c                 mul8	r7, r4
 1d                    add	r7, r5
 f4 43                 stsp16	[sp+0x0], r7
 fa a8                 lsr16i	r7, 0x8
 1e                    add	r7, r6
 f4 6b                 stsp16	[sp+0xa], r7
 f4 38                 ldsp16	r4, [sp+0xe]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f4 6b                 stsp16	[sp+0xa], r7
 f4 61                 stsp16	[sp+0x8], r5
 f4 78                 stsp16	[sp+0xe], r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 0c                    mov	r7, r4
 f0 34 16              ldsp16	r4, [sp+0x16]
 f3 1c                 mulu8.w	r7, r4
 fa a8                 lsr16i	r7, 0x8
 f0 34 22              ldsp16	r4, [sp+0x22]
 08                    mov	r6, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 f4 23                 ldsp16	r7, [sp+0x8]
 f3 13                 mulu8.w	r4, r7
 fa 78                 lsr16i	r4, 0x8
 12                    add	r4, r6
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 34 22              ldsp16	r4, [sp+0x22]
 08                    mov	r6, r4
 f1 76                 zext8	r6
 f0 3e 14              stsp16	[sp+0x14], r6
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f1 74                 zext8	r4
 f6 38                 mul8	r6, r4
 01                    mov	r4, r5
 18                    add	r6, r4
 f4 39                 ldsp16	r5, [sp+0xe]
 f1 75                 zext8	r5
 f0 34 16              ldsp16	r4, [sp+0x16]
 f6 34                 mul8	r5, r4
 16                    add	r5, r6
 03                    mov	r4, r7
 f1 74                 zext8	r4
 f4 0a                 ldsp16	r6, [sp+0x2]
 f6 38                 mul8	r6, r4
 19                    add	r6, r5
 f4 4a                 stsp16	[sp+0x2], r6
 fa 98                 lsr16i	r6, 0x8
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 18                    add	r6, r4
 06                    mov	r5, r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 38                 ldsp16	r4, [sp+0xe]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 63                 stsp16	[sp+0x8], r7
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f4 78                 stsp16	[sp+0xe], r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 36 22              ldsp16	r6, [sp+0x22]
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 34 22              ldsp16	r4, [sp+0x22]
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 f4 6b                 stsp16	[sp+0xa], r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f3 1c                 mulu8.w	r7, r4
 fa a8                 lsr16i	r7, 0x8
 1e                    add	r7, r6
 09                    mov	r6, r5
 f0 34 16              ldsp16	r4, [sp+0x16]
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 74                 zext8	r4
 f4 2b                 ldsp16	r7, [sp+0xa]
 f6 3c                 mul8	r7, r4
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 1c                    add	r7, r4
 f4 38                 ldsp16	r4, [sp+0xe]
 f1 74                 zext8	r4
 f0 35 14              ldsp16	r5, [sp+0x14]
 f6 34                 mul8	r5, r4
 17                    add	r5, r7
 f4 20                 ldsp16	r4, [sp+0x8]
 f1 74                 zext8	r4
 f0 37 16              ldsp16	r7, [sp+0x16]
 f6 33                 mul8	r4, r7
 11                    add	r4, r5
 f0 3c 1e              stsp16	[sp+0x1e], r4
 fa 78                 lsr16i	r4, 0x8
 12                    add	r4, r6
 08                    mov	r6, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 23                 ldsp16	r7, [sp+0x8]
 f4 63                 stsp16	[sp+0x8], r7
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f4 79                 stsp16	[sp+0xe], r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 28                 ldsp16	r4, [sp+0xa]
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 f4 12                 ldsp16	r6, [sp+0x4]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 35 16              ldsp16	r5, [sp+0x16]
 11                    add	r4, r5
 f0 36 22              ldsp16	r6, [sp+0x22]
 f0 37 24              ldsp16	r7, [sp+0x24]
 f4 21                 ldsp16	r5, [sp+0x8]
 f3 19                 mulu8.w	r6, r5
 fa 98                 lsr16i	r6, 0x8
 18                    add	r6, r4
 f0 3e 22              stsp16	[sp+0x22], r6
 f0 34 10              ldsp16	r4, [sp+0x10]
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 f0 3f 16              stsp16	[sp+0x16], r7
 f4 10                 ldsp16	r4, [sp+0x4]
 08                    mov	r6, r4
 f1 76                 zext8	r6
 f6 3e                 mul8	r7, r6
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 1d                    add	r7, r5
 f4 3a                 ldsp16	r6, [sp+0xe]
 f1 76                 zext8	r6
 f4 29                 ldsp16	r5, [sp+0xa]
 f6 36                 mul8	r5, r6
 17                    add	r5, r7
 f4 20                 ldsp16	r4, [sp+0x8]
 f1 74                 zext8	r4
 f0 36 14              ldsp16	r6, [sp+0x14]
 f6 38                 mul8	r6, r4
 19                    add	r6, r5
 f0 3e 14              stsp16	[sp+0x14], r6
 fa 98                 lsr16i	r6, 0x8
 f0 34 22              ldsp16	r4, [sp+0x22]
 18                    add	r6, r4
 06                    mov	r5, r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f4 20                 ldsp16	r4, [sp+0x8]
 f0 3d 22              stsp16	[sp+0x22], r5
 f4 7b                 stsp16	[sp+0xe], r7
 f4 60                 stsp16	[sp+0x8], r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 34 10              ldsp16	r4, [sp+0x10]
 f3 13                 mulu8.w	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f0 36 10              ldsp16	r6, [sp+0x10]
 fa 98                 lsr16i	r6, 0x8
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f3 1b                 mulu8.w	r6, r7
 fa 98                 lsr16i	r6, 0x8
 18                    add	r6, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 21                 ldsp16	r5, [sp+0x8]
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 12                    add	r4, r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f1 76                 zext8	r6
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f6 3b                 mul8	r6, r7
 f0 35 22              ldsp16	r5, [sp+0x22]
 19                    add	r6, r5
 f4 3b                 ldsp16	r7, [sp+0xe]
 f1 77                 zext8	r7
 f0 35 16              ldsp16	r5, [sp+0x16]
 f6 37                 mul8	r5, r7
 16                    add	r5, r6
 f4 22                 ldsp16	r6, [sp+0x8]
 f1 76                 zext8	r6
 f4 2b                 ldsp16	r7, [sp+0xa]
 f6 3e                 mul8	r7, r6
 1d                    add	r7, r5
 f4 6b                 stsp16	[sp+0xa], r7
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 09                    mov	r6, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 f0 3f 22              stsp16	[sp+0x22], r7
 f4 7a                 stsp16	[sp+0xe], r6
 f4 61                 stsp16	[sp+0x8], r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 06                    mov	r5, r6
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f3 14                 mulu8.w	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f0 34 20              ldsp16	r4, [sp+0x20]
 f4 12                 ldsp16	r6, [sp+0x4]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f0 35 20              ldsp16	r5, [sp+0x20]
 f1 75                 zext8	r5
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 f6 37                 mul8	r5, r7
 f0 36 10              ldsp16	r6, [sp+0x10]
 f4 23                 ldsp16	r7, [sp+0x8]
 f3 1b                 mulu8.w	r6, r7
 fa 98                 lsr16i	r6, 0x8
 18                    add	r6, r4
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f0 34 22              ldsp16	r4, [sp+0x22]
 14                    add	r5, r4
 f4 38                 ldsp16	r4, [sp+0xe]
 f1 74                 zext8	r4
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f6 32                 mul8	r4, r6
 11                    add	r4, r5
 07                    mov	r5, r7
 f1 75                 zext8	r5
 f0 36 16              ldsp16	r6, [sp+0x16]
 f6 39                 mul8	r6, r5
 18                    add	r6, r4
 f0 3e 16              stsp16	[sp+0x16], r6
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 36 10              ldsp16	r6, [sp+0x10]
 12                    add	r4, r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 63                 stsp16	[sp+0x8], r7
 f4 79                 stsp16	[sp+0xe], r5
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 01                 ldsp16	r5, [sp+0x0]
 f1 75                 zext8	r5
 f4 0a                 ldsp16	r6, [sp+0x2]
 fa 58                 lsl16i	r6, 0x8
 99                    or	r6, r5
 f4 4a                 stsp16	[sp+0x2], r6
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f1 75                 zext8	r5
 f0 36 14              ldsp16	r6, [sp+0x14]
 fa 58                 lsl16i	r6, 0x8
 99                    or	r6, r5
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 35 20              ldsp16	r5, [sp+0x20]
 fa 88                 lsr16i	r5, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 fe 2e                 mul16	r5, r6
 14                    add	r5, r4
 f0 34 20              ldsp16	r4, [sp+0x20]
 f4 3a                 ldsp16	r6, [sp+0xe]
 fe 26                 mul16	r4, r6
 11                    add	r4, r5
 08                    mov	r6, r4
 03                    mov	r4, r7
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 fe 25                 mul16	r4, r5
 12                    add	r4, r6
 c3 03                 ldi8	r7, 0x3
 8c                    and	r7, r4
 f4 29                 ldsp16	r5, [sp+0xa]
 f1 75                 zext8	r5
 c0 80                 ldi8	r4, 0x80
 f0 36 16              ldsp16	r6, [sp+0x16]
 82                    and	r4, r6
 fa 58                 lsl16i	r6, 0x8
 99                    or	r6, r5
 f0 35 14              ldsp16	r5, [sp+0x14]
 f1 05                 mov	r0, r5
 f1 0e                 mov	r1, r6
 fa 77                 lsr16i	r4, 0x7
 f1 14                 mov	r2, r4
 f2 4b                 sub	r3, r3
 f0 3a 0a              stsp16	[sp+0xa], r2
 f0 3b 0c              stsp16	[sp+0xc], r3
 f4 a4                 tst8	r4
 d0 19                 breq8	0x19 <L1>
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 aa                    xor	r6, r6
 f4 08                 ldsp16	r4, [sp+0x2]
 28                    sub	r6, r4
 f6 2c                 tst16	r4
 f8 04                 cset.eq	r4
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f4 af                 inc16	r7
 d4 04                 jmp8	0x4 <L2>
<L1>:
 f2 68                 mov32	q2, q0
 f4 0a                 ldsp16	r6, [sp+0x2]
<L2>:
 f4 43                 stsp16	[sp+0x0], r7
 ff c1 61              u16tof	q1, r6
 aa                    xor	r6, r6
 c7 80 27              ldi16	r7, 0x2780
 ff 27                 fmul	q1, q3
 ff c5 02              u32tof	q0, q2
 a0                    xor	r4, r4
 c5 80 2f              ldi16	r5, 0x2f80
 ff 22                 fmul	q0, q2
 ff 01                 fadd	q0, q1
 c4 db 0f              ldi16	r4, 0xfdb
 c5 c9 3f              ldi16	r5, 0x3fc9
 ff 22                 fmul	q0, q2
 f0 35 3a              ldsp16	r5, [sp+0x3a]
 09                    mov	r6, r5
 fa 9f                 lsr16i	r6, 0xf
 f2 68                 mov32	q2, q0
 ff 62                 fneg	q2
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f5 16                 cmp	r2, r6
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 aa                    xor	r6, r6
 f4 03                 ldsp16	r7, [sp+0x0]
 2b                    sub	r6, r7
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 32 38              ldsp16	r2, [sp+0x38]
 f0 33 3a              ldsp16	r3, [sp+0x3a]
 f0 69 40              cmp32	q1, q0
 fd 3e                 cmov.slt	r7, r6
<L3>:
 f0 36 36              ldsp16	r6, [sp+0x36]
 7b                    st16	[r6], r7
 d6 3c                 adjsp	0x3c
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
