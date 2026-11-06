
progmem_widen_ldp32_bytes.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b1                    push16	r1
 b0                    push16	r0
 d7 01                 sys	debug_break
 f0 04 7e 0e           ldi16	r0, 0xe7e
 f0 01 00              ldi8	r1, 0x0
 c2 80                 ldi8	r6, 0x80
 f2 68                 mov32	q2, q0
 d5 21                 call8	sum_bytes
 f0 5c 00 01           stm16	[0x100], r4
 c2 82                 ldi8	r6, 0x82
 f2 68                 mov32	q2, q0
 d5 17                 call8	sum_bytes
 f0 5c 02 01           stm16	[0x102], r4
 c4 7f 0e              ldi16	r4, 0xe7f
 c1 00                 ldi8	r5, 0x0
 c2 7f                 ldi8	r6, 0x7f
 d5 0a                 call8	sum_bytes
 f0 5c 04 01           stm16	[0x104], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<sum_bytes>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 a0                    xor	r4, r4
 c1 01                 ldi8	r5, 0x1
 f4 5a                 stsp16	[sp+0x6], r6
 86                    and	r5, r6
 f4 41                 stsp16	[sp+0x0], r5
 f1 0c                 mov	r1, r4
<L0>:
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 a5                 tst8	r5
 d1 17                 brne8	0x17 <L1>
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
 f1 24                 mov	r5, r0
 c9 fe                 addi.s8	r5, -0x2
 0d                    mov	r7, r5
 c2 02                 ldi8	r6, 0x2
 8e                    and	r7, r6
 f4 a7                 tst8	r7
 d1 3f                 brne8	0x3f <L3>
 d4 1b                 jmp8	0x1b <L2>
<L1>:
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
 f0 65 a4              ldp8u	r5, [q1+]
 11                    add	r4, r5
 f0 30 06              ldsp16	r0, [sp+0x6]
 f4 b0                 dec16	r0
 f1 24                 mov	r5, r0
 c9 fe                 addi.s8	r5, -0x2
 0d                    mov	r7, r5
 c2 02                 ldi8	r6, 0x2
 8e                    and	r7, r6
 f4 a7                 tst8	r7
 d1 22                 brne8	0x22 <L3>
<L2>:
 f0 66 c4              ldp16	r6, [q1+]
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 13                    add	r4, r7
 fa 98                 lsr16i	r6, 0x8
 18                    add	r6, r4
 f0 08 fe              addi.s8	r0, -0x2
 02                    mov	r4, r6
 cd 02                 cmpi.s8	r5, 0x2
 d8 15                 bruge8	0x15 <L4>
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 10                    add	r4, r4
 91                    or	r4, r5
 f9 86                 xor	r4, r1
 f4 a9                 inc16	r1
 f0 0d 08              cmpi.s8	r1, 0x8
 d1 a8                 brne8	-0x58 <L0>
 d4 2e                 jmp8	0x2e <L6>
<L3>:
 08                    mov	r6, r4
 cd 02                 cmpi.s8	r5, 0x2
 d2 1a                 brult8	0x1a <L5>
<L4>:
 f0 68 84              ldp32	q2, [q1+]
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 1b                    add	r6, r7
 fa 78                 lsr16i	r4, 0x8
 12                    add	r4, r6
 09                    mov	r6, r5
 f1 76                 zext8	r6
 18                    add	r6, r4
 fa 88                 lsr16i	r5, 0x8
 16                    add	r5, r6
 f0 08 fc              addi.s8	r0, -0x4
 f6 28                 tst16	r0
 01                    mov	r4, r5
 09                    mov	r6, r5
 d1 e6                 brne8	-0x1a <L4>
<L5>:
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 10                    add	r4, r4
 91                    or	r4, r5
 f9 86                 xor	r4, r1
 f4 a9                 inc16	r1
 f0 0d 08              cmpi.s8	r1, 0x8
 db 78 ff              brne16	-0x88 <L0>
<L6>:
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
