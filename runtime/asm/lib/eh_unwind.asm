
eh_unwind.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 eh_unwind.c
00000000 l    d  .text.avm_eh_validate_block	00000000 .text.avm_eh_validate_block
00000000 l     F .text.site_ok	000000dc site_ok
00000000 l     F .text.call_ok	00000085 call_ok
00000000 l    d  .text.site_ok	00000000 .text.site_ok
00000000 l    d  .text.call_ok	00000000 .text.call_ok
00000000 l    d  .text.avm_eh_find_handler	00000000 .text.avm_eh_find_handler
00000000 l     F .text.unwind_frame	000000d5 unwind_frame
00000000 l     F .text.find_function	000002cb find_function
00000000 l     F .text.find_row	000001ba find_row
00000000 l     F .text.find_site	0000010e find_site
00000000 l     F .text.find_call	0000013d find_call
00000000 l    d  .text.find_function	00000000 .text.find_function
00000000 l    d  .text.find_row	00000000 .text.find_row
00000000 l    d  .text.find_site	00000000 .text.find_site
00000000 l    d  .text.find_call	00000000 .text.find_call
00000000 l    d  .text.unwind_frame	00000000 .text.unwind_frame
00000000 g     F .text.avm_eh_validate_block	000004f3 avm_eh_validate_block
00000000 g     F .text.avm_eh_find_handler	00000110 avm_eh_find_handler
00000000 g     O .rodata.__avm_eh_metadata_ptr	00000003 __avm_eh_metadata_ptr

Disassembly of section .text.avm_eh_validate_block:

<avm_eh_validate_block>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 c0                 adjsp	-0x40
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
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4e2
<L0>:
 f0 60 ac              ldp8u	r5, [q3]
 cd 41                 cmpi.s8	r5, 0x41
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4e2
<L1>:
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f7 63                 add32	q0, q3
 f0 60 a0              ldp8u	r5, [q0]
 cd 56                 cmpi.s8	r5, 0x56
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4e2
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
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4e2
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
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4e2
<L4>:
 f0 00 04              ldi8	r0, 0x4
 f2 39                 sub	r1, r1
 f7 63                 add32	q0, q3
 f0 60 a0              ldp8u	r5, [q0]
 cd 33                 cmpi.s8	r5, 0x33
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4e2
<L5>:
 f0 00 07              ldi8	r0, 0x7
 f2 39                 sub	r1, r1
 f7 63                 add32	q0, q3
 f0 63 40              ldp24	q1, [q0]
 f0 00 0a              ldi8	r0, 0xa
 f2 39                 sub	r1, r1
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4e2
<L6>:
 f2 30                 sub	r0, r0
 f0 05 00 01           ldi16	r1, 0x100
 f7 73                 sub32	q0, q3
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4e2
<L7>:
 f7 67                 add32	q1, q3
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
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4db
<L8>:
 a0                    xor	r4, r4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 3a 34              stsp16	[sp+0x34], r2
 f0 3b 36              stsp16	[sp+0x36], r3
 f0 3d 2a              stsp16	[sp+0x2a], r5
 f7 74                 sub32	q1, q0
 c2 12                 ldi8	r6, 0x12
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 d8 04                 bruge8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4e2
<L9>:
 f0 3a 38              stsp16	[sp+0x38], r2
 f0 3b 3a              stsp16	[sp+0x3a], r3
 c2 0f                 ldi8	r6, 0xf
 af                    xor	r7, r7
 f7 6c                 add32	q3, q0
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 02 0c              ldi8	r2, 0xc
 f2 4b                 sub	r3, r3
 f7 64                 add32	q1, q0
 c2 06                 ldi8	r6, 0x6
 af                    xor	r7, r7
 f7 6c                 add32	q3, q0
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 62 ac              ldp16	r5, [q3]
 f0 3a 20              stsp16	[sp+0x20], r2
 f0 3b 22              stsp16	[sp+0x22], r3
 f0 63 44              ldp24	q1, [q1]
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 63 cc              ldp24	q3, [q3]
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4e2
<L10>:
 f0 38 3c              stsp16	[sp+0x3c], r0
 f0 39 3e              stsp16	[sp+0x3e], r1
 09                    mov	r6, r5
 af                    xor	r7, r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 fa 8e                 lsr16i	r5, 0xe
 1a                    add	r6, r6
 1a                    add	r6, r6
 f1 06                 mov	r0, r6
 f1 0d                 mov	r1, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f7 63                 add32	q0, q3
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f0 02 12              ldi8	r2, 0x12
 f2 4b                 sub	r3, r3
 f7 61                 add32	q0, q1
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4e2
<L11>:
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f4 02                 ldsp16	r6, [sp+0x0]
 06                    mov	r5, r6
 fa 8d                 lsr16i	r5, 0xd
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 f1 06                 mov	r0, r6
 f1 0d                 mov	r1, r5
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f1 17                 mov	r2, r7
 f4 82                 lsl16.1	r2
 f4 82                 lsl16.1	r2
 06                    mov	r5, r6
 fa 8e                 lsr16i	r5, 0xe
 f9 a9                 or	r5, r2
 f4 41                 stsp16	[sp+0x0], r5
 06                    mov	r5, r6
 15                    add	r5, r5
 15                    add	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f1 15                 mov	r2, r5
 f1 1e                 mov	r3, r6
 f7 64                 add32	q1, q0
 f0 36 10              ldsp16	r6, [sp+0x10]
 f7 6d                 add32	q3, q1
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f0 02 12              ldi8	r2, 0x12
 f2 4b                 sub	r3, r3
 f7 6d                 add32	q3, q1
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4e2
<L12>:
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f0 69 c0              cmp32	q3, q0
 f0 30 3c              ldsp16	r0, [sp+0x3c]
 f0 31 3e              ldsp16	r1, [sp+0x3e]
 d8 04                 bruge8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4e2
