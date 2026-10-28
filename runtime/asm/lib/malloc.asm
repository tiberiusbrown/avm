
malloc.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 malloc.c
00000000 l    d  .text.malloc	00000000 .text.malloc
00000000 l     O .data.heap_top	00000002 heap_top
00000000 l    d  .text.free	00000000 .text.free
00000000 l    d  .text.coalesce	00000000 .text.coalesce
00000000 l     F .text.coalesce	0000006c coalesce
00000000 l    d  .text.realloc	00000000 .text.realloc
00000000 l    d  .text.calloc	00000000 .text.calloc
00000000 l    d  .data.heap_top	00000000 .data.heap_top
00000000 g     F .text.malloc	00000091 malloc
00000000         *UND*	00000000 __avm_heap_start
00000000 g     F .text.free	00000073 free
00000000 g     F .text.realloc	00000365 realloc
00000000 g     F .text.calloc	000000da calloc
00000000         *UND*	00000000 __avm_umulhisi3

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
 f0 04 ff 7f           ldi16	r0, 0x7fff
 f9 a0                 and	r5, r0
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
 d6 fc                 adjsp	-0x4
 f1 04                 mov	r0, r4
 f6 28                 tst16	r0
 a0                    xor	r4, r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x8c
<L0>:
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0xef
<L1>:
 c6 fe 03              ldi16	r6, 0x3fe
 39                    cmp	r6, r5
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x2b7
<L2>:
 f1 2c                 mov	r7, r0
 cb fe                 addi.s8	r7, -0x2
 f5 4f                 ld16	r3, [r7]
 f0 06 ff 7f           ldi16	r2, 0x7fff
 f1 2b                 mov	r6, r3
 f9 c8                 and	r6, r2
 f1 0d                 mov	r1, r5
 f0 09 02              addi.s8	r1, 0x2
 f5 29                 cmp	r6, r1
 d2 04                 brult8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x184
<L3>:
 f4 4a                 stsp16	[sp+0x2], r6
 f1 16                 mov	r2, r6
 f4 43                 stsp16	[sp+0x0], r7
 f2 17                 add	r2, r7
 f0 53 00 00           ldm16	r3, [0x0]
		R_AVM_DATA16	.data.heap_top
 f5 13                 cmp	r2, r3
 d2 04                 brult8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x1ef
<L4>:
 ed f4 20              ld16	r7, [r2+0]
 f6 2f                 tst16	r7
 d9 04                 brsge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x1ef
<L5>:
 c6 ff 7f              ldi16	r6, 0x7fff
 8e                    and	r7, r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 1e                    add	r7, r6
 f5 2d                 cmp	r7, r1
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x1ef
<L6>:
 03                    mov	r4, r7
 f2 51                 sub	r4, r1
 cc 03                 cmpi.s8	r4, 0x3
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x2be
<L7>:
 c6 00 80              ldi16	r6, 0x8000
 f9 39                 or	r1, r6
 ee 30 1e              st16	[r0-2], r1
 f2 24                 add	r5, r0
 74                    st16	[r5], r4
 e3 00 00 00           callf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.coalesce
 f1 20                 mov	r4, r0
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0x2b7
 c6 01 fc              ldi16	r6, 0xfc01
 19                    add	r6, r5
 c7 02 fc              ldi16	r7, 0xfc02
 3b                    cmp	r6, r7
 d8 04                 bruge8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x2b7
<L8>:
 c9 02                 addi.s8	r5, 0x2
 f0 50 00 00           ldm16	r0, [0x0]
		R_AVM_DATA16	.data.heap_top
 c6 00 00              ldi16	r6, 0x0
		R_AVM_DATA16	__avm_heap_start
 f6 28                 tst16	r0
 fb 06                 cmov.eq	r0, r6
 f5 28                 cmp	r6, r0
 d2 04                 brult8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x166
<L9>:
 c7 00 00              ldi16	r7, 0x0
		R_AVM_DATA16	__avm_heap_start
 f0 05 ff 7f           ldi16	r1, 0x7fff
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0xc3
 1e                    add	r7, r6
 f5 2c                 cmp	r7, r0
 d2 04                 brult8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x166
<L10>:
 f5 4e                 ld16	r2, [r7]
 f1 2a                 mov	r6, r2
 f9 c4                 and	r6, r1
 f6 2a                 tst16	r2
 d9 04                 brsge8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0xba
<L11>:
 39                    cmp	r6, r5
 d8 04                 bruge8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0xba
<L12>:
 29                    sub	r6, r5
 c4 00 80              ldi16	r4, 0x8000
 ce 03                 cmpi.s8	r6, 0x3
 d8 04                 bruge8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x298
