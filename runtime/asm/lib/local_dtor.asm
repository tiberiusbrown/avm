
local_dtor.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 local_dtor.c
00000000 l    d  .text.__avm_register_local_dtor	00000000 .text.__avm_register_local_dtor
00000000 l     O .data.next_slot	00000002 next_slot
00000000 l     O .data.global_phase	00000002 global_phase
00000000 l    d  .text.__avm_note_global_ctor	00000000 .text.__avm_note_global_ctor
00000000 l    d  .text.__avm_run_local_dtors	00000000 .text.__avm_run_local_dtors
00000000 l    d  .text.__avm_before_global_dtor	00000000 .text.__avm_before_global_dtor
00000000 l    d  .data.next_slot	00000000 .data.next_slot
00000000 l    d  .data.global_phase	00000000 .data.global_phase
00000000 g     F .text.__avm_register_local_dtor	00000024 __avm_register_local_dtor
00000000         *UND*	00000000 __avm_local_dtor_slots_end
00000000         *UND*	00000000 avm_halt
00000000 g     F .text.__avm_note_global_ctor	0000000b __avm_note_global_ctor
00000000 g     F .text.__avm_run_local_dtors	00000039 __avm_run_local_dtors
00000000         *UND*	00000000 __avm_local_dtor_slots_start
00000000 g     F .text.__avm_before_global_dtor	0000004b __avm_before_global_dtor

Disassembly of section .text.__avm_register_local_dtor:

<__avm_register_local_dtor>:
 f0 56 00 00           ldm16	r6, [0x0]
		R_AVM_DATA16	.data.next_slot
 c7 00 00              ldi16	r7, 0x0
		R_AVM_DATA16	__avm_local_dtor_slots_end
 3b                    cmp	r6, r7
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_register_local_dtor
		R_AVM_FAR24	.text.__avm_register_local_dtor+0x20
<L0>:
 0e                    mov	r7, r6
 f7 5c                 st16	[r7+], r4
 5d                    st8	[r7], r5
 f0 54 00 00           ldm16	r4, [0x0]
		R_AVM_DATA16	.data.global_phase
 ee 9c 23              st16	[r6+3], r4
 ca 05                 addi.s8	r6, 0x5
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	.data.next_slot
 ef                    ret
 e3 00 00 00           callf	__avm_register_local_dtor
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_halt

Disassembly of section .text.__avm_note_global_ctor:

<__avm_note_global_ctor>:
 f0 54 00 00           ldm16	r4, [0x0]
		R_AVM_DATA16	.data.global_phase
 f4 ac                 inc16	r4
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	.data.global_phase
 ef                    ret

Disassembly of section .text.__avm_run_local_dtors:

<__avm_run_local_dtors>:
 b0                    push16	r0
 f0 54 00 00           ldm16	r4, [0x0]
		R_AVM_DATA16	.data.next_slot
 c5 00 00              ldi16	r5, 0x0
		R_AVM_DATA16	__avm_local_dtor_slots_start
 31                    cmp	r4, r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_run_local_dtors
		R_AVM_FAR24	.text.__avm_run_local_dtors+0x37
<L0>:
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_DATA16	__avm_local_dtor_slots_start
 ed b8 1e              ld16	r5, [r4-2]
 f0 56 00 00           ldm16	r6, [0x0]
		R_AVM_DATA16	.data.global_phase
 36                    cmp	r5, r6
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_run_local_dtors
		R_AVM_FAR24	.text.__avm_run_local_dtors+0x37
<L1>:
 c8 fb                 addi.s8	r4, -0x5
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	.data.next_slot
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 eb                    callp	q3
 f0 54 00 00           ldm16	r4, [0x0]
		R_AVM_DATA16	.data.next_slot
 f5 20                 cmp	r4, r0
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_run_local_dtors
		R_AVM_FAR24	.text.__avm_run_local_dtors+0x13
<L2>:
 b8                    pop16	r0
 ef                    ret

Disassembly of section .text.__avm_before_global_dtor:

<__avm_before_global_dtor>:
 b0                    push16	r0
 f0 54 00 00           ldm16	r4, [0x0]
		R_AVM_DATA16	.data.next_slot
 c5 00 00              ldi16	r5, 0x0
		R_AVM_DATA16	__avm_local_dtor_slots_start
 31                    cmp	r4, r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_before_global_dtor
		R_AVM_FAR24	.text.__avm_before_global_dtor+0x37
<L0>:
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_DATA16	__avm_local_dtor_slots_start
 ed d8 1e              ld16	r6, [r4-2]
 f0 55 00 00           ldm16	r5, [0x0]
		R_AVM_DATA16	.data.global_phase
 39                    cmp	r6, r5
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_before_global_dtor
		R_AVM_FAR24	.text.__avm_before_global_dtor+0x3b
<L1>:
 c8 fb                 addi.s8	r4, -0x5
 f0 5c 00 00           stm16	[0x0], r4
		R_AVM_DATA16	.data.next_slot
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 eb                    callp	q3
 f0 54 00 00           ldm16	r4, [0x0]
		R_AVM_DATA16	.data.next_slot
 f5 20                 cmp	r4, r0
 d0 04                 breq8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_before_global_dtor
		R_AVM_FAR24	.text.__avm_before_global_dtor+0x13
<L2>:
 f0 55 00 00           ldm16	r5, [0x0]
		R_AVM_DATA16	.data.global_phase
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_before_global_dtor
		R_AVM_FAR24	.text.__avm_before_global_dtor+0x49
<L3>:
 f4 b5                 dec16	r5
 f0 5d 00 00           stm16	[0x0], r5
		R_AVM_DATA16	.data.global_phase
 b8                    pop16	r0
 ef                    ret
