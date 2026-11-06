
complex_cpow.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000038 __avm_run_constructors
00000000 l    df *ABS*	00000000 complex_cpow.c
00000100 l     O .data	00000008 result
00000108 l     O .data	00000004 input_real
0000010c l     O .data	00000004 input_imag
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 trap_report.c
00000000 l    df *ABS*	00000000 trap_lookup.c
00000b69 l     F .text	0000010c open_section
00000c75 l     F .text	000000ff read_uleb128
00000000 l    df *ABS*	00000000 string.c
00000000 l    df *ABS*	00000000 pgmspace.c
00000000 l    df *ABS*	00000000 malloc.c
00000000 l    df *ABS*	00000000 font_br5n.c
00000000 l    df *ABS*	00000000 pow.c
0000101f l     F .text	0000022c cx_pow_zero
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
000019b9 l     F .text	00000076 avm_fmod_special
00000000 l    df *ABS*	00000000 integer.c
00000000 l    df *ABS*	00000000 wide_integer.c
00000000 l    df *ABS*	00000000 complex.c
00000000 l    df *ABS*	00000000 
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
000022e3 l       .init_array	00000000 .hidden __init_array_end
000022e3 l       .init_array	00000000 .hidden __init_array_start
000022e3 l       .fini_array	00000000 .hidden __fini_array_start
000022e3 l       .fini_array	00000000 .hidden __fini_array_end
00000112 l       *ABS*	00000000 .hidden __avm_heap_start
00000330 g     F .text	00000015 __avm_trap_entry
00000200 g     F .text	00000023 _start
0000025b g     F .text	0000006e avm_test_main
000002cb g     F .text	00000065 __avm_terminate
000002c9 g     F .text	00000002 avm_halt
00000d79 g     F .text	000002a6 cpowf
00001f42 g     O .rodata	000003a1 _avm_font_br5n_storage
00000000  w      *UND*	00000000 __avm_run_local_dtors
0000047a g     F .text	000006ef __avm_trap_lookup
00000345 g     F .text	00000135 __avm_trap_report
00000110 g     O .data	00000002 __avm_errno
00000d74 g     F .text	00000005 memset
00000500 g       *ABS*	00000000 __avm_framebuffer
00001a6d g     F .text	00000060 __avm_mulsi3
00001a2f g     F .text	0000003e __avm_umulhisi3
0000154d g     F .text	00000128 log1pf
00001761 g     F .text	00000237 atan2f
00001374 g     F .text	00000120 expf
00001998 g     F .text	00000021 fmodf
00001675 g     F .text	000000ec logf
00001494 g     F .text	00000015 copysignf
0000154a g     F .text	00000003 fabsf
000014a9 g     F .text	000000a1 sincosf
0000124b g     F .text	00000129 clogf
00000d79 g     F .text	000002a6 cpow
00000d79 g     F .text	000002a6 cpowl
00001acd g     F .text	000003c2 __mulsc3

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d5 1b                 call8	__avm_run_constructors
 d5 51                 call8	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 e1 b5 00              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 a6 00              call16	avm_halt

<__avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c4 e3 22              ldi16	r4, 0x22e3
 c1 00                 ldi8	r5, 0x0
 c6 e3 22              ldi16	r6, 0x22e3
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 20                 breq8	0x20 <L1>
 f0 04 e3 22           ldi16	r0, 0x22e3
 f0 01 00              ldi8	r1, 0x0
 f0 06 e3 22           ldi16	r2, 0x22e3
 f0 03 00              ldi8	r3, 0x0
<L0>:
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ee                 brne8	-0x12 <L0>
<L1>:
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_test_main>:
 d6 d8                 adjsp	-0x28
 c4 08 01              ldi16	r4, 0x108
 f0 6a 88              ld32	q2, [r4]
 c6 0c 01              ldi16	r6, 0x10c
 f0 6a cc              ld32	q3, [r6]
 d7 01                 sys	debug_break
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 c4 cd cc              ldi16	r4, 0xcccd
 c5 4c be              ldi16	r5, 0xbe4c
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 c4 33 33              ldi16	r4, 0x3333
 c5 33 3f              ldi16	r5, 0x3f33
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 14 20              leasp	r4, 0x20
 f0 15 08              leasp	r5, 0x8
 f0 16 00              leasp	r6, 0x0
 e1 ce 0a              call16	cpowl
 c4 00 01              ldi16	r4, 0x100
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 37 22              ldsp16	r7, [sp+0x22]
 f0 6b c8              st32	[r4], q3
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 c6 04 01              ldi16	r6, 0x104
 f0 6b 8c              st32	[r6], q2
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 28                 adjsp	0x28
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
 e1 20 fd              call16	-736 <__avm_run_local_dtors>
<L0>:
 c4 e3 22              ldi16	r4, 0x22e3
 c1 00                 ldi8	r5, 0x0
 c6 e3 22              ldi16	r6, 0x22e3
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 e3 22           ldi16	r2, 0x22e3
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 e3 22           ldi16	r0, 0x22e3
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
 e1 d7 fc              call16	-809 <__avm_run_local_dtors>
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
 e1 1e 01              call16	__avm_trap_lookup
 c4 00 05              ldi16	r4, 0x500
 a5                    xor	r5, r5
 c6 00 04              ldi16	r6, 0x400
 e1 0e 0a              call16	memset
 c4 42 1f              ldi16	r4, 0x1f42
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
 c6 13 1f              ldi16	r6, 0x1f13
 c3 00                 ldi8	r7, 0x0
 d4 13                 jmp8	0x13 <L3>
<L0>:
 c6 23 1f              ldi16	r6, 0x1f23
 c3 00                 ldi8	r7, 0x0
 d4 0c                 jmp8	0xc <L3>
<L1>:
 c6 04 1f              ldi16	r6, 0x1f04
 c3 00                 ldi8	r7, 0x0
 d4 05                 jmp8	0x5 <L3>
<L2>:
 c6 35 1f              ldi16	r6, 0x1f35
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
 c6 8f 1e              ldi16	r6, 0x1e8f
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
 d0 10                 breq8	0x10 <L4>
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 c6 a0 1e              ldi16	r6, 0x1ea0
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 11                 ldi8	r5, 0x11
 d7 36                 sys	draw_textfv_p
 d4 0a                 jmp8	0xa <L5>
<L4>:
 c6 a9 1e              ldi16	r6, 0x1ea9
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
 c6 ae 1e              ldi16	r6, 0x1eae
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 17                 ldi8	r5, 0x17
 d7 36                 sys	draw_textfv_p
 d4 0a                 jmp8	0xa <L7>
<L6>:
 c6 b8 1e              ldi16	r6, 0x1eb8
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
 c6 bc 1e              ldi16	r6, 0x1ebc
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 1d                 ldi8	r5, 0x1d
 d7 36                 sys	draw_textfv_p
 ed 90 2c              ld16	r4, [r0+12]
 f4 40                 stsp16	[sp+0x0], r4
 ed 90 2e              ld16	r4, [r0+14]
 f4 48                 stsp16	[sp+0x2], r4
 c6 cc 1e              ldi16	r6, 0x1ecc
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 23                 ldi8	r5, 0x23
 d7 36                 sys	draw_textfv_p
 ed 90 30              ld16	r4, [r0+16]
 f4 40                 stsp16	[sp+0x0], r4
 ed 90 32              ld16	r4, [r0+18]
 f4 48                 stsp16	[sp+0x2], r4
 c6 dc 1e              ldi16	r6, 0x1edc
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 29                 ldi8	r5, 0x29
 d7 36                 sys	draw_textfv_p
 ed 90 34              ld16	r4, [r0+20]
 f4 40                 stsp16	[sp+0x0], r4
 ed 90 36              ld16	r4, [r0+22]
 f4 48                 stsp16	[sp+0x2], r4
 c6 ec 1e              ldi16	r6, 0x1eec
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 2f                 ldi8	r5, 0x2f
 d7 36                 sys	draw_textfv_p
 ed 80 26              ld8u	r4, [r0+6]
 f4 40                 stsp16	[sp+0x0], r4
 c6 fc 1e              ldi16	r6, 0x1efc
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
 f0 3a 22              stsp16	[sp+0x22], r2
 f0 3b 24              stsp16	[sp+0x24], r3
 f0 02 2e              ldi8	r2, 0x2e
 f0 07 00 ff           ldi16	r3, 0xff00
 f7 66                 add32	q1, q2
 f0 00 2f              ldi8	r0, 0x2f
 f0 05 00 ff           ldi16	r1, 0xff00
 f0 69 40              cmp32	q1, q0
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
 f0 38 1e              stsp16	[sp+0x1e], r0
 f0 39 20              stsp16	[sp+0x20], r1
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
 f0 30 1e              ldsp16	r0, [sp+0x1e]
 f0 31 20              ldsp16	r1, [sp+0x20]
 f0 69 04              cmp32	q0, q1
 d2 e9                 brult8	-0x17 <L0>
 f2 30                 sub	r0, r0
 f0 05 00 01           ldi16	r1, 0x100
 f7 72                 sub32	q0, q2
 f0 32 1e              ldsp16	r2, [sp+0x1e]
 f0 33 20              ldsp16	r3, [sp+0x20]
 f0 69 04              cmp32	q0, q1
 f0 02 2f              ldi8	r2, 0x2f
 f2 4b                 sub	r3, r3
 d2 d1                 brult8	-0x2f <L0>
 f0 00 0c              ldi8	r0, 0xc
 f2 39                 sub	r1, r1
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f7 62                 add32	q0, q2
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 a0                    xor	r4, r4
 f0 3e 1c              stsp16	[sp+0x1c], r6
