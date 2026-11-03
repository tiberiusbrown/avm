
math_trig_reduce_poles.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 __avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 math_trig_reduce_poles.c
00000100 l     O .data	00000080 inputs
00000180 l     O .data	00000004 result
00000184 l     O .data	00000004 quadrant_result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 trap_report.c
00000000 l    df *ABS*	00000000 trap_lookup.c
00000b96 l     F .text	0000010f open_section
00000ca5 l     F .text	00000103 read_uleb128
00000000 l    df *ABS*	00000000 string.c
00000000 l    df *ABS*	00000000 pgmspace.c
00000000 l    df *ABS*	00000000 font_br5n.c
00000000 l    df *ABS*	00000000 ef_rem_pio2.c
00000000 l    df *ABS*	00000000 kf_rem_pio2.c
00003041 l     O .rodata	00000500 avm_reduce_windows
000011ae l     F .text	0000042c avm_reduce_extended
00000000 l    df *ABS*	00000000 integer.c
00003541 l       .init_array	00000000 .hidden __init_array_end
00003541 l       .init_array	00000000 .hidden __init_array_start
00003541 l       .fini_array	00000000 .hidden __fini_array_start
00003541 l       .fini_array	00000000 .hidden __fini_array_end
00000326 g     F .text	00000015 __avm_trap_entry
00000200 g     F .text	00000023 _start
00000267 g     F .text	00000058 avm_test_main
000002c1 g     F .text	00000065 __avm_terminate
000002bf g     F .text	00000002 avm_halt
00000dad g     F .text	0000014f __ieee754_rem_pio2f
00001838 g     O .rodata	000003a1 _avm_font_br5n_storage
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000472 g     F .text	00000724 __avm_trap_lookup
0000033b g     F .text	00000137 __avm_trap_report
00000da8 g     F .text	00000005 memset
00000500 g       *ABS*	00000000 __avm_framebuffer
0000171d g     F .text	00000068 __avm_mulsi3
000016d2 g     F .text	0000004b __avm_umulhisi3
00001bd9 g     O .rodata	00001468 avm_small_pio2
00000efc g     F .text	000002b2 __kernel_rem_pio2f
000015da g     F .text	000000f8 avm_rem_pio2f_medium

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d5 1b                 call8	__avm_run_constructors
 d5 5d                 call8	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 e1 ab 00              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 9c 00              call16	avm_halt

<__avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 41 35              ldi16	r4, 0x3541
 c1 00                 ldi8	r5, 0x0
 c6 41 35              ldi16	r6, 0x3541
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 41 35           ldi16	r0, 0x3541
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 41 35           ldi16	r2, 0x3541
 f0 03 00              ldi8	r3, 0x0
<L0>:
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	-0x13 <L0>
<L1>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 c1 03                 ldi8	r5, 0x3
 f4 41                 stsp16	[sp+0x0], r5
<L0>:
 f4 48                 stsp16	[sp+0x2], r4
 c5 00 01              ldi16	r5, 0x100
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 f0 16 04              leasp	r6, 0x4
 e1 22 0b              call16	__ieee754_rem_pio2f
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 01                 ldsp16	r5, [sp+0x0]
 81                    and	r4, r5
 a5                    xor	r5, r5
 f7 66                 add32	q1, q2
 f4 08                 ldsp16	r4, [sp+0x2]
 c8 04                 addi.s8	r4, 0x4
 f4 48                 stsp16	[sp+0x2], r4
 c0 80                 ldi8	r4, 0x80
 f4 09                 ldsp16	r5, [sp+0x2]
 34                    cmp	r5, r4
 01                    mov	r4, r5
 d1 d3                 brne8	-0x2d <L0>
 c4 80 01              ldi16	r4, 0x180
 f0 6b 08              st32	[r4], q0
 c4 84 01              ldi16	r4, 0x184
 f0 6b 48              st32	[r4], q1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<__avm_terminate>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	0x3 <L0>
 e1 2a fd              call16	-726 <__avm_run_local_dtors>
<L0>:
 c4 41 35              ldi16	r4, 0x3541
 c1 00                 ldi8	r5, 0x0
 c6 41 35              ldi16	r6, 0x3541
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 41 35           ldi16	r2, 0x3541
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 41 35           ldi16	r0, 0x3541
 f0 01 00              ldi8	r1, 0x0
<L1>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	-0x13 <L1>
<L2>:
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	0x3 <L3>
 e1 e1 fc              call16	-799 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_trap_entry>:
 c4 00 01              ldi16	r4, 0x100
 c5 00 09              ldi16	r5, 0x900
 c6 00 01              ldi16	r6, 0x100
 d7 0f                 sys	memcpy
 c7 00 0a              ldi16	r7, 0xa00
 f1 8f                 setsp	r7
 c4 00 02              ldi16	r4, 0x200
 d4 00                 jmp8	__avm_trap_report

<__avm_trap_report>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f9                 adjsp	-0x7
 f1 04                 mov	r0, r4
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 f0 05 20 02           ldi16	r1, 0x220
 f2 69                 mov32	q2, q1
 f1 29                 mov	r6, r1
 e1 20 01              call16	__avm_trap_lookup
 c4 00 05              ldi16	r4, 0x500
 a5                    xor	r5, r5
 c6 00 04              ldi16	r6, 0x400
 e1 4c 0a              call16	memset
 c4 38 18              ldi16	r4, 0x1838
 c1 00                 ldi8	r5, 0x0
 d7 31                 sys	set_text_font
 a0                    xor	r4, r4
 d7 32                 sys	set_text_mode
 ed 80 23              ld8u	r4, [r0+3]
 cc 01                 cmpi.s8	r4, 0x1
 d0 16                 breq8	0x16 <L1>
 cc 03                 cmpi.s8	r4, 0x3
 d0 0b                 breq8	0xb <L0>
 cc 02                 cmpi.s8	r4, 0x2
 d1 15                 brne8	0x15 <L2>
 c6 09 18              ldi16	r6, 0x1809
 c3 00                 ldi8	r7, 0x0
 d4 13                 jmp8	0x13 <L3>
<L0>:
 c6 19 18              ldi16	r6, 0x1819
 c3 00                 ldi8	r7, 0x0
 d4 0c                 jmp8	0xc <L3>
<L1>:
 c6 fa 17              ldi16	r6, 0x17fa
 c3 00                 ldi8	r7, 0x0
 d4 05                 jmp8	0x5 <L3>
<L2>:
 c6 2b 18              ldi16	r6, 0x182b
 c3 00                 ldi8	r7, 0x0
<L3>:
 a0                    xor	r4, r4
 c1 05                 ldi8	r5, 0x5
 d7 34                 sys	draw_text_p
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 ed 90 24              ld16	r4, [r0+4]
 f4 50                 stsp16	[sp+0x4], r4
 f0 13 00              leasp	r3, 0x0
 c6 85 17              ldi16	r6, 0x1785
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 0b                 ldi8	r5, 0xb
 f1 13                 mov	r2, r3
 d7 36                 sys	draw_textfv_p
 f0 6c 93              ld16	r4, [r1+]
 ed a2 20              ld8u	r5, [r1+0]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 12                 breq8	0x12 <L4>
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c6 96 17              ldi16	r6, 0x1796
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 11                 ldi8	r5, 0x11
 f1 13                 mov	r2, r3
 d7 36                 sys	draw_textfv_p
 d4 0a                 jmp8	0xa <L5>
<L4>:
 c6 9f 17              ldi16	r6, 0x179f
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 11                 ldi8	r5, 0x11
 d7 34                 sys	draw_text_p
<L5>:
 c6 23 02              ldi16	r6, 0x223
 f7 34                 ld16	r4, [r6+]
 46                    ld8u	r5, [r6]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 1d                 breq8	0x1d <L6>
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c4 26 02              ldi16	r4, 0x226
 f0 6a 88              ld32	q2, [r4]
 f4 4c                 stsp16	[sp+0x3], r4
 f4 55                 stsp16	[sp+0x5], r5
 f0 12 00              leasp	r2, 0x0
 c6 a4 17              ldi16	r6, 0x17a4
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 17                 ldi8	r5, 0x17
 d7 36                 sys	draw_textfv_p
 d4 0a                 jmp8	0xa <L7>
<L6>:
 c6 ae 17              ldi16	r6, 0x17ae
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 17                 ldi8	r5, 0x17
 d7 34                 sys	draw_text_p
<L7>:
 ed 90 28              ld16	r4, [r0+8]
 f4 40                 stsp16	[sp+0x0], r4
 ed 90 2a              ld16	r4, [r0+10]
 f4 48                 stsp16	[sp+0x2], r4
 f0 12 00              leasp	r2, 0x0
 c6 b2 17              ldi16	r6, 0x17b2
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 1d                 ldi8	r5, 0x1d
 d7 36                 sys	draw_textfv_p
 ed 90 2c              ld16	r4, [r0+12]
 f4 40                 stsp16	[sp+0x0], r4
 ed 90 2e              ld16	r4, [r0+14]
 f4 48                 stsp16	[sp+0x2], r4
 c6 c2 17              ldi16	r6, 0x17c2
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 23                 ldi8	r5, 0x23
 d7 36                 sys	draw_textfv_p
 ed 90 30              ld16	r4, [r0+16]
 f4 40                 stsp16	[sp+0x0], r4
 ed 90 32              ld16	r4, [r0+18]
 f4 48                 stsp16	[sp+0x2], r4
 c6 d2 17              ldi16	r6, 0x17d2
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 29                 ldi8	r5, 0x29
 d7 36                 sys	draw_textfv_p
 ed 90 34              ld16	r4, [r0+20]
 f4 40                 stsp16	[sp+0x0], r4
 ed 90 36              ld16	r4, [r0+22]
 f4 48                 stsp16	[sp+0x2], r4
 c6 e2 17              ldi16	r6, 0x17e2
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 2f                 ldi8	r5, 0x2f
 d7 36                 sys	draw_textfv_p
 ed 80 26              ld8u	r4, [r0+6]
 f4 40                 stsp16	[sp+0x0], r4
 c6 f2 17              ldi16	r6, 0x17f2
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 35                 ldi8	r5, 0x35
 d7 36                 sys	draw_textfv_p
 a0                    xor	r4, r4
 d7 1d                 sys	display
<L8>:
 d4 fe                 jmp8	-0x2 <L8>

