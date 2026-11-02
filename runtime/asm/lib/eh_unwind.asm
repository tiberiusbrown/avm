
eh_unwind.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 eh_unwind.c
00000000 l    d  .text.avm_eh_open_exception	00000000 .text.avm_eh_open_exception
00000000 l    d  .text.avm_eh_validate_block	00000000 .text.avm_eh_validate_block
00000000 l     F .text.site_ok	000000ca site_ok
00000000 l     F .text.pool_ok	00000238 pool_ok
00000000 l     F .text.site_has_call	00000075 site_has_call
00000000 l    d  .text.site_ok	00000000 .text.site_ok
00000000 l    d  .text.pool_ok	00000000 .text.pool_ok
00000000 l     F .text.list_ok	000001c4 list_ok
00000000 l     F .text.list_named	0000007a list_named
00000000 l    d  .text.site_has_call	00000000 .text.site_has_call
00000000 l    d  .text.avm_eh_find_handler	00000000 .text.avm_eh_find_handler
00000000 l     F .text.unwind_frame	000000d5 unwind_frame
00000000 l     F .text.find_function	00000322 find_function
00000000 l     F .text.find_row	000001af find_row
00000000 l     F .text.find_site	0000010a find_site
00000000 l     F .text.match_list	000000cb match_list
00000000 l     F .text.find_call	00000173 find_call
00000000 l    d  .text.find_function	00000000 .text.find_function
00000000 l    d  .text.find_row	00000000 .text.find_row
00000000 l    d  .text.find_site	00000000 .text.find_site
00000000 l    d  .text.unwind_frame	00000000 .text.unwind_frame
00000000 l    d  .text.avm_eh_prepare_next	00000000 .text.avm_eh_prepare_next
00000000 l    d  .text.list_ok	00000000 .text.list_ok
00000000 l    d  .text.list_named	00000000 .text.list_named
00000000 l    d  .text.match_list	00000000 .text.match_list
00000000 l     F .text.match_class_base	0000067f match_class_base
00000000 l    d  .text.match_class_base	00000000 .text.match_class_base
00000000 l    d  .text.find_call	00000000 .text.find_call
00000000 g     F .text.avm_eh_open_exception	00000141 avm_eh_open_exception
00000000 g     O .rodata.__avm_eh_metadata_ptr	00000003 __avm_eh_metadata_ptr
00000000 g     F .text.avm_eh_validate_block	0000076c avm_eh_validate_block
00000000 g     F .text.avm_eh_find_handler	0000016c avm_eh_find_handler
00000000 g     F .text.avm_eh_prepare_next	000001d7 avm_eh_prepare_next
00000000         *UND*	00000000 vtable for __cxxabiv1::__class_type_info
00000000         *UND*	00000000 vtable for __cxxabiv1::__si_class_type_info
00000000         *UND*	00000000 vtable for __cxxabiv1::__vmi_class_type_info

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
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
<L0>:
 f0 60 ac              ldp8u	r5, [q3]
 cd 41                 cmpi.s8	r5, 0x41
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
<L1>:
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f7 63                 add32	q0, q3
 f0 60 a0              ldp8u	r5, [q0]
 cd 56                 cmpi.s8	r5, 0x56
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
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
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
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
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
<L4>:
 f0 00 04              ldi8	r0, 0x4
 f2 39                 sub	r1, r1
 f7 63                 add32	q0, q3
 f0 60 a0              ldp8u	r5, [q0]
 cd 35                 cmpi.s8	r5, 0x35
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
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
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
<L6>:
 f2 30                 sub	r0, r0
 f0 05 00 01           ldi16	r1, 0x100
 f7 73                 sub32	q0, q3
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
<L7>:
 f0 3a 42              stsp16	[sp+0x42], r2
 f0 3b 44              stsp16	[sp+0x44], r3
 f0 02 05              ldi8	r2, 0x5
 f2 4b                 sub	r3, r3
 f2 63                 mov32	q0, q3
 f7 61                 add32	q0, q1
 f0 62 a0              ldp16	r5, [q0]
 f4 51                 stsp16	[sp+0x4], r5
 fa 8e                 lsr16i	r5, 0xe
 f0 3d 12              stsp16	[sp+0x12], r5
 f4 11                 ldsp16	r5, [sp+0x4]
 15                    add	r5, r5
 15                    add	r5, r5
 f2 67                 mov32	q1, q3
 f0 36 12              ldsp16	r6, [sp+0x12]
 f1 05                 mov	r0, r5
 f1 0e                 mov	r1, r6
 f0 3a 26              stsp16	[sp+0x26], r2
 f0 3b 28              stsp16	[sp+0x28], r3
 f4 11                 ldsp16	r5, [sp+0x4]
 09                    mov	r6, r5
 af                    xor	r7, r7
 f7 6f                 add32	q3, q3
 f7 6c                 add32	q3, q0
 f2 63                 mov32	q0, q3
 f0 02 0a              ldi8	r2, 0xa
 f2 4b                 sub	r3, r3
 f7 61                 add32	q0, q1
 f0 32 42              ldsp16	r2, [sp+0x42]
 f0 33 44              ldsp16	r3, [sp+0x44]
 f0 69 40              cmp32	q1, q0
 f2 61                 mov32	q0, q1
 d8 04                 bruge8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
<L8>:
 f0 34 26              ldsp16	r4, [sp+0x26]
 f0 35 28              ldsp16	r5, [sp+0x28]
 f7 62                 add32	q0, q2
 f0 38 42              stsp16	[sp+0x42], r0
 f0 39 44              stsp16	[sp+0x44], r1
 f0 00 0a              ldi8	r0, 0xa
 f2 39                 sub	r1, r1
 f7 68                 add32	q2, q0
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 3d 30              stsp16	[sp+0x30], r5
 f7 6e                 add32	q3, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f6 2c                 tst16	r4
 f2 67                 mov32	q1, q3
 d1 04                 brne8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x744
<L9>:
 a0                    xor	r4, r4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 04                    mov	r5, r4
 09                    mov	r6, r5
 fa 9e                 lsr16i	r6, 0xe
 f0 3e 32              stsp16	[sp+0x32], r6
 09                    mov	r6, r5
 1a                    add	r6, r6
 1a                    add	r6, r6
 f0 3e 20              stsp16	[sp+0x20], r6
 f0 3d 1e              stsp16	[sp+0x1e], r5
 09                    mov	r6, r5
 af                    xor	r7, r7
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f0 30 42              ldsp16	r0, [sp+0x42]
 f0 31 44              ldsp16	r1, [sp+0x44]
 f7 71                 sub32	q0, q1
 c2 12                 ldi8	r6, 0x12
 af                    xor	r7, r7
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
<L10>:
 c2 0f                 ldi8	r6, 0xf
 af                    xor	r7, r7
 f7 6d                 add32	q3, q1
 f0 3e 22              stsp16	[sp+0x22], r6
 f0 3f 24              stsp16	[sp+0x24], r7
 f0 3a 12              stsp16	[sp+0x12], r2
 f0 3b 14              stsp16	[sp+0x14], r3
 f0 02 0c              ldi8	r2, 0xc
 f2 4b                 sub	r3, r3
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 f7 61                 add32	q0, q1
 c2 06                 ldi8	r6, 0x6
 af                    xor	r7, r7
 f0 32 12              ldsp16	r2, [sp+0x12]
 f0 33 14              ldsp16	r3, [sp+0x14]
 f7 6d                 add32	q3, q1
 f0 3e 3a              stsp16	[sp+0x3a], r6
 f0 3f 3c              stsp16	[sp+0x3c], r7
 f0 62 ac              ldp16	r5, [q3]
 f0 38 4a              stsp16	[sp+0x4a], r0
 f0 39 4c              stsp16	[sp+0x4c], r1
 f0 63 40              ldp24	q1, [q0]
 f0 36 22              ldsp16	r6, [sp+0x22]
 f0 37 24              ldsp16	r7, [sp+0x24]
 f0 63 0c              ldp24	q0, [q3]
 f0 38 22              stsp16	[sp+0x22], r0
 f0 39 24              stsp16	[sp+0x24], r1
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
<L11>:
 09                    mov	r6, r5
 af                    xor	r7, r7
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 fa 8e                 lsr16i	r5, 0xe
 0d                    mov	r7, r5
 06                    mov	r5, r6
 15                    add	r5, r5
 15                    add	r5, r5
 f1 05                 mov	r0, r5
 f1 0f                 mov	r1, r7
 f0 37 10              ldsp16	r7, [sp+0x10]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f7 63                 add32	q0, q3
 c2 12                 ldi8	r6, 0x12
 af                    xor	r7, r7
 f7 63                 add32	q0, q3
 f0 69 40              cmp32	q1, q0
 f0 3a 1a              stsp16	[sp+0x1a], r2
 f0 3b 1c              stsp16	[sp+0x1c], r3
 d8 04                 bruge8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
