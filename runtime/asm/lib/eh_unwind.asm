
eh_unwind.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 eh_unwind.c
00000000 l    d  .text.avm_eh_validate_block	00000000 .text.avm_eh_validate_block
00000000 l     F .text.site_ok	000000ca site_ok
00000000 l     F .text.pool_ok	0000023a pool_ok
00000000 l     F .text.site_has_call	00000075 site_has_call
00000000 l    d  .text.site_ok	00000000 .text.site_ok
00000000 l    d  .text.pool_ok	00000000 .text.pool_ok
00000000 l     F .text.list_ok	000001c7 list_ok
00000000 l     F .text.list_named	0000007a list_named
00000000 l    d  .text.site_has_call	00000000 .text.site_has_call
00000000 l    d  .text.avm_eh_find_handler	00000000 .text.avm_eh_find_handler
00000000 l     F .text.unwind_frame	000000d5 unwind_frame
00000000 l     F .text.find_function	000002c1 find_function
00000000 l     F .text.find_row	000001ba find_row
00000000 l     F .text.find_site	0000010a find_site
00000000 l     F .text.match_list	000000ee match_list
00000000 l     F .text.find_call	00000173 find_call
00000000 l    d  .text.find_function	00000000 .text.find_function
00000000 l    d  .text.find_row	00000000 .text.find_row
00000000 l    d  .text.find_site	00000000 .text.find_site
00000000 l    d  .text.unwind_frame	00000000 .text.unwind_frame
00000000 l    d  .text.avm_eh_prepare_next	00000000 .text.avm_eh_prepare_next
00000000 l    d  .text.list_ok	00000000 .text.list_ok
00000000 l    d  .text.list_named	00000000 .text.list_named
00000000 l    d  .text.match_list	00000000 .text.match_list
00000000 l     F .text.match_class_base	000004a3 match_class_base
00000000 l    d  .text.match_class_base	00000000 .text.match_class_base
00000000 l    d  .text.find_call	00000000 .text.find_call
00000000 g     F .text.avm_eh_validate_block	00000659 avm_eh_validate_block
00000000 g     F .text.avm_eh_find_handler	00000168 avm_eh_find_handler
00000000 g     O .rodata.__avm_eh_metadata_ptr	00000003 __avm_eh_metadata_ptr
00000000 g     F .text.avm_eh_prepare_next	00000239 avm_eh_prepare_next
00000000         *UND*	00000000 vtable for __cxxabiv1::__class_type_info
00000000         *UND*	00000000 vtable for __cxxabiv1::__si_class_type_info
00000000         *UND*	00000000 vtable for __cxxabiv1::__vmi_class_type_info

Disassembly of section .text.avm_eh_validate_block:

<avm_eh_validate_block>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 be                 adjsp	-0x42
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
		R_AVM_FAR24	.text.avm_eh_validate_block+0x643
<L0>:
 f0 60 ac              ldp8u	r5, [q3]
 cd 41                 cmpi.s8	r5, 0x41
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x643
<L1>:
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f7 63                 add32	q0, q3
 f0 60 a0              ldp8u	r5, [q0]
 cd 56                 cmpi.s8	r5, 0x56
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x643
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
		R_AVM_FAR24	.text.avm_eh_validate_block+0x643
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
		R_AVM_FAR24	.text.avm_eh_validate_block+0x643
<L4>:
 f0 00 04              ldi8	r0, 0x4
 f2 39                 sub	r1, r1
 f7 63                 add32	q0, q3
 f0 60 a0              ldp8u	r5, [q0]
 cd 34                 cmpi.s8	r5, 0x34
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x643
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
		R_AVM_FAR24	.text.avm_eh_validate_block+0x643
<L6>:
 f2 30                 sub	r0, r0
 f0 05 00 01           ldi16	r1, 0x100
 f7 73                 sub32	q0, q3
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x643
<L7>:
 f7 67                 add32	q1, q3
 f0 3a 3a              stsp16	[sp+0x3a], r2
 f0 3b 3c              stsp16	[sp+0x3c], r3
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
		R_AVM_FAR24	.text.avm_eh_validate_block+0x636
<L8>:
 a0                    xor	r4, r4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 3c 26              stsp16	[sp+0x26], r4
 f0 3d 2c              stsp16	[sp+0x2c], r5
 f0 32 3a              ldsp16	r2, [sp+0x3a]
 f0 33 3c              ldsp16	r3, [sp+0x3c]
 f7 74                 sub32	q1, q0
 c2 12                 ldi8	r6, 0x12
 af                    xor	r7, r7
 f0 3a 20              stsp16	[sp+0x20], r2
 f0 3b 22              stsp16	[sp+0x22], r3
 f0 69 4c              cmp32	q1, q3
 d8 04                 bruge8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x643
<L9>:
 c2 0f                 ldi8	r6, 0xf
 af                    xor	r7, r7
 f7 6c                 add32	q3, q0
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 00 0c              ldi8	r0, 0xc
 f2 39                 sub	r1, r1
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f7 64                 add32	q1, q0
 c2 06                 ldi8	r6, 0x6
 af                    xor	r7, r7
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f7 6c                 add32	q3, q0
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 62 ac              ldp16	r5, [q3]
 f0 3a 18              stsp16	[sp+0x18], r2
 f0 3b 1a              stsp16	[sp+0x1a], r3
 f0 63 04              ldp24	q0, [q1]
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f0 63 cc              ldp24	q3, [q3]
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x643
<L10>:
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 09                    mov	r6, r5
 af                    xor	r7, r7
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 fa 8e                 lsr16i	r5, 0xe
 1a                    add	r6, r6
 1a                    add	r6, r6
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
 f1 06                 mov	r0, r6
 f1 0d                 mov	r1, r5
 f0 36 10              ldsp16	r6, [sp+0x10]
 f7 63                 add32	q0, q3
 f0 02 12              ldi8	r2, 0x12
 f2 4b                 sub	r3, r3
 f7 61                 add32	q0, q1
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x643
<L11>:
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 36 10              ldsp16	r6, [sp+0x10]
 06                    mov	r5, r6
 fa 8d                 lsr16i	r5, 0xd
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 f1 16                 mov	r2, r6
 f1 1d                 mov	r3, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f1 07                 mov	r0, r7
 f4 80                 lsl16.1	r0
 f4 80                 lsl16.1	r0
 06                    mov	r5, r6
 fa 8e                 lsr16i	r5, 0xe
 f9 a1                 or	r5, r0
 f0 3d 10              stsp16	[sp+0x10], r5
 06                    mov	r5, r6
 15                    add	r5, r5
 15                    add	r5, r5
 f0 36 10              ldsp16	r6, [sp+0x10]
 f1 05                 mov	r0, r5
 f1 0e                 mov	r1, r6
 f7 61                 add32	q0, q1
 f4 02                 ldsp16	r6, [sp+0x0]
 f7 6c                 add32	q3, q0
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 f0 02 12              ldi8	r2, 0x12
 f2 4b                 sub	r3, r3
 f7 6d                 add32	q3, q1
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x643
<L12>:
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f0 69 c0              cmp32	q3, q0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 d8 04                 bruge8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x643
<L13>:
 f0 02 08              ldi8	r2, 0x8
 f2 4b                 sub	r3, r3
 f7 67                 add32	q1, q3
 f2 63                 mov32	q0, q3
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 f7 63                 add32	q0, q3
 f0 38 32              stsp16	[sp+0x32], r0
 f0 39 34              stsp16	[sp+0x34], r1
 f0 62 a0              ldp16	r5, [q0]
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 f0 3a 2e              stsp16	[sp+0x2e], r2
 f0 3b 30              stsp16	[sp+0x30], r3
 f0 62 a4              ldp16	r5, [q1]
 09                    mov	r6, r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 38 28              stsp16	[sp+0x28], r0
 f0 39 2a              stsp16	[sp+0x2a], r1
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f0 30 20              ldsp16	r0, [sp+0x20]
 f0 31 22              ldsp16	r1, [sp+0x22]
 f0 32 14              ldsp16	r2, [sp+0x14]
 f0 33 16              ldsp16	r3, [sp+0x16]
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x643
<L14>:
 f0 30 28              ldsp16	r0, [sp+0x28]
 f0 31 2a              ldsp16	r1, [sp+0x2a]
 f7 6c                 add32	q3, q0
 f1 07                 mov	r0, r7
 f4 80                 lsl16.1	r0
 f4 80                 lsl16.1	r0
 06                    mov	r5, r6
 fa 8e                 lsr16i	r5, 0xe
 f9 a1                 or	r5, r0
 1a                    add	r6, r6
 1a                    add	r6, r6
 f0 3e 20              stsp16	[sp+0x20], r6
 f0 3d 22              stsp16	[sp+0x22], r5
 f4 02                 ldsp16	r6, [sp+0x0]
 06                    mov	r5, r6
 fa 8d                 lsr16i	r5, 0xd
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 f1 06                 mov	r0, r6
 f1 0d                 mov	r1, r5
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 f7 64                 add32	q1, q0
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 f7 67                 add32	q1, q3
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 f7 7c                 sub32	q3, q0
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x643
<L15>:
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f7 6d                 add32	q3, q1
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f0 69 c0              cmp32	q3, q0
 c2 03                 ldi8	r6, 0x3
 af                    xor	r7, r7
 d1 04                 brne8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x643
<L16>:
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f2 61                 mov32	q0, q1
 f7 63                 add32	q0, q3
 f0 63 c4              ldp24	q3, [q1]
 f0 38 20              stsp16	[sp+0x20], r0
 f0 39 22              stsp16	[sp+0x22], r1
 f0 63 40              ldp24	q1, [q0]
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x643
<L17>:
 f0 69 c4              cmp32	q3, q1
 d2 04                 brult8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x643
