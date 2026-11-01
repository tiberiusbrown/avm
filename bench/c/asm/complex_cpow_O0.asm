
complex_cpow_O0.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 complex_cpow_O0.c
00000100 l     O .data	00000008 result
00000108 l     O .data	00000004 input_real
0000010c l     O .data	00000004 input_imag
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 trap_report.c
00000000 l    df *ABS*	00000000 trap_lookup.c
00000c00 l     F .text	0000010f open_section
00000d0f l     F .text	00000103 read_uleb128
00000000 l    df *ABS*	00000000 string.c
00000000 l    df *ABS*	00000000 pgmspace.c
00000000 l    df *ABS*	00000000 font_br5n.c
00000000 l    df *ABS*	00000000 pow.c
000010dc l     F .text	0000022c cx_pow_zero
00000000 l    df *ABS*	00000000 exp_log.c
00000000 l    df *ABS*	00000000 ef_exp.c
00000000 l    df *ABS*	00000000 stdlib.c
00000000 l    df *ABS*	00000000 avm.c
00000000 l    df *ABS*	00000000 ctype.c
00000000 l    df *ABS*	00000000 strtof.c
00000000 l    df *ABS*	00000000 strtof_internal.c
00000000 l    df *ABS*	00000000 sf_copysign.c
00000000 l    df *ABS*	00000000 sf_sincos.c
00000000 l    df *ABS*	00000000 sf_fabs.c
00000000 l    df *ABS*	00000000 ef_log1p.c
00000000 l    df *ABS*	00000000 ef_log.c
00000000 l    df *ABS*	00000000 ef_atan2.c
00000000 l    df *ABS*	00000000 ef_fmod.c
00001a80 l     F .text	00000076 avm_fmod_special
00000000 l    df *ABS*	00000000 integer.c
00000000 l    df *ABS*	00000000 wide_integer.c
00000000 l    df *ABS*	00000000 complex.c
000023e3 l       .init_array	00000000 .hidden __init_array_end
000023e3 l       .init_array	00000000 .hidden __init_array_start
000023e3 l       .fini_array	00000000 .hidden __fini_array_start
000023e3 l       .fini_array	00000000 .hidden __fini_array_end
00000390 g     F .text	00000015 __avm_trap_entry
00000200 g     F .text	00000023 _start
00000267 g     F .text	000000c2 avm_test_main
0000032b g     F .text	00000065 __avm_terminate
00000329 g     F .text	00000002 avm_halt
00000e17 g     F .text	000002c5 cpowf
00002042 g     O .rodata	000003a1 _avm_font_br5n_storage
00000000  w      *UND*	00000000 __avm_run_local_dtors
000004dc g     F .text	00000724 __avm_trap_lookup
000003a5 g     F .text	00000137 __avm_trap_report
00000110 g     O .data	00000002 __avm_errno
00000e12 g     F .text	00000005 memset
00000500 g       *ABS*	00000000 __avm_framebuffer
00001b41 g     F .text	00000068 __avm_mulsi3
00001af6 g     F .text	0000004b __avm_umulhisi3
0000160b g     F .text	00000135 log1pf
00001838 g     F .text	00000227 atan2f
00001439 g     F .text	00000119 expf
00001a5f g     F .text	00000021 fmodf
00001740 g     F .text	000000f8 logf
00001552 g     F .text	00000015 copysignf
00001608 g     F .text	00000003 fabsf
00001567 g     F .text	000000a1 sincosf
00001308 g     F .text	00000131 clogf
00001ba9 g     F .text	000003e6 __mulsc3

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d5 1b                 call8	avm_run_constructors
 d5 5d                 call8	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 e1 15 01              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 06 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 e3 23              ldi16	r4, 0x23e3
 c1 00                 ldi8	r5, 0x0
 c6 e3 23              ldi16	r6, 0x23e3
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 e3 23           ldi16	r0, 0x23e3
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 e3 23           ldi16	r2, 0x23e3
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
 b1                    push16	r1
 b0                    push16	r0
 d6 d0                 adjsp	-0x30
 c4 08 01              ldi16	r4, 0x108
 f0 6a 88              ld32	q2, [r4]
 c6 0c 01              ldi16	r6, 0x10c
 f0 6a cc              ld32	q3, [r6]
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 3f 26              stsp16	[sp+0x26], r7
 d7 01                 sys	debug_break
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 37 26              ldsp16	r7, [sp+0x26]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 c4 33 33              ldi16	r4, 0x3333
 c5 33 3f              ldi16	r5, 0x3f33
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c4 cd cc              ldi16	r4, 0xcccd
 c5 4c be              ldi16	r5, 0xbe4c
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f3 7c                 ldsp8u	r4, [sp+0xf]
 f0 2c 1f              stsp8	[sp+0x1f], r4
 f3 78                 ldsp8u	r4, [sp+0xe]
 f0 2c 1e              stsp8	[sp+0x1e], r4
 f3 74                 ldsp8u	r4, [sp+0xd]
 f0 2c 1d              stsp8	[sp+0x1d], r4
 f3 70                 ldsp8u	r4, [sp+0xc]
 f0 2c 1c              stsp8	[sp+0x1c], r4
 f3 6c                 ldsp8u	r4, [sp+0xb]
 f0 2c 1b              stsp8	[sp+0x1b], r4
 f3 68                 ldsp8u	r4, [sp+0xa]
 f0 2c 1a              stsp8	[sp+0x1a], r4
 f3 64                 ldsp8u	r4, [sp+0x9]
 f0 2c 19              stsp8	[sp+0x19], r4
 f3 60                 ldsp8u	r4, [sp+0x8]
 f0 2c 18              stsp8	[sp+0x18], r4
 f3 5c                 ldsp8u	r4, [sp+0x7]
 f0 2c 17              stsp8	[sp+0x17], r4
 f3 58                 ldsp8u	r4, [sp+0x6]
 f0 2c 16              stsp8	[sp+0x16], r4
 f3 54                 ldsp8u	r4, [sp+0x5]
 f0 2c 15              stsp8	[sp+0x15], r4
 f3 50                 ldsp8u	r4, [sp+0x4]
 f0 2c 14              stsp8	[sp+0x14], r4
 f3 4c                 ldsp8u	r4, [sp+0x3]
 f0 2c 13              stsp8	[sp+0x13], r4
 f3 48                 ldsp8u	r4, [sp+0x2]
 f0 2c 12              stsp8	[sp+0x12], r4
 f3 44                 ldsp8u	r4, [sp+0x1]
 f0 2c 11              stsp8	[sp+0x11], r4
 f3 40                 ldsp8u	r4, [sp+0x0]
 f0 2c 10              stsp8	[sp+0x10], r4
 f0 14 28              leasp	r4, 0x28
 f0 15 18              leasp	r5, 0x18
 f0 16 10              leasp	r6, 0x10
 e1 0e 0b              call16	cpowf
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 f0 30 2c              ldsp16	r0, [sp+0x2c]
 f0 31 2e              ldsp16	r1, [sp+0x2e]
 c6 00 01              ldi16	r6, 0x100
 f0 6b 8c              st32	[r6], q2
 c4 04 01              ldi16	r4, 0x104
 f0 6b 08              st32	[r4], q0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 30                 adjsp	0x30
 b8                    pop16	r0
 b9                    pop16	r1
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
 e1 c0 fc              call16	-832 <__avm_run_local_dtors>
<L0>:
 c4 e3 23              ldi16	r4, 0x23e3
 c1 00                 ldi8	r5, 0x0
 c6 e3 23              ldi16	r6, 0x23e3
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 e3 23           ldi16	r2, 0x23e3
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 e3 23           ldi16	r0, 0x23e3
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
 e1 77 fc              call16	-905 <__avm_run_local_dtors>
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
 c4 42 20              ldi16	r4, 0x2042
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
 c6 13 20              ldi16	r6, 0x2013
 c3 00                 ldi8	r7, 0x0
 d4 13                 jmp8	0x13 <L3>
<L0>:
 c6 23 20              ldi16	r6, 0x2023
 c3 00                 ldi8	r7, 0x0
 d4 0c                 jmp8	0xc <L3>
<L1>:
 c6 04 20              ldi16	r6, 0x2004
 c3 00                 ldi8	r7, 0x0
 d4 05                 jmp8	0x5 <L3>
