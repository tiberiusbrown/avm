
math_trig_probe_inline_cutoff.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ec                 adjsp	-0x14
 aa                    xor	r6, r6
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d7 01                 sys	debug_break
 f2 62                 mov32	q0, q2
 d4 1b                 jmp8	0x1b <L2>
<L0>:
 f2 6b                 mov32	q3, q1
<L1>:
 ff 00                 fadd
 f4 02                 ldsp16	r6, [sp+0x0]
 c3 03                 ldi8	r7, 0x3
 8b                    and	r6, r7
 af                    xor	r7, r7
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f7 63                 add32	q0, q3
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 ae                 inc16	r6
 ce 20                 cmpi.s8	r6, 0x20
 da 7a 01              breq16	0x17a <L11>
<L2>:
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f4 4a                 stsp16	[sp+0x2], r6
 c3 07                 ldi8	r7, 0x7
 8b                    and	r6, r7
 1a                    add	r6, r6
 1a                    add	r6, r6
 c7 00 01              ldi16	r7, 0x100
 1b                    add	r6, r7
 f0 6a 4c              ld32	q1, [r6]
 aa                    xor	r6, r6
 f4 42                 stsp16	[sp+0x0], r6
 f2 61                 mov32	q0, q1
 ff 08                 fabs	q0
 c6 db 0f              ldi16	r6, 0xfdb
 c7 49 3f              ldi16	r7, 0x3f49
 f0 69 0c              cmp32	q0, q3
 d2 bf                 brult8	-0x41 <L0>
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 0c              cmp32	q0, q3
 d2 10                 brult8	0x10 <L3>
 f2 66                 mov32	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 d4 a2                 jmp8	-0x5e <L1>
<L3>:
 c6 e3 cb              ldi16	r6, 0xcbe3
 c7 16 40              ldi16	r7, 0x4016
 f0 69 c0              cmp32	q3, q0
 d2 4d                 brult8	0x4d <L4>
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f2 68                 mov32	q2, q0
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 00                 fadd
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 04                 fneg	q0
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 69 4c              cmp32	q1, q3
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 fd 02                 cmov.slt	r0, r2
 fd 0b                 cmov.slt	r1, r3
 0b                    mov	r6, r7
 fa df                 asr16i	r6, 0xf
 f0 02 01              ldi8	r2, 0x1
 f9 59                 or	r2, r6
 f2 6a                 mov32	q3, q0
 f0 3a 00              stsp16	[sp+0x0], r2
 e0 4a ff              jmp16	-182 <L1>
<L4>:
 c6 00 50              ldi16	r6, 0x5000
 c7 c3 47              ldi16	r7, 0x47c3
 f0 69 c0              cmp32	q3, q0
 d2 73                 brult8	0x73 <L5>
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 a0                    xor	r4, r4
 c5 80 44              ldi16	r5, 0x4480
 f0 69 80              cmp32	q2, q0
 d2 79                 brult8	0x79 <L6>
 f2 68                 mov32	q2, q0
 c6 83 f9              ldi16	r6, 0xf983
 c7 a2 3f              ldi16	r7, 0x3fa2
 ff 02                 fmul
 ff 0f                 ftou16
 f4 ac                 inc16	r4
 08                    mov	r6, r4
 fa 9e                 lsr16i	r6, 0xe
 f4 8c                 lsr16.1	r4
 f4 70                 stsp16	[sp+0xc], r4
 04                    mov	r5, r4
 15                    add	r5, r5
 15                    add	r5, r5
 15                    add	r5, r5
 f1 15                 mov	r2, r5
 f1 1e                 mov	r3, r6
 c4 26 1b              ldi16	r4, 0x1b26
 c1 00                 ldi8	r5, 0x0
 f7 66                 add32	q1, q2
 f0 68 c4              ldp32	q3, [q1+]
 f2 68                 mov32	q2, q0
 ff 01                 fsub
 f0 64 c4              ldp32	q3, [q1]
 ff 01                 fsub
 c2 03                 ldi8	r6, 0x3
 f4 33                 ldsp16	r7, [sp+0xc]
 8e                    and	r7, r6
 f4 73                 stsp16	[sp+0xc], r7
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f0 06 dc 0f           ldi16	r2, 0xfdc
 f0 07 49 3f           ldi16	r3, 0x3f49
 f0 69 c4              cmp32	q3, q1
 d2 51                 brult8	0x51 <L9>
 f6 2d                 tst16	r5
 d3 37                 brslt8	0x37 <L7>
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 00                 fadd
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 00                 fadd
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 ae                 inc16	r6
 d4 35                 jmp8	0x35 <L8>