<L13>:
 f0 02 08              ldi8	r2, 0x8
 f2 4b                 sub	r3, r3
 f7 64                 add32	q1, q0
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 f7 63                 add32	q0, q3
 f0 38 2c              stsp16	[sp+0x2c], r0
 f0 39 2e              stsp16	[sp+0x2e], r1
 f0 62 a0              ldp16	r5, [q0]
 f4 41                 stsp16	[sp+0x0], r5
 f4 4b                 stsp16	[sp+0x2], r7
 f0 3a 24              stsp16	[sp+0x24], r2
 f0 3b 26              stsp16	[sp+0x26], r3
 f0 62 a4              ldp16	r5, [q1]
 09                    mov	r6, r5
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f2 63                 mov32	q0, q3
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f0 30 38              ldsp16	r0, [sp+0x38]
 f0 31 3a              ldsp16	r1, [sp+0x3a]
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4e2
<L14>:
 06                    mov	r5, r6
 fa 8e                 lsr16i	r5, 0xe
 1a                    add	r6, r6
 1a                    add	r6, r6
 f1 16                 mov	r2, r6
 f1 1d                 mov	r3, r5
 f0 36 14              ldsp16	r6, [sp+0x14]
 06                    mov	r5, r6
 fa 8d                 lsr16i	r5, 0xd
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 f1 06                 mov	r0, r6
 f1 0d                 mov	r1, r5
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f7 6f                 add32	q3, q3
 f7 6c                 add32	q3, q0
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f7 6c                 add32	q3, q0
 f7 6d                 add32	q3, q1
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f7 74                 sub32	q1, q0
 f0 69 4c              cmp32	q1, q3
 d0 04                 breq8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4e2
<L15>:
 f0 32 3c              ldsp16	r2, [sp+0x3c]
 f0 33 3e              ldsp16	r3, [sp+0x3e]
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f7 6d                 add32	q3, q1
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f0 69 c0              cmp32	q3, q0
 c2 03                 ldi8	r6, 0x3
 af                    xor	r7, r7
 d1 04                 brne8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4e2
<L16>:
 f0 38 38              stsp16	[sp+0x38], r0
 f0 39 3a              stsp16	[sp+0x3a], r1
 f2 61                 mov32	q0, q1
 f7 63                 add32	q0, q3
 f0 63 c4              ldp24	q3, [q1]
 f0 38 18              stsp16	[sp+0x18], r0
 f0 39 1a              stsp16	[sp+0x1a], r1
 f0 63 40              ldp24	q1, [q0]
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4e2
<L17>:
 f0 3a 30              stsp16	[sp+0x30], r2
 f0 3b 32              stsp16	[sp+0x32], r3
 f0 69 c4              cmp32	q3, q1
 f0 02 12              ldi8	r2, 0x12
 f2 4b                 sub	r3, r3
 d2 04                 brult8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4e2
<L18>:
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 f0 62 ac              ldp16	r5, [q3]
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 37 26              ldsp16	r7, [sp+0x26]
 f0 62 ac              ldp16	r5, [q3]
 f4 61                 stsp16	[sp+0x8], r5
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 62 ac              ldp16	r5, [q3]
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 f0 63 cc              ldp24	q3, [q3]
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 3f 26              stsp16	[sp+0x26], r7
 f0 30 3c              ldsp16	r0, [sp+0x3c]
 f0 31 3e              ldsp16	r1, [sp+0x3e]
 f7 64                 add32	q1, q0
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x3eb
<L19>:
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 f0 63 cc              ldp24	q3, [q3]
 f7 6c                 add32	q3, q0
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4e2
<L20>:
 f7 7d                 sub32	q3, q1
 f0 00 05              ldi8	r0, 0x5
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4e2
<L21>:
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 64                 add32	q1, q0
 f0 60 a4              ldp8u	r5, [q1]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 09                    mov	r6, r5
 f4 8e                 lsr16.1	r6
 f0 00 01              ldi8	r0, 0x1
 f9 c0                 and	r6, r0
 0d                    mov	r7, r5
 f9 a0                 and	r5, r0
 16                    add	r5, r6
 f4 71                 stsp16	[sp+0xc], r5
 07                    mov	r5, r7
 fa 82                 lsr16i	r5, 0x2
 f9 a0                 and	r5, r0
 f4 32                 ldsp16	r6, [sp+0xc]
 16                    add	r5, r6
 09                    mov	r6, r5
 f4 73                 stsp16	[sp+0xc], r7
 07                    mov	r5, r7
 fa 83                 lsr16i	r5, 0x3
 f9 a0                 and	r5, r0
 16                    add	r5, r6
 15                    add	r5, r5
 c9 05                 addi.s8	r5, 0x5
 f1 05                 mov	r0, r5
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4e2
<L22>:
 c1 70                 ldi8	r5, 0x70
 f4 32                 ldsp16	r6, [sp+0xc]
 89                    and	r6, r5
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4e2
<L23>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 62 ac              ldp16	r5, [q3]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 30 38              ldsp16	r0, [sp+0x38]
 f0 31 3a              ldsp16	r1, [sp+0x3a]
 f0 69 0c              cmp32	q0, q3
 d1 04                 brne8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x37e
<L24>:
 f0 62 c0              ldp16	r6, [q0]
 39                    cmp	r6, r5
 f0 30 3c              ldsp16	r0, [sp+0x3c]
 f0 31 3e              ldsp16	r1, [sp+0x3e]
 d2 04                 brult8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4e2
