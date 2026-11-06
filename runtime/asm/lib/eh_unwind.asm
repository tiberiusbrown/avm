
eh_unwind.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 eh_unwind.c
00000000 l    d  .text.avm_eh_open_exception	00000000 .text.avm_eh_open_exception
00000000 l    d  .text.avm_eh_validate_block	00000000 .text.avm_eh_validate_block
00000000 l     F .text.site_ok	000000ca site_ok
00000000 l     F .text.pool_ok	0000023c pool_ok
00000000 l     F .text.site_has_call	00000075 site_has_call
00000000 l    d  .text.site_ok	00000000 .text.site_ok
00000000 l    d  .text.pool_ok	00000000 .text.pool_ok
00000000 l     F .text.list_ok	000001c2 list_ok
00000000 l     F .text.list_named	0000007a list_named
00000000 l    d  .text.site_has_call	00000000 .text.site_has_call
00000000 l    d  .text.avm_eh_find_handler	00000000 .text.avm_eh_find_handler
00000000 l     F .text.unwind_frame	000000d5 unwind_frame
00000000 l     F .text.find_function	0000035e find_function
00000000 l     F .text.find_row	000001c0 find_row
00000000 l     F .text.find_site	00000109 find_site
00000000 l     F .text.match_list	000002db match_list
00000000 l     F .text.find_call	0000016f find_call
00000000 l    d  .text.find_function	00000000 .text.find_function
00000000 l    d  .text.find_row	00000000 .text.find_row
00000000 l    d  .text.find_site	00000000 .text.find_site
00000000 l    d  .text.unwind_frame	00000000 .text.unwind_frame
00000000 l    d  .text.avm_eh_prepare_next	00000000 .text.avm_eh_prepare_next
00000000 l    d  .text.list_ok	00000000 .text.list_ok
00000000 l    d  .text.list_named	00000000 .text.list_named
00000000 l    d  .text.match_list	00000000 .text.match_list
00000000 l     F .text.rtti_kind	000000c3 rtti_kind
00000000 l     F .text.match_pointer_chain	00000216 match_pointer_chain
00000000 l     F .text.match_object_base	000005c6 match_object_base
00000000 l     F .text.match_pointer_base	00000481 match_pointer_base
00000000 l     F .text.match_null_base	000003a7 match_null_base
00000000 l    d  .text.rtti_kind	00000000 .text.rtti_kind
00000000 l    d  .text.match_pointer_chain	00000000 .text.match_pointer_chain
00000000 l    d  .text.match_pointer_base	00000000 .text.match_pointer_base
00000000 l    d  .text.match_null_base	00000000 .text.match_null_base
00000000 l    d  .text.match_object_base	00000000 .text.match_object_base
00000000 l    d  .text.find_call	00000000 .text.find_call
00000000 g     F .text.avm_eh_open_exception	00000141 avm_eh_open_exception
00000000 g     O .rodata.__avm_eh_metadata_ptr	00000003 __avm_eh_metadata_ptr
00000000 g     F .text.avm_eh_validate_block	000007b2 avm_eh_validate_block
00000000 g     F .text.avm_eh_find_handler	00000175 avm_eh_find_handler
00000000 g     F .text.avm_eh_prepare_next	000001d7 avm_eh_prepare_next
00000000         *UND*	00000000 vtable for __cxxabiv1::__class_type_info
00000000         *UND*	00000000 vtable for __cxxabiv1::__si_class_type_info
00000000         *UND*	00000000 vtable for __cxxabiv1::__vmi_class_type_info
00000000         *UND*	00000000 vtable for __cxxabiv1::__pointer_type_info
00000000         *UND*	00000000 vtable for __cxxabiv1::__fundamental_type_info
00000000         *UND*	00000000 vtable for __cxxabiv1::__function_type_info
00000000         *UND*	00000000 __avm_eh_exact_pointer_ref_type_info

Disassembly of section .text.avm_eh_open_exception:

<avm_eh_open_exception>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 04                    mov	r5, r4
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	__avm_eh_metadata_ptr
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	__avm_eh_metadata_ptr
 f0 63 cc              ldp24	q3, [q3]
 a0                    xor	r4, r4
 f2 30                 sub	r0, r0
 f0 05 00 ff           ldi16	r1, 0xff00
 f7 63                 add32	q0, q3
 f0 02 01              ldi8	r2, 0x1
 f0 07 00 ff           ldi16	r3, 0xff00
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_open_exception
		R_AVM_FAR24	.text.avm_eh_open_exception+0x13a
<L0>:
 f4 69                 stsp16	[sp+0xa], r5
 f0 60 ac              ldp8u	r5, [q3]
 cd 41                 cmpi.s8	r5, 0x41
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_open_exception
		R_AVM_FAR24	.text.avm_eh_open_exception+0x13a
<L1>:
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f7 63                 add32	q0, q3
 f0 60 a0              ldp8u	r5, [q0]
 cd 56                 cmpi.s8	r5, 0x56
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_open_exception
		R_AVM_FAR24	.text.avm_eh_open_exception+0x13a
<L2>:
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 63                 add32	q0, q3
 f0 60 a0              ldp8u	r5, [q0]
 cd 45                 cmpi.s8	r5, 0x45
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_open_exception
		R_AVM_FAR24	.text.avm_eh_open_exception+0x13a
<L3>:
 f0 00 03              ldi8	r0, 0x3
 f2 39                 sub	r1, r1
 f7 63                 add32	q0, q3
 f0 60 a0              ldp8u	r5, [q0]
 cd 48                 cmpi.s8	r5, 0x48
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_open_exception
		R_AVM_FAR24	.text.avm_eh_open_exception+0x13a
<L4>:
 f0 00 04              ldi8	r0, 0x4
 f2 39                 sub	r1, r1
 f7 63                 add32	q0, q3
 f0 60 a0              ldp8u	r5, [q0]
 cd 35                 cmpi.s8	r5, 0x35
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_open_exception
		R_AVM_FAR24	.text.avm_eh_open_exception+0x13a
<L5>:
 f0 00 07              ldi8	r0, 0x7
 f2 39                 sub	r1, r1
 f7 63                 add32	q0, q3
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f0 63 c0              ldp24	q3, [q0]
 f0 00 0a              ldi8	r0, 0xa
 f2 39                 sub	r1, r1
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_open_exception
		R_AVM_FAR24	.text.avm_eh_open_exception+0x13a
<L6>:
 f2 42                 sub	r2, r2
 f0 07 00 01           ldi16	r3, 0x100
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f7 77                 sub32	q1, q3
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f0 69 4c              cmp32	q1, q3
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_open_exception
		R_AVM_FAR24	.text.avm_eh_open_exception+0x13a
<L7>:
 f0 02 05              ldi8	r2, 0x5
 f2 4b                 sub	r3, r3
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f7 67                 add32	q1, q3
 f0 62 c4              ldp16	r6, [q1]
 0e                    mov	r7, r6
 fa ae                 lsr16i	r7, 0xe
 06                    mov	r5, r6
 15                    add	r5, r5
 15                    add	r5, r5
 f1 05                 mov	r0, r5
 f1 0f                 mov	r1, r7
 f4 42                 stsp16	[sp+0x0], r6
 f1 16                 mov	r2, r6
 f2 4b                 sub	r3, r3
 f7 65                 add32	q1, q1
 f7 64                 add32	q1, q0
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 f7 67                 add32	q1, q3
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_open_exception
		R_AVM_FAR24	.text.avm_eh_open_exception+0x13a
<L8>:
 f4 01                 ldsp16	r5, [sp+0x0]
 f6 2d                 tst16	r5
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 d1 04                 brne8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_open_exception
		R_AVM_FAR24	.text.avm_eh_open_exception+0x10b
<L9>:
 f0 00 0d              ldi8	r0, 0xd
 f2 39                 sub	r1, r1
 f7 63                 add32	q0, q3
 f0 63 00              ldp24	q0, [q0]
 f0 69 04              cmp32	q0, q1
 d0 04                 breq8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_open_exception
		R_AVM_FAR24	.text.avm_eh_open_exception+0x13a
<L10>:
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f7 6e                 add32	q3, q2
 f0 30 0a              ldsp16	r0, [sp+0xa]
 f4 00                 ldsp16	r4, [sp+0x0]
 ee 90 51              st16	[r0+49], r4
 ee e0 50              st8	[r0+48], r7
 f4 21                 ldsp16	r5, [sp+0x8]
 01                    mov	r4, r5
 ee 80 4d              st8	[r0+45], r4
 ee c0 4e              st8	[r0+46], r6
 fa 98                 lsr16i	r6, 0x8
 ee c0 4f              st8	[r0+47], r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 ee c0 4b              st8	[r0+43], r6
 fa 98                 lsr16i	r6, 0x8
 ee c0 4c              st8	[r0+44], r6
 c0 01                 ldi8	r4, 0x1
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.avm_eh_validate_block:

<avm_eh_validate_block>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 b2                 adjsp	-0x4e
 f2 30                 sub	r0, r0
 f0 05 00 ff           ldi16	r1, 0xff00
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f7 62                 add32	q0, q2
 a0                    xor	r4, r4
 f0 02 01              ldi8	r2, 0x1
 f0 07 00 ff           ldi16	r3, 0xff00
 f0 69 04              cmp32	q0, q1
 f4 40                 stsp16	[sp+0x0], r4
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79f
<L0>:
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f0 60 a8              ldp8u	r5, [q2]
 cd 41                 cmpi.s8	r5, 0x41
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79f
<L1>:
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f7 62                 add32	q0, q2
 f0 60 a0              ldp8u	r5, [q0]
 cd 56                 cmpi.s8	r5, 0x56
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79f
<L2>:
 f0 02 02              ldi8	r2, 0x2
 f2 4b                 sub	r3, r3
 f0 30 02              ldsp16	r0, [sp+0x2]
 f0 31 04              ldsp16	r1, [sp+0x4]
 f7 61                 add32	q0, q1
 f0 60 a0              ldp8u	r5, [q0]
 cd 45                 cmpi.s8	r5, 0x45
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79f
<L3>:
 f0 02 03              ldi8	r2, 0x3
 f2 4b                 sub	r3, r3
 f0 30 02              ldsp16	r0, [sp+0x2]
 f0 31 04              ldsp16	r1, [sp+0x4]
 f7 61                 add32	q0, q1
 f0 60 a0              ldp8u	r5, [q0]
 cd 48                 cmpi.s8	r5, 0x48
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79f
<L4>:
 f0 00 04              ldi8	r0, 0x4
 f2 39                 sub	r1, r1
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f7 62                 add32	q0, q2
 f0 60 a0              ldp8u	r5, [q0]
 cd 35                 cmpi.s8	r5, 0x35
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79f
<L5>:
 f0 00 07              ldi8	r0, 0x7
 f2 39                 sub	r1, r1
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f7 62                 add32	q0, q2
 f0 63 80              ldp24	q2, [q0]
 f0 00 0a              ldi8	r0, 0xa
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79f
<L6>:
 f2 30                 sub	r0, r0
 f0 05 00 01           ldi16	r1, 0x100
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f7 73                 sub32	q0, q3
 f0 69 08              cmp32	q0, q2
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79f
<L7>:
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3d 24              stsp16	[sp+0x24], r5
 f0 02 05              ldi8	r2, 0x5
 f2 4b                 sub	r3, r3
 f0 30 02              ldsp16	r0, [sp+0x2]
 f0 31 04              ldsp16	r1, [sp+0x4]
 f7 61                 add32	q0, q1
 f0 62 80              ldp16	r4, [q0]
 04                    mov	r5, r4
 fa 8e                 lsr16i	r5, 0xe
 09                    mov	r6, r5
 04                    mov	r5, r4
 15                    add	r5, r5
 15                    add	r5, r5
 f1 05                 mov	r0, r5
 f1 0e                 mov	r1, r6
 f0 3c 1a              stsp16	[sp+0x1a], r4
 a5                    xor	r5, r5
 f7 6a                 add32	q2, q2
 f7 68                 add32	q2, q0
 f2 62                 mov32	q0, q2
 f0 02 0a              ldi8	r2, 0xa
 f2 6b                 mov32	q3, q1
 f0 32 22              ldsp16	r2, [sp+0x22]
 f0 33 24              ldsp16	r3, [sp+0x24]
 f7 63                 add32	q0, q3
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79f
<L8>:
 f0 30 02              ldsp16	r0, [sp+0x2]
 f0 31 04              ldsp16	r1, [sp+0x4]
 f7 64                 add32	q1, q0
 f0 3a 22              stsp16	[sp+0x22], r2
 f0 3b 24              stsp16	[sp+0x24], r3
 f0 02 0a              ldi8	r2, 0xa
 f2 4b                 sub	r3, r3
 f7 61                 add32	q0, q1
 f0 38 4a              stsp16	[sp+0x4a], r0
 f0 39 4c              stsp16	[sp+0x4c], r1
 f7 68                 add32	q2, q0
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x792
<L9>:
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 a0                    xor	r4, r4
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 32 22              ldsp16	r2, [sp+0x22]
 f0 33 24              ldsp16	r3, [sp+0x24]
 f0 38 1e              stsp16	[sp+0x1e], r0
 f0 39 20              stsp16	[sp+0x20], r1
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f0 38 2e              stsp16	[sp+0x2e], r0
 f0 39 30              stsp16	[sp+0x30], r1
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f7 76                 sub32	q1, q2
 f0 00 12              ldi8	r0, 0x12
 f2 39                 sub	r1, r1
 f0 3a 12              stsp16	[sp+0x12], r2
 f0 3b 14              stsp16	[sp+0x14], r3
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x7a8
<L10>:
 f0 00 0f              ldi8	r0, 0xf
 f2 39                 sub	r1, r1
 f7 62                 add32	q0, q2
 f0 38 06              stsp16	[sp+0x6], r0
 f0 39 08              stsp16	[sp+0x8], r1
 c2 0c                 ldi8	r6, 0xc
 af                    xor	r7, r7
 f2 66                 mov32	q1, q2
 f7 67                 add32	q1, q3
 f2 62                 mov32	q0, q2
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 3d 36              stsp16	[sp+0x36], r5
 f0 62 88              ldp16	r4, [q2]
 f0 3a 2a              stsp16	[sp+0x2a], r2
 f0 3b 2c              stsp16	[sp+0x2c], r3
 f0 63 44              ldp24	q1, [q1]
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 f0 63 00              ldp24	q0, [q0]
 f0 38 26              stsp16	[sp+0x26], r0
 f0 39 28              stsp16	[sp+0x28], r1
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x7ad
<L11>:
 a5                    xor	r5, r5
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 fa 7e                 lsr16i	r4, 0xe
 f4 58                 stsp16	[sp+0x6], r4
 f4 28                 ldsp16	r4, [sp+0xa]
 04                    mov	r5, r4
 15                    add	r5, r5
 15                    add	r5, r5
 f4 18                 ldsp16	r4, [sp+0x6]
 f1 05                 mov	r0, r5
 f1 0c                 mov	r1, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f7 62                 add32	q0, q2
 c0 12                 ldi8	r4, 0x12
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f0 69 40              cmp32	q1, q0
 f2 61                 mov32	q0, q1
 a0                    xor	r4, r4
 d8 04                 bruge8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79d
<L12>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 28                 ldsp16	r4, [sp+0xa]
 04                    mov	r5, r4
 fa 8d                 lsr16i	r5, 0xd
 10                    add	r4, r4
 10                    add	r4, r4
 10                    add	r4, r4
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f1 15                 mov	r2, r5
 f4 82                 lsl16.1	r2
 f4 82                 lsl16.1	r2
 fa 7e                 lsr16i	r4, 0xe
 f9 89                 or	r4, r2
 f0 3c 16              stsp16	[sp+0x16], r4
 f4 18                 ldsp16	r4, [sp+0x6]
 04                    mov	r5, r4
 15                    add	r5, r5
 15                    add	r5, r5
 f0 34 16              ldsp16	r4, [sp+0x16]
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f7 66                 add32	q1, q2
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f7 69                 add32	q2, q1
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 c0 12                 ldi8	r4, 0x12
 a5                    xor	r5, r5
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f7 6e                 add32	q3, q2
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79f
<L13>:
 f0 38 06              stsp16	[sp+0x6], r0
 f0 39 08              stsp16	[sp+0x8], r1
 f0 34 26              ldsp16	r4, [sp+0x26]
 f0 35 28              ldsp16	r5, [sp+0x28]
 f0 69 80              cmp32	q2, q0
 f0 00 0a              ldi8	r0, 0xa
 f2 39                 sub	r1, r1
 f2 64                 mov32	q1, q0
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 d8 04                 bruge8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79f
<L14>:
 f0 00 08              ldi8	r0, 0x8
 f2 39                 sub	r1, r1
 f7 62                 add32	q0, q2
 f7 69                 add32	q2, q1
 f0 3c 3e              stsp16	[sp+0x3e], r4
 f0 3d 40              stsp16	[sp+0x40], r5
 f0 62 a8              ldp16	r5, [q2]
 f1 15                 mov	r2, r5
 f2 4b                 sub	r3, r3
 f0 38 42              stsp16	[sp+0x42], r0
 f0 39 44              stsp16	[sp+0x44], r1
 f0 62 a0              ldp16	r5, [q0]
 af                    xor	r7, r7
 01                    mov	r4, r5
 f4 68                 stsp16	[sp+0xa], r4
 07                    mov	r5, r7
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 3a 3a              stsp16	[sp+0x3a], r2
 f0 3b 3c              stsp16	[sp+0x3c], r3
 f2 61                 mov32	q0, q1
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f0 32 26              ldsp16	r2, [sp+0x26]
 f0 33 28              ldsp16	r3, [sp+0x28]
 f0 69 84              cmp32	q2, q1
 d8 04                 bruge8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79f