<L13>:
 91                    or	r4, r5
 7c                    st16	[r7], r4
 17                    add	r5, r7
 76                    st16	[r5], r6
 cb 02                 addi.s8	r7, 0x2
 03                    mov	r4, r7
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0x2b7
 ed b0 1e              ld16	r5, [r0-2]
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f9 a4                 and	r5, r1
 ee b0 1e              st16	[r0-2], r5
 f0 50 00 00           ldm16	r0, [0x0]
		R_AVM_DATA16	.data.heap_top
 c5 00 00              ldi16	r5, 0x0
		R_AVM_DATA16	__avm_heap_start
 f5 24                 cmp	r5, r0
 d2 04                 brult8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x2b7
<L14>:
 f0 06 00 00           ldi16	r2, 0x0
		R_AVM_DATA16	__avm_heap_start
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0x11c
 f2 17                 add	r2, r7
 f5 10                 cmp	r2, r0
 d2 04                 brult8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x2b7
<L15>:
 ed f4 20              ld16	r7, [r2+0]
 f6 2f                 tst16	r7
 f9 e4                 and	r7, r1
 d9 04                 brsge8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x112
<L16>:
 07                    mov	r5, r7
 f2 26                 add	r5, r2
 f5 24                 cmp	r5, r0
 d2 04                 brult8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x149
<L17>:
 69                    ld16	r6, [r5]
 f6 2e                 tst16	r6
 d9 04                 brsge8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x149
<L18>:
 1e                    add	r7, r6
 07                    mov	r5, r7
 f2 26                 add	r5, r2
 f5 24                 cmp	r5, r0
 d8 04                 bruge8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x134
<L19>:
 f5 24                 cmp	r5, r0
 d1 04                 brne8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x26b
<L20>:
 ee f4 20              st16	[r2+0], r7
 f0 50 00 00           ldm16	r0, [0x0]
		R_AVM_DATA16	.data.heap_top
 f2 17                 add	r2, r7
 f5 10                 cmp	r2, r0
 d8 04                 bruge8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x11c
<L21>:
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0x2b7
 c6 00 05              ldi16	r6, 0x500
 f2 58                 sub	r6, r0
 39                    cmp	r6, r5
 d8 04                 bruge8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x2b7
<L22>:
 c6 00 80              ldi16	r6, 0x8000
 99                    or	r6, r5
 f1 20                 mov	r4, r0
 f7 46                 st16	[r4+], r6
 f2 05                 add	r0, r5
 f0 58 00 00           stm16	[0x0], r0
		R_AVM_DATA16	.data.heap_top
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0x2b7
 f2 59                 sub	r6, r1
 c4 00 80              ldi16	r4, 0x8000
 ce 03                 cmpi.s8	r6, 0x3
 d8 04                 bruge8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x261
<L23>:
 f9 31                 or	r1, r4
 ee 30 1e              st16	[r0-2], r1
 f2 24                 add	r5, r0
 76                    st16	[r5], r6
 f0 51 00 00           ldm16	r1, [0x0]
		R_AVM_DATA16	.data.heap_top
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	__avm_heap_start
 f5 21                 cmp	r4, r1
 d8 04                 bruge8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x1c2
<L24>:
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0x2b5
 f5 2d                 cmp	r7, r1
 d1 04                 brne8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x2b1
<L25>:
 72                    st16	[r4], r6
 f0 51 00 00           ldm16	r1, [0x0]
		R_AVM_DATA16	.data.heap_top
 12                    add	r4, r6
 f5 21                 cmp	r4, r1
 d2 04                 brult8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x2b5
<L26>:
 68                    ld16	r6, [r4]
 f6 2e                 tst16	r6
 f9 c8                 and	r6, r2
 d9 04                 brsge8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x1b9
<L27>:
 0e                    mov	r7, r6
 1c                    add	r7, r4
 f5 2d                 cmp	r7, r1
 d2 04                 brult8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x1ac
<L28>:
 67                    ld16	r5, [r7]
 f6 2d                 tst16	r5
 d9 04                 brsge8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x1ac
<L29>:
 19                    add	r6, r5
 0e                    mov	r7, r6
 1c                    add	r7, r4
 f5 2d                 cmp	r7, r1
 d8 04                 bruge8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x1d7
<L30>:
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0x1ac
 f5 13                 cmp	r2, r3
 c7 00 05              ldi16	r7, 0x500
 d0 04                 breq8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x209
<L31>:
 f1 25                 mov	r5, r1
 f4 0a                 ldsp16	r6, [sp+0x2]
 26                    sub	r5, r6
 0b                    mov	r6, r7
 f2 5a                 sub	r6, r2
 39                    cmp	r6, r5
 d2 04                 brult8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x2a3
