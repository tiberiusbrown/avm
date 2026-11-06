
malloc.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 malloc.c
00000000 l    d  .text.malloc	00000000 .text.malloc
00000000 l     O .data.heap_top	00000002 heap_top
00000000 l    d  .text.free	00000000 .text.free
00000000 l    d  .text.coalesce	00000000 .text.coalesce
00000000 l     F .text.coalesce	0000006c coalesce
00000000 l    d  .text.realloc	00000000 .text.realloc
00000000 l    d  .text.aligned_alloc	00000000 .text.aligned_alloc
00000000 l    d  .text.free_sized	00000000 .text.free_sized
00000000 l    d  .text.free_aligned_sized	00000000 .text.free_aligned_sized
00000000 l    d  .text.calloc	00000000 .text.calloc
00000000 l    d  .data.heap_top	00000000 .data.heap_top
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.malloc	00000091 malloc
00000000         *UND*	00000000 __avm_heap_start
00000000 g     F .text.free	00000073 free
00000000 g     F .text.realloc	000003a0 realloc
00000000 g     F .text.aligned_alloc	00000096 aligned_alloc
00000000 g     F .text.free_sized	00000073 free_sized
00000000 g     F .text.free_aligned_sized	00000073 free_aligned_sized
00000000 g     F .text.calloc	000000e8 calloc
00000000         *UND*	00000000 __avm_umulhisi3
00000000         *UND*	00000000 memset

Disassembly of section .text.malloc:

<malloc>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c5 01 fc              ldi16	r5, 0xfc01
 14                    add	r5, r4
 f2 30                 sub	r0, r0
 c6 02 fc              ldi16	r6, 0xfc02
 36                    cmp	r5, r6
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	malloc
		R_AVM_FAR24	.text.malloc+0x8b
<L0>:
 c8 02                 addi.s8	r4, 0x2
 f0 52 00 00           ldm16	r2, [0x0]
		R_AVM_DATA16	.data.heap_top
 c5 00 00              ldi16	r5, 0x0
		R_AVM_DATA16	__avm_heap_start
 f6 2a                 tst16	r2
 fb 15                 cmov.eq	r2, r5
 f5 26                 cmp	r5, r2
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	malloc
		R_AVM_FAR24	.text.malloc+0x63
<L1>:
 c7 00 00              ldi16	r7, 0x0
		R_AVM_DATA16	__avm_heap_start
 f0 05 ff 7f           ldi16	r1, 0x7fff
 e2 00 00 00           jmpf	malloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.malloc+0x3c
 1d                    add	r7, r5
 f5 2e                 cmp	r7, r2
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	malloc
		R_AVM_FAR24	.text.malloc+0x63
<L2>:
 6b                    ld16	r6, [r7]
 06                    mov	r5, r6
 f9 a4                 and	r5, r1
 f6 2e                 tst16	r6
 d9 04                 brsge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	malloc
		R_AVM_FAR24	.text.malloc+0x33
<L3>:
 34                    cmp	r5, r4
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	malloc
		R_AVM_FAR24	.text.malloc+0x33
<L4>:
 24                    sub	r5, r4
 cd 03                 cmpi.s8	r5, 0x3
 d8 04                 bruge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	malloc
		R_AVM_FAR24	.text.malloc+0x82
<L5>:
 c6 00 80              ldi16	r6, 0x8000
 98                    or	r6, r4
 7e                    st16	[r7], r6
 13                    add	r4, r7
 71                    st16	[r4], r5
 e2 00 00 00           jmpf	malloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.malloc+0x87
 c5 00 05              ldi16	r5, 0x500
 f2 56                 sub	r5, r2
 34                    cmp	r5, r4
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	malloc
		R_AVM_FAR24	.text.malloc+0x8b
<L6>:
 c5 00 80              ldi16	r5, 0x8000
 94                    or	r5, r4
 f1 02                 mov	r0, r2
 f0 6d b1              st16	[r0+], r5
 f2 14                 add	r2, r4
 f0 5a 00 00           stm16	[0x0], r2
		R_AVM_DATA16	.data.heap_top
 e2 00 00 00           jmpf	malloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.malloc+0x8b
 c4 00 80              ldi16	r4, 0x8000
 98                    or	r6, r4
 7e                    st16	[r7], r6
 cb 02                 addi.s8	r7, 0x2
 f1 07                 mov	r0, r7
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

Disassembly of section .text.free:

<free>:
 b1                    push16	r1
 b0                    push16	r0
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	free
		R_AVM_FAR24	.text.free+0x70
<L0>:
 ed b8 1e              ld16	r5, [r4-2]
 c6 ff 7f              ldi16	r6, 0x7fff
 f1 06                 mov	r0, r6
 86                    and	r5, r6
 ee b8 1e              st16	[r4-2], r5
 f0 51 00 00           ldm16	r1, [0x0]
		R_AVM_DATA16	.data.heap_top
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	__avm_heap_start
 f5 21                 cmp	r4, r1
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	free
		R_AVM_FAR24	.text.free+0x70
<L1>:
 e2 00 00 00           jmpf	free
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.free+0x32
 11                    add	r4, r5
 f5 21                 cmp	r4, r1
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	free
		R_AVM_FAR24	.text.free+0x70
<L2>:
 64                    ld16	r5, [r4]
 f6 2d                 tst16	r5
 f9 a0                 and	r5, r0
 d9 04                 brsge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	free
		R_AVM_FAR24	.text.free+0x29
<L3>:
 0d                    mov	r7, r5
 1c                    add	r7, r4
 f5 2d                 cmp	r7, r1
 d2 04                 brult8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	free
		R_AVM_FAR24	.text.free+0x5b
<L4>:
 6b                    ld16	r6, [r7]
 f6 2e                 tst16	r6
 d9 04                 brsge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	free
		R_AVM_FAR24	.text.free+0x5b
<L5>:
 16                    add	r5, r6
 0d                    mov	r7, r5
 1c                    add	r7, r4
 f5 2d                 cmp	r7, r1
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	free
		R_AVM_FAR24	.text.free+0x47
<L6>:
 f5 2d                 cmp	r7, r1
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	free
		R_AVM_FAR24	.text.free+0x6c
<L7>:
 71                    st16	[r4], r5
 f0 51 00 00           ldm16	r1, [0x0]
		R_AVM_DATA16	.data.heap_top
 e2 00 00 00           jmpf	free
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.free+0x29
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	.data.heap_top
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

Disassembly of section .text.coalesce:

<coalesce>:
 b1                    push16	r1
 b0                    push16	r0
 f0 51 00 00           ldm16	r1, [0x0]
		R_AVM_DATA16	.data.heap_top
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	__avm_heap_start
 f5 21                 cmp	r4, r1
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	coalesce
		R_AVM_FAR24	.text.coalesce+0x69
<L0>:
 f0 04 ff 7f           ldi16	r0, 0x7fff
 e2 00 00 00           jmpf	coalesce
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.coalesce+0x22
 12                    add	r4, r6
 f5 21                 cmp	r4, r1
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	coalesce
		R_AVM_FAR24	.text.coalesce+0x69
<L1>:
 68                    ld16	r6, [r4]
 f6 2e                 tst16	r6
 f9 c0                 and	r6, r0
 d9 04                 brsge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	coalesce
		R_AVM_FAR24	.text.coalesce+0x19
<L2>:
 0e                    mov	r7, r6
 1c                    add	r7, r4
 f5 2d                 cmp	r7, r1
 d2 04                 brult8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	coalesce
		R_AVM_FAR24	.text.coalesce+0x4b
<L3>:
 67                    ld16	r5, [r7]
 f6 2d                 tst16	r5
 d9 04                 brsge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	coalesce
		R_AVM_FAR24	.text.coalesce+0x4b
<L4>:
 19                    add	r6, r5
 0e                    mov	r7, r6
 1c                    add	r7, r4
 f5 2d                 cmp	r7, r1
 d8 04                 bruge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	coalesce
		R_AVM_FAR24	.text.coalesce+0x37
<L5>:
 f5 2d                 cmp	r7, r1
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	coalesce
		R_AVM_FAR24	.text.coalesce+0x65
<L6>:
 72                    st16	[r4], r6
 f0 51 00 00           ldm16	r1, [0x0]
		R_AVM_DATA16	.data.heap_top
 12                    add	r4, r6
 f5 21                 cmp	r4, r1
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	coalesce
		R_AVM_FAR24	.text.coalesce+0x22
<L7>:
 e2 00 00 00           jmpf	coalesce
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.coalesce+0x69
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	.data.heap_top
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

Disassembly of section .text.realloc:

<realloc>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 f4 50                 stsp16	[sp+0x4], r4
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x98
<L0>:
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0xff
<L1>:
 c6 fe 03              ldi16	r6, 0x3fe
 39                    cmp	r6, r5
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x33c
<L2>:
 f0 33 04              ldsp16	r3, [sp+0x4]
 f0 0b fe              addi.s8	r3, -0x2
 ed d6 20              ld16	r6, [r3+0]
 c7 ff 7f              ldi16	r7, 0x7fff
 f1 0e                 mov	r1, r6
 f9 3c                 and	r1, r7
 f1 05                 mov	r0, r5
 f0 08 02              addi.s8	r0, 0x2
 f5 08                 cmp	r1, r0
 d2 04                 brult8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x189
<L3>:
 f1 29                 mov	r6, r1
 f2 2b                 add	r6, r3
 f0 52 00 00           ldm16	r2, [0x0]
		R_AVM_DATA16	.data.heap_top
 f5 2a                 cmp	r6, r2
 d2 04                 brult8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x206
<L4>:
 6e                    ld16	r7, [r6]
 f6 2f                 tst16	r7
 d9 04                 brsge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x206
<L5>:
 f4 4b                 stsp16	[sp+0x2], r7
 c7 ff 7f              ldi16	r7, 0x7fff
 f0 3b 00              stsp16	[sp+0x0], r3
 f0 33 02              ldsp16	r3, [sp+0x2]
 f9 7c                 and	r3, r7
 f0 3b 02              stsp16	[sp+0x2], r3
 f0 33 00              ldsp16	r3, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f2 2d                 add	r7, r1
 f5 2c                 cmp	r7, r0
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x206
<L6>:
 0b                    mov	r6, r7
 f2 58                 sub	r6, r0
 ce 03                 cmpi.s8	r6, 0x3
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x2ea
<L7>:
 c7 00 80              ldi16	r7, 0x8000
 f9 1d                 or	r0, r7
 f0 31 04              ldsp16	r1, [sp+0x4]
 ee 12 1e              st16	[r1-2], r0
 f2 25                 add	r5, r1
 76                    st16	[r5], r6
 e3 00 00 00           callf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.coalesce
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0x33e
 c4 01 fc              ldi16	r4, 0xfc01
 11                    add	r4, r5
 c6 02 fc              ldi16	r6, 0xfc02
 32                    cmp	r4, r6
 d8 04                 bruge8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x33c
<L8>:
 c9 02                 addi.s8	r5, 0x2
 f0 56 00 00           ldm16	r6, [0x0]
		R_AVM_DATA16	.data.heap_top
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	__avm_heap_start
 f6 2e                 tst16	r6
 fb 34                 cmov.eq	r6, r4
 32                    cmp	r4, r6
 d2 04                 brult8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x16c
<L9>:
 f0 05 00 00           ldi16	r1, 0x0
		R_AVM_DATA16	__avm_heap_start
 f0 04 ff 7f           ldi16	r0, 0x7fff
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0xd0
 f2 0f                 add	r1, r7
 f5 0e                 cmp	r1, r6
 d2 04                 brult8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x16c
<L10>:
 ed 92 20              ld16	r4, [r1+0]
 0c                    mov	r7, r4
 f9 e0                 and	r7, r0
 f6 2c                 tst16	r4
 d9 04                 brsge8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0xc6
<L11>:
 3d                    cmp	r7, r5
 d8 04                 bruge8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0xc6
<L12>:
 2d                    sub	r7, r5
 cf 03                 cmpi.s8	r7, 0x3
 d8 04                 bruge8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x2c4
<L13>:
 c4 00 80              ldi16	r4, 0x8000
 91                    or	r4, r5
 ee 92 20              st16	[r1+0], r4
 f2 25                 add	r5, r1
 77                    st16	[r5], r7
 f0 09 02              addi.s8	r1, 0x2
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0x33e
 f4 10                 ldsp16	r4, [sp+0x4]
 ed b8 1e              ld16	r5, [r4-2]
 c6 ff 7f              ldi16	r6, 0x7fff
 f1 06                 mov	r0, r6
 86                    and	r5, r6
 ee b8 1e              st16	[r4-2], r5
 f0 51 00 00           ldm16	r1, [0x0]
		R_AVM_DATA16	.data.heap_top
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	__avm_heap_start
 f5 21                 cmp	r4, r1
 d8 04                 bruge8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x129
<L14>:
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0x33c
 11                    add	r4, r5
 f5 21                 cmp	r4, r1
 d2 04                 brult8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x33c
<L15>:
 64                    ld16	r5, [r4]
 f6 2d                 tst16	r5
 f9 a0                 and	r5, r0
 d9 04                 brsge8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x120