<__avm_trap_lookup>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 a2                 adjsp	-0x5e
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 0e                    mov	r7, r6
 cb 06                 addi.s8	r7, 0x6
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 6b 4e              st32	[r7], q1
 0e                    mov	r7, r6
 f7 5a                 st16	[r7+], r2
 f3 0f                 st8	[r7], r3
 0e                    mov	r7, r6
 cb 03                 addi.s8	r7, 0x3
 f7 5a                 st16	[r7+], r2
 f3 0f                 st8	[r7], r3
 f0 00 0f              ldi8	r0, 0xf
 f2 39                 sub	r1, r1
 f0 63 80              ldp24	q2, [q0]
 f0 3a 24              stsp16	[sp+0x24], r2
 f0 3b 26              stsp16	[sp+0x26], r3
 f0 00 2e              ldi8	r0, 0x2e
 f0 05 00 ff           ldi16	r1, 0xff00
 f7 62                 add32	q0, q2
 f0 02 2f              ldi8	r2, 0x2f
 f0 07 00 ff           ldi16	r3, 0xff00
 f0 69 04              cmp32	q0, q1
 d2 76                 brult8	0x76 <L0>
 f0 60 e8              ldp8u	r7, [q2]
 cf 41                 cmpi.s8	r7, 0x41
 d1 6f                 brne8	0x6f <L0>
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f2 62                 mov32	q0, q2
 f7 61                 add32	q0, q1
 f0 60 e0              ldp8u	r7, [q0]
 cf 56                 cmpi.s8	r7, 0x56
 d1 5f                 brne8	0x5f <L0>
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 62                 add32	q0, q2
 f0 60 e0              ldp8u	r7, [q0]
 cf 44                 cmpi.s8	r7, 0x44
 d1 51                 brne8	0x51 <L0>
 f0 02 03              ldi8	r2, 0x3
 f2 4b                 sub	r3, r3
 f2 62                 mov32	q0, q2
 f7 61                 add32	q0, q1
 f0 60 e0              ldp8u	r7, [q0]
 cf 31                 cmpi.s8	r7, 0x31
 d1 41                 brne8	0x41 <L0>
 f0 02 04              ldi8	r2, 0x4
 f2 4b                 sub	r3, r3
 f2 62                 mov32	q0, q2
 f7 61                 add32	q0, q1
 f0 63 00              ldp24	q0, [q0]
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
 f0 00 07              ldi8	r0, 0x7
 f2 39                 sub	r1, r1
 f7 62                 add32	q0, q2
 f0 60 e0              ldp8u	r7, [q0]
 cf 05                 cmpi.s8	r7, 0x5
 d1 21                 brne8	0x21 <L0>
 f0 00 08              ldi8	r0, 0x8
 f2 39                 sub	r1, r1
 f7 62                 add32	q0, q2
 f0 60 e0              ldp8u	r7, [q0]
 f4 a7                 tst8	r7
 d1 13                 brne8	0x13 <L0>
 f0 00 09              ldi8	r0, 0x9
 f2 39                 sub	r1, r1
 f7 62                 add32	q0, q2
 f0 63 00              ldp24	q0, [q0]
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 d0 07                 breq8	0x7 <L1>
<L0>:
 d6 5e                 adjsp	0x5e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L1>:
 f0 02 2f              ldi8	r2, 0x2f
 f2 4b                 sub	r3, r3
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 f0 69 04              cmp32	q0, q1
 d2 e9                 brult8	-0x17 <L0>
 f2 30                 sub	r0, r0
 f0 05 00 01           ldi16	r1, 0x100
 f7 72                 sub32	q0, q2
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 f0 69 04              cmp32	q0, q1
 f0 00 2f              ldi8	r0, 0x2f
 f2 39                 sub	r1, r1
 d2 d1                 brult8	-0x2f <L0>
 f0 02 0c              ldi8	r2, 0xc
 f2 4b                 sub	r3, r3
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 f7 66                 add32	q1, q2
 f0 3a 12              stsp16	[sp+0x12], r2
 f0 3b 14              stsp16	[sp+0x14], r3
 a0                    xor	r4, r4
 f0 3e 1a              stsp16	[sp+0x1a], r6
<L2>:
 f0 38 20              stsp16	[sp+0x20], r0
 f0 39 22              stsp16	[sp+0x22], r1
 f0 00 07              ldi8	r0, 0x7
 0c                    mov	r7, r4
 fe 38                 mul16	r7, r0
 f1 17                 mov	r2, r7
 f2 4b                 sub	r3, r3
 0c                    mov	r7, r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f7 66                 add32	q1, q2
 f2 61                 mov32	q0, q1
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f0 63 80              ldp24	q2, [q0]
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f2 61                 mov32	q0, q1
 c0 04                 ldi8	r4, 0x4
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f0 63 80              ldp24	q2, [q0]
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 30 20              ldsp16	r0, [sp+0x20]
 f0 31 22              ldsp16	r1, [sp+0x22]
 f0 60 84              ldp8u	r4, [q1]
 f4 53                 stsp16	[sp+0x4], r7
 f4 af                 inc16	r7
 f0 3c 16              stsp16	[sp+0x16], r4
 3c                    cmp	r7, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 db 6e ff              brne16	-0x92 <L0>
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 f0 69 40              cmp32	q1, q0
 db 62 ff              brne16	-0x9e <L0>
 d6 fa                 adjsp	-0x6
 f0 17 2a              leasp	r7, 0x2a
 f4 53                 stsp16	[sp+0x4], r7
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f2 64                 mov32	q1, q0
 f7 66                 add32	q1, q2
 f0 17 3e              leasp	r7, 0x3e
 03                    mov	r4, r7
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6b                 mov32	q3, q1
 e1 ab 05              call16	open_section
 d6 06                 adjsp	0x6
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 f4 a7                 tst8	r7
 da 36 ff              breq16	-0xca <L0>
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f7 62                 add32	q0, q2
 f0 34 16              ldsp16	r4, [sp+0x16]
 cc 05                 cmpi.s8	r4, 0x5
 db 6c ff              brne16	-0x94 <L2>
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 69 08              cmp32	q0, q2
 db 1c ff              brne16	-0xe4 <L0>
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 08                    mov	r6, r4
 fa 96                 lsr16i	r6, 0x6
 01                    mov	r4, r5
 04                    mov	r5, r4
 fa 4a                 lsl16i	r5, 0xa
 96                    or	r5, r6
 fa 76                 lsr16i	r4, 0x6
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f0 36 58              ldsp16	r6, [sp+0x58]
 f4 52                 stsp16	[sp+0x4], r6
 f1 16                 mov	r2, r6
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 db f5 fe              brne16	-0x10b <L0>
 f0 30 40              ldsp16	r0, [sp+0x40]
 f0 31 42              ldsp16	r1, [sp+0x42]
 f0 63 80              ldp24	q2, [q0]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 db e4 fe              brne16	-0x11c <L0>
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f0 63 88              ldp24	q2, [q2]
 f0 69 8c              cmp32	q2, q3
 db d6 fe              brne16	-0x12a <L0>
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 3b 1e              stsp16	[sp+0x1e], r3
 c0 0b                 ldi8	r4, 0xb
 a5                    xor	r5, r5
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 f7 68                 add32	q2, q0
 f0 60 88              ldp8u	r4, [q2]
 f4 a4                 tst8	r4
 db bd fe              brne16	-0x143 <L0>
 f0 34 54              ldsp16	r4, [sp+0x54]
 f6 2c                 tst16	r4
 da 15 01              breq16	0x115 <L5>
 f0 36 38              ldsp16	r6, [sp+0x38]
 f0 37 3a              ldsp16	r7, [sp+0x3a]
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 08                    mov	r6, r4
 af                    xor	r7, r7
 a0                    xor	r4, r4
 a5                    xor	r5, r5
<L3>:
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f7 7e                 sub32	q3, q2
 f7 83                 lsr32.1	q3
 f7 6e                 add32	q3, q2
 f2 67                 mov32	q1, q3
 f7 65                 add32	q1, q1
 f7 65                 add32	q1, q1
 f7 65                 add32	q1, q1
 f7 67                 add32	q1, q3
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f7 69                 add32	q2, q1
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 f0 69 40              cmp32	q1, q0
 f0 32 20              ldsp16	r2, [sp+0x20]
 f0 33 22              ldsp16	r3, [sp+0x22]
 fc 22                 cmov.ult	r4, r2
 fc 2b                 cmov.ult	r5, r3
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 fc 06                 cmov.ult	r0, r6
 fc 0f                 cmov.ult	r1, r7
 f0 38 06              stsp16	[sp+0x6], r0
 f0 39 08              stsp16	[sp+0x8], r1
 f2 6a                 mov32	q3, q0
 f0 69 8c              cmp32	q2, q3
 d2 9f                 brult8	-0x61 <L3>
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f0 33 0c              ldsp16	r3, [sp+0xc]
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 69 80              cmp32	q2, q0
 da 94 00              breq16	0x94 <L5>
 02                    mov	r4, r6
 07                    mov	r5, r7
 f7 6a                 add32	q2, q2
 f7 6a                 add32	q2, q2
 f7 6a                 add32	q2, q2
 f7 6b                 add32	q2, q3
 f2 6b                 mov32	q3, q1
 f7 6e                 add32	q3, q2
 c4 fa ff              ldi16	r4, 0xfffa
 c5 ff ff              ldi16	r5, 0xffff
 f2 67                 mov32	q1, q3
 f7 6b                 add32	q2, q3
 f0 63 c8              ldp24	q3, [q2]
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 8c              cmp32	q2, q3
 d8 70                 bruge8	0x70 <L5>
 c4 f7 ff              ldi16	r4, 0xfff7
 c5 ff ff              ldi16	r5, 0xffff
 f7 66                 add32	q1, q2
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 63 88              ldp24	q2, [q2]
 f0 36 4c              ldsp16	r6, [sp+0x4c]
 f0 37 4e              ldsp16	r7, [sp+0x4e]
 f7 6e                 add32	q3, q2
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 3f 26              stsp16	[sp+0x26], r7
 f0 32 50              ldsp16	r2, [sp+0x50]
 f0 33 52              ldsp16	r3, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f0 14 30              leasp	r4, 0x30
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 26              leasp	r4, 0x26
 f2 6b                 mov32	q3, q1
 e1 57 05              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d0 2e                 breq8	0x2e <L4>
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 36 2e              ldsp16	r6, [sp+0x2e]
 f0 37 30              ldsp16	r7, [sp+0x30]
 f0 69 c0              cmp32	q3, q0
 d0 1f                 breq8	0x1f <L4>
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 f7 76                 sub32	q1, q2
 f0 69 c4              cmp32	q3, q1
 d8 12                 bruge8	0x12 <L4>
 f7 6e                 add32	q3, q2
 f0 60 cc              ldp8u	r6, [q3]
 f4 a6                 tst8	r6
 d1 09                 brne8	0x9 <L4>
 c6 ff ff              ldi16	r6, 0xffff
 c3 ff                 ldi8	r7, 0xff
 82                    and	r4, r6
 87                    and	r5, r7
 f2 62                 mov32	q0, q2