<L2>:
 f0 00 07              ldi8	r0, 0x7
 0c                    mov	r7, r4
 fe 38                 mul16	r7, r0
 f1 07                 mov	r0, r7
 f2 39                 sub	r1, r1
 0c                    mov	r7, r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f7 62                 add32	q0, q2
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f2 69                 mov32	q2, q1
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f7 61                 add32	q0, q1
 f2 66                 mov32	q1, q2
 f0 63 80              ldp24	q2, [q0]
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 c0 04                 ldi8	r4, 0x4
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f0 63 80              ldp24	q2, [q0]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 60 88              ldp8u	r4, [q2]
 f4 53                 stsp16	[sp+0x4], r7
 f4 af                 inc16	r7
 f0 3c 18              stsp16	[sp+0x18], r4
 3c                    cmp	r7, r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 db 67 ff              brne16	-0x99 <L0>
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f0 69 04              cmp32	q0, q1
 db 5b ff              brne16	-0xa5 <L0>
 d6 fa                 adjsp	-0x6
 f0 17 28              leasp	r7, 0x28
 f4 53                 stsp16	[sp+0x4], r7
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f2 61                 mov32	q0, q1
 f7 62                 add32	q0, q2
 f0 17 3e              leasp	r7, 0x3e
 03                    mov	r4, r7
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6a                 mov32	q3, q0
 e1 6f 05              call16	open_section
 d6 06                 adjsp	0x6
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 f4 a7                 tst8	r7
 da 2f ff              breq16	-0xd1 <L0>
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 66                 add32	q1, q2
 f0 34 18              ldsp16	r4, [sp+0x18]
 cc 05                 cmpi.s8	r4, 0x5
 db 65 ff              brne16	-0x9b <L2>
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f0 35 20              ldsp16	r5, [sp+0x20]
 f0 69 48              cmp32	q1, q2
 db 15 ff              brne16	-0xeb <L0>
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 35 24              ldsp16	r5, [sp+0x24]
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
 f0 3e 1e              stsp16	[sp+0x1e], r6
 f1 16                 mov	r2, r6
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 db ed fe              brne16	-0x113 <L0>
 f0 30 40              ldsp16	r0, [sp+0x40]
 f0 31 42              ldsp16	r1, [sp+0x42]
 f0 63 80              ldp24	q2, [q0]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 db dc fe              brne16	-0x124 <L0>
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f0 63 88              ldp24	q2, [q2]
 f0 69 8c              cmp32	q2, q3
 db ce fe              brne16	-0x132 <L0>
 f0 3a 18              stsp16	[sp+0x18], r2
 f0 3b 1a              stsp16	[sp+0x1a], r3
 c0 0b                 ldi8	r4, 0xb
 a5                    xor	r5, r5
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f7 68                 add32	q2, q0
 f0 60 88              ldp8u	r4, [q2]
 f4 a4                 tst8	r4
 db b5 fe              brne16	-0x14b <L0>
 f0 34 54              ldsp16	r4, [sp+0x54]
 f6 2c                 tst16	r4
 da fb 00              breq16	0xfb <L5>
 f0 36 38              ldsp16	r6, [sp+0x38]
 f0 37 3a              ldsp16	r7, [sp+0x3a]
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 a5                    xor	r5, r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
<L3>:
 f2 63                 mov32	q0, q3
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f7 7c                 sub32	q3, q0
 f7 83                 lsr32.1	q3
 f7 6c                 add32	q3, q0
 f2 67                 mov32	q1, q3
 f7 65                 add32	q1, q1
 f7 65                 add32	q1, q1
 f7 65                 add32	q1, q1
 f7 67                 add32	q1, q3
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f7 64                 add32	q1, q0
 f0 63 44              ldp24	q1, [q1]
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f0 69 04              cmp32	q0, q1
 fc 26                 cmov.ult	r4, r6
 fc 2f                 cmov.ult	r5, r7
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 fc 30                 cmov.ult	r6, r0
 fc 39                 cmov.ult	r7, r1
 f0 69 c8              cmp32	q3, q2
 d2 b8                 brult8	-0x48 <L3>
 f0 32 10              ldsp16	r2, [sp+0x10]
 f0 33 12              ldsp16	r3, [sp+0x12]
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 69 c0              cmp32	q3, q0
 da 92 00              breq16	0x92 <L5>
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
 f0 3e 22              stsp16	[sp+0x22], r6
 f0 3f 24              stsp16	[sp+0x24], r7
 f0 32 50              ldsp16	r2, [sp+0x50]
 f0 33 52              ldsp16	r3, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f0 14 30              leasp	r4, 0x30
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 24              leasp	r4, 0x24
 f2 6b                 mov32	q3, q1
 e1 31 05              call16	read_uleb128
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
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 35 24              ldsp16	r5, [sp+0x24]
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
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f7 40                 st16	[r4+], r0
 f3 01                 st8	[r4], r1
<L5>:
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f6 2c                 tst16	r4
 da aa fd              breq16	-0x256 <L0>
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 32 18              ldsp16	r2, [sp+0x18]
 f0 33 1a              ldsp16	r3, [sp+0x1a]
<L6>:
 f2 68                 mov32	q2, q0
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 61                 mov32	q0, q1
 f7 72                 sub32	q0, q2
 f7 80                 lsr32.1	q0
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 c2 0c                 ldi8	r6, 0xc
 af                    xor	r7, r7
 e1 c4 12              call16	__avm_mulsi3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f7 6b                 add32	q2, q3
 f0 63 c8              ldp24	q3, [q2]
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 8c              cmp32	q2, q3
 fc 10                 cmov.ult	r2, r0
 fc 19                 cmov.ult	r3, r1
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f7 62                 add32	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 fc 04                 cmov.ult	r0, r4
 fc 0d                 cmov.ult	r1, r5
 f0 69 04              cmp32	q0, q1
 d2 c4                 brult8	-0x3c <L6>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 da 5c fd              breq16	-0x2a4 <L0>
 c2 0c                 ldi8	r6, 0xc
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 8e 12              call16	__avm_mulsi3
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f7 66                 add32	q1, q2
 c4 f4 ff              ldi16	r4, 0xfff4
 c5 ff ff              ldi16	r5, 0xffff
 f7 69                 add32	q2, q1
 f0 63 88              ldp24	q2, [q2]
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
 c4 f7 ff              ldi16	r4, 0xfff7
 c5 ff ff              ldi16	r5, 0xffff
 f7 69                 add32	q2, q1
 f0 63 88              ldp24	q2, [q2]
 c6 fa ff              ldi16	r6, 0xfffa
 c7 ff ff              ldi16	r7, 0xffff
 f7 6d                 add32	q3, q1
 f0 62 cc              ldp16	r6, [q3]
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 04 fc ff           ldi16	r0, 0xfffc
 f0 05 ff ff           ldi16	r1, 0xffff
 f2 6b                 mov32	q3, q1
 f7 6c                 add32	q3, q0
 f0 63 cc              ldp24	q3, [q3]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
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
 f0 38 18              stsp16	[sp+0x18], r0
 f0 39 1a              stsp16	[sp+0x1a], r1
 f0 69 c0              cmp32	q3, q0
 dd 54 02              bruge16	0x254 <L17>
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
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
<L7>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f2 66                 mov32	q1, q2
 f0 3a 2e              stsp16	[sp+0x2e], r2
 f0 3b 30              stsp16	[sp+0x30], r3
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f7 68                 add32	q2, q0
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3d 24              stsp16	[sp+0x24], r5
 f0 3a 5a              stsp16	[sp+0x5a], r2
 f0 3b 5c              stsp16	[sp+0x5c], r3
 f0 61 8c              ldp8s	r4, [q3]
 f4 60                 stsp16	[sp+0x8], r4
 f4 a4                 tst8	r4
 de da 00              brslt16	0xda <L11>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 69 c8              cmp32	q3, q2
 da 8c fc              breq16	-0x374 <L0>
 f4 22                 ldsp16	r6, [sp+0x8]
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
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f7 63                 add32	q0, q3
 c4 fc ff              ldi16	r4, 0xfffc
 c5 ff ff              ldi16	r5, 0xffff
 f7 62                 add32	q0, q2
<L8>:
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 3e 14              stsp16	[sp+0x14], r6
<L9>:
 aa                    xor	r6, r6
 c7 00 ff              ldi16	r7, 0xff00
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 6e                 add32	q3, q2
 f0 02 01              ldi8	r2, 0x1
 f0 07 00 ff           ldi16	r3, 0xff00
 f0 69 c4              cmp32	q3, q1
 c0 01                 ldi8	r4, 0x1
 f0 3c 26              stsp16	[sp+0x26], r4
 dc 40 fc              brult16	-0x3c0 <L0>
