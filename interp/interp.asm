;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Interpreter
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; SRAM:
;;     0x0100–0x04FF  globals
;;     0x0500–0x08FF  framebuffer
;;     0x0900–0x09FF  VM stack
;;     0x0A00-0x0A03  FX image/save page
;;     0x0A04-0x0A05  requested save size
;;     0x0A06         startup flags
;;     0x0A07–0x0A0A  millisecond counter (little-endian uint32)
;;     0x0A0B–0x0AFF  interpreter-private

#define data_globals    0x0100
#define data_display    0x0500
#define data_stack      0x0900
#define data_page_data      0x0A00
#define data_page_save      (data_page_data+2)
#define data_save_size      (data_page_save+2)
#define data_startup_flags  (data_save_size+2)
#define data_millis         (data_startup_flags+1)

#define STARTUP_SAVE_PAGE_VALID  0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Hardware configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Select at most one complete device preset on the assembler command line:
;
;   -DAVM_DEVICE_ARDUBOY_FX    Arduboy FX; FX chip select is SDA/PD1.
;   -DAVM_DEVICE_ARDUBOY_MINI  Arduboy Mini; FX chip select is HWB/PE2.
;   -DAVM_DEVICE_ARDUBOY_FXC   Arduboy FX-C; FX chip select is HWB/PE2.
;
; AVM_DEVICE_ARDUBOY_FX is the default so existing builds retain their current
; flash wiring. Presets provide defaults only: any individual AVM_* definition
; supplied by the build overrides the corresponding preset/default value.
;
; Supported SPI display controller selections (choose at most one):
;
;   -DAVM_DISPLAY_SSD1306      Default for all standard device presets.
;   -DAVM_DISPLAY_SSD1309
;   -DAVM_DISPLAY_SH1106
;   -DAVM_OLED_CONTRAST=value  Default: 0xCF.
;
; Arduboy2-compatible OLED_SSD1306, OLED_SSD1309, OLED_SH1106, and
; OLED_CONTRAST definitions are also accepted. I2C display definitions are
; intentionally rejected; this interpreter startup supports SPI displays only.
;
; Pin overrides are triples consisting of PORT, DDR, and bit definitions:
;
;   AVM_OLED_CS_PORT / AVM_OLED_CS_DDR / AVM_OLED_CS_BIT
;   AVM_OLED_DC_PORT / AVM_OLED_DC_DDR / AVM_OLED_DC_BIT
;   AVM_OLED_RST_PORT / AVM_OLED_RST_DDR / AVM_OLED_RST_BIT
;   AVM_FX_PORT / AVM_FX_DDR / AVM_FX_BIT
;   AVM_BUTTON_{LEFT,RIGHT,UP,DOWN,A,B}_{PORT,DDR,BIT}
;   AVM_LED_{RED,GREEN,BLUE,TX,RX}_{PORT,DDR,BIT}
;   AVM_RANDOM_SEED_PORT / AVM_RANDOM_SEED_DDR / AVM_RANDOM_SEED_BIT
;
; The hardware SPI pins are fixed by the ATmega32U4: PB1=SCK, PB2=MOSI, and
; PB3=MISO. Set AVM_INIT_RGB_LED or AVM_INIT_TX_RX_LEDS to 0 to omit those
; outputs. Set AVM_INIT_BUTTONS or AVM_INIT_RANDOM_SEED_ADC to 0 to omit those
; inputs. Startup resets and configures the OLED controller, but deliberately
; does not clear the framebuffer or OLED display RAM; the future display SYS
; service will own the first screen update.

#if !defined(AVM_DEVICE_ARDUBOY_FX) && \
    !defined(AVM_DEVICE_ARDUBOY_MINI) && \
    !defined(AVM_DEVICE_ARDUBOY_FXC)
#  define AVM_DEVICE_ARDUBOY_FX
#endif

#if (defined(AVM_DEVICE_ARDUBOY_FX) + \
     defined(AVM_DEVICE_ARDUBOY_MINI) + \
     defined(AVM_DEVICE_ARDUBOY_FXC)) > 1
#  error "Select only one AVM_DEVICE_* preset"
#endif

; Normalize Arduboy2/homemade display-selection names.
#if defined(OLED_SSD1306) && !defined(AVM_DISPLAY_SSD1306)
#  define AVM_DISPLAY_SSD1306
#endif
#if defined(OLED_SSD1309) && !defined(AVM_DISPLAY_SSD1309)
#  define AVM_DISPLAY_SSD1309
#endif
#if defined(OLED_SH1106) && !defined(AVM_DISPLAY_SH1106)
#  define AVM_DISPLAY_SH1106
#endif

#if defined(OLED_SSD1306_I2C) || defined(OLED_SSD1306_I2CX) || \
    defined(OLED_SH1106_I2C) || defined(AVM_DISPLAY_I2C)
#  error "I2C displays are not supported by interpreter startup"
#endif

#if !defined(AVM_DISPLAY_SSD1306) && \
    !defined(AVM_DISPLAY_SSD1309) && \
    !defined(AVM_DISPLAY_SH1106)
#  define AVM_DISPLAY_SSD1306
#endif

#if (defined(AVM_DISPLAY_SSD1306) + \
     defined(AVM_DISPLAY_SSD1309) + \
     defined(AVM_DISPLAY_SH1106)) > 1
#  error "Select only one SPI AVM_DISPLAY_* controller"
#endif

#ifndef AVM_OLED_CONTRAST
#  ifdef OLED_CONTRAST
#    define AVM_OLED_CONTRAST OLED_CONTRAST
#  else
#    define AVM_OLED_CONTRAST 0xCF
#  endif
#endif

#ifndef AVM_INIT_RGB_LED
#  define AVM_INIT_RGB_LED 1
#endif
#ifndef AVM_INIT_TX_RX_LEDS
#  define AVM_INIT_TX_RX_LEDS 1
#endif
#ifndef AVM_INIT_BUTTONS
#  define AVM_INIT_BUTTONS 1
#endif
#ifndef AVM_INIT_RANDOM_SEED_ADC
#  define AVM_INIT_RANDOM_SEED_ADC 1
#endif

; Common OLED wiring for the supported device presets.
#ifndef AVM_OLED_CS_PORT
#  define AVM_OLED_CS_PORT PORTD
#endif
#ifndef AVM_OLED_CS_DDR
#  define AVM_OLED_CS_DDR DDRD
#endif
#ifndef AVM_OLED_CS_BIT
#  define AVM_OLED_CS_BIT PORTD6
#endif

#ifndef AVM_OLED_DC_PORT
#  define AVM_OLED_DC_PORT PORTD
#endif
#ifndef AVM_OLED_DC_DDR
#  define AVM_OLED_DC_DDR DDRD
#endif
#ifndef AVM_OLED_DC_BIT
#  define AVM_OLED_DC_BIT PORTD4
#endif

#ifndef AVM_OLED_RST_PORT
#  define AVM_OLED_RST_PORT PORTD
#endif
#ifndef AVM_OLED_RST_DDR
#  define AVM_OLED_RST_DDR DDRD
#endif
#ifndef AVM_OLED_RST_BIT
#  define AVM_OLED_RST_BIT PORTD7
#endif

; Device-specific serial-flash chip select.
#ifndef AVM_FX_PORT
#  if defined(AVM_DEVICE_ARDUBOY_FX)
#    define AVM_FX_PORT PORTD
#  else
#    define AVM_FX_PORT PORTE
#  endif
#endif
#ifndef AVM_FX_DDR
#  if defined(AVM_DEVICE_ARDUBOY_FX)
#    define AVM_FX_DDR DDRD
#  else
#    define AVM_FX_DDR DDRE
#  endif
#endif
#ifndef AVM_FX_BIT
#  if defined(AVM_DEVICE_ARDUBOY_FX)
#    define AVM_FX_BIT PORTD1
#  else
#    define AVM_FX_BIT PORTE2
#  endif
#endif

; Common button wiring for the supported device presets.
#ifndef AVM_BUTTON_LEFT_PORT
#  define AVM_BUTTON_LEFT_PORT PORTF
#endif
#ifndef AVM_BUTTON_LEFT_DDR
#  define AVM_BUTTON_LEFT_DDR DDRF
#endif
#ifndef AVM_BUTTON_LEFT_BIT
#  define AVM_BUTTON_LEFT_BIT PORTF5
#endif
#ifndef AVM_BUTTON_RIGHT_PORT
#  define AVM_BUTTON_RIGHT_PORT PORTF
#endif
#ifndef AVM_BUTTON_RIGHT_DDR
#  define AVM_BUTTON_RIGHT_DDR DDRF
#endif
#ifndef AVM_BUTTON_RIGHT_BIT
#  define AVM_BUTTON_RIGHT_BIT PORTF6
#endif
#ifndef AVM_BUTTON_UP_PORT
#  define AVM_BUTTON_UP_PORT PORTF
#endif
#ifndef AVM_BUTTON_UP_DDR
#  define AVM_BUTTON_UP_DDR DDRF
#endif
#ifndef AVM_BUTTON_UP_BIT
#  define AVM_BUTTON_UP_BIT PORTF7
#endif
#ifndef AVM_BUTTON_DOWN_PORT
#  define AVM_BUTTON_DOWN_PORT PORTF
#endif
#ifndef AVM_BUTTON_DOWN_DDR
#  define AVM_BUTTON_DOWN_DDR DDRF
#endif
#ifndef AVM_BUTTON_DOWN_BIT
#  define AVM_BUTTON_DOWN_BIT PORTF4
#endif
#ifndef AVM_BUTTON_A_PORT
#  define AVM_BUTTON_A_PORT PORTE
#endif
#ifndef AVM_BUTTON_A_DDR
#  define AVM_BUTTON_A_DDR DDRE
#endif
#ifndef AVM_BUTTON_A_BIT
#  define AVM_BUTTON_A_BIT PORTE6
#endif
#ifndef AVM_BUTTON_B_PORT
#  define AVM_BUTTON_B_PORT PORTB
#endif
#ifndef AVM_BUTTON_B_DDR
#  define AVM_BUTTON_B_DDR DDRB
#endif
#ifndef AVM_BUTTON_B_BIT
#  define AVM_BUTTON_B_BIT PORTB4
#endif

; Standard active-low RGB and USB activity LEDs.
#ifndef AVM_LED_RED_PORT
#  define AVM_LED_RED_PORT PORTB
#endif
#ifndef AVM_LED_RED_DDR
#  define AVM_LED_RED_DDR DDRB
#endif
#ifndef AVM_LED_RED_BIT
#  define AVM_LED_RED_BIT PORTB6
#endif
#ifndef AVM_LED_GREEN_PORT
#  define AVM_LED_GREEN_PORT PORTB
#endif
#ifndef AVM_LED_GREEN_DDR
#  define AVM_LED_GREEN_DDR DDRB
#endif
#ifndef AVM_LED_GREEN_BIT
#  define AVM_LED_GREEN_BIT PORTB7
#endif
#ifndef AVM_LED_BLUE_PORT
#  define AVM_LED_BLUE_PORT PORTB
#endif
#ifndef AVM_LED_BLUE_DDR
#  define AVM_LED_BLUE_DDR DDRB
#endif
#ifndef AVM_LED_BLUE_BIT
#  define AVM_LED_BLUE_BIT PORTB5
#endif
#ifndef AVM_LED_TX_PORT
#  define AVM_LED_TX_PORT PORTD
#endif
#ifndef AVM_LED_TX_DDR
#  define AVM_LED_TX_DDR DDRD
#endif
#ifndef AVM_LED_TX_BIT
#  define AVM_LED_TX_BIT PORTD5
#endif
#ifndef AVM_LED_RX_PORT
#  define AVM_LED_RX_PORT PORTB
#endif
#ifndef AVM_LED_RX_DDR
#  define AVM_LED_RX_DDR DDRB
#endif
#ifndef AVM_LED_RX_BIT
#  define AVM_LED_RX_BIT PORTB0
#endif

#ifndef AVM_RANDOM_SEED_PORT
#  define AVM_RANDOM_SEED_PORT PORTF
#endif
#ifndef AVM_RANDOM_SEED_DDR
#  define AVM_RANDOM_SEED_DDR DDRF
#endif
#ifndef AVM_RANDOM_SEED_BIT
#  define AVM_RANDOM_SEED_BIT PORTF1
#endif

;; ; ------------------------------------------------------------
;; ; Native dispatch and interpreter state
;; ; ------------------------------------------------------------
;; 
;; AVR r0-r1      Native MUL result
;;                Dispatch table offset
;;                General temporary scratch
;; 
;; AVR r2         Permanent zero
;;                SPI dummy-transmit byte
;; 
;; AVR r3         AVM CC (C/Z/S in SREG bit positions)
;; 
;; AVR r4         Interpreter scratch
;; 
;; AVR r5         Interpreter scratch
;; 
;; AVR r6         Current bytecode opcode
;;                Operand or secondary-opcode scratch
;; 
;; AVR r7         Constant
;;                Dispatch-slot stride in AVR words
;; 
;; ; ------------------------------------------------------------
;; ; AVM general-purpose register file
;; ; ------------------------------------------------------------
;; 
;; AVR r8-r9      AVM r0
;; AVR r10-r11    AVM r1
;; AVR r12-r13    AVM r2
;; AVR r14-r15    AVM r3
;; 
;; AVR r16-r17    AVM r4 = c0
;; AVR r18-r19    AVM r5 = c1
;; AVR r20-r21    AVM r6 = c2
;; AVR r22-r23    AVM r7 = c3
;; 
;; ; ------------------------------------------------------------
;; ; Addressing and dispatch
;; ; ------------------------------------------------------------
;; 
;; AVR r24-r25    AVM PC
;; 
;; AVR r26-r27    X
;;                General interpreter address scratch
;; 
;; AVR r28-r29    Y
;;                AVM SP
;; 
;; AVR r30-r31    Z
;;                Dispatch target
;;                Secondary-table target
;;                General address scratch
;; 
;; ; ------------------------------------------------------------
;; ; Persistent bank state
;; ; ------------------------------------------------------------
;; 
;; GPIOR1         CB
;; GPIOR2         PB

#define DISPATCH_ORG             0x0200
#define DISPATCH_STRIDE_WORDS    16
#define DISPATCH_STRIDE_BYTES    (2 * (DISPATCH_STRIDE_WORDS))
#define C_DISPATCH_STRIDE_WORDS  r7

#define ZERO r2

; AVM architectural CC uses only C/Z/S; other SREG bits may be retained.
#define VM_FLAGS r3

#define VM_CB GPIOR1
#define VM_PB GPIOR2

#define VM_PC  r24
#define VM_PCL r24
#define VM_PCH r25

#define VM_SP_INITIAL_VALUE 0x0A00
#define VM_SP  r28
#define VM_SPL r28
#define VM_SPH r29

#define VM_R0  r8
#define VM_R1  r10
#define VM_R2  r12
#define VM_R3  r14
#define VM_R4  r16
#define VM_R5  r18
#define VM_R6  r20
#define VM_R7  r22

#define VM_R0L  r8
#define VM_R1L  r10
#define VM_R2L  r12
#define VM_R3L  r14
#define VM_R4L  r16
#define VM_R5L  r18
#define VM_R6L  r20
#define VM_R7L  r22

#define VM_R0H  r9
#define VM_R1H  r11
#define VM_R2H  r13
#define VM_R3H  r15
#define VM_R4H  r17
#define VM_R5H  r19
#define VM_R6H  r21
#define VM_R7H  r23

#define VM_C0  VM_R4
#define VM_C1  VM_R5
#define VM_C2  VM_R6
#define VM_C3  VM_R7

#define VM_C0L  VM_R4L
#define VM_C1L  VM_R5L
#define VM_C2L  VM_R6L
#define VM_C3L  VM_R7L

#define VM_C0H  VM_R4H
#define VM_C1H  VM_R5H
#define VM_C2H  VM_R6H
#define VM_C3H  VM_R7H

#define __SFR_OFFSET 0
#include <avr/io.h>
#ifndef SREG_C
#  define SREG_C  (0)
#endif
#ifndef SREG_Z
#  define SREG_Z  (1)
#endif
#ifndef SREG_N
#  define SREG_N  (2)
#endif
#ifndef SREG_V
#  define SREG_V  (3)
#endif
#ifndef SREG_S
#  define SREG_S  (4)
#endif
#ifndef SREG_H
#  define SREG_H  (5)
#endif
#ifndef SREG_T
#  define SREG_T  (6)
#endif
#ifndef SREG_I
#  define SREG_I  (7)
#endif

#if (DISPATCH_ORG & 0x1FF) != 0
#error "Dispatch calculation requires lo8(DISPATCH_ORG/2) == 0x00"
#endif

; OLED display control. All supported controllers use active-low CS and reset,
; with D/C low for commands and high for display data.
.macro display_enable
    cbi  AVM_OLED_CS_PORT, AVM_OLED_CS_BIT
.endm

.macro display_disable
    sbi  AVM_OLED_CS_PORT, AVM_OLED_CS_BIT
.endm

.macro display_command_mode
    cbi  AVM_OLED_DC_PORT, AVM_OLED_DC_BIT
.endm

.macro display_data_mode
    sbi  AVM_OLED_DC_PORT, AVM_OLED_DC_BIT
.endm

; Generic GPIO setup helpers. PORT is written before DDR for outputs so OLED,
; flash, and active-low LED pins never glitch through an unintended level.
.macro pin_output_high port, ddr, bit
    sbi  \port, \bit
    sbi  \ddr,  \bit
.endm

.macro pin_output_low port, ddr, bit
    cbi  \port, \bit
    sbi  \ddr,  \bit
.endm

.macro pin_input_pullup port, ddr, bit
    cbi  \ddr,  \bit
    sbi  \port, \bit
.endm

.macro pin_input_floating port, ddr, bit
    cbi  \ddr,  \bit
    cbi  \port, \bit
.endm

; Serial Flash Commands (W25Q128)
#define SFC_READ               0x03
#define SFC_WRITE_ENABLE       0x06
#define SFC_WRITE              0x02
#define SFC_ERASE              0x20
#define SFC_RELEASE_POWERDOWN  0xAB

#define FX_VECTOR_KEY_POINTER       0x0014
#define FX_DATA_VECTOR_PAGE_POINTER 0x0016
#define FX_SAVE_VECTOR_KEY_POINTER  0x0018
#define FX_SAVE_VECTOR_PAGE_POINTER 0x001A
#define FX_VECTOR_KEY               0x9518

; AVM linked-image header constants.
#define AVM_HEADER_MAGIC0       0x41
#define AVM_HEADER_MAGIC1       0x56
#define AVM_HEADER_MAGIC2       0x4D
#define AVM_HEADER_MAGIC3       0x01
#define AVM_RUNTIME_VERSION     0x01
#define AVM_DATA_IMAGE_OFFSET   0x0100

; The mandatory eight-byte image tail occupies the final eight bytes of the
; linked image. Only the first six bytes are needed by startup:
;   41 56 54 01, imagePageCountLo, imagePageCountHi
#define AVM_TAIL_MAGIC0         0x41
#define AVM_TAIL_MAGIC1         0x56
#define AVM_TAIL_MAGIC2         0x54
#define AVM_TAIL_MAGIC3         0x01
#define AVM_TAIL_OFFSET_IN_PAGE 0xF8

; Arduboy system ABI service identifiers.
#define SYS_DEBUG_PUTC          0x00
#define SYS_DEBUG_BREAK         0x01

; Development/emulator images either end at the end of the 16 MiB flash or
; end immediately before a final 4 KiB save sector.
#define FX_DEV_TAIL_NOSAVE_HI   0xFF
#define FX_DEV_TAIL_NOSAVE_MID  0xFF
#define FX_DEV_TAIL_SAVE_HI     0xFF
#define FX_DEV_TAIL_SAVE_MID    0xEF
#define FX_DEV_SAVE_PAGE_LO     0xF0
#define FX_DEV_SAVE_PAGE_HI     0xFF

.macro fx_enable
cbi  AVM_FX_PORT, AVM_FX_BIT
.endm

.macro fx_disable
sbi  AVM_FX_PORT, AVM_FX_BIT
.endm

.macro delay_1
    nop
.endm

.macro delay_2
    .word 0xC000   ; rjmp .+0
.endm

.macro delay_3
    lpm
.endm

