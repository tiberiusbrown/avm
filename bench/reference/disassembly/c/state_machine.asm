
state_machine.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 c0 80                 ldi8	r4, 0x80
 c1 0b                 ldi8	r5, 0xb
 c6 02 01              ldi16	r6, 0x102
<L0>:
 f6 15                 st8	[r6+], r5
 c9 25                 addi.s8	r5, 0x25
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f6                 brne8	-0xa <L0>
 f2 42                 sub	r2, r2
 d7 01                 sys	debug_break
 f1 26                 mov	r5, r2
 f1 22                 mov	r4, r2
 f0 01 03              ldi8	r1, 0x3
 d4 08                 jmp8	0x8 <L2>
<L1>:
 f4 aa                 inc16	r2
 f0 0e 40              cmpi.s8	r2, 0x40
 da 8f 00              breq16	0x8f <L8>
<L2>:
 f0 07 02 01           ldi16	r3, 0x102
 c2 80                 ldi8	r6, 0x80
 d4 13                 jmp8	0x13 <L4>
<L3>:
 07                    mov	r5, r7
 fa 85                 lsr16i	r5, 0x5
 c0 03                 ldi8	r4, 0x3
 81                    and	r4, r5
 c1 05                 ldi8	r5, 0x5
 f3 1d                 mulu8.w	r7, r5
 f4 01                 ldsp16	r5, [sp+0x0]
 17                    add	r5, r7
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d0 dd                 breq8	-0x23 <L1>
<L4>:
 f0 6c e7              ld8u	r7, [r3+]
 f1 74                 zext8	r4
 cc 02                 cmpi.s8	r4, 0x2
 d9 20                 brsge8	0x20 <L5>
 f4 a4                 tst8	r4
 d0 3d                 breq8	0x3d <L6>
 f4 41                 stsp16	[sp+0x0], r5
 cc 01                 cmpi.s8	r4, 0x1
 d1 da                 brne8	-0x26 <L3>
 f0 00 a0              ldi8	r0, 0xa0
 a0                    xor	r4, r4
 f5 07                 cmp	r0, r7
 fc 21                 cmov.ult	r4, r1
 1f                    add	r7, r7
 1f                    add	r7, r7
 1f                    add	r7, r7
 f4 01                 ldsp16	r5, [sp+0x0]
 a7                    xor	r5, r7
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 d9                 brne8	-0x27 <L4>
 d4 b4                 jmp8	-0x4c <L1>
<L5>:
 f4 41                 stsp16	[sp+0x0], r5
 cc 02                 cmpi.s8	r4, 0x2
 d0 2d                 breq8	0x2d <L7>
 cc 03                 cmpi.s8	r4, 0x3
 d1 ba                 brne8	-0x46 <L3>
 c0 04                 ldi8	r4, 0x4
 a5                    xor	r5, r5
 f4 a7                 tst8	r7
 fb 25                 cmov.eq	r4, r5
 f4 03                 ldsp16	r7, [sp+0x0]
 07                    mov	r5, r7
 fa 8f                 lsr16i	r5, 0xf
 1f                    add	r7, r7
 9d                    or	r7, r5
 07                    mov	r5, r7
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 b8                 brne8	-0x48 <L4>
 d4 93                 jmp8	-0x6d <L1>
<L6>:
 17                    add	r5, r7
 f0 00 01              ldi8	r0, 0x1
 f9 1c                 and	r0, r7
 c0 02                 ldi8	r4, 0x2
 f2 50                 sub	r4, r0
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 a6                 brne8	-0x5a <L4>
 d4 81                 jmp8	-0x7f <L1>
<L7>:
 c1 30                 ldi8	r5, 0x30
 87                    and	r5, r7
 c0 01                 ldi8	r4, 0x1
 f0 00 04              ldi8	r0, 0x4
 cd 30                 cmpi.s8	r5, 0x30
 fb 20                 cmov.eq	r4, r0
 f4 01                 ldsp16	r5, [sp+0x0]
 27                    sub	r5, r7
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 8f                 brne8	-0x71 <L4>
 e0 69 ff              jmp16	-151 <L1>
<L8>:
 f1 74                 zext8	r4
 a4                    xor	r5, r4
 f0 5d 00 01           stm16	[0x100], r5
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 02                 adjsp	0x2
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
