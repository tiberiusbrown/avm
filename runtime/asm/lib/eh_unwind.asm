
eh_unwind.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 eh_unwind.c
00000000 l    d  .text.avm_eh_validate_block	00000000 .text.avm_eh_validate_block
00000000 l    d  .text.avm_eh_find_handler	00000000 .text.avm_eh_find_handler
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text.avm_eh_validate_block	000005a4 avm_eh_validate_block
00000000         *UND*	00000000 __avm_umulhisi3
00000000 g     F .text.avm_eh_find_handler	000008d8 avm_eh_find_handler
00000000 g     O .rodata.__avm_eh_metadata_ptr	00000003 __avm_eh_metadata_ptr

Disassembly of section .text.avm_eh_validate_block:

<avm_eh_validate_block>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 c8                 adjsp	-0x38
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 30                 sub	r0, r0
 f0 05 00 ff           ldi16	r1, 0xff00
 f7 63                 add32	q0, q3
 a0                    xor	r4, r4
 f0 02 01              ldi8	r2, 0x1
 f0 07 00 ff           ldi16	r3, 0xff00
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x59d
<L0>:
 f0 60 ac              ldp8u	r5, [q3]
 cd 41                 cmpi.s8	r5, 0x41
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x59d
<L1>:
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f7 63                 add32	q0, q3
 f0 60 a0              ldp8u	r5, [q0]
 cd 56                 cmpi.s8	r5, 0x56
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x59d
<L2>:
 f0 02 02              ldi8	r2, 0x2
 f2 4b                 sub	r3, r3
 f2 63                 mov32	q0, q3
 f7 61                 add32	q0, q1
 f0 60 a0              ldp8u	r5, [q0]
 cd 45                 cmpi.s8	r5, 0x45
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x59d
<L3>:
 f0 02 03              ldi8	r2, 0x3
 f2 4b                 sub	r3, r3
 f2 63                 mov32	q0, q3
 f7 61                 add32	q0, q1
 f0 60 a0              ldp8u	r5, [q0]
 cd 48                 cmpi.s8	r5, 0x48
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x59d
<L4>:
 f0 00 04              ldi8	r0, 0x4
 f2 39                 sub	r1, r1
 f7 63                 add32	q0, q3
 f0 60 a0              ldp8u	r5, [q0]
 cd 32                 cmpi.s8	r5, 0x32
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x59d
<L5>:
 f0 00 07              ldi8	r0, 0x7
 f2 39                 sub	r1, r1
 f7 63                 add32	q0, q3
 f0 63 40              ldp24	q1, [q0]
 f0 00 0a              ldi8	r0, 0xa
 f2 39                 sub	r1, r1
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x59d
<L6>:
 f2 30                 sub	r0, r0
 f0 05 00 01           ldi16	r1, 0x100
 f7 73                 sub32	q0, q3
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x59d
<L7>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f7 6b                 add32	q2, q3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 63                 mov32	q0, q3
 c0 0a                 ldi8	r4, 0xa
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 c0 05                 ldi8	r4, 0x5
 f7 6e                 add32	q3, q2
 f0 62 ac              ldp16	r5, [q3]
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x53a
<L8>:
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 a0                    xor	r4, r4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f0 3d 26              stsp16	[sp+0x26], r5
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 69 0c              cmp32	q0, q3
 d2 04                 brult8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x59d
<L9>:
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f7 7c                 sub32	q3, q0
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c2 0c                 ldi8	r6, 0xc
 af                    xor	r7, r7
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f0 69 4c              cmp32	q1, q3
 d8 04                 bruge8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x59d
<L10>:
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f7 6e                 add32	q3, q2
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f0 62 80              ldp16	r4, [q0]
 f4 70                 stsp16	[sp+0xc], r4
 f6 2c                 tst16	r4
 f8 04                 cset.eq	r4
 f4 60                 stsp16	[sp+0x8], r4
 f0 3e 28              stsp16	[sp+0x28], r6
 f0 3f 2a              stsp16	[sp+0x2a], r7
 d1 04                 brne8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x1c7
<L11>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f7 7e                 sub32	q3, q2
 f0 00 05              ldi8	r0, 0x5
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 f2 62                 mov32	q0, q2
 d8 04                 bruge8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x1c9
<L12>:
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 f0 30 28              ldsp16	r0, [sp+0x28]
 f0 31 2a              ldsp16	r1, [sp+0x2a]
 f2 6a                 mov32	q3, q0
 f0 02 02              ldi8	r2, 0x2
 f2 4b                 sub	r3, r3
 f7 6d                 add32	q3, q1
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 60 ac              ldp8u	r5, [q3]
 09                    mov	r6, r5
 f4 8e                 lsr16.1	r6
 c0 01                 ldi8	r4, 0x1
 88                    and	r6, r4
 0d                    mov	r7, r5
 8c                    and	r7, r4
 1e                    add	r7, r6
 09                    mov	r6, r5
 fa 92                 lsr16i	r6, 0x2
 88                    and	r6, r4
 1b                    add	r6, r7
 fa 83                 lsr16i	r5, 0x3
 84                    and	r5, r4
 16                    add	r5, r6
 15                    add	r5, r5
 c9 05                 addi.s8	r5, 0x5
 09                    mov	r6, r5
 af                    xor	r7, r7
 f7 63                 add32	q0, q3
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x547
<L13>:
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 01                 ldsp16	r5, [sp+0x0]
 34                    cmp	r5, r4
 01                    mov	r4, r5
 f4 ac                 inc16	r4
 f8 1d                 cset.uge	r5
 f4 61                 stsp16	[sp+0x8], r5
 d2 04                 brult8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x1c9