.macro delay_4
    delay_2
    delay_2
.endm

.section .text,"ax",@progbits
.org 0x0000
.global __vectors

; ATmega32U4 interrupt vector table.
; Each vector is one 32-bit JMP instruction. The table contains the reset
; vector followed by the device interrupt vectors, including reserved slots,
; in datasheet order.
__vectors:
    jmp reset_handler       ;  0 RESET
    jmp default_isr         ;  1 INT0
    jmp default_isr         ;  2 INT1
    jmp default_isr         ;  3 INT2
    jmp default_isr         ;  4 INT3
    jmp default_isr         ;  5 RESERVED
    jmp default_isr         ;  6 RESERVED
    jmp default_isr         ;  7 INT6
    jmp default_isr         ;  8 RESERVED
    jmp default_isr         ;  9 PCINT0
    jmp default_isr         ; 10 USB GENERAL
    jmp default_isr         ; 11 USB ENDPOINT
    jmp default_isr         ; 12 WDT
    jmp default_isr         ; 13 RESERVED
    jmp default_isr         ; 14 RESERVED
    jmp default_isr         ; 15 RESERVED
    jmp default_isr         ; 16 TIMER1 CAPTURE
    jmp default_isr         ; 17 TIMER1 COMPA
    jmp default_isr         ; 18 TIMER1 COMPB
    jmp default_isr         ; 19 TIMER1 COMPC
    jmp default_isr         ; 20 TIMER1 OVERFLOW
    jmp timer0_compa_isr    ; 21 TIMER0 COMPA
    jmp default_isr         ; 22 TIMER0 COMPB
    jmp default_isr         ; 23 TIMER0 OVERFLOW
    jmp default_isr         ; 24 SPI
    jmp default_isr         ; 25 USART1 RX
    jmp default_isr         ; 26 USART1 UDRE
    jmp default_isr         ; 27 USART1 TX
    jmp default_isr         ; 28 ANALOG COMPARATOR
    jmp default_isr         ; 29 ADC
    jmp default_isr         ; 30 EEPROM READY
    jmp default_isr         ; 31 TIMER3 CAPTURE
    jmp default_isr         ; 32 TIMER3 COMPA
    jmp default_isr         ; 33 TIMER3 COMPB
    jmp default_isr         ; 34 TIMER3 COMPC
    jmp default_isr         ; 35 TIMER3 OVERFLOW
    jmp default_isr         ; 36 TWI
    jmp default_isr         ; 37 SPM READY
    jmp default_isr         ; 38 TIMER4 COMPA
    jmp default_isr         ; 39 TIMER4 COMPB
    jmp default_isr         ; 40 TIMER4 COMPD
    jmp default_isr         ; 41 TIMER4 OVERFLOW
    jmp default_isr         ; 42 TIMER4 FPF

.size __vectors, .-__vectors

default_isr:
    rjmp default_isr

; Timer0 compare-A fires once per millisecond. Preserve the interrupted native
; state; the VM register file may be live in any AVR register when this runs.
timer0_compa_isr:
    push r0
    in   r0, SREG
    push r0

    lds  r0, data_millis+0
    inc  r0
    sts  data_millis+0, r0
    brne timer0_compa_isr_done

    lds  r0, data_millis+1
    inc  r0
    sts  data_millis+1, r0
    brne timer0_compa_isr_done

    lds  r0, data_millis+2
    inc  r0
    sts  data_millis+2, r0
    brne timer0_compa_isr_done

    lds  r0, data_millis+3
    inc  r0
    sts  data_millis+3, r0

timer0_compa_isr_done:
    pop  r0
    out  SREG, r0
    pop  r0
    reti

reset_handler:
    ; Keep the vector area small. The complete startup path is placed after
    ; the fixed-stride dispatch table so it cannot collide with .org 0x0200.
    jmp startup_func

; 18-cycle cadence, needs 8 cycles from start of instruction
.macro dispatch
    in   r6, SPDR
    out  SPDR, ZERO
    adiw VM_PC, 1
    mul  r6, C_DISPATCH_STRIDE_WORDS
    movw r30, r0
    subi r31, hi8(-(pm(DISPATCH_ORG)))
    ijmp
.endm

; 17-cycle cadence but needs 5 cycles from start of instruction
.macro dispatch_reverse
    adiw VM_PC, 1
    cli
    out  SPDR, ZERO
    in   r6, SPDR
    sei
    mul  r6, C_DISPATCH_STRIDE_WORDS
    movw r30, r0
    subi r31, hi8(-(pm(DISPATCH_ORG)))
    ijmp
.endm

.macro handler_begin opcode, label
    .org (((\opcode) * DISPATCH_STRIDE_BYTES) + DISPATCH_ORG)
\label:
.endm

.macro handler_end opcode
    .org ((((\opcode) + 1) * DISPATCH_STRIDE_BYTES) + DISPATCH_ORG)
.endm

.org DISPATCH_ORG
.global abvm_interp
abvm_interp:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x00-0x0F: MOV cD, cS / CLR cD
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.macro emit_mov_or_clr opcode, label, dst, dstl, dsth, src, same=0
    handler_begin \opcode, \label
    .if \same
        delay_3
        clr  \dstl
        clr  \dsth
    .else
        delay_4
        movw \dst, \src
    .endif
    dispatch_reverse
    handler_end \opcode
.endm

emit_mov_or_clr 0x00, I_00__CLR_c0,     VM_C0, VM_C0L, VM_C0H, VM_C0, 1
emit_mov_or_clr 0x01, I_01__MOV_c0_c1,  VM_C0, VM_C0L, VM_C0H, VM_C1
emit_mov_or_clr 0x02, I_02__MOV_c0_c2,  VM_C0, VM_C0L, VM_C0H, VM_C2
emit_mov_or_clr 0x03, I_03__MOV_c0_c3,  VM_C0, VM_C0L, VM_C0H, VM_C3
emit_mov_or_clr 0x04, I_04__MOV_c1_c0,  VM_C1, VM_C1L, VM_C1H, VM_C0
emit_mov_or_clr 0x05, I_05__CLR_c1,     VM_C1, VM_C1L, VM_C1H, VM_C1, 1
emit_mov_or_clr 0x06, I_06__MOV_c1_c2,  VM_C1, VM_C1L, VM_C1H, VM_C2
emit_mov_or_clr 0x07, I_07__MOV_c1_c3,  VM_C1, VM_C1L, VM_C1H, VM_C3
emit_mov_or_clr 0x08, I_08__MOV_c2_c0,  VM_C2, VM_C2L, VM_C2H, VM_C0
emit_mov_or_clr 0x09, I_09__MOV_c2_c1,  VM_C2, VM_C2L, VM_C2H, VM_C1
emit_mov_or_clr 0x0A, I_0A__CLR_c2,     VM_C2, VM_C2L, VM_C2H, VM_C2, 1
emit_mov_or_clr 0x0B, I_0B__MOV_c2_c3,  VM_C2, VM_C2L, VM_C2H, VM_C3
emit_mov_or_clr 0x0C, I_0C__MOV_c3_c0,  VM_C3, VM_C3L, VM_C3H, VM_C0
emit_mov_or_clr 0x0D, I_0D__MOV_c3_c1,  VM_C3, VM_C3L, VM_C3H, VM_C1
emit_mov_or_clr 0x0E, I_0E__MOV_c3_c2,  VM_C3, VM_C3L, VM_C3H, VM_C2
emit_mov_or_clr 0x0F, I_0F__CLR_c3,     VM_C3, VM_C3L, VM_C3H, VM_C3, 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x10-0x1F: LD8 cD, [cS]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.macro emit_ld8 opcode, label, dstl, dsth, src
    handler_begin \opcode, \label
    delay_1
    movw r26, \src
    ld   \dstl, X
    clr  \dsth
    dispatch_reverse
    handler_end \opcode
.endm

emit_ld8 0x10, I_10__LD8_c0_c0, VM_C0L, VM_C0H, VM_C0
emit_ld8 0x11, I_11__LD8_c0_c1, VM_C0L, VM_C0H, VM_C1
emit_ld8 0x12, I_12__LD8_c0_c2, VM_C0L, VM_C0H, VM_C2
emit_ld8 0x13, I_13__LD8_c0_c3, VM_C0L, VM_C0H, VM_C3
emit_ld8 0x14, I_14__LD8_c1_c0, VM_C1L, VM_C1H, VM_C0
emit_ld8 0x15, I_15__LD8_c1_c1, VM_C1L, VM_C1H, VM_C1
emit_ld8 0x16, I_16__LD8_c1_c2, VM_C1L, VM_C1H, VM_C2
emit_ld8 0x17, I_17__LD8_c1_c3, VM_C1L, VM_C1H, VM_C3
emit_ld8 0x18, I_18__LD8_c2_c0, VM_C2L, VM_C2H, VM_C0
emit_ld8 0x19, I_19__LD8_c2_c1, VM_C2L, VM_C2H, VM_C1
emit_ld8 0x1A, I_1A__LD8_c2_c2, VM_C2L, VM_C2H, VM_C2
emit_ld8 0x1B, I_1B__LD8_c2_c3, VM_C2L, VM_C2H, VM_C3
emit_ld8 0x1C, I_1C__LD8_c3_c0, VM_C3L, VM_C3H, VM_C0
emit_ld8 0x1D, I_1D__LD8_c3_c1, VM_C3L, VM_C3H, VM_C1
emit_ld8 0x1E, I_1E__LD8_c3_c2, VM_C3L, VM_C3H, VM_C2
emit_ld8 0x1F, I_1F__LD8_c3_c3, VM_C3L, VM_C3H, VM_C3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x20-0x2F: ST8 [cD], cS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.macro emit_st8 opcode, label, dst, srcl
    handler_begin \opcode, \label
    delay_2
    movw r26, \dst
    st   X, \srcl
    dispatch_reverse
    handler_end \opcode
.endm

emit_st8 0x20, I_20__ST8_c0_c0, VM_C0, VM_C0L
emit_st8 0x21, I_21__ST8_c0_c1, VM_C0, VM_C1L
emit_st8 0x22, I_22__ST8_c0_c2, VM_C0, VM_C2L
emit_st8 0x23, I_23__ST8_c0_c3, VM_C0, VM_C3L
emit_st8 0x24, I_24__ST8_c1_c0, VM_C1, VM_C0L
emit_st8 0x25, I_25__ST8_c1_c1, VM_C1, VM_C1L
emit_st8 0x26, I_26__ST8_c1_c2, VM_C1, VM_C2L
emit_st8 0x27, I_27__ST8_c1_c3, VM_C1, VM_C3L
emit_st8 0x28, I_28__ST8_c2_c0, VM_C2, VM_C0L
emit_st8 0x29, I_29__ST8_c2_c1, VM_C2, VM_C1L
emit_st8 0x2A, I_2A__ST8_c2_c2, VM_C2, VM_C2L
emit_st8 0x2B, I_2B__ST8_c2_c3, VM_C2, VM_C3L
emit_st8 0x2C, I_2C__ST8_c3_c0, VM_C3, VM_C0L
emit_st8 0x2D, I_2D__ST8_c3_c1, VM_C3, VM_C1L
emit_st8 0x2E, I_2E__ST8_c3_c2, VM_C3, VM_C2L
emit_st8 0x2F, I_2F__ST8_c3_c3, VM_C3, VM_C3L

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x30-0x3F: LD16 cD, [cS]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.macro emit_ld16 opcode, label, dstl, dsth, src
    handler_begin \opcode, \label
    movw r26, \src
    ld   \dstl, X+
    ld   \dsth, X
    dispatch_reverse
    handler_end \opcode
.endm

emit_ld16 0x30, I_30__LD16_c0_c0, VM_C0L, VM_C0H, VM_C0
emit_ld16 0x31, I_31__LD16_c0_c1, VM_C0L, VM_C0H, VM_C1
emit_ld16 0x32, I_32__LD16_c0_c2, VM_C0L, VM_C0H, VM_C2
emit_ld16 0x33, I_33__LD16_c0_c3, VM_C0L, VM_C0H, VM_C3
emit_ld16 0x34, I_34__LD16_c1_c0, VM_C1L, VM_C1H, VM_C0
emit_ld16 0x35, I_35__LD16_c1_c1, VM_C1L, VM_C1H, VM_C1
emit_ld16 0x36, I_36__LD16_c1_c2, VM_C1L, VM_C1H, VM_C2
emit_ld16 0x37, I_37__LD16_c1_c3, VM_C1L, VM_C1H, VM_C3
emit_ld16 0x38, I_38__LD16_c2_c0, VM_C2L, VM_C2H, VM_C0
emit_ld16 0x39, I_39__LD16_c2_c1, VM_C2L, VM_C2H, VM_C1
emit_ld16 0x3A, I_3A__LD16_c2_c2, VM_C2L, VM_C2H, VM_C2
emit_ld16 0x3B, I_3B__LD16_c2_c3, VM_C2L, VM_C2H, VM_C3
emit_ld16 0x3C, I_3C__LD16_c3_c0, VM_C3L, VM_C3H, VM_C0
emit_ld16 0x3D, I_3D__LD16_c3_c1, VM_C3L, VM_C3H, VM_C1
emit_ld16 0x3E, I_3E__LD16_c3_c2, VM_C3L, VM_C3H, VM_C2
emit_ld16 0x3F, I_3F__LD16_c3_c3, VM_C3L, VM_C3H, VM_C3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x40-0x4F: ST16 [cD], cS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.macro emit_st16 opcode, label, dst, srcl, srch
    handler_begin \opcode, \label
    movw r26, \dst
    st   X+, \srcl
    st   X, \srch
    dispatch_reverse
    handler_end \opcode
.endm

emit_st16 0x40, I_40__ST16_c0_c0, VM_C0, VM_C0L, VM_C0H
emit_st16 0x41, I_41__ST16_c0_c1, VM_C0, VM_C1L, VM_C1H
emit_st16 0x42, I_42__ST16_c0_c2, VM_C0, VM_C2L, VM_C2H
emit_st16 0x43, I_43__ST16_c0_c3, VM_C0, VM_C3L, VM_C3H
emit_st16 0x44, I_44__ST16_c1_c0, VM_C1, VM_C0L, VM_C0H
emit_st16 0x45, I_45__ST16_c1_c1, VM_C1, VM_C1L, VM_C1H
emit_st16 0x46, I_46__ST16_c1_c2, VM_C1, VM_C2L, VM_C2H
emit_st16 0x47, I_47__ST16_c1_c3, VM_C1, VM_C3L, VM_C3H
emit_st16 0x48, I_48__ST16_c2_c0, VM_C2, VM_C0L, VM_C0H
emit_st16 0x49, I_49__ST16_c2_c1, VM_C2, VM_C1L, VM_C1H
emit_st16 0x4A, I_4A__ST16_c2_c2, VM_C2, VM_C2L, VM_C2H
emit_st16 0x4B, I_4B__ST16_c2_c3, VM_C2, VM_C3L, VM_C3H
emit_st16 0x4C, I_4C__ST16_c3_c0, VM_C3, VM_C0L, VM_C0H
emit_st16 0x4D, I_4D__ST16_c3_c1, VM_C3, VM_C1L, VM_C1H
emit_st16 0x4E, I_4E__ST16_c3_c2, VM_C3, VM_C2L, VM_C2H
emit_st16 0x4F, I_4F__ST16_c3_c3, VM_C3, VM_C3L, VM_C3H

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x50-0x57: AND A, rS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; A is the architectural alias of c0/r4. This is the existing implemented
; 16-bit AND operation, remapped to the new one-byte accumulator encoding.
; AVM CC is preserved even though the native AND instructions modify SREG.
.macro emit_and_a opcode, label, srcl, srch
    handler_begin \opcode, \label
    delay_3
    and  VM_C0L, \srcl
    and  VM_C0H, \srch
    dispatch_reverse
    handler_end \opcode
.endm

emit_and_a 0x50, I_50__AND_A_r0, VM_R0L, VM_R0H
emit_and_a 0x51, I_51__AND_A_r1, VM_R1L, VM_R1H
emit_and_a 0x52, I_52__AND_A_r2, VM_R2L, VM_R2H
emit_and_a 0x53, I_53__AND_A_r3, VM_R3L, VM_R3H
emit_and_a 0x54, I_54__AND_A_r4, VM_R4L, VM_R4H
emit_and_a 0x55, I_55__AND_A_r5, VM_R5L, VM_R5H
emit_and_a 0x56, I_56__AND_A_r6, VM_R6L, VM_R6H
emit_and_a 0x57, I_57__AND_A_r7, VM_R7L, VM_R7H

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x58-0x67: OR/XOR A, rS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; OR and XOR use the same five pre-dispatch cycles as AND:
;   delay_3 + low-byte operation + high-byte operation.
; Native SREG is modified, but architectural AVM CC remains in VM_FLAGS.
.macro emit_logic_a opcode, label, operation, srcl, srch
    handler_begin \opcode, \label
    delay_3
    \operation VM_C0L, \srcl
    \operation VM_C0H, \srch
    dispatch_reverse
    handler_end \opcode
.endm

emit_logic_a 0x58, I_58__OR_A_r0,  or,  VM_R0L, VM_R0H
emit_logic_a 0x59, I_59__OR_A_r1,  or,  VM_R1L, VM_R1H
emit_logic_a 0x5A, I_5A__OR_A_r2,  or,  VM_R2L, VM_R2H
emit_logic_a 0x5B, I_5B__OR_A_r3,  or,  VM_R3L, VM_R3H
emit_logic_a 0x5C, I_5C__OR_A_r4,  or,  VM_R4L, VM_R4H
emit_logic_a 0x5D, I_5D__OR_A_r5,  or,  VM_R5L, VM_R5H
emit_logic_a 0x5E, I_5E__OR_A_r6,  or,  VM_R6L, VM_R6H
emit_logic_a 0x5F, I_5F__OR_A_r7,  or,  VM_R7L, VM_R7H

emit_logic_a 0x60, I_60__XOR_A_r0, eor, VM_R0L, VM_R0H
emit_logic_a 0x61, I_61__XOR_A_r1, eor, VM_R1L, VM_R1H
emit_logic_a 0x62, I_62__XOR_A_r2, eor, VM_R2L, VM_R2H
emit_logic_a 0x63, I_63__XOR_A_r3, eor, VM_R3L, VM_R3H
emit_logic_a 0x64, I_64__XOR_A_r4, eor, VM_R4L, VM_R4H
emit_logic_a 0x65, I_65__XOR_A_r5, eor, VM_R5L, VM_R5H
emit_logic_a 0x66, I_66__XOR_A_r6, eor, VM_R6L, VM_R6H
emit_logic_a 0x67, I_67__XOR_A_r7, eor, VM_R7L, VM_R7H

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x68-0x6F: BIC A, rS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; BIC computes A &= ~rS without modifying rS. MOVW copies the complete source
; before A is changed, which also gives BIC A,A the expected zero result.
; MOVW + COM + COM + AND + AND is exactly five pre-dispatch cycles.
.macro emit_bic_a opcode, label, src
    handler_begin \opcode, \label
    movw r4, \src
    com  r4
    com  r5
    and  VM_C0L, r4
    and  VM_C0H, r5
    dispatch_reverse
    handler_end \opcode
.endm

emit_bic_a 0x68, I_68__BIC_A_r0, VM_R0
emit_bic_a 0x69, I_69__BIC_A_r1, VM_R1
emit_bic_a 0x6A, I_6A__BIC_A_r2, VM_R2
emit_bic_a 0x6B, I_6B__BIC_A_r3, VM_R3
emit_bic_a 0x6C, I_6C__BIC_A_r4, VM_R4
emit_bic_a 0x6D, I_6D__BIC_A_r5, VM_R5
emit_bic_a 0x6E, I_6E__BIC_A_r6, VM_R6
emit_bic_a 0x6F, I_6F__BIC_A_r7, VM_R7

.macro emit_unimplemented_primary opcode, label
    handler_begin \opcode, \label
    jmp  unimplemented_instruction_func
    handler_end \opcode
.endm

.macro emit_invalid_primary opcode, label
    handler_begin \opcode, \label
    jmp  invalid_primary_instruction_func
    handler_end \opcode
.endm

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x70-0x77: PUSH16 rS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.macro emit_push16 opcode, label, srcl, srch
    handler_begin \opcode, \label
    delay_1
    st   -Y, \srch
    st   -Y, \srcl
    dispatch_reverse
    handler_end \opcode