<L16>:
 0d                    mov	r7, r5
 1c                    add	r7, r4
 f5 2d                 cmp	r7, r1
 d2 04                 brult8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x152
<L17>:
 6b                    ld16	r6, [r7]
 f6 2e                 tst16	r6
 d9 04                 brsge8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x152
<L18>:
 16                    add	r5, r6
 0d                    mov	r7, r5
 1c                    add	r7, r4
 f5 2d                 cmp	r7, r1
 d8 04                 bruge8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x13e
<L19>:
 f5 2d                 cmp	r7, r1
 d1 04                 brne8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x28e
<L20>:
 71                    st16	[r4], r5
 f0 51 00 00           ldm16	r1, [0x0]
		R_AVM_DATA16	.data.heap_top
 11                    add	r4, r5
 f5 21                 cmp	r4, r1
 d8 04                 bruge8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x129
<L21>:
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0x33c
 c4 00 05              ldi16	r4, 0x500
 22                    sub	r4, r6
 31                    cmp	r4, r5
 d8 04                 bruge8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x33c
<L22>:
 c4 00 80              ldi16	r4, 0x8000
 91                    or	r4, r5
 f1 0e                 mov	r1, r6
 f0 6d 93              st16	[r1+], r4
 19                    add	r6, r5
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	.data.heap_top
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0x33e
 f2 38                 sub	r1, r0
 f0 0d 03              cmpi.s8	r1, 0x3
 d8 04                 bruge8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x280
<L23>:
 c6 00 80              ldi16	r6, 0x8000
 f9 19                 or	r0, r6
 f4 10                 ldsp16	r4, [sp+0x4]
 ee 18 1e              st16	[r4-2], r0
 14                    add	r5, r4
 f5 55                 st16	[r5], r1
 f0 51 00 00           ldm16	r1, [0x0]
		R_AVM_DATA16	.data.heap_top
 c5 00 00              ldi16	r5, 0x0
		R_AVM_DATA16	__avm_heap_start
 f5 25                 cmp	r5, r1
 d2 04                 brult8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x2e3
<L24>:
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_DATA16	__avm_heap_start
 f0 06 ff 7f           ldi16	r2, 0x7fff
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0x1d5
 f5 2d                 cmp	r7, r1
 d1 04                 brne8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x2f8
<L25>:
 ee b0 20              st16	[r0+0], r5
 f0 51 00 00           ldm16	r1, [0x0]
		R_AVM_DATA16	.data.heap_top
 f2 05                 add	r0, r5
 f5 01                 cmp	r0, r1
 d2 04                 brult8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x2e3
<L26>:
 ed b0 20              ld16	r5, [r0+0]
 f6 2d                 tst16	r5
 f9 a8                 and	r5, r2
 d9 04                 brsge8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x1cb
<L27>:
 0d                    mov	r7, r5
 f2 2c                 add	r7, r0
 f5 2d                 cmp	r7, r1
 d2 04                 brult8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x1bc
<L28>:
 6b                    ld16	r6, [r7]
 f6 2e                 tst16	r6
 d9 04                 brsge8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x1bc
<L29>:
 16                    add	r5, r6
 0d                    mov	r7, r5
 f2 2c                 add	r7, r0
 f5 2d                 cmp	r7, r1
 d8 04                 bruge8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x1ed
<L30>:
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0x1bc
 f5 2a                 cmp	r6, r2
 c7 00 05              ldi16	r7, 0x500
 d0 04                 breq8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x21d
<L31>:
 f1 24                 mov	r5, r0
 f2 55                 sub	r5, r1
 2e                    sub	r7, r6
 3d                    cmp	r7, r5
 d2 04                 brult8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x2d2
<L32>:
 f1 29                 mov	r6, r1
 c5 00 00              ldi16	r5, 0x0
		R_AVM_DATA16	__avm_heap_start
 f6 2a                 tst16	r2
 fb 15                 cmov.eq	r2, r5
 f5 26                 cmp	r5, r2
 f0 07 ff 7f           ldi16	r3, 0x7fff
 d2 04                 brult8	0x4 <L33>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x298
<L33>:
 f0 05 00 00           ldi16	r1, 0x0
		R_AVM_DATA16	__avm_heap_start
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0x244
 f2 0d                 add	r1, r5
 f5 0a                 cmp	r1, r2
 d2 04                 brult8	0x4 <L34>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x298
