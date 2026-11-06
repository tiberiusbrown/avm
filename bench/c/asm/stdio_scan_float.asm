
stdio_scan_float.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000536 l     F .text	00000044 __avm_run_constructors
00000000 l    df *ABS*	00000000 stdio_scan_float.c
00000103 l     O .data	00000004 result_sink
00000100 l     O .data	00000003 call
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 stdio_scan_string.c
000005c0 l     F .text	00000010 string_read
000005d0 l     F .text	00000006 string_unread
00000000 l    df *ABS*	00000000 stdio_scan_core.c
00000000 l    df *ABS*	00000000 ctype.c
00000000 l    df *ABS*	00000000 stdio_scan_integer.c
00000000 l    df *ABS*	00000000 stdio_scan_float.c
00002c0a l     O .rodata	00000028 __avm_scan_float.threshold
00000000 l    df *ABS*	00000000 strtof_internal.c
00002c32 l     O .rodata	00000018 __avm_decimal_value.powers
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 trap_report.c
00000000 l    df *ABS*	00000000 trap_lookup.c
00002878 l     F .text	0000010f open_section
00002987 l     F .text	000000ff read_uleb128
00000000 l    df *ABS*	00000000 string.c
00000000 l    df *ABS*	00000000 pgmspace.c
00000000 l    df *ABS*	00000000 malloc.c
00000000 l    df *ABS*	00000000 font_br5n.c
00000000 l    df *ABS*	00000000 integer.c
00000000 l    df *ABS*	00000000 
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
0000309e l       .init_array	00000000 .hidden __init_array_end
0000309e l       .init_array	00000000 .hidden __init_array_start
0000309e l       .fini_array	00000000 .hidden __fini_array_start
0000309e l       .fini_array	00000000 .hidden __fini_array_end
00000107 l       *ABS*	00000000 .hidden __avm_heap_start
0000202f g     F .text	00000015 __avm_trap_entry
00000513 g     F .text	00000023 _start
0000057a g     F .text	00000044 avm_test_main
00001fca g     F .text	00000065 __avm_terminate
000005be g     F .text	00000002 avm_halt
000005d6 g     F .text	0000004d sscanf
00000da8 g     F .text	00000011 isalnum
00000db9 g     F .text	0000000c isspace
00002cfd g     O .rodata	000003a1 _avm_font_br5n_storage
00000000  w      *UND*	00000000 __avm_run_local_dtors
0000217b g     F .text	000006fd __avm_trap_lookup
00002044 g     F .text	00000137 __avm_trap_report
00000623 g     F .text	00000022 __avm_scan_peek
00000645 g     F .text	0000003b __avm_scan_take
00000680 g     F .text	00000728 __avm_vscan
00000dc5 g     F .text	00000059 __avm_scan_count
00000e1e g     F .text	0000073f __avm_scan_integer
0000155d g     F .text	0000076b __avm_scan_float
00002b21 g     F .text	00000060 __avm_mulsi3
00002bf6 g     F .text	00000014 __avm_udivsi3
00001ef0 g     F .text	000000da __avm_decimal_value
00001cc8 g     F .text	00000228 __avm_hex_value
00000000  w      *UND*	00000000 __avm_errno
00002a8b g     F .text	0000002c __avm_ashlsi3
00002ab7 g     F .text	0000002c __avm_lshrsi3
00002a86 g     F .text	00000005 memset
00000500 g       *ABS*	00000000 __avm_framebuffer
00002ae3 g     F .text	0000003e __avm_umulhisi3
00002b81 g     F .text	00000075 __avm_udivmodsi4

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
 e1 a1 1a              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 88 00              call16	avm_halt

<__avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 9e 30              ldi16	r4, 0x309e
 c1 00                 ldi8	r5, 0x0
 c6 9e 30              ldi16	r6, 0x309e
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 9e 30           ldi16	r0, 0x309e
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 9e 30           ldi16	r2, 0x309e
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
 d6 fc                 adjsp	-0x4
 f0 00 20              ldi8	r0, 0x20
 d7 01                 sys	debug_break
 f0 06 10 0b           ldi16	r2, 0xb10
 f0 07 00 0b           ldi16	r3, 0xb00
 f0 05 03 01           ldi16	r1, 0x103
<L0>:
 c4 00 01              ldi16	r4, 0x100
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 d6 fa                 adjsp	-0x6
 f0 14 06              leasp	r4, 0x6
 f4 50                 stsp16	[sp+0x4], r4
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 3b 00              stsp16	[sp+0x0], r3
 eb                    callp	q3
 d6 06                 adjsp	0x6
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 6b 82              st32	[r1], q2
 f4 b0                 dec16	r0
 f4 a0                 tst8	r0
 d1 dd                 brne8	-0x23 <L0>
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<string_read>:
 64                    ld16	r5, [r4]
 49                    ld8u	r6, [r5]
 f4 a6                 tst8	r6
 d0 06                 breq8	0x6 <L0>
 09                    mov	r6, r5
 f4 ae                 inc16	r6
 72                    st16	[r4], r6
 41                    ld8u	r4, [r5]
 ef                    ret
<L0>:
 c4 ff ff              ldi16	r4, 0xffff
 ef                    ret

<string_unread>:
 68                    ld16	r6, [r4]
 f4 b6                 dec16	r6
 72                    st16	[r4], r6
 01                    mov	r4, r5
 ef                    ret

<sscanf>:
 b1                    push16	r1
 b0                    push16	r0
 d6 ec                 adjsp	-0x14
 f0 35 1d              ldsp16	r5, [sp+0x1d]
 f0 34 1b              ldsp16	r4, [sp+0x1b]
 f0 16 1f              leasp	r6, 0x1f
 f4 62                 stsp16	[sp+0x8], r6
 f4 68                 stsp16	[sp+0xa], r4
 f0 04 c0 05           ldi16	r0, 0x5c0
 f0 01 00              ldi8	r1, 0x0
 f0 38 0e              stsp16	[sp+0xe], r0
 f0 29 10              stsp8	[sp+0x10], r1
 f1 20                 mov	r4, r0
 f1 38                 stsp8	[sp+0x2], r4
 f0 04 d0 05           ldi16	r0, 0x5d0
 f0 01 00              ldi8	r1, 0x0
 f0 38 11              stsp16	[sp+0x11], r0
 f0 29 13              stsp8	[sp+0x13], r1
 f1 20                 mov	r4, r0
 f1 44                 stsp8	[sp+0x5], r4
 f0 14 0a              leasp	r4, 0xa
 f4 40                 stsp16	[sp+0x0], r4
 f4 70                 stsp16	[sp+0xc], r4
 f4 3c                 ldsp16	r4, [sp+0xf]
 f4 4c                 stsp16	[sp+0x3], r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 f4 58                 stsp16	[sp+0x6], r4
 f0 14 00              leasp	r4, 0x0
 d5 62                 call8	__avm_vscan
 d6 14                 adjsp	0x14
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<__avm_scan_peek>:
 b0                    push16	r0
 ed a8 30              ld8u	r5, [r4+16]
 f4 a5                 tst8	r5
 d0 05                 breq8	0x5 <L0>
 ed 98 2e              ld16	r4, [r4+14]
 b8                    pop16	r0
 ef                    ret
<L0>:
 04                    mov	r5, r4
 c9 02                 addi.s8	r5, 0x2
 f7 2e                 ld16	r6, [r5+]
 4d                    ld8u	r7, [r5]
 64                    ld16	r5, [r4]
 f1 04                 mov	r0, r4
 01                    mov	r4, r5
 eb                    callp	q3
 c1 01                 ldi8	r5, 0x1
 ee a0 30              st8	[r0+16], r5
 ee 90 2e              st16	[r0+14], r4
 b8                    pop16	r0
 ef                    ret

<__avm_scan_take>:
 b3                    push16	r3
 b2                    push16	r2
 b0                    push16	r0
 f1 04                 mov	r0, r4
 ed 80 30              ld8u	r4, [r0+16]
 f4 a4                 tst8	r4
 d0 05                 breq8	0x5 <L0>
 ed 90 2e              ld16	r4, [r0+14]
 d4 0e                 jmp8	0xe <L1>
<L0>:
 f1 20                 mov	r4, r0
 c8 02                 addi.s8	r4, 0x2
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 ed 90 20              ld16	r4, [r0+0]
 eb                    callp	q3
 ee 90 2e              st16	[r0+14], r4
<L1>:
 a5                    xor	r5, r5
 ee a0 30              st8	[r0+16], r5
 cc ff                 cmpi.s8	r4, -0x1
 d0 10                 breq8	0x10 <L2>
 f0 08 08              addi.s8	r0, 0x8
 f0 6a c0              ld32	q3, [r0]
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f7 67                 add32	q1, q3
 f0 6b 40              st32	[r0], q1
<L2>:
 b8                    pop16	r0
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_vscan>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d2                 adjsp	-0x2e
 f1 05                 mov	r0, r5
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 6a c8              ld32	q3, [r4]
 c8 04                 addi.s8	r4, 0x4
 f0 6a 88              ld32	q2, [r4]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 14 08              leasp	r4, 0x8
 a5                    xor	r5, r5
 c2 09                 ldi8	r6, 0x9
 d7 11                 sys	memset
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 3c 26              stsp16	[sp+0x26], r4
 c0 01                 ldi8	r4, 0x1
 ed 20 20              ld8u	r1, [r0+0]
 f4 a1                 tst8	r1
 d1 31                 brne8	0x31 <L3>
 f1 0c                 mov	r1, r4
 e0 97 06              jmp16	1687 <L94>
<L0>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
 c1 01                 ldi8	r5, 0x1
 f0 2d 10              stsp8	[sp+0x10], r5
 f4 78                 stsp16	[sp+0xe], r4
 f5 21                 cmp	r4, r1
 db ad 06              brne16	0x6ad <L97>
<L1>:
 a0                    xor	r4, r4
 f0 2c 10              stsp8	[sp+0x10], r4
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f7 6e                 add32	q3, q2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
<L2>:
 ed 20 20              ld8u	r1, [r0+0]
 f4 a1                 tst8	r1
 da 63 06              breq16	0x663 <L92>
<L3>:
 f1 21                 mov	r4, r1
 e1 d1 06              call16	isspace
 f6 2c                 tst16	r4
 d0 1b                 breq8	0x1b <L5>
<L4>:
 ed 80 21              ld8u	r4, [r0+1]
 f4 a8                 inc16	r0
 e1 c5 06              call16	isspace
 f6 2c                 tst16	r4
 d1 f4                 brne8	-0xc <L4>
 f0 1c 10              ldsp8u	r4, [sp+0x10]
 f4 a4                 tst8	r4
 d0 1b                 breq8	0x1b <L6>
 f4 38                 ldsp16	r4, [sp+0xe]
 cc ff                 cmpi.s8	r4, -0x1
 d0 d6                 breq8	-0x2a <L2>
 d4 25                 jmp8	0x25 <L7>
<L5>:
 f1 24                 mov	r5, r0
 f4 ad                 inc16	r5
 f0 0d 25              cmpi.s8	r1, 0x25
 d1 32                 brne8	0x32 <L8>
 41                    ld8u	r4, [r5]
 cc 25                 cmpi.s8	r4, 0x25
 d1 4a                 brne8	0x4a <L10>
 f0 08 02              addi.s8	r0, 0x2
 d4 2a                 jmp8	0x2a <L9>
<L6>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
 c1 01                 ldi8	r5, 0x1
 f0 2d 10              stsp8	[sp+0x10], r5
 f4 78                 stsp16	[sp+0xe], r4
 cc ff                 cmpi.s8	r4, -0x1
 d0 af                 breq8	-0x51 <L2>
<L7>:
 f1 74                 zext8	r4
 e1 88 06              call16	isspace
 f6 2c                 tst16	r4
 d0 a6                 breq8	-0x5a <L2>
 f0 1c 10              ldsp8u	r4, [sp+0x10]
 f4 a4                 tst8	r4
 da d2 00              breq16	0xd2 <L14>
 f4 38                 ldsp16	r4, [sp+0xe]
 e0 d6 00              jmp16	214 <L15>
<L8>:
 f1 05                 mov	r0, r5
<L9>:
 f0 1c 10              ldsp8u	r4, [sp+0x10]
 f4 a4                 tst8	r4
 da 6b ff              breq16	-0x95 <L0>
 f4 38                 ldsp16	r4, [sp+0xe]
 f5 21                 cmp	r4, r1
 da 77 ff              breq16	-0x89 <L1>
 cc ff                 cmpi.s8	r4, -0x1
 f2 39                 sub	r1, r1
 c4 ff ff              ldi16	r4, 0xffff
 fb 0c                 cmov.eq	r1, r4
 e0 f6 05              jmp16	1526 <L95>
<L10>:
 a0                    xor	r4, r4
 f0 3c 19              stsp16	[sp+0x19], r4
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 3e 15              stsp16	[sp+0x15], r6
 f0 3f 17              stsp16	[sp+0x17], r7
 f1 15                 mov	r2, r5
 41                    ld8u	r4, [r5]
 cc 2a                 cmpi.s8	r4, 0x2a
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f1 1c                 mov	r3, r4
 d1 0d                 brne8	0xd <L11>
 c0 01                 ldi8	r4, 0x1
 f0 2c 19              stsp8	[sp+0x19], r4
 ed 60 22              ld8u	r3, [r0+2]
 f0 08 02              addi.s8	r0, 0x2
 f1 10                 mov	r2, r0
<L11>:
 f1 27                 mov	r5, r3
 c9 d0                 addi.s8	r5, -0x30
 f1 75                 zext8	r5
 f0 3d 20              stsp16	[sp+0x20], r5
 cd 0a                 cmpi.s8	r5, 0xa
 dd f0 00              bruge16	0xf0 <L22>
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 38 15              stsp16	[sp+0x15], r0
 f0 39 17              stsp16	[sp+0x17], r1
 ed 64 20              ld8u	r3, [r2+0]
 d4 2c                 jmp8	0x2c <L13>
<L12>:
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 74 23              call16	__avm_mulsi3
 f2 62                 mov32	q0, q2
 f0 34 11              ldsp16	r4, [sp+0x11]
 f0 35 13              ldsp16	r5, [sp+0x13]
 f7 62                 add32	q0, q2
 f0 38 15              stsp16	[sp+0x15], r0
 f0 39 17              stsp16	[sp+0x17], r1
 ed 64 20              ld8u	r3, [r2+0]
 f1 27                 mov	r5, r3
 c9 d0                 addi.s8	r5, -0x30
 f1 75                 zext8	r5
 cd 0a                 cmpi.s8	r5, 0xa
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 dd ad 00              bruge16	0xad <L21>
<L13>:
 f0 0b d0              addi.s8	r3, -0x30
 f1 23                 mov	r4, r3
 a5                    xor	r5, r5
 f0 3c 11              stsp16	[sp+0x11], r4
 f0 3d 13              stsp16	[sp+0x13], r5
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 e1 11 24              call16	__avm_udivsi3
 f4 aa                 inc16	r2
 f0 69 80              cmp32	q2, q0
 d8 b9                 bruge8	-0x47 <L12>
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 3e 15              stsp16	[sp+0x15], r6
 f0 3f 17              stsp16	[sp+0x17], r7
 ed 64 20              ld8u	r3, [r2+0]
 f1 27                 mov	r5, r3
 c9 d0                 addi.s8	r5, -0x30
 f1 75                 zext8	r5
 cd 0a                 cmpi.s8	r5, 0xa
 f2 63                 mov32	q0, q3
 d2 ca                 brult8	-0x36 <L13>
 f0 0f 6c              cmpi.s8	r3, 0x6c
 de 95 00              brslt16	0x95 <L24>
 d4 7c                 jmp8	0x7c <L23>
<L14>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
 f4 78                 stsp16	[sp+0xe], r4
<L15>:
 a5                    xor	r5, r5
 f0 2d 10              stsp8	[sp+0x10], r5
 cc ff                 cmpi.s8	r4, -0x1
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 d0 0a                 breq8	0xa <L16>
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 69                 add32	q2, q1
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
<L16>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
 f0 01 01              ldi8	r1, 0x1
 d4 07                 jmp8	0x7 <L18>
