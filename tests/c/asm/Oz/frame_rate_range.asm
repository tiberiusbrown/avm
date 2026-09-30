
frame_rate_range.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 frame_rate_range.c
00000000 l    df *ABS*	00000000 avm.c
00000101 l     O .data	00000001 just_rendered
00000100 l     O .data	00000001 frame_duration_ms
00000102 l     O .data	00000001 frame_start
00000000 l    df *ABS*	00000000 runtime.c
0000039e l       .init_array	00000000 .hidden __init_array_end
0000039e l       .init_array	00000000 .hidden __init_array_start
0000039e l       .fini_array	00000000 .hidden __fini_array_start
0000039e l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000076 avm_test_main
0000039c g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
0000034d g     F .text	0000001c avm_set_frame_rate
00000369 g     F .text	00000033 avm_next_frame

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 d1 00              call16	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 d5 57                 call8	avm_run_destructors
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 7e 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 9e 03              ldi16	r4, 0x39e
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 9e 03              ldi16	r6, 0x39e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 9e 03           ldi16	r0, 0x39e
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 9e 03           ldi16	r2, 0x39e
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	avm_run_constructors+48
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_run_destructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+23
 e1 81 fd              call16	-639
 c4 9e 03              ldi16	r4, 0x39e
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 9e 03              ldi16	r6, 0x39e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 9e 03           ldi16	r2, 0x39e
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 9e 03           ldi16	r0, 0x39e
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	avm_run_destructors+68
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+104
 e1 30 fd              call16	-720
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
 d6 fe                 adjsp	-0x2
 a5                    xor	r5, r5
 f0 00 01              ldi8	r0, 0x1
 f0 03 ef              ldi8	r3, 0xef
 f0 02 02              ldi8	r2, 0x2
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 04                 cmpi.s8	r4, 0x4
 d0 52                 breq8	avm_test_main+105
 f4 41                 stsp16	[sp+0x0], r5
 d5 5b                 call8	avm_set_frame_rate
 d5 75                 call8	avm_next_frame
 f9 80                 and	r4, r0
 f4 a4                 tst8	r4
 d1 49                 brne8	avm_test_main+108
 d7 02                 sys	millis
 f1 0c                 mov	r1, r4
 d7 02                 sys	millis
 f2 51                 sub	r4, r1
 f5 1c                 cmp	r3, r4
 d2 04                 brult8	avm_test_main+51
 d7 2a                 sys	idle
 d4 f4                 jmp8	avm_test_main+39
 d5 5d                 call8	avm_next_frame
 f9 80                 and	r4, r0
 f4 a4                 tst8	r4
 d1 35                 brne8	avm_test_main+112
 d7 02                 sys	millis
 f2 51                 sub	r4, r1
 c5 03 01              ldi16	r5, 0x103
 34                    cmp	r5, r4
 d2 13                 brult8	avm_test_main+88
 d5 4b                 call8	avm_next_frame
 c1 01                 ldi8	r5, 0x1
 84                    and	r5, r4
 f4 a5                 tst8	r5
 d1 04                 brne8	avm_test_main+82
 d7 2a                 sys	idle
 d4 e9                 jmp8	avm_test_main+59
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 d4 b8                 jmp8	avm_test_main+16
 c1 03                 ldi8	r5, 0x3
 f1 05                 mov	r0, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f6 31                 mul8	r4, r5
 f2 20                 add	r4, r0
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 a0                    xor	r4, r4
 d4 f6                 jmp8	avm_test_main+98
 c1 03                 ldi8	r5, 0x3
 d4 ec                 jmp8	avm_test_main+92
 f1 02                 mov	r0, r2
 c1 03                 ldi8	r5, 0x3
 d4 e6                 jmp8	avm_test_main+92

<avm_set_frame_rate>:
 c1 01                 ldi8	r5, 0x1
 f0 4d 01 01           stm8	[0x101], r5
 c1 04                 ldi8	r5, 0x4
 cc 05                 cmpi.s8	r4, 0x5
 fc 6c                 cmov.uge	r5, r4
 c4 e8 03              ldi16	r4, 0x3e8
 ec 25                 udiv16	r4, r5
 f0 4c 00 01           stm8	[0x100], r4
 d7 02                 sys	millis
 f0 4c 02 01           stm8	[0x102], r4
 ef                    ret

<avm_next_frame>:
 f0 44 01 01           ldm8u	r4, [0x101]
 cc 01                 cmpi.s8	r4, 0x1
 d1 03                 brne8	avm_next_frame+11
 a0                    xor	r4, r4
 d4 23                 jmp8	avm_next_frame+46
 d7 02                 sys	millis
 f0 46 02 01           ldm8u	r6, [0x102]
 04                    mov	r5, r4
 26                    sub	r5, r6
 0d                    mov	r7, r5
 f1 77                 zext8	r7
 f0 46 00 01           ldm8u	r6, [0x100]
 3e                    cmp	r7, r6
 d8 0b                 bruge8	avm_next_frame+40
 a0                    xor	r4, r4
 f4 ad                 inc16	r5
 f1 75                 zext8	r5
 36                    cmp	r5, r6
 d8 0d                 bruge8	avm_next_frame+50
 d7 2a                 sys	idle
 ef                    ret
 f0 4c 02 01           stm8	[0x102], r4
 c0 01                 ldi8	r4, 0x1
 f0 4c 01 01           stm8	[0x101], r4
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
