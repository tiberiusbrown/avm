
complex_catanh.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 d6 e8                 adjsp	-0x18
 c4 08 01              ldi16	r4, 0x108
 f0 6a 88              ld32	q2, [r4]
 c6 0c 01              ldi16	r6, 0x10c
 f0 6a cc              ld32	q3, [r6]
 d7 01                 sys	debug_break
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 14 10              leasp	r4, 0x10
 f0 15 00              leasp	r5, 0x0
 e1 d1 0a              call16	catanhf
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

<memset>:
 0c                    mov	r7, r4
 d7 11                 sys	memset
 03                    mov	r4, r7
 ef                    ret

<catanhf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e4                 adjsp	-0x1c
 f4 60                 stsp16	[sp+0x8], r4
 f4 68                 stsp16	[sp+0xa], r4
 f0 6a ca              ld32	q3, [r5]
 c9 04                 addi.s8	r5, 0x4
 f0 6a 4a              ld32	q1, [r5]
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 f1 0b                 mov	r1, r3
 f4 81                 lsl16.1	r1
 c4 00 ff              ldi16	r4, 0xff00
 f9 32                 xor	r1, r4
 07                    mov	r5, r7
 15                    add	r5, r5
 a4                    xor	r5, r4
 02                    mov	r4, r6
 f1 04                 mov	r0, r4
 f9 15                 or	r0, r5
 f0 38 0c              stsp16	[sp+0xc], r0
 f1 02                 mov	r0, r2
 f9 05                 or	r0, r1
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 07                    mov	r5, r7
 e1 77 02              call16	fabsf
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 69                 mov32	q2, q1
 e1 6e 02              call16	fabsf
 f6 28                 tst16	r0
 f8 06                 cset.eq	r6
 f4 33                 ldsp16	r7, [sp+0xc]
 f6 2f                 tst16	r7
 d0 42                 breq8	0x42 <L0>
 c3 01                 ldi8	r7, 0x1
 8b                    and	r6, r7
 f4 a6                 tst8	r6
 d1 3b                 brne8	0x3b <L0>
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 f2 6b                 mov32	q3, q1
 ff 14                 fcmp
 ce 02                 cmpi.s8	r6, 0x2
 da 1d 02              breq16	0x21d <L14>
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 f9 81                 or	r4, r0
 f6 2c                 tst16	r4
 d1 52                 brne8	0x52 <L3>
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 14                 fcmp
 f6 2e                 tst16	r6
 db e3 00              brne16	0xe3 <L4>
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e1 14 03              call16	copysignf
 e0 e6 00              jmp16	230 <L5>
<L0>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e1 08 03              call16	copysignf
 f2 62                 mov32	q0, q2
 f7 8a                 bool	r2
 f4 83                 lsl16.1	r3
 f9 69                 or	r3, r2
 c4 00 ff              ldi16	r4, 0xff00
 f5 23                 cmp	r4, r3
 dc d5 01              brult16	0x1d5 <L13>
 c4 db 0f              ldi16	r4, 0xfdb
 c5 c9 3f              ldi16	r5, 0x3fc9
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 e1 e9 02              call16	copysignf
<L1>:
 f4 22                 ldsp16	r6, [sp+0x8]
 f0 6b 0c              st32	[r6], q0
<L2>:
 ca 04                 addi.s8	r6, 0x4
 f0 6b 8c              st32	[r6], q2
 e0 b0 01              jmp16	432 <L12>
<L3>:
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 c6 6b 0b              ldi16	r6, 0xb6b
 c7 5e 5d              ldi16	r7, 0x5d5e
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 da a8 00              breq16	0xa8 <L6>
 c6 6b 0b              ldi16	r6, 0xb6b
 c7 5e 5d              ldi16	r7, 0x5d5e
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 da 97 00              breq16	0x97 <L6>
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 01                 fsub
 f2 62                 mov32	q0, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f0 3a 18              stsp16	[sp+0x18], r2
 f0 3b 1a              stsp16	[sp+0x1a], r3
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 c6 60 42              ldi16	r6, 0x4260
 c7 a2 0d              ldi16	r7, 0xda2
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 db d5 00              brne16	0xd5 <L8>
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f2 6a                 mov32	q3, q0
 e1 34 06              call16	hypotf
 e1 73 01              call16	logf
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f2 6a                 mov32	q3, q0
 f2 61                 mov32	q0, q1
 e1 20 06              call16	hypotf
 e1 5f 01              call16	logf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 01                 fsub
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 e0 be 00              jmp16	190 <L9>
<L4>:
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 d1 64                 brne8	0x64 <L7>
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 e1 51 0a              call16	atanhf
<L5>:
 f4 23                 ldsp16	r7, [sp+0x8]
 0b                    mov	r6, r7
 ca 04                 addi.s8	r6, 0x4
 f0 6b 4c              st32	[r6], q1
 f0 6b 8e              st32	[r7], q2
 e0 f1 00              jmp16	241 <L12>