<L17>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
<L18>:
 f0 29 10              stsp8	[sp+0x10], r1
 f4 78                 stsp16	[sp+0xe], r4
 cc ff                 cmpi.s8	r4, -0x1
 da 8f fe              breq16	-0x171 <L2>
 f1 74                 zext8	r4
 e1 68 05              call16	isspace
 f6 2c                 tst16	r4
 da 85 fe              breq16	-0x17b <L2>
 f0 1c 10              ldsp8u	r4, [sp+0x10]
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L19>
 f4 38                 ldsp16	r4, [sp+0xe]
 d4 09                 jmp8	0x9 <L20>
<L19>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
 f4 78                 stsp16	[sp+0xe], r4
<L20>:
 a5                    xor	r5, r5
 f0 2d 10              stsp8	[sp+0x10], r5
 cc ff                 cmpi.s8	r4, -0x1
 d0 c9                 breq8	-0x37 <L17>
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 69                 add32	q2, q1
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 d4 bd                 jmp8	-0x43 <L17>
<L21>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 da c5 04              breq16	0x4c5 <L93>
<L22>:
 f0 0f 6c              cmpi.s8	r3, 0x6c
 d3 17                 brslt8	0x17 <L24>
<L23>:
 f0 0f 77              cmpi.s8	r3, 0x77
 d9 29                 brsge8	0x29 <L25>
 f0 0f 6c              cmpi.s8	r3, 0x6c
 da 8a 00              breq16	0x8a <L28>
 f0 0f 74              cmpi.s8	r3, 0x74
 db b1 01              brne16	0x1b1 <L48>
 f0 01 07              ldi8	r1, 0x7
 e0 97 00              jmp16	151 <L30>
<L24>:
 f0 0f 4c              cmpi.s8	r3, 0x4c
 d0 74                 breq8	0x74 <L27>
 f0 0f 68              cmpi.s8	r3, 0x68
 da 27 01              breq16	0x127 <L42>
 f0 0f 6a              cmpi.s8	r3, 0x6a
 db 6b 01              brne16	0x16b <L46>
 f0 01 05              ldi8	r1, 0x5
 e0 80 00              jmp16	128 <L30>
<L25>:
 f0 0f 7a              cmpi.s8	r3, 0x7a
 d0 78                 breq8	0x78 <L29>
 f0 0f 77              cmpi.s8	r3, 0x77
 db 90 01              brne16	0x190 <L49>
 ed c4 21              ld8u	r6, [r2+1]
 f1 02                 mov	r0, r2
 f4 a8                 inc16	r0
 f1 22                 mov	r4, r2
 c8 02                 addi.s8	r4, 0x2
 ce 66                 cmpi.s8	r6, 0x66
 fb 04                 cmov.eq	r0, r4
 f0 01 01              ldi8	r1, 0x1
 c3 02                 ldi8	r7, 0x2
 f1 21                 mov	r4, r1
 fb 27                 cmov.eq	r4, r7
 f2 22                 add	r4, r2
 40                    ld8u	r4, [r4]
 c8 c6                 addi.s8	r4, -0x3a
 f1 74                 zext8	r4
 c1 f7                 ldi8	r5, 0xf7
 31                    cmp	r4, r5
 dc 9d 04              brult16	0x49d <L99>
 f0 3e 11              stsp16	[sp+0x11], r6
 a0                    xor	r4, r4
 a5                    xor	r5, r5
<L26>:
 ed 40 20              ld8u	r2, [r0+0]
 f0 0a d0              addi.s8	r2, -0x30
 f1 2a                 mov	r6, r2
 f1 76                 zext8	r6
 ce 0a                 cmpi.s8	r6, 0xa
 dd 28 01              bruge16	0x128 <L47>
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 e1 1e 22              call16	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 4b                 sub	r3, r3
 c0 ff                 ldi8	r4, 0xff
 a5                    xor	r5, r5
 f9 88                 and	r4, r2
 f7 6b                 add32	q2, q3
 f4 a8                 inc16	r0
 c2 40                 ldi8	r6, 0x40
 af                    xor	r7, r7
 f0 69 c8              cmp32	q3, q2
 d8 d6                 bruge8	-0x2a <L26>
 e0 67 04              jmp16	1127 <L98>
<L27>:
 f0 01 08              ldi8	r1, 0x8
 d4 19                 jmp8	0x19 <L30>
<L28>:
 f0 01 03              ldi8	r1, 0x3
 f0 29 1a              stsp8	[sp+0x1a], r1
 ed 84 21              ld8u	r4, [r2+1]
 cc 6c                 cmpi.s8	r4, 0x6c
 db bc 00              brne16	0xbc <L43>
 f0 01 04              ldi8	r1, 0x4
 f0 0a 02              addi.s8	r2, 0x2
 d4 05                 jmp8	0x5 <L31>
<L29>:
 f0 01 06              ldi8	r1, 0x6
<L30>:
 f4 aa                 inc16	r2
<L31>:
 f1 02                 mov	r0, r2
<L32>:
 f0 29 1a              stsp8	[sp+0x1a], r1
<L33>:
 ed 80 20              ld8u	r4, [r0+0]
 f4 a4                 tst8	r4
 da 03 04              breq16	0x403 <L93>
<L34>:
 f0 2c 1b              stsp8	[sp+0x1b], r4
 f1 28                 mov	r6, r0
 f4 ae                 inc16	r6
 cc 5b                 cmpi.s8	r4, 0x5b
 d1 0f                 brne8	0xf <L35>
 46                    ld8u	r5, [r6]
 cd 5e                 cmpi.s8	r5, 0x5e
 f0 3e 2c              stsp16	[sp+0x2c], r6
 d1 1e                 brne8	0x1e <L36>
 c2 02                 ldi8	r6, 0x2
 ed a0 22              ld8u	r5, [r0+2]
 d4 19                 jmp8	0x19 <L37>
<L35>:
 f1 06                 mov	r0, r6
 a5                    xor	r5, r5
 f1 15                 mov	r2, r5
 f0 3a 2c              stsp16	[sp+0x2c], r2
 cc 5b                 cmpi.s8	r4, 0x5b
 d1 2e                 brne8	0x2e <L40>
 08                    mov	r6, r4
 ca a8                 addi.s8	r6, -0x58
 ce 10                 cmpi.s8	r6, 0x10
 dc a1 01              brult16	0x1a1 <L62>
 e0 72 01              jmp16	370 <L60>
<L36>:
 c2 01                 ldi8	r6, 0x1
<L37>:
 f2 06                 add	r0, r6
 cd 5d                 cmpi.s8	r5, 0x5d
 f8 02                 cset.eq	r2
 f2 10                 add	r2, r0
<L38>:
 ed a4 20              ld8u	r5, [r2+0]
 f4 a5                 tst8	r5
 da c0 03              breq16	0x3c0 <L93>
 cd 5d                 cmpi.s8	r5, 0x5d
 d0 04                 breq8	0x4 <L39>
 f4 aa                 inc16	r2
 d4 f0                 jmp8	-0x10 <L38>
<L39>:
 f1 02                 mov	r0, r2
 f4 a8                 inc16	r0
 cc 5b                 cmpi.s8	r4, 0x5b
 da 48 01              breq16	0x148 <L59>
<L40>:
 cc 63                 cmpi.s8	r4, 0x63
 da 43 01              breq16	0x143 <L59>
 cc 6e                 cmpi.s8	r4, 0x6e
 d1 1f                 brne8	0x1f <L41>
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 cc 2a                 cmpi.s8	r4, 0x2a
 da b5 01              breq16	0x1b5 <L66>
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 d6 fe                 adjsp	-0x2
 f0 14 28              leasp	r4, 0x28
 f4 40                 stsp16	[sp+0x0], r4
 f1 71                 zext8	r1
 f1 21                 mov	r4, r1
 e1 06 04              call16	__avm_scan_count
 d6 02                 adjsp	0x2
 e0 9e 01              jmp16	414 <L66>
<L41>:
 f0 1c 10              ldsp8u	r4, [sp+0x10]
 f4 a4                 tst8	r4
 d0 2b                 breq8	0x2b <L44>
 f4 38                 ldsp16	r4, [sp+0xe]
 cc ff                 cmpi.s8	r4, -0x1
 da 0f 01              breq16	0x10f <L58>
 d4 35                 jmp8	0x35 <L45>
<L42>:
 f0 01 02              ldi8	r1, 0x2
 f0 29 1a              stsp8	[sp+0x1a], r1
 ed 84 21              ld8u	r4, [r2+1]
 cc 68                 cmpi.s8	r4, 0x68
 d1 09                 brne8	0x9 <L43>
 f0 01 01              ldi8	r1, 0x1
 f0 0a 02              addi.s8	r2, 0x2
 e0 51 ff              jmp16	-175 <L31>
<L43>:
 f4 aa                 inc16	r2
 f1 02                 mov	r0, r2
 f4 a4                 tst8	r4
 db 55 ff              brne16	-0xab <L34>
 e0 55 03              jmp16	853 <L93>
<L44>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
 c1 01                 ldi8	r5, 0x1
 f0 2d 10              stsp8	[sp+0x10], r5
 f4 78                 stsp16	[sp+0xe], r4
 cc ff                 cmpi.s8	r4, -0x1
 da d8 00              breq16	0xd8 <L58>
<L45>:
 f1 74                 zext8	r4
 e1 ab 03              call16	isspace
 f6 2c                 tst16	r4
 da ce 00              breq16	0xce <L58>
 f0 1c 10              ldsp8u	r4, [sp+0x10]
 f4 a4                 tst8	r4
 d0 59                 breq8	0x59 <L51>
 f4 38                 ldsp16	r4, [sp+0xe]
 d4 5e                 jmp8	0x5e <L52>
<L46>:
 f2 39                 sub	r1, r1
 f1 02                 mov	r0, r2
 e0 1b ff              jmp16	-229 <L33>
<L47>:
 c2 1f                 ldi8	r6, 0x1f
 af                    xor	r7, r7
 f0 69 c8              cmp32	q3, q2
 d3 2e                 brslt8	0x2e <L50>
 c2 08                 ldi8	r6, 0x8
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 da 07 ff              breq16	-0xf9 <L32>
 c2 10                 ldi8	r6, 0x10
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 db 61 03              brne16	0x361 <L105>
 f0 34 11              ldsp16	r4, [sp+0x11]
 cc 66                 cmpi.s8	r4, 0x66
 f2 39                 sub	r1, r1
 c0 02                 ldi8	r4, 0x2
 fb 0c                 cmov.eq	r1, r4
 e0 f0 fe              jmp16	-272 <L32>
<L48>:
 f2 39                 sub	r1, r1
 f1 02                 mov	r0, r2
 e0 ec fe              jmp16	-276 <L33>
<L49>:
 f2 39                 sub	r1, r1
 f1 02                 mov	r0, r2
 e0 e5 fe              jmp16	-283 <L33>
<L50>:
 c2 20                 ldi8	r6, 0x20
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 da dc 02              breq16	0x2dc <L91>
 c2 40                 ldi8	r6, 0x40
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 db 37 03              brne16	0x337 <L106>
 f0 01 04              ldi8	r1, 0x4
 e0 ca fe              jmp16	-310 <L32>
<L51>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
 f4 78                 stsp16	[sp+0xe], r4
<L52>:
 a5                    xor	r5, r5
 f0 2d 10              stsp8	[sp+0x10], r5
 cc ff                 cmpi.s8	r4, -0x1
 d0 0d                 breq8	0xd <L53>
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f7 6e                 add32	q3, q2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
<L53>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
 f0 01 01              ldi8	r1, 0x1
 d4 07                 jmp8	0x7 <L55>
<L54>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
<L55>:
 f0 29 10              stsp8	[sp+0x10], r1
 f4 78                 stsp16	[sp+0xe], r4
 cc ff                 cmpi.s8	r4, -0x1
 d0 34                 breq8	0x34 <L58>
 f1 74                 zext8	r4
 e1 07 03              call16	isspace
 f6 2c                 tst16	r4
 d0 2b                 breq8	0x2b <L58>
 f0 1c 10              ldsp8u	r4, [sp+0x10]
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L56>
 f4 38                 ldsp16	r4, [sp+0xe]
 d4 09                 jmp8	0x9 <L57>
<L56>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
 f4 78                 stsp16	[sp+0xe], r4
<L57>:
 a5                    xor	r5, r5
 f0 2d 10              stsp8	[sp+0x10], r5
 cc ff                 cmpi.s8	r4, -0x1
 d0 cb                 breq8	-0x35 <L54>
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f7 6e                 add32	q3, q2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 d4 bc                 jmp8	-0x44 <L54>
<L58>:
 f0 1c 1b              ldsp8u	r4, [sp+0x1b]
<L59>:
 08                    mov	r6, r4
 ca a8                 addi.s8	r6, -0x58
 ce 10                 cmpi.s8	r6, 0x10
 d2 2c                 brult8	0x2c <L62>
<L60>:
 04                    mov	r5, r4
 c9 97                 addi.s8	r5, -0x69
 cd 10                 cmpi.s8	r5, 0x10
 d8 10                 bruge8	0x10 <L61>
 c2 01                 ldi8	r6, 0x1
 fa 09                 shl16v	r6, r5
 c7 c1 90              ldi16	r7, 0x90c1
 8e                    and	r7, r6
 f6 2f                 tst16	r7
 d1 2d                 brne8	0x2d <L63>
 cd 0a                 cmpi.s8	r5, 0xa
 d0 74                 breq8	0x74 <L68>
<L61>:
 c8 bf                 addi.s8	r4, -0x41
 cc 07                 cmpi.s8	r4, 0x7
 dd 93 02              bruge16	0x293 <L104>
 c1 01                 ldi8	r5, 0x1
 fa 04                 shl16v	r5, r4
 c0 71                 ldi8	r4, 0x71
 81                    and	r4, r5
 f4 a4                 tst8	r4
 da 83 02              breq16	0x283 <L103>
 d4 2a                 jmp8	0x2a <L64>
<L62>:
 c1 01                 ldi8	r5, 0x1
 fa 06                 shl16v	r5, r6
 c6 00 e2              ldi16	r6, 0xe200
 89                    and	r6, r5
 f6 2e                 tst16	r6
 d1 1e                 brne8	0x1e <L64>
 c6 01 14              ldi16	r6, 0x1401
 89                    and	r6, r5
 f6 2e                 tst16	r6
 d0 42                 breq8	0x42 <L67>
<L63>:
 f0 14 00              leasp	r4, 0x0
 f0 15 15              leasp	r5, 0x15
 f0 16 26              leasp	r6, 0x26
 e1 e7 02              call16	__avm_scan_integer
 f1 0c                 mov	r1, r4
 f0 0d 01              cmpi.s8	r1, 0x1
 db 0f 02              brne16	0x20f <L94>
 d4 14                 jmp8	0x14 <L65>
<L64>:
 f0 14 00              leasp	r4, 0x0
 f0 15 15              leasp	r5, 0x15
 f0 16 26              leasp	r6, 0x26
 e1 10 0a              call16	__avm_scan_float
 f1 0c                 mov	r1, r4
 f0 0d 01              cmpi.s8	r1, 0x1
 db f9 01              brne16	0x1f9 <L94>
<L65>:
 f0 1c 19              ldsp8u	r4, [sp+0x19]
 f4 a4                 tst8	r4
 d1 06                 brne8	0x6 <L66>
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 ac                 inc16	r4
 f4 70                 stsp16	[sp+0xc], r4
<L66>:
 ed 20 20              ld8u	r1, [r0+0]
 f4 a1                 tst8	r1
 db 79 fb              brne16	-0x487 <L3>
 e0 de 01              jmp16	478 <L93>
<L67>:
 c6 08 08              ldi16	r6, 0x808
 86                    and	r5, r6
 f6 2d                 tst16	r5
 da 75 ff              breq16	-0x8b <L60>
<L68>:
 f0 35 20              ldsp16	r5, [sp+0x20]
 cd 0a                 cmpi.s8	r5, 0xa
 d2 15                 brult8	0x15 <L69>
 cc 63                 cmpi.s8	r4, 0x63
 d1 11                 brne8	0x11 <L69>
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3d 24              stsp16	[sp+0x24], r5
 f0 3c 15              stsp16	[sp+0x15], r4
 f0 3d 17              stsp16	[sp+0x17], r5
 d4 0c                 jmp8	0xc <L70>
