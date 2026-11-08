
string_scan.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f0 06 00 01           ldi16	r2, 0x100
 f0 03 61              ldi8	r3, 0x61
 aa                    xor	r6, r6
 f0 05 08 01           ldi16	r1, 0x108
 02                    mov	r4, r6
<L0>:
 f4 48                 stsp16	[sp+0x2], r4
 04                    mov	r5, r4
 fa 45                 lsl16i	r5, 0x5
 c4 00 01              ldi16	r4, 0x100
 14                    add	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 c1 1f                 ldi8	r5, 0x1f
 f4 52                 stsp16	[sp+0x4], r6
 0e                    mov	r7, r6
 f0 3b 06              stsp16	[sp+0x6], r3
 f1 02                 mov	r0, r2
<L1>:
 c2 4f                 ldi8	r6, 0x4f
 03                    mov	r4, r7
 f3 12                 mulu8.w	r4, r6
 fa 7b                 lsr16i	r4, 0xb
 c2 1a                 ldi8	r6, 0x1a
 f3 12                 mulu8.w	r4, r6
 0b                    mov	r6, r7
 28                    sub	r6, r4
 2b                    sub	r6, r7
 f2 2b                 add	r6, r3
 f0 6d c1              st8	[r0+], r6
 f4 af                 inc16	r7
 f4 ab                 inc16	r3
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 e3                 brne8	-0x1d <L1>
 af                    xor	r7, r7
 ee e2 20              st8	[r1+0], r7
 f4 00                 ldsp16	r4, [sp+0x0]
 ee e8 3f              st8	[r4+31], r7
 f0 09 23              addi.s8	r1, 0x23
 f4 12                 ldsp16	r6, [sp+0x4]
 ca 03                 addi.s8	r6, 0x3
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 0b 03              addi.s8	r3, 0x3
 f0 0a 20              addi.s8	r2, 0x20
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 ac                 inc16	r4
 cc 08                 cmpi.s8	r4, 0x8
 d1 ad                 brne8	-0x53 <L0>
 c4 02 02              ldi16	r4, 0x202
 c1 07                 ldi8	r5, 0x7
 c2 80                 ldi8	r6, 0x80
<L2>:
 f6 05                 st8	[r4+], r5
 c9 0b                 addi.s8	r5, 0xb
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f6                 brne8	-0xa <L2>
 d7 01                 sys	debug_break
 f0 04 20 01           ldi16	r0, 0x120
 f1 0f                 mov	r1, r7
 d4 09                 jmp8	0x9 <L4>
<L3>:
 f4 1b                 ldsp16	r7, [sp+0x6]
 f4 af                 inc16	r7
 cf 40                 cmpi.s8	r7, 0x40
 da 81 01              breq16	0x181 <L33>
<L4>:
 f4 5b                 stsp16	[sp+0x6], r7
 f4 b1                 dec16	r1
 c5 00 01              ldi16	r5, 0x100
<L5>:
 f1 21                 mov	r4, r1
 f7 0e                 ld8u	r6, [r5+]
 f4 a9                 inc16	r1
 f4 a6                 tst8	r6
 d1 f6                 brne8	-0xa <L5>
 f1 28                 mov	r6, r0
<L6>:
 04                    mov	r5, r4
 f7 17                 ld8u	r7, [r6+]
 f4 ac                 inc16	r4
 f4 a7                 tst8	r7
 d1 f7                 brne8	-0x9 <L6>
 c6 40 01              ldi16	r6, 0x140
<L7>:
 01                    mov	r4, r5
 f7 17                 ld8u	r7, [r6+]
 f4 ad                 inc16	r5
 f4 a7                 tst8	r7
 d1 f7                 brne8	-0x9 <L7>
 c6 60 01              ldi16	r6, 0x160
<L8>:
 04                    mov	r5, r4
 f7 17                 ld8u	r7, [r6+]
 f4 ac                 inc16	r4
 f4 a7                 tst8	r7
 d1 f7                 brne8	-0x9 <L8>
 c6 80 01              ldi16	r6, 0x180
<L9>:
 01                    mov	r4, r5
 f7 17                 ld8u	r7, [r6+]
 f4 ad                 inc16	r5
 f4 a7                 tst8	r7
 d1 f7                 brne8	-0x9 <L9>
 c6 a0 01              ldi16	r6, 0x1a0
<L10>:
 04                    mov	r5, r4
 f7 17                 ld8u	r7, [r6+]
 f4 ac                 inc16	r4
 f4 a7                 tst8	r7
 d1 f7                 brne8	-0x9 <L10>
 c4 c0 01              ldi16	r4, 0x1c0
<L11>:
 f1 1d                 mov	r3, r5
 f7 06                 ld8u	r6, [r4+]
 f4 ad                 inc16	r5
 f4 a6                 tst8	r6
 d1 f6                 brne8	-0xa <L11>
 c4 e0 01              ldi16	r4, 0x1e0
<L12>:
 f7 05                 ld8u	r5, [r4+]
 f4 ab                 inc16	r3
 f4 a5                 tst8	r5
 d1 f8                 brne8	-0x8 <L12>
 c0 80                 ldi8	r4, 0x80
 f0 05 02 02           ldi16	r1, 0x202
<L13>:
 ed a2 20              ld8u	r5, [r1+0]
 f4 a5                 tst8	r5
 d0 0a                 breq8	0xa <L14>
 f4 a9                 inc16	r1
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f1                 brne8	-0xf <L13>
 f2 39                 sub	r1, r1
<L14>:
 a0                    xor	r4, r4
 f6 29                 tst16	r1
 c5 02 02              ldi16	r5, 0x202
 f2 3d                 sub	r1, r5
 fb 0c                 cmov.eq	r1, r4
 c2 80                 ldi8	r6, 0x80