<L6>:
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 6a                 mov32	q3, q0
 e1 23 02              call16	fmaxf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 f2 63                 mov32	q0, q3
 ff 03                 fdiv
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 6a                 mov32	q3, q0
 ff 03                 fdiv
 f2 66                 mov32	q1, q2
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 03                 fdiv
 f2 6a                 mov32	q3, q0
 ff 03                 fdiv
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e1 d9 01              call16	copysignf
 f2 62                 mov32	q0, q2
 c4 db 0f              ldi16	r4, 0xfdb
 c5 c9 3f              ldi16	r5, 0x3fc9
 e0 8e 00              jmp16	142 <L10>
<L7>:
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 ff 03                 fdiv
 e1 30 02              call16	log1pf
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 02                 fmul
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e1 b0 01              call16	copysignf
 f2 62                 mov32	q0, q2
 c4 db 0f              ldi16	r4, 0xfdb
 c5 c9 3f              ldi16	r5, 0x3fc9
 f2 6b                 mov32	q3, q1
 d4 6a                 jmp8	0x6a <L11>
<L8>:
 aa                    xor	r6, r6
 c7 80 40              ldi16	r7, 0x4080
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 03                 fdiv
 e1 02 02              call16	log1pf
 f2 66                 mov32	q1, q2
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 c7 80 3e              ldi16	r7, 0x3e80
 f2 69                 mov32	q2, q1
<L9>:
 ff 02                 fmul
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 ff 01                 fsub
 f2 62                 mov32	q0, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 f2 6a                 mov32	q3, q0
 e1 f2 02              call16	atan2f
 f2 66                 mov32	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e1 4a 01              call16	copysignf
 f2 62                 mov32	q0, q2
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 f2 69                 mov32	q2, q1
 ff 02                 fmul
<L10>:
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
<L11>:
 e1 37 01              call16	copysignf
 f4 23                 ldsp16	r7, [sp+0x8]
 0b                    mov	r6, r7
 ca 04                 addi.s8	r6, 0x4
 f0 6b 8c              st32	[r6], q2
 f0 6b 0e              st32	[r7], q0
<L12>:
 f4 28                 ldsp16	r4, [sp+0xa]
 d6 1c                 adjsp	0x1c
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L13>:
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 e0 31 fe              jmp16	-463 <L1>
<L14>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 03                    mov	r4, r7
 10                    add	r4, r4
 92                    or	r4, r6
 f6 2c                 tst16	r4
 d1 14                 brne8	0x14 <L15>
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 6b 8c              st32	[r6], q2
 ca 04                 addi.s8	r6, 0x4
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 f0 6b 8c              st32	[r6], q2
 d4 cf                 jmp8	-0x31 <L12>
<L15>:
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 f4 22                 ldsp16	r6, [sp+0x8]
 f0 6b 8c              st32	[r6], q2
 e0 0b fe              jmp16	-501 <L2>

<fabsf>:
 ff 0a                 fabs	q2
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
 dd 89 00              bruge16	0x89 <L3>
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
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f0 06 20 fb           ldi16	r2, 0xfb20
 f0 03 4a              ldi8	r3, 0x4a
 f7 64                 add32	q1, q0
 c3 80                 ldi8	r7, 0x80
 f9 ec                 and	r7, r3
 f9 3d                 or	r1, r7
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 12                    add	r4, r6
 f1 2b                 mov	r6, r3
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 18                    add	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
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
 e0 95 00              jmp16	149 <L3>
<L0>:
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 00                 fadd
 c7 80 80              ldi16	r7, 0x8080
 f2 62                 mov32	q0, q2
 f7 63                 add32	q0, q3
 f0 69 c0              cmp32	q3, q0
 dd 8b 00              bruge16	0x8b <L5>
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 7f              ldi8	r3, 0x7f
 f0 69 48              cmp32	q1, q2
 d2 0b                 brult8	0xb <L1>
 aa                    xor	r6, r6
 c7 00 4c              ldi16	r7, 0x4c00
 ff 02                 fmul
 c6 68 ff              ldi16	r6, 0xff68
 d4 03                 jmp8	0x3 <L2>
<L1>:
 c6 81 ff              ldi16	r6, 0xff81
<L2>:
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 f0 04 20 fb           ldi16	r0, 0xfb20
 f0 01 4a              ldi8	r1, 0x4a
 f7 61                 add32	q0, q1
 c3 80                 ldi8	r7, 0x80
 f9 e4                 and	r7, r1
 f9 7d                 or	r3, r7
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 12                    add	r4, r6
 f1 29                 mov	r6, r1
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 18                    add	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
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
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 d0 11                 breq8	0x11 <L6>
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c8              cmp32	q3, q2
 d9 12                 brsge8	0x12 <L7>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 d4 dd                 jmp8	-0x23 <L4>
<L6>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 10 01           stm16	[0x110], r4
 a0                    xor	r4, r4
 c5 80 ff              ldi16	r5, 0xff80
 d4 d1                 jmp8	-0x2f <L4>
<L7>:
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 c4              cmp32	q3, q1
 d8 07                 bruge8	0x7 <L8>
 c6 c0 7f              ldi16	r6, 0x7fc0
 99                    or	r6, r5
 06                    mov	r5, r6
 d4 c1                 jmp8	-0x3f <L4>