<L69>:
 f0 34 15              ldsp16	r4, [sp+0x15]
 f0 35 17              ldsp16	r5, [sp+0x17]
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3d 24              stsp16	[sp+0x24], r5
<L70>:
 f0 1c 19              ldsp8u	r4, [sp+0x19]
 f4 a4                 tst8	r4
 a0                    xor	r4, r4
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3c 1e              stsp16	[sp+0x1e], r4
 d1 1b                 brne8	0x1b <L71>
 f0 34 26              ldsp16	r4, [sp+0x26]
 04                    mov	r5, r4
 c9 02                 addi.s8	r5, 0x2
 f0 3d 26              stsp16	[sp+0x26], r5
 68                    ld16	r6, [r4]
 f0 1c 1a              ldsp8u	r4, [sp+0x1a]
 cc 03                 cmpi.s8	r4, 0x3
 a0                    xor	r4, r4
 04                    mov	r5, r4
 fb 2e                 cmov.eq	r5, r6
 f0 3d 1e              stsp16	[sp+0x1e], r5
 fb 34                 cmov.eq	r6, r4
 f0 3e 20              stsp16	[sp+0x20], r6
<L71>:
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 35 24              ldsp16	r5, [sp+0x24]
 f0 69 8c              cmp32	q2, q3
 da b5 01              breq16	0x1b5 <L100>
 c0 01                 ldi8	r4, 0x1
 f0 3c 28              stsp16	[sp+0x28], r4
 f2 4b                 sub	r3, r3
 f0 3b 11              stsp16	[sp+0x11], r3
 d4 21                 jmp8	0x21 <L73>
<L72>:
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 35 24              ldsp16	r5, [sp+0x24]
 f7 6b                 add32	q2, q3
 c2 01                 ldi8	r6, 0x1
 f0 3e 11              stsp16	[sp+0x11], r6
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3d 24              stsp16	[sp+0x24], r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 f0 39 1e              stsp16	[sp+0x1e], r1
 f0 3b 20              stsp16	[sp+0x20], r3
 da 22 01              breq16	0x122 <L88>
<L73>:
 f0 1c 10              ldsp8u	r4, [sp+0x10]
 f4 a4                 tst8	r4
 d0 05                 breq8	0x5 <L74>
 f0 31 0e              ldsp16	r1, [sp+0xe]
 d4 11                 jmp8	0x11 <L75>
<L74>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
 f1 0c                 mov	r1, r4
 c0 01                 ldi8	r4, 0x1
 f0 2c 10              stsp8	[sp+0x10], r4
 f0 39 0e              stsp16	[sp+0xe], r1
<L75>:
 f0 1c 1b              ldsp8u	r4, [sp+0x1b]
 f0 0d ff              cmpi.s8	r1, -0x1
 da db 00              breq16	0xdb <L86>
 cc 73                 cmpi.s8	r4, 0x73
 d1 0f                 brne8	0xf <L76>
 f1 21                 mov	r4, r1
 f1 74                 zext8	r4
 e1 86 01              call16	isspace
 f6 2c                 tst16	r4
 db df 00              brne16	0xdf <L87>
 f0 1c 1b              ldsp8u	r4, [sp+0x1b]
<L76>:
 cc 5b                 cmpi.s8	r4, 0x5b
 d1 6b                 brne8	0x6b <L81>
 f0 33 2c              ldsp16	r3, [sp+0x2c]
 ed 86 20              ld8u	r4, [r3+0]
 cc 5e                 cmpi.s8	r4, 0x5e
 f8 05                 cset.eq	r5
 f2 1d                 add	r3, r5
 f5 1a                 cmp	r3, r2
 d0 57                 breq8	0x57 <L80>
 f0 3d 2a              stsp16	[sp+0x2a], r5
 aa                    xor	r6, r6
 f1 2f                 mov	r7, r3
 d4 0e                 jmp8	0xe <L78>
<L77>:
 f5 0c                 cmp	r1, r4
 f8 04                 cset.eq	r4
 f1 1f                 mov	r3, r7
 c1 01                 ldi8	r5, 0x1
 84                    and	r5, r4
 99                    or	r6, r5
 f5 2e                 cmp	r7, r2
 d0 39                 breq8	0x39 <L79>
<L78>:
 f7 1c                 ld8u	r4, [r7+]
 f1 27                 mov	r5, r3
 c9 02                 addi.s8	r5, 0x2
 f5 26                 cmp	r5, r2
 d8 e8                 bruge8	-0x18 <L77>
 f0 3b 11              stsp16	[sp+0x11], r3
 f1 1a                 mov	r3, r2
 f1 11                 mov	r2, r1
 f5 3d                 ld8u	r1, [r7]
 f0 0d 2d              cmpi.s8	r1, 0x2d
 f1 0a                 mov	r1, r2
 f1 13                 mov	r2, r3
 f0 33 11              ldsp16	r3, [sp+0x11]
 d1 d3                 brne8	-0x2d <L77>
 45                    ld8u	r5, [r5]
 34                    cmp	r5, r4
 d2 cf                 brult8	-0x31 <L77>
 f5 25                 cmp	r5, r1
 f8 2d                 cset.sge	r5
 f5 0c                 cmp	r1, r4
 f8 2c                 cset.sge	r4
 81                    and	r4, r5
 f0 0b 03              addi.s8	r3, 0x3
 f1 2f                 mov	r7, r3
 c1 01                 ldi8	r5, 0x1
 84                    and	r5, r4
 99                    or	r6, r5
 f5 2e                 cmp	r7, r2
 d1 c7                 brne8	-0x39 <L78>
<L79>:
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 38                    cmp	r6, r4
 d0 73                 breq8	0x73 <L87>
 d4 04                 jmp8	0x4 <L81>
<L80>:
 cc 5e                 cmpi.s8	r4, 0x5e
 d1 6d                 brne8	0x6d <L87>
<L81>:
 f0 1c 10              ldsp8u	r4, [sp+0x10]
 f4 a4                 tst8	r4
 d0 04                 breq8	0x4 <L82>
 f4 38                 ldsp16	r4, [sp+0xe]
 d4 09                 jmp8	0x9 <L83>
<L82>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 53                 ldsp8u	r7, [sp+0x4]
 eb                    callp	q3
 f4 78                 stsp16	[sp+0xe], r4
<L83>:
 f0 39 11              stsp16	[sp+0x11], r1
 a5                    xor	r5, r5
 f0 3d 28              stsp16	[sp+0x28], r5
 f0 2d 10              stsp8	[sp+0x10], r5
 cc ff                 cmpi.s8	r4, -0x1
 d0 0d                 breq8	0xd <L84>
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f7 6e                 add32	q3, q2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
<L84>:
 f0 34 20              ldsp16	r4, [sp+0x20]
 f6 2c                 tst16	r4
 f2 4b                 sub	r3, r3
 d0 07                 breq8	0x7 <L85>
 f0 35 11              ldsp16	r5, [sp+0x11]
 f6 05                 st8	[r4+], r5
 f1 1c                 mov	r3, r4
<L85>:
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f6 2c                 tst16	r4
 f2 39                 sub	r1, r1
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 da e8 fe              breq16	-0x118 <L72>
 f0 35 11              ldsp16	r5, [sp+0x11]
 f6 05                 st8	[r4+], r5
 f1 0c                 mov	r1, r4
 e0 de fe              jmp16	-290 <L72>
<L86>:
 cc 63                 cmpi.s8	r4, 0x63
 f8 0c                 cset.ne	r4
 f0 35 11              ldsp16	r5, [sp+0x11]
 84                    and	r5, r4
 f4 a5                 tst8	r5
 f0 33 20              ldsp16	r3, [sp+0x20]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 d0 79                 breq8	0x79 <L101>
 d4 15                 jmp8	0x15 <L89>
<L87>:
 f0 34 28              ldsp16	r4, [sp+0x28]
 f4 a4                 tst8	r4
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 f0 33 20              ldsp16	r3, [sp+0x20]
 d1 70                 brne8	0x70 <L102>
<L88>:
 f0 1e 1b              ldsp8u	r6, [sp+0x1b]
 ce 63                 cmpi.s8	r6, 0x63
 da 29 fe              breq16	-0x1d7 <L65>
<L89>:
 f6 2b                 tst16	r3
 d0 04                 breq8	0x4 <L90>
 aa                    xor	r6, r6
 ee c6 20              st8	[r3+0], r6
<L90>:
 f6 29                 tst16	r1
 da 1c fe              breq16	-0x1e4 <L65>
 a0                    xor	r4, r4
 ee 82 20              st8	[r1+0], r4
 e0 15 fe              jmp16	-491 <L65>
<L91>:
 f0 01 03              ldi8	r1, 0x3
 e0 f7 fb              jmp16	-1033 <L32>
<L92>:
 f0 01 01              ldi8	r1, 0x1
 d4 03                 jmp8	0x3 <L94>
<L93>:
 f0 01 01              ldi8	r1, 0x1
<L94>:
 f0 1c 10              ldsp8u	r4, [sp+0x10]
 f4 a4                 tst8	r4
 d0 0d                 breq8	0xd <L96>
<L95>:
 f4 39                 ldsp16	r5, [sp+0xe]
 cd ff                 cmpi.s8	r5, -0x1
 d0 07                 breq8	0x7 <L96>
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 16                 ldsp16	r6, [sp+0x5]
 f3 5f                 ldsp8u	r7, [sp+0x7]
 eb                    callp	q3
<L96>:
 f4 31                 ldsp16	r5, [sp+0xc]
 c4 ff ff              ldi16	r4, 0xffff
 f6 2d                 tst16	r5
 fb 65                 cmov.ne	r4, r5
 f0 0d ff              cmpi.s8	r1, -0x1
 fb 65                 cmov.ne	r4, r5
 d6 2e                 adjsp	0x2e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L97>:
 cc ff                 cmpi.s8	r4, -0x1
 f2 39                 sub	r1, r1
 c4 ff ff              ldi16	r4, 0xffff
 fb 0c                 cmov.eq	r1, r4
 d4 d3                 jmp8	-0x2d <L95>
<L98>:
 f2 39                 sub	r1, r1
 d4 c8                 jmp8	-0x38 <L94>
<L99>:
 f2 39                 sub	r1, r1
 d4 c4                 jmp8	-0x3c <L94>
<L100>:
 f2 39                 sub	r1, r1
 d4 c0                 jmp8	-0x40 <L94>
<L101>:
 f0 05 ff ff           ldi16	r1, 0xffff
 d4 ba                 jmp8	-0x46 <L94>
<L102>:
 f2 39                 sub	r1, r1
 d4 b6                 jmp8	-0x4a <L94>
<L103>:
 f2 39                 sub	r1, r1
 d4 b2                 jmp8	-0x4e <L94>
<L104>:
 f2 39                 sub	r1, r1
 d4 ae                 jmp8	-0x52 <L94>
<L105>:
 f2 39                 sub	r1, r1
 d4 aa                 jmp8	-0x56 <L94>
<L106>:
 f2 39                 sub	r1, r1
 d4 a6                 jmp8	-0x5a <L94>

<isalnum>:
 c1 20                 ldi8	r5, 0x20
 94                    or	r5, r4
 c9 9f                 addi.s8	r5, -0x61
 cd 1a                 cmpi.s8	r5, 0x1a
 f8 15                 cset.ult	r5
 c8 d0                 addi.s8	r4, -0x30
 cc 0a                 cmpi.s8	r4, 0xa
 f8 14                 cset.ult	r4
 91                    or	r4, r5
 ef                    ret

<isspace>:
 cc 20                 cmpi.s8	r4, 0x20
 f8 05                 cset.eq	r5
 c8 f7                 addi.s8	r4, -0x9
 cc 05                 cmpi.s8	r4, 0x5
 f8 14                 cset.ult	r4
 91                    or	r4, r5
 ef                    ret

<__avm_scan_count>:
 b0                    push16	r0
 f4 15                 ldsp16	r5, [sp+0x5]
 cc 04                 cmpi.s8	r4, 0x4
 d9 18                 brsge8	0x18 <L0>
 cc 01                 cmpi.s8	r4, 0x1
 d0 41                 breq8	0x41 <L4>
 cc 02                 cmpi.s8	r4, 0x2
 d0 1a                 breq8	0x1a <L1>
 cc 03                 cmpi.s8	r4, 0x3
 d1 16                 brne8	0x16 <L1>
 f5 44                 ld16	r0, [r5]
 f1 20                 mov	r4, r0
 c8 02                 addi.s8	r4, 0x2
 74                    st16	[r5], r4
 ed 90 20              ld16	r4, [r0+0]
 d4 28                 jmp8	0x28 <L3>
<L0>:
 cc 04                 cmpi.s8	r4, 0x4
 d0 13                 breq8	0x13 <L2>
 cc 05                 cmpi.s8	r4, 0x5
 d0 0f                 breq8	0xf <L2>
 cc 07                 cmpi.s8	r4, 0x7
<L1>:
 f5 44                 ld16	r0, [r5]
 f1 20                 mov	r4, r0
 c8 02                 addi.s8	r4, 0x2
 74                    st16	[r5], r4
 ed 90 20              ld16	r4, [r0+0]
 72                    st16	[r4], r6
 b8                    pop16	r0
 ef                    ret
<L2>:
 f5 44                 ld16	r0, [r5]
 f1 20                 mov	r4, r0
 c8 02                 addi.s8	r4, 0x2
 74                    st16	[r5], r4
 ed 90 20              ld16	r4, [r0+0]
 f0 6b c8              st32	[r4], q3
 c8 04                 addi.s8	r4, 0x4
 aa                    xor	r6, r6
 af                    xor	r7, r7
<L3>:
 f0 6b c8              st32	[r4], q3
 b8                    pop16	r0
 ef                    ret
<L4>:
 f5 44                 ld16	r0, [r5]
 f1 20                 mov	r4, r0
 c8 02                 addi.s8	r4, 0x2
 74                    st16	[r5], r4
 ed 90 20              ld16	r4, [r0+0]
 52                    st8	[r4], r6
 b8                    pop16	r0
 ef                    ret

<__avm_scan_integer>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 cc                 adjsp	-0x34
 f1 06                 mov	r0, r6
 f1 0d                 mov	r1, r5
 f0 6a c2              ld32	q3, [r1]
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 3c 28              stsp16	[sp+0x28], r4
 e1 ee f7              call16	__avm_scan_peek
 f4 40                 stsp16	[sp+0x0], r4
 ed a2 26              ld8u	r5, [r1+6]
 cd 69                 cmpi.s8	r5, 0x69
 f8 03                 cset.eq	r3
 cd 64                 cmpi.s8	r5, 0x64
 f8 02                 cset.eq	r2
 a0                    xor	r4, r4
 f0 3c 24              stsp16	[sp+0x24], r4
 cd 6f                 cmpi.s8	r5, 0x6f
 d9 18                 brsge8	0x18 <L0>
 cd 58                 cmpi.s8	r5, 0x58
 d0 20                 breq8	0x20 <L1>
 cd 62                 cmpi.s8	r5, 0x62
 da c0 00              breq16	0xc0 <L10>
 cd 69                 cmpi.s8	r5, 0x69
 d1 21                 brne8	0x21 <L3>
 f0 3c 12              stsp16	[sp+0x12], r4
 c2 08                 ldi8	r6, 0x8
 c3 01                 ldi8	r7, 0x1
 f4 53                 stsp16	[sp+0x4], r7
 d4 1e                 jmp8	0x1e <L6>
<L0>:
 cd 6f                 cmpi.s8	r5, 0x6f
 d0 0d                 breq8	0xd <L2>
 cd 70                 cmpi.s8	r5, 0x70
 d0 04                 breq8	0x4 <L1>
 cd 78                 cmpi.s8	r5, 0x78
 d1 0a                 brne8	0xa <L3>
<L1>:
 c2 10                 ldi8	r6, 0x10
 af                    xor	r7, r7
 d4 08                 jmp8	0x8 <L4>
<L2>:
 c2 08                 ldi8	r6, 0x8
 af                    xor	r7, r7
 d4 03                 jmp8	0x3 <L4>
<L3>:
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
<L4>:
 f4 53                 stsp16	[sp+0x4], r7
<L5>:
 f0 3e 12              stsp16	[sp+0x12], r6