<L34>:
 ed f2 20              ld16	r7, [r1+0]
 07                    mov	r5, r7
 f9 ac                 and	r5, r3
 f6 2f                 tst16	r7
 d9 04                 brsge8	0x4 <L35>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x23a
<L35>:
 f5 24                 cmp	r5, r0
 d8 04                 bruge8	0x4 <L36>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x23a
<L36>:
 f2 54                 sub	r5, r0
 cd 03                 cmpi.s8	r5, 0x3
 d8 04                 bruge8	0x4 <L37>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x303
<L37>:
 c7 00 80              ldi16	r7, 0x8000
 f9 e1                 or	r7, r0
 ee f2 20              st16	[r1+0], r7
 f2 01                 add	r0, r1
 ee b0 20              st16	[r0+0], r5
 f0 09 02              addi.s8	r1, 0x2
 f6 29                 tst16	r1
 d1 04                 brne8	0x4 <L38>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x33c
<L38>:
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0x315
 c5 00 80              ldi16	r5, 0x8000
 99                    or	r6, r5
 ee d6 20              st16	[r3+0], r6
 f0 31 04              ldsp16	r1, [sp+0x4]
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0x33e
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	.data.heap_top
 f2 39                 sub	r1, r1
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0x33e
 c5 00 05              ldi16	r5, 0x500
 f2 56                 sub	r5, r2
 f5 24                 cmp	r5, r0
 d8 04                 bruge8	0x4 <L39>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x33c
<L39>:
 c5 00 80              ldi16	r5, 0x8000
 f9 a1                 or	r5, r0
 ee b4 20              st16	[r2+0], r5
 f2 02                 add	r0, r2
 f0 58 00 00           stm16	[0x0], r0
		R_AVM_DATA16	.data.heap_top
 f1 0a                 mov	r1, r2
 f0 09 02              addi.s8	r1, 0x2
 f6 29                 tst16	r1
 d1 04                 brne8	0x4 <L40>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x33c
<L40>:
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0x315
 c5 00 80              ldi16	r5, 0x8000
 91                    or	r4, r5
 ee 92 20              st16	[r1+0], r4
 f0 09 02              addi.s8	r1, 0x2
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0x33e
 c6 00 80              ldi16	r6, 0x8000
 f9 19                 or	r0, r6
 ee 16 20              st16	[r3+0], r0
 f0 56 00 00           ldm16	r6, [0x0]
		R_AVM_DATA16	.data.heap_top
 19                    add	r6, r5
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	.data.heap_top
 f0 31 04              ldsp16	r1, [sp+0x4]
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0x33e
 c5 00 80              ldi16	r5, 0x8000
 9d                    or	r7, r5
 ee f6 20              st16	[r3+0], r7
 f0 31 04              ldsp16	r1, [sp+0x4]
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0x33e
 f0 58 00 00           stm16	[0x0], r0
		R_AVM_DATA16	.data.heap_top
 f0 31 04              ldsp16	r1, [sp+0x4]
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0x33e
 c5 00 80              ldi16	r5, 0x8000
 9d                    or	r7, r5
 ee f2 20              st16	[r1+0], r7
 f0 09 02              addi.s8	r1, 0x2
 f6 29                 tst16	r1
 d1 04                 brne8	0x4 <L41>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x33c
<L41>:
 ca fe                 addi.s8	r6, -0x2
 f1 21                 mov	r4, r1
 f4 13                 ldsp16	r7, [sp+0x4]
 07                    mov	r5, r7
 d7 0f                 sys	memcpy
 ed be 1e              ld16	r5, [r7-2]
 f9 ac                 and	r5, r3
 ee be 1e              st16	[r7-2], r5
 f0 56 00 00           ldm16	r6, [0x0]
		R_AVM_DATA16	.data.heap_top
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	__avm_heap_start
 32                    cmp	r4, r6
 d2 04                 brult8	0x4 <L42>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x33e
<L42>:
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_DATA16	__avm_heap_start
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0x351
 f2 39                 sub	r1, r1
 f1 21                 mov	r4, r1
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f2 04                 add	r0, r4
 f5 06                 cmp	r0, r6
 d2 04                 brult8	0x4 <L43>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x33e
<L43>:
 ed 90 20              ld16	r4, [r0+0]
 f6 2c                 tst16	r4
 f9 8c                 and	r4, r3
 d9 04                 brsge8	0x4 <L44>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x347
<L44>:
 0c                    mov	r7, r4
 f2 2c                 add	r7, r0
 3e                    cmp	r7, r6
 d2 04                 brult8	0x4 <L45>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x37c