<L8>:
 c2 21                 ldi8	r6, 0x21
 f0 5e 10 01           stm16	[0x110], r6
 c6 c0 7f              ldi16	r6, 0x7fc0
 99                    or	r6, r5
 06                    mov	r5, r6
 d4 b4                 jmp8	-0x4c <L4>

<atan2f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f2 67                 mov32	q1, q3
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 14                 fcmp
 ce 02                 cmpi.s8	r6, 0x2
 da 18 02              breq16	0x218 <L15>
 f2 6a                 mov32	q3, q0
 ff 0b                 fabs	q3
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d0 2c                 breq8	0x2c <L0>
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 ff 09                 fabs	q1
 f0 69 48              cmp32	q1, q2
 d0 40                 breq8	0x40 <L1>
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 c8              cmp32	q3, q2
 d1 4e                 brne8	0x4e <L2>
 f0 39 02              stsp16	[sp+0x2], r1
 c6 c9 3f              ldi16	r6, 0x3fc9
 c7 49 3f              ldi16	r7, 0x3f49
 f0 69 48              cmp32	q1, q2
 fb 37                 cmov.eq	r6, r7
 c4 db 0f              ldi16	r4, 0xfdb
 0e                    mov	r7, r6
 08                    mov	r6, r4
 e0 8a 01              jmp16	394 <L12>
<L0>:
 c4 00 80              ldi16	r4, 0x8000
 f9 84                 and	r4, r1
 a5                    xor	r5, r5
 c6 49 40              ldi16	r6, 0x4049
 c7 49 c0              ldi16	r7, 0xc049
 31                    cmp	r4, r5
 fb 77                 cmov.ne	r6, r7
 c4 db 0f              ldi16	r4, 0xfdb
 06                    mov	r5, r6
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 fd 04                 cmov.slt	r0, r4
 fd 0d                 cmov.slt	r1, r5
 f2 6a                 mov32	q3, q0
 e0 96 01              jmp16	406 <L13>
<L1>:
 c4 00 80              ldi16	r4, 0x8000
 f9 84                 and	r4, r1
 a5                    xor	r5, r5
 c6 c9 3f              ldi16	r6, 0x3fc9
 c7 c9 bf              ldi16	r7, 0xbfc9
 31                    cmp	r4, r5
 fb 77                 cmov.ne	r6, r7
 c4 db 0f              ldi16	r4, 0xfdb
 0e                    mov	r7, r6
 08                    mov	r6, r4
 e0 7f 01              jmp16	383 <L13>
<L2>:
 f0 69 48              cmp32	q1, q2
 d1 08                 brne8	0x8 <L3>
 f0 39 02              stsp16	[sp+0x2], r1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 e0 45 01              jmp16	325 <L12>
<L3>:
 f0 69 4c              cmp32	q1, q3
 d8 3a                 bruge8	0x3a <L4>
 f2 69                 mov32	q2, q1
 ff 03                 fdiv
 f2 66                 mov32	q1, q2
 f1 23                 mov	r4, r3
 c5 ff 3e              ldi16	r5, 0x3eff
 34                    cmp	r5, r4
 d2 68                 brult8	0x68 <L5>
 c5 7f 3e              ldi16	r5, 0x3e7f
 34                    cmp	r5, r4
 dc b8 00              brult16	0xb8 <L7>
 f0 39 02              stsp16	[sp+0x2], r1
 f2 69                 mov32	q2, q1
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 ff 15 04 16 15 05 be 3e 59 4c 3e 46 aa aa be 00 00 80 3f      fpoly	4, -0.129963249, 0.199559182, -0.333330333, 1.0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 e0 fa 00              jmp16	250 <L10>
<L4>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6b                 mov32	q3, q1
 ff 03                 fdiv
 f2 66                 mov32	q1, q2
 f1 23                 mov	r4, r3
 c5 ff 3e              ldi16	r5, 0x3eff
 34                    cmp	r5, r4
 d2 58                 brult8	0x58 <L6>
 f0 39 02              stsp16	[sp+0x2], r1
 c5 7f 3e              ldi16	r5, 0x3e7f
 34                    cmp	r5, r4
 dc 9d 00              brult16	0x9d <L8>
 f2 69                 mov32	q2, q1
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 ff 15 04 16 15 05 be 3e 59 4c 3e 46 aa aa be 00 00 80 3f      fpoly	4, -0.129963249, 0.199559182, -0.333330333, 1.0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 e0 c8 00              jmp16	200 <L11>
<L5>:
 c5 3f 3f              ldi16	r5, 0x3f3f
 34                    cmp	r5, r4
 dc 95 00              brult16	0x95 <L9>
 f0 39 02              stsp16	[sp+0x2], r1
 aa                    xor	r6, r6
 c7 20 bf              ldi16	r7, 0xbf20
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 ff 15 05 a1 71 d1 3d c3 37 9c 3c ed 79 a5 be fd 17 38 3f 5e 00 0f 3f  fpoly	5, 0.102267511, 0.019069558, -0.323195845, 0.719116032, 0.558599353
 e0 92 00              jmp16	146 <L10>