<L14>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f7 7c                 sub32	q3, q0
 f2 64                 mov32	q1, q0
 f0 00 05              ldi8	r0, 0x5
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 f2 61                 mov32	q0, q1
 d2 04                 brult8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x163
<L15>:
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x1c9
 f2 63                 mov32	q0, q3
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x560
<L16>:
 c0 08                 ldi8	r4, 0x8
 a5                    xor	r5, r5
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f7 6b                 add32	q2, q3
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 62 88              ldp16	r4, [q2]
 c1 0a                 ldi8	r5, 0xa
 e3 00 00 00           callf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_umulhisi3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f7 7c                 sub32	q3, q0
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x565
<L17>:
 f0 32 14              ldsp16	r2, [sp+0x14]
 f0 33 16              ldsp16	r3, [sp+0x16]
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 f7 67                 add32	q1, q3
 f0 62 c4              ldp16	r6, [q1]
 f2 63                 mov32	q0, q3
 f7 60                 add32	q0, q0
 f7 60                 add32	q0, q0
 f7 63                 add32	q0, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f7 6b                 add32	q2, q3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f7 7e                 sub32	q3, q2
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x57e
<L18>:
 f0 3a 20              stsp16	[sp+0x20], r2
 f0 3b 22              stsp16	[sp+0x22], r3
 f7 62                 add32	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 69 08              cmp32	q0, q2
 d1 04                 brne8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x59d
<L19>:
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c2 03                 ldi8	r6, 0x3
 af                    xor	r7, r7
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f7 67                 add32	q1, q3
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f0 63 4c              ldp24	q1, [q3]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 63 cc              ldp24	q3, [q3]
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 69 4c              cmp32	q1, q3
 d2 04                 brult8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x59d
<L20>:
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f0 3a 14              stsp16	[sp+0x14], r2
 f0 3b 16              stsp16	[sp+0x16], r3
 f0 69 4c              cmp32	q1, q3
 d8 04                 bruge8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x59d
<L21>:
 aa                    xor	r6, r6
 c7 00 01              ldi16	r7, 0x100
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x59d
<L22>:
 f0 38 30              stsp16	[sp+0x30], r0
 f0 39 32              stsp16	[sp+0x32], r1
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f0 62 ac              ldp16	r5, [q3]
 f0 3d 10              stsp16	[sp+0x10], r5
 f6 2d                 tst16	r5
 f0 32 28              ldsp16	r2, [sp+0x28]
 f0 33 2a              ldsp16	r3, [sp+0x2a]
 d1 04                 brne8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x59d
<L23>:
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 f0 38 2c              stsp16	[sp+0x2c], r0
 f0 39 2e              stsp16	[sp+0x2e], r1
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 f0 62 ac              ldp16	r5, [q3]
 f0 3d 20              stsp16	[sp+0x20], r5
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f0 62 ac              ldp16	r5, [q3]
 f0 3d 18              stsp16	[sp+0x18], r5
 a5                    xor	r5, r5
 f4 41                 stsp16	[sp+0x0], r5
 f2 61                 mov32	q0, q1
 f2 6a                 mov32	q3, q0
 f0 02 02              ldi8	r2, 0x2
 f2 4b                 sub	r3, r3
 f7 6d                 add32	q3, q1
 f0 60 cc              ldp8u	r6, [q3]
 c1 70                 ldi8	r5, 0x70
 86                    and	r5, r6
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x54c
<L24>:
 f0 38 28              stsp16	[sp+0x28], r0
 f0 39 2a              stsp16	[sp+0x2a], r1
 f0 62 a0              ldp16	r5, [q0]
 f1 15                 mov	r2, r5
 f2 4b                 sub	r3, r3
 f4 03                 ldsp16	r7, [sp+0x0]
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x340
<L25>:
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f0 69 04              cmp32	q0, q1
 d2 04                 brult8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x556
<L26>:
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x348
 f6 2d                 tst16	r5
 d0 04                 breq8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x55b
<L27>:
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 f7 61                 add32	q0, q1
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f0 69 04              cmp32	q0, q1
 d2 04                 brult8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x551
<L28>:
 0e                    mov	r7, r6
 f4 8f                 lsr16.1	r7
 c1 01                 ldi8	r5, 0x1
 f1 05                 mov	r0, r5
 8d                    and	r7, r5
 06                    mov	r5, r6
 f9 a0                 and	r5, r0
 17                    add	r5, r7
 0e                    mov	r7, r6
 fa a2                 lsr16i	r7, 0x2
 f9 e0                 and	r7, r0
 1d                    add	r7, r5
 fa 93                 lsr16i	r6, 0x3
 f9 c0                 and	r6, r0
 1b                    add	r6, r7
 1a                    add	r6, r6
 ca 05                 addi.s8	r6, 0x5
 af                    xor	r7, r7
 f0 32 28              ldsp16	r2, [sp+0x28]
 f0 33 2a              ldsp16	r3, [sp+0x2a]
 f7 67                 add32	q1, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 ae                 inc16	r6
 f0 35 10              ldsp16	r5, [sp+0x10]
 f4 42                 stsp16	[sp+0x0], r6
 36                    cmp	r5, r6
 d0 04                 breq8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x2fd