<L4>:
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f7 40                 st16	[r4+], r0
 f3 01                 st8	[r4], r1
<L5>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f6 2c                 tst16	r4
 da 99 fd              breq16	-0x267 <L0>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 c2 0c                 ldi8	r6, 0xc
 af                    xor	r7, r7
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
<L6>:
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f2 63                 mov32	q0, q3
 f7 72                 sub32	q0, q2
 f7 80                 lsr32.1	q0
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 e1 5f 0f              call16	__avm_mulsi3
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f7 6b                 add32	q2, q3
 f0 63 88              ldp24	q2, [q2]
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f2 68                 mov32	q2, q0
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 32 20              ldsp16	r2, [sp+0x20]
 f0 33 22              ldsp16	r3, [sp+0x22]
 f0 69 c4              cmp32	q3, q1
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 fc 26                 cmov.ult	r4, r6
 fc 2f                 cmov.ult	r5, r7
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 fc 30                 cmov.ult	r6, r0
 fc 39                 cmov.ult	r7, r1
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f0 69 8c              cmp32	q2, q3
 d2 a2                 brult8	-0x5e <L6>
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 da 23 fd              breq16	-0x2dd <L0>
 c2 0c                 ldi8	r6, 0xc
 af                    xor	r7, r7
 e1 0f 0f              call16	__avm_mulsi3
 f0 32 16              ldsp16	r2, [sp+0x16]
 f0 33 18              ldsp16	r3, [sp+0x18]
 f7 66                 add32	q1, q2
 c4 f4 ff              ldi16	r4, 0xfff4
 c5 ff ff              ldi16	r5, 0xffff
 f7 69                 add32	q2, q1
 f0 63 88              ldp24	q2, [q2]
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 c4 f7 ff              ldi16	r4, 0xfff7
 c5 ff ff              ldi16	r5, 0xffff
 f7 69                 add32	q2, q1
 f0 63 88              ldp24	q2, [q2]
 c6 fa ff              ldi16	r6, 0xfffa
 c7 ff ff              ldi16	r7, 0xffff
 f7 6d                 add32	q3, q1
 f0 62 cc              ldp16	r6, [q3]
 f4 52                 stsp16	[sp+0x4], r6
 f0 04 fc ff           ldi16	r0, 0xfffc
 f0 05 ff ff           ldi16	r1, 0xffff
 f2 6b                 mov32	q3, q1
 f7 6c                 add32	q3, q0
 f0 63 cc              ldp24	q3, [q3]
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f0 36 44              ldsp16	r6, [sp+0x44]
 f0 37 46              ldsp16	r7, [sp+0x46]
 f7 6e                 add32	q3, q2
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 66                 add32	q1, q2
 f0 60 a4              ldp8u	r5, [q1]
 f4 a5                 tst8	r5
 f8 0c                 cset.ne	r4
 f0 30 48              ldsp16	r0, [sp+0x48]
 f0 31 4a              ldsp16	r1, [sp+0x4a]
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 f0 69 c0              cmp32	q3, q0
 dd 67 02              bruge16	0x267 <L17>
 f0 34 56              ldsp16	r4, [sp+0x56]
 f0 3c 32              stsp16	[sp+0x32], r4
 f2 39                 sub	r1, r1
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 39 36              stsp16	[sp+0x36], r1
 f4 a5                 tst8	r5
 f8 0c                 cset.ne	r4
 f0 3c 2c              stsp16	[sp+0x2c], r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
<L7>:
 c0 40                 ldi8	r4, 0x40
 a5                    xor	r5, r5
 f0 30 20              ldsp16	r0, [sp+0x20]
 f0 31 22              ldsp16	r1, [sp+0x22]
 f0 69 08              cmp32	q0, q2
 da 84 fc              breq16	-0x37c <L0>
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 3a 2e              stsp16	[sp+0x2e], r2
 f0 3b 30              stsp16	[sp+0x30], r3
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f7 68                 add32	q2, q0
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 f0 3a 5a              stsp16	[sp+0x5a], r2
 f0 3b 5c              stsp16	[sp+0x5c], r3
 f0 61 8c              ldp8s	r4, [q3]
 f4 78                 stsp16	[sp+0xe], r4
 f4 a4                 tst8	r4
 de d1 00              brslt16	0xd1 <L11>
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 69 84              cmp32	q2, q1
 da 43 fc              breq16	-0x3bd <L0>
 f4 3a                 ldsp16	r6, [sp+0xe]
 f1 76                 zext8	r6
 c0 0f                 ldi8	r4, 0xf
 82                    and	r4, r6
 f4 ac                 inc16	r4
 a5                    xor	r5, r5
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 3d 30              stsp16	[sp+0x30], r5
 fa 94                 lsr16i	r6, 0x4
 f1 06                 mov	r0, r6
 f2 39                 sub	r1, r1
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f7 63                 add32	q0, q3
 c4 fc ff              ldi16	r4, 0xfffc
 c5 ff ff              ldi16	r5, 0xffff
 f7 62                 add32	q0, q2
<L8>:
 f0 38 0e              stsp16	[sp+0xe], r0
 f0 39 10              stsp16	[sp+0x10], r1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 6a                 stsp16	[sp+0xa], r6
 f4 71                 stsp16	[sp+0xc], r5
<L9>:
 aa                    xor	r6, r6
 c7 00 ff              ldi16	r7, 0xff00
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f7 6e                 add32	q3, q2
 f0 00 01              ldi8	r0, 0x1
 f0 05 00 ff           ldi16	r1, 0xff00
 f0 69 c0              cmp32	q3, q0
 c0 01                 ldi8	r4, 0x1
 f0 3c 12              stsp16	[sp+0x12], r4
 dc f4 fb              brult16	-0x40c <L0>
<L10>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 01 ff              ldi8	r1, 0xff
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f7 73                 sub32	q0, q3
 f0 32 2e              ldsp16	r2, [sp+0x2e]
 f0 33 30              ldsp16	r3, [sp+0x30]
 f2 6b                 mov32	q3, q1
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 6e                 add32	q3, q2
 f0 69 c0              cmp32	q3, q0
 dd d1 fb              bruge16	-0x42f <L0>
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f7 69                 add32	q2, q1
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 37 26              ldsp16	r7, [sp+0x26]
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 69 08              cmp32	q0, q2
 dc 79 01              brult16	0x179 <L18>
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 f7 68                 add32	q2, q0
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 f0 69 c8              cmp32	q3, q2
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 50                 stsp16	[sp+0x4], r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 3c 2c              stsp16	[sp+0x2c], r4
 dc ee fe              brult16	-0x112 <L7>
 e0 42 01              jmp16	322 <L18>
<L11>:
 f4 38                 ldsp16	r4, [sp+0xe]
 cc 80                 cmpi.s8	r4, -0x80
 d1 7a                 brne8	0x7a <L12>
 d6 fe                 adjsp	-0x2
 f0 14 30              leasp	r4, 0x30
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 26              leasp	r4, 0x26
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 e1 df 02              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 da 5c fb              breq16	-0x4a4 <L0>
 d6 fe                 adjsp	-0x2
 f0 14 5c              leasp	r4, 0x5c
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 26              leasp	r4, 0x26
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 e1 c3 02              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 da 40 fb              breq16	-0x4c0 <L0>
 f0 30 5a              ldsp16	r0, [sp+0x5a]
 f0 31 5c              ldsp16	r1, [sp+0x5c]
 f0 34 34              ldsp16	r4, [sp+0x34]
 f0 35 36              ldsp16	r5, [sp+0x36]
 f1 28                 mov	r6, r0
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 f0 69 08              cmp32	q0, q2
 dd 28 fb              bruge16	-0x4d8 <L0>
 d6 fe                 adjsp	-0x2
 f0 14 2a              leasp	r4, 0x2a
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 26              leasp	r4, 0x26
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 e1 8f 02              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 da 0c fb              breq16	-0x4f4 <L0>
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 e0 ed fe              jmp16	-275 <L9>
<L12>:
 c2 ff                 ldi8	r6, 0xff
 f4 38                 ldsp16	r4, [sp+0xe]
 a5                    xor	r5, r5
 82                    and	r4, r6
 f4 3a                 ldsp16	r6, [sp+0xe]
 ce 93                 cmpi.s8	r6, -0x6d
 d2 26                 brult8	0x26 <L14>
 c6 6e ff              ldi16	r6, 0xff6e
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 3d 30              stsp16	[sp+0x30], r5
<L13>:
 a0                    xor	r4, r4
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 6a                 stsp16	[sp+0xa], r6
 f4 71                 stsp16	[sp+0xc], r5
 e0 d8 fe              jmp16	-296 <L10>
<L14>:
 c6 82 ff              ldi16	r6, 0xff82
 f4 3b                 ldsp16	r7, [sp+0xe]
 3b                    cmp	r6, r7
 d2 24                 brult8	0x24 <L15>
 d6 fe                 adjsp	-0x2
 f0 14 30              leasp	r4, 0x30
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 26              leasp	r4, 0x26
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 e1 2b 02              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 da a8 fa              breq16	-0x558 <L0>
 f4 38                 ldsp16	r4, [sp+0xe]
 cc 82                 cmpi.s8	r4, -0x7e
 d0 be                 breq8	-0x42 <L13>
 d4 0e                 jmp8	0xe <L16>