<L12>:
 f4 3a                 ldsp16	r6, [sp+0xe]
 06                    mov	r5, r6
 fa 8d                 lsr16i	r5, 0xd
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3d 10              stsp16	[sp+0x10], r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f1 17                 mov	r2, r7
 f4 82                 lsl16.1	r2
 f4 82                 lsl16.1	r2
 06                    mov	r5, r6
 fa 8e                 lsr16i	r5, 0xe
 f9 a9                 or	r5, r2
 f0 3d 2a              stsp16	[sp+0x2a], r5
 06                    mov	r5, r6
 15                    add	r5, r5
 15                    add	r5, r5
 f0 36 2a              ldsp16	r6, [sp+0x2a]
 f1 15                 mov	r2, r5
 f1 1e                 mov	r3, r6
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 f7 64                 add32	q1, q0
 f4 02                 ldsp16	r6, [sp+0x0]
 f7 6d                 add32	q3, q1
 f0 02 12              ldi8	r2, 0x12
 f2 4b                 sub	r3, r3
 f7 6d                 add32	q3, q1
 f0 30 1a              ldsp16	r0, [sp+0x1a]
 f0 31 1c              ldsp16	r1, [sp+0x1c]
 f0 69 c0              cmp32	q3, q0
 f2 6a                 mov32	q3, q0
 d8 04                 bruge8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
<L13>:
 f0 30 22              ldsp16	r0, [sp+0x22]
 f0 31 24              ldsp16	r1, [sp+0x24]
 f0 69 0c              cmp32	q0, q3
 f0 00 0a              ldi8	r0, 0xa
 f2 39                 sub	r1, r1
 f2 64                 mov32	q1, q0
 d8 04                 bruge8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
<L14>:
 f0 00 08              ldi8	r0, 0x8
 f2 39                 sub	r1, r1
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 f7 63                 add32	q0, q3
 f7 6d                 add32	q3, q1
 f0 3e 36              stsp16	[sp+0x36], r6
 f0 3f 38              stsp16	[sp+0x38], r7
 f0 62 ac              ldp16	r5, [q3]
 f1 15                 mov	r2, r5
 f2 4b                 sub	r3, r3
 f0 38 46              stsp16	[sp+0x46], r0
 f0 39 48              stsp16	[sp+0x48], r1
 f0 62 a0              ldp16	r5, [q0]
 09                    mov	r6, r5
 af                    xor	r7, r7
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 3a 2a              stsp16	[sp+0x2a], r2
 f0 3b 2c              stsp16	[sp+0x2c], r3
 f2 61                 mov32	q0, q1
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f0 32 22              ldsp16	r2, [sp+0x22]
 f0 33 24              ldsp16	r3, [sp+0x24]
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
<L15>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 32 2a              ldsp16	r2, [sp+0x2a]
 f0 33 2c              ldsp16	r3, [sp+0x2c]
 f7 6d                 add32	q3, q1
 f1 17                 mov	r2, r7
 f4 82                 lsl16.1	r2
 f4 82                 lsl16.1	r2
 06                    mov	r5, r6
 fa 8e                 lsr16i	r5, 0xe
 f9 a9                 or	r5, r2
 1a                    add	r6, r6
 1a                    add	r6, r6
 f4 42                 stsp16	[sp+0x0], r6
 f4 49                 stsp16	[sp+0x2], r5
 f4 3a                 ldsp16	r6, [sp+0xe]
 06                    mov	r5, r6
 fa 8d                 lsr16i	r5, 0xd
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 f1 16                 mov	r2, r6
 f1 1d                 mov	r3, r5
 f7 61                 add32	q0, q1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f7 63                 add32	q0, q3
 f0 32 22              ldsp16	r2, [sp+0x22]
 f0 33 24              ldsp16	r3, [sp+0x24]
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 f7 77                 sub32	q1, q3
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
<L16>:
 f0 32 12              ldsp16	r2, [sp+0x12]
 f0 33 14              ldsp16	r3, [sp+0x14]
 f0 30 22              ldsp16	r0, [sp+0x22]
 f0 31 24              ldsp16	r1, [sp+0x24]
 f7 61                 add32	q0, q1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 38 22              stsp16	[sp+0x22], r0
 f0 39 24              stsp16	[sp+0x24], r1
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 69 0c              cmp32	q0, q3
 f0 00 03              ldi8	r0, 0x3
 f2 39                 sub	r1, r1
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 d1 04                 brne8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
<L17>:
 f2 6b                 mov32	q3, q1
 f7 6c                 add32	q3, q0
 f0 63 44              ldp24	q1, [q1]
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f0 3f 1c              stsp16	[sp+0x1c], r7
 f0 63 cc              ldp24	q3, [q3]
 f0 30 0a              ldsp16	r0, [sp+0xa]
 f0 31 0c              ldsp16	r1, [sp+0xc]
 f0 69 40              cmp32	q1, q0
 d8 04                 bruge8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
<L18>:
 f0 3a 0e              stsp16	[sp+0xe], r2
 f0 3b 10              stsp16	[sp+0x10], r3
 f0 69 4c              cmp32	q1, q3
 d2 04                 brult8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
<L19>:
 f0 3e 3e              stsp16	[sp+0x3e], r6
 f0 3f 40              stsp16	[sp+0x40], r7
 f0 36 32              ldsp16	r6, [sp+0x32]
 f0 37 20              ldsp16	r7, [sp+0x20]
 ab                    xor	r6, r7
 ae                    xor	r7, r6
 ab                    xor	r6, r7
 f0 32 2e              ldsp16	r2, [sp+0x2e]
 f0 33 30              ldsp16	r3, [sp+0x30]
 f7 6d                 add32	q3, q1
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 f7 60                 add32	q0, q0
 f7 63                 add32	q0, q3
 f0 63 40              ldp24	q1, [q0]
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 f0 69 4c              cmp32	q1, q3
 d0 04                 breq8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
<L20>:
 f0 32 12              ldsp16	r2, [sp+0x12]
 f0 33 14              ldsp16	r3, [sp+0x14]
 f0 36 26              ldsp16	r6, [sp+0x26]
 f0 37 28              ldsp16	r7, [sp+0x28]
 f7 77                 sub32	q1, q3
 f2 6b                 mov32	q3, q1
 f0 38 06              stsp16	[sp+0x6], r0
 f0 39 08              stsp16	[sp+0x8], r1
 f2 64                 mov32	q1, q0
 f0 00 03              ldi8	r0, 0x3
 f2 39                 sub	r1, r1
 f7 64                 add32	q1, q0
 f0 63 44              ldp24	q1, [q1]
 f0 69 4c              cmp32	q1, q3
 d0 04                 breq8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
<L21>:
 f4 ad                 inc16	r5
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f4 11                 ldsp16	r5, [sp+0x4]
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 39                    cmp	r6, r5
 f0 30 42              ldsp16	r0, [sp+0x42]
 f0 31 44              ldsp16	r1, [sp+0x44]
 d2 04                 brult8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x3aa
<L22>:
 c2 09                 ldi8	r6, 0x9
 af                    xor	r7, r7
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 f7 63                 add32	q0, q3
 f0 63 00              ldp24	q0, [q0]
 f0 36 26              ldsp16	r6, [sp+0x26]
 f0 37 28              ldsp16	r7, [sp+0x28]
 f7 63                 add32	q0, q3
 f0 36 22              ldsp16	r6, [sp+0x22]
 f0 37 24              ldsp16	r7, [sp+0x24]
 f0 69 c0              cmp32	q3, q0
 f0 32 12              ldsp16	r2, [sp+0x12]
 f0 33 14              ldsp16	r3, [sp+0x14]
 c2 12                 ldi8	r6, 0x12
 af                    xor	r7, r7
 d0 04                 breq8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
<L23>:
 f0 30 36              ldsp16	r0, [sp+0x36]
 f0 31 38              ldsp16	r1, [sp+0x38]
 f0 62 a0              ldp16	r5, [q0]
 f0 3d 2a              stsp16	[sp+0x2a], r5
 f0 30 46              ldsp16	r0, [sp+0x46]
 f0 31 48              ldsp16	r1, [sp+0x48]
 f0 62 a0              ldp16	r5, [q0]
 f0 3d 20              stsp16	[sp+0x20], r5
 f0 30 3a              ldsp16	r0, [sp+0x3a]
 f0 31 3c              ldsp16	r1, [sp+0x3c]
 f0 62 a0              ldp16	r5, [q0]
 f0 30 4a              ldsp16	r0, [sp+0x4a]
 f0 31 4c              ldsp16	r1, [sp+0x4c]
 f0 63 00              ldp24	q0, [q0]
 f0 38 0e              stsp16	[sp+0xe], r0
 f0 39 10              stsp16	[sp+0x10], r1
 f7 6d                 add32	q3, q1
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x501
<L24>:
 f0 30 4a              ldsp16	r0, [sp+0x4a]
 f0 31 4c              ldsp16	r1, [sp+0x4c]
 f0 63 00              ldp24	q0, [q0]
 f7 61                 add32	q0, q1
 f0 69 0c              cmp32	q0, q3
 d8 04                 bruge8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
<L25>:
 f7 73                 sub32	q0, q3
 f0 02 05              ldi8	r2, 0x5
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
<L26>:
 f0 3d 16              stsp16	[sp+0x16], r5
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f0 02 02              ldi8	r2, 0x2
 f2 4b                 sub	r3, r3
 f7 6d                 add32	q3, q1
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 f0 60 cc              ldp8u	r6, [q3]
 06                    mov	r5, r6
 f4 8d                 lsr16.1	r5
 f0 02 01              ldi8	r2, 0x1
 f9 a8                 and	r5, r2
 0e                    mov	r7, r6
 f9 e8                 and	r7, r2
 1d                    add	r7, r5
 06                    mov	r5, r6
 fa 82                 lsr16i	r5, 0x2
 f9 a8                 and	r5, r2
 17                    add	r5, r7
 0d                    mov	r7, r5
 06                    mov	r5, r6
 fa 83                 lsr16i	r5, 0x3
 f9 a8                 and	r5, r2
 17                    add	r5, r7
 15                    add	r5, r5
 c9 05                 addi.s8	r5, 0x5
 f1 15                 mov	r2, r5
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
<L27>:
 c1 70                 ldi8	r5, 0x70
 89                    and	r6, r5
 f4 a6                 tst8	r6
 d0 04                 breq8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
