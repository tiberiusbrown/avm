
C:/Users/Brown/Documents/GitHub/avm/build/projects/ardurogue2/ardurogue2.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0.c
00000000 l    df *ABS*	00000000 main.cpp
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000004 _start
00000104 g     F .text	00000002 main
00000106 g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 02                 call8	main
 d5 02                 call8	avm_halt

<main>:
 d4 fe                 jmp8	main

<avm_halt>:
 d4 fe                 jmp8	avm_halt