<L15>:
 c6 7e ff              ldi16	r6, 0xff7e
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 3d 30              stsp16	[sp+0x30], r5
<L16>:
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 69 84              cmp32	q2, q1
 da 86 fa              breq16	-0x57a <L0>
 d6 fe                 adjsp	-0x2
 f0 14 5c              leasp	r4, 0x5c
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 26              leasp	r4, 0x26
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 e1 ed 01              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 da 6a fa              breq16	-0x596 <L0>
 f0 30 5a              ldsp16	r0, [sp+0x5a]
 f0 31 5c              ldsp16	r1, [sp+0x5c]
 f1 28                 mov	r6, r0
 c0 01                 ldi8	r4, 0x1
 88                    and	r6, r4
 f6 4e                 neg16	r6
 0e                    mov	r7, r6
 fa ef                 asr16i	r7, 0xf
 f7 80                 lsr32.1	q0
 f9 1a                 xor	r0, r6
 f9 3e                 xor	r1, r7
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f7 63                 add32	q0, q3
 e0 2c fe              jmp16	-468 <L8>
<L17>:
 f0 35 56              ldsp16	r5, [sp+0x56]
 f0 3d 32              stsp16	[sp+0x32], r5
 f4 a4                 tst8	r4
 da 3e fa              breq16	-0x5c2 <L0>
 d4 0c                 jmp8	0xc <L19>
<L18>:
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 f4 a4                 tst8	r4
 f8 0c                 cset.ne	r4
 f4 a4                 tst8	r4
 da 30 fa              breq16	-0x5d0 <L0>
<L19>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 35 32              ldsp16	r5, [sp+0x32]
 31                    cmp	r4, r5
 dd 27 fa              bruge16	-0x5d9 <L0>
 f4 10                 ldsp16	r4, [sp+0x4]
 a5                    xor	r5, r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 6f                 add32	q3, q3
 f7 6e                 add32	q3, q2
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 f0 35 3e              ldsp16	r5, [sp+0x3e]
 f7 6b                 add32	q2, q3
 f0 63 88              ldp24	q2, [q2]
 f0 36 4c              ldsp16	r6, [sp+0x4c]
 f0 37 4e              ldsp16	r7, [sp+0x4e]
 f7 6e                 add32	q3, q2
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 3f 26              stsp16	[sp+0x26], r7
 f0 30 50              ldsp16	r0, [sp+0x50]
 f0 31 52              ldsp16	r1, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f0 14 30              leasp	r4, 0x30
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 26              leasp	r4, 0x26
 f2 6a                 mov32	q3, q0
 e1 6a 01              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d0 23                 breq8	0x23 <L20>
 f0 36 2e              ldsp16	r6, [sp+0x2e]
 f0 37 30              ldsp16	r7, [sp+0x30]
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d0 16                 breq8	0x16 <L20>
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 f7 72                 sub32	q0, q2
 f0 69 c0              cmp32	q3, q0
 d8 09                 bruge8	0x9 <L20>
 f7 6e                 add32	q3, q2
 f0 60 cc              ldp8u	r6, [q3]
 f4 a6                 tst8	r6
 d0 0d                 breq8	0xd <L21>
<L20>:
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 c8 03                 addi.s8	r4, 0x3
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 e0 b8 f9              jmp16	-1608 <L0>
<L21>:
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 ca 03                 addi.s8	r6, 0x3
 f7 54                 st16	[r6+], r4
 59                    st8	[r6], r5
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 da a6 f9              breq16	-0x65a <L0>
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 c8 06                 addi.s8	r4, 0x6
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f0 6b c8              st32	[r4], q3
 e0 95 f9              jmp16	-1643 <L0>

<open_section>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f4 60                 stsp16	[sp+0x8], r4
 f0 34 19              ldsp16	r4, [sp+0x19]
 f0 32 15              ldsp16	r2, [sp+0x15]
 f0 33 17              ldsp16	r3, [sp+0x17]
 cd 04                 cmpi.s8	r5, 0x4
 d0 11                 breq8	0x11 <L0>
 cd 03                 cmpi.s8	r5, 0x3
 d1 1e                 brne8	0x1e <L2>
 f0 00 03              ldi8	r0, 0x3
 f2 39                 sub	r1, r1
 f0 69 40              cmp32	q1, q0
 d8 49                 bruge8	0x49 <L3>
 a0                    xor	r4, r4
 d4 70                 jmp8	0x70 <L5>
<L0>:
 f7 67                 add32	q1, q3
 f4 20                 ldsp16	r4, [sp+0x8]
 04                    mov	r5, r4
 c9 18                 addi.s8	r5, 0x18
 f0 6b 4a              st32	[r5], q1
 c8 14                 addi.s8	r4, 0x14
<L1>:
 f0 6b c8              st32	[r4], q3
 d4 5d                 jmp8	0x5d <L4>
<L2>:
 a0                    xor	r4, r4
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f0 69 40              cmp32	q1, q0
 d2 54                 brult8	0x54 <L5>
 f0 62 8c              ldp16	r4, [q3]
 f4 58                 stsp16	[sp+0x6], r4
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f4 a5                 tst8	r5
 d0 4e                 breq8	0x4e <L6>
 cd 01                 cmpi.s8	r5, 0x1
 d1 73                 brne8	0x73 <L7>
 f2 68                 mov32	q2, q0
 f7 6a                 add32	q2, q2
 f7 68                 add32	q2, q0
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 68                 add32	q2, q0
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 69 48              cmp32	q1, q2
 a0                    xor	r4, r4
 d1 2d                 brne8	0x2d <L5>
 e0 81 00              jmp16	129 <L8>
<L3>:
 f4 58                 stsp16	[sp+0x6], r4
 f0 63 8c              ldp24	q2, [q3]
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 3b 04              stsp16	[sp+0x4], r3
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 6b 84              st32	[r2], q2
 f7 63                 add32	q0, q3
 f4 20                 ldsp16	r4, [sp+0x8]
 04                    mov	r5, r4
 c9 0c                 addi.s8	r5, 0xc
 f0 6b 0a              st32	[r5], q0
 f0 30 02              ldsp16	r0, [sp+0x2]
 f0 31 04              ldsp16	r1, [sp+0x4]
 f7 63                 add32	q0, q3
 c8 10                 addi.s8	r4, 0x10
 f0 6b 08              st32	[r4], q0
<L4>:
 c0 01                 ldi8	r4, 0x1
<L5>:
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L6>:
 f2 68                 mov32	q2, q0
 f7 6a                 add32	q2, q2
 f7 6a                 add32	q2, q2
 f7 6a                 add32	q2, q2
 f7 68                 add32	q2, q0
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 68                 add32	q2, q0
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 69 48              cmp32	q1, q2
 a0                    xor	r4, r4
 d1 df                 brne8	-0x21 <L5>
 f4 20                 ldsp16	r4, [sp+0x8]
 ee 18 3c              st16	[r4+28], r0
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 e0 6c ff              jmp16	-148 <L1>
<L7>:
 f4 41                 stsp16	[sp+0x0], r5
 c1 0c                 ldi8	r5, 0xc
 f1 20                 mov	r4, r0
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 e1 69 0a              call16	__avm_umulhisi3
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f0 00 02              ldi8	r0, 0x2
 f9 11                 or	r0, r4
 f1 20                 mov	r4, r0
 f0 69 48              cmp32	q1, q2
 a0                    xor	r4, r4
 f0 30 06              ldsp16	r0, [sp+0x6]
 d1 af                 brne8	-0x51 <L5>
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 01                 cmpi.s8	r4, 0x1
 d1 11                 brne8	0x11 <L9>
<L8>:
 f4 20                 ldsp16	r4, [sp+0x8]
 ee 18 3e              st16	[r4+30], r0
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 c8 04                 addi.s8	r4, 0x4
 e0 34 ff              jmp16	-204 <L1>
<L9>:
 f4 20                 ldsp16	r4, [sp+0x8]
 ee 18 40              st16	[r4+32], r0
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 c8 08                 addi.s8	r4, 0x8
 e0 23 ff              jmp16	-221 <L1>

<read_uleb128>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f0 32 1b              ldsp16	r2, [sp+0x1b]
 f0 6a 0a              ld32	q0, [r5]
 f0 69 0c              cmp32	q0, q3
 d8 76                 bruge8	0x76 <L4>
 f0 3a 06              stsp16	[sp+0x6], r2
 f4 61                 stsp16	[sp+0x8], r5
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f7 64                 add32	q1, q0
 f0 61 a0              ldp8s	r5, [q0]
 f4 69                 stsp16	[sp+0xa], r5
 c0 7f                 ldi8	r4, 0x7f
 84                    and	r5, r4
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 a4                 tst8	r4
 d3 12                 brslt8	0x12 <L1>
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 1a                 ldsp16	r6, [sp+0x6]
<L0>:
 f0 6b 4a              st32	[r5], q1
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 6b 8c              st32	[r6], q2
 c0 01                 ldi8	r4, 0x1
 d4 44                 jmp8	0x44 <L4>
<L1>:
 f0 69 4c              cmp32	q1, q3
 d8 3e                 bruge8	0x3e <L3>
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f0 61 84              ldp8s	r4, [q1]
 f4 68                 stsp16	[sp+0xa], r4
 fa 37                 lsl16i	r4, 0x7
 f4 40                 stsp16	[sp+0x0], r4
 c4 80 3f              ldi16	r4, 0x3f80
 f4 01                 ldsp16	r5, [sp+0x0]
 81                    and	r4, r5
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f9 51                 or	r2, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 f2 4b                 sub	r3, r3
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f4 a4                 tst8	r4
 d3 1b                 brslt8	0x1b <L5>
 a0                    xor	r4, r4
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 1a                 ldsp16	r6, [sp+0x6]
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
<L2>:
 f4 2b                 ldsp16	r7, [sp+0xa]
 f6 2f                 tst16	r7
 d1 b1                 brne8	-0x4f <L0>
 d4 01                 jmp8	0x1 <L4>
<L3>:
 a0                    xor	r4, r4
<L4>:
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L5>:
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
 f0 69 4c              cmp32	q1, q3
 a0                    xor	r4, r4
 d8 ed                 bruge8	-0x13 <L4>
 f0 60 84              ldp8u	r4, [q1]
 f4 68                 stsp16	[sp+0xa], r4
 fa 3e                 lsl16i	r4, 0xe
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f9 89                 or	r4, r2
 f4 70                 stsp16	[sp+0xc], r4
 c1 7f                 ldi8	r5, 0x7f
 f4 28                 ldsp16	r4, [sp+0xa]
 84                    and	r5, r4
 fa 82                 lsr16i	r5, 0x2
 f1 1d                 mov	r3, r5
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 3b 0e              stsp16	[sp+0xe], r3
 f0 02 03              ldi8	r2, 0x3
 f2 4b                 sub	r3, r3
 f7 64                 add32	q1, q0
 f4 a5                 tst8	r5
 d3 0b                 brslt8	0xb <L6>
 f6 45                 sext8	r5
 f4 69                 stsp16	[sp+0xa], r5
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 1a                 ldsp16	r6, [sp+0x6]
 a0                    xor	r4, r4
 d4 b2                 jmp8	-0x4e <L2>