<L29>:
 f0 35 18              ldsp16	r5, [sp+0x18]
 f6 2d                 tst16	r5
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 d0 04                 breq8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x479
<L30>:
 f0 35 20              ldsp16	r5, [sp+0x20]
 f6 2d                 tst16	r5
 f0 30 2c              ldsp16	r0, [sp+0x2c]
 f0 31 2e              ldsp16	r1, [sp+0x2e]
 d1 04                 brne8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x427
<L31>:
 f0 38 2c              stsp16	[sp+0x2c], r0
 f0 39 2e              stsp16	[sp+0x2e], r1
 f2 61                 mov32	q0, q1
 f0 63 c4              ldp24	q3, [q1]
 f0 32 2c              ldsp16	r2, [sp+0x2c]
 f0 33 2e              ldsp16	r3, [sp+0x2e]
 f0 69 4c              cmp32	q1, q3
 d2 04                 brult8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x583
<L32>:
 f0 32 14              ldsp16	r2, [sp+0x14]
 f0 33 16              ldsp16	r3, [sp+0x16]
 f0 69 4c              cmp32	q1, q3
 d2 04                 brult8	0x4 <L33>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x59c
<L33>:
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f0 69 4c              cmp32	q1, q3
 d8 04                 bruge8	0x4 <L34>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x597
<L34>:
 f2 64                 mov32	q1, q0
 f2 6b                 mov32	q3, q1
 f0 00 03              ldi8	r0, 0x3
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 f0 62 ac              ldp16	r5, [q3]
 c2 ff                 ldi8	r6, 0xff
 39                    cmp	r6, r5
 d8 04                 bruge8	0x4 <L35>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x56a
<L35>:
 f2 6b                 mov32	q3, q1
 f0 00 05              ldi8	r0, 0x5
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 f0 63 04              ldp24	q0, [q1]
 f0 35 20              ldsp16	r5, [sp+0x20]
 f4 b5                 dec16	r5
 f0 3d 20              stsp16	[sp+0x20], r5
 f6 2d                 tst16	r5
 f2 67                 mov32	q1, q3
 d0 04                 breq8	0x4 <L36>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x3ba
<L36>:
 f0 36 24              ldsp16	r6, [sp+0x24]
 f4 ae                 inc16	r6
 f0 35 26              ldsp16	r5, [sp+0x26]
 39                    cmp	r6, r5
 f0 30 30              ldsp16	r0, [sp+0x30]
 f0 31 32              ldsp16	r1, [sp+0x32]
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 d0 04                 breq8	0x4 <L37>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0xdf
<L37>:
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x53a
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 32 34              ldsp16	r2, [sp+0x34]
 f0 33 36              ldsp16	r3, [sp+0x36]
 f0 69 40              cmp32	q1, q0
 d0 04                 breq8	0x4 <L38>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x579
<L38>:
 f0 00 0a              ldi8	r0, 0xa
 f2 39                 sub	r1, r1
 f0 32 28              ldsp16	r2, [sp+0x28]
 f0 33 2a              ldsp16	r3, [sp+0x2a]
 f7 64                 add32	q1, q0
 f0 63 cc              ldp24	q3, [q3]
 f0 35 18              ldsp16	r5, [sp+0x18]
 f4 b5                 dec16	r5
 f0 3d 18              stsp16	[sp+0x18], r5
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L39>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x3a9
<L39>:
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f2 6b                 mov32	q3, q1
 f0 00 06              ldi8	r0, 0x6
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 61                 mov32	q0, q1
 f2 6a                 mov32	q3, q0
 f0 02 03              ldi8	r2, 0x3
 f2 4b                 sub	r3, r3
 f7 6d                 add32	q3, q1
 f0 38 28              stsp16	[sp+0x28], r0
 f0 39 2a              stsp16	[sp+0x2a], r1
 f0 63 00              ldp24	q0, [q0]
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f0 63 4c              ldp24	q1, [q3]
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f0 63 00              ldp24	q0, [q0]
 f0 38 34              stsp16	[sp+0x34], r0
 f0 39 36              stsp16	[sp+0x36], r1
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L40>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x56f
<L40>:
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 f0 69 40              cmp32	q1, q0
 f2 61                 mov32	q0, q1
 d8 04                 bruge8	0x4 <L41>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x588
<L41>:
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f0 69 04              cmp32	q0, q1
 d2 04                 brult8	0x4 <L42>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x58d
<L42>:
 f0 00 09              ldi8	r0, 0x9
 f2 39                 sub	r1, r1
 f0 32 28              ldsp16	r2, [sp+0x28]
 f0 33 2a              ldsp16	r3, [sp+0x2a]
 f7 61                 add32	q0, q1
 f0 60 a0              ldp8u	r5, [q0]
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L43>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x446
<L43>:
 cd 01                 cmpi.s8	r5, 0x1
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 f0 32 34              ldsp16	r2, [sp+0x34]
 f0 33 36              ldsp16	r3, [sp+0x36]
 d0 04                 breq8	0x4 <L44>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x574