<L10>:
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 ff              ldi8	r3, 0xff
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f0 35 20              ldsp16	r5, [sp+0x20]
 f7 76                 sub32	q1, q2
 f0 30 2e              ldsp16	r0, [sp+0x2e]
 f0 31 30              ldsp16	r1, [sp+0x30]
 f2 6a                 mov32	q3, q0
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 6e                 add32	q3, q2
 f0 69 c4              cmp32	q3, q1
 dd 1b fc              bruge16	-0x3e5 <L0>
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f0 35 20              ldsp16	r5, [sp+0x20]
 f7 68                 add32	q2, q0
 f0 36 22              ldsp16	r6, [sp+0x22]
 f0 37 24              ldsp16	r7, [sp+0x24]
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
 f0 69 48              cmp32	q1, q2
 dc 8a 01              brult16	0x18a <L19>
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f0 69 c8              cmp32	q3, q2
 dd 6a 01              bruge16	0x16a <L18>
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f7 68                 add32	q2, q0
 f0 02 40              ldi8	r2, 0x40
 f2 4b                 sub	r3, r3
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 69 84              cmp32	q2, q1
 f0 34 26              ldsp16	r4, [sp+0x26]
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 3c 10              stsp16	[sp+0x10], r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 db f6 fe              brne16	-0x10a <L7>
 e0 be fb              jmp16	-1090 <L0>
<L11>:
 f4 20                 ldsp16	r4, [sp+0x8]
 cc 80                 cmpi.s8	r4, -0x80
 d1 76                 brne8	0x76 <L12>
 d6 fe                 adjsp	-0x2
 f0 14 30              leasp	r4, 0x30
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 24              leasp	r4, 0x24
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 e1 e7 02              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 da 9c fb              breq16	-0x464 <L0>
 d6 fe                 adjsp	-0x2
 f0 14 5c              leasp	r4, 0x5c
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 24              leasp	r4, 0x24
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 e1 cb 02              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 da 80 fb              breq16	-0x480 <L0>
 f0 30 5a              ldsp16	r0, [sp+0x5a]
 f0 31 5c              ldsp16	r1, [sp+0x5c]
 f0 34 34              ldsp16	r4, [sp+0x34]
 f0 35 36              ldsp16	r5, [sp+0x36]
 f0 38 14              stsp16	[sp+0x14], r0
 f0 69 08              cmp32	q0, q2
 dd 6b fb              bruge16	-0x495 <L0>
 d6 fe                 adjsp	-0x2
 f0 14 2a              leasp	r4, 0x2a
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 24              leasp	r4, 0x24
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 e1 9a 02              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 da 4f fb              breq16	-0x4b1 <L0>
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 e0 e6 fe              jmp16	-282 <L9>
<L12>:
 c2 ff                 ldi8	r6, 0xff
 f4 20                 ldsp16	r4, [sp+0x8]
 a5                    xor	r5, r5
 82                    and	r4, r6
 f4 22                 ldsp16	r6, [sp+0x8]
 ce 93                 cmpi.s8	r6, -0x6d
 d2 23                 brult8	0x23 <L14>
 c6 6e ff              ldi16	r6, 0xff6e
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 3d 30              stsp16	[sp+0x30], r5
<L13>:
 a0                    xor	r4, r4
 f0 3c 26              stsp16	[sp+0x26], r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 3e 14              stsp16	[sp+0x14], r6
 e0 d3 fe              jmp16	-301 <L10>
<L14>:
 c6 82 ff              ldi16	r6, 0xff82
 f4 23                 ldsp16	r7, [sp+0x8]
 3b                    cmp	r6, r7
 d2 24                 brult8	0x24 <L15>
 d6 fe                 adjsp	-0x2
 f0 14 30              leasp	r4, 0x30
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 24              leasp	r4, 0x24
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 e1 3a 02              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 da ef fa              breq16	-0x511 <L0>
 f4 20                 ldsp16	r4, [sp+0x8]
 cc 82                 cmpi.s8	r4, -0x7e
 d0 c1                 breq8	-0x3f <L13>
 d4 0e                 jmp8	0xe <L16>
<L15>:
 c6 7e ff              ldi16	r6, 0xff7e
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 3d 30              stsp16	[sp+0x30], r5
<L16>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 69 c8              cmp32	q3, q2
 da cd fa              breq16	-0x533 <L0>
 d6 fe                 adjsp	-0x2
 f0 14 5c              leasp	r4, 0x5c
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 24              leasp	r4, 0x24
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 e1 fc 01              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 da b1 fa              breq16	-0x54f <L0>
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
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f7 63                 add32	q0, q3
 e0 2a fe              jmp16	-470 <L8>
<L17>:
 f0 35 56              ldsp16	r5, [sp+0x56]
 f0 3d 32              stsp16	[sp+0x32], r5
 f4 a4                 tst8	r4
 da 87 fa              breq16	-0x579 <L0>
 d4 20                 jmp8	0x20 <L20>
<L18>:
 f0 34 26              ldsp16	r4, [sp+0x26]
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 3c 10              stsp16	[sp+0x10], r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
<L19>:
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 f4 a4                 tst8	r4
 f8 0c                 cset.ne	r4
 f4 a4                 tst8	r4
 da 65 fa              breq16	-0x59b <L0>
<L20>:
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 32              ldsp16	r5, [sp+0x32]
 31                    cmp	r4, r5
 dd 5b fa              bruge16	-0x5a5 <L0>
 f0 34 10              ldsp16	r4, [sp+0x10]
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
 f0 3e 22              stsp16	[sp+0x22], r6
 f0 3f 24              stsp16	[sp+0x24], r7
 f0 30 50              ldsp16	r0, [sp+0x50]
 f0 31 52              ldsp16	r1, [sp+0x52]
 d6 fe                 adjsp	-0x2
 f0 14 30              leasp	r4, 0x30
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 24              leasp	r4, 0x24
 f2 6a                 mov32	q3, q0
 e1 65 01              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 d0 23                 breq8	0x23 <L21>
 f0 36 2e              ldsp16	r6, [sp+0x2e]
 f0 37 30              ldsp16	r7, [sp+0x30]
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d0 16                 breq8	0x16 <L21>
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 35 24              ldsp16	r5, [sp+0x24]
 f7 72                 sub32	q0, q2
 f0 69 c0              cmp32	q3, q0
 d8 09                 bruge8	0x9 <L21>
 f7 6e                 add32	q3, q2
 f0 60 cc              ldp8u	r6, [q3]
 f4 a6                 tst8	r6
 d0 0d                 breq8	0xd <L22>
<L21>:
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 c8 03                 addi.s8	r4, 0x3
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f7 46                 st16	[r4+], r6
 53                    st8	[r4], r7
 e0 eb f9              jmp16	-1557 <L0>
<L22>:
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 ca 03                 addi.s8	r6, 0x3
 f7 54                 st16	[r6+], r4
 59                    st8	[r6], r5
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 da d9 f9              breq16	-0x627 <L0>
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 c8 06                 addi.s8	r4, 0x6
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 6b c8              st32	[r4], q3
 e0 ca f9              jmp16	-1590 <L0>

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
 d8 48                 bruge8	0x48 <L3>
 a0                    xor	r4, r4
 d4 6f                 jmp8	0x6f <L5>
<L0>:
 f7 67                 add32	q1, q3
 f4 20                 ldsp16	r4, [sp+0x8]
 04                    mov	r5, r4
 c9 18                 addi.s8	r5, 0x18
 f0 6b 4a              st32	[r5], q1
 c8 14                 addi.s8	r4, 0x14
<L1>:
 f0 6b c8              st32	[r4], q3
 d4 5c                 jmp8	0x5c <L4>
<L2>:
 a0                    xor	r4, r4
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f0 69 40              cmp32	q1, q0
 d2 53                 brult8	0x53 <L5>
 f0 62 8c              ldp16	r4, [q3]
 f4 58                 stsp16	[sp+0x6], r4
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f4 a5                 tst8	r5
 d0 4d                 breq8	0x4d <L6>
 cd 01                 cmpi.s8	r5, 0x1
 d1 72                 brne8	0x72 <L7>
 f2 68                 mov32	q2, q0
 f7 6a                 add32	q2, q2
 f7 68                 add32	q2, q0
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 68                 add32	q2, q0
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 69 48              cmp32	q1, q2
 a0                    xor	r4, r4
 d1 2c                 brne8	0x2c <L5>
 d4 7f                 jmp8	0x7f <L8>
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
 e0 6d ff              jmp16	-147 <L1>
<L7>:
 f4 41                 stsp16	[sp+0x0], r5
 c1 0c                 ldi8	r5, 0xc
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 e1 f6 0d              call16	__avm_umulhisi3
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f0 00 02              ldi8	r0, 0x2
 f9 11                 or	r0, r4
 f1 20                 mov	r4, r0
 f0 69 48              cmp32	q1, q2
 a0                    xor	r4, r4
 f0 30 06              ldsp16	r0, [sp+0x6]
 d1 b1                 brne8	-0x4f <L5>
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
 e0 37 ff              jmp16	-201 <L1>
