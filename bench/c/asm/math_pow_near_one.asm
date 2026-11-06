
math_pow_near_one.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f0 04 f0 ff           ldi16	r0, 0xfff0
 f0 05 04 01           ldi16	r1, 0x104
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
<L0>:
 f1 20                 mov	r4, r0
 ff 0c                 s16tof
 aa                    xor	r6, r6
 c7 00 34              ldi16	r7, 0x3400
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f1 29                 mov	r6, r1
 ca fc                 addi.s8	r6, -0x4
 f0 6b 8c              st32	[r6], q2
 f1 20                 mov	r4, r0
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 c5 80 cb              ldi16	r5, 0xcb80
 c6 80 4b              ldi16	r6, 0x4b80
 f4 a4                 tst8	r4
 fb 2e                 cmov.eq	r5, r6
 a0                    xor	r4, r4
 f0 6b 82              st32	[r1], q2
 f0 09 08              addi.s8	r1, 0x8
 f4 a8                 inc16	r0
 f0 0c 10              cmpi.s8	r0, 0x10
 d1 ce                 brne8	-0x32 <L0>
 f2 42                 sub	r2, r2
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 d7 01                 sys	debug_break
 f0 07 04 01           ldi16	r3, 0x104
<L1>:
 f1 22                 mov	r4, r2
 c5 00 01              ldi16	r5, 0x100
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 f1 2a                 mov	r6, r2
 f2 2b                 add	r6, r3
 f0 6a cc              ld32	q3, [r6]
 e1 d0 0a              call16	powf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f0 0a 08              addi.s8	r2, 0x8
 c4 00 01              ldi16	r4, 0x100
 f5 14                 cmp	r2, r4
 d1 db                 brne8	-0x25 <L1>
 c4 00 02              ldi16	r4, 0x200
 f0 6b 08              st32	[r4], q0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<memset>:
 0c                    mov	r7, r4
 d7 11                 sys	memset
 03                    mov	r4, r7
 ef                    ret

<powf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 dc                 adjsp	-0x24
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 62                 mov32	q0, q2
 ff 08                 fabs	q0
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 c4              cmp32	q3, q1
 d0 56                 breq8	0x56 <L1>
 03                    mov	r4, r7
 f0 07 7f 7f           ldi16	r3, 0x7f7f
 f5 19                 cmp	r3, r1
 c5 80 7f              ldi16	r5, 0x7f80
 dc b4 04              brult16	0x4b4 <L33>
 31                    cmp	r4, r5
 dd b0 04              bruge16	0x4b0 <L33>
<L0>:
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 7f 3f           ldi16	r3, 0x3f7f
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 69 4c              cmp32	q1, q3
 d3 57                 brslt8	0x57 <L2>
 f2 42                 sub	r2, r2
 f0 07 80 bf           ldi16	r3, 0xbf80
 f0 69 c4              cmp32	q3, q1
 da 99 00              breq16	0x99 <L4>
 f2 42                 sub	r2, r2
 f0 07 00 3f           ldi16	r3, 0x3f00
 f0 69 c4              cmp32	q3, q1
 d1 6e                 brne8	0x6e <L3>
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 8c              cmp32	q2, q3
 de f5 00              brslt16	0xf5 <L7>
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 16                 fsqrt
 e0 0d 05              jmp16	1293 <L39>
<L1>:
 f0 02 01              ldi8	r2, 0x1
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 04              cmp32	q0, q1
 dc fc 04              brult16	0x4fc <L38>
 f2 30                 sub	r0, r0
 f0 01 40              ldi8	r1, 0x40
 f4 09                 ldsp16	r5, [sp+0x2]
 f9 34                 and	r1, r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 db eb 04              brne16	0x4eb <L38>
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 00                 fadd
 e0 e2 04              jmp16	1250 <L39>
<L2>:
 f2 42                 sub	r2, r2
 f0 07 00 40           ldi16	r3, 0x4000
 f0 69 c4              cmp32	q3, q1
 d0 79                 breq8	0x79 <L5>
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 f0 69 c4              cmp32	q3, q1
 d1 18                 brne8	0x18 <L3>
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f7 6c                 add32	q3, q0
 f0 04 fe ff           ldi16	r0, 0xfffe
 f0 01 7f              ldi8	r1, 0x7f
 f0 69 0c              cmp32	q0, q3
 dd 8d 00              bruge16	0x8d <L6>
 e0 b8 04              jmp16	1208 <L40>