<L44>:
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L45>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x592
<L45>:
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L46>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x459
<L46>:
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x59d
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 69 08              cmp32	q0, q2
 f8 04                 cset.eq	r4
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x59d
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x59d
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x59d
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x59d
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x59d
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x59d
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x59d
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x59d
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x59d
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x59d
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x59d
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x59d
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x59d
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x59d
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x59d
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x59d
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x59d
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x59d
 a0                    xor	r4, r4
 d6 38                 adjsp	0x38
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.avm_eh_find_handler:

<avm_eh_find_handler>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 b4                 adjsp	-0x4c
 f1 0c                 mov	r1, r4
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	__avm_eh_metadata_ptr
 c1 00                 ldi8	r5, 0x0
		R_AVM_PROG_HI8	__avm_eh_metadata_ptr
 f0 63 48              ldp24	q1, [q2]
 f2 30                 sub	r0, r0
 a0                    xor	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 f7 69                 add32	q2, q1
 c2 01                 ldi8	r6, 0x1
 c7 00 ff              ldi16	r7, 0xff00
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0xab
<L0>:
 f0 60 84              ldp8u	r4, [q1]
 cc 41                 cmpi.s8	r4, 0x41
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0xab
<L1>:
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f2 69                 mov32	q2, q1
 f7 6b                 add32	q2, q3
 f0 60 88              ldp8u	r4, [q2]
 cc 56                 cmpi.s8	r4, 0x56
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0xab
<L2>:
 c2 02                 ldi8	r6, 0x2
 af                    xor	r7, r7
 f2 69                 mov32	q2, q1
 f7 6b                 add32	q2, q3
 f0 60 88              ldp8u	r4, [q2]
 cc 45                 cmpi.s8	r4, 0x45
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0xab
<L3>:
 c2 03                 ldi8	r6, 0x3
 af                    xor	r7, r7
 f2 69                 mov32	q2, q1
 f7 6b                 add32	q2, q3
 f0 60 88              ldp8u	r4, [q2]
 cc 48                 cmpi.s8	r4, 0x48
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0xab
<L4>:
 c0 04                 ldi8	r4, 0x4
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 60 88              ldp8u	r4, [q2]
 cc 32                 cmpi.s8	r4, 0x32
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0xab
<L5>:
 c0 07                 ldi8	r4, 0x7
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 63 c8              ldp24	q3, [q2]
 c0 0a                 ldi8	r4, 0xa
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0xab
<L6>:
 a0                    xor	r4, r4
 c5 00 01              ldi16	r5, 0x100
 f7 79                 sub32	q2, q1
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0xab
<L7>:
 ed 92 20              ld16	r4, [r1+0]
 c5 00 f6              ldi16	r5, 0xf600
 11                    add	r4, r5
 c5 00 ff              ldi16	r5, 0xff00
 31                    cmp	r4, r5
 d2 04                 brult8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0xb5
<L8>:
 f1 24                 mov	r5, r0
 01                    mov	r4, r5
 d6 4c                 adjsp	0x4c
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f7 6d                 add32	q3, q1
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 c0 0a                 ldi8	r4, 0xa
 a5                    xor	r5, r5
 f7 66                 add32	q1, q2
 ed c2 24              ld8u	r6, [r1+4]
 ed f2 22              ld16	r7, [r1+2]
 f0 39 36              stsp16	[sp+0x36], r1
 f0 3a 48              stsp16	[sp+0x48], r2
 f0 3b 4a              stsp16	[sp+0x4a], r3
 03                    mov	r4, r7
 06                    mov	r5, r6
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f2 6b                 mov32	q3, q1
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 69 c8              cmp32	q3, q2
 d2 04                 brult8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0xab
<L9>:
 f7 7b                 sub32	q2, q3
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c0 0c                 ldi8	r4, 0xc
 a5                    xor	r5, r5
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0xab
<L10>:
 f0 00 06              ldi8	r0, 0x6
 f2 39                 sub	r1, r1
 02                    mov	r4, r6
 07                    mov	r5, r7
 f7 68                 add32	q2, q0
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f2 63                 mov32	q0, q3
 c2 0c                 ldi8	r6, 0xc
 af                    xor	r7, r7
 f7 63                 add32	q0, q3
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 62 88              ldp16	r4, [q2]
 f4 60                 stsp16	[sp+0x8], r4
 f6 2c                 tst16	r4
 f8 04                 cset.eq	r4
 f4 50                 stsp16	[sp+0x4], r4
 d1 04                 brne8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x1a7
<L11>:
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f7 7c                 sub32	q3, q0
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x1a7
<L12>:
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f2 6a                 mov32	q3, q0
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f7 6e                 add32	q3, q2
 f0 60 8c              ldp8u	r4, [q3]
 0c                    mov	r7, r4
 f4 8f                 lsr16.1	r7
 c1 01                 ldi8	r5, 0x1
 8d                    and	r7, r5
 08                    mov	r6, r4
 89                    and	r6, r5
 1b                    add	r6, r7
 0c                    mov	r7, r4
 fa a2                 lsr16i	r7, 0x2
 8d                    and	r7, r5
 1e                    add	r7, r6
 fa 73                 lsr16i	r4, 0x3
 81                    and	r4, r5
 13                    add	r4, r7
 10                    add	r4, r4
 c8 05                 addi.s8	r4, 0x5
 08                    mov	r6, r4
 af                    xor	r7, r7
 f7 63                 add32	q0, q3
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x70d
<L13>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 01                 ldsp16	r5, [sp+0x0]
 34                    cmp	r5, r4
 01                    mov	r4, r5
 f4 ac                 inc16	r4
 f8 1d                 cset.uge	r5
 f4 51                 stsp16	[sp+0x4], r5
 d2 04                 brult8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x1a7