<L6>:
 f0 39 02              stsp16	[sp+0x2], r1
 c5 3f 3f              ldi16	r5, 0x3f3f
 34                    cmp	r5, r4
 dc ca 00              brult16	0xca <L14>
 aa                    xor	r6, r6
 c7 20 bf              ldi16	r7, 0xbf20
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 ff 15 05 a1 71 d1 3d c3 37 9c 3c ed 79 a5 be fd 17 38 3f 5e 00 0f 3f  fpoly	5, 0.102267511, 0.019069558, -0.323195845, 0.719116032, 0.558599353
 d4 71                 jmp8	0x71 <L11>
<L7>:
 f0 39 02              stsp16	[sp+0x2], r1
 aa                    xor	r6, r6
 c7 c0 be              ldi16	r7, 0xbec0
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 ff 15 05 29 9e 3f 3e ad d1 05 be 09 8f 93 be 92 70 60 3f c7 b0 b7 3e  fpoly	5, 0.187126771, -0.130682662, -0.288200647, 0.876717686, 0.358770579
 d4 43                 jmp8	0x43 <L10>
<L8>:
 aa                    xor	r6, r6
 c7 c0 be              ldi16	r7, 0xbec0
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 ff 15 05 29 9e 3f 3e ad d1 05 be 09 8f 93 be 92 70 60 3f c7 b0 b7 3e  fpoly	5, 0.187126771, -0.130682662, -0.288200647, 0.876717686, 0.358770579
 d4 2c                 jmp8	0x2c <L11>
<L9>:
 f0 39 02              stsp16	[sp+0x2], r1
 aa                    xor	r6, r6
 c7 60 bf              ldi16	r7, 0xbf60
 f2 69                 mov32	q2, q1
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
<L12>:
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 c4 db 0f              ldi16	r4, 0xfdb
 c5 49 40              ldi16	r5, 0x4049
 ff 01                 fsub
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 40              cmp32	q1, q0
 fd 34                 cmov.slt	r6, r4
 fd 3d                 cmov.slt	r7, r5
 c4 00 80              ldi16	r4, 0x8000
 f0 31 02              ldsp16	r1, [sp+0x2]
 f9 84                 and	r4, r1
 ff 0b                 fabs	q3
 f2 63                 mov32	q0, q3
 ff 04                 fneg	q0
 a5                    xor	r5, r5
 31                    cmp	r4, r5
 fb 70                 cmov.ne	r6, r0
 fb 79                 cmov.ne	r7, r1
<L13>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L14>:
 aa                    xor	r6, r6
 c7 60 bf              ldi16	r7, 0xbf60
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 ff 15 05 d6 da b4 3c 79 68 9e 3d 96 b6 8f be 42 fe 10 3f 3f 05 38 3f  fpoly	5, 0.0220770054, 0.0773477033, -0.280689895, 0.566379666, 0.718830049
 d4 a7                 jmp8	-0x59 <L11>
<L15>:
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d4 cc                 jmp8	-0x34 <L13>

<hypotf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f2 66                 mov32	q1, q2
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 ff 0b                 fabs	q3
 a0                    xor	r4, r4
 c5 80 de              ldi16	r5, 0xde80
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 ff 09                 fabs	q1
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f7 66                 add32	q1, q2
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 3b           ldi16	r1, 0x3bff
 f0 69 04              cmp32	q0, q1
 f2 67                 mov32	q1, q3
 d2 2c                 brult8	0x2c <L1>
 f7 69                 add32	q2, q1
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 3b              ldi16	r7, 0x3bff
 f0 69 c8              cmp32	q3, q2
 d2 1f                 brult8	0x1f <L1>
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 ff 16                 fsqrt
<L0>:
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L1>:
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f0 69 08              cmp32	q0, q2
 d0 ea                 breq8	-0x16 <L0>
 f0 69 48              cmp32	q1, q2
 d0 e5                 breq8	-0x1b <L0>
 f0 69 80              cmp32	q2, q0
 d2 26                 brult8	0x26 <L2>
 c0 01                 ldi8	r4, 0x1
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 48              cmp32	q1, q2
 d8 1c                 bruge8	0x1c <L2>
 f0 69 04              cmp32	q0, q1
 d8 1f                 bruge8	0x1f <L3>
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f2 69                 mov32	q2, q1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 d0 bc                 breq8	-0x44 <L0>
 d4 1f                 jmp8	0x1f <L4>
<L2>:
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 d4 b2                 jmp8	-0x4e <L0>
<L3>:
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f2 68                 mov32	q2, q0
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f2 61                 mov32	q0, q1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 d0 9b                 breq8	-0x65 <L0>
<L4>:
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f2 6b                 mov32	q3, q1
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f7 7c                 sub32	q3, q0
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 06           ldi16	r1, 0x6ff
 f0 69 0c              cmp32	q0, q3
 dc 7d ff              brult16	-0x83 <L0>
 aa                    xor	r6, r6
 c7 80 5d              ldi16	r7, 0x5d80
 f0 69 4c              cmp32	q1, q3
 d2 5d                 brult8	0x5d <L5>
 aa                    xor	r6, r6
 c7 80 1d              ldi16	r7, 0x1d80
 f2 66                 mov32	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 ff 16                 fsqrt
 c2 04                 ldi8	r6, 0x4
 c7 80 a2              ldi16	r7, 0xa280
 f7 6e                 add32	q3, q2
 f0 00 08              ldi8	r0, 0x8
 f2 39                 sub	r1, r1
 f0 69 0c              cmp32	q0, q3
 d2 5e                 brult8	0x5e <L6>
 f2 62                 mov32	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e1 a7 00              call16	avm_hypot_overflows
 f4 a4                 tst8	r4
 db 95 00              brne16	0x95 <L8>
 c6 ff ff              ldi16	r6, 0xffff
 c7 7f 5d              ldi16	r7, 0x5d7f
 f2 68                 mov32	q2, q0
 f0 69 c8              cmp32	q3, q2
 d8 3f                 bruge8	0x3f <L6>
 c4 ff ff              ldi16	r4, 0xffff
 c5 7f 7f              ldi16	r5, 0x7f7f
 e0 17 ff              jmp16	-233 <L0>
