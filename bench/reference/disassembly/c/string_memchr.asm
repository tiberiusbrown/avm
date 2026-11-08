
string_memchr.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f2 30                 sub	r0, r0
 d7 01                 sys	debug_break
 c5 05 01              ldi16	r5, 0x105
 c0 01                 ldi8	r4, 0x1
 21                    sub	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 c6 02 01              ldi16	r6, 0x102
 f1 08                 mov	r1, r0
 f1 10                 mov	r2, r0
<L0>:
 f0 3a 02              stsp16	[sp+0x2], r2
 f1 20                 mov	r4, r0
 f0 32 00              ldsp16	r2, [sp+0x0]
<L1>:
 f0 3a 08              stsp16	[sp+0x8], r2
 f4 68                 stsp16	[sp+0xa], r4
 f1 04                 mov	r0, r4
 f2 05                 add	r0, r5
 02                    mov	r4, r6
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 c2 20                 ldi8	r6, 0x20
 f1 20                 mov	r4, r0
 c1 61                 ldi8	r5, 0x61
 e9                    callp	q1
 f4 58                 stsp16	[sp+0x6], r4
 c4 02 01              ldi16	r4, 0x102
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 c1 ff                 ldi8	r5, 0xff
 f1 20                 mov	r4, r0
 c2 20                 ldi8	r6, 0x20
 e9                    callp	q1
 f4 50                 stsp16	[sp+0x4], r4
 c4 02 01              ldi16	r4, 0x102
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 f1 20                 mov	r4, r0
 f2 30                 sub	r0, r0
 f1 24                 mov	r5, r0
 c2 20                 ldi8	r6, 0x20
 e9                    callp	q1
 f0 32 08              ldsp16	r2, [sp+0x8]
 f1 26                 mov	r5, r2
 14                    add	r5, r4
 f6 2c                 tst16	r4
 fb 28                 cmov.eq	r5, r0
 f1 22                 mov	r4, r2
 f4 12                 ldsp16	r6, [sp+0x4]
 12                    add	r4, r6
 f6 2e                 tst16	r6
 fb 20                 cmov.eq	r4, r0
 f1 2a                 mov	r6, r2
 f4 1b                 ldsp16	r7, [sp+0x6]
 1b                    add	r6, r7
 f6 2f                 tst16	r7
 fb 30                 cmov.eq	r6, r0
 f2 0e                 add	r1, r6
 c6 02 01              ldi16	r6, 0x102
 f2 0c                 add	r1, r4
 f2 0d                 add	r1, r5
 c5 05 01              ldi16	r5, 0x105
 f0 0a e0              addi.s8	r2, -0x20
 f4 28                 ldsp16	r4, [sp+0xa]
 c8 20                 addi.s8	r4, 0x20
 f4 68                 stsp16	[sp+0xa], r4
 c0 80                 ldi8	r4, 0x80
 f4 2b                 ldsp16	r7, [sp+0xa]
 3c                    cmp	r7, r4
 03                    mov	r4, r7
 d1 90                 brne8	-0x70 <L1>
 f0 32 02              ldsp16	r2, [sp+0x2]
 f4 aa                 inc16	r2
 f0 0e 20              cmpi.s8	r2, 0x20
 db 7d ff              brne16	-0x83 <L0>
 f0 59 00 01           stm16	[0x100], r1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<memchr>:
 f6 2e                 tst16	r6
 d0 0e                 breq8	0xe <L1>
 f1 75                 zext8	r5
<L0>:
 4c                    ld8u	r7, [r4]
 3d                    cmp	r7, r5
 d0 09                 breq8	0x9 <L2>
 f4 ac                 inc16	r4
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f4                 brne8	-0xc <L0>
<L1>:
 a0                    xor	r4, r4
<L2>:
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