<L14>:
 f4 40                 stsp16	[sp+0x0], r4
 f2 6b                 mov32	q3, q1
 f7 7c                 sub32	q3, q0
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d2 04                 brult8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x157
<L15>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x712
<L16>:
 c0 08                 ldi8	r4, 0x8
 a5                    xor	r5, r5
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 f7 69                 add32	q2, q1
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 62 88              ldp16	r4, [q2]
 c1 0a                 ldi8	r5, 0xa
 e3 00 00 00           callf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_umulhisi3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f7 7c                 sub32	q3, q0
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x717
<L17>:
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 f7 67                 add32	q1, q3
 f0 3a 40              stsp16	[sp+0x40], r2
 f0 3b 42              stsp16	[sp+0x42], r3
 f0 62 c4              ldp16	r6, [q1]
 f1 16                 mov	r2, r6
 f2 4b                 sub	r3, r3
 f7 6f                 add32	q3, q3
 f7 6f                 add32	q3, q3
 f7 6d                 add32	q3, q1
 f7 68                 add32	q2, q0
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f7 72                 sub32	q0, q2
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x71c
<L18>:
 f7 6e                 add32	q3, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x721
<L19>:
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f7 62                 add32	q0, q2
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f0 63 08              ldp24	q0, [q2]
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 63 88              ldp24	q2, [q2]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x726
<L20>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 69 08              cmp32	q0, q2
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 d2 04                 brult8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x730
<L21>:
 f0 69 08              cmp32	q0, q2
 d8 04                 bruge8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x72b
<L22>:
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 69 08              cmp32	q0, q2
 f2 30                 sub	r0, r0
 d2 04                 brult8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0xe3
<L23>:
 f0 00 0c              ldi8	r0, 0xc
 f2 39                 sub	r1, r1
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f7 63                 add32	q0, q3
 f0 63 8c              ldp24	q2, [q3]
 f0 3c 2a              stsp16	[sp+0x2a], r4
 f0 3d 2c              stsp16	[sp+0x2c], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 63 88              ldp24	q2, [q2]
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 3d 30              stsp16	[sp+0x30], r5
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 62 88              ldp16	r4, [q2]
 f0 3c 32              stsp16	[sp+0x32], r4
 f6 2c                 tst16	r4
 f0 38 44              stsp16	[sp+0x44], r0
 f0 39 46              stsp16	[sp+0x46], r1
 d1 04                 brne8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x3f2
<L24>:
 c0 0e                 ldi8	r4, 0xe
 a5                    xor	r5, r5
 f7 6b                 add32	q2, q3
 f0 60 a8              ldp8u	r5, [q2]
 c0 70                 ldi8	r4, 0x70
 f0 3d 28              stsp16	[sp+0x28], r5
 84                    and	r5, r4
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x2e6
<L25>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0x3f2
 a0                    xor	r4, r4
 f4 50                 stsp16	[sp+0x4], r4
 a5                    xor	r5, r5
 f2 6a                 mov32	q3, q0
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f0 62 cc              ldp16	r6, [q3]
 f1 06                 mov	r0, r6
 f2 39                 sub	r1, r1
 f4 10                 ldsp16	r4, [sp+0x4]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x320
<L26>:
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 f0 69 80              cmp32	q2, q0
 d2 04                 brult8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x3d2
<L27>:
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0x328
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x3dc
<L28>:
 f0 36 2a              ldsp16	r6, [sp+0x2a]
 f0 37 2c              ldsp16	r7, [sp+0x2c]
 f0 38 24              stsp16	[sp+0x24], r0
 f0 39 26              stsp16	[sp+0x26], r1
 f7 6c                 add32	q3, q0
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 f0 35 30              ldsp16	r5, [sp+0x30]
 f0 69 c8              cmp32	q3, q2
 d2 04                 brult8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x3be
<L29>:
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f0 69 8c              cmp32	q2, q3
 f0 30 44              ldsp16	r0, [sp+0x44]
 f0 31 46              ldsp16	r1, [sp+0x46]
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 d8 04                 bruge8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x3f2
<L30>:
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 ad                 inc16	r5
 f0 34 32              ldsp16	r4, [sp+0x32]
 f4 51                 stsp16	[sp+0x4], r5
 31                    cmp	r4, r5
 d1 04                 brne8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x3c8
<L31>:
 f0 35 28              ldsp16	r5, [sp+0x28]
 09                    mov	r6, r5
 f4 8e                 lsr16.1	r6
 c0 01                 ldi8	r4, 0x1
 88                    and	r6, r4
 0d                    mov	r7, r5
 8c                    and	r7, r4
 1e                    add	r7, r6
 09                    mov	r6, r5
 fa 92                 lsr16i	r6, 0x2
 88                    and	r6, r4
 1b                    add	r6, r7
 fa 83                 lsr16i	r5, 0x3
 84                    and	r5, r4
 16                    add	r5, r6
 15                    add	r5, r5
 c9 05                 addi.s8	r5, 0x5
 09                    mov	r6, r5
 af                    xor	r7, r7
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f7 6e                 add32	q3, q2
 f2 63                 mov32	q0, q3
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f0 60 80              ldp8u	r4, [q0]
 f0 3c 28              stsp16	[sp+0x28], r4
 c1 70                 ldi8	r5, 0x70
 81                    and	r4, r5
 f4 a4                 tst8	r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 d1 04                 brne8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x2f6
