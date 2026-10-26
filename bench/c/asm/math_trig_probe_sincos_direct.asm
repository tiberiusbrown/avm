
math_trig_probe_sincos_direct.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 math_trig_probe_sincos_direct.c
00000100 l     O .data	00000020 probe_inputs
00000120 l     O .data	00000004 remainder_result
00000124 l     O .data	00000004 quadrant_result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 sf_sincos.c
00000000 l    df *ABS*	00000000 kf_rem_pio2.c
0000213a l     O .rodata	00000500 avm_reduce_windows
000008b3 l     F .text	0000041f avm_reduce_extended
0000263a l       .init_array	00000000 .hidden __init_array_end
0000263a l       .init_array	00000000 .hidden __init_array_start
0000263a l       .fini_array	00000000 .hidden __fini_array_start
0000263a l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000051 avm_test_main
00000318 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
0000031a g     F .text	000002e7 sincosf
00000601 g     F .text	000002b2 __kernel_rem_pio2f
00000cd2 g     O .rodata	00001468 avm_small_pio2

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
 e1 fa 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 3a 26              ldi16	r4, 0x263a
 c1 00                 ldi8	r5, 0x0
 c6 3a 26              ldi16	r6, 0x263a
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 3a 26           ldi16	r0, 0x263a
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 3a 26           ldi16	r2, 0x263a
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
 c4 3a 26              ldi16	r4, 0x263a
 c1 00                 ldi8	r5, 0x0
 c6 3a 26              ldi16	r6, 0x263a
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 3a 26           ldi16	r2, 0x263a
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 3a 26           ldi16	r0, 0x263a
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
 d6 f8                 adjsp	-0x8
 f2 42                 sub	r2, r2
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 d7 01                 sys	debug_break
 f0 03 07              ldi8	r3, 0x7
<L0>:
 f1 22                 mov	r4, r2
 f9 8c                 and	r4, r3
 10                    add	r4, r4
 10                    add	r4, r4
 c5 00 01              ldi16	r5, 0x100
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 f0 16 04              leasp	r6, 0x4
 f0 17 00              leasp	r7, 0x0
 d5 2d                 call8	sincosf
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 0e                 fadd	q3, q2
 ff 03                 fadd	q0, q3
 f4 aa                 inc16	r2
 f0 0e 20              cmpi.s8	r2, 0x20
 d1 d8                 brne8	-0x28 <L0>
 c4 20 01              ldi16	r4, 0x120
 f0 6b 08              st32	[r4], q0
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 c6 24 01              ldi16	r6, 0x124
 f0 6b 8c              st32	[r6], q2
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

<sincosf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	-0x12
 f4 4b                 stsp16	[sp+0x2], r7
 f4 42                 stsp16	[sp+0x0], r6
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 f4 50                 stsp16	[sp+0x4], r4
 02                    mov	r4, r6
 ff 66                 fabs	q2
 f0 04 da 0f           ldi16	r0, 0xfda
 f0 05 49 3f           ldi16	r1, 0x3f49
 f0 69 08              cmp32	q0, q2
 d2 14                 brult8	0x14 <L0>
 f2 30                 sub	r0, r0
 f0 05 80 39           ldi16	r1, 0x3980
 f0 69 80              cmp32	q2, q0
 d8 1b                 bruge8	0x1b <L1>
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 e0 4f 01              jmp16	335 <L11>
<L0>:
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 80              cmp32	q2, q0
 d2 0c                 brult8	0xc <L2>
 ff 1f                 fsub	q3, q3
 f2 63                 mov32	q0, q3
 e0 3d 01              jmp16	317 <L11>
<L1>:
 f2 63                 mov32	q0, q3
 e0 ec 00              jmp16	236 <L10>
<L2>:
 f0 04 e3 cb           ldi16	r0, 0xcbe3
 f0 05 16 40           ldi16	r1, 0x4016
 f0 69 08              cmp32	q0, q2
 d2 40                 brult8	0x40 <L6>
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f0 04 da 0f           ldi16	r0, 0xfda
 f0 05 c9 bf           ldi16	r1, 0xbfc9
 ff 08                 fadd	q2, q0
 f0 04 69 21           ldi16	r0, 0x2169
 f0 05 a2 b3           ldi16	r1, 0xb3a2
 ff 08                 fadd	q2, q0
 f0 01 01              ldi8	r1, 0x1
<L3>:
 f0 39 0a              stsp16	[sp+0xa], r1
 f2 62                 mov32	q0, q2
 ff 60                 fneg	q0
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 f0 69 c4              cmp32	q3, q1
 fd 04                 cmov.slt	r0, r4
 fd 0d                 cmov.slt	r1, r5
 a0                    xor	r4, r4
<L4>:
 f4 29                 ldsp16	r5, [sp+0xa]
<L5>:
 21                    sub	r4, r5
 fd 25                 cmov.slt	r4, r5
 f4 50                 stsp16	[sp+0x4], r4
 e0 9f 00              jmp16	159 <L10>