<L25>:
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x38c
 f6 2d                 tst16	r5
 f0 30 3c              ldsp16	r0, [sp+0x3c]
 f0 31 3e              ldsp16	r1, [sp+0x3e]
 d0 04                 breq8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4e2
<L26>:
 09                    mov	r6, r5
 af                    xor	r7, r7
 f0 63 00              ldp24	q0, [q0]
 f7 63                 add32	q0, q3
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f0 63 cc              ldp24	q3, [q3]
 f0 69 0c              cmp32	q0, q3
 d2 04                 brult8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4e2
<L27>:
 f0 60 a4              ldp8u	r5, [q1]
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
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f7 6c                 add32	q3, q0
 f0 35 14              ldsp16	r5, [sp+0x14]
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 f0 38 38              stsp16	[sp+0x38], r0
 f0 39 3a              stsp16	[sp+0x3a], r1
 f2 67                 mov32	q1, q3
 f0 30 3c              ldsp16	r0, [sp+0x3c]
 f0 31 3e              ldsp16	r1, [sp+0x3e]
 d0 04                 breq8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x2d9
<L28>:
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x3ed
 f2 6b                 mov32	q3, q1
 f2 64                 mov32	q1, q0
 f0 30 24              ldsp16	r0, [sp+0x24]
 f0 31 26              ldsp16	r1, [sp+0x26]
 f7 61                 add32	q0, q1
 f0 69 c0              cmp32	q3, q0
 f2 6a                 mov32	q3, q0
 d0 04                 breq8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4e2
<L29>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x451
<L30>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 30 3c              ldsp16	r0, [sp+0x3c]
 f0 31 3e              ldsp16	r1, [sp+0x3e]
 d6 fc                 adjsp	-0x4
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 68                 mov32	q2, q0
 f2 63                 mov32	q0, q3
 e3 00 00 00           callf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.site_ok
 d6 04                 adjsp	0x4
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4e9
<L31>:
 f2 64                 mov32	q1, q0
 c0 0a                 ldi8	r4, 0xa
 a5                    xor	r5, r5
 f7 66                 add32	q1, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 b4                 dec16	r4
 f4 60                 stsp16	[sp+0x8], r4
 f6 2c                 tst16	r4
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 f0 30 3c              ldsp16	r0, [sp+0x3c]
 f0 31 3e              ldsp16	r1, [sp+0x3e]
 d0 04                 breq8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x414
<L32>:
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x459
 f2 67                 mov32	q1, q3
 f0 30 3c              ldsp16	r0, [sp+0x3c]
 f0 31 3e              ldsp16	r1, [sp+0x3e]
 f0 34 10              ldsp16	r4, [sp+0x10]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L33>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x49f
<L33>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d6 fc                 adjsp	-0x4
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.call_ok
 d6 04                 adjsp	0x4
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L34>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4ee
<L34>:
 f2 6b                 mov32	q3, q1
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f7 6e                 add32	q3, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f4 b4                 dec16	r4
 f0 3c 10              stsp16	[sp+0x10], r4
 f6 2c                 tst16	r4
 f2 69                 mov32	q2, q1
 f2 67                 mov32	q1, q3
 d0 04                 breq8	0x4 <L35>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x466
<L35>:
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4a1
 f2 6b                 mov32	q3, q1
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 f0 69 c4              cmp32	q3, q1
 a0                    xor	r4, r4
 f0 36 28              ldsp16	r6, [sp+0x28]
 d0 04                 breq8	0x4 <L36>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4e2
<L36>:
 f4 ae                 inc16	r6
 f0 3e 28              stsp16	[sp+0x28], r6
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 39                    cmp	r6, r5
 f2 61                 mov32	q0, q1
 f0 36 30              ldsp16	r6, [sp+0x30]
 f0 37 32              ldsp16	r7, [sp+0x32]
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f2 6b                 mov32	q3, q1
 f0 32 34              ldsp16	r2, [sp+0x34]
 f0 33 36              ldsp16	r3, [sp+0x36]
 d0 04                 breq8	0x4 <L37>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0xcc
<L37>:
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4dd
 f2 6a                 mov32	q3, q0
 f0 69 c4              cmp32	q3, q1
 f8 04                 cset.eq	r4
 d6 40                 adjsp	0x40
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4e2
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4e2

Disassembly of section .text.site_ok:

<site_ok>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f2 67                 mov32	q1, q3
 f2 62                 mov32	q0, q2
 f0 34 13              ldsp16	r4, [sp+0x13]
 f0 35 15              ldsp16	r5, [sp+0x15]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 c2 03                 ldi8	r6, 0x3
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	site_ok
		R_AVM_FAR24	.text.site_ok+0x2c
<L0>:
 f7 6b                 add32	q2, q3
 f0 63 88              ldp24	q2, [q2]
 e2 00 00 00           jmpf	site_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.site_ok+0x2f
 f0 63 80              ldp24	q2, [q0]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 61                 mov32	q0, q1
 f2 6a                 mov32	q3, q0
 f7 6e                 add32	q3, q2
 f0 63 80              ldp24	q2, [q0]
 f0 63 4c              ldp24	q1, [q3]
 f0 69 84              cmp32	q2, q1
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	site_ok
		R_AVM_FAR24	.text.site_ok+0x61
<L1>:
 f0 63 80              ldp24	q2, [q0]
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 69 84              cmp32	q2, q1
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	site_ok
		R_AVM_FAR24	.text.site_ok+0x69
<L2>:
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	site_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.site_ok+0x62
 a0                    xor	r4, r4
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f0 02 03              ldi8	r2, 0x3
 f2 4b                 sub	r3, r3
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 8c              ldp24	q2, [q3]
 f0 63 c4              ldp24	q3, [q1]
 f0 69 c8              cmp32	q3, q2
 d2 04                 brult8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	site_ok
		R_AVM_FAR24	.text.site_ok+0x88
