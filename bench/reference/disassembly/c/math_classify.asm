
math_classify.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 f0 02 02              ldi8	r2, 0x2
 d4 5d                 jmp8	0x5d <L2>
<L0>:
 a5                    xor	r5, r5
<L1>:
 f4 41                 stsp16	[sp+0x0], r5
 f1 20                 mov	r4, r0
 f7 8c                 bool	r4
 f1 11                 mov	r2, r1
 f4 82                 lsl16.1	r2
 f9 89                 or	r4, r2
 f2 4b                 sub	r3, r3
 3c                    cmp	r7, r4
 fc 1e                 cmov.ult	r3, r6
 f2 68                 mov32	q2, q0
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 14                 fcmp
 c4 80 7f              ldi16	r4, 0x7f80
 84                    and	r5, r4
 0d                    mov	r7, r5
 cb 80                 addi.s8	r7, -0x80
 c4 00 7f              ldi16	r4, 0x7f00
 3c                    cmp	r7, r4
 f8 14                 cset.ult	r4
 c3 01                 ldi8	r7, 0x1
 83                    and	r4, r7
 ce 01                 cmpi.s8	r6, 0x1
 f8 06                 cset.eq	r6
 18                    add	r6, r4
 c4 80 7f              ldi16	r4, 0x7f80
 34                    cmp	r5, r4
 f8 0c                 cset.ne	r4
 83                    and	r4, r7
 12                    add	r4, r6
 c5 00 ff              ldi16	r5, 0xff00
 f9 56                 xor	r2, r5
 f9 41                 or	r2, r0
 f6 2a                 tst16	r2
 f0 02 02              ldi8	r2, 0x2
 f8 06                 cset.eq	r6
 8b                    and	r6, r7
 18                    add	r6, r4
 f1 21                 mov	r4, r1
 fa 7f                 lsr16i	r4, 0xf
 12                    add	r4, r6
 f2 23                 add	r4, r3
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f0 5c 00 01           stm16	[0x100], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 ac                 inc16	r4
 cc 20                 cmpi.s8	r4, 0x20
 d0 59                 breq8	0x59 <L3>
<L2>:
 f4 48                 stsp16	[sp+0x2], r4
 c1 0f                 ldi8	r5, 0xf
 81                    and	r4, r5
 10                    add	r4, r4
 10                    add	r4, r4
 a5                    xor	r5, r5
 c6 7a 0e              ldi16	r6, 0xe7a
 c3 00                 ldi8	r7, 0x0
 f7 6b                 add32	q2, q3
 f0 64 08              ldp32	q0, [q2]
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 f9 81                 or	r4, r0
 f6 2c                 tst16	r4
 c7 00 ff              ldi16	r7, 0xff00
 f0 03 01              ldi8	r3, 0x1
 f1 26                 mov	r5, r2
 f1 2a                 mov	r6, r2
 da 7e ff              breq16	-0x82 <L1>
 f1 20                 mov	r4, r0
 f7 8c                 bool	r4
 f1 25                 mov	r5, r1
 15                    add	r5, r5
 94                    or	r5, r4
 3d                    cmp	r7, r5
 dc 71 ff              brult16	-0x8f <L0>
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 a3                    xor	r4, r7
 f1 24                 mov	r5, r0
 94                    or	r5, r4
 f6 2d                 tst16	r5
 f1 27                 mov	r5, r3
 da 64 ff              breq16	-0x9c <L1>
 f2 68                 mov32	q2, q0
 ff 0a                 fabs	q2
 aa                    xor	r6, r6
 c3 80                 ldi8	r7, 0x80
 ff 14                 fcmp
 c7 00 ff              ldi16	r7, 0xff00
 c1 03                 ldi8	r5, 0x3
 c0 04                 ldi8	r4, 0x4
 ce ff                 cmpi.s8	r6, -0x1
 f1 2a                 mov	r6, r2
 fb 6c                 cmov.ne	r5, r4
 e0 4b ff              jmp16	-181 <L1>
<L3>:
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