<L32>:
 c5 00 00              ldi16	r5, 0x0
		R_AVM_DATA16	__avm_heap_start
 f6 2b                 tst16	r3
 fb 1d                 cmov.eq	r3, r5
 f5 27                 cmp	r5, r3
 d2 04                 brult8	0x4 <L33>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x273
<L33>:
 f0 06 00 00           ldi16	r2, 0x0
		R_AVM_DATA16	__avm_heap_start
 c7 ff 7f              ldi16	r7, 0x7fff
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0x22d
 f2 15                 add	r2, r5
 f5 13                 cmp	r2, r3
 d2 04                 brult8	0x4 <L34>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x273
<L34>:
 ed d4 20              ld16	r6, [r2+0]
 06                    mov	r5, r6
 87                    and	r5, r7
 f6 2e                 tst16	r6
 d9 04                 brsge8	0x4 <L35>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x223
<L35>:
 f5 25                 cmp	r5, r1
 d8 04                 bruge8	0x4 <L36>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x223
<L36>:
 f2 55                 sub	r5, r1
 cd 03                 cmpi.s8	r5, 0x3
 d8 04                 bruge8	0x4 <L37>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x2cb
<L37>:
 c6 00 80              ldi16	r6, 0x8000
 f9 c5                 or	r6, r1
 ee d4 20              st16	[r2+0], r6
 f2 0a                 add	r1, r2
 ee b2 20              st16	[r1+0], r5
 f0 05 ff 7f           ldi16	r1, 0x7fff
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0x2d6
 f9 71                 or	r3, r4
 f5 5f                 st16	[r7], r3
 f1 20                 mov	r4, r0
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0x2b7
 f0 5a 00 00           stm16	[0x0], r2
		R_AVM_DATA16	.data.heap_top
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0x2b7
 c5 00 05              ldi16	r5, 0x500
 f2 57                 sub	r5, r3
 f5 25                 cmp	r5, r1
 d8 04                 bruge8	0x4 <L38>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x2b7
<L38>:
 c5 00 80              ldi16	r5, 0x8000
 f9 a5                 or	r5, r1
 ee b6 20              st16	[r3+0], r5
 f2 0b                 add	r1, r3
 f0 59 00 00           stm16	[0x0], r1
		R_AVM_DATA16	.data.heap_top
 f1 13                 mov	r2, r3
 f0 05 ff 7f           ldi16	r1, 0x7fff
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0x2d6
 f9 51                 or	r2, r4
 f5 5e                 st16	[r7], r2
 cb 02                 addi.s8	r7, 0x2
 03                    mov	r4, r7
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0x2b7
 c4 00 80              ldi16	r4, 0x8000
 f9 31                 or	r1, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f5 51                 st16	[r4], r1
 f0 54 00 00           ldm16	r4, [0x0]
		R_AVM_DATA16	.data.heap_top
 11                    add	r4, r5
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	.data.heap_top
 f1 20                 mov	r4, r0
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c4 00 80              ldi16	r4, 0x8000
 9c                    or	r7, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 73                    st16	[r4], r7
 f1 20                 mov	r4, r0
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0x2b7
 c5 00 80              ldi16	r5, 0x8000
 99                    or	r6, r5
 ee d4 20              st16	[r2+0], r6
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f4 0a                 ldsp16	r6, [sp+0x2]
 f0 0a 02              addi.s8	r2, 0x2
 f6 2a                 tst16	r2
 d1 04                 brne8	0x4 <L39>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x2b7
<L39>:
 ca fe                 addi.s8	r6, -0x2
 f1 22                 mov	r4, r2
 f1 24                 mov	r5, r0
 d7 0f                 sys	memcpy
 ed 90 1e              ld16	r4, [r0-2]
 f9 84                 and	r4, r1
 ee 90 1e              st16	[r0-2], r4
 f0 50 00 00           ldm16	r0, [0x0]
		R_AVM_DATA16	.data.heap_top
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	__avm_heap_start
 f5 20                 cmp	r4, r0
 f1 22                 mov	r4, r2
 d2 04                 brult8	0x4 <L40>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x2b7
<L40>:
 c6 00 00              ldi16	r6, 0x0
		R_AVM_DATA16	__avm_heap_start
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0x316
 19                    add	r6, r5
 f5 28                 cmp	r6, r0
 f1 22                 mov	r4, r2
 d2 04                 brult8	0x4 <L41>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x2b7
