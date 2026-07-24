
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/small_memops.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 small_memops.c
00000100 l     O .data	00000020 source
00000120 l     O .data	00000020 destination
00000140 l     O .data	00000002 small_memops_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	000000f0 avm_test_main
00000306 g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 01                    mov	r4, r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 f0 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ec                 adjsp	-0x14
 c4 00 01              ldi16	r4, 0x100
 c1 03                 ldi8	r5, 0x3
 c2 20                 ldi8	r6, 0x20
 f6 05                 st8	[r4+], r5
 c9 11                 addi.s8	r5, 0x11
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f6                 brne8	avm_test_main+13
 f2 30                 sub	r0, r0
 d7 01                 sys	debug_break
 c0 20                 ldi8	r4, 0x20
 f1 24                 mov	r5, r0
 f0 3d 10              stsp16	[sp+0x10], r5
 08                    mov	r6, r4
 f4 7a                 stsp16	[sp+0xe], r6
 c5 03 01              ldi16	r5, 0x103
 f4 71                 stsp16	[sp+0xc], r5
 c5 05 01              ldi16	r5, 0x105
 f4 69                 stsp16	[sp+0xa], r5
 c5 07 01              ldi16	r5, 0x107
 f4 61                 stsp16	[sp+0x8], r5
 c5 09 01              ldi16	r5, 0x109
 f4 59                 stsp16	[sp+0x6], r5
 c5 0b 01              ldi16	r5, 0x10b
 f4 51                 stsp16	[sp+0x4], r5
 f0 05 24 01           ldi16	r1, 0x124
 f1 25                 mov	r5, r1
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 32 01           ldi16	r2, 0x132
 f1 26                 mov	r5, r2
 f4 41                 stsp16	[sp+0x0], r5
 f1 18                 mov	r3, r0
 c7 20 01              ldi16	r7, 0x120
 03                    mov	r4, r7
 f0 35 10              ldsp16	r5, [sp+0x10]
 f4 3a                 ldsp16	r6, [sp+0xe]
 d7 11                 sys	memset
 c2 01                 ldi8	r6, 0x1
 c4 21 01              ldi16	r4, 0x121
 f0 3c 12              stsp16	[sp+0x12], r4
 f4 31                 ldsp16	r5, [sp+0xc]
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 0f                 sys	memcpy
 c2 02                 ldi8	r6, 0x2
 c4 22 01              ldi16	r4, 0x122
 f0 3c 12              stsp16	[sp+0x12], r4
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 0f                 sys	memcpy
 c2 03                 ldi8	r6, 0x3
 f1 21                 mov	r4, r1
 f4 21                 ldsp16	r5, [sp+0x8]
 d7 0f                 sys	memcpy
 c2 04                 ldi8	r6, 0x4
 c4 28 01              ldi16	r4, 0x128
 f0 3c 12              stsp16	[sp+0x12], r4
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 0f                 sys	memcpy
 c2 05                 ldi8	r6, 0x5
 c4 2c 01              ldi16	r4, 0x12c
 f0 3c 12              stsp16	[sp+0x12], r4
 f4 11                 ldsp16	r5, [sp+0x4]
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 0f                 sys	memcpy
 c2 08                 ldi8	r6, 0x8
 c1 5a                 ldi8	r5, 0x5a
 f1 22                 mov	r4, r2
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 11                 sys	memset
 c2 07                 ldi8	r6, 0x7
 c4 27 01              ldi16	r4, 0x127
 f0 3c 12              stsp16	[sp+0x12], r4
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 12                 sys	memmove
 c2 0c                 ldi8	r6, 0xc
 c4 34 01              ldi16	r4, 0x134
 f0 3c 12              stsp16	[sp+0x12], r4
 f4 01                 ldsp16	r5, [sp+0x0]
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 12                 sys	memmove
 c2 20                 ldi8	r6, 0x20
 f7 1c                 ld8u	r4, [r7+]
 f2 1c                 add	r3, r4
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f6                 brne8	avm_test_main+205
 f4 a8                 inc16	r0
 f1 20                 mov	r4, r0
 f1 74                 zext8	r4
 cc 40                 cmpi.s8	r4, 0x40
 db 6e ff              brne16	avm_test_main+80
 f0 5b 40 01           stm16	[0x140], r3
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 14                 adjsp	0x14
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