<L28>:
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f0 62 4c              ldp16	r2, [q3]
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c0              cmp32	q3, q0
 d1 04                 brne8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x48e
<L29>:
 f0 62 ac              ldp16	r5, [q3]
 f5 26                 cmp	r5, r2
 d2 04                 brult8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
<L30>:
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x496
 f6 2a                 tst16	r2
 d0 04                 breq8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
<L31>:
 f1 02                 mov	r0, r2
 f2 39                 sub	r1, r1
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 f0 63 4c              ldp24	q1, [q3]
 f7 64                 add32	q1, q0
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 f0 63 0c              ldp24	q0, [q3]
 f0 69 40              cmp32	q1, q0
 d2 04                 brult8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
<L32>:
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 f0 60 ac              ldp8u	r5, [q3]
 0d                    mov	r7, r5
 f4 8f                 lsr16.1	r7
 c2 01                 ldi8	r6, 0x1
 f1 06                 mov	r0, r6
 8e                    and	r7, r6
 0b                    mov	r6, r7
 0d                    mov	r7, r5
 f9 e0                 and	r7, r0
 1e                    add	r7, r6
 0b                    mov	r6, r7
 0d                    mov	r7, r5
 fa a2                 lsr16i	r7, 0x2
 f9 e0                 and	r7, r0
 1e                    add	r7, r6
 fa 83                 lsr16i	r5, 0x3
 f9 a0                 and	r5, r0
 17                    add	r5, r7
 15                    add	r5, r5
 c9 05                 addi.s8	r5, 0x5
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f7 63                 add32	q0, q3
 f0 35 16              ldsp16	r5, [sp+0x16]
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f2 6a                 mov32	q3, q0
 f0 32 12              ldsp16	r2, [sp+0x12]
 f0 33 14              ldsp16	r3, [sp+0x14]
 d0 04                 breq8	0x4 <L33>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x3fc
<L33>:
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x503
 f2 63                 mov32	q0, q3
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f7 69                 add32	q2, q1
 f0 69 08              cmp32	q0, q2
 d0 04                 breq8	0x4 <L34>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x75d
<L34>:
 f0 36 20              ldsp16	r6, [sp+0x20]
 f6 2e                 tst16	r6
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 d1 04                 brne8	0x4 <L35>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x571
<L35>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 36 20              ldsp16	r6, [sp+0x20]
 f4 5a                 stsp16	[sp+0x6], r6
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 d6 fc                 adjsp	-0x4
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 68                 mov32	q2, q0
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
		R_AVM_FAR24	.text.avm_eh_validate_block+0x758
<L36>:
 f2 6b                 mov32	q3, q1
 c0 0c                 ldi8	r4, 0xc
 a5                    xor	r5, r5
 f7 6e                 add32	q3, q2
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 b4                 dec16	r4
 f4 58                 stsp16	[sp+0x6], r4
 f6 2c                 tst16	r4
 f2 69                 mov32	q2, q1
 f2 67                 mov32	q1, q3
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 d0 04                 breq8	0x4 <L37>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x538
<L37>:
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 f6 2c                 tst16	r4
 f0 3e 32              stsp16	[sp+0x32], r6
 f0 3f 34              stsp16	[sp+0x34], r7
 f2 67                 mov32	q1, q3
 a0                    xor	r4, r4
 d1 04                 brne8	0x4 <L38>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x630
<L38>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 f0 30 32              ldsp16	r0, [sp+0x32]
 f0 31 34              ldsp16	r1, [sp+0x34]
 f0 32 12              ldsp16	r2, [sp+0x12]
 f0 33 14              ldsp16	r3, [sp+0x14]
 f0 63 44              ldp24	q1, [q1]
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f0 32 1a              ldsp16	r2, [sp+0x1a]
 f0 33 1c              ldsp16	r3, [sp+0x1c]
 f0 63 44              ldp24	q1, [q1]
 f0 3a 16              stsp16	[sp+0x16], r2
 f0 3b 18              stsp16	[sp+0x18], r3
 f0 63 40              ldp24	q1, [q0]
 f0 3a 06              stsp16	[sp+0x6], r2
 f0 3b 08              stsp16	[sp+0x8], r3
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 c4              cmp32	q3, q1
 d1 04                 brne8	0x4 <L39>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x5d3
<L39>:
 f0 63 cc              ldp24	q3, [q3]
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x5db
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 f0 69 c4              cmp32	q3, q1
 d2 04                 brult8	0x4 <L40>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
<L40>:
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L41>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
<L41>:
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 f0 69 c4              cmp32	q3, q1
 d2 04                 brult8	0x4 <L42>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
<L42>:
 f2 6a                 mov32	q3, q0
 f0 02 03              ldi8	r2, 0x3
 f2 4b                 sub	r3, r3
 f7 6d                 add32	q3, q1
 f0 62 cc              ldp16	r6, [q3]
 c3 ff                 ldi8	r7, 0xff
 3e                    cmp	r7, r6
 d8 04                 bruge8	0x4 <L43>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
<L43>:
 f2 64                 mov32	q1, q0
 c2 05                 ldi8	r6, 0x5
 af                    xor	r7, r7
 f7 67                 add32	q1, q3
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 f2 6a                 mov32	q3, q0
 f2 61                 mov32	q0, q1
 d0 04                 breq8	0x4 <L44>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x590
<L44>:
 f0 34 4a              ldsp16	r4, [sp+0x4a]
 f0 35 4c              ldsp16	r5, [sp+0x4c]
 f0 63 c8              ldp24	q3, [q2]
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f7 6e                 add32	q3, q2
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f0 34 46              ldsp16	r4, [sp+0x46]
 f0 35 48              ldsp16	r5, [sp+0x48]
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
 f0 36 36              ldsp16	r6, [sp+0x36]
 f0 37 38              ldsp16	r7, [sp+0x38]
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
 d0 04                 breq8	0x4 <L45>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x762
<L45>:
 d6 fa                 adjsp	-0x6
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f0 34 26              ldsp16	r4, [sp+0x26]
 f4 40                 stsp16	[sp+0x0], r4
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.pool_ok
 d6 06                 adjsp	0x6
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L46>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x767
<L46>:
 f0 34 32              ldsp16	r4, [sp+0x32]
 f0 35 34              ldsp16	r5, [sp+0x34]
 f0 69 08              cmp32	q0, q2
 a0                    xor	r4, r4
 d8 04                 bruge8	0x4 <L47>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x6fc
<L47>:
 f4 11                 ldsp16	r5, [sp+0x4]
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 39                    cmp	r6, r5
 06                    mov	r5, r6
 f0 30 22              ldsp16	r0, [sp+0x22]
 f0 31 24              ldsp16	r1, [sp+0x24]
 f2 64                 mov32	q1, q0
 f0 36 3e              ldsp16	r6, [sp+0x3e]
 f0 37 40              ldsp16	r7, [sp+0x40]
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 d0 04                 breq8	0x4 <L48>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x120
<L48>:
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x746
 c2 0c                 ldi8	r6, 0xc
 af                    xor	r7, r7
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 f7 63                 add32	q0, q3
 f0 69 04              cmp32	q0, q1
 d2 04                 brult8	0x4 <L49>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x6c5
<L49>:
 f0 38 0e              stsp16	[sp+0xe], r0
 f0 39 10              stsp16	[sp+0x10], r1
 f0 02 09              ldi8	r2, 0x9
 f2 4b                 sub	r3, r3
 f7 61                 add32	q0, q1
 f0 63 00              ldp24	q0, [q0]
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 f0 32 32              ldsp16	r2, [sp+0x32]
 f0 33 34              ldsp16	r3, [sp+0x34]
 d1 04                 brne8	0x4 <L50>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x6e8
<L50>:
 d6 fe                 adjsp	-0x2
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 f4 40                 stsp16	[sp+0x0], r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f2 6b                 mov32	q3, q1
 e3 00 00 00           callf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.site_has_call
 d6 02                 adjsp	0x2
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f1 75                 zext8	r5
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L51>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_FAR24	.text.avm_eh_validate_block+0x6e8
<L51>:
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
 f2 61                 mov32	q0, q1
 f0 34 42              ldsp16	r4, [sp+0x42]
 f0 35 44              ldsp16	r5, [sp+0x44]
 f0 69 08              cmp32	q0, q2
 f8 04                 cset.eq	r4
 d6 4e                 adjsp	0x4e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	avm_eh_validate_block
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_validate_block+0x751

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
		R_AVM_FAR24	.text.pool_ok+0xf7
<L0>:
 f0 32 18              ldsp16	r2, [sp+0x18]
 f0 33 1a              ldsp16	r3, [sp+0x1a]
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 e3 00 00 00           callf	pool_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.list_ok
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	pool_ok
		R_AVM_FAR24	.text.pool_ok+0x21b
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
		R_AVM_FAR24	.text.pool_ok+0x220
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
		R_AVM_FAR24	.text.pool_ok+0xff
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
		R_AVM_FAR24	.text.pool_ok+0x231