<L3>:
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	site_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.site_ok+0x62
 c0 09                 ldi8	r4, 0x9
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f0 60 88              ldp8u	r4, [q2]
 cc 01                 cmpi.s8	r4, 0x1
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	site_ok
		R_AVM_FAR24	.text.site_ok+0xb4
<L4>:
 f4 a4                 tst8	r4
 a0                    xor	r4, r4
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	site_ok
		R_AVM_FAR24	.text.site_ok+0x62
<L5>:
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f0 63 80              ldp24	q2, [q0]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 f8 04                 cset.eq	r4
 e2 00 00 00           jmpf	site_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.site_ok+0x62
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f0 63 80              ldp24	q2, [q0]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 63 cc              ldp24	q3, [q3]
 f0 69 8c              cmp32	q2, q3
 a0                    xor	r4, r4
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	site_ok
		R_AVM_FAR24	.text.site_ok+0x62
<L6>:
 f0 63 80              ldp24	q2, [q0]
 f0 63 c4              ldp24	q3, [q1]
 f0 69 8c              cmp32	q2, q3
 f8 14                 cset.ult	r4
 e2 00 00 00           jmpf	site_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.site_ok+0x62

Disassembly of section .text.call_ok:

<call_ok>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f0 00 03              ldi8	r0, 0x3
 f2 39                 sub	r1, r1
 f2 66                 mov32	q1, q2
 f7 64                 add32	q1, q0
 f0 30 17              ldsp16	r0, [sp+0x17]
 f0 31 19              ldsp16	r1, [sp+0x19]
 f0 63 88              ldp24	q2, [q2]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 63 84              ldp24	q2, [q1]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 63 4c              ldp24	q1, [q3]
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	call_ok
		R_AVM_FAR24	.text.call_ok+0x38
<L0>:
 f0 63 80              ldp24	q2, [q0]
 e2 00 00 00           jmpf	call_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.call_ok+0x3c
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 a0                    xor	r4, r4
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f0 69 04              cmp32	q0, q1
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	call_ok
		R_AVM_FAR24	.text.call_ok+0x79
<L1>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 69 84              cmp32	q2, q1
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	call_ok
		R_AVM_FAR24	.text.call_ok+0x80
<L2>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 84              cmp32	q2, q1
 a0                    xor	r4, r4
 d2 04                 brult8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	call_ok
		R_AVM_FAR24	.text.call_ok+0x79
<L3>:
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f7 6e                 add32	q3, q2
 f0 62 8c              ldp16	r4, [q3]
 c5 00 01              ldi16	r5, 0x100
 31                    cmp	r4, r5
 f8 14                 cset.ult	r4
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	call_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.call_ok+0x79

Disassembly of section .text.avm_eh_find_handler:

<avm_eh_find_handler>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 f1 04                 mov	r0, r4
 c4 00 f6              ldi16	r4, 0xf600
 f4 60                 stsp16	[sp+0x8], r4
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 c4 00 ff              ldi16	r4, 0xff00
 f4 58                 stsp16	[sp+0x6], r4
 f1 20                 mov	r4, r0
 c8 02                 addi.s8	r4, 0x2
 f4 50                 stsp16	[sp+0x4], r4
 f0 38 02              stsp16	[sp+0x2], r0
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0x39
 f0 30 02              ldsp16	r0, [sp+0x2]
 f1 20                 mov	r4, r0
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 e3 00 00 00           callf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.unwind_frame
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x107
<L0>:
 ed 90 20              ld16	r4, [r0+0]
 f4 21                 ldsp16	r5, [sp+0x8]
 11                    add	r4, r5
 f4 19                 ldsp16	r5, [sp+0x6]
 31                    cmp	r4, r5
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x107
<L1>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function
 f2 66                 mov32	q1, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x107
<L2>:
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_row
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_site
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f0 30 0a              ldsp16	r0, [sp+0xa]
 f0 31 0c              ldsp16	r1, [sp+0xc]
 f7 6c                 add32	q3, q0
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x107
<L3>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 8c              cmp32	q2, q3
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x107
<L4>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x22
<L5>:
 c2 09                 ldi8	r6, 0x9
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f0 60 cc              ldp8u	r6, [q3]
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x22
<L6>:
 f2 62                 mov32	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_call
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 8c              cmp32	q2, q3
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x107
<L7>:
 f0 32 02              ldsp16	r2, [sp+0x2]
 ed d4 20              ld16	r6, [r2+0]
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 c6 00 0a              ldi16	r6, 0xa00
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x107
<L8>:
 ee 94 20              st16	[r2+0], r4
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f0 63 80              ldp24	q2, [q0]
 ee 94 22              st16	[r2+2], r4
 01                    mov	r4, r5
 ee 84 24              st8	[r2+4], r4
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.find_function:

<find_function>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 da                 adjsp	-0x26
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	__avm_eh_metadata_ptr
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	__avm_eh_metadata_ptr
 f0 63 cc              ldp24	q3, [q3]
 f2 42                 sub	r2, r2
 f0 07 00 ff           ldi16	r3, 0xff00
 f7 67                 add32	q1, q3
 f0 00 01              ldi8	r0, 0x1
 f0 05 00 ff           ldi16	r1, 0xff00
 f0 69 40              cmp32	q1, q0
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x2c
<L0>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x282
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 60 8c              ldp8u	r4, [q3]
 cc 41                 cmpi.s8	r4, 0x41
 f2 67                 mov32	q1, q3
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x268
<L1>:
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 60 88              ldp8u	r4, [q2]
 cc 56                 cmpi.s8	r4, 0x56
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x26e
<L2>:
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 60 88              ldp8u	r4, [q2]
 cc 45                 cmpi.s8	r4, 0x45
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x274
<L3>:
 c2 03                 ldi8	r6, 0x3
 af                    xor	r7, r7
 f2 69                 mov32	q2, q1
 f7 6b                 add32	q2, q3
 f0 60 88              ldp8u	r4, [q2]
 cc 48                 cmpi.s8	r4, 0x48
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x27a
<L4>:
 c0 04                 ldi8	r4, 0x4
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 60 88              ldp8u	r4, [q2]
 cc 33                 cmpi.s8	r4, 0x33
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x280
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
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x28f
<L6>:
 a0                    xor	r4, r4
 c5 00 01              ldi16	r5, 0x100
 f7 79                 sub32	q2, q1
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x289
<L7>:
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 62 88              ldp16	r4, [q2]
 f0 3c 10              stsp16	[sp+0x10], r4
 f6 2c                 tst16	r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x282
<L8>:
 f7 6d                 add32	q3, q1
 c0 0a                 ldi8	r4, 0xa
 a5                    xor	r5, r5
 f7 66                 add32	q1, q2
 a0                    xor	r4, r4
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3d 24              stsp16	[sp+0x24], r5
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f0 3f 1c              stsp16	[sp+0x1c], r7
 02                    mov	r4, r6
 07                    mov	r5, r7
 f7 79                 sub32	q2, q1
 f0 00 12              ldi8	r0, 0x12
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x29b
<L9>:
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 62 c8              ldp16	r6, [q2]
 c0 0c                 ldi8	r4, 0xc
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 63 08              ldp24	q0, [q2]
 c0 0f                 ldi8	r4, 0xf
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 63 88              ldp24	q2, [q2]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x2a1
<L10>:
 af                    xor	r7, r7
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 02                    mov	r4, r6
 fa 7e                 lsr16i	r4, 0xe
 06                    mov	r5, r6
 15                    add	r5, r5
 15                    add	r5, r5
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 f7 6b                 add32	q2, q3
 f0 38 1e              stsp16	[sp+0x1e], r0
 f0 39 20              stsp16	[sp+0x20], r1
 f0 00 12              ldi8	r0, 0x12
 f2 39                 sub	r1, r1
 f7 68                 add32	q2, q0
 f0 30 1e              ldsp16	r0, [sp+0x1e]
 f0 31 20              ldsp16	r1, [sp+0x20]
 f0 69 08              cmp32	q0, q2
 d8 04                 bruge8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x2a7
<L11>:
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f4 10                 ldsp16	r4, [sp+0x4]
 04                    mov	r5, r4
 fa 8d                 lsr16i	r5, 0xd
 10                    add	r4, r4
 10                    add	r4, r4
 10                    add	r4, r4
 f1 14                 mov	r2, r4
 f1 1d                 mov	r3, r5
 03                    mov	r4, r7
 10                    add	r4, r4
 10                    add	r4, r4
 06                    mov	r5, r6
 fa 8e                 lsr16i	r5, 0xe
 94                    or	r5, r4
 02                    mov	r4, r6
 10                    add	r4, r4
 10                    add	r4, r4
 f7 69                 add32	q2, q1
 f7 6e                 add32	q3, q2
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f0 35 20              ldsp16	r5, [sp+0x20]
 f0 00 12              ldi8	r0, 0x12
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x2ad
<L12>:
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x2b3
<L13>:
 c0 08                 ldi8	r4, 0x8
 a5                    xor	r5, r5
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f7 6b                 add32	q2, q3
 f2 61                 mov32	q0, q1
 f0 02 0a              ldi8	r2, 0xa
 f2 4b                 sub	r3, r3
 f7 6d                 add32	q3, q1
 f0 62 cc              ldp16	r6, [q3]
 af                    xor	r7, r7
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 62 88              ldp16	r4, [q2]
 08                    mov	r6, r4
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 27                 mov	r5, r3
 f2 66                 mov32	q1, q2
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x2b9
<L14>:
 f4 10                 ldsp16	r4, [sp+0x4]
 04                    mov	r5, r4
 fa 8e                 lsr16i	r5, 0xe
 10                    add	r4, r4
 10                    add	r4, r4
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 34 16              ldsp16	r4, [sp+0x16]
 04                    mov	r5, r4
 fa 8d                 lsr16i	r5, 0xd
 10                    add	r4, r4
 10                    add	r4, r4
 10                    add	r4, r4
 f7 6f                 add32	q3, q3
 f7 6e                 add32	q3, q2
 f7 6d                 add32	q3, q1
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f7 6e                 add32	q3, q2
 f2 68                 mov32	q2, q0
 f0 32 1e              ldsp16	r2, [sp+0x1e]
 f0 33 20              ldsp16	r3, [sp+0x20]
 f7 79                 sub32	q2, q1
 f0 69 8c              cmp32	q2, q3
 f2 68                 mov32	q2, q0
 d0 04                 breq8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x2bf
<L15>:
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f7 6b                 add32	q2, q3
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 d1 04                 brne8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x295
<L16>:
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 02 03              ldi8	r2, 0x3
 f2 4b                 sub	r3, r3
 f7 69                 add32	q2, q1
 f0 63 cc              ldp24	q3, [q3]
 f0 63 48              ldp24	q1, [q2]
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x295
<L17>:
 f0 69 c4              cmp32	q3, q1
 d2 04                 brult8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x295