<L18>:
 f0 3a 3e              stsp16	[sp+0x3e], r2
 f0 3b 40              stsp16	[sp+0x40], r3
 f0 36 32              ldsp16	r6, [sp+0x32]
 f0 37 34              ldsp16	r7, [sp+0x34]
 f0 62 ac              ldp16	r5, [q3]
 f0 3d 28              stsp16	[sp+0x28], r5
 f0 36 2e              ldsp16	r6, [sp+0x2e]
 f0 37 30              ldsp16	r7, [sp+0x30]
 f0 62 ac              ldp16	r5, [q3]
 f0 3d 24              stsp16	[sp+0x24], r5
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 62 ac              ldp16	r5, [q3]
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f0 63 cc              ldp24	q3, [q3]
 f0 3e 36              stsp16	[sp+0x36], r6
 f0 3f 38              stsp16	[sp+0x38], r7
 f0 00 12              ldi8	r0, 0x12
 f2 39                 sub	r1, r1
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f7 61                 add32	q0, q1
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x400
<L19>:
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f0 63 4c              ldp24	q1, [q3]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f7 67                 add32	q1, q3
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x643
<L20>:
 f7 74                 sub32	q1, q0
 c2 05                 ldi8	r6, 0x5
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 d8 04                 bruge8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x643
<L21>:
 f4 71                 stsp16	[sp+0xc], r5
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
 f2 6a                 mov32	q3, q0
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 60 cc              ldp8u	r6, [q3]
 06                    mov	r5, r6
 f4 8d                 lsr16.1	r5
 f0 00 01              ldi8	r0, 0x1
 f9 a0                 and	r5, r0
 0e                    mov	r7, r6
 f9 e0                 and	r7, r0
 1d                    add	r7, r5
 07                    mov	r5, r7
 0e                    mov	r7, r6
 fa a2                 lsr16i	r7, 0x2
 f9 e0                 and	r7, r0
 1d                    add	r7, r5
 f4 42                 stsp16	[sp+0x0], r6
 06                    mov	r5, r6
 fa 83                 lsr16i	r5, 0x3
 f9 a0                 and	r5, r0
 17                    add	r5, r7
 15                    add	r5, r5
 c9 05                 addi.s8	r5, 0x5
 f1 05                 mov	r0, r5
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x643
<L22>:
 c1 70                 ldi8	r5, 0x70
 f4 02                 ldsp16	r6, [sp+0x0]
 89                    and	r6, r5
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x643
<L23>:
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 f0 62 c0              ldp16	r6, [q0]
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 f0 69 40              cmp32	q1, q0
 d1 04                 brne8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x394
<L24>:
 f0 62 a4              ldp16	r5, [q1]
 36                    cmp	r5, r6
 d2 04                 brult8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x643
<L25>:
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x39c
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x643
<L26>:
 f1 06                 mov	r0, r6
 f2 39                 sub	r1, r1
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 63 44              ldp24	q1, [q1]
 f7 64                 add32	q1, q0
 f0 30 20              ldsp16	r0, [sp+0x20]
 f0 31 22              ldsp16	r1, [sp+0x22]
 f0 63 00              ldp24	q0, [q0]
 f0 69 40              cmp32	q1, q0
 d2 04                 brult8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x643
<L27>:
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
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
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 f7 6c                 add32	q3, q0
 f4 31                 ldsp16	r5, [sp+0xc]
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f2 63                 mov32	q0, q3
 d0 04                 breq8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x2f6
<L28>:
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x402
 f2 6a                 mov32	q3, q0
 f0 32 36              ldsp16	r2, [sp+0x36]
 f0 33 38              ldsp16	r3, [sp+0x38]
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f7 64                 add32	q1, q0
 f2 61                 mov32	q0, q1
 f0 69 c0              cmp32	q3, q0
 d0 04                 breq8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x643
<L29>:
 f0 34 24              ldsp16	r4, [sp+0x24]
 f6 2c                 tst16	r4
 f0 38 36              stsp16	[sp+0x36], r0
 f0 39 38              stsp16	[sp+0x38], r1
 f2 6a                 mov32	q3, q0
 d1 04                 brne8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x46a
<L30>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 30 24              ldsp16	r0, [sp+0x24]
 f0 32 36              ldsp16	r2, [sp+0x36]
 f0 33 38              ldsp16	r3, [sp+0x38]
 d6 fc                 adjsp	-0x4
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.site_ok
 d6 04                 adjsp	0x4
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x64a
<L31>:
 f2 6b                 mov32	q3, q1
 c0 0c                 ldi8	r4, 0xc
 a5                    xor	r5, r5
 f7 6e                 add32	q3, q2
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 f2 69                 mov32	q2, q1
 f2 67                 mov32	q1, q3
 d0 04                 breq8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x439
<L32>:
 f0 34 28              ldsp16	r4, [sp+0x28]
 f6 2c                 tst16	r4
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f2 67                 mov32	q1, q3
 a0                    xor	r4, r4
 d1 04                 brne8	0x4 <L33>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x529
<L33>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 35 28              ldsp16	r5, [sp+0x28]
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 63 44              ldp24	q1, [q1]
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 f0 32 20              ldsp16	r2, [sp+0x20]
 f0 33 22              ldsp16	r3, [sp+0x22]
 f0 63 44              ldp24	q1, [q1]
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f0 63 40              ldp24	q1, [q0]
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 3b 1e              stsp16	[sp+0x1e], r3
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 c4              cmp32	q3, q1
 d1 04                 brne8	0x4 <L34>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4cc
<L34>:
 f0 63 cc              ldp24	q3, [q3]
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4d6
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 f0 69 c4              cmp32	q3, q1
 d2 04                 brult8	0x4 <L35>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x643
<L35>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L36>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x643
<L36>:
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 69 c4              cmp32	q3, q1
 d2 04                 brult8	0x4 <L37>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x643
<L37>:
 f2 6a                 mov32	q3, q0
 f0 02 03              ldi8	r2, 0x3
 f2 4b                 sub	r3, r3
 f7 6d                 add32	q3, q1
 f0 62 cc              ldp16	r6, [q3]
 c3 ff                 ldi8	r7, 0xff
 3e                    cmp	r7, r6
 d8 04                 bruge8	0x4 <L38>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x643
<L38>:
 f2 64                 mov32	q1, q0
 c2 05                 ldi8	r6, 0x5
 af                    xor	r7, r7
 f7 67                 add32	q1, q3
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 f2 6a                 mov32	q3, q0
 f2 61                 mov32	q0, q1
 d0 04                 breq8	0x4 <L39>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x487
<L39>:
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f0 63 c8              ldp24	q3, [q2]
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f7 6e                 add32	q3, q2
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 f0 35 30              ldsp16	r5, [sp+0x30]
 f0 62 88              ldp16	r4, [q2]
 a5                    xor	r5, r5
 0c                    mov	r7, r4
 fa ad                 lsr16i	r7, 0xd
 08                    mov	r6, r4
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 f1 06                 mov	r0, r6
 f1 0f                 mov	r1, r7
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f7 63                 add32	q0, q3
 f0 36 32              ldsp16	r6, [sp+0x32]
 f0 37 34              ldsp16	r7, [sp+0x34]
 f0 62 cc              ldp16	r6, [q3]
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f7 6c                 add32	q3, q0
 f1 05                 mov	r0, r5
 f4 80                 lsl16.1	r0
 f4 80                 lsl16.1	r0
 04                    mov	r5, r4
 fa 8e                 lsr16i	r5, 0xe
 f9 a1                 or	r5, r0
 10                    add	r4, r4
 10                    add	r4, r4
 f7 6b                 add32	q2, q3
 f0 69 48              cmp32	q1, q2
 d0 04                 breq8	0x4 <L40>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x64f
<L40>:
 d6 fa                 adjsp	-0x6
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 f4 40                 stsp16	[sp+0x0], r4
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f0 30 3c              ldsp16	r0, [sp+0x3c]
 f0 31 3e              ldsp16	r1, [sp+0x3e]
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.pool_ok
 d6 06                 adjsp	0x6
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L41>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x654
<L41>:
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f0 69 04              cmp32	q0, q1
 a0                    xor	r4, r4
 d8 04                 bruge8	0x4 <L42>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x5f6
<L42>:
 f0 36 26              ldsp16	r6, [sp+0x26]
 f4 ae                 inc16	r6
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 f0 3e 26              stsp16	[sp+0x26], r6
 39                    cmp	r6, r5
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f2 63                 mov32	q0, q3
 f0 32 3e              ldsp16	r2, [sp+0x3e]
 f0 33 40              ldsp16	r3, [sp+0x40]
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 d0 04                 breq8	0x4 <L43>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0xcc
<L43>:
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x638
 c2 0c                 ldi8	r6, 0xc
 af                    xor	r7, r7
 f7 63                 add32	q0, q3
 f0 69 04              cmp32	q0, q1
 d2 04                 brult8	0x4 <L44>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x5be
<L44>:
 c2 09                 ldi8	r6, 0x9
 af                    xor	r7, r7
 f7 6c                 add32	q3, q0
 f0 63 cc              ldp24	q3, [q3]
 f2 64                 mov32	q1, q0
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 f2 61                 mov32	q0, q1
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 d1 04                 brne8	0x4 <L45>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x5e8
<L45>:
 d6 fe                 adjsp	-0x2
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 f4 40                 stsp16	[sp+0x0], r4
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.site_has_call
 d6 02                 adjsp	0x2
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f1 75                 zext8	r5
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L46>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x5e8
<L46>:
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x643
 f2 6a                 mov32	q3, q0
 f0 34 3a              ldsp16	r4, [sp+0x3a]
 f0 35 3c              ldsp16	r5, [sp+0x3c]
 f0 69 c8              cmp32	q3, q2
 f8 04                 cset.eq	r4
 d6 42                 adjsp	0x42
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x643
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x643
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x643