<L4>:
 c1 01                 ldi8	r5, 0x1
 f4 00                 ldsp16	r4, [sp+0x0]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	pool_ok
		R_AVM_FAR24	.text.pool_ok+0x22b
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
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 69 c8              cmp32	q3, q2
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	pool_ok
		R_AVM_FAR24	.text.pool_ok+0x230
<L6>:
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 ae                 inc16	r6
 f4 00                 ldsp16	r4, [sp+0x0]
 38                    cmp	r6, r4
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	pool_ok
		R_AVM_FAR24	.text.pool_ok+0x225
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
		R_AVM_FAR24	.text.pool_ok+0x13e
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
		R_AVM_FAR24	.text.pool_ok+0x1ef
<L10>:
 e2 00 00 00           jmpf	pool_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.pool_ok+0x12b
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	pool_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.pool_ok+0x231
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	pool_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.pool_ok+0x231
 c0 01                 ldi8	r4, 0x1
 e2 00 00 00           jmpf	pool_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.pool_ok+0x231
 01                    mov	r4, r5
 e2 00 00 00           jmpf	pool_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.pool_ok+0x231
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
		R_AVM_FAR24	.text.avm_eh_find_handler+0x162
<L0>:
 ed 90 20              ld16	r4, [r0+0]
 f4 11                 ldsp16	r5, [sp+0x4]
 11                    add	r4, r5
 f4 09                 ldsp16	r5, [sp+0x2]
 31                    cmp	r4, r5
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x162
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
		R_AVM_FAR24	.text.avm_eh_find_handler+0x162
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
		R_AVM_FAR24	.text.avm_eh_find_handler+0x162
<L3>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 48              cmp32	q1, q2
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x162
<L4>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x27
<L5>:
 c0 09                 ldi8	r4, 0x9
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 63 c8              ldp24	q3, [q2]
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
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
		R_AVM_FAR24	.text.avm_eh_find_handler+0x162
<L7>:
 f6 2c                 tst16	r4
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_FAR24	.text.avm_eh_find_handler+0x115
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
 c0 05                 ldi8	r4, 0x5
 f4 01                 ldsp16	r5, [sp+0x0]
 ee 8a 37              st8	[r5+23], r4
 e2 00 00 00           jmpf	avm_eh_find_handler
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.avm_eh_find_handler+0x27
 f4 02                 ldsp16	r6, [sp+0x0]
 ca 27                 addi.s8	r6, 0x27
 f0 6b 8c              st32	[r6], q2
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
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
		R_AVM_FAR24	.text.avm_eh_find_handler+0x162
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
		R_AVM_FAR24	.text.avm_eh_find_handler+0x162
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
 d6 e0                 adjsp	-0x20
 f1 0c                 mov	r1, r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 ed 12 51              ld16	r0, [r1+49]
 f6 28                 tst16	r0
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x31b
<L0>:
 f0 39 14              stsp16	[sp+0x14], r1
 f0 09 2b              addi.s8	r1, 0x2b
 f0 6c 53              ld16	r2, [r1+]
 ed 62 20              ld8u	r3, [r1+0]
 c0 0a                 ldi8	r4, 0xa
 a5                    xor	r5, r5
 f0 3a 10              stsp16	[sp+0x10], r2
 f0 3b 12              stsp16	[sp+0x12], r3
 f7 66                 add32	q1, q2
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 38 18              stsp16	[sp+0x18], r0
 f1 20                 mov	r4, r0
 f4 51                 stsp16	[sp+0x4], r5
 21                    sub	r4, r5
 f4 8c                 lsr16.1	r4
 11                    add	r4, r5
 08                    mov	r6, r4
 fa 9e                 lsr16i	r6, 0xe
 04                    mov	r5, r4
 f4 60                 stsp16	[sp+0x8], r4
 15                    add	r5, r5
 15                    add	r5, r5
 f1 15                 mov	r2, r5
 f1 1e                 mov	r3, r6
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f7 67                 add32	q1, q3
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f7 60                 add32	q0, q0
 f7 61                 add32	q0, q1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 63 00              ldp24	q0, [q0]
 04                    mov	r5, r4
 f4 ad                 inc16	r5
 f0 69 c0              cmp32	q3, q0
 f0 30 18              ldsp16	r0, [sp+0x18]
 f4 10                 ldsp16	r4, [sp+0x4]
 fc 2c                 cmov.ult	r5, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 fc 04                 cmov.ult	r0, r4
 f5 24                 cmp	r5, r0
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x36
<L1>:
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0xcf
<L2>:
 f0 3d 18              stsp16	[sp+0x18], r5
 01                    mov	r4, r5
 f4 b4                 dec16	r4
 08                    mov	r6, r4
 fa 9e                 lsr16i	r6, 0xe
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 10                    add	r4, r4
 10                    add	r4, r4
 0e                    mov	r7, r6
 08                    mov	r6, r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f7 6e                 add32	q3, q2
 f7 60                 add32	q0, q0
 f7 63                 add32	q0, q3
 c2 0d                 ldi8	r6, 0xd
 af                    xor	r7, r7
 f7 6c                 add32	q3, q0
 f0 63 4c              ldp24	q1, [q3]
 f0 34 14              ldsp16	r4, [sp+0x14]
 ed 98 51              ld16	r4, [r4+49]
 a5                    xor	r5, r5
 0c                    mov	r7, r4
 fa ae                 lsr16i	r7, 0xe
 08                    mov	r6, r4
 1a                    add	r6, r6
 1a                    add	r6, r6
 f7 6a                 add32	q2, q2
 f7 6b                 add32	q2, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 c0 0a                 ldi8	r4, 0xa
 a5                    xor	r5, r5
 f7 6e                 add32	q3, q2
 f0 69 4c              cmp32	q1, q3
 d2 04                 brult8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0xd5
<L3>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x31b
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x31b
 f0 34 14              ldsp16	r4, [sp+0x14]
 c8 2e                 addi.s8	r4, 0x2e
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f7 7e                 sub32	q3, q2
 f0 69 c4              cmp32	q3, q1
 d2 04                 brult8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0xf8
<L4>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x31b
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f7 67                 add32	q1, q3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f7 7d                 sub32	q3, q1
 c0 12                 ldi8	r4, 0x12
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d2 04                 brult8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x118
<L5>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x31b
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 c0 0a                 ldi8	r4, 0xa
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f2 69                 mov32	q2, q1
 f0 63 40              ldp24	q1, [q0]
 c2 03                 ldi8	r6, 0x3
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f0 63 cc              ldp24	q3, [q3]
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 63 c8              ldp24	q3, [q2]
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 84              cmp32	q2, q1
 d8 04                 bruge8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x223
<L6>:
 f0 69 c4              cmp32	q3, q1
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x319
<L7>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 69 48              cmp32	q1, q2
 f2 66                 mov32	q1, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d2 04                 brult8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x31b
<L8>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c4              cmp32	q3, q1
 d2 04                 brult8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x31b
<L9>:
 f0 34 14              ldsp16	r4, [sp+0x14]
 ed 98 51              ld16	r4, [r4+49]
 f0 35 18              ldsp16	r5, [sp+0x18]
 34                    cmp	r5, r4
 f0 02 06              ldi8	r2, 0x6
 f2 4b                 sub	r3, r3
 d2 04                 brult8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x1ae
<L10>:
 f2 6a                 mov32	q3, q0
 f7 6d                 add32	q3, q1
 f0 63 cc              ldp24	q3, [q3]
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 69 c8              cmp32	q3, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d8 04                 bruge8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x31b
<L11>:
 c2 09                 ldi8	r6, 0x9
 af                    xor	r7, r7
 f7 63                 add32	q0, q3
 f0 63 80              ldp24	q2, [q0]
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f7 6b                 add32	q2, q3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f7 64                 add32	q1, q0
 f0 62 84              ldp16	r4, [q1]
 c2 0c                 ldi8	r6, 0xc
 af                    xor	r7, r7
 f7 6c                 add32	q3, q0
 f0 63 cc              ldp24	q3, [q3]
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 c2 0f                 ldi8	r6, 0xf
 af                    xor	r7, r7
 f7 6c                 add32	q3, q0
 f0 63 cc              ldp24	q3, [q3]
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f6 2c                 tst16	r4
 f2 61                 mov32	q0, q1
 d1 04                 brne8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x20c
<L12>:
 08                    mov	r6, r4
 af                    xor	r7, r7
 fa 7e                 lsr16i	r4, 0xe
 06                    mov	r5, r6
 15                    add	r5, r5
 15                    add	r5, r5
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
 02                    mov	r4, r6
 07                    mov	r5, r7
 f7 66                 add32	q1, q2
 f0 00 12              ldi8	r0, 0x12
 f2 39                 sub	r1, r1
 f7 64                 add32	q1, q0
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 f0 69 04              cmp32	q0, q1
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f2 61                 mov32	q0, q1
 d2 04                 brult8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x229