<L9>:
 f4 20                 ldsp16	r4, [sp+0x8]
 ee 18 40              st16	[r4+32], r0
 f0 00 02              ldi8	r0, 0x2
 f2 39                 sub	r1, r1
 f7 6c                 add32	q3, q0
 c8 08                 addi.s8	r4, 0x8
 e0 26 ff              jmp16	-218 <L1>

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
 d8 6f                 bruge8	0x6f <L3>
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 3a 08              stsp16	[sp+0x8], r2
 f4 69                 stsp16	[sp+0xa], r5
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f7 64                 add32	q1, q0
 f0 61 c0              ldp8s	r6, [q0]
 c0 7f                 ldi8	r4, 0x7f
 06                    mov	r5, r6
 84                    and	r5, r4
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f4 a6                 tst8	r6
 d3 12                 brslt8	0x12 <L1>
 f4 29                 ldsp16	r5, [sp+0xa]
<L0>:
 f0 6b 4a              st32	[r5], q1
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 22                 ldsp16	r6, [sp+0x8]
 f0 6b 8c              st32	[r6], q2
 c0 01                 ldi8	r4, 0x1
 d4 3c                 jmp8	0x3c <L3>
<L1>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 69 48              cmp32	q1, q2
 d8 32                 bruge8	0x32 <L2>
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 61 a4              ldp8s	r5, [q1]
 09                    mov	r6, r5
 fa 57                 lsl16i	r6, 0x7
 c4 80 3f              ldi16	r4, 0x3f80
 82                    and	r4, r6
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f1 2a                 mov	r6, r2
 98                    or	r6, r4
 af                    xor	r7, r7
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 0d                    mov	r7, r5
 f4 a7                 tst8	r7
 d3 17                 brslt8	0x17 <L4>
 a0                    xor	r4, r4
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f6 2f                 tst16	r7
 d1 b7                 brne8	-0x49 <L0>
 d4 01                 jmp8	0x1 <L3>
<L2>:
 a0                    xor	r4, r4
<L3>:
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L4>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f0 69 48              cmp32	q1, q2
 a0                    xor	r4, r4
 d8 e9                 bruge8	-0x17 <L3>
 f0 60 e4              ldp8u	r7, [q1]
 07                    mov	r5, r7
 fa 4e                 lsl16i	r5, 0xe
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f9 a9                 or	r5, r2
 c2 7f                 ldi8	r6, 0x7f
 8b                    and	r6, r7
 fa 92                 lsr16i	r6, 0x2
 f0 3d 0c              stsp16	[sp+0xc], r5
 f0 3e 0e              stsp16	[sp+0xe], r6
 f0 02 03              ldi8	r2, 0x3
 f2 4b                 sub	r3, r3
 f7 64                 add32	q1, q0
 f4 a7                 tst8	r7
 d3 0b                 brslt8	0xb <L5>
 f6 47                 sext8	r7
 f4 29                 ldsp16	r5, [sp+0xa]
 f6 2f                 tst16	r7
 db 73 ff              brne16	-0x8d <L0>
 d4 bd                 jmp8	-0x43 <L3>
<L5>:
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 69 4c              cmp32	q1, q3
 f4 29                 ldsp16	r5, [sp+0xa]
 d8 b2                 bruge8	-0x4e <L3>
 f0 61 e4              ldp8s	r7, [q1]
 f4 a7                 tst8	r7
 d3 ab                 brslt8	-0x55 <L3>
 f4 53                 stsp16	[sp+0x4], r7
 f1 17                 mov	r2, r7
 c2 ff                 ldi8	r6, 0xff
 af                    xor	r7, r7
 f9 c8                 and	r6, r2
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c2 04                 ldi8	r6, 0x4
 f7 63                 add32	q0, q3
 f4 02                 ldsp16	r6, [sp+0x0]
 fa 55                 lsl16i	r6, 0x5
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f9 79                 or	r3, r6
 f0 3b 0e              stsp16	[sp+0xe], r3
 f4 13                 ldsp16	r7, [sp+0x4]
 f2 64                 mov32	q1, q0
 f6 2f                 tst16	r7
 db 39 ff              brne16	-0xc7 <L0>
 d4 83                 jmp8	-0x7d <L3>

<memset>:
 0c                    mov	r7, r4
 d7 11                 sys	memset
 03                    mov	r4, r7
 ef                    ret

<cpowl>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 c4                 adjsp	-0x3c
 f4 58                 stsp16	[sp+0x6], r4
 f4 40                 stsp16	[sp+0x0], r4
 f0 6a 0c              ld32	q0, [r6]
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 f9 81                 or	r4, r0
 ca 04                 addi.s8	r6, 0x4
 f0 6a 4c              ld32	q1, [r6]
 09                    mov	r6, r5
 ca 04                 addi.s8	r6, 0x4
 f0 6a cc              ld32	q3, [r6]
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 6a ca              ld32	q3, [r5]
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 f6 2c                 tst16	r4
 d1 16                 brne8	0x16 <L0>
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 f9 89                 or	r4, r2
 f6 2c                 tst16	r4
 d1 0d                 brne8	0xd <L0>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f4 03                 ldsp16	r7, [sp+0x0]
 e0 39 01              jmp16	313 <L6>
<L0>:
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 ff 14                 fcmp
 f6 2e                 tst16	r6
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 d1 56                 brne8	0x56 <L1>
 03                    mov	r4, r7
 10                    add	r4, r4
 92                    or	r4, r6
 f6 2c                 tst16	r4
 d1 4f                 brne8	0x4f <L1>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 06 80 7f           ldi16	r2, 0x7f80
 f4 3b                 ldsp16	r7, [sp+0xe]
 0b                    mov	r6, r7
 f9 c8                 and	r6, r2
 f5 2a                 cmp	r6, r2
 f8 06                 cset.eq	r6
 f1 2d                 mov	r7, r1
 f9 e8                 and	r7, r2
 f5 2e                 cmp	r7, r2
 da fa 00              breq16	0xfa <L5>
 f0 38 02              stsp16	[sp+0x2], r0
 f0 39 04              stsp16	[sp+0x4], r1
 c3 01                 ldi8	r7, 0x1
 8b                    and	r6, r7
 f4 a6                 tst8	r6
 f4 03                 ldsp16	r7, [sp+0x0]
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 db ec 00              brne16	0xec <L6>
 c4 00 80              ldi16	r4, 0x8000
 f4 3b                 ldsp16	r7, [sp+0xe]
 07                    mov	r5, r7
 84                    and	r5, r4
 f2 42                 sub	r2, r2
 f5 26                 cmp	r5, r2
 fb 54                 cmov.ne	r2, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 ff 02                 fmul
 f1 2e                 mov	r7, r2
 aa                    xor	r6, r6
 ff 00                 fadd
 f4 03                 ldsp16	r7, [sp+0x0]
 e0 cb 00              jmp16	203 <L6>
<L1>:
 c5 80 7f              ldi16	r5, 0x7f80
 f1 21                 mov	r4, r1
 81                    and	r4, r5
 31                    cmp	r4, r5
 d0 4b                 breq8	0x4b <L2>
 f4 11                 ldsp16	r5, [sp+0x4]
 01                    mov	r4, r5
 10                    add	r4, r4
 f0 32 02              ldsp16	r2, [sp+0x2]
 f9 89                 or	r4, r2
 f6 2c                 tst16	r4
 d1 3e                 brne8	0x3e <L2>
 03                    mov	r4, r7
 10                    add	r4, r4
 92                    or	r4, r6
 f6 2c                 tst16	r4
 d1 37                 brne8	0x37 <L2>
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
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
 f0 14 30              leasp	r4, 0x30
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 e1 b4 01              call16	cx_pow_zero
 d6 08                 adjsp	0x8
 f0 34 2c              ldsp16	r4, [sp+0x2c]
 f0 35 2e              ldsp16	r5, [sp+0x2e]
 f0 30 28              ldsp16	r0, [sp+0x28]
 f0 31 2a              ldsp16	r1, [sp+0x2a]
 f4 03                 ldsp16	r7, [sp+0x0]
 d4 77                 jmp8	0x77 <L6>
<L2>:
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f0 14 20              leasp	r4, 0x20
 f0 15 18              leasp	r5, 0x18
 e1 a9 03              call16	clogf
 f0 34 20              ldsp16	r4, [sp+0x20]
 f0 35 22              ldsp16	r5, [sp+0x22]
 f0 36 24              ldsp16	r6, [sp+0x24]
 f0 37 26              ldsp16	r7, [sp+0x26]
 d6 f4                 adjsp	-0xc
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 14 3c              leasp	r4, 0x3c
 f2 6a                 mov32	q3, q0
 e1 03 0c              call16	__mulsc3
 d6 0c                 adjsp	0xc
 f0 32 34              ldsp16	r2, [sp+0x34]
 f0 33 36              ldsp16	r3, [sp+0x36]
 f1 2b                 mov	r6, r3
 1a                    add	r6, r6
 f9 c9                 or	r6, r2
 f0 34 30              ldsp16	r4, [sp+0x30]
 f0 35 32              ldsp16	r5, [sp+0x32]
 f6 2e                 tst16	r6
 d1 25                 brne8	0x25 <L7>
 e1 90 04              call16	expf
 f2 62                 mov32	q0, q2