<L6>:
 f0 69 4c              cmp32	q1, q3
 f4 21                 ldsp16	r5, [sp+0x8]
 d8 2b                 bruge8	0x2b <L7>
 f0 61 c4              ldp8s	r6, [q1]
 f4 a6                 tst8	r6
 a0                    xor	r4, r4
 d3 ac                 brslt8	-0x54 <L4>
 f4 6a                 stsp16	[sp+0xa], r6
 f1 16                 mov	r2, r6
 c2 ff                 ldi8	r6, 0xff
 af                    xor	r7, r7
 f9 c8                 and	r6, r2
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 c2 04                 ldi8	r6, 0x4
 f7 63                 add32	q0, q3
 f4 0a                 ldsp16	r6, [sp+0x2]
 fa 55                 lsl16i	r6, 0x5
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f9 79                 or	r3, r6
 f0 3b 0e              stsp16	[sp+0xe], r3
 f2 64                 mov32	q1, q0
 f4 1a                 ldsp16	r6, [sp+0x6]
 d4 80                 jmp8	-0x80 <L2>
<L7>:
 a0                    xor	r4, r4
 d4 86                 jmp8	-0x7a <L4>

<memset>:
 0c                    mov	r7, r4
 d7 11                 sys	memset
 03                    mov	r4, r7
 ef                    ret

<__ieee754_rem_pio2f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f2 62                 mov32	q0, q2
 ff 08                 fabs	q0
 f0 06 da 0f           ldi16	r2, 0xfda
 f0 07 49 3f           ldi16	r3, 0x3f49
 f0 69 40              cmp32	q1, q0
 d2 05                 brult8	0x5 <L0>
 af                    xor	r7, r7
 7b                    st16	[r6], r7
 e0 f3 00              jmp16	243 <L6>
<L0>:
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 04              cmp32	q0, q1
 d2 09                 brult8	0x9 <L1>
 af                    xor	r7, r7
 7b                    st16	[r6], r7
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 01                 fsub
 e0 df 00              jmp16	223 <L6>
<L1>:
 f0 06 e3 cb           ldi16	r2, 0xcbe3
 f0 07 16 40           ldi16	r3, 0x4016
 f0 69 40              cmp32	q1, q0
 d2 42                 brult8	0x42 <L3>
 f0 06 da 0f           ldi16	r2, 0xfda
 f0 07 c9 bf           ldi16	r3, 0xbfc9
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f2 68                 mov32	q2, q0
 f4 5a                 stsp16	[sp+0x6], r6
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 06                 fneg	q2
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 30 02              ldsp16	r0, [sp+0x2]
 f0 31 04              ldsp16	r1, [sp+0x4]
 f0 69 40              cmp32	q1, q0
 fd 26                 cmov.slt	r4, r6
 fd 2f                 cmov.slt	r5, r7
 f1 29                 mov	r6, r1
 fa df                 asr16i	r6, 0xf
 c3 01                 ldi8	r7, 0x1
 9e                    or	r7, r6
<L2>:
 f4 1a                 ldsp16	r6, [sp+0x6]
 7b                    st16	[r6], r7
 e0 90 00              jmp16	144 <L6>
<L3>:
 f0 06 00 50           ldi16	r2, 0x5000
 f0 07 c3 47           ldi16	r3, 0x47c3
 f0 69 40              cmp32	q1, q0
 d2 7c                 brult8	0x7c <L4>
 f2 42                 sub	r2, r2
 f0 07 80 44           ldi16	r3, 0x4480
 f0 69 40              cmp32	q1, q0
 d2 75                 brult8	0x75 <L5>
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f4 5a                 stsp16	[sp+0x6], r6
 c6 83 f9              ldi16	r6, 0xf983
 c7 a2 3f              ldi16	r7, 0x3fa2
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 ff 0f                 ftou16
 f4 ac                 inc16	r4
 08                    mov	r6, r4
 fa 9e                 lsr16i	r6, 0xe
 f4 8c                 lsr16.1	r4
 f4 40                 stsp16	[sp+0x0], r4
 04                    mov	r5, r4
 15                    add	r5, r5
 15                    add	r5, r5
 15                    add	r5, r5
 f1 15                 mov	r2, r5
 f1 1e                 mov	r3, r6
 c4 d9 1b              ldi16	r4, 0x1bd9
 c1 00                 ldi8	r5, 0x0
 f7 69                 add32	q2, q1
 f0 64 c8              ldp32	q3, [q2]
 f2 68                 mov32	q2, q0
 ff 01                 fsub
 c6 dd 1b              ldi16	r6, 0x1bdd
 c3 00                 ldi8	r7, 0x0
 f7 6d                 add32	q3, q1
 f0 64 cc              ldp32	q3, [q3]
 ff 01                 fsub
 f0 00 03              ldi8	r0, 0x3
 f4 02                 ldsp16	r6, [sp+0x0]
 f9 18                 and	r0, r6
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f0 06 dc 0f           ldi16	r2, 0xfdc
 f0 07 49 3f           ldi16	r3, 0x3f49
 f0 69 c4              cmp32	q3, q1
 d2 38                 brult8	0x38 <L8>
 f6 2d                 tst16	r5
 d3 22                 brslt8	0x22 <L7>
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 00                 fadd
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 00                 fadd
 f4 a8                 inc16	r0
 d4 20                 jmp8	0x20 <L8>
<L4>:
 d5 45                 call8	__kernel_rem_pio2f
 d4 03                 jmp8	0x3 <L6>
<L5>:
 e1 1e 07              call16	avm_rem_pio2f_medium
<L6>:
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L7>:
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 ff 00                 fadd
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 33              ldi16	r7, 0x33a2
 ff 00                 fadd
 f4 b0                 dec16	r0
<L8>:
 f0 38 00              stsp16	[sp+0x0], r0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 07                 fneg	q3
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
 f0 69 04              cmp32	q0, q1
 fd 34                 cmov.slt	r6, r4
 fd 3d                 cmov.slt	r7, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 af                    xor	r7, r7
 f4 02                 ldsp16	r6, [sp+0x0]
 2e                    sub	r7, r6
 fd 3e                 cmov.slt	r7, r6
 e0 2a ff              jmp16	-214 <L2>