<L3>:
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 48              cmp32	q1, q2
 de 97 00              brslt16	0x97 <L9>
 f4 09                 ldsp16	r5, [sp+0x2]
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 d4 78                 jmp8	0x78 <L8>
<L4>:
 f1 15                 mov	r2, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 da 95 04              breq16	0x495 <L41>
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 ff 03                 fdiv
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c6 ff ff              ldi16	r6, 0xffff
 c7 7f 7f              ldi16	r7, 0x7f7f
 f0 69 c0              cmp32	q3, q0
 dc 74 04              brult16	0x474 <L40>
 f4 09                 ldsp16	r5, [sp+0x2]
 09                    mov	r6, r5
 f9 c8                 and	r6, r2
 c7 80 80              ldi16	r7, 0x8080
 1e                    add	r7, r6
 c6 ff 80              ldi16	r6, 0x80ff
 3b                    cmp	r6, r7
 d8 37                 bruge8	0x37 <L6>
 e0 62 04              jmp16	1122 <L40>
<L5>:
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f7 64                 add32	q1, q0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c6 fe ff              ldi16	r6, 0xfffe
 c7 7f 7f              ldi16	r7, 0x7f7f
 f0 69 c4              cmp32	q3, q1
 dc 40 04              brult16	0x440 <L40>
 f4 09                 ldsp16	r5, [sp+0x2]
 09                    mov	r6, r5
 c7 80 7f              ldi16	r7, 0x7f80
 8b                    and	r6, r7
 c7 80 80              ldi16	r7, 0x8080
 1e                    add	r7, r6
 c6 ff 80              ldi16	r6, 0x80ff
 3b                    cmp	r6, r7
 dc 2e 04              brult16	0x42e <L40>
<L6>:
 c2 22                 ldi8	r6, 0x22
 f0 5e 04 02           stm16	[0x204], r6
 e0 25 04              jmp16	1061 <L40>
<L7>:
 c2 01                 ldi8	r6, 0x1
 f0 3e 10              stsp16	[sp+0x10], r6
<L8>:
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 7f 4b           ldi16	r3, 0x4b7f
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 69 4c              cmp32	q1, q3
 d8 66                 bruge8	0x66 <L14>
<L9>:
 c2 01                 ldi8	r6, 0x1
 f4 62                 stsp16	[sp+0x8], r6
 a0                    xor	r4, r4
<L10>:
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 0c              cmp32	q0, q3
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 d0 13                 breq8	0x13 <L11>
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 d1 2c                 brne8	0x2c <L13>
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 84              cmp32	q2, q1
 df 05 04              brsge16	0x405 <L43>
<L11>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6a                 mov32	q3, q0
 ff 03                 fdiv
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 fd 04                 cmov.slt	r0, r4
 fd 0d                 cmov.slt	r1, r5
<L12>:
 f2 68                 mov32	q2, q0
 ff 06                 fneg	q2
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 a6                 tst8	r6
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 e0 c4 03              jmp16	964 <L39>
<L13>:
 f4 a4                 tst8	r4
 db e9 03              brne16	0x3e9 <L44>
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f0 69 08              cmp32	q0, q2
 d1 5e                 brne8	0x5e <L15>
 c4 80 bf              ldi16	r4, 0xbf80
 c5 80 3f              ldi16	r5, 0x3f80
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 a6                 tst8	r6
 fb 65                 cmov.ne	r4, r5
 04                    mov	r5, r4
 a0                    xor	r4, r4
 e0 a5 03              jmp16	933 <L39>