.endm

emit_push16 0x70, I_70__PUSH16_r0, VM_R0L, VM_R0H
emit_push16 0x71, I_71__PUSH16_r1, VM_R1L, VM_R1H
emit_push16 0x72, I_72__PUSH16_r2, VM_R2L, VM_R2H
emit_push16 0x73, I_73__PUSH16_r3, VM_R3L, VM_R3H
emit_push16 0x74, I_74__PUSH16_r4, VM_R4L, VM_R4H
emit_push16 0x75, I_75__PUSH16_r5, VM_R5L, VM_R5H
emit_push16 0x76, I_76__PUSH16_r6, VM_R6L, VM_R6H
emit_push16 0x77, I_77__PUSH16_r7, VM_R7L, VM_R7H

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x78-0x7F: POP16 rD
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.macro emit_pop16 opcode, label, dstl, dsth
    handler_begin \opcode, \label
    delay_1
    ld   \dstl, Y+
    ld   \dsth, Y+
    dispatch_reverse
    handler_end \opcode
.endm

emit_pop16 0x78, I_78__POP16_r0, VM_R0L, VM_R0H
emit_pop16 0x79, I_79__POP16_r1, VM_R1L, VM_R1H
emit_pop16 0x7A, I_7A__POP16_r2, VM_R2L, VM_R2H
emit_pop16 0x7B, I_7B__POP16_r3, VM_R3L, VM_R3H
emit_pop16 0x7C, I_7C__POP16_r4, VM_R4L, VM_R4H
emit_pop16 0x7D, I_7D__POP16_r5, VM_R5L, VM_R5H
emit_pop16 0x7E, I_7E__POP16_r6, VM_R6L, VM_R6H
emit_pop16 0x7F, I_7F__POP16_r7, VM_R7L, VM_R7H

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x80-0x9F: ADD/SUB cD, cS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.macro emit_add_or_sub opcode, label, lowop, highop, dstl, dsth, srcl, srch
    handler_begin \opcode, \label
    delay_2
    \lowop \dstl, \srcl
    \highop \dsth, \srch
    in   VM_FLAGS, SREG
    dispatch_reverse
    handler_end \opcode
.endm

emit_add_or_sub 0x80, I_80__ADD_c0_c0, add, adc, VM_C0L, VM_C0H, VM_C0L, VM_C0H
emit_add_or_sub 0x81, I_81__ADD_c0_c1, add, adc, VM_C0L, VM_C0H, VM_C1L, VM_C1H
emit_add_or_sub 0x82, I_82__ADD_c0_c2, add, adc, VM_C0L, VM_C0H, VM_C2L, VM_C2H
emit_add_or_sub 0x83, I_83__ADD_c0_c3, add, adc, VM_C0L, VM_C0H, VM_C3L, VM_C3H
emit_add_or_sub 0x84, I_84__ADD_c1_c0, add, adc, VM_C1L, VM_C1H, VM_C0L, VM_C0H
emit_add_or_sub 0x85, I_85__ADD_c1_c1, add, adc, VM_C1L, VM_C1H, VM_C1L, VM_C1H
emit_add_or_sub 0x86, I_86__ADD_c1_c2, add, adc, VM_C1L, VM_C1H, VM_C2L, VM_C2H
emit_add_or_sub 0x87, I_87__ADD_c1_c3, add, adc, VM_C1L, VM_C1H, VM_C3L, VM_C3H
emit_add_or_sub 0x88, I_88__ADD_c2_c0, add, adc, VM_C2L, VM_C2H, VM_C0L, VM_C0H
emit_add_or_sub 0x89, I_89__ADD_c2_c1, add, adc, VM_C2L, VM_C2H, VM_C1L, VM_C1H
emit_add_or_sub 0x8A, I_8A__ADD_c2_c2, add, adc, VM_C2L, VM_C2H, VM_C2L, VM_C2H
emit_add_or_sub 0x8B, I_8B__ADD_c2_c3, add, adc, VM_C2L, VM_C2H, VM_C3L, VM_C3H
emit_add_or_sub 0x8C, I_8C__ADD_c3_c0, add, adc, VM_C3L, VM_C3H, VM_C0L, VM_C0H
emit_add_or_sub 0x8D, I_8D__ADD_c3_c1, add, adc, VM_C3L, VM_C3H, VM_C1L, VM_C1H
emit_add_or_sub 0x8E, I_8E__ADD_c3_c2, add, adc, VM_C3L, VM_C3H, VM_C2L, VM_C2H
emit_add_or_sub 0x8F, I_8F__ADD_c3_c3, add, adc, VM_C3L, VM_C3H, VM_C3L, VM_C3H

emit_add_or_sub 0x90, I_90__SUB_c0_c0, sub, sbc, VM_C0L, VM_C0H, VM_C0L, VM_C0H
emit_add_or_sub 0x91, I_91__SUB_c0_c1, sub, sbc, VM_C0L, VM_C0H, VM_C1L, VM_C1H
emit_add_or_sub 0x92, I_92__SUB_c0_c2, sub, sbc, VM_C0L, VM_C0H, VM_C2L, VM_C2H
emit_add_or_sub 0x93, I_93__SUB_c0_c3, sub, sbc, VM_C0L, VM_C0H, VM_C3L, VM_C3H
emit_add_or_sub 0x94, I_94__SUB_c1_c0, sub, sbc, VM_C1L, VM_C1H, VM_C0L, VM_C0H
emit_add_or_sub 0x95, I_95__SUB_c1_c1, sub, sbc, VM_C1L, VM_C1H, VM_C1L, VM_C1H
emit_add_or_sub 0x96, I_96__SUB_c1_c2, sub, sbc, VM_C1L, VM_C1H, VM_C2L, VM_C2H
emit_add_or_sub 0x97, I_97__SUB_c1_c3, sub, sbc, VM_C1L, VM_C1H, VM_C3L, VM_C3H
emit_add_or_sub 0x98, I_98__SUB_c2_c0, sub, sbc, VM_C2L, VM_C2H, VM_C0L, VM_C0H
emit_add_or_sub 0x99, I_99__SUB_c2_c1, sub, sbc, VM_C2L, VM_C2H, VM_C1L, VM_C1H
emit_add_or_sub 0x9A, I_9A__SUB_c2_c2, sub, sbc, VM_C2L, VM_C2H, VM_C2L, VM_C2H
emit_add_or_sub 0x9B, I_9B__SUB_c2_c3, sub, sbc, VM_C2L, VM_C2H, VM_C3L, VM_C3H
emit_add_or_sub 0x9C, I_9C__SUB_c3_c0, sub, sbc, VM_C3L, VM_C3H, VM_C0L, VM_C0H
emit_add_or_sub 0x9D, I_9D__SUB_c3_c1, sub, sbc, VM_C3L, VM_C3H, VM_C1L, VM_C1H
emit_add_or_sub 0x9E, I_9E__SUB_c3_c2, sub, sbc, VM_C3L, VM_C3H, VM_C2L, VM_C2H
emit_add_or_sub 0x9F, I_9F__SUB_c3_c3, sub, sbc, VM_C3L, VM_C3H, VM_C3L, VM_C3H

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xA0-0xAF: CMP16 / TST16
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.macro emit_cmp16_or_tst opcode, label, dstl, dsth, srcl, srch, same=0
    handler_begin \opcode, \label

    .if \same
        ; TST16 is a comparison against zero and replaces all architectural CC.
        delay_2
        cp   \dstl, ZERO
        cpc  \dsth, ZERO
        in   VM_FLAGS, SREG
    .else
        ; 2-cycle padding + CP + CPC + IN = 5 cycles.
        delay_2
        cp   \dstl, \srcl
        cpc  \dsth, \srch
        in   VM_FLAGS, SREG
    .endif

    dispatch_reverse
    handler_end \opcode
.endm

emit_cmp16_or_tst 0xA0, I_A0__TST16_c0,     VM_C0L, VM_C0H, VM_C0L, VM_C0H, 1
emit_cmp16_or_tst 0xA1, I_A1__CMP16_c0_c1,  VM_C0L, VM_C0H, VM_C1L, VM_C1H
emit_cmp16_or_tst 0xA2, I_A2__CMP16_c0_c2,  VM_C0L, VM_C0H, VM_C2L, VM_C2H
emit_cmp16_or_tst 0xA3, I_A3__CMP16_c0_c3,  VM_C0L, VM_C0H, VM_C3L, VM_C3H
emit_cmp16_or_tst 0xA4, I_A4__CMP16_c1_c0,  VM_C1L, VM_C1H, VM_C0L, VM_C0H
emit_cmp16_or_tst 0xA5, I_A5__TST16_c1,     VM_C1L, VM_C1H, VM_C1L, VM_C1H, 1
emit_cmp16_or_tst 0xA6, I_A6__CMP16_c1_c2,  VM_C1L, VM_C1H, VM_C2L, VM_C2H
emit_cmp16_or_tst 0xA7, I_A7__CMP16_c1_c3,  VM_C1L, VM_C1H, VM_C3L, VM_C3H
emit_cmp16_or_tst 0xA8, I_A8__CMP16_c2_c0,  VM_C2L, VM_C2H, VM_C0L, VM_C0H
emit_cmp16_or_tst 0xA9, I_A9__CMP16_c2_c1,  VM_C2L, VM_C2H, VM_C1L, VM_C1H
emit_cmp16_or_tst 0xAA, I_AA__TST16_c2,     VM_C2L, VM_C2H, VM_C2L, VM_C2H, 1
emit_cmp16_or_tst 0xAB, I_AB__CMP16_c2_c3,  VM_C2L, VM_C2H, VM_C3L, VM_C3H
emit_cmp16_or_tst 0xAC, I_AC__CMP16_c3_c0,  VM_C3L, VM_C3H, VM_C0L, VM_C0H
emit_cmp16_or_tst 0xAD, I_AD__CMP16_c3_c1,  VM_C3L, VM_C3H, VM_C1L, VM_C1H
emit_cmp16_or_tst 0xAE, I_AE__CMP16_c3_c2,  VM_C3L, VM_C3H, VM_C2L, VM_C2H
emit_cmp16_or_tst 0xAF, I_AF__TST16_c3,     VM_C3L, VM_C3H, VM_C3L, VM_C3H, 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xB0-0xBF: CMP8 / TST8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.macro emit_cmp8_or_tst opcode, label, dstl, srcl, same=0
    handler_begin \opcode, \label

    .if \same
        ; TST8 is a comparison against zero and replaces all architectural CC.
        delay_3
        cp   \dstl, ZERO
        in   VM_FLAGS, SREG
    .else
        ; 3-cycle padding + CP + IN = 5 cycles.
        delay_3
        cp   \dstl, \srcl
        in   VM_FLAGS, SREG
    .endif

    dispatch_reverse
    handler_end \opcode
.endm

emit_cmp8_or_tst 0xB0, I_B0__TST8_c0,     VM_C0L, VM_C0L, 1
emit_cmp8_or_tst 0xB1, I_B1__CMP8_c0_c1,  VM_C0L, VM_C1L
emit_cmp8_or_tst 0xB2, I_B2__CMP8_c0_c2,  VM_C0L, VM_C2L
emit_cmp8_or_tst 0xB3, I_B3__CMP8_c0_c3,  VM_C0L, VM_C3L
emit_cmp8_or_tst 0xB4, I_B4__CMP8_c1_c0,  VM_C1L, VM_C0L
emit_cmp8_or_tst 0xB5, I_B5__TST8_c1,     VM_C1L, VM_C1L, 1
emit_cmp8_or_tst 0xB6, I_B6__CMP8_c1_c2,  VM_C1L, VM_C2L
emit_cmp8_or_tst 0xB7, I_B7__CMP8_c1_c3,  VM_C1L, VM_C3L
emit_cmp8_or_tst 0xB8, I_B8__CMP8_c2_c0,  VM_C2L, VM_C0L
emit_cmp8_or_tst 0xB9, I_B9__CMP8_c2_c1,  VM_C2L, VM_C1L
emit_cmp8_or_tst 0xBA, I_BA__TST8_c2,     VM_C2L, VM_C2L, 1
emit_cmp8_or_tst 0xBB, I_BB__CMP8_c2_c3,  VM_C2L, VM_C3L
emit_cmp8_or_tst 0xBC, I_BC__CMP8_c3_c0,  VM_C3L, VM_C0L
emit_cmp8_or_tst 0xBD, I_BD__CMP8_c3_c1,  VM_C3L, VM_C1L
emit_cmp8_or_tst 0xBE, I_BE__CMP8_c3_c2,  VM_C3L, VM_C2L
emit_cmp8_or_tst 0xBF, I_BF__TST8_c3,     VM_C3L, VM_C3L, 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xC0-0xDF: BEQ.S / BNE.S
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; One-byte short equality branches encode {-9..-2,+1..+8}. The displacement
; is relative to nextPC,
; so the taken path first advances PC past the opcode and then adds disp.
;
; The untaken path retains the sequential SPI stream and is padded to the same
; five pre-dispatch cycles used by the surrounding one-byte handlers.
;
; A taken branch discards the speculative sequential byte, seeks the flash to
; CB:PC, primes a read of the target opcode, and dispatches it without changing
; PC again (PC already names the target opcode).
.macro emit_branch_short opcode, label, skip, disp
    handler_begin \opcode, \label

    \skip VM_FLAGS, SREG_Z
    rjmp branch_short_dispatch_reverse_func

    adiw VM_PC, 1
    subi VM_PCL, lo8(-(\disp))
    sbci VM_PCH, hi8(-(\disp))

    ; Use the common restart path so the target handler observes the same
    ; OUT-to-handler-entry timing as ordinary sequential dispatch.
    jmp  seek_and_dispatch_current_pc_func

    handler_end \opcode
.endm

emit_branch_short 0xC0, I_C0__BEQ_S_m9, sbrs, -9
emit_branch_short 0xC1, I_C1__BEQ_S_m8, sbrs, -8
emit_branch_short 0xC2, I_C2__BEQ_S_m7, sbrs, -7
emit_branch_short 0xC3, I_C3__BEQ_S_m6, sbrs, -6
emit_branch_short 0xC4, I_C4__BEQ_S_m5, sbrs, -5
emit_branch_short 0xC5, I_C5__BEQ_S_m4, sbrs, -4
emit_branch_short 0xC6, I_C6__BEQ_S_m3, sbrs, -3
emit_branch_short 0xC7, I_C7__BEQ_S_m2, sbrs, -2
emit_branch_short 0xC8, I_C8__BEQ_S_p1, sbrs,  1
emit_branch_short 0xC9, I_C9__BEQ_S_p2, sbrs,  2
emit_branch_short 0xCA, I_CA__BEQ_S_p3, sbrs,  3
emit_branch_short 0xCB, I_CB__BEQ_S_p4, sbrs,  4
emit_branch_short 0xCC, I_CC__BEQ_S_p5, sbrs,  5
emit_branch_short 0xCD, I_CD__BEQ_S_p6, sbrs,  6
emit_branch_short 0xCE, I_CE__BEQ_S_p7, sbrs,  7
emit_branch_short 0xCF, I_CF__BEQ_S_p8, sbrs,  8

emit_branch_short 0xD0, I_D0__BNE_S_m9, sbrc, -9
emit_branch_short 0xD1, I_D1__BNE_S_m8, sbrc, -8
emit_branch_short 0xD2, I_D2__BNE_S_m7, sbrc, -7
emit_branch_short 0xD3, I_D3__BNE_S_m6, sbrc, -6
emit_branch_short 0xD4, I_D4__BNE_S_m5, sbrc, -5
emit_branch_short 0xD5, I_D5__BNE_S_m4, sbrc, -4
emit_branch_short 0xD6, I_D6__BNE_S_m3, sbrc, -3
emit_branch_short 0xD7, I_D7__BNE_S_m2, sbrc, -2
emit_branch_short 0xD8, I_D8__BNE_S_p1, sbrc,  1
emit_branch_short 0xD9, I_D9__BNE_S_p2, sbrc,  2
emit_branch_short 0xDA, I_DA__BNE_S_p3, sbrc,  3
emit_branch_short 0xDB, I_DB__BNE_S_p4, sbrc,  4
emit_branch_short 0xDC, I_DC__BNE_S_p5, sbrc,  5
emit_branch_short 0xDD, I_DD__BNE_S_p6, sbrc,  6
emit_branch_short 0xDE, I_DE__BNE_S_p7, sbrc,  7
emit_branch_short 0xDF, I_DF__BNE_S_p8, sbrc,  8

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xE0-0xE3: Revised extension pages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    handler_begin 0xE0, I_E0__ext_misc

    ; Account for the secondary opcode, then fetch it while starting the
    ; following primary opcode.
    adiw VM_PC, 1
    delay_3
    rjmp e0_extension_decode_func

    handler_end 0xE0

; E1 is the 32-bit aligned-register-pair ALU page. The uncommon pair
; operations use compact shared X/Z handlers rather than operand-specialized
; executable tables.
    handler_begin 0xE1, I_E1__ext_pair
    adiw VM_PC, 1
    delay_2
    jmp  e1_extension_decode_func
    handler_end 0xE1

; The E2 accumulator page remains unimplemented.
emit_unimplemented_primary 0xE2, I_E2__ext_accumulator

    handler_begin 0xE3, I_E3__ext_transfer_condition

    ; Account for the secondary opcode, then fetch it while starting the
    ; following primary opcode. MOV16 uses an executable specialized table;
    ; MOV8Z, MOV8S, and CSET use compact generic handlers.
    adiw VM_PC, 1
    delay_3
    rjmp e3_extension_decode_func

    handler_end 0xE3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xE4: CMPI6 cN, simm6
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    handler_begin 0xE4, I_E4__CMPI6_cN_simm6

    ; Account for the packed operand. The out-of-line body starts fetching the
    ; following primary opcode at the normal SPI cadence.
    adiw VM_PC, 1
    delay_3
    rjmp e4_cmpi6_func

    handler_end 0xE4

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xE5-0xE8: Direct control and address operations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    handler_begin 0xE5, I_E5__JMP_rel8
    rjmp e5_jmp_rel8_func
    handler_end 0xE5

    handler_begin 0xE6, I_E6__CALL_rel8
    rjmp e6_call_rel8_func
    handler_end 0xE6

    handler_begin 0xE7, I_E7__ADJSP_simm8
    rjmp e7_adjsp_func
    handler_end 0xE7

    handler_begin 0xE8, I_E8__LDPBI_imm8

    ; The immediate transfer was started by the preceding dispatch. Match the
    ; direct LDI8 cadence: read imm8 while starting the following opcode, then
    ; install the new program-data bank without changing AVM CC.
    delay_4
    delay_3
    cli
    out  SPDR, ZERO
    in   r6, SPDR
    sei

    adiw VM_PC, 1
    out  VM_PB, r6
    rjmp ldi8_dispatch_reverse_func

    handler_end 0xE8

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xE9: SYS service8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    handler_begin 0xE9, I_E9__SYS_service8

    ; Account for the service byte. The out-of-line body reads it and starts
    ; fetching the following primary opcode.
    adiw VM_PC, 1
    delay_3
    rjmp e9_sys_decode_func

    handler_end 0xE9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xEA-0xEC: Direct control and NOP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    handler_begin 0xEA, I_EA__JMP16_addr16
    rjmp ea_jmp16_func
    handler_end 0xEA

    handler_begin 0xEB, I_EB__CALL16_addr16
    rjmp eb_call16_func
    handler_end 0xEB

    handler_begin 0xEC, I_EC__NOP
    delay_3
    rjmp dispatch_reverse_func
    handler_end 0xEC

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xED-0xEF: Reserved
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_invalid_primary 0xED, I_ED__RESERVED
emit_invalid_primary 0xEE, I_EE__RESERVED
emit_invalid_primary 0xEF, I_EF__RESERVED

.macro emit_ldi8 opcode, label, dstl, dsth
    handler_begin \opcode, \label

    ; The immediate transfer was started by the preceding dispatch.
    ;
    ; Previous OUT-to-handler-entry latency is 9 cycles. These eight
    ; cycles place this OUT exactly 17 cycles after the previous OUT:
    ;
    ;     delay_4 + delay_3 + CLI = 8
    ;
    ; OUT starts fetching the next opcode; IN reads the completed immediate.
    delay_4
    delay_3
    cli
    out  SPDR, ZERO
    in   \dstl, SPDR
    sei

    ; Account for the immediate byte and zero-extend the value.
    ; dispatch_reverse accounts for the opcode byte.
    adiw VM_PC, 1
    clr  \dsth

    rjmp ldi8_dispatch_reverse_func

    handler_end \opcode
