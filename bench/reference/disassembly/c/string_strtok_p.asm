
string_strtok_p.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d0                 adjsp	-0x30
 a5                    xor	r5, r5
 d7 01                 sys	debug_break
 f0 06 02 01           ldi16	r2, 0x102
 c6 6c 0f              ldi16	r6, 0xf6c
 c3 00                 ldi8	r7, 0x0
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 c6 6f 0f              ldi16	r6, 0xf6f
 c3 00                 ldi8	r7, 0x0
 f1 05                 mov	r0, r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
<L0>:
 f4 69                 stsp16	[sp+0xa], r5
 f0 11 10              leasp	r1, 0x10
 f1 21                 mov	r4, r1
 c5 05 01              ldi16	r5, 0x105
 c2 20                 ldi8	r6, 0x20
 d7 0f                 sys	memcpy
 f1 22                 mov	r4, r2
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 39 08              stsp16	[sp+0x8], r1
 f1 21                 mov	r4, r1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f1 0a                 mov	r1, r2
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 e9                    callp	q1
 f1 11                 mov	r2, r1
 f6 2c                 tst16	r4
 d0 18                 breq8	0x18 <L2>
<L1>:
 f5 31                 ld8u	r1, [r4]
 f1 22                 mov	r4, r2
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 a0                    xor	r4, r4
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e9                    callp	q1
 f0 06 02 01           ldi16	r2, 0x102
 f2 01                 add	r0, r1
 f6 2c                 tst16	r4
 d1 e8                 brne8	-0x18 <L1>
<L2>:
 f4 23                 ldsp16	r7, [sp+0x8]
 03                    mov	r4, r7
 c5 25 01              ldi16	r5, 0x125
 c2 20                 ldi8	r6, 0x20
 d7 0f                 sys	memcpy
 f1 22                 mov	r4, r2
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 03                    mov	r4, r7
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 e9                    callp	q1
 f6 2c                 tst16	r4
 d0 15                 breq8	0x15 <L4>
<L3>:
 f5 31                 ld8u	r1, [r4]
 c4 02 01              ldi16	r4, 0x102
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 a0                    xor	r4, r4
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e9                    callp	q1
 f2 01                 add	r0, r1
 f6 2c                 tst16	r4
 d1 eb                 brne8	-0x15 <L3>
<L4>:
 f0 17 10              leasp	r7, 0x10
 03                    mov	r4, r7
 c5 45 01              ldi16	r5, 0x145
 c2 20                 ldi8	r6, 0x20
 d7 0f                 sys	memcpy
 c4 02 01              ldi16	r4, 0x102
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 f4 63                 stsp16	[sp+0x8], r7
 03                    mov	r4, r7
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 e9                    callp	q1
 f6 2c                 tst16	r4
 d0 15                 breq8	0x15 <L6>
<L5>:
 f5 31                 ld8u	r1, [r4]
 c4 02 01              ldi16	r4, 0x102
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 a0                    xor	r4, r4
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e9                    callp	q1
 f2 01                 add	r0, r1
 f6 2c                 tst16	r4
 d1 eb                 brne8	-0x15 <L5>
<L6>:
 f4 23                 ldsp16	r7, [sp+0x8]
 03                    mov	r4, r7
 c5 65 01              ldi16	r5, 0x165
 c2 20                 ldi8	r6, 0x20
 d7 0f                 sys	memcpy
 c4 02 01              ldi16	r4, 0x102
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 03                    mov	r4, r7
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 e9                    callp	q1
 f6 2c                 tst16	r4
 d0 15                 breq8	0x15 <L8>
<L7>:
 f5 31                 ld8u	r1, [r4]
 c4 02 01              ldi16	r4, 0x102
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 a0                    xor	r4, r4
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e9                    callp	q1
 f2 01                 add	r0, r1
 f6 2c                 tst16	r4
 d1 eb                 brne8	-0x15 <L7>