<L15>:
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 f0 32 3a              ldsp16	r2, [sp+0x3a]
 f0 33 3c              ldsp16	r3, [sp+0x3c]
 f7 69                 add32	q2, q1
 f1 15                 mov	r2, r5
 f4 82                 lsl16.1	r2
 f4 82                 lsl16.1	r2
 04                    mov	r5, r4
 fa 8e                 lsr16i	r5, 0xe
 f9 a9                 or	r5, r2
 10                    add	r4, r4
 10                    add	r4, r4
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f4 28                 ldsp16	r4, [sp+0xa]
 04                    mov	r5, r4
 fa 8d                 lsr16i	r5, 0xd
 10                    add	r4, r4
 10                    add	r4, r4
 10                    add	r4, r4
 f1 14                 mov	r2, r4
 f1 1d                 mov	r3, r5
 f7 61                 add32	q0, q1
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f7 62                 add32	q0, q2
 f0 34 26              ldsp16	r4, [sp+0x26]
 f0 35 28              ldsp16	r5, [sp+0x28]
 f2 66                 mov32	q1, q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f7 76                 sub32	q1, q2
 f0 69 40              cmp32	q1, q0
 02                    mov	r4, r6
 07                    mov	r5, r7
 d8 04                 bruge8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79f
<L16>:
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 f7 69                 add32	q2, q1
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 3c 26              stsp16	[sp+0x26], r4
 f0 3d 28              stsp16	[sp+0x28], r5
 f0 38 12              stsp16	[sp+0x12], r0
 f0 39 14              stsp16	[sp+0x14], r1
 f0 69 80              cmp32	q2, q0
 f0 00 03              ldi8	r0, 0x3
 d1 04                 brne8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79f
<L17>:
 f2 69                 mov32	q2, q1
 f7 68                 add32	q2, q0
 f0 63 44              ldp24	q1, [q1]
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 63 08              ldp24	q0, [q2]
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f0 35 20              ldsp16	r5, [sp+0x20]
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79f
<L18>:
 f0 38 46              stsp16	[sp+0x46], r0
 f0 39 48              stsp16	[sp+0x48], r1
 f0 3a 06              stsp16	[sp+0x6], r2
 f0 3b 08              stsp16	[sp+0x8], r3
 f0 69 40              cmp32	q1, q0
 d2 04                 brult8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79f
<L19>:
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 01                    mov	r4, r5
 fa 7e                 lsr16i	r4, 0xe
 15                    add	r5, r5
 15                    add	r5, r5
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 f0 30 4a              ldsp16	r0, [sp+0x4a]
 f0 31 4c              ldsp16	r1, [sp+0x4c]
 f7 64                 add32	q1, q0
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 f0 35 30              ldsp16	r5, [sp+0x30]
 f7 6a                 add32	q2, q2
 f7 69                 add32	q2, q1
 f0 63 48              ldp24	q1, [q2]
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 f0 69 40              cmp32	q1, q0
 d0 04                 breq8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79f
<L20>:
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f7 73                 sub32	q0, q3
 f0 38 06              stsp16	[sp+0x6], r0
 f0 39 08              stsp16	[sp+0x8], r1
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 3d 30              stsp16	[sp+0x30], r5
 f2 66                 mov32	q1, q2
 f0 00 03              ldi8	r0, 0x3
 f2 39                 sub	r1, r1
 f7 64                 add32	q1, q0
 f0 63 44              ldp24	q1, [q1]
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f0 69 48              cmp32	q1, q2
 d0 04                 breq8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79f
<L21>:
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f4 ac                 inc16	r4
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 31                    cmp	r4, r5
 f0 30 22              ldsp16	r0, [sp+0x22]
 f0 31 24              ldsp16	r1, [sp+0x24]
 d2 04                 brult8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x3d2
<L22>:
 f0 00 09              ldi8	r0, 0x9
 f2 39                 sub	r1, r1
 f0 32 2e              ldsp16	r2, [sp+0x2e]
 f0 33 30              ldsp16	r3, [sp+0x30]
 f7 64                 add32	q1, q0
 f0 63 04              ldp24	q0, [q1]
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f7 62                 add32	q0, q2
 f0 32 26              ldsp16	r2, [sp+0x26]
 f0 33 28              ldsp16	r3, [sp+0x28]
 f0 69 40              cmp32	q1, q0
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 d0 04                 breq8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79f
<L23>:
 f0 30 3e              ldsp16	r0, [sp+0x3e]
 f0 31 40              ldsp16	r1, [sp+0x40]
 f0 62 80              ldp16	r4, [q0]
 f0 3c 32              stsp16	[sp+0x32], r4
 f0 30 42              ldsp16	r0, [sp+0x42]
 f0 31 44              ldsp16	r1, [sp+0x44]
 f0 62 80              ldp16	r4, [q0]
 f0 3c 38              stsp16	[sp+0x38], r4
 f0 30 34              ldsp16	r0, [sp+0x34]
 f0 31 36              ldsp16	r1, [sp+0x36]
 f0 62 80              ldp16	r4, [q0]
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 30 2a              ldsp16	r0, [sp+0x2a]
 f0 31 2c              ldsp16	r1, [sp+0x2c]
 f0 63 00              ldp24	q0, [q0]
 f0 38 34              stsp16	[sp+0x34], r0
 f0 39 36              stsp16	[sp+0x36], r1
 f0 00 12              ldi8	r0, 0x12
 f2 39                 sub	r1, r1
 f2 69                 mov32	q2, q1
 f7 61                 add32	q0, q1
 f0 32 2e              ldsp16	r2, [sp+0x2e]
 f6 2a                 tst16	r2
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 d1 04                 brne8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x55a
<L24>:
 f2 64                 mov32	q1, q0
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 f0 63 08              ldp24	q0, [q2]
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f7 62                 add32	q0, q2
 f0 69 04              cmp32	q0, q1
 f2 69                 mov32	q2, q1
 d8 04                 bruge8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79f
<L25>:
 f7 72                 sub32	q0, q2
 f0 02 05              ldi8	r2, 0x5
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79f
<L26>:
 f2 66                 mov32	q1, q2
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f7 66                 add32	q1, q2
 f0 3a 1e              stsp16	[sp+0x1e], r2
 f0 3b 20              stsp16	[sp+0x20], r3
 f0 60 84              ldp8u	r4, [q1]
 f4 58                 stsp16	[sp+0x6], r4
 04                    mov	r5, r4
 f4 8d                 lsr16.1	r5
 f0 02 01              ldi8	r2, 0x1
 f9 a8                 and	r5, r2
 f9 88                 and	r4, r2
 11                    add	r4, r5
 f0 3c 3a              stsp16	[sp+0x3a], r4
 f4 19                 ldsp16	r5, [sp+0x6]
 fa 82                 lsr16i	r5, 0x2
 f9 a8                 and	r5, r2
 14                    add	r5, r4
 01                    mov	r4, r5
 f4 19                 ldsp16	r5, [sp+0x6]
 fa 83                 lsr16i	r5, 0x3
 f9 a8                 and	r5, r2
 14                    add	r5, r4
 15                    add	r5, r5
 c9 05                 addi.s8	r5, 0x5
 f1 15                 mov	r2, r5
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79f
<L27>:
 c1 70                 ldi8	r5, 0x70
 f4 18                 ldsp16	r4, [sp+0x6]
 81                    and	r4, r5
 f0 30 0a              ldsp16	r0, [sp+0xa]
 f0 31 0c              ldsp16	r1, [sp+0xc]
 f0 62 00              ldp16	r0, [q0]
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79f
<L28>:
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f0 69 84              cmp32	q2, q1
 d1 04                 brne8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4e0
<L29>:
 f0 62 a8              ldp16	r5, [q2]
 f5 24                 cmp	r5, r0
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 d2 04                 brult8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79f
<L30>:
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x4ed
 f6 28                 tst16	r0
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 d0 04                 breq8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79f
<L31>:
 f2 39                 sub	r1, r1
 f0 63 48              ldp24	q1, [q2]
 f7 64                 add32	q1, q0
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 f0 63 08              ldp24	q0, [q2]
 f0 69 40              cmp32	q1, q0
 d2 04                 brult8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79f
<L32>:
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f0 35 20              ldsp16	r5, [sp+0x20]
 f0 60 a8              ldp8u	r5, [q2]
 f0 3d 12              stsp16	[sp+0x12], r5
 f4 8d                 lsr16.1	r5
 c0 01                 ldi8	r4, 0x1
 f1 04                 mov	r0, r4
 84                    and	r5, r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 34 12              ldsp16	r4, [sp+0x12]
 04                    mov	r5, r4
 08                    mov	r6, r4
 f9 a0                 and	r5, r0
 f4 18                 ldsp16	r4, [sp+0x6]
 14                    add	r5, r4
 f4 59                 stsp16	[sp+0x6], r5
 02                    mov	r4, r6
 04                    mov	r5, r4
 fa 82                 lsr16i	r5, 0x2
 f9 a0                 and	r5, r0
 f4 1a                 ldsp16	r6, [sp+0x6]
 16                    add	r5, r6
 fa 73                 lsr16i	r4, 0x3
 f9 80                 and	r4, r0
 11                    add	r4, r5
 10                    add	r4, r4
 c8 05                 addi.s8	r4, 0x5
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f7 62                 add32	q0, q2
 f0 32 2e              ldsp16	r2, [sp+0x2e]
 f4 b2                 dec16	r2
 f0 3a 2e              stsp16	[sp+0x2e], r2
 f6 2a                 tst16	r2
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f2 64                 mov32	q1, q0
 d0 04                 breq8	0x4 <L33>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x435
<L33>:
 f0 34 34              ldsp16	r4, [sp+0x34]
 f0 35 36              ldsp16	r5, [sp+0x36]
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 f7 6b                 add32	q2, q3
 f0 69 08              cmp32	q0, q2
 d0 04                 breq8	0x4 <L34>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79f
<L34>:
 f0 36 38              ldsp16	r6, [sp+0x38]
 f6 2e                 tst16	r6
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 3d 36              stsp16	[sp+0x36], r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d1 04                 brne8	0x4 <L35>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x5c1
<L35>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 30 38              ldsp16	r0, [sp+0x38]
 f0 32 34              ldsp16	r2, [sp+0x34]
 f0 33 36              ldsp16	r3, [sp+0x36]
 d6 fc                 adjsp	-0x4
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.site_ok
 d6 04                 adjsp	0x4
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L36>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79f
<L36>:
 f2 6b                 mov32	q3, q1
 c0 0c                 ldi8	r4, 0xc
 a5                    xor	r5, r5
 f7 6e                 add32	q3, q2
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 f2 69                 mov32	q2, q1
 f2 67                 mov32	q1, q3
 d0 04                 breq8	0x4 <L37>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x58e
<L37>:
 f0 34 32              ldsp16	r4, [sp+0x32]
 f6 2c                 tst16	r4
 f0 3e 1e              stsp16	[sp+0x1e], r6
 f0 3f 20              stsp16	[sp+0x20], r7
 f2 67                 mov32	q1, q3
 d1 04                 brne8	0x4 <L38>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x680
<L38>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 30 32              ldsp16	r0, [sp+0x32]
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f0 37 20              ldsp16	r7, [sp+0x20]
 f0 38 2e              stsp16	[sp+0x2e], r0
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 f0 63 00              ldp24	q0, [q0]
 f0 38 06              stsp16	[sp+0x6], r0
 f0 39 08              stsp16	[sp+0x8], r1
 f0 30 16              ldsp16	r0, [sp+0x16]
 f0 31 18              ldsp16	r1, [sp+0x18]
 f0 63 00              ldp24	q0, [q0]
 f0 38 0a              stsp16	[sp+0xa], r0
 f0 39 0c              stsp16	[sp+0xc], r1
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 f0 63 0c              ldp24	q0, [q3]
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 d1 04                 brne8	0x4 <L39>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x62a
<L39>:
 f0 63 c8              ldp24	q3, [q2]
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f0 69 80              cmp32	q2, q0
 d2 04                 brult8	0x4 <L40>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79f
<L40>:
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x639
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 69 80              cmp32	q2, q0
 d2 04                 brult8	0x4 <L41>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79f
<L41>:
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f0 69 80              cmp32	q2, q0
 f0 02 03              ldi8	r2, 0x3
 f2 4b                 sub	r3, r3
 d8 04                 bruge8	0x4 <L42>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79f
<L42>:
 f0 69 c0              cmp32	q3, q0
 d2 04                 brult8	0x4 <L43>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79f
<L43>:
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6d                 add32	q3, q1
 f0 62 cc              ldp16	r6, [q3]
 c3 ff                 ldi8	r7, 0xff
 3e                    cmp	r7, r6
 f0 30 2e              ldsp16	r0, [sp+0x2e]
 d8 04                 bruge8	0x4 <L44>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79f
<L44>:
 f2 66                 mov32	q1, q2
 c2 05                 ldi8	r6, 0x5
 af                    xor	r7, r7
 f7 67                 add32	q1, q3
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 f2 6b                 mov32	q3, q1
 d0 04                 breq8	0x4 <L45>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x5df
<L45>:
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 f0 63 c8              ldp24	q3, [q2]
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f7 6e                 add32	q3, q2
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f0 34 42              ldsp16	r4, [sp+0x42]
 f0 35 44              ldsp16	r5, [sp+0x44]
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
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f7 63                 add32	q0, q3
 f0 36 3e              ldsp16	r6, [sp+0x3e]
 f0 37 40              ldsp16	r7, [sp+0x40]
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
 d0 04                 breq8	0x4 <L46>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79f
<L46>:
 d6 fa                 adjsp	-0x6
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 f0 35 2e              ldsp16	r5, [sp+0x2e]
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 f4 40                 stsp16	[sp+0x0], r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f0 32 3a              ldsp16	r2, [sp+0x3a]
 f0 33 3c              ldsp16	r3, [sp+0x3c]
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.pool_ok
 d6 06                 adjsp	0x6
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L47>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79f
<L47>:
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f0 35 20              ldsp16	r5, [sp+0x20]
 f0 69 48              cmp32	q1, q2
 d2 04                 brult8	0x4 <L48>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x76a
<L48>:
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x729
 f2 68                 mov32	q2, q0
 f0 00 0c              ldi8	r0, 0xc
 f2 39                 sub	r1, r1
 f7 64                 add32	q1, q0
 f0 69 48              cmp32	q1, q2
 d2 04                 brult8	0x4 <L49>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x76a
<L49>:
 f2 61                 mov32	q0, q1
 c0 09                 ldi8	r4, 0x9
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f0 63 00              ldp24	q0, [q0]
 f2 69                 mov32	q2, q1
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 f2 66                 mov32	q1, q2
 f0 30 1e              ldsp16	r0, [sp+0x1e]
 f0 31 20              ldsp16	r1, [sp+0x20]
 d1 04                 brne8	0x4 <L50>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x717
<L50>:
 d6 fe                 adjsp	-0x2
 f0 34 34              ldsp16	r4, [sp+0x34]
 f4 40                 stsp16	[sp+0x0], r4
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.site_has_call
 d6 02                 adjsp	0x2
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L51>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x717
<L51>:
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79f
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 31                    cmp	r4, r5
 f0 30 46              ldsp16	r0, [sp+0x46]
 f0 31 48              ldsp16	r1, [sp+0x48]
 f0 34 26              ldsp16	r4, [sp+0x26]
 f0 35 28              ldsp16	r5, [sp+0x28]
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 32 22              ldsp16	r2, [sp+0x22]
 f0 33 24              ldsp16	r3, [sp+0x24]
 d0 04                 breq8	0x4 <L52>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x13d
<L52>:
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x798
 f0 32 22              ldsp16	r2, [sp+0x22]
 f0 33 24              ldsp16	r3, [sp+0x24]
 f0 69 84              cmp32	q2, q1
 f8 04                 cset.eq	r4
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d6 4e                 adjsp	0x4e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79d
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x79d

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
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f0 36 2f              ldsp16	r6, [sp+0x2f]
 f4 52                 stsp16	[sp+0x4], r6
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 f0 63 c4              ldp24	q3, [q1]
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f7 6e                 add32	q3, q2
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
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
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f7 69                 add32	q2, q1
 f7 62                 add32	q0, q2
 f7 63                 add32	q0, q3
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f0 69 08              cmp32	q0, q2
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	pool_ok
		R_AVM_FAR24	.text.pool_ok+0xf7
<L0>:
 f0 32 20              ldsp16	r2, [sp+0x20]
 f0 33 22              ldsp16	r3, [sp+0x22]
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	pool_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.list_ok
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	pool_ok
		R_AVM_FAR24	.text.pool_ok+0x21f
<L1>:
 f2 68                 mov32	q2, q0
 f7 79                 sub32	q2, q1
 d6 fc                 adjsp	-0x4
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 32 20              ldsp16	r2, [sp+0x20]
 f0 33 22              ldsp16	r3, [sp+0x22]
 f2 69                 mov32	q2, q1
 f4 22                 ldsp16	r6, [sp+0x8]
 e3 00 00 00           callf	pool_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.list_named
 d6 04                 adjsp	0x4
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	pool_ok
		R_AVM_FAR24	.text.pool_ok+0x224
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
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f0 69 8c              cmp32	q2, q3
 f2 62                 mov32	q0, q2
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	pool_ok
		R_AVM_FAR24	.text.pool_ok+0x8d
<L3>:
 e2 00 00 00           jmpf	pool_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.pool_ok+0xff
 f2 68                 mov32	q2, q0
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f0 69 8c              cmp32	q2, q3
 a0                    xor	r4, r4
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	pool_ok
		R_AVM_FAR24	.text.pool_ok+0x235
<L4>:
 c1 01                 ldi8	r5, 0x1
 f4 10                 ldsp16	r4, [sp+0x4]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	pool_ok
		R_AVM_FAR24	.text.pool_ok+0x22f