<L14>:
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 f0 69 c4              cmp32	q3, q1
 dc 91 00              brult16	0x91 <L16>
 f4 20                 ldsp16	r4, [sp+0x8]
 fa 77                 lsr16i	r4, 0x7
 c1 86                 ldi8	r5, 0x86
 34                    cmp	r5, r4
 dc b1 00              brult16	0xb1 <L18>
 0c                    mov	r7, r4
 c0 01                 ldi8	r4, 0x1
 f2 4b                 sub	r3, r3
 f6 2e                 tst16	r6
 db ce 02              brne16	0x2ce <L31>
 27                    sub	r5, r7
 f0 02 7f              ldi8	r2, 0x7f
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 20                 ldsp16	r4, [sp+0x8]
 07                    mov	r5, r7
 f9 50                 and	r2, r4
 02                    mov	r4, r6
 c3 80                 ldi8	r7, 0x80
 f9 e9                 or	r7, r2
 c6 ff ff              ldi16	r6, 0xffff
 f4 61                 stsp16	[sp+0x8], r5
 fa 09                 shl16v	r6, r5
 c5 ff ff              ldi16	r5, 0xffff
 a9                    xor	r6, r5
 8b                    and	r6, r7
 f4 a6                 tst8	r6
 db ad 02              brne16	0x2ad <L31>
 f4 20                 ldsp16	r4, [sp+0x8]
 fa 1c                 lsr16v	r7, r4
 f0 03 01              ldi8	r3, 0x1
 f9 7c                 and	r3, r7
 e0 a0 02              jmp16	672 <L30>
<L15>:
 a0                    xor	r4, r4
 c5 90 c0              ldi16	r5, 0xc090
 f7 68                 add32	q2, q0
 aa                    xor	r6, r6
 c3 20                 ldi8	r7, 0x20
 f0 69 c8              cmp32	q3, q2
 d2 49                 brult8	0x49 <L17>
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 15 07 25 49 12 3e ab aa 2a be cd cc 4c 3e 00 00 80 be ab aa aa 3e 00 00 00 bf 00 00 80 3f  fpoly	7, 0.142857149, -0.166666672, 0.200000003, -0.25, 0.333333343, -0.5, 1.0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 c6 3b aa              ldi16	r6, 0xaa3b
 c7 b8 3f              ldi16	r7, 0x3fb8
 e0 0c 01              jmp16	268 <L23>
<L16>:
 c0 01                 ldi8	r4, 0x1
 f4 60                 stsp16	[sp+0x8], r4
 e0 fb fe              jmp16	-261 <L10>
<L17>:
 c6 ff ff              ldi16	r6, 0xffff
 c3 7f                 ldi8	r7, 0x7f
 f0 69 c0              cmp32	q3, q0
 d2 36                 brult8	0x36 <L19>
 aa                    xor	r6, r6
 c7 00 4c              ldi16	r7, 0x4c00
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 c6 ff ff              ldi16	r6, 0xffff
 c3 7f                 ldi8	r7, 0x7f
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c4 68 ff              ldi16	r4, 0xff68
 f0 3c 10              stsp16	[sp+0x10], r4
 d4 29                 jmp8	0x29 <L20>
<L18>:
 c1 96                 ldi8	r5, 0x96
 24                    sub	r5, r4
 f4 61                 stsp16	[sp+0x8], r5
 02                    mov	r4, r6
 f4 21                 ldsp16	r5, [sp+0x8]
 c6 ff ff              ldi16	r6, 0xffff
 0e                    mov	r7, r6
 fa 0d                 shl16v	r7, r5
 ae                    xor	r7, r6
 08                    mov	r6, r4
 8c                    and	r7, r4
 f6 2f                 tst16	r7
 da 09 02              breq16	0x209 <L29>
 c0 01                 ldi8	r4, 0x1
 f2 4b                 sub	r3, r3
 e0 0a 02              jmp16	522 <L31>
<L19>:
 c4 81 ff              ldi16	r4, 0xff81
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
<L20>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 88                    and	r6, r4
 8d                    and	r7, r5
 c4 20 fb              ldi16	r4, 0xfb20
 c1 4a                 ldi8	r5, 0x4a
 f7 6b                 add32	q2, q3
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 c0 80                 ldi8	r4, 0x80
 f0 32 14              ldsp16	r2, [sp+0x14]
 f1 1d                 mov	r3, r5
 f9 8c                 and	r4, r3
 9c                    or	r7, r4
 02                    mov	r4, r6
 07                    mov	r5, r7
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 c7 80 bf              ldi16	r7, 0xbf80
 ff 00                 fadd
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f4 09                 ldsp16	r5, [sp+0x2]
 09                    mov	r6, r5
 fa 97                 lsr16i	r6, 0x7
 f0 34 10              ldsp16	r4, [sp+0x10]
 18                    add	r6, r4
 f2 69                 mov32	q2, q1
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 12                    add	r4, r6
 ff 0c                 s16tof
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c0 01                 ldi8	r4, 0x1
 c5 00 41              ldi16	r5, 0x4100
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 69 c8              cmp32	q3, q2
 d2 2d                 brult8	0x2d <L21>
 f0 32 18              ldsp16	r2, [sp+0x18]
 f0 33 1a              ldsp16	r3, [sp+0x1a]
 f2 69                 mov32	q2, q1
 ff 15 08 23 54 19 be 0a 5e 71 3e 47 48 7e be 78 e0 92 3e 74 74 b8 be 9c 3c f6 3e 8e aa 38 bf 3a aa b8 3f      fpoly	8, -0.149735019, 0.235710293, -0.248322591, 0.286868811, -0.360263467, 0.480931163, -0.721352458, 1.4426949
 d4 27                 jmp8	0x27 <L22>