<L13>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 69 48              cmp32	q1, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f2 6a                 mov32	q3, q0
 fb 34                 cmov.eq	r6, r4
 fb 3d                 cmov.eq	r7, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x31b
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x31b
 0e                    mov	r7, r6
 fa ad                 lsr16i	r7, 0xd
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f1 15                 mov	r2, r5
 f4 82                 lsl16.1	r2
 f4 82                 lsl16.1	r2
 08                    mov	r6, r4
 fa 9e                 lsr16i	r6, 0xe
 f9 c9                 or	r6, r2
 0c                    mov	r7, r4
 1f                    add	r7, r7
 1f                    add	r7, r7
 ab                    xor	r6, r7
 ae                    xor	r7, r6
 ab                    xor	r6, r7
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f7 6d                 add32	q3, q1
 f7 6b                 add32	q2, q3
 c2 12                 ldi8	r6, 0x12
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f0 69 8c              cmp32	q2, q3
 f2 64                 mov32	q1, q0
 d8 04                 bruge8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x20c
<L14>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f0 69 8c              cmp32	q2, q3
 f2 64                 mov32	q1, q0
 d8 04                 bruge8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x20c
<L15>:
 c0 08                 ldi8	r4, 0x8
 a5                    xor	r5, r5
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f7 69                 add32	q2, q1
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 f7 6d                 add32	q3, q1
 f0 62 cc              ldp16	r6, [q3]
 f1 16                 mov	r2, r6
 f2 4b                 sub	r3, r3
 f0 62 88              ldp16	r4, [q2]
 08                    mov	r6, r4
 af                    xor	r7, r7
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 3a 14              stsp16	[sp+0x14], r2
 f0 3b 16              stsp16	[sp+0x16], r3
 f2 69                 mov32	q2, q1
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 69 48              cmp32	q1, q2
 f2 64                 mov32	q1, q0
 d8 04                 bruge8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x20c
<L16>:
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f7 6e                 add32	q3, q2
 f1 17                 mov	r2, r7
 f4 82                 lsl16.1	r2
 f4 82                 lsl16.1	r2
 0e                    mov	r7, r6
 fa ae                 lsr16i	r7, 0xe
 f9 e9                 or	r7, r2
 1a                    add	r6, r6
 1a                    add	r6, r6
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f0 34 10              ldsp16	r4, [sp+0x10]
 08                    mov	r6, r4
 fa 9d                 lsr16i	r6, 0xd
 10                    add	r4, r4
 10                    add	r4, r4
 10                    add	r4, r4
 0e                    mov	r7, r6
 08                    mov	r6, r4
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f7 67                 add32	q1, q3
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f7 66                 add32	q1, q2
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f7 7e                 sub32	q3, q2
 f0 69 c4              cmp32	q3, q1
 f2 64                 mov32	q1, q0
 d8 04                 bruge8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_function
		R_AVM_FAR24	.text.find_function+0x20c
<L17>:
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f7 66                 add32	q1, q2
 e2 00 00 00           jmpf	find_function
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_function+0x20c
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d6 20                 adjsp	0x20
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
 d6 e2                 adjsp	-0x1e
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 c2 03                 ldi8	r6, 0x3
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f0 63 08              ldp24	q0, [q2]
 f0 38 1a              stsp16	[sp+0x1a], r0
 f0 39 1c              stsp16	[sp+0x1c], r1
 f0 63 cc              ldp24	q3, [q3]
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
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
		R_AVM_FAR24	.text.find_row+0x168
<L0>:
 f4 4a                 stsp16	[sp+0x2], r6
 f7 62                 add32	q0, q2
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 c2 12                 ldi8	r6, 0x12
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 a0                    xor	r4, r4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f2 63                 mov32	q0, q3
 f4 50                 stsp16	[sp+0x4], r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 f8 04                 cset.eq	r4
 f4 40                 stsp16	[sp+0x0], r4
 c2 02                 ldi8	r6, 0x2
 af                    xor	r7, r7
 c0 01                 ldi8	r4, 0x1
 f0 32 12              ldsp16	r2, [sp+0x12]
 f0 33 14              ldsp16	r3, [sp+0x14]
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_row
		R_AVM_FAR24	.text.find_row+0x9d
<L1>:
 f1 14                 mov	r2, r4
 f2 68                 mov32	q2, q0
 f7 6b                 add32	q2, q3
 f0 60 88              ldp8u	r4, [q2]
 04                    mov	r5, r4
 f4 8d                 lsr16.1	r5
 f9 a8                 and	r5, r2
 f2 67                 mov32	q1, q3
 08                    mov	r6, r4
 c3 01                 ldi8	r7, 0x1
 8b                    and	r6, r7
 19                    add	r6, r5
 04                    mov	r5, r4
 fa 82                 lsr16i	r5, 0x2
 87                    and	r5, r7
 16                    add	r5, r6
 f4 59                 stsp16	[sp+0x6], r5
 f2 6b                 mov32	q3, q1
 fa 73                 lsr16i	r4, 0x3
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 f4 19                 ldsp16	r5, [sp+0x6]
 11                    add	r4, r5
 10                    add	r4, r4
 c8 05                 addi.s8	r4, 0x5
 f1 14                 mov	r2, r4
 f2 4b                 sub	r3, r3
 f7 64                 add32	q1, q0
 f0 38 06              stsp16	[sp+0x6], r0
 f0 39 08              stsp16	[sp+0x8], r1
 f0 30 16              ldsp16	r0, [sp+0x16]
 f0 31 18              ldsp16	r1, [sp+0x18]
 f0 69 04              cmp32	q0, q1
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_row
		R_AVM_FAR24	.text.find_row+0x16e
<L2>:
 f7 71                 sub32	q0, q1
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_row
		R_AVM_FAR24	.text.find_row+0x178
<L3>:
 f7 6d                 add32	q3, q1
 f0 60 cc              ldp8u	r6, [q3]
 c0 70                 ldi8	r4, 0x70
 82                    and	r4, r6
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_row
		R_AVM_FAR24	.text.find_row+0x18c
<L4>:
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
		R_AVM_FAR24	.text.find_row+0x196
<L5>:
 f0 62 a4              ldp16	r5, [q1]
 f4 00                 ldsp16	r4, [sp+0x0]
 c2 01                 ldi8	r6, 0x1
 82                    and	r4, r6
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_row
		R_AVM_FAR24	.text.find_row+0x110
<L6>:
 f4 10                 ldsp16	r4, [sp+0x4]
 31                    cmp	r4, r5
 d2 04                 brult8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_row
		R_AVM_FAR24	.text.find_row+0x182
<L7>:
 e2 00 00 00           jmpf	find_row
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_row+0x118
 f6 2d                 tst16	r5
 d0 04                 breq8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_row
		R_AVM_FAR24	.text.find_row+0x1a0
<L8>:
 f4 41                 stsp16	[sp+0x0], r5
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 30 1a              ldsp16	r0, [sp+0x1a]
 f0 31 1c              ldsp16	r1, [sp+0x1c]
 f7 68                 add32	q2, q0
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 f0 69 80              cmp32	q2, q0
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 d2 04                 brult8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_row
		R_AVM_FAR24	.text.find_row+0x1a6
<L9>:
 f2 6a                 mov32	q3, q0
 f0 30 0a              ldsp16	r0, [sp+0xa]
 f0 31 0c              ldsp16	r1, [sp+0xc]
 f0 69 08              cmp32	q0, q2
 d8 04                 bruge8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_row
		R_AVM_FAR24	.text.find_row+0x1a6
<L10>:
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 b4                 dec16	r4
 f4 48                 stsp16	[sp+0x2], r4
 f6 2c                 tst16	r4
 f2 61                 mov32	q0, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f2 6b                 mov32	q3, q1
 d0 04                 breq8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	find_row
		R_AVM_FAR24	.text.find_row+0x52
<L11>:
 e2 00 00 00           jmpf	find_row
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_row+0x1a6
 aa                    xor	r6, r6
 af                    xor	r7, r7
 e2 00 00 00           jmpf	find_row
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_row+0x1a6
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 e2 00 00 00           jmpf	find_row
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_row+0x1a6
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 e2 00 00 00           jmpf	find_row
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_row+0x1a6
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 e2 00 00 00           jmpf	find_row
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_row+0x1a6
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 e2 00 00 00           jmpf	find_row
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_row+0x1a6
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 e2 00 00 00           jmpf	find_row
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.find_row+0x1a6
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 02                    mov	r4, r6
 07                    mov	r5, r7
 d6 1e                 adjsp	0x1e
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
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c4              cmp32	q3, q1
 f2 67                 mov32	q1, q3
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0xa7
<L0>:
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f7 63                 add32	q0, q3
 f0 69 04              cmp32	q0, q1
 f2 6a                 mov32	q3, q0
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0xa7
<L1>:
 f7 7d                 sub32	q3, q1
 f0 00 03              ldi8	r0, 0x3
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0xa7
<L2>:
 f0 60 84              ldp8u	r4, [q1]
 cc 02                 cmpi.s8	r4, 0x2
 d8 04                 bruge8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0xaf
<L3>:
 01                    mov	r4, r5
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f7 6d                 add32	q3, q1
 f0 62 ec              ldp16	r7, [q3]
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0xd0
<L4>:
 f6 2f                 tst16	r7
 d0 04                 breq8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0xd0