<L6>:
 f4 00                 ldsp16	r4, [sp+0x0]
 cc ff                 cmpi.s8	r4, -0x1
 da bc 05              breq16	0x5bc <L51>
 f4 63                 stsp16	[sp+0x8], r7
 f0 3e 20              stsp16	[sp+0x20], r6
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 2d                 cmpi.s8	r4, 0x2d
 f0 3d 2a              stsp16	[sp+0x2a], r5
 d0 06                 breq8	0x6 <L7>
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 2b                 cmpi.s8	r4, 0x2b
 d1 1f                 brne8	0x1f <L8>
<L7>:
 f0 34 28              ldsp16	r4, [sp+0x28]
 e1 a4 f7              call16	__avm_scan_take
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f7 6e                 add32	q3, q2
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 2d                 cmpi.s8	r4, 0x2d
 f8 04                 cset.eq	r4
 f0 3c 24              stsp16	[sp+0x24], r4
<L8>:
 f9 4d                 or	r2, r3
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 39 30              stsp16	[sp+0x30], r1
 ed c2 25              ld8u	r6, [r1+5]
 ce 04                 cmpi.s8	r6, 0x4
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 38 32              stsp16	[sp+0x32], r0
 d9 20                 brsge8	0x20 <L9>
 ce 01                 cmpi.s8	r6, 0x1
 d0 4a                 breq8	0x4a <L11>
 ce 02                 cmpi.s8	r6, 0x2
 d0 58                 breq8	0x58 <L12>
 ce 03                 cmpi.s8	r6, 0x3
 d1 66                 brne8	0x66 <L13>
 c2 01                 ldi8	r6, 0x1
 f4 01                 ldsp16	r5, [sp+0x0]
 89                    and	r6, r5
 c7 ff 7f              ldi16	r7, 0x7fff
 f4 a6                 tst8	r6
 c4 ff ff              ldi16	r4, 0xffff
 08                    mov	r6, r4
 fb 77                 cmov.ne	r6, r7
 0e                    mov	r7, r6
 08                    mov	r6, r4
 d4 63                 jmp8	0x63 <L14>
<L9>:
 ca fc                 addi.s8	r6, -0x4
 ce 02                 cmpi.s8	r6, 0x2
 d8 4c                 bruge8	0x4c <L13>
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 c0 01                 ldi8	r4, 0x1
 f4 01                 ldsp16	r5, [sp+0x0]
 81                    and	r4, r5
 f0 05 ff 7f           ldi16	r1, 0x7fff
 f4 a4                 tst8	r4
 f0 04 ff ff           ldi16	r0, 0xffff
 f1 20                 mov	r4, r0
 fb 61                 cmov.ne	r4, r1
 f1 0c                 mov	r1, r4
 d4 42                 jmp8	0x42 <L15>
<L10>:
 c2 02                 ldi8	r6, 0x2
 c0 01                 ldi8	r4, 0x1
 f4 50                 stsp16	[sp+0x4], r4
 a0                    xor	r4, r4
 0c                    mov	r7, r4
 e0 5f ff              jmp16	-161 <L5>
<L11>:
 c2 01                 ldi8	r6, 0x1
 f4 01                 ldsp16	r5, [sp+0x0]
 89                    and	r6, r5
 c3 ff                 ldi8	r7, 0xff
 f0 00 7f              ldi8	r0, 0x7f
 f4 a6                 tst8	r6
 fb 78                 cmov.ne	r7, r0
 0b                    mov	r6, r7
 af                    xor	r7, r7
 d4 23                 jmp8	0x23 <L14>
<L12>:
 c2 01                 ldi8	r6, 0x1
 f4 01                 ldsp16	r5, [sp+0x0]
 89                    and	r6, r5
 c7 ff 7f              ldi16	r7, 0x7fff
 f4 a6                 tst8	r6
 c6 ff ff              ldi16	r6, 0xffff
 fb 77                 cmov.ne	r6, r7
 af                    xor	r7, r7
 d4 11                 jmp8	0x11 <L14>
<L13>:
 c0 01                 ldi8	r4, 0x1
 f4 01                 ldsp16	r5, [sp+0x0]
 81                    and	r4, r5
 c6 ff 7f              ldi16	r6, 0x7fff
 f4 a4                 tst8	r4
 c4 ff ff              ldi16	r4, 0xffff
 fb 66                 cmov.ne	r4, r6
 08                    mov	r6, r4
 af                    xor	r7, r7
<L14>:
 f2 61                 mov32	q0, q1
<L15>:
 f0 34 24              ldsp16	r4, [sp+0x24]
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 81                    and	r4, r5
 a5                    xor	r5, r5
 f7 6b                 add32	q2, q3
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 69 8c              cmp32	q2, q3
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 69 84              cmp32	q2, q1
 d0 68                 breq8	0x68 <L17>
 f0 34 28              ldsp16	r4, [sp+0x28]
 e1 a0 f6              call16	__avm_scan_peek
 cc 30                 cmpi.s8	r4, 0x30
 d1 5e                 brne8	0x5e <L17>
 f0 33 28              ldsp16	r3, [sp+0x28]
 f1 23                 mov	r4, r3
 e1 b6 f6              call16	__avm_scan_take
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f7 62                 add32	q0, q2
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 f8 0c                 cset.ne	r4
 f4 11                 ldsp16	r5, [sp+0x4]
 84                    and	r5, r4
 cd 01                 cmpi.s8	r5, 0x1
 f0 32 30              ldsp16	r2, [sp+0x30]
 db f7 00              brne16	0xf7 <L23>
 f1 23                 mov	r4, r3
 e1 6f f6              call16	__avm_scan_peek
 cc 62                 cmpi.s8	r4, 0x62
 d0 0a                 breq8	0xa <L16>
 f1 23                 mov	r4, r3
 e1 66 f6              call16	__avm_scan_peek
 cc 42                 cmpi.s8	r4, 0x42
 db 03 05              brne16	0x503 <L56>
<L16>:
 f1 23                 mov	r4, r3
 e1 7e f6              call16	__avm_scan_take
 c4 fe ff              ldi16	r4, 0xfffe
 c5 ff ff              ldi16	r5, 0xffff
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f7 6e                 add32	q3, q2
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 c2 01                 ldi8	r6, 0x1
 c0 02                 ldi8	r4, 0x2
 f2 42                 sub	r2, r2
 f1 0b                 mov	r1, r3
 f1 1c                 mov	r3, r4
 02                    mov	r4, r6
 e0 01 01              jmp16	257 <L30>
<L17>:
 a0                    xor	r4, r4
 f4 50                 stsp16	[sp+0x4], r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 a4                 tst8	r4
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 32 30              ldsp16	r2, [sp+0x30]
 f0 33 12              ldsp16	r3, [sp+0x12]
 d1 19                 brne8	0x19 <L20>
<L18>:
 f0 0f 08              cmpi.s8	r3, 0x8
 da d3 00              breq16	0xd3 <L26>
<L19>:
 f0 0f 10              cmpi.s8	r3, 0x10
 f0 31 28              ldsp16	r1, [sp+0x28]
 da c6 00              breq16	0xc6 <L25>
 f0 0f 0a              cmpi.s8	r3, 0xa
 db d0 00              brne16	0xd0 <L27>
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
<L20>:
 ed 84 25              ld8u	r4, [r2+5]
 cc 04                 cmpi.s8	r4, 0x4
 d9 3c                 brsge8	0x3c <L21>
 cc 01                 cmpi.s8	r4, 0x1
 f0 31 28              ldsp16	r1, [sp+0x28]
 f0 30 00              ldsp16	r0, [sp+0x0]
 da 37 01              breq16	0x137 <L31>
 cc 02                 cmpi.s8	r4, 0x2
 d0 72                 breq8	0x72 <L22>
 cc 03                 cmpi.s8	r4, 0x3
 d1 6e                 brne8	0x6e <L22>
 c0 01                 ldi8	r4, 0x1
 f9 80                 and	r4, r0
 f0 06 99 99           ldi16	r2, 0x9999
 f0 07 99 19           ldi16	r3, 0x1999
 c6 cc cc              ldi16	r6, 0xcccc
 c7 cc 0c              ldi16	r7, 0xccc
 f4 a4                 tst8	r4
 fb 56                 cmov.ne	r2, r6
 fb 5f                 cmov.ne	r3, r7
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 3b 1e              stsp16	[sp+0x1e], r3
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 3d 2e              stsp16	[sp+0x2e], r5
 e0 22 01              jmp16	290 <L33>
<L21>:
 c8 fc                 addi.s8	r4, -0x4
 cc 02                 cmpi.s8	r4, 0x2
 f0 31 28              ldsp16	r1, [sp+0x28]
 f0 30 00              ldsp16	r0, [sp+0x0]
 d8 39                 bruge8	0x39 <L22>
 c0 01                 ldi8	r4, 0x1
 f9 80                 and	r4, r0
 f0 06 99 99           ldi16	r2, 0x9999
 f0 07 99 19           ldi16	r3, 0x1999
 c6 cc cc              ldi16	r6, 0xcccc
 c7 cc 0c              ldi16	r7, 0xccc
 f4 a4                 tst8	r4
 fb 56                 cmov.ne	r2, r6
 fb 5f                 cmov.ne	r3, r7
 f0 3a 2c              stsp16	[sp+0x2c], r2
 f0 3b 2e              stsp16	[sp+0x2e], r3
 f0 06 99 99           ldi16	r2, 0x9999
 f0 07 99 99           ldi16	r3, 0x9999
 c4 cc cc              ldi16	r4, 0xcccc
 c5 cc cc              ldi16	r5, 0xcccc
 fb 54                 cmov.ne	r2, r4
 fb 5d                 cmov.ne	r3, r5
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 3b 1e              stsp16	[sp+0x1e], r3
 e0 dd 00              jmp16	221 <L33>
<L22>:
 c0 01                 ldi8	r4, 0x1
 f9 80                 and	r4, r0
 c5 99 19              ldi16	r5, 0x1999
 c6 cc 0c              ldi16	r6, 0xccc
 e0 bc 00              jmp16	188 <L32>
<L23>:
 c1 01                 ldi8	r5, 0x1
 f4 51                 stsp16	[sp+0x4], r5
 81                    and	r4, r5
 f4 a4                 tst8	r4
 f0 33 20              ldsp16	r3, [sp+0x20]
 da 45 ff              breq16	-0xbb <L18>
<L24>:
 f0 0f 10              cmpi.s8	r3, 0x10
 da 19 04              breq16	0x419 <L57>
 f0 0f 08              cmpi.s8	r3, 0x8
 da 13 04              breq16	0x413 <L57>
 c0 01                 ldi8	r4, 0x1
 f4 50                 stsp16	[sp+0x4], r4
 f2 6a                 mov32	q3, q0
 f0 0f 08              cmpi.s8	r3, 0x8
 db 33 ff              brne16	-0xcd <L19>
 d4 04                 jmp8	0x4 <L26>
<L25>:
 c0 04                 ldi8	r4, 0x4
 d4 0e                 jmp8	0xe <L28>
<L26>:
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f0 31 28              ldsp16	r1, [sp+0x28]
 d4 06                 jmp8	0x6 <L29>
<L27>:
 c0 01                 ldi8	r4, 0x1
<L28>:
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
<L29>:
 f0 32 04              ldsp16	r2, [sp+0x4]
<L30>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 00 0f              ldi8	r0, 0xf
 08                    mov	r6, r4
 f9 c2                 xor	r6, r0
 f0 35 16              ldsp16	r5, [sp+0x16]
 01                    mov	r4, r5
 10                    add	r4, r4
 fa 02                 shl16v	r4, r6
 f4 60                 stsp16	[sp+0x8], r4
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 01                    mov	r4, r5
 10                    add	r4, r4
 fa 02                 shl16v	r4, r6
 f0 36 18              ldsp16	r6, [sp+0x18]
 06                    mov	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 fa 16                 lsr16v	r5, r6
 94                    or	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 f0 34 14              ldsp16	r4, [sp+0x14]
 fa 12                 lsr16v	r4, r6
 f4 21                 ldsp16	r5, [sp+0x8]
 91                    or	r4, r5
 f4 60                 stsp16	[sp+0x8], r4
 c4 ff ff              ldi16	r4, 0xffff
 a8                    xor	r6, r4
 f9 c0                 and	r6, r0
 f0 34 18              ldsp16	r4, [sp+0x18]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f7 6a                 add32	q2, q2
 fa 02                 shl16v	r4, r6
 f0 37 16              ldsp16	r7, [sp+0x16]
 07                    mov	r5, r7
 f4 02                 ldsp16	r6, [sp+0x0]
 fa 16                 lsr16v	r5, r6
 94                    or	r5, r4
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 03                    mov	r4, r7
 f4 02                 ldsp16	r6, [sp+0x0]
 fa 12                 lsr16v	r4, r6
 f4 22                 ldsp16	r6, [sp+0x8]
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3d 1e              stsp16	[sp+0x1e], r5
 f4 11                 ldsp16	r5, [sp+0x4]
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 3d 2e              stsp16	[sp+0x2e], r5
 f1 23                 mov	r4, r3
 f4 b4                 dec16	r4
 f0 36 14              ldsp16	r6, [sp+0x14]
 82                    and	r4, r6
 f0 3c 22              stsp16	[sp+0x22], r4
 a0                    xor	r4, r4
 f0 3c 26              stsp16	[sp+0x26], r4
 d4 37                 jmp8	0x37 <L34>
<L31>:
 c0 01                 ldi8	r4, 0x1
 f9 80                 and	r4, r0
 c1 19                 ldi8	r5, 0x19
 c2 0c                 ldi8	r6, 0xc
<L32>:
 f4 a4                 tst8	r4
 fb 6e                 cmov.ne	r5, r6
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 3e 2c              stsp16	[sp+0x2c], r6
 f0 3f 2e              stsp16	[sp+0x2e], r7
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
<L33>:
 c0 01                 ldi8	r4, 0x1
 f0 3c 26              stsp16	[sp+0x26], r4
 f9 10                 and	r0, r4
 f0 34 24              ldsp16	r4, [sp+0x24]
 c8 07                 addi.s8	r4, 0x7
 c1 05                 ldi8	r5, 0x5
 f4 a0                 tst8	r0
 fb 6c                 cmov.ne	r5, r4
 f0 3d 22              stsp16	[sp+0x22], r5
 f0 03 0a              ldi8	r3, 0xa
 f0 32 04              ldsp16	r2, [sp+0x4]
<L34>:
 f4 a2                 tst8	r2
 f8 00                 cset.eq	r0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 69 8c              cmp32	q2, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 da 27 02              breq16	0x227 <L47>
 f0 3b 12              stsp16	[sp+0x12], r3
 aa                    xor	r6, r6
 f0 3e 10              stsp16	[sp+0x10], r6
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 d4 26                 jmp8	0x26 <L38>
<L35>:
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f2 67                 mov32	q1, q3
 f0 38 10              stsp16	[sp+0x10], r0
<L36>:
 f0 31 28              ldsp16	r1, [sp+0x28]
<L37>:
 f2 30                 sub	r0, r0
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 69 c8              cmp32	q3, q2
 da 00 02              breq16	0x200 <L48>
<L38>:
 f1 21                 mov	r4, r1
 e1 44 f4              call16	__avm_scan_peek
 f1 14                 mov	r2, r4
 f0 0a d0              addi.s8	r2, -0x30
 f0 0e 0a              cmpi.s8	r2, 0xa
 d2 10                 brult8	0x10 <L39>
 c1 20                 ldi8	r5, 0x20
 91                    or	r4, r5
 04                    mov	r5, r4
 c9 9f                 addi.s8	r5, -0x61
 c8 a9                 addi.s8	r4, -0x57
 cd 06                 cmpi.s8	r5, 0x6
 f0 06 ff ff           ldi16	r2, 0xffff
 fc 14                 cmov.ult	r2, r4