<L21>:
 f0 32 18              ldsp16	r2, [sp+0x18]
 f0 33 1a              ldsp16	r3, [sp+0x1a]
 f2 69                 mov32	q2, q1
 ff 15 07 a7 65 34 3e a3 bd 8a be 49 17 97 3e 10 e7 b7 be 96 17 f6 3e 8e ab 38 bf 46 aa b8 3f  fpoly	7, 0.176169023, -0.270978063, 0.295099527, -0.359184742, 0.480648696, -0.721367717, 1.44269633
<L22>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
<L23>:
 ff 02                 fmul
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 c4 00 04              ldi16	r4, 0x400
 c5 00 bd              ldi16	r5, 0xbd00
 f7 69                 add32	q2, q1
 c6 01 06              ldi16	r6, 0x601
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d2 70                 brult8	0x70 <L25>
 c4 00 02              ldi16	r4, 0x200
 c5 ea bc              ldi16	r5, 0xbcea
 f7 66                 add32	q1, q2
 c4 00 04              ldi16	r4, 0x400
 a5                    xor	r5, r5
 f0 69 84              cmp32	q2, q1
 d8 5f                 bruge8	0x5f <L25>
<L24>:
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f1 21                 mov	r4, r1
 c5 00 43              ldi16	r5, 0x4300
 31                    cmp	r4, r5
 df f4 01              brsge16	0x1f4 <L45>
 c5 16 c3              ldi16	r5, 0xc316
 31                    cmp	r4, r5
 dd fc 01              bruge16	0x1fc <L46>
 c4 00 80              ldi16	r4, 0x8000
 f9 84                 and	r4, r1
 a5                    xor	r5, r5
 c6 00 3f              ldi16	r6, 0x3f00
 c7 00 bf              ldi16	r7, 0xbf00
 31                    cmp	r4, r5
 fb 77                 cmov.ne	r6, r7
 0e                    mov	r7, r6
 aa                    xor	r6, r6
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 ff 0e                 ftos16
 f4 50                 stsp16	[sp+0x4], r4
 ff 0c                 s16tof
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 01                 fsub
 f4 13                 ldsp16	r7, [sp+0x4]
 ff 15 05 66 01 1d 3c 23 fe 64 3d bc 01 76 3e 96 70 31 3f 00 00 80 3f  fpoly	5, 0.00958285294, 0.0559064262, 0.240240991, 0.693124175, 1.0
 cf 83                 cmpi.s8	r7, -0x7d
 d3 60                 brslt8	0x60 <L26>
 fa 67                 lsl16i	r7, 0x7
 f1 0f                 mov	r1, r7
 f2 30                 sub	r0, r0
 f7 62                 add32	q0, q2
 e0 96 fd              jmp16	-618 <L12>
<L25>:
 d6 f8                 adjsp	-0x8
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f0 14 24              leasp	r4, 0x24
 f2 6a                 mov32	q3, q0
 e1 b1 01              call16	avm_pow_boundary
 d6 08                 adjsp	0x8
 aa                    xor	r6, r6
 c7 00 43              ldi16	r7, 0x4300
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 ff 14                 fcmp
 f6 2e                 tst16	r6
 d1 5b                 brne8	0x5b <L28>
 c6 3b aa              ldi16	r6, 0xaa3b
 c7 38 b3              ldi16	r7, 0xb338
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 ff 14                 fcmp
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 7f 7f           ldi16	r1, 0x7f7f
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 ce 02                 cmpi.s8	r6, 0x2
 fc 04                 cmov.ult	r0, r4
 fc 0d                 cmov.ult	r1, r5
 c4 ff 7f              ldi16	r4, 0x7fff
 f9 84                 and	r4, r1
 31                    cmp	r4, r5
 db 43 fd              brne16	-0x2bd <L12>
 d4 27                 jmp8	0x27 <L27>