<L32>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0x3e2
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0x3e2
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0x3e2
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0x3e2
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 30 44              ldsp16	r0, [sp+0x44]
 f0 31 46              ldsp16	r1, [sp+0x46]
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f0 63 8c              ldp24	q2, [q3]
 f0 3c 38              stsp16	[sp+0x38], r4
 f0 3d 3a              stsp16	[sp+0x3a], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 63 88              ldp24	q2, [q2]
 f0 3c 32              stsp16	[sp+0x32], r4
 f0 3d 34              stsp16	[sp+0x34], r5
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 f0 62 88              ldp16	r4, [q2]
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 62 c8              ldp16	r6, [q2]
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L33>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x46a
<L33>:
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f2 68                 mov32	q2, q0
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 68                 add32	q2, q0
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f0 60 e8              ldp8u	r7, [q2]
 07                    mov	r5, r7
 f4 8d                 lsr16.1	r5
 c0 01                 ldi8	r4, 0x1
 84                    and	r5, r4
 03                    mov	r4, r7
 c2 01                 ldi8	r6, 0x1
 82                    and	r4, r6
 11                    add	r4, r5
 0b                    mov	r6, r7
 fa 92                 lsr16i	r6, 0x2
 c1 01                 ldi8	r5, 0x1
 89                    and	r6, r5
 18                    add	r6, r4
 fa a3                 lsr16i	r7, 0x3
 8d                    and	r7, r5
 1e                    add	r7, r6
 f0 36 14              ldsp16	r6, [sp+0x14]
 1f                    add	r7, r7
 cb 05                 addi.s8	r7, 0x5
 03                    mov	r4, r7
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L34>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x425
<L34>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 3c              stsp16	[sp+0x3c], r4
 f0 3d 3e              stsp16	[sp+0x3e], r5
 f0 34 28              ldsp16	r4, [sp+0x28]
 f6 2c                 tst16	r4
 f0 34 38              ldsp16	r4, [sp+0x38]
 f0 35 3a              ldsp16	r5, [sp+0x3a]
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 d0 04                 breq8	0x4 <L35>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x4b2
<L35>:
 c2 02                 ldi8	r6, 0x2
 af                    xor	r7, r7
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0x5aa
 c0 0a                 ldi8	r4, 0xa
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 63 88              ldp24	q2, [q2]
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 34 28              ldsp16	r4, [sp+0x28]
 f4 b4                 dec16	r4
 f0 3c 28              stsp16	[sp+0x28], r4
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L36>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x5a7
<L36>:
 f2 6a                 mov32	q3, q0
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f7 6e                 add32	q3, q2
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 3f 26              stsp16	[sp+0x26], r7
 f2 6a                 mov32	q3, q0
 c0 03                 ldi8	r4, 0x3
 f7 6e                 add32	q3, q2
 f0 63 80              ldp24	q2, [q0]
 f0 3c 2a              stsp16	[sp+0x2a], r4
 f0 3d 2c              stsp16	[sp+0x2c], r5
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 63 8c              ldp24	q2, [q3]
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 37 26              ldsp16	r7, [sp+0x26]
 f0 63 cc              ldp24	q3, [q3]
 f0 3e 2e              stsp16	[sp+0x2e], r6
 f0 3f 30              stsp16	[sp+0x30], r7
 f0 36 32              ldsp16	r6, [sp+0x32]
 f0 37 34              ldsp16	r7, [sp+0x34]
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L37>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x73a
<L37>:
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 f0 69 8c              cmp32	q2, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d8 04                 bruge8	0x4 <L38>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x749
<L38>:
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 f0 69 c8              cmp32	q3, q2
 d2 04                 brult8	0x4 <L39>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x74e
<L39>:
 f2 68                 mov32	q2, q0
 c2 09                 ldi8	r6, 0x9
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f0 60 88              ldp8u	r4, [q2]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L40>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x561
<L40>:
 cc 01                 cmpi.s8	r4, 0x1
 f0 36 2e              ldsp16	r6, [sp+0x2e]
 f0 37 30              ldsp16	r7, [sp+0x30]
 d0 04                 breq8	0x4 <L41>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x73f
<L41>:
 f0 34 38              ldsp16	r4, [sp+0x38]
 f0 35 3a              ldsp16	r5, [sp+0x3a]
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L42>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x753
<L42>:
 f0 34 32              ldsp16	r4, [sp+0x32]
 f0 35 34              ldsp16	r5, [sp+0x34]
 f0 69 c8              cmp32	q3, q2
 d2 04                 brult8	0x4 <L43>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x758
<L43>:
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0x572
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 36 2e              ldsp16	r6, [sp+0x2e]
 f0 37 30              ldsp16	r7, [sp+0x30]
 f0 69 c8              cmp32	q3, q2
 d0 04                 breq8	0x4 <L44>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x744
