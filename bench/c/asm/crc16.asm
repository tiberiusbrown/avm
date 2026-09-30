
crc16.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000041e l     F .text	00000044 avm_run_constructors
00000462 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 crc16.c
00000100 l     O .data	00000080 data
00000190 l     O .data	00000200 .L.crctable
00000180 l     O .data	00000002 crc_result
00000000 l    df *ABS*	00000000 runtime.c
0000051d l       .init_array	00000000 .hidden __init_array_end
0000051d l       .init_array	00000000 .hidden __init_array_start
0000051d l       .fini_array	00000000 .hidden __fini_array_start
0000051d l       .fini_array	00000000 .hidden __fini_array_end
00000400 g     F .text	0000001e _start
000004c7 g     F .text	00000054 avm_test_main
0000051b g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 c1 00              call16	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 d5 51                 call8	avm_run_destructors
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 fd 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 1d 05              ldi16	r4, 0x51d
 c1 00                 ldi8	r5, 0x0
 c6 1d 05              ldi16	r6, 0x51d
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	avm_run_constructors+61
 f0 04 1d 05           ldi16	r0, 0x51d
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 1d 05           ldi16	r2, 0x51d
 f0 03 00              ldi8	r3, 0x0
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	avm_run_constructors+42
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
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+21
 e1 89 fb              call16	-1143
 c4 1d 05              ldi16	r4, 0x51d
 c1 00                 ldi8	r5, 0x0
 c6 1d 05              ldi16	r6, 0x51d
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	avm_run_destructors+79
 f0 06 1d 05           ldi16	r2, 0x51d
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 1d 05           ldi16	r0, 0x51d
 f0 01 00              ldi8	r1, 0x0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	avm_run_destructors+60
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+94
 e1 40 fb              call16	-1216
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
 c0 80                 ldi8	r4, 0x80
 c1 11                 ldi8	r5, 0x11
 c6 00 01              ldi16	r6, 0x100
 f6 15                 st8	[r6+], r5
 c9 1d                 addi.s8	r5, 0x1d
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f6                 brne8	avm_test_main+11
 c7 ff ff              ldi16	r7, 0xffff
 f2 30                 sub	r0, r0
 d7 01                 sys	debug_break
 f0 06 00 01           ldi16	r2, 0x100
 f0 07 90 01           ldi16	r3, 0x190
 f1 08                 mov	r1, r0
 f1 28                 mov	r6, r0
 06                    mov	r5, r6
 f2 26                 add	r5, r2
 45                    ld8u	r5, [r5]
 03                    mov	r4, r7
 fa 78                 lsr16i	r4, 0x8
 a1                    xor	r4, r5
 10                    add	r4, r4
 f2 23                 add	r4, r3
 60                    ld16	r4, [r4]
 fa 68                 lsl16i	r7, 0x8
 ac                    xor	r7, r4
 f4 ae                 inc16	r6
 c0 80                 ldi8	r4, 0x80
 38                    cmp	r6, r4
 d1 ea                 brne8	avm_test_main+40
 f4 a9                 inc16	r1
 f1 25                 mov	r5, r1
 f1 75                 zext8	r5
 cd 08                 cmpi.s8	r5, 0x8
 d1 de                 brne8	avm_test_main+38
 f0 5f 80 01           stm16	[0x180], r7
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