<L26>:
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
 f2 62                 mov32	q0, q2
 f1 21                 mov	r4, r1
 c5 80 7f              ldi16	r5, 0x7f80
 81                    and	r4, r5
 c5 80 80              ldi16	r5, 0x8080
 14                    add	r5, r4
 c4 ff 80              ldi16	r4, 0x80ff
 31                    cmp	r4, r5
 dc 1a fd              brult16	-0x2e6 <L12>
<L27>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 04 02           stm16	[0x204], r4
 e0 11 fd              jmp16	-751 <L12>
<L28>:
 aa                    xor	r6, r6
 c7 16 c3              ldi16	r7, 0xc316
 ff 14                 fcmp
 f6 2e                 tst16	r6
 d1 31                 brne8	0x31 <L32>
 c0 22                 ldi8	r4, 0x22
 f0 5c 04 02           stm16	[0x204], r4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 f8 04                 cset.eq	r4
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 e0 ec fc              jmp16	-788 <L12>
<L29>:
 fa 19                 lsr16v	r6, r5
 f0 03 01              ldi8	r3, 0x1
 f9 78                 and	r3, r6
<L30>:
 a0                    xor	r4, r4
<L31>:
 f0 36 10              ldsp16	r6, [sp+0x10]
 f9 78                 and	r3, r6
 f4 a3                 tst8	r3
 f8 06                 cset.eq	r6
 f4 62                 stsp16	[sp+0x8], r6
 e0 a3 fc              jmp16	-861 <L10>
<L32>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 e0 da fe              jmp16	-294 <L24>
<L33>:
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 4c              cmp32	q1, q3
 f8 15                 cset.ult	r5
 f4 71                 stsp16	[sp+0xc], r5
 f0 69 40              cmp32	q1, q0
 d2 54                 brult8	0x54 <L36>
 f0 02 01              ldi8	r2, 0x1
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 c4              cmp32	q3, q1
 d8 48                 bruge8	0x48 <L36>
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 c4              cmp32	q3, q1
 c5 80 7f              ldi16	r5, 0x7f80
 db 23 fb              brne16	-0x4dd <L0>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 d1 0c                 brne8	0xc <L34>
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 8c              cmp32	q2, q3
 df b5 00              brsge16	0xb5 <L47>
<L34>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 69 08              cmp32	q0, q2
 d0 55                 breq8	0x55 <L40>
<L35>:
 03                    mov	r4, r7
 fa 7f                 lsr16i	r4, 0xf
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f0 69 c0              cmp32	q3, q0
 f8 15                 cset.ult	r5
 34                    cmp	r5, r4
 d0 5f                 breq8	0x5f <L42>
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 d4 3c                 jmp8	0x3c <L39>
<L36>:
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 80              cmp32	q2, q0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 d1 1d                 brne8	0x1d <L37>
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f9 42                 xor	r2, r0
 f0 01 40              ldi8	r1, 0x40
 f9 3c                 and	r1, r7
 f1 21                 mov	r4, r1
 fa 76                 lsr16i	r4, 0x6
 f9 89                 or	r4, r2
 f0 00 01              ldi8	r0, 0x1
 f9 10                 and	r0, r4
 f4 a0                 tst8	r0
 d1 08                 brne8	0x8 <L38>
<L37>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 00                 fadd
 d4 04                 jmp8	0x4 <L39>
<L38>:
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
<L39>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
<L40>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 d6 24                 adjsp	0x24
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L41>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 04 02           stm16	[0x204], r4
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 ff 03                 fdiv
 d4 e3                 jmp8	-0x1d <L39>
<L42>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d4 df                 jmp8	-0x21 <L39>
<L43>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 04 02           stm16	[0x204], r4
 e0 f2 fb              jmp16	-1038 <L11>
