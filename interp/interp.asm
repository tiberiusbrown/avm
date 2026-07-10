;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Interpreter
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Architecture Notes (See docs/arch.md for more info)

; Memory Layout
;
;    0x100–0x4FF    1024 bytes     Static globals
;    0x500-0x8FF    1024 bytes     Display framebuffer
;    0x900-0x9FF    256 bytes      VM Stack

; Fixed interpreter state
;
;    r0-r1      Dispatch multiply result / native MUL result / scratch
;    r2         Constant zero; SPI dummy-transmit value
;    r3         Scratch
;    r4         Scratch
;    r5         VM FLAGS
;    r6         Current bytecode opcode / operand scratch
;    r7         Constant: dispatch-slot stride in AVR words
;
; VM register file
;
;    r8-r9      VM Register r4
;    r10-r11    VM Register r5
;    r12-r13    VM Register r6
;    r14-r15    VM Register r7
;
;    r16-r17    VM Register r0   ; compact
;    r18-r19    VM Register r1   ; compact
;    r20-r21    VM Register r2   ; compact
;    r22-r23    VM Register r3   ; compact
;
; Addressing and dispatch
;
;    r24-r25    Logical PC within current bank
;    r26-r27    X: general address scratch
;    r28-r29    Y: VM stack pointer
;    r30-r31    Z: dispatch target / address scratch
;
; Non-GPR architectural state
;
;    GPIOR1     Code Bank (CB)
;    GPIOR2     Program Bank (PB)

#define INSTR_ALIGN 6

#define ZERO          r2
#define C_INSTR_ALIGN r7

#define VM_PC  r24
#define VM_PCL r24
#define VM_PCH r25

#define VM_SP  r28
#define VM_SPL r28
#define VM_SPH r29

#include "device.h"

.section .vectors,"ax",@progbits
.global __vectors
.type __vectors, @function

; ATmega32U4 interrupt vector table.
; Each vector is one 16-bit RJMP instruction.  The table contains the reset
; vector followed by the 31 device interrupt vectors, in datasheet order.
__vectors:
    jmp reset_handler       ;  0 RESET
    jmp default_isr         ;  1 INT0
    jmp default_isr         ;  2 INT1
    jmp default_isr         ;  3 INT2
    jmp default_isr         ;  4 INT3
    jmp default_isr         ;  5 INT6
    jmp default_isr         ;  6 PCINT0
    jmp default_isr         ;  7 USB GENERAL
    jmp default_isr         ;  8 USB ENDPOINT/COM
    jmp default_isr         ;  9 WDT
    jmp default_isr         ; 10 TIMER1 CAPTURE
    jmp default_isr         ; 11 TIMER1 COMPA
    jmp default_isr         ; 12 TIMER1 COMPB
    jmp default_isr         ; 13 TIMER1 COMPC
    jmp default_isr         ; 14 TIMER1 OVERFLOW
    jmp default_isr         ; 15 TIMER0 COMPA
    jmp default_isr         ; 16 TIMER0 COMPB
    jmp default_isr         ; 17 TIMER0 OVERFLOW
    jmp default_isr         ; 18 SPI
    jmp default_isr         ; 19 USART1 RX
    jmp default_isr         ; 20 USART1 UDRE
    jmp default_isr         ; 21 USART1 TX
    jmp default_isr         ; 22 ANALOG COMPARATOR
    jmp default_isr         ; 23 ADC
    jmp default_isr         ; 24 EEPROM READY
    jmp default_isr         ; 25 TIMER3 CAPTURE
    jmp default_isr         ; 26 TIMER3 COMPA
    jmp default_isr         ; 27 TIMER3 COMPB
    jmp default_isr         ; 28 TIMER3 COMPC
    jmp default_isr         ; 29 TIMER3 OVERFLOW
    jmp default_isr         ; 30 TWI
    jmp default_isr         ; 31 SPM READY

.size __vectors, .-__vectors

default_isr:
    rjmp default_isr

reset_handler:
    clr  ZERO
    ldi  r24, (1<<(INSTR_ALIGN-1))
    mov  C_INSTR_ALIGN, r24
1:  rjmp 1b

.section .text
.align 8

.macro dispatch
    in   r6, SPDR
    out  SPDR, r2
    adiw VM_PC, 1
    mul  r6, C_INSTR_ALIGN
    movw r30, r0
    inc  r30
    ijmp
.endm

abvm_interp:

; 00 : MOV c0, c0

    dispatch
    .align INSTR_ALIGN