<__kernel_rem_pio2f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d4                 adjsp	-0x2c
 f0 3e 2a              stsp16	[sp+0x2a], r6
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3d 24              stsp16	[sp+0x24], r5
 fa 77                 lsr16i	r4, 0x7
 c1 0a                 ldi8	r5, 0xa
 f3 11                 mulu8.w	r4, r5
 c1 7f                 ldi8	r5, 0x7f
 f0 36 22              ldsp16	r6, [sp+0x22]
 86                    and	r5, r6
 c2 80                 ldi8	r6, 0x80
 99                    or	r6, r5
 f4 6a                 stsp16	[sp+0xa], r6
 f1 14                 mov	r2, r4
 f2 4b                 sub	r3, r3
 c4 4b 2b              ldi16	r4, 0x2b4b
 c1 00                 ldi8	r5, 0x0
 f7 69                 add32	q2, q1
 f0 64 88              ldp32	q2, [q2]
 f4 0a                 ldsp16	r6, [sp+0x2]
 fa 98                 lsr16i	r6, 0x8
 f4 42                 stsp16	[sp+0x0], r6
 0c                    mov	r7, r4
 f3 1e                 mulu8.w	r7, r6
 fa a8                 lsr16i	r7, 0x8
 f4 7b                 stsp16	[sp+0xe], r7
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 3e 12              stsp16	[sp+0x12], r6
 f4 5a                 stsp16	[sp+0x6], r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f3 1e                 mulu8.w	r7, r6
 fa a8                 lsr16i	r7, 0x8
 f4 3a                 ldsp16	r6, [sp+0xe]
 1e                    add	r7, r6
 f4 5b                 stsp16	[sp+0x6], r7
 0c                    mov	r7, r4
 f4 2a                 ldsp16	r6, [sp+0xa]
 f3 1e                 mulu8.w	r7, r6
 fa a8                 lsr16i	r7, 0x8
 f4 73                 stsp16	[sp+0xc], r7
 f0 36 12              ldsp16	r6, [sp+0x12]
 f4 7a                 stsp16	[sp+0xe], r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f3 1e                 mulu8.w	r7, r6
 0b                    mov	r6, r7
 fa 98                 lsr16i	r6, 0x8
 f4 33                 ldsp16	r7, [sp+0xc]
 1b                    add	r6, r7
 f4 7a                 stsp16	[sp+0xe], r6
 f0 04 4f 2b           ldi16	r0, 0x2b4f
 f0 01 00              ldi8	r1, 0x0
 f7 61                 add32	q0, q1
 f0 37 12              ldsp16	r7, [sp+0x12]
 f4 02                 ldsp16	r6, [sp+0x0]
 f6 3e                 mul8	r7, r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 1e                    add	r7, r6
 f4 5b                 stsp16	[sp+0x6], r7
 08                    mov	r6, r4
 f1 76                 zext8	r6
 f4 72                 stsp16	[sp+0xc], r6
 f4 2b                 ldsp16	r7, [sp+0xa]
 f6 3b                 mul8	r6, r7
 f4 1b                 ldsp16	r7, [sp+0x6]
 1b                    add	r6, r7
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 36 12              ldsp16	r6, [sp+0x12]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f3 1b                 mulu8.w	r6, r7
 fa 98                 lsr16i	r6, 0x8
 f0 3e 16              stsp16	[sp+0x16], r6
 af                    xor	r7, r7
 f4 59                 stsp16	[sp+0x6], r5
 f4 63                 stsp16	[sp+0x8], r7
 fa 88                 lsr16i	r5, 0x8
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f4 0a                 ldsp16	r6, [sp+0x2]
 0e                    mov	r7, r6
 f3 1d                 mulu8.w	r7, r5
 fa a8                 lsr16i	r7, 0x8
 f0 36 16              ldsp16	r6, [sp+0x16]
 1e                    add	r7, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f6 39                 mul8	r6, r5
 1b                    add	r6, r7
 f0 3e 1e              stsp16	[sp+0x1e], r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 06                    mov	r5, r6
 f1 75                 zext8	r5
 f4 1a                 ldsp16	r6, [sp+0x6]
 f1 76                 zext8	r6
 f0 3e 16              stsp16	[sp+0x16], r6
 f6 39                 mul8	r6, r5
 f0 37 18              ldsp16	r7, [sp+0x18]
 1b                    add	r6, r7
 f0 3e 1c              stsp16	[sp+0x1c], r6
 09                    mov	r6, r5
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f6 3b                 mul8	r6, r7
 f4 3b                 ldsp16	r7, [sp+0xe]
 1b                    add	r6, r7
 f0 3e 18              stsp16	[sp+0x18], r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 3d 20              stsp16	[sp+0x20], r5
 f6 39                 mul8	r6, r5
 18                    add	r6, r4
 f0 3e 26              stsp16	[sp+0x26], r6
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 01                 ldsp16	r5, [sp+0x0]
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 11                    add	r4, r5
 f0 64 c0              ldp32	q3, [q0]
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 06                    mov	r5, r6
 f1 75                 zext8	r5
 f0 3d 1e              stsp16	[sp+0x1e], r5
 09                    mov	r6, r5
 f0 35 20              ldsp16	r5, [sp+0x20]
 f6 39                 mul8	r6, r5
 18                    add	r6, r4
 f0 3e 28              stsp16	[sp+0x28], r6
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 29                 ldsp16	r5, [sp+0xa]
 f6 36                 mul8	r5, r6
 14                    add	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 32                 ldsp16	r6, [sp+0xc]
 f6 38                 mul8	r6, r4
 f0 34 26              ldsp16	r4, [sp+0x26]
 18                    add	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 18                    add	r6, r4
 f4 72                 stsp16	[sp+0xc], r6
 f0 34 12              ldsp16	r4, [sp+0x12]
 f4 2a                 ldsp16	r6, [sp+0xa]
 f6 32                 mul8	r4, r6
 f0 36 18              ldsp16	r6, [sp+0x18]
 12                    add	r4, r6
 f0 3c 12              stsp16	[sp+0x12], r4
 f4 3a                 ldsp16	r6, [sp+0xe]
 02                    mov	r4, r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 29                 ldsp16	r5, [sp+0xa]
 f3 19                 mulu8.w	r6, r5
 fa 98                 lsr16i	r6, 0x8
 18                    add	r6, r4
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 36 16              ldsp16	r6, [sp+0x16]
 f6 39                 mul8	r6, r5
 f0 34 28              ldsp16	r4, [sp+0x28]
 18                    add	r6, r4
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 18                 ldsp16	r4, [sp+0x6]
 f3 12                 mulu8.w	r4, r6
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 34 12              ldsp16	r4, [sp+0x12]
 18                    add	r6, r4
 f4 01                 ldsp16	r5, [sp+0x0]
 f0 34 16              ldsp16	r4, [sp+0x16]
 f6 31                 mul8	r4, r5
 12                    add	r4, r6
 f4 32                 ldsp16	r6, [sp+0xc]
 fa 98                 lsr16i	r6, 0x8
 18                    add	r6, r4
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 14                    add	r5, r4
 f1 76                 zext8	r6
 01                    mov	r4, r5
 fa 38                 lsl16i	r4, 0x8
 92                    or	r4, r6
 f0 3c 12              stsp16	[sp+0x12], r4
 f4 3a                 ldsp16	r6, [sp+0xe]
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 70                 stsp16	[sp+0xc], r4
 f0 36 20              ldsp16	r6, [sp+0x20]
 f6 32                 mul8	r4, r6
 f0 36 18              ldsp16	r6, [sp+0x18]
 12                    add	r4, r6
 f4 03                 ldsp16	r7, [sp+0x0]
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f6 3b                 mul8	r6, r7
 0e                    mov	r7, r6
 1c                    add	r7, r4
 fa 88                 lsr16i	r5, 0x8
 17                    add	r5, r7
 f4 59                 stsp16	[sp+0x6], r5
 f1 75                 zext8	r5
 f0 34 12              ldsp16	r4, [sp+0x12]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 30                 sub	r0, r0
 f0 01 ff              ldi8	r1, 0xff
 f2 42                 sub	r2, r2
 f0 3f 14              stsp16	[sp+0x14], r7
 f7 77                 sub32	q1, q3
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 aa                    xor	r6, r6
 fa 87                 lsr16i	r5, 0x7
 f0 3d 16              stsp16	[sp+0x16], r5
 f4 a5                 tst8	r5
 fb 16                 cmov.eq	r2, r6
 fb 1f                 cmov.eq	r3, r7
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 da ca 00              breq16	0xca <L0>
 c2 02                 ldi8	r6, 0x2
 af                    xor	r7, r7
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f7 6e                 add32	q3, q2
 f0 04 fc ff           ldi16	r0, 0xfffc
 f0 01 ff              ldi8	r1, 0xff
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 aa                    xor	r6, r6
 c3 80                 ldi8	r7, 0x80
 f0 69 0c              cmp32	q0, q3
 da ab 00              breq16	0xab <L0>
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f4 28                 ldsp16	r4, [sp+0xa]
 f3 12                 mulu8.w	r4, r6
 f4 68                 stsp16	[sp+0xa], r4
 f4 38                 ldsp16	r4, [sp+0xe]
 f4 01                 ldsp16	r5, [sp+0x0]
 f3 11                 mulu8.w	r4, r5
 f0 3c 20              stsp16	[sp+0x20], r4
 f4 31                 ldsp16	r5, [sp+0xc]
 01                    mov	r4, r5
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 12                 mulu8.w	r4, r6
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 34 16              ldsp16	r4, [sp+0x16]
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f4 3a                 ldsp16	r6, [sp+0xe]
 02                    mov	r4, r6
 f0 36 22              ldsp16	r6, [sp+0x22]
 fe 26                 mul16	r4, r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 fa 98                 lsr16i	r6, 0x8
 18                    add	r6, r4
 02                    mov	r4, r6
 f0 37 10              ldsp16	r7, [sp+0x10]
 f1 17                 mov	r2, r7
 f4 0a                 ldsp16	r6, [sp+0x2]
 fe 16                 mul16	r2, r6
 f2 14                 add	r2, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f3 14                 mulu8.w	r5, r4
 f2 26                 add	r5, r2
 f0 34 20              ldsp16	r4, [sp+0x20]
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 04                    mov	r5, r4
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f4 19                 ldsp16	r5, [sp+0x6]
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 c0 03                 ldi8	r4, 0x3
 81                    and	r4, r5
 f2 04                 add	r0, r4
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 03                    mov	r4, r7
 fa 38                 lsl16i	r4, 0x8
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 94                    or	r5, r4
 fa 58                 lsl16i	r6, 0x8
 02                    mov	r4, r6
 f2 38                 sub	r1, r0
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 69 4c              cmp32	q1, q3
 fd 08                 cmov.slt	r1, r0
 f0 39 00              stsp16	[sp+0x0], r1
 ff 10                 s32tof
 f0 04 db 0f           ldi16	r0, 0xfdb
 f0 05 c9 2f           ldi16	r1, 0x2fc9
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 ff 04                 fneg	q0
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f0 69 4c              cmp32	q1, q3
 fd 04                 cmov.slt	r0, r4
 fd 0d                 cmov.slt	r1, r5
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 f4 01                 ldsp16	r5, [sp+0x0]
 71                    st16	[r4], r5
 f2 68                 mov32	q2, q0
 d6 2c                 adjsp	0x2c
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L0>:
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f0 36 2a              ldsp16	r6, [sp+0x2a]
 d6 2c                 adjsp	0x2c
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 d4 00                 jmp8	avm_reduce_extended