<L39>:
 f6 2a                 tst16	r2
 f0 34 12              ldsp16	r4, [sp+0x12]
 de 08 02              brslt16	0x208 <L49>
 f5 14                 cmp	r2, r4
 df 03 02              brsge16	0x203 <L49>
 f0 3a 20              stsp16	[sp+0x20], r2
 f1 21                 mov	r4, r1
 e1 37 f4              call16	__avm_scan_take
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 8c              cmp32	q2, q3
 f8 16                 cset.ult	r6
 f0 32 2c              ldsp16	r2, [sp+0x2c]
 f0 33 2e              ldsp16	r3, [sp+0x2e]
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 69 48              cmp32	q1, q2
 f8 17                 cset.ult	r7
 f0 69 84              cmp32	q2, q1
 fb 3e                 cmov.eq	r7, r6
 f4 53                 stsp16	[sp+0x4], r7
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f7 63                 add32	q0, q3
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 f0 00 01              ldi8	r0, 0x1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 a6                 tst8	r6
 db 63 ff              brne16	-0x9d <L35>
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f9 8a                 xor	r4, r2
 f9 ae                 xor	r5, r3
 92                    or	r4, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 f8 0d                 cset.ne	r5
 f0 36 22              ldsp16	r6, [sp+0x22]
 f0 34 20              ldsp16	r4, [sp+0x20]
 38                    cmp	r6, r4
 f8 1e                 cset.uge	r6
 f0 34 10              ldsp16	r4, [sp+0x10]
 f6 2c                 tst16	r4
 d1 76                 brne8	0x76 <L41>
 96                    or	r5, r6
 c2 01                 ldi8	r6, 0x1
 89                    and	r6, r5
 f4 a6                 tst8	r6
 c0 01                 ldi8	r4, 0x1
 d0 58                 breq8	0x58 <L40>
 f0 34 26              ldsp16	r4, [sp+0x26]
 f4 a4                 tst8	r4
 d0 7f                 breq8	0x7f <L43>
 f0 02 0a              ldi8	r2, 0xa
 f2 4b                 sub	r3, r3
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 6b                 mov32	q3, q1
 e1 86 18              call16	__avm_mulsi3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 09                 ldsp16	r5, [sp+0x2]
 09                    mov	r6, r5
 0e                    mov	r7, r6
 fa ad                 lsr16i	r7, 0xd
 03                    mov	r4, r7
 a5                    xor	r5, r5
 0e                    mov	r7, r6
 fa af                 lsr16i	r7, 0xf
 f1 07                 mov	r0, r7
 f2 39                 sub	r1, r1
 f7 62                 add32	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f7 62                 add32	q0, q2
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 0c                    mov	r7, r4
 fa ad                 lsr16i	r7, 0xd
 9e                    or	r7, r6
 08                    mov	r6, r4
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f2 6b                 mov32	q3, q1
 e1 53 18              call16	__avm_mulsi3
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 69 8c              cmp32	q2, q3
 f8 16                 cset.ult	r6
 f1 16                 mov	r2, r6
 f7 64                 add32	q1, q0
 e0 c4 00              jmp16	196 <L46>
<L40>:
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f2 67                 mov32	q1, q3
 d4 14                 jmp8	0x14 <L42>
<L41>:
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 37 16              ldsp16	r7, [sp+0x16]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f2 67                 mov32	q1, q3
 c0 01                 ldi8	r4, 0x1
<L42>:
 f0 3c 10              stsp16	[sp+0x10], r4
 e0 bd fe              jmp16	-323 <L36>
<L43>:
 f0 34 12              ldsp16	r4, [sp+0x12]
 cc 10                 cmpi.s8	r4, 0x10
 d0 46                 breq8	0x46 <L44>
 cc 08                 cmpi.s8	r4, 0x8
 f4 09                 ldsp16	r5, [sp+0x2]
 01                    mov	r4, r5
 d1 75                 brne8	0x75 <L45>
 f4 50                 stsp16	[sp+0x4], r4
 04                    mov	r5, r4
 fa 8d                 lsr16i	r5, 0xd
 f0 3d 10              stsp16	[sp+0x10], r5
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 06                    mov	r5, r6
 15                    add	r5, r5
 15                    add	r5, r5
 15                    add	r5, r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 94                    or	r5, r4
 f0 3d 10              stsp16	[sp+0x10], r5
 06                    mov	r5, r6
 fa 8d                 lsr16i	r5, 0xd
 f1 07                 mov	r0, r7
 f4 80                 lsl16.1	r0
 f4 80                 lsl16.1	r0
 f4 80                 lsl16.1	r0
 f9 15                 or	r0, r5
 f0 35 10              ldsp16	r5, [sp+0x10]
 f1 15                 mov	r2, r5
 f1 18                 mov	r3, r0
 f4 10                 ldsp16	r4, [sp+0x4]
 10                    add	r4, r4
 10                    add	r4, r4
 10                    add	r4, r4
 f4 50                 stsp16	[sp+0x4], r4
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 fa ad                 lsr16i	r7, 0xd
 9c                    or	r7, r4
 1a                    add	r6, r6
 1a                    add	r6, r6
 1a                    add	r6, r6
 02                    mov	r4, r6
 07                    mov	r5, r7
 d4 49                 jmp8	0x49 <L46>
<L44>:
 f4 09                 ldsp16	r5, [sp+0x2]
 af                    xor	r7, r7
 f4 51                 stsp16	[sp+0x4], r5
 f4 5b                 stsp16	[sp+0x6], r7
 fa 8c                 lsr16i	r5, 0xc
 f0 3d 10              stsp16	[sp+0x10], r5
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 06                    mov	r5, r6
 fa 44                 lsl16i	r5, 0x4
 f0 34 10              ldsp16	r4, [sp+0x10]
 94                    or	r5, r4
 f0 3d 10              stsp16	[sp+0x10], r5
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 0b                    mov	r6, r7
 fa 54                 lsl16i	r6, 0x4
 99                    or	r6, r5
 f0 35 10              ldsp16	r5, [sp+0x10]
 f1 15                 mov	r2, r5
 f1 1e                 mov	r3, r6
 f4 12                 ldsp16	r6, [sp+0x4]
 fa 54                 lsl16i	r6, 0x4
 f4 00                 ldsp16	r4, [sp+0x0]
 04                    mov	r5, r4
 fa 8c                 lsr16i	r5, 0xc
 96                    or	r5, r6
 fa 34                 lsl16i	r4, 0x4
 d4 13                 jmp8	0x13 <L46>
<L45>:
 fa 7f                 lsr16i	r4, 0xf
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f7 6f                 add32	q3, q3
 92                    or	r4, r6
 f1 14                 mov	r2, r4
 f1 1f                 mov	r3, r7
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 6a                 add32	q2, q2
<L46>:
 f0 31 28              ldsp16	r1, [sp+0x28]
 f0 36 20              ldsp16	r6, [sp+0x20]
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f0 69 c8              cmp32	q3, q2
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 a0                    xor	r4, r4
 f0 3c 10              stsp16	[sp+0x10], r4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 20                 ldsp16	r4, [sp+0x8]
 f2 66                 mov32	q1, q2
 e0 02 fe              jmp16	-510 <L37>
<L47>:
 f1 22                 mov	r4, r2
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f4 a4                 tst8	r4
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 d0 66                 breq8	0x66 <L50>
<L48>:
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 f0 34 30              ldsp16	r4, [sp+0x30]
 ed a8 24              ld8u	r5, [r4+4]
 f4 a5                 tst8	r5
 d1 5b                 brne8	0x5b <L51>
 ed a8 26              ld8u	r5, [r4+6]
 cd 70                 cmpi.s8	r5, 0x70
 d1 5d                 brne8	0x5d <L52>
 f0 34 32              ldsp16	r4, [sp+0x32]
 64                    ld16	r5, [r4]
 09                    mov	r6, r5
 ca 02                 addi.s8	r6, 0x2
 72                    st16	[r4], r6
 aa                    xor	r6, r6
 f0 30 04              ldsp16	r0, [sp+0x4]
 f2 58                 sub	r6, r0
 f0 34 24              ldsp16	r4, [sp+0x24]
 f6 2c                 tst16	r4
 fb 46                 cmov.ne	r0, r6
 65                    ld16	r5, [r5]
 f5 54                 st16	[r5], r0
 d4 3a                 jmp8	0x3a <L51>
<L49>:
 f0 34 10              ldsp16	r4, [sp+0x10]
 f6 2c                 tst16	r4
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 fb 26                 cmov.eq	r4, r6
 fb 2f                 cmov.eq	r5, r7
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 36 18              ldsp16	r6, [sp+0x18]
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 fb 34                 cmov.eq	r6, r4
 fb 3d                 cmov.eq	r7, r5
 f4 a0                 tst8	r0
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 67                 mov32	q1, q3
 d0 9a                 breq8	-0x66 <L48>
<L50>:
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
<L51>:
 f4 00                 ldsp16	r4, [sp+0x0]
 d6 34                 adjsp	0x34
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L52>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f2 68                 mov32	q2, q0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f7 7b                 sub32	q2, q3
 f0 36 24              ldsp16	r6, [sp+0x24]
 f6 2e                 tst16	r6
 f4 12                 ldsp16	r6, [sp+0x4]
 fb 74                 cmov.ne	r6, r4
 fb 7d                 cmov.ne	r7, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 69 80              cmp32	q2, q0
 f8 0c                 cset.ne	r4
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f7 72                 sub32	q0, q2
 f0 34 24              ldsp16	r4, [sp+0x24]
 f6 2c                 tst16	r4
 fb 50                 cmov.ne	r2, r0
 fb 59                 cmov.ne	r3, r1
 f0 34 30              ldsp16	r4, [sp+0x30]
 ed a8 25              ld8u	r5, [r4+5]
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 cc 69                 cmpi.s8	r4, 0x69
 d0 04                 breq8	0x4 <L53>
 cc 64                 cmpi.s8	r4, 0x64
 d1 18                 brne8	0x18 <L54>
<L53>:
 cd 04                 cmpi.s8	r5, 0x4
 d3 18                 brslt8	0x18 <L55>
 cd 04                 cmpi.s8	r5, 0x4
 f0 34 32              ldsp16	r4, [sp+0x32]
 da a5 00              breq16	0xa5 <L62>
 cd 05                 cmpi.s8	r5, 0x5
 da a0 00              breq16	0xa0 <L62>
 f2 63                 mov32	q0, q3
 cd 07                 cmpi.s8	r5, 0x7
 e0 8d 00              jmp16	141 <L61>
<L54>:
 cd 04                 cmpi.s8	r5, 0x4
 d9 7a                 brsge8	0x7a <L60>
<L55>:
 cd 01                 cmpi.s8	r5, 0x1
 f0 34 32              ldsp16	r4, [sp+0x32]
 f2 63                 mov32	q0, q3
 da a0 00              breq16	0xa0 <L63>
 cd 02                 cmpi.s8	r5, 0x2
 d0 7b                 breq8	0x7b <L61>
 cd 03                 cmpi.s8	r5, 0x3
 d1 77                 brne8	0x77 <L61>
 68                    ld16	r6, [r4]
 06                    mov	r5, r6
 c9 02                 addi.s8	r5, 0x2
 71                    st16	[r4], r5
 62                    ld16	r4, [r6]
 f0 6b 08              st32	[r4], q0
 e0 7e ff              jmp16	-130 <L51>
<L56>:
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 a4                 tst8	r4
 f0 33 12              ldsp16	r3, [sp+0x12]
 da e4 fb              breq16	-0x41c <L24>
 f0 03 08              ldi8	r3, 0x8
<L57>:
 c0 01                 ldi8	r4, 0x1
 f4 50                 stsp16	[sp+0x4], r4
 ed 84 26              ld8u	r4, [r2+6]
 cc 6f                 cmpi.s8	r4, 0x6f
 d1 0b                 brne8	0xb <L58>
 f2 6a                 mov32	q3, q0
 f0 0f 08              cmpi.s8	r3, 0x8
 db 19 fb              brne16	-0x4e7 <L19>
 e0 e9 fb              jmp16	-1047 <L26>
<L58>:
 f0 34 28              ldsp16	r4, [sp+0x28]
 e1 35 f1              call16	__avm_scan_peek
 cc 78                 cmpi.s8	r4, 0x78
 d0 0d                 breq8	0xd <L59>
 f0 34 28              ldsp16	r4, [sp+0x28]
 e1 2b f1              call16	__avm_scan_peek
 cc 58                 cmpi.s8	r4, 0x58
 f2 6a                 mov32	q3, q0
 db f9 fa              brne16	-0x507 <L18>
<L59>:
 f0 31 28              ldsp16	r1, [sp+0x28]
 f1 21                 mov	r4, r1
 e1 3e f1              call16	__avm_scan_take
 c4 fe ff              ldi16	r4, 0xfffe
 c5 ff ff              ldi16	r5, 0xffff
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f7 6e                 add32	q3, q2
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 c0 04                 ldi8	r4, 0x4
 f0 03 10              ldi8	r3, 0x10
 f2 42                 sub	r2, r2
 e0 c5 fb              jmp16	-1083 <L30>
<L60>:
 cd 04                 cmpi.s8	r5, 0x4
 f0 34 32              ldsp16	r4, [sp+0x32]
 d0 14                 breq8	0x14 <L62>
 cd 05                 cmpi.s8	r5, 0x5
 d0 10                 breq8	0x10 <L62>
 f2 63                 mov32	q0, q3
 cd 06                 cmpi.s8	r5, 0x6
<L61>:
 68                    ld16	r6, [r4]
 06                    mov	r5, r6
 c9 02                 addi.s8	r5, 0x2
 71                    st16	[r4], r5
 62                    ld16	r4, [r6]
 f1 24                 mov	r5, r0
 71                    st16	[r4], r5
 e0 07 ff              jmp16	-249 <L51>
<L62>:
 f5 40                 ld16	r0, [r4]
 f1 24                 mov	r5, r0
 c9 02                 addi.s8	r5, 0x2
 71                    st16	[r4], r5
 ed 90 20              ld16	r4, [r0+0]
 f0 6b c8              st32	[r4], q3
 c8 04                 addi.s8	r4, 0x4
 f0 6b 48              st32	[r4], q1
 e0 f2 fe              jmp16	-270 <L51>
<L63>:
 68                    ld16	r6, [r4]
 06                    mov	r5, r6
 c9 02                 addi.s8	r5, 0x2
 71                    st16	[r4], r5
 62                    ld16	r4, [r6]
 f1 24                 mov	r5, r0
 51                    st8	[r4], r5
 e0 e6 fe              jmp16	-282 <L51>

<__avm_scan_float>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ce                 adjsp	-0x32
 f0 6a 0a              ld32	q0, [r5]
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 04              cmp32	q0, q1
 d0 56                 breq8	0x56 <L1>
 f0 3d 20              stsp16	[sp+0x20], r5
 f0 3e 22              stsp16	[sp+0x22], r6
 f1 14                 mov	r2, r4
 e1 a9 f0              call16	__avm_scan_peek
 cc ff                 cmpi.s8	r4, -0x1
 da 32 07              breq16	0x732 <L51>
 cc 2b                 cmpi.s8	r4, 0x2b
 f0 03 01              ldi8	r3, 0x1
 a5                    xor	r5, r5
 f4 69                 stsp16	[sp+0xa], r5
 af                    xor	r7, r7
 f0 3a 0e              stsp16	[sp+0xe], r2
 d0 08                 breq8	0x8 <L0>
 cc 2d                 cmpi.s8	r4, 0x2d
 d1 3a                 brne8	0x3a <L2>
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
<L0>:
 f0 3e 26              stsp16	[sp+0x26], r6
 f0 3f 28              stsp16	[sp+0x28], r7
 f1 22                 mov	r4, r2
 e1 a5 f0              call16	__avm_scan_take
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 62                 add32	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d1 24                 brne8	0x24 <L3>
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 f0 3e 2a              stsp16	[sp+0x2a], r6
 f0 3f 2c              stsp16	[sp+0x2c], r7
 c2 01                 ldi8	r6, 0x1
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f0 3b 04              stsp16	[sp+0x4], r3
 aa                    xor	r6, r6
 e0 2d 02              jmp16	557 <L10>
<L1>:
 c4 ff ff              ldi16	r4, 0xffff
 e0 e6 06              jmp16	1766 <L51>
<L2>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 26              stsp16	[sp+0x26], r4
 f0 3d 28              stsp16	[sp+0x28], r5