<L45>:
 67                    ld16	r5, [r7]
 f6 2d                 tst16	r5
 d9 04                 brsge8	0x4 <L46>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x37c
<L46>:
 11                    add	r4, r5
 0c                    mov	r7, r4
 f2 2c                 add	r7, r0
 3e                    cmp	r7, r6
 d8 04                 bruge8	0x4 <L47>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x368
<L47>:
 3e                    cmp	r7, r6
 d1 04                 brne8	0x4 <L48>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x398
<L48>:
 ee 90 20              st16	[r0+0], r4
 f0 56 00 00           ldm16	r6, [0x0]
		R_AVM_DATA16	.data.heap_top
 f2 04                 add	r0, r4
 f5 06                 cmp	r0, r6
 d8 04                 bruge8	0x4 <L49>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x351
<L49>:
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0x33e
 f0 58 00 00           stm16	[0x0], r0
		R_AVM_DATA16	.data.heap_top
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0x33e

Disassembly of section .text.aligned_alloc:

<aligned_alloc>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 08                    mov	r6, r4
 a0                    xor	r4, r4
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	aligned_alloc
		R_AVM_FAR24	.text.aligned_alloc+0x92
<L0>:
 c6 01 fc              ldi16	r6, 0xfc01
 19                    add	r6, r5
 c7 02 fc              ldi16	r7, 0xfc02
 3b                    cmp	r6, r7
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	aligned_alloc
		R_AVM_FAR24	.text.aligned_alloc+0x92
<L1>:
 c9 02                 addi.s8	r5, 0x2
 f0 50 00 00           ldm16	r0, [0x0]
		R_AVM_DATA16	.data.heap_top
 c6 00 00              ldi16	r6, 0x0
		R_AVM_DATA16	__avm_heap_start
 f6 28                 tst16	r0
 fb 06                 cmov.eq	r0, r6
 f5 28                 cmp	r6, r0
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	aligned_alloc
		R_AVM_FAR24	.text.aligned_alloc+0x6d
<L2>:
 c7 00 00              ldi16	r7, 0x0
		R_AVM_DATA16	__avm_heap_start
 f0 05 ff 7f           ldi16	r1, 0x7fff
 e2 00 00 00           jmpf	aligned_alloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.aligned_alloc+0x44
 1e                    add	r7, r6
 f5 2c                 cmp	r7, r0
 d2 04                 brult8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	aligned_alloc
		R_AVM_FAR24	.text.aligned_alloc+0x6d
<L3>:
 f5 4e                 ld16	r2, [r7]
 f1 2a                 mov	r6, r2
 f9 c4                 and	r6, r1
 f6 2a                 tst16	r2
 d9 04                 brsge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	aligned_alloc
		R_AVM_FAR24	.text.aligned_alloc+0x3b
<L4>:
 39                    cmp	r6, r5
 d8 04                 bruge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	aligned_alloc
		R_AVM_FAR24	.text.aligned_alloc+0x3b
<L5>:
 29                    sub	r6, r5
 c4 00 80              ldi16	r4, 0x8000
 ce 03                 cmpi.s8	r6, 0x3
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	aligned_alloc
		R_AVM_FAR24	.text.aligned_alloc+0x8b
<L6>:
 91                    or	r4, r5
 7c                    st16	[r7], r4
 17                    add	r5, r7
 76                    st16	[r5], r6
 e2 00 00 00           jmpf	aligned_alloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.aligned_alloc+0x8f
 c6 00 05              ldi16	r6, 0x500
 f2 58                 sub	r6, r0
 39                    cmp	r6, r5
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	aligned_alloc
		R_AVM_FAR24	.text.aligned_alloc+0x92
<L7>:
 c6 00 80              ldi16	r6, 0x8000
 99                    or	r6, r5
 f1 20                 mov	r4, r0
 f7 46                 st16	[r4+], r6
 f2 05                 add	r0, r5
 f0 58 00 00           stm16	[0x0], r0
		R_AVM_DATA16	.data.heap_top
 e2 00 00 00           jmpf	aligned_alloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.aligned_alloc+0x92
 f9 51                 or	r2, r4
 f5 5e                 st16	[r7], r2
 cb 02                 addi.s8	r7, 0x2
 03                    mov	r4, r7
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

Disassembly of section .text.free_sized:

<free_sized>:
 b1                    push16	r1
 b0                    push16	r0
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	free_sized
		R_AVM_FAR24	.text.free_sized+0x70