<L18>:
 f2 61                 mov32	q0, q1
 f0 32 22              ldsp16	r2, [sp+0x22]
 f0 33 24              ldsp16	r3, [sp+0x24]
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x2c5
<L19>:
 f0 69 80              cmp32	q2, q0
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 d8 04                 bruge8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x282
<L20>:
 f0 34 10              ldsp16	r4, [sp+0x10]
 f4 b4                 dec16	r4
 f0 3c 10              stsp16	[sp+0x10], r4
 f6 2c                 tst16	r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 38 22              stsp16	[sp+0x22], r0
 f0 39 24              stsp16	[sp+0x24], r1
 f2 66                 mov32	q1, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d0 04                 breq8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0xcb
<L21>:
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x282
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x282
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x282
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x282
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x282
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d6 26                 adjsp	0x26
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x282
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x282
 f2 68                 mov32	q2, q0
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x282
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x282
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x282
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x282
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x282
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x282
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x282
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x282
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x282

Disassembly of section .text.find_row:

<find_row>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 de                 adjsp	-0x22
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 3f 18              stsp16	[sp+0x18], r7
 c2 06                 ldi8	r6, 0x6
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f0 62 cc              ldp16	r6, [q3]
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_row
		R_AVM_FAR24	.text.find_row+0x1a1
<L0>:
 f0 3e 10              stsp16	[sp+0x10], r6
 c2 03                 ldi8	r6, 0x3
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f0 3f 1c              stsp16	[sp+0x1c], r7
 c2 0c                 ldi8	r6, 0xc
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 c2 12                 ldi8	r6, 0x12
 af                    xor	r7, r7
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f7 6e                 add32	q3, q2
 f0 3e 1e              stsp16	[sp+0x1e], r6
 f0 3f 20              stsp16	[sp+0x20], r7
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 f8 04                 cset.eq	r4
 f4 70                 stsp16	[sp+0xc], r4
 f0 02 02              ldi8	r2, 0x2
 f2 4b                 sub	r3, r3
 c0 01                 ldi8	r4, 0x1
 f0 30 1e              ldsp16	r0, [sp+0x1e]
 f0 31 20              ldsp16	r1, [sp+0x20]
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_row
		R_AVM_FAR24	.text.find_row+0x95
<L1>:
 f2 63                 mov32	q0, q3
 0c                    mov	r7, r4
 f2 68                 mov32	q2, q0
 f7 69                 add32	q2, q1
 f0 60 88              ldp8u	r4, [q2]
 08                    mov	r6, r4
 f4 8e                 lsr16.1	r6
 8b                    and	r6, r7
 04                    mov	r5, r4
 87                    and	r5, r7
 16                    add	r5, r6
 f4 49                 stsp16	[sp+0x2], r5
 04                    mov	r5, r4
 fa 82                 lsr16i	r5, 0x2
 87                    and	r5, r7
 f4 41                 stsp16	[sp+0x0], r5
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 02                 ldsp16	r6, [sp+0x0]
 19                    add	r6, r5
 f4 42                 stsp16	[sp+0x0], r6
 fa 73                 lsr16i	r4, 0x3
 83                    and	r4, r7
 f2 6a                 mov32	q3, q0
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 10                    add	r4, r4
 c8 05                 addi.s8	r4, 0x5
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f7 63                 add32	q0, q3
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f0 63 88              ldp24	q2, [q2]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f7 6b                 add32	q2, q3
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_row
		R_AVM_FAR24	.text.find_row+0x1a5
<L2>:
 f7 78                 sub32	q2, q0
 c2 05                 ldi8	r6, 0x5
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_row
		R_AVM_FAR24	.text.find_row+0x1a5
<L3>:
 c2 02                 ldi8	r6, 0x2
 af                    xor	r7, r7
 f7 6c                 add32	q3, q0
 f0 60 ec              ldp8u	r7, [q3]
 f4 43                 stsp16	[sp+0x0], r7
 f4 8f                 lsr16.1	r7
 c2 01                 ldi8	r6, 0x1
 8e                    and	r7, r6
 f4 7b                 stsp16	[sp+0xe], r7
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 4a                 stsp16	[sp+0x2], r6
 c2 01                 ldi8	r6, 0x1
 f4 0b                 ldsp16	r7, [sp+0x2]
 8e                    and	r7, r6
 0b                    mov	r6, r7
 f4 3b                 ldsp16	r7, [sp+0xe]
 1b                    add	r6, r7
 f4 4a                 stsp16	[sp+0x2], r6
 f4 03                 ldsp16	r7, [sp+0x0]
 fa a2                 lsr16i	r7, 0x2
 c2 01                 ldi8	r6, 0x1
 8e                    and	r7, r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 1e                    add	r7, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 fa 93                 lsr16i	r6, 0x3
 f0 02 01              ldi8	r2, 0x1
 f9 c8                 and	r6, r2
 1b                    add	r6, r7
 1a                    add	r6, r6
 ca 05                 addi.s8	r6, 0x5
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_row
		R_AVM_FAR24	.text.find_row+0x1ae
<L4>:
 c0 70                 ldi8	r4, 0x70
 f4 01                 ldsp16	r5, [sp+0x0]
 84                    and	r5, r4
 f4 a5                 tst8	r5
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_row
		R_AVM_FAR24	.text.find_row+0x1a5
<L5>:
 f0 62 80              ldp16	r4, [q0]
 f4 31                 ldsp16	r5, [sp+0xc]
 c2 01                 ldi8	r6, 0x1
 86                    and	r5, r6
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_row
		R_AVM_FAR24	.text.find_row+0x143
<L6>:
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 62 ac              ldp16	r5, [q3]
 34                    cmp	r5, r4
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 d2 04                 brult8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_row
		R_AVM_FAR24	.text.find_row+0x1a5
<L7>:
 e2 00 00 00           jmpf	find_row
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_row+0x14f
 f6 2c                 tst16	r4
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_row
		R_AVM_FAR24	.text.find_row+0x1a5