<L3>:
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f1 22                 mov	r4, r2
 e1 45 f0              call16	__avm_scan_peek
 f1 04                 mov	r0, r4
 c0 20                 ldi8	r4, 0x20
 f9 11                 or	r0, r4
 f1 22                 mov	r4, r2
 e1 3a f0              call16	__avm_scan_peek
 f0 0c 6e              cmpi.s8	r0, 0x6e
 da 01 01              breq16	0x101 <L4>
 f0 0c 69              cmpi.s8	r0, 0x69
 db 83 01              brne16	0x183 <L5>
 f0 05 df ff           ldi16	r1, 0xffdf
 f9 84                 and	r4, r1
 04                    mov	r5, r4
 a0                    xor	r4, r4
 cd 49                 cmpi.s8	r5, 0x49
 db af 06              brne16	0x6af <L51>
 f1 04                 mov	r0, r4
 f1 22                 mov	r4, r2
 e1 3c f0              call16	__avm_scan_take
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 da 4d 06              breq16	0x64d <L46>
 f1 22                 mov	r4, r2
 e1 08 f0              call16	__avm_scan_peek
 f9 84                 and	r4, r1
 cc 4e                 cmpi.s8	r4, 0x4e
 db 41 06              brne16	0x641 <L46>
 f1 22                 mov	r4, r2
 e1 1e f0              call16	__avm_scan_take
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 da 2f 06              breq16	0x62f <L46>
 f1 22                 mov	r4, r2
 e1 ea ef              call16	__avm_scan_peek
 f9 84                 and	r4, r1
 cc 46                 cmpi.s8	r4, 0x46
 db 23 06              brne16	0x623 <L46>
 f1 22                 mov	r4, r2
 e1 00 f0              call16	__avm_scan_take
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 da 69 06              breq16	0x669 <L53>
 f1 22                 mov	r4, r2
 e1 cc ef              call16	__avm_scan_peek
 f9 84                 and	r4, r1
 cc 49                 cmpi.s8	r4, 0x49
 db 5d 06              brne16	0x65d <L53>
 f1 22                 mov	r4, r2
 e1 c0 ef              call16	__avm_scan_peek
 f9 84                 and	r4, r1
 cc 49                 cmpi.s8	r4, 0x49
 db f9 05              brne16	0x5f9 <L46>
 f1 22                 mov	r4, r2
 e1 d6 ef              call16	__avm_scan_take
 c0 04                 ldi8	r4, 0x4
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 da e7 05              breq16	0x5e7 <L46>
 f1 22                 mov	r4, r2
 e1 a2 ef              call16	__avm_scan_peek
 f9 84                 and	r4, r1
 cc 4e                 cmpi.s8	r4, 0x4e
 db db 05              brne16	0x5db <L46>
 f1 22                 mov	r4, r2
 e1 b8 ef              call16	__avm_scan_take
 c0 05                 ldi8	r4, 0x5
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 da c9 05              breq16	0x5c9 <L46>
 f1 22                 mov	r4, r2
 e1 84 ef              call16	__avm_scan_peek
 f9 84                 and	r4, r1
 cc 49                 cmpi.s8	r4, 0x49
 db bd 05              brne16	0x5bd <L46>
 f4 38                 ldsp16	r4, [sp+0xe]
 e1 9a ef              call16	__avm_scan_take
 c0 06                 ldi8	r4, 0x6
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 da ab 05              breq16	0x5ab <L46>
 f4 38                 ldsp16	r4, [sp+0xe]
 e1 66 ef              call16	__avm_scan_peek
 f9 84                 and	r4, r1
 cc 54                 cmpi.s8	r4, 0x54
 db 9f 05              brne16	0x59f <L46>
 f4 38                 ldsp16	r4, [sp+0xe]
 e1 7c ef              call16	__avm_scan_take
 c0 07                 ldi8	r4, 0x7
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 da 8d 05              breq16	0x58d <L46>
 f4 38                 ldsp16	r4, [sp+0xe]
 e1 48 ef              call16	__avm_scan_peek
 f9 84                 and	r4, r1
 cc 59                 cmpi.s8	r4, 0x59
 f1 20                 mov	r4, r0
 db cd 05              brne16	0x5cd <L51>
 f4 38                 ldsp16	r4, [sp+0xe]
 e1 5c ef              call16	__avm_scan_take
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 e0 52 05              jmp16	1362 <L45>
<L4>:
 f0 04 df ff           ldi16	r0, 0xffdf
 f9 80                 and	r4, r0
 04                    mov	r5, r4
 a0                    xor	r4, r4
 cd 4e                 cmpi.s8	r5, 0x4e
 db b4 05              brne16	0x5b4 <L51>
 f1 0c                 mov	r1, r4
 f1 22                 mov	r4, r2
 e1 41 ef              call16	__avm_scan_take
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 da 9e 05              breq16	0x59e <L50>
 f1 22                 mov	r4, r2
 e1 0d ef              call16	__avm_scan_peek
 f9 80                 and	r4, r0
 cc 41                 cmpi.s8	r4, 0x41
 db 92 05              brne16	0x592 <L50>
 f1 22                 mov	r4, r2
 e1 23 ef              call16	__avm_scan_take
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 da 80 05              breq16	0x580 <L50>
 f1 22                 mov	r4, r2
 e1 ef ee              call16	__avm_scan_peek
 f9 80                 and	r4, r0
 cc 4e                 cmpi.s8	r4, 0x4e
 db 74 05              brne16	0x574 <L50>
 f1 22                 mov	r4, r2
 e1 05 ef              call16	__avm_scan_take
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 c8              cmp32	q3, q2
 da 74 05              breq16	0x574 <L54>
 f1 22                 mov	r4, r2
 e1 d1 ee              call16	__avm_scan_peek
 cc 28                 cmpi.s8	r4, 0x28
 db 6a 05              brne16	0x56a <L54>
 f1 22                 mov	r4, r2
 e1 e9 ee              call16	__avm_scan_take
 c4 fc ff              ldi16	r4, 0xfffc
 c5 ff ff              ldi16	r5, 0xffff
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f7 66                 add32	q1, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 da 3d 05              breq16	0x53d <L50>
 f0 30 0e              ldsp16	r0, [sp+0xe]
 e0 09 05              jmp16	1289 <L49>
<L5>:
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 f0 3e 2a              stsp16	[sp+0x2a], r6
 f0 3f 2c              stsp16	[sp+0x2c], r7
 c2 01                 ldi8	r6, 0x1
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 cc 30                 cmpi.s8	r4, 0x30
 d1 4f                 brne8	0x4f <L6>
 f1 22                 mov	r4, r2
 e1 b5 ee              call16	__avm_scan_take
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 62                 add32	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 d0 3f                 breq8	0x3f <L7>
 f1 22                 mov	r4, r2
 e1 79 ee              call16	__avm_scan_peek
 c5 df ff              ldi16	r5, 0xffdf
 84                    and	r5, r4
 cd 58                 cmpi.s8	r5, 0x58
 d1 38                 brne8	0x38 <L8>
 f1 22                 mov	r4, r2
 e1 8e ee              call16	__avm_scan_take
 c4 fe ff              ldi16	r4, 0xfffe
 c5 ff ff              ldi16	r5, 0xffff
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f7 6e                 add32	q3, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 c2 10                 ldi8	r6, 0x10
 af                    xor	r7, r7
 f0 3e 2a              stsp16	[sp+0x2a], r6
 f0 3f 2c              stsp16	[sp+0x2c], r7
 aa                    xor	r6, r6
 f4 52                 stsp16	[sp+0x4], r6
 c2 04                 ldi8	r6, 0x4
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 aa                    xor	r6, r6
 d4 18                 jmp8	0x18 <L10>
<L6>:
 f0 3b 04              stsp16	[sp+0x4], r3
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 aa                    xor	r6, r6
 d4 0e                 jmp8	0xe <L10>
<L7>:
 f0 3b 04              stsp16	[sp+0x4], r3
 aa                    xor	r6, r6
 d4 06                 jmp8	0x6 <L9>
<L8>:
 f2 68                 mov32	q2, q0
 f0 3b 04              stsp16	[sp+0x4], r3
 aa                    xor	r6, r6
<L9>:
 f1 1e                 mov	r3, r6
<L10>:
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3e 24              stsp16	[sp+0x24], r6
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 56                 breq8	0x56 <L14>
<L11>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f1 22                 mov	r4, r2
 e1 05 ee              call16	__avm_scan_peek
 f4 2a                 ldsp16	r6, [sp+0xa]
 f6 2e                 tst16	r6
 f8 08                 cset.ne	r0
 d1 29                 brne8	0x29 <L12>
 cc 2e                 cmpi.s8	r4, 0x2e
 d1 25                 brne8	0x25 <L12>
 f1 22                 mov	r4, r2
 e1 16 ee              call16	__avm_scan_take
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 25                 breq8	0x25 <L13>
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f1 22                 mov	r4, r2
 e1 d8 ed              call16	__avm_scan_peek
 c2 01                 ldi8	r6, 0x1
 f1 06                 mov	r0, r6
<L12>:
 f1 14                 mov	r2, r4
 f0 0a d0              addi.s8	r2, -0x30
 f0 0e 0a              cmpi.s8	r2, 0xa
 f1 2f                 mov	r7, r3
 d8 1f                 bruge8	0x1f <L15>
 f0 0e 0a              cmpi.s8	r2, 0xa
 f8 2c                 cset.sge	r4
 f6 2a                 tst16	r2
 de 58 02              brslt16	0x258 <L35>
 d4 2d                 jmp8	0x2d <L16>
<L13>:
 c0 01                 ldi8	r4, 0x1
 f4 68                 stsp16	[sp+0xa], r4
<L14>:
 c4 ff ff              ldi16	r4, 0xffff
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 2a                 ldsp16	r6, [sp+0xa]
 f6 2e                 tst16	r6
 f8 08                 cset.ne	r0
 f1 2f                 mov	r7, r3
<L15>:
 c1 20                 ldi8	r5, 0x20
 91                    or	r4, r5
 04                    mov	r5, r4
 c9 9f                 addi.s8	r5, -0x61
 c8 a9                 addi.s8	r4, -0x57
 f0 06 ff ff           ldi16	r2, 0xffff
 cd 06                 cmpi.s8	r5, 0x6
 fc 14                 cmov.ult	r2, r4
 f0 0e 0a              cmpi.s8	r2, 0xa
 f8 2c                 cset.sge	r4
 f6 2a                 tst16	r2
 de 29 02              brslt16	0x229 <L35>
<L16>:
 f4 11                 ldsp16	r5, [sp+0x4]
 81                    and	r4, r5
 f4 a4                 tst8	r4
 db 21 02              brne16	0x221 <L35>
 f4 6a                 stsp16	[sp+0xa], r6
 f4 38                 ldsp16	r4, [sp+0xe]
 e1 a2 ed              call16	__avm_scan_take
 c4 00 36              ldi16	r4, 0x3600
 c5 65 c4              ldi16	r5, 0xc465
 f1 18                 mov	r3, r0
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
 f0 69 80              cmp32	q2, q0
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 fd 26                 cmov.slt	r4, r6
 fd 2f                 cmov.slt	r5, r7
 c2 01                 ldi8	r6, 0x1
 f0 3e 14              stsp16	[sp+0x14], r6
 f4 a3                 tst8	r3
 aa                    xor	r6, r6
 af                    xor	r7, r7
 fb 74                 cmov.ne	r6, r4
 fb 7d                 cmov.ne	r7, r5
 f7 73                 sub32	q0, q3
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 db f8 00              brne16	0xf8 <L23>
 f6 2a                 tst16	r2
 db f3 00              brne16	0xf3 <L23>
<L17>:
 f0 69 80              cmp32	q2, q0
 d0 57                 breq8	0x57 <L19>
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f1 22                 mov	r4, r2
 e1 1e ed              call16	__avm_scan_peek
 f4 2a                 ldsp16	r6, [sp+0xa]
 f6 2e                 tst16	r6
 f8 0b                 cset.ne	r3
 d1 2c                 brne8	0x2c <L18>
 cc 2e                 cmpi.s8	r4, 0x2e
 d1 28                 brne8	0x28 <L18>
 f1 22                 mov	r4, r2
 e1 2f ed              call16	__avm_scan_take
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 f0 36 14              ldsp16	r6, [sp+0x14]
 d0 26                 breq8	0x26 <L20>
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f1 22                 mov	r4, r2
 e1 ee ec              call16	__avm_scan_peek
 c2 01                 ldi8	r6, 0x1
 f1 1e                 mov	r3, r6
<L18>:
 f1 04                 mov	r0, r4
 f0 08 d0              addi.s8	r0, -0x30
 f0 0c 0a              cmpi.s8	r0, 0xa
 d8 20                 bruge8	0x20 <L21>
 f0 0c 0a              cmpi.s8	r0, 0xa
 f8 2c                 cset.sge	r4
 af                    xor	r7, r7
 f6 28                 tst16	r0
 de 67 01              brslt16	0x167 <L33>
 d4 2e                 jmp8	0x2e <L22>
<L19>:
 f4 2a                 ldsp16	r6, [sp+0xa]
<L20>:
 c4 ff ff              ldi16	r4, 0xffff
 f6 2e                 tst16	r6
 f8 0b                 cset.ne	r3
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
<L21>:
 c1 20                 ldi8	r5, 0x20
 91                    or	r4, r5
 04                    mov	r5, r4
 c9 9f                 addi.s8	r5, -0x61
 c8 a9                 addi.s8	r4, -0x57
 f0 04 ff ff           ldi16	r0, 0xffff
 cd 06                 cmpi.s8	r5, 0x6
 fc 04                 cmov.ult	r0, r4
 f0 0c 0a              cmpi.s8	r0, 0xa
 f8 2c                 cset.sge	r4
 af                    xor	r7, r7
 f6 28                 tst16	r0
 de 37 01              brslt16	0x137 <L33>
<L22>:
 f4 11                 ldsp16	r5, [sp+0x4]
 81                    and	r4, r5
 f4 a4                 tst8	r4
 db 2b 01              brne16	0x12b <L32>
 f4 6a                 stsp16	[sp+0xa], r6
 f4 38                 ldsp16	r4, [sp+0xe]
 e1 b8 ec              call16	__avm_scan_take
 f0 38 2e              stsp16	[sp+0x2e], r0
 f0 3b 10              stsp16	[sp+0x10], r3
 f0 32 1c              ldsp16	r2, [sp+0x1c]
 f0 33 1e              ldsp16	r3, [sp+0x1e]
 c4 00 36              ldi16	r4, 0x3600
 c5 65 c4              ldi16	r5, 0xc465
 f0 69 84              cmp32	q2, q1
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f2 68                 mov32	q2, q0
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 fd 26                 cmov.slt	r4, r6
 fd 2f                 cmov.slt	r5, r7
 f0 36 10              ldsp16	r6, [sp+0x10]
 f4 a6                 tst8	r6
 f2 6a                 mov32	q3, q0
 fb 74                 cmov.ne	r6, r4
 fb 7d                 cmov.ne	r7, r5
 f7 77                 sub32	q1, q3
 f0 3a 1c              stsp16	[sp+0x1c], r2
 f0 3b 1e              stsp16	[sp+0x1e], r3
 f0 32 2e              ldsp16	r2, [sp+0x2e]
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f7 6b                 add32	q2, q3
 f6 2a                 tst16	r2
 da 1d ff              breq16	-0xe3 <L17>
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f2 63                 mov32	q0, q3
 d4 06                 jmp8	0x6 <L24>
<L23>:
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
<L24>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 a4                 tst8	r4
 d0 33                 breq8	0x33 <L25>
 c0 09                 ldi8	r4, 0x9
 f0 35 18              ldsp16	r5, [sp+0x18]
 cd 27                 cmpi.s8	r5, 0x27
 d8 48                 bruge8	0x48 <L29>
 f0 35 24              ldsp16	r5, [sp+0x24]
 f4 a5                 tst8	r5
 d1 39                 brne8	0x39 <L28>
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
 f0 35 18              ldsp16	r5, [sp+0x18]
 09                    mov	r6, r5
 af                    xor	r7, r7
 f0 04 0a 2c           ldi16	r0, 0x2c0a
 f0 01 00              ldi8	r1, 0x0
 f7 6c                 add32	q3, q0
 f0 61 ac              ldp8s	r5, [q3]
 c9 d0                 addi.s8	r5, -0x30
 f5 15                 cmp	r2, r5
 d1 0a                 brne8	0xa <L26>
 a5                    xor	r5, r5
 f0 3d 24              stsp16	[sp+0x24], r5
 d4 10                 jmp8	0x10 <L27>
<L25>:
 c0 08                 ldi8	r4, 0x8
 d4 1a                 jmp8	0x1a <L29>
<L26>:
 c7 ff ff              ldi16	r7, 0xffff
 c2 01                 ldi8	r6, 0x1
 f5 26                 cmp	r5, r2
 fd 3e                 cmov.slt	r7, r6
 f0 3f 24              stsp16	[sp+0x24], r7
