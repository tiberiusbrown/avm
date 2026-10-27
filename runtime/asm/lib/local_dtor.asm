
local_dtor.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 local_dtor.c
00000000 l    d  .text.__avm_register_local_dtor	00000000 .text.__avm_register_local_dtor
00000000 l    d  .text.__avm_register_exit_callback	00000000 .text.__avm_register_exit_callback
00000000 l    d  .text.__avm_note_global_ctor	00000000 .text.__avm_note_global_ctor
00000000 l    d  .text.__avm_run_local_dtors	00000000 .text.__avm_run_local_dtors
00000000 l    d  .text.__avm_before_global_dtor	00000000 .text.__avm_before_global_dtor
00000000 g     F .text.__avm_register_local_dtor	0000002c __avm_register_local_dtor
00000000         *UND*	00000000 __avm_termination_next
00000000         *UND*	00000000 __avm_local_dtor_slots_start
00000000         *UND*	00000000 __avm_termination_slots_end
00000000         *UND*	00000000 __avm_termination_phase
00000000         *UND*	00000000 avm_halt
00000000 g     F .text.__avm_register_exit_callback	00000049 __avm_register_exit_callback
00000000         *UND*	00000000 __avm_termination_entry_size
00000000  w      *UND*	00000000 __avm_atexit_count
00000000 g     F .text.__avm_note_global_ctor	0000004a __avm_note_global_ctor
00000000         *UND*	00000000 __fini_array_start
00000000         *UND*	00000000 __fini_array_end
00000000 g     F .text.__avm_run_local_dtors	000000bd __avm_run_local_dtors
00000000 g     F .text.__avm_before_global_dtor	00000115 __avm_before_global_dtor

Disassembly of section .text.__avm_register_local_dtor:

<__avm_register_local_dtor>:
 f0 56 00 00           ldm16	r6, [0x0]
		R_AVM_DATA16	__avm_termination_next
 c7 00 00              ldi16	r7, 0x0
		R_AVM_DATA16	__avm_local_dtor_slots_start
 f6 2e                 tst16	r6
 fb 37                 cmov.eq	r6, r7
 c7 00 00              ldi16	r7, 0x0
		R_AVM_DATA16	__avm_termination_slots_end
 3b                    cmp	r6, r7
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_register_local_dtor
		R_AVM_FAR24	.text.__avm_register_local_dtor+0x28
<L0>:
 0e                    mov	r7, r6
 f7 5c                 st16	[r7+], r4
 5d                    st8	[r7], r5
 f0 54 00 00           ldm16	r4, [0x0]
		R_AVM_DATA16	__avm_termination_phase
 10                    add	r4, r4
 ee 9c 23              st16	[r6+3], r4
 ca 05                 addi.s8	r6, 0x5
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_termination_next
 ef                    ret
 e3 00 00 00           callf	__avm_register_local_dtor
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_halt

Disassembly of section .text.__avm_register_exit_callback:

<__avm_register_exit_callback>:
 c6 00 00              ldi16	r6, 0x0
		R_AVM_DATA16	__avm_termination_entry_size
 ce 05                 cmpi.s8	r6, 0x5
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_register_exit_callback
		R_AVM_FAR24	.text.__avm_register_exit_callback+0x36
<L0>:
 f0 56 00 00           ldm16	r6, [0x0]
		R_AVM_DATA16	__avm_termination_next
 c7 00 00              ldi16	r7, 0x0
		R_AVM_DATA16	__avm_local_dtor_slots_start
 f6 2e                 tst16	r6
 fb 37                 cmov.eq	r6, r7
 c7 00 00              ldi16	r7, 0x0
		R_AVM_DATA16	__avm_termination_slots_end
 3b                    cmp	r6, r7
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_register_exit_callback
		R_AVM_FAR24	.text.__avm_register_exit_callback+0x45