<L5>:
 c0 09                 ldi8	r4, 0x9
 a5                    xor	r5, r5
 f7 66                 add32	q1, q2
 aa                    xor	r6, r6
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 3b 1e              stsp16	[sp+0x1e], r3
 e2 00 00 00           jmpf	pool_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.pool_ok+0x14b
 f2 6a                 mov32	q3, q0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	pool_ok
		R_AVM_FAR24	.text.pool_ok+0x234
<L6>:
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 ae                 inc16	r6
 f4 10                 ldsp16	r4, [sp+0x4]
 38                    cmp	r6, r4
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	pool_ok
		R_AVM_FAR24	.text.pool_ok+0x229
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
 f4 6a                 stsp16	[sp+0xa], r6
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
		R_AVM_FAR24	.text.pool_ok+0x13e
<L8>:
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 63 08              ldp24	q0, [q2]
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 62 88              ldp16	r4, [q2]
 a5                    xor	r5, r5
 0c                    mov	r7, r4
 fa ad                 lsr16i	r7, 0xd
 08                    mov	r6, r4
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 f0 32 20              ldsp16	r2, [sp+0x20]
 f0 33 22              ldsp16	r3, [sp+0x22]
 f7 61                 add32	q0, q1
 f7 63                 add32	q0, q3
 f0 38 18              stsp16	[sp+0x18], r0
 f0 39 1a              stsp16	[sp+0x1a], r1
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f0 62 cc              ldp16	r6, [q3]
 f1 16                 mov	r2, r6
 f2 4b                 sub	r3, r3
 f7 69                 add32	q2, q1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 30 20              ldsp16	r0, [sp+0x20]
 f0 31 22              ldsp16	r1, [sp+0x22]
 f7 6c                 add32	q3, q0
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f7 67                 add32	q1, q3
 09                    mov	r6, r5
 1a                    add	r6, r6
 1a                    add	r6, r6
 04                    mov	r5, r4
 fa 8e                 lsr16i	r5, 0xe
 96                    or	r5, r6
 10                    add	r4, r4
 10                    add	r4, r4
 f1 04                 mov	r0, r4
 f1 0d                 mov	r1, r5
 f7 61                 add32	q0, q1
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f0 69 84              cmp32	q2, q1
 fc 14                 cmov.ult	r2, r4
 fc 1d                 cmov.ult	r3, r5
 f0 69 04              cmp32	q0, q1
 d2 04                 brult8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	pool_ok
		R_AVM_FAR24	.text.pool_ok+0x129
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
		R_AVM_FAR24	.text.pool_ok+0x1f3
<L10>:
 e2 00 00 00           jmpf	pool_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.pool_ok+0x12b
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	pool_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.pool_ok+0x235
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	pool_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.pool_ok+0x235
 c0 01                 ldi8	r4, 0x1
 e2 00 00 00           jmpf	pool_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.pool_ok+0x235
 01                    mov	r4, r5
 e2 00 00 00           jmpf	pool_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.pool_ok+0x235
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
 d6 ec                 adjsp	-0x14
 04                    mov	r5, r4
 f1 05                 mov	r0, r5
 f0 08 18              addi.s8	r0, 0x18
 c4 00 f6              ldi16	r4, 0xf600
 f4 50                 stsp16	[sp+0x4], r4
 a0                    xor	r4, r4
 f0 3c 10              stsp16	[sp+0x10], r4
 c4 00 ff              ldi16	r4, 0xff00
 f4 48                 stsp16	[sp+0x2], r4
 f4 41                 stsp16	[sp+0x0], r5
 c9 1a                 addi.s8	r5, 0x1a
 f4 59                 stsp16	[sp+0x6], r5
 f0 38 12              stsp16	[sp+0x12], r0
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0x3e
 f0 30 12              ldsp16	r0, [sp+0x12]
 f1 20                 mov	r4, r0
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 e3 00 00 00           callf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.unwind_frame
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x16b
<L0>:
 ed 90 20              ld16	r4, [r0+0]
 f4 11                 ldsp16	r5, [sp+0x4]
 11                    add	r4, r5
 f4 09                 ldsp16	r5, [sp+0x2]
 31                    cmp	r4, r5
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x16b
<L1>:
 f4 18                 ldsp16	r4, [sp+0x6]
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 66                 add32	q1, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f2 6b                 mov32	q3, q1
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
		R_AVM_FAR24	.text.avm_eh_find_handler+0x16b
<L2>:
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_row
 f2 6a                 mov32	q3, q0
 f2 62                 mov32	q0, q2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_site
 f2 66                 mov32	q1, q2
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 f7 68                 add32	q2, q0
 c2 02                 ldi8	r6, 0x2
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x16b
<L3>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 48              cmp32	q1, q2
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x16b
<L4>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 40              cmp32	q1, q0
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x27
<L5>:
 c0 09                 ldi8	r4, 0x9
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 63 c8              ldp24	q3, [q2]
 f0 69 c0              cmp32	q3, q0
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x27
<L6>:
 d6 fe                 adjsp	-0x2
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 40                 stsp16	[sp+0x0], r4
 f0 30 0a              ldsp16	r0, [sp+0xa]
 f0 31 0c              ldsp16	r1, [sp+0xc]
 f7 6c                 add32	q3, q0
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_list
 d6 02                 adjsp	0x2
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 8c              cmp32	q2, q3
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x16b
<L7>:
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x11c
<L8>:
 aa                    xor	r6, r6
 c3 01                 ldi8	r7, 0x1
 82                    and	r4, r6
 87                    and	r5, r7
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d1 04                 brne8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x27
<L9>:
 f4 02                 ldsp16	r6, [sp+0x0]
 ed 8c 37              ld8u	r4, [r6+23]
 c1 80                 ldi8	r5, 0x80
 84                    and	r5, r4
 c0 05                 ldi8	r4, 0x5
 91                    or	r4, r5
 ee 8c 37              st8	[r6+23], r4
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0x27
 f4 02                 ldsp16	r6, [sp+0x0]
 ee 9c 47              st16	[r6+39], r4
 01                    mov	r4, r5
 a5                    xor	r5, r5
 ee 9c 49              st16	[r6+41], r4
 c0 06                 ldi8	r4, 0x6
 f7 66                 add32	q1, q2
 f0 63 44              ldp24	q1, [q1]
 f4 18                 ldsp16	r4, [sp+0x6]
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_call
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 8c              cmp32	q2, q3
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x16b
<L10>:
 f0 36 12              ldsp16	r6, [sp+0x12]
 6a                    ld16	r6, [r6]
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 c6 00 0a              ldi16	r6, 0xa00
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x16b
<L11>:
 f4 02                 ldsp16	r6, [sp+0x0]
 ee 9c 38              st16	[r6+24], r4
 ee 5c 3a              st16	[r6+26], r2
 a5                    xor	r5, r5
 ee 6c 3c              st8	[r6+28], r3
 c0 01                 ldi8	r4, 0x1
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 d6 14                 adjsp	0x14
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
 d6 dc                 adjsp	-0x24
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 04                    mov	r5, r4
 c9 2b                 addi.s8	r5, 0x2b
 f7 2e                 ld16	r6, [r5+]
 4d                    ld8u	r7, [r5]
 ed 18 51              ld16	r0, [r4+49]
 f6 28                 tst16	r0
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x355
<L0>:
 f2 67                 mov32	q1, q3
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 f0 3a 14              stsp16	[sp+0x14], r2
 f0 3b 16              stsp16	[sp+0x16], r3
 f7 67                 add32	q1, q3
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 a5                    xor	r5, r5
 f1 0d                 mov	r1, r5
 f1 24                 mov	r5, r0
 f2 55                 sub	r5, r1
 f4 8d                 lsr16.1	r5
 f2 25                 add	r5, r1
 09                    mov	r6, r5
 fa 9e                 lsr16i	r6, 0xe
 0d                    mov	r7, r5
 1f                    add	r7, r7
 1f                    add	r7, r7
 f1 17                 mov	r2, r7
 f1 1e                 mov	r3, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f7 67                 add32	q1, q3
 09                    mov	r6, r5
 af                    xor	r7, r7
 f7 6f                 add32	q3, q3
 f7 6d                 add32	q3, q1
 f0 63 cc              ldp24	q3, [q3]
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 69 4c              cmp32	q1, q3
 fc 05                 cmov.ult	r0, r5
 f4 ad                 inc16	r5
 fc 29                 cmov.ult	r5, r1
 f5 24                 cmp	r5, r0
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x33
<L1>:
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0xe0
<L2>:
 f0 3d 10              stsp16	[sp+0x10], r5
 09                    mov	r6, r5
 f4 b6                 dec16	r6
 0e                    mov	r7, r6
 fa ae                 lsr16i	r7, 0xe
 f1 16                 mov	r2, r6
 f2 4b                 sub	r3, r3
 1a                    add	r6, r6
 1a                    add	r6, r6
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 f7 6c                 add32	q3, q0
 f2 61                 mov32	q0, q1
 f7 60                 add32	q0, q0
 f7 63                 add32	q0, q3
 c2 0d                 ldi8	r6, 0xd
 af                    xor	r7, r7
 f7 6c                 add32	q3, q0
 f0 63 cc              ldp24	q3, [q3]
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 ed d8 51              ld16	r6, [r4+49]
 af                    xor	r7, r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 70                 stsp16	[sp+0xc], r4
 02                    mov	r4, r6
 fa 7e                 lsr16i	r4, 0xe
 0e                    mov	r7, r6
 1f                    add	r7, r7
 1f                    add	r7, r7
 f1 17                 mov	r2, r7
 f1 1c                 mov	r3, r4
 f4 0b                 ldsp16	r7, [sp+0x2]
 f7 6f                 add32	q3, q3
 f7 6d                 add32	q3, q1
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 6b                 add32	q2, q3
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 69 48              cmp32	q1, q2
 d2 04                 brult8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0xe8
<L3>:
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x355
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x355
 f0 38 20              stsp16	[sp+0x20], r0
 f0 39 22              stsp16	[sp+0x22], r1
 f4 30                 ldsp16	r4, [sp+0xc]
 08                    mov	r6, r4
 ca 2e                 addi.s8	r6, 0x2e
 f7 30                 ld16	r0, [r6+]
 f5 39                 ld8u	r1, [r6]
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f2 6a                 mov32	q3, q0
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 f7 7c                 sub32	q3, q0
 f0 69 c4              cmp32	q3, q1
 d2 04                 brult8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x118
<L4>:
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x355
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f7 67                 add32	q1, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f7 7d                 sub32	q3, q1
 f0 00 12              ldi8	r0, 0x12
 f2 39                 sub	r1, r1
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 f0 69 c0              cmp32	q3, q0
 d2 04                 brult8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x142
<L5>:
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x355
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 f0 30 20              ldsp16	r0, [sp+0x20]
 f0 31 22              ldsp16	r1, [sp+0x22]
 f7 63                 add32	q0, q3
 f0 38 20              stsp16	[sp+0x20], r0
 f0 39 22              stsp16	[sp+0x22], r1
 f0 63 00              ldp24	q0, [q0]
 c2 03                 ldi8	r6, 0x3
 af                    xor	r7, r7
 f7 6d                 add32	q3, q1
 f0 63 cc              ldp24	q3, [q3]
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f0 63 c4              ldp24	q3, [q1]
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x25c
<L6>:
 f0 69 c0              cmp32	q3, q0
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x351
<L7>:
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f0 69 0c              cmp32	q0, q3
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 d2 04                 brult8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x355
<L8>:
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 f0 69 c0              cmp32	q3, q0
 d2 04                 brult8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x355
<L9>:
 ed 98 51              ld16	r4, [r4+49]
 f0 35 10              ldsp16	r5, [sp+0x10]
 34                    cmp	r5, r4
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 d2 04                 brult8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x1eb
<L10>:
 f2 64                 mov32	q1, q0
 f0 30 20              ldsp16	r0, [sp+0x20]
 f0 31 22              ldsp16	r1, [sp+0x22]
 f2 6a                 mov32	q3, q0
 f7 6e                 add32	q3, q2
 f0 63 cc              ldp24	q3, [q3]
 f0 69 c4              cmp32	q3, q1
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 d8 04                 bruge8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x355
<L11>:
 c2 09                 ldi8	r6, 0x9
 af                    xor	r7, r7
 f7 63                 add32	q0, q3
 f0 63 c0              ldp24	q3, [q0]
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 f7 6c                 add32	q3, q0
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f7 68                 add32	q2, q0
 f0 62 88              ldp16	r4, [q2]
 c2 0c                 ldi8	r6, 0xc
 af                    xor	r7, r7
 f7 6c                 add32	q3, q0
 f0 63 cc              ldp24	q3, [q3]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 c2 0f                 ldi8	r6, 0xf
 af                    xor	r7, r7
 f7 6c                 add32	q3, q0
 f0 63 cc              ldp24	q3, [q3]
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f6 2c                 tst16	r4
 f2 64                 mov32	q1, q0
 d1 04                 brne8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x249
<L12>:
 08                    mov	r6, r4
 af                    xor	r7, r7
 fa 7e                 lsr16i	r4, 0xe
 06                    mov	r5, r6
 15                    add	r5, r5
 15                    add	r5, r5
 f1 05                 mov	r0, r5
 f1 0c                 mov	r1, r4
 02                    mov	r4, r6
 07                    mov	r5, r7
 f7 62                 add32	q0, q2
 f0 02 12              ldi8	r2, 0x12
 f2 4b                 sub	r3, r3
 f7 61                 add32	q0, q1
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 69 40              cmp32	q1, q0
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f2 64                 mov32	q1, q0
 d2 04                 brult8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x264
<L13>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 08              cmp32	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 fb 14                 cmov.eq	r2, r4
 fb 1d                 cmov.eq	r3, r5
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x355
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x355
 0e                    mov	r7, r6
 fa ad                 lsr16i	r7, 0xd
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f1 05                 mov	r0, r5
 f4 80                 lsl16.1	r0
 f4 80                 lsl16.1	r0
 08                    mov	r6, r4
 fa 9e                 lsr16i	r6, 0xe
 f9 c1                 or	r6, r0
 0c                    mov	r7, r4
 1f                    add	r7, r7
 1f                    add	r7, r7
 ab                    xor	r6, r7
 ae                    xor	r7, r6
 ab                    xor	r6, r7
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f7 6c                 add32	q3, q0
 f7 6b                 add32	q2, q3
 c2 12                 ldi8	r6, 0x12
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 69 8c              cmp32	q2, q3
 f2 61                 mov32	q0, q1
 d8 04                 bruge8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x249
<L14>:
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 69 8c              cmp32	q2, q3
 f2 61                 mov32	q0, q1
 d8 04                 bruge8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x249
<L15>:
 c0 08                 ldi8	r4, 0x8
 a5                    xor	r5, r5
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f7 68                 add32	q2, q0
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 f7 6c                 add32	q3, q0
 f0 62 cc              ldp16	r6, [q3]
 f1 06                 mov	r0, r6
 f2 39                 sub	r1, r1
 f0 62 88              ldp16	r4, [q2]
 08                    mov	r6, r4
 af                    xor	r7, r7
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 38 20              stsp16	[sp+0x20], r0
 f0 39 22              stsp16	[sp+0x22], r1
 f2 68                 mov32	q2, q0
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f0 69 08              cmp32	q0, q2
 f2 61                 mov32	q0, q1
 d8 04                 bruge8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x249
<L16>:
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 f7 6e                 add32	q3, q2
 f1 07                 mov	r0, r7
 f4 80                 lsl16.1	r0
 f4 80                 lsl16.1	r0
 0e                    mov	r7, r6
 fa ae                 lsr16i	r7, 0xe
 f9 e1                 or	r7, r0
 1a                    add	r6, r6
 1a                    add	r6, r6
 f0 3e 20              stsp16	[sp+0x20], r6
 f0 3f 22              stsp16	[sp+0x22], r7
 f0 34 10              ldsp16	r4, [sp+0x10]
 08                    mov	r6, r4
 fa 9d                 lsr16i	r6, 0xd
 10                    add	r4, r4
 10                    add	r4, r4
 10                    add	r4, r4
 0e                    mov	r7, r6
 08                    mov	r6, r4
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f7 63                 add32	q0, q3
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 f7 62                 add32	q0, q2
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f7 7e                 sub32	q3, q2
 f0 69 c0              cmp32	q3, q0
 f2 61                 mov32	q0, q1
 d8 04                 bruge8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x249
<L17>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 f7 62                 add32	q0, q2
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x249
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f2 69                 mov32	q2, q1
 d6 24                 adjsp	0x24
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.find_row:

<find_row>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e0                 adjsp	-0x20
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 c2 03                 ldi8	r6, 0x3
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f0 63 08              ldp24	q0, [q2]
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 f0 63 cc              ldp24	q3, [q3]
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 c2 0c                 ldi8	r6, 0xc
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f0 63 0c              ldp24	q0, [q3]
 c2 06                 ldi8	r6, 0x6
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f0 62 cc              ldp16	r6, [q3]
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_row
		R_AVM_FAR24	.text.find_row+0x16b
<L0>:
 f4 52                 stsp16	[sp+0x4], r6
 f7 62                 add32	q0, q2
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
 c2 12                 ldi8	r6, 0x12
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 a5                    xor	r5, r5
 aa                    xor	r6, r6
 f4 6a                 stsp16	[sp+0xa], r6
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 f8 04                 cset.eq	r4
 f4 48                 stsp16	[sp+0x2], r4
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 c0 01                 ldi8	r4, 0x1
 f0 32 18              ldsp16	r2, [sp+0x18]
 f0 33 1a              ldsp16	r3, [sp+0x1a]
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_row
		R_AVM_FAR24	.text.find_row+0x9b
