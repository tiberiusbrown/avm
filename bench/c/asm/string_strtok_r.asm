
string_strtok_r.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 da                 adjsp	-0x26
 a5                    xor	r5, r5
 f4 51                 stsp16	[sp+0x4], r5
 d7 01                 sys	debug_break
 f0 04 02 01           ldi16	r0, 0x102
 f1 1d                 mov	r3, r5
<L0>:
 f4 49                 stsp16	[sp+0x2], r5
 f0 17 06              leasp	r7, 0x6
 03                    mov	r4, r7
 c5 05 01              ldi16	r5, 0x105
 c2 20                 ldi8	r6, 0x20
 d7 0f                 sys	memcpy
 f1 20                 mov	r4, r0
 f1 10                 mov	r2, r0
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 f0 16 04              leasp	r6, 0x4
 f4 43                 stsp16	[sp+0x0], r7
 03                    mov	r4, r7
 c5 03 0b              ldi16	r5, 0xb03
 e8                    callp	q0
 f1 02                 mov	r0, r2
 f6 2c                 tst16	r4
 d0 1a                 breq8	0x1a <L2>
<L1>:
 f5 32                 ld8u	r2, [r4]
 f1 20                 mov	r4, r0
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 a0                    xor	r4, r4
 f0 16 04              leasp	r6, 0x4
 c5 00 0b              ldi16	r5, 0xb00
 e8                    callp	q0
 f0 04 02 01           ldi16	r0, 0x102
 f2 1a                 add	r3, r2
 f6 2c                 tst16	r4
 d1 e6                 brne8	-0x1a <L1>
<L2>:
 f4 03                 ldsp16	r7, [sp+0x0]
 03                    mov	r4, r7
 c5 25 01              ldi16	r5, 0x125
 c2 20                 ldi8	r6, 0x20
 d7 0f                 sys	memcpy
 f1 20                 mov	r4, r0
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 f0 16 04              leasp	r6, 0x4
 03                    mov	r4, r7
 c5 03 0b              ldi16	r5, 0xb03
 e8                    callp	q0
 f6 2c                 tst16	r4
 d0 17                 breq8	0x17 <L4>
<L3>:
 f5 32                 ld8u	r2, [r4]
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 a0                    xor	r4, r4
 f0 16 04              leasp	r6, 0x4
 c5 00 0b              ldi16	r5, 0xb00
 e8                    callp	q0
 f2 1a                 add	r3, r2
 f6 2c                 tst16	r4
 d1 e9                 brne8	-0x17 <L3>
<L4>:
 f0 17 06              leasp	r7, 0x6
 03                    mov	r4, r7
 c5 45 01              ldi16	r5, 0x145
 c2 20                 ldi8	r6, 0x20
 d7 0f                 sys	memcpy
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 f0 16 04              leasp	r6, 0x4
 f4 43                 stsp16	[sp+0x0], r7
 03                    mov	r4, r7
 c5 03 0b              ldi16	r5, 0xb03
 e8                    callp	q0
 f6 2c                 tst16	r4
 d0 17                 breq8	0x17 <L6>
<L5>:
 f5 32                 ld8u	r2, [r4]
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 a0                    xor	r4, r4
 f0 16 04              leasp	r6, 0x4
 c5 00 0b              ldi16	r5, 0xb00
 e8                    callp	q0
 f2 1a                 add	r3, r2
 f6 2c                 tst16	r4
 d1 e9                 brne8	-0x17 <L5>
<L6>:
 f4 03                 ldsp16	r7, [sp+0x0]
 03                    mov	r4, r7
 c5 65 01              ldi16	r5, 0x165
 c2 20                 ldi8	r6, 0x20
 d7 0f                 sys	memcpy
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 f0 16 04              leasp	r6, 0x4
 03                    mov	r4, r7
 c5 03 0b              ldi16	r5, 0xb03
 e8                    callp	q0
 f6 2c                 tst16	r4
 d0 1a                 breq8	0x1a <L8>
 c5 00 0b              ldi16	r5, 0xb00
<L7>:
 f5 32                 ld8u	r2, [r4]
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 a0                    xor	r4, r4
 f0 16 04              leasp	r6, 0x4
 e8                    callp	q0
 c5 00 0b              ldi16	r5, 0xb00
 f2 1a                 add	r3, r2
 f6 2c                 tst16	r4
 d1 e9                 brne8	-0x17 <L7>
<L8>:
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 ad                 inc16	r5
 cd 20                 cmpi.s8	r5, 0x20
 f0 04 02 01           ldi16	r0, 0x102
 db 13 ff              brne16	-0xed <L0>
 f0 5b 00 01           stm16	[0x100], r3
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 26                 adjsp	0x26
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<strtok_r>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f6 2c                 tst16	r4
 d1 05                 brne8	0x5 <L0>
 62                    ld16	r4, [r6]
 f6 2c                 tst16	r4
 d0 57                 breq8	0x57 <L11>
<L0>:
 f5 30                 ld8u	r0, [r4]
 f4 a0                 tst8	r0
 d0 18                 breq8	0x18 <L4>
<L1>:
 0d                    mov	r7, r5
<L2>:
 f5 3d                 ld8u	r1, [r7]
 f5 08                 cmp	r1, r0
 d0 08                 breq8	0x8 <L3>
 f4 af                 inc16	r7
 f4 a1                 tst8	r1
 d1 f4                 brne8	-0xc <L2>
 d4 09                 jmp8	0x9 <L4>
<L3>:
 ed 08 21              ld8u	r0, [r4+1]
 f4 ac                 inc16	r4
 f4 a0                 tst8	r0
 d1 e8                 brne8	-0x18 <L1>
<L4>:
 f5 31                 ld8u	r1, [r4]
 f4 a1                 tst8	r1
 d0 29                 breq8	0x29 <L8>
 f1 04                 mov	r0, r4
<L5>:
 0d                    mov	r7, r5
<L6>:
 f5 3e                 ld8u	r2, [r7]
 f5 11                 cmp	r2, r1
 d0 0f                 breq8	0xf <L7>
 f4 af                 inc16	r7
 f4 a2                 tst8	r2
 d1 f4                 brne8	-0xc <L6>
 ed 20 21              ld8u	r1, [r0+1]
 f4 a8                 inc16	r0
 f4 a1                 tst8	r1
 d1 ea                 brne8	-0x16 <L5>
<L7>:
 f2 34                 sub	r0, r4
 f2 04                 add	r0, r4
 ed a0 20              ld8u	r5, [r0+0]
 f4 a5                 tst8	r5
 d0 0a                 breq8	0xa <L9>
 a5                    xor	r5, r5
 f0 6d a1              st8	[r0+], r5
 d4 04                 jmp8	0x4 <L9>
<L8>:
 a5                    xor	r5, r5
 f1 04                 mov	r0, r4
 01                    mov	r4, r5
<L9>:
 f5 58                 st16	[r6], r0
<L10>:
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret
<L11>:
 a0                    xor	r4, r4
 d4 f9                 jmp8	-0x7 <L10>

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