<L2>:
 c6 35 20              ldi16	r6, 0x2035
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
 c6 8f 1f              ldi16	r6, 0x1f8f
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
 c6 a0 1f              ldi16	r6, 0x1fa0
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 11                 ldi8	r5, 0x11
 f1 13                 mov	r2, r3
 d7 36                 sys	draw_textfv_p
 d4 0a                 jmp8	0xa <L5>
<L4>:
 c6 a9 1f              ldi16	r6, 0x1fa9
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
 c6 ae 1f              ldi16	r6, 0x1fae
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 17                 ldi8	r5, 0x17
 d7 36                 sys	draw_textfv_p
 d4 0a                 jmp8	0xa <L7>
<L6>:
 c6 b8 1f              ldi16	r6, 0x1fb8
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
 c6 bc 1f              ldi16	r6, 0x1fbc
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 1d                 ldi8	r5, 0x1d
 d7 36                 sys	draw_textfv_p
 ed 90 2c              ld16	r4, [r0+12]
 f4 40                 stsp16	[sp+0x0], r4
 ed 90 2e              ld16	r4, [r0+14]
 f4 48                 stsp16	[sp+0x2], r4
 c6 cc 1f              ldi16	r6, 0x1fcc
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 23                 ldi8	r5, 0x23
 d7 36                 sys	draw_textfv_p
 ed 90 30              ld16	r4, [r0+16]
 f4 40                 stsp16	[sp+0x0], r4
 ed 90 32              ld16	r4, [r0+18]
 f4 48                 stsp16	[sp+0x2], r4
 c6 dc 1f              ldi16	r6, 0x1fdc
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 29                 ldi8	r5, 0x29
 d7 36                 sys	draw_textfv_p
 ed 90 34              ld16	r4, [r0+20]
 f4 40                 stsp16	[sp+0x0], r4
 ed 90 36              ld16	r4, [r0+22]
 f4 48                 stsp16	[sp+0x2], r4
 c6 ec 1f              ldi16	r6, 0x1fec
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 2f                 ldi8	r5, 0x2f
 d7 36                 sys	draw_textfv_p
 ed 80 26              ld8u	r4, [r0+6]
 f4 40                 stsp16	[sp+0x0], r4
 c6 fc 1f              ldi16	r6, 0x1ffc
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
 e1 19 13              call16	__avm_mulsi3
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
 e1 c9 12              call16	__avm_mulsi3
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
 e1 23 0e              call16	__avm_umulhisi3
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

<cpowf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 c4                 adjsp	-0x3c
 f4 48                 stsp16	[sp+0x2], r4
 f0 6a 0c              ld32	q0, [r6]
 f1 2d                 mov	r7, r1
 1f                    add	r7, r7
 f0 38 34              stsp16	[sp+0x34], r0
 f0 39 36              stsp16	[sp+0x36], r1
 f9 e1                 or	r7, r0
 ca 04                 addi.s8	r6, 0x4
 f0 6a 4c              ld32	q1, [r6]
 09                    mov	r6, r5
 ca 04                 addi.s8	r6, 0x4
 f0 6a 0c              ld32	q0, [r6]
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 6a 0a              ld32	q0, [r5]
 f6 2f                 tst16	r7
 d1 17                 brne8	0x17 <L0>
 f1 27                 mov	r5, r3
 15                    add	r5, r5
 f9 a9                 or	r5, r2
 f6 2d                 tst16	r5
 d1 0e                 brne8	0xe <L0>
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f0 32 02              ldsp16	r2, [sp+0x2]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 e0 66 02              jmp16	614 <L16>
<L0>:
 f4 40                 stsp16	[sp+0x0], r4
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f2 68                 mov32	q2, q0
 ff 14                 fcmp
 f6 2e                 tst16	r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 d1 4f                 brne8	0x4f <L1>
 03                    mov	r4, r7
 10                    add	r4, r4
 92                    or	r4, r6
 f6 2c                 tst16	r4
 d1 48                 brne8	0x48 <L1>
 c5 80 7f              ldi16	r5, 0x7f80
 f1 23                 mov	r4, r3
 81                    and	r4, r5
 31                    cmp	r4, r5
 f8 04                 cset.eq	r4
 f0 30 34              ldsp16	r0, [sp+0x34]
 f0 31 36              ldsp16	r1, [sp+0x36]
 f1 29                 mov	r6, r1
 89                    and	r6, r5
 39                    cmp	r6, r5
 da 14 01              breq16	0x114 <L5>
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 f4 a4                 tst8	r4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 db fc 00              brne16	0xfc <L4>
 c4 00 80              ldi16	r4, 0x8000
 f9 70                 and	r3, r4
 f2 42                 sub	r2, r2
 f5 1a                 cmp	r3, r2
 fb 54                 cmov.ne	r2, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f1 2e                 mov	r7, r2
 aa                    xor	r6, r6
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 32 02              ldsp16	r2, [sp+0x2]
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 e0 05 02              jmp16	517 <L16>
<L1>:
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 c5 80 7f              ldi16	r5, 0x7f80
 f0 30 34              ldsp16	r0, [sp+0x34]
 f0 31 36              ldsp16	r1, [sp+0x36]
 f1 21                 mov	r4, r1
 81                    and	r4, r5
 31                    cmp	r4, r5
 d0 4d                 breq8	0x4d <L2>
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 f9 81                 or	r4, r0
 f0 30 34              ldsp16	r0, [sp+0x34]
 f0 31 36              ldsp16	r1, [sp+0x36]
 f6 2c                 tst16	r4
 d1 38                 brne8	0x38 <L2>
 03                    mov	r4, r7
 10                    add	r4, r4
 92                    or	r4, r6
 f6 2c                 tst16	r4
 d1 31                 brne8	0x31 <L2>
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 f9 89                 or	r4, r2
 f6 2c                 tst16	r4
 d1 28                 brne8	0x28 <L2>
 d6 f8                 adjsp	-0x8
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 14 34              leasp	r4, 0x34
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 e1 cd 01              call16	cx_pow_zero
 d6 08                 adjsp	0x8
 f0 36 30              ldsp16	r6, [sp+0x30]
 f0 37 32              ldsp16	r7, [sp+0x32]
 f0 30 2c              ldsp16	r0, [sp+0x2c]
 f0 31 2e              ldsp16	r1, [sp+0x2e]
 d4 6a                 jmp8	0x6a <L3>
<L2>:
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 14 24              leasp	r4, 0x24
 f0 15 14              leasp	r5, 0x14
 e1 c4 03              call16	clogf
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 f0 36 28              ldsp16	r6, [sp+0x28]
 f0 37 2a              ldsp16	r7, [sp+0x2a]
 d6 f4                 adjsp	-0xc
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f0 14 28              leasp	r4, 0x28
 f2 6a                 mov32	q3, q0
 e1 41 0c              call16	__mulsc3
 d6 0c                 adjsp	0xc
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 f1 07                 mov	r0, r7
 f4 80                 lsl16.1	r0
 f9 19                 or	r0, r6
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f6 28                 tst16	r0
 d1 2f                 brne8	0x2f <L6>
 f2 63                 mov32	q0, q3
 e1 b4 04              call16	expf
 f2 6a                 mov32	q3, q0
 f2 62                 mov32	q0, q2
<L3>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 32 02              ldsp16	r2, [sp+0x2]
 e0 31 01              jmp16	305 <L16>
<L4>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 32 02              ldsp16	r2, [sp+0x2]
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 e0 23 01              jmp16	291 <L16>
<L5>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 32 02              ldsp16	r2, [sp+0x2]
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 aa                    xor	r6, r6
 af                    xor	r7, r7
 e0 13 01              jmp16	275 <L16>
<L6>:
 f1 07                 mov	r0, r7
 f0 05 80 7f           ldi16	r1, 0x7f80
 f9 04                 and	r0, r1
 f5 01                 cmp	r0, r1
 d1 1d                 brne8	0x1d <L7>
 f0 04 80 ff           ldi16	r0, 0xff80
 f9 16                 xor	r0, r5
 f1 0c                 mov	r1, r4
 f9 21                 or	r1, r0
 f6 29                 tst16	r1
 f0 32 02              ldsp16	r2, [sp+0x2]
 d1 6a                 brne8	0x6a <L8>
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f2 68                 mov32	q2, q0
 e1 7d 05              call16	copysignf
 e0 e6 00              jmp16	230 <L14>
