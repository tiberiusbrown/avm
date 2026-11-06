
bounded_multiply.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b1                    push16	r1
 b0                    push16	r0
 f2 30                 sub	r0, r0
 d7 01                 sys	debug_break
 f1 08                 mov	r1, r0
 d4 0a                 jmp8	0xa <L1>
<L0>:
 f1 0c                 mov	r1, r4
 f4 a8                 inc16	r0
 f0 0c 10              cmpi.s8	r0, 0x10
 da a4 00              breq16	0xa4 <L17>
<L1>:
 f0 45 00 01           ldm8u	r5, [0x100]
 f4 a5                 tst8	r5
 d0 10                 breq8	0x10 <L2>
 01                    mov	r4, r5
 f4 b4                 dec16	r4
 f2 0c                 add	r1, r4
 c9 fe                 addi.s8	r5, -0x2
 e1 4c 0b              call16	__avm_umulhisi3
 f7 82                 lsr32.1	q2
 f2 21                 add	r4, r1
 d4 02                 jmp8	0x2 <L3>
<L2>:
 f1 21                 mov	r4, r1
<L3>:
 f0 45 00 01           ldm8u	r5, [0x100]
 f4 a5                 tst8	r5
 d0 0a                 breq8	0xa <L5>
 aa                    xor	r6, r6
<L4>:
 c3 12                 ldi8	r7, 0x12
 ae                    xor	r7, r6
 13                    add	r4, r7
 f4 ae                 inc16	r6
 39                    cmp	r6, r5
 d1 f7                 brne8	-0x9 <L4>
<L5>:
 f0 45 00 01           ldm8u	r5, [0x100]
 f4 a5                 tst8	r5
 d0 0a                 breq8	0xa <L7>
 aa                    xor	r6, r6
<L6>:
 c3 24                 ldi8	r7, 0x24
 ae                    xor	r7, r6
 13                    add	r4, r7
 f4 ae                 inc16	r6
 39                    cmp	r6, r5
 d1 f7                 brne8	-0x9 <L6>
<L7>:
 f0 45 00 01           ldm8u	r5, [0x100]
 f4 a5                 tst8	r5
 d0 0a                 breq8	0xa <L9>
 aa                    xor	r6, r6
<L8>:
 c3 36                 ldi8	r7, 0x36
 ae                    xor	r7, r6
 13                    add	r4, r7
 f4 ae                 inc16	r6
 39                    cmp	r6, r5
 d1 f7                 brne8	-0x9 <L8>
<L9>:
 f0 45 00 01           ldm8u	r5, [0x100]
 f4 a5                 tst8	r5
 d0 0a                 breq8	0xa <L11>
 aa                    xor	r6, r6
<L10>:
 c3 48                 ldi8	r7, 0x48
 ae                    xor	r7, r6
 13                    add	r4, r7
 f4 ae                 inc16	r6
 39                    cmp	r6, r5
 d1 f7                 brne8	-0x9 <L10>
<L11>:
 f0 45 00 01           ldm8u	r5, [0x100]
 f4 a5                 tst8	r5
 d0 0a                 breq8	0xa <L13>
 aa                    xor	r6, r6
<L12>:
 c3 5a                 ldi8	r7, 0x5a
 ae                    xor	r7, r6
 13                    add	r4, r7
 f4 ae                 inc16	r6
 39                    cmp	r6, r5
 d1 f7                 brne8	-0x9 <L12>
<L13>:
 f0 45 00 01           ldm8u	r5, [0x100]
 f4 a5                 tst8	r5
 d0 0a                 breq8	0xa <L15>
 aa                    xor	r6, r6
<L14>:
 c3 6c                 ldi8	r7, 0x6c
 ae                    xor	r7, r6
 13                    add	r4, r7
 f4 ae                 inc16	r6
 39                    cmp	r6, r5
 d1 f7                 brne8	-0x9 <L14>
<L15>:
 f0 45 00 01           ldm8u	r5, [0x100]
 f4 a5                 tst8	r5
 da 67 ff              breq16	-0x99 <L0>
 aa                    xor	r6, r6
 f1 0c                 mov	r1, r4
<L16>:
 c0 7e                 ldi8	r4, 0x7e
 a2                    xor	r4, r6
 f2 0c                 add	r1, r4
 f4 ae                 inc16	r6
 39                    cmp	r6, r5
 d1 f6                 brne8	-0xa <L16>
 f4 a8                 inc16	r0
 f0 0c 10              cmpi.s8	r0, 0x10
 db 5c ff              brne16	-0xa4 <L1>
<L17>:
 f0 59 01 01           stm16	[0x101], r1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
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