<L6>:
 f0 04 00 50           ldi16	r0, 0x5000
 f0 05 c3 47           ldi16	r1, 0x47c3
 f0 69 08              cmp32	q0, q2
 dc 85 00              brult16	0x85 <L8>
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f2 30                 sub	r0, r0
 f0 05 00 43           ldi16	r1, 0x4300
 f0 69 08              cmp32	q0, q2
 dc de 00              brult16	0xde <L12>
 f0 04 83 f9           ldi16	r0, 0xf983
 f0 05 a2 3f           ldi16	r1, 0x3fa2
 f2 66                 mov32	q1, q2
 ff 24                 fmul	q1, q0
 ff c3 61              ftou16	r6, q1
 f4 ae                 inc16	r6
 f4 8e                 lsr16.1	r6
 f4 6a                 stsp16	[sp+0xa], r6
 ff c1 60              u16tof	q0, r6
 f0 06 db 0f           ldi16	r2, 0xfdb
 f0 07 c9 bf           ldi16	r3, 0xbfc9
 ff 21                 fmul	q0, q1
 f2 66                 mov32	q1, q2
 ff 04                 fadd	q1, q0
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 ff c8 64              fcmp	r6, q1, q0
 f6 2e                 tst16	r6
 d1 26                 brne8	0x26 <L7>
 f4 2b                 ldsp16	r7, [sp+0xa]
 0b                    mov	r6, r7
 fa 9d                 lsr16i	r6, 0xd
 1f                    add	r7, r7
 1f                    add	r7, r7
 1f                    add	r7, r7
 f1 07                 mov	r0, r7
 f1 0e                 mov	r1, r6
 c6 d2 0c              ldi16	r6, 0xcd2
 c3 00                 ldi8	r7, 0x0
 f7 6c                 add32	q3, q0
 f0 64 cc              ldp32	q3, [q3]
 ff 1b                 fsub	q2, q3
 c6 d6 0c              ldi16	r6, 0xcd6
 c3 00                 ldi8	r7, 0x0
 f7 6c                 add32	q3, q0
 f0 64 cc              ldp32	q3, [q3]
 ff 1b                 fsub	q2, q3
 f2 66                 mov32	q1, q2
<L7>:
 f2 61                 mov32	q0, q1
 ff 60                 fneg	q0
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f0 69 8c              cmp32	q2, q3
 fd 02                 cmov.slt	r0, r2
 fd 0b                 cmov.slt	r1, r3
 c0 03                 ldi8	r4, 0x3
 f4 29                 ldsp16	r5, [sp+0xa]
 84                    and	r5, r4
 a0                    xor	r4, r4
 e0 65 ff              jmp16	-155 <L5>
<L8>:
 f0 10 04              leasp	r0, 0x4
 02                    mov	r4, r6
 07                    mov	r5, r7
<L9>:
 f1 28                 mov	r6, r0
 e1 b3 01              call16	__kernel_rem_pio2f
 f2 62                 mov32	q0, q2
<L10>:
 f2 64                 mov32	q1, q0
 ff 25                 fmul	q1, q1
 f2 69                 mov32	q2, q1
 ff ca 03 70 8e 05 3c b1 9f 2a be e8 ff 7f 3f  fpoly	3, 0.00815163552, -0.166624799, 0.999998569
 ff 22                 fmul	q0, q2
 f2 69                 mov32	q2, q1
 ff ca 04 bf 12 b2 ba 76 9e 2a 3d d0 ff ff be 00 00 80 3f      fpoly	4, -0.0013585909, 0.0416550264, -0.499998569, 1.0
 f2 66                 mov32	q1, q2
 c0 01                 ldi8	r4, 0x1
 f4 11                 ldsp16	r5, [sp+0x4]
 81                    and	r4, r5
 f4 a4                 tst8	r4
 f2 6b                 mov32	q3, q1
 fb 30                 cmov.eq	r6, r0
 fb 39                 cmov.eq	r7, r1
 ff 60                 fneg	q0
 fb 02                 cmov.eq	r0, r2
 fb 0b                 cmov.eq	r1, r3
 c0 02                 ldi8	r4, 0x2
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L11>
 ff 60                 fneg	q0
 ff 63                 fneg	q3
<L11>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 6b c8              st32	[r4], q3
 f4 08                 ldsp16	r4, [sp+0x2]
 f0 6b 08              st32	[r4], q0
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L12>:
 c6 83 f9              ldi16	r6, 0xf983
 c7 a2 3f              ldi16	r7, 0x3fa2
 f2 62                 mov32	q0, q2
 ff 23                 fmul	q0, q3
 aa                    xor	r6, r6
 c7 80 44              ldi16	r7, 0x4480
 f0 69 c8              cmp32	q3, q2
 d2 69                 brult8	0x69 <L13>
 ff c3 70              ftou16	r7, q0
 f4 af                 inc16	r7
 0b                    mov	r6, r7
 fa 9e                 lsr16i	r6, 0xe
 f4 8f                 lsr16.1	r7
 f4 6b                 stsp16	[sp+0xa], r7
 1f                    add	r7, r7
 1f                    add	r7, r7
 1f                    add	r7, r7
 f1 07                 mov	r0, r7
 f1 0e                 mov	r1, r6
 c6 d2 0c              ldi16	r6, 0xcd2
 c3 00                 ldi8	r7, 0x0
 f7 6c                 add32	q3, q0
 f0 64 cc              ldp32	q3, [q3]
 ff 1b                 fsub	q2, q3
 c6 d6 0c              ldi16	r6, 0xcd6
 c3 00                 ldi8	r7, 0x0
 f7 6c                 add32	q3, q0
 f0 64 cc              ldp32	q3, [q3]
 ff 1b                 fsub	q2, q3
 f0 02 03              ldi8	r2, 0x3
 f4 2a                 ldsp16	r6, [sp+0xa]
 f9 58                 and	r2, r6
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f0 04 dc 0f           ldi16	r0, 0xfdc
 f0 05 49 3f           ldi16	r1, 0x3f49
 f0 69 c0              cmp32	q3, q0
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 dc d5 00              brult16	0xd5 <L18>
 f0 69 c8              cmp32	q3, q2
 df bd 00              brsge16	0xbd <L17>
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 0b                 fadd	q2, q3
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 0b                 fadd	q2, q3
 f4 aa                 inc16	r2
 e0 ba 00              jmp16	186 <L18>