<L7>:
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 3d 36              stsp16	[sp+0x36], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 16 08              leasp	r6, 0x8
 f0 17 38              leasp	r7, 0x38
 e1 7e 05              call16	sincosf
 f0 30 38              ldsp16	r0, [sp+0x38]
 f0 31 3a              ldsp16	r1, [sp+0x3a]
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 f9 81                 or	r4, r0
 f6 2c                 tst16	r4
 f0 32 02              ldsp16	r2, [sp+0x2]
 d0 5c                 breq8	0x5c <L11>
 aa                    xor	r6, r6
 c7 a0 42              ldi16	r7, 0x42a0
 f0 34 34              ldsp16	r4, [sp+0x34]
 f0 35 36              ldsp16	r5, [sp+0x36]
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d1 41                 brne8	0x41 <L9>
 aa                    xor	r6, r6
 c7 40 43              ldi16	r7, 0x4340
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d9 37                 brsge8	0x37 <L9>
 aa                    xor	r6, r6
 c7 80 3e              ldi16	r7, 0x3e80
 ff 02                 fmul
 e1 1b 04              call16	expf
 f2 6a                 mov32	q3, q0
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 d4 19                 jmp8	0x19 <L10>
<L8>:
 c6 80 7f              ldi16	r6, 0x7f80
 a9                    xor	r6, r5
 92                    or	r4, r6
 f6 2c                 tst16	r4
 db 92 00              brne16	0x92 <L17>
 aa                    xor	r6, r6
 c7 c0 7f              ldi16	r7, 0x7fc0
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 d4 74                 jmp8	0x74 <L15>
<L9>:
 e1 ea 03              call16	expf
<L10>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f2 62                 mov32	q0, q2
<L11>:
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 03                    mov	r4, r7
 10                    add	r4, r4
 92                    or	r4, r6
 f6 2c                 tst16	r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d0 5e                 breq8	0x5e <L16>
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 aa                    xor	r6, r6
 c7 a0 42              ldi16	r7, 0x42a0
 f0 34 34              ldsp16	r4, [sp+0x34]
 f0 35 36              ldsp16	r5, [sp+0x36]
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d1 3b                 brne8	0x3b <L12>
 aa                    xor	r6, r6
 c7 40 43              ldi16	r7, 0x4340
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d9 31                 brsge8	0x31 <L12>
 aa                    xor	r6, r6
 c7 80 3e              ldi16	r7, 0x3e80
 ff 02                 fmul
 e1 ae 03              call16	expf
 f0 38 34              stsp16	[sp+0x34], r0
 f0 39 36              stsp16	[sp+0x36], r1
 f2 62                 mov32	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 f0 30 34              ldsp16	r0, [sp+0x34]
 f0 31 36              ldsp16	r1, [sp+0x36]
 d4 09                 jmp8	0x9 <L13>
<L12>:
 e1 83 03              call16	expf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
<L13>:
 ff 02                 fmul
<L14>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
<L15>:
 f4 00                 ldsp16	r4, [sp+0x0]
<L16>:
 f0 6b 04              st32	[r2], q0
 f0 0a 04              addi.s8	r2, 0x4
 f0 6b c4              st32	[r2], q3
 d6 3c                 adjsp	0x3c
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L17>:
 f2 30                 sub	r0, r0
 f0 05 c0 7f           ldi16	r1, 0x7fc0
 f2 6a                 mov32	q3, q0
 d4 e4                 jmp8	-0x1c <L15>

<cx_pow_zero>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ea                 adjsp	-0x16
 f4 60                 stsp16	[sp+0x8], r4
 f0 32 25              ldsp16	r2, [sp+0x25]
 f0 33 27              ldsp16	r3, [sp+0x27]
 f0 34 21              ldsp16	r4, [sp+0x21]
 f0 35 23              ldsp16	r5, [sp+0x23]
 e1 45 07              call16	atan2f
 f2 62                 mov32	q0, q2
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 f9 81                 or	r4, r0
 f6 2c                 tst16	r4
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 d1 1b                 brne8	0x1b <L0>
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e1 41 04              call16	copysignf
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 e0 ce 00              jmp16	206 <L4>
<L0>:
 f2 69                 mov32	q2, q1
 e1 e4 04              call16	fabsf
 aa                    xor	r6, r6
 c7 80 4b              ldi16	r7, 0x4b80
 ff 14                 fcmp
 ce 02                 cmpi.s8	r6, 0x2
 d2 68                 brult8	0x68 <L1>
 aa                    xor	r6, r6
 c7 00 40              ldi16	r7, 0x4000
 f2 69                 mov32	q2, q1
 e1 28 09              call16	fmodf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 0e                 ftos16
 f4 40                 stsp16	[sp+0x0], r4
 ff 0c                 s16tof
 f2 66                 mov32	q1, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6b                 mov32	q3, q1
 ff 14                 fcmp
 f6 2e                 tst16	r6
 d1 63                 brne8	0x63 <L2>
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 ff 14                 fcmp
 a0                    xor	r4, r4
 f4 03                 ldsp16	r7, [sp+0x0]
 23                    sub	r4, r7
 ce ff                 cmpi.s8	r6, -0x1
 fb 3c                 cmov.eq	r7, r4
 c2 03                 ldi8	r6, 0x3
 8b                    and	r6, r7
 c1 01                 ldi8	r5, 0x1
 8d                    and	r7, r5
 c4 ff ff              ldi16	r4, 0xffff
 f4 a7                 tst8	r7
 d1 61                 brne8	0x61 <L3>
 f4 a6                 tst8	r6
 fb 25                 cmov.eq	r4, r5
 ff 0c                 s16tof
 f2 66                 mov32	q1, q2
 f2 6b                 mov32	q3, q1
 ff 07                 fneg	q3
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 3a 12              stsp16	[sp+0x12], r2
 f0 3b 14              stsp16	[sp+0x14], r3
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e1 c3 03              call16	copysignf
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 d4 5d                 jmp8	0x5d <L5>
<L1>:
 f2 6b                 mov32	q3, q1
 ff 07                 fneg	q3
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e1 ad 03              call16	copysignf
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 d4 3b                 jmp8	0x3b <L4>
<L2>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f0 16 0e              leasp	r6, 0xe
 f0 17 12              leasp	r7, 0x12
 e1 a4 03              call16	sincosf
 f0 32 12              ldsp16	r2, [sp+0x12]
 f0 33 14              ldsp16	r3, [sp+0x14]
 d4 28                 jmp8	0x28 <L5>
<L3>:
 ce 01                 cmpi.s8	r6, 0x1
 fb 25                 cmov.eq	r4, r5
 ff 0c                 s16tof
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e1 67 03              call16	copysignf
 f2 66                 mov32	q1, q2
<L4>:
 f0 3a 12              stsp16	[sp+0x12], r2
 f0 3b 14              stsp16	[sp+0x14], r3
<L5>:
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 a1                    xor	r4, r5
 f1 02                 mov	r0, r2
 f9 11                 or	r0, r4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 14                 fcmp
 f0 05 80 7f           ldi16	r1, 0x7f80
 ce 01                 cmpi.s8	r6, 0x1
 f1 21                 mov	r4, r1
 a5                    xor	r5, r5
 fb 25                 cmov.eq	r4, r5
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f6 28                 tst16	r0
 f8 04                 cset.eq	r4
 ce 01                 cmpi.s8	r6, 0x1
 d1 25                 brne8	0x25 <L6>
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d0 1e                 breq8	0x1e <L6>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e1 23 03              call16	copysignf
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6b                 mov32	q3, q1
 e1 18 03              call16	copysignf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 f0 05 80 7f           ldi16	r1, 0x7f80
 d4 36                 jmp8	0x36 <L8>
<L6>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 03                    mov	r4, r7
 f9 86                 xor	r4, r1
 06                    mov	r5, r6
 94                    or	r5, r4
 f6 2d                 tst16	r5
 d1 23                 brne8	0x23 <L7>
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 f9 89                 or	r4, r2
 f6 2c                 tst16	r4
 d1 1a                 brne8	0x1a <L7>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f2 6b                 mov32	q3, q1
 e1 f1 02              call16	copysignf
 f2 66                 mov32	q1, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 e1 e4 02              call16	copysignf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 d4 06                 jmp8	0x6 <L8>
