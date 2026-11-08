
libcxx_new_handler.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 new_handler.cpp
00000000 l    d  .text._ZSt15set_new_handlerPFvvE	00000000 .text._ZSt15set_new_handlerPFvvE
00000000 l     O .data._ZL13__new_handler	00000003 __new_handler
00000000 l    d  .text._ZSt15get_new_handlerv	00000000 .text._ZSt15get_new_handlerv
00000000 l    d  .data._ZL13__new_handler	00000000 .data._ZL13__new_handler
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 g     F .text._ZSt15set_new_handlerPFvvE	00000019 std::set_new_handler(void (*)())
00000000 g     F .text._ZSt15get_new_handlerv	00000007 std::get_new_handler()

Disassembly of section .text._ZSt15set_new_handlerPFvvE:

<std::set_new_handler(void (*)())>:
 b3                    push16	r3
 b2                    push16	r2
 b0                    push16	r0
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_DATA16	.data._ZL13__new_handler
 f1 28                 mov	r6, r0
 f7 32                 ld16	r2, [r6+]
 f5 3b                 ld8u	r3, [r6]
 f0 6d 91              st16	[r0+], r4
 ee a0 20              st8	[r0+0], r5
 f2 69                 mov32	q2, q1
 b8                    pop16	r0
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text._ZSt15get_new_handlerv:

<std::get_new_handler()>:
 c6 00 00              ldi16	r6, 0x0
		R_AVM_DATA16	.data._ZL13__new_handler
 f7 34                 ld16	r4, [r6+]
 46                    ld8u	r5, [r6]
 ef                    ret