Disassembly of section .text.site_ok:

<site_ok>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f2 63                 mov32	q0, q3
 f0 36 13              ldsp16	r6, [sp+0x13]
 f0 37 15              ldsp16	r7, [sp+0x15]
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 c4              cmp32	q3, q1
 f0 02 03              ldi8	r2, 0x3
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	site_ok
		R_AVM_FAR24	.text.site_ok+0x2b
<L0>:
 f7 6d                 add32	q3, q1
 f0 63 8c              ldp24	q2, [q3]
 e2 00 00 00           jmpf	site_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.site_ok+0x2e
 f0 63 88              ldp24	q2, [q2]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 6a                 mov32	q3, q0
 f7 6d                 add32	q3, q1
 f0 63 80              ldp24	q2, [q0]
 f0 63 4c              ldp24	q1, [q3]
 f0 69 84              cmp32	q2, q1
 d2 04                 brult8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	site_ok
		R_AVM_FAR24	.text.site_ok+0x5c
<L1>:
 f0 63 80              ldp24	q2, [q0]
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 69 84              cmp32	q2, q1
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	site_ok
		R_AVM_FAR24	.text.site_ok+0x64
<L2>:
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	site_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.site_ok+0x5d
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
		R_AVM_FAR24	.text.site_ok+0x83
<L3>:
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	site_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.site_ok+0x5d
 c0 09                 ldi8	r4, 0x9
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f0 63 c8              ldp24	q3, [q2]
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f0 63 88              ldp24	q2, [q2]
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 f2 6a                 mov32	q3, q0
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	site_ok
		R_AVM_FAR24	.text.site_ok+0xc1
<L4>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 63 cc              ldp24	q3, [q3]
 f2 62                 mov32	q0, q2
 f0 69 8c              cmp32	q2, q3
 a0                    xor	r4, r4
 d8 04                 bruge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	site_ok
		R_AVM_FAR24	.text.site_ok+0x5d
<L5>:
 f0 63 c4              ldp24	q3, [q1]
 f0 69 0c              cmp32	q0, q3
 f8 14                 cset.ult	r4
 e2 00 00 00           jmpf	site_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.site_ok+0x5d
 f0 69 8c              cmp32	q2, q3
 f8 04                 cset.eq	r4
 e2 00 00 00           jmpf	site_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.site_ok+0x5d

Disassembly of section .text.pool_ok:

<pool_ok>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 dc                 adjsp	-0x24
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 c2 08                 ldi8	r6, 0x8
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 00 0a              ldi8	r0, 0xa
 f2 39                 sub	r1, r1
 f7 62                 add32	q0, q2
 f0 02 0c              ldi8	r2, 0xc
 f2 4b                 sub	r3, r3
 f7 66                 add32	q1, q2
 f0 36 31              ldsp16	r6, [sp+0x31]
 f0 37 33              ldsp16	r7, [sp+0x33]
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 f0 36 2f              ldsp16	r6, [sp+0x2f]
 f4 42                 stsp16	[sp+0x0], r6
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 f0 63 c4              ldp24	q3, [q1]
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f7 6e                 add32	q3, q2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 f0 62 80              ldp16	r4, [q0]
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 62 88              ldp16	r4, [q2]
 a5                    xor	r5, r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6c                 add32	q3, q0
 f1 17                 mov	r2, r7
 f4 82                 lsl16.1	r2
 f4 82                 lsl16.1	r2
 06                    mov	r5, r6
 fa 8e                 lsr16i	r5, 0xe
 f9 a9                 or	r5, r2
 1a                    add	r6, r6
 1a                    add	r6, r6
 0d                    mov	r7, r5
 04                    mov	r5, r4
 fa 8d                 lsr16i	r5, 0xd
 10                    add	r4, r4
 10                    add	r4, r4
 10                    add	r4, r4
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f7 69                 add32	q2, q1
 f7 62                 add32	q0, q2
 f7 63                 add32	q0, q3
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f0 69 08              cmp32	q0, q2
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	pool_ok
		R_AVM_FAR24	.text.pool_ok+0xf9
<L0>:
 f0 32 18              ldsp16	r2, [sp+0x18]
 f0 33 1a              ldsp16	r3, [sp+0x1a]
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	pool_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.list_ok
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	pool_ok
		R_AVM_FAR24	.text.pool_ok+0x21d
<L1>:
 f2 68                 mov32	q2, q0
 f7 79                 sub32	q2, q1
 d6 fc                 adjsp	-0x4
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 32 20              ldsp16	r2, [sp+0x20]
 f0 33 22              ldsp16	r3, [sp+0x22]
 f2 69                 mov32	q2, q1
 f4 12                 ldsp16	r6, [sp+0x4]
 e3 00 00 00           callf	pool_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.list_named
 d6 04                 adjsp	0x4
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	pool_ok
		R_AVM_FAR24	.text.pool_ok+0x222
<L2>:
 f2 68                 mov32	q2, q0
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f0 62 88              ldp16	r4, [q2]
 a5                    xor	r5, r5
 08                    mov	r6, r4
 fa 9e                 lsr16i	r6, 0xe
 0c                    mov	r7, r4
 1f                    add	r7, r7
 1f                    add	r7, r7
 ab                    xor	r6, r7
 ae                    xor	r7, r6
 ab                    xor	r6, r7
 f7 68                 add32	q2, q0
 f7 6b                 add32	q2, q3
 c2 03                 ldi8	r6, 0x3
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f0 69 8c              cmp32	q2, q3
 f2 62                 mov32	q0, q2
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	pool_ok
		R_AVM_FAR24	.text.pool_ok+0x8d
<L3>:
 e2 00 00 00           jmpf	pool_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.pool_ok+0x101
 f2 68                 mov32	q2, q0
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f0 69 8c              cmp32	q2, q3
 a0                    xor	r4, r4
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	pool_ok
		R_AVM_FAR24	.text.pool_ok+0x233
<L4>:
 c1 01                 ldi8	r5, 0x1
 f4 00                 ldsp16	r4, [sp+0x0]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	pool_ok
		R_AVM_FAR24	.text.pool_ok+0x22d
<L5>:
 c0 09                 ldi8	r4, 0x9
 a5                    xor	r5, r5
 f7 66                 add32	q1, q2
 aa                    xor	r6, r6
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 3b 1e              stsp16	[sp+0x1e], r3
 e2 00 00 00           jmpf	pool_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.pool_ok+0x14d
 f2 6a                 mov32	q3, q0
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 69 c8              cmp32	q3, q2
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	pool_ok
		R_AVM_FAR24	.text.pool_ok+0x232
<L6>:
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 ae                 inc16	r6
 f4 00                 ldsp16	r4, [sp+0x0]
 38                    cmp	r6, r4
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	pool_ok
		R_AVM_FAR24	.text.pool_ok+0x227
<L7>:
 02                    mov	r4, r6
 fa 7d                 lsr16i	r4, 0xd
 06                    mov	r5, r6
 15                    add	r5, r5
 15                    add	r5, r5
 15                    add	r5, r5
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 f4 5a                 stsp16	[sp+0x6], r6
 af                    xor	r7, r7
 f7 69                 add32	q2, q1
 f1 07                 mov	r0, r7
 f4 80                 lsl16.1	r0
 f4 80                 lsl16.1	r0
 0e                    mov	r7, r6
 fa ae                 lsr16i	r7, 0xe
 f9 e1                 or	r7, r0
 1a                    add	r6, r6
 1a                    add	r6, r6
 f7 6e                 add32	q3, q2
 f0 63 cc              ldp24	q3, [q3]
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	pool_ok
		R_AVM_FAR24	.text.pool_ok+0x140
<L8>:
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 63 48              ldp24	q1, [q2]
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 62 88              ldp16	r4, [q2]
 a5                    xor	r5, r5
 08                    mov	r6, r4
 fa 9d                 lsr16i	r6, 0xd
 0c                    mov	r7, r4
 1f                    add	r7, r7
 1f                    add	r7, r7
 1f                    add	r7, r7
 ab                    xor	r6, r7
 ae                    xor	r7, r6
 ab                    xor	r6, r7
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 f7 64                 add32	q1, q0
 f7 67                 add32	q1, q3
 f0 3a 20              stsp16	[sp+0x20], r2
 f0 3b 22              stsp16	[sp+0x22], r3
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f0 62 cc              ldp16	r6, [q3]
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f7 64                 add32	q1, q0
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f0 30 20              ldsp16	r0, [sp+0x20]
 f0 31 22              ldsp16	r1, [sp+0x22]
 f7 6c                 add32	q3, q0
 f1 05                 mov	r0, r5
 f4 80                 lsl16.1	r0
 f4 80                 lsl16.1	r0
 04                    mov	r5, r4
 fa 8e                 lsr16i	r5, 0xe
 f9 a1                 or	r5, r0
 10                    add	r4, r4
 10                    add	r4, r4
 f1 04                 mov	r0, r4
 f1 0d                 mov	r1, r5
 f7 63                 add32	q0, q3
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f0 69 84              cmp32	q2, q1
 fc 14                 cmov.ult	r2, r4
 fc 1d                 cmov.ult	r3, r5
 f0 69 04              cmp32	q0, q1
 d2 04                 brult8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	pool_ok
		R_AVM_FAR24	.text.pool_ok+0x12b
