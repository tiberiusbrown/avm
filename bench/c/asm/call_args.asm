
call_args.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b0                    push16	r0
 c6 df 9b              ldi16	r6, 0x9bdf
 c7 57 13              ldi16	r7, 0x1357
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 f0 06 e0 ac           ldi16	r2, 0xace0
 f0 07 68 24           ldi16	r3, 0x2468
 f1 04                 mov	r0, r4
<L0>:
 d6 f0                 adjsp	-0x10
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 04                    mov	r5, r4
 c9 07                 addi.s8	r5, 0x7
 f4 59                 stsp16	[sp+0x6], r5
 04                    mov	r5, r4
 c9 06                 addi.s8	r5, 0x6
 f4 51                 stsp16	[sp+0x4], r5
 04                    mov	r5, r4
 c9 05                 addi.s8	r5, 0x5
 f4 49                 stsp16	[sp+0x2], r5
 04                    mov	r5, r4
 c9 04                 addi.s8	r5, 0x4
 f4 41                 stsp16	[sp+0x0], r5
 08                    mov	r6, r4
 af                    xor	r7, r7
 f9 ca                 xor	r6, r2
 f9 ee                 xor	r7, r3
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f4 a8                 inc16	r0
 08                    mov	r6, r4
 ca 02                 addi.s8	r6, 0x2
 0c                    mov	r7, r4
 cb 03                 addi.s8	r7, 0x3
 f1 24                 mov	r5, r0
 d5 18                 call8	mix_arguments
 d6 10                 adjsp	0x10
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 0c 60              cmpi.s8	r0, 0x60
 f1 20                 mov	r4, r0
 d1 c5                 brne8	-0x3b <L0>
 c4 00 01              ldi16	r4, 0x100
 f0 6b c8              st32	[r4], q3
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<mix_arguments>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 17                    add	r5, r7
 f4 37                 ldsp16	r7, [sp+0xd]
 1d                    add	r7, r5
 f0 35 11              ldsp16	r5, [sp+0x11]
 17                    add	r5, r7
 0d                    mov	r7, r5
 fa a8                 lsr16i	r7, 0x8
 fa 48                 lsl16i	r5, 0x8
 f1 15                 mov	r2, r5
 f1 1f                 mov	r3, r7
 f0 30 17              ldsp16	r0, [sp+0x17]
 f0 31 19              ldsp16	r1, [sp+0x19]
 f7 61                 add32	q0, q1
 12                    add	r4, r6
 f4 2d                 ldsp16	r5, [sp+0xb]
 14                    add	r5, r4
 f4 3c                 ldsp16	r4, [sp+0xf]
 11                    add	r4, r5
 08                    mov	r6, r4
 af                    xor	r7, r7
 f0 34 13              ldsp16	r4, [sp+0x13]
 f0 35 15              ldsp16	r5, [sp+0x15]
 f7 6b                 add32	q2, q3
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
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