<L1>:
 f1 14                 mov	r2, r4
 02                    mov	r4, r6
 07                    mov	r5, r7
 f7 68                 add32	q2, q0
 f0 60 88              ldp8u	r4, [q2]
 04                    mov	r5, r4
 f4 8d                 lsr16.1	r5
 f9 a8                 and	r5, r2
 f1 02                 mov	r0, r2
 f2 67                 mov32	q1, q3
 08                    mov	r6, r4
 f1 2c                 mov	r7, r0
 8b                    and	r6, r7
 19                    add	r6, r5
 04                    mov	r5, r4
 fa 82                 lsr16i	r5, 0x2
 87                    and	r5, r7
 16                    add	r5, r6
 f2 6b                 mov32	q3, q1
 fa 73                 lsr16i	r4, 0x3
 f9 80                 and	r4, r0
 11                    add	r4, r5
 10                    add	r4, r4
 c8 05                 addi.s8	r4, 0x5
 f1 14                 mov	r2, r4
 f2 4b                 sub	r3, r3
 f7 67                 add32	q1, q3
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_row
		R_AVM_FAR24	.text.find_row+0x173
<L2>:
 f7 71                 sub32	q0, q1
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_row
		R_AVM_FAR24	.text.find_row+0x17f
<L3>:
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 60 c8              ldp8u	r6, [q2]
 c0 70                 ldi8	r4, 0x70
 82                    and	r4, r6
 f0 62 a4              ldp16	r5, [q1]
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_row
		R_AVM_FAR24	.text.find_row+0x197
<L4>:
 f4 41                 stsp16	[sp+0x0], r5
 06                    mov	r5, r6
 f4 8d                 lsr16.1	r5
 c0 01                 ldi8	r4, 0x1
 0c                    mov	r7, r4
 87                    and	r5, r7
 02                    mov	r4, r6
 83                    and	r4, r7
 11                    add	r4, r5
 0e                    mov	r7, r6
 fa a2                 lsr16i	r7, 0x2
 c1 01                 ldi8	r5, 0x1
 8d                    and	r7, r5
 1c                    add	r7, r4
 fa 93                 lsr16i	r6, 0x3
 89                    and	r6, r5
 1b                    add	r6, r7
 1a                    add	r6, r6
 ca 05                 addi.s8	r6, 0x5
 02                    mov	r4, r6
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d8 04                 bruge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_row
		R_AVM_FAR24	.text.find_row+0x1a3
<L5>:
 f4 08                 ldsp16	r4, [sp+0x2]
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_row
		R_AVM_FAR24	.text.find_row+0x113
<L6>:
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 02                 ldsp16	r6, [sp+0x0]
 32                    cmp	r4, r6
 d2 04                 brult8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_row
		R_AVM_FAR24	.text.find_row+0x18b
<L7>:
 e2 00 00 00           jmpf	find_row
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_row+0x11d
 f4 02                 ldsp16	r6, [sp+0x0]
 f6 2e                 tst16	r6
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_row
		R_AVM_FAR24	.text.find_row+0x1af
<L8>:
 02                    mov	r4, r6
 a5                    xor	r5, r5
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f7 6b                 add32	q2, q3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 69 8c              cmp32	q2, q3
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 d2 04                 brult8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_row
		R_AVM_FAR24	.text.find_row+0x1b7
<L9>:
 f2 63                 mov32	q0, q3
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_row
		R_AVM_FAR24	.text.find_row+0x1b7
<L10>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 b4                 dec16	r4
 f4 50                 stsp16	[sp+0x4], r4
 f6 2c                 tst16	r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 68                 stsp16	[sp+0xa], r4
 f2 6b                 mov32	q3, q1
 f2 61                 mov32	q0, q1
 d0 04                 breq8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_row
		R_AVM_FAR24	.text.find_row+0x53
<L11>:
 e2 00 00 00           jmpf	find_row
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_row+0x1b7
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 e2 00 00 00           jmpf	find_row
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_row+0x1b7
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 e2 00 00 00           jmpf	find_row
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_row+0x1b7
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 e2 00 00 00           jmpf	find_row
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_row+0x1b7
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 e2 00 00 00           jmpf	find_row
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_row+0x1b7
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 e2 00 00 00           jmpf	find_row
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_row+0x1b7
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 e2 00 00 00           jmpf	find_row
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_row+0x1b7
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f2 68                 mov32	q2, q0
 d6 20                 adjsp	0x20
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

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
		R_AVM_FAR24	.text.find_site+0x5f
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
 08                    mov	r6, r4
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f1 76                 zext8	r6
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_site
		R_AVM_FAR24	.text.find_site+0x102
<L1>:
 f0 63 80              ldp24	q2, [q0]
 f0 69 48              cmp32	q1, q2
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_site
		R_AVM_FAR24	.text.find_site+0x65
<L2>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_site
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_site+0x102
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_site
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_site+0x102
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f0 63 88              ldp24	q2, [q2]
 f0 69 48              cmp32	q1, q2
 d2 04                 brult8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_site
		R_AVM_FAR24	.text.find_site+0x7c
<L3>:
 f2 68                 mov32	q2, q0
 e2 00 00 00           jmpf	find_site
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_site+0x102
 f4 20                 ldsp16	r4, [sp+0x8]
 cc 01                 cmpi.s8	r4, 0x1
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_site
		R_AVM_FAR24	.text.find_site+0x8c
<L4>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_site
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_site+0x102
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
		R_AVM_FAR24	.text.find_site+0xf0
<L5>:
 f0 63 84              ldp24	q2, [q1]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_site
		R_AVM_FAR24	.text.find_site+0xfa
<L6>:
 c0 0f                 ldi8	r4, 0xf
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f0 63 80              ldp24	q2, [q0]
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_site
		R_AVM_FAR24	.text.find_site+0x100
<L7>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 f2 61                 mov32	q0, q1
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_site
		R_AVM_FAR24	.text.find_site+0x96
<L8>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_site
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_site+0x102
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 e2 00 00 00           jmpf	find_site
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_site+0x102
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_site
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_site+0x102
 f2 69                 mov32	q2, q1
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
 d6 ec                 adjsp	-0x14
 04                    mov	r5, r4
 f1 05                 mov	r0, r5
 f0 08 18              addi.s8	r0, 0x18
 c4 00 f6              ldi16	r4, 0xf600
 f4 60                 stsp16	[sp+0x8], r4
 a0                    xor	r4, r4
 f0 3c 10              stsp16	[sp+0x10], r4
 c4 00 ff              ldi16	r4, 0xff00
 f4 58                 stsp16	[sp+0x6], r4
 01                    mov	r4, r5
 c8 1a                 addi.s8	r4, 0x1a
 f4 68                 stsp16	[sp+0xa], r4
 f4 51                 stsp16	[sp+0x4], r5
 f0 38 12              stsp16	[sp+0x12], r0
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x49
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f0 63 80              ldp24	q2, [q0]
 f0 30 12              ldsp16	r0, [sp+0x12]
 f1 20                 mov	r4, r0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e3 00 00 00           callf	avm_eh_prepare_next
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.unwind_frame
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 f4 11                 ldsp16	r5, [sp+0x4]
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x1cd
<L0>:
 ed 90 20              ld16	r4, [r0+0]
 f4 22                 ldsp16	r6, [sp+0x8]
 12                    add	r4, r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 32                    cmp	r4, r6
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x1cd
<L1>:
 f4 28                 ldsp16	r4, [sp+0xa]
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f7 63                 add32	q0, q3
 01                    mov	r4, r5
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	avm_eh_prepare_next
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x1cd
<L2>:
 f2 66                 mov32	q1, q2
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	avm_eh_prepare_next
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_row
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f2 69                 mov32	q2, q1
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
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x1cd
<L3>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 08              cmp32	q0, q2
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x1cd
<L4>:
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x30
<L5>:
 c0 09                 ldi8	r4, 0x9
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f0 63 c8              ldp24	q3, [q2]
 f0 69 c4              cmp32	q3, q1
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x28
<L6>:
 d6 fe                 adjsp	-0x2
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 40                 stsp16	[sp+0x0], r4
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f7 6e                 add32	q3, q2
 e3 00 00 00           callf	avm_eh_prepare_next
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_list
 d6 02                 adjsp	0x2
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 8c              cmp32	q2, q3
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x1cd
<L7>:
 c2 06                 ldi8	r6, 0x6
 af                    xor	r7, r7
 f7 63                 add32	q0, q3
 f0 63 00              ldp24	q0, [q0]
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x16c
<L8>:
 aa                    xor	r6, r6
 c3 01                 ldi8	r7, 0x1
 82                    and	r4, r6
 87                    and	r5, r7
 f0 69 84              cmp32	q2, q1
 d1 04                 brne8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x30
<L9>:
 f4 28                 ldsp16	r4, [sp+0xa]
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 e3 00 00 00           callf	avm_eh_prepare_next
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_call
 f2 66                 mov32	q1, q2
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 4c              cmp32	q1, q3
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x1cd
<L10>:
 f0 35 12              ldsp16	r5, [sp+0x12]
 69                    ld16	r6, [r5]
 af                    xor	r7, r7
 f7 67                 add32	q1, q3
 c6 00 0a              ldi16	r6, 0xa00
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x1cd
<L11>:
 f4 10                 ldsp16	r4, [sp+0x4]
 c2 0d                 ldi8	r6, 0xd
 d7 0f                 sys	memcpy
 f4 13                 ldsp16	r7, [sp+0x4]
 ee 2e 24              st8	[r7+4], r1
 ee 1e 22              st16	[r7+2], r0
 f1 22                 mov	r4, r2
 7c                    st16	[r7], r4
 ee fe 2d              st16	[r7+13], r7
 f0 34 12              ldsp16	r4, [sp+0x12]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e3 00 00 00           callf	avm_eh_prepare_next
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.unwind_frame
 f1 74                 zext8	r4
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x1ca
 f4 13                 ldsp16	r7, [sp+0x4]
 ed de 47              ld16	r6, [r7+39]
 38                    cmp	r6, r4
 d0 04                 breq8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x1cd
<L12>:
 ed de 49              ld16	r6, [r7+41]
 01                    mov	r4, r5
 38                    cmp	r6, r4
 d0 04                 breq8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x1cd
<L13>:
 f4 28                 ldsp16	r4, [sp+0xa]
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 e3 00 00 00           callf	avm_eh_prepare_next
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_call
 f2 66                 mov32	q1, q2
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 4c              cmp32	q1, q3
 d1 04                 brne8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x1cd
<L14>:
 f0 35 12              ldsp16	r5, [sp+0x12]
 69                    ld16	r6, [r5]
 af                    xor	r7, r7
 f7 67                 add32	q1, q3
 c6 00 0a              ldi16	r6, 0xa00
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_prepare_next
		R_AVM_FAR24	.text.avm_eh_prepare_next+0x1cd
<L15>:
 f4 10                 ldsp16	r4, [sp+0x4]
 c2 0d                 ldi8	r6, 0xd
 d7 0f                 sys	memcpy
 f4 11                 ldsp16	r5, [sp+0x4]
 ee 2a 24              st8	[r5+4], r1
 ee 1a 22              st16	[r5+2], r0
 f1 22                 mov	r4, r2
 74                    st16	[r5], r4
 ee ba 2d              st16	[r5+13], r5
 c0 02                 ldi8	r4, 0x2
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 d6 14                 adjsp	0x14
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
 d6 ee                 adjsp	-0x12
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c2 0f                 ldi8	r6, 0xf
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f0 63 cc              ldp24	q3, [q3]
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
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
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f7 66                 add32	q1, q2
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
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
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f7 68                 add32	q2, q0
 f7 66                 add32	q1, q2
 f7 67                 add32	q1, q3
 aa                    xor	r6, r6
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 84              cmp32	q2, q1
 f2 66                 mov32	q1, q2
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0xc3
<L0>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f7 62                 add32	q0, q2
 f0 69 04              cmp32	q0, q1
 f2 68                 mov32	q2, q0
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0xc3
<L1>:
 f7 79                 sub32	q2, q1
 f0 00 03              ldi8	r0, 0x3
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0xc3
<L2>:
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 62 a8              ldp16	r5, [q2]
 f0 60 84              ldp8u	r4, [q1]
 cc 02                 cmpi.s8	r4, 0x2
 d2 04                 brult8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0xc3
<L3>:
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0xcb
<L4>:
 f6 2d                 tst16	r5
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0xcb
<L5>:
 02                    mov	r4, r6
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f0 3c 10              stsp16	[sp+0x10], r4
 09                    mov	r6, r5
 fa 9e                 lsr16i	r6, 0xe
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 15                    add	r5, r5
 15                    add	r5, r5
 0e                    mov	r7, r6
 09                    mov	r6, r5
 f7 63                 add32	q0, q3
 c6 fd ff              ldi16	r6, 0xfffd
 c7 ff ff              ldi16	r7, 0xffff
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 6b                 add32	q2, q3
 f0 69 80              cmp32	q2, q0
 d2 04                 brult8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0xf5
<L6>:
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	list_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.list_ok+0xc4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 f0 69 08              cmp32	q0, q2
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0x1a2
<L7>:
 f2 61                 mov32	q0, q1
 c2 03                 ldi8	r6, 0x3
 af                    xor	r7, r7
 f7 63                 add32	q0, q3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f7 6c                 add32	q3, q0
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f2 64                 mov32	q1, q0
 c2 02                 ldi8	r6, 0x2
 af                    xor	r7, r7
 f7 6d                 add32	q3, q1
 f0 62 04              ldp16	r0, [q1]
 f0 63 8c              ldp24	q2, [q3]
 f0 38 08              stsp16	[sp+0x8], r0
 f6 28                 tst16	r0
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0x1b3
<L8>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 f8 06                 cset.eq	r6
 f4 52                 stsp16	[sp+0x4], r6
 c2 05                 ldi8	r6, 0x5
 f2 61                 mov32	q0, q1
 f7 63                 add32	q0, q3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 69 0c              cmp32	q0, q3
 f8 0e                 cset.ne	r6
 f4 13                 ldsp16	r7, [sp+0x4]
 8e                    and	r7, r6
 f4 a7                 tst8	r7
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0x1b8
<L9>:
 f4 52                 stsp16	[sp+0x4], r6
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 c2 ff                 ldi8	r6, 0xff
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0x1bd
<L10>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c4              cmp32	q3, q1
 d1 04                 brne8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0x195
<L11>:
 f0 62 8c              ldp16	r4, [q3]
 f4 21                 ldsp16	r5, [sp+0x8]
 31                    cmp	r4, r5
 d1 04                 brne8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0x1ae
<L12>:
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f7 6e                 add32	q3, q2
 f0 69 c4              cmp32	q3, q1
 d0 04                 breq8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0x17b
<L13>:
 c1 01                 ldi8	r5, 0x1
 f4 10                 ldsp16	r4, [sp+0x4]
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0x11d
<L14>:
 c4 80 ff              ldi16	r4, 0xff80
 f0 35 10              ldsp16	r5, [sp+0x10]
 94                    or	r5, r4
 01                    mov	r4, r5
 e2 00 00 00           jmpf	list_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.list_ok+0xc4
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	list_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.list_ok+0xc4
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	list_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.list_ok+0xc4
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	list_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.list_ok+0xc4
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	list_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.list_ok+0xc4

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
 f0 30 19              ldsp16	r0, [sp+0x19]
 e3 00 00 00           callf	match_list
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.list_ok
 08                    mov	r6, r4
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0x287
<L0>:
 f4 42                 stsp16	[sp+0x0], r6
 f0 38 06              stsp16	[sp+0x6], r0
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f2 69                 mov32	q2, q1
 f7 6b                 add32	q2, q3
 f0 62 88              ldp16	r4, [q2]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0x23c
<L1>:
 c2 03                 ldi8	r6, 0x3
 af                    xor	r7, r7
 f7 67                 add32	q1, q3
 e2 00 00 00           jmpf	match_list
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_list+0x4f
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f7 66                 add32	q1, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0x23c
<L2>:
 f4 60                 stsp16	[sp+0x8], r4
 f2 69                 mov32	q2, q1
 c2 02                 ldi8	r6, 0x2
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f0 63 08              ldp24	q0, [q2]
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0x246
<L3>:
 f4 18                 ldsp16	r4, [sp+0x6]
 c8 0f                 addi.s8	r4, 0xf
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 f0 69 0c              cmp32	q0, q3
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0x246
<L4>:
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	match_list
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.rtti_kind
 cc 07                 cmpi.s8	r4, 0x7
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0xe6
<L5>:
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 3b 04              stsp16	[sp+0x4], r3
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f0 63 48              ldp24	q1, [q2]
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f0 63 80              ldp24	q2, [q0]
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0x281
<L6>:
 c0 0a                 ldi8	r4, 0xa
 c5 00 ff              ldi16	r5, 0xff00
 f7 69                 add32	q2, q1
 c6 0a 01              ldi16	r6, 0x10a
 c7 00 ff              ldi16	r7, 0xff00
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0x277
<L7>:
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	match_list
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.rtti_kind
 cc 04                 cmpi.s8	r4, 0x4
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0x254
<L8>:
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f0 69 48              cmp32	q1, q2
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0x3e
<L9>:
 e2 00 00 00           jmpf	match_list
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_list+0x25e
 f4 48                 stsp16	[sp+0x2], r4
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 e3 00 00 00           callf	match_list
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.rtti_kind
 cc 04                 cmpi.s8	r4, 0x4
 d0 04                 breq8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0x12f
<L10>:
 f4 08                 ldsp16	r4, [sp+0x2]
 cc 04                 cmpi.s8	r4, 0x4
 d0 04                 breq8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0x3e
<L11>:
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	match_list
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_chain
 f1 74                 zext8	r4
 cc 06                 cmpi.s8	r4, 0x6
 d1 04                 brne8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0x1d7
<L12>:
 cc 05                 cmpi.s8	r4, 0x5
 d1 04                 brne8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0x28e