<L13>:
 ff c7 0c              ftou32	q3, q0
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f7 63                 add32	q0, q3
 f7 80                 lsr32.1	q0
 ff c5 0c              u32tof	q3, q0
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 06 22 aa           ldi16	r2, 0xaa22
 f0 07 fd b9           ldi16	r3, 0xb9fd
 f0 3a 0a              stsp16	[sp+0xa], r2
 f0 3b 0c              stsp16	[sp+0xc], r3
 f2 67                 mov32	q1, q3
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 ff 27                 fmul	q1, q3
 f0 3a 0a              stsp16	[sp+0xa], r2
 f0 3b 0c              stsp16	[sp+0xc], r3
 f2 42                 sub	r2, r2
 f0 07 c9 bf           ldi16	r3, 0xbfc9
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 ff 2d                 fmul	q3, q1
 ff 0b                 fadd	q2, q3
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 ff 0b                 fadd	q2, q3
 f0 01 03              ldi8	r1, 0x3
 f9 20                 and	r1, r0
 c6 db 0f              ldi16	r6, 0xfdb
 c7 49 3f              ldi16	r7, 0x3f49
 ff c8 6b              fcmp	r6, q2, q3
 ce 01                 cmpi.s8	r6, 0x1
 d1 1e                 brne8	0x1e <L14>
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 0b                 fadd	q2, q3
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 0b                 fadd	q2, q3
 f4 a9                 inc16	r1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff c8 6b              fcmp	r6, q2, q3
 f6 2e                 tst16	r6
 db f0 fd              brne16	-0x210 <L3>
 d4 29                 jmp8	0x29 <L16>
<L14>:
 c6 db 0f              ldi16	r6, 0xfdb
 c7 49 bf              ldi16	r7, 0xbf49
 ff c8 6b              fcmp	r6, q2, q3
 ce ff                 cmpi.s8	r6, -0x1
 d1 12                 brne8	0x12 <L15>
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 ff 0b                 fadd	q2, q3
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 33              ldi16	r7, 0x33a2
 ff 0b                 fadd	q2, q3
 f4 b1                 dec16	r1
<L15>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff c8 6b              fcmp	r6, q2, q3
 f6 2e                 tst16	r6
 db c5 fd              brne16	-0x23b <L3>
<L16>:
 f0 10 04              leasp	r0, 0x4
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 e0 78 fe              jmp16	-392 <L9>
<L17>:
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 ff 0b                 fadd	q2, q3
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 33              ldi16	r7, 0x33a2
 ff 0b                 fadd	q2, q3
 f4 b2                 dec16	r2
<L18>:
 f0 3a 0a              stsp16	[sp+0xa], r2
 f2 62                 mov32	q0, q2
 ff 60                 fneg	q0
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 69 4c              cmp32	q1, q3
 fd 04                 cmov.slt	r0, r4
 fd 0d                 cmov.slt	r1, r5
 a0                    xor	r4, r4
 e0 a6 fd              jmp16	-602 <L4>