<L5>:
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	list_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.list_ok+0xa8
 f0 3c 10              stsp16	[sp+0x10], r4
 0b                    mov	r6, r7
 fa 9e                 lsr16i	r6, 0xe
 03                    mov	r4, r7
 a5                    xor	r5, r5
 1f                    add	r7, r7
 1f                    add	r7, r7
 ab                    xor	r6, r7
 ae                    xor	r7, r6
 ab                    xor	r6, r7
 f7 6b                 add32	q2, q3
 c6 fd ff              ldi16	r6, 0xfffd
 c7 ff ff              ldi16	r7, 0xffff
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f7 63                 add32	q0, q3
 f0 69 08              cmp32	q0, q2
 d2 04                 brult8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0xfb
<L6>:
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	list_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.list_ok+0xa8
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 69 8c              cmp32	q2, q3
 d1 04                 brne8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0x1a5
<L7>:
 f2 61                 mov32	q0, q1
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 68                 add32	q2, q0
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f2 64                 mov32	q1, q0
 c2 02                 ldi8	r6, 0x2
 af                    xor	r7, r7
 f7 6d                 add32	q3, q1
 f0 62 84              ldp16	r4, [q1]
 f0 63 cc              ldp24	q3, [q3]
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0x1b5
<L8>:
 f4 70                 stsp16	[sp+0xc], r4
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f2 61                 mov32	q0, q1
 f7 62                 add32	q0, q2
 a0                    xor	r4, r4
 f0 69 c8              cmp32	q3, q2
 f8 04                 cset.eq	r4
 f4 50                 stsp16	[sp+0x4], r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 69 08              cmp32	q0, q2
 f8 0d                 cset.ne	r5
 f4 10                 ldsp16	r4, [sp+0x4]
 84                    and	r5, r4
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0x1ba
<L9>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 c2 ff                 ldi8	r6, 0xff
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0x1bf
<L10>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c4              cmp32	q3, q1
 d1 04                 brne8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0x198
<L11>:
 f0 62 ac              ldp16	r5, [q3]
 f4 30                 ldsp16	r4, [sp+0xc]
 34                    cmp	r5, r4
 d1 04                 brne8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0x1b0
<L12>:
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f7 6e                 add32	q3, q2
 f0 69 c4              cmp32	q3, q1
 d0 04                 breq8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0x17e
<L13>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 69 08              cmp32	q0, q2
 d0 04                 breq8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	list_ok
		R_AVM_FAR24	.text.list_ok+0x121
<L14>:
 c5 80 ff              ldi16	r5, 0xff80
 f0 34 10              ldsp16	r4, [sp+0x10]
 91                    or	r4, r5
 e2 00 00 00           jmpf	list_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.list_ok+0xa8
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	list_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.list_ok+0xa8
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	list_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.list_ok+0xa8
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	list_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.list_ok+0xa8
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	list_ok
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.list_ok+0xa8

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
 d6 f6                 adjsp	-0xa
 f2 67                 mov32	q1, q3
 f0 36 15              ldsp16	r6, [sp+0x15]
 f4 62                 stsp16	[sp+0x8], r6
 f2 6b                 mov32	q3, q1
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
		R_AVM_FAR24	.text.match_list+0xc4
<L0>:
 f4 42                 stsp16	[sp+0x0], r6
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
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 69 0c              cmp32	q0, q3
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0x58
<L1>:
 c0 01                 ldi8	r4, 0x1
 f4 01                 ldsp16	r5, [sp+0x0]
 84                    and	r5, r4
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	match_list
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_list+0xc4
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f0 62 c0              ldp16	r6, [q0]
 f4 4a                 stsp16	[sp+0x2], r6
 f0 63 88              ldp24	q2, [q2]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 f4 22                 ldsp16	r6, [sp+0x8]
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0xb1
<L2>:
 0e                    mov	r7, r6
 cb 0f                 addi.s8	r7, 0xf
 f7 3a                 ld16	r2, [r7+]
 f5 3f                 ld8u	r3, [r7]
 f0 69 84              cmp32	q2, q1
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0xb1
<L3>:
 e3 00 00 00           callf	match_list
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base
 f1 74                 zext8	r4
 08                    mov	r6, r4
 ca fd                 addi.s8	r6, -0x3
 ce 02                 cmpi.s8	r6, 0x2
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0xb8
<L4>:
 cc 01                 cmpi.s8	r4, 0x1
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0xc2
<L5>:
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 69 08              cmp32	q0, q2
 d0 04                 breq8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_list
		R_AVM_FAR24	.text.match_list+0x58
<L6>:
 e2 00 00 00           jmpf	match_list
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_list+0x4e
 f4 08                 ldsp16	r4, [sp+0x2]
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_list
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_list+0xc4
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 e2 00 00 00           jmpf	match_list
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_list+0xc4
 f4 08                 ldsp16	r4, [sp+0x2]
 d6 0a                 adjsp	0xa
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
 d6 b6                 adjsp	-0x4a
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 72                 stsp16	[sp+0xc], r6
 ca 0f                 addi.s8	r6, 0xf
 f7 32                 ld16	r2, [r6+]
 f5 3b                 ld8u	r3, [r6]
 f0 00 09              ldi8	r0, 0x9
 f0 05 00 ff           ldi16	r1, 0xff00
 f2 6b                 mov32	q3, q1
 f7 6c                 add32	q3, q0
 f0 04 09 01           ldi16	r0, 0x109
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x8d
<L0>:
 f0 00 06              ldi8	r0, 0x6
 f2 39                 sub	r1, r1
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__class_type_info
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__class_type_info
 f7 6c                 add32	q3, q0
 f0 63 44              ldp24	q1, [q1]
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f0 3f 1c              stsp16	[sp+0x1c], r7
 f0 69 4c              cmp32	q1, q3
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x6c
<L1>:
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__si_class_type_info
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__si_class_type_info
 f7 6c                 add32	q3, q0
 f0 69 4c              cmp32	q1, q3
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x6c
<L2>:
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__vmi_class_type_info
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__vmi_class_type_info
 f7 6c                 add32	q3, q0
 f0 69 4c              cmp32	q1, q3
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x8d
<L3>:
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f0 35 20              ldsp16	r5, [sp+0x20]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 00 09              ldi8	r0, 0x9
 f0 05 00 ff           ldi16	r1, 0xff00
 f7 6c                 add32	q3, q0
 f0 04 09 01           ldi16	r0, 0x109
 f0 69 c0              cmp32	q3, q0
 d2 04                 brult8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x94
<L4>:
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 d6 4a                 adjsp	0x4a
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__si_class_type_info
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__si_class_type_info
 c2 06                 ldi8	r6, 0x6
 af                    xor	r7, r7
 f7 63                 add32	q0, q3
 f0 38 22              stsp16	[sp+0x22], r0
 f0 39 24              stsp16	[sp+0x24], r1
 f0 63 48              ldp24	q1, [q2]
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 f0 69 4c              cmp32	q1, q3
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0xdf
<L5>:
 f0 36 22              ldsp16	r6, [sp+0x22]
 f0 37 24              ldsp16	r7, [sp+0x24]
 f0 69 4c              cmp32	q1, q3
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0xdf
<L6>:
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__vmi_class_type_info
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__vmi_class_type_info
 f0 00 06              ldi8	r0, 0x6
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f0 69 4c              cmp32	q1, q3
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x8d
<L7>:
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	vtable for __cxxabiv1::__vmi_class_type_info
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	vtable for __cxxabiv1::__vmi_class_type_info
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f7 6e                 add32	q3, q2
 f0 3e 3e              stsp16	[sp+0x3e], r6
 f0 3f 40              stsp16	[sp+0x40], r7
 f0 2d 42              stsp8	[sp+0x42], r5
 f4 30                 ldsp16	r4, [sp+0xc]
 c8 33                 addi.s8	r4, 0x33
 af                    xor	r7, r7
 f0 04 ff ff           ldi16	r0, 0xffff
 f2 39                 sub	r1, r1
 f0 3c 26              stsp16	[sp+0x26], r4
 f0 3f 28              stsp16	[sp+0x28], r7
 f9 12                 xor	r0, r4
 f0 38 2c              stsp16	[sp+0x2c], r0
 f0 39 2e              stsp16	[sp+0x2e], r1
 f0 3d 3c              stsp16	[sp+0x3c], r5
 f0 3d 38              stsp16	[sp+0x38], r5
 f0 3d 36              stsp16	[sp+0x36], r5
 f0 3d 3a              stsp16	[sp+0x3a], r5
 09                    mov	r6, r5
 f1 76                 zext8	r6
 f4 30                 ldsp16	r4, [sp+0xc]
 c8 0f                 addi.s8	r4, 0xf
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 f4 a5                 tst8	r5
 f0 3d 30              stsp16	[sp+0x30], r5
 f0 3e 32              stsp16	[sp+0x32], r6
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x2f4
<L8>:
 c0 02                 ldi8	r4, 0x2
 f0 3c 2a              stsp16	[sp+0x2a], r4
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c0 01                 ldi8	r4, 0x1
 f0 17 42              leasp	r7, 0x42
 f4 53                 stsp16	[sp+0x4], r7
 f1 75                 zext8	r5
 f0 3d 34              stsp16	[sp+0x34], r5
 e2 00 00 00           jmpf	match_class_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base+0x18f
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f7 66                 add32	q1, q2
 f0 63 44              ldp24	q1, [q1]
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 32                 ldsp16	r6, [sp+0xc]
 ed 1c 35              ld16	r0, [r6+21]
 f0 36 2a              ldsp16	r6, [sp+0x2a]
 f4 5a                 stsp16	[sp+0x6], r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f7 6b                 add32	q2, q3
 f2 39                 sub	r1, r1
 f4 40                 stsp16	[sp+0x0], r4
 f0 69 80              cmp32	q2, q0
 d2 04                 brult8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x5ed