<L8>:
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 ad                 inc16	r5
 cd 20                 cmpi.s8	r5, 0x20
 f0 06 02 01           ldi16	r2, 0x102
 db 1a ff              brne16	-0xe6 <L0>
 f0 58 00 01           stm16	[0x100], r0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 30                 adjsp	0x30
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<strtok_P>:
 d6 fe                 adjsp	-0x2
 c5 85 01              ldi16	r5, 0x185
 f4 41                 stsp16	[sp+0x0], r5
 f1 77                 zext8	r7
 d5 08                 call8	strtok_rP
 d6 02                 adjsp	0x2
 ef                    ret

<memset>:
 0c                    mov	r7, r4
 d7 11                 sys	memset
 03                    mov	r4, r7
 ef                    ret

<strtok_rP>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 37 13              ldsp16	r7, [sp+0x13]
 f6 2c                 tst16	r4
 d1 05                 brne8	0x5 <L0>
 63                    ld16	r4, [r7]
 f6 2c                 tst16	r4
 d0 36                 breq8	0x36 <L4>
<L0>:
 44                    ld8u	r5, [r4]
 f4 a5                 tst8	r5
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f4 4b                 stsp16	[sp+0x2], r7
 d0 2f                 breq8	0x2f <L6>
<L1>:
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
<L2>:
 f0 60 c4              ldp8u	r6, [q1]
 39                    cmp	r6, r5
 d0 08                 breq8	0x8 <L3>
 f7 64                 add32	q1, q0
 f4 a6                 tst8	r6
 d1 f4                 brne8	-0xc <L2>
 d4 1b                 jmp8	0x1b <L6>
<L3>:
 f1 73                 zext8	r3
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 d0 10                 breq8	0x10 <L5>
 ed a8 21              ld8u	r5, [r4+1]
 f4 ac                 inc16	r4
 f4 a5                 tst8	r5
 f4 0b                 ldsp16	r7, [sp+0x2]
 d1 d8                 brne8	-0x28 <L1>
 d4 05                 jmp8	0x5 <L6>
<L4>:
 a5                    xor	r5, r5
 d4 46                 jmp8	0x46 <L15>
<L5>:
 f4 0b                 ldsp16	r7, [sp+0x2]
<L6>:
 f5 32                 ld8u	r2, [r4]
 f4 a2                 tst8	r2
 d0 3c                 breq8	0x3c <L13>
 f4 40                 stsp16	[sp+0x0], r4
 d4 14                 jmp8	0x14 <L9>
<L7>:
 f1 77                 zext8	r7
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 c4              cmp32	q3, q1
 d1 1c                 brne8	0x1c <L11>
<L8>:
 ed 48 21              ld8u	r2, [r4+1]
 f4 ac                 inc16	r4
 f4 a2                 tst8	r2
 d0 13                 breq8	0x13 <L11>
<L9>:
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
<L10>:
 f0 60 ac              ldp8u	r5, [q3]
 f5 26                 cmp	r5, r2
 d0 e1                 breq8	-0x1f <L7>
 f7 6c                 add32	q3, q0
 f4 a5                 tst8	r5
 d1 f3                 brne8	-0xd <L10>
 d4 e4                 jmp8	-0x1c <L8>
<L11>:
 f4 02                 ldsp16	r6, [sp+0x0]
 22                    sub	r4, r6
 12                    add	r4, r6
 44                    ld8u	r5, [r4]
 f4 a5                 tst8	r5
 d0 03                 breq8	0x3 <L12>
 a5                    xor	r5, r5
 f6 05                 st8	[r4+], r5
<L12>:
 06                    mov	r5, r6
 f4 0b                 ldsp16	r7, [sp+0x2]
 d4 01                 jmp8	0x1 <L14>
<L13>:
 a5                    xor	r5, r5
<L14>:
 7c                    st16	[r7], r4
<L15>:
 01                    mov	r4, r5
 d6 08                 adjsp	0x8
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