<L3>:
 f4 03                 ldsp16	r7, [sp+0x0]
<L4>:
 f2 69                 mov32	q2, q1
 d4 08                 jmp8	0x8 <L6>
<L5>:
 f4 03                 ldsp16	r7, [sp+0x0]
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
<L6>:
 f4 1a                 ldsp16	r6, [sp+0x6]
 f0 6b 0c              st32	[r6], q0
 ca 04                 addi.s8	r6, 0x4
 f0 6b 8c              st32	[r6], q2
 03                    mov	r4, r7
 d6 3c                 adjsp	0x3c
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L7>:
 f1 2b                 mov	r6, r3
 c7 80 7f              ldi16	r7, 0x7f80
 8b                    and	r6, r7
 3b                    cmp	r6, r7
 d1 17                 brne8	0x17 <L8>
 c6 80 ff              ldi16	r6, 0xff80
 a9                    xor	r6, r5
 0c                    mov	r7, r4
 9e                    or	r7, r6
 f6 2f                 tst16	r7
 d1 6e                 brne8	0x6e <L9>
 20                    sub	r4, r4
 25                    sub	r5, r5
 f2 62                 mov32	q0, q2
 f2 6b                 mov32	q3, q1
 e1 72 05              call16	copysignf
 f2 66                 mov32	q1, q2
 d4 c0                 jmp8	-0x40 <L3>
<L8>:
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f0 16 10              leasp	r6, 0x10
 f0 17 38              leasp	r7, 0x38
 f2 69                 mov32	q2, q1
 e1 74 05              call16	sincosf
 f0 30 38              ldsp16	r0, [sp+0x38]
 f0 31 3a              ldsp16	r1, [sp+0x3a]
 f1 29                 mov	r6, r1
 1a                    add	r6, r6
 f9 c1                 or	r6, r0
 f6 2e                 tst16	r6
 d0 69                 breq8	0x69 <L12>
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 aa                    xor	r6, r6
 c7 a0 42              ldi16	r7, 0x42a0
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d1 48                 brne8	0x48 <L10>
 aa                    xor	r6, r6
 c7 40 43              ldi16	r7, 0x4340
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d9 3e                 brsge8	0x3e <L10>
 aa                    xor	r6, r6
 c7 80 3e              ldi16	r7, 0x3e80
 ff 02                 fmul
 e1 09 04              call16	expf
 f2 66                 mov32	q1, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 d4 22                 jmp8	0x22 <L11>
<L9>:
 c6 80 7f              ldi16	r6, 0x7f80
 a9                    xor	r6, r5
 92                    or	r4, r6
 f6 2c                 tst16	r4
 db 83 00              brne16	0x83 <L15>
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f2 42                 sub	r2, r2
 f0 07 c0 7f           ldi16	r3, 0x7fc0
 e0 46 ff              jmp16	-186 <L3>
<L10>:
 e1 d1 03              call16	expf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
<L11>:
 ff 02                 fmul
 f2 62                 mov32	q0, q2
<L12>:
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 09                    mov	r6, r5
 1a                    add	r6, r6
 f2 66                 mov32	q1, q2
 98                    or	r6, r4
 f6 2e                 tst16	r6
 f4 03                 ldsp16	r7, [sp+0x0]
 da 29 ff              breq16	-0xd7 <L4>
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 aa                    xor	r6, r6
 c7 a0 42              ldi16	r7, 0x42a0
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d1 2d                 brne8	0x2d <L13>
 aa                    xor	r6, r6
 c7 40 43              ldi16	r7, 0x4340
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d9 23                 brsge8	0x23 <L13>
 aa                    xor	r6, r6
 c7 80 3e              ldi16	r7, 0x3e80
 ff 02                 fmul
 e1 8e 03              call16	expf
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
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
 d4 07                 jmp8	0x7 <L14>
<L13>:
 e1 71 03              call16	expf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
<L14>:
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 e0 d2 fe              jmp16	-302 <L3>
<L15>:
 f2 30                 sub	r0, r0
 f0 05 c0 7f           ldi16	r1, 0x7fc0
 f2 64                 mov32	q1, q0
 e0 c7 fe              jmp16	-313 <L3>

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
 e1 2b 07              call16	atan2f
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
 e1 40 04              call16	copysignf
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 e0 ce 00              jmp16	206 <L4>
<L0>:
 f2 69                 mov32	q2, q1
 e1 e3 04              call16	fabsf
 aa                    xor	r6, r6
 c7 80 4b              ldi16	r7, 0x4b80
 ff 14                 fcmp
 ce 02                 cmpi.s8	r6, 0x2
 d2 68                 brult8	0x68 <L1>
 aa                    xor	r6, r6
 c7 00 40              ldi16	r7, 0x4000
 f2 69                 mov32	q2, q1
 e1 1e 09              call16	fmodf
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
 e1 c2 03              call16	copysignf
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
 e1 ac 03              call16	copysignf
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
 e1 a3 03              call16	sincosf
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
 e1 66 03              call16	copysignf
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
 e1 22 03              call16	copysignf
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f2 6b                 mov32	q3, q1
 e1 17 03              call16	copysignf
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
 e1 f0 02              call16	copysignf
 f2 66                 mov32	q1, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 e1 e3 02              call16	copysignf
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
 e1 a1 02              call16	copysignf
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
 e1 7b 02              call16	copysignf
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
<L10>:
 e1 6e 02              call16	copysignf
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
 d6 ee                 adjsp	-0x12
 f4 50                 stsp16	[sp+0x4], r4
 01                    mov	r4, r5
 c8 04                 addi.s8	r4, 0x4
 f0 6a 48              ld32	q1, [r4]
 f0 6a 8a              ld32	q2, [r5]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 e1 e7 02              call16	fabsf
 f2 62                 mov32	q0, q2
 f0 3a 0a              stsp16	[sp+0xa], r2
 f0 3b 0c              stsp16	[sp+0xc], r3
 f2 69                 mov32	q2, q1
 e1 da 02              call16	fabsf
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 fb 22                 cmov.eq	r4, r2
 fb 2b                 cmov.eq	r5, r3
 fb 10                 cmov.eq	r2, r0
 fb 19                 cmov.eq	r3, r1
 f2 62                 mov32	q0, q2
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 a1                    xor	r4, r5
 f1 29                 mov	r6, r1
 1a                    add	r6, r6
 a9                    xor	r6, r5
 f1 24                 mov	r5, r0
 96                    or	r5, r6
 f0 3a 0e              stsp16	[sp+0xe], r2
 f0 3b 10              stsp16	[sp+0x10], r3
 f1 2a                 mov	r6, r2
 98                    or	r6, r4
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
 f0 3a 06              stsp16	[sp+0x6], r2
 f0 3b 08              stsp16	[sp+0x8], r3
 f6 2e                 tst16	r6
 f8 04                 cset.eq	r4
 f6 2d                 tst16	r5
 da 9c 00              breq16	0x9c <L2>
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 f4 a4                 tst8	r4
 db 94 00              brne16	0x94 <L2>
 f2 68                 mov32	q2, q0
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 f2 6b                 mov32	q3, q1
 ff 14                 fcmp
 ce 02                 cmpi.s8	r6, 0x2
 da a5 00              breq16	0xa5 <L3>
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d1 48                 brne8	0x48 <L0>
 aa                    xor	r6, r6
 c7 c0 3f              ldi16	r7, 0x3fc0
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 d1 3e                 brne8	0x3e <L0>
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 f2 69                 mov32	q2, q1
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 d1 32                 brne8	0x32 <L0>
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 c7 80 bf              ldi16	r7, 0xbf80
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 e1 3a 02              call16	log1pf
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 02                 fmul
 d4 2d                 jmp8	0x2d <L1>
<L0>:
 f1 11                 mov	r2, r1
 f4 82                 lsl16.1	r2
 f9 41                 or	r2, r0
 f2 68                 mov32	q2, q0
 e1 4f 03              call16	logf
 f6 2a                 tst16	r2
 d0 1e                 breq8	0x1e <L1>
 f2 66                 mov32	q1, q2
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f2 6a                 mov32	q3, q0
 ff 03                 fdiv
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 e1 11 02              call16	log1pf
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 00                 fadd
<L1>:
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
<L2>:
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e1 0a 04              call16	atan2f
 f4 13                 ldsp16	r7, [sp+0x4]
 0b                    mov	r6, r7
 ca 04                 addi.s8	r6, 0x4
 f0 6b 8c              st32	[r6], q2
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f0 6b 8e              st32	[r7], q2
 03                    mov	r4, r7
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L3>:
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 d4 d4                 jmp8	-0x2c <L1>

<expf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 c6 80 7f              ldi16	r6, 0x7f80
 f5 0e                 cmp	r1, r6
 d2 1f                 brult8	0x1f <L0>
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 0c              cmp32	q0, q3
 d1 56                 brne8	0x56 <L2>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 69 0c              cmp32	q0, q3
 fd 26                 cmov.slt	r4, r6
 fd 2f                 cmov.slt	r5, r7
 e0 e1 00              jmp16	225 <L6>