.endm

emit_ldi8 0xF0, I_F0__LDI8_c0, VM_C0L, VM_C0H
emit_ldi8 0xF1, I_F1__LDI8_c1, VM_C1L, VM_C1H
emit_ldi8 0xF2, I_F2__LDI8_c2, VM_C2L, VM_C2H
emit_ldi8 0xF3, I_F3__LDI8_c3, VM_C3L, VM_C3H

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xF4: Compact ALU extension page
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    handler_begin 0xF4, I_F4__ext_compact_alu

    ; Account for the secondary opcode, then transfer to the out-of-line F4
    ; implementation. JMP is one cycle longer than RJMP, so delay_2 preserves
    ; the original seven-cycle path to the decoder.
    adiw VM_PC, 1
    delay_2
    jmp  f4_extension_decode_func

    handler_end 0xF4

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xF5-0xFC: General Conditional Branches, rel8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Each condition has a dedicated primary opcode.  At handler entry SPDR is
; transferring the signed displacement byte and VM_PC names the primary
; opcode.  The prefix below:
;
;   * advances VM_PC to the displacement byte,
;   * reads the displacement into r6,
;   * starts fetching the speculative fallthrough opcode, and
;   * performs a condition-specific test of saved AVM FLAGS.
;
; The not-taken path preserves the sequential SPI stream.  The taken path
; discards it, computes nextPC + sign_extend(rel8), and seeks to the target.
.macro emit_branch_rel8_bit opcode, label, skip, flag
    handler_begin \opcode, \label

    ; Previous OUT-to-handler-entry latency is nine cycles.  These eight
    ; cycles place this OUT exactly 17 cycles after the preceding OUT.
    adiw VM_PC, 1
    delay_4
    delay_1
    cli
    out  SPDR, ZERO
    in   r6, SPDR
    sei

    ; For branch-on-set use SBRS; for branch-on-clear use SBRC.  A satisfied
    ; condition skips the not-taken jump.
    \skip VM_FLAGS, \flag
    rjmp branch_rel8_not_taken_func
    rjmp branch_rel8_taken_func

    handler_end \opcode
.endm

.macro emit_branch_rel8_mask opcode, label, take_branch
    handler_begin \opcode, \label

    adiw VM_PC, 1
    delay_4
    delay_1
    cli
    out  SPDR, ZERO
    in   r6, SPDR
    sei

    ; ULE and UGT depend on C|Z.  r26 is interpreter scratch and supports
    ; ANDI directly.
    mov  r26, VM_FLAGS
    andi r26, (_BV(SREG_C) | _BV(SREG_Z))
    \take_branch 1f
    rjmp branch_rel8_not_taken_func
1:
    rjmp branch_rel8_taken_func

    handler_end \opcode
.endm

emit_branch_rel8_bit  0xF5, I_F5__BREQ_rel8,  sbrs, SREG_Z
emit_branch_rel8_bit  0xF6, I_F6__BRNE_rel8,  sbrc, SREG_Z
emit_branch_rel8_bit  0xF7, I_F7__BRULT_rel8, sbrs, SREG_C
emit_branch_rel8_bit  0xF8, I_F8__BRUGE_rel8, sbrc, SREG_C
emit_branch_rel8_bit  0xF9, I_F9__BRSLT_rel8, sbrs, SREG_S
emit_branch_rel8_bit  0xFA, I_FA__BRSGE_rel8, sbrc, SREG_S
emit_branch_rel8_mask 0xFB, I_FB__BRULE_rel8, brne
emit_branch_rel8_mask 0xFC, I_FC__BRUGT_rel8, breq

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xFD: Memory and Program-Space Extension
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    handler_begin 0xFD, I_FD__ext_memory_program

    ; The secondary-opcode transfer was started by the preceding dispatch.
    ; Account for the secondary byte, then fetch it while starting the first
    ; secondary operand (or the following primary opcode for a two-byte form).
    adiw VM_PC, 1
    delay_3
    rjmp fd_extension_decode_func

    handler_end 0xFD

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xFE: Direct Far Control (JMPF/CALLF)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    handler_begin 0xFE, I_FE__JMPF_CALLF
    rjmp fe_far_control_func
    handler_end 0xFE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xFF: RET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    handler_begin 0xFF, I_FF__RET
    rjmp ff_ret_func
    handler_end 0xFF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Direct control-flow and stack-frame support
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Push the logical return address currently held in CB:PC.
;
; The final stack layout is:
;   [SP+0] = return bits 7:0
;   [SP+1] = return bits 15:8
;   [SP+2] = return bits 23:16
;
; Clobbers r26 and native SREG only. AVM CC is held separately in VM_FLAGS.
push_return_address_func:
    in   r26, VM_CB
    st   -Y, r26
    st   -Y, VM_PCH
    st   -Y, VM_PCL
    ret

; Restart the external-flash stream at the already-installed CB:PC and enter
; the selected primary handler. PC already names the target opcode, so this
; path deliberately does not increment it.
seek_and_dispatch_current_pc_func:
    rcall fx_seek_to_pc
    in   r6, SPDR
    out  SPDR, ZERO
    ; Normal dispatch takes nine cycles from the OUT that starts the operand
    ; transfer through entry to the selected handler:
    ;
    ;   OUT + ADIW(2) + MUL(2) + MOVW + SUBI + IJMP(2) = 9
    ;
    ; This restart path has no ADIW, so use a two-cycle delay. A one-cycle
    ; delay enters the resumed handler one cycle early and can make its first
    ; pipelined SPI access collide with the still-active operand transfer.
    delay_2
    mul  r6, C_DISPATCH_STRIDE_WORDS
    movw r30, r0
    subi r31, hi8(-(pm(DISPATCH_ORG)))
    ijmp

; E5 rel8: unconditional same-bank relative jump.
e5_jmp_rel8_func:
    ; PC advances from the primary opcode to the displacement byte while the
    ; transfer that was started by the preceding dispatch completes.
    adiw VM_PC, 1
    delay_4
    delay_2
    in   r6, SPDR

    ; The displacement is relative to nextPC.
    adiw VM_PC, 1
    add  VM_PCL, r6
    adc  VM_PCH, ZERO
    sbrc r6, 7
    dec  VM_PCH
    rjmp seek_and_dispatch_current_pc_func

; E6 rel8: push CB:nextPC and perform a same-bank relative call.
e6_call_rel8_func:
    adiw VM_PC, 1
    delay_4
    delay_2
    in   r6, SPDR

    ; Install nextPC long enough to push the complete return address.
    adiw VM_PC, 1
    rcall push_return_address_func

    add  VM_PCL, r6
    adc  VM_PCH, ZERO
    sbrc r6, 7
    dec  VM_PCH
    rjmp seek_and_dispatch_current_pc_func

; E7 simm8: SP = SP + sign_extend(simm8).
e7_adjsp_func:
    ; Start fetching the following primary opcode while reading the immediate.
    adiw VM_PC, 1
    delay_4
    delay_1
    cli
    out  SPDR, ZERO
    in   r6, SPDR
    sei

    add  VM_SPL, r6
    adc  VM_SPH, ZERO
    sbrc r6, 7
    dec  VM_SPH

    ; PC still names the immediate byte. dispatch_reverse advances it to the
    ; already-prefetched following opcode. The native arithmetic flags are not
    ; copied to VM_FLAGS, so architectural CC is preserved.
    rcall fx_seek_delay_7
    rjmp dispatch_reverse_func

; Fetch a little-endian 16-bit direct target into r5:r4.
;
; At entry the low target byte is already in flight. No fallthrough byte is
; fetched because both users transfer control unconditionally.
fetch_direct_target16_func:
    delay_4
    delay_4
    out  SPDR, ZERO
    in   r4, SPDR
    rcall fx_seek_delay_17
    in   r5, SPDR
    ret

; EA addr16: absolute jump within the current bank.
ea_jmp16_func:
    rcall fetch_direct_target16_func
    movw VM_PC, r4
    rjmp seek_and_dispatch_current_pc_func

; EB addr16: push CB:nextPC and call an absolute address in the current bank.
eb_call16_func:
    rcall fetch_direct_target16_func

    ; The instruction is three bytes: opcode plus two address bytes.
    adiw VM_PC, 3
    rcall push_return_address_func

    movw VM_PC, r4
    rjmp seek_and_dispatch_current_pc_func

; FE T0 T1 T2: direct far jump/call.
;
; T0 bit 0 selects CALLF when set. The target is T2:T1:(T0 & 0xFE).
; All far targets are therefore even. No speculative fallthrough transfer is
; issued after T2 because both forms replace the execution address.
fe_far_control_func:
    delay_4
    delay_4
    out  SPDR, ZERO
    in   r4, SPDR                 ; T0
    rcall fx_seek_delay_17
    out  SPDR, ZERO
    in   r5, SPDR                 ; T1
    rcall fx_seek_delay_17
    in   r6, SPDR                 ; T2 / target bank

    sbrc r4, 0
    rjmp fe_callf_func

fe_jmpf_func:
    lsr  r4
    lsl  r4
    movw VM_PC, r4
    out  VM_CB, r6
    rjmp seek_and_dispatch_current_pc_func

fe_callf_func:
    ; Preserve the encoded target while CB:nextPC is pushed.
    lsr  r4
    lsl  r4
    adiw VM_PC, 4
    rcall push_return_address_func
    movw VM_PC, r4
    out  VM_CB, r6
    rjmp seek_and_dispatch_current_pc_func

; FF: discard the speculative sequential byte, pop CB:PC, and restart fetch.
ff_ret_func:
    ld   VM_PCL, Y+
    ld   VM_PCH, Y+
    ld   r6, Y+
    out  VM_CB, r6
    ; RET reaches the restart path before the speculative byte issued while
    ; dispatching 0xFF has completed. Drain that transfer before toggling the
    ; flash chip select; otherwise an operand-bearing return target can read
    ; stale SPDR data. Other taken-control paths have already spent at least
    ; this long decoding their operands.
    delay_4
    rjmp seek_and_dispatch_current_pc_func

; Keep common trap targets close to all secondary dispatch tables. Primary
; handlers use absolute JMP because the earliest primary slots are outside
; RJMP range of the end of the fixed dispatch table.
unimplemented_instruction_func:
    rjmp unimplemented_instruction_func

invalid_primary_instruction_func:
    rjmp invalid_primary_instruction_func

invalid_secondary_instruction_func:
    rjmp invalid_secondary_instruction_func

invalid_syscall_func:
    rjmp invalid_syscall_func

ldi8_dispatch_reverse_func:
    delay_4
branch_short_dispatch_reverse_func:
    delay_2
dispatch_reverse_func:
    dispatch_reverse

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; General rel8 branch continuations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

branch_rel8_not_taken_func:
    ; The shortest condition path reaches here five cycles after the OUT that
    ; started fetching the fallthrough opcode. dispatch_reverse executes three
    ; cycles before its OUT, so pad nine cycles to maintain the 17-cycle
    ; OUT-to-OUT SPI cadence.
    rcall fx_seek_delay_7
    rjmp dispatch_reverse_func

branch_rel8_taken_func:
    ; The primary handler advanced PC to the displacement byte.  Advance once
    ; more to nextPC, then add the signed displacement in r6.
    adiw VM_PC, 1
    add  VM_PCL, r6
    adc  VM_PCH, ZERO
    sbrc r6, 7
    dec  VM_PCH

    ; Discard the speculative fallthrough byte and restart the stream at the
    ; branch target. PC already names the target opcode, so the common restart
    ; path dispatches it without incrementing PC.
    rjmp seek_and_dispatch_current_pc_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Shared secondary-table support
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.macro secondary_entries count, target
    .rept \count
        rjmp \target
    .endr
.endm

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xE0 miscellaneous extension page
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

e0_extension_decode_func:
    cli
    out  SPDR, ZERO
    in   r6, SPDR
    sei

    ldi  r30, lo8(pm(e0_secondary_table))
    ldi  r31, hi8(pm(e0_secondary_table))
    add  r30, r6
    adc  r31, ZERO
    ijmp

; E3 reads the packed secondary byte while starting the following primary
; opcode. MOV16 is the hot form: its 00dddsss encoding indexes a two-word
; executable slot containing MOVW plus a jump to the local dispatch copy.
; MOV8Z, MOV8S, and CSET share compact generic handlers.
e3_extension_decode_func:
    cli
    out  SPDR, ZERO
    in   r6, SPDR
    sei

    ; Select the instruction family from bits 7:6. The MOV16 not-taken path is
    ; deliberately arranged to preserve a 17-cycle OUT-to-OUT cadence.
    mov  r26, r6
    andi r26, 0xC0
    brne 1f

    ; 00dddsss: two AVR words per executable MOV16 table slot.
    lsl  r6
    ldi  r30, lo8(pm(e3_mov16_table))
    ldi  r31, hi8(pm(e3_mov16_table))
    add  r30, r6
    adc  r31, ZERO
    ; We have one cycle to spare before dispatch timing.
    nop
    ijmp

1:
    cpi  r26, 0xC0
    breq 2f
    jmp  e3_mov8_family
2:
    jmp  e3_cset_family

; Reserved E0 cleanup:
;   24-27  former compact LSL16; compact shifts use F4 ADD.NF cN,cN
;   48-4F  former ZEXT8; assembler aliases encode as E3 MOV8Z rN,bN
;   50-57  former SEXT8; assembler aliases encode as E3 MOV8S rN,bN
;   8C-8F  former compact LDI8; compact loads use primary F0-F3
;   EC-EF  former compact TST16; compact tests use primary A0/A5/AA/AF
;   F4-F7  former compact TST8; compact tests use primary B0/B5/BA/BF
;
e0_secondary_table:
    secondary_entries 8, e0_not16_family       ; 00-07
    secondary_entries 8, e0_neg16_family       ; 08-0F
    secondary_entries 8, e0_inc16_family       ; 10-17
    secondary_entries 8, e0_dec16_family       ; 18-1F
    secondary_entries 4, e0_lsl16_family       ; 20-23 LSL16 r0-r3
    secondary_entries 4, invalid_secondary_instruction_func ; 24-27 reserved
    secondary_entries 8, e0_lsr16_family       ; 28-2F
    secondary_entries 8, e0_asr16_family       ; 30-37 ASR16
    secondary_entries 8, e0_lsr8_family        ; 38-3F LSR8
    secondary_entries 8, e0_asr8_family        ; 40-47 ASR8
    secondary_entries 16, invalid_secondary_instruction_func ; 48-57 reserved
    secondary_entries 8, e0_swap8_family       ; 58-5F
    secondary_entries 8, e0_getsp_family       ; 60-67
    secondary_entries 8, e0_setsp_family       ; 68-6F
    secondary_entries 8, e0_mtpb_family        ; 70-77
    secondary_entries 8, e0_mfpb_family        ; 78-7F
    secondary_entries 8, e0_imm16_family       ; 80-87 LDI16
    secondary_entries 4, e0_imm8_family        ; 88-8B LDI8 r0-r3
    secondary_entries 4, invalid_secondary_instruction_func ; 8C-8F reserved
    secondary_entries 48, e0_imm16_family      ; 90-BF ALU/CMPI16
    secondary_entries 8, e0_imm8_family        ; C0-C7 CMPI8
    secondary_entries 8, unimplemented_instruction_func ; C8-CF JMPR r0-r7
    secondary_entries 8, unimplemented_instruction_func ; D0-D7 CALLR r0-r7
    rjmp e0_jmpp_q0                            ; D8 JMPP q0
    rjmp e0_jmpp_q1                            ; D9 JMPP q1
    rjmp e0_jmpp_q2                            ; DA JMPP q2
    rjmp e0_jmpp_q3                            ; DB JMPP q3
    secondary_entries 4, invalid_secondary_instruction_func ; DC-DF reserved
    rjmp e0_callp_q0                           ; E0 CALLP q0
    rjmp e0_callp_q1                           ; E1 CALLP q1
    rjmp e0_callp_q2                           ; E2 CALLP q2
    rjmp e0_callp_q3                           ; E3 CALLP q3
    secondary_entries 4, invalid_secondary_instruction_func ; E4-E7 reserved
    secondary_entries 4, e0_tst16_family       ; E8-EB TST16 r0-r3
    secondary_entries 4, invalid_secondary_instruction_func ; EC-EF reserved
    secondary_entries 4, e0_tst8_family        ; F0-F3 TST8 r0-r3
    secondary_entries 4, invalid_secondary_instruction_func ; F4-F7 reserved
    secondary_entries 8, invalid_secondary_instruction_func ; F8-FF reserved
e0_secondary_table_end:

.if ((e0_secondary_table_end - e0_secondary_table) != (256 * 2))
    .error "E0 secondary dispatch table must contain exactly 256 words"
.endif

.macro e0_select_register
    mov  r26, r6
    andi r26, 0x07
    lsl  r26
    subi r26, -8
    clr  r27
.endm

e0_not16_family:
    e0_select_register
    ld   r4, X+
    ld   r5, X
    com  r4
    com  r5
    st   X, r5
    st   -X, r4
    ; Revised NOT16 preserves all AVM CC.
    rjmp dispatch_func

e0_neg16_family:
    e0_select_register
    ld   r4, X+
    ld   r5, X
    mov  r0, ZERO
    mov  r1, ZERO
    sub  r0, r4
    sbc  r1, r5
    st   X, r1
    st   -X, r0
    ; Revised NEG16 preserves all AVM CC.
    rjmp dispatch_func

e0_inc16_family:
    e0_select_register
    ld   r4, X+
    ld   r5, X
    inc  r4
    brne 1f
    inc  r5
1:
    st   X, r5
    st   -X, r4
    ; Revised INC16 preserves all AVM CC.
    rjmp dispatch_func

e0_dec16_family:
    e0_select_register
    ld   r4, X+
    ld   r5, X
    tst  r4
    brne 1f
    dec  r5
1:
    dec  r4
    st   X, r5
    st   -X, r4
    ; Revised DEC16 preserves all AVM CC.
    rjmp dispatch_func

e0_lsl16_family:
    e0_select_register
    ld   r4, X+
    ld   r5, X
    lsl  r4
    rol  r5
    st   X, r5
    st   -X, r4
    ; Revised LSL16 preserves all AVM CC.
    rjmp dispatch_func

e0_lsr16_family:
    e0_select_register
    ld   r4, X+
    ld   r5, X
    lsr  r5
    ror  r4
    st   X, r5
    st   -X, r4
    ; Revised LSR16 preserves all AVM CC.
    rjmp dispatch_func

e0_asr16_family:
    e0_select_register
    ld   r4, X+
    ld   r5, X
    asr  r5
    ror  r4
    st   X, r5
    st   -X, r4
    ; Revised ASR16 preserves all AVM CC.
    rjmp dispatch_func

e0_lsr8_family:
    e0_select_register
    ld   r4, X
    lsr  r4
    st   X, r4
    ; LSR8 changes only the low byte and preserves all AVM CC.
    rjmp dispatch_func

e0_asr8_family:
    e0_select_register
    ld   r4, X
    asr  r4
    st   X, r4
    ; ASR8 changes only the low byte and preserves all AVM CC.
    rjmp dispatch_func

e0_swap8_family:
    e0_select_register
    ld   r4, X
    swap r4
    st   X, r4
    rjmp dispatch_func

e0_getsp_family:
    e0_select_register
    st   X+, VM_SPL
    st   X, VM_SPH
    rjmp dispatch_func

e0_setsp_family:
    e0_select_register
    ld   r4, X+
    ld   r5, X
    movw VM_SP, r4
    rjmp dispatch_func

e0_mtpb_family:
    e0_select_register
    ld   r4, X
    out  VM_PB, r4
    rjmp dispatch_func

e0_mfpb_family:
    e0_select_register
    in   r4, VM_PB
    st   X+, r4
    st   X, ZERO
    rjmp dispatch_func

