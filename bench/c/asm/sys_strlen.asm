
sys_strlen.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c4 63 63              ldi16	r4, 0x6363
 c5 63 63              ldi16	r5, 0x6363
 c6 0a 02              ldi16	r6, 0x20a
 f0 6b 8c              st32	[r6], q2
 f0 04 06 02           ldi16	r0, 0x206
 f0 6b 80              st32	[r0], q2
 c4 00 62              ldi16	r4, 0x6200
 a5                    xor	r5, r5
 f0 06 01 02           ldi16	r2, 0x201
 f1 2a                 mov	r6, r2
 f7 54                 st16	[r6+], r4
 59                    st8	[r6], r5
 af                    xor	r7, r7
 f0 4f 0e 02           stm8	[0x20e], r7
 f0 05 0f 02           ldi16	r1, 0x20f
 f1 21                 mov	r4, r1
 c1 64                 ldi8	r5, 0x64
 c2 20                 ldi8	r6, 0x20
 d7 11                 sys	memset
 f0 4f 2f 02           stm8	[0x22f], r7
 c4 00 01              ldi16	r4, 0x100
 c5 00 01              ldi16	r5, 0x100
 c2 65                 ldi8	r6, 0x65
<L0>:
 f6 0e                 st8	[r5+], r6
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f8                 brne8	-0x8 <L0>
 f0 4f 00 02           stm8	[0x200], r7
 d7 01                 sys	debug_break
 f1 22                 mov	r4, r2
 d7 1a                 sys	strlen
 04                    mov	r5, r4
 c4 02 02              ldi16	r4, 0x202
 d7 1a                 sys	strlen
 14                    add	r5, r4
 f1 20                 mov	r4, r0
 d7 1a                 sys	strlen
 14                    add	r5, r4
 f1 21                 mov	r4, r1
 d7 1a                 sys	strlen
 14                    add	r5, r4
 c4 00 01              ldi16	r4, 0x100
 d7 1a                 sys	strlen
 14                    add	r5, r4
 f0 5d 04 02           stm16	[0x204], r5
 d7 01                 sys	debug_break
 03                    mov	r4, r7
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
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