<L9>:
 f2 6a                 mov32	q3, q0
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f7 6e                 add32	q3, q2
 f0 62 cc              ldp16	r6, [q3]
 af                    xor	r7, r7
 02                    mov	r4, r6
 fa 7e                 lsr16i	r4, 0xe
 06                    mov	r5, r6
 15                    add	r5, r5
 15                    add	r5, r5
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 f7 6c                 add32	q3, q0
 f7 6e                 add32	q3, q2
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f7 6e                 add32	q3, q2
 f0 69 c4              cmp32	q3, q1
 f2 63                 mov32	q0, q3
 d8 04                 bruge8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	pool_ok
		R_AVM_FAR24	.text.pool_ok+0x1f1
<L10>:
 e2 00 00 00           jmpf	pool_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.pool_ok+0x12d
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	pool_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.pool_ok+0x233
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	pool_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.pool_ok+0x233
 c0 01                 ldi8	r4, 0x1
 e2 00 00 00           jmpf	pool_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.pool_ok+0x233
 01                    mov	r4, r5
 e2 00 00 00           jmpf	pool_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.pool_ok+0x233
 a0                    xor	r4, r4
 d6 24                 adjsp	0x24
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.site_has_call:

<site_has_call>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f0 02 03              ldi8	r2, 0x3
 f2 4b                 sub	r3, r3
 f7 66                 add32	q1, q2
 f0 36 15              ldsp16	r6, [sp+0x15]
 f0 63 08              ldp24	q0, [q2]
 f0 63 84              ldp24	q2, [q1]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 52                 stsp16	[sp+0x4], r6
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	site_has_call
		R_AVM_FAR24	.text.site_has_call+0x6d
<L0>:
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	site_has_call
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.site_has_call+0x38
 f4 ad                 inc16	r5
 f4 10                 ldsp16	r4, [sp+0x4]
 31                    cmp	r4, r5
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	site_has_call
		R_AVM_FAR24	.text.site_has_call+0x6d
<L1>:
 09                    mov	r6, r5
 fa 9e                 lsr16i	r6, 0xe
 01                    mov	r4, r5
 10                    add	r4, r4
 10                    add	r4, r4
 0e                    mov	r7, r6
 08                    mov	r6, r4
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 f7 6d                 add32	q3, q1
 f1 15                 mov	r2, r5
 f2 4b                 sub	r3, r3
 f7 67                 add32	q1, q3
 f0 63 44              ldp24	q1, [q1]
 f0 69 04              cmp32	q0, q1
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	site_has_call
		R_AVM_FAR24	.text.site_has_call+0x2d
<L2>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	site_has_call
		R_AVM_FAR24	.text.site_has_call+0x2d
<L3>:
 c0 01                 ldi8	r4, 0x1
 e2 00 00 00           jmpf	site_has_call
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.site_has_call+0x6e
 a0                    xor	r4, r4
 d6 0a                 adjsp	0xa
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
 d6 ea                 adjsp	-0x16
 04                    mov	r5, r4
 f1 05                 mov	r0, r5
 f0 08 18              addi.s8	r0, 0x18
 c4 00 f6              ldi16	r4, 0xf600
 f4 58                 stsp16	[sp+0x6], r4
 a0                    xor	r4, r4
 f0 3c 12              stsp16	[sp+0x12], r4
 c4 00 ff              ldi16	r4, 0xff00
 f4 50                 stsp16	[sp+0x4], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 c9 1a                 addi.s8	r5, 0x1a
 f4 61                 stsp16	[sp+0x8], r5
 f0 38 14              stsp16	[sp+0x14], r0
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0x3f
 f0 30 14              ldsp16	r0, [sp+0x14]
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
		R_AVM_FAR24	.text.avm_eh_find_handler+0x15e
<L0>:
 ed 90 20              ld16	r4, [r0+0]
 f4 19                 ldsp16	r5, [sp+0x6]
 11                    add	r4, r5
 f4 11                 ldsp16	r5, [sp+0x4]
 31                    cmp	r4, r5
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x15e
<L1>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 66                 add32	q1, q2
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x15e
<L2>:
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_row
 f2 6a                 mov32	q3, q0
 f2 62                 mov32	q0, q2
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_site
 f2 66                 mov32	q1, q2
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f0 38 0a              stsp16	[sp+0xa], r0
 f0 39 0c              stsp16	[sp+0xc], r1
 f7 68                 add32	q2, q0
 c2 02                 ldi8	r6, 0x2
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x15e
<L3>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 48              cmp32	q1, q2
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x15e
<L4>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 40              cmp32	q1, q0
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x28
<L5>:
 c0 09                 ldi8	r4, 0x9
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 63 c8              ldp24	q3, [q2]
 f0 69 c0              cmp32	q3, q0
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x28
<L6>:
 f0 34 10              ldsp16	r4, [sp+0x10]
 ed b8 35              ld16	r5, [r4+21]
 f4 79                 stsp16	[sp+0xe], r5
 ed b8 2f              ld16	r5, [r4+15]
 ed 88 31              ld8u	r4, [r4+17]
 f1 04                 mov	r0, r4
 01                    mov	r4, r5
 d6 fa                 adjsp	-0x6
 f0 35 14              ldsp16	r5, [sp+0x14]
 f4 51                 stsp16	[sp+0x4], r5
 f1 24                 mov	r5, r0
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f7 6e                 add32	q3, q2
 e3 00 00 00           callf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_list
 d6 06                 adjsp	0x6
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 8c              cmp32	q2, q3
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x15e
<L7>:
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x28
<L8>:
 f0 36 10              ldsp16	r6, [sp+0x10]
 ca 27                 addi.s8	r6, 0x27
 f0 6b 8c              st32	[r6], q2
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f7 66                 add32	q1, q2
 f0 63 44              ldp24	q1, [q1]
 f4 20                 ldsp16	r4, [sp+0x8]
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 e3 00 00 00           callf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_call
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 8c              cmp32	q2, q3
 d1 04                 brne8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x15e
<L9>:
 f0 36 14              ldsp16	r6, [sp+0x14]
 6a                    ld16	r6, [r6]
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 c6 00 0a              ldi16	r6, 0xa00
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x15e
<L10>:
 f0 36 10              ldsp16	r6, [sp+0x10]
 ee 9c 38              st16	[r6+24], r4
 ee 5c 3a              st16	[r6+26], r2
 ee 6c 3c              st8	[r6+28], r3
 c0 01                 ldi8	r4, 0x1
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 d6 16                 adjsp	0x16
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
		R_AVM_FAR24	.text.find_function+0x272
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 60 8c              ldp8u	r4, [q3]
 cc 41                 cmpi.s8	r4, 0x41
 f2 67                 mov32	q1, q3
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x258
<L1>:
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 60 88              ldp8u	r4, [q2]
 cc 56                 cmpi.s8	r4, 0x56
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x25e
<L2>:
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 60 88              ldp8u	r4, [q2]
 cc 45                 cmpi.s8	r4, 0x45
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x264
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
		R_AVM_FAR24	.text.find_function+0x26a
<L4>:
 c0 04                 ldi8	r4, 0x4
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 60 88              ldp8u	r4, [q2]
 cc 34                 cmpi.s8	r4, 0x34
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x270
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
		R_AVM_FAR24	.text.find_function+0x27f
<L6>:
 a0                    xor	r4, r4
 c5 00 01              ldi16	r5, 0x100
 f7 79                 sub32	q2, q1
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x279
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
		R_AVM_FAR24	.text.find_function+0x272
<L8>:
 f7 6d                 add32	q3, q1
 c0 0a                 ldi8	r4, 0xa
 a5                    xor	r5, r5
 f7 66                 add32	q1, q2
 a0                    xor	r4, r4
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3d 24              stsp16	[sp+0x24], r5
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 3f 18              stsp16	[sp+0x18], r7
 02                    mov	r4, r6
 07                    mov	r5, r7
 f7 79                 sub32	q2, q1
 f0 00 12              ldi8	r0, 0x12
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x285
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
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x28b
<L10>:
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
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
		R_AVM_FAR24	.text.find_function+0x291
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
 c0 12                 ldi8	r4, 0x12
 a5                    xor	r5, r5
 f7 6e                 add32	q3, q2
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x297
<L12>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x29d
<L13>:
 c0 08                 ldi8	r4, 0x8
 a5                    xor	r5, r5
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f7 6b                 add32	q2, q3
 f0 02 0a              ldi8	r2, 0xa
 f2 4b                 sub	r3, r3
 f7 6d                 add32	q3, q1
 f0 62 cc              ldp16	r6, [q3]
 f1 16                 mov	r2, r6
 f0 62 88              ldp16	r4, [q2]
 08                    mov	r6, r4
 af                    xor	r7, r7
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 3a 1a              stsp16	[sp+0x1a], r2
 f0 3b 1c              stsp16	[sp+0x1c], r3
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x2a3
<L14>:
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 f7 6e                 add32	q3, q2
 03                    mov	r4, r7
 10                    add	r4, r4
 10                    add	r4, r4
 06                    mov	r5, r6
 fa 8e                 lsr16i	r5, 0xe
 94                    or	r5, r4
 1a                    add	r6, r6
 1a                    add	r6, r6
 0d                    mov	r7, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 04                    mov	r5, r4
 fa 8d                 lsr16i	r5, 0xd
 10                    add	r4, r4
 10                    add	r4, r4
 10                    add	r4, r4
 f7 66                 add32	q1, q2
 f7 67                 add32	q1, q3
 f2 68                 mov32	q2, q0
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f0 37 20              ldsp16	r7, [sp+0x20]
 f7 7b                 sub32	q2, q3
 f0 69 84              cmp32	q2, q1
 d8 04                 bruge8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x2a9
<L15>:
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f7 63                 add32	q0, q3
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d1 04                 brne8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x272
<L16>:
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 02 03              ldi8	r2, 0x3
 f2 4b                 sub	r3, r3
 f7 69                 add32	q2, q1
 f0 63 cc              ldp24	q3, [q3]
 f0 63 08              ldp24	q0, [q2]
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x2af
<L17>:
 f0 69 c0              cmp32	q3, q0
 d2 04                 brult8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x2b5