<L1>:
 0e                    mov	r7, r6
 f7 5c                 st16	[r7+], r4
 5d                    st8	[r7], r5
 f0 54 00 00           ldm16	r4, [0x0]
		R_AVM_DATA16	__avm_termination_phase
 10                    add	r4, r4
 c1 01                 ldi8	r5, 0x1
 94                    or	r5, r4
 ee bc 23              st16	[r6+3], r5
 ca 05                 addi.s8	r6, 0x5
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_termination_next
 ef                    ret
 f0 46 00 00           ldm8u	r6, [0x0]
		R_AVM_DATA16	__avm_atexit_count
 0e                    mov	r7, r6
 1f                    add	r7, r7
 1e                    add	r7, r6
 c6 00 00              ldi16	r6, 0x0
		R_AVM_DATA16	__avm_local_dtor_slots_start
 1b                    add	r6, r7
 f7 54                 st16	[r6+], r4
 59                    st8	[r6], r5
 ef                    ret
 e3 00 00 00           callf	__avm_register_exit_callback
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_halt

Disassembly of section .text.__avm_note_global_ctor:

<__avm_note_global_ctor>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_PROG_LO16	__fini_array_start
 f0 01 00              ldi8	r1, 0x0
		R_AVM_PROG_HI8	__fini_array_start
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	__fini_array_end
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	__fini_array_end
 f1 75                 zext8	r5
 f2 64                 mov32	q1, q0
 f1 73                 zext8	r3
 f0 69 4c              cmp32	q1, q3
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_note_global_ctor
		R_AVM_FAR24	.text.__avm_note_global_ctor+0x46
<L0>:
 f0 02 03              ldi8	r2, 0x3
 f2 4b                 sub	r3, r3
 f7 64                 add32	q1, q0
 f0 63 00              ldp24	q0, [q0]
 f0 69 08              cmp32	q0, q2
 f2 61                 mov32	q0, q1
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_note_global_ctor
		R_AVM_FAR24	.text.__avm_note_global_ctor+0x12
<L1>:
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	__fini_array_start
 f2 44                 sub	r2, r4
 c0 03                 ldi8	r4, 0x3
 ec 94                 sdiv16	r2, r4
 f0 5a 00 00           stm16	[0x0], r2
		R_AVM_DATA16	__avm_termination_phase
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 e3 00 00 00           callf	__avm_note_global_ctor
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_halt

Disassembly of section .text.__avm_run_local_dtors:

<__avm_run_local_dtors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	__avm_termination_entry_size
 cc 05                 cmpi.s8	r4, 0x5
 d0 04                 breq8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_run_local_dtors
		R_AVM_FAR24	.text.__avm_run_local_dtors+0x82
<L0>:
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	__avm_local_dtor_slots_start
 c5 00 00              ldi16	r5, 0x0
		R_AVM_DATA16	__avm_termination_slots_end
 34                    cmp	r5, r4
 d1 04                 brne8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_run_local_dtors
		R_AVM_FAR24	.text.__avm_run_local_dtors+0xb8
<L1>:
 f0 56 00 00           ldm16	r6, [0x0]
		R_AVM_DATA16	__avm_termination_next
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_run_local_dtors
		R_AVM_FAR24	.text.__avm_run_local_dtors+0xb8
<L2>:
 c5 00 00              ldi16	r5, 0x0
		R_AVM_DATA16	__avm_local_dtor_slots_start
 39                    cmp	r6, r5
 d1 04                 brne8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_run_local_dtors
		R_AVM_FAR24	.text.__avm_run_local_dtors+0xb8
<L3>:
 f0 00 01              ldi8	r0, 0x1
 f0 05 00 00           ldi16	r1, 0x0
		R_AVM_DATA16	__avm_local_dtor_slots_start
 ed bc 1e              ld16	r5, [r6-2]
 01                    mov	r4, r5
 f4 8c                 lsr16.1	r4
 f0 57 00 00           ldm16	r7, [0x0]
		R_AVM_DATA16	__avm_termination_phase
 33                    cmp	r4, r7
 d8 04                 bruge8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_run_local_dtors
		R_AVM_FAR24	.text.__avm_run_local_dtors+0xb8
<L4>:
 ca fb                 addi.s8	r6, -0x5
 02                    mov	r4, r6
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_termination_next
 f9 a0                 and	r5, r0
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_run_local_dtors
		R_AVM_FAR24	.text.__avm_run_local_dtors+0x69
<L5>:
 f0 44 00 00           ldm8u	r4, [0x0]
		R_AVM_DATA16	__avm_atexit_count
 f4 b4                 dec16	r4
 f0 4c 00 00           stm8	[0x0], r4
		R_AVM_DATA16	__avm_atexit_count
 e9                    callp	q1
 f0 56 00 00           ldm16	r6, [0x0]
		R_AVM_DATA16	__avm_termination_next
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_run_local_dtors
		R_AVM_FAR24	.text.__avm_run_local_dtors+0xb8