<L44>:
 f0 63 80              ldp24	q2, [q0]
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L45>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x490
<L45>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 63 88              ldp24	q2, [q2]
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f0 69 c8              cmp32	q3, q2
 d2 04                 brult8	0x4 <L46>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x490
<L46>:
 f0 38 3c              stsp16	[sp+0x3c], r0
 f0 39 3e              stsp16	[sp+0x3e], r1
 c2 02                 ldi8	r6, 0x2
 af                    xor	r7, r7
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0x5aa
 c2 02                 ldi8	r6, 0x2
 af                    xor	r7, r7
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f7 68                 add32	q2, q0
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L47>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x874
<L47>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 36 3c              ldsp16	r6, [sp+0x3c]
 f0 37 3e              ldsp16	r7, [sp+0x3e]
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L48>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x86f
<L48>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L49>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x5ee
<L49>:
 c0 09                 ldi8	r4, 0x9
 a5                    xor	r5, r5
 f7 6b                 add32	q2, q3
 f0 60 88              ldp8u	r4, [q2]
 cc 01                 cmpi.s8	r4, 0x1
 d1 04                 brne8	0x4 <L50>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x75d
<L50>:
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f2 68                 mov32	q2, q0
 c2 02                 ldi8	r6, 0x2
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f0 60 88              ldp8u	r4, [q2]
 f4 50                 stsp16	[sp+0x4], r4
 f6 44                 sext8	r4
 f0 3c 10              stsp16	[sp+0x10], r4
 fa bf                 asr16i	r4, 0xf
 c1 0b                 ldi8	r5, 0xb
 84                    and	r5, r4
 f2 6a                 mov32	q3, q0
 f0 00 03              ldi8	r0, 0x3
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 f0 62 8c              ldp16	r4, [q3]
 f0 36 36              ldsp16	r6, [sp+0x36]
 16                    add	r5, r6
 f5 44                 ld16	r0, [r5]
 f2 04                 add	r0, r4
 62                    ld16	r4, [r6]
 f5 20                 cmp	r4, r0
 d2 04                 brult8	0x4 <L51>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x879
<L51>:
 c4 ff f5              ldi16	r4, 0xf5ff
 f2 20                 add	r4, r0
 c5 02 ff              ldi16	r5, 0xff02
 31                    cmp	r4, r5
 d8 04                 bruge8	0x4 <L52>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x87e
<L52>:
 a5                    xor	r5, r5
 f0 38 18              stsp16	[sp+0x18], r0
 f0 3d 1a              stsp16	[sp+0x1a], r5
 c0 05                 ldi8	r4, 0x5
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f7 6e                 add32	q3, q2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 02 05              ldi8	r2, 0x5
 ed 80 1f              ld8u	r4, [r0-1]
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 38 1c              stsp16	[sp+0x1c], r0
 ed f0 1d              ld16	r7, [r0-3]
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0x674
 f0 34 36              ldsp16	r4, [sp+0x36]
 f2 22                 add	r4, r2
 6a                    ld16	r6, [r6]
 72                    st16	[r4], r6
 f1 2f                 mov	r7, r3
 f4 01                 ldsp16	r5, [sp+0x0]
 f0 0a 02              addi.s8	r2, 0x2
 f4 ad                 inc16	r5
 cd 04                 cmpi.s8	r5, 0x4
 d1 04                 brne8	0x4 <L53>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x6de
<L53>:
 f4 12                 ldsp16	r6, [sp+0x4]
 fa 19                 lsr16v	r6, r5
 f0 01 01              ldi8	r1, 0x1
 f9 c4                 and	r6, r1
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L54>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x667
<L54>:
 f1 1f                 mov	r3, r7
 c7 ff ff              ldi16	r7, 0xffff
 0b                    mov	r6, r7
 f4 41                 stsp16	[sp+0x0], r5
 fa 09                 shl16v	r6, r5
 ab                    xor	r6, r7
 f0 34 10              ldsp16	r4, [sp+0x10]
 88                    and	r6, r4
 f9 38                 and	r1, r6
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 03                    mov	r4, r7
 fa 72                 lsr16i	r4, 0x2
 f2 21                 add	r4, r1
 fa a3                 lsr16i	r7, 0x3
 1c                    add	r7, r4
 c0 02                 ldi8	r4, 0x2
 82                    and	r4, r6
 1f                    add	r7, r7
 1c                    add	r7, r4
 0b                    mov	r6, r7
 af                    xor	r7, r7
 f0 00 fe              ldi8	r0, 0xfe
 f9 c0                 and	r6, r0
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f7 6c                 add32	q3, q0
 f0 62 8c              ldp16	r4, [q3]
 08                    mov	r6, r4
 0c                    mov	r7, r4
 fa ef                 asr16i	r7, 0xf
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 f7 6c                 add32	q3, q0
 f0 04 00 f7           ldi16	r0, 0xf700
 f0 05 ff ff           ldi16	r1, 0xffff
 f7 63                 add32	q0, q3
 c0 fe                 ldi8	r4, 0xfe
 a5                    xor	r5, r5
 f0 69 80              cmp32	q2, q0
 d2 04                 brult8	0x4 <L55>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x65c