<L18>:
 f0 32 22              ldsp16	r2, [sp+0x22]
 f0 33 24              ldsp16	r3, [sp+0x24]
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x2bb
<L19>:
 f0 69 80              cmp32	q2, q0
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 d8 04                 bruge8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x272
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
		R_AVM_FAR24	.text.find_function+0x272
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x272
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x272
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x272
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x272
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
		R_AVM_FAR24	.text.find_function+0x272
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x272
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x272
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x272
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x272
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x272
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x272
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x272
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x272
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x272
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x272
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x272

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
 d6 f6                 adjsp	-0xa
 f2 67                 mov32	q1, q3
 f0 00 0c              ldi8	r0, 0xc
 f2 39                 sub	r1, r1
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6c                 add32	q3, q0
 f0 63 0c              ldp24	q0, [q3]
 c2 08                 ldi8	r6, 0x8
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f0 62 cc              ldp16	r6, [q3]
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_site
		R_AVM_FAR24	.text.find_site+0x5e
<L0>:
 f4 62                 stsp16	[sp+0x8], r6
 f7 62                 add32	q0, q2
 d6 fc                 adjsp	-0x4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
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
		R_AVM_FAR24	.text.find_site+0x101
<L1>:
 f0 63 80              ldp24	q2, [q0]
 f0 69 48              cmp32	q1, q2
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_site
		R_AVM_FAR24	.text.find_site+0x64
<L2>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 e2 00 00 00           jmpf	find_site
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_site+0x101
 aa                    xor	r6, r6
 af                    xor	r7, r7
 e2 00 00 00           jmpf	find_site
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_site+0x101
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f0 63 88              ldp24	q2, [q2]
 f0 69 48              cmp32	q1, q2
 d2 04                 brult8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_site
		R_AVM_FAR24	.text.find_site+0x7b
<L3>:
 f2 6a                 mov32	q3, q0
 e2 00 00 00           jmpf	find_site
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_site+0x101
 f4 20                 ldsp16	r4, [sp+0x8]
 cc 01                 cmpi.s8	r4, 0x1
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_site
		R_AVM_FAR24	.text.find_site+0x8b
<L4>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 e2 00 00 00           jmpf	find_site
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_site+0x101
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f4 b4                 dec16	r4
 f2 64                 mov32	q1, q0
 f4 60                 stsp16	[sp+0x8], r4
 d6 fc                 adjsp	-0x4
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 c0 0c                 ldi8	r4, 0xc
 a5                    xor	r5, r5
 f7 66                 add32	q1, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
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
		R_AVM_FAR24	.text.find_site+0xef
<L5>:
 f0 63 84              ldp24	q2, [q1]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_site
		R_AVM_FAR24	.text.find_site+0xf9
<L6>:
 c0 0f                 ldi8	r4, 0xf
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f0 63 80              ldp24	q2, [q0]
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_site
		R_AVM_FAR24	.text.find_site+0xff
<L7>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 f2 61                 mov32	q0, q1
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_site
		R_AVM_FAR24	.text.find_site+0x95
<L8>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 e2 00 00 00           jmpf	find_site
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_site+0x101
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 e2 00 00 00           jmpf	find_site
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_site+0x101
 aa                    xor	r6, r6
 af                    xor	r7, r7
 e2 00 00 00           jmpf	find_site
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_site+0x101
 f2 6b                 mov32	q3, q1
 02                    mov	r4, r6
 07                    mov	r5, r7
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

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

Disassembly of section .text.avm_eh_prepare_next:

<avm_eh_prepare_next>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e2                 adjsp	-0x1e
 04                    mov	r5, r4
 f1 05                 mov	r0, r5
 f0 08 18              addi.s8	r0, 0x18
 c4 00 f6              ldi16	r4, 0xf600
 f4 70                 stsp16	[sp+0xc], r4
 a0                    xor	r4, r4
 f0 3c 16              stsp16	[sp+0x16], r4
 c4 00 ff              ldi16	r4, 0xff00
 f4 50                 stsp16	[sp+0x4], r4
 01                    mov	r4, r5
 c8 1a                 addi.s8	r4, 0x1a
 f4 58                 stsp16	[sp+0x6], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 38 18              stsp16	[sp+0x18], r0
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x40
 f0 30 18              ldsp16	r0, [sp+0x18]
 f1 20                 mov	r4, r0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e3 00 00 00           callf	avm_eh_prepare_next
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.unwind_frame
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x22f
<L0>:
 ed 90 20              ld16	r4, [r0+0]
 f4 32                 ldsp16	r6, [sp+0xc]
 12                    add	r4, r6
 f4 12                 ldsp16	r6, [sp+0x4]
 32                    cmp	r4, r6
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x22f
<L1>:
 f4 18                 ldsp16	r4, [sp+0x6]
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	avm_eh_prepare_next
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function
 f2 66                 mov32	q1, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x22f
<L2>:
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	avm_eh_prepare_next
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_row
 f2 6b                 mov32	q3, q1
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	avm_eh_prepare_next
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_site
 f2 62                 mov32	q0, q2
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f7 6b                 add32	q2, q3
 c2 02                 ldi8	r6, 0x2
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x22f
<L3>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 08              cmp32	q0, q2
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x22f
<L4>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x29
<L5>:
 c2 09                 ldi8	r6, 0x9
 af                    xor	r7, r7
 f7 6c                 add32	q3, q0
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 63 cc              ldp24	q3, [q3]
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x12d
<L6>:
 f0 34 14              ldsp16	r4, [sp+0x14]
 ed b8 35              ld16	r5, [r4+21]
 f0 3d 10              stsp16	[sp+0x10], r5
 ed b8 2f              ld16	r5, [r4+15]
 ed 88 31              ld8u	r4, [r4+17]
 f0 3a 1a              stsp16	[sp+0x1a], r2
 f0 3b 1c              stsp16	[sp+0x1c], r3
 f1 14                 mov	r2, r4
 01                    mov	r4, r5
 d6 fa                 adjsp	-0x6
 f0 35 16              ldsp16	r5, [sp+0x16]
 f4 51                 stsp16	[sp+0x4], r5
 f1 26                 mov	r5, r2
 f0 32 20              ldsp16	r2, [sp+0x20]
 f0 33 22              ldsp16	r3, [sp+0x22]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f7 6d                 add32	q3, q1
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	avm_eh_prepare_next
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_list
 d6 06                 adjsp	0x6
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 8c              cmp32	q2, q3
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x22f
<L7>:
 c2 06                 ldi8	r6, 0x6
 af                    xor	r7, r7
 f7 63                 add32	q0, q3
 f0 63 00              ldp24	q0, [q0]
 f1 29                 mov	r6, r1
 af                    xor	r7, r7
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x1bf
<L8>:
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x13d
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f0 63 c0              ldp24	q3, [q0]
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3d 12              stsp16	[sp+0x12], r5
 0b                    mov	r6, r7
 af                    xor	r7, r7
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 63 88              ldp24	q2, [q2]
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 d1 04                 brne8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x29
<L9>:
 f7 69                 add32	q2, q1
 f0 60 88              ldp8u	r4, [q2]
 c1 01                 ldi8	r5, 0x1
 84                    and	r5, r4
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x29
<L10>:
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f4 18                 ldsp16	r4, [sp+0x6]
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	avm_eh_prepare_next
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_call
 f2 62                 mov32	q0, q2
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 0c              cmp32	q0, q3
 d1 04                 brne8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x22f
<L11>:
 f0 35 18              ldsp16	r5, [sp+0x18]
 69                    ld16	r6, [r5]
 af                    xor	r7, r7
 f7 63                 add32	q0, q3
 c6 00 0a              ldi16	r6, 0xa00
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x22f
<L12>:
 f0 37 14              ldsp16	r7, [sp+0x14]
 03                    mov	r4, r7
 c2 0d                 ldi8	r6, 0xd
 d7 0f                 sys	memcpy
 f0 32 0c              ldsp16	r2, [sp+0xc]
 ee 4e 24              st8	[r7+4], r2
 f0 32 10              ldsp16	r2, [sp+0x10]
 ee 5e 22              st16	[r7+2], r2
 f1 20                 mov	r4, r0
 7c                    st16	[r7], r4
 ee fe 2d              st16	[r7+13], r7
 f0 34 18              ldsp16	r4, [sp+0x18]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e3 00 00 00           callf	avm_eh_prepare_next
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.unwind_frame
 f1 74                 zext8	r4
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x22c
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 37 14              ldsp16	r7, [sp+0x14]
 ed de 47              ld16	r6, [r7+39]
 38                    cmp	r6, r4
 d0 04                 breq8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x22f
<L13>:
 ed de 49              ld16	r6, [r7+41]
 01                    mov	r4, r5
 38                    cmp	r6, r4
 d0 04                 breq8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x22f
<L14>:
 f4 18                 ldsp16	r4, [sp+0x6]
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	avm_eh_prepare_next
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_call
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 8c              cmp32	q2, q3
 d1 04                 brne8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x22f
<L15>:
 f0 32 18              ldsp16	r2, [sp+0x18]
 ed d4 20              ld16	r6, [r2+0]
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 c6 00 0a              ldi16	r6, 0xa00
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x22f
<L16>:
 f0 37 14              ldsp16	r7, [sp+0x14]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 03                    mov	r4, r7
 f1 26                 mov	r5, r2
 c2 0d                 ldi8	r6, 0xd
 d7 0f                 sys	memcpy
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 ee 4e 24              st8	[r7+4], r2
 ee 1e 22              st16	[r7+2], r0
 f4 00                 ldsp16	r4, [sp+0x0]
 7c                    st16	[r7], r4
 ee fe 2d              st16	[r7+13], r7
 c0 02                 ldi8	r4, 0x2
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 34 16              ldsp16	r4, [sp+0x16]
 d6 1e                 adjsp	0x1e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.list_ok:

<list_ok>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 c2 0f                 ldi8	r6, 0xf
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f0 63 cc              ldp24	q3, [q3]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 c2 0c                 ldi8	r6, 0xc
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f0 63 4c              ldp24	q1, [q3]
 f0 00 08              ldi8	r0, 0x8
 f2 39                 sub	r1, r1
 f7 62                 add32	q0, q2
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f7 66                 add32	q1, q2
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f0 62 cc              ldp16	r6, [q3]
 f1 16                 mov	r2, r6
 f2 4b                 sub	r3, r3
 f0 62 80              ldp16	r4, [q0]
 a5                    xor	r5, r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f1 07                 mov	r0, r7
 f4 80                 lsl16.1	r0
 f4 80                 lsl16.1	r0
 06                    mov	r5, r6
 fa 8e                 lsr16i	r5, 0xe
 f9 a1                 or	r5, r0
 1a                    add	r6, r6
 1a                    add	r6, r6
 0d                    mov	r7, r5
 04                    mov	r5, r4
 fa 8d                 lsr16i	r5, 0xd
 10                    add	r4, r4
 10                    add	r4, r4
 10                    add	r4, r4
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f7 68                 add32	q2, q0
 f7 66                 add32	q1, q2
 f7 67                 add32	q1, q3
 a0                    xor	r4, r4
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 69 c4              cmp32	q3, q1
 f2 67                 mov32	q1, q3
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0x1ab
<L0>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f7 63                 add32	q0, q3
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0x1ab
<L1>:
 f7 71                 sub32	q0, q1
 c2 03                 ldi8	r6, 0x3
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0x1ab
<L2>:
 f0 60 c4              ldp8u	r6, [q1]
 ce 02                 cmpi.s8	r6, 0x2
 d2 04                 brult8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0x1ab
<L3>:
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f2 61                 mov32	q0, q1
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f7 64                 add32	q1, q0
 f0 62 e4              ldp16	r7, [q1]
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0xc5
<L4>:
 f6 2f                 tst16	r7
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0x1ab
<L5>:
 0b                    mov	r6, r7
 fa 9e                 lsr16i	r6, 0xe
 f1 17                 mov	r2, r7
 f2 4b                 sub	r3, r3
 1f                    add	r7, r7
 1f                    add	r7, r7
 ab                    xor	r6, r7
 ae                    xor	r7, r6
 ab                    xor	r6, r7
 f7 67                 add32	q1, q3
 c6 fd ff              ldi16	r6, 0xfffd
 c7 ff ff              ldi16	r7, 0xffff
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f7 63                 add32	q0, q3
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0x1ab
<L6>:
 c1 01                 ldi8	r5, 0x1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0x1aa
<L7>:
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 00 03              ldi8	r0, 0x3
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 f7 67                 add32	q1, q3
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f2 63                 mov32	q0, q3
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 e2 00 00 00           jmpf	list_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.list_ok+0x123
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f0 69 04              cmp32	q0, q1
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0x1b7
<L8>:
 f2 64                 mov32	q1, q0
 c2 02                 ldi8	r6, 0x2
 af                    xor	r7, r7
 f7 6d                 add32	q3, q1
 f0 62 a4              ldp16	r5, [q1]
 f0 63 cc              ldp24	q3, [q3]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 61                 stsp16	[sp+0x8], r5
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0x1b2
<L9>:
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f2 61                 mov32	q0, q1
 f7 62                 add32	q0, q2
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 69 8c              cmp32	q2, q3
 f8 04                 cset.eq	r4
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 0c              cmp32	q0, q3
 f8 0d                 cset.ne	r5
 84                    and	r5, r4
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0x1bd
<L10>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f7 6b                 add32	q2, q3
 c2 ff                 ldi8	r6, 0xff
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0x1c2
<L11>:
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 69 c4              cmp32	q3, q1
 d1 04                 brne8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0x114
<L12>:
 f0 62 ac              ldp16	r5, [q3]
 f4 20                 ldsp16	r4, [sp+0x8]
 34                    cmp	r5, r4
 d1 04                 brne8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0x1a5
<L13>:
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f7 6e                 add32	q3, q2
 f0 69 c4              cmp32	q3, q1
 d0 04                 breq8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0x187
<L14>:
 e2 00 00 00           jmpf	list_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.list_ok+0x114
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	list_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.list_ok+0x1ab
 01                    mov	r4, r5
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	list_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.list_ok+0x1ab
 c0 01                 ldi8	r4, 0x1
 e2 00 00 00           jmpf	list_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.list_ok+0x1ab
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	list_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.list_ok+0x1ab
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	list_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.list_ok+0x1ab

Disassembly of section .text.list_named:

<list_named>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 f0 30 19              ldsp16	r0, [sp+0x19]
 f0 31 1b              ldsp16	r1, [sp+0x1b]
 f0 38 06              stsp16	[sp+0x6], r0
 f0 39 08              stsp16	[sp+0x8], r1
 f4 52                 stsp16	[sp+0x4], r6
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_named
		R_AVM_FAR24	.text.list_named+0x6c
<L0>:
 c2 09                 ldi8	r6, 0x9
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 73                 stsp16	[sp+0xc], r7
 0b                    mov	r6, r7
 fa 9d                 lsr16i	r6, 0xd
 f4 6a                 stsp16	[sp+0xa], r6
 0b                    mov	r6, r7
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 f4 2b                 ldsp16	r7, [sp+0xa]
 f1 16                 mov	r2, r6
 f1 1f                 mov	r3, r7
 f4 32                 ldsp16	r6, [sp+0xc]
 af                    xor	r7, r7
 f7 66                 add32	q1, q2
 f1 07                 mov	r0, r7
 f4 80                 lsl16.1	r0
 f4 80                 lsl16.1	r0
 06                    mov	r5, r6
 fa 8e                 lsr16i	r5, 0xe
 f9 a1                 or	r5, r0
 1a                    add	r6, r6
 1a                    add	r6, r6
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f0 63 cc              ldp24	q3, [q3]
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_named
		R_AVM_FAR24	.text.list_named+0x71
<L1>:
 f4 33                 ldsp16	r7, [sp+0xc]
 f4 af                 inc16	r7
 f4 11                 ldsp16	r5, [sp+0x4]
 37                    cmp	r5, r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_named
		R_AVM_FAR24	.text.list_named+0x25
<L2>:
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	list_named
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.list_named+0x73
 c0 01                 ldi8	r4, 0x1
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.match_list:

<match_list>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 f2 67                 mov32	q1, q3
 f0 36 1d              ldsp16	r6, [sp+0x1d]
 f4 6a                 stsp16	[sp+0xa], r6
 f0 30 19              ldsp16	r0, [sp+0x19]
 f0 31 1b              ldsp16	r1, [sp+0x1b]
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	match_list
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.list_ok
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0xc9
<L0>:
 f0 38 06              stsp16	[sp+0x6], r0
 f0 39 08              stsp16	[sp+0x8], r1
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 62 88              ldp16	r4, [q2]
 08                    mov	r6, r4
 af                    xor	r7, r7
 fa 7e                 lsr16i	r4, 0xe
 06                    mov	r5, r6
 15                    add	r5, r5
 15                    add	r5, r5
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 f0 00 03              ldi8	r0, 0x3
 f2 39                 sub	r1, r1
 f7 61                 add32	q0, q1
 f7 6c                 add32	q3, q0
 f7 6e                 add32	q3, q2
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 f0 69 0c              cmp32	q0, q3
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0x5f
<L1>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_list
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_list+0xe7
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f0 62 c0              ldp16	r6, [q0]
 f4 42                 stsp16	[sp+0x0], r6
 f0 63 c8              ldp24	q3, [q2]
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0xd9
<L2>:
 f0 69 c4              cmp32	q3, q1
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0xd9
<L3>:
 a0                    xor	r4, r4
 f4 70                 stsp16	[sp+0xc], r4
 d6 fc                 adjsp	-0x4
 f0 14 10              leasp	r4, 0x10
 f4 48                 stsp16	[sp+0x2], r4
 f4 38                 ldsp16	r4, [sp+0xe]
 f4 40                 stsp16	[sp+0x0], r4
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	match_list
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base
 d6 04                 adjsp	0x4
 f1 74                 zext8	r4
 04                    mov	r5, r4
 c9 fd                 addi.s8	r5, -0x3
 cd 02                 cmpi.s8	r5, 0x2
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0xcf
<L4>:
 cc 01                 cmpi.s8	r4, 0x1
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0xe0
<L5>:
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f0 69 08              cmp32	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0x5f
<L6>:
 e2 00 00 00           jmpf	match_list
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_list+0xe7
 02                    mov	r4, r6
 07                    mov	r5, r7
 e2 00 00 00           jmpf	match_list
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_list+0xe7
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 e2 00 00 00           jmpf	match_list
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_list+0xe7
 f4 00                 ldsp16	r4, [sp+0x0]
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_list
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_list+0xe7
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 01                 ldsp16	r5, [sp+0x0]
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.match_class_base:

<match_class_base>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 c2                 adjsp	-0x3e
 f0 02 09              ldi8	r2, 0x9
 f0 07 00 ff           ldi16	r3, 0xff00
 f2 63                 mov32	q0, q3
 f7 61                 add32	q0, q1
 f2 42                 sub	r2, r2
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 32 4b              ldsp16	r2, [sp+0x4b]
 f0 3a 30              stsp16	[sp+0x30], r2
 f0 32 49              ldsp16	r2, [sp+0x49]
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 06 09 01           ldi16	r2, 0x109
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x494
<L0>:
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__class_type_info
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__class_type_info
 f7 62                 add32	q0, q2
 f0 63 4c              ldp24	q1, [q3]
 f0 38 0a              stsp16	[sp+0xa], r0
 f0 39 0c              stsp16	[sp+0xc], r1
 f0 69 40              cmp32	q1, q0
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x6c
<L1>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__si_class_type_info
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__si_class_type_info
 c2 06                 ldi8	r6, 0x6
 af                    xor	r7, r7
 f7 63                 add32	q0, q3
 f0 69 40              cmp32	q1, q0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x8e
<L2>:
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 f2 69                 mov32	q2, q1
 f0 00 09              ldi8	r0, 0x9
 f0 05 00 ff           ldi16	r1, 0xff00
 f7 68                 add32	q2, q0
 f0 04 09 01           ldi16	r0, 0x109
 f0 69 80              cmp32	q2, q0
 d2 04                 brult8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0xc4
<L3>:
 e2 00 00 00           jmpf	match_class_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base+0x494
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 c2 09                 ldi8	r6, 0x9
 c7 00 ff              ldi16	r7, 0xff00
 f7 63                 add32	q0, q3
 c6 09 01              ldi16	r6, 0x109
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x494
<L4>:
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__vmi_class_type_info
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__vmi_class_type_info
 c2 06                 ldi8	r6, 0x6
 af                    xor	r7, r7
 f7 63                 add32	q0, q3
 f0 69 40              cmp32	q1, q0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x494
<L5>:
 f0 3e 26              stsp16	[sp+0x26], r6
 f0 3f 28              stsp16	[sp+0x28], r7
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__si_class_type_info
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__si_class_type_info
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f7 6e                 add32	q3, q2
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 63 c4              ldp24	q3, [q1]
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x10c
<L6>:
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x10c
<L7>:
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__vmi_class_type_info
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__vmi_class_type_info
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f0 69 c0              cmp32	q3, q0
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x494
<L8>:
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__vmi_class_type_info
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__vmi_class_type_info
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f7 6e                 add32	q3, q2
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 a0                    xor	r4, r4
 f0 2c 32              stsp8	[sp+0x32], r4
 f4 01                 ldsp16	r5, [sp+0x0]
 af                    xor	r7, r7
 f0 3d 2c              stsp16	[sp+0x2c], r5
 f0 3f 2e              stsp16	[sp+0x2e], r7
 f0 3c 2a              stsp16	[sp+0x2a], r4
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3c 24              stsp16	[sp+0x24], r4
 08                    mov	r6, r4
 02                    mov	r4, r6
 f1 74                 zext8	r4
 f4 a6                 tst8	r6
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3c 14              stsp16	[sp+0x14], r4
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 d1 04                 brne8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x234
<L9>:
 c1 01                 ldi8	r5, 0x1
 f4 51                 stsp16	[sp+0x4], r5
 f0 15 32              leasp	r5, 0x32
 f4 41                 stsp16	[sp+0x0], r5
 f1 76                 zext8	r6
 f0 3e 16              stsp16	[sp+0x16], r6
 f2 6b                 mov32	q3, q1
 e2 00 00 00           jmpf	match_class_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base+0x1e5
 f4 00                 ldsp16	r4, [sp+0x0]
 44                    ld8u	r5, [r4]
 f4 b5                 dec16	r5
 f1 15                 mov	r2, r5
 c0 ff                 ldi8	r4, 0xff
 a5                    xor	r5, r5
 f9 88                 and	r4, r2
 f2 66                 mov32	q1, q2
 10                    add	r4, r4
 10                    add	r4, r4
 10                    add	r4, r4
 f7 79                 sub32	q2, q1
 f7 6e                 add32	q3, q2
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 02                    mov	r4, r6
 07                    mov	r5, r7
 c2 0e                 ldi8	r6, 0xe
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f0 63 48              ldp24	q1, [q2]
 f2 69                 mov32	q2, q1
 aa                    xor	r6, r6
 c3 80                 ldi8	r7, 0x80
 82                    and	r4, r6
 87                    and	r5, r7
 f2 6b                 mov32	q3, q1
 f0 38 3a              stsp16	[sp+0x3a], r0
 f0 39 3c              stsp16	[sp+0x3c], r1
 f2 30                 sub	r0, r0
 f0 05 00 ff           ldi16	r1, 0xff00
 f7 6c                 add32	q3, q0
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 fb 32                 cmov.eq	r6, r2
 fb 3b                 cmov.eq	r7, r3
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 f2 68                 mov32	q2, q0
 f0 02 0d              ldi8	r2, 0xd
 f2 4b                 sub	r3, r3
 f7 69                 add32	q2, q1
 f0 60 a8              ldp8u	r5, [q2]
 fa 46                 lsl16i	r5, 0x6
 f6 45                 sext8	r5
 fa c7                 asr16i	r5, 0x7
 f4 10                 ldsp16	r4, [sp+0x4]
 84                    and	r5, r4
 f0 02 0a              ldi8	r2, 0xa
 f7 61                 add32	q0, q1
 f2 64                 mov32	q1, q0
 f0 30 3a              ldsp16	r0, [sp+0x3a]
 f0 31 3c              ldsp16	r1, [sp+0x3c]
 f0 63 44              ldp24	q1, [q1]
 f4 51                 stsp16	[sp+0x4], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 f7 63                 add32	q0, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 ae                 inc16	r6
 f4 42                 stsp16	[sp+0x0], r6
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 f2 6b                 mov32	q3, q1
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x22c
<L10>:
 f4 48                 stsp16	[sp+0x2], r4
 f2 67                 mov32	q1, q3
 c0 09                 ldi8	r4, 0x9
 c5 00 ff              ldi16	r5, 0xff00
 f7 66                 add32	q1, q2
 c4 09 01              ldi16	r4, 0x109
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x15f
<L11>:
 f0 63 4c              ldp24	q1, [q3]
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f0 69 48              cmp32	q1, q2
 d1 04                 brne8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x15f
<L12>:
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f0 69 48              cmp32	q1, q2
 d0 04                 breq8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x15f
<L13>:
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f7 6e                 add32	q3, q2
 f0 63 cc              ldp24	q3, [q3]
 f2 67                 mov32	q1, q3
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 11                 ldsp16	r5, [sp+0x4]
 e2 00 00 00           jmpf	match_class_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base+0x1cf
 f4 a5                 tst8	r5
 f8 04                 cset.eq	r4
 e2 00 00 00           jmpf	match_class_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base+0x23a
 a0                    xor	r4, r4
 f2 6b                 mov32	q3, q1
 f0 3c 16              stsp16	[sp+0x16], r4
 f4 40                 stsp16	[sp+0x0], r4
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 67                 mov32	q1, q3
 c2 09                 ldi8	r6, 0x9
 c7 00 ff              ldi16	r7, 0xff00
 f7 6b                 add32	q2, q3
 c6 09 01              ldi16	r6, 0x109
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x2dd
<L14>:
 f0 63 84              ldp24	q2, [q1]
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 f0 69 8c              cmp32	q2, q3
 d1 04                 brne8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x2dd
<L15>:
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 f0 69 8c              cmp32	q2, q3
 d0 04                 breq8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x285
<L16>:
 f0 14 32              leasp	r4, 0x32
 f0 35 16              ldsp16	r5, [sp+0x16]
 11                    add	r4, r5
 44                    ld8u	r5, [r4]
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x2f9
<L17>:
 e2 00 00 00           jmpf	match_class_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base+0x2dd
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f0 69 8c              cmp32	q2, q3
 d0 04                 breq8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x2dd
<L18>:
 c0 08                 ldi8	r4, 0x8
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 c2 03                 ldi8	r6, 0x3
 f4 4a                 stsp16	[sp+0x2], r6
 f0 62 88              ldp16	r4, [q2]
 cc 21                 cmpi.s8	r4, 0x21
 d2 04                 brult8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x494
<L19>:
 f0 38 3a              stsp16	[sp+0x3a], r0
 f0 39 3c              stsp16	[sp+0x3c], r1
 04                    mov	r5, r4
 fa 8d                 lsr16i	r5, 0xd
 08                    mov	r6, r4
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 0d                    mov	r7, r5
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f7 73                 sub32	q0, q3
 c6 f6 ff              ldi16	r6, 0xfff6
 c3 ff                 ldi8	r7, 0xff
 f7 6c                 add32	q3, q0
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x494
<L20>:
 f0 15 32              leasp	r5, 0x32
 f0 36 16              ldsp16	r6, [sp+0x16]
 16                    add	r5, r6
 f2 61                 mov32	q0, q1
 49                    ld8u	r6, [r5]
 38                    cmp	r6, r4
 d8 04                 bruge8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x30e