; E0 D8-DB: JMPP qN
; E0 E0-E3: CALLP qN
;
; Register-form code pointers are canonical 24-bit values:
;   low q-register       = target PC bits 15:0
;   low byte of high q-register = target CB bits 23:16
;   high byte of high q-register = zero in canonical form
;
; Optimized execution does not validate the unused top byte. Both operations
; preserve PB and AVM CC. At entry, PC names the E0 secondary byte and the
; decoder has started a speculative transfer of the following primary opcode.
;
; JMPP reaches fx_seek_to_pc's flash deselect at the 17-cycle boundary from the
; decoder OUT, so no additional transfer-drain delay is required.

.macro emit_e0_jmpp label, target_pc, target_cb
\label:
    movw VM_PC, \target_pc
    out  VM_CB, \target_cb
    rjmp seek_and_dispatch_current_pc_func
.endm

.macro emit_e0_callp label, target_pc, target_cb
\label:
    ; Return address is the byte following the two-byte E0 instruction.
    adiw VM_PC, 1
    rcall push_return_address_func
    movw VM_PC, \target_pc
    out  VM_CB, \target_cb
    rjmp seek_and_dispatch_current_pc_func
.endm

; q0 = r0:r1, q1 = r2:r3, q2 = r4:r5, q3 = r6:r7.
emit_e0_jmpp e0_jmpp_q0, VM_R0, VM_R1L
emit_e0_jmpp e0_jmpp_q1, VM_R2, VM_R3L
emit_e0_jmpp e0_jmpp_q2, VM_R4, VM_R5L
emit_e0_jmpp e0_jmpp_q3, VM_R6, VM_R7L

emit_e0_callp e0_callp_q0, VM_R0, VM_R1L
emit_e0_callp e0_callp_q1, VM_R2, VM_R3L
emit_e0_callp e0_callp_q2, VM_R4, VM_R5L
emit_e0_callp e0_callp_q3, VM_R6, VM_R7L

; Immediate-family entry invariant:
;   * PC names the E0 secondary opcode.
;   * The decoder's OUT has started the first immediate byte.
;   * r6 still contains the secondary opcode until the immediate is read.
;   * X may safely retain the selected AVM register-file address.
;
; The first fetch advances PC to immediate byte 0, reads it, and starts byte 1
; (or the following primary opcode for an imm8 instruction). Register selection
; consumes five cycles; ADIW+CLI supply the remaining three pre-OUT cycles for
; the normal 17-cycle SPI OUT-to-OUT cadence.
.macro e0_fetch_first_immediate dst
    adiw VM_PC, 1
    cli
    out  SPDR, ZERO
    in   \dst, SPDR
    sei
.endm

; After the first immediate byte has been read, advance PC to byte 1, read it,
; and start the following primary opcode. This matches the cadence used by the
; FD absolute-address handlers.
.macro e0_fetch_second_immediate dst
    adiw VM_PC, 1
    delay_4
    delay_4
    delay_3
    cli
    out  SPDR, ZERO
    in   \dst, SPDR
    sei
.endm

; The imm8 paths have only enough work for a 13-cycle post-OUT interval.
; Three cycles of padding complete the 16-cycle SPI transfer before dispatch
; reads the following primary opcode. The generic imm16 decode is already long
; enough and dispatches directly.
e0_imm8_finish_func:
    delay_3
    rjmp dispatch_func

; E0 80-87 and 90-BF: all imm16 forms share fetch and register decode. The
; operation index is (secondary & 0x78) >> 3:
;   0 LDI16, 1 unused, 2 ADDI16, 3 SUBI16,
;   4 ANDI16, 5 ORI16, 6 XORI16, 7 CMPI16.
e0_imm16_family:
    e0_select_register
    e0_fetch_first_immediate r4
    e0_fetch_second_immediate r5

    mov  r30, r6
    andi r30, 0x78
    lsr  r30
    lsr  r30
    lsr  r30
    clr  r31
    subi r30, lo8(-(pm(e0_imm16_operation_table)))
    sbci r31, hi8(-(pm(e0_imm16_operation_table)))
    ijmp

e0_imm16_operation_table:
    rjmp e0_ldi16_operation
    rjmp invalid_secondary_instruction_func
    rjmp e0_addi16_operation
    rjmp e0_subi16_operation
    rjmp e0_andi16_operation
    rjmp e0_ori16_operation
    rjmp e0_xori16_operation
    rjmp e0_cmpi16_operation

e0_ldi16_operation:
    st   X+, r4
    st   X, r5
    rjmp dispatch_func

e0_addi16_operation:
    ld   r0, X+
    ld   r1, X
    add  r0, r4
    adc  r1, r5
    st   X, r1
    st   -X, r0
    rjmp dispatch_func

e0_subi16_operation:
    ld   r0, X+
    ld   r1, X
    sub  r0, r4
    sbc  r1, r5
    st   X, r1
    st   -X, r0
    rjmp dispatch_func

e0_andi16_operation:
    ld   r0, X+
    ld   r1, X
    and  r0, r4
    and  r1, r5
    st   X, r1
    st   -X, r0
    rjmp dispatch_func

e0_ori16_operation:
    ld   r0, X+
    ld   r1, X
    or   r0, r4
    or   r1, r5
    st   X, r1
    st   -X, r0
    rjmp dispatch_func

e0_xori16_operation:
    ld   r0, X+
    ld   r1, X
    eor  r0, r4
    eor  r1, r5
    st   X, r1
    st   -X, r0
    rjmp dispatch_func

e0_cmpi16_operation:
    ld   r0, X+
    ld   r1, X
    cp   r0, r4
    cpc  r1, r5
    in   VM_FLAGS, SREG
    rjmp dispatch_func

; E0 88-8B / C0-C7: bit 6 distinguishes zero-extending LDI8 from CMPI8.
e0_imm8_family:
    e0_select_register
    e0_fetch_first_immediate r4
    sbrs r6, 6
    rjmp e0_ldi8_operation

    ld   r0, X
    cp   r0, r4
    in   VM_FLAGS, SREG
    nop
    rjmp e0_imm8_finish_func

e0_ldi8_operation:
    st   X+, r4
    st   X, ZERO
    rjmp e0_imm8_finish_func

; E0 E8-EB: TST16 r0-r3
e0_tst16_family:
    e0_select_register
    ld   r4, X+
    ld   r5, X
    cp   r4, ZERO
    cpc  r5, ZERO
    in   VM_FLAGS, SREG
    rjmp dispatch_func

; E0 F0-F3: TST8 r0-r3
e0_tst8_family:
    e0_select_register
    ld   r4, X
    cp   r4, ZERO
    in   VM_FLAGS, SREG
    rjmp dispatch_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xE4 CMPI6 direct-primary body
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

e4_cmpi6_func:
    ; Start fetching the following primary opcode and read the packed operand.
    cli
    out  SPDR, ZERO
    in   r6, SPDR
    sei

    ; Operand encoding:
    ;   bits 7:2 = signed six-bit immediate
    ;   bits 1:0 = compact register
    mov  r26, r6
    andi r26, 0x03
    lsl  r26
    subi r26, -16
    clr  r27

    asr  r6
    asr  r6

    ld   r4, X+
    ld   r5, X

    mov  r0, r6
    lsl  r0
    sbc  r0, r0

    cp   r4, r6
    cpc  r5, r0
    in   VM_FLAGS, SREG
    rjmp dispatch_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SYS service dispatch
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

e9_sys_decode_func:
    ; Start fetching the following primary opcode and read the service ID.
    cli
    out  SPDR, ZERO
    in   r6, SPDR
    sei
    rjmp sys_dispatch_func

sys_dispatch_func:
    ldi  r30, lo8(pm(sys_dispatch_table))
    ldi  r31, hi8(pm(sys_dispatch_table))
    add  r30, r6
    adc  r31, ZERO
    ijmp

.macro sys_entries count, target
    .rept \count
        rjmp \target
    .endr
.endm

.if (SYS_DEBUG_PUTC != 0x00)
    .error "SYS_DEBUG_PUTC must occupy dispatch-table entry 0"
.endif
.if (SYS_DEBUG_BREAK != 0x01)
    .error "SYS_DEBUG_BREAK must occupy dispatch-table entry 1"
.endif

sys_dispatch_table:
    sys_entries 1,   sys_debug_putc_func
    sys_entries 1,   sys_debug_break_func
    sys_entries 254, invalid_syscall_func
sys_dispatch_table_end:

.if ((sys_dispatch_table_end - sys_dispatch_table) != (256 * 2))
    .error "SYS dispatch table must contain exactly 256 words"
.endif

sys_debug_putc_func:
    ; SYS DEBUG_PUTC writes low8(A), where A aliases c0/r4.
    sts  UEDATX, VM_C0L
    delay_2
    rjmp dispatch_func

sys_debug_break_func:
    break
    delay_3
    rjmp dispatch_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xFD secondary dispatch
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

fd_extension_decode_func:
    cli
    out  SPDR, ZERO
    in   r6, SPDR
    sei

    ldi  r30, lo8(pm(fd_secondary_table))
    ldi  r31, hi8(pm(fd_secondary_table))
    add  r30, r6
    adc  r31, ZERO
    ijmp

fd_secondary_table:
    secondary_entries 1, fd_ld8_indirect_family
    secondary_entries 1, fd_st8_indirect_family
    secondary_entries 1, fd_ld16_indirect_family
    secondary_entries 1, fd_st16_indirect_family
    secondary_entries 1, fd_ld8_post_family
    secondary_entries 1, fd_st8_post_family
    secondary_entries 1, fd_ld16_post_family
    secondary_entries 1, fd_st16_post_family
    secondary_entries 1, fd_lea_displaced_family
    secondary_entries 1, fd_ld8_displaced_family
    secondary_entries 1, fd_st8_displaced_family
    secondary_entries 1, fd_ld16_displaced_family
    secondary_entries 1, fd_st16_displaced_family
    secondary_entries 3, invalid_secondary_instruction_func
    secondary_entries 8, fd_ldsp8_family
    secondary_entries 8, fd_stsp8_family
    secondary_entries 8, fd_ldsp16_family
    secondary_entries 8, fd_stsp16_family
    secondary_entries 8, fd_ldm8_family
    secondary_entries 8, fd_stm8_family
    secondary_entries 8, fd_ldm16_family
    secondary_entries 8, fd_stm16_family
    secondary_entries 48, invalid_secondary_instruction_func
    secondary_entries 1, fd_ldp8_family
    secondary_entries 1, fd_ldp16_family
    secondary_entries 1, fd_ldp8_displaced_family
    secondary_entries 1, fd_ldp16_displaced_family
    secondary_entries 124, invalid_secondary_instruction_func
fd_secondary_table_end:

.if ((fd_secondary_table_end - fd_secondary_table) != (256 * 2))
    .error "FD secondary dispatch table must contain exactly 256 words"
.endif

;*******************************************************************************
; FD data-space handlers
;
; The decoder has read the FD secondary opcode into r6 and started the first
; operand transfer. PC names the secondary opcode.
;
; Revised RRSPEC nibbles are pre-scaled register offsets:
;   nibble = 2 * architectural register number
;   native low-byte address = 8 + nibble
;
; For two-register forms operand 0 is in the high nibble and operand 1 is in
; the low nibble.
;*******************************************************************************

; Decode a pre-scaled RRSPEC field to the low-byte native register-file address.
.macro fd_decode_low_x spec
    mov  r26, \spec
    andi r26, 0x0E
    subi r26, -8
    clr  r27
.endm

.macro fd_decode_high_x spec
    mov  r26, \spec
    swap r26
    andi r26, 0x0E
    subi r26, -8
    clr  r27
.endm

.macro fd_decode_low_z spec
    mov  r30, \spec
    andi r30, 0x0E
    subi r30, -8
    clr  r31
.endm

.macro fd_decode_high_z spec
    mov  r30, \spec
    swap r30
    andi r30, 0x0E
    subi r30, -8
    clr  r31
.endm

; For secondary-opcode ranges whose low three bits directly select r0-r7.
.macro fd_select_secondary_reg_z
    mov  r30, r6
    andi r30, 0x07
    lsl  r30
    subi r30, -8
    clr  r31
.endm

; Read the first operand byte into r6 and start the following byte. This macro
; is used immediately on entry to an FD family whose first operand is RRSPEC.
; The eight pre-OUT cycles preserve the normal 17-cycle SPI cadence.
.macro fd_fetch_rrspec
    adiw VM_PC, 1
    delay_4
    delay_1
    cli
    out  SPDR, ZERO
    in   r6, SPDR
    sei
.endm

; Stack-relative and absolute-memory families spend five cycles selecting rN
; before this macro. Together with ADIW+CLI, the next OUT occurs 17 cycles
; after the decoder's OUT.
.macro fd_fetch_first_selected_operand dst
    adiw VM_PC, 1
    cli
    out  SPDR, ZERO
    in   \dst, SPDR
    sei
.endm

; The first absolute-address byte was just read and the high byte is in flight.
; Start fetching the following primary opcode while reading that high byte.
.macro fd_fetch_absolute_high dst
    adiw VM_PC, 1
    delay_4
    delay_4
    delay_3
    cli
    out  SPDR, ZERO
    in   \dst, SPDR
    sei
.endm

; The displaced handlers have already decoded and captured both RRSPEC
; operands while the displacement byte was transferring.
.macro fd_fetch_displacement dst
    adiw VM_PC, 1
    cli
    out  SPDR, ZERO
    in   \dst, SPDR
    sei
.endm

; All FD handlers reach here after starting the following primary opcode.
; Seven conservative cycles guarantee that even the shortest handler does not
; read that opcode before its SPI transfer completes.
fd_finish_func:
    rcall fx_seek_delay_7
    rjmp dispatch_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FD 00-03: generic register-indirect loads and stores
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; FD 00 RRSPEC: LD8 rD,[rA]
fd_ld8_indirect_family:
    fd_fetch_rrspec

    ; Capture the original address before the destination can be overwritten.
    fd_decode_low_x r6
    ld   r4, X+
    ld   r5, X

    movw r30, r4
    ld   r4, Z

    fd_decode_high_x r6
    st   X+, r4
    st   X, ZERO
    rjmp fd_finish_func

; FD 01 RRSPEC: ST8 [rA],rS
fd_st8_indirect_family:
    fd_fetch_rrspec

    fd_decode_high_x r6
    ld   r4, X+
    ld   r5, X

    ; Capture the source before touching the addressed data byte.
    fd_decode_low_x r6
    ld   r0, X

    movw r30, r4
    st   Z, r0
    rjmp fd_finish_func

; FD 02 RRSPEC: LD16 rD,[rA]
fd_ld16_indirect_family:
    fd_fetch_rrspec

    fd_decode_low_x r6
    ld   r4, X+
    ld   r5, X

    movw r30, r4
    ld   r0, Z+
    ld   r1, Z

    fd_decode_high_x r6
    st   X+, r0
    st   X, r1
    rjmp fd_finish_func

; FD 03 RRSPEC: ST16 [rA],rS
fd_st16_indirect_family:
    fd_fetch_rrspec

    fd_decode_high_x r6
    ld   r4, X+
    ld   r5, X

    fd_decode_low_x r6
    ld   r0, X+
    ld   r1, X

    movw r30, r4
    st   Z+, r0
    st   Z, r1
    rjmp fd_finish_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FD 04-07: generic postincrement loads and stores
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; FD 04 RRSPEC: LD8 rD,[rA+]
; rD == rA is invalid by the ISA operand restriction.
fd_ld8_post_family:
    fd_fetch_rrspec

    ; Z remains positioned at the high byte of rA so the updated address can be
    ; written back after the memory operation.
    fd_decode_low_z r6
    ld   r4, Z+
    ld   r5, Z

    movw r26, r4
    ld   r0, X+

    st   Z, r27
    st   -Z, r26

    fd_decode_high_z r6
    st   Z+, r0
    st   Z, ZERO
    rjmp fd_finish_func

; FD 05 RRSPEC: ST8 [rA+],rS
fd_st8_post_family:
    fd_fetch_rrspec

    fd_decode_high_z r6
    ld   r4, Z+
    ld   r5, Z

    ; Capture rS before updating rA, including the rS == rA case.
    fd_decode_low_x r6
    ld   r0, X

    movw r26, r4
    st   X+, r0

    st   Z, r27
    st   -Z, r26
    rjmp fd_finish_func

; FD 06 RRSPEC: LD16 rD,[rA+]
; rD == rA is invalid by the ISA operand restriction.
fd_ld16_post_family:
    fd_fetch_rrspec

    fd_decode_low_z r6
    ld   r4, Z+
    ld   r5, Z

    movw r26, r4
    ld   r0, X+
    ld   r1, X+

    st   Z, r27
    st   -Z, r26

    fd_decode_high_z r6
    st   Z+, r0
    st   Z, r1
    rjmp fd_finish_func

; FD 07 RRSPEC: ST16 [rA+],rS
fd_st16_post_family:
    fd_fetch_rrspec

    fd_decode_high_z r6
    ld   r4, Z+
    ld   r5, Z

    fd_decode_low_x r6
    ld   r0, X+
    ld   r1, X

    movw r26, r4
    st   X+, r0
    st   X+, r1

    st   Z, r27
    st   -Z, r26
    rjmp fd_finish_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FD 08-0C: LEA and signed-displaced loads and stores
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; FD 08 RRSPEC disp8: LEA rD,[rA+simm8]
fd_lea_displaced_family:
    fd_fetch_rrspec

    fd_decode_low_x r6
    ld   r4, X+
    ld   r5, X
    fd_decode_high_z r6

    fd_fetch_displacement r6

    add  r4, r6
    adc  r5, ZERO
    sbrc r6, 7
    dec  r5

    st   Z+, r4
    st   Z, r5
    rjmp fd_finish_func

; FD 09 RRSPEC disp8: LD8 rD,[rA+simm8]
fd_ld8_displaced_family:
    fd_fetch_rrspec

    fd_decode_low_x r6
    ld   r4, X+
    ld   r5, X
    fd_decode_high_z r6

    fd_fetch_displacement r6

    add  r4, r6
    adc  r5, ZERO
    sbrc r6, 7
    dec  r5

    movw r26, r4
    ld   r0, X
    st   Z+, r0
    st   Z, ZERO
    rjmp fd_finish_func

; FD 0A RRSPEC disp8: ST8 [rA+simm8],rS
fd_st8_displaced_family:
    fd_fetch_rrspec

    fd_decode_high_x r6
    ld   r4, X+
    ld   r5, X

    fd_decode_low_z r6
    ld   r0, Z

    fd_fetch_displacement r6

    add  r4, r6
    adc  r5, ZERO
    sbrc r6, 7
    dec  r5

    movw r26, r4
    st   X, r0
    rjmp fd_finish_func

; FD 0B RRSPEC disp8: LD16 rD,[rA+simm8]
fd_ld16_displaced_family:
    fd_fetch_rrspec

    fd_decode_low_x r6
    ld   r4, X+
    ld   r5, X
    fd_decode_high_z r6

    fd_fetch_displacement r6

    add  r4, r6
    adc  r5, ZERO
    sbrc r6, 7
    dec  r5

    movw r26, r4
    ld   r0, X+
    ld   r1, X
    st   Z+, r0
    st   Z, r1
    rjmp fd_finish_func

; FD 0C RRSPEC disp8: ST16 [rA+simm8],rS
fd_st16_displaced_family:
    fd_fetch_rrspec

    fd_decode_high_x r6
    ld   r4, X+
    ld   r5, X

    fd_decode_low_z r6
    ld   r0, Z+
    ld   r1, Z

    fd_fetch_displacement r6

    add  r4, r6
    adc  r5, ZERO
    sbrc r6, 7
    dec  r5

    movw r26, r4
    st   X+, r0
    st   X, r1
    rjmp fd_finish_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FD 10-2F: stack-relative loads and stores
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; FD 10-17 u8: LDSP8 rN,[SP+u8]
fd_ldsp8_family:
    fd_select_secondary_reg_z
    fd_fetch_first_selected_operand r6

    movw r26, VM_SP
    add  r26, r6
    adc  r27, ZERO
    ld   r0, X

    st   Z+, r0
    st   Z, ZERO
    rjmp fd_finish_func

; FD 18-1F u8: STSP8 [SP+u8],rN
fd_stsp8_family:
    fd_select_secondary_reg_z
    fd_fetch_first_selected_operand r6

    ld   r0, Z
    movw r26, VM_SP
    add  r26, r6
    adc  r27, ZERO
    st   X, r0
    rjmp fd_finish_func

