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
 c4 ff ff              ldi16	r4, 0xffff
 f2 39                 sub	r1, r1
 d7 01                 sys	debug_break
 f0 00 80              ldi8	r0, 0x80
 f0 06 00 01           ldi16	r2, 0x100
 f1 18                 mov	r3, r0
 f0 6c e5              ld8u	r7, [r2+]
 fa 68                 lsl16i	r7, 0x8
 ac                    xor	r7, r4
 0b                    mov	r6, r7
 1a                    add	r6, r6
 c5 21 10              ldi16	r5, 0x1021
 02                    mov	r4, r6
 a1                    xor	r4, r5
 f6 2f                 tst16	r7
 fd 34                 cmov.slt	r6, r4
 02                    mov	r4, r6
 10                    add	r4, r4
 0c                    mov	r7, r4
 ad                    xor	r7, r5
 f6 2e                 tst16	r6
 fd 27                 cmov.slt	r4, r7
 08                    mov	r6, r4
 1a                    add	r6, r6
 0e                    mov	r7, r6
 ad                    xor	r7, r5
 f6 2c                 tst16	r4
 fd 37                 cmov.slt	r6, r7
 02                    mov	r4, r6
 10                    add	r4, r4
 0c                    mov	r7, r4
 ad                    xor	r7, r5
 f6 2e                 tst16	r6
 fd 27                 cmov.slt	r4, r7
 08                    mov	r6, r4
 1a                    add	r6, r6
 0e                    mov	r7, r6
 ad                    xor	r7, r5
 f6 2c                 tst16	r4
 fd 37                 cmov.slt	r6, r7
 02                    mov	r4, r6
 10                    add	r4, r4
 0c                    mov	r7, r4
 ad                    xor	r7, r5
 f6 2e                 tst16	r6
 fd 27                 cmov.slt	r4, r7
 08                    mov	r6, r4
 1a                    add	r6, r6
 0e                    mov	r7, r6
 ad                    xor	r7, r5
 f6 2c                 tst16	r4
 fd 37                 cmov.slt	r6, r7
 02                    mov	r4, r6
 10                    add	r4, r4
 a4                    xor	r5, r4
 f6 2e                 tst16	r6
 fd 25                 cmov.slt	r4, r5
 f4 b3                 dec16	r3
 f6 2b                 tst16	r3
 d1 b2                 brne8	avm_test_main+37
 f4 a9                 inc16	r1
 f1 25                 mov	r5, r1
 f1 75                 zext8	r5
 cd 08                 cmpi.s8	r5, 0x8
 d1 a2                 brne8	avm_test_main+31
 f0 5c 80 01           stm16	[0x180], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