<L5>:
 f2 62                 mov32	q0, q2
 c4 ff ff              ldi16	r4, 0xffff
 c1 7f                 ldi8	r5, 0x7f
 f0 69 84              cmp32	q2, q1
 d2 48                 brult8	0x48 <L7>
 aa                    xor	r6, r6
 c7 80 7e              ldi16	r7, 0x7e80
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 ff 16                 fsqrt
 aa                    xor	r6, r6
 c3 80                 ldi8	r7, 0x80
 ff 02                 fmul
 e0 e1 fe              jmp16	-287 <L0>
<L6>:
 aa                    xor	r6, r6
 c7 80 61              ldi16	r7, 0x6180
 ff 02                 fmul
 c7 80 7f              ldi16	r7, 0x7f80
 8d                    and	r7, r5
 c6 80 80              ldi16	r6, 0x8080
 1b                    add	r6, r7
 c7 ff 80              ldi16	r7, 0x80ff
 3e                    cmp	r7, r6
 dc cc fe              brult16	-0x134 <L0>
 c2 22                 ldi8	r6, 0x22
 f0 5e 10 01           stm16	[0x110], r6
 e0 c3 fe              jmp16	-317 <L0>
<L7>:
 aa                    xor	r6, r6
 c7 80 61              ldi16	r7, 0x6180
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 ff 16                 fsqrt
 aa                    xor	r6, r6
 c7 80 1d              ldi16	r7, 0x1d80
 ff 02                 fmul
 e0 98 fe              jmp16	-360 <L0>
<L8>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 10 01           stm16	[0x110], r4
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 e0 8b fe              jmp16	-373 <L0>