<L13>:
 a5                    xor	r5, r5
 08                    mov	r6, r4
 0e                    mov	r7, r6
 cb fd                 addi.s8	r7, -0x3
 cf 02                 cmpi.s8	r7, 0x2
 d8 04                 bruge8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0x26d
<L14>:
 e2 00 00 00           jmpf	match_list
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_list+0x226
 f4 09                 ldsp16	r5, [sp+0x2]
 cd 04                 cmpi.s8	r5, 0x4
 d0 04                 breq8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0x1a8
<L15>:
 cc 06                 cmpi.s8	r4, 0x6
 d0 04                 breq8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0x1a8
<L16>:
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 f7 6e                 add32	q3, q2
 f0 63 8c              ldp24	q2, [q3]
 c2 0a                 ldi8	r6, 0xa
 c7 00 ff              ldi16	r7, 0xff00
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 f7 6e                 add32	q3, q2
 f2 69                 mov32	q2, q1
 f0 06 0a 01           ldi16	r2, 0x10a
 f0 07 00 ff           ldi16	r3, 0xff00
 f0 69 c4              cmp32	q3, q1
 f2 66                 mov32	q1, q2
 d8 04                 bruge8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0x3e
<L17>:
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f0 60 c8              ldp8u	r6, [q2]
 ce 44                 cmpi.s8	r6, 0x44
 d0 04                 breq8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0x3e
<L18>:
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f7 6e                 add32	q3, q2
 f0 60 cc              ldp8u	r6, [q3]
 ce 6e                 cmpi.s8	r6, 0x6e
 d0 04                 breq8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0x3e
<L19>:
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 f7 6e                 add32	q3, q2
 f0 60 8c              ldp8u	r4, [q3]
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0x3e
<L20>:
 e2 00 00 00           jmpf	match_list
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_list+0x2b2
 c8 fc                 addi.s8	r4, -0x4
 cc fd                 cmpi.s8	r4, -0x3
 d8 04                 bruge8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0x3e
<L21>:
 c9 fc                 addi.s8	r5, -0x4
 cd fd                 cmpi.s8	r5, -0x3
 d8 04                 bruge8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0x3e
<L22>:
 f2 68                 mov32	q2, q0
 f0 30 06              ldsp16	r0, [sp+0x6]
 f1 28                 mov	r6, r0
 e3 00 00 00           callf	match_list
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_object_base
 08                    mov	r6, r4
 f1 76                 zext8	r6
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0x218
<L23>:
 aa                    xor	r6, r6
 e2 00 00 00           jmpf	match_list
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_list+0x215
 c0 08                 ldi8	r4, 0x8
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f0 63 80              ldp24	q2, [q0]
 f0 30 06              ldsp16	r0, [sp+0x6]
 ed d0 5b              ld16	r6, [r0+59]
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0x202
<L24>:
 f1 28                 mov	r6, r0
 e3 00 00 00           callf	match_list
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_base
 08                    mov	r6, r4
 f1 76                 zext8	r6
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0x218
<L25>:
 e2 00 00 00           jmpf	match_list
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_list+0x213
 f1 28                 mov	r6, r0
 e3 00 00 00           callf	match_list
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_null_base
 08                    mov	r6, r4
 f1 76                 zext8	r6
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0x218
<L26>:
 c2 01                 ldi8	r6, 0x1
 ee c0 56              st8	[r0+54], r6
 08                    mov	r6, r4
 f1 76                 zext8	r6
 0e                    mov	r7, r6
 cb fd                 addi.s8	r7, -0x3
 cf 02                 cmpi.s8	r7, 0x2
 d8 04                 bruge8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0x26d
<L27>:
 f2 62                 mov32	q0, q2
 ce 01                 cmpi.s8	r6, 0x1
 d0 04                 breq8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0x3e
<L28>:
 a0                    xor	r4, r4
 c5 ff ff              ldi16	r5, 0xffff
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 e2 00 00 00           jmpf	match_list
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_list+0x264
 c0 01                 ldi8	r4, 0x1
 f4 01                 ldsp16	r5, [sp+0x0]
 84                    and	r5, r4
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	match_list
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_list+0x287
 a0                    xor	r4, r4
 f4 19                 ldsp16	r5, [sp+0x6]
 ee 8a 56              st8	[r5+54], r4
 f0 62 84              ldp16	r4, [q1]
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_list
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_list+0x287
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 e2 00 00 00           jmpf	match_list
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_list+0x287
 a0                    xor	r4, r4
 f4 19                 ldsp16	r5, [sp+0x6]
 ee 8a 56              st8	[r5+54], r4
 f0 62 84              ldp16	r4, [q1]
 f1 25                 mov	r5, r1
 e2 00 00 00           jmpf	match_list
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_list+0x287
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 e2 00 00 00           jmpf	match_list
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_list+0x287
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 e2 00 00 00           jmpf	match_list
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_list+0x287
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 f7 6e                 add32	q3, q2
 f0 62 8c              ldp16	r4, [q3]
 c1 80                 ldi8	r5, 0x80
 84                    and	r5, r4
 c0 02                 ldi8	r4, 0x2
 c2 01                 ldi8	r6, 0x1
 f4 a5                 tst8	r5
 fb 26                 cmov.eq	r4, r6
 f4 19                 ldsp16	r5, [sp+0x6]
 ee 8a 56              st8	[r5+54], r4
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 e2 00 00 00           jmpf	match_list
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_list+0x264
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f0 62 80              ldp16	r4, [q0]
 c5 30 ff              ldi16	r5, 0xff30
 84                    and	r5, r4
 f6 2d                 tst16	r5
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 d0 04                 breq8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0x287
<L29>:
 c0 03                 ldi8	r4, 0x3
 f4 19                 ldsp16	r5, [sp+0x6]
 ee 8a 56              st8	[r5+54], r4
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 e2 00 00 00           jmpf	match_list
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_list+0x264

Disassembly of section .text.rtti_kind:

<rtti_kind>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c2 0a                 ldi8	r6, 0xa
 c7 00 ff              ldi16	r7, 0xff00
 f7 6e                 add32	q3, q2
 f0 04 0a 01           ldi16	r0, 0x10a
 f0 05 00 ff           ldi16	r1, 0xff00
 f0 69 c0              cmp32	q3, q0
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	rtti_kind
		R_AVM_FAR24	.text.rtti_kind+0x21
<L0>:
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	rtti_kind
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.rtti_kind+0xbe
 c2 06                 ldi8	r6, 0x6
 af                    xor	r7, r7
 f0 06 00 00           ldi16	r2, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__class_type_info
 f0 03 00              ldi8	r3, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__class_type_info
 f7 67                 add32	q1, q3
 f0 63 08              ldp24	q0, [q2]
 f0 69 04              cmp32	q0, q1
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	rtti_kind
		R_AVM_FAR24	.text.rtti_kind+0x3f
<L1>:
 c0 01                 ldi8	r4, 0x1
 e2 00 00 00           jmpf	rtti_kind
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.rtti_kind+0xbe
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__si_class_type_info
 c1 00                 ldi8	r5, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__si_class_type_info
 f7 6b                 add32	q2, q3
 f0 69 08              cmp32	q0, q2
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	rtti_kind
		R_AVM_FAR24	.text.rtti_kind+0x55
<L2>:
 c0 02                 ldi8	r4, 0x2
 e2 00 00 00           jmpf	rtti_kind
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.rtti_kind+0xbe
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__vmi_class_type_info
 c1 00                 ldi8	r5, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__vmi_class_type_info
 f7 6b                 add32	q2, q3
 f0 69 08              cmp32	q0, q2
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	rtti_kind
		R_AVM_FAR24	.text.rtti_kind+0x6b
<L3>:
 c0 03                 ldi8	r4, 0x3
 e2 00 00 00           jmpf	rtti_kind
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.rtti_kind+0xbe
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__pointer_type_info
 c1 00                 ldi8	r5, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__pointer_type_info
 f7 6b                 add32	q2, q3
 f0 69 08              cmp32	q0, q2
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	rtti_kind
		R_AVM_FAR24	.text.rtti_kind+0x81
<L4>:
 c0 04                 ldi8	r4, 0x4
 e2 00 00 00           jmpf	rtti_kind
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.rtti_kind+0xbe
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__fundamental_type_info
 c1 00                 ldi8	r5, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__fundamental_type_info
 f7 6b                 add32	q2, q3
 f0 69 08              cmp32	q0, q2
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	rtti_kind
		R_AVM_FAR24	.text.rtti_kind+0x97
<L5>:
 c0 06                 ldi8	r4, 0x6
 e2 00 00 00           jmpf	rtti_kind
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.rtti_kind+0xbe
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__function_type_info
 c1 00                 ldi8	r5, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__function_type_info
 f7 6b                 add32	q2, q3
 f0 69 08              cmp32	q0, q2
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	rtti_kind
		R_AVM_FAR24	.text.rtti_kind+0xad
<L6>:
 c0 05                 ldi8	r4, 0x5
 e2 00 00 00           jmpf	rtti_kind
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.rtti_kind+0xbe
 f0 06 00 00           ldi16	r2, 0x0
		R_AVM_PROG_LO16	__avm_eh_exact_pointer_ref_type_info
 f0 03 00              ldi8	r3, 0x0
		R_AVM_PROG_HI8	__avm_eh_exact_pointer_ref_type_info
 f7 67                 add32	q1, q3
 a0                    xor	r4, r4
 c1 07                 ldi8	r5, 0x7
 f0 69 04              cmp32	q0, q1
 fb 25                 cmov.eq	r4, r5
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.match_pointer_chain:

<match_pointer_chain>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 f2 63                 mov32	q0, q3
 f2 66                 mov32	q1, q2
 c0 01                 ldi8	r4, 0x1
 f4 78                 stsp16	[sp+0xe], r4
 a0                    xor	r4, r4
 f4 68                 stsp16	[sp+0xa], r4
 c4 30 ff              ldi16	r4, 0xff30
 f4 50                 stsp16	[sp+0x4], r4
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f2 6a                 mov32	q3, q0
 f7 6e                 add32	q3, q2
 f7 69                 add32	q2, q1
 f0 62 88              ldp16	r4, [q2]
 f0 62 cc              ldp16	r6, [q3]
 f4 70                 stsp16	[sp+0xc], r4
 0c                    mov	r7, r4
 9e                    or	r7, r6
 03                    mov	r4, r7
 f4 11                 ldsp16	r5, [sp+0x4]
 81                    and	r4, r5
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_FAR24	.text.match_pointer_chain+0xee
<L0>:
 06                    mov	r5, r6
 f4 30                 ldsp16	r4, [sp+0xc]
 a4                    xor	r5, r4
 c0 84                 ldi8	r4, 0x84
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_FAR24	.text.match_pointer_chain+0xf4
<L1>:
 f4 4b                 stsp16	[sp+0x2], r7
 f4 41                 stsp16	[sp+0x0], r5
 c5 ff ff              ldi16	r5, 0xffff
 a6                    xor	r5, r6
 c3 03                 ldi8	r7, 0x3
 f4 30                 ldsp16	r4, [sp+0xc]
 83                    and	r4, r7
 84                    and	r5, r4
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_FAR24	.text.match_pointer_chain+0xf9
<L2>:
 f4 62                 stsp16	[sp+0x8], r6
 8b                    and	r6, r7
 32                    cmp	r4, r6
 f4 38                 ldsp16	r4, [sp+0xe]
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_FAR24	.text.match_pointer_chain+0x6e
<L3>:
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_FAR24	.text.match_pointer_chain+0xfe
<L4>:
 f4 a4                 tst8	r4
 f8 0e                 cset.ne	r6
 c0 08                 ldi8	r4, 0x8
 a5                    xor	r5, r5
 f7 66                 add32	q1, q2
 f0 63 44              ldp24	q1, [q1]
 f7 62                 add32	q0, q2
 f0 63 00              ldp24	q0, [q0]
 c4 00 01              ldi16	r4, 0x100
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 d8 04                 bruge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_FAR24	.text.match_pointer_chain+0x103
<L5>:
 c4 f5 ff              ldi16	r4, 0xfff5
 c1 ff                 ldi8	r5, 0xff
 f0 69 84              cmp32	q2, q1
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_FAR24	.text.match_pointer_chain+0x13e
<L6>:
 f4 7a                 stsp16	[sp+0xe], r6
 c2 0a                 ldi8	r6, 0xa
 c7 00 ff              ldi16	r7, 0xff00
 f2 68                 mov32	q2, q0
 f7 6b                 add32	q2, q3
 c6 0a 01              ldi16	r6, 0x10a
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_FAR24	.text.match_pointer_chain+0x144
<L7>:
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	match_pointer_chain
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.rtti_kind
 f4 58                 stsp16	[sp+0x6], r4
 f2 68                 mov32	q2, q0
 e3 00 00 00           callf	match_pointer_chain
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.rtti_kind
 f4 19                 ldsp16	r5, [sp+0x6]
 cd 04                 cmpi.s8	r5, 0x4
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_FAR24	.text.match_pointer_chain+0x109
<L8>:
 cc 04                 cmpi.s8	r4, 0x4
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_FAR24	.text.match_pointer_chain+0x109
<L9>:
 f4 2a                 ldsp16	r6, [sp+0xa]
 02                    mov	r4, r6
 f1 74                 zext8	r4
 c1 f9                 ldi8	r5, 0xf9
 31                    cmp	r4, r5
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_FAR24	.text.match_pointer_chain+0x138
<L10>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 39                 ldsp16	r5, [sp+0xe]
 84                    and	r5, r4
 f4 79                 stsp16	[sp+0xe], r5
 f4 b6                 dec16	r6
 f4 6a                 stsp16	[sp+0xa], r6
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_chain+0x16
 c0 03                 ldi8	r4, 0x3
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_chain+0x19e
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_chain+0x19e
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_chain+0x19e
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_chain+0x19e
 c0 03                 ldi8	r4, 0x3
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_chain+0x19e
 f0 69 40              cmp32	q1, q0
 d0 04                 breq8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_FAR24	.text.match_pointer_chain+0x14a
<L11>:
 f0 00 40              ldi8	r0, 0x40
 f4 08                 ldsp16	r4, [sp+0x2]
 f9 80                 and	r4, r0
 f4 a4                 tst8	r4
 aa                    xor	r6, r6
 f4 33                 ldsp16	r7, [sp+0xc]
 c0 03                 ldi8	r4, 0x3
 d0 04                 breq8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_FAR24	.text.match_pointer_chain+0x15a
<L12>:
 c0 05                 ldi8	r4, 0x5
 c2 03                 ldi8	r6, 0x3
 f4 19                 ldsp16	r5, [sp+0x6]
 cd 05                 cmpi.s8	r5, 0x5
 04                    mov	r5, r4
 fb 2e                 cmov.eq	r5, r6
 c2 80                 ldi8	r6, 0x80
 3e                    cmp	r7, r6
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_chain+0x19c
 c0 04                 ldi8	r4, 0x4
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_chain+0x19e
 c0 03                 ldi8	r4, 0x3
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_chain+0x19e
 c0 03                 ldi8	r4, 0x3
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_chain+0x19e
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 a5                 tst8	r5
 af                    xor	r7, r7
 d1 04                 brne8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_FAR24	.text.match_pointer_chain+0x17d
<L13>:
 03                    mov	r4, r7
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_chain+0x19e
 f4 19                 ldsp16	r5, [sp+0x6]
 cd 05                 cmpi.s8	r5, 0x5
 d0 04                 breq8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_FAR24	.text.match_pointer_chain+0x19e
<L14>:
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_FAR24	.text.match_pointer_chain+0x1fa
<L15>:
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 40                 cmpi.s8	r4, 0x40
 02                    mov	r4, r6
 d8 04                 bruge8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_FAR24	.text.match_pointer_chain+0x126
<L16>:
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_chain+0x19e
 f4 19                 ldsp16	r5, [sp+0x6]
 c9 fc                 addi.s8	r5, -0x4
 cd fd                 cmpi.s8	r5, -0x3
 d8 04                 bruge8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_FAR24	.text.match_pointer_chain+0x1a5
<L17>:
 04                    mov	r5, r4
 c9 fc                 addi.s8	r5, -0x4
 cd fd                 cmpi.s8	r5, -0x3
 d8 04                 bruge8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_FAR24	.text.match_pointer_chain+0x1a5
<L18>:
 c3 80                 ldi8	r7, 0x80
 a0                    xor	r4, r4
 c1 06                 ldi8	r5, 0x6
 f4 32                 ldsp16	r6, [sp+0xc]
 3b                    cmp	r6, r7
 fc 25                 cmov.ult	r4, r5
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 cc 06                 cmpi.s8	r4, 0x6
 d0 04                 breq8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_FAR24	.text.match_pointer_chain+0x155
<L19>:
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f0 63 80              ldp24	q2, [q0]
 f0 00 0a              ldi8	r0, 0xa
 f0 05 00 ff           ldi16	r1, 0xff00
 f7 62                 add32	q0, q2
 f0 06 0a 01           ldi16	r2, 0x10a
 f0 07 00 ff           ldi16	r3, 0xff00
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_FAR24	.text.match_pointer_chain+0x155
<L20>:
 f0 60 c8              ldp8u	r6, [q2]
 ce 76                 cmpi.s8	r6, 0x76
 d0 04                 breq8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_FAR24	.text.match_pointer_chain+0x155
<L21>:
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f0 60 88              ldp8u	r4, [q2]
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_FAR24	.text.match_pointer_chain+0x155
<L22>:
 f4 18                 ldsp16	r4, [sp+0x6]
 cc 05                 cmpi.s8	r4, 0x5
 d1 04                 brne8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_FAR24	.text.match_pointer_chain+0x155
<L23>:
 c0 05                 ldi8	r4, 0x5
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_chain+0x19e
 07                    mov	r5, r7
 f9 a0                 and	r5, r0
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_FAR24	.text.match_pointer_chain+0x126
<L24>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f9 80                 and	r4, r0
 f4 a4                 tst8	r4
 02                    mov	r4, r6
 d0 04                 breq8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_FAR24	.text.match_pointer_chain+0x19e