; FD 20-27 u8: LDSP16 rN,[SP+u8]
fd_ldsp16_family:
    fd_select_secondary_reg_z
    fd_fetch_first_selected_operand r6

    movw r26, VM_SP
    add  r26, r6
    adc  r27, ZERO
    ld   r0, X+
    ld   r1, X

    st   Z+, r0
    st   Z, r1
    rjmp fd_finish_func

; FD 28-2F u8: STSP16 [SP+u8],rN
fd_stsp16_family:
    fd_select_secondary_reg_z
    fd_fetch_first_selected_operand r6

    ld   r0, Z+
    ld   r1, Z

    movw r26, VM_SP
    add  r26, r6
    adc  r27, ZERO
    st   X+, r0
    st   X, r1
    rjmp fd_finish_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FD 30-4F: absolute data-space loads and stores
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; FD 30-37 addr16: LDM8 rN,addr16
fd_ldm8_family:
    fd_select_secondary_reg_z
    fd_fetch_first_selected_operand r4
    fd_fetch_absolute_high r5

    movw r26, r4
    ld   r0, X
    st   Z+, r0
    st   Z, ZERO
    rjmp fd_finish_func

; FD 38-3F addr16: STM8 addr16,rN
fd_stm8_family:
    fd_select_secondary_reg_z
    fd_fetch_first_selected_operand r4
    fd_fetch_absolute_high r5

    ld   r0, Z
    movw r26, r4
    st   X, r0
    rjmp fd_finish_func

; FD 40-47 addr16: LDM16 rN,addr16
fd_ldm16_family:
    fd_select_secondary_reg_z
    fd_fetch_first_selected_operand r4
    fd_fetch_absolute_high r5

    movw r26, r4
    ld   r0, X+
    ld   r1, X
    st   Z+, r0
    st   Z, r1
    rjmp fd_finish_func

; FD 48-4F addr16: STM16 addr16,rN
fd_stm16_family:
    fd_select_secondary_reg_z
    fd_fetch_first_selected_operand r4
    fd_fetch_absolute_high r5

    ld   r0, Z+
    ld   r1, Z
    movw r26, r4
    st   X+, r0
    st   X, r1
    rjmp fd_finish_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FD 80-83: program-space loads
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Program-space operands use the same pre-scaled RRSPEC layout as the other FD
; two-register forms: high nibble = rD, low nibble = rA. The complete logical
; source address is PB:rA. All source address bytes and the destination data-
; space pointer are captured before the destination is written, so rD == rA is
; well-defined for both byte and word loads.
;
; fx_read_data_bytes is shared by all four handlers. It reads from a logical
; image-relative 24-bit address and leaves X one byte beyond the copied data.

; FD 80 RRSPEC: LDP8 rD,[PB:rA]
fd_ldp8_family:
    fd_fetch_rrspec

    fd_decode_high_x r6          ; X = destination register low byte
    fd_decode_low_z r6           ; Z = address register low byte
    ld   r4, Z+                  ; logical address bits 7:0
    ld   r5, Z                   ; logical address bits 15:8
    in   r6, VM_PB               ; logical address bits 23:16

    ; PC currently names RRSPEC. Resume at the following primary opcode after
    ; the data read has interrupted the sequential code stream.
    adiw VM_PC, 1
    ldi  r30, 1
    clr  r31
    rcall fx_read_data_bytes

    ; The byte load zero-extends. fx_read_data_bytes left X at rD.high.
    st   X, ZERO
    jmp  seek_and_dispatch_current_pc_func

; FD 81 RRSPEC: LDP16 rD,[PB:rA]
fd_ldp16_family:
    fd_fetch_rrspec

    fd_decode_high_x r6
    fd_decode_low_z r6
    ld   r4, Z+
    ld   r5, Z
    in   r6, VM_PB

    adiw VM_PC, 1
    ldi  r30, 2
    clr  r31
    rcall fx_read_data_bytes
    jmp  seek_and_dispatch_current_pc_func

; FD 82 RRSPEC disp8: LDP8 rD,[PB:rA+simm8]
fd_ldp8_displaced_family:
    fd_fetch_rrspec

    fd_decode_high_x r6
    fd_decode_low_z r6
    ld   r4, Z+
    ld   r5, Z

    ; Read simm8 while starting a speculative transfer of the following opcode.
    ; Add the signed displacement to the complete 24-bit PB:rA address without
    ; modifying PB or rA.
    fd_fetch_displacement r30
    in   r6, VM_PB
    add  r4, r30
    adc  r5, ZERO
    adc  r6, ZERO
    sbrs r30, 7
    rjmp 1f
    ldi  r31, 1
    sub  r5, r31
    sbc  r6, ZERO
1:
    adiw VM_PC, 1
    ldi  r30, 1
    clr  r31
    rcall fx_read_data_bytes

    st   X, ZERO
    jmp  seek_and_dispatch_current_pc_func

; FD 83 RRSPEC disp8: LDP16 rD,[PB:rA+simm8]
fd_ldp16_displaced_family:
    fd_fetch_rrspec

    fd_decode_high_x r6
    fd_decode_low_z r6
    ld   r4, Z+
    ld   r5, Z

    fd_fetch_displacement r30
    in   r6, VM_PB
    add  r4, r30
    adc  r5, ZERO
    adc  r6, ZERO
    sbrs r30, 7
    rjmp 1f
    ldi  r31, 1
    sub  r5, r31
    sbc  r6, ZERO
1:
    adiw VM_PC, 1
    ldi  r30, 2
    clr  r31
    rcall fx_read_data_bytes
    jmp  seek_and_dispatch_current_pc_func

; The next opcode has long since completed transferring.
dispatch_func:
    dispatch

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Generic program-data read
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Read a nonzero number of bytes from an image-relative logical program address
; into AVR data space. This is deliberately generic so SYS services such as a
; future memcpy_P can use the same optimized flash transaction.
;
; Input:
;   r6:r5:r4 = logical source address, high:middle:low
;   X         = destination data-space pointer
;   r31:r30   = nonzero byte count
;
; Output:
;   X         = one byte past the copied range
;
; Clobbers r0:r1, r4:r6, r30:r31. Preserves native SREG and every AVM register
; except bytes explicitly addressed through X, and does not modify VM_FLAGS.
; The routine closes the flash transaction before returning; callers that
; interrupted bytecode execution must subsequently restart the code stream.
fx_read_data_bytes:
    ; Preserve the count while r30 is used for the READ command and image-base
    ; addition. r0:r1 are otherwise interpreter scratch outside MUL dispatch.
    movw r0, r30

    fx_disable
    ldi  r30, SFC_READ
    fx_enable
    out  SPDR, r30

    ; Translate the image-relative logical address to a physical flash address:
    ; physical = (data_page_data << 8) + logical.
    lds  r30, data_page_data+0
    add  r5, r30
    lds  r30, data_page_data+1
    adc  r6, r30

    rcall fx_seek_delay_11
    out  SPDR, r6

    ; The logical high address byte is no longer needed. Keep saved SREG in r6
    ; and shorten this delay by one cycle so address writes remain 17 apart.
    in   r6, SREG
    rcall fx_seek_delay_16
    out  SPDR, r5
    rcall fx_seek_delay_17
    out  SPDR, r4
    rcall fx_seek_delay_16
    out  SPDR, ZERO

    ; Restore and predecrement the count. A one-byte request skips directly to
    ; the final read; longer requests use a 17-cycle pipelined transfer loop.
    movw r30, r0
    sbiw r30, 1
    delay_2
    breq 2f
    delay_2

1:
    rcall fx_seek_delay_7
    cli
    out  SPDR, ZERO
    in   r0, SPDR
    out  SREG, r6
    st   X+, r0
    subi r30, 1
    sbci r31, 0
    brne 1b

2:
    rcall fx_seek_delay_9
    in   r0, SPDR
    st   X+, r0
    fx_disable
    ret

; seek to PC (CB/PC)
fx_seek_to_pc:
    fx_disable
    ldi  r30, SFC_READ
    fx_enable
    out  SPDR, r30
    lds  r26, data_page_data+0
    add  r26, VM_PCH
    lds  r27, data_page_data+1
    in   r30, VM_CB
    adc  r27, r30
    rcall fx_seek_delay_10
    out  SPDR, r27
    rcall fx_seek_delay_17
    out  SPDR, r26
    rcall fx_seek_delay_17
    out  SPDR, VM_PCL
    rcall fx_seek_delay_17
    out  SPDR, r2
    ; wait 16 cycles: 2 + 10 + 4 (from ret)
    ; this way, the next byte is ready to read when this method returns
    delay_2
    rcall fx_seek_delay_10
    ret

; Fixed delay ladder. Each name denotes total cycles from the calling RCALL
; through the returning RET, matching the cadence used by the SPI pipeline.
fx_seek_delay_17:
    nop
fx_seek_delay_16:
    delay_2
fx_seek_delay_14:
    ; Three-cycle fall-through delay that does not clobber r0.
    delay_2
    nop
fx_seek_delay_11:
    nop
fx_seek_delay_10:
    nop
fx_seek_delay_9:
    delay_2
fx_seek_delay_7:
    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Reset/startup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Startup supports both Arduboy FX flashcart launches and development/emulator
; placement at the end of the 16 MiB FX address space.
;
; Flashcart mode:
;   * reserved interrupt-vector slots contain 0x9518 keys
;   * data/save page numbers follow each key in big-endian byte order
;
; Development mode:
;   * check the AVM tail at 0xFFFFF8 (no save sector)
;   * otherwise check 0xFFEFF8 (final 4 KiB is the save sector)
;   * imageBasePage = tailPage + 1 - imagePageCount
;
; Normal startup validates only the fields needed for safe initialization.
startup_func:
    cli

    ; Native AVR hardware stack. The VM stack is held separately in Y.
    ldi  r26, lo8(RAMEND)
    out  SPL, r26
    ldi  r26, hi8(RAMEND)
    out  SPH, r26

    ; Unconditionally clear all SRAM from 0x0100 through RAMEND. This must run
    ; before any startup state is stored in SRAM and before Timer0 is started.
    ; reset_handler reaches startup_func with JMP, so the native stack is empty
    ; while its backing SRAM is cleared.
    clr  ZERO
    ldi  r26, lo8(0x0100)
    ldi  r27, hi8(0x0100)
startup_clear_ram_loop:
    st   X+, ZERO
    cpi  r26, lo8(RAMEND + 1)
    brne startup_clear_ram_loop
    cpi  r27, hi8(RAMEND + 1)
    brne startup_clear_ram_loop

    ; Initialize persistent interpreter state.
    ldi  r26, DISPATCH_STRIDE_WORDS
    mov  C_DISPATCH_STRIDE_WORDS, r26
    ldi  VM_SPL, lo8(VM_SP_INITIAL_VALUE)
    ldi  VM_SPH, hi8(VM_SP_INITIAL_VALUE)
    clr  VM_FLAGS
    out  VM_CB, ZERO
    out  VM_PB, ZERO
    sts  data_page_data+0, ZERO
    sts  data_page_data+1, ZERO
    sts  data_page_save+0, ZERO
    sts  data_page_save+1, ZERO
    sts  data_save_size+0, ZERO
    sts  data_save_size+1, ZERO
    sts  data_startup_flags, ZERO

    ; Configure the complete Arduboy GPIO set before enabling SPI. This leaves
    ; the OLED selected and held in reset, while keeping the FX flash deselected.
    rcall hardware_init_pins_func

    ; Initialize SPI. Startup uses SPIF polling; the bytecode interpreter uses
    ; the fixed-cadence transfer pipeline after the first opcode is primed.
    ; Mode 0, MSB first, f_CPU/2 matches Arduboy2 bootSPI().
    ldi  r26, (_BV(SPE) | _BV(MSTR))
    out  SPCR, r26
    ldi  r26, _BV(SPI2X)
    out  SPSR, r26

    ; Reset and configure the selected SPI OLED controller. This intentionally
    ; does not write pixel data or clear either display RAM or data_display.
    rcall oled_startup_init_func

    ; Release the W25Q128 from power-down.
    fx_enable
    ldi  r30, SFC_RELEASE_POWERDOWN
    rcall fx_spi_transfer_blocking
    fx_disable
    rcall fx_startup_wake_delay

    ; Prefer the page values installed by the FX flashcart bootloader.
    ldi  r30, lo8(FX_VECTOR_KEY_POINTER)
    ldi  r31, hi8(FX_VECTOR_KEY_POINTER)
    lpm  r20, Z+
    lpm  r21, Z+
    cpi  r20, lo8(FX_VECTOR_KEY)
    brne startup_find_development_image
    cpi  r21, hi8(FX_VECTOR_KEY)
    brne startup_find_development_image

    ; The flashcart stores page words high byte first in program flash.
    lpm  r27, Z+
    lpm  r26, Z+
    sts  data_page_data+0, r26
    sts  data_page_data+1, r27

    ; A save page is independently keyed and may be absent.
    lpm  r20, Z+
    lpm  r21, Z+
    cpi  r20, lo8(FX_VECTOR_KEY)
    brne startup_read_header
    cpi  r21, hi8(FX_VECTOR_KEY)
    brne startup_read_header
    lpm  r27, Z+
    lpm  r26, Z+
    sts  data_page_save+0, r26
    sts  data_page_save+1, r27
    ldi  r26, _BV(STARTUP_SAVE_PAGE_VALID)
    sts  data_startup_flags, r26
    rjmp startup_read_header

startup_find_development_image:
    ; First try an image whose tail is at the physical end of flash. This form
    ; has no following save sector.
    ldi  r22, FX_DEV_TAIL_NOSAVE_HI
    ldi  r27, FX_DEV_TAIL_NOSAVE_MID
    ldi  r26, AVM_TAIL_OFFSET_IN_PAGE
    clr  r20                      ; tailPage + 1 = 0x0000
    clr  r21
    rcall startup_try_tail
    brcs startup_read_header

    ; Then try an image ending immediately before the final 4 KiB save sector.
    ldi  r22, FX_DEV_TAIL_SAVE_HI
    ldi  r27, FX_DEV_TAIL_SAVE_MID
    ldi  r26, AVM_TAIL_OFFSET_IN_PAGE
    ldi  r20, FX_DEV_SAVE_PAGE_LO ; tailPage + 1 = save page
    ldi  r21, FX_DEV_SAVE_PAGE_HI
    rcall startup_try_tail
    brcs 1f
    rjmp startup_invalid_image
1:

    ldi  r26, FX_DEV_SAVE_PAGE_LO
    ldi  r27, FX_DEV_SAVE_PAGE_HI
    sts  data_page_save+0, r26
    sts  data_page_save+1, r27
    ldi  r26, _BV(STARTUP_SAVE_PAGE_VALID)
    sts  data_startup_flags, r26

startup_read_header:
    ; Begin a read at imageBase + 0x000000.
    clr  r26
    lds  r27, data_page_data+0
    lds  r22, data_page_data+1
    rcall fx_startup_begin_read

    ; magic[4]
    rcall fx_startup_read_byte
    cpi  r30, AVM_HEADER_MAGIC0
    breq 1f
    rjmp startup_invalid_image
1:
    rcall fx_startup_read_byte
    cpi  r30, AVM_HEADER_MAGIC1
    breq 1f
    rjmp startup_invalid_image
1:
    rcall fx_startup_read_byte
    cpi  r30, AVM_HEADER_MAGIC2
    breq 1f
    rjmp startup_invalid_image
1:
    rcall fx_startup_read_byte
    cpi  r30, AVM_HEADER_MAGIC3
    breq 1f
    rjmp startup_invalid_image
1:

    ; One coarse compatibility byte covers the ISA, ABI, and runtime services.
    rcall fx_startup_read_byte
    cpi  r30, AVM_RUNTIME_VERSION
    breq 1f
    rjmp startup_invalid_image
1:

    ; entryPoint, packed little-endian 24-bit logical address.
    rcall fx_startup_read_byte
    mov  VM_PCL, r30
    rcall fx_startup_read_byte
    mov  VM_PCH, r30
    rcall fx_startup_read_byte
    out  VM_CB, r30

    ; dataSize in r16:r17.
    rcall fx_startup_read_byte
    mov  r16, r30
    rcall fx_startup_read_byte
    mov  r17, r30

    ; staticSize in r18:r19.
    rcall fx_startup_read_byte
    mov  r18, r30
    rcall fx_startup_read_byte
    mov  r19, r30

    ; saveSize is retained for the system ABI.
    rcall fx_startup_read_byte
    mov  r20, r30
    sts  data_save_size+0, r30
    rcall fx_startup_read_byte
    mov  r21, r30
    sts  data_save_size+1, r30
    fx_disable

    ; dataSize <= staticSize.
    cp   r18, r16
    cpc  r19, r17
    brsh 1f
    rjmp startup_invalid_image
1:

    ; staticSize <= 1024. Values below 0x0400 are accepted; 0x0400 itself is
    ; accepted only when the low byte is zero.
    cpi  r19, 0x04
    brlo 1f
    breq 2f
    rjmp startup_invalid_image
2:
    tst  r18
    breq 1f
    rjmp startup_invalid_image
1:

    ; saveSize <= 1024.
    cpi  r21, 0x04
    brlo 2f
    breq 3f
    rjmp startup_invalid_image
3:
    tst  r20
    breq 2f
    rjmp startup_invalid_image
2:

    ; A nonzero save request requires either a keyed flashcart save page or the
    ; development layout with a final 4 KiB save sector.
    cp   r20, ZERO
    cpc  r21, ZERO
    breq 3f
    lds  r26, data_startup_flags
    sbrs r26, STARTUP_SAVE_PAGE_VALID
    rjmp startup_invalid_image
3:

    ; All SRAM was cleared before startup state was initialized. The copy below
    ; installs only the nonzero .data prefix; globals beyond dataSize remain
    ; zero-initialized.
startup_copy_data:
    cp   r16, ZERO
    cpc  r17, ZERO
    breq startup_enter_image

    ; .data initializers always begin one page after the header.
    lds  r27, data_page_data+0
    lds  r22, data_page_data+1
    inc  r27
    brne 4f
    inc  r22
4:
    clr  r26
    rcall fx_startup_begin_read
    ldi  r26, lo8(data_globals)
    ldi  r27, hi8(data_globals)
startup_copy_data_loop:
    rcall fx_startup_read_byte
    st   X+, r30
    subi r16, 1
    sbci r17, 0
    brne startup_copy_data_loop
    fx_disable

startup_enter_image:
    ; Timer0 is initialized only after the unconditional SRAM clear and .data
    ; copy. Its compare interrupt becomes globally active at the SEI below.
    rcall timer0_init_func

    ; PB starts at zero. CB:PC already contains entryPoint.
    out  VM_PB, ZERO

    ; Seek to entryPoint and prime both the opcode and following-byte transfer.
    rcall fx_seek_to_pc
    in   r6, SPDR
    out  SPDR, ZERO
    sei
    delay_1
    mul  r6, C_DISPATCH_STRIDE_WORDS
    movw r30, r0
    subi r31, hi8(-((DISPATCH_ORG)>>1))
    ijmp

startup_invalid_image:
    cli
    fx_disable
startup_invalid_image_loop:
    rjmp startup_invalid_image_loop

; Configure Timer0 for a 1 kHz compare-A interrupt at f_CPU = 16 MHz:
;   CTC mode, prescaler 64, OCR0A = 249.
; Global interrupts remain disabled until startup_enter_image executes SEI.
timer0_init_func:
    ; Stop Timer0 and mask its interrupts while replacing any bootloader state.
    out  TCCR0B, ZERO
    sts  TIMSK0, ZERO

    ldi  r26, _BV(WGM01)
    out  TCCR0A, r26
    out  TCNT0, ZERO
    ldi  r26, 249
    out  OCR0A, r26

    ; Clear a stale compare-A flag before unmasking the interrupt.
    ldi  r26, _BV(OCF0A)
    out  TIFR0, r26
    ldi  r26, _BV(OCIE0A)
    sts  TIMSK0, r26

    ; Start Timer0 at f_CPU/64.
    ldi  r26, (_BV(CS01) | _BV(CS00))
    out  TCCR0B, r26
    ret