<avm_hypot_overflows>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 da                 adjsp	-0x26
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f4 7a                 stsp16	[sp+0xe], r6
 03                    mov	r4, r7
 f0 3f 14              stsp16	[sp+0x14], r7
 fa 77                 lsr16i	r4, 0x7
 c3 fe                 ldi8	r7, 0xfe
 2c                    sub	r7, r4
 cf 0c                 cmpi.s8	r7, 0xc
 dd 4c 02              bruge16	0x24c <L2>
 f4 38                 ldsp16	r4, [sp+0xe]
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 04                    mov	r5, r4
 f3 16                 mulu8.w	r5, r6
 f0 3e 12              stsp16	[sp+0x12], r6
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 f0 05 fe 01           ldi16	r1, 0x1fe
 f9 84                 and	r4, r1
 f3 1a                 mulu8.w	r6, r6
 f4 4a                 stsp16	[sp+0x2], r6
 f0 00 fd              ldi8	r0, 0xfd
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f9 c0                 and	r6, r0
 18                    add	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 15                    add	r5, r5
 f9 a4                 and	r5, r1
 f4 3a                 ldsp16	r6, [sp+0xe]
 02                    mov	r4, r6
 f3 10                 mulu8.w	r4, r4
 f0 3c 24              stsp16	[sp+0x24], r4
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f0 3c 18              stsp16	[sp+0x18], r4
 fa 78                 lsr16i	r4, 0x8
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f4 70                 stsp16	[sp+0xc], r4
 f0 02 7f              ldi8	r2, 0x7f
 f0 36 14              ldsp16	r6, [sp+0x14]
 f9 c8                 and	r6, r2
 c0 80                 ldi8	r4, 0x80
 f1 1c                 mov	r3, r4
 98                    or	r6, r4
 0e                    mov	r7, r6
 f4 38                 ldsp16	r4, [sp+0xe]
 f3 1c                 mulu8.w	r7, r4
 f4 43                 stsp16	[sp+0x0], r7
 03                    mov	r4, r7
 fa 77                 lsr16i	r4, 0x7
 f9 84                 and	r4, r1
 f4 09                 ldsp16	r5, [sp+0x2]
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 06                    mov	r5, r6
 f0 34 12              ldsp16	r4, [sp+0x12]
 f3 14                 mulu8.w	r5, r4
 0d                    mov	r7, r5
 fa a7                 lsr16i	r7, 0x7
 f9 e4                 and	r7, r1
 02                    mov	r4, r6
 f6 30                 mul8	r4, r4
 13                    add	r4, r7
 f4 78                 stsp16	[sp+0xe], r4
 15                    add	r5, r5
 f9 a4                 and	r5, r1
 f4 08                 ldsp16	r4, [sp+0x2]
 14                    add	r5, r4
 0d                    mov	r7, r5
 f4 01                 ldsp16	r5, [sp+0x0]
 15                    add	r5, r5
 f9 a4                 and	r5, r1
 f4 30                 ldsp16	r4, [sp+0xc]
 14                    add	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 f4 21                 ldsp16	r5, [sp+0x8]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f9 88                 and	r4, r2
 f9 8d                 or	r4, r3
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 fa 78                 lsr16i	r4, 0x8
 13                    add	r4, r7
 f0 3c 12              stsp16	[sp+0x12], r4
 fa 78                 lsr16i	r4, 0x8
 f4 39                 ldsp16	r5, [sp+0xe]
 11                    add	r4, r5
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 0c                    mov	r7, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f3 1c                 mulu8.w	r7, r4
 f4 73                 stsp16	[sp+0xc], r7
 fa a7                 lsr16i	r7, 0x7
 f9 e4                 and	r7, r1
 fa 78                 lsr16i	r4, 0x8
 f4 68                 stsp16	[sp+0xa], r4
 f3 10                 mulu8.w	r4, r4
 f0 3c 14              stsp16	[sp+0x14], r4
 fa 78                 lsr16i	r4, 0x8
 13                    add	r4, r7
 0c                    mov	r7, r4
 f3 1a                 mulu8.w	r6, r6
 c4 00 ff              ldi16	r4, 0xff00
 f1 14                 mov	r2, r4
 88                    and	r6, r4
 c4 00 07              ldi16	r4, 0x700
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 84                    and	r5, r4
 16                    add	r5, r6
 f4 79                 stsp16	[sp+0xe], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 04                    mov	r5, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 f3 14                 mulu8.w	r5, r4
 01                    mov	r4, r5
 10                    add	r4, r4
 f9 84                 and	r4, r1
 13                    add	r4, r7
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 f9 80                 and	r4, r0
 f0 3c 14              stsp16	[sp+0x14], r4
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 28                 ldsp16	r4, [sp+0xa]
 f3 18                 mulu8.w	r6, r4
 f0 3e 20              stsp16	[sp+0x20], r6
 02                    mov	r4, r6
 fa 77                 lsr16i	r4, 0x7
 f9 84                 and	r4, r1
 f0 36 14              ldsp16	r6, [sp+0x14]
 12                    add	r4, r6
 f0 3c 22              stsp16	[sp+0x22], r4
 fa 87                 lsr16i	r5, 0x7
 f9 a4                 and	r5, r1
 f4 0a                 ldsp16	r6, [sp+0x2]
 02                    mov	r4, r6
 f6 30                 mul8	r4, r4
 11                    add	r4, r5
 f4 68                 stsp16	[sp+0xa], r4
 f3 1a                 mulu8.w	r6, r6
 02                    mov	r4, r6
 f9 88                 and	r4, r2
 f4 48                 stsp16	[sp+0x2], r4
 f0 34 20              ldsp16	r4, [sp+0x20]
 10                    add	r4, r4
 f9 84                 and	r4, r1
 08                    mov	r6, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f3 10                 mulu8.w	r4, r4
 04                    mov	r5, r4
 f9 a0                 and	r5, r0
 f0 3d 14              stsp16	[sp+0x14], r5
 fa 78                 lsr16i	r4, 0x8
 12                    add	r4, r6
 f4 58                 stsp16	[sp+0x6], r4
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f0 34 22              ldsp16	r4, [sp+0x22]
 14                    add	r5, r4
 f4 32                 ldsp16	r6, [sp+0xc]
 1a                    add	r6, r6
 f9 c4                 and	r6, r1
 19                    add	r6, r5
 f4 72                 stsp16	[sp+0xc], r6
 fa 98                 lsr16i	r6, 0x8
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 18                    add	r6, r4
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 28                 ldsp16	r4, [sp+0xa]
 14                    add	r5, r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 c7 00 07              ldi16	r7, 0x700
 8d                    and	r7, r5
 f4 08                 ldsp16	r4, [sp+0x2]
 1c                    add	r7, r4
 f4 4b                 stsp16	[sp+0x2], r7
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f1 77                 zext8	r7
 f4 39                 ldsp16	r5, [sp+0xe]
 9d                    or	r7, r5
 1f                    add	r7, r7
 1f                    add	r7, r7
 03                    mov	r4, r7
 f0 35 12              ldsp16	r5, [sp+0x12]
 fa 48                 lsl16i	r5, 0x8
 f4 03                 ldsp16	r7, [sp+0x0]
 f1 77                 zext8	r7
 9d                    or	r7, r5
 fa 8e                 lsr16i	r5, 0xe
 94                    or	r5, r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 34 18              ldsp16	r4, [sp+0x18]
 fa 38                 lsl16i	r4, 0x8
 1f                    add	r7, r7
 1f                    add	r7, r7
 f0 3c 18              stsp16	[sp+0x18], r4
 fa 7e                 lsr16i	r4, 0xe
 93                    or	r4, r7
 f4 68                 stsp16	[sp+0xa], r4
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 f1 75                 zext8	r5
 f4 08                 ldsp16	r4, [sp+0x2]
 94                    or	r5, r4
 15                    add	r5, r5
 15                    add	r5, r5
 01                    mov	r4, r5
 fa 58                 lsl16i	r6, 0x8
 f4 31                 ldsp16	r5, [sp+0xc]
 f1 75                 zext8	r5
 96                    or	r5, r6
 fa 9e                 lsr16i	r6, 0xe
 98                    or	r6, r4
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 fa 58                 lsl16i	r6, 0x8
 15                    add	r5, r5
 15                    add	r5, r5
 f0 34 14              ldsp16	r4, [sp+0x14]
 92                    or	r4, r6
 fa 9e                 lsr16i	r6, 0xe
 99                    or	r6, r5
 f4 5a                 stsp16	[sp+0x6], r6
 10                    add	r4, r4
 10                    add	r4, r4
 f0 3c 14              stsp16	[sp+0x14], r4
 f4 3a                 ldsp16	r6, [sp+0xe]
 fa 9e                 lsr16i	r6, 0xe
 f4 08                 ldsp16	r4, [sp+0x2]
 fa 7e                 lsr16i	r4, 0xe
 f4 48                 stsp16	[sp+0x2], r4
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 cf 08                 cmpi.s8	r7, 0x8
 1f                    add	r7, r7
 d2 0c                 brult8	0xc <L0>
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 cb f0                 addi.s8	r7, -0x10
 f4 28                 ldsp16	r4, [sp+0xa]
 f0 3c 18              stsp16	[sp+0x18], r4
 d4 18                 jmp8	0x18 <L1>