<L7>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f2 6b                 mov32	q3, q1
<L8>:
 ff 02                 fmul
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 14                 fcmp
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 a1                    xor	r4, r5
 f1 26                 mov	r5, r2
 94                    or	r5, r4
 f6 2d                 tst16	r5
 f8 04                 cset.eq	r4
 ce 01                 cmpi.s8	r6, 0x1
 d1 1a                 brne8	0x1a <L9>
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d0 13                 breq8	0x13 <L9>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e1 a2 02              call16	copysignf
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6b                 mov32	q3, q1
 d4 26                 jmp8	0x26 <L10>
<L9>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f9 36                 xor	r1, r5
 f9 85                 or	r4, r1
 f6 2c                 tst16	r4
 d1 23                 brne8	0x23 <L11>
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 f9 89                 or	r4, r2
 f6 2c                 tst16	r4
 d1 1a                 brne8	0x1a <L11>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f2 6b                 mov32	q3, q1
 e1 7c 02              call16	copysignf
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
<L10>:
 e1 6f 02              call16	copysignf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 d4 06                 jmp8	0x6 <L12>
<L11>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f2 6b                 mov32	q3, q1
<L12>:
 ff 02                 fmul
 f4 22                 ldsp16	r6, [sp+0x8]
 f0 30 0a              ldsp16	r0, [sp+0xa]
 f0 31 0c              ldsp16	r1, [sp+0xc]
 f0 6b 0c              st32	[r6], q0
 ca 04                 addi.s8	r6, 0x4
 f0 6b 8c              st32	[r6], q2
 d6 16                 adjsp	0x16
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<clogf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 f4 68                 stsp16	[sp+0xa], r4
 01                    mov	r4, r5
 c8 04                 addi.s8	r4, 0x4
 f0 6a 08              ld32	q0, [r4]
 f0 6a 8a              ld32	q2, [r5]
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 e1 e8 02              call16	fabsf
 f2 66                 mov32	q1, q2
 f0 38 02              stsp16	[sp+0x2], r0
 f0 39 04              stsp16	[sp+0x4], r1
 f2 68                 mov32	q2, q0
 e1 db 02              call16	fabsf
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 fb 02                 cmov.eq	r0, r2
 fb 0b                 cmov.eq	r1, r3
 f2 66                 mov32	q1, q2
 f1 25                 mov	r5, r1
 15                    add	r5, r5
 c4 00 ff              ldi16	r4, 0xff00
 a4                    xor	r5, r4
 f1 2b                 mov	r6, r3
 1a                    add	r6, r6
 a8                    xor	r6, r4
 f1 2e                 mov	r7, r2
 9e                    or	r7, r6
 f1 28                 mov	r6, r0
 99                    or	r6, r5
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f6 2e                 tst16	r6
 f8 05                 cset.eq	r5
 f6 2f                 tst16	r7
 da b4 00              breq16	0xb4 <L2>
 c2 01                 ldi8	r6, 0x1
 86                    and	r5, r6
 f4 a5                 tst8	r5
 db ac 00              brne16	0xac <L2>
 f1 26                 mov	r5, r2
 f7 8d                 bool	r5
 f1 2b                 mov	r6, r3
 1a                    add	r6, r6
 99                    or	r6, r5
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 c4 00 ff              ldi16	r4, 0xff00
 32                    cmp	r4, r6
 dc 95 00              brult16	0x95 <L2>
 f1 24                 mov	r5, r0
 f7 8d                 bool	r5
 f1 29                 mov	r6, r1
 1a                    add	r6, r6
 99                    or	r6, r5
 32                    cmp	r4, r6
 dc 89 00              brult16	0x89 <L2>
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 f2 69                 mov32	q2, q1
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d1 48                 brne8	0x48 <L0>
 aa                    xor	r6, r6
 c7 c0 3f              ldi16	r7, 0x3fc0
 f2 69                 mov32	q2, q1
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 d1 3c                 brne8	0x3c <L0>
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 f2 68                 mov32	q2, q0
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 d1 30                 brne8	0x30 <L0>
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 c7 80 bf              ldi16	r7, 0xbf80
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 e1 31 02              call16	log1pf
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 02                 fmul
 d4 31                 jmp8	0x31 <L1>
<L0>:
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 f9 89                 or	r4, r2
 f4 40                 stsp16	[sp+0x0], r4
 f2 69                 mov32	q2, q1
 e1 52 03              call16	logf
 f4 02                 ldsp16	r6, [sp+0x0]
 f6 2e                 tst16	r6
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 d0 1f                 breq8	0x1f <L2>
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 03                 fdiv
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 e1 06 02              call16	log1pf
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 00                 fadd
<L1>:
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
<L2>:
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 e1 16 04              call16	atan2f
 f4 2b                 ldsp16	r7, [sp+0xa]
 0b                    mov	r6, r7
 ca 04                 addi.s8	r6, 0x4
 f0 6b 8c              st32	[r6], q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 6b 8e              st32	[r7], q2
 03                    mov	r4, r7
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<expf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f2 62                 mov32	q0, q2
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 c4 80 7f              ldi16	r4, 0x7f80
 f5 1c                 cmp	r3, r4
 d2 1b                 brult8	0x1b <L0>
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 48              cmp32	q1, q2
 d1 50                 brne8	0x50 <L3>
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c0              cmp32	q3, q0
 fd 20                 cmov.slt	r4, r0
 fd 29                 cmov.slt	r5, r1
 e0 dc 00              jmp16	220 <L7>
<L0>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d3 18                 brslt8	0x18 <L1>
 c6 18 72              ldi16	r6, 0x7218
 c7 b1 42              ldi16	r7, 0x42b1
 f0 69 4c              cmp32	q1, q3
 d2 0d                 brult8	0xd <L1>
 c0 22                 ldi8	r4, 0x22
 f0 5c 10 01           stm16	[0x110], r4
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 e0 bd 00              jmp16	189 <L7>
<L1>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c0              cmp32	q3, q0
 d3 1d                 brslt8	0x1d <L4>
 c6 b6 f1              ldi16	r6, 0xf1b6
 c7 cf 42              ldi16	r7, 0x42cf
 f0 69 4c              cmp32	q1, q3
 d2 12                 brult8	0x12 <L4>
<L2>:
 c2 22                 ldi8	r6, 0x22
 f0 5e 10 01           stm16	[0x110], r6
 e0 9e 00              jmp16	158 <L7>
<L3>:
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 e0 95 00              jmp16	149 <L7>
<L4>:
 c6 3b aa              ldi16	r6, 0xaa3b
 c7 b8 3f              ldi16	r7, 0x3fb8
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 c6 18 72              ldi16	r6, 0x7218
 c7 b1 3e              ldi16	r7, 0x3eb1
 f0 69 c4              cmp32	q3, q1
 d8 61                 bruge8	0x61 <L5>
 f1 29                 mov	r6, r1
 fa 9f                 lsr16i	r6, 0xf
 c7 00 3f              ldi16	r7, 0x3f00
 f0 04 00 bf           ldi16	r0, 0xbf00
 f4 a6                 tst8	r6
 fb 78                 cmov.ne	r7, r0
 aa                    xor	r6, r6
 f2 62                 mov32	q0, q2
 ff 00                 fadd
 ff 0e                 ftos16
 f4 40                 stsp16	[sp+0x0], r4
 ff 0c                 s16tof
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 01                 fsub
 ff 15 05 66 01 1d 3c 23 fe 64 3d bc 01 76 3e 96 70 31 3f 00 00 80 3f  fpoly	5, 0.00958285294, 0.0559064262, 0.240240991, 0.693124175, 1.0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 01                 ldsp16	r5, [sp+0x0]
 cd 83                 cmpi.s8	r5, -0x7d
 d9 3c                 brsge8	0x3c <L6>
 fa 47                 lsl16i	r5, 0x7
 c4 00 32              ldi16	r4, 0x3200
 11                    add	r4, r5
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f7 6b                 add32	q2, q3
 aa                    xor	r6, r6
 c7 80 0d              ldi16	r7, 0xd80
 ff 02                 fmul
 09                    mov	r6, r5
 c7 80 7f              ldi16	r7, 0x7f80
 8b                    and	r6, r7
 c7 80 80              ldi16	r7, 0x8080
 1e                    add	r7, r6
 c6 ff 80              ldi16	r6, 0x80ff
 3b                    cmp	r6, r7
 dd 7a ff              bruge16	-0x86 <L2>
 d4 1f                 jmp8	0x1f <L7>