<__kernel_rem_pio2f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d4                 adjsp	-0x2c
 f0 3e 2a              stsp16	[sp+0x2a], r6
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3d 24              stsp16	[sp+0x24], r5
 fa 77                 lsr16i	r4, 0x7
 c1 0a                 ldi8	r5, 0xa
 f3 11                 mulu8.w	r4, r5
 c1 7f                 ldi8	r5, 0x7f
 f0 36 22              ldsp16	r6, [sp+0x22]
 86                    and	r5, r6
 c2 80                 ldi8	r6, 0x80
 99                    or	r6, r5
 f4 6a                 stsp16	[sp+0xa], r6
 f1 14                 mov	r2, r4
 f2 4b                 sub	r3, r3
 c4 44 1c              ldi16	r4, 0x1c44
 c1 00                 ldi8	r5, 0x0
 f7 69                 add32	q2, q1
 f0 64 88              ldp32	q2, [q2]
 f4 0a                 ldsp16	r6, [sp+0x2]
 fa 98                 lsr16i	r6, 0x8
 f4 42                 stsp16	[sp+0x0], r6
 0c                    mov	r7, r4
 f3 1e                 mulu8.w	r7, r6
 fa a8                 lsr16i	r7, 0x8
 f4 7b                 stsp16	[sp+0xe], r7
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 3e 12              stsp16	[sp+0x12], r6
 f4 5a                 stsp16	[sp+0x6], r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f3 1e                 mulu8.w	r7, r6
 fa a8                 lsr16i	r7, 0x8
 f4 3a                 ldsp16	r6, [sp+0xe]
 1e                    add	r7, r6
 f4 5b                 stsp16	[sp+0x6], r7
 0c                    mov	r7, r4
 f4 2a                 ldsp16	r6, [sp+0xa]
 f3 1e                 mulu8.w	r7, r6
 fa a8                 lsr16i	r7, 0x8
 f4 73                 stsp16	[sp+0xc], r7
 f0 36 12              ldsp16	r6, [sp+0x12]
 f4 7a                 stsp16	[sp+0xe], r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f3 1e                 mulu8.w	r7, r6
 0b                    mov	r6, r7
 fa 98                 lsr16i	r6, 0x8
 f4 33                 ldsp16	r7, [sp+0xc]
 1b                    add	r6, r7
 f4 7a                 stsp16	[sp+0xe], r6
 f0 04 48 1c           ldi16	r0, 0x1c48
 f0 01 00              ldi8	r1, 0x0
 f7 61                 add32	q0, q1
 f0 37 12              ldsp16	r7, [sp+0x12]
 f4 02                 ldsp16	r6, [sp+0x0]
 f6 3e                 mul8	r7, r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 1e                    add	r7, r6
 f4 5b                 stsp16	[sp+0x6], r7
 08                    mov	r6, r4
 f1 76                 zext8	r6
 f4 72                 stsp16	[sp+0xc], r6
 f4 2b                 ldsp16	r7, [sp+0xa]
 f6 3b                 mul8	r6, r7
 f4 1b                 ldsp16	r7, [sp+0x6]
 1b                    add	r6, r7
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 36 12              ldsp16	r6, [sp+0x12]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f3 1b                 mulu8.w	r6, r7
 fa 98                 lsr16i	r6, 0x8
 f0 3e 16              stsp16	[sp+0x16], r6
 09                    mov	r6, r5
 af                    xor	r7, r7
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 fa 88                 lsr16i	r5, 0x8
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f4 0a                 ldsp16	r6, [sp+0x2]
 0e                    mov	r7, r6
 f3 1d                 mulu8.w	r7, r5
 fa a8                 lsr16i	r7, 0x8
 f0 36 16              ldsp16	r6, [sp+0x16]
 1e                    add	r7, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f6 39                 mul8	r6, r5
 1b                    add	r6, r7
 f0 3e 1e              stsp16	[sp+0x1e], r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 f4 1a                 ldsp16	r6, [sp+0x6]
 f1 76                 zext8	r6
 f0 3e 16              stsp16	[sp+0x16], r6
 f6 39                 mul8	r6, r5
 f0 37 18              ldsp16	r7, [sp+0x18]
 1b                    add	r6, r7
 f0 3e 1c              stsp16	[sp+0x1c], r6
 09                    mov	r6, r5
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f6 3b                 mul8	r6, r7
 f4 3b                 ldsp16	r7, [sp+0xe]
 1b                    add	r6, r7
 f0 3e 18              stsp16	[sp+0x18], r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 3d 20              stsp16	[sp+0x20], r5
 f6 39                 mul8	r6, r5
 18                    add	r6, r4
 f0 3e 26              stsp16	[sp+0x26], r6
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 01                 ldsp16	r5, [sp+0x0]
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 11                    add	r4, r5
 f0 64 c0              ldp32	q3, [q0]
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 06                    mov	r5, r6
 f1 75                 zext8	r5
 f0 3d 1e              stsp16	[sp+0x1e], r5
 09                    mov	r6, r5
 f0 35 20              ldsp16	r5, [sp+0x20]
 f6 39                 mul8	r6, r5
 18                    add	r6, r4
 f0 3e 28              stsp16	[sp+0x28], r6
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 29                 ldsp16	r5, [sp+0xa]
 f6 36                 mul8	r5, r6
 14                    add	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 32                 ldsp16	r6, [sp+0xc]
 f6 38                 mul8	r6, r4
 f0 34 26              ldsp16	r4, [sp+0x26]
 18                    add	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 18                    add	r6, r4
 f4 72                 stsp16	[sp+0xc], r6
 f0 34 12              ldsp16	r4, [sp+0x12]
 f4 2a                 ldsp16	r6, [sp+0xa]
 f6 32                 mul8	r4, r6
 f0 36 18              ldsp16	r6, [sp+0x18]
 12                    add	r4, r6
 f0 3c 12              stsp16	[sp+0x12], r4
 f4 3a                 ldsp16	r6, [sp+0xe]
 02                    mov	r4, r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 29                 ldsp16	r5, [sp+0xa]
 f3 19                 mulu8.w	r6, r5
 fa 98                 lsr16i	r6, 0x8
 18                    add	r6, r4
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 36 16              ldsp16	r6, [sp+0x16]
 f6 39                 mul8	r6, r5
 f0 34 28              ldsp16	r4, [sp+0x28]
 18                    add	r6, r4
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 18                 ldsp16	r4, [sp+0x6]
 f3 12                 mulu8.w	r4, r6
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 34 12              ldsp16	r4, [sp+0x12]
 18                    add	r6, r4
 f4 01                 ldsp16	r5, [sp+0x0]
 f0 34 16              ldsp16	r4, [sp+0x16]
 f6 31                 mul8	r4, r5
 12                    add	r4, r6
 f4 32                 ldsp16	r6, [sp+0xc]
 fa 98                 lsr16i	r6, 0x8
 18                    add	r6, r4
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 14                    add	r5, r4
 f1 76                 zext8	r6
 01                    mov	r4, r5
 fa 38                 lsl16i	r4, 0x8
 92                    or	r4, r6
 f0 3c 12              stsp16	[sp+0x12], r4
 f4 3a                 ldsp16	r6, [sp+0xe]
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 70                 stsp16	[sp+0xc], r4
 f0 36 20              ldsp16	r6, [sp+0x20]
 f6 32                 mul8	r4, r6
 f0 36 18              ldsp16	r6, [sp+0x18]
 12                    add	r4, r6
 f4 03                 ldsp16	r7, [sp+0x0]
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f6 3b                 mul8	r6, r7
 0e                    mov	r7, r6
 1c                    add	r7, r4
 fa 88                 lsr16i	r5, 0x8
 17                    add	r5, r7
 f4 59                 stsp16	[sp+0x6], r5
 f1 75                 zext8	r5
 f0 34 12              ldsp16	r4, [sp+0x12]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 30                 sub	r0, r0
 f0 01 ff              ldi8	r1, 0xff
 f2 42                 sub	r2, r2
 f0 3f 14              stsp16	[sp+0x14], r7
 f7 77                 sub32	q1, q3
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 aa                    xor	r6, r6
 fa 87                 lsr16i	r5, 0x7
 f0 3d 16              stsp16	[sp+0x16], r5
 f4 a5                 tst8	r5
 fb 16                 cmov.eq	r2, r6
 fb 1f                 cmov.eq	r3, r7
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 da c9 00              breq16	0xc9 <L0>
 c2 02                 ldi8	r6, 0x2
 af                    xor	r7, r7
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f7 6e                 add32	q3, q2
 f0 04 fc ff           ldi16	r0, 0xfffc
 f0 01 ff              ldi8	r1, 0xff
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 aa                    xor	r6, r6
 c3 80                 ldi8	r7, 0x80
 f0 69 0c              cmp32	q0, q3
 da aa 00              breq16	0xaa <L0>
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f4 28                 ldsp16	r4, [sp+0xa]
 f3 12                 mulu8.w	r4, r6
 f4 68                 stsp16	[sp+0xa], r4
 f4 38                 ldsp16	r4, [sp+0xe]
 f4 01                 ldsp16	r5, [sp+0x0]
 f3 11                 mulu8.w	r4, r5
 f0 3c 20              stsp16	[sp+0x20], r4
 f4 31                 ldsp16	r5, [sp+0xc]
 01                    mov	r4, r5
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 12                 mulu8.w	r4, r6
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 34 16              ldsp16	r4, [sp+0x16]
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f4 3a                 ldsp16	r6, [sp+0xe]
 02                    mov	r4, r6
 f0 36 22              ldsp16	r6, [sp+0x22]
 fe 26                 mul16	r4, r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 fa 98                 lsr16i	r6, 0x8
 18                    add	r6, r4
 02                    mov	r4, r6
 f0 37 10              ldsp16	r7, [sp+0x10]
 f1 17                 mov	r2, r7
 f4 0a                 ldsp16	r6, [sp+0x2]
 fe 16                 mul16	r2, r6
 f2 14                 add	r2, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f3 14                 mulu8.w	r5, r4
 f2 26                 add	r5, r2
 f0 34 20              ldsp16	r4, [sp+0x20]
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 04                    mov	r5, r4
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f4 19                 ldsp16	r5, [sp+0x6]
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 c0 03                 ldi8	r4, 0x3
 81                    and	r4, r5
 f2 04                 add	r0, r4
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 03                    mov	r4, r7
 fa 38                 lsl16i	r4, 0x8
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 94                    or	r5, r4
 fa 58                 lsl16i	r6, 0x8
 02                    mov	r4, r6
 f2 38                 sub	r1, r0
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 69 4c              cmp32	q1, q3
 fd 08                 cmov.slt	r1, r0
 f0 39 00              stsp16	[sp+0x0], r1
 ff c4 0e              s32tof	q3, q2
 f0 04 db 0f           ldi16	r0, 0xfdb
 f0 05 c9 2f           ldi16	r1, 0x2fc9
 ff 2c                 fmul	q3, q0
 f2 63                 mov32	q0, q3
 ff 60                 fneg	q0
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f0 69 48              cmp32	q1, q2
 fd 06                 cmov.slt	r0, r6
 fd 0f                 cmov.slt	r1, r7
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 f4 00                 ldsp16	r4, [sp+0x0]
 74                    st16	[r5], r4
 f2 68                 mov32	q2, q0
 d6 2c                 adjsp	0x2c
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L0>:
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f0 36 2a              ldsp16	r6, [sp+0x2a]
 d6 2c                 adjsp	0x2c
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 d4 00                 jmp8	avm_reduce_extended