<L0>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d3 18                 brslt8	0x18 <L1>
 c6 18 72              ldi16	r6, 0x7218
 c7 b1 42              ldi16	r7, 0x42b1
 f0 69 0c              cmp32	q0, q3
 d2 0d                 brult8	0xd <L1>
 c0 22                 ldi8	r4, 0x22
 f0 5c 10 01           stm16	[0x110], r4
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 e0 c2 00              jmp16	194 <L6>
<L1>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c8              cmp32	q3, q2
 d3 1d                 brslt8	0x1d <L3>
 c6 b6 f1              ldi16	r6, 0xf1b6
 c7 cf 42              ldi16	r7, 0x42cf
 f0 69 0c              cmp32	q0, q3
 d2 12                 brult8	0x12 <L3>
 c0 22                 ldi8	r4, 0x22
 f0 5c 10 01           stm16	[0x110], r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e0 a1 00              jmp16	161 <L6>
<L2>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 e0 9a 00              jmp16	154 <L6>
<L3>:
 c6 3b aa              ldi16	r6, 0xaa3b
 c7 b8 3f              ldi16	r7, 0x3fb8
 f2 66                 mov32	q1, q2
 ff 02                 fmul
 c6 18 72              ldi16	r6, 0x7218
 c7 b1 3e              ldi16	r7, 0x3eb1
 f0 69 c0              cmp32	q3, q0
 d8 66                 bruge8	0x66 <L4>
 f1 2b                 mov	r6, r3
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
 d9 41                 brsge8	0x41 <L5>
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
 d2 27                 brult8	0x27 <L6>
 c2 22                 ldi8	r6, 0x22
 f0 5e 10 01           stm16	[0x110], r6
 d4 1f                 jmp8	0x1f <L6>
<L4>:
 ff 15 05 66 01 1d 3c 23 fe 64 3d bc 01 76 3e 96 70 31 3f 00 00 80 3f  fpoly	5, 0.00958285294, 0.0559064262, 0.240240991, 0.693124175, 1.0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a5                    xor	r5, r5
<L5>:
 fa 47                 lsl16i	r5, 0x7
 a0                    xor	r4, r4
 f7 6b                 add32	q2, q3
<L6>:
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
 e0 95 00              jmp16	149 <L3>
<L0>:
 aa                    xor	r6, r6
 c7 80 3f              ldi16	r7, 0x3f80
 ff 00                 fadd
 c7 80 80              ldi16	r7, 0x8080
 f2 62                 mov32	q0, q2
 f7 63                 add32	q0, q3
 f0 69 c0              cmp32	q3, q0
 dd 8b 00              bruge16	0x8b <L5>
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 7f              ldi8	r3, 0x7f
 f0 69 48              cmp32	q1, q2
 d2 0b                 brult8	0xb <L1>
 aa                    xor	r6, r6
 c7 00 4c              ldi16	r7, 0x4c00
 ff 02                 fmul
 c6 68 ff              ldi16	r6, 0xff68
 d4 03                 jmp8	0x3 <L2>
<L1>:
 c6 81 ff              ldi16	r6, 0xff81
<L2>:
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 f0 04 20 fb           ldi16	r0, 0xfb20
 f0 01 4a              ldi8	r1, 0x4a
 f7 61                 add32	q0, q1
 c3 80                 ldi8	r7, 0x80
 f9 e4                 and	r7, r1
 f9 7d                 or	r3, r7
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 12                    add	r4, r6
 f1 29                 mov	r6, r1
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 18                    add	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
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
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 d0 11                 breq8	0x11 <L6>
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c8              cmp32	q3, q2
 d9 12                 brsge8	0x12 <L7>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 d4 dd                 jmp8	-0x23 <L4>
<L6>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 10 01           stm16	[0x110], r4
 a0                    xor	r4, r4
 c5 80 ff              ldi16	r5, 0xff80
 d4 d1                 jmp8	-0x2f <L4>
<L7>:
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 69 c4              cmp32	q3, q1
 d8 07                 bruge8	0x7 <L8>
 c6 c0 7f              ldi16	r6, 0x7fc0
 99                    or	r6, r5
 06                    mov	r5, r6
 d4 c1                 jmp8	-0x3f <L4>
<L8>:
 c2 21                 ldi8	r6, 0x21
 f0 5e 10 01           stm16	[0x110], r6
 c6 c0 7f              ldi16	r6, 0x7fc0
 99                    or	r6, r5
 06                    mov	r5, r6
 d4 b4                 jmp8	-0x4c <L4>

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
 dd 89 00              bruge16	0x89 <L3>
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
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f0 06 20 fb           ldi16	r2, 0xfb20
 f0 03 4a              ldi8	r3, 0x4a
 f7 64                 add32	q1, q0
 c3 80                 ldi8	r7, 0x80
 f9 ec                 and	r7, r3
 f9 3d                 or	r1, r7
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 12                    add	r4, r6
 f1 2b                 mov	r6, r3
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 18                    add	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f9 82                 xor	r4, r0
 f9 a6                 xor	r5, r1
 aa                    xor	r6, r6
 c7 80 bf              ldi16	r7, 0xbf80
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
 f2 67                 mov32	q1, q3
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 14                 fcmp
 ce 02                 cmpi.s8	r6, 0x2
 da 18 02              breq16	0x218 <L15>
 f2 6a                 mov32	q3, q0
 ff 0b                 fabs	q3
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d0 2c                 breq8	0x2c <L0>
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 ff 09                 fabs	q1
 f0 69 48              cmp32	q1, q2
 d0 40                 breq8	0x40 <L1>
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 c8              cmp32	q3, q2
 d1 4e                 brne8	0x4e <L2>
 f0 39 02              stsp16	[sp+0x2], r1
 c6 c9 3f              ldi16	r6, 0x3fc9
 c7 49 3f              ldi16	r7, 0x3f49
 f0 69 48              cmp32	q1, q2
 fb 37                 cmov.eq	r6, r7
 c4 db 0f              ldi16	r4, 0xfdb
 0e                    mov	r7, r6
 08                    mov	r6, r4
 e0 8a 01              jmp16	394 <L12>
<L0>:
 c4 00 80              ldi16	r4, 0x8000
 f9 84                 and	r4, r1
 a5                    xor	r5, r5
 c6 49 40              ldi16	r6, 0x4049
 c7 49 c0              ldi16	r7, 0xc049
 31                    cmp	r4, r5
 fb 77                 cmov.ne	r6, r7
 c4 db 0f              ldi16	r4, 0xfdb
 06                    mov	r5, r6
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 fd 04                 cmov.slt	r0, r4
 fd 0d                 cmov.slt	r1, r5
 f2 6a                 mov32	q3, q0
 e0 96 01              jmp16	406 <L13>
<L1>:
 c4 00 80              ldi16	r4, 0x8000
 f9 84                 and	r4, r1
 a5                    xor	r5, r5
 c6 c9 3f              ldi16	r6, 0x3fc9
 c7 c9 bf              ldi16	r7, 0xbfc9
 31                    cmp	r4, r5
 fb 77                 cmov.ne	r6, r7
 c4 db 0f              ldi16	r4, 0xfdb
 0e                    mov	r7, r6
 08                    mov	r6, r4
 e0 7f 01              jmp16	383 <L13>
<L2>:
 f0 69 48              cmp32	q1, q2
 d1 08                 brne8	0x8 <L3>
 f0 39 02              stsp16	[sp+0x2], r1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 e0 45 01              jmp16	325 <L12>
<L3>:
 f0 69 4c              cmp32	q1, q3
 d8 3a                 bruge8	0x3a <L4>
 f2 69                 mov32	q2, q1
 ff 03                 fdiv
 f2 66                 mov32	q1, q2
 f1 23                 mov	r4, r3
 c5 ff 3e              ldi16	r5, 0x3eff
 34                    cmp	r5, r4
 d2 68                 brult8	0x68 <L5>
 c5 7f 3e              ldi16	r5, 0x3e7f
 34                    cmp	r5, r4
 dc b8 00              brult16	0xb8 <L7>
 f0 39 02              stsp16	[sp+0x2], r1
 f2 69                 mov32	q2, q1
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 ff 15 04 16 15 05 be 3e 59 4c 3e 46 aa aa be 00 00 80 3f      fpoly	4, -0.129963249, 0.199559182, -0.333330333, 1.0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 e0 fa 00              jmp16	250 <L10>
<L4>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6b                 mov32	q3, q1
 ff 03                 fdiv
 f2 66                 mov32	q1, q2
 f1 23                 mov	r4, r3
 c5 ff 3e              ldi16	r5, 0x3eff
 34                    cmp	r5, r4
 d2 58                 brult8	0x58 <L6>
 f0 39 02              stsp16	[sp+0x2], r1
 c5 7f 3e              ldi16	r5, 0x3e7f
 34                    cmp	r5, r4
 dc 9d 00              brult16	0x9d <L8>
 f2 69                 mov32	q2, q1
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 ff 15 04 16 15 05 be 3e 59 4c 3e 46 aa aa be 00 00 80 3f      fpoly	4, -0.129963249, 0.199559182, -0.333330333, 1.0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 e0 c8 00              jmp16	200 <L11>
<L5>:
 c5 3f 3f              ldi16	r5, 0x3f3f
 34                    cmp	r5, r4
 dc 95 00              brult16	0x95 <L9>
 f0 39 02              stsp16	[sp+0x2], r1
 aa                    xor	r6, r6
 c7 20 bf              ldi16	r7, 0xbf20
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 ff 15 05 a1 71 d1 3d c3 37 9c 3c ed 79 a5 be fd 17 38 3f 5e 00 0f 3f  fpoly	5, 0.102267511, 0.019069558, -0.323195845, 0.719116032, 0.558599353
 e0 92 00              jmp16	146 <L10>