<L5>:
 f0 16 00              leasp	r6, 0x0
 f2 66                 mov32	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 e1 19 0b              call16	__kernel_rem_pio2f
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 e0 b9 fe              jmp16	-327 <L1>
<L6>:
 f0 16 00              leasp	r6, 0x0
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 e1 7f 11              call16	avm_rem_pio2f_medium
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d4 37                 jmp8	0x37 <L10>
<L7>:
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 ff 00                 fadd
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 33              ldi16	r7, 0x33a2
 ff 00                 fadd
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 b6                 dec16	r6
<L8>:
 f4 72                 stsp16	[sp+0xc], r6
<L9>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 07                 fneg	q3
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f0 69 40              cmp32	q1, q0
 fd 34                 cmov.slt	r6, r4
 fd 3d                 cmov.slt	r7, r5
 a0                    xor	r4, r4
 f4 31                 ldsp16	r5, [sp+0xc]
 21                    sub	r4, r5
 fd 25                 cmov.slt	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
<L10>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 e0 6d fe              jmp16	-403 <L1>
<L11>:
 c6 20 01              ldi16	r6, 0x120
 f0 6b 8c              st32	[r6], q2
 c4 24 01              ldi16	r4, 0x124
 f0 6b 08              st32	[r4], q0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 14                 adjsp	0x14
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