<L0>:
 f0 34 24              ldsp16	r4, [sp+0x24]
 f9 80                 and	r4, r0
 f0 35 18              ldsp16	r5, [sp+0x18]
 94                    or	r5, r4
 15                    add	r5, r5
 15                    add	r5, r5
 f0 3d 18              stsp16	[sp+0x18], r5
 f4 42                 stsp16	[sp+0x0], r6
 f0 36 12              ldsp16	r6, [sp+0x12]
 f4 28                 ldsp16	r4, [sp+0xa]
 f0 3c 12              stsp16	[sp+0x12], r4
<L1>:
 c5 ff ff              ldi16	r5, 0xffff
 f0 3f 1e              stsp16	[sp+0x1e], r7
 a7                    xor	r5, r7
 c0 0f                 ldi8	r4, 0xf
 81                    and	r4, r5
 f4 70                 stsp16	[sp+0xc], r4
 06                    mov	r5, r6
 f4 79                 stsp16	[sp+0xe], r5
 15                    add	r5, r5
 fa 04                 shl16v	r5, r4
 c2 0e                 ldi8	r6, 0xe
 8b                    and	r6, r7
 f4 6a                 stsp16	[sp+0xa], r6
 f0 34 12              ldsp16	r4, [sp+0x12]
 0c                    mov	r7, r4
 fa 1e                 lsr16v	r7, r6
 9d                    or	r7, r5
 f4 39                 ldsp16	r5, [sp+0xe]
 fa 16                 lsr16v	r5, r6
 f4 79                 stsp16	[sp+0xe], r5
 f4 01                 ldsp16	r5, [sp+0x0]
 15                    add	r5, r5
 f4 32                 ldsp16	r6, [sp+0xc]
 fa 06                 shl16v	r5, r6
 f4 3a                 ldsp16	r6, [sp+0xe]
 96                    or	r5, r6
 f1 17                 mov	r2, r7
 f2 4b                 sub	r3, r3
 f4 1a                 ldsp16	r6, [sp+0x6]
 f1 06                 mov	r0, r6
 f2 39                 sub	r1, r1
 f7 61                 add32	q0, q1
 f0 36 18              ldsp16	r6, [sp+0x18]
 f4 2b                 ldsp16	r7, [sp+0xa]
 fa 1b                 lsr16v	r6, r7
 10                    add	r4, r4
 f4 33                 ldsp16	r7, [sp+0xc]
 fa 03                 shl16v	r4, r7
 92                    or	r4, r6
 f0 36 14              ldsp16	r6, [sp+0x14]
 18                    add	r6, r4
 f0 3e 14              stsp16	[sp+0x14], r6
 38                    cmp	r6, r4
 f8 14                 cset.ult	r4
 08                    mov	r6, r4
 af                    xor	r7, r7
 f7 6c                 add32	q3, q0
 f1 15                 mov	r2, r5
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f7 61                 add32	q0, q1
 f4 01                 ldsp16	r5, [sp+0x0]
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 fa 14                 lsr16v	r5, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 14                    add	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 03                    mov	r4, r7
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f1 05                 mov	r0, r5
 f4 01                 ldsp16	r5, [sp+0x0]
 f2 05                 add	r0, r5
 f0 0c 03              cmpi.s8	r0, 0x3
 d1 07                 brne8	0x7 <L3>
 cc ff                 cmpi.s8	r4, -0x1
 d0 0f                 breq8	0xf <L5>
<L2>:
 a0                    xor	r4, r4
 d4 05                 jmp8	0x5 <L4>
<L3>:
 f0 0c 04              cmpi.s8	r0, 0x4
 f8 1c                 cset.uge	r4