<L27>:
 f0 30 1c              ldsp16	r0, [sp+0x1c]
 f0 31 1e              ldsp16	r1, [sp+0x1e]
<L28>:
 f0 35 18              ldsp16	r5, [sp+0x18]
 f4 ad                 inc16	r5
 f0 3d 18              stsp16	[sp+0x18], r5
<L29>:
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 34                    cmp	r5, r4
 d2 37                 brult8	0x37 <L31>
 c4 00 ca              ldi16	r4, 0xca00
 c5 9a 3b              ldi16	r5, 0x3b9a
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 08              cmp32	q0, q2
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 fd 34                 cmov.slt	r6, r4
 fd 3d                 cmov.slt	r7, r5
 f7 6c                 add32	q3, q0
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f0 34 16              ldsp16	r4, [sp+0x16]
 f9 89                 or	r4, r2
 f0 3c 16              stsp16	[sp+0x16], r4
 f2 4b                 sub	r3, r3
<L30>:
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 db 93 fd              brne16	-0x26d <L11>
 e0 e6 fd              jmp16	-538 <L14>
<L31>:
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f0 36 2a              ldsp16	r6, [sp+0x2a]
 f0 37 2c              ldsp16	r7, [sp+0x2c]
 e1 8d 10              call16	__avm_mulsi3
 f1 2a                 mov	r6, r2
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f2 4b                 sub	r3, r3
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f4 ac                 inc16	r4
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
 d4 c2                 jmp8	-0x3e <L30>
<L32>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d4 02                 jmp8	0x2 <L34>
<L33>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
<L34>:
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
<L35>:
 f0 03 01              ldi8	r3, 0x1
 a0                    xor	r4, r4
 f4 a7                 tst8	r7
 db eb 01              brne16	0x1eb <L51>
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 69 80              cmp32	q2, q0
 da f2 00              breq16	0xf2 <L41>
 f0 38 2e              stsp16	[sp+0x2e], r0
 f0 39 30              stsp16	[sp+0x30], r1
 f0 02 70              ldi8	r2, 0x70
 c0 65                 ldi8	r4, 0x65
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 a5                 tst8	r5
 fb 54                 cmov.ne	r2, r4
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f1 20                 mov	r4, r0
 e1 36 eb              call16	__avm_scan_peek
 c1 20                 ldi8	r5, 0x20
 91                    or	r4, r5
 f5 22                 cmp	r4, r2
 db d1 00              brne16	0xd1 <L41>
 f1 20                 mov	r4, r0
 e1 4b eb              call16	__avm_scan_take
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 6e                 add32	q3, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 da 59 01              breq16	0x159 <L47>
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 f1 20                 mov	r4, r0
 e1 0c eb              call16	__avm_scan_peek
 f1 0c                 mov	r1, r4
 f0 0d 2d              cmpi.s8	r1, 0x2d
 d0 05                 breq8	0x5 <L36>
 f0 0d 2b              cmpi.s8	r1, 0x2b
 d1 22                 brne8	0x22 <L37>
<L36>:
 f1 20                 mov	r4, r0
 e1 1d eb              call16	__avm_scan_take
 c4 fe ff              ldi16	r4, 0xfffe
 c5 ff ff              ldi16	r5, 0xffff
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f7 6e                 add32	q3, q2
 f0 0d 2d              cmpi.s8	r1, 0x2d
 f8 0b                 cset.ne	r3
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 da 73 01              breq16	0x173 <L52>
<L37>:
 f1 20                 mov	r4, r0
 e1 d9 ea              call16	__avm_scan_peek
 f1 14                 mov	r2, r4
 c8 d0                 addi.s8	r4, -0x30
 cc 0a                 cmpi.s8	r4, 0xa
 a0                    xor	r4, r4
 dd 5d 01              bruge16	0x15d <L51>
<L38>:
 c6 ff e0              ldi16	r6, 0xe0ff
 c7 f5 05              ldi16	r7, 0x5f5
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 f0 35 30              ldsp16	r5, [sp+0x30]
 f0 69 c8              cmp32	q3, q2
 d3 19                 brslt8	0x19 <L39>
 c2 0a                 ldi8	r6, 0xa
 af                    xor	r7, r7
 e1 b6 0f              call16	__avm_mulsi3
 f1 2a                 mov	r6, r2
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 c4 d0 ff              ldi16	r4, 0xffd0
 c5 ff ff              ldi16	r5, 0xffff
 f7 6b                 add32	q2, q3
 f0 3c 2e              stsp16	[sp+0x2e], r4
 f0 3d 30              stsp16	[sp+0x30], r5
<L39>:
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f1 22                 mov	r4, r2
 e1 bf ea              call16	__avm_scan_take
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 f7 6e                 add32	q3, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 f2 62                 mov32	q0, q2
 f0 69 c8              cmp32	q3, q2
 d0 0d                 breq8	0xd <L40>
 f1 22                 mov	r4, r2
 e1 7f ea              call16	__avm_scan_peek
 f1 14                 mov	r2, r4
 c8 d0                 addi.s8	r4, -0x30
 cc 0a                 cmpi.s8	r4, 0xa
 d2 a8                 brult8	-0x58 <L38>
<L40>:
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 f0 35 30              ldsp16	r5, [sp+0x30]
 f7 72                 sub32	q0, q2
 f4 a3                 tst8	r3
 f2 6a                 mov32	q3, q0
 fb 74                 cmov.ne	r6, r4
 fb 7d                 cmov.ne	r7, r5
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f7 6e                 add32	q3, q2
 d4 06                 jmp8	0x6 <L42>
<L41>:
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f0 37 1e              ldsp16	r7, [sp+0x1e]
<L42>:
 f0 34 18              ldsp16	r4, [sp+0x18]
 cc 27                 cmpi.s8	r4, 0x27
 f8 1b                 cset.uge	r3
 f0 34 24              ldsp16	r4, [sp+0x24]
 f4 a4                 tst8	r4
 f8 0a                 cset.ne	r2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 f0 69 08              cmp32	q0, q2
 d0 5b                 breq8	0x5b <L45>
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 a4                 tst8	r4
 d0 23                 breq8	0x23 <L43>
 f9 4d                 or	r2, r3
 d6 fc                 adjsp	-0x4
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f4 40                 stsp16	[sp+0x0], r4
 f0 34 28              ldsp16	r4, [sp+0x28]
 fa 38                 lsl16i	r4, 0x8
 f6 2c                 tst16	r4
 f8 2c                 cset.sge	r4
 f9 88                 and	r4, r2
 f4 48                 stsp16	[sp+0x2], r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 e1 e4 02              call16	__avm_decimal_value
 d6 04                 adjsp	0x4
 d4 12                 jmp8	0x12 <L44>
<L43>:
 d6 fe                 adjsp	-0x2
 f0 34 18              ldsp16	r4, [sp+0x18]
 f4 40                 stsp16	[sp+0x0], r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 e1 a8 00              call16	__avm_hex_value
 d6 02                 adjsp	0x2
<L44>:
 c6 00 00              ldi16	r6, 0x0
 f6 2e                 tst16	r6
 d0 19                 breq8	0x19 <L45>
 aa                    xor	r6, r6
 c7 80 80              ldi16	r7, 0x8080
 f7 6e                 add32	q3, q2
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 80           ldi16	r1, 0x80ff
 f0 69 0c              cmp32	q0, q3
 d2 06                 brult8	0x6 <L45>
 c2 22                 ldi8	r6, 0x22
 f0 5e 00 00           stm16	[0x0], r6
<L45>:
 f0 36 20              ldsp16	r6, [sp+0x20]
 f0 00 01              ldi8	r0, 0x1
 ed ec 24              ld8u	r7, [r6+4]
 f4 a7                 tst8	r7
 d1 14                 brne8	0x14 <L46>
 f0 36 22              ldsp16	r6, [sp+0x22]
 f5 49                 ld16	r1, [r6]
 f1 2d                 mov	r7, r1
 cb 02                 addi.s8	r7, 0x2
 7b                    st16	[r6], r7
 f0 37 28              ldsp16	r7, [sp+0x28]
 97                    or	r5, r7
 ed d2 20              ld16	r6, [r1+0]
 f0 6b 8c              st32	[r6], q2
<L46>:
 f1 20                 mov	r4, r0
 d4 4a                 jmp8	0x4a <L51>
<L47>:
 a0                    xor	r4, r4
 d4 47                 jmp8	0x47 <L51>
<L48>:
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f1 20                 mov	r4, r0
 e1 d3 e9              call16	__avm_scan_take
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f7 66                 add32	q1, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 48              cmp32	q1, q2
 d0 2e                 breq8	0x2e <L50>
<L49>:
 f1 20                 mov	r4, r0
 e1 9d e9              call16	__avm_scan_peek
 f1 04                 mov	r0, r4
 f0 0c ff              cmpi.s8	r0, -0x1
 d0 22                 breq8	0x22 <L50>
 f1 20                 mov	r4, r0
 f1 74                 zext8	r4
 e1 14 f1              call16	isalnum
 f0 0c 5f              cmpi.s8	r0, 0x5f
 d0 d1                 breq8	-0x2f <L48>
 f6 2c                 tst16	r4
 d1 cd                 brne8	-0x33 <L48>
 f0 0c 29              cmpi.s8	r0, 0x29
 f1 21                 mov	r4, r1
 d1 0d                 brne8	0xd <L51>
 f4 38                 ldsp16	r4, [sp+0xe]
 e1 9c e9              call16	__avm_scan_take
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 d4 93                 jmp8	-0x6d <L45>
<L50>:
 f1 21                 mov	r4, r1
<L51>:
 d6 32                 adjsp	0x32
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L52>:
 a0                    xor	r4, r4
 d4 f6                 jmp8	-0xa <L51>
<L53>:
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 d4 81                 jmp8	-0x7f <L45>
<L54>:
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 e0 7a ff              jmp16	-134 <L45>

<__avm_hex_value>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 08                    mov	r6, r4
 0d                    mov	r7, r5
 c4 ff ff              ldi16	r4, 0xffff
 a5                    xor	r5, r5
 f2 42                 sub	r2, r2
 f0 00 10              ldi8	r0, 0x10
 f0 69 8c              cmp32	q2, q3
 fc 10                 cmov.ult	r2, r0
 f2 39                 sub	r1, r1
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 fc 37                 cmov.ult	r6, r7
 fc 39                 cmov.ult	r7, r1
 f0 34 19              ldsp16	r4, [sp+0x19]
 f4 50                 stsp16	[sp+0x4], r4
 f0 04 00 01           ldi16	r0, 0x100
 f0 69 c0              cmp32	q3, q0
 d2 14                 brult8	0x14 <L0>
 c0 08                 ldi8	r4, 0x8
 f9 51                 or	r2, r4
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 78                 lsr16i	r4, 0x8
 09                    mov	r6, r5
 0c                    mov	r7, r4
<L0>:
 c0 10                 ldi8	r4, 0x10
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d2 13                 brult8	0x13 <L1>
 02                    mov	r4, r6
 fa 74                 lsr16i	r4, 0x4
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 4c                 lsl16i	r5, 0xc
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 74                 lsr16i	r4, 0x4
 09                    mov	r6, r5
 0c                    mov	r7, r4
 f0 0a 04              addi.s8	r2, 0x4
<L1>:
 c0 04                 ldi8	r4, 0x4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d2 13                 brult8	0x13 <L2>
 02                    mov	r4, r6
 fa 72                 lsr16i	r4, 0x2
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 4e                 lsl16i	r5, 0xe
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 fa 72                 lsr16i	r4, 0x2
 09                    mov	r6, r5
 0c                    mov	r7, r4
 f0 0a 02              addi.s8	r2, 0x2
<L2>:
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f0 69 8c              cmp32	q2, q3
 f8 10                 cset.ult	r0
 f2 02                 add	r0, r2
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f7 6e                 add32	q3, q2
 c0 7f                 ldi8	r4, 0x7f
 a5                    xor	r5, r5
 f0 69 8c              cmp32	q2, q3
 d9 07                 brsge8	0x7 <L4>
<L3>:
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 e0 18 01              jmp16	280 <L12>
<L4>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 06 6a ff           ldi16	r2, 0xff6a
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 69 c4              cmp32	q3, q1
 de 04 01              brslt16	0x104 <L12>
 f0 06 81 ff           ldi16	r2, 0xff81
 f0 07 ff ff           ldi16	r3, 0xffff
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 4c              cmp32	q1, q3
 d3 2f                 brslt8	0x2f <L5>
 f0 06 6b ff           ldi16	r2, 0xff6b
 f4 2a                 ldsp16	r6, [sp+0xa]
 f2 46                 sub	r2, r6
 f0 0e 01              cmpi.s8	r2, 0x1
 de 99 00              brslt16	0x99 <L8>
 f0 0e 21              cmpi.s8	r2, 0x21
 dd df 00              bruge16	0xdf <L12>
 c4 4b ff              ldi16	r4, 0xff4b
 38                    cmp	r6, r4
 db df 00              brne16	0xdf <L13>
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f0 69 8c              cmp32	q2, q3
 dd 13 01              bruge16	0x113 <L15>
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 e0 c4 00              jmp16	196 <L12>
<L5>:
 f0 0c 18              cmpi.s8	r0, 0x18
 d8 2c                 bruge8	0x2c <L6>
 f0 01 17              ldi8	r1, 0x17
 f2 38                 sub	r1, r0
 c2 0f                 ldi8	r6, 0xf
 f1 21                 mov	r4, r1
 82                    and	r4, r6
 f4 68                 stsp16	[sp+0xa], r4
 a8                    xor	r6, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 0c                    mov	r7, r4
 f4 8f                 lsr16.1	r7
 fa 1e                 lsr16v	r7, r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 fa 06                 shl16v	r5, r6
 97                    or	r5, r7
 c2 10                 ldi8	r6, 0x10
 f9 38                 and	r1, r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 fa 02                 shl16v	r4, r6
 f4 a1                 tst8	r1
 fb 6c                 cmov.ne	r5, r4
 aa                    xor	r6, r6
 fb 66                 cmov.ne	r4, r6
 d4 69                 jmp8	0x69 <L10>
<L6>:
 f1 20                 mov	r4, r0
 c8 e8                 addi.s8	r4, -0x18
 f1 14                 mov	r2, r4
 f2 4b                 sub	r3, r3
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f2 6b                 mov32	q3, q1
 e1 90 0c              call16	__avm_ashlsi3
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f2 6b                 mov32	q3, q1
 e1 84 0c              call16	__avm_ashlsi3
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f7 66                 add32	q1, q2
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 f0 08 e9              addi.s8	r0, -0x17
 f1 28                 mov	r6, r0
 af                    xor	r7, r7
 e1 95 0c              call16	__avm_lshrsi3
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 f0 69 c4              cmp32	q3, q1
 d8 14                 bruge8	0x14 <L9>
<L7>:
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 d4 22                 jmp8	0x22 <L10>
<L8>:
 c0 95                 ldi8	r4, 0x95
 18                    add	r6, r4
 af                    xor	r7, r7
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 e1 4e 0c              call16	__avm_ashlsi3
 d4 3f                 jmp8	0x3f <L12>
<L9>:
 f0 69 4c              cmp32	q1, q3
 d1 10                 brne8	0x10 <L10>
 f4 12                 ldsp16	r6, [sp+0x4]
 f6 2e                 tst16	r6
 d1 e1                 brne8	-0x1f <L7>
 08                    mov	r6, r4
 f0 00 01              ldi8	r0, 0x1
 f9 c0                 and	r6, r0
 f4 a6                 tst8	r6
 d1 d7                 brne8	-0x29 <L7>
<L10>:
 aa                    xor	r6, r6
 c7 00 01              ldi16	r7, 0x100
 f0 69 8c              cmp32	q2, q3
 f8 06                 cset.eq	r6
 f1 06                 mov	r0, r6
 f2 39                 sub	r1, r1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f7 6c                 add32	q3, q0
 f0 00 7f              ldi8	r0, 0x7f
 f0 69 0c              cmp32	q0, q3
 de ef fe              brslt16	-0x111 <L3>
 c3 7f                 ldi8	r7, 0x7f
 8d                    and	r7, r5
 fa 57                 lsl16i	r6, 0x7
 9b                    or	r6, r7
 0e                    mov	r7, r6
 08                    mov	r6, r4
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
<L11>:
 f7 6b                 add32	q2, q3