<L44>:
 c2 21                 ldi8	r6, 0x21
 f0 5e 04 02           stm16	[0x204], r6
 c6 c0 7f              ldi16	r6, 0x7fc0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 99                    or	r6, r5
 06                    mov	r5, r6
 d4 c5                 jmp8	-0x3b <L39>
<L45>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 04 02           stm16	[0x204], r4
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 e0 e3 fb              jmp16	-1053 <L12>
<L46>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 04 02           stm16	[0x204], r4
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 e0 d6 fb              jmp16	-1066 <L12>
<L47>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 04 02           stm16	[0x204], r4
 e0 4f ff              jmp16	-177 <L35>

<avm_pow_boundary>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 be                 adjsp	-0x42
 f0 3c 3c              stsp16	[sp+0x3c], r4
 f0 34 51              ldsp16	r4, [sp+0x51]
 f0 35 53              ldsp16	r5, [sp+0x53]
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 7f              ldi8	r3, 0x7f
 f0 30 4d              ldsp16	r0, [sp+0x4d]
 f0 31 4f              ldsp16	r1, [sp+0x4f]
 f2 68                 mov32	q2, q0
 f9 88                 and	r4, r2
 f9 ac                 and	r5, r3
 f2 42                 sub	r2, r2
 f0 03 80              ldi8	r3, 0x80
 f0 69 04              cmp32	q0, q1
 dc df 00              brult16	0xdf <L0>
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 db d5 00              brne16	0xd5 <L0>
 f1 21                 mov	r4, r1
 fa 77                 lsr16i	r4, 0x7
 c8 81                 addi.s8	r4, -0x7f
 ff 0c                 s16tof
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c7 00 80              ldi16	r7, 0x8000
 f1 05                 mov	r0, r5
 f9 1c                 and	r0, r7
 aa                    xor	r6, r6
 f5 06                 cmp	r0, r6
 fb 77                 cmov.ne	r6, r7
 f4 62                 stsp16	[sp+0x8], r6
 f0 06 00 f0           ldi16	r2, 0xf000
 f0 07 ff ff           ldi16	r3, 0xffff
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f9 c8                 and	r6, r2
 f9 ec                 and	r7, r3
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f0 30 28              ldsp16	r0, [sp+0x28]
 f0 31 2a              ldsp16	r1, [sp+0x2a]
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 68                 mov32	q2, q0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 01                 fsub
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 69                 mov32	q2, q1
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 f2 64                 mov32	q1, q0
 f0 3a 14              stsp16	[sp+0x14], r2
 f0 3b 16              stsp16	[sp+0x16], r3
 ff 01                 fsub
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 36 28              ldsp16	r6, [sp+0x28]
 f0 37 2a              ldsp16	r7, [sp+0x2a]
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 0c                    mov	r7, r4
 aa                    xor	r6, r6
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 00                 fadd
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f0 32 3c              ldsp16	r2, [sp+0x3c]
 f0 6b 84              st32	[r2], q2
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 e0 35 08              jmp16	2101 <L3>
<L0>:
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 7f              ldi8	r3, 0x7f
 f0 69 40              cmp32	q1, q0
 d2 1d                 brult8	0x1d <L1>
 f2 30                 sub	r0, r0
 f0 05 00 4c           ldi16	r1, 0x4c00
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 c6 68 ff              ldi16	r6, 0xff68
 f0 3e 10              stsp16	[sp+0x10], r6
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 09                    mov	r6, r5
 fa 97                 lsr16i	r6, 0x7
 f2 69                 mov32	q2, q1
 d4 0b                 jmp8	0xb <L2>
