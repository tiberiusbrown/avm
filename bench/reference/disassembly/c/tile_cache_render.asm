
tile_cache_render.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f0 05 04 01           ldi16	r1, 0x104
 a0                    xor	r4, r4
 f0 02 2d              ldi8	r2, 0x2d
 c5 a3 ff              ldi16	r5, 0xffa3
 f4 41                 stsp16	[sp+0x0], r5
 f0 04 ff ff           ldi16	r0, 0xffff
 c2 01                 ldi8	r6, 0x1
<L0>:
 04                    mov	r5, r4
 f4 03                 ldsp16	r7, [sp+0x0]
 f6 37                 mul8	r5, r7
 0c                    mov	r7, r4
 8e                    and	r7, r6
 cd 18                 cmpi.s8	r5, 0x18
 fc 38                 cmov.ult	r7, r0
 f0 6d e3              st8	[r1+], r7
 f4 ac                 inc16	r4
 f4 b2                 dec16	r2
 f6 2a                 tst16	r2
 d1 ea                 brne8	-0x16 <L0>
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
<L1>:
 f4 40                 stsp16	[sp+0x0], r4
 fa 72                 lsr16i	r4, 0x2
 f0 5c 02 01           stm16	[0x102], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 5c 00 01           stm16	[0x100], r4
 d5 11                 call8	render_tile_cache
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 ac                 inc16	r4
 cc 40                 cmpi.s8	r4, 0x40
 d1 e8                 brne8	-0x18 <L1>
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<render_tile_cache>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f0 51 02 01           ldm16	r1, [0x102]
 f0 56 00 01           ldm16	r6, [0x100]
 c4 a8 0e              ldi16	r4, 0xea8
 c1 00                 ldi8	r5, 0x0
 d7 22                 sys	set_sprite
 f0 0d c1              cmpi.s8	r1, -0x3f
 de 8e 00              brslt16	0x8e <L10>
 c0 0f                 ldi8	r4, 0xf
 88                    and	r6, r4
 f2 42                 sub	r2, r2
 f1 02                 mov	r0, r2
 f2 36                 sub	r0, r6
 f2 41                 sub	r2, r1
 c7 04 01              ldi16	r7, 0x104
 f0 01 ff              ldi8	r1, 0xff
<L0>:
 4b                    ld8u	r6, [r7]
 f5 29                 cmp	r6, r1
 f1 20                 mov	r4, r0
 d0 04                 breq8	0x4 <L1>
 f1 26                 mov	r5, r2
 d7 23                 sys	draw_overwrite
<L1>:
 ed ce 21              ld8u	r6, [r7+1]
 f5 29                 cmp	r6, r1
 c8 10                 addi.s8	r4, 0x10
 d0 04                 breq8	0x4 <L2>
 f1 26                 mov	r5, r2
 d7 23                 sys	draw_overwrite
<L2>:
 ed ce 22              ld8u	r6, [r7+2]
 f5 29                 cmp	r6, r1
 c8 10                 addi.s8	r4, 0x10
 d0 04                 breq8	0x4 <L3>
 f1 26                 mov	r5, r2
 d7 23                 sys	draw_overwrite
<L3>:
 ed ce 23              ld8u	r6, [r7+3]
 f5 29                 cmp	r6, r1
 c8 10                 addi.s8	r4, 0x10
 d0 04                 breq8	0x4 <L4>
 f1 26                 mov	r5, r2
 d7 23                 sys	draw_overwrite
<L4>:
 ed ce 24              ld8u	r6, [r7+4]
 f5 29                 cmp	r6, r1
 c8 10                 addi.s8	r4, 0x10
 d0 04                 breq8	0x4 <L5>
 f1 26                 mov	r5, r2
 d7 23                 sys	draw_overwrite
<L5>:
 ed ce 25              ld8u	r6, [r7+5]
 f5 29                 cmp	r6, r1
 c8 10                 addi.s8	r4, 0x10
 d0 04                 breq8	0x4 <L6>
 f1 26                 mov	r5, r2
 d7 23                 sys	draw_overwrite
<L6>:
 ed ce 26              ld8u	r6, [r7+6]
 f5 29                 cmp	r6, r1
 c8 10                 addi.s8	r4, 0x10
 d0 04                 breq8	0x4 <L7>
 f1 26                 mov	r5, r2
 d7 23                 sys	draw_overwrite
<L7>:
 ed ce 27              ld8u	r6, [r7+7]
 f5 29                 cmp	r6, r1
 c8 10                 addi.s8	r4, 0x10
 d0 04                 breq8	0x4 <L8>
 f1 26                 mov	r5, r2
 d7 23                 sys	draw_overwrite
<L8>:
 ed ce 28              ld8u	r6, [r7+8]
 f5 29                 cmp	r6, r1
 c8 10                 addi.s8	r4, 0x10
 d0 04                 breq8	0x4 <L9>
 f1 26                 mov	r5, r2
 d7 23                 sys	draw_overwrite
<L9>:
 cb 09                 addi.s8	r7, 0x9
 f0 0e 30              cmpi.s8	r2, 0x30
 f0 0a 10              addi.s8	r2, 0x10
 d3 83                 brslt8	-0x7d <L0>
<L10>:
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