<L0>:
 ed b8 1e              ld16	r5, [r4-2]
 c6 ff 7f              ldi16	r6, 0x7fff
 f1 06                 mov	r0, r6
 86                    and	r5, r6
 ee b8 1e              st16	[r4-2], r5
 f0 51 00 00           ldm16	r1, [0x0]
		R_AVM_DATA16	.data.heap_top
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	__avm_heap_start
 f5 21                 cmp	r4, r1
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	free_sized
		R_AVM_FAR24	.text.free_sized+0x70
<L1>:
 e2 00 00 00           jmpf	free_sized
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.free_sized+0x32
 11                    add	r4, r5
 f5 21                 cmp	r4, r1
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	free_sized
		R_AVM_FAR24	.text.free_sized+0x70
<L2>:
 64                    ld16	r5, [r4]
 f6 2d                 tst16	r5
 f9 a0                 and	r5, r0
 d9 04                 brsge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	free_sized
		R_AVM_FAR24	.text.free_sized+0x29
<L3>:
 0d                    mov	r7, r5
 1c                    add	r7, r4
 f5 2d                 cmp	r7, r1
 d2 04                 brult8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	free_sized
		R_AVM_FAR24	.text.free_sized+0x5b
<L4>:
 6b                    ld16	r6, [r7]
 f6 2e                 tst16	r6
 d9 04                 brsge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	free_sized
		R_AVM_FAR24	.text.free_sized+0x5b
<L5>:
 16                    add	r5, r6
 0d                    mov	r7, r5
 1c                    add	r7, r4
 f5 2d                 cmp	r7, r1
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	free_sized
		R_AVM_FAR24	.text.free_sized+0x47
<L6>:
 f5 2d                 cmp	r7, r1
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	free_sized
		R_AVM_FAR24	.text.free_sized+0x6c
<L7>:
 71                    st16	[r4], r5
 f0 51 00 00           ldm16	r1, [0x0]
		R_AVM_DATA16	.data.heap_top
 e2 00 00 00           jmpf	free_sized
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.free_sized+0x29
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	.data.heap_top
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

Disassembly of section .text.free_aligned_sized:

<free_aligned_sized>:
 b1                    push16	r1
 b0                    push16	r0
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	free_aligned_sized
		R_AVM_FAR24	.text.free_aligned_sized+0x70
<L0>:
 ed b8 1e              ld16	r5, [r4-2]
 c6 ff 7f              ldi16	r6, 0x7fff
 f1 06                 mov	r0, r6
 86                    and	r5, r6
 ee b8 1e              st16	[r4-2], r5
 f0 51 00 00           ldm16	r1, [0x0]
		R_AVM_DATA16	.data.heap_top
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	__avm_heap_start
 f5 21                 cmp	r4, r1
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	free_aligned_sized
		R_AVM_FAR24	.text.free_aligned_sized+0x70
<L1>:
 e2 00 00 00           jmpf	free_aligned_sized
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.free_aligned_sized+0x32
 11                    add	r4, r5
 f5 21                 cmp	r4, r1
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	free_aligned_sized
		R_AVM_FAR24	.text.free_aligned_sized+0x70
<L2>:
 64                    ld16	r5, [r4]
 f6 2d                 tst16	r5
 f9 a0                 and	r5, r0
 d9 04                 brsge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	free_aligned_sized
		R_AVM_FAR24	.text.free_aligned_sized+0x29
<L3>:
 0d                    mov	r7, r5
 1c                    add	r7, r4
 f5 2d                 cmp	r7, r1
 d2 04                 brult8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	free_aligned_sized
		R_AVM_FAR24	.text.free_aligned_sized+0x5b
<L4>:
 6b                    ld16	r6, [r7]
 f6 2e                 tst16	r6
 d9 04                 brsge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	free_aligned_sized
		R_AVM_FAR24	.text.free_aligned_sized+0x5b
<L5>:
 16                    add	r5, r6
 0d                    mov	r7, r5
 1c                    add	r7, r4
 f5 2d                 cmp	r7, r1
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	free_aligned_sized
		R_AVM_FAR24	.text.free_aligned_sized+0x47
<L6>:
 f5 2d                 cmp	r7, r1
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	free_aligned_sized
		R_AVM_FAR24	.text.free_aligned_sized+0x6c