<L9>:
 f4 19                 ldsp16	r5, [sp+0x6]
 fa 46                 lsl16i	r5, 0x6
 f6 45                 sext8	r5
 fa c7                 asr16i	r5, 0x7
 f0 34 12              ldsp16	r4, [sp+0x12]
 81                    and	r4, r5
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 ad                 inc16	r5
 f4 51                 stsp16	[sp+0x4], r5
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x2ff
<L10>:
 f4 6a                 stsp16	[sp+0xa], r6
 f0 3c 12              stsp16	[sp+0x12], r4
 f2 6b                 mov32	q3, q1
 f0 00 09              ldi8	r0, 0x9
 f0 05 00 ff           ldi16	r1, 0xff00
 f7 6c                 add32	q3, q0
 f0 04 09 01           ldi16	r0, 0x109
 f0 69 c0              cmp32	q3, q0
 a5                    xor	r5, r5
 f4 49                 stsp16	[sp+0x2], r5
 d2 04                 brult8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x2cf
<L11>:
 f4 10                 ldsp16	r4, [sp+0x4]
 40                    ld8u	r4, [r4]
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
 f0 63 08              ldp24	q0, [q2]
 f0 38 06              stsp16	[sp+0x6], r0
 f0 39 08              stsp16	[sp+0x8], r1
 f2 6a                 mov32	q3, q0
 a0                    xor	r4, r4
 c1 80                 ldi8	r5, 0x80
 88                    and	r6, r4
 8d                    and	r7, r5
 f2 68                 mov32	q2, q0
 f2 61                 mov32	q0, q1
 f2 42                 sub	r2, r2
 f0 07 00 ff           ldi16	r3, 0xff00
 f7 69                 add32	q2, q1
 f2 4b                 sub	r3, r3
 f0 69 c4              cmp32	q3, q1
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 fb 26                 cmov.eq	r4, r6
 fb 2f                 cmov.eq	r5, r7
 f2 6a                 mov32	q3, q0
 f0 02 0a              ldi8	r2, 0xa
 f7 6d                 add32	q3, q1
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 02 0d              ldi8	r2, 0xd
 f7 61                 add32	q0, q1
 f0 60 c0              ldp8u	r6, [q0]
 f4 5a                 stsp16	[sp+0x6], r6
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 63 4c              ldp24	q1, [q3]
 c3 01                 ldi8	r7, 0x1
 f4 1a                 ldsp16	r6, [sp+0x6]
 8e                    and	r7, r6
 f4 32                 ldsp16	r6, [sp+0xc]
 ed 1c 35              ld16	r0, [r6+21]
 f4 a7                 tst8	r7
 d1 04                 brne8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x15e
<L12>:
 f0 3a 0e              stsp16	[sp+0xe], r2
 f0 3b 10              stsp16	[sp+0x10], r3
 c2 03                 ldi8	r6, 0x3
 af                    xor	r7, r7
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f0 38 16              stsp16	[sp+0x16], r0
 f2 61                 mov32	q0, q1
 f7 63                 add32	q0, q3
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x5f4
<L13>:
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 3f 18              stsp16	[sp+0x18], r7
 f0 36 26              ldsp16	r6, [sp+0x26]
 f0 37 28              ldsp16	r7, [sp+0x28]
 f7 67                 add32	q1, q3
 c6 fd ff              ldi16	r6, 0xfffd
 af                    xor	r7, r7
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L14>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x5fb
<L14>:
 f0 6c 15              ld16	r0, [r2+]
 ed 24 20              ld8u	r1, [r2+0]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 d1 04                 brne8	0x4 <L15>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x602
<L15>:
 f7 62                 add32	q0, q2
 c4 fd ff              ldi16	r4, 0xfffd
 c1 ff                 ldi8	r5, 0xff
 f0 69 80              cmp32	q2, q0
 d8 04                 bruge8	0x4 <L16>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x609
<L16>:
 f0 63 00              ldp24	q0, [q0]
 f2 64                 mov32	q1, q0
 a0                    xor	r4, r4
 c1 80                 ldi8	r5, 0x80
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 f2 68                 mov32	q2, q0
 aa                    xor	r6, r6
 c7 00 ff              ldi16	r7, 0xff00
 f7 6b                 add32	q2, q3
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f7 6b                 add32	q2, q3
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f0 69 8c              cmp32	q2, q3
 d2 04                 brult8	0x4 <L17>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x610
<L17>:
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 f0 3c 00              stsp16	[sp+0x0], r4
 f0 39 02              stsp16	[sp+0x2], r1
 f0 69 c8              cmp32	q3, q2
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 d2 04                 brult8	0x4 <L18>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x171
<L18>:
 e2 00 00 00           jmpf	match_class_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base+0x8d
 f0 63 84              ldp24	q2, [q1]
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 f0 69 8c              cmp32	q2, q3
 d1 04                 brne8	0x4 <L19>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x1af
<L19>:
 f0 36 22              ldsp16	r6, [sp+0x22]
 f0 37 24              ldsp16	r7, [sp+0x24]
 f0 69 8c              cmp32	q2, q3
 d1 04                 brne8	0x4 <L20>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x14a
<L20>:
 e2 00 00 00           jmpf	match_class_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base+0x1af
 a5                    xor	r5, r5
 f4 41                 stsp16	[sp+0x0], r5
 f4 49                 stsp16	[sp+0x2], r5
 f4 51                 stsp16	[sp+0x4], r5
 e2 00 00 00           jmpf	match_class_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base+0x308
 f4 a4                 tst8	r4
 f8 05                 cset.eq	r5
 f4 51                 stsp16	[sp+0x4], r5
 f0 35 34              ldsp16	r5, [sp+0x34]
 f2 6b                 mov32	q3, q1
 f2 61                 mov32	q0, q1
 f0 02 09              ldi8	r2, 0x9
 f0 07 00 ff           ldi16	r3, 0xff00
 f7 6d                 add32	q3, q1
 f0 06 09 01           ldi16	r2, 0x109
 f0 69 c4              cmp32	q3, q1
 d8 04                 bruge8	0x4 <L21>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x3c2
<L21>:
 f0 63 c0              ldp24	q3, [q0]
 f0 32 1a              ldsp16	r2, [sp+0x1a]
 f0 33 1c              ldsp16	r3, [sp+0x1c]
 f0 69 c4              cmp32	q3, q1
 d1 04                 brne8	0x4 <L22>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x3c2
<L22>:
 f0 38 0e              stsp16	[sp+0xe], r0
 f0 39 10              stsp16	[sp+0x10], r1
 f0 32 22              ldsp16	r2, [sp+0x22]
 f0 33 24              ldsp16	r3, [sp+0x24]
 f0 69 c4              cmp32	q3, q1
 d0 04                 breq8	0x4 <L23>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x360
<L23>:
 f0 16 42              leasp	r6, 0x42
 19                    add	r6, r5
 46                    ld8u	r5, [r6]
 f4 a5                 tst8	r5
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 d1 04                 brne8	0x4 <L24>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x3d8
<L24>:
 e2 00 00 00           jmpf	match_class_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base+0x3c2
 f0 32 3e              ldsp16	r2, [sp+0x3e]
 f0 33 40              ldsp16	r3, [sp+0x40]
 f0 69 c4              cmp32	q3, q1
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 d0 04                 breq8	0x4 <L25>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x3c2
<L25>:
 c2 08                 ldi8	r6, 0x8
 af                    xor	r7, r7
 f7 6c                 add32	q3, q0
 f0 62 cc              ldp16	r6, [q3]
 ce 21                 cmpi.s8	r6, 0x21
 d2 04                 brult8	0x4 <L26>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x640
<L26>:
 f0 3d 34              stsp16	[sp+0x34], r5
 06                    mov	r5, r6
 fa 8d                 lsr16i	r5, 0xd
 0e                    mov	r7, r6
 1f                    add	r7, r7
 1f                    add	r7, r7
 1f                    add	r7, r7
 f1 17                 mov	r2, r7
 f1 1d                 mov	r3, r5
 f1 06                 mov	r0, r6
 f2 39                 sub	r1, r1
 f7 71                 sub32	q0, q1
 f0 06 f6 ff           ldi16	r2, 0xfff6
 f0 03 ff              ldi8	r3, 0xff
 f7 64                 add32	q1, q0
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 f0 69 40              cmp32	q1, q0
 f2 64                 mov32	q1, q0
 d8 04                 bruge8	0x4 <L27>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x647
<L27>:
 f0 17 42              leasp	r7, 0x42
 f0 35 34              ldsp16	r5, [sp+0x34]
 1d                    add	r7, r5
 47                    ld8u	r5, [r7]
 36                    cmp	r5, r6
 d8 04                 bruge8	0x4 <L28>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x3f0
