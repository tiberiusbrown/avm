
math_trig_probe_outline_normal.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 a0                    xor	r4, r4
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 d7 01                 sys	debug_break
 f2 61                 mov32	q0, q1
<L0>:
 f4 40                 stsp16	[sp+0x0], r4
 c1 07                 ldi8	r5, 0x7
 81                    and	r4, r5
 10                    add	r4, r4
 10                    add	r4, r4
 c5 00 01              ldi16	r5, 0x100
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 aa                    xor	r6, r6
 f4 4a                 stsp16	[sp+0x2], r6
 f0 16 02              leasp	r6, 0x2
 e1 dd 0a              call16	__ieee754_rem_pio2f
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 f2 66                 mov32	q1, q2
 c0 03                 ldi8	r4, 0x3
 f4 09                 ldsp16	r5, [sp+0x2]
 84                    and	r5, r4
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 ac                 inc16	r4
 cc 20                 cmpi.s8	r4, 0x20
 d1 d0                 brne8	-0x30 <L0>
 c4 20 01              ldi16	r4, 0x120
 f0 6b 48              st32	[r4], q1
 c4 24 01              ldi16	r4, 0x124
 f0 6b 08              st32	[r4], q0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 04                 adjsp	0x4
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

<__ieee754_rem_pio2f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f2 62                 mov32	q0, q2
 ff 08                 fabs	q0
 f0 06 da 0f           ldi16	r2, 0xfda
 f0 07 49 3f           ldi16	r3, 0x3f49
 f0 69 40              cmp32	q1, q0
 d2 05                 brult8	0x5 <L0>
 af                    xor	r7, r7
 7b                    st16	[r6], r7
 e0 ec 00              jmp16	236 <L6>
<L0>:
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 04              cmp32	q0, q1
 d2 09                 brult8	0x9 <L1>
 af                    xor	r7, r7
 7b                    st16	[r6], r7
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 01                 fsub
 e0 d8 00              jmp16	216 <L6>
<L1>:
 f0 06 e3 cb           ldi16	r2, 0xcbe3
 f0 07 16 40           ldi16	r3, 0x4016
 f0 69 40              cmp32	q1, q0
 d2 42                 brult8	0x42 <L3>
 f0 06 da 0f           ldi16	r2, 0xfda
 f0 07 c9 bf           ldi16	r3, 0xbfc9
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 3b 04              stsp16	[sp+0x4], r3
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 f4 5a                 stsp16	[sp+0x6], r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 ff 00                 fadd
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 06                 fneg	q2
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 69 04              cmp32	q0, q1
 fd 26                 cmov.slt	r4, r6
 fd 2f                 cmov.slt	r5, r7
 f1 2b                 mov	r6, r3
 fa df                 asr16i	r6, 0xf
 c3 01                 ldi8	r7, 0x1
 9e                    or	r7, r6
<L2>:
 f4 1a                 ldsp16	r6, [sp+0x6]
 7b                    st16	[r6], r7
 e0 89 00              jmp16	137 <L6>
<L3>:
 f0 06 00 50           ldi16	r2, 0x5000
 f0 07 c3 47           ldi16	r3, 0x47c3
 f0 69 40              cmp32	q1, q0
 d2 75                 brult8	0x75 <L4>
 f2 42                 sub	r2, r2
 f0 07 80 44           ldi16	r3, 0x4480
 f0 69 40              cmp32	q1, q0
 d2 6e                 brult8	0x6e <L5>
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f4 5a                 stsp16	[sp+0x6], r6
 c6 83 f9              ldi16	r6, 0xf983
 c7 a2 3f              ldi16	r7, 0x3fa2
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 ff 0f                 ftou16
 f4 ac                 inc16	r4
 08                    mov	r6, r4
 fa 9e                 lsr16i	r6, 0xe
 f4 8c                 lsr16.1	r4
 f4 40                 stsp16	[sp+0x0], r4
 04                    mov	r5, r4
 15                    add	r5, r5
 15                    add	r5, r5
 15                    add	r5, r5
 01                    mov	r4, r5
 06                    mov	r5, r6
 f0 06 f0 1a           ldi16	r2, 0x1af0
 f0 03 00              ldi8	r3, 0x0
 f7 66                 add32	q1, q2
 f0 68 c4              ldp32	q3, [q1+]
 f2 68                 mov32	q2, q0
 ff 01                 fsub
 f0 64 c4              ldp32	q3, [q1]
 ff 01                 fsub
 f0 00 03              ldi8	r0, 0x3
 f4 02                 ldsp16	r6, [sp+0x0]
 f9 18                 and	r0, r6
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f0 06 dc 0f           ldi16	r2, 0xfdc
 f0 07 49 3f           ldi16	r3, 0x3f49
 f0 69 c4              cmp32	q3, q1
 d2 38                 brult8	0x38 <L8>
 f6 2d                 tst16	r5
 d3 22                 brslt8	0x22 <L7>
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 00                 fadd
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 00                 fadd
 f4 a8                 inc16	r0
 d4 20                 jmp8	0x20 <L8>