<L5>:
 ff 15 05 66 01 1d 3c 23 fe 64 3d bc 01 76 3e 96 70 31 3f 00 00 80 3f  fpoly	5, 0.00958285294, 0.0559064262, 0.240240991, 0.693124175, 1.0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a5                    xor	r5, r5
<L6>:
 fa 47                 lsl16i	r5, 0x7
 a0                    xor	r4, r4
 f7 6b                 add32	q2, q3
<L7>:
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<copysignf>:
 b1                    push16	r1
 b0                    push16	r0
 c6 00 80              ldi16	r6, 0x8000
 8b                    and	r6, r7
 ff 0a                 fabs	q2
 f2 62                 mov32	q0, q2
 ff 04                 fneg	q0
 af                    xor	r7, r7
 3b                    cmp	r6, r7
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<sincosf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f4 63                 stsp16	[sp+0x8], r7
 f4 5a                 stsp16	[sp+0x6], r6
 c6 ff 7f              ldi16	r6, 0x7fff
 89                    and	r6, r5
 c7 80 7f              ldi16	r7, 0x7f80
 3b                    cmp	r6, r7
 d0 7f                 breq8	0x7f <L1>
<L0>:
 ff 1c                 frempio2
 f2 62                 mov32	q0, q2
 c0 02                 ldi8	r4, 0x2
 82                    and	r4, r6
 f4 68                 stsp16	[sp+0xa], r4
 c0 01                 ldi8	r4, 0x1
 82                    and	r4, r6
 f4 50                 stsp16	[sp+0x4], r4
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 ff 15 03 70 8e 05 3c b1 9f 2a be e8 ff 7f 3f  fpoly	3, 0.00815163552, -0.166624799, 0.999998569
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 ff 15 04 bf 12 b2 ba 76 9e 2a 3d d0 ff ff be 00 00 80 3f      fpoly	4, -0.0013585909, 0.0416550264, -0.499998569, 1.0
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 13                 ldsp16	r7, [sp+0x4]
 f4 a7                 tst8	r7
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 f2 66                 mov32	q1, q2
 ff 05                 fneg	q1
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 a6                 tst8	r6
 fb 14                 cmov.eq	r2, r4
 fb 1d                 cmov.eq	r3, r5
 f4 1a                 ldsp16	r6, [sp+0x6]
 f0 6b 4c              st32	[r6], q1
 ff 04                 fneg	q0
 f4 a7                 tst8	r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 fb 04                 cmov.eq	r0, r4
 fb 0d                 cmov.eq	r1, r5
 f2 68                 mov32	q2, q0
 ff 06                 fneg	q2
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 a6                 tst8	r6
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
 f4 22                 ldsp16	r6, [sp+0x8]
 f0 6b 8c              st32	[r6], q2
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L1>:
 f6 2c                 tst16	r4
 db 7c ff              brne16	-0x84 <L0>
 c2 21                 ldi8	r6, 0x21
 f0 5e 10 01           stm16	[0x110], r6
 e0 73 ff              jmp16	-141 <L0>

<fabsf>:
 ff 0a                 fabs	q2
 ef                    ret

<log1pf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 7f           ldi16	r3, 0x7fff
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f9 c8                 and	r6, r2
 f9 ec                 and	r7, r3
 f2 30                 sub	r0, r0
 f0 05 80 3e           ldi16	r1, 0x3e80
 f0 69 0c              cmp32	q0, q3
 d2 26                 brult8	0x26 <L0>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 15 06 23 7f 38 be 44 43 5a 3e 99 9d 7f be b9 88 aa 3e 23 00 00 bf 00 00 80 3f      fpoly	6, -0.180172488, 0.213147223, -0.249624625, 0.333074361, -0.500002086, 1.0
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 e0 9a 00              jmp16	154 <L3>
<L0>:
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 c7 80 80              ldi16	r7, 0x8080
 f7 6b                 add32	q2, q3
 f0 69 c8              cmp32	q3, q2
 dd 90 00              bruge16	0x90 <L5>
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 7f              ldi8	r3, 0x7f
 f0 69 40              cmp32	q1, q0
 d2 0f                 brult8	0xf <L1>
 aa                    xor	r6, r6
 c7 00 4c              ldi16	r7, 0x4c00
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 c4 68 ff              ldi16	r4, 0xff68
 d4 03                 jmp8	0x3 <L2>
<L1>:
 c4 81 ff              ldi16	r4, 0xff81
<L2>:
 f4 40                 stsp16	[sp+0x0], r4
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 c6 20 fb              ldi16	r6, 0xfb20
 c3 4a                 ldi8	r7, 0x4a
 f7 6d                 add32	q3, q1
 c0 80                 ldi8	r4, 0x80
 83                    and	r4, r7
 f9 71                 or	r3, r4
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 f1 21                 mov	r4, r1
 fa 77                 lsr16i	r4, 0x7
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 18                    add	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 15 07 a7 65 34 3e a3 bd 8a be 49 17 97 3e 10 e7 b7 be 96 17 f6 3e 8e ab 38 bf 46 aa b8 3f  fpoly	7, 0.176169023, -0.270978063, 0.295099527, -0.359184742, 0.480648696, -0.721367717, 1.44269633
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 ff 0c                 s16tof
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 c6 18 72              ldi16	r6, 0x7218
 c7 31 3f              ldi16	r7, 0x3f31
<L3>:
 ff 02                 fmul
<L4>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L5>:
 f9 40                 and	r2, r0
 f9 64                 and	r3, r1
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 d0 13                 breq8	0x13 <L6>
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 80              cmp32	q2, q0
 d9 14                 brsge8	0x14 <L7>
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 d4 db                 jmp8	-0x25 <L4>
<L6>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 10 01           stm16	[0x110], r4
 a0                    xor	r4, r4
 c5 80 ff              ldi16	r5, 0xff80
 d4 cf                 jmp8	-0x31 <L4>
<L7>:
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 84              cmp32	q2, q1
 d8 0a                 bruge8	0xa <L8>
 c4 c0 7f              ldi16	r4, 0x7fc0
 f9 85                 or	r4, r1
 04                    mov	r5, r4
 f1 20                 mov	r4, r0
 d4 bc                 jmp8	-0x44 <L4>
<L8>:
 c0 21                 ldi8	r4, 0x21
 f0 5c 10 01           stm16	[0x110], r4
 c4 c0 7f              ldi16	r4, 0x7fc0
 f9 85                 or	r4, r1
 04                    mov	r5, r4
 f1 20                 mov	r4, r0
 d4 ac                 jmp8	-0x54 <L4>

<logf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 aa                    xor	r6, r6
 c7 80 80              ldi16	r7, 0x8080
 f2 62                 mov32	q0, q2
 f7 63                 add32	q0, q3
 f0 69 c0              cmp32	q3, q0
 dd 95 00              bruge16	0x95 <L3>
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 01 7f              ldi8	r1, 0x7f
 f0 69 08              cmp32	q0, q2
 d2 0b                 brult8	0xb <L0>
 aa                    xor	r6, r6
 c7 00 4c              ldi16	r7, 0x4c00
 ff 02                 fmul
 c6 68 ff              ldi16	r6, 0xff68
 d4 03                 jmp8	0x3 <L1>
<L0>:
 c6 81 ff              ldi16	r6, 0xff81
<L1>:
 f4 42                 stsp16	[sp+0x0], r6
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f0 06 20 fb           ldi16	r2, 0xfb20
 f0 03 4a              ldi8	r3, 0x4a
 f7 64                 add32	q1, q0
 c3 80                 ldi8	r7, 0x80
 f9 ec                 and	r7, r3
 f9 3d                 or	r1, r7
 f1 28                 mov	r6, r0
 f1 2d                 mov	r7, r1
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f9 1a                 xor	r0, r6
 f9 3e                 xor	r1, r7
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f1 2b                 mov	r6, r3
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 18                    add	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 15 07 a7 65 34 3e a3 bd 8a be 49 17 97 3e 10 e7 b7 be 96 17 f6 3e 8e ab 38 bf 46 aa b8 3f  fpoly	7, 0.176169023, -0.270978063, 0.295099527, -0.359184742, 0.480648696, -0.721367717, 1.44269633
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 ff 0c                 s16tof
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 c6 18 72              ldi16	r6, 0x7218
 c7 31 3f              ldi16	r7, 0x3f31
 ff 02                 fmul