<L6>:
 f5 29                 cmp	r6, r1
 d0 04                 breq8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_run_local_dtors
		R_AVM_FAR24	.text.__avm_run_local_dtors+0x39
<L7>:
 e2 00 00 00           jmpf	__avm_run_local_dtors
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_run_local_dtors+0xb8
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	__avm_atexit_count
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_run_local_dtors
		R_AVM_FAR24	.text.__avm_run_local_dtors+0xb8
<L8>:
 f0 44 00 00           ldm8u	r4, [0x0]
		R_AVM_DATA16	__avm_atexit_count
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_run_local_dtors
		R_AVM_FAR24	.text.__avm_run_local_dtors+0xb8
<L9>:
 f0 04 00 00           ldi16	r0, 0x0
		R_AVM_DATA16	__avm_local_dtor_slots_start
 f4 b4                 dec16	r4
 f0 4c 00 00           stm8	[0x0], r4
		R_AVM_DATA16	__avm_atexit_count
 04                    mov	r5, r4
 15                    add	r5, r5
 14                    add	r5, r4
 f2 24                 add	r5, r0
 f7 2e                 ld16	r6, [r5+]
 4d                    ld8u	r7, [r5]
 eb                    callp	q3
 f0 44 00 00           ldm8u	r4, [0x0]
		R_AVM_DATA16	__avm_atexit_count
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_run_local_dtors
		R_AVM_FAR24	.text.__avm_run_local_dtors+0x9d
<L10>:
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

Disassembly of section .text.__avm_before_global_dtor:

<__avm_before_global_dtor>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f0 06 00 00           ldi16	r2, 0x0
		R_AVM_PROG_LO16	__fini_array_start
 f0 03 00              ldi8	r3, 0x0
		R_AVM_PROG_HI8	__fini_array_start
 c6 00 00              ldi16	r6, 0x0
		R_AVM_PROG_LO16	__fini_array_end
 c3 00                 ldi8	r7, 0x0
		R_AVM_PROG_HI8	__fini_array_end
 f1 75                 zext8	r5
 f2 61                 mov32	q0, q1
 f1 71                 zext8	r1
 f0 69 0c              cmp32	q0, q3
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_before_global_dtor
		R_AVM_FAR24	.text.__avm_before_global_dtor+0x111
<L0>:
 f0 00 03              ldi8	r0, 0x3
 f2 39                 sub	r1, r1
 f7 61                 add32	q0, q1
 f0 63 44              ldp24	q1, [q1]
 f0 69 48              cmp32	q1, q2
 f2 64                 mov32	q1, q0
 d0 04                 breq8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_before_global_dtor
		R_AVM_FAR24	.text.__avm_before_global_dtor+0x12
<L1>:
 c4 00 00              ldi16	r4, 0x0
		R_AVM_PROG_LO16	__fini_array_start
 f2 34                 sub	r0, r4
 c0 03                 ldi8	r4, 0x3
 ec 84                 sdiv16	r0, r4
 f0 54 00 00           ldm16	r4, [0x0]
		R_AVM_DATA16	__avm_termination_phase
 f5 20                 cmp	r4, r0
 d2 04                 brult8	0x4 <L2>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_before_global_dtor
		R_AVM_FAR24	.text.__avm_before_global_dtor+0x4e
<L2>:
 a0                    xor	r4, r4
 e2 00 00 00           jmpf	__avm_before_global_dtor
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_before_global_dtor+0x10c
 f0 58 00 00           stm16	[0x0], r0
		R_AVM_DATA16	__avm_termination_phase
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	__avm_termination_entry_size
 cc 05                 cmpi.s8	r4, 0x5
 d0 04                 breq8	0x4 <L3>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_before_global_dtor
		R_AVM_FAR24	.text.__avm_before_global_dtor+0xce
<L3>:
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	__avm_local_dtor_slots_start
 c5 00 00              ldi16	r5, 0x0
		R_AVM_DATA16	__avm_termination_slots_end
 34                    cmp	r5, r4
 d1 04                 brne8	0x4 <L4>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_before_global_dtor
		R_AVM_FAR24	.text.__avm_before_global_dtor+0x104
