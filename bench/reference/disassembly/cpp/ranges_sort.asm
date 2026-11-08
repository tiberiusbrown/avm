
ranges_sort.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fd                 adjsp	-0x3
 f2 39                 sub	r1, r1
 f0 53 00 01           ldm16	r3, [0x100]
 d7 01                 sys	debug_break
 f0 04 04 01           ldi16	r0, 0x104
 f1 11                 mov	r2, r1
<L0>:
 f0 39 00              stsp16	[sp+0x0], r1
 c0 03                 ldi8	r4, 0x3
 f9 30                 and	r1, r4
 f1 24                 mov	r5, r0
 c2 3f                 ldi8	r6, 0x3f
 af                    xor	r7, r7
 c0 6d                 ldi8	r4, 0x6d
 fe 1c                 mul16	r3, r4
 f0 0b 59              addi.s8	r3, 0x59
 f4 a1                 tst8	r1
 f1 07                 mov	r0, r7
 d1 17                 brne8	0x17 <L2>
<L1>:
 f7 48                 st16	[r5+], r0
 f4 af                 inc16	r7
 f6 2e                 tst16	r6
 f4 b6                 dec16	r6
 d0 22                 breq8	0x22 <L3>
 c0 6d                 ldi8	r4, 0x6d
 fe 1c                 mul16	r3, r4
 f0 0b 59              addi.s8	r3, 0x59
 f4 a1                 tst8	r1
 f1 07                 mov	r0, r7
 d0 e9                 breq8	-0x17 <L1>
<L2>:
 f0 0d 01              cmpi.s8	r1, 0x1
 f1 06                 mov	r0, r6
 d0 e2                 breq8	-0x1e <L1>
 c0 1f                 ldi8	r4, 0x1f
 f9 8c                 and	r4, r3
 f0 00 07              ldi8	r0, 0x7
 f0 0d 02              cmpi.s8	r1, 0x2
 fb 04                 cmov.eq	r0, r4
 d4 d4                 jmp8	-0x2c <L1>
<L3>:
 f0 16 02              leasp	r6, 0x2
 f0 04 04 01           ldi16	r0, 0x104
 f1 20                 mov	r4, r0
 c5 84 01              ldi16	r5, 0x184
 d5 28                 call8	_ZNSt3__115__sort_dispatchB11n240000in23INS_15_RangeAlgPolicyEPiNS_7greaterIvEEEEvT0_S5_RT1_
 c0 01                 ldi8	r4, 0x1
 f1 24                 mov	r5, r0
<L4>:
 f7 2e                 ld16	r6, [r5+]
 fe 34                 mul16	r6, r4
 f2 16                 add	r2, r6
 f4 ac                 inc16	r4
 cc 41                 cmpi.s8	r4, 0x41
 d1 f4                 brne8	-0xc <L4>
 f0 31 00              ldsp16	r1, [sp+0x0]
 f4 a9                 inc16	r1
 f0 0d 18              cmpi.s8	r1, 0x18
 d1 93                 brne8	-0x6d <L0>
 f0 5a 02 01           stm16	[0x102], r2
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 03                 adjsp	0x3
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<void std::__1::__sort_dispatch[abi:n240000in23]<std::__1::_RangeAlgPolicy, int*, std::__1::greater<void>>(int*, int*, std::__1::greater<void>&)>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 24                    sub	r5, r4
 f4 95                 asr16.1	r5
 cd 02                 cmpi.s8	r5, 0x2
 de a0 00              brslt16	0xa0 <L8>
 c2 02                 ldi8	r6, 0x2
 f1 1d                 mov	r3, r5
 ec 9e                 sdiv16	r3, r6
 f1 2b                 mov	r6, r3
 d4 08                 jmp8	0x8 <L1>
<L0>:
 f4 02                 ldsp16	r6, [sp+0x0]
 ce 02                 cmpi.s8	r6, 0x2
 f4 0a                 ldsp16	r6, [sp+0x2]
 d3 42                 brslt8	0x42 <L5>
<L1>:
 f4 42                 stsp16	[sp+0x0], r6
 f4 b6                 dec16	r6
 f4 4a                 stsp16	[sp+0x2], r6
<L2>:
 1a                    add	r6, r6
 f1 06                 mov	r0, r6
 c3 01                 ldi8	r7, 0x1
 f9 1d                 or	r0, r7
 f1 0e                 mov	r1, r6
 f0 09 02              addi.s8	r1, 0x2
 f5 0d                 cmp	r1, r5
 d9 0d                 brsge8	0xd <L3>
 f1 2c                 mov	r7, r0
 1f                    add	r7, r7
 1c                    add	r7, r4
 f5 4e                 ld16	r2, [r7]
 ed fe 22              ld16	r7, [r7+2]
 f5 2e                 cmp	r7, r2
 fd 01                 cmov.slt	r0, r1
<L3>:
 18                    add	r6, r4
 f1 2c                 mov	r7, r0
 1f                    add	r7, r7
 1c                    add	r7, r4
 f5 4e                 ld16	r2, [r7]
 f5 49                 ld16	r1, [r6]
 f5 11                 cmp	r2, r1
 d9 c8                 brsge8	-0x38 <L0>
 f5 5a                 st16	[r6], r2
 f5 5d                 st16	[r7], r1
 f5 03                 cmp	r0, r3
 f1 28                 mov	r6, r0
 d3 cc                 brslt8	-0x34 <L2>
 d4 bc                 jmp8	-0x44 <L0>
<L4>:
 f4 0a                 ldsp16	r6, [sp+0x2]
 ce 03                 cmpi.s8	r6, 0x3
 d3 4c                 brslt8	0x4c <L8>
<L5>:
 f4 49                 stsp16	[sp+0x2], r5
 f4 b5                 dec16	r5
 09                    mov	r6, r5
 1a                    add	r6, r6
 18                    add	r6, r4
 6e                    ld16	r7, [r6]
 f5 40                 ld16	r0, [r4]
 73                    st16	[r4], r7
 f5 58                 st16	[r6], r0
 f1 1d                 mov	r3, r5
 f4 8b                 lsr16.1	r3
 f6 2b                 tst16	r3
 d0 e5                 breq8	-0x1b <L4>
 aa                    xor	r6, r6
<L6>:
 1a                    add	r6, r6
 f1 0e                 mov	r1, r6
 c3 01                 ldi8	r7, 0x1
 f9 3d                 or	r1, r7
 f1 06                 mov	r0, r6
 f0 08 02              addi.s8	r0, 0x2
 f5 05                 cmp	r0, r5
 d9 0d                 brsge8	0xd <L7>
 f1 2d                 mov	r7, r1
 1f                    add	r7, r7
 1c                    add	r7, r4
 f5 4e                 ld16	r2, [r7]
 ed fe 22              ld16	r7, [r7+2]
 f5 2e                 cmp	r7, r2
 fd 08                 cmov.slt	r1, r0
<L7>:
 18                    add	r6, r4
 f1 2d                 mov	r7, r1
 1f                    add	r7, r7
 1c                    add	r7, r4
 f5 4e                 ld16	r2, [r7]
 f5 48                 ld16	r0, [r6]
 f5 10                 cmp	r2, r0
 d9 ba                 brsge8	-0x46 <L4>
 f5 5a                 st16	[r6], r2
 f5 5c                 st16	[r7], r0
 f5 0b                 cmp	r1, r3
 f1 29                 mov	r6, r1
 d3 cc                 brslt8	-0x34 <L6>
 d4 ae                 jmp8	-0x52 <L4>
<L8>:
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