<L6>:
 f0 39 02              stsp16	[sp+0x2], r1
 c5 3f 3f              ldi16	r5, 0x3f3f
 34                    cmp	r5, r4
 dc ca 00              brult16	0xca <L14>
 aa                    xor	r6, r6
 c7 20 bf              ldi16	r7, 0xbf20
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 ff 15 05 a1 71 d1 3d c3 37 9c 3c ed 79 a5 be fd 17 38 3f 5e 00 0f 3f  fpoly	5, 0.102267511, 0.019069558, -0.323195845, 0.719116032, 0.558599353
 d4 71                 jmp8	0x71 <L11>
<L7>:
 f0 39 02              stsp16	[sp+0x2], r1
 aa                    xor	r6, r6
 c7 c0 be              ldi16	r7, 0xbec0
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 ff 15 05 29 9e 3f 3e ad d1 05 be 09 8f 93 be 92 70 60 3f c7 b0 b7 3e  fpoly	5, 0.187126771, -0.130682662, -0.288200647, 0.876717686, 0.358770579
 d4 43                 jmp8	0x43 <L10>
<L8>:
 aa                    xor	r6, r6
 c7 c0 be              ldi16	r7, 0xbec0
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 ff 15 05 29 9e 3f 3e ad d1 05 be 09 8f 93 be 92 70 60 3f c7 b0 b7 3e  fpoly	5, 0.187126771, -0.130682662, -0.288200647, 0.876717686, 0.358770579
 d4 2c                 jmp8	0x2c <L11>
<L9>:
 f0 39 02              stsp16	[sp+0x2], r1
 aa                    xor	r6, r6
 c7 60 bf              ldi16	r7, 0xbf60
 f2 69                 mov32	q2, q1
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
<L12>:
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 c4 db 0f              ldi16	r4, 0xfdb
 c5 49 40              ldi16	r5, 0x4049
 ff 01                 fsub
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 40              cmp32	q1, q0
 fd 34                 cmov.slt	r6, r4
 fd 3d                 cmov.slt	r7, r5
 c4 00 80              ldi16	r4, 0x8000
 f0 31 02              ldsp16	r1, [sp+0x2]
 f9 84                 and	r4, r1
 ff 0b                 fabs	q3
 f2 63                 mov32	q0, q3
 ff 04                 fneg	q0
 a5                    xor	r5, r5
 31                    cmp	r4, r5
 fb 70                 cmov.ne	r6, r0
 fb 79                 cmov.ne	r7, r1
<L13>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L14>:
 aa                    xor	r6, r6
 c7 60 bf              ldi16	r7, 0xbf60
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 ff 15 05 d6 da b4 3c 79 68 9e 3d 96 b6 8f be 42 fe 10 3f 3f 05 38 3f  fpoly	5, 0.0220770054, 0.0773477033, -0.280689895, 0.566379666, 0.718830049
 d4 a7                 jmp8	-0x59 <L11>
<L15>:
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d4 cc                 jmp8	-0x34 <L13>

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
 d6 fa                 adjsp	-0x6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f4 52                 stsp16	[sp+0x4], r6
 f1 75                 zext8	r5
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 f3 19                 mulu8.w	r6, r5
 f4 4a                 stsp16	[sp+0x2], r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f3 1b                 mulu8.w	r6, r7
 f4 42                 stsp16	[sp+0x0], r6
 fa 78                 lsr16i	r4, 0x8
 f4 13                 ldsp16	r7, [sp+0x4]
 08                    mov	r6, r4
 f3 1b                 mulu8.w	r6, r7
 f3 11                 mulu8.w	r4, r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 16                    add	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 fa 38                 lsl16i	r4, 0x8
 f4 09                 ldsp16	r5, [sp+0x2]
 14                    add	r5, r4
 34                    cmp	r5, r4
 f8 14                 cset.ult	r4
 13                    add	r4, r7
 fa 58                 lsl16i	r6, 0x8
 19                    add	r6, r5
 39                    cmp	r6, r5
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 02                    mov	r4, r6
 d6 06                 adjsp	0x6
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
 f4 43                 stsp16	[sp+0x0], r7
 f4 13                 ldsp16	r7, [sp+0x4]
 f3 3d                 mulsu8.w	r7, r5
 f4 5b                 stsp16	[sp+0x6], r7
 fa 78                 lsr16i	r4, 0x8
 0c                    mov	r7, r4
 f4 11                 ldsp16	r5, [sp+0x4]
 f3 2d                 muls8.w	r7, r5
 f3 32                 mulsu8.w	r4, r6
 04                    mov	r5, r4
 fa c8                 asr16i	r5, 0x8
 17                    add	r5, r7
 f4 1a                 ldsp16	r6, [sp+0x6]
 fa d8                 asr16i	r6, 0x8
 19                    add	r6, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 19                    add	r6, r5
 fa 38                 lsl16i	r4, 0x8
 f4 03                 ldsp16	r7, [sp+0x0]
 1c                    add	r7, r4
 3c                    cmp	r7, r4
 f8 14                 cset.ult	r4
 12                    add	r4, r6
 f4 09                 ldsp16	r5, [sp+0x2]
 11                    add	r4, r5
 f4 19                 ldsp16	r5, [sp+0x6]
 fa 48                 lsl16i	r5, 0x8
 1d                    add	r7, r5
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
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 36 41              ldsp16	r6, [sp+0x41]
 f0 37 43              ldsp16	r7, [sp+0x43]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 34 39              ldsp16	r4, [sp+0x39]
 f0 35 3b              ldsp16	r5, [sp+0x3b]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f0 32 3d              ldsp16	r2, [sp+0x3d]
 f0 33 3f              ldsp16	r3, [sp+0x3f]
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f0 38 26              stsp16	[sp+0x26], r0
 f0 39 28              stsp16	[sp+0x28], r1
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 08                    mov	r6, r4
 f7 8e                 bool	r6
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 01                    mov	r4, r5
 10                    add	r4, r4
 92                    or	r4, r6
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 3c 16              stsp16	[sp+0x16], r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 3a 22              stsp16	[sp+0x22], r2
 f0 3b 24              stsp16	[sp+0x24], r3
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f0 38 2a              stsp16	[sp+0x2a], r0
 f0 39 2c              stsp16	[sp+0x2c], r1
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 c7 00 ff              ldi16	r7, 0xff00
 f0 36 18              ldsp16	r6, [sp+0x18]
 3e                    cmp	r7, r6
 dd e0 01              bruge16	0x1e0 <L5>
 f7 8c                 bool	r4
 15                    add	r5, r5
 94                    or	r5, r4
 3d                    cmp	r7, r5
 dd d8 01              bruge16	0x1d8 <L5>
 f0 3a 18              stsp16	[sp+0x18], r2
 f0 3b 1a              stsp16	[sp+0x1a], r3
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 a3                    xor	r4, r7
 f1 26                 mov	r5, r2
 94                    or	r5, r4
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 a3                    xor	r4, r7
 f1 28                 mov	r6, r0
 98                    or	r6, r4
 f6 2e                 tst16	r6
 f8 04                 cset.eq	r4
 f6 2d                 tst16	r5
 f8 05                 cset.eq	r5
 94                    or	r5, r4
 c2 01                 ldi8	r6, 0x1
 86                    and	r5, r6
 f0 3d 20              stsp16	[sp+0x20], r5
 f4 a5                 tst8	r5
 da 87 00              breq16	0x87 <L0>
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 a3                    xor	r4, r7
 f9 11                 or	r0, r4
 c4 00 80              ldi16	r4, 0x8000
 f9 30                 and	r1, r4
 f6 28                 tst16	r0
 f8 04                 cset.eq	r4
 82                    and	r4, r6
 ff 0d                 u16tof
 aa                    xor	r6, r6
 f1 2d                 mov	r7, r1
 f2 62                 mov32	q0, q2
 ff 04                 fneg	q0
 3e                    cmp	r7, r6
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 a1                    xor	r4, r5
 f9 51                 or	r2, r4
 f6 2a                 tst16	r2
 f8 04                 cset.eq	r4
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 c7 00 80              ldi16	r7, 0x8000
 f9 7c                 and	r3, r7
 ff 0d                 u16tof
 f2 62                 mov32	q0, q2
 ff 04                 fneg	q0
 f5 1e                 cmp	r3, r6
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 f1 0e                 mov	r1, r6
 f1 07                 mov	r0, r7
 c7 00 ff              ldi16	r7, 0xff00
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 32 22              ldsp16	r2, [sp+0x22]
 f0 33 24              ldsp16	r3, [sp+0x24]
 f1 23                 mov	r4, r3
 f9 80                 and	r4, r0
 32                    cmp	r4, r6
 02                    mov	r4, r6
 fb 60                 cmov.ne	r4, r0
 f1 26                 mov	r5, r2
 f7 8d                 bool	r5
 f1 2b                 mov	r6, r3
 1a                    add	r6, r6
 99                    or	r6, r5
 04                    mov	r5, r4
 a0                    xor	r4, r4
 3e                    cmp	r7, r6
 fc 14                 cmov.ult	r2, r4
 fc 1d                 cmov.ult	r3, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 8c                 bool	r4
 15                    add	r5, r5
 94                    or	r5, r4
 3d                    cmp	r7, r5
 d8 23                 bruge8	0x23 <L1>
 f4 09                 ldsp16	r5, [sp+0x2]
 f9 a0                 and	r5, r0
 f5 25                 cmp	r5, r1
 fb 48                 cmov.ne	r1, r0
 f1 25                 mov	r5, r1
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 d4 12                 jmp8	0x12 <L1>
<L0>:
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f0 32 22              ldsp16	r2, [sp+0x22]
 f0 33 24              ldsp16	r3, [sp+0x24]