<L25>:
 e2 00 00 00           jmpf	match_pointer_chain
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_chain+0x126

Disassembly of section .text.match_pointer_base:

<match_pointer_base>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 c4                 adjsp	-0x3c
 f2 66                 mov32	q1, q2
 02                    mov	r4, r6
 c8 0f                 addi.s8	r4, 0xf
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c0 08                 ldi8	r4, 0x8
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f0 63 80              ldp24	q2, [q0]
 ed 1c 5b              ld16	r0, [r6+59]
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 e3 00 00 00           callf	match_pointer_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.rtti_kind
 aa                    xor	r6, r6
 af                    xor	r7, r7
 c8 fc                 addi.s8	r4, -0x4
 cc fd                 cmpi.s8	r4, -0x3
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_FAR24	.text.match_pointer_base+0x36
<L0>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_base+0x429
 f0 3a 28              stsp16	[sp+0x28], r2
 f0 3b 2a              stsp16	[sp+0x2a], r3
 a0                    xor	r4, r4
 f0 2c 20              stsp8	[sp+0x20], r4
 0c                    mov	r7, r4
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 38 2c              stsp16	[sp+0x2c], r0
 f1 0c                 mov	r1, r4
 f1 71                 zext8	r1
 f0 3f 18              stsp16	[sp+0x18], r7
 f4 a4                 tst8	r4
 f0 3c 10              stsp16	[sp+0x10], r4
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_FAR24	.text.match_pointer_base+0x1af
<L1>:
 c1 02                 ldi8	r5, 0x2
 f4 79                 stsp16	[sp+0xe], r5
 c1 01                 ldi8	r5, 0x1
 f0 16 20              leasp	r6, 0x20
 f1 74                 zext8	r4
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 39 36              stsp16	[sp+0x36], r1
 f1 21                 mov	r4, r1
 f1 0e                 mov	r1, r6
 f0 32 14              ldsp16	r2, [sp+0x14]
 f0 33 16              ldsp16	r3, [sp+0x16]
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_base+0xb9
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f7 66                 add32	q1, q2
 f0 63 44              ldp24	q1, [q1]
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f4 3a                 ldsp16	r6, [sp+0xe]
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f7 62                 add32	q0, q2
 c4 ff ff              ldi16	r4, 0xffff
 a5                    xor	r5, r5
 f0 69 80              cmp32	q2, q0
 f4 00                 ldsp16	r4, [sp+0x0]
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_FAR24	.text.match_pointer_base+0x411
<L2>:
 fa 56                 lsl16i	r6, 0x6
 f6 46                 sext8	r6
 fa d7                 asr16i	r6, 0x7
 f4 29                 ldsp16	r5, [sp+0xa]
 86                    and	r5, r6
 f0 31 32              ldsp16	r1, [sp+0x32]
 f4 a9                 inc16	r1
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_FAR24	.text.match_pointer_base+0x1bf
<L3>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 69                 stsp16	[sp+0xa], r5
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	match_pointer_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.rtti_kind
 cc 02                 cmpi.s8	r4, 0x2
 f1 20                 mov	r4, r0
 a5                    xor	r5, r5
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f0 39 32              stsp16	[sp+0x32], r1
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_FAR24	.text.match_pointer_base+0x7e
<L4>:
 f0 38 38              stsp16	[sp+0x38], r0
 ed 82 20              ld8u	r4, [r1+0]
 f4 b4                 dec16	r4
 a5                    xor	r5, r5
 c2 ff                 ldi8	r6, 0xff
 af                    xor	r7, r7
 88                    and	r6, r4
 02                    mov	r4, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 f7 7e                 sub32	q3, q2
 f7 67                 add32	q1, q3
 f2 69                 mov32	q2, q1
 c2 0e                 ldi8	r6, 0xe
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f0 63 88              ldp24	q2, [q2]
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 30                 sub	r0, r0
 f0 01 80              ldi8	r1, 0x80
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f2 42                 sub	r2, r2
 f0 07 00 ff           ldi16	r3, 0xff00
 f7 61                 add32	q0, q1
 f2 4b                 sub	r3, r3
 f0 69 c4              cmp32	q3, q1
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 fb 06                 cmov.eq	r0, r6
 fb 0f                 cmov.eq	r1, r7
 f2 66                 mov32	q1, q2
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 f7 67                 add32	q1, q3
 c2 0d                 ldi8	r6, 0xd
 f7 6b                 add32	q2, q3
 f0 60 c8              ldp8u	r6, [q2]
 f0 63 44              ldp24	q1, [q1]
 c0 01                 ldi8	r4, 0x1
 82                    and	r4, r6
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_FAR24	.text.match_pointer_base+0x8c
<L5>:
 f0 3a 2e              stsp16	[sp+0x2e], r2
 f0 3b 30              stsp16	[sp+0x30], r3
 f0 32 38              ldsp16	r2, [sp+0x38]
 f0 6c 95              ld16	r4, [r2+]
 ed a4 20              ld8u	r5, [r2+0]
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_FAR24	.text.match_pointer_base+0x418
<L6>:
 f7 68                 add32	q2, q0
 f0 04 fd ff           ldi16	r0, 0xfffd
 f0 01 ff              ldi8	r1, 0xff
 f0 69 08              cmp32	q0, q2
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_FAR24	.text.match_pointer_base+0x41f
<L7>:
 f0 63 08              ldp24	q0, [q2]
 f0 38 06              stsp16	[sp+0x6], r0
 f0 39 08              stsp16	[sp+0x8], r1
 f2 42                 sub	r2, r2
 f0 03 80              ldi8	r3, 0x80
 f9 08                 and	r0, r2
 f9 2c                 and	r1, r3
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f0 07 00 ff           ldi16	r3, 0xff00
 f7 69                 add32	q2, q1
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 f2 62                 mov32	q0, q2
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 fb 04                 cmov.eq	r0, r4
 fb 0d                 cmov.eq	r1, r5
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f7 62                 add32	q0, q2
 a0                    xor	r4, r4
 c1 01                 ldi8	r5, 0x1
 f0 69 08              cmp32	q0, q2
 f0 32 2e              ldsp16	r2, [sp+0x2e]
 f0 33 30              ldsp16	r3, [sp+0x30]
 f4 00                 ldsp16	r4, [sp+0x0]
 d8 04                 bruge8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_FAR24	.text.match_pointer_base+0xa1
<L8>:
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_base+0x426
 a0                    xor	r4, r4
 f0 32 14              ldsp16	r2, [sp+0x14]
 f0 33 16              ldsp16	r3, [sp+0x16]
 f0 3c 12              stsp16	[sp+0x12], r4
 f4 40                 stsp16	[sp+0x0], r4
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_base+0x1c8
 f4 a5                 tst8	r5
 f8 04                 cset.eq	r4
 f4 40                 stsp16	[sp+0x0], r4
 f0 31 36              ldsp16	r1, [sp+0x36]
 f0 3a 2e              stsp16	[sp+0x2e], r2
 f0 3b 30              stsp16	[sp+0x30], r3
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	match_pointer_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.rtti_kind
 cc 02                 cmpi.s8	r4, 0x2
 d1 04                 brne8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_FAR24	.text.match_pointer_base+0x236
<L9>:
 cc 03                 cmpi.s8	r4, 0x3
 d0 04                 breq8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_FAR24	.text.match_pointer_base+0x246
<L10>:
 f0 32 2e              ldsp16	r2, [sp+0x2e]
 f0 33 30              ldsp16	r3, [sp+0x30]
 f2 69                 mov32	q2, q1
 c2 08                 ldi8	r6, 0x8
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f0 62 88              ldp16	r4, [q2]
 cc 21                 cmpi.s8	r4, 0x21
 d2 04                 brult8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_FAR24	.text.match_pointer_base+0x457
<L11>:
 f0 39 36              stsp16	[sp+0x36], r1
 f0 38 38              stsp16	[sp+0x38], r0
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
 d8 04                 bruge8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_FAR24	.text.match_pointer_base+0x45e
<L12>:
 f0 15 20              leasp	r5, 0x20
 f0 36 12              ldsp16	r6, [sp+0x12]
 16                    add	r5, r6
 49                    ld8u	r6, [r5]
 38                    cmp	r6, r4
 f0 31 36              ldsp16	r1, [sp+0x36]
 d8 04                 bruge8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_FAR24	.text.match_pointer_base+0x27a
<L13>:
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_base+0x246
 f0 14 20              leasp	r4, 0x20
 f0 35 12              ldsp16	r5, [sp+0x12]
 11                    add	r4, r5
 44                    ld8u	r5, [r4]
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_FAR24	.text.match_pointer_base+0x25c
<L14>:
 f0 34 10              ldsp16	r4, [sp+0x10]
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_FAR24	.text.match_pointer_base+0x430
<L15>:
 f4 b1                 dec16	r1
 f4 b4                 dec16	r4
 f0 30 2c              ldsp16	r0, [sp+0x2c]
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_base+0x54
 c1 01                 ldi8	r5, 0x1
 51                    st8	[r4], r5
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 f0 35 30              ldsp16	r5, [sp+0x30]
 c2 06                 ldi8	r6, 0x6
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f0 63 88              ldp24	q2, [q2]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 f0 01 02              ldi8	r1, 0x2
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_base+0x2e8
 f1 06                 mov	r0, r6
 f2 39                 sub	r1, r1
 f4 ae                 inc16	r6
 56                    st8	[r5], r6
 f2 68                 mov32	q2, q0
 f4 80                 lsl16.1	r0
 f4 80                 lsl16.1	r0
 f4 80                 lsl16.1	r0
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 f7 7e                 sub32	q3, q2
 f0 30 2e              ldsp16	r0, [sp+0x2e]
 f0 31 30              ldsp16	r1, [sp+0x30]
 f7 63                 add32	q0, q3
 f0 38 2e              stsp16	[sp+0x2e], r0
 f0 39 30              stsp16	[sp+0x30], r1
 c0 0e                 ldi8	r4, 0xe
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f0 63 88              ldp24	q2, [q2]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 30                 sub	r0, r0
 f0 01 80              ldi8	r1, 0x80
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 f2 66                 mov32	q1, q2
 f0 05 00 ff           ldi16	r1, 0xff00
 f7 64                 add32	q1, q0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 f0 30 38              ldsp16	r0, [sp+0x38]
 fb 14                 cmov.eq	r2, r4
 fb 1d                 cmov.eq	r3, r5
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 3b 04              stsp16	[sp+0x4], r3
 c0 0a                 ldi8	r4, 0xa
 a5                    xor	r5, r5
 f0 32 2e              ldsp16	r2, [sp+0x2e]
 f0 33 30              ldsp16	r3, [sp+0x30]
 f7 69                 add32	q2, q1
 c2 0d                 ldi8	r6, 0xd
 af                    xor	r7, r7
 f7 67                 add32	q1, q3
 f0 60 24              ldp8u	r1, [q1]
 f0 63 88              ldp24	q2, [q2]
 f0 0d 04              cmpi.s8	r1, 0x4
 d2 04                 brult8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_FAR24	.text.match_pointer_base+0x46c
<L16>:
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 e3 00 00 00           callf	match_pointer_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.rtti_kind
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_FAR24	.text.match_pointer_base+0x465
<L17>:
 c0 04                 ldi8	r4, 0x4
 a5                    xor	r5, r5
 f0 36 10              ldsp16	r6, [sp+0x10]
 f1 76                 zext8	r6
 ce 07                 cmpi.s8	r6, 0x7
 d2 04                 brult8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_FAR24	.text.match_pointer_base+0x429
<L18>:
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f4 af                 inc16	r7
 c6 00 02              ldi16	r6, 0x200
 f0 3f 1a              stsp16	[sp+0x1a], r7
 3b                    cmp	r6, r7
 d8 04                 bruge8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_FAR24	.text.match_pointer_base+0x429
<L19>:
 c0 01                 ldi8	r4, 0x1
 f1 29                 mov	r6, r1
 88                    and	r6, r4
 f1 10                 mov	r2, r0
 f2 4b                 sub	r3, r3
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_FAR24	.text.match_pointer_base+0x346
<L20>:
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f7 6d                 add32	q3, q1
 c4 ff ff              ldi16	r4, 0xffff
 a5                    xor	r5, r5
 f0 69 8c              cmp32	q2, q3
 f1 16                 mov	r2, r6
 c0 03                 ldi8	r4, 0x3
 d8 04                 bruge8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_FAR24	.text.match_pointer_base+0x429
<L21>:
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_base+0x3a9
 f0 6c d1              ld16	r6, [r0+]
 ed e0 20              ld8u	r7, [r0+0]
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_FAR24	.text.match_pointer_base+0x473
<L22>:
 f0 3a 32              stsp16	[sp+0x32], r2
 f0 3b 34              stsp16	[sp+0x34], r3
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f7 6e                 add32	q3, q2
 c4 fd ff              ldi16	r4, 0xfffd
 c1 ff                 ldi8	r5, 0xff
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_FAR24	.text.match_pointer_base+0x47a
<L23>:
 f0 63 4c              ldp24	q1, [q3]
 f0 39 02              stsp16	[sp+0x2], r1
 a0                    xor	r4, r4
 c1 80                 ldi8	r5, 0x80
 f9 ac                 and	r5, r3
 f2 30                 sub	r0, r0
 f0 05 00 ff           ldi16	r1, 0xff00
 f7 61                 add32	q0, q1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 fb 02                 cmov.eq	r0, r2
 fb 0b                 cmov.eq	r1, r3
 f0 34 32              ldsp16	r4, [sp+0x32]
 f0 35 34              ldsp16	r5, [sp+0x34]
 f7 62                 add32	q0, q2
 f1 10                 mov	r2, r0
 a0                    xor	r4, r4
 c1 01                 ldi8	r5, 0x1
 f0 69 08              cmp32	q0, q2
 f0 31 02              ldsp16	r1, [sp+0x2]
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 d2 04                 brult8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_FAR24	.text.match_pointer_base+0x429
<L24>:
 f4 89                 lsr16.1	r1
 f2 30                 sub	r0, r0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 a4                 tst8	r4
 fb 48                 cmov.ne	r1, r0
 f0 36 28              ldsp16	r6, [sp+0x28]
 f0 37 2a              ldsp16	r7, [sp+0x2a]
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f0 69 8c              cmp32	q2, q3
 d0 04                 breq8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_FAR24	.text.match_pointer_base+0x3ed
<L25>:
 f0 37 18              ldsp16	r7, [sp+0x18]
 f4 a7                 tst8	r7
 f0 34 10              ldsp16	r4, [sp+0x10]
 d1 04                 brne8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_FAR24	.text.match_pointer_base+0x3f7
<L26>:
 c1 02                 ldi8	r5, 0x2
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f5 16                 cmp	r2, r6
 fb 2f                 cmov.eq	r5, r7
 f1 28                 mov	r6, r0
 fb 31                 cmov.eq	r6, r1
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 9e                    or	r7, r6
 f0 3f 1c              stsp16	[sp+0x1c], r7
 0d                    mov	r7, r5
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_base+0x3ff
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 37 18              ldsp16	r7, [sp+0x18]
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_base+0x3ff
 c3 01                 ldi8	r7, 0x1
 f0 39 1c              stsp16	[sp+0x1c], r1
 f0 3a 1e              stsp16	[sp+0x1e], r2
 f4 ac                 inc16	r4
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f0 16 20              leasp	r6, 0x20
 19                    add	r6, r5
 f3 08                 st8	[r6], r0
 f0 30 2c              ldsp16	r0, [sp+0x2c]
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_base+0x4d
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_base+0x429
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_base+0x429
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_base+0x429
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 d6 3c                 adjsp	0x3c
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f0 34 18              ldsp16	r4, [sp+0x18]
 f1 74                 zext8	r4
 cc 01                 cmpi.s8	r4, 0x1
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d0 04                 breq8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_FAR24	.text.match_pointer_base+0x429
<L27>:
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_FAR24	.text.match_pointer_base+0x429
<L28>:
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 24                    sub	r5, r4
 c0 01                 ldi8	r4, 0x1
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_base+0x429
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_base+0x429
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_base+0x429
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_base+0x429
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_base+0x429
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_base+0x429
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_pointer_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_pointer_base+0x429

Disassembly of section .text.match_null_base:

<match_null_base>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 c6                 adjsp	-0x3a
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 ca 0f                 addi.s8	r6, 0xf
 f7 34                 ld16	r4, [r6+]
 46                    ld8u	r5, [r6]
 c2 08                 ldi8	r6, 0x8
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f0 63 88              ldp24	q2, [q2]
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 e3 00 00 00           callf	match_null_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.rtti_kind
 c8 fc                 addi.s8	r4, -0x4
 cc fd                 cmpi.s8	r4, -0x3
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_null_base
		R_AVM_FAR24	.text.match_null_base+0x33
<L0>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_null_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_null_base+0x36d
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 26              stsp16	[sp+0x26], r4
 f0 3d 28              stsp16	[sp+0x28], r5
 aa                    xor	r6, r6
 f0 2e 2e              stsp8	[sp+0x2e], r6
 f0 3e 1e              stsp16	[sp+0x1e], r6
 f0 3e 20              stsp16	[sp+0x20], r6
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 3e 22              stsp16	[sp+0x22], r6
 02                    mov	r4, r6
 f1 74                 zext8	r4
 f4 a6                 tst8	r6
 f4 72                 stsp16	[sp+0xc], r6
 f4 78                 stsp16	[sp+0xe], r4
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_null_base
		R_AVM_FAR24	.text.match_null_base+0x14a