<L1>:
 c6 81 ff              ldi16	r6, 0xff81
 f0 3e 10              stsp16	[sp+0x10], r6
 f1 29                 mov	r6, r1
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
<L2>:
 f0 06 20 fb           ldi16	r2, 0xfb20
 f0 03 4a              ldi8	r3, 0x4a
 f7 66                 add32	q1, q2
 c3 80                 ldi8	r7, 0x80
 f9 ec                 and	r7, r3
 97                    or	r5, r7
 f1 04                 mov	r0, r4
 f1 0d                 mov	r1, r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 12                    add	r4, r6
 f0 3c 10              stsp16	[sp+0x10], r4
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 c5 80 bf              ldi16	r5, 0xbf80
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 68                 mov32	q2, q0
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 00                 fadd
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 ff 01                 fsub
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 01                 fsub
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 68                 mov32	q2, q0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 00                 fadd
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f1 23                 mov	r4, r3
 fa 77                 lsr16i	r4, 0x7
 f0 35 10              ldsp16	r5, [sp+0x10]
 11                    add	r4, r5
 f0 3c 38              stsp16	[sp+0x38], r4
 f0 3d 3a              stsp16	[sp+0x3a], r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f0 06 00 f0           ldi16	r2, 0xf000
 f0 07 ff ff           ldi16	r3, 0xffff
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f9 08                 and	r0, r2
 f9 2c                 and	r1, r3
 f0 38 24              stsp16	[sp+0x24], r0
 f0 39 26              stsp16	[sp+0x26], r1
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 ff 03                 fdiv
 f2 62                 mov32	q0, q2
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f9 88                 and	r4, r2
 f9 ac                 and	r5, r3
 f2 66                 mov32	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 f2 6b                 mov32	q3, q1
 f2 61                 mov32	q0, q1
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 ff 02                 fmul
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 37 26              ldsp16	r7, [sp+0x26]
 ff 01                 fsub
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 37 26              ldsp16	r7, [sp+0x26]
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 01                 fsub
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f2 62                 mov32	q0, q2
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f0 38 24              stsp16	[sp+0x24], r0
 f0 39 26              stsp16	[sp+0x26], r1
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f2 68                 mov32	q2, q0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 03                 fdiv
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 c4 cd cc              ldi16	r4, 0xcccd
 c5 4c be              ldi16	r5, 0xbe4c
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 ff 15 06 f1 f0 70 3d 89 88 88 3d d9 89 9d 3d 8c 2e ba 3d 39 8e e3 3d 25 49 12 3e      fpoly	6, 0.0588235296, 0.0666666701, 0.0769230798, 0.0909090936, 0.111111112, 0.142857149
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 c6 cd cc              ldi16	r6, 0xcccd
 c7 4c 3e              ldi16	r7, 0x3e4c
 ff 00                 fadd
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 01                 fsub
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 ff 01                 fsub
 c6 cd cc              ldi16	r6, 0xcccd
 c7 4c 3e              ldi16	r7, 0x3e4c
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 c6 cd cc              ldi16	r6, 0xcccd
 c7 4c b1              ldi16	r7, 0xb14c
 ff 00                 fadd
 f0 3c 30              stsp16	[sp+0x30], r4
 f0 3d 32              stsp16	[sp+0x32], r5
 f0 3a 14              stsp16	[sp+0x14], r2
 f0 3b 16              stsp16	[sp+0x16], r3
 f2 6b                 mov32	q3, q1
 c4 00 f0              ldi16	r4, 0xf000
 c5 ff ff              ldi16	r5, 0xffff
 88                    and	r6, r4
 8d                    and	r7, r5
 f2 69                 mov32	q2, q1
 f2 67                 mov32	q1, q3
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 3b 1e              stsp16	[sp+0x1e], r3
 ff 01                 fsub
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f2 69                 mov32	q2, q1
 ff 01                 fsub
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 3d 2e              stsp16	[sp+0x2e], r5
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f0 3a 3e              stsp16	[sp+0x3e], r2
 f0 3b 40              stsp16	[sp+0x40], r3
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 30 20              ldsp16	r0, [sp+0x20]
 f0 31 22              ldsp16	r1, [sp+0x22]
 f2 68                 mov32	q2, q0
 f0 32 30              ldsp16	r2, [sp+0x30]
 f0 33 32              ldsp16	r3, [sp+0x32]
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 f2 63                 mov32	q0, q3
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 3d 36              stsp16	[sp+0x36], r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 02                 fmul
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 ff 00                 fadd
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 38 24              stsp16	[sp+0x24], r0
 f0 39 26              stsp16	[sp+0x26], r1
 f2 64                 mov32	q1, q0
 c4 00 f0              ldi16	r4, 0xf000
 c5 ff ff              ldi16	r5, 0xffff
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f0 3c 30              stsp16	[sp+0x30], r4
 f0 3d 32              stsp16	[sp+0x32], r5
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 ff 02                 fmul
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 3d 2e              stsp16	[sp+0x2e], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 f2 68                 mov32	q2, q0
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 37 26              ldsp16	r7, [sp+0x26]
 ff 02                 fmul
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 01                 fsub
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 ff 00                 fadd
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 ff 00                 fadd
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f2 68                 mov32	q2, q0
 f0 36 34              ldsp16	r6, [sp+0x34]
 f0 37 36              ldsp16	r7, [sp+0x36]
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 f0 35 40              ldsp16	r5, [sp+0x40]
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 37 26              ldsp16	r7, [sp+0x26]
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 36 30              ldsp16	r6, [sp+0x30]
 f0 37 32              ldsp16	r7, [sp+0x32]
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 01                 fsub
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 f2 69                 mov32	q2, q1
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f0 04 ab aa           ldi16	r0, 0xaaab
 f0 05 aa be           ldi16	r1, 0xbeaa
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 c6 ab aa              ldi16	r6, 0xaaab
 c7 aa 3e              ldi16	r7, 0x3eaa
 ff 00                 fadd
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 01                 fsub
 c6 ab aa              ldi16	r6, 0xaaab
 c7 aa 3e              ldi16	r7, 0x3eaa
 ff 00                 fadd
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 ff 00                 fadd
 c6 ab aa              ldi16	r6, 0xaaab
 c7 2a b2              ldi16	r7, 0xb22a
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 ff 01                 fsub
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 3e 20              stsp16	[sp+0x20], r6
 f0 3f 22              stsp16	[sp+0x22], r7
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 c4 00 f0              ldi16	r4, 0xf000
 c5 ff ff              ldi16	r5, 0xffff
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 c4 00 f0              ldi16	r4, 0xf000
 c5 ff ff              ldi16	r5, 0xffff
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 02                 fmul
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 01                 fsub
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 ff 00                 fadd
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 ff 00                 fadd
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f2 69                 mov32	q2, q1
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 02                 fmul
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 01                 fsub
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 ff 00                 fadd
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 ff 01                 fsub
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 01                 fsub
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f2 64                 mov32	q1, q0
 c4 00 f0              ldi16	r4, 0xf000
 c5 ff ff              ldi16	r5, 0xffff
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 f2 68                 mov32	q2, q0
 c6 3b aa              ldi16	r6, 0xaa3b
 c7 38 40              ldi16	r7, 0x4038
 ff 02                 fmul
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f2 69                 mov32	q2, q1
 c6 00 a0              ldi16	r6, 0xa000
 ff 02                 fmul
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 01                 fsub
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 69                 mov32	q2, q1
 c6 00 b0              ldi16	r6, 0xb000
 c7 23 3a              ldi16	r7, 0x3a23
 ff 02                 fmul
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 00                 fadd
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 c6 00 a0              ldi16	r6, 0xa000
 c7 38 40              ldi16	r7, 0x4038
 ff 02                 fmul
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 00                 fadd
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 69                 mov32	q2, q1
 c6 00 b0              ldi16	r6, 0xb000
 c7 23 3a              ldi16	r7, 0x3a23
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 c6 60 70              ldi16	r6, 0x7060
 c7 25 33              ldi16	r7, 0x3325
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 68                 mov32	q2, q0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 01                 fsub
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 c6 3b aa              ldi16	r6, 0xaa3b
 c7 38 40              ldi16	r7, 0x4038
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 00                 fadd
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 34 38              ldsp16	r4, [sp+0x38]
 ff 0c                 s16tof
 f2 62                 mov32	q0, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 ff 00                 fadd
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 01                 fsub
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 01                 fsub
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 32 28              ldsp16	r2, [sp+0x28]
 f0 33 2a              ldsp16	r3, [sp+0x2a]
 f0 04 00 f0           ldi16	r0, 0xf000
 f0 05 ff ff           ldi16	r1, 0xffff
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 00                 fadd
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 02                 fmul
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 01                 fsub
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 00                 fadd
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 f2 62                 mov32	q0, q2
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 00                 fadd
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f2 69                 mov32	q2, q1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 ff 02                 fmul
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f2 6b                 mov32	q3, q1
 ff 01                 fsub
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 00                 fadd
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f0 32 3c              ldsp16	r2, [sp+0x3c]
 f0 6b 84              st32	[r2], q2
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
<L3>:
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 01                 fsub
 f0 0a 04              addi.s8	r2, 0x4
 f0 6b 84              st32	[r2], q2
 d6 42                 adjsp	0x42
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

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