<L41>:
 66                    ld16	r5, [r6]
 f6 2d                 tst16	r5
 f9 a4                 and	r5, r1
 d9 04                 brsge8	0x4 <L42>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x30b
<L42>:
 01                    mov	r4, r5
 12                    add	r4, r6
 f5 20                 cmp	r4, r0
 d2 04                 brult8	0x4 <L43>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x33f
<L43>:
 6c                    ld16	r7, [r4]
 f6 2f                 tst16	r7
 d9 04                 brsge8	0x4 <L44>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x33f
<L44>:
 17                    add	r5, r7
 01                    mov	r4, r5
 12                    add	r4, r6
 f5 20                 cmp	r4, r0
 d8 04                 bruge8	0x4 <L45>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x32b
<L45>:
 f5 20                 cmp	r4, r0
 d1 04                 brne8	0x4 <L46>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x35b
<L46>:
 79                    st16	[r6], r5
 f0 50 00 00           ldm16	r0, [0x0]
		R_AVM_DATA16	.data.heap_top
 19                    add	r6, r5
 f5 28                 cmp	r6, r0
 f1 22                 mov	r4, r2
 d8 04                 bruge8	0x4 <L47>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	realloc
		R_AVM_FAR24	.text.realloc+0x316
<L47>:
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0x2b7
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	.data.heap_top
 f1 22                 mov	r4, r2
 e2 00 00 00           jmpf	realloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.realloc+0x2b7

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
		R_AVM_FAR24	.text.calloc+0xd3
<L1>:
 fe 0a                 mul16	r1, r2
 c4 01 fc              ldi16	r4, 0xfc01
 f2 21                 add	r4, r1
 c5 02 fc              ldi16	r5, 0xfc02
 31                    cmp	r4, r5
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	calloc
		R_AVM_FAR24	.text.calloc+0xd3
<L2>:
 f1 11                 mov	r2, r1
 f0 0a 02              addi.s8	r2, 0x2
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
		R_AVM_FAR24	.text.calloc+0x95
<L3>:
 c7 00 00              ldi16	r7, 0x0
		R_AVM_DATA16	__avm_heap_start
 f0 07 ff 7f           ldi16	r3, 0x7fff
 e2 00 00 00           jmpf	calloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.calloc+0x5e
 1e                    add	r7, r6
 3d                    cmp	r7, r5
 d2 04                 brult8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	calloc
		R_AVM_FAR24	.text.calloc+0x95
<L4>:
 63                    ld16	r4, [r7]
 08                    mov	r6, r4
 f9 cc                 and	r6, r3
 f6 2c                 tst16	r4
 d9 04                 brsge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	calloc
		R_AVM_FAR24	.text.calloc+0x56
<L5>:
 f5 2a                 cmp	r6, r2
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	calloc
		R_AVM_FAR24	.text.calloc+0x56
<L6>:
 f2 5a                 sub	r6, r2
 ce 03                 cmpi.s8	r6, 0x3
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	calloc
		R_AVM_FAR24	.text.calloc+0xbc
<L7>:
 c4 00 80              ldi16	r4, 0x8000
 f9 89                 or	r4, r2
 7c                    st16	[r7], r4
 f2 17                 add	r2, r7
 ee d4 20              st16	[r2+0], r6
 cb 02                 addi.s8	r7, 0x2
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	calloc
		R_AVM_FAR24	.text.calloc+0xd3
<L8>:
 e2 00 00 00           jmpf	calloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.calloc+0xcb
 c4 00 05              ldi16	r4, 0x500
 21                    sub	r4, r5
 f5 22                 cmp	r4, r2
 d8 04                 bruge8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	calloc
		R_AVM_FAR24	.text.calloc+0xd3
<L9>:
 c4 00 80              ldi16	r4, 0x8000
 f9 89                 or	r4, r2
 74                    st16	[r5], r4
 f2 15                 add	r2, r5
 f0 5a 00 00           stm16	[0x0], r2
		R_AVM_DATA16	.data.heap_top
 0d                    mov	r7, r5
 cb 02                 addi.s8	r7, 0x2
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	calloc
		R_AVM_FAR24	.text.calloc+0xd3
<L10>:
 e2 00 00 00           jmpf	calloc
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.calloc+0xcb
 c5 00 80              ldi16	r5, 0x8000
 91                    or	r4, r5
 7c                    st16	[r7], r4
 cb 02                 addi.s8	r7, 0x2
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	calloc
		R_AVM_FAR24	.text.calloc+0xd3
<L11>:
 03                    mov	r4, r7
 a5                    xor	r5, r5
 f1 29                 mov	r6, r1
 d7 11                 sys	memset
 f1 07                 mov	r0, r7
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