<avm_reduce_extended>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 c2                 adjsp	-0x3e
 f0 3e 3c              stsp16	[sp+0x3c], r6
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 30              stsp16	[sp+0x30], r4
 f0 3d 32              stsp16	[sp+0x32], r5
 fa 77                 lsr16i	r4, 0x7
 c1 0a                 ldi8	r5, 0xa
 f3 11                 mulu8.w	r4, r5
 08                    mov	r6, r4
 af                    xor	r7, r7
 c4 48 1c              ldi16	r4, 0x1c48
 c1 00                 ldi8	r5, 0x0
 f7 6b                 add32	q2, q3
 f0 64 88              ldp32	q2, [q2]
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 c4 44 1c              ldi16	r4, 0x1c44
 c1 00                 ldi8	r5, 0x0
 f7 6b                 add32	q2, q3
 f0 64 88              ldp32	q2, [q2]
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 fa 38                 lsl16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 04                    mov	r5, r4
 fa 82                 lsr16i	r5, 0x2
 f4 00                 ldsp16	r4, [sp+0x0]
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 f0 04 4c 1c           ldi16	r0, 0x1c4c
 f0 01 00              ldi8	r1, 0x0
 f7 63                 add32	q0, q3
 f0 62 c0              ldp16	r6, [q0]
 0e                    mov	r7, r6
 fa a2                 lsr16i	r7, 0x2
 f0 3f 22              stsp16	[sp+0x22], r7
 fa 5e                 lsl16i	r6, 0xe
 98                    or	r6, r4
 9d                    or	r7, r5
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 f4 18                 ldsp16	r4, [sp+0x6]
 fa 78                 lsr16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 06                    mov	r5, r6
 f3 14                 mulu8.w	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f4 1a                 ldsp16	r6, [sp+0x6]
 f1 76                 zext8	r6
 f0 3e 1e              stsp16	[sp+0x1e], r6
 f0 34 22              ldsp16	r4, [sp+0x22]
 f1 74                 zext8	r4
 f0 3c 10              stsp16	[sp+0x10], r4
 f6 32                 mul8	r4, r6
 11                    add	r4, r5
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 0b                    mov	r6, r7
 af                    xor	r7, r7
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 fa 58                 lsl16i	r6, 0x8
 99                    or	r6, r5
 f4 6a                 stsp16	[sp+0xa], r6
 f0 36 18              ldsp16	r6, [sp+0x18]
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f0 3d 16              stsp16	[sp+0x16], r5
 f4 1a                 ldsp16	r6, [sp+0x6]
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f4 0a                 ldsp16	r6, [sp+0x2]
 02                    mov	r4, r6
 fa 38                 lsl16i	r4, 0x8
 f4 32                 ldsp16	r6, [sp+0xc]
 fa 98                 lsr16i	r6, 0x8
 98                    or	r6, r4
 f0 3e 24              stsp16	[sp+0x24], r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 0b                    mov	r6, r7
 02                    mov	r4, r6
 fa 38                 lsl16i	r4, 0x8
 f4 0a                 ldsp16	r6, [sp+0x2]
 92                    or	r4, r6
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 34 22              ldsp16	r4, [sp+0x22]
 f4 03                 ldsp16	r7, [sp+0x0]
 f3 13                 mulu8.w	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f4 2a                 ldsp16	r6, [sp+0xa]
 f1 76                 zext8	r6
 f0 3e 36              stsp16	[sp+0x36], r6
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f6 3b                 mul8	r6, r7
 18                    add	r6, r4
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 34 22              ldsp16	r4, [sp+0x22]
 f4 1a                 ldsp16	r6, [sp+0x6]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 37 10              ldsp16	r7, [sp+0x10]
 f4 02                 ldsp16	r6, [sp+0x0]
 f6 3e                 mul8	r7, r6
 1c                    add	r7, r4
 f0 3f 2a              stsp16	[sp+0x2a], r7
 f0 34 16              ldsp16	r4, [sp+0x16]
 f6 32                 mul8	r4, r6
 11                    add	r4, r5
 f0 3c 2c              stsp16	[sp+0x2c], r4
 c0 7f                 ldi8	r4, 0x7f
 f0 36 30              ldsp16	r6, [sp+0x30]
 82                    and	r4, r6
 f0 00 80              ldi8	r0, 0x80
 f9 81                 or	r4, r0
 f4 48                 stsp16	[sp+0x2], r4
 f0 34 24              ldsp16	r4, [sp+0x24]
 f4 29                 ldsp16	r5, [sp+0xa]
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 3e 2e              stsp16	[sp+0x2e], r6
 f4 18                 ldsp16	r4, [sp+0x6]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 32                 ldsp16	r6, [sp+0xc]
 06                    mov	r5, r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f0 3d 28              stsp16	[sp+0x28], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 f6 32                 mul8	r4, r6
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 11                    add	r4, r5
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 36 12              ldsp16	r6, [sp+0x12]
 f1 76                 zext8	r6
 f4 18                 ldsp16	r4, [sp+0x6]
 fe 34                 mul16	r6, r4
 f4 01                 ldsp16	r5, [sp+0x0]
 f0 34 20              ldsp16	r4, [sp+0x20]
 fe 2c                 mul16	r5, r4
 16                    add	r5, r6
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 09                 ldsp16	r5, [sp+0x2]
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f4 32                 ldsp16	r6, [sp+0xc]
 06                    mov	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f0 36 18              ldsp16	r6, [sp+0x18]
 02                    mov	r4, r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f6 3b                 mul8	r6, r7
 18                    add	r6, r4
 f0 3e 38              stsp16	[sp+0x38], r6
 f0 36 16              ldsp16	r6, [sp+0x16]
 f4 00                 ldsp16	r4, [sp+0x0]
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 18                    add	r6, r4
 f0 3e 3a              stsp16	[sp+0x3a], r6
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 98                 lsr16i	r6, 0x8
 f0 3e 12              stsp16	[sp+0x12], r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 02                    mov	r4, r6
 f0 36 12              ldsp16	r6, [sp+0x12]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 36 10              ldsp16	r6, [sp+0x10]
 12                    add	r4, r6
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 0c                    mov	r7, r4
 f0 36 2e              ldsp16	r6, [sp+0x2e]
 f6 3e                 mul8	r7, r6
 1d                    add	r7, r5
 f0 3f 2a              stsp16	[sp+0x2a], r7
 f0 35 20              ldsp16	r5, [sp+0x20]
 f1 75                 zext8	r5
 f6 34                 mul8	r5, r4
 f0 34 28              ldsp16	r4, [sp+0x28]
 14                    add	r5, r4
 f0 3d 28              stsp16	[sp+0x28], r5
 0e                    mov	r7, r6
 f0 34 30              ldsp16	r4, [sp+0x30]
 fe 3c                 mul16	r7, r4
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 1c                    add	r7, r4
 f0 3f 1c              stsp16	[sp+0x1c], r7
 f0 34 18              ldsp16	r4, [sp+0x18]
 08                    mov	r6, r4
 f1 76                 zext8	r6
 0e                    mov	r7, r6
 f4 09                 ldsp16	r5, [sp+0x2]
 f6 3d                 mul8	r7, r5
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 37 2c              ldsp16	r7, [sp+0x2c]
 f0 35 10              ldsp16	r5, [sp+0x10]
 17                    add	r5, r7
 f0 3d 10              stsp16	[sp+0x10], r5
 f4 03                 ldsp16	r7, [sp+0x0]
 f6 3b                 mul8	r6, r7
 f0 35 38              ldsp16	r5, [sp+0x38]
 19                    add	r6, r5
 f0 3e 30              stsp16	[sp+0x30], r6
 f4 09                 ldsp16	r5, [sp+0x2]
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f0 35 3a              ldsp16	r5, [sp+0x3a]
 11                    add	r4, r5
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f4 28                 ldsp16	r4, [sp+0xa]
 f3 13                 mulu8.w	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f4 32                 ldsp16	r6, [sp+0xc]
 06                    mov	r5, r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f0 36 16              ldsp16	r6, [sp+0x16]
 f4 08                 ldsp16	r4, [sp+0x2]
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 34 34              ldsp16	r4, [sp+0x34]
 18                    add	r6, r4
 f0 3e 2c              stsp16	[sp+0x2c], r6
 f4 00                 ldsp16	r4, [sp+0x0]
 08                    mov	r6, r4
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 f3 1b                 mulu8.w	r6, r7
 fa 98                 lsr16i	r6, 0x8
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 1b                    add	r6, r7
 f0 3e 1c              stsp16	[sp+0x1c], r6
 08                    mov	r6, r4
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 f6 38                 mul8	r6, r4
 f0 34 28              ldsp16	r4, [sp+0x28]
 18                    add	r6, r4
 f0 3e 28              stsp16	[sp+0x28], r6
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f1 76                 zext8	r6
 f4 72                 stsp16	[sp+0xc], r6
 0e                    mov	r7, r6
 f4 08                 ldsp16	r4, [sp+0x2]
 f6 3c                 mul8	r7, r4
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 1c                    add	r7, r4
 f0 3f 34              stsp16	[sp+0x34], r7
 02                    mov	r4, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f6 32                 mul8	r4, r6
 11                    add	r4, r5
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 36 12              ldsp16	r6, [sp+0x12]
 f6 36                 mul8	r5, r6
 f0 36 18              ldsp16	r6, [sp+0x18]
 16                    add	r5, r6
 f0 3d 2a              stsp16	[sp+0x2a], r5
 f0 35 30              ldsp16	r5, [sp+0x30]
 fa 88                 lsr16i	r5, 0x8
 f0 36 10              ldsp16	r6, [sp+0x10]
 16                    add	r5, r6
 f0 3d 30              stsp16	[sp+0x30], r5
 f0 36 36              ldsp16	r6, [sp+0x36]
 f4 09                 ldsp16	r5, [sp+0x2]
 f6 39                 mul8	r6, r5
 18                    add	r6, r4
 f0 3e 2e              stsp16	[sp+0x2e], r6
 f4 18                 ldsp16	r4, [sp+0x6]
 f0 35 20              ldsp16	r5, [sp+0x20]
 f3 14                 mulu8.w	r5, r4
 f4 2a                 ldsp16	r6, [sp+0xa]
 f3 18                 mulu8.w	r6, r4
 f4 6a                 stsp16	[sp+0xa], r6
 f0 36 24              ldsp16	r6, [sp+0x24]
 0e                    mov	r7, r6
 f3 1c                 mulu8.w	r7, r4
 fa a8                 lsr16i	r7, 0x8
 f0 34 34              ldsp16	r4, [sp+0x34]
 1c                    add	r7, r4
 f0 3f 18              stsp16	[sp+0x18], r7
 02                    mov	r4, r6
 f4 03                 ldsp16	r7, [sp+0x0]
 f3 13                 mulu8.w	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f0 36 28              ldsp16	r6, [sp+0x28]
 12                    add	r4, r6
 f0 3c 10              stsp16	[sp+0x10], r4
 01                    mov	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 11                    add	r4, r5
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 f6 3c                 mul8	r7, r4
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 1c                    add	r7, r4
 f0 3f 2c              stsp16	[sp+0x2c], r7
 f0 35 16              ldsp16	r5, [sp+0x16]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f6 36                 mul8	r5, r6
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 14                    add	r5, r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 34 22              ldsp16	r4, [sp+0x22]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 29                 ldsp16	r5, [sp+0xa]
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f6 31                 mul8	r4, r5
 f0 36 24              ldsp16	r6, [sp+0x24]
 f1 76                 zext8	r6
 0e                    mov	r7, r6
 f6 3d                 mul8	r7, r5
 f0 35 2e              ldsp16	r5, [sp+0x2e]
 1d                    add	r7, r5
 f0 3f 22              stsp16	[sp+0x22], r7
 f4 29                 ldsp16	r5, [sp+0xa]
 11                    add	r4, r5
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 34 30              ldsp16	r4, [sp+0x30]
 fa 78                 lsr16i	r4, 0x8
 f0 35 16              ldsp16	r5, [sp+0x16]
 11                    add	r4, r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f0 37 2c              ldsp16	r7, [sp+0x2c]
 17                    add	r5, r7
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f1 74                 zext8	r4
 fa 48                 lsl16i	r5, 0x8
 94                    or	r5, r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 34 24              ldsp16	r4, [sp+0x24]
 f4 09                 ldsp16	r5, [sp+0x2]
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f0 37 20              ldsp16	r7, [sp+0x20]
 13                    add	r4, r7
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 0e                    mov	r7, r6
 f6 3d                 mul8	r7, r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 1c                    add	r7, r4
 f0 3f 16              stsp16	[sp+0x16], r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f6 38                 mul8	r6, r4
 f0 35 18              ldsp16	r5, [sp+0x18]
 19                    add	r6, r5
 f0 3e 18              stsp16	[sp+0x18], r6
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 36 12              ldsp16	r6, [sp+0x12]
 0d                    mov	r7, r5
 f3 1e                 mulu8.w	r7, r6
 fa a8                 lsr16i	r7, 0x8
 f0 35 22              ldsp16	r5, [sp+0x22]
 1d                    add	r7, r5
 f0 3f 20              stsp16	[sp+0x20], r7
 f0 35 36              ldsp16	r5, [sp+0x36]
 f6 34                 mul8	r5, r4
 f4 32                 ldsp16	r6, [sp+0xc]
 16                    add	r5, r6
 f0 36 12              ldsp16	r6, [sp+0x12]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f4 09                 ldsp16	r5, [sp+0x2]
 f6 36                 mul8	r5, r6
 14                    add	r5, r4
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 0c                    mov	r7, r4
 04                    mov	r5, r4
 fa a8                 lsr16i	r7, 0x8
 f0 34 20              ldsp16	r4, [sp+0x20]
 1c                    add	r7, r4
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f0 36 18              ldsp16	r6, [sp+0x18]
 12                    add	r4, r6
 f1 75                 zext8	r5
 fa 68                 lsl16i	r7, 0x8
 9d                    or	r7, r5
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 35 16              ldsp16	r5, [sp+0x16]
 19                    add	r6, r5
 f1 74                 zext8	r4
 06                    mov	r5, r6
 fa 48                 lsl16i	r5, 0x8
 94                    or	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 f0 34 24              ldsp16	r4, [sp+0x24]
 f4 01                 ldsp16	r5, [sp+0x0]
 14                    add	r5, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f1 17                 mov	r2, r7
 f1 1c                 mov	r3, r4
 c3 03                 ldi8	r7, 0x3
 8d                    and	r7, r5
 f9 c0                 and	r6, r0
 fa 97                 lsr16i	r6, 0x7
 02                    mov	r4, r6
 a5                    xor	r5, r5
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f4 a6                 tst8	r6
 aa                    xor	r6, r6
 d0 1b                 breq8	0x1b <L0>
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 f4 28                 ldsp16	r4, [sp+0xa]
 28                    sub	r6, r4
 f6 2c                 tst16	r4
 f8 04                 cset.eq	r4
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f7 61                 add32	q0, q1
 f4 af                 inc16	r7
 d4 04                 jmp8	0x4 <L1>