<L1>:
 c1 02                 ldi8	r5, 0x2
 f4 69                 stsp16	[sp+0xa], r5
 f2 30                 sub	r0, r0
 c3 01                 ldi8	r7, 0x1
 f0 11 2e              leasp	r1, 0x2e
 f1 76                 zext8	r6
 f0 3e 18              stsp16	[sp+0x18], r6
 08                    mov	r6, r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f2 66                 mov32	q1, q2
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 e2 00 00 00           jmpf	match_null_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_null_base+0xa0
 f2 30                 sub	r0, r0
 f0 3a 14              stsp16	[sp+0x14], r2
 f0 3b 16              stsp16	[sp+0x16], r3
 f4 19                 ldsp16	r5, [sp+0x6]
 fa 36                 lsl16i	r4, 0x6
 f6 44                 sext8	r4
 fa b7                 asr16i	r4, 0x7
 f4 03                 ldsp16	r7, [sp+0x0]
 8c                    and	r7, r4
 f0 31 36              ldsp16	r1, [sp+0x36]
 f4 a9                 inc16	r1
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 09                    mov	r6, r5
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_null_base
		R_AVM_FAR24	.text.match_null_base+0x164
<L2>:
 f4 5a                 stsp16	[sp+0x6], r6
 f4 43                 stsp16	[sp+0x0], r7
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	match_null_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.rtti_kind
 cc 02                 cmpi.s8	r4, 0x2
 f0 39 36              stsp16	[sp+0x36], r1
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_null_base
		R_AVM_FAR24	.text.match_null_base+0xc5
<L3>:
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f7 66                 add32	q1, q2
 f0 63 44              ldp24	q1, [q1]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 28                 ldsp16	r4, [sp+0xa]
 e2 00 00 00           jmpf	match_null_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_null_base+0x135
 f0 38 2a              stsp16	[sp+0x2a], r0
 ed 82 20              ld8u	r4, [r1+0]
 f4 b4                 dec16	r4
 a5                    xor	r5, r5
 c2 ff                 ldi8	r6, 0xff
 af                    xor	r7, r7
 88                    and	r6, r4
 02                    mov	r4, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 f7 7e                 sub32	q3, q2
 f7 67                 add32	q1, q3
 f2 69                 mov32	q2, q1
 c2 0e                 ldi8	r6, 0xe
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f2 6b                 mov32	q3, q1
 f0 63 88              ldp24	q2, [q2]
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f2 30                 sub	r0, r0
 f0 01 80              ldi8	r1, 0x80
 f9 80                 and	r4, r0
 f9 a4                 and	r5, r1
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
 f0 05 00 ff           ldi16	r1, 0xff00
 f7 64                 add32	q1, q0
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 fb 14                 cmov.eq	r2, r4
 fb 1d                 cmov.eq	r3, r5
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 3b 04              stsp16	[sp+0x4], r3
 f2 63                 mov32	q0, q3
 c0 0a                 ldi8	r4, 0xa
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 c0 0d                 ldi8	r4, 0xd
 f7 6e                 add32	q3, q2
 f0 60 8c              ldp8u	r4, [q3]
 f0 63 40              ldp24	q1, [q0]
 c1 01                 ldi8	r5, 0x1
 84                    and	r5, r4
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_null_base
		R_AVM_FAR24	.text.match_null_base+0x7d
<L4>:
 f0 30 2a              ldsp16	r0, [sp+0x2a]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f2 39                 sub	r1, r1
 f7 63                 add32	q0, q3
 c6 ff ff              ldi16	r6, 0xffff
 af                    xor	r7, r7
 f0 69 c0              cmp32	q3, q0
 d2 04                 brult8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_null_base
		R_AVM_FAR24	.text.match_null_base+0x85
<L5>:
 e2 00 00 00           jmpf	match_null_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_null_base+0x36a
 f2 30                 sub	r0, r0
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 38 2a              stsp16	[sp+0x2a], r0
 f2 66                 mov32	q1, q2
 f0 38 00              stsp16	[sp+0x0], r0
 e2 00 00 00           jmpf	match_null_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_null_base+0x170
 f0 38 2a              stsp16	[sp+0x2a], r0
 f4 a7                 tst8	r7
 f8 04                 cset.eq	r4
 f4 40                 stsp16	[sp+0x0], r4
 f0 30 18              ldsp16	r0, [sp+0x18]
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	match_null_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.rtti_kind
 cc 02                 cmpi.s8	r4, 0x2
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_null_base
		R_AVM_FAR24	.text.match_null_base+0x1d0
<L6>:
 cc 03                 cmpi.s8	r4, 0x3
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_null_base
		R_AVM_FAR24	.text.match_null_base+0x1de
<L7>:
 f2 69                 mov32	q2, q1
 c2 08                 ldi8	r6, 0x8
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f0 62 88              ldp16	r4, [q2]
 cc 21                 cmpi.s8	r4, 0x21
 d2 04                 brult8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_null_base
		R_AVM_FAR24	.text.match_null_base+0x38b
<L8>:
 f0 38 18              stsp16	[sp+0x18], r0
 04                    mov	r5, r4
 fa 8d                 lsr16i	r5, 0xd
 08                    mov	r6, r4
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 0d                    mov	r7, r5
 f2 61                 mov32	q0, q1
 f1 14                 mov	r2, r4
 f2 4b                 sub	r3, r3
 f7 77                 sub32	q1, q3
 c6 f6 ff              ldi16	r6, 0xfff6
 c3 ff                 ldi8	r7, 0xff
 f7 6d                 add32	q3, q1
 f2 64                 mov32	q1, q0
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_null_base
		R_AVM_FAR24	.text.match_null_base+0x392
<L9>:
 f0 15 2e              leasp	r5, 0x2e
 f0 36 18              ldsp16	r6, [sp+0x18]
 16                    add	r5, r6
 49                    ld8u	r6, [r5]
 38                    cmp	r6, r4
 d8 04                 bruge8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_null_base
		R_AVM_FAR24	.text.match_null_base+0x209
<L10>:
 e2 00 00 00           jmpf	match_null_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_null_base+0x1de
 f0 14 2e              leasp	r4, 0x2e
 f2 20                 add	r4, r0
 44                    ld8u	r5, [r4]
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_null_base
		R_AVM_FAR24	.text.match_null_base+0x1f2
<L11>:
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_null_base
		R_AVM_FAR24	.text.match_null_base+0x374
<L12>:
 f4 38                 ldsp16	r4, [sp+0xe]
 f4 b4                 dec16	r4
 f4 b6                 dec16	r6
 e2 00 00 00           jmpf	match_null_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_null_base+0x4e
 c1 01                 ldi8	r5, 0x1
 51                    st8	[r4], r5
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f7 66                 add32	q1, q2
 f0 63 44              ldp24	q1, [q1]
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 c2 02                 ldi8	r6, 0x2
 e2 00 00 00           jmpf	match_null_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_null_base+0x27c
 f1 06                 mov	r0, r6
 f2 39                 sub	r1, r1
 f0 38 36              stsp16	[sp+0x36], r0
 f0 39 38              stsp16	[sp+0x38], r1
 f4 ae                 inc16	r6
 56                    st8	[r5], r6
 f2 6a                 mov32	q3, q0
 02                    mov	r4, r6
 07                    mov	r5, r7
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 f7 7e                 sub32	q3, q2
 f7 67                 add32	q1, q3
 f0 3a 06              stsp16	[sp+0x6], r2
 f0 3b 08              stsp16	[sp+0x8], r3
 c0 0e                 ldi8	r4, 0xe
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 63 88              ldp24	q2, [q2]
 f0 3c 36              stsp16	[sp+0x36], r4
 f0 3d 38              stsp16	[sp+0x38], r5
 a0                    xor	r4, r4
 c1 80                 ldi8	r5, 0x80
 f0 37 38              ldsp16	r7, [sp+0x38]
 87                    and	r5, r7
 aa                    xor	r6, r6
 c7 00 ff              ldi16	r7, 0xff00
 f2 67                 mov32	q1, q3
 f0 36 36              ldsp16	r6, [sp+0x36]
 f0 37 38              ldsp16	r7, [sp+0x38]
 f7 67                 add32	q1, q3
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 f0 34 36              ldsp16	r4, [sp+0x36]
 f0 35 38              ldsp16	r5, [sp+0x38]
 fb 14                 cmov.eq	r2, r4
 fb 1d                 cmov.eq	r3, r5
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 3b 04              stsp16	[sp+0x4], r3
 c0 0a                 ldi8	r4, 0xa
 a5                    xor	r5, r5
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 f7 69                 add32	q2, q1
 c2 0d                 ldi8	r6, 0xd
 f7 67                 add32	q1, q3
 f0 60 c4              ldp8u	r6, [q1]
 f0 63 48              ldp24	q1, [q2]
 ce 04                 cmpi.s8	r6, 0x4
 d2 04                 brult8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_null_base
		R_AVM_FAR24	.text.match_null_base+0x3a0
<L13>:
 f0 3e 36              stsp16	[sp+0x36], r6
 f2 69                 mov32	q2, q1
 e3 00 00 00           callf	match_null_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.rtti_kind
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_null_base
		R_AVM_FAR24	.text.match_null_base+0x399
<L14>:
 c0 04                 ldi8	r4, 0x4
 a5                    xor	r5, r5
 f4 32                 ldsp16	r6, [sp+0xc]
 f1 76                 zext8	r6
 ce 07                 cmpi.s8	r6, 0x7
 d2 04                 brult8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_null_base
		R_AVM_FAR24	.text.match_null_base+0x36d
<L15>:
 f0 37 22              ldsp16	r7, [sp+0x22]
 f4 af                 inc16	r7
 c6 00 02              ldi16	r6, 0x200
 f0 3f 22              stsp16	[sp+0x22], r7
 3b                    cmp	r6, r7
 d8 04                 bruge8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_null_base
		R_AVM_FAR24	.text.match_null_base+0x36d
<L16>:
 c1 01                 ldi8	r5, 0x1
 f0 37 36              ldsp16	r7, [sp+0x36]
 03                    mov	r4, r7
 81                    and	r4, r5
 aa                    xor	r6, r6
 f4 a4                 tst8	r4
 f0 3a 06              stsp16	[sp+0x6], r2
 f0 3b 08              stsp16	[sp+0x8], r3
 02                    mov	r4, r6
 d0 04                 breq8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_null_base
		R_AVM_FAR24	.text.match_null_base+0x2ef
<L17>:
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 a5                    xor	r5, r5
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f7 6e                 add32	q3, q2
 c4 ff ff              ldi16	r4, 0xffff
 f1 06                 mov	r0, r6
 f0 69 8c              cmp32	q2, q3
 c0 03                 ldi8	r4, 0x3
 d8 04                 bruge8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_null_base
		R_AVM_FAR24	.text.match_null_base+0x36d
<L18>:
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f1 20                 mov	r4, r0
 f0 37 36              ldsp16	r7, [sp+0x36]
 aa                    xor	r6, r6
 f4 8f                 lsr16.1	r7
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 a5                 tst8	r5
 fb 7e                 cmov.ne	r7, r6
 f0 30 1a              ldsp16	r0, [sp+0x1a]
 f0 31 1c              ldsp16	r1, [sp+0x1c]
 f0 69 40              cmp32	q1, q0
 d0 04                 breq8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_null_base
		R_AVM_FAR24	.text.match_null_base+0x359
<L19>:
 f1 04                 mov	r0, r4
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_null_base
		R_AVM_FAR24	.text.match_null_base+0x344
<L20>:
 f1 17                 mov	r2, r7
 f0 37 24              ldsp16	r7, [sp+0x24]
 f5 07                 cmp	r0, r7
 0e                    mov	r7, r6
 f8 06                 cset.eq	r6
 f0 30 26              ldsp16	r0, [sp+0x26]
 f0 31 28              ldsp16	r1, [sp+0x28]
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f0 69 80              cmp32	q2, q0
 f8 04                 cset.eq	r4
 82                    and	r4, r6
 c1 02                 ldi8	r5, 0x2
 f4 a4                 tst8	r4
 fb 6f                 cmov.ne	r5, r7
 a0                    xor	r4, r4
 fb 62                 cmov.ne	r4, r2
 f0 36 20              ldsp16	r6, [sp+0x20]
 98                    or	r6, r4
 f0 3e 20              stsp16	[sp+0x20], r6
 f0 3d 1e              stsp16	[sp+0x1e], r5
 e2 00 00 00           jmpf	match_null_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_null_base+0x359
 c2 01                 ldi8	r6, 0x1
 f0 3e 1e              stsp16	[sp+0x1e], r6
 f0 3f 20              stsp16	[sp+0x20], r7
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f0 3c 26              stsp16	[sp+0x26], r4
 f0 3d 28              stsp16	[sp+0x28], r5
 f0 38 24              stsp16	[sp+0x24], r0
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 ae                 inc16	r6
 02                    mov	r4, r6
 f1 74                 zext8	r4
 f0 15 2e              leasp	r5, 0x2e
 14                    add	r5, r4
 a0                    xor	r4, r4
 54                    st8	[r5], r4
 e2 00 00 00           jmpf	match_null_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_null_base+0x4b
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 d6 3a                 adjsp	0x3a
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f0 34 20              ldsp16	r4, [sp+0x20]
 f4 a4                 tst8	r4
 f8 0c                 cset.ne	r4
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f1 75                 zext8	r5
 cd 01                 cmpi.s8	r5, 0x1
 f8 05                 cset.eq	r5
 84                    and	r5, r4
 01                    mov	r4, r5
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_null_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_null_base+0x36d
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_null_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_null_base+0x36d
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_null_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_null_base+0x36d
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_null_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_null_base+0x36d
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_null_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_null_base+0x36d

Disassembly of section .text.match_object_base:

<match_object_base>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 be                 adjsp	-0x42
 f1 0e                 mov	r1, r6
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
 ca 0f                 addi.s8	r6, 0xf
 f7 34                 ld16	r4, [r6+]
 46                    ld8u	r5, [r6]
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 e3 00 00 00           callf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.rtti_kind
 aa                    xor	r6, r6
 af                    xor	r7, r7
 c8 fc                 addi.s8	r4, -0x4
 cc fd                 cmpi.s8	r4, -0x3
 d2 04                 brult8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x32
<L0>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 d6 42                 adjsp	0x42
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f1 21                 mov	r4, r1
 c8 3b                 addi.s8	r4, 0x3b
 f2 42                 sub	r2, r2
 f0 2a 3a              stsp8	[sp+0x3a], r2
 f0 3c 12              stsp16	[sp+0x12], r4
 a5                    xor	r5, r5
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f1 22                 mov	r4, r2
 f0 3a 2c              stsp16	[sp+0x2c], r2
 f0 3a 32              stsp16	[sp+0x32], r2
 f0 3a 2a              stsp16	[sp+0x2a], r2
 f0 39 1c              stsp16	[sp+0x1c], r1
 f1 26                 mov	r5, r2
 f1 75                 zext8	r5
 f0 3c 22              stsp16	[sp+0x22], r4
 f4 a2                 tst8	r2
 f0 3a 34              stsp16	[sp+0x34], r2
 f0 3d 1a              stsp16	[sp+0x1a], r5
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x230
<L1>:
 c0 02                 ldi8	r4, 0x2
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 00 01              ldi8	r0, 0x1
 f0 13 3a              leasp	r3, 0x3a
 f1 72                 zext8	r2
 f0 3a 24              stsp16	[sp+0x24], r2
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f0 34 12              ldsp16	r4, [sp+0x12]
 f1 14                 mov	r2, r4
 e2 00 00 00           jmpf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_object_base+0xa3
 f4 01                 ldsp16	r5, [sp+0x0]
 fa 46                 lsl16i	r5, 0x6
 f6 45                 sext8	r5
 fa c7                 asr16i	r5, 0x7
 f9 14                 and	r0, r5
 f0 33 2e              ldsp16	r3, [sp+0x2e]
 f4 ab                 inc16	r3
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 04                    mov	r5, r4
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x244
<L2>:
 f0 38 26              stsp16	[sp+0x26], r0
 f4 79                 stsp16	[sp+0xe], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 63                 mov32	q0, q3
 e3 00 00 00           callf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.rtti_kind
 cc 02                 cmpi.s8	r4, 0x2
 f1 2a                 mov	r6, r2
 af                    xor	r7, r7
 f0 3b 2e              stsp16	[sp+0x2e], r3
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0xdd
<L3>:
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f0 63 00              ldp24	q0, [q0]
 f0 38 02              stsp16	[sp+0x2], r0
 f0 39 04              stsp16	[sp+0x4], r1
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 31 1c              ldsp16	r1, [sp+0x1c]
 f0 30 26              ldsp16	r0, [sp+0x26]
 e2 00 00 00           jmpf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_object_base+0x154
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 f0 3a 36              stsp16	[sp+0x36], r2
 ed 86 20              ld8u	r4, [r3+0]
 f4 b4                 dec16	r4
 a5                    xor	r5, r5
 c2 ff                 ldi8	r6, 0xff
 af                    xor	r7, r7
 88                    and	r6, r4
 02                    mov	r4, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 f7 7e                 sub32	q3, q2
 f7 63                 add32	q0, q3
 f0 38 02              stsp16	[sp+0x2], r0
 f0 39 04              stsp16	[sp+0x4], r1
 c2 0e                 ldi8	r6, 0xe
 af                    xor	r7, r7
 f7 63                 add32	q0, q3
 f0 63 80              ldp24	q2, [q0]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 30                 sub	r0, r0
 f0 01 80              ldi8	r1, 0x80
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 f2 62                 mov32	q0, q2
 f2 42                 sub	r2, r2
 f0 07 00 ff           ldi16	r3, 0xff00
 f7 61                 add32	q0, q1
 f2 4b                 sub	r3, r3
 f0 69 c4              cmp32	q3, q1
 fb 04                 cmov.eq	r0, r4
 fb 0d                 cmov.eq	r1, r5
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
 f2 6b                 mov32	q3, q1
 c0 0a                 ldi8	r4, 0xa
 a5                    xor	r5, r5
 f7 6e                 add32	q3, q2
 c0 0d                 ldi8	r4, 0xd
 f7 66                 add32	q1, q2
 f0 60 84              ldp8u	r4, [q1]
 f0 63 cc              ldp24	q3, [q3]
 c1 01                 ldi8	r5, 0x1
 84                    and	r5, r4
 f4 a5                 tst8	r5
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x17a
<L4>:
 f2 64                 mov32	q1, q0
 f0 31 1c              ldsp16	r1, [sp+0x1c]
 f0 30 26              ldsp16	r0, [sp+0x26]
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 f7 67                 add32	q1, q3
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f0 69 4c              cmp32	q1, q3
 d9 04                 brsge8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x505