<L15>:
 4d                    ld8u	r7, [r5]
 cf 21                 cmpi.s8	r7, 0x21
 d0 09                 breq8	0x9 <L16>
 f4 ad                 inc16	r5
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f3                 brne8	-0xd <L15>
 04                    mov	r5, r4
<L16>:
 f6 2d                 tst16	r5
 c6 02 02              ldi16	r6, 0x202
 26                    sub	r5, r6
 fb 2c                 cmov.eq	r5, r4
 f9 36                 xor	r1, r5
 c0 80                 ldi8	r4, 0x80
 06                    mov	r5, r6
<L17>:
 49                    ld8u	r6, [r5]
 ce 42                 cmpi.s8	r6, 0x42
 d0 09                 breq8	0x9 <L18>
 f4 ad                 inc16	r5
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f3                 brne8	-0xd <L17>
 a5                    xor	r5, r5
<L18>:
 a0                    xor	r4, r4
 f6 2d                 tst16	r5
 c7 02 02              ldi16	r7, 0x202
 27                    sub	r5, r7
 fb 2c                 cmov.eq	r5, r4
 f9 36                 xor	r1, r5
 c2 80                 ldi8	r6, 0x80
 07                    mov	r5, r7
<L19>:
 4d                    ld8u	r7, [r5]
 cf 63                 cmpi.s8	r7, 0x63
 d0 09                 breq8	0x9 <L20>
 f4 ad                 inc16	r5
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f3                 brne8	-0xd <L19>
 04                    mov	r5, r4
<L20>:
 f6 2d                 tst16	r5
 c6 02 02              ldi16	r6, 0x202
 26                    sub	r5, r6
 fb 2c                 cmov.eq	r5, r4
 f9 36                 xor	r1, r5
 c0 80                 ldi8	r4, 0x80
 06                    mov	r5, r6
<L21>:
 49                    ld8u	r6, [r5]
 c3 84                 ldi8	r7, 0x84
 3b                    cmp	r6, r7
 d0 09                 breq8	0x9 <L22>
 f4 ad                 inc16	r5
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f2                 brne8	-0xe <L21>
 a5                    xor	r5, r5
<L22>:
 f2 42                 sub	r2, r2
 f6 2d                 tst16	r5
 c4 02 02              ldi16	r4, 0x202
 24                    sub	r5, r4
 fb 2a                 cmov.eq	r5, r2
 f9 36                 xor	r1, r5
 c2 80                 ldi8	r6, 0x80
 04                    mov	r5, r4
<L23>:
 4d                    ld8u	r7, [r5]
 c0 a5                 ldi8	r4, 0xa5
 3c                    cmp	r7, r4
 d0 0a                 breq8	0xa <L24>
 f4 ad                 inc16	r5
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f2                 brne8	-0xe <L23>
 f1 26                 mov	r5, r2
<L24>:
 f6 2d                 tst16	r5
 c4 02 02              ldi16	r4, 0x202
 24                    sub	r5, r4
 fb 2a                 cmov.eq	r5, r2
 f9 36                 xor	r1, r5
 c1 80                 ldi8	r5, 0x80
<L25>:
 48                    ld8u	r6, [r4]
 c3 c6                 ldi8	r7, 0xc6
 3b                    cmp	r6, r7
 d0 09                 breq8	0x9 <L26>
 f4 ac                 inc16	r4
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f2                 brne8	-0xe <L25>
 a0                    xor	r4, r4
<L26>:
 f2 42                 sub	r2, r2
 f6 2c                 tst16	r4
 c6 02 02              ldi16	r6, 0x202
 22                    sub	r4, r6
 fb 22                 cmov.eq	r4, r2
 f9 32                 xor	r1, r4
 c1 80                 ldi8	r5, 0x80
 02                    mov	r4, r6
<L27>:
 48                    ld8u	r6, [r4]
 c3 e7                 ldi8	r7, 0xe7
 3b                    cmp	r6, r7
 d0 0a                 breq8	0xa <L28>
 f4 ac                 inc16	r4
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f2                 brne8	-0xe <L27>
 f1 22                 mov	r4, r2
<L28>:
 f6 2c                 tst16	r4
 c5 02 02              ldi16	r5, 0x202
 21                    sub	r4, r5
 fb 22                 cmov.eq	r4, r2
 f9 32                 xor	r1, r4
 f9 2e                 xor	r1, r3
 f0 07 00 01           ldi16	r3, 0x100
 f1 22                 mov	r4, r2
 d4 11                 jmp8	0x11 <L31>
<L29>:
 f1 2a                 mov	r6, r2
<L30>:
 f2 0e                 add	r1, r6
 47                    ld8u	r5, [r7]
 f2 3d                 sub	r1, r5
 f0 0b 20              addi.s8	r3, 0x20
 f4 ac                 inc16	r4
 cc 07                 cmpi.s8	r4, 0x7
 da 91 fe              breq16	-0x16f <L3>
<L31>:
 0c                    mov	r7, r4
 fa 65                 lsl16i	r7, 0x5
 f2 2c                 add	r7, r0
 ed c6 20              ld8u	r6, [r3+0]
 f4 a6                 tst8	r6
 d0 e3                 breq8	-0x1d <L29>
<L32>:
 47                    ld8u	r5, [r7]
 39                    cmp	r6, r5
 d1 e1                 brne8	-0x1f <L30>
 ed ce 01              ld8u	r6, [r7-31]
 f4 af                 inc16	r7
 f4 a6                 tst8	r6
 d1 f3                 brne8	-0xd <L32>
 d4 d4                 jmp8	-0x2c <L29>
<L33>:
 f0 59 00 02           stm16	[0x200], r1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 08                 adjsp	0x8
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