<L0>:
 f4 2a                 ldsp16	r6, [sp+0xa]
 f2 61                 mov32	q0, q1
<L1>:
 f4 43                 stsp16	[sp+0x0], r7
 ff c5 00              u32tof	q0, q0
 a0                    xor	r4, r4
 c5 80 2f              ldi16	r5, 0x2f80
 ff 22                 fmul	q0, q2
 ff c1 63              u16tof	q3, r6
 c5 80 27              ldi16	r5, 0x2780
 ff 2e                 fmul	q3, q2
 ff 0c                 fadd	q3, q0
 c4 db 0f              ldi16	r4, 0xfdb
 c5 c9 3f              ldi16	r5, 0x3fc9
 ff 2e                 fmul	q3, q2
 f4 21                 ldsp16	r5, [sp+0x8]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 f2 63                 mov32	q0, q3
 ff 60                 fneg	q0
 f0 32 02              ldsp16	r2, [sp+0x2]
 f5 14                 cmp	r2, r4
 fb 06                 cmov.eq	r0, r6
 fb 0f                 cmov.eq	r1, r7
 a0                    xor	r4, r4
 f1 14                 mov	r2, r4
 f0 33 00              ldsp16	r3, [sp+0x0]
 f2 43                 sub	r2, r3
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f0 69 c8              cmp32	q3, q2
 fd 1a                 cmov.slt	r3, r2
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 f5 53                 st16	[r4], r3
 f2 68                 mov32	q2, q0
 d6 3e                 adjsp	0x3e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