<L4>:
 f0 56 00 00           ldm16	r6, [0x0]
		R_AVM_DATA16	__avm_termination_next
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L5>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_before_global_dtor
		R_AVM_FAR24	.text.__avm_before_global_dtor+0x104
<L5>:
 c5 00 00              ldi16	r5, 0x0
		R_AVM_DATA16	__avm_local_dtor_slots_start
 39                    cmp	r6, r5
 d1 04                 brne8	0x4 <L6>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_before_global_dtor
		R_AVM_FAR24	.text.__avm_before_global_dtor+0x104
<L6>:
 f0 01 01              ldi8	r1, 0x1
 ed bc 1e              ld16	r5, [r6-2]
 01                    mov	r4, r5
 f4 8c                 lsr16.1	r4
 f0 57 00 00           ldm16	r7, [0x0]
		R_AVM_DATA16	__avm_termination_phase
 33                    cmp	r4, r7
 d8 04                 bruge8	0x4 <L7>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_before_global_dtor
		R_AVM_FAR24	.text.__avm_before_global_dtor+0x104
<L7>:
 ca fb                 addi.s8	r6, -0x5
 02                    mov	r4, r6
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 f0 5e 00 00           stm16	[0x0], r6
		R_AVM_DATA16	__avm_termination_next
 f9 a4                 and	r5, r1
 f4 a5                 tst8	r5
 d1 04                 brne8	0x4 <L8>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_before_global_dtor
		R_AVM_FAR24	.text.__avm_before_global_dtor+0xb3
<L8>:
 f0 44 00 00           ldm8u	r4, [0x0]
		R_AVM_DATA16	__avm_atexit_count
 f4 b4                 dec16	r4
 f0 4c 00 00           stm8	[0x0], r4
		R_AVM_DATA16	__avm_atexit_count
 e9                    callp	q1
 f0 56 00 00           ldm16	r6, [0x0]
		R_AVM_DATA16	__avm_termination_next
 f6 2e                 tst16	r6
 d1 04                 brne8	0x4 <L9>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_before_global_dtor
		R_AVM_FAR24	.text.__avm_before_global_dtor+0x104
<L9>:
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	__avm_local_dtor_slots_start
 38                    cmp	r6, r4
 d0 04                 breq8	0x4 <L10>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_before_global_dtor
		R_AVM_FAR24	.text.__avm_before_global_dtor+0x83
<L10>:
 e2 00 00 00           jmpf	__avm_before_global_dtor
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	.text.__avm_before_global_dtor+0x104
 c4 00 00              ldi16	r4, 0x0
		R_AVM_DATA16	__avm_atexit_count
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L11>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_before_global_dtor
		R_AVM_FAR24	.text.__avm_before_global_dtor+0x104
<L11>:
 f0 44 00 00           ldm8u	r4, [0x0]
		R_AVM_DATA16	__avm_atexit_count
 f4 a4                 tst8	r4
 d1 04                 brne8	0x4 <L12>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_before_global_dtor
		R_AVM_FAR24	.text.__avm_before_global_dtor+0x104
<L12>:
 f0 05 00 00           ldi16	r1, 0x0
		R_AVM_DATA16	__avm_local_dtor_slots_start
 f4 b4                 dec16	r4
 f0 4c 00 00           stm8	[0x0], r4
		R_AVM_DATA16	__avm_atexit_count
 04                    mov	r5, r4
 15                    add	r5, r5
 14                    add	r5, r4
 f2 25                 add	r5, r1
 f7 2e                 ld16	r6, [r5+]
 4d                    ld8u	r7, [r5]
 eb                    callp	q3
 f0 44 00 00           ldm8u	r4, [0x0]
		R_AVM_DATA16	__avm_atexit_count
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L13>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	__avm_before_global_dtor
		R_AVM_FAR24	.text.__avm_before_global_dtor+0xe9
<L13>:
 c0 01                 ldi8	r4, 0x1
 f4 b0                 dec16	r0
 f0 58 00 00           stm16	[0x0], r0
		R_AVM_DATA16	__avm_termination_phase
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 e3 00 00 00           callf	__avm_before_global_dtor
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	avm_halt
