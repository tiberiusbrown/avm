
math_cbrt.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 30                 sub	r0, r0
 d7 01                 sys	debug_break
 f0 06 c4 0e           ldi16	r2, 0xec4
 f0 03 00              ldi8	r3, 0x0
 f0 05 00 01           ldi16	r1, 0x100
<L0>:
 f1 20                 mov	r4, r0
 c1 0f                 ldi8	r5, 0xf
 81                    and	r4, r5
 10                    add	r4, r4
 10                    add	r4, r4
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 64 88              ldp32	q2, [q2]
 e1 c5 0a              call16	cbrtf
 f0 6b 82              st32	[r1], q2
 f4 a8                 inc16	r0
 f0 0c 20              cmpi.s8	r0, 0x20
 d1 e6                 brne8	-0x1a <L0>
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
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

<cbrtf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 f2 62                 mov32	q0, q2
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 aa                    xor	r6, r6
 c7 80 80              ldi16	r7, 0x8080
 f2 64                 mov32	q1, q0
 f7 67                 add32	q1, q3
 f0 69 c4              cmp32	q3, q1
 d2 07                 brult8	0x7 <L0>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 e0 b8 00              jmp16	184 <L4>
<L0>:
 c6 ff ff              ldi16	r6, 0xffff
 c3 7f                 ldi8	r7, 0x7f
 f0 69 c0              cmp32	q3, q0
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 d2 1c                 brult8	0x1c <L1>
 aa                    xor	r6, r6
 c7 80 4b              ldi16	r7, 0x4b80
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff 7f              ldi16	r5, 0x7fff
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f1 29                 mov	r6, r1
 fa 97                 lsr16i	r6, 0x7
 c4 69 ff              ldi16	r4, 0xff69
 12                    add	r4, r6
 d4 07                 jmp8	0x7 <L2>
<L1>:
 f1 21                 mov	r4, r1
 a5                    xor	r5, r5
 fa 77                 lsr16i	r4, 0x7
 c8 81                 addi.s8	r4, -0x7f
<L2>:
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 c0 7f                 ldi8	r4, 0x7f
 f9 84                 and	r4, r1
 c5 80 3f              ldi16	r5, 0x3f80
 94                    or	r5, r4
 f1 0d                 mov	r1, r5
 c2 96                 ldi8	r6, 0x96
 f4 18                 ldsp16	r4, [sp+0x6]
 18                    add	r6, r4
 c3 03                 ldi8	r7, 0x3
 ec b7                 sdiv16	r6, r7
 ca ce                 addi.s8	r6, -0x32
 c7 fd ff              ldi16	r7, 0xfffd
 f4 52                 stsp16	[sp+0x4], r6
 fe 37                 mul16	r6, r7
 18                    add	r6, r4
 f4 5a                 stsp16	[sp+0x6], r6
 aa                    xor	r6, r6
 c7 c0 bf              ldi16	r7, 0xbfc0
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 ff 15 08 74 15 cd 3a 4a c1 34 bb da ef 92 3b a5 64 17 bc c1 8e ab 3c 87 8e 67 bd 34 3e 82 3e ff 85 92 3f      fpoly	8, 0.00156466523, -0.00275810296, 0.00448415894, -0.00924030412, 0.0209420938, -0.056532409, 0.254380822, 1.14471424
 f2 66                 mov32	q1, q2
 f4 18                 ldsp16	r4, [sp+0x6]
 f6 2c                 tst16	r4
 d0 1c                 breq8	0x1c <L3>
 c6 f5 2f              ldi16	r6, 0x2ff5
 c7 cb 3f              ldi16	r7, 0x3fcb
 f0 04 18 45           ldi16	r0, 0x4518
 f0 05 a1 3f           ldi16	r1, 0x3fa1
 f4 18                 ldsp16	r4, [sp+0x6]
 cc 01                 cmpi.s8	r4, 0x1
 fb 30                 cmov.eq	r6, r0
 fb 39                 cmov.eq	r7, r1
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 f2 66                 mov32	q1, q2
<L3>:
 c6 00 80              ldi16	r6, 0x8000
 f4 09                 ldsp16	r5, [sp+0x2]
 89                    and	r6, r5
 f4 13                 ldsp16	r7, [sp+0x4]
 fa 67                 lsl16i	r7, 0x7
 f1 0f                 mov	r1, r7
 f2 30                 sub	r0, r0
 f7 61                 add32	q0, q1
 f9 c5                 or	r6, r1
 f1 20                 mov	r4, r0
 06                    mov	r5, r6
<L4>:
 d6 0a                 adjsp	0xa
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