<L4>:
 d5 45                 call8	__kernel_rem_pio2f
 d4 03                 jmp8	0x3 <L6>
<L5>:
 e1 a1 06              call16	avm_rem_pio2f_medium
<L6>:
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L7>:
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 ff 00                 fadd
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 33              ldi16	r7, 0x33a2
 ff 00                 fadd
 f4 b0                 dec16	r0
<L8>:
 f0 38 00              stsp16	[sp+0x0], r0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 07                 fneg	q3
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
 f0 69 04              cmp32	q0, q1
 fd 34                 cmov.slt	r6, r4
 fd 3d                 cmov.slt	r7, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 af                    xor	r7, r7
 f4 02                 ldsp16	r6, [sp+0x0]
 2e                    sub	r7, r6
 fd 3e                 cmov.slt	r7, r6
 e0 31 ff              jmp16	-207 <L2>

<__kernel_rem_pio2f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d6                 adjsp	-0x2a
 f0 3e 22              stsp16	[sp+0x22], r6
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 fa 77                 lsr16i	r4, 0x7
 f1 74                 zext8	r4
 c8 81                 addi.s8	r4, -0x7f
 c1 0a                 ldi8	r5, 0xa
 e1 39 07              call16	__avm_umulhisi3
 f0 06 58 2f           ldi16	r2, 0x2f58
 f0 03 00              ldi8	r3, 0x0
 f7 66                 add32	q1, q2
 c0 7f                 ldi8	r4, 0x7f
 f0 36 18              ldsp16	r6, [sp+0x18]
 82                    and	r4, r6
 c1 80                 ldi8	r5, 0x80
 94                    or	r5, r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 68 04              ldp32	q0, [q1+]
 f4 09                 ldsp16	r5, [sp+0x2]
 fa 88                 lsr16i	r5, 0x8
 f4 41                 stsp16	[sp+0x0], r5
 f1 20                 mov	r4, r0
 0c                    mov	r7, r4
 f3 1d                 mulu8.w	r7, r5
 fa a8                 lsr16i	r7, 0x8
 fa 78                 lsr16i	r4, 0x8
 f4 78                 stsp16	[sp+0xe], r4
 08                    mov	r6, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 f4 38                 ldsp16	r4, [sp+0xe]
 f4 01                 ldsp16	r5, [sp+0x0]
 f6 31                 mul8	r4, r5
 12                    add	r4, r6
 f1 28                 mov	r6, r0
 06                    mov	r5, r6
 f1 75                 zext8	r5
 f0 3d 12              stsp16	[sp+0x12], r5
 0d                    mov	r7, r5
 f4 19                 ldsp16	r5, [sp+0x6]
 f6 3d                 mul8	r7, r5
 1c                    add	r7, r4
 f4 73                 stsp16	[sp+0xc], r7
 f3 19                 mulu8.w	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f4 38                 ldsp16	r4, [sp+0xe]
 04                    mov	r5, r4
 f4 03                 ldsp16	r7, [sp+0x0]
 f3 17                 mulu8.w	r5, r7
 fa 88                 lsr16i	r5, 0x8
 16                    add	r5, r6
 f4 61                 stsp16	[sp+0x8], r5
 08                    mov	r6, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f1 2d                 mov	r7, r1
 fa a8                 lsr16i	r7, 0x8
 f4 08                 ldsp16	r4, [sp+0x2]
 f3 13                 mulu8.w	r4, r7
 fa 78                 lsr16i	r4, 0x8
 12                    add	r4, r6
 f4 01                 ldsp16	r5, [sp+0x0]
 f6 37                 mul8	r5, r7
 14                    add	r5, r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f4 0a                 ldsp16	r6, [sp+0x2]
 f1 76                 zext8	r6
 f1 21                 mov	r4, r1
 f1 74                 zext8	r4
 f0 3c 16              stsp16	[sp+0x16], r4
 f6 32                 mul8	r4, r6
 f4 31                 ldsp16	r5, [sp+0xc]
 11                    add	r4, r5
 f0 3c 20              stsp16	[sp+0x20], r4
 02                    mov	r4, r6
 f4 6a                 stsp16	[sp+0xa], r6
 f6 33                 mul8	r4, r7
 f4 21                 ldsp16	r5, [sp+0x8]
 11                    add	r4, r5
 f4 60                 stsp16	[sp+0x8], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f1 24                 mov	r5, r0
 f3 14                 mulu8.w	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f4 38                 ldsp16	r4, [sp+0xe]
 f6 32                 mul8	r4, r6
 11                    add	r4, r5
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f4 02                 ldsp16	r6, [sp+0x0]
 02                    mov	r4, r6
 f3 13                 mulu8.w	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 3f 28              stsp16	[sp+0x28], r7
 f6 37                 mul8	r5, r7
 14                    add	r5, r4
 f1 21                 mov	r4, r1
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 36 14              ldsp16	r6, [sp+0x14]
 12                    add	r4, r6
 f0 64 c4              ldp32	q3, [q1]
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 3f 26              stsp16	[sp+0x26], r7
 f4 72                 stsp16	[sp+0xc], r6
 f1 76                 zext8	r6
 f0 3e 14              stsp16	[sp+0x14], r6
 0e                    mov	r7, r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 f6 3e                 mul8	r7, r6
 1c                    add	r7, r4
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f0 36 12              ldsp16	r6, [sp+0x12]
 f4 01                 ldsp16	r5, [sp+0x0]
 f6 39                 mul8	r6, r5
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 19                    add	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f0 35 20              ldsp16	r5, [sp+0x20]
 19                    add	r6, r5
 f0 3e 12              stsp16	[sp+0x12], r6
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 3a                 ldsp16	r6, [sp+0xe]
 f6 39                 mul8	r6, r5
 f4 23                 ldsp16	r7, [sp+0x8]
 1b                    add	r6, r7
 f4 7a                 stsp16	[sp+0xe], r6
 f1 29                 mov	r6, r1
 f3 19                 mulu8.w	r6, r5
 fa 98                 lsr16i	r6, 0x8
 18                    add	r6, r4
 f4 30                 ldsp16	r4, [sp+0xc]
 fa 78                 lsr16i	r4, 0x8
 f4 60                 stsp16	[sp+0x8], r4
 0c                    mov	r7, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 f6 3c                 mul8	r7, r4
 1e                    add	r7, r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 37 16              ldsp16	r7, [sp+0x16]
 f6 3d                 mul8	r7, r5
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 1c                    add	r7, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f1 25                 mov	r5, r1
 f3 14                 mulu8.w	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f4 38                 ldsp16	r4, [sp+0xe]
 14                    add	r5, r4
 f0 34 16              ldsp16	r4, [sp+0x16]
 f4 02                 ldsp16	r6, [sp+0x0]
 f6 32                 mul8	r4, r6
 11                    add	r4, r5
 f0 35 12              ldsp16	r5, [sp+0x12]
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 01                    mov	r4, r5
 fa 78                 lsr16i	r4, 0x8
 13                    add	r4, r7
 f1 75                 zext8	r5
 08                    mov	r6, r4
 fa 58                 lsl16i	r6, 0x8
 99                    or	r6, r5
 f4 01                 ldsp16	r5, [sp+0x0]
 f0 37 14              ldsp16	r7, [sp+0x14]
 f6 3d                 mul8	r7, r5
 f4 29                 ldsp16	r5, [sp+0xa]
 1d                    add	r7, r5
 fa 78                 lsr16i	r4, 0x8
 13                    add	r4, r7
 f0 3c 12              stsp16	[sp+0x12], r4
 f1 74                 zext8	r4
 0c                    mov	r7, r4
 f2 42                 sub	r2, r2
 f0 03 ff              ldi8	r3, 0xff
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f7 73                 sub32	q0, q3
 f9 08                 and	r0, r2
 f9 2c                 and	r1, r3
 aa                    xor	r6, r6
 fa 77                 lsr16i	r4, 0x7
 f0 3c 16              stsp16	[sp+0x16], r4
 f4 a4                 tst8	r4
 fb 06                 cmov.eq	r0, r6
 fb 0f                 cmov.eq	r1, r7
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 da c2 00              breq16	0xc2 <L0>
 c2 02                 ldi8	r6, 0x2
 af                    xor	r7, r7
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f7 6e                 add32	q3, q2
 f0 04 fc ff           ldi16	r0, 0xfffc
 f0 01 ff              ldi8	r1, 0xff
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 aa                    xor	r6, r6
 c3 80                 ldi8	r7, 0x80
 f0 69 0c              cmp32	q0, q3
 da a4 00              breq16	0xa4 <L0>
 f0 36 28              ldsp16	r6, [sp+0x28]
 f4 18                 ldsp16	r4, [sp+0x6]
 f3 12                 mulu8.w	r4, r6
 f4 58                 stsp16	[sp+0x6], r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 01                 ldsp16	r5, [sp+0x0]
 f3 11                 mulu8.w	r4, r5
 f0 3c 14              stsp16	[sp+0x14], r4
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 08                 ldsp16	r4, [sp+0x2]
 f3 18                 mulu8.w	r6, r4
 f4 6a                 stsp16	[sp+0xa], r6
 f0 35 16              ldsp16	r5, [sp+0x16]
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 f0 36 18              ldsp16	r6, [sp+0x18]
 f4 33                 ldsp16	r7, [sp+0xc]
 fe 3e                 mul16	r7, r6
 f4 19                 ldsp16	r5, [sp+0x6]
 fa 88                 lsr16i	r5, 0x8
 17                    add	r5, r7
 f0 37 26              ldsp16	r7, [sp+0x26]
 f1 17                 mov	r2, r7
 fe 14                 mul16	r2, r4
 f2 15                 add	r2, r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 01                 ldsp16	r5, [sp+0x0]
 f3 11                 mulu8.w	r4, r5
 f2 22                 add	r4, r2
 04                    mov	r5, r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 04                    mov	r5, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 04                    mov	r5, r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 c1 03                 ldi8	r5, 0x3
 84                    and	r5, r4
 f2 05                 add	r0, r5
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
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
 ff 10                 s32tof
 c6 db 0f              ldi16	r6, 0xfdb
 c7 c9 2f              ldi16	r7, 0x2fc9
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 ff 04                 fneg	q0
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f0 69 4c              cmp32	q1, q3
 fd 04                 cmov.slt	r0, r4
 fd 0d                 cmov.slt	r1, r5
 f0 34 22              ldsp16	r4, [sp+0x22]
 f4 01                 ldsp16	r5, [sp+0x0]
 71                    st16	[r4], r5
 f2 68                 mov32	q2, q0
 d6 2a                 adjsp	0x2a
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L0>:
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f0 36 22              ldsp16	r6, [sp+0x22]
 d6 2a                 adjsp	0x2a
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
 d6 c4                 adjsp	-0x3c
 f0 3e 3a              stsp16	[sp+0x3a], r6
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 09                    mov	r6, r5
 af                    xor	r7, r7
 f0 3e 28              stsp16	[sp+0x28], r6
 f0 3f 2a              stsp16	[sp+0x2a], r7
 02                    mov	r4, r6
 fa 77                 lsr16i	r4, 0x7
 f1 74                 zext8	r4
 c8 81                 addi.s8	r4, -0x7f
 c1 0a                 ldi8	r5, 0xa
 e1 d1 04              call16	__avm_umulhisi3
 c6 5c 2f              ldi16	r6, 0x2f5c
 c3 00                 ldi8	r7, 0x0
 f7 6e                 add32	q3, q2
 f0 04 58 2f           ldi16	r0, 0x2f58
 f0 01 00              ldi8	r1, 0x0
 f7 62                 add32	q0, q2
 f0 64 80              ldp32	q2, [q0]
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 04                    mov	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 fa 48                 lsl16i	r5, 0x8
 f0 68 4c              ldp32	q1, [q3+]
 f1 23                 mov	r4, r3
 fa 72                 lsr16i	r4, 0x2
 f1 04                 mov	r0, r4
 f1 0d                 mov	r1, r5
 f0 62 cc              ldp16	r6, [q3]
 0e                    mov	r7, r6
 fa a2                 lsr16i	r7, 0x2
 fa 5e                 lsl16i	r6, 0xe
 07                    mov	r5, r7
 f4 4a                 stsp16	[sp+0x2], r6
 f4 51                 stsp16	[sp+0x4], r5
 f0 3d 32              stsp16	[sp+0x32], r5
 f9 c1                 or	r6, r0
 f9 e5                 or	r7, r1
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 f0 34 12              ldsp16	r4, [sp+0x12]
 fa 78                 lsr16i	r4, 0x8
 f0 3c 10              stsp16	[sp+0x10], r4
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 34 12              ldsp16	r4, [sp+0x12]
 f1 74                 zext8	r4
 f4 60                 stsp16	[sp+0x8], r4
 f1 75                 zext8	r5
 f4 59                 stsp16	[sp+0x6], r5
 f6 34                 mul8	r5, r4
 16                    add	r5, r6
 f4 03                 ldsp16	r7, [sp+0x0]
 fa a8                 lsr16i	r7, 0x8
 f0 34 18              ldsp16	r4, [sp+0x18]
 f4 40                 stsp16	[sp+0x0], r4
 fa 38                 lsl16i	r4, 0x8
 93                    or	r4, r7
 f4 68                 stsp16	[sp+0xa], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 fa 78                 lsr16i	r4, 0x8
 f4 78                 stsp16	[sp+0xe], r4
 f0 36 12              ldsp16	r6, [sp+0x12]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f0 3c 16              stsp16	[sp+0x16], r4
 f4 02                 ldsp16	r6, [sp+0x0]
 fa 98                 lsr16i	r6, 0x8
 f1 22                 mov	r4, r2
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 96                    or	r5, r6
 f0 3d 2c              stsp16	[sp+0x2c], r5
 fa 78                 lsr16i	r4, 0x8
 04                    mov	r5, r4
 f1 23                 mov	r4, r3
 fa 38                 lsl16i	r4, 0x8
 91                    or	r4, r5
 f4 70                 stsp16	[sp+0xc], r4
 f0 36 32              ldsp16	r6, [sp+0x32]
 f0 34 10              ldsp16	r4, [sp+0x10]
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f4 2b                 ldsp16	r7, [sp+0xa]
 f1 77                 zext8	r7
 f0 3f 34              stsp16	[sp+0x34], r7
 03                    mov	r4, r7
 f4 23                 ldsp16	r7, [sp+0x8]
 f6 33                 mul8	r4, r7
 12                    add	r4, r6
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 36 32              ldsp16	r6, [sp+0x32]
 f0 34 12              ldsp16	r4, [sp+0x12]
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f4 18                 ldsp16	r4, [sp+0x6]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f6 31                 mul8	r4, r5
 12                    add	r4, r6
 f0 3c 20              stsp16	[sp+0x20], r4
 f4 38                 ldsp16	r4, [sp+0xe]
 f6 31                 mul8	r4, r5
 f0 35 16              ldsp16	r5, [sp+0x16]
 11                    add	r4, r5
 f0 3c 22              stsp16	[sp+0x22], r4
 c0 7f                 ldi8	r4, 0x7f
 f0 36 28              ldsp16	r6, [sp+0x28]
 82                    and	r4, r6
 c1 80                 ldi8	r5, 0x80
 f1 05                 mov	r0, r5
 91                    or	r4, r5
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3d 2e              stsp16	[sp+0x2e], r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 36 12              ldsp16	r6, [sp+0x12]
 02                    mov	r4, r6
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f4 01                 ldsp16	r5, [sp+0x0]
 f0 34 16              ldsp16	r4, [sp+0x16]
 f3 14                 mulu8.w	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 14                    add	r5, r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f4 18                 ldsp16	r4, [sp+0x6]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f6 31                 mul8	r4, r5
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 11                    add	r4, r5
 f4 58                 stsp16	[sp+0x6], r4
 f1 23                 mov	r4, r3
 f1 74                 zext8	r4
 fe 26                 mul16	r4, r6
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 37 10              ldsp16	r7, [sp+0x10]
 07                    mov	r5, r7
 f4 30                 ldsp16	r4, [sp+0xc]
 fe 2c                 mul16	r5, r4
 f0 34 24              ldsp16	r4, [sp+0x24]
 14                    add	r5, r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 34 16              ldsp16	r4, [sp+0x16]
 f3 14                 mulu8.w	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f4 00                 ldsp16	r4, [sp+0x0]
 f3 13                 mulu8.w	r4, r7
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f4 09                 ldsp16	r5, [sp+0x2]
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 3b                 ldsp16	r7, [sp+0xe]
 f4 22                 ldsp16	r6, [sp+0x8]
 f6 3e                 mul8	r7, r6
 1d                    add	r7, r5
 f0 3f 36              stsp16	[sp+0x36], r7
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f3 19                 mulu8.w	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f0 35 20              ldsp16	r5, [sp+0x20]
 19                    add	r6, r5
 f0 3e 30              stsp16	[sp+0x30], r6
 f4 13                 ldsp16	r7, [sp+0x4]
 0b                    mov	r6, r7
 fa 98                 lsr16i	r6, 0x8
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 35 12              ldsp16	r5, [sp+0x12]
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 1a                 ldsp16	r6, [sp+0x6]
 16                    add	r5, r6
 f0 3d 38              stsp16	[sp+0x38], r5
 f4 21                 ldsp16	r5, [sp+0x8]
 0d                    mov	r7, r5
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f6 3e                 mul8	r7, r6
 1c                    add	r7, r4
 f0 3f 20              stsp16	[sp+0x20], r7
 f4 33                 ldsp16	r7, [sp+0xc]
 f1 77                 zext8	r7
 f6 3d                 mul8	r7, r5
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 1c                    add	r7, r4
 f0 3f 1c              stsp16	[sp+0x1c], r7
 0e                    mov	r7, r6
 f0 34 28              ldsp16	r4, [sp+0x28]
 fe 3c                 mul16	r7, r4
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 1c                    add	r7, r4
 f0 3f 1a              stsp16	[sp+0x1a], r7
 f4 08                 ldsp16	r4, [sp+0x2]
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f4 59                 stsp16	[sp+0x6], r5
 0d                    mov	r7, r5
 f0 35 16              ldsp16	r5, [sp+0x16]
 f6 3d                 mul8	r7, r5
 f0 36 22              ldsp16	r6, [sp+0x22]
 1e                    add	r7, r6
 f0 3f 22              stsp16	[sp+0x22], r7
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 36 10              ldsp16	r6, [sp+0x10]
 f6 3e                 mul8	r7, r6
 f0 36 36              ldsp16	r6, [sp+0x36]
 1e                    add	r7, r6
 f4 5b                 stsp16	[sp+0x6], r7
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f0 35 30              ldsp16	r5, [sp+0x30]
 11                    add	r4, r5
 f4 48                 stsp16	[sp+0x2], r4
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 34 10              ldsp16	r4, [sp+0x10]
 f3 14                 mulu8.w	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 36 12              ldsp16	r6, [sp+0x12]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f0 3c 30              stsp16	[sp+0x30], r4
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 34 16              ldsp16	r4, [sp+0x16]
 f3 14                 mulu8.w	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f0 36 38              ldsp16	r6, [sp+0x38]
 16                    add	r5, r6
 f0 3d 28              stsp16	[sp+0x28], r5
 f0 35 10              ldsp16	r5, [sp+0x10]
 09                    mov	r6, r5
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f3 1b                 mulu8.w	r6, r7
 fa 98                 lsr16i	r6, 0x8
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 1b                    add	r6, r7
 f0 3e 1a              stsp16	[sp+0x1a], r6
 09                    mov	r6, r5
 0d                    mov	r7, r5
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f6 39                 mul8	r6, r5
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 19                    add	r6, r5
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f4 01                 ldsp16	r5, [sp+0x0]
 f1 75                 zext8	r5
 01                    mov	r4, r5
 09                    mov	r6, r5
 f4 42                 stsp16	[sp+0x0], r6
 f0 35 16              ldsp16	r5, [sp+0x16]
 f6 31                 mul8	r4, r5
 f0 35 20              ldsp16	r5, [sp+0x20]
 11                    add	r4, r5
 f0 3c 1e              stsp16	[sp+0x1e], r4
 06                    mov	r5, r6
 f6 37                 mul8	r5, r7
 f0 34 30              ldsp16	r4, [sp+0x30]
 14                    add	r5, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f0 36 24              ldsp16	r6, [sp+0x24]
 f6 32                 mul8	r4, r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 12                    add	r4, r6
 f4 48                 stsp16	[sp+0x2], r4
 f4 18                 ldsp16	r4, [sp+0x6]
 fa 78                 lsr16i	r4, 0x8
 f0 36 22              ldsp16	r6, [sp+0x22]
 12                    add	r4, r6
 f4 58                 stsp16	[sp+0x6], r4
 f0 34 34              ldsp16	r4, [sp+0x34]
 f0 36 16              ldsp16	r6, [sp+0x16]
 f6 32                 mul8	r4, r6
 11                    add	r4, r5
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 f4 32                 ldsp16	r6, [sp+0xc]
 f3 18                 mulu8.w	r6, r4
 f4 72                 stsp16	[sp+0xc], r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 f3 18                 mulu8.w	r6, r4
 f4 6a                 stsp16	[sp+0xa], r6
 08                    mov	r6, r4
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 04                    mov	r5, r4
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 16                    add	r5, r6
 f0 3d 1e              stsp16	[sp+0x1e], r5
 04                    mov	r5, r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 f3 14                 mulu8.w	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 16                    add	r5, r6
 f0 3d 22              stsp16	[sp+0x22], r5
 f4 31                 ldsp16	r5, [sp+0xc]
 fa 88                 lsr16i	r5, 0x8
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 16                    add	r5, r6
 f4 71                 stsp16	[sp+0xc], r5
 f0 36 24              ldsp16	r6, [sp+0x24]
 04                    mov	r5, r4
 f6 36                 mul8	r5, r6
 f0 34 28              ldsp16	r4, [sp+0x28]
 14                    add	r5, r4
 f0 3d 28              stsp16	[sp+0x28], r5
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 36 16              ldsp16	r6, [sp+0x16]
 f6 36                 mul8	r5, r6
 f4 08                 ldsp16	r4, [sp+0x2]
 14                    add	r5, r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 35 32              ldsp16	r5, [sp+0x32]
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 2a                 ldsp16	r6, [sp+0xa]
 fa 98                 lsr16i	r6, 0x8
 19                    add	r6, r5
 06                    mov	r5, r6
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 00                 ldsp16	r4, [sp+0x0]
 f6 32                 mul8	r4, r6
 f0 37 2c              ldsp16	r7, [sp+0x2c]
 f1 77                 zext8	r7
 f4 4b                 stsp16	[sp+0x2], r7
 f6 3e                 mul8	r7, r6
 f0 36 20              ldsp16	r6, [sp+0x20]
 1e                    add	r7, r6
 f4 63                 stsp16	[sp+0x8], r7
 11                    add	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 19                 ldsp16	r5, [sp+0x6]
 fa 88                 lsr16i	r5, 0x8
 f4 38                 ldsp16	r4, [sp+0xe]
 14                    add	r5, r4
 01                    mov	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f0 36 28              ldsp16	r6, [sp+0x28]
 12                    add	r4, r6
 f4 68                 stsp16	[sp+0xa], r4
 f1 75                 zext8	r5
 fa 38                 lsl16i	r4, 0x8
 91                    or	r4, r5
 f4 78                 stsp16	[sp+0xe], r4
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f4 32                 ldsp16	r6, [sp+0xc]
 12                    add	r4, r6
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f4 0b                 ldsp16	r7, [sp+0x2]
 0b                    mov	r6, r7
 f6 39                 mul8	r6, r5
 f0 34 22              ldsp16	r4, [sp+0x22]
 18                    add	r6, r4
 f4 72                 stsp16	[sp+0xc], r6
 f0 36 10              ldsp16	r6, [sp+0x10]
 f6 3e                 mul8	r7, r6
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 1c                    add	r7, r4
 f4 4b                 stsp16	[sp+0x2], r7
 0d                    mov	r7, r5
 f0 34 24              ldsp16	r4, [sp+0x24]
 f3 1c                 mulu8.w	r7, r4
 fa a8                 lsr16i	r7, 0x8
 f4 20                 ldsp16	r4, [sp+0x8]
 1c                    add	r7, r4
 f4 63                 stsp16	[sp+0x8], r7
 f0 37 34              ldsp16	r7, [sp+0x34]
 f6 3e                 mul8	r7, r6
 f4 00                 ldsp16	r4, [sp+0x0]
 1c                    add	r7, r4
 f0 34 24              ldsp16	r4, [sp+0x24]
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 f0 37 16              ldsp16	r7, [sp+0x16]
 f6 3c                 mul8	r7, r4
 1e                    add	r7, r6
 f4 29                 ldsp16	r5, [sp+0xa]
 fa 88                 lsr16i	r5, 0x8
 17                    add	r5, r7
 01                    mov	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f4 22                 ldsp16	r6, [sp+0x8]
 12                    add	r4, r6
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f4 0b                 ldsp16	r7, [sp+0x2]
 1b                    add	r6, r7
 f1 75                 zext8	r5
 fa 38                 lsl16i	r4, 0x8
 91                    or	r4, r5
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 33                 ldsp16	r7, [sp+0xc]
 17                    add	r5, r7
 f1 76                 zext8	r6
 0d                    mov	r7, r5
 fa 68                 lsl16i	r7, 0x8
 9e                    or	r7, r6
 f0 3f 16              stsp16	[sp+0x16], r7
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f4 4a                 stsp16	[sp+0x2], r6
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 f4 0b                 ldsp16	r7, [sp+0x2]
 1e                    add	r7, r6
 f0 36 16              ldsp16	r6, [sp+0x16]
 f1 14                 mov	r2, r4
 f1 1e                 mov	r3, r6
 c2 03                 ldi8	r6, 0x3
 8b                    and	r6, r7
 f9 a0                 and	r5, r0
 fa 87                 lsr16i	r5, 0x7
 f2 39                 sub	r1, r1
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 39 18              stsp16	[sp+0x18], r1
 f4 a5                 tst8	r5
 af                    xor	r7, r7
 d0 1c                 breq8	0x1c <L0>
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 03                    mov	r4, r7
 f4 39                 ldsp16	r5, [sp+0xe]
 21                    sub	r4, r5
 f6 2d                 tst16	r5
 f8 05                 cset.eq	r5
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 f7 61                 add32	q0, q1
 f4 ae                 inc16	r6
 d4 04                 jmp8	0x4 <L1>
<L0>:
 f2 61                 mov32	q0, q1
 f4 38                 ldsp16	r4, [sp+0xe]
<L1>:
 f4 4a                 stsp16	[sp+0x2], r6
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
 f0 35 14              ldsp16	r5, [sp+0x14]
 09                    mov	r6, r5
 fa 9f                 lsr16i	r6, 0xf
 f2 68                 mov32	q2, q0
 ff 06                 fneg	q2
 f0 32 16              ldsp16	r2, [sp+0x16]
 f5 16                 cmp	r2, r6
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 f0 30 02              ldsp16	r0, [sp+0x2]
 f2 39                 sub	r1, r1
 f2 38                 sub	r1, r0
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 f0 69 c4              cmp32	q3, q1
 fd 01                 cmov.slt	r0, r1
 f0 36 3a              ldsp16	r6, [sp+0x3a]
 f5 58                 st16	[r6], r0
 d6 3c                 adjsp	0x3c
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
 e0 e2 f8              jmp16	__kernel_rem_pio2f
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
