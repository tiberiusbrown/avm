
global_lifetime.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 global_lifetime.cpp
000002d7 l     F .text	0000000b early_constructor()
00000100 l     O .data	00000002 stage
000002e2 l     F .text	00000010 late_destructor()
000002f2 l     F .text	00000027 __dtor__ZL6second
00000319 l     F .text	00000027 __dtor__ZL6object
00000349 l     F .text	00000027 _GLOBAL__I_000200
00000370 l     F .text	00000027 _GLOBAL__I_000300
00000000 l    df *ABS*	00000000 runtime.c
000003a2 l       .init_array	00000000 .hidden __init_array_end
00000399 l       .init_array	00000000 .hidden __init_array_start
000003a2 l       .fini_array	00000000 .hidden __fini_array_start
000003ab l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
00000340 g     F .text	00000009 avm_test_main
00000397 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000000  w      *UND*	00000000 __avm_before_global_dtor
00000000  w      *UND*	00000000 __avm_note_global_ctor

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 3a 01              call16	avm_test_main
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
 e1 79 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 a2 03              ldi16	r4, 0x3a2
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 99 03              ldi16	r6, 0x399
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 99 03           ldi16	r0, 0x399
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 a2 03           ldi16	r2, 0x3a2
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
 c4 a2 03              ldi16	r4, 0x3a2
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 ab 03              ldi16	r6, 0x3ab
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 ab 03           ldi16	r2, 0x3ab
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 a2 03           ldi16	r0, 0x3a2
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

<early_constructor()>:
 c0 01                 ldi8	r4, 0x1
 f0 5c 00 01           stm16	[0x100], r4
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 ef                    ret

<late_destructor()>:
 f0 54 00 01           ldm16	r4, [0x100]
 c1 58                 ldi8	r5, 0x58
 c2 5a                 ldi8	r6, 0x5a
 cc 05                 cmpi.s8	r4, 0x5
 01                    mov	r4, r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 ef                    ret

<__dtor__ZL6second>:
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	__dtor__ZL6second+17
 e1 fd fc              call16	-771
 f0 54 00 01           ldm16	r4, [0x100]
 c1 58                 ldi8	r5, 0x58
 c2 45                 ldi8	r6, 0x45
 cc 03                 cmpi.s8	r4, 0x3
 01                    mov	r4, r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 04                 ldi8	r4, 0x4
 f0 5c 00 01           stm16	[0x100], r4
 ef                    ret

<__dtor__ZL6object>:
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	__dtor__ZL6object+17
 e1 d6 fc              call16	-810
 f0 54 00 01           ldm16	r4, [0x100]
 c1 58                 ldi8	r5, 0x58
 c2 44                 ldi8	r6, 0x44
 cc 04                 cmpi.s8	r4, 0x4
 01                    mov	r4, r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 05                 ldi8	r4, 0x5
 f0 5c 00 01           stm16	[0x100], r4
 ef                    ret

<avm_test_main>:
 f0 54 00 01           ldm16	r4, [0x100]
 cc 03                 cmpi.s8	r4, 0x3
 f8 0c                 cset.ne	r4
 ef                    ret

<_GLOBAL__I_000200>:
 f0 54 00 01           ldm16	r4, [0x100]
 c5 ff ff              ldi16	r5, 0xffff
 c2 02                 ldi8	r6, 0x2
 cc 01                 cmpi.s8	r4, 0x1
 fb 2e                 cmov.eq	r5, r6
 f0 5d 00 01           stm16	[0x100], r5
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	_GLOBAL__I_000200+38
 e1 91 fc              call16	-879
 ef                    ret

<_GLOBAL__I_000300>:
 f0 54 00 01           ldm16	r4, [0x100]
 c5 ff ff              ldi16	r5, 0xffff
 c2 03                 ldi8	r6, 0x3
 cc 02                 cmpi.s8	r4, 0x2
 fb 2e                 cmov.eq	r5, r6
 f0 5d 00 01           stm16	[0x100], r5
 c0 42                 ldi8	r4, 0x42
 d7 00                 sys	debug_putc
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	_GLOBAL__I_000300+38
 e1 6a fc              call16	-918
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
