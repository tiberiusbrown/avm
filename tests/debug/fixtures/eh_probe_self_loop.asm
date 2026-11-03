; Non-terminating boundary fixture for avm_eh_stack_probe. The guest never reaches
; SYS debug_break. It sets a legal VM stack pointer, then repeats one two-byte JMP8 to
; itself. Each execution of that jump begins a guest instruction boundary with identical
; guest state (VM_PC, SP, and registers), and the probe must report every one of them.
; The fixture lives outside tests/asm so the terminating matrix does not run it.

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ldi16 r4, 0x09c0
    setsp r4

.globl loop
.type loop, @function
loop:
    jmp8 loop