<L2>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L3>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 d0 13                 breq8	0x13 <L4>
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 69 08              cmp32	q0, q2
 d9 12                 brsge8	0x12 <L5>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 d4 d5                 jmp8	-0x2b <L2>
<L4>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 10 01           stm16	[0x110], r4
 a0                    xor	r4, r4
 c5 80 ff              ldi16	r5, 0xff80
 d4 c9                 jmp8	-0x37 <L2>
<L5>:
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 0c              cmp32	q0, q3
 d8 07                 bruge8	0x7 <L6>
 c6 c0 7f              ldi16	r6, 0x7fc0
 99                    or	r6, r5
 06                    mov	r5, r6
 d4 b7                 jmp8	-0x49 <L2>
<L6>:
 c2 21                 ldi8	r6, 0x21
 f0 5e 10 01           stm16	[0x110], r6
 c6 c0 7f              ldi16	r6, 0x7fc0
 99                    or	r6, r5
 06                    mov	r5, r6
 d4 aa                 jmp8	-0x56 <L2>

<atan2f>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f2 63                 mov32	q0, q3
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 ff 08                 fabs	q0
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 c0              cmp32	q3, q0
 d2 45                 brult8	0x45 <L0>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 0b                 fabs	q3
 f0 02 01              ldi8	r2, 0x1
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 c4              cmp32	q3, q1
 d8 35                 bruge8	0x35 <L0>
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 c4              cmp32	q3, q1
 d0 35                 breq8	0x35 <L1>
 f0 69 04              cmp32	q0, q1
 d0 56                 breq8	0x56 <L2>
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 69 c4              cmp32	q3, q1
 d1 60                 brne8	0x60 <L3>
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c4 c9 3f              ldi16	r4, 0x3fc9
 c5 49 3f              ldi16	r5, 0x3f49
 f0 69 04              cmp32	q0, q1
 fb 25                 cmov.eq	r4, r5
 c5 db 0f              ldi16	r5, 0xfdb
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 e0 75 01              jmp16	373 <L11>
<L0>:
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 00                 fadd
 e0 9a 01              jmp16	410 <L12>
<L1>:
 c6 00 80              ldi16	r6, 0x8000
 89                    and	r6, r5
 f2 30                 sub	r0, r0
 c7 49 40              ldi16	r7, 0x4049
 f0 05 49 c0           ldi16	r1, 0xc049
 f5 28                 cmp	r6, r0
 fb 79                 cmov.ne	r7, r1
 c6 db 0f              ldi16	r6, 0xfdb
 f2 39                 sub	r1, r1
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 69 40              cmp32	q1, q0
 fd 26                 cmov.slt	r4, r6
 fd 2f                 cmov.slt	r5, r7
 e0 74 01              jmp16	372 <L12>
<L2>:
 c4 00 80              ldi16	r4, 0x8000
 81                    and	r4, r5
 a5                    xor	r5, r5
 c6 c9 3f              ldi16	r6, 0x3fc9
 c7 c9 bf              ldi16	r7, 0xbfc9
 31                    cmp	r4, r5
 fb 77                 cmov.ne	r6, r7
 c4 db 0f              ldi16	r4, 0xfdb
 06                    mov	r5, r6
 e0 5f 01              jmp16	351 <L12>
<L3>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 69 04              cmp32	q0, q1
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f2 69                 mov32	q2, q1
 da 21 01              breq16	0x121 <L11>
 f0 69 0c              cmp32	q0, q3
 d8 34                 bruge8	0x34 <L4>
 f2 68                 mov32	q2, q0
 ff 03                 fdiv
 09                    mov	r6, r5
 c7 ff 3e              ldi16	r7, 0x3eff
 3e                    cmp	r7, r6
 d2 5f                 brult8	0x5f <L5>
 c7 7f 3e              ldi16	r7, 0x3e7f
 3e                    cmp	r7, r6
 dc a5 00              brult16	0xa5 <L7>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 ff 15 04 16 15 05 be 3e 59 4c 3e 46 aa aa be 00 00 80 3f      fpoly	4, -0.129963249, 0.199559182, -0.333330333, 1.0
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 e0 de 00              jmp16	222 <L10>
<L4>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 03                 fdiv
 09                    mov	r6, r5
 c7 ff 3e              ldi16	r7, 0x3eff
 3e                    cmp	r7, r6
 d2 50                 brult8	0x50 <L6>
 c7 7f 3e              ldi16	r7, 0x3e7f
 3e                    cmp	r7, r6
 dc 8e 00              brult16	0x8e <L8>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 ff 15 04 16 15 05 be 3e 59 4c 3e 46 aa aa be 00 00 80 3f      fpoly	4, -0.129963249, 0.199559182, -0.333330333, 1.0
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 e0 b2 00              jmp16	178 <L11>
<L5>:
 c7 3f 3f              ldi16	r7, 0x3f3f
 3e                    cmp	r7, r6
 dc 84 00              brult16	0x84 <L9>
 aa                    xor	r6, r6
 c7 20 bf              ldi16	r7, 0xbf20
 ff 00                 fadd
 ff 15 05 a1 71 d1 3d c3 37 9c 3c ed 79 a5 be fd 17 38 3f 5e 00 0f 3f  fpoly	5, 0.102267511, 0.019069558, -0.323195845, 0.719116032, 0.558599353
 e0 81 00              jmp16	129 <L10>
<L6>:
 c7 3f 3f              ldi16	r7, 0x3f3f
 3e                    cmp	r7, r6
 dc b9 00              brult16	0xb9 <L13>
 aa                    xor	r6, r6
 c7 20 bf              ldi16	r7, 0xbf20
 ff 00                 fadd
 ff 15 05 a1 71 d1 3d c3 37 9c 3c ed 79 a5 be fd 17 38 3f 5e 00 0f 3f  fpoly	5, 0.102267511, 0.019069558, -0.323195845, 0.719116032, 0.558599353
 d4 65                 jmp8	0x65 <L11>
<L7>:
 aa                    xor	r6, r6
 c7 c0 be              ldi16	r7, 0xbec0
 ff 00                 fadd
 ff 15 05 29 9e 3f 3e ad d1 05 be 09 8f 93 be 92 70 60 3f c7 b0 b7 3e  fpoly	5, 0.187126771, -0.130682662, -0.288200647, 0.876717686, 0.358770579
 d4 3c                 jmp8	0x3c <L10>
<L8>:
 aa                    xor	r6, r6
 c7 c0 be              ldi16	r7, 0xbec0
 ff 00                 fadd
 ff 15 05 29 9e 3f 3e ad d1 05 be 09 8f 93 be 92 70 60 3f c7 b0 b7 3e  fpoly	5, 0.187126771, -0.130682662, -0.288200647, 0.876717686, 0.358770579
 d4 27                 jmp8	0x27 <L11>
<L9>:
 aa                    xor	r6, r6
 c7 60 bf              ldi16	r7, 0xbf60
 ff 00                 fadd
 ff 15 05 d6 da b4 3c 79 68 9e 3d 96 b6 8f be 42 fe 10 3f 3f 05 38 3f  fpoly	5, 0.0220770054, 0.0773477033, -0.280689895, 0.566379666, 0.718830049
<L10>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 c4 db 0f              ldi16	r4, 0xfdb
 c5 c9 3f              ldi16	r5, 0x3fc9
 ff 01                 fsub
<L11>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 c4 db 0f              ldi16	r4, 0xfdb
 c5 49 40              ldi16	r5, 0x4049
 ff 01                 fsub
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f0 69 04              cmp32	q0, q1
 fd 34                 cmov.slt	r6, r4
 fd 3d                 cmov.slt	r7, r5
 f0 04 00 80           ldi16	r0, 0x8000
 f4 09                 ldsp16	r5, [sp+0x2]
 f9 14                 and	r0, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 ff 0a                 fabs	q2
 f2 66                 mov32	q1, q2
 ff 05                 fneg	q1
 aa                    xor	r6, r6
 f5 06                 cmp	r0, r6
 fb 62                 cmov.ne	r4, r2
 fb 6b                 cmov.ne	r5, r3