<__kernel_rem_pio2f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d4                 adjsp	-0x2c
 f0 3e 26              stsp16	[sp+0x26], r6
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 fa 77                 lsr16i	r4, 0x7
 c1 0a                 ldi8	r5, 0xa
 f3 11                 mulu8.w	r4, r5
 a5                    xor	r5, r5
 f0 04 98 2a           ldi16	r0, 0x2a98
 f0 01 00              ldi8	r1, 0x0
 f7 62                 add32	q0, q2
 c0 7f                 ldi8	r4, 0x7f
 f0 36 18              ldsp16	r6, [sp+0x18]
 82                    and	r4, r6
 c1 80                 ldi8	r5, 0x80
 94                    or	r5, r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 68 40              ldp32	q1, [q0+]
 f1 2a                 mov	r6, r2
 f4 00                 ldsp16	r4, [sp+0x0]
 fa 78                 lsr16i	r4, 0x8
 f4 50                 stsp16	[sp+0x4], r4
 06                    mov	r5, r6
 f3 14                 mulu8.w	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f4 59                 stsp16	[sp+0x6], r5
 fa 98                 lsr16i	r6, 0x8
 f0 3e 10              stsp16	[sp+0x10], r6
 0e                    mov	r7, r6
 f4 00                 ldsp16	r4, [sp+0x0]
 f3 1c                 mulu8.w	r7, r4
 fa a8                 lsr16i	r7, 0x8
 f4 18                 ldsp16	r4, [sp+0x6]
 1c                    add	r7, r4
 02                    mov	r4, r6
 f4 11                 ldsp16	r5, [sp+0x4]
 f6 31                 mul8	r4, r5
 13                    add	r4, r7
 f1 2e                 mov	r7, r2
 07                    mov	r5, r7
 f1 75                 zext8	r5
 f4 79                 stsp16	[sp+0xe], r5
 09                    mov	r6, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 f6 39                 mul8	r6, r5
 18                    add	r6, r4
 f4 6a                 stsp16	[sp+0xa], r6
 f3 1d                 mulu8.w	r7, r5
 fa a8                 lsr16i	r7, 0x8
 f0 35 10              ldsp16	r5, [sp+0x10]
 09                    mov	r6, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 0d                    mov	r7, r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f3 1c                 mulu8.w	r7, r4
 fa a8                 lsr16i	r7, 0x8
 f1 23                 mov	r4, r3
 fa 78                 lsr16i	r4, 0x8
 f4 58                 stsp16	[sp+0x6], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 19                 ldsp16	r5, [sp+0x6]
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 13                    add	r4, r7
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f6 37                 mul8	r5, r7
 14                    add	r5, r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f1 23                 mov	r4, r3
 f1 74                 zext8	r4
 f0 3c 16              stsp16	[sp+0x16], r4
 f6 31                 mul8	r4, r5
 f4 2b                 ldsp16	r7, [sp+0xa]
 13                    add	r4, r7
 f0 3c 22              stsp16	[sp+0x22], r4
 01                    mov	r4, r5
 f4 71                 stsp16	[sp+0xc], r5
 f4 1b                 ldsp16	r7, [sp+0x6]
 f6 33                 mul8	r4, r7
 12                    add	r4, r6
 f4 68                 stsp16	[sp+0xa], r4
 f4 02                 ldsp16	r6, [sp+0x0]
 f1 22                 mov	r4, r2
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 36 10              ldsp16	r6, [sp+0x10]
 f6 39                 mul8	r6, r5
 18                    add	r6, r4
 f0 3e 1e              stsp16	[sp+0x1e], r6
 f4 11                 ldsp16	r5, [sp+0x4]
 01                    mov	r4, r5
 f4 1a                 ldsp16	r6, [sp+0x6]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 23                 ldsp16	r7, [sp+0x8]
 f6 3e                 mul8	r7, r6
 1c                    add	r7, r4
 f0 3f 1c              stsp16	[sp+0x1c], r7
 f1 23                 mov	r4, r3
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f0 35 14              ldsp16	r5, [sp+0x14]
 11                    add	r4, r5
 f0 64 c0              ldp32	q3, [q0]
 f0 3e 28              stsp16	[sp+0x28], r6
 f0 3f 2a              stsp16	[sp+0x2a], r7
 0e                    mov	r7, r6
 f0 3f 14              stsp16	[sp+0x14], r7
 07                    mov	r5, r7
 f1 75                 zext8	r5
 f0 3d 24              stsp16	[sp+0x24], r5
 09                    mov	r6, r5
 f4 31                 ldsp16	r5, [sp+0xc]
 f6 39                 mul8	r6, r5
 18                    add	r6, r4
 f0 3e 20              stsp16	[sp+0x20], r6
 03                    mov	r4, r7
 f4 02                 ldsp16	r6, [sp+0x0]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 11                    add	r4, r5
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 12                 ldsp16	r6, [sp+0x4]
 f6 36                 mul8	r5, r6
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 16                    add	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f0 36 22              ldsp16	r6, [sp+0x22]
 16                    add	r5, r6
 f4 79                 stsp16	[sp+0xe], r5
 f4 23                 ldsp16	r7, [sp+0x8]
 f0 36 10              ldsp16	r6, [sp+0x10]
 f6 3b                 mul8	r6, r7
 f4 29                 ldsp16	r5, [sp+0xa]
 19                    add	r6, r5
 f0 3e 10              stsp16	[sp+0x10], r6
 f1 2b                 mov	r6, r3
 f3 1b                 mulu8.w	r6, r7
 fa 98                 lsr16i	r6, 0x8
 18                    add	r6, r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 fa 78                 lsr16i	r4, 0x8
 f4 68                 stsp16	[sp+0xa], r4
 04                    mov	r5, r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f6 34                 mul8	r5, r4
 16                    add	r5, r6
 f4 71                 stsp16	[sp+0xc], r5
 f0 35 16              ldsp16	r5, [sp+0x16]
 f6 37                 mul8	r5, r7
 f0 34 20              ldsp16	r4, [sp+0x20]
 14                    add	r5, r4
 f4 02                 ldsp16	r6, [sp+0x0]
 f1 2f                 mov	r7, r3
 f3 1e                 mulu8.w	r7, r6
 fa a8                 lsr16i	r7, 0x8
 f0 34 10              ldsp16	r4, [sp+0x10]
 1c                    add	r7, r4
 f0 36 16              ldsp16	r6, [sp+0x16]
 f4 10                 ldsp16	r4, [sp+0x4]
 f6 38                 mul8	r6, r4
 1b                    add	r6, r7
 f4 38                 ldsp16	r4, [sp+0xe]
 fa 78                 lsr16i	r4, 0x8
 12                    add	r4, r6
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 19                    add	r6, r5
 f1 74                 zext8	r4
 0e                    mov	r7, r6
 fa 68                 lsl16i	r7, 0x8
 9c                    or	r7, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 35 24              ldsp16	r5, [sp+0x24]
 f6 34                 mul8	r5, r4
 f4 30                 ldsp16	r4, [sp+0xc]
 14                    add	r5, r4
 fa 98                 lsr16i	r6, 0x8
 19                    add	r6, r5
 f4 7a                 stsp16	[sp+0xe], r6
 f1 76                 zext8	r6
 03                    mov	r4, r7
 06                    mov	r5, r6
 f2 30                 sub	r0, r0
 f0 01 ff              ldi8	r1, 0xff
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f7 76                 sub32	q1, q2
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 a0                    xor	r4, r4
 fa 97                 lsr16i	r6, 0x7
 f0 3e 16              stsp16	[sp+0x16], r6
 f4 a6                 tst8	r6
 fb 14                 cmov.eq	r2, r4
 fb 1d                 cmov.eq	r3, r5
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 da ca 00              breq16	0xca <L0>
 c2 02                 ldi8	r6, 0x2
 af                    xor	r7, r7
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f7 6e                 add32	q3, q2
 f0 04 fc ff           ldi16	r0, 0xfffc
 f0 01 ff              ldi8	r1, 0xff
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 aa                    xor	r6, r6
 c3 80                 ldi8	r7, 0x80
 f0 69 0c              cmp32	q0, q3
 da ab 00              breq16	0xab <L0>
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 20                 ldsp16	r4, [sp+0x8]
 f3 12                 mulu8.w	r4, r6
 f4 60                 stsp16	[sp+0x8], r4
 f0 35 14              ldsp16	r5, [sp+0x14]
 01                    mov	r4, r5
 f4 12                 ldsp16	r6, [sp+0x4]
 f3 12                 mulu8.w	r4, r6
 f4 70                 stsp16	[sp+0xc], r4
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 02                 ldsp16	r6, [sp+0x0]
 f3 12                 mulu8.w	r4, r6
 f4 58                 stsp16	[sp+0x6], r4
 f0 34 16              ldsp16	r4, [sp+0x16]
 f1 14                 mov	r2, r4
 f2 4b                 sub	r3, r3
 f0 36 18              ldsp16	r6, [sp+0x18]
 fe 2e                 mul16	r5, r6
 f4 20                 ldsp16	r4, [sp+0x8]
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 08                    mov	r6, r4
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 f1 05                 mov	r0, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 fe 04                 mul16	r0, r4
 f2 06                 add	r0, r6
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 11                 ldsp16	r5, [sp+0x4]
 f3 11                 mulu8.w	r4, r5
 f2 20                 add	r4, r0
 04                    mov	r5, r4
 f4 30                 ldsp16	r4, [sp+0xc]
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 04                    mov	r5, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f4 39                 ldsp16	r5, [sp+0xe]
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 c0 03                 ldi8	r4, 0x3
 81                    and	r4, r5
 f2 14                 add	r2, r4
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 03                    mov	r4, r7
 fa 38                 lsl16i	r4, 0x8
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 94                    or	r5, r4
 fa 58                 lsl16i	r6, 0x8
 02                    mov	r4, r6
 f2 4a                 sub	r3, r2
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 0c              cmp32	q0, q3
 fd 1a                 cmov.slt	r3, r2
 f0 3b 04              stsp16	[sp+0x4], r3
 ff 10                 s32tof
 c6 db 0f              ldi16	r6, 0xfdb
 c7 c9 2f              ldi16	r7, 0x2fc9
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 ff 04                 fneg	q0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 69 4c              cmp32	q1, q3
 fd 04                 cmov.slt	r0, r4
 fd 0d                 cmov.slt	r1, r5
 f0 34 26              ldsp16	r4, [sp+0x26]
 f4 11                 ldsp16	r5, [sp+0x4]
 71                    st16	[r4], r5
 f2 68                 mov32	q2, q0
 d6 2c                 adjsp	0x2c
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L0>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 36 26              ldsp16	r6, [sp+0x26]
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
 d6 c0                 adjsp	-0x40
 f0 3e 3e              stsp16	[sp+0x3e], r6
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 af                    xor	r7, r7
 f0 3d 2c              stsp16	[sp+0x2c], r5
 f0 3f 2e              stsp16	[sp+0x2e], r7
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 c1 0a                 ldi8	r5, 0xa
 f3 11                 mulu8.w	r4, r5
 a5                    xor	r5, r5
 c6 9c 2a              ldi16	r6, 0x2a9c
 c3 00                 ldi8	r7, 0x0
 f7 6e                 add32	q3, q2
 f0 04 98 2a           ldi16	r0, 0x2a98
 f0 01 00              ldi8	r1, 0x0
 f7 62                 add32	q0, q2
 f0 64 80              ldp32	q2, [q0]
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 04                    mov	r5, r4
 f0 3d 14              stsp16	[sp+0x14], r5
 fa 48                 lsl16i	r5, 0x8
 f0 68 4c              ldp32	q1, [q3+]
 f1 23                 mov	r4, r3
 fa 72                 lsr16i	r4, 0x2
 f1 04                 mov	r0, r4
 f1 0d                 mov	r1, r5
 f0 62 cc              ldp16	r6, [q3]
 02                    mov	r4, r6
 fa 72                 lsr16i	r4, 0x2
 f0 3c 30              stsp16	[sp+0x30], r4
 fa 5e                 lsl16i	r6, 0xe
 04                    mov	r5, r4
 0d                    mov	r7, r5
 f9 c1                 or	r6, r0
 f9 e5                 or	r7, r1
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f4 00                 ldsp16	r4, [sp+0x0]
 fa 78                 lsr16i	r4, 0x8
 f4 58                 stsp16	[sp+0x6], r4
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f4 00                 ldsp16	r4, [sp+0x0]
 f1 74                 zext8	r4
 f4 60                 stsp16	[sp+0x8], r4
 f0 35 30              ldsp16	r5, [sp+0x30]
 f1 75                 zext8	r5
 f4 51                 stsp16	[sp+0x4], r5
 f6 34                 mul8	r5, r4
 16                    add	r5, r6
 f0 36 14              ldsp16	r6, [sp+0x14]
 fa 98                 lsr16i	r6, 0x8
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 f1 21                 mov	r4, r1
 fa 38                 lsl16i	r4, 0x8
 92                    or	r4, r6
 f0 3c 18              stsp16	[sp+0x18], r4
 f4 3a                 ldsp16	r6, [sp+0xe]
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 70                 stsp16	[sp+0xc], r4
 f4 02                 ldsp16	r6, [sp+0x0]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f0 3c 14              stsp16	[sp+0x14], r4
 f1 29                 mov	r6, r1
 fa 98                 lsr16i	r6, 0x8
 f1 22                 mov	r4, r2
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 96                    or	r5, r6
 f0 3d 1c              stsp16	[sp+0x1c], r5
 fa 78                 lsr16i	r4, 0x8
 04                    mov	r5, r4
 f1 23                 mov	r4, r3
 fa 38                 lsl16i	r4, 0x8
 91                    or	r4, r5
 f4 68                 stsp16	[sp+0xa], r4
 f0 36 30              ldsp16	r6, [sp+0x30]
 f4 18                 ldsp16	r4, [sp+0x6]
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 37 18              ldsp16	r7, [sp+0x18]
 f1 77                 zext8	r7
 f0 3f 38              stsp16	[sp+0x38], r7
 03                    mov	r4, r7
 f4 23                 ldsp16	r7, [sp+0x8]
 f6 33                 mul8	r4, r7
 12                    add	r4, r6
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 36 30              ldsp16	r6, [sp+0x30]
 f4 00                 ldsp16	r4, [sp+0x0]
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f6 31                 mul8	r4, r5
 12                    add	r4, r6
 f0 3c 22              stsp16	[sp+0x22], r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f6 31                 mul8	r4, r5
 f0 35 14              ldsp16	r5, [sp+0x14]
 11                    add	r4, r5
 f0 3c 24              stsp16	[sp+0x24], r4
 c0 7f                 ldi8	r4, 0x7f
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 82                    and	r4, r6
 c1 80                 ldi8	r5, 0x80
 f1 05                 mov	r0, r5
 91                    or	r4, r5
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3d 1e              stsp16	[sp+0x1e], r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f0 3d 26              stsp16	[sp+0x26], r5
 f4 02                 ldsp16	r6, [sp+0x0]
 02                    mov	r4, r6
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f1 2d                 mov	r7, r1
 f0 35 14              ldsp16	r5, [sp+0x14]
 f3 1d                 mulu8.w	r7, r5
 fa a8                 lsr16i	r7, 0x8
 1c                    add	r7, r4
 f0 3f 20              stsp16	[sp+0x20], r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f6 31                 mul8	r4, r5
 0d                    mov	r7, r5
 f0 35 12              ldsp16	r5, [sp+0x12]
 11                    add	r4, r5
 f4 50                 stsp16	[sp+0x4], r4
 f1 23                 mov	r4, r3
 f1 74                 zext8	r4
 fe 26                 mul16	r4, r6
 f0 3c 28              stsp16	[sp+0x28], r4
 f4 18                 ldsp16	r4, [sp+0x6]
 08                    mov	r6, r4
 f4 29                 ldsp16	r5, [sp+0xa]
 fe 35                 mul16	r6, r5
 f0 35 28              ldsp16	r5, [sp+0x28]
 19                    add	r6, r5
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 35 18              ldsp16	r5, [sp+0x18]
 f3 17                 mulu8.w	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f1 29                 mov	r6, r1
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 19                    add	r6, r5
 f0 3e 3a              stsp16	[sp+0x3a], r6
 f4 3a                 ldsp16	r6, [sp+0xe]
 06                    mov	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 30                 ldsp16	r4, [sp+0xc]
 0c                    mov	r7, r4
 f4 22                 ldsp16	r6, [sp+0x8]
 f6 3e                 mul8	r7, r6
 1d                    add	r7, r5
 f0 3f 3c              stsp16	[sp+0x3c], r7
 04                    mov	r5, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f3 14                 mulu8.w	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f0 34 22              ldsp16	r4, [sp+0x22]
 14                    add	r5, r4
 f0 3d 32              stsp16	[sp+0x32], r5
 f0 37 10              ldsp16	r7, [sp+0x10]
 0b                    mov	r6, r7
 fa 98                 lsr16i	r6, 0x8
 f0 3e 28              stsp16	[sp+0x28], r6
 f4 00                 ldsp16	r4, [sp+0x0]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 11                 ldsp16	r5, [sp+0x4]
 11                    add	r4, r5
 f0 3c 34              stsp16	[sp+0x34], r4
 f4 21                 ldsp16	r5, [sp+0x8]
 09                    mov	r6, r5
 f0 34 26              ldsp16	r4, [sp+0x26]
 f6 38                 mul8	r6, r4
 f0 37 3a              ldsp16	r7, [sp+0x3a]
 1b                    add	r6, r7
 f0 3e 22              stsp16	[sp+0x22], r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 f1 76                 zext8	r6
 f6 39                 mul8	r6, r5
 f0 35 20              ldsp16	r5, [sp+0x20]
 19                    add	r6, r5
 f0 3e 20              stsp16	[sp+0x20], r6
 08                    mov	r6, r4
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 fe 34                 mul16	r6, r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 18                    add	r6, r4
 f0 3e 12              stsp16	[sp+0x12], r6
 f4 38                 ldsp16	r4, [sp+0xe]
 08                    mov	r6, r4
 f1 76                 zext8	r6
 0e                    mov	r7, r6
 f0 35 14              ldsp16	r5, [sp+0x14]
 f6 3d                 mul8	r7, r5
 f4 53                 stsp16	[sp+0x4], r7
 f0 37 24              ldsp16	r7, [sp+0x24]
 f4 11                 ldsp16	r5, [sp+0x4]
 17                    add	r5, r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 1b                 ldsp16	r7, [sp+0x6]
 f6 3b                 mul8	r6, r7
 f0 35 3c              ldsp16	r5, [sp+0x3c]
 19                    add	r6, r5
 f0 3e 2c              stsp16	[sp+0x2c], r6
 f0 35 14              ldsp16	r5, [sp+0x14]
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f0 35 32              ldsp16	r5, [sp+0x32]
 11                    add	r4, r5
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 35 18              ldsp16	r5, [sp+0x18]
 f3 17                 mulu8.w	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f1 21                 mov	r4, r1
 f4 02                 ldsp16	r6, [sp+0x0]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f0 3c 32              stsp16	[sp+0x32], r4
 f4 31                 ldsp16	r5, [sp+0xc]
 f0 34 14              ldsp16	r4, [sp+0x14]
 f3 14                 mulu8.w	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f0 36 34              ldsp16	r6, [sp+0x34]
 16                    add	r5, r6
 f0 3d 24              stsp16	[sp+0x24], r5
 f4 19                 ldsp16	r5, [sp+0x6]
 09                    mov	r6, r5
 f0 37 26              ldsp16	r7, [sp+0x26]
 f3 1b                 mulu8.w	r6, r7
 fa 98                 lsr16i	r6, 0x8
 f0 37 12              ldsp16	r7, [sp+0x12]
 1b                    add	r6, r7
 f0 3e 12              stsp16	[sp+0x12], r6
 09                    mov	r6, r5
 0d                    mov	r7, r5
 f0 35 26              ldsp16	r5, [sp+0x26]
 f6 39                 mul8	r6, r5
 f0 35 20              ldsp16	r5, [sp+0x20]
 19                    add	r6, r5
 f0 3e 20              stsp16	[sp+0x20], r6
 f1 25                 mov	r5, r1
 f1 75                 zext8	r5
 01                    mov	r4, r5
 09                    mov	r6, r5
 f0 3e 36              stsp16	[sp+0x36], r6
 f0 35 14              ldsp16	r5, [sp+0x14]
 f6 31                 mul8	r4, r5
 f0 35 22              ldsp16	r5, [sp+0x22]
 11                    add	r4, r5
 f0 3c 34              stsp16	[sp+0x34], r4
 06                    mov	r5, r6
 f6 37                 mul8	r5, r7
 f0 34 32              ldsp16	r4, [sp+0x32]
 14                    add	r5, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f0 36 28              ldsp16	r6, [sp+0x28]
 f6 32                 mul8	r4, r6
 f4 3a                 ldsp16	r6, [sp+0xe]
 12                    add	r4, r6
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 fa 78                 lsr16i	r4, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 12                    add	r4, r6
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 34 38              ldsp16	r4, [sp+0x38]
 f0 36 14              ldsp16	r6, [sp+0x14]
 f6 32                 mul8	r4, r6
 11                    add	r4, r5
 f0 3c 26              stsp16	[sp+0x26], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 2a                 ldsp16	r6, [sp+0xa]
 f3 18                 mulu8.w	r6, r4
 f4 6a                 stsp16	[sp+0xa], r6
 f0 36 18              ldsp16	r6, [sp+0x18]
 f3 18                 mulu8.w	r6, r4
 f0 3e 18              stsp16	[sp+0x18], r6
 08                    mov	r6, r4
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 04                    mov	r5, r4
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f0 36 34              ldsp16	r6, [sp+0x34]
 16                    add	r5, r6
 f4 79                 stsp16	[sp+0xe], r5
 04                    mov	r5, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f3 14                 mulu8.w	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f0 36 20              ldsp16	r6, [sp+0x20]
 16                    add	r5, r6
 f4 51                 stsp16	[sp+0x4], r5
 f4 29                 ldsp16	r5, [sp+0xa]
 fa 88                 lsr16i	r5, 0x8
 f0 36 12              ldsp16	r6, [sp+0x12]
 16                    add	r5, r6
 f4 69                 stsp16	[sp+0xa], r5
 f0 36 28              ldsp16	r6, [sp+0x28]
 04                    mov	r5, r4
 f6 36                 mul8	r5, r6
 f0 34 24              ldsp16	r4, [sp+0x24]
 14                    add	r5, r4
 f0 3d 24              stsp16	[sp+0x24], r5
 f4 31                 ldsp16	r5, [sp+0xc]
 f0 36 14              ldsp16	r6, [sp+0x14]
 f6 36                 mul8	r5, r6
 f0 34 22              ldsp16	r4, [sp+0x22]
 14                    add	r5, r4
 f4 71                 stsp16	[sp+0xc], r5
 f0 35 30              ldsp16	r5, [sp+0x30]
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f0 34 18              ldsp16	r4, [sp+0x18]
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f0 3c 18              stsp16	[sp+0x18], r4
 f4 21                 ldsp16	r5, [sp+0x8]
 f0 34 36              ldsp16	r4, [sp+0x36]
 f6 31                 mul8	r4, r5
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 f6 39                 mul8	r6, r5
 f0 35 26              ldsp16	r5, [sp+0x26]
 19                    add	r6, r5
 f4 62                 stsp16	[sp+0x8], r6
 f0 35 18              ldsp16	r5, [sp+0x18]
 11                    add	r4, r5
 f0 3c 36              stsp16	[sp+0x36], r4
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 fa 88                 lsr16i	r5, 0x8
 f4 30                 ldsp16	r4, [sp+0xc]
 14                    add	r5, r4
 01                    mov	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f0 36 24              ldsp16	r6, [sp+0x24]
 12                    add	r4, r6
 f4 70                 stsp16	[sp+0xc], r4
 f1 75                 zext8	r5
 fa 38                 lsl16i	r4, 0x8
 91                    or	r4, r5
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f4 2a                 ldsp16	r6, [sp+0xa]
 12                    add	r4, r6
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 0b                    mov	r6, r7
 f6 39                 mul8	r6, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 18                    add	r6, r4
 f4 6a                 stsp16	[sp+0xa], r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 f6 3e                 mul8	r7, r6
 f4 38                 ldsp16	r4, [sp+0xe]
 1c                    add	r7, r4
 f4 7b                 stsp16	[sp+0xe], r7
 0d                    mov	r7, r5
 f0 34 28              ldsp16	r4, [sp+0x28]
 f3 1c                 mulu8.w	r7, r4
 fa a8                 lsr16i	r7, 0x8
 f4 20                 ldsp16	r4, [sp+0x8]
 1c                    add	r7, r4
 f4 63                 stsp16	[sp+0x8], r7
 f0 37 38              ldsp16	r7, [sp+0x38]
 f6 3e                 mul8	r7, r6
 f0 34 36              ldsp16	r4, [sp+0x36]
 1c                    add	r7, r4
 f0 34 28              ldsp16	r4, [sp+0x28]
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 f0 37 14              ldsp16	r7, [sp+0x14]
 f6 3c                 mul8	r7, r4
 1e                    add	r7, r6
 f4 31                 ldsp16	r5, [sp+0xc]
 fa 88                 lsr16i	r5, 0x8
 17                    add	r5, r7
 01                    mov	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f4 22                 ldsp16	r6, [sp+0x8]
 12                    add	r4, r6
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f4 3b                 ldsp16	r7, [sp+0xe]
 1b                    add	r6, r7
 f1 75                 zext8	r5
 fa 38                 lsl16i	r4, 0x8
 91                    or	r4, r5
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 2b                 ldsp16	r7, [sp+0xa]
 17                    add	r5, r7
 f1 76                 zext8	r6
 0d                    mov	r7, r5
 fa 68                 lsl16i	r7, 0x8
 9e                    or	r7, r6
 f0 3f 14              stsp16	[sp+0x14], r7
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f4 5a                 stsp16	[sp+0x6], r6
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f4 1b                 ldsp16	r7, [sp+0x6]
 1e                    add	r7, r6
 f0 36 14              ldsp16	r6, [sp+0x14]
 f1 14                 mov	r2, r4
 f1 1e                 mov	r3, r6
 c2 03                 ldi8	r6, 0x3
 8b                    and	r6, r7
 f9 a0                 and	r5, r0
 fa 87                 lsr16i	r5, 0x7
 f2 39                 sub	r1, r1
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 39 16              stsp16	[sp+0x16], r1
 f4 a5                 tst8	r5
 af                    xor	r7, r7
 d0 1d                 breq8	0x1d <L0>
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 03                    mov	r4, r7
 f0 35 18              ldsp16	r5, [sp+0x18]
 21                    sub	r4, r5
 f6 2d                 tst16	r5
 f8 05                 cset.eq	r5
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 f7 61                 add32	q0, q1
 f4 ae                 inc16	r6
 d4 05                 jmp8	0x5 <L1>