; Try a development tail.
;
; Input:
;   r22:r27:r26 = physical address of tail magic
;   r21:r20     = page immediately following the tail page
;
; Output:
;   C = 1 and data_page_data installed when valid
;   C = 0 otherwise
startup_try_tail:
    rcall fx_startup_begin_read
    rcall fx_startup_read_byte
    cpi  r30, AVM_TAIL_MAGIC0
    brne startup_try_tail_fail
    rcall fx_startup_read_byte
    cpi  r30, AVM_TAIL_MAGIC1
    brne startup_try_tail_fail
    rcall fx_startup_read_byte
    cpi  r30, AVM_TAIL_MAGIC2
    brne startup_try_tail_fail
    rcall fx_startup_read_byte
    cpi  r30, AVM_TAIL_MAGIC3
    brne startup_try_tail_fail

    ; imagePageCount, little-endian. Zero is never valid.
    rcall fx_startup_read_byte
    mov  r0, r30
    rcall fx_startup_read_byte
    mov  r1, r30
    fx_disable
    cp   r0, ZERO
    cpc  r1, ZERO
    breq startup_try_tail_fail_disabled

    ; imageBasePage = pageAfterTail - imagePageCount.
    mov  r26, r20
    mov  r27, r21
    sub  r26, r0
    sbc  r27, r1
    sts  data_page_data+0, r26
    sts  data_page_data+1, r27
    sec
    ret

startup_try_tail_fail:
    fx_disable
startup_try_tail_fail_disabled:
    clc
    ret

; Begin a blocking SFC_READ command.
;
; Input physical byte address: r22:r27:r26 (high:middle:low).
fx_startup_begin_read:
    fx_disable
    fx_enable
    ldi  r30, SFC_READ
    rcall fx_spi_transfer_blocking
    mov  r30, r22
    rcall fx_spi_transfer_blocking
    mov  r30, r27
    rcall fx_spi_transfer_blocking
    mov  r30, r26
    rcall fx_spi_transfer_blocking
    ret

; Read one byte from an already-open startup read stream.
; Result is returned in r30.
fx_startup_read_byte:
    mov  r30, ZERO
    rjmp fx_spi_transfer_blocking

; Blocking SPI byte transfer. Input/output: r30. Clobbers r31.
fx_spi_transfer_blocking:
    out  SPDR, r30
1:
    in   r31, SPSR
    sbrs r31, SPIF
    rjmp 1b
    in   r30, SPDR
    ret

; Conservative post-wakeup delay. Startup is not cycle critical.
fx_startup_wake_delay:
    ldi  r26, 32
1:
    dec  r26
    brne 1b
    ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Device pin and OLED startup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Establish the same supported-device idle levels used by Arduboy2 bootPins,
; while changing only explicitly configured pins rather than replacing complete
; PORT/DDR registers. The speaker pins remain untouched, as in Arduboy2.
hardware_init_pins_func:
    ; Shared ATmega32U4 hardware SPI bus: SCK and MOSI outputs low, MISO input
    ; without a pull-up. These pins cannot be remapped by a device preset.
    pin_output_low    PORTB, DDRB, PORTB1
    pin_output_low    PORTB, DDRB, PORTB2
    pin_input_floating PORTB, DDRB, PORTB3

    ; Keep the serial flash inactive while the display is reset and configured.
    pin_output_high AVM_FX_PORT, AVM_FX_DDR, AVM_FX_BIT

    ; Arduboy2 starts with OLED CS asserted, D/C high, and reset asserted low.
    pin_output_low  AVM_OLED_CS_PORT,  AVM_OLED_CS_DDR,  AVM_OLED_CS_BIT
    pin_output_high AVM_OLED_DC_PORT,  AVM_OLED_DC_DDR,  AVM_OLED_DC_BIT
    pin_output_low  AVM_OLED_RST_PORT, AVM_OLED_RST_DDR, AVM_OLED_RST_BIT

#if AVM_INIT_RGB_LED
    ; Active-low RGB channels off.
    pin_output_high AVM_LED_RED_PORT,   AVM_LED_RED_DDR,   AVM_LED_RED_BIT
    pin_output_high AVM_LED_GREEN_PORT, AVM_LED_GREEN_DDR, AVM_LED_GREEN_BIT
    pin_output_high AVM_LED_BLUE_PORT,  AVM_LED_BLUE_DDR,  AVM_LED_BLUE_BIT
#endif

#if AVM_INIT_TX_RX_LEDS
    ; Active-low USB activity LEDs off.
    pin_output_high AVM_LED_TX_PORT, AVM_LED_TX_DDR, AVM_LED_TX_BIT
    pin_output_high AVM_LED_RX_PORT, AVM_LED_RX_DDR, AVM_LED_RX_BIT
#endif

#if AVM_INIT_BUTTONS
    ; All six buttons are active low and use internal pull-ups.
    pin_input_pullup AVM_BUTTON_LEFT_PORT,  AVM_BUTTON_LEFT_DDR,  AVM_BUTTON_LEFT_BIT
    pin_input_pullup AVM_BUTTON_RIGHT_PORT, AVM_BUTTON_RIGHT_DDR, AVM_BUTTON_RIGHT_BIT
    pin_input_pullup AVM_BUTTON_UP_PORT,    AVM_BUTTON_UP_DDR,    AVM_BUTTON_UP_BIT
    pin_input_pullup AVM_BUTTON_DOWN_PORT,  AVM_BUTTON_DOWN_DDR,  AVM_BUTTON_DOWN_BIT
    pin_input_pullup AVM_BUTTON_A_PORT,     AVM_BUTTON_A_DDR,     AVM_BUTTON_A_BIT
    pin_input_pullup AVM_BUTTON_B_PORT,     AVM_BUTTON_B_DDR,     AVM_BUTTON_B_BIT
#endif

#if AVM_INIT_RANDOM_SEED_ADC
    ; Match Arduboy2's floating ADC1 random-seed input and initial mux choice.
    pin_input_floating AVM_RANDOM_SEED_PORT, AVM_RANDOM_SEED_DDR, AVM_RANDOM_SEED_BIT
    ldi  r26, (_BV(REFS0) | _BV(REFS1) | _BV(MUX0))
    sts  ADMUX, r26
#endif
    ret

; Approximately 5 ms at 16 MHz. Startup timing is intentionally conservative
; and is not part of the bytecode interpreter's cycle contract.
oled_reset_delay_5ms_func:
    ldi  r24, 104
1:
    clr  r25
2:
    dec  r25
    brne 2b
    dec  r24
    brne 1b
    ret

; Blocking SPI transfer used while Z walks the OLED command table.
; Input/output: r26. Clobbers r27; preserves Z.
oled_spi_transfer_blocking_func:
    out  SPDR, r26
1:
    in   r27, SPSR
    sbrs r27, SPIF
    rjmp 1b
    in   r26, SPDR
    ret

; Reset the OLED and send the Arduboy2-derived controller boot sequence.
; No display RAM is written here.
oled_startup_init_func:
    rcall oled_reset_delay_5ms_func
    sbi   AVM_OLED_RST_PORT, AVM_OLED_RST_BIT
    rcall oled_reset_delay_5ms_func

    display_enable
    display_command_mode

    ldi  r30, lo8(oled_boot_program)
    ldi  r31, hi8(oled_boot_program)
    ldi  r24, lo8(oled_boot_program_end - oled_boot_program)
1:
    lpm  r26, Z+
    rcall oled_spi_transfer_blocking_func
    dec  r24
    brne 1b

    ; Leave the shared SPI bus idle and ready for the FX flash transaction.
    display_data_mode
    display_disable
    fx_disable
    ret

; Commands follow Arduboy2's lcdBootProgram for the corresponding SPI display.
oled_boot_program:
#if defined(AVM_DISPLAY_SH1106)
    .byte 0x8D, 0x14                 ; enable charge pump
    .byte 0xA1                       ; segment remap
    .byte 0xC8                       ; COM scan direction
    .byte 0x81, AVM_OLED_CONTRAST    ; contrast
    .byte 0xD9, 0xF1                 ; precharge
    .byte 0x02                       ; SH1106 visible column starts at 2
    .byte 0xAF                       ; display on
#else
    .byte 0xD5, 0xF0                 ; display clock divisor
#  if defined(AVM_DISPLAY_SSD1309)
    .byte 0xE3, 0xE3                 ; SSD1309 has no charge-pump command
#  else
    .byte 0x8D, 0x14                 ; SSD1306 charge pump on
#  endif
    .byte 0xA1                       ; segment remap
    .byte 0xC8                       ; COM scan direction
    .byte 0x81, AVM_OLED_CONTRAST    ; contrast
    .byte 0xD9, 0xF1                 ; precharge
    .byte 0xAF                       ; display on
    .byte 0x20, 0x00                 ; horizontal addressing mode
#endif
oled_boot_program_end:
    .balign 2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xE3 register transfer and condition extension page
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Secondary-byte encoding:
;   00dddsss  MOV16 rD,rS
;   01dddsss  MOV8Z rD,bS
;   10dddsss  MOV8S rD,bS
;   11cccddd  CSET rD,cc
;
; Only MOV16 is operand-specialized. Its executable fixed-stride table avoids
; both a separate RJMP table and separate handler bodies. The remaining forms
; decode the register-file addresses through data space and share their bodies.

; 01dddsss / 10dddsss: MOV8Z and MOV8S share all operand decoding. Bit 7
; selects sign extension; bit 7 is clear for MOV8Z and set for MOV8S.
e3_mov8_family:
    ; X = native low-byte address of rS.
    mov  r26, r6
    andi r26, 0x07
    lsl  r26
    subi r26, -8
    clr  r27

    ; Z = native low-byte address of rD.
    mov  r30, r6
    andi r30, 0x38
    lsr  r30
    lsr  r30
    subi r30, -8
    clr  r31

    ; Capture the source before writing either destination byte, so all aliasing
    ; combinations retain ordinary register-transfer semantics.
    ld   r4, X
    mov  r5, r4
    lsl  r5
    sbc  r5, r5
    sbrs r6, 7
    clr  r5
    st   Z+, r4
    st   Z, r5
    rjmp e3_dispatch_func

; 11cccddd: CSET uses one generic destination decode and an eight-entry
; condition table. The condition handlers materialize 0 or 1 in r30.
e3_cset_family:
    ; X = native low-byte address of rD.
    mov  r26, r6
    andi r26, 0x07
    lsl  r26
    subi r26, -8
    clr  r27

    ; Convert ccc in bits 5:3 to a one-word condition-table index.
    mov  r30, r6
    andi r30, 0x38
    lsr  r30
    lsr  r30
    lsr  r30
    clr  r31
    subi r30, lo8(-(pm(e3_cset_table)))
    sbci r31, hi8(-(pm(e3_cset_table)))
    ijmp

e3_cset_table:
    rjmp e3_cset_eq
    rjmp e3_cset_ne
    rjmp e3_cset_ult
    rjmp e3_cset_uge
    rjmp e3_cset_slt
    rjmp e3_cset_sge
    rjmp e3_cset_ule
    rjmp e3_cset_ugt
e3_cset_table_end:

.if ((e3_cset_table_end - e3_cset_table) != (8 * 2))
    .error "E3 CSET dispatch table must contain exactly eight words"
.endif

.macro emit_e3_cset_bit label, skip, flag
\label:
    clr  r30
    \skip VM_FLAGS, \flag
    inc  r30
    rjmp e3_cset_finish
.endm

emit_e3_cset_bit e3_cset_eq,  sbrc, SREG_Z
emit_e3_cset_bit e3_cset_ne,  sbrs, SREG_Z
emit_e3_cset_bit e3_cset_ult, sbrc, SREG_C
emit_e3_cset_bit e3_cset_uge, sbrs, SREG_C
emit_e3_cset_bit e3_cset_slt, sbrc, SREG_S
emit_e3_cset_bit e3_cset_sge, sbrs, SREG_S

; ULE = C | Z. NEG converts a nonzero masked value into native carry, CLR
; preserves carry, and ADC materializes it as 0 or 1.
e3_cset_ule:
    mov  r30, VM_FLAGS
    andi r30, (_BV(SREG_C) | _BV(SREG_Z))
    neg  r30
    clr  r30
    adc  r30, ZERO
    rjmp e3_cset_finish

; UGT = !(C | Z). LDI preserves native carry, so SBC computes 1-C.
e3_cset_ugt:
    mov  r30, VM_FLAGS
    andi r30, (_BV(SREG_C) | _BV(SREG_Z))
    neg  r30
    ldi  r30, 1
    sbc  r30, ZERO
    rjmp e3_cset_finish

e3_cset_finish:
    st   X+, r30
    st   X, ZERO
    rjmp e3_dispatch_func

; Each MOV16 slot is exactly two AVR words. The secondary value 00dddsss is
; multiplied by two in the decoder and added directly to this word-addressed
; table, so the selected slot performs the register copy without an extra
; table jump or runtime operand decode.
.macro emit_e3_mov16_slot dst, src
    movw \dst, \src
    rjmp e3_dispatch_func
.endm

e3_mov16_table:
    emit_e3_mov16_slot VM_R0, VM_R0
    emit_e3_mov16_slot VM_R0, VM_R1
    emit_e3_mov16_slot VM_R0, VM_R2
    emit_e3_mov16_slot VM_R0, VM_R3
    emit_e3_mov16_slot VM_R0, VM_R4
    emit_e3_mov16_slot VM_R0, VM_R5
    emit_e3_mov16_slot VM_R0, VM_R6
    emit_e3_mov16_slot VM_R0, VM_R7
    emit_e3_mov16_slot VM_R1, VM_R0
    emit_e3_mov16_slot VM_R1, VM_R1
    emit_e3_mov16_slot VM_R1, VM_R2
    emit_e3_mov16_slot VM_R1, VM_R3
    emit_e3_mov16_slot VM_R1, VM_R4
    emit_e3_mov16_slot VM_R1, VM_R5
    emit_e3_mov16_slot VM_R1, VM_R6
    emit_e3_mov16_slot VM_R1, VM_R7
    emit_e3_mov16_slot VM_R2, VM_R0
    emit_e3_mov16_slot VM_R2, VM_R1
    emit_e3_mov16_slot VM_R2, VM_R2
    emit_e3_mov16_slot VM_R2, VM_R3
    emit_e3_mov16_slot VM_R2, VM_R4
    emit_e3_mov16_slot VM_R2, VM_R5
    emit_e3_mov16_slot VM_R2, VM_R6
    emit_e3_mov16_slot VM_R2, VM_R7
    emit_e3_mov16_slot VM_R3, VM_R0
    emit_e3_mov16_slot VM_R3, VM_R1
    emit_e3_mov16_slot VM_R3, VM_R2
    emit_e3_mov16_slot VM_R3, VM_R3
    emit_e3_mov16_slot VM_R3, VM_R4
    emit_e3_mov16_slot VM_R3, VM_R5
    emit_e3_mov16_slot VM_R3, VM_R6
    emit_e3_mov16_slot VM_R3, VM_R7
    emit_e3_mov16_slot VM_R4, VM_R0
    emit_e3_mov16_slot VM_R4, VM_R1
    emit_e3_mov16_slot VM_R4, VM_R2
    emit_e3_mov16_slot VM_R4, VM_R3
    emit_e3_mov16_slot VM_R4, VM_R4
    emit_e3_mov16_slot VM_R4, VM_R5
    emit_e3_mov16_slot VM_R4, VM_R6
    emit_e3_mov16_slot VM_R4, VM_R7
    emit_e3_mov16_slot VM_R5, VM_R0
    emit_e3_mov16_slot VM_R5, VM_R1
    emit_e3_mov16_slot VM_R5, VM_R2
    emit_e3_mov16_slot VM_R5, VM_R3
    emit_e3_mov16_slot VM_R5, VM_R4
    emit_e3_mov16_slot VM_R5, VM_R5
    emit_e3_mov16_slot VM_R5, VM_R6
    emit_e3_mov16_slot VM_R5, VM_R7
    emit_e3_mov16_slot VM_R6, VM_R0
    emit_e3_mov16_slot VM_R6, VM_R1
    emit_e3_mov16_slot VM_R6, VM_R2
    emit_e3_mov16_slot VM_R6, VM_R3
    emit_e3_mov16_slot VM_R6, VM_R4
    emit_e3_mov16_slot VM_R6, VM_R5
    emit_e3_mov16_slot VM_R6, VM_R6
    emit_e3_mov16_slot VM_R6, VM_R7
    emit_e3_mov16_slot VM_R7, VM_R0
    emit_e3_mov16_slot VM_R7, VM_R1
    emit_e3_mov16_slot VM_R7, VM_R2
    emit_e3_mov16_slot VM_R7, VM_R3
    emit_e3_mov16_slot VM_R7, VM_R4
    emit_e3_mov16_slot VM_R7, VM_R5
    emit_e3_mov16_slot VM_R7, VM_R6
    emit_e3_mov16_slot VM_R7, VM_R7
e3_mov16_table_end:

.if ((e3_mov16_table_end - e3_mov16_table) != (64 * 4))
    .error "E3 MOV16 executable table must contain 64 two-word slots"
.endif

; Local sequential dispatch keeps every executable MOV16 slot and generic E3
; handler within RJMP range.
e3_dispatch_func:
    dispatch

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xF4 compact ALU extension page
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; This section is placed after the rest of the interpreter so its executable
; operand-specialized slots do not push existing RCALL/RJMP sites out of range.
f4_extension_decode_func:
    cli
    out  SPDR, ZERO
    in   r6, SPDR
    sei

    ldi  r30, lo8(pm(f4_secondary_table))
    ldi  r31, hi8(pm(f4_secondary_table))
    add  r30, r6
    adc  r31, ZERO
    ijmp

; F4 secondary encoding:
;   bits 7:4 = operation
;   bits 3:2 = compact destination c0-c3
;   bits 1:0 = compact source c0-c3
;
; The implemented 10-2F and 34-3F/44-4F/54-5F/64-6F ranges use
; operand-specialized executable slots. Logical destinations c0/A are
; reserved because the one-byte accumulator forms already cover them.
; Decoder OUT-to-slot-entry timing leaves eight cycles before the next OUT.
; Arithmetic/logical slots use delay_3 + two native operations + RJMP;
; BIC uses MOVW + COM + COM + AND + AND + RJMP. The local dispatch then
; issues its OUT exactly 17 cycles after the decoder OUT, retaining the
; intended approximately 34-cycle cadence for the two-byte instruction.
; Native SREG changes are not copied to VM_FLAGS, so AVM CC is preserved.