<L12>:
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L13>:
 aa                    xor	r6, r6
 c7 60 bf              ldi16	r7, 0xbf60
 ff 00                 fadd
 ff 15 05 d6 da b4 3c 79 68 9e 3d 96 b6 8f be 42 fe 10 3f 3f 05 38 3f  fpoly	5, 0.0220770054, 0.0773477033, -0.280689895, 0.566379666, 0.718830049
 d4 ac                 jmp8	-0x54 <L11>

<fmodf>:
 b1                    push16	r1
 b0                    push16	r0
 f0 04 80 7f           ldi16	r0, 0x7f80
 f1 0d                 mov	r1, r5
 f9 20                 and	r1, r0
 f5 08                 cmp	r1, r0
 d0 0f                 breq8	0xf <L0>
 f1 07                 mov	r0, r7
 f4 80                 lsl16.1	r0
 f9 19                 or	r0, r6
 f6 28                 tst16	r0
 d0 05                 breq8	0x5 <L0>
 ff 1b                 fmod
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
<L0>:
 b8                    pop16	r0
 b9                    pop16	r1
 d4 00                 jmp8	avm_fmod_special

<avm_fmod_special>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f0 04 80 7f           ldi16	r0, 0x7f80
 f1 0d                 mov	r1, r5
 f9 20                 and	r1, r0
 f5 08                 cmp	r1, r0
 d0 15                 breq8	0x15 <L1>
 f0 04 ff 7f           ldi16	r0, 0x7fff
 f9 1c                 and	r0, r7
 f2 39                 sub	r1, r1
 f5 01                 cmp	r0, r1
 d0 09                 breq8	0x9 <L1>
<L0>:
 ff 1b                 fmod
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L1>:
 f2 62                 mov32	q0, q2
 ff 08                 fabs	q0
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 69 40              cmp32	q1, q0
 d2 e2                 brult8	-0x1e <L0>
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f9 18                 and	r0, r6
 f9 3c                 and	r1, r7
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f0 69 40              cmp32	q1, q0
 d2 cb                 brult8	-0x35 <L0>
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f0 69 04              cmp32	q0, q1
 d0 0f                 breq8	0xf <L2>
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f0 69 40              cmp32	q1, q0
 d1 b1                 brne8	-0x4f <L0>
<L2>:
 f0 00 21              ldi8	r0, 0x21
 f0 58 10 01           stm16	[0x110], r0
 d4 a8                 jmp8	-0x58 <L0>

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

<__mulsc3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d2                 adjsp	-0x2e
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f4 70                 stsp16	[sp+0xc], r4
 f0 36 41              ldsp16	r6, [sp+0x41]
 f0 37 43              ldsp16	r7, [sp+0x43]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 34 39              ldsp16	r4, [sp+0x39]
 f0 35 3b              ldsp16	r5, [sp+0x3b]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f0 32 3d              ldsp16	r2, [sp+0x3d]
 f0 33 3f              ldsp16	r3, [sp+0x3f]
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 38 2a              stsp16	[sp+0x2a], r0
 f0 39 2c              stsp16	[sp+0x2c], r1
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 08                    mov	r6, r4
 f7 8e                 bool	r6
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 01                    mov	r4, r5
 10                    add	r4, r4
 92                    or	r4, r6
 f0 3c 18              stsp16	[sp+0x18], r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f0 3c 16              stsp16	[sp+0x16], r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 3a 26              stsp16	[sp+0x26], r2
 f0 3b 28              stsp16	[sp+0x28], r3
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 c6 00 ff              ldi16	r6, 0xff00
 f0 37 18              ldsp16	r7, [sp+0x18]
 3b                    cmp	r6, r7
 dd fc 01              bruge16	0x1fc <L6>
 f7 8c                 bool	r4
 15                    add	r5, r5
 94                    or	r5, r4
 c4 00 ff              ldi16	r4, 0xff00
 31                    cmp	r4, r5
 dd f1 01              bruge16	0x1f1 <L6>
 f0 3a 18              stsp16	[sp+0x18], r2
 f0 3b 1a              stsp16	[sp+0x1a], r3
 f0 38 22              stsp16	[sp+0x22], r0
 f0 39 24              stsp16	[sp+0x24], r1
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 09                    mov	r6, r5
 a2                    xor	r4, r6
 f1 24                 mov	r5, r0
 94                    or	r5, r4
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 a2                    xor	r4, r6
 f1 2a                 mov	r6, r2
 98                    or	r6, r4
 f6 2e                 tst16	r6
 f8 04                 cset.eq	r4
 f6 2d                 tst16	r5
 f8 07                 cset.eq	r7
 9c                    or	r7, r4
 c2 01                 ldi8	r6, 0x1
 8e                    and	r7, r6
 f4 a7                 tst8	r7
 da 8c 00              breq16	0x8c <L1>
 f0 3f 20              stsp16	[sp+0x20], r7
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 a1                    xor	r4, r5
 f9 51                 or	r2, r4
 c4 00 80              ldi16	r4, 0x8000
 f9 70                 and	r3, r4
 f6 2a                 tst16	r2
 f8 04                 cset.eq	r4
 82                    and	r4, r6
 ff 0d                 u16tof
 aa                    xor	r6, r6
 f1 2f                 mov	r7, r3
 f2 66                 mov32	q1, q2
 ff 05                 fneg	q1
 3e                    cmp	r7, r6
 c7 00 80              ldi16	r7, 0x8000
 fb 62                 cmov.ne	r4, r2
 fb 6b                 cmov.ne	r5, r3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 f0 06 00 ff           ldi16	r2, 0xff00
 f9 8a                 xor	r4, r2
 f9 11                 or	r0, r4
 f6 28                 tst16	r0
 f8 04                 cset.eq	r4
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 f9 3c                 and	r1, r7
 ff 0d                 u16tof
 f1 19                 mov	r3, r1
 f2 62                 mov32	q0, q2
 ff 04                 fneg	q0
 f5 1e                 cmp	r3, r6
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 30 26              ldsp16	r0, [sp+0x26]
 f0 31 28              ldsp16	r1, [sp+0x28]
 f1 21                 mov	r4, r1
 83                    and	r4, r7
 32                    cmp	r4, r6
 02                    mov	r4, r6
 fb 67                 cmov.ne	r4, r7
 f1 24                 mov	r5, r0
 f7 8d                 bool	r5
 f1 29                 mov	r6, r1
 1a                    add	r6, r6
 99                    or	r6, r5
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f1 2e                 mov	r7, r2
 3e                    cmp	r7, r6
 fc 04                 cmov.ult	r0, r4
 fc 0d                 cmov.ult	r1, r5
 f0 38 26              stsp16	[sp+0x26], r0
 f0 39 28              stsp16	[sp+0x28], r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 8c                 bool	r4
 15                    add	r5, r5
 94                    or	r5, r4
 3d                    cmp	r7, r5
 dc 78 02              brult16	0x278 <L12>
<L0>:
 f0 30 26              ldsp16	r0, [sp+0x26]
 f0 31 28              ldsp16	r1, [sp+0x28]
 f0 37 20              ldsp16	r7, [sp+0x20]
 d4 12                 jmp8	0x12 <L2>
<L1>:
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f0 30 26              ldsp16	r0, [sp+0x26]
 f0 31 28              ldsp16	r1, [sp+0x28]
<L2>:
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 09                    mov	r6, r5
 a2                    xor	r4, r6
 f1 26                 mov	r5, r2
 94                    or	r5, r4
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 a2                    xor	r4, r6
 f1 28                 mov	r6, r0
 98                    or	r6, r4
 f6 2e                 tst16	r6
 f8 04                 cset.eq	r4
 f6 2d                 tst16	r5
 d0 17                 breq8	0x17 <L3>
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d1 10                 brne8	0x10 <L3>
 f4 a7                 tst8	r7
 f4 30                 ldsp16	r4, [sp+0xc]
 da 09 01              breq16	0x109 <L8>
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f2 64                 mov32	q1, q0
 e0 89 00              jmp16	137 <L5>