<L28>:
 f0 35 30              ldsp16	r5, [sp+0x30]
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L29>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x617
<L29>:
 f0 36 32              ldsp16	r6, [sp+0x32]
 f4 b6                 dec16	r6
 f4 b5                 dec16	r5
 e2 00 00 00           jmpf	match_class_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base+0x11a
 c1 01                 ldi8	r5, 0x1
 59                    st8	[r6], r5
 c2 06                 ldi8	r6, 0x6
 af                    xor	r7, r7
 f7 63                 add32	q0, q3
 f0 63 80              ldp24	q2, [q0]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f0 02 02              ldi8	r2, 0x2
 e2 00 00 00           jmpf	match_class_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base+0x44c
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 f4 ad                 inc16	r5
 5d                    st8	[r7], r5
 f2 6a                 mov32	q3, q0
 f4 80                 lsl16.1	r0
 f4 80                 lsl16.1	r0
 f4 80                 lsl16.1	r0
 f7 73                 sub32	q0, q3
 f7 64                 add32	q1, q0
 c2 0e                 ldi8	r6, 0xe
 af                    xor	r7, r7
 f7 6d                 add32	q3, q1
 f0 63 0c              ldp24	q0, [q3]
 f0 38 06              stsp16	[sp+0x6], r0
 f0 39 08              stsp16	[sp+0x8], r1
 aa                    xor	r6, r6
 c3 80                 ldi8	r7, 0x80
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 c7 00 ff              ldi16	r7, 0xff00
 f7 6b                 add32	q2, q3
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 fb 26                 cmov.eq	r4, r6
 fb 2f                 cmov.eq	r5, r7
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 f7 6d                 add32	q3, q1
 f0 00 0d              ldi8	r0, 0xd
 f2 39                 sub	r1, r1
 f7 64                 add32	q1, q0
 f0 60 44              ldp8u	r2, [q1]
 f0 63 8c              ldp24	q2, [q3]
 f0 0e 04              cmpi.s8	r2, 0x4
 d2 04                 brult8	0x4 <L30>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x671
<L30>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 00 09              ldi8	r0, 0x9
 f0 05 00 ff           ldi16	r1, 0xff00
 f7 6c                 add32	q3, q0
 f0 04 09 01           ldi16	r0, 0x109
 f0 69 c0              cmp32	q3, q0
 d8 04                 bruge8	0x4 <L31>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x64e
<L31>:
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 63 c8              ldp24	q3, [q2]
 f0 30 1a              ldsp16	r0, [sp+0x1a]
 f0 31 1c              ldsp16	r1, [sp+0x1c]
 f0 69 c0              cmp32	q3, q0
 d1 04                 brne8	0x4 <L32>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x49a
<L32>:
 f0 30 22              ldsp16	r0, [sp+0x22]
 f0 31 24              ldsp16	r1, [sp+0x24]
 f0 69 c0              cmp32	q3, q0
 d1 04                 brne8	0x4 <L33>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x49a
<L33>:
 f0 30 3e              ldsp16	r0, [sp+0x3e]
 f0 31 40              ldsp16	r1, [sp+0x40]
 f0 69 c0              cmp32	q3, q0
 d0 04                 breq8	0x4 <L34>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x655
<L34>:
 c0 04                 ldi8	r4, 0x4
 a5                    xor	r5, r5
 f0 36 3c              ldsp16	r6, [sp+0x3c]
 f4 ae                 inc16	r6
 c7 00 02              ldi16	r7, 0x200
 f0 3e 3c              stsp16	[sp+0x3c], r6
 3e                    cmp	r7, r6
 d8 04                 bruge8	0x4 <L35>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x8d
<L35>:
 f0 36 30              ldsp16	r6, [sp+0x30]
 f1 76                 zext8	r6
 ce 07                 cmpi.s8	r6, 0x7
 d2 04                 brult8	0x4 <L36>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x8d
<L36>:
 c0 01                 ldi8	r4, 0x1
 f0 3a 0a              stsp16	[sp+0xa], r2
 f1 26                 mov	r5, r2
 84                    and	r5, r4
 f4 02                 ldsp16	r6, [sp+0x0]
 f1 06                 mov	r0, r6
 f2 39                 sub	r1, r1
 f4 30                 ldsp16	r4, [sp+0xc]
 ed 98 35              ld16	r4, [r4+21]
 f1 14                 mov	r2, r4
 f2 4b                 sub	r3, r3
 f4 a5                 tst8	r5
 d0 04                 breq8	0x4 <L37>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x4f6
<L37>:
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f7 68                 add32	q2, q0
 f0 69 84              cmp32	q2, q1
 f1 14                 mov	r2, r4
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f0 33 0a              ldsp16	r3, [sp+0xa]
 d2 04                 brult8	0x4 <L38>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x8d
<L38>:
 e2 00 00 00           jmpf	match_class_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base+0x590
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f2 6a                 mov32	q3, q0
 f7 6e                 add32	q3, q2
 f0 69 4c              cmp32	q1, q3
 d8 04                 bruge8	0x4 <L39>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x8d
<L39>:
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f0 38 0e              stsp16	[sp+0xe], r0
 f0 39 10              stsp16	[sp+0x10], r1
 f2 68                 mov32	q2, q0
 f0 36 26              ldsp16	r6, [sp+0x26]
 f0 37 28              ldsp16	r7, [sp+0x28]
 f7 6b                 add32	q2, q3
 c6 fd ff              ldi16	r6, 0xfffd
 af                    xor	r7, r7
 f0 69 c8              cmp32	q3, q2
 d8 04                 bruge8	0x4 <L40>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x65c
<L40>:
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 f2 30                 sub	r0, r0
 f0 05 00 ff           ldi16	r1, 0xff00
 d1 04                 brne8	0x4 <L41>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x663
<L41>:
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f7 6e                 add32	q3, q2
 c4 fd ff              ldi16	r4, 0xfffd
 c1 ff                 ldi8	r5, 0xff
 f0 69 8c              cmp32	q2, q3
 d8 04                 bruge8	0x4 <L42>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x66a
<L42>:
 f0 63 8c              ldp24	q2, [q3]
 aa                    xor	r6, r6
 c3 80                 ldi8	r7, 0x80
 8d                    and	r7, r5
 f7 62                 add32	q0, q2
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 c4              cmp32	q3, q1
 fb 04                 cmov.eq	r0, r4
 fb 0d                 cmov.eq	r1, r5
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f7 62                 add32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 08              cmp32	q0, q2
 d2 04                 brult8	0x4 <L43>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x678
<L43>:
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 f0 35 2e              ldsp16	r5, [sp+0x2e]
 f1 10                 mov	r2, r0
 f0 69 80              cmp32	q2, q0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f0 33 0a              ldsp16	r3, [sp+0xa]
 d8 04                 bruge8	0x4 <L44>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x8d
<L44>:
 f4 8b                 lsr16.1	r3
 a0                    xor	r4, r4
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 a5                 tst8	r5
 fb 5c                 cmov.ne	r3, r4
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f0 37 20              ldsp16	r7, [sp+0x20]
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 f0 69 0c              cmp32	q0, q3
 d0 04                 breq8	0x4 <L45>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x5db
<L45>:
 f0 37 36              ldsp16	r7, [sp+0x36]
 f4 a7                 tst8	r7
 d1 04                 brne8	0x4 <L46>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x5d0
<L46>:
 c1 02                 ldi8	r5, 0x2
 f0 36 3a              ldsp16	r6, [sp+0x3a]
 f5 16                 cmp	r2, r6
 fb 2f                 cmov.eq	r5, r7
 08                    mov	r6, r4
 fb 33                 cmov.eq	r6, r3
 f0 37 38              ldsp16	r7, [sp+0x38]
 9e                    or	r7, r6
 f0 3f 38              stsp16	[sp+0x38], r7
 e2 00 00 00           jmpf	match_class_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base+0x5d8
 f0 3a 3a              stsp16	[sp+0x3a], r2
 f0 3b 38              stsp16	[sp+0x38], r3
 c1 01                 ldi8	r5, 0x1
 f0 3d 36              stsp16	[sp+0x36], r5
 f0 37 30              ldsp16	r7, [sp+0x30]
 f4 af                 inc16	r7
 07                    mov	r5, r7
 f1 75                 zext8	r5
 f0 16 42              leasp	r6, 0x42
 19                    add	r6, r5
 07                    mov	r5, r7
 58                    st8	[r6], r4
 e2 00 00 00           jmpf	match_class_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base+0x117
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_class_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base+0x8d
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_class_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base+0x8d
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_class_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base+0x8d
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_class_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base+0x8d
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_class_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base+0x8d
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_class_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base+0x8d
 f0 34 36              ldsp16	r4, [sp+0x36]
 f1 74                 zext8	r4
 cc 01                 cmpi.s8	r4, 0x1
 d0 04                 breq8	0x4 <L47>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x63a
<L47>:
 f0 34 38              ldsp16	r4, [sp+0x38]
 f4 a4                 tst8	r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d1 04                 brne8	0x4 <L48>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	match_class_base
		R_AVM_FAR24	.text.match_class_base+0x8d
<L48>:
 c0 01                 ldi8	r4, 0x1
 f0 35 3a              ldsp16	r5, [sp+0x3a]
 e2 00 00 00           jmpf	match_class_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base+0x8d
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_class_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base+0x8d
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_class_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base+0x8d
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_class_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base+0x8d
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_class_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base+0x8d
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_class_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base+0x8d
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_class_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base+0x8d
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_class_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base+0x8d
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_class_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base+0x8d
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_class_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base+0x8d
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e2 00 00 00           jmpf	match_class_base
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.match_class_base+0x8d

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