f4_secondary_table:
    secondary_entries 16, f4_unimplemented_instruction_func ; 00-0F MOV
    ; 10-1F ADD.NF
    rjmp f4_add_nf_c0_c0
    rjmp f4_add_nf_c0_c1
    rjmp f4_add_nf_c0_c2
    rjmp f4_add_nf_c0_c3
    rjmp f4_add_nf_c1_c0
    rjmp f4_add_nf_c1_c1
    rjmp f4_add_nf_c1_c2
    rjmp f4_add_nf_c1_c3
    rjmp f4_add_nf_c2_c0
    rjmp f4_add_nf_c2_c1
    rjmp f4_add_nf_c2_c2
    rjmp f4_add_nf_c2_c3
    rjmp f4_add_nf_c3_c0
    rjmp f4_add_nf_c3_c1
    rjmp f4_add_nf_c3_c2
    rjmp f4_add_nf_c3_c3
    ; 20-2F SUB.NF
    rjmp f4_sub_nf_c0_c0
    rjmp f4_sub_nf_c0_c1
    rjmp f4_sub_nf_c0_c2
    rjmp f4_sub_nf_c0_c3
    rjmp f4_sub_nf_c1_c0
    rjmp f4_sub_nf_c1_c1
    rjmp f4_sub_nf_c1_c2
    rjmp f4_sub_nf_c1_c3
    rjmp f4_sub_nf_c2_c0
    rjmp f4_sub_nf_c2_c1
    rjmp f4_sub_nf_c2_c2
    rjmp f4_sub_nf_c2_c3
    rjmp f4_sub_nf_c3_c0
    rjmp f4_sub_nf_c3_c1
    rjmp f4_sub_nf_c3_c2
    rjmp f4_sub_nf_c3_c3
    ; 30-3F AND; 30-33 are reserved c0/A destinations
    secondary_entries 4, f4_invalid_secondary_instruction_func
    rjmp f4_and_c1_c0
    rjmp f4_and_c1_c1
    rjmp f4_and_c1_c2
    rjmp f4_and_c1_c3
    rjmp f4_and_c2_c0
    rjmp f4_and_c2_c1
    rjmp f4_and_c2_c2
    rjmp f4_and_c2_c3
    rjmp f4_and_c3_c0
    rjmp f4_and_c3_c1
    rjmp f4_and_c3_c2
    rjmp f4_and_c3_c3
    ; 40-4F OR; 40-43 are reserved c0/A destinations
    secondary_entries 4, f4_invalid_secondary_instruction_func
    rjmp f4_or_c1_c0
    rjmp f4_or_c1_c1
    rjmp f4_or_c1_c2
    rjmp f4_or_c1_c3
    rjmp f4_or_c2_c0
    rjmp f4_or_c2_c1
    rjmp f4_or_c2_c2
    rjmp f4_or_c2_c3
    rjmp f4_or_c3_c0
    rjmp f4_or_c3_c1
    rjmp f4_or_c3_c2
    rjmp f4_or_c3_c3
    ; 50-5F XOR; 50-53 are reserved c0/A destinations
    secondary_entries 4, f4_invalid_secondary_instruction_func
    rjmp f4_xor_c1_c0
    rjmp f4_xor_c1_c1
    rjmp f4_xor_c1_c2
    rjmp f4_xor_c1_c3
    rjmp f4_xor_c2_c0
    rjmp f4_xor_c2_c1
    rjmp f4_xor_c2_c2
    rjmp f4_xor_c2_c3
    rjmp f4_xor_c3_c0
    rjmp f4_xor_c3_c1
    rjmp f4_xor_c3_c2
    rjmp f4_xor_c3_c3
    ; 60-6F BIC; 60-63 are reserved c0/A destinations
    secondary_entries 4, f4_invalid_secondary_instruction_func
    rjmp f4_bic_c1_c0
    rjmp f4_bic_c1_c1
    rjmp f4_bic_c1_c2
    rjmp f4_bic_c1_c3
    rjmp f4_bic_c2_c0
    rjmp f4_bic_c2_c1
    rjmp f4_bic_c2_c2
    rjmp f4_bic_c2_c3
    rjmp f4_bic_c3_c0
    rjmp f4_bic_c3_c1
    rjmp f4_bic_c3_c2
    rjmp f4_bic_c3_c3
    secondary_entries 128, f4_unimplemented_instruction_func ; 70-EF
    secondary_entries 16, f4_invalid_secondary_instruction_func ; F0-FF
f4_secondary_table_end:

.if ((f4_secondary_table_end - f4_secondary_table) != (256 * 2))
    .error "F4 secondary dispatch table must contain exactly 256 words"
.endif

.macro emit_f4_binary_slot label, lowop, highop, dstl, dsth, srcl, srch
\label:
    delay_3
    \lowop  \dstl, \srcl
    \highop \dsth, \srch
    rjmp f4_dispatch_func
.endm

.macro emit_f4_bic_slot label, dstl, dsth, src
\label:
    movw r4, \src
    com  r4
    com  r5
    and  \dstl, r4
    and  \dsth, r5
    rjmp f4_dispatch_func
.endm

; F4 10-1F: ADD.NF cD,cS
emit_f4_binary_slot f4_add_nf_c0_c0, add, adc, VM_C0L, VM_C0H, VM_C0L, VM_C0H
emit_f4_binary_slot f4_add_nf_c0_c1, add, adc, VM_C0L, VM_C0H, VM_C1L, VM_C1H
emit_f4_binary_slot f4_add_nf_c0_c2, add, adc, VM_C0L, VM_C0H, VM_C2L, VM_C2H
emit_f4_binary_slot f4_add_nf_c0_c3, add, adc, VM_C0L, VM_C0H, VM_C3L, VM_C3H
emit_f4_binary_slot f4_add_nf_c1_c0, add, adc, VM_C1L, VM_C1H, VM_C0L, VM_C0H
emit_f4_binary_slot f4_add_nf_c1_c1, add, adc, VM_C1L, VM_C1H, VM_C1L, VM_C1H
emit_f4_binary_slot f4_add_nf_c1_c2, add, adc, VM_C1L, VM_C1H, VM_C2L, VM_C2H
emit_f4_binary_slot f4_add_nf_c1_c3, add, adc, VM_C1L, VM_C1H, VM_C3L, VM_C3H
emit_f4_binary_slot f4_add_nf_c2_c0, add, adc, VM_C2L, VM_C2H, VM_C0L, VM_C0H
emit_f4_binary_slot f4_add_nf_c2_c1, add, adc, VM_C2L, VM_C2H, VM_C1L, VM_C1H
emit_f4_binary_slot f4_add_nf_c2_c2, add, adc, VM_C2L, VM_C2H, VM_C2L, VM_C2H
emit_f4_binary_slot f4_add_nf_c2_c3, add, adc, VM_C2L, VM_C2H, VM_C3L, VM_C3H
emit_f4_binary_slot f4_add_nf_c3_c0, add, adc, VM_C3L, VM_C3H, VM_C0L, VM_C0H
emit_f4_binary_slot f4_add_nf_c3_c1, add, adc, VM_C3L, VM_C3H, VM_C1L, VM_C1H
emit_f4_binary_slot f4_add_nf_c3_c2, add, adc, VM_C3L, VM_C3H, VM_C2L, VM_C2H
emit_f4_binary_slot f4_add_nf_c3_c3, add, adc, VM_C3L, VM_C3H, VM_C3L, VM_C3H

; F4 20-2F: SUB.NF cD,cS
emit_f4_binary_slot f4_sub_nf_c0_c0, sub, sbc, VM_C0L, VM_C0H, VM_C0L, VM_C0H
emit_f4_binary_slot f4_sub_nf_c0_c1, sub, sbc, VM_C0L, VM_C0H, VM_C1L, VM_C1H
emit_f4_binary_slot f4_sub_nf_c0_c2, sub, sbc, VM_C0L, VM_C0H, VM_C2L, VM_C2H
emit_f4_binary_slot f4_sub_nf_c0_c3, sub, sbc, VM_C0L, VM_C0H, VM_C3L, VM_C3H
emit_f4_binary_slot f4_sub_nf_c1_c0, sub, sbc, VM_C1L, VM_C1H, VM_C0L, VM_C0H
emit_f4_binary_slot f4_sub_nf_c1_c1, sub, sbc, VM_C1L, VM_C1H, VM_C1L, VM_C1H
emit_f4_binary_slot f4_sub_nf_c1_c2, sub, sbc, VM_C1L, VM_C1H, VM_C2L, VM_C2H
emit_f4_binary_slot f4_sub_nf_c1_c3, sub, sbc, VM_C1L, VM_C1H, VM_C3L, VM_C3H
emit_f4_binary_slot f4_sub_nf_c2_c0, sub, sbc, VM_C2L, VM_C2H, VM_C0L, VM_C0H
emit_f4_binary_slot f4_sub_nf_c2_c1, sub, sbc, VM_C2L, VM_C2H, VM_C1L, VM_C1H
emit_f4_binary_slot f4_sub_nf_c2_c2, sub, sbc, VM_C2L, VM_C2H, VM_C2L, VM_C2H
emit_f4_binary_slot f4_sub_nf_c2_c3, sub, sbc, VM_C2L, VM_C2H, VM_C3L, VM_C3H
emit_f4_binary_slot f4_sub_nf_c3_c0, sub, sbc, VM_C3L, VM_C3H, VM_C0L, VM_C0H
emit_f4_binary_slot f4_sub_nf_c3_c1, sub, sbc, VM_C3L, VM_C3H, VM_C1L, VM_C1H
emit_f4_binary_slot f4_sub_nf_c3_c2, sub, sbc, VM_C3L, VM_C3H, VM_C2L, VM_C2H
emit_f4_binary_slot f4_sub_nf_c3_c3, sub, sbc, VM_C3L, VM_C3H, VM_C3L, VM_C3H

; F4 34-3F: AND cD,cS (cD = c1-c3)
emit_f4_binary_slot f4_and_c1_c0, and, and, VM_C1L, VM_C1H, VM_C0L, VM_C0H
emit_f4_binary_slot f4_and_c1_c1, and, and, VM_C1L, VM_C1H, VM_C1L, VM_C1H
emit_f4_binary_slot f4_and_c1_c2, and, and, VM_C1L, VM_C1H, VM_C2L, VM_C2H
emit_f4_binary_slot f4_and_c1_c3, and, and, VM_C1L, VM_C1H, VM_C3L, VM_C3H
emit_f4_binary_slot f4_and_c2_c0, and, and, VM_C2L, VM_C2H, VM_C0L, VM_C0H
emit_f4_binary_slot f4_and_c2_c1, and, and, VM_C2L, VM_C2H, VM_C1L, VM_C1H
emit_f4_binary_slot f4_and_c2_c2, and, and, VM_C2L, VM_C2H, VM_C2L, VM_C2H
emit_f4_binary_slot f4_and_c2_c3, and, and, VM_C2L, VM_C2H, VM_C3L, VM_C3H
emit_f4_binary_slot f4_and_c3_c0, and, and, VM_C3L, VM_C3H, VM_C0L, VM_C0H
emit_f4_binary_slot f4_and_c3_c1, and, and, VM_C3L, VM_C3H, VM_C1L, VM_C1H
emit_f4_binary_slot f4_and_c3_c2, and, and, VM_C3L, VM_C3H, VM_C2L, VM_C2H
emit_f4_binary_slot f4_and_c3_c3, and, and, VM_C3L, VM_C3H, VM_C3L, VM_C3H

; F4 44-4F: OR cD,cS (cD = c1-c3)
emit_f4_binary_slot f4_or_c1_c0, or, or, VM_C1L, VM_C1H, VM_C0L, VM_C0H
emit_f4_binary_slot f4_or_c1_c1, or, or, VM_C1L, VM_C1H, VM_C1L, VM_C1H
emit_f4_binary_slot f4_or_c1_c2, or, or, VM_C1L, VM_C1H, VM_C2L, VM_C2H
emit_f4_binary_slot f4_or_c1_c3, or, or, VM_C1L, VM_C1H, VM_C3L, VM_C3H
emit_f4_binary_slot f4_or_c2_c0, or, or, VM_C2L, VM_C2H, VM_C0L, VM_C0H
emit_f4_binary_slot f4_or_c2_c1, or, or, VM_C2L, VM_C2H, VM_C1L, VM_C1H
emit_f4_binary_slot f4_or_c2_c2, or, or, VM_C2L, VM_C2H, VM_C2L, VM_C2H
emit_f4_binary_slot f4_or_c2_c3, or, or, VM_C2L, VM_C2H, VM_C3L, VM_C3H
emit_f4_binary_slot f4_or_c3_c0, or, or, VM_C3L, VM_C3H, VM_C0L, VM_C0H
emit_f4_binary_slot f4_or_c3_c1, or, or, VM_C3L, VM_C3H, VM_C1L, VM_C1H
emit_f4_binary_slot f4_or_c3_c2, or, or, VM_C3L, VM_C3H, VM_C2L, VM_C2H
emit_f4_binary_slot f4_or_c3_c3, or, or, VM_C3L, VM_C3H, VM_C3L, VM_C3H

; F4 54-5F: XOR cD,cS (cD = c1-c3)
emit_f4_binary_slot f4_xor_c1_c0, eor, eor, VM_C1L, VM_C1H, VM_C0L, VM_C0H
emit_f4_binary_slot f4_xor_c1_c1, eor, eor, VM_C1L, VM_C1H, VM_C1L, VM_C1H
emit_f4_binary_slot f4_xor_c1_c2, eor, eor, VM_C1L, VM_C1H, VM_C2L, VM_C2H
emit_f4_binary_slot f4_xor_c1_c3, eor, eor, VM_C1L, VM_C1H, VM_C3L, VM_C3H
emit_f4_binary_slot f4_xor_c2_c0, eor, eor, VM_C2L, VM_C2H, VM_C0L, VM_C0H
emit_f4_binary_slot f4_xor_c2_c1, eor, eor, VM_C2L, VM_C2H, VM_C1L, VM_C1H
emit_f4_binary_slot f4_xor_c2_c2, eor, eor, VM_C2L, VM_C2H, VM_C2L, VM_C2H
emit_f4_binary_slot f4_xor_c2_c3, eor, eor, VM_C2L, VM_C2H, VM_C3L, VM_C3H
emit_f4_binary_slot f4_xor_c3_c0, eor, eor, VM_C3L, VM_C3H, VM_C0L, VM_C0H
emit_f4_binary_slot f4_xor_c3_c1, eor, eor, VM_C3L, VM_C3H, VM_C1L, VM_C1H
emit_f4_binary_slot f4_xor_c3_c2, eor, eor, VM_C3L, VM_C3H, VM_C2L, VM_C2H
emit_f4_binary_slot f4_xor_c3_c3, eor, eor, VM_C3L, VM_C3H, VM_C3L, VM_C3H

; F4 64-6F: BIC cD,cS (cD = c1-c3)
emit_f4_bic_slot f4_bic_c1_c0, VM_C1L, VM_C1H, VM_C0
emit_f4_bic_slot f4_bic_c1_c1, VM_C1L, VM_C1H, VM_C1
emit_f4_bic_slot f4_bic_c1_c2, VM_C1L, VM_C1H, VM_C2
emit_f4_bic_slot f4_bic_c1_c3, VM_C1L, VM_C1H, VM_C3
emit_f4_bic_slot f4_bic_c2_c0, VM_C2L, VM_C2H, VM_C0
emit_f4_bic_slot f4_bic_c2_c1, VM_C2L, VM_C2H, VM_C1
emit_f4_bic_slot f4_bic_c2_c2, VM_C2L, VM_C2H, VM_C2
emit_f4_bic_slot f4_bic_c2_c3, VM_C2L, VM_C2H, VM_C3
emit_f4_bic_slot f4_bic_c3_c0, VM_C3L, VM_C3H, VM_C0
emit_f4_bic_slot f4_bic_c3_c1, VM_C3L, VM_C3H, VM_C1
emit_f4_bic_slot f4_bic_c3_c2, VM_C3L, VM_C3H, VM_C2
emit_f4_bic_slot f4_bic_c3_c3, VM_C3L, VM_C3H, VM_C3

; Keep local trap targets and sequential dispatch within RJMP range of every
; F4 table entry and executable slot.
f4_unimplemented_instruction_func:
    rjmp f4_unimplemented_instruction_func

f4_invalid_secondary_instruction_func:
    rjmp f4_invalid_secondary_instruction_func

f4_dispatch_func:
    dispatch

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xE1 32-bit aligned-register-pair ALU extension page
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Secondary encoding:
;   0ddss  MOV32 qD,qS
;   1ddss  ADD32 qD,qS
;   2ddss  SUB32 qD,qS
;   6ddss  CMP32 qL,qR
;
; q0 = r0:r1, q1 = r2:r3, q2 = r4:r5, q3 = r6:r7. Each q-register
; occupies four consecutive native AVR registers. Bits 3:2 are therefore
; already the destination/left byte offset, while bits 1:0 need only be
; multiplied by four for the source/right offset.
;
; These instructions are expected to be uncommon, so one shared handler per
; operation is used instead of a 256-entry table and 64 specialized slots.
; X addresses qD/qL and Z addresses qS/qR.

e1_extension_decode_func:
    ; Possible future optimization:
    ;
    ; A 64-entry dispatch table indexed by (secondary >> 2) could dispatch on
    ; both the operation nibble and qD/qL. Each valid entry would jump to a
    ; destination-specialized handler while retaining generic source decode.
    ; This would let MOV32/ADD32/SUB32/CMP32 operate directly on the selected
    ; native destination registers, eliminating destination address decode and
    ; the destination-side LD/ST traffic used by the shared X/Z handlers.
    ;
    ; Estimated effect versus this compact implementation:
    ;   MOV32: about 6 cycles faster
    ;   ADD32: about 16 cycles faster
    ;   SUB32: about 18 cycles faster
    ;   CMP32: about 12 cycles faster
    ;
    ; Expected cost is roughly 250 additional bytes, for a total E1 cost near
    ; 450 bytes. This remains much smaller than full source+destination
    ; specialization, but is not currently justified because 32-bit operations
    ; are expected to be uncommon in typical Arduboy software.
    ;
    ; Read the secondary opcode while starting the following primary opcode.
    cli
    out  SPDR, ZERO
    in   r6, SPDR
    sei

    ; Decode the pair operands once for every E1 operation:
    ;   X = native low-byte address of qD/qL
    ;   Z = native low-byte address of qS/qR
    ;
    ; r27 temporarily holds the operation nibble. Each implemented handler
    ; clears it before dereferencing X.
    mov  r26, r6
    andi r26, 0x0C
    subi r26, -8

    mov  r30, r6
    andi r30, 0x03
    lsl  r30
    lsl  r30
    subi r30, -8
    clr  r31

    ; Dispatch only on the operation nibble. Encodings 3x-5x and 7x-9x are
    ; defined but not implemented; Ax-Fx are reserved/invalid. Keep this ANDI
    ; last so its Z result can select MOV32 without an extra comparison.
    mov  r27, r6
    andi r27, 0xF0
    breq e1_mov32_family
    cpi  r27, 0x10
    breq e1_add32_family
    cpi  r27, 0x20
    breq e1_sub32_family
    cpi  r27, 0x60
    breq e1_cmp32_family
    cpi  r27, 0xA0
    brlo 1f
    rjmp e1_invalid_secondary_instruction_func
1:
    rjmp e1_unimplemented_instruction_func

; E1 0ddss: MOV32 qD,qS
;
; Loading each byte before storing it gives ordinary transfer semantics for
; qD == qS. MOV32 preserves AVM CC.
e1_mov32_family:
    clr  r27
    ld   r0, Z+
    st   X+, r0
    ld   r0, Z+
    st   X+, r0
    ld   r0, Z+
    st   X+, r0
    ld   r0, Z
    st   X, r0
    rjmp e1_dispatch_func

; E1 1ddss: ADD32 qD,qS
;
; The operation is unrolled so native carry propagates directly across all
; four bytes. The source byte is read before the destination byte is written,
; including qD == qS. AVM CC is preserved.
e1_add32_family:
    clr  r27

    ld   r0, X
    ld   r4, Z+
    add  r0, r4
    st   X+, r0

    ld   r0, X
    ld   r4, Z+
    adc  r0, r4
    st   X+, r0

    ld   r0, X
    ld   r4, Z+
    adc  r0, r4
    st   X+, r0

    ld   r0, X
    ld   r4, Z
    adc  r0, r4
    st   X, r0
    rjmp e1_dispatch_func

; E1 2ddss: SUB32 qD,qS
;
; The operation is unrolled so native borrow propagates directly across all
; four bytes. AVM CC is preserved.
e1_sub32_family:
    clr  r27

    ld   r0, X
    ld   r4, Z+
    sub  r0, r4
    st   X+, r0

    ld   r0, X
    ld   r4, Z+
    sbc  r0, r4
    st   X+, r0

    ld   r0, X
    ld   r4, Z+
    sbc  r0, r4
    st   X+, r0

    ld   r0, X
    ld   r4, Z
    sbc  r0, r4
    st   X, r0
    rjmp e1_dispatch_func

; E1 6ddss: CMP32 qL,qR
;
; This path is deliberately unrolled. CPC accumulates equality through native
; Z, so loop-counter arithmetic between bytes would corrupt the 32-bit Z
; result. The final CP/CPC state is copied to architectural C/Z/S.
e1_cmp32_family:
    clr  r27

    ld   r0, X+
    ld   r4, Z+
    cp   r0, r4

    ld   r0, X+
    ld   r4, Z+
    cpc  r0, r4

    ld   r0, X+
    ld   r4, Z+
    cpc  r0, r4

    ld   r0, X
    ld   r4, Z
    cpc  r0, r4

    in   VM_FLAGS, SREG
    rjmp e1_dispatch_func

; Keep the local continuations close enough for all RJMP/BRxx sites.
e1_unimplemented_instruction_func:
    rjmp e1_unimplemented_instruction_func

e1_invalid_secondary_instruction_func:
    rjmp e1_invalid_secondary_instruction_func

e1_dispatch_func:
    dispatch