<L4>:
 d6 26                 adjsp	0x26
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L5>:
 c4 00 fc              ldi16	r4, 0xfc00
 38                    cmp	r6, r4
 d1 09                 brne8	0x9 <L6>
 f0 34 14              ldsp16	r4, [sp+0x14]
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 d4 ea                 jmp8	-0x16 <L4>
<L6>:
 32                    cmp	r4, r6
 f8 14                 cset.ult	r4
 d4 e5                 jmp8	-0x1b <L4>

<atanhf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 f2 6a                 mov32	q3, q0
 ff 0b                 fabs	q3
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 f0 69 8c              cmp32	q2, q3
 d2 25                 brult8	0x25 <L0>
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 ff 15 05 3a 6b 32 3e 3a 32 07 3e 0e 60 4d 3e 16 aa aa 3e 00 00 80 3f  fpoly	5, 0.174237162, 0.132027537, 0.200561732, 0.333328903, 1.0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 d4 38                 jmp8	0x38 <L2>
<L0>:
 c0 01                 ldi8	r4, 0x1
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 c8              cmp32	q3, q2
 d2 08                 brult8	0x8 <L1>
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 d4 26                 jmp8	0x26 <L2>
<L1>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f0 69 c8              cmp32	q3, q2
 d8 22                 bruge8	0x22 <L3>
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 00                 fadd
 f2 6b                 mov32	q3, q1
 ff 03                 fdiv
 e1 eb f7              call16	log1pf
 f0 04 00 80           ldi16	r0, 0x8000
 f9 04                 and	r0, r1
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 02                 fmul
 f9 a1                 or	r5, r0
<L2>:
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L3>:
 f0 00 21              ldi8	r0, 0x21
 f0 02 22              ldi8	r2, 0x22
 f0 69 c8              cmp32	q3, q2
 fb 02                 cmov.eq	r0, r2
 f0 58 10 01           stm16	[0x110], r0
 f0 69 c8              cmp32	q3, q2
 d1 13                 brne8	0x13 <L4>
 c4 00 80              ldi16	r4, 0x8000
 f9 84                 and	r4, r1
 a5                    xor	r5, r5
 c6 80 7f              ldi16	r6, 0x7f80
 c7 80 ff              ldi16	r7, 0xff80
 31                    cmp	r4, r5
 fb 77                 cmov.ne	r6, r7
 06                    mov	r5, r6
 a0                    xor	r4, r4
 d4 d4                 jmp8	-0x2c <L2>
<L4>:
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 d4 ce                 jmp8	-0x32 <L2>

<__avm_umulhisi3>:
 d6 fa                 adjsp	-0x6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f4 52                 stsp16	[sp+0x4], r6
 f1 75                 zext8	r5
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 f3 19                 mulu8.w	r6, r5
 f4 4a                 stsp16	[sp+0x2], r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f3 1b                 mulu8.w	r6, r7
 f4 42                 stsp16	[sp+0x0], r6
 fa 78                 lsr16i	r4, 0x8
 f4 13                 ldsp16	r7, [sp+0x4]
 08                    mov	r6, r4
 f3 1b                 mulu8.w	r6, r7
 f3 11                 mulu8.w	r4, r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 16                    add	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 fa 38                 lsl16i	r4, 0x8
 f4 09                 ldsp16	r5, [sp+0x2]
 14                    add	r5, r4
 34                    cmp	r5, r4
 f8 14                 cset.ult	r4
 13                    add	r4, r7
 fa 58                 lsl16i	r6, 0x8
 19                    add	r6, r5
 39                    cmp	r6, r5
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 02                    mov	r4, r6
 d6 06                 adjsp	0x6
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
 06                    mov	r5, r6
 fa 8f                 lsr16i	r5, 0xf
 17                    add	r5, r7
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
 f4 43                 stsp16	[sp+0x0], r7
 f4 13                 ldsp16	r7, [sp+0x4]
 f3 3d                 mulsu8.w	r7, r5
 f4 5b                 stsp16	[sp+0x6], r7
 fa 78                 lsr16i	r4, 0x8
 0c                    mov	r7, r4
 f4 11                 ldsp16	r5, [sp+0x4]
 f3 2d                 muls8.w	r7, r5
 f3 32                 mulsu8.w	r4, r6
 04                    mov	r5, r4
 fa c8                 asr16i	r5, 0x8
 17                    add	r5, r7
 f4 1a                 ldsp16	r6, [sp+0x6]
 fa d8                 asr16i	r6, 0x8
 19                    add	r6, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 19                    add	r6, r5
 fa 38                 lsl16i	r4, 0x8
 f4 03                 ldsp16	r7, [sp+0x0]
 1c                    add	r7, r4
 3c                    cmp	r7, r4
 f8 14                 cset.ult	r4
 12                    add	r4, r6
 f4 09                 ldsp16	r5, [sp+0x2]
 11                    add	r4, r5
 f4 19                 ldsp16	r5, [sp+0x6]
 fa 48                 lsl16i	r5, 0x8
 1d                    add	r7, r5
 3d                    cmp	r7, r5
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 03                    mov	r4, r7
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