<L12>:
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L13>:
 c4 6a ff              ldi16	r4, 0xff6a
 22                    sub	r4, r6
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f2 6a                 mov32	q3, q0
 e1 f6 0b              call16	__avm_ashlsi3
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 c0 02                 ldi8	r4, 0x2
 a5                    xor	r5, r5
 f2 6a                 mov32	q3, q0
 e1 ea 0b              call16	__avm_ashlsi3
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f7 62                 add32	q0, q2
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f9 10                 and	r0, r4
 f9 34                 and	r1, r5
 f1 2a                 mov	r6, r2
 af                    xor	r7, r7
 e1 fe 0b              call16	__avm_lshrsi3
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 f0 69 c0              cmp32	q3, q0
 d8 14                 bruge8	0x14 <L16>
<L14>:
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 d4 b5                 jmp8	-0x4b <L11>
<L15>:
 f0 69 c8              cmp32	q3, q2
 f8 05                 cset.eq	r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 81                    and	r4, r5
 a5                    xor	r5, r5
 d4 a8                 jmp8	-0x58 <L12>
<L16>:
 f0 69 0c              cmp32	q0, q3
 d1 a3                 brne8	-0x5d <L12>
 f4 12                 ldsp16	r6, [sp+0x4]
 f6 2e                 tst16	r6
 d1 e1                 brne8	-0x1f <L14>
 08                    mov	r6, r4
 f0 00 01              ldi8	r0, 0x1
 f9 c0                 and	r6, r0
 f4 a6                 tst8	r6
 d0 93                 breq8	-0x6d <L12>
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 d4 8c                 jmp8	-0x74 <L11>

<__avm_decimal_value>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 34 17              ldsp16	r4, [sp+0x17]
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 f7 6b                 add32	q2, q3
 f0 32 19              ldsp16	r2, [sp+0x19]
 f0 00 27              ldi8	r0, 0x27
 f2 39                 sub	r1, r1
 f0 69 08              cmp32	q0, q2
 d3 09                 brslt8	0x9 <L0>
 f6 2a                 tst16	r2
 d0 14                 breq8	0x14 <L2>
 f0 69 80              cmp32	q2, q0
 d1 0f                 brne8	0xf <L2>
<L0>:
 f2 42                 sub	r2, r2
 f0 07 80 7f           ldi16	r3, 0x7f80
<L1>:
 f2 69                 mov32	q2, q1
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L2>:
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 c4 ca ff              ldi16	r4, 0xffca
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 c8              cmp32	q3, q2
 d3 e8                 brslt8	-0x18 <L1>
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 11                 u32tof
 f2 63                 mov32	q0, q3
 f2 66                 mov32	q1, q2
 af                    xor	r7, r7
 f2 5c                 sub	r7, r0
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 fd 37                 cmov.slt	r6, r7
 f4 52                 stsp16	[sp+0x4], r6
 c2 05                 ldi8	r6, 0x5
 f1 21                 mov	r4, r1
 af                    xor	r7, r7
 fa 7f                 lsr16i	r4, 0xf
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 32 2c           ldi16	r0, 0x2c32
 f0 01 00              ldi8	r1, 0x0
 d4 21                 jmp8	0x21 <L6>
<L3>:
 f4 1b                 ldsp16	r7, [sp+0x6]
 0b                    mov	r6, r7
 fa 9e                 lsr16i	r6, 0xe
 1f                    add	r7, r7
 1f                    add	r7, r7
 ab                    xor	r6, r7
 ae                    xor	r7, r6
 ab                    xor	r6, r7
 f7 6c                 add32	q3, q0
 f0 64 cc              ldp32	q3, [q3]
 f2 69                 mov32	q2, q1
 ff 03                 fdiv
 f2 66                 mov32	q1, q2
<L4>:
 f4 22                 ldsp16	r6, [sp+0x8]
<L5>:
 f4 b6                 dec16	r6
 f4 1b                 ldsp16	r7, [sp+0x6]
 f4 af                 inc16	r7
 cf 06                 cmpi.s8	r7, 0x6
 d0 32                 breq8	0x32 <L7>
<L6>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 a4                 tst8	r4
 f4 62                 stsp16	[sp+0x8], r6
 f4 5b                 stsp16	[sp+0x6], r7
 fb 77                 cmov.ne	r6, r7
 f4 13                 ldsp16	r7, [sp+0x4]
 fa 1e                 lsr16v	r7, r6
 c2 01                 ldi8	r6, 0x1
 8b                    and	r6, r7
 f4 a6                 tst8	r6
 d0 df                 breq8	-0x21 <L4>
 f4 a4                 tst8	r4
 d1 c6                 brne8	-0x3a <L3>
 f4 23                 ldsp16	r7, [sp+0x8]
 0b                    mov	r6, r7
 fa 9e                 lsr16i	r6, 0xe
 1f                    add	r7, r7
 1f                    add	r7, r7
 ab                    xor	r6, r7
 ae                    xor	r7, r6
 ab                    xor	r6, r7
 f7 6c                 add32	q3, q0
 f0 64 cc              ldp32	q3, [q3]
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 f4 22                 ldsp16	r6, [sp+0x8]
 f2 66                 mov32	q1, q2
 d4 c4                 jmp8	-0x3c <L5>
<L7>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 7f 7f           ldi16	r1, 0x7f7f
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 fb 10                 cmov.eq	r2, r0
 fb 19                 cmov.eq	r3, r1
 e0 54 ff              jmp16	-172 <L1>

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
 e1 21 e0              call16	-8159 <__avm_run_local_dtors>
<L0>:
 c4 9e 30              ldi16	r4, 0x309e
 c1 00                 ldi8	r5, 0x0
 c6 9e 30              ldi16	r6, 0x309e
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 9e 30           ldi16	r2, 0x309e
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 9e 30           ldi16	r0, 0x309e
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
 e1 d8 df              call16	-8232 <__avm_run_local_dtors>
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
 e1 21 0a              call16	memset
 c4 fd 2c              ldi16	r4, 0x2cfd
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
 c6 ce 2c              ldi16	r6, 0x2cce
 c3 00                 ldi8	r7, 0x0
 d4 13                 jmp8	0x13 <L3>
<L0>:
 c6 de 2c              ldi16	r6, 0x2cde
 c3 00                 ldi8	r7, 0x0
 d4 0c                 jmp8	0xc <L3>
<L1>:
 c6 bf 2c              ldi16	r6, 0x2cbf
 c3 00                 ldi8	r7, 0x0
 d4 05                 jmp8	0x5 <L3>
<L2>:
 c6 f0 2c              ldi16	r6, 0x2cf0
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
 c6 4a 2c              ldi16	r6, 0x2c4a
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
 c6 5b 2c              ldi16	r6, 0x2c5b
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 11                 ldi8	r5, 0x11
 f1 13                 mov	r2, r3
 d7 36                 sys	draw_textfv_p
 d4 0a                 jmp8	0xa <L5>
<L4>:
 c6 64 2c              ldi16	r6, 0x2c64
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
 c6 69 2c              ldi16	r6, 0x2c69
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 17                 ldi8	r5, 0x17
 d7 36                 sys	draw_textfv_p
 d4 0a                 jmp8	0xa <L7>
<L6>:
 c6 73 2c              ldi16	r6, 0x2c73
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
 c6 77 2c              ldi16	r6, 0x2c77
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 1d                 ldi8	r5, 0x1d
 d7 36                 sys	draw_textfv_p
 ed 90 2c              ld16	r4, [r0+12]
 f4 40                 stsp16	[sp+0x0], r4
 ed 90 2e              ld16	r4, [r0+14]
 f4 48                 stsp16	[sp+0x2], r4
 c6 87 2c              ldi16	r6, 0x2c87
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 23                 ldi8	r5, 0x23
 d7 36                 sys	draw_textfv_p
 ed 90 30              ld16	r4, [r0+16]
 f4 40                 stsp16	[sp+0x0], r4
 ed 90 32              ld16	r4, [r0+18]
 f4 48                 stsp16	[sp+0x2], r4
 c6 97 2c              ldi16	r6, 0x2c97
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 29                 ldi8	r5, 0x29
 d7 36                 sys	draw_textfv_p
 ed 90 34              ld16	r4, [r0+20]
 f4 40                 stsp16	[sp+0x0], r4
 ed 90 36              ld16	r4, [r0+22]
 f4 48                 stsp16	[sp+0x2], r4
 c6 a7 2c              ldi16	r6, 0x2ca7
 c3 00                 ldi8	r7, 0x0
 a0                    xor	r4, r4
 c1 2f                 ldi8	r5, 0x2f
 d7 36                 sys	draw_textfv_p
 ed 80 26              ld8u	r4, [r0+6]
 f4 40                 stsp16	[sp+0x0], r4
 c6 b7 2c              ldi16	r6, 0x2cb7
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
 e1 7d 05              call16	open_section
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
 da fd 00              breq16	0xfd <L5>
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
 da 94 00              breq16	0x94 <L5>
 08                    mov	r6, r4
 0d                    mov	r7, r5
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
 e1 40 05              call16	read_uleb128
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
 da a8 fd              breq16	-0x258 <L0>
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 c0 0c                 ldi8	r4, 0xc
 a5                    xor	r5, r5
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
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
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f0 37 20              ldsp16	r7, [sp+0x20]
 e1 69 06              call16	__avm_mulsi3
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
 d2 c1                 brult8	-0x3f <L6>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 da 4e fd              breq16	-0x2b2 <L0>
 c2 0c                 ldi8	r6, 0xc
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 33 06              call16	__avm_mulsi3
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
 da 7e fc              breq16	-0x382 <L0>
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
 dc 32 fc              brult16	-0x3ce <L0>
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
 dd 0d fc              bruge16	-0x3f3 <L0>
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
 e0 b0 fb              jmp16	-1104 <L0>
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
 e1 ea 02              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 da 8e fb              breq16	-0x472 <L0>
 d6 fe                 adjsp	-0x2
 f0 14 5c              leasp	r4, 0x5c
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 24              leasp	r4, 0x24
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 e1 ce 02              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 da 72 fb              breq16	-0x48e <L0>
 f0 30 5a              ldsp16	r0, [sp+0x5a]
 f0 31 5c              ldsp16	r1, [sp+0x5c]
 f0 34 34              ldsp16	r4, [sp+0x34]
 f0 35 36              ldsp16	r5, [sp+0x36]
 f0 38 14              stsp16	[sp+0x14], r0
 f0 69 08              cmp32	q0, q2
 dd 5d fb              bruge16	-0x4a3 <L0>
 d6 fe                 adjsp	-0x2
 f0 14 2a              leasp	r4, 0x2a
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 24              leasp	r4, 0x24
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 e1 9d 02              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 da 41 fb              breq16	-0x4bf <L0>
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
 e1 3d 02              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 da e1 fa              breq16	-0x51f <L0>
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
 da bf fa              breq16	-0x541 <L0>
 d6 fe                 adjsp	-0x2
 f0 14 5c              leasp	r4, 0x5c
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 24              leasp	r4, 0x24
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 e1 ff 01              call16	read_uleb128
 d6 02                 adjsp	0x2
 f1 74                 zext8	r4
 f4 a4                 tst8	r4
 da a3 fa              breq16	-0x55d <L0>
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
 da 79 fa              breq16	-0x587 <L0>
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
 da 57 fa              breq16	-0x5a9 <L0>
<L20>:
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 32              ldsp16	r5, [sp+0x32]
 31                    cmp	r4, r5
 dd 4d fa              bruge16	-0x5b3 <L0>
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
 e1 68 01              call16	read_uleb128
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
 e0 dd f9              jmp16	-1571 <L0>
<L22>:
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 ca 03                 addi.s8	r6, 0x3
 f7 54                 st16	[r6+], r4
 59                    st8	[r6], r5
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 da cb f9              breq16	-0x635 <L0>
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 c8 06                 addi.s8	r4, 0x6
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 6b c8              st32	[r4], q3
 e0 bc f9              jmp16	-1604 <L0>

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
 e1 98 01              call16	__avm_umulhisi3
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

<__avm_ashlsi3>:
 f6 2f                 tst16	r7
 d1 23                 brne8	0x23 <L1>
 ce 10                 cmpi.s8	r6, 0x10
 d8 12                 bruge8	0x12 <L0>
 f6 2e                 tst16	r6
 d0 1f                 breq8	0x1f <L2>
 0c                    mov	r7, r4
 fa 06                 shl16v	r5, r6
 fa 02                 shl16v	r4, r6
 f6 4e                 neg16	r6
 ca 10                 addi.s8	r6, 0x10
 fa 1e                 lsr16v	r7, r6
 97                    or	r5, r7
 d4 11                 jmp8	0x11 <L2>
<L0>:
 ce 20                 cmpi.s8	r6, 0x20
 d8 09                 bruge8	0x9 <L1>
 ca f0                 addi.s8	r6, -0x10
 fa 02                 shl16v	r4, r6
 04                    mov	r5, r4
 c0 00                 ldi8	r4, 0x0
 d4 04                 jmp8	0x4 <L2>
<L1>:
 c0 00                 ldi8	r4, 0x0
 c1 00                 ldi8	r5, 0x0
<L2>:
 ef                    ret

<__avm_lshrsi3>:
 f6 2f                 tst16	r7
 d1 23                 brne8	0x23 <L1>
 ce 10                 cmpi.s8	r6, 0x10
 d8 12                 bruge8	0x12 <L0>
 f6 2e                 tst16	r6
 d0 1f                 breq8	0x1f <L2>
 0d                    mov	r7, r5
 fa 12                 lsr16v	r4, r6
 fa 16                 lsr16v	r5, r6
 f6 4e                 neg16	r6
 ca 10                 addi.s8	r6, 0x10
 fa 0e                 shl16v	r7, r6
 93                    or	r4, r7
 d4 11                 jmp8	0x11 <L2>
<L0>:
 ce 20                 cmpi.s8	r6, 0x20
 d8 09                 bruge8	0x9 <L1>
 ca f0                 addi.s8	r6, -0x10
 fa 16                 lsr16v	r5, r6
 01                    mov	r4, r5
 c1 00                 ldi8	r5, 0x0
 d4 04                 jmp8	0x4 <L2>
<L1>:
 c0 00                 ldi8	r4, 0x0
 c1 00                 ldi8	r5, 0x0
<L2>:
 ef                    ret

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

<__avm_udivmodsi4>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f2 66                 mov32	q1, q2
 f0 34 17              ldsp16	r4, [sp+0x17]
 f4 40                 stsp16	[sp+0x0], r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d0 49                 breq8	0x49 <L1>
 c0 20                 ldi8	r4, 0x20
 f4 68                 stsp16	[sp+0xa], r4
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f2 68                 mov32	q2, q0
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
<L0>:
 f0 3a 06              stsp16	[sp+0x6], r2
 f0 3b 08              stsp16	[sp+0x8], r3
 f7 6a                 add32	q2, q2
 f1 2b                 mov	r6, r3
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 98                    or	r6, r4
 02                    mov	r4, r6
 f0 32 02              ldsp16	r2, [sp+0x2]
 f0 33 04              ldsp16	r3, [sp+0x4]
 f0 69 84              cmp32	q2, q1
 aa                    xor	r6, r6
 fc 72                 cmov.uge	r6, r2
 fc 7b                 cmov.uge	r7, r3
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 f7 7b                 sub32	q2, q3
 f8 1e                 cset.uge	r6
 f7 60                 add32	q0, q0
 f9 c1                 or	r6, r0
 f7 65                 add32	q1, q1
 f1 06                 mov	r0, r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 b6                 dec16	r6
 f4 6a                 stsp16	[sp+0xa], r6
 f6 2e                 tst16	r6
 d1 c7                 brne8	-0x39 <L0>
 d4 0a                 jmp8	0xa <L2>
<L1>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f2 69                 mov32	q2, q1
<L2>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f0 6b 8c              st32	[r6], q2
 f2 68                 mov32	q2, q0
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_udivsi3>:
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 d6 fe                 adjsp	-0x2
 f0 10 02              leasp	r0, 0x2
 f0 38 00              stsp16	[sp+0x0], r0
 e1 7d ff              call16	__avm_udivmodsi4
 d6 02                 adjsp	0x2
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 ef                    ret