<L5>:
 f4 40                 stsp16	[sp+0x0], r4
 ed 92 35              ld16	r4, [r1+21]
 a5                    xor	r5, r5
 f7 6b                 add32	q2, q3
 f0 69 48              cmp32	q1, q2
 f4 38                 ldsp16	r4, [sp+0xe]
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x85
<L6>:
 e2 00 00 00           jmpf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_object_base+0x50c
 f4 40                 stsp16	[sp+0x0], r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 32 36              ldsp16	r2, [sp+0x36]
 f5 14                 cmp	r2, r4
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x513
<L7>:
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 ed b8 35              ld16	r5, [r4+21]
 09                    mov	r6, r5
 af                    xor	r7, r7
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f7 6e                 add32	q3, q2
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f0 69 8c              cmp32	q2, q3
 d2 04                 brult8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x51a
<L8>:
 f1 26                 mov	r5, r2
 c9 02                 addi.s8	r5, 0x2
 f0 34 12              ldsp16	r4, [sp+0x12]
 34                    cmp	r5, r4
 d8 04                 bruge8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x544
<L9>:
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 69 8c              cmp32	q2, q3
 d2 04                 brult8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x53d
<L10>:
 f0 6c d5              ld16	r6, [r2+]
 ed e4 20              ld8u	r7, [r2+0]
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f2 69                 mov32	q2, q1
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x521
<L11>:
 f7 6c                 add32	q3, q0
 c4 fd ff              ldi16	r4, 0xfffd
 c1 ff                 ldi8	r5, 0xff
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x528
<L12>:
 f0 63 8c              ldp24	q2, [q3]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 30                 sub	r0, r0
 f0 01 80              ldi8	r1, 0x80
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 f2 66                 mov32	q1, q2
 f0 05 00 ff           ldi16	r1, 0xff00
 f7 64                 add32	q1, q0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 fb 14                 cmov.eq	r2, r4
 fb 1d                 cmov.eq	r3, r5
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f7 66                 add32	q1, q2
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f0 69 4c              cmp32	q1, q3
 d9 04                 brsge8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x52f
<L13>:
 f0 31 1c              ldsp16	r1, [sp+0x1c]
 ed 92 35              ld16	r4, [r1+21]
 a5                    xor	r5, r5
 f7 6b                 add32	q2, q3
 f0 69 48              cmp32	q1, q2
 f0 30 26              ldsp16	r0, [sp+0x26]
 f4 38                 ldsp16	r4, [sp+0xe]
 d8 04                 bruge8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x85
<L14>:
 e2 00 00 00           jmpf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_object_base+0x536
 f2 30                 sub	r0, r0
 f0 34 12              ldsp16	r4, [sp+0x12]
 f1 14                 mov	r2, r4
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f0 38 24              stsp16	[sp+0x24], r0
 e2 00 00 00           jmpf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_object_base+0x248
 f4 a0                 tst8	r0
 f8 00                 cset.eq	r0
 f0 3a 36              stsp16	[sp+0x36], r2
 f0 3b 38              stsp16	[sp+0x38], r3
 f2 67                 mov32	q1, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 e3 00 00 00           callf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.rtti_kind
 cc 02                 cmpi.s8	r4, 0x2
 d1 04                 brne8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x2af
<L15>:
 cc 03                 cmpi.s8	r4, 0x3
 d0 04                 breq8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x2bf
<L16>:
 c0 08                 ldi8	r4, 0x8
 a5                    xor	r5, r5
 f2 6b                 mov32	q3, q1
 f7 6b                 add32	q2, q3
 f0 62 88              ldp16	r4, [q2]
 cc 21                 cmpi.s8	r4, 0x21
 d2 04                 brult8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x572
<L17>:
 f0 38 02              stsp16	[sp+0x2], r0
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
 d8 04                 bruge8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x579
<L18>:
 f0 15 3a              leasp	r5, 0x3a
 f0 36 24              ldsp16	r6, [sp+0x24]
 16                    add	r5, r6
 49                    ld8u	r6, [r5]
 38                    cmp	r6, r4
 f0 31 1c              ldsp16	r1, [sp+0x1c]
 d8 04                 bruge8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x2ef
<L19>:
 e2 00 00 00           jmpf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_object_base+0x2bf
 f0 14 3a              leasp	r4, 0x3a
 f0 35 24              ldsp16	r5, [sp+0x24]
 11                    add	r4, r5
 44                    ld8u	r5, [r4]
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x2d5
<L20>:
 f0 32 34              ldsp16	r2, [sp+0x34]
 f4 a2                 tst8	r2
 d1 04                 brne8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x54b
<L21>:
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f4 b5                 dec16	r5
 f4 b2                 dec16	r2
 e2 00 00 00           jmpf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_object_base+0x58
 c1 01                 ldi8	r5, 0x1
 51                    st8	[r4], r5
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 3e 26              stsp16	[sp+0x26], r6
 f0 3f 28              stsp16	[sp+0x28], r7
 f0 02 02              ldi8	r2, 0x2
 e2 00 00 00           jmpf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_object_base+0x363
 f1 06                 mov	r0, r6
 f2 39                 sub	r1, r1
 f4 ae                 inc16	r6
 56                    st8	[r5], r6
 f2 68                 mov32	q2, q0
 f4 80                 lsl16.1	r0
 f4 80                 lsl16.1	r0
 f4 80                 lsl16.1	r0
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 f7 7e                 sub32	q3, q2
 f7 67                 add32	q1, q3
 c0 0e                 ldi8	r4, 0xe
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 63 88              ldp24	q2, [q2]
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 30                 sub	r0, r0
 f0 01 80              ldi8	r1, 0x80
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 f0 3e 26              stsp16	[sp+0x26], r6
 f0 3f 28              stsp16	[sp+0x28], r7
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 05 00 ff           ldi16	r1, 0xff00
 f7 6c                 add32	q3, q0
 f2 39                 sub	r1, r1
 f1 20                 mov	r4, r0
 f0 35 28              ldsp16	r5, [sp+0x28]
 f0 69 80              cmp32	q2, q0
 f0 30 02              ldsp16	r0, [sp+0x2]
 f0 31 1c              ldsp16	r1, [sp+0x1c]
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 fb 34                 cmov.eq	r6, r4
 fb 3d                 cmov.eq	r7, r5
 f0 3e 26              stsp16	[sp+0x26], r6
 f0 3f 28              stsp16	[sp+0x28], r7
 c0 0a                 ldi8	r4, 0xa
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 c2 0d                 ldi8	r6, 0xd
 af                    xor	r7, r7
 f7 67                 add32	q1, q3
 f0 60 44              ldp8u	r2, [q1]
 f0 63 88              ldp24	q2, [q2]
 f0 0e 04              cmpi.s8	r2, 0x4
 d2 04                 brult8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x587
<L22>:
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 e3 00 00 00           callf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.rtti_kind
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x580
<L23>:
 c0 04                 ldi8	r4, 0x4
 a5                    xor	r5, r5
 f0 36 34              ldsp16	r6, [sp+0x34]
 f1 76                 zext8	r6
 ce 07                 cmpi.s8	r6, 0x7
 d2 04                 brult8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x2b
<L24>:
 f0 37 2a              ldsp16	r7, [sp+0x2a]
 f4 af                 inc16	r7
 c6 00 02              ldi16	r6, 0x200
 f0 3f 2a              stsp16	[sp+0x2a], r7
 3b                    cmp	r6, r7
 d8 04                 bruge8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x2b
<L25>:
 c1 01                 ldi8	r5, 0x1
 f0 3a 0e              stsp16	[sp+0xe], r2
 f1 22                 mov	r4, r2
 81                    and	r4, r5
 f0 32 36              ldsp16	r2, [sp+0x36]
 f1 2a                 mov	r6, r2
 af                    xor	r7, r7
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x3d3
<L26>:
 f0 32 26              ldsp16	r2, [sp+0x26]
 f0 33 28              ldsp16	r3, [sp+0x28]
 f7 67                 add32	q1, q3
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f0 69 4c              cmp32	q1, q3
 d9 04                 brsge8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x595
<L27>:
 ed 92 35              ld16	r4, [r1+21]
 a5                    xor	r5, r5
 f7 6b                 add32	q2, q3
 f0 69 48              cmp32	q1, q2
 f0 3a 26              stsp16	[sp+0x26], r2
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_object_base+0x485
 f0 34 12              ldsp16	r4, [sp+0x12]
 f5 14                 cmp	r2, r4
 d8 04                 bruge8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x58e
<L28>:
 ed 92 35              ld16	r4, [r1+21]
 f0 3e 2e              stsp16	[sp+0x2e], r6
 f0 3f 30              stsp16	[sp+0x30], r7
 08                    mov	r6, r4
 af                    xor	r7, r7
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f7 6e                 add32	q3, q2
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 f0 35 30              ldsp16	r5, [sp+0x30]
 f0 69 8c              cmp32	q2, q3
 d2 04                 brult8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x59c
<L29>:
 f1 22                 mov	r4, r2
 c8 02                 addi.s8	r4, 0x2
 f0 35 12              ldsp16	r5, [sp+0x12]
 31                    cmp	r4, r5
 d8 04                 bruge8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x5b8
<L30>:
 a5                    xor	r5, r5
 f0 69 8c              cmp32	q2, q3
 d2 04                 brult8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x5bf
<L31>:
 f0 6c d5              ld16	r6, [r2+]
 ed e4 20              ld8u	r7, [r2+0]
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x5a3
<L32>:
 f0 34 26              ldsp16	r4, [sp+0x26]
 f0 35 28              ldsp16	r5, [sp+0x28]
 f7 6e                 add32	q3, q2
 c4 fd ff              ldi16	r4, 0xfffd
 c1 ff                 ldi8	r5, 0xff
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L33>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x5aa
<L33>:
 f0 63 cc              ldp24	q3, [q3]
 f0 3e 26              stsp16	[sp+0x26], r6
 f0 3f 28              stsp16	[sp+0x28], r7
 a0                    xor	r4, r4
 c1 80                 ldi8	r5, 0x80
 87                    and	r5, r7
 f2 42                 sub	r2, r2
 f0 07 00 ff           ldi16	r3, 0xff00
 f7 67                 add32	q1, q3
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 f0 34 26              ldsp16	r4, [sp+0x26]
 f0 35 28              ldsp16	r5, [sp+0x28]
 fb 14                 cmov.eq	r2, r4
 fb 1d                 cmov.eq	r3, r5
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 f0 35 30              ldsp16	r5, [sp+0x30]
 f7 66                 add32	q1, q2
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f0 69 4c              cmp32	q1, q3
 d9 04                 brsge8	0x4 <L34>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x5b1
<L34>:
 ed 92 35              ld16	r4, [r1+21]
 a5                    xor	r5, r5
 f7 6b                 add32	q2, q3
 f0 3a 26              stsp16	[sp+0x26], r2
 f0 69 48              cmp32	q1, q2
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f0 32 0e              ldsp16	r2, [sp+0xe]
 d2 04                 brult8	0x4 <L35>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x2b
<L35>:
 f4 8a                 lsr16.1	r2
 f2 4b                 sub	r3, r3
 f4 a0                 tst8	r0
 fb 53                 cmov.ne	r2, r3
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f0 37 20              ldsp16	r7, [sp+0x20]
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f0 69 8c              cmp32	q2, q3
 d0 04                 breq8	0x4 <L36>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x4da
<L36>:
 f1 2e                 mov	r7, r2
 f0 35 22              ldsp16	r5, [sp+0x22]
 f4 a5                 tst8	r5
 f0 32 34              ldsp16	r2, [sp+0x34]
 d1 04                 brne8	0x4 <L37>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x4e1
<L37>:
 f0 00 02              ldi8	r0, 0x2
 f0 36 32              ldsp16	r6, [sp+0x32]
 f0 34 26              ldsp16	r4, [sp+0x26]
 32                    cmp	r4, r6
 f0 34 22              ldsp16	r4, [sp+0x22]
 fb 04                 cmov.eq	r0, r4
 f1 2b                 mov	r6, r3
 fb 37                 cmov.eq	r6, r7
 f0 37 2c              ldsp16	r7, [sp+0x2c]
 9e                    or	r7, r6
 f0 3f 2c              stsp16	[sp+0x2c], r7
 f0 38 22              stsp16	[sp+0x22], r0
 e2 00 00 00           jmpf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_object_base+0x4f2
 f0 32 34              ldsp16	r2, [sp+0x34]
 e2 00 00 00           jmpf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_object_base+0x4f2
 c0 01                 ldi8	r4, 0x1
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3f 2c              stsp16	[sp+0x2c], r7
 f0 36 26              ldsp16	r6, [sp+0x26]
 f0 37 28              ldsp16	r7, [sp+0x28]
 f0 3e 32              stsp16	[sp+0x32], r6
 f4 aa                 inc16	r2
 f1 26                 mov	r5, r2
 f1 75                 zext8	r5
 f0 16 3a              leasp	r6, 0x3a
 19                    add	r6, r5
 f3 0b                 st8	[r6], r3
 f0 34 22              ldsp16	r4, [sp+0x22]
 e2 00 00 00           jmpf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_object_base+0x51
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_object_base+0x2b
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_object_base+0x2b
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_object_base+0x2b
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_object_base+0x2b
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_object_base+0x2b
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_object_base+0x2b
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_object_base+0x2b
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_object_base+0x2b
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_object_base+0x2b
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_object_base+0x2b
 f0 34 22              ldsp16	r4, [sp+0x22]
 f1 74                 zext8	r4
 cc 01                 cmpi.s8	r4, 0x1
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d0 04                 breq8	0x4 <L38>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x2b
<L38>:
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 f4 a6                 tst8	r6
 d1 04                 brne8	0x4 <L39>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_object_base
		R_AVM_FAR24	.text.match_object_base+0x2b
<L39>:
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 32              ldsp16	r5, [sp+0x32]
 24                    sub	r5, r4
 c0 01                 ldi8	r4, 0x1
 e2 00 00 00           jmpf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_object_base+0x2b
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_object_base+0x2b
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_object_base+0x2b
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_object_base+0x2b
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_object_base+0x2b
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_object_base+0x2b
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_object_base+0x2b
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_object_base+0x2b
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_object_base+0x2b
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_object_base+0x2b
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_object_base+0x2b
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_object_base+0x2b
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_object_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_object_base+0x2b

Disassembly of section .text.find_call:

<find_call>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e4                 adjsp	-0x1c
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f2 62                 mov32	q0, q2
 c0 0c                 ldi8	r4, 0xc
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f0 63 88              ldp24	q2, [q2]
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
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
 f0 3d 12              stsp16	[sp+0x12], r5
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_call
		R_AVM_FAR24	.text.find_call+0x128
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
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
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
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 aa                    xor	r6, r6
 f0 38 18              stsp16	[sp+0x18], r0
 f0 39 1a              stsp16	[sp+0x1a], r1
 f0 63 00              ldp24	q0, [q0]
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f0 63 88              ldp24	q2, [q2]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 63 84              ldp24	q2, [q1]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 62                 stsp16	[sp+0x8], r6
 f6 2e                 tst16	r6
 f0 38 0a              stsp16	[sp+0xa], r0
 f0 39 0c              stsp16	[sp+0xc], r1
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_call
		R_AVM_FAR24	.text.find_call+0xae
<L1>:
 c6 fb ff              ldi16	r6, 0xfffb
 c7 ff ff              ldi16	r7, 0xffff
 f7 6d                 add32	q3, q1
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_call
		R_AVM_FAR24	.text.find_call+0xae
<L2>:
 f0 63 0c              ldp24	q0, [q3]
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d2 04                 brult8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_call
		R_AVM_FAR24	.text.find_call+0x158
<L3>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_call
		R_AVM_FAR24	.text.find_call+0x162
<L4>:
 f0 69 0c              cmp32	q0, q3
 d2 04                 brult8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_call
		R_AVM_FAR24	.text.find_call+0x14e
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
		R_AVM_FAR24	.text.find_call+0x132
<L6>:
 f0 63 c4              ldp24	q3, [q1]
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 f0 69 c0              cmp32	q3, q0
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_call
		R_AVM_FAR24	.text.find_call+0x13c
<L7>:
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_call
		R_AVM_FAR24	.text.find_call+0x144
<L8>:
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f7 66                 add32	q1, q2
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 ae                 inc16	r6
 f0 34 12              ldsp16	r4, [sp+0x12]
 32                    cmp	r4, r6
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_call
		R_AVM_FAR24	.text.find_call+0x72
<L9>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 e2 00 00 00           jmpf	find_call
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_call+0x168
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 e2 00 00 00           jmpf	find_call
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_call+0x168
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 e2 00 00 00           jmpf	find_call
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_call+0x168
 f0 62 88              ldp16	r4, [q2]
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_call
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_call+0x168
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 e2 00 00 00           jmpf	find_call
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_call+0x168
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 e2 00 00 00           jmpf	find_call
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_call+0x168
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 e2 00 00 00           jmpf	find_call
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_call+0x168
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 d6 1c                 adjsp	0x1c
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