<L1>:
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 a3                    xor	r4, r7
 f1 26                 mov	r5, r2
 94                    or	r5, r4
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f1 21                 mov	r4, r1
 f1 0f                 mov	r1, r7
 10                    add	r4, r4
 a3                    xor	r4, r7
 f1 28                 mov	r6, r0
 98                    or	r6, r4
 f6 2e                 tst16	r6
 f8 04                 cset.eq	r4
 f6 2d                 tst16	r5
 f0 00 01              ldi8	r0, 0x1
 d0 16                 breq8	0x16 <L2>
 f9 80                 and	r4, r0
 f4 a4                 tst8	r4
 d1 10                 brne8	0x10 <L2>
 f0 34 20              ldsp16	r4, [sp+0x20]
 f4 a4                 tst8	r4
 da fb 00              breq16	0xfb <L7>
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 d4 7e                 jmp8	0x7e <L3>
<L2>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 03                    mov	r4, r7
 10                    add	r4, r4
 f9 86                 xor	r4, r1
 98                    or	r6, r4
 c4 00 80              ldi16	r4, 0x8000
 8c                    and	r7, r4
 f6 2e                 tst16	r6
 f8 04                 cset.eq	r4
 f9 80                 and	r4, r0
 ff 0d                 u16tof
 f2 62                 mov32	q0, q2
 ff 04                 fneg	q0
 aa                    xor	r6, r6
 3e                    cmp	r7, r6
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f1 23                 mov	r4, r3
 10                    add	r4, r4
 c5 00 ff              ldi16	r5, 0xff00
 a1                    xor	r4, r5
 f9 51                 or	r2, r4
 f6 2a                 tst16	r2
 f8 04                 cset.eq	r4
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 c6 00 80              ldi16	r6, 0x8000
 f9 78                 and	r3, r6
 ff 0d                 u16tof
 f2 62                 mov32	q0, q2
 ff 04                 fneg	q0
 af                    xor	r7, r7
 f5 1f                 cmp	r3, r7
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 f1 0f                 mov	r1, r7
 f1 06                 mov	r0, r6
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f1 23                 mov	r4, r3
 82                    and	r4, r6
 33                    cmp	r4, r7
 03                    mov	r4, r7
 fb 60                 cmov.ne	r4, r0
 f1 26                 mov	r5, r2
 f7 8d                 bool	r5
 f1 2f                 mov	r7, r3
 1f                    add	r7, r7
 9d                    or	r7, r5
 04                    mov	r5, r4
 a0                    xor	r4, r4
 c6 00 ff              ldi16	r6, 0xff00
 3b                    cmp	r6, r7
 fc 14                 cmov.ult	r2, r4
 fc 1d                 cmov.ult	r3, r5
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 8c                 bool	r4
 15                    add	r5, r5
 94                    or	r5, r4
 39                    cmp	r6, r5
 dc 8a 01              brult16	0x18a <L10>
<L3>:
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
<L4>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 32 0c              ldsp16	r2, [sp+0xc]
 f0 33 0e              ldsp16	r3, [sp+0xe]
 f2 69                 mov32	q2, q1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 02                 fmul
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 01                 fsub
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
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
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
<L5>:
 f0 37 10              ldsp16	r7, [sp+0x10]
<L6>:
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 6b 8e              st32	[r7], q2
 cb 04                 addi.s8	r7, 0x4
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f0 6b 8e              st32	[r7], q2
 f0 34 16              ldsp16	r4, [sp+0x16]
 d6 2e                 adjsp	0x2e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L7>:
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 15                    add	r5, r5
 f9 a6                 xor	r5, r1
 91                    or	r4, r5
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f1 21                 mov	r4, r1
 f0 30 2a              ldsp16	r0, [sp+0x2a]
 f0 31 2c              ldsp16	r1, [sp+0x2c]
 f4 81                 lsl16.1	r1
 f9 32                 xor	r1, r4
 f9 05                 or	r0, r1
 f1 0c                 mov	r1, r4
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 1f                    add	r7, r7
 ac                    xor	r7, r4
 9b                    or	r6, r7
 f0 34 26              ldsp16	r4, [sp+0x26]
 f0 35 28              ldsp16	r5, [sp+0x28]
 15                    add	r5, r5
 f9 a6                 xor	r5, r1
 91                    or	r4, r5
 f6 2c                 tst16	r4
 f8 04                 cset.eq	r4
 f6 2e                 tst16	r6
 f8 05                 cset.eq	r5
 f6 28                 tst16	r0
 c3 01                 ldi8	r7, 0x1
 f8 06                 cset.eq	r6
 f0 30 18              ldsp16	r0, [sp+0x18]
 f6 28                 tst16	r0
 f1 07                 mov	r0, r7
 f0 37 10              ldsp16	r7, [sp+0x10]
 d0 12                 breq8	0x12 <L8>
 f9 c0                 and	r6, r0
 f4 a6                 tst8	r6
 d1 0c                 brne8	0xc <L8>
 f9 a0                 and	r5, r0
 f4 a5                 tst8	r5
 d1 06                 brne8	0x6 <L8>
 f9 80                 and	r4, r0
 f4 a4                 tst8	r4
 d0 85                 breq8	-0x7b <L6>
<L8>:
 f0 04 00 80           ldi16	r0, 0x8000
 f1 23                 mov	r4, r3
 f9 80                 and	r4, r0
 f2 6b                 mov32	q3, q1
 a5                    xor	r5, r5
 31                    cmp	r4, r5
 01                    mov	r4, r5
 fb 60                 cmov.ne	r4, r0
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f1 23                 mov	r4, r3
 f9 80                 and	r4, r0
 31                    cmp	r4, r5
 01                    mov	r4, r5
 fb 60                 cmov.ne	r4, r0
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f1 21                 mov	r4, r1
 c5 00 80              ldi16	r5, 0x8000
 81                    and	r4, r5
 a5                    xor	r5, r5
 31                    cmp	r4, r5
 c4 00 80              ldi16	r4, 0x8000
 fb 6c                 cmov.ne	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 06                    mov	r5, r6
 f7 8d                 bool	r5
 03                    mov	r4, r7
 10                    add	r4, r4
 91                    or	r4, r5
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 35 18              ldsp16	r5, [sp+0x18]
 a0                    xor	r4, r4
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 c5 00 ff              ldi16	r5, 0xff00
 f0 34 22              ldsp16	r4, [sp+0x22]
 34                    cmp	r5, r4
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 fc 34                 cmov.ult	r6, r4
 fc 3d                 cmov.ult	r7, r5
 f0 3e 22              stsp16	[sp+0x22], r6
 f0 3f 24              stsp16	[sp+0x24], r7
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
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f1 20                 mov	r4, r0
 f7 8c                 bool	r4
 f1 25                 mov	r5, r1
 15                    add	r5, r5
 94                    or	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 06 00 ff           ldi16	r2, 0xff00
 f5 15                 cmp	r2, r5
 fc 06                 cmov.ult	r0, r6
 fc 0c                 cmov.ult	r1, r4
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f1 20                 mov	r4, r0
 f7 8c                 bool	r4
 f1 25                 mov	r5, r1
 15                    add	r5, r5
 94                    or	r5, r4
 f5 15                 cmp	r2, r5
 d2 1f                 brult8	0x1f <L11>
<L9>:
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 35 24              ldsp16	r5, [sp+0x24]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 e0 7c fe              jmp16	-388 <L4>
<L10>:
 f4 29                 ldsp16	r5, [sp+0xa]
 f9 a0                 and	r5, r0
 f5 25                 cmp	r5, r1
 fb 48                 cmov.ne	r1, r0
 f1 25                 mov	r5, r1
 a0                    xor	r4, r4
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 e0 64 fe              jmp16	-412 <L3>
<L11>:
 c4 00 80              ldi16	r4, 0x8000
 f9 30                 and	r1, r4
 a5                    xor	r5, r5
 f5 0d                 cmp	r1, r5
 fb 6c                 cmov.ne	r5, r4
 f1 0d                 mov	r1, r5
 f2 30                 sub	r0, r0
 d4 d1                 jmp8	-0x2f <L9>