<L21>:
 f0 36 12              ldsp16	r6, [sp+0x12]
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x46e
<L22>:
 f0 34 14              ldsp16	r4, [sp+0x14]
 f4 b4                 dec16	r4
 f4 b6                 dec16	r6
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 e2 00 00 00           jmpf	match_class_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base+0x139
 c1 01                 ldi8	r5, 0x1
 51                    st8	[r4], r5
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f7 66                 add32	q1, q2
 f0 63 c4              ldp24	q3, [q1]
 c0 02                 ldi8	r4, 0x2
 f4 50                 stsp16	[sp+0x4], r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_class_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base+0x38b
 f1 16                 mov	r2, r6
 f2 4b                 sub	r3, r3
 f4 ae                 inc16	r6
 56                    st8	[r5], r6
 f2 69                 mov32	q2, q1
 f4 82                 lsl16.1	r2
 f4 82                 lsl16.1	r2
 f4 82                 lsl16.1	r2
 f1 2a                 mov	r6, r2
 af                    xor	r7, r7
 f7 7e                 sub32	q3, q2
 f7 63                 add32	q0, q3
 c0 0e                 ldi8	r4, 0xe
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f0 63 48              ldp24	q1, [q2]
 c0 0a                 ldi8	r4, 0xa
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 c2 0d                 ldi8	r6, 0xd
 af                    xor	r7, r7
 f7 63                 add32	q0, q3
 f0 60 00              ldp8u	r0, [q0]
 f0 63 c8              ldp24	q3, [q2]
 c1 01                 ldi8	r5, 0x1
 f9 a0                 and	r5, r0
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x49d
<L23>:
 a0                    xor	r4, r4
 c1 80                 ldi8	r5, 0x80
 f0 3a 06              stsp16	[sp+0x6], r2
 f0 3b 08              stsp16	[sp+0x8], r3
 f2 66                 mov32	q1, q2
 f4 21                 ldsp16	r5, [sp+0x8]
 f9 74                 and	r3, r5
 a0                    xor	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 f0 38 04              stsp16	[sp+0x4], r0
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 f7 68                 add32	q2, q0
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 40              cmp32	q1, q0
 f0 30 3a              ldsp16	r0, [sp+0x3a]
 f0 31 3c              ldsp16	r1, [sp+0x3c]
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 fb 22                 cmov.eq	r4, r2
 fb 2b                 cmov.eq	r5, r3
 f2 67                 mov32	q1, q3
 f4 12                 ldsp16	r6, [sp+0x4]
 ce 04                 cmpi.s8	r6, 0x4
 f2 6b                 mov32	q3, q1
 d2 04                 brult8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x494
<L24>:
 f2 66                 mov32	q1, q2
 f7 64                 add32	q1, q0
 c1 03                 ldi8	r5, 0x3
 f0 30 2c              ldsp16	r0, [sp+0x2c]
 f0 31 2e              ldsp16	r1, [sp+0x2e]
 f0 3a 3a              stsp16	[sp+0x3a], r2
 f0 3d 3c              stsp16	[sp+0x3c], r5
 f0 69 40              cmp32	q1, q0
 f4 49                 stsp16	[sp+0x2], r5
 d2 04                 brult8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x494
<L25>:
 f2 63                 mov32	q0, q3
 f0 02 09              ldi8	r2, 0x9
 f0 07 00 ff           ldi16	r3, 0xff00
 f7 61                 add32	q0, q1
 f0 06 09 01           ldi16	r2, 0x109
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x494
<L26>:
 f0 63 0c              ldp24	q0, [q3]
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f0 33 0c              ldsp16	r3, [sp+0xc]
 f0 69 04              cmp32	q0, q1
 d1 04                 brne8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x3f0
<L27>:
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 f0 69 04              cmp32	q0, q1
 d1 04                 brne8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x3f0
<L28>:
 f0 32 18              ldsp16	r2, [sp+0x18]
 f0 33 1a              ldsp16	r3, [sp+0x1a]
 f0 69 04              cmp32	q0, q1
 d0 04                 breq8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x494
<L29>:
 c0 04                 ldi8	r4, 0x4
 f4 48                 stsp16	[sp+0x2], r4
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 f4 ac                 inc16	r4
 c5 00 02              ldi16	r5, 0x200
 34                    cmp	r5, r4
 d8 04                 bruge8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x494
<L30>:
 f0 3c 2a              stsp16	[sp+0x2a], r4
 f0 35 12              ldsp16	r5, [sp+0x12]
 f1 75                 zext8	r5
 cd 07                 cmpi.s8	r5, 0x7
 d2 04                 brult8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x494
<L31>:
 f0 01 01              ldi8	r1, 0x1
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 8d                 lsr16.1	r5
 f2 30                 sub	r0, r0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 a4                 tst8	r4
 fb 68                 cmov.ne	r5, r0
 f0 32 26              ldsp16	r2, [sp+0x26]
 f0 33 28              ldsp16	r3, [sp+0x28]
 f0 69 c4              cmp32	q3, q1
 d0 04                 breq8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x456
<L32>:
 f0 34 20              ldsp16	r4, [sp+0x20]
 08                    mov	r6, r4
 f1 76                 zext8	r6
 ce 02                 cmpi.s8	r6, 0x2
 f8 16                 cset.ult	r6
 12                    add	r4, r6
 f0 3c 20              stsp16	[sp+0x20], r4
 08                    mov	r6, r4
 f1 76                 zext8	r6
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L33>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x456
<L33>:
 f0 36 3a              ldsp16	r6, [sp+0x3a]
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 39 20              stsp16	[sp+0x20], r1
 f0 36 12              ldsp16	r6, [sp+0x12]
 f4 ae                 inc16	r6
 02                    mov	r4, r6
 f1 74                 zext8	r4
 f0 15 32              leasp	r5, 0x32
 14                    add	r5, r4
 f3 04                 st8	[r5], r0
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 e2 00 00 00           jmpf	match_class_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base+0x136
 a0                    xor	r4, r4
 f4 48                 stsp16	[sp+0x2], r4
 f0 34 20              ldsp16	r4, [sp+0x20]
 f1 74                 zext8	r4
 cc 01                 cmpi.s8	r4, 0x1
 d0 04                 breq8	0x4 <L34>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x494
<L34>:
 f0 34 22              ldsp16	r4, [sp+0x22]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L35>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x494
<L35>:
 f0 34 30              ldsp16	r4, [sp+0x30]
 f0 35 24              ldsp16	r5, [sp+0x24]
 71                    st16	[r4], r5
 c0 01                 ldi8	r4, 0x1
 f4 48                 stsp16	[sp+0x2], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 d6 3e                 adjsp	0x3e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c0 02                 ldi8	r4, 0x2
 e2 00 00 00           jmpf	match_class_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base+0x492

Disassembly of section .text.find_call:

<find_call>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e8                 adjsp	-0x18
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f2 62                 mov32	q0, q2
 c0 0c                 ldi8	r4, 0xc
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f0 63 88              ldp24	q2, [q2]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 02 0a              ldi8	r2, 0xa
 f2 4b                 sub	r3, r3
 f7 64                 add32	q1, q0
 c0 08                 ldi8	r4, 0x8
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f0 62 88              ldp16	r4, [q2]
 a5                    xor	r5, r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 62 a4              ldp16	r5, [q1]
 f4 71                 stsp16	[sp+0xc], r5
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_call
		R_AVM_FAR24	.text.find_call+0x12c
<L0>:
 f1 17                 mov	r2, r7
 f4 82                 lsl16.1	r2
 f4 82                 lsl16.1	r2
 06                    mov	r5, r6
 fa 8e                 lsr16i	r5, 0xe
 f9 a9                 or	r5, r2
 1a                    add	r6, r6
 1a                    add	r6, r6
 f1 16                 mov	r2, r6
 f1 1d                 mov	r3, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f7 6c                 add32	q3, q0
 f7 6d                 add32	q3, q1
 04                    mov	r5, r4
 fa 8d                 lsr16i	r5, 0xd
 10                    add	r4, r4
 10                    add	r4, r4
 10                    add	r4, r4
 f1 14                 mov	r2, r4
 f1 1d                 mov	r3, r5
 f7 67                 add32	q1, q3
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f2 6a                 mov32	q3, q0
 f7 6e                 add32	q3, q2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 f0 63 c0              ldp24	q3, [q0]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f1 05                 mov	r0, r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 63 88              ldp24	q2, [q2]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c4 fb ff              ldi16	r4, 0xfffb
 c5 ff ff              ldi16	r5, 0xffff
 f7 69                 add32	q2, q1
 f0 63 c4              ldp24	q3, [q1]
 f0 38 0e              stsp16	[sp+0xe], r0
 f6 28                 tst16	r0
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_call
		R_AVM_FAR24	.text.find_call+0xb3
<L1>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_call
		R_AVM_FAR24	.text.find_call+0xb9
<L2>:
 f0 63 08              ldp24	q0, [q2]
 e2 00 00 00           jmpf	find_call
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_call+0xb9
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 8c              cmp32	q2, q3
 d2 04                 brult8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_call
		R_AVM_FAR24	.text.find_call+0x15c
<L3>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_call
		R_AVM_FAR24	.text.find_call+0x166
<L4>:
 f0 69 0c              cmp32	q0, q3
 d2 04                 brult8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_call
		R_AVM_FAR24	.text.find_call+0x152
<L5>:
 f2 69                 mov32	q2, q1
 c2 03                 ldi8	r6, 0x3
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f0 62 c8              ldp16	r6, [q2]
 c3 ff                 ldi8	r7, 0xff
 3e                    cmp	r7, r6
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_call
		R_AVM_FAR24	.text.find_call+0x136
<L6>:
 f0 63 c4              ldp24	q3, [q1]
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f0 69 c0              cmp32	q3, q0
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_call
		R_AVM_FAR24	.text.find_call+0x140
<L7>:
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_call
		R_AVM_FAR24	.text.find_call+0x148
<L8>:
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f7 66                 add32	q1, q2
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 ad                 inc16	r5
 f4 30                 ldsp16	r4, [sp+0xc]
 31                    cmp	r4, r5
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_call
		R_AVM_FAR24	.text.find_call+0x6f
<L9>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 e2 00 00 00           jmpf	find_call
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_call+0x16c
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 e2 00 00 00           jmpf	find_call
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_call+0x16c
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 e2 00 00 00           jmpf	find_call
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_call+0x16c
 f0 62 88              ldp16	r4, [q2]
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_call
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_call+0x16c
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 e2 00 00 00           jmpf	find_call
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_call+0x16c
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 e2 00 00 00           jmpf	find_call
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_call+0x16c
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 e2 00 00 00           jmpf	find_call
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_call+0x16c
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 d6 18                 adjsp	0x18
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