<avm_reduce_extended>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 c0                 adjsp	-0x40
 f0 3e 3e              stsp16	[sp+0x3e], r6
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 32              stsp16	[sp+0x32], r4
 f0 3d 34              stsp16	[sp+0x34], r5
 fa 77                 lsr16i	r4, 0x7
 c1 0a                 ldi8	r5, 0xa
 f3 11                 mulu8.w	r4, r5
 08                    mov	r6, r4
 af                    xor	r7, r7
 c4 4f 2b              ldi16	r4, 0x2b4f
 c1 00                 ldi8	r5, 0x0
 f7 6b                 add32	q2, q3
 f0 64 88              ldp32	q2, [q2]
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 c4 4b 2b              ldi16	r4, 0x2b4b
 c1 00                 ldi8	r5, 0x0
 f7 6b                 add32	q2, q3
 f0 64 88              ldp32	q2, [q2]
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 fa 38                 lsl16i	r4, 0x8
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 04                    mov	r5, r4
 fa 82                 lsr16i	r5, 0x2
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 f0 04 53 2b           ldi16	r0, 0x2b53
 f0 01 00              ldi8	r1, 0x0
 f7 63                 add32	q0, q3
 f0 62 c0              ldp16	r6, [q0]
 0e                    mov	r7, r6
 fa a2                 lsr16i	r7, 0x2
 f0 3f 24              stsp16	[sp+0x24], r7
 fa 5e                 lsl16i	r6, 0xe
 98                    or	r6, r4
 9d                    or	r7, r5
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 3f 18              stsp16	[sp+0x18], r7
 f4 00                 ldsp16	r4, [sp+0x0]
 fa 78                 lsr16i	r4, 0x8
 f0 3c 1a              stsp16	[sp+0x1a], r4
 06                    mov	r5, r6
 f3 14                 mulu8.w	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 f1 76                 zext8	r6
 f0 3e 20              stsp16	[sp+0x20], r6
 f0 34 24              ldsp16	r4, [sp+0x24]
 f1 74                 zext8	r4
 f4 78                 stsp16	[sp+0xe], r4
 f6 32                 mul8	r4, r6
 11                    add	r4, r5
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 0b                    mov	r6, r7
 af                    xor	r7, r7
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 fa 58                 lsl16i	r6, 0x8
 99                    or	r6, r5
 f4 52                 stsp16	[sp+0x4], r6
 f0 36 16              ldsp16	r6, [sp+0x16]
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f0 3d 14              stsp16	[sp+0x14], r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f4 2a                 ldsp16	r6, [sp+0xa]
 02                    mov	r4, r6
 fa 38                 lsl16i	r4, 0x8
 f4 1a                 ldsp16	r6, [sp+0x6]
 fa 98                 lsr16i	r6, 0x8
 98                    or	r6, r4
 f0 3e 26              stsp16	[sp+0x26], r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 0b                    mov	r6, r7
 02                    mov	r4, r6
 fa 38                 lsl16i	r4, 0x8
 f4 2a                 ldsp16	r6, [sp+0xa]
 92                    or	r4, r6
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f3 13                 mulu8.w	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 f1 76                 zext8	r6
 f0 3e 38              stsp16	[sp+0x38], r6
 f0 37 20              ldsp16	r7, [sp+0x20]
 f6 3b                 mul8	r6, r7
 18                    add	r6, r4
 f0 3e 1e              stsp16	[sp+0x1e], r6
 f0 34 24              ldsp16	r4, [sp+0x24]
 f4 02                 ldsp16	r6, [sp+0x0]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f6 3e                 mul8	r7, r6
 1c                    add	r7, r4
 f0 3f 2c              stsp16	[sp+0x2c], r7
 f0 34 14              ldsp16	r4, [sp+0x14]
 f6 32                 mul8	r4, r6
 11                    add	r4, r5
 f0 3c 2e              stsp16	[sp+0x2e], r4
 c0 7f                 ldi8	r4, 0x7f
 f0 36 32              ldsp16	r6, [sp+0x32]
 82                    and	r4, r6
 f0 01 80              ldi8	r1, 0x80
 f9 85                 or	r4, r1
 f4 68                 stsp16	[sp+0xa], r4
 f0 34 26              ldsp16	r4, [sp+0x26]
 f4 11                 ldsp16	r5, [sp+0x4]
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 26              stsp16	[sp+0x26], r4
 f0 3d 28              stsp16	[sp+0x28], r5
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 3e 30              stsp16	[sp+0x30], r6
 f4 00                 ldsp16	r4, [sp+0x0]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 1a                 ldsp16	r6, [sp+0x6]
 06                    mov	r5, r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 f4 38                 ldsp16	r4, [sp+0xe]
 f6 32                 mul8	r4, r6
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 11                    add	r4, r5
 f4 78                 stsp16	[sp+0xe], r4
 f0 36 10              ldsp16	r6, [sp+0x10]
 f1 76                 zext8	r6
 f4 00                 ldsp16	r4, [sp+0x0]
 fe 34                 mul16	r6, r4
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f0 34 22              ldsp16	r4, [sp+0x22]
 fe 2c                 mul16	r5, r4
 16                    add	r5, r6
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 29                 ldsp16	r5, [sp+0xa]
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f4 1a                 ldsp16	r6, [sp+0x6]
 06                    mov	r5, r6
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f0 36 16              ldsp16	r6, [sp+0x16]
 02                    mov	r4, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 20              ldsp16	r7, [sp+0x20]
 f6 3b                 mul8	r6, r7
 18                    add	r6, r4
 f0 3e 3a              stsp16	[sp+0x3a], r6
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 18                    add	r6, r4
 f0 3e 3c              stsp16	[sp+0x3c], r6
 f0 37 18              ldsp16	r7, [sp+0x18]
 0b                    mov	r6, r7
 fa 98                 lsr16i	r6, 0x8
 f0 3e 10              stsp16	[sp+0x10], r6
 f4 02                 ldsp16	r6, [sp+0x0]
 02                    mov	r4, r6
 f0 36 10              ldsp16	r6, [sp+0x10]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 3a                 ldsp16	r6, [sp+0xe]
 12                    add	r4, r6
 f0 3c 36              stsp16	[sp+0x36], r4
 f0 34 20              ldsp16	r4, [sp+0x20]
 0c                    mov	r7, r4
 f0 36 30              ldsp16	r6, [sp+0x30]
 f6 3e                 mul8	r7, r6
 1d                    add	r7, r5
 f0 3f 2c              stsp16	[sp+0x2c], r7
 f0 35 22              ldsp16	r5, [sp+0x22]
 f1 75                 zext8	r5
 f6 34                 mul8	r5, r4
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 14                    add	r5, r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 0e                    mov	r7, r6
 f0 34 32              ldsp16	r4, [sp+0x32]
 fe 3c                 mul16	r7, r4
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 1c                    add	r7, r4
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f0 34 16              ldsp16	r4, [sp+0x16]
 08                    mov	r6, r4
 f1 76                 zext8	r6
 0e                    mov	r7, r6
 f4 29                 ldsp16	r5, [sp+0xa]
 f6 3d                 mul8	r7, r5
 f4 7b                 stsp16	[sp+0xe], r7
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 f4 39                 ldsp16	r5, [sp+0xe]
 17                    add	r5, r7
 f4 79                 stsp16	[sp+0xe], r5
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f6 3b                 mul8	r6, r7
 f0 35 3a              ldsp16	r5, [sp+0x3a]
 19                    add	r6, r5
 f0 3e 32              stsp16	[sp+0x32], r6
 f4 29                 ldsp16	r5, [sp+0xa]
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f0 35 3c              ldsp16	r5, [sp+0x3c]
 11                    add	r4, r5
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f3 13                 mulu8.w	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f4 1a                 ldsp16	r6, [sp+0x6]
 06                    mov	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f3 16                 mulu8.w	r5, r6
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f0 36 14              ldsp16	r6, [sp+0x14]
 f4 28                 ldsp16	r4, [sp+0xa]
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 34 36              ldsp16	r4, [sp+0x36]
 18                    add	r6, r4
 f0 3e 2e              stsp16	[sp+0x2e], r6
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 08                    mov	r6, r4
 f0 37 30              ldsp16	r7, [sp+0x30]
 f3 1b                 mulu8.w	r6, r7
 fa 98                 lsr16i	r6, 0x8
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 1b                    add	r6, r7
 f0 3e 1e              stsp16	[sp+0x1e], r6
 08                    mov	r6, r4
 f0 34 30              ldsp16	r4, [sp+0x30]
 f6 38                 mul8	r6, r4
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 18                    add	r6, r4
 f0 3e 2a              stsp16	[sp+0x2a], r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 f1 76                 zext8	r6
 f4 5a                 stsp16	[sp+0x6], r6
 0e                    mov	r7, r6
 f4 28                 ldsp16	r4, [sp+0xa]
 f6 3c                 mul8	r7, r4
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 1c                    add	r7, r4
 f0 3f 36              stsp16	[sp+0x36], r7
 02                    mov	r4, r6
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f6 32                 mul8	r4, r6
 11                    add	r4, r5
 f0 35 20              ldsp16	r5, [sp+0x20]
 f0 36 10              ldsp16	r6, [sp+0x10]
 f6 36                 mul8	r5, r6
 f0 36 16              ldsp16	r6, [sp+0x16]
 16                    add	r5, r6
 f0 3d 2c              stsp16	[sp+0x2c], r5
 f0 35 32              ldsp16	r5, [sp+0x32]
 fa 88                 lsr16i	r5, 0x8
 f4 3a                 ldsp16	r6, [sp+0xe]
 16                    add	r5, r6
 f0 3d 32              stsp16	[sp+0x32], r5
 f0 36 38              ldsp16	r6, [sp+0x38]
 f4 29                 ldsp16	r5, [sp+0xa]
 f6 39                 mul8	r6, r5
 18                    add	r6, r4
 f0 3e 30              stsp16	[sp+0x30], r6
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 35 22              ldsp16	r5, [sp+0x22]
 f3 14                 mulu8.w	r5, r4
 f4 12                 ldsp16	r6, [sp+0x4]
 f3 18                 mulu8.w	r6, r4
 f4 52                 stsp16	[sp+0x4], r6
 f0 36 26              ldsp16	r6, [sp+0x26]
 0e                    mov	r7, r6
 f3 1c                 mulu8.w	r7, r4
 fa a8                 lsr16i	r7, 0x8
 f0 34 36              ldsp16	r4, [sp+0x36]
 1c                    add	r7, r4
 f0 3f 16              stsp16	[sp+0x16], r7
 02                    mov	r4, r6
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f3 13                 mulu8.w	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f0 36 2a              ldsp16	r6, [sp+0x2a]
 12                    add	r4, r6
 f4 78                 stsp16	[sp+0xe], r4
 01                    mov	r4, r5
 fa 78                 lsr16i	r4, 0x8
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 11                    add	r4, r5
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 f6 3c                 mul8	r7, r4
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 1c                    add	r7, r4
 f0 3f 2e              stsp16	[sp+0x2e], r7
 f0 35 14              ldsp16	r5, [sp+0x14]
 f4 2a                 ldsp16	r6, [sp+0xa]
 f6 36                 mul8	r5, r6
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 14                    add	r5, r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 34 24              ldsp16	r4, [sp+0x24]
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 11                 ldsp16	r5, [sp+0x4]
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 f4 18                 ldsp16	r4, [sp+0x6]
 f0 35 20              ldsp16	r5, [sp+0x20]
 f6 31                 mul8	r4, r5
 f0 36 26              ldsp16	r6, [sp+0x26]
 f1 76                 zext8	r6
 0e                    mov	r7, r6
 f6 3d                 mul8	r7, r5
 f0 35 30              ldsp16	r5, [sp+0x30]
 1d                    add	r7, r5
 f0 3f 24              stsp16	[sp+0x24], r7
 f4 11                 ldsp16	r5, [sp+0x4]
 11                    add	r4, r5
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 34 32              ldsp16	r4, [sp+0x32]
 fa 78                 lsr16i	r4, 0x8
 f0 35 14              ldsp16	r5, [sp+0x14]
 11                    add	r4, r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 17                    add	r5, r7
 f0 3d 20              stsp16	[sp+0x20], r5
 f1 74                 zext8	r4
 fa 48                 lsl16i	r5, 0x8
 94                    or	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 f0 34 26              ldsp16	r4, [sp+0x26]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f3 13                 mulu8.w	r4, r7
 fa 78                 lsr16i	r4, 0x8
 f0 35 22              ldsp16	r5, [sp+0x22]
 11                    add	r4, r5
 f0 3c 26              stsp16	[sp+0x26], r4
 f0 3d 28              stsp16	[sp+0x28], r5
 02                    mov	r4, r6
 f6 3b                 mul8	r6, r7
 f4 39                 ldsp16	r5, [sp+0xe]
 19                    add	r6, r5
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f6 32                 mul8	r4, r6
 f0 35 16              ldsp16	r5, [sp+0x16]
 11                    add	r4, r5
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 07                    mov	r5, r7
 f3 14                 mulu8.w	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f0 34 24              ldsp16	r4, [sp+0x24]
 14                    add	r5, r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 37 38              ldsp16	r7, [sp+0x38]
 f6 3e                 mul8	r7, r6
 f4 18                 ldsp16	r4, [sp+0x6]
 1c                    add	r7, r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 1b                    add	r6, r7
 f4 2b                 ldsp16	r7, [sp+0xa]
 f6 3c                 mul8	r7, r4
 1e                    add	r7, r6
 f0 34 20              ldsp16	r4, [sp+0x20]
 fa 78                 lsr16i	r4, 0x8
 13                    add	r4, r7
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f0 36 22              ldsp16	r6, [sp+0x22]
 16                    add	r5, r6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f0 37 16              ldsp16	r7, [sp+0x16]
 1b                    add	r6, r7
 f1 74                 zext8	r4
 fa 48                 lsl16i	r5, 0x8
 94                    or	r5, r4
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f0 37 14              ldsp16	r7, [sp+0x14]
 13                    add	r4, r7
 f1 76                 zext8	r6
 0c                    mov	r7, r4
 fa 68                 lsl16i	r7, 0x8
 9e                    or	r7, r6
 f4 6b                 stsp16	[sp+0xa], r7
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f0 36 26              ldsp16	r6, [sp+0x26]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 1e                    add	r7, r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 f4 2a                 ldsp16	r6, [sp+0xa]
 0e                    mov	r7, r6
 09                    mov	r6, r5
 f0 00 03              ldi8	r0, 0x3
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f9 14                 and	r0, r5
 f9 84                 and	r4, r1
 fa 77                 lsr16i	r4, 0x7
 f2 4b                 sub	r3, r3
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3b 1c              stsp16	[sp+0x1c], r3
 f4 a4                 tst8	r4
 f2 39                 sub	r1, r1
 d0 17                 breq8	0x17 <L0>
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f2 3c                 sub	r1, r4
 f6 2c                 tst16	r4
 f8 04                 cset.eq	r4
 a5                    xor	r5, r5
 f7 6b                 add32	q2, q3
 f4 a8                 inc16	r0
 d4 06                 jmp8	0x6 <L1>