<L0>:
 f2 61                 mov32	q0, q1
 f0 34 18              ldsp16	r4, [sp+0x18]
<L1>:
 f0 3e 18              stsp16	[sp+0x18], r6
 aa                    xor	r6, r6
 c7 80 27              ldi16	r7, 0x2780
 ff 0d                 u16tof
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 c7 80 2f              ldi16	r7, 0x2f80
 f2 68                 mov32	q2, q0
 ff 11                 u32tof
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 c6 db 0f              ldi16	r6, 0xfdb
 c7 c9 3f              ldi16	r7, 0x3fc9
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f4 09                 ldsp16	r5, [sp+0x2]
 09                    mov	r6, r5
 fa 9f                 lsr16i	r6, 0xf
 f2 68                 mov32	q2, q0
 ff 06                 fneg	q2
 f0 32 14              ldsp16	r2, [sp+0x14]
 f5 16                 cmp	r2, r6
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 f0 30 18              ldsp16	r0, [sp+0x18]
 f2 39                 sub	r1, r1
 f2 38                 sub	r1, r0
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c4              cmp32	q3, q1
 fd 01                 cmov.slt	r0, r1
 f0 36 3e              ldsp16	r6, [sp+0x3e]
 f5 58                 st16	[r6], r0
 d6 40                 adjsp	0x40
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_rem_pio2f_medium>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 f4 72                 stsp16	[sp+0xc], r6
 f2 62                 mov32	q0, q2
 c6 83 f9              ldi16	r6, 0xf983
 c7 a2 3f              ldi16	r7, 0x3fa2
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 ff 08                 fabs	q0
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 ff 13                 ftou32
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f7 66                 add32	q1, q2
 f7 81                 lsr32.1	q1
 f2 69                 mov32	q2, q1
 ff 11                 u32tof
 c6 00 80              ldi16	r6, 0x8000
 99                    or	r6, r5
 0e                    mov	r7, r6
 f4 50                 stsp16	[sp+0x4], r4
 f4 5b                 stsp16	[sp+0x6], r7
 aa                    xor	r6, r6
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 c6 22 aa              ldi16	r6, 0xaa22
 c7 fd 39              ldi16	r7, 0x39fd
 f2 62                 mov32	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 1d                 fma
 f0 00 03              ldi8	r0, 0x3
 f9 08                 and	r0, r2
 c6 db 0f              ldi16	r6, 0xfdb
 c7 49 3f              ldi16	r7, 0x3f49
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d1 1c                 brne8	0x1c <L0>
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 00                 fadd
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 00                 fadd
 f4 a8                 inc16	r0
 c2 01                 ldi8	r6, 0x1
 f9 c0                 and	r6, r0
 f4 a6                 tst8	r6
 d1 3e                 brne8	0x3e <L4>
 d4 26                 jmp8	0x26 <L2>
