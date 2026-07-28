
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/idle_random.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 idle_random.c
00000187 l     F .text	00000003 call_millis
0000018a l     F .text	00000003 call_idle
0000018d l     F .text	00000003 call_generate_random_seed
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000015 _start
00000115 g     F .text	00000072 avm_test_main
00000190 g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 13                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 01                    mov	r4, r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 d5 7b                 call8	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 d5 6a                 call8	call_millis
 f1 04                 mov	r0, r4
 d5 69                 call8	call_idle
 d5 64                 call8	call_millis
 f1 0c                 mov	r1, r4
 d5 66                 call8	call_generate_random_seed
 f1 14                 mov	r2, r4
 d5 62                 call8	call_generate_random_seed
 f1 1c                 mov	r3, r4
 f9 6a                 xor	r3, r2
 d5 5c                 call8	call_generate_random_seed
 f1 14                 mov	r2, r4
 f9 4e                 xor	r2, r3
 f5 08                 cmp	r1, r0
 f8 09                 cset.ne	r1
 f8 00                 cset.eq	r0
 d5 50                 call8	call_generate_random_seed
 f9 8a                 xor	r4, r2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 c0 49                 ldi8	r4, 0x49
 d7 00                 sys	debug_putc
 c0 57                 ldi8	r4, 0x57
 d7 00                 sys	debug_putc
 c1 30                 ldi8	r5, 0x30
 f9 a5                 or	r5, r1
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 52                 ldi8	r4, 0x52
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 34                 ldi8	r4, 0x34
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<call_millis>:
 d7 02                 sys	millis
 ef                    ret

<call_idle>:
 d7 2a                 sys	idle
 ef                    ret

<call_generate_random_seed>:
 d7 2b                 sys	generate_random_seed
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