<L0>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f1 0c                 mov	r1, r4
 02                    mov	r4, r6
 07                    mov	r5, r7
<L1>:
 f0 38 0a              stsp16	[sp+0xa], r0
 ff 11                 u32tof
 aa                    xor	r6, r6
 c7 80 2f              ldi16	r7, 0x2f80
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f1 21                 mov	r4, r1
 ff 0d                 u16tof
 c7 80 27              ldi16	r7, 0x2780
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 c6 db 0f              ldi16	r6, 0xfdb
 c7 c9 3f              ldi16	r7, 0x3fc9
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f4 09                 ldsp16	r5, [sp+0x2]
 09                    mov	r6, r5
 fa 9f                 lsr16i	r6, 0xf
 f2 69                 mov32	q2, q1
 ff 06                 fneg	q2
 f0 30 1a              ldsp16	r0, [sp+0x1a]
 f5 06                 cmp	r0, r6
 fb 22                 cmov.eq	r4, r2
 fb 2b                 cmov.eq	r5, r3
 aa                    xor	r6, r6
 f1 06                 mov	r0, r6
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f2 31                 sub	r0, r1
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c4              cmp32	q3, q1
 fd 08                 cmov.slt	r1, r0
 f0 36 3e              ldsp16	r6, [sp+0x3e]
 f5 59                 st16	[r6], r1
 d6 40                 adjsp	0x40
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_rem_pio2f_medium>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 f4 72                 stsp16	[sp+0xc], r6
 f2 62                 mov32	q0, q2
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 ff 08                 fabs	q0
 c6 83 f9              ldi16	r6, 0xf983
 c7 a2 3f              ldi16	r7, 0x3fa2
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 ff 13                 ftou32
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f7 66                 add32	q1, q2
 f7 81                 lsr32.1	q1
 f2 69                 mov32	q2, q1
 ff 11                 u32tof
 c6 00 80              ldi16	r6, 0x8000
 99                    or	r6, r5
 0e                    mov	r7, r6
 f4 50                 stsp16	[sp+0x4], r4
 f4 5b                 stsp16	[sp+0x6], r7
 aa                    xor	r6, r6
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 c6 22 aa              ldi16	r6, 0xaa22
 c7 fd 39              ldi16	r7, 0x39fd
 f2 62                 mov32	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 1d                 fma
 f0 00 03              ldi8	r0, 0x3
 f9 08                 and	r0, r2
 c6 db 0f              ldi16	r6, 0xfdb
 c7 49 3f              ldi16	r7, 0x3f49
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d1 1c                 brne8	0x1c <L0>
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 bf              ldi16	r7, 0xbfc9
 ff 00                 fadd
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 b3              ldi16	r7, 0xb3a2
 ff 00                 fadd
 f4 a8                 inc16	r0
 c2 01                 ldi8	r6, 0x1
 f9 c0                 and	r6, r0
 f4 a6                 tst8	r6
 d1 3e                 brne8	0x3e <L4>
 d4 26                 jmp8	0x26 <L2>
<L0>:
 c6 db 0f              ldi16	r6, 0xfdb
 c7 49 bf              ldi16	r7, 0xbf49
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 d1 12                 brne8	0x12 <L1>
 c6 da 0f              ldi16	r6, 0xfda
 c7 c9 3f              ldi16	r7, 0x3fc9
 ff 00                 fadd
 c6 69 21              ldi16	r6, 0x2169
 c7 a2 33              ldi16	r7, 0x33a2
 ff 00                 fadd
 f4 b0                 dec16	r0
<L1>:
 c2 01                 ldi8	r6, 0x1
 f9 c0                 and	r6, r0
 f4 a6                 tst8	r6
 d1 16                 brne8	0x16 <L4>
<L2>:
 09                    mov	r6, r5
 1a                    add	r6, r6
 98                    or	r6, r4
 f6 2e                 tst16	r6
 d1 2c                 brne8	0x2c <L5>
<L3>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 32                 ldsp16	r6, [sp+0xc]
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 e0 65 f8              jmp16	__kernel_rem_pio2f
<L4>:
 aa                    xor	r6, r6
 c7 80 f5              ldi16	r7, 0xf580
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f7 6d                 add32	q3, q1
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 f0 69 4c              cmp32	q1, q3
 d2 d4                 brult8	-0x2c <L3>
<L5>:
 aa                    xor	r6, r6
 f2 58                 sub	r6, r0
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f6 2b                 tst16	r3
 fd 70                 cmov.sge	r6, r0
 f4 33                 ldsp16	r7, [sp+0xc]
 7e                    st16	[r7], r6
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 07                 fneg	q3
 fd 74                 cmov.sge	r6, r4
 fd 7d                 cmov.sge	r7, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_umulhisi3>:
 d6 f8                 adjsp	-0x8
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f4 52                 stsp16	[sp+0x4], r6
 f1 75                 zext8	r5
 f4 41                 stsp16	[sp+0x0], r5
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 f3 19                 mulu8.w	r6, r5
 f4 5a                 stsp16	[sp+0x6], r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f3 1b                 mulu8.w	r6, r7
 fa 78                 lsr16i	r4, 0x8
 f4 11                 ldsp16	r5, [sp+0x4]
 0c                    mov	r7, r4
 f3 1d                 mulu8.w	r7, r5
 f4 4b                 stsp16	[sp+0x2], r7
 f4 01                 ldsp16	r5, [sp+0x0]
 f3 11                 mulu8.w	r4, r5
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 f4 09                 ldsp16	r5, [sp+0x2]
 1d                    add	r7, r5
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 17                    add	r5, r7
 f4 51                 stsp16	[sp+0x4], r5
 18                    add	r6, r4
 fa 38                 lsl16i	r4, 0x8
 f4 1b                 ldsp16	r7, [sp+0x6]
 04                    mov	r5, r4
 17                    add	r5, r7
 0d                    mov	r7, r5
 3c                    cmp	r7, r4
 f8 14                 cset.ult	r4
 f4 11                 ldsp16	r5, [sp+0x4]
 11                    add	r4, r5
 fa 58                 lsl16i	r6, 0x8
 f4 19                 ldsp16	r5, [sp+0x6]
 19                    add	r6, r5
 3b                    cmp	r6, r7
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 02                    mov	r4, r6
 d6 08                 adjsp	0x8
 ef                    ret

<__avm_mulsi3>:
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f1 05                 mov	r0, r5
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 f2 24                 add	r5, r0
 f4 61                 stsp16	[sp+0x8], r5
 06                    mov	r5, r6
 fa 8f                 lsr16i	r5, 0xf
 17                    add	r5, r7
 fe 2c                 mul16	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 21                 ldsp16	r5, [sp+0x8]
 fe 2e                 mul16	r5, r6
 f4 61                 stsp16	[sp+0x8], r5
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 51                 stsp16	[sp+0x4], r5
 f1 76                 zext8	r6
 04                    mov	r5, r4
 f1 75                 zext8	r5
 0d                    mov	r7, r5
 f3 1e                 mulu8.w	r7, r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 13                 ldsp16	r7, [sp+0x4]
 f3 3d                 mulsu8.w	r7, r5
 f4 43                 stsp16	[sp+0x0], r7
 fa 78                 lsr16i	r4, 0x8
 f4 11                 ldsp16	r5, [sp+0x4]
 0c                    mov	r7, r4
 f3 2d                 muls8.w	r7, r5
 f3 32                 mulsu8.w	r4, r6
 04                    mov	r5, r4
 fa c8                 asr16i	r5, 0x8
 17                    add	r5, r7
 f4 03                 ldsp16	r7, [sp+0x0]
 0b                    mov	r6, r7
 fa d8                 asr16i	r6, 0x8
 19                    add	r6, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 19                    add	r6, r5
 f4 62                 stsp16	[sp+0x8], r6
 1c                    add	r7, r4
 fa 38                 lsl16i	r4, 0x8
 f4 19                 ldsp16	r5, [sp+0x6]
 08                    mov	r6, r4
 19                    add	r6, r5
 06                    mov	r5, r6
 34                    cmp	r5, r4
 f8 14                 cset.ult	r4
 f4 22                 ldsp16	r6, [sp+0x8]
 12                    add	r4, r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 12                    add	r4, r6
 fa 68                 lsl16i	r7, 0x8
 f4 1a                 ldsp16	r6, [sp+0x6]
 1e                    add	r7, r6
 3d                    cmp	r7, r5
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 03                    mov	r4, r7
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