<L0>:
 c6 db 0f              ldi16	r6, 0xfdb
 c7 49 bf              ldi16	r7, 0xbf49
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 d1 12                 brne8	0x12 <L1>
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 ff 00                 fadd
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 33              ldi16	r7, 0x33a2
 ff 00                 fadd
 f4 b0                 dec16	r0
<L1>:
 c2 01                 ldi8	r6, 0x1
 f9 c0                 and	r6, r0
 f4 a6                 tst8	r6
 d1 16                 brne8	0x16 <L4>
<L2>:
 09                    mov	r6, r5
 1a                    add	r6, r6
 98                    or	r6, r4
 f6 2e                 tst16	r6
 d1 2c                 brne8	0x2c <L5>
<L3>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 32                 ldsp16	r6, [sp+0xc]
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 e0 cc f8              jmp16	__kernel_rem_pio2f
<L4>:
 aa                    xor	r6, r6
 c7 80 f5              ldi16	r7, 0xf580
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f7 6d                 add32	q3, q1
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 f0 69 4c              cmp32	q1, q3
 d2 d4                 brult8	-0x2c <L3>
<L5>:
 aa                    xor	r6, r6
 f2 58                 sub	r6, r0
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f6 2b                 tst16	r3
 fd 70                 cmov.sge	r6, r0
 f4 33                 ldsp16	r7, [sp+0xc]
 7e                    st16	[r7], r6
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 07                 fneg	q3
 fd 74                 cmov.sge	r6, r4
 fd 7d                 cmov.sge	r7, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 d6 0e                 adjsp	0xe
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