<L8>:
 a5                    xor	r5, r5
 f0 63 cc              ldp24	q3, [q3]
 f7 6e                 add32	q3, q2
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 f0 63 88              ldp24	q2, [q2]
 f0 69 c8              cmp32	q3, q2
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 d2 04                 brult8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_row
		R_AVM_FAR24	.text.find_row+0x1a5
<L9>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 63 88              ldp24	q2, [q2]
 f2 67                 mov32	q1, q3
 f0 62 c0              ldp16	r6, [q0]
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_row
		R_AVM_FAR24	.text.find_row+0x1a5
<L10>:
 f0 34 10              ldsp16	r4, [sp+0x10]
 f4 b4                 dec16	r4
 f0 3c 10              stsp16	[sp+0x10], r4
 f6 2c                 tst16	r4
 f2 6a                 mov32	q3, q0
 f2 64                 mov32	q1, q0
 d0 04                 breq8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_row
		R_AVM_FAR24	.text.find_row+0x48
<L11>:
 e2 00 00 00           jmpf	find_row
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_row+0x1a5
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f2 69                 mov32	q2, q1
 d6 22                 adjsp	0x22
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 e2 00 00 00           jmpf	find_row
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_row+0x1a5

Disassembly of section .text.find_site:

<find_site>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 f2 67                 mov32	q1, q3
 c2 0c                 ldi8	r6, 0xc
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f0 63 0c              ldp24	q0, [q3]
 c2 08                 ldi8	r6, 0x8
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f0 62 cc              ldp16	r6, [q3]
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_site
		R_AVM_FAR24	.text.find_site+0x5a
<L0>:
 f4 72                 stsp16	[sp+0xc], r6
 f7 62                 add32	q0, q2
 d6 fc                 adjsp	-0x4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	find_site
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.site_ok
 d6 04                 adjsp	0x4
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_site
		R_AVM_FAR24	.text.find_site+0x105
<L1>:
 f0 63 80              ldp24	q2, [q0]
 f0 69 48              cmp32	q1, q2
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_site
		R_AVM_FAR24	.text.find_site+0x60
<L2>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 e2 00 00 00           jmpf	find_site
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_site+0x105
 aa                    xor	r6, r6
 af                    xor	r7, r7
 e2 00 00 00           jmpf	find_site
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_site+0x105
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f0 63 88              ldp24	q2, [q2]
 f0 69 48              cmp32	q1, q2
 d2 04                 brult8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_site
		R_AVM_FAR24	.text.find_site+0x77
<L3>:
 f2 6a                 mov32	q3, q0
 e2 00 00 00           jmpf	find_site
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_site+0x105
 f4 30                 ldsp16	r4, [sp+0xc]
 cc 01                 cmpi.s8	r4, 0x1
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_site
		R_AVM_FAR24	.text.find_site+0x87
<L4>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 e2 00 00 00           jmpf	find_site
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_site+0x105
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f4 b4                 dec16	r4
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f2 64                 mov32	q1, q0
 f4 70                 stsp16	[sp+0xc], r4
 d6 fc                 adjsp	-0x4
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 66                 add32	q1, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	find_site
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.site_ok
 d6 04                 adjsp	0x4
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_site
		R_AVM_FAR24	.text.find_site+0xf3
<L5>:
 f0 63 84              ldp24	q2, [q1]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_site
		R_AVM_FAR24	.text.find_site+0xfd
<L6>:
 c0 0d                 ldi8	r4, 0xd
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f0 63 80              ldp24	q2, [q0]
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_site
		R_AVM_FAR24	.text.find_site+0x103
<L7>:
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 f2 61                 mov32	q0, q1
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_site
		R_AVM_FAR24	.text.find_site+0x98
<L8>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 e2 00 00 00           jmpf	find_site
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_site+0x105
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 e2 00 00 00           jmpf	find_site
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_site+0x105
 aa                    xor	r6, r6
 af                    xor	r7, r7
 e2 00 00 00           jmpf	find_site
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_site+0x105
 f2 6b                 mov32	q3, q1
 02                    mov	r4, r6
 07                    mov	r5, r7
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.find_call:

<find_call>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c2 0c                 ldi8	r6, 0xc
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f0 63 cc              ldp24	q3, [q3]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 c2 08                 ldi8	r6, 0x8
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f0 62 cc              ldp16	r6, [q3]
 af                    xor	r7, r7
 f2 67                 mov32	q1, q3
 f0 00 0a              ldi8	r0, 0xa
 f2 39                 sub	r1, r1
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f7 62                 add32	q0, q2
 f0 62 e0              ldp16	r7, [q0]
 f4 73                 stsp16	[sp+0xc], r7
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_call
		R_AVM_FAR24	.text.find_call+0x88
<L0>:
 0e                    mov	r7, r6
 fa ad                 lsr16i	r7, 0xd
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 62                 add32	q0, q2
 f7 65                 add32	q1, q1
 f7 64                 add32	q1, q0
 f7 67                 add32	q1, q3
 d6 fc                 adjsp	-0x4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	find_call
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.call_ok
 d6 04                 adjsp	0x4
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_call
		R_AVM_FAR24	.text.find_call+0x92
<L1>:
 f0 63 84              ldp24	q2, [q1]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 8c              cmp32	q2, q3
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_call
		R_AVM_FAR24	.text.find_call+0x9f
<L2>:
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 62 88              ldp16	r4, [q2]
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_call
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_call+0x98
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 e2 00 00 00           jmpf	find_call
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_call+0x98
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_call
		R_AVM_FAR24	.text.find_call+0x11f