<L3>:
 f2 6a                 mov32	q3, q0
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 a1                    xor	r4, r5
 f9 51                 or	r2, r4
 c4 00 80              ldi16	r4, 0x8000
 f9 70                 and	r3, r4
 f6 2a                 tst16	r2
 f8 04                 cset.eq	r4
 f0 00 01              ldi8	r0, 0x1
 f9 80                 and	r4, r0
 ff 0d                 u16tof
 f2 62                 mov32	q0, q2
 ff 04                 fneg	q0
 f2 42                 sub	r2, r2
 f5 1a                 cmp	r3, r2
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 03                    mov	r4, r7
 10                    add	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 a1                    xor	r4, r5
 98                    or	r6, r4
 f6 2e                 tst16	r6
 c4 00 80              ldi16	r4, 0x8000
 04                    mov	r5, r4
 f8 04                 cset.eq	r4
 c2 01                 ldi8	r6, 0x1
 82                    and	r4, r6
 8d                    and	r7, r5
 ff 0d                 u16tof
 f2 66                 mov32	q1, q2
 ff 06                 fneg	q2
 aa                    xor	r6, r6
 3e                    cmp	r7, r6
 fb 54                 cmov.ne	r2, r4
 fb 5d                 cmov.ne	r3, r5
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f1 21                 mov	r4, r1
 c6 00 80              ldi16	r6, 0x8000
 82                    and	r4, r6
 a5                    xor	r5, r5
 31                    cmp	r4, r5
 01                    mov	r4, r5
 fb 66                 cmov.ne	r4, r6
 f1 24                 mov	r5, r0
 f7 8d                 bool	r5
 f1 2d                 mov	r7, r1
 1f                    add	r7, r7
 9d                    or	r7, r5
 04                    mov	r5, r4
 a0                    xor	r4, r4
 c6 00 ff              ldi16	r6, 0xff00
 3b                    cmp	r6, r7
 fc 04                 cmov.ult	r0, r4
 fc 0d                 cmov.ult	r1, r5
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f7 8c                 bool	r4
 15                    add	r5, r5
 94                    or	r5, r4
 39                    cmp	r6, r5
 dc 8d 01              brult16	0x18d <L11>
<L4>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
<L5>:
 f0 3a 0e              stsp16	[sp+0xe], r2
 f0 3b 10              stsp16	[sp+0x10], r3
 f2 63                 mov32	q0, q3
 f2 68                 mov32	q2, q0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 02                 fmul
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 69                 mov32	q2, q1
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 01                 fsub
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 ff 02                 fmul
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 02                 fmul
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
<L6>:
 f4 30                 ldsp16	r4, [sp+0xc]
<L7>:
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 f0 6b c8              st32	[r4], q3
 c8 04                 addi.s8	r4, 0x4
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 f0 6b c8              st32	[r4], q3
 f0 34 16              ldsp16	r4, [sp+0x16]
 d6 2e                 adjsp	0x2e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L8>:
 f0 38 26              stsp16	[sp+0x26], r0
 f0 39 28              stsp16	[sp+0x28], r1
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 1f                    add	r7, r7
 c5 00 ff              ldi16	r5, 0xff00
 ad                    xor	r7, r5
 9b                    or	r6, r7
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 f0 36 22              ldsp16	r6, [sp+0x22]
 f0 37 24              ldsp16	r7, [sp+0x24]
 1f                    add	r7, r7
 ad                    xor	r7, r5
 9b                    or	r6, r7
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 f4 81                 lsl16.1	r1
 f9 36                 xor	r1, r5
 f9 05                 or	r0, r1
 f0 32 2a              ldsp16	r2, [sp+0x2a]
 f0 33 2c              ldsp16	r3, [sp+0x2c]
 f4 83                 lsl16.1	r3
 f9 76                 xor	r3, r5
 f9 4d                 or	r2, r3
 f6 2a                 tst16	r2
 f8 07                 cset.eq	r7
 f6 28                 tst16	r0
 f0 00 01              ldi8	r0, 0x1
 f8 05                 cset.eq	r5
 f6 2e                 tst16	r6
 f8 06                 cset.eq	r6
 f0 32 18              ldsp16	r2, [sp+0x18]
 f6 2a                 tst16	r2
 d0 12                 breq8	0x12 <L9>
 f9 c0                 and	r6, r0
 f4 a6                 tst8	r6
 d1 0c                 brne8	0xc <L9>
 f9 a0                 and	r5, r0
 f4 a5                 tst8	r5
 d1 06                 brne8	0x6 <L9>
 f9 e0                 and	r7, r0
 f4 a7                 tst8	r7
 d0 82                 breq8	-0x7e <L7>
<L9>:
 f0 04 00 80           ldi16	r0, 0x8000
 f0 36 26              ldsp16	r6, [sp+0x26]
 f0 37 28              ldsp16	r7, [sp+0x28]
 03                    mov	r4, r7
 f9 80                 and	r4, r0
 a5                    xor	r5, r5
 31                    cmp	r4, r5
 01                    mov	r4, r5
 fb 60                 cmov.ne	r4, r0
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f1 23                 mov	r4, r3
 f9 80                 and	r4, r0
 31                    cmp	r4, r5
 01                    mov	r4, r5
 fb 60                 cmov.ne	r4, r0
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f1 21                 mov	r4, r1
 c5 00 80              ldi16	r5, 0x8000
 81                    and	r4, r5
 a5                    xor	r5, r5
 31                    cmp	r4, r5
 c4 00 80              ldi16	r4, 0x8000
 fb 6c                 cmov.ne	r5, r4
 f4 79                 stsp16	[sp+0xe], r5
 06                    mov	r5, r6
 f7 8d                 bool	r5
 03                    mov	r4, r7
 10                    add	r4, r4
 91                    or	r4, r5
 f0 3c 2a              stsp16	[sp+0x2a], r4
 f0 35 18              ldsp16	r5, [sp+0x18]
 a0                    xor	r4, r4
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 c5 00 ff              ldi16	r5, 0xff00
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 34                    cmp	r5, r4
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 fc 34                 cmov.ult	r6, r4
 fc 3d                 cmov.ult	r7, r5
 f0 3e 26              stsp16	[sp+0x26], r6
 f0 3f 28              stsp16	[sp+0x28], r7
 f1 22                 mov	r4, r2
 f7 8c                 bool	r4
 f1 27                 mov	r5, r3
 15                    add	r5, r5
 94                    or	r5, r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 0c                    mov	r7, r4
 aa                    xor	r6, r6
 c4 00 ff              ldi16	r4, 0xff00
 31                    cmp	r4, r5
 fc 16                 cmov.ult	r2, r6
 fc 1f                 cmov.ult	r3, r7
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f1 20                 mov	r4, r0
 f7 8c                 bool	r4
 f1 25                 mov	r5, r1
 15                    add	r5, r5
 94                    or	r5, r4
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 06 00 ff           ldi16	r2, 0xff00
 f5 15                 cmp	r2, r5
 fc 06                 cmov.ult	r0, r6
 fc 0c                 cmov.ult	r1, r4
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 02                    mov	r4, r6
 f7 8c                 bool	r4
 07                    mov	r5, r7
 15                    add	r5, r5
 94                    or	r5, r4
 f5 15                 cmp	r2, r5
 d2 31                 brult8	0x31 <L13>
<L10>:
 f0 32 26              ldsp16	r2, [sp+0x26]
 f0 33 28              ldsp16	r3, [sp+0x28]
 e0 77 fe              jmp16	-393 <L5>
<L11>:
 f4 19                 ldsp16	r5, [sp+0x6]
 c4 00 80              ldi16	r4, 0x8000
 84                    and	r5, r4
 aa                    xor	r6, r6
 36                    cmp	r5, r6
 fb 74                 cmov.ne	r6, r4
 a0                    xor	r4, r4
 f4 50                 stsp16	[sp+0x4], r4
 f4 5a                 stsp16	[sp+0x6], r6
 e0 61 fe              jmp16	-415 <L4>
<L12>:
 f0 33 02              ldsp16	r3, [sp+0x2]
 f1 27                 mov	r5, r3
 c4 00 80              ldi16	r4, 0x8000
 08                    mov	r6, r4
 86                    and	r5, r6
 a0                    xor	r4, r4
 34                    cmp	r5, r4
 fb 66                 cmov.ne	r4, r6
 aa                    xor	r6, r6
 f4 42                 stsp16	[sp+0x0], r6
 f4 48                 stsp16	[sp+0x2], r4
 e0 72 fd              jmp16	-654 <L0>
<L13>:
 c4 00 80              ldi16	r4, 0x8000
 8c                    and	r7, r4
 a5                    xor	r5, r5
 3d                    cmp	r7, r5
 fb 6c                 cmov.ne	r5, r4
 0d                    mov	r7, r5
 aa                    xor	r6, r6
 d4 c3                 jmp8	-0x3d <L10>