<L55>:
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0x735
 f0 31 36              ldsp16	r1, [sp+0x36]
 f0 36 14              ldsp16	r6, [sp+0x14]
 ee c2 24              st8	[r1+4], r6
 ee f2 22              st16	[r1+2], r7
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 ee 12 20              st16	[r1+0], r0
 c4 00 f6              ldi16	r4, 0xf600
 f2 04                 add	r0, r4
 a5                    xor	r5, r5
 c4 ff fe              ldi16	r4, 0xfeff
 f5 20                 cmp	r4, r0
 f2 30                 sub	r0, r0
 f0 32 48              ldsp16	r2, [sp+0x48]
 f0 33 4a              ldsp16	r3, [sp+0x4a]
 d8 04                 bruge8	0x4 <L56>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0xcf
<L56>:
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0xad
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0xad
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0xad
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0xad
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0xad
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0xad
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0xad
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0xad
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0xad
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0xad
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0xad
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0xad
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0xad
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0xad
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0xad
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0xad
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0xad
 f0 34 36              ldsp16	r4, [sp+0x36]
 c8 02                 addi.s8	r4, 0x2
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f0 63 88              ldp24	q2, [q2]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 63 88              ldp24	q2, [q2]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 34 40              ldsp16	r4, [sp+0x40]
 f0 35 42              ldsp16	r5, [sp+0x42]
 f0 62 88              ldp16	r4, [q2]
 f4 40                 stsp16	[sp+0x0], r4
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 62 88              ldp16	r4, [q2]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L57>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x7dd
<L57>:
 f0 32 44              ldsp16	r2, [sp+0x44]
 f0 33 46              ldsp16	r3, [sp+0x46]
 f2 6b                 mov32	q3, q1
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 f0 60 ac              ldp8u	r5, [q3]
 09                    mov	r6, r5
 f4 8e                 lsr16.1	r6
 c3 01                 ldi8	r7, 0x1
 f1 07                 mov	r0, r7
 8b                    and	r6, r7
 0d                    mov	r7, r5
 f9 e0                 and	r7, r0
 1e                    add	r7, r6
 09                    mov	r6, r5
 fa 92                 lsr16i	r6, 0x2
 f9 c0                 and	r6, r0
 1b                    add	r6, r7
 fa 83                 lsr16i	r5, 0x3
 f9 a0                 and	r5, r0
 16                    add	r5, r6
 15                    add	r5, r5
 c9 05                 addi.s8	r5, 0x5
 09                    mov	r6, r5
 af                    xor	r7, r7
 f7 67                 add32	q1, q3
 f0 3a 44              stsp16	[sp+0x44], r2
 f0 3b 46              stsp16	[sp+0x46], r3
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L58>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x79d
<L58>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L59>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x883
<L59>:
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 f0 62 88              ldp16	r4, [q2]
 c1 0a                 ldi8	r5, 0xa
 e3 00 00 00           callf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	__avm_umulhisi3
 f2 66                 mov32	q1, q2
 f0 34 44              ldsp16	r4, [sp+0x44]
 f0 35 46              ldsp16	r5, [sp+0x46]
 f7 66                 add32	q1, q2
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 63 04              ldp24	q0, [q1]
 f0 69 c0              cmp32	q3, q0
 d2 04                 brult8	0x4 <L60>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x8c9
<L60>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 69 80              cmp32	q2, q0
 d2 04                 brult8	0x4 <L61>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x8ce
<L61>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L62>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x8d3
<L62>:
 f2 69                 mov32	q2, q1
 c2 03                 ldi8	r6, 0x3
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f0 62 08              ldp16	r0, [q2]
 c2 ff                 ldi8	r6, 0xff
 f5 28                 cmp	r6, r0
 d8 04                 bruge8	0x4 <L63>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x888
<L63>:
 f0 63 c4              ldp24	q3, [q1]
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f0 69 c0              cmp32	q3, q0
 d1 04                 brne8	0x4 <L64>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x88d
<L64>:
 f0 00 05              ldi8	r0, 0x5
 f2 39                 sub	r1, r1
 f7 61                 add32	q0, q1
 f0 63 c4              ldp24	q3, [q1]
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 b4                 dec16	r4
 f4 40                 stsp16	[sp+0x0], r4
 f6 2c                 tst16	r4
 f2 64                 mov32	q1, q0
 d0 04                 breq8	0x4 <L65>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x804
<L65>:
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0xad
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0xad
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0xad
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0xad
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0xad
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0xad
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0xad
 f0 30 36              ldsp16	r0, [sp+0x36]
 ed d0 20              ld16	r6, [r0+0]
 f1 16                 mov	r2, r6
 f2 4b                 sub	r3, r3
 f0 62 88              ldp16	r4, [q2]
 08                    mov	r6, r4
 af                    xor	r7, r7
 f7 6d                 add32	q3, q1
 c4 00 0a              ldi16	r4, 0xa00
 a5                    xor	r5, r5
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L66>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0xad
<L66>:
 ee d0 20              st16	[r0+0], r6
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f0 36 3c              ldsp16	r6, [sp+0x3c]
 f0 37 3e              ldsp16	r7, [sp+0x3e]
 f7 6e                 add32	q3, q2
 f0 63 8c              ldp24	q2, [q3]
 ee 90 22              st16	[r0+2], r4
 01                    mov	r4, r5
 ee 80 24              st8	[r0+4], r4
 c1 01                 ldi8	r5, 0x1
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0xad
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0xad
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0xad
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0xad