<L7>:
 71                    st16	[r4], r5
 f0 51 00 00           ldm16	r1, [0x0]
		R_AVM_DATA16	.data.heap_top
 e2 00 00 00           jmpf	free_aligned_sized
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.free_aligned_sized+0x29
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	.data.heap_top
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

Disassembly of section .text.calloc:

<calloc>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f1 0d                 mov	r1, r5
 f1 14                 mov	r2, r4
 f6 29                 tst16	r1
 f2 30                 sub	r0, r0
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	calloc
		R_AVM_FAR24	.text.calloc+0x23
<L0>:
 f1 21                 mov	r4, r1
 f1 26                 mov	r5, r2
 e3 00 00 00           callf	calloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_umulhisi3
 01                    mov	r4, r5
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	calloc
		R_AVM_FAR24	.text.calloc+0xe1
<L1>:
 fe 0a                 mul16	r1, r2
 c4 01 fc              ldi16	r4, 0xfc01
 f2 21                 add	r4, r1
 c5 02 fc              ldi16	r5, 0xfc02
 31                    cmp	r4, r5
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	calloc
		R_AVM_FAR24	.text.calloc+0xe1
<L2>:
 f1 19                 mov	r3, r1
 f0 0b 02              addi.s8	r3, 0x2
 f0 55 00 00           ldm16	r5, [0x0]
		R_AVM_DATA16	.data.heap_top
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	__avm_heap_start
 f6 2d                 tst16	r5
 fb 2c                 cmov.eq	r5, r4
 31                    cmp	r4, r5
 d2 04                 brult8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	calloc
		R_AVM_FAR24	.text.calloc+0x9b
<L3>:
 f0 06 00 00           ldi16	r2, 0x0
		R_AVM_DATA16	__avm_heap_start
 c7 ff 7f              ldi16	r7, 0x7fff
 e2 00 00 00           jmpf	calloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.calloc+0x60
 f2 16                 add	r2, r6
 f5 15                 cmp	r2, r5
 d2 04                 brult8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	calloc
		R_AVM_FAR24	.text.calloc+0x9b
<L4>:
 ed 94 20              ld16	r4, [r2+0]
 08                    mov	r6, r4
 8b                    and	r6, r7
 f6 2c                 tst16	r4
 d9 04                 brsge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	calloc
		R_AVM_FAR24	.text.calloc+0x56
<L5>:
 f5 2b                 cmp	r6, r3
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	calloc
		R_AVM_FAR24	.text.calloc+0x56
<L6>:
 f2 5b                 sub	r6, r3
 ce 03                 cmpi.s8	r6, 0x3
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	calloc
		R_AVM_FAR24	.text.calloc+0xc4
<L7>:
 c4 00 80              ldi16	r4, 0x8000
 f9 8d                 or	r4, r3
 ee 94 20              st16	[r2+0], r4
 f2 1a                 add	r3, r2
 ee d6 20              st16	[r3+0], r6
 f0 0a 02              addi.s8	r2, 0x2
 f6 2a                 tst16	r2
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	calloc
		R_AVM_FAR24	.text.calloc+0xe1
<L8>:
 e2 00 00 00           jmpf	calloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.calloc+0xd6
 c4 00 05              ldi16	r4, 0x500
 21                    sub	r4, r5
 f5 23                 cmp	r4, r3
 d8 04                 bruge8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	calloc
		R_AVM_FAR24	.text.calloc+0xe1
<L9>:
 c4 00 80              ldi16	r4, 0x8000
 f9 8d                 or	r4, r3
 74                    st16	[r5], r4
 f2 1d                 add	r3, r5
 f0 5b 00 00           stm16	[0x0], r3
		R_AVM_DATA16	.data.heap_top
 f1 15                 mov	r2, r5
 f0 0a 02              addi.s8	r2, 0x2
 f6 2a                 tst16	r2
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	calloc
		R_AVM_FAR24	.text.calloc+0xe1
<L10>:
 e2 00 00 00           jmpf	calloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.calloc+0xd6
 c5 00 80              ldi16	r5, 0x8000
 91                    or	r4, r5
 ee 94 20              st16	[r2+0], r4
 f0 0a 02              addi.s8	r2, 0x2
 f6 2a                 tst16	r2
 d1 04                 brne8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	calloc
		R_AVM_FAR24	.text.calloc+0xe1
<L11>:
 a5                    xor	r5, r5
 f1 22                 mov	r4, r2
 f1 29                 mov	r6, r1
 e3 00 00 00           callf	calloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	memset
 f1 02                 mov	r0, r2
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
