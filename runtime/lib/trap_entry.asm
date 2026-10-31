; Default fatal-trap entry. The interpreter jumps here without pushing a
; return record, and the original guest stack is still untouched on entry.
.section .text.__avm_trap_entry,"ax",@progbits

.globl __avm_trap_entry
.type __avm_trap_entry, @function
__avm_trap_entry:
    ; Preserve the complete original VM stack in static RAM.
    ; No guest stack access happens before SETSP.
    ldi16 r4, 0x0100
    ldi16 r5, 0x0900
    ldi16 r6, 256
    sys memcpy

    ; Establish a fresh 256-byte reporter stack.
    ldi16 r7, 0x0a00
    setsp r7

    ; The context pointer is the reporter's first argument.
    ldi16 r4, 0x0200

    ; Nonreturning tail transfer: no return record.
    jmp __avm_trap_report
.size __avm_trap_entry, .-__avm_trap_entry
    .pushsection .stack_sizes,"o",@progbits,.text.__avm_trap_entry
    .3byte __avm_trap_entry
    .uleb128 0
    .popsection
    .pushsection .avm.stackcalls,"o",@progbits,.text.__avm_trap_entry
    .3byte __avm_trap_entry
    .3byte 0
    .short 0
    .byte 8
    .popsection
    .pushsection .avm.stackcalls,"o",@progbits,.text.__avm_trap_entry
    .3byte __avm_trap_entry
    .3byte __avm_trap_report
    .short 0
    .byte 2
    .popsection