<L3>:
 f4 30                 ldsp16	r4, [sp+0xc]
 cc 01                 cmpi.s8	r4, 0x1
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_call
		R_AVM_FAR24	.text.find_call+0x115
<L4>:
 c8 fe                 addi.s8	r4, -0x2
 f0 00 05              ldi8	r0, 0x5
 f2 39                 sub	r1, r1
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f4 70                 stsp16	[sp+0xc], r4
 f2 63                 mov32	q0, q3
 d6 fc                 adjsp	-0x4
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 66                 add32	q1, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	find_call
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.call_ok
 d6 04                 adjsp	0x4
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_call
		R_AVM_FAR24	.text.find_call+0x129
<L5>:
 f0 63 c4              ldp24	q3, [q1]
 f0 69 c0              cmp32	q3, q0
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_call
		R_AVM_FAR24	.text.find_call+0x7b
<L6>:
 f4 31                 ldsp16	r5, [sp+0xc]
 01                    mov	r4, r5
 f4 b4                 dec16	r4
 f0 69 0c              cmp32	q0, q3
 f2 6a                 mov32	q3, q0
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_call
		R_AVM_FAR24	.text.find_call+0x133
<L7>:
 f6 2d                 tst16	r5
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_call
		R_AVM_FAR24	.text.find_call+0xbf
<L8>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 e2 00 00 00           jmpf	find_call
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_call+0x98
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 e2 00 00 00           jmpf	find_call
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_call+0x98
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 e2 00 00 00           jmpf	find_call
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_call+0x98
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 e2 00 00 00           jmpf	find_call
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_call+0x98
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 e2 00 00 00           jmpf	find_call
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_call+0x98

Disassembly of section .text.unwind_frame:

<unwind_frame>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ec                 adjsp	-0x14
 f2 63                 mov32	q0, q3
 f0 02 02              ldi8	r2, 0x2
 f2 4b                 sub	r3, r3
 f7 6d                 add32	q3, q1
 f0 61 cc              ldp8s	r6, [q3]
 f4 52                 stsp16	[sp+0x4], r6
 fa df                 asr16i	r6, 0xf
 c1 0b                 ldi8	r5, 0xb
 86                    and	r5, r6
 f0 02 03              ldi8	r2, 0x3
 f7 64                 add32	q1, q0
 f0 62 c4              ldp16	r6, [q1]
 14                    add	r5, r4
 6d                    ld16	r7, [r5]
 1e                    add	r7, r6
 a5                    xor	r5, r5
 f4 49                 stsp16	[sp+0x2], r5
 f4 58                 stsp16	[sp+0x6], r4
 64                    ld16	r5, [r4]
 0b                    mov	r6, r7
 36                    cmp	r5, r6
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	unwind_frame
		R_AVM_FAR24	.text.unwind_frame+0xcc
<L0>:
 c4 ff f5              ldi16	r4, 0xf5ff
 12                    add	r4, r6
 c5 02 ff              ldi16	r5, 0xff02
 31                    cmp	r4, r5
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	unwind_frame
		R_AVM_FAR24	.text.unwind_frame+0xcc
<L1>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 74                 zext8	r4
 f4 50                 stsp16	[sp+0x4], r4
 a5                    xor	r5, r5
 f4 62                 stsp16	[sp+0x8], r6
 f4 69                 stsp16	[sp+0xa], r5
 c0 05                 ldi8	r4, 0x5
 f7 62                 add32	q0, q2
 af                    xor	r7, r7
 f0 02 05              ldi8	r2, 0x5
 ed 8c 1f              ld8u	r4, [r6-1]
 f4 70                 stsp16	[sp+0xc], r4
 f0 3e 10              stsp16	[sp+0x10], r6
 ed 9c 1d              ld16	r4, [r6-3]
 f4 78                 stsp16	[sp+0xe], r4
 f4 10                 ldsp16	r4, [sp+0x4]
 fa 13                 lsr16v	r4, r7
 c1 01                 ldi8	r5, 0x1
 f4 49                 stsp16	[sp+0x2], r5
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	unwind_frame
		R_AVM_FAR24	.text.unwind_frame+0xa8
<L2>:
 f0 3a 12              stsp16	[sp+0x12], r2
 f4 43                 stsp16	[sp+0x0], r7
 f0 62 80              ldp16	r4, [q0]
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f7 6b                 add32	q2, q3
 c6 00 f7              ldi16	r6, 0xf700
 c7 ff ff              ldi16	r7, 0xffff
 f7 6e                 add32	q3, q2
 f0 02 fe              ldi8	r2, 0xfe
 f2 4b                 sub	r3, r3
 f0 69 4c              cmp32	q1, q3
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	unwind_frame
		R_AVM_FAR24	.text.unwind_frame+0xc9
<L3>:
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 32 12              ldsp16	r2, [sp+0x12]
 f2 2e                 add	r7, r2
 68                    ld16	r6, [r4]
 7e                    st16	[r7], r6
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f4 03                 ldsp16	r7, [sp+0x0]
 f0 0a 02              addi.s8	r2, 0x2
 f4 af                 inc16	r7
 cf 04                 cmpi.s8	r7, 0x4
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	unwind_frame
		R_AVM_FAR24	.text.unwind_frame+0x60
<L4>:
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 30                 ldsp16	r4, [sp+0xc]
 ee 8a 24              st8	[r5+4], r4
 f4 38                 ldsp16	r4, [sp+0xe]
 ee 9a 22              st16	[r5+2], r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 74                    st16	[r5], r4
 e2 00 00 00           jmpf	unwind_frame
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.unwind_frame+0xcc
 a0                    xor	r4, r4
 f4 48                 stsp16	[sp+0x2], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 d6 14                 adjsp	0x14
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
