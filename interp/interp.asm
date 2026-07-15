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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Native register allocation and architectural state
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; AVR r0:r1     MUL result and unrestricted interpreter scratch
; AVR r2        permanent zero; SPI dummy-transmit byte
; AVR r3        permanent one
; AVR r4:r6     24-bit VM program counter, little-endian
; AVR r7        permanent four; primary-table stride in AVR words
; AVR r8:r23    AVM architectural registers r0-r7
; AVR r24:r27   general interpreter scratch (X is r26:r27)
; AVR r28:r29   AVM stack pointer (Y)
; AVR r30:r31   general scratch and dispatch target (Z)
; GPIOR0        architectural VM_FLAGS
;
; r2, r3, and r7 are initialized once and are immutable thereafter. Native
; r0:r1 have no ABI zero-register requirement; this runtime is assembly-only.

#define PRIMARY_TABLE_ORG          0x0200
#define PRIMARY_STRIDE_WORDS       4
#define PRIMARY_STRIDE_BYTES       (2 * PRIMARY_STRIDE_WORDS)
#define PRIMARY_OPCODE             r24

; Generic bounded-secondary decoder scratch allocation. PRIMARY_OPCODE and
; SECONDARY_OPCODE deliberately alias r24: once a prefix slot has been entered,
; the primary opcode is no longer needed except by specialized prefix handlers.
#define SECONDARY_OPCODE           r24
#define SECONDARY_LIMIT            r25
#define SECONDARY_MULTIPLIER       r26
#define SECONDARY_SREG             r27

; FB-FD shared conditional-move gate scratch allocation.
#define CMOV_SAVED_SREG            r24
#define CMOV_TEST                  r25
#define CMOV_SECONDARY             r26
#define CMOV_MASK                  r27

#define ZERO                       r2
#define ONE                        r3
#define FOUR                       r7

#define VM_PCL                     r4
#define VM_PCM                     r5
#define VM_PCH                     r6

#define VM_FLAGS                   GPIOR0

#define VM_SP_INITIAL_VALUE        0x0A00
#define VM_SP                      r28
#define VM_SPL                     r28
#define VM_SPH                     r29

#define VM_R0                      r8
#define VM_R1                      r10
#define VM_R2                      r12
#define VM_R3                      r14
#define VM_R4                      r16
#define VM_R5                      r18
#define VM_R6                      r20
#define VM_R7                      r22

#define VM_R0L                     r8
#define VM_R1L                     r10
#define VM_R2L                     r12
#define VM_R3L                     r14
#define VM_R4L                     r16
#define VM_R5L                     r18
#define VM_R6L                     r20
#define VM_R7L                     r22

#define VM_R0H                     r9
#define VM_R1H                     r11
#define VM_R2H                     r13
#define VM_R3H                     r15
#define VM_R4H                     r17
#define VM_R5H                     r19
#define VM_R6H                     r21
#define VM_R7H                     r23

#define VM_C0                      VM_R4
#define VM_C1                      VM_R5
#define VM_C2                      VM_R6
#define VM_C3                      VM_R7

#define VM_C0L                     VM_R4L
#define VM_C1L                     VM_R5L
#define VM_C2L                     VM_R6L
#define VM_C3L                     VM_R7L

#define VM_C0H                     VM_R4H
#define VM_C1H                     VM_R5H
#define VM_C2H                     VM_R6H
#define VM_C3H                     VM_R7H
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

#if (PRIMARY_TABLE_ORG & 0x1FF) != 0
#  error "Primary dispatch requires 256-word (512-byte) alignment"
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
#define SYS_MILLIS              0x02
#define SYS_MILLIS32            0x03

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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Primary dispatch machinery
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; The primary table has 256 fixed four-word slots. A completed short handler
; ends with RJMP to a shared cadence tail; a longer primary handler may use its
; fourth word to forward to an out-of-line continuation. All defined non-prefix
; primary opcodes through 0xEF are implemented below; F0-FE remain secondary-
; page migration stubs and reserved encodings trap as invalid.

; Standard 18-cycle sequential dispatch. PRIMARY_OPCODE is the byte fetched
; for the next instruction; the 24-bit VM PC advances by one byte.
.macro dispatch
    in   PRIMARY_OPCODE, SPDR
    out  SPDR, ZERO
    add  VM_PCL, ONE
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO
    mul  PRIMARY_OPCODE, FOUR
    movw r30, r0
    subi r31, hi8(-(pm(primary_table)))
    ijmp
.endm

; Reverse-order 17-cycle sequential dispatch. CLI protects the SPDR read/start
; handoff, while the carry from the low-byte PC increment remains live until
; the middle and high bytes are updated.
.macro dispatch_reverse
    add  VM_PCL, ONE
    cli
    out  SPDR, ZERO
    in   PRIMARY_OPCODE, SPDR
    sei
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO
    mul  PRIMARY_OPCODE, FOUR
    movw r30, r0
    subi r31, hi8(-(pm(primary_table)))
    ijmp
.endm

; A skeleton slot is exactly four AVR words. The three unreachable NOPs reserve
; the words that a future direct handler or setup sequence may occupy.
.macro emit_primary_stub label, target
\label:
    rjmp \target
    nop
    nop
    nop
.Lprimary_stub_end_\@:
    .if (.Lprimary_stub_end_\@ - \label) != PRIMARY_STRIDE_BYTES
        .error "primary dispatch slot is not exactly four words"
    .endif
.endm


; All direct primary-emission macros below produce exactly four AVR words.
; Padding after an unconditional RJMP is unreachable and exists only to retain
; the fixed primary-table stride.

.macro assert_primary_slot_width label
.Lprimary_slot_end_\@:
    .if (.Lprimary_slot_end_\@ - \label) != PRIMARY_STRIDE_BYTES
        .error "implemented primary dispatch slot is not exactly four words"
    .endif
.endm

; 3 handler cycles plus one landing-pad cycle -> 17-cycle cadence.
.macro emit_primary_mov label, dst, src
\label:
    movw \dst, \src
    rjmp cluster_tail_17_delay_1
    nop
    nop
    assert_primary_slot_width \label
.endm

; 4 handler cycles -> 17-cycle cadence.
.macro emit_primary_binary label, lowop, highop, dstl, dsth, srcl, srch
\label:
    \lowop  \dstl, \srcl
    \highop \dsth, \srch
    rjmp cluster_tail_17
    nop
    assert_primary_slot_width \label
.endm

; Capture native SREG in PRIMARY_OPCODE and commit it to architectural
; VM_FLAGS through a dedicated 18-cycle dispatch landing.
.macro emit_primary_cmp label, lhsl, lhsh, rhsl, rhsh
\label:
    cp   \lhsl, \rhsl
    cpc  \lhsh, \rhsh
    in   PRIMARY_OPCODE, SREG
    rjmp flags_commit_18_delay_1
    assert_primary_slot_width \label
.endm

; Capture the address in X before overwriting the destination. This preserves
; the specified alias behavior when cD == cA.
.macro emit_primary_ld8u label, dstl, dsth, addr
\label:
    movw r26, \addr
    ld   \dstl, X
    clr  \dsth
    rjmp cluster_tail_18_delay_1
    assert_primary_slot_width \label
.endm

.macro emit_primary_st8 label, addr, srcl
\label:
    movw r26, \addr
    st   X, \srcl
    rjmp cluster_tail_18_delay_2
    nop
    assert_primary_slot_width \label
.endm

.macro emit_primary_ld16 label, dstl, dsth, addr
\label:
    movw r26, \addr
    ld   \dstl, X+
    ld   \dsth, X
    rjmp cluster_tail_18
    assert_primary_slot_width \label
.endm

.macro emit_primary_st16 label, addr, srcl, srch
\label:
    movw r26, \addr
    st   X+, \srcl
    st   X,  \srch
    rjmp cluster_tail_18
    assert_primary_slot_width \label
.endm

; The VM stack grows downward. PUSH stores high then low so VM_SP points at
; the little-endian low byte; POP reverses the operation.
.macro emit_primary_push16 label, srcl, srch
\label:
    st   -Y, \srch
    st   -Y, \srcl
    rjmp cluster_tail_18_delay_1
    nop
    assert_primary_slot_width \label
.endm

.macro emit_primary_pop16 label, dstl, dsth
\label:
    ld   \dstl, Y+
    ld   \dsth, Y+
    rjmp cluster_tail_18_delay_1
    nop
    assert_primary_slot_width \label
.endm

; Multi-byte primary slots preload a destination-specific apply address in Z,
; then forward to a family-shared operand-fetch continuation. The fourth word
; is padding so every slot retains the fixed four-word primary stride.
.macro emit_primary_immediate label, apply, fetch
\label:
    ldi  r30, lo8(pm(\apply))
    ldi  r31, hi8(pm(\apply))
    rjmp \fetch
    nop
    assert_primary_slot_width \label
.endm

; Generic bounded-page prefix. The slot preloads the page bound and table base;
; a width-shared two-word stub supplies the slot multiplier.
.macro emit_primary_bounded_page label, limit, table, width_stub
\label:
    ldi  SECONDARY_LIMIT, \limit
    ldi  r30, lo8(pm(\table))
    ldi  r31, hi8(pm(\table))
    rjmp \width_stub
    assert_primary_slot_width \label
.endm

; FB-FD each preload a one-bit architectural-condition mask and the shared
; two-word CMOV table address. The secondary byte is already in flight.
.macro emit_primary_cmov_page label, mask
\label:
    ldi  CMOV_MASK, \mask
    ldi  r30, lo8(pm(cmov_table))
    ldi  r31, hi8(pm(cmov_table))
    rjmp cmov_gate
    assert_primary_slot_width \label
.endm

.org PRIMARY_TABLE_ORG
.global primary_table
.global abvm_interp
primary_table:
abvm_interp:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x00-0x0F: MOV cD,cS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_mov primary_00, VM_C0, VM_C0
emit_primary_mov primary_01, VM_C0, VM_C1
emit_primary_mov primary_02, VM_C0, VM_C2
emit_primary_mov primary_03, VM_C0, VM_C3
emit_primary_mov primary_04, VM_C1, VM_C0
emit_primary_mov primary_05, VM_C1, VM_C1
emit_primary_mov primary_06, VM_C1, VM_C2
emit_primary_mov primary_07, VM_C1, VM_C3
emit_primary_mov primary_08, VM_C2, VM_C0
emit_primary_mov primary_09, VM_C2, VM_C1
emit_primary_mov primary_0A, VM_C2, VM_C2
emit_primary_mov primary_0B, VM_C2, VM_C3
emit_primary_mov primary_0C, VM_C3, VM_C0
emit_primary_mov primary_0D, VM_C3, VM_C1
emit_primary_mov primary_0E, VM_C3, VM_C2
emit_primary_mov primary_0F, VM_C3, VM_C3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x10-0x1F: ADD cD,cS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_binary primary_10, add, adc, VM_C0L, VM_C0H, VM_C0L, VM_C0H
emit_primary_binary primary_11, add, adc, VM_C0L, VM_C0H, VM_C1L, VM_C1H
emit_primary_binary primary_12, add, adc, VM_C0L, VM_C0H, VM_C2L, VM_C2H
emit_primary_binary primary_13, add, adc, VM_C0L, VM_C0H, VM_C3L, VM_C3H
emit_primary_binary primary_14, add, adc, VM_C1L, VM_C1H, VM_C0L, VM_C0H
emit_primary_binary primary_15, add, adc, VM_C1L, VM_C1H, VM_C1L, VM_C1H
emit_primary_binary primary_16, add, adc, VM_C1L, VM_C1H, VM_C2L, VM_C2H
emit_primary_binary primary_17, add, adc, VM_C1L, VM_C1H, VM_C3L, VM_C3H
emit_primary_binary primary_18, add, adc, VM_C2L, VM_C2H, VM_C0L, VM_C0H
emit_primary_binary primary_19, add, adc, VM_C2L, VM_C2H, VM_C1L, VM_C1H
emit_primary_binary primary_1A, add, adc, VM_C2L, VM_C2H, VM_C2L, VM_C2H
emit_primary_binary primary_1B, add, adc, VM_C2L, VM_C2H, VM_C3L, VM_C3H
emit_primary_binary primary_1C, add, adc, VM_C3L, VM_C3H, VM_C0L, VM_C0H
emit_primary_binary primary_1D, add, adc, VM_C3L, VM_C3H, VM_C1L, VM_C1H
emit_primary_binary primary_1E, add, adc, VM_C3L, VM_C3H, VM_C2L, VM_C2H
emit_primary_binary primary_1F, add, adc, VM_C3L, VM_C3H, VM_C3L, VM_C3H

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x20-0x2F: SUB cD,cS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_binary primary_20, sub, sbc, VM_C0L, VM_C0H, VM_C0L, VM_C0H
emit_primary_binary primary_21, sub, sbc, VM_C0L, VM_C0H, VM_C1L, VM_C1H
emit_primary_binary primary_22, sub, sbc, VM_C0L, VM_C0H, VM_C2L, VM_C2H
emit_primary_binary primary_23, sub, sbc, VM_C0L, VM_C0H, VM_C3L, VM_C3H
emit_primary_binary primary_24, sub, sbc, VM_C1L, VM_C1H, VM_C0L, VM_C0H
emit_primary_binary primary_25, sub, sbc, VM_C1L, VM_C1H, VM_C1L, VM_C1H
emit_primary_binary primary_26, sub, sbc, VM_C1L, VM_C1H, VM_C2L, VM_C2H
emit_primary_binary primary_27, sub, sbc, VM_C1L, VM_C1H, VM_C3L, VM_C3H
emit_primary_binary primary_28, sub, sbc, VM_C2L, VM_C2H, VM_C0L, VM_C0H
emit_primary_binary primary_29, sub, sbc, VM_C2L, VM_C2H, VM_C1L, VM_C1H
emit_primary_binary primary_2A, sub, sbc, VM_C2L, VM_C2H, VM_C2L, VM_C2H
emit_primary_binary primary_2B, sub, sbc, VM_C2L, VM_C2H, VM_C3L, VM_C3H
emit_primary_binary primary_2C, sub, sbc, VM_C3L, VM_C3H, VM_C0L, VM_C0H
emit_primary_binary primary_2D, sub, sbc, VM_C3L, VM_C3H, VM_C1L, VM_C1H
emit_primary_binary primary_2E, sub, sbc, VM_C3L, VM_C3H, VM_C2L, VM_C2H
emit_primary_binary primary_2F, sub, sbc, VM_C3L, VM_C3H, VM_C3L, VM_C3H

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x30-0x3F: CMP cL,cR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_cmp primary_30, VM_C0L, VM_C0H, VM_C0L, VM_C0H
emit_primary_cmp primary_31, VM_C0L, VM_C0H, VM_C1L, VM_C1H
emit_primary_cmp primary_32, VM_C0L, VM_C0H, VM_C2L, VM_C2H
emit_primary_cmp primary_33, VM_C0L, VM_C0H, VM_C3L, VM_C3H
emit_primary_cmp primary_34, VM_C1L, VM_C1H, VM_C0L, VM_C0H
emit_primary_cmp primary_35, VM_C1L, VM_C1H, VM_C1L, VM_C1H
emit_primary_cmp primary_36, VM_C1L, VM_C1H, VM_C2L, VM_C2H
emit_primary_cmp primary_37, VM_C1L, VM_C1H, VM_C3L, VM_C3H
emit_primary_cmp primary_38, VM_C2L, VM_C2H, VM_C0L, VM_C0H
emit_primary_cmp primary_39, VM_C2L, VM_C2H, VM_C1L, VM_C1H
emit_primary_cmp primary_3A, VM_C2L, VM_C2H, VM_C2L, VM_C2H
emit_primary_cmp primary_3B, VM_C2L, VM_C2H, VM_C3L, VM_C3H
emit_primary_cmp primary_3C, VM_C3L, VM_C3H, VM_C0L, VM_C0H
emit_primary_cmp primary_3D, VM_C3L, VM_C3H, VM_C1L, VM_C1H
emit_primary_cmp primary_3E, VM_C3L, VM_C3H, VM_C2L, VM_C2H
emit_primary_cmp primary_3F, VM_C3L, VM_C3H, VM_C3L, VM_C3H

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x40-0x4F: LD8U cD,[cA]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_ld8u primary_40, VM_C0L, VM_C0H, VM_C0
emit_primary_ld8u primary_41, VM_C0L, VM_C0H, VM_C1
emit_primary_ld8u primary_42, VM_C0L, VM_C0H, VM_C2
emit_primary_ld8u primary_43, VM_C0L, VM_C0H, VM_C3
emit_primary_ld8u primary_44, VM_C1L, VM_C1H, VM_C0
emit_primary_ld8u primary_45, VM_C1L, VM_C1H, VM_C1
emit_primary_ld8u primary_46, VM_C1L, VM_C1H, VM_C2
emit_primary_ld8u primary_47, VM_C1L, VM_C1H, VM_C3
emit_primary_ld8u primary_48, VM_C2L, VM_C2H, VM_C0
emit_primary_ld8u primary_49, VM_C2L, VM_C2H, VM_C1
emit_primary_ld8u primary_4A, VM_C2L, VM_C2H, VM_C2
emit_primary_ld8u primary_4B, VM_C2L, VM_C2H, VM_C3
emit_primary_ld8u primary_4C, VM_C3L, VM_C3H, VM_C0
emit_primary_ld8u primary_4D, VM_C3L, VM_C3H, VM_C1
emit_primary_ld8u primary_4E, VM_C3L, VM_C3H, VM_C2
emit_primary_ld8u primary_4F, VM_C3L, VM_C3H, VM_C3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x50-0x5F: ST8 [cA],cS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_st8 primary_50, VM_C0, VM_C0L
emit_primary_st8 primary_51, VM_C0, VM_C1L
emit_primary_st8 primary_52, VM_C0, VM_C2L
emit_primary_st8 primary_53, VM_C0, VM_C3L
emit_primary_st8 primary_54, VM_C1, VM_C0L
emit_primary_st8 primary_55, VM_C1, VM_C1L
emit_primary_st8 primary_56, VM_C1, VM_C2L
emit_primary_st8 primary_57, VM_C1, VM_C3L
emit_primary_st8 primary_58, VM_C2, VM_C0L
emit_primary_st8 primary_59, VM_C2, VM_C1L
emit_primary_st8 primary_5A, VM_C2, VM_C2L
emit_primary_st8 primary_5B, VM_C2, VM_C3L
emit_primary_st8 primary_5C, VM_C3, VM_C0L
emit_primary_st8 primary_5D, VM_C3, VM_C1L
emit_primary_st8 primary_5E, VM_C3, VM_C2L
emit_primary_st8 primary_5F, VM_C3, VM_C3L

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x60-0x6F: LD16 cD,[cA]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_ld16 primary_60, VM_C0L, VM_C0H, VM_C0
emit_primary_ld16 primary_61, VM_C0L, VM_C0H, VM_C1
emit_primary_ld16 primary_62, VM_C0L, VM_C0H, VM_C2
emit_primary_ld16 primary_63, VM_C0L, VM_C0H, VM_C3
emit_primary_ld16 primary_64, VM_C1L, VM_C1H, VM_C0
emit_primary_ld16 primary_65, VM_C1L, VM_C1H, VM_C1
emit_primary_ld16 primary_66, VM_C1L, VM_C1H, VM_C2
emit_primary_ld16 primary_67, VM_C1L, VM_C1H, VM_C3
emit_primary_ld16 primary_68, VM_C2L, VM_C2H, VM_C0
emit_primary_ld16 primary_69, VM_C2L, VM_C2H, VM_C1
emit_primary_ld16 primary_6A, VM_C2L, VM_C2H, VM_C2
emit_primary_ld16 primary_6B, VM_C2L, VM_C2H, VM_C3
emit_primary_ld16 primary_6C, VM_C3L, VM_C3H, VM_C0
emit_primary_ld16 primary_6D, VM_C3L, VM_C3H, VM_C1
emit_primary_ld16 primary_6E, VM_C3L, VM_C3H, VM_C2
emit_primary_ld16 primary_6F, VM_C3L, VM_C3H, VM_C3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x70-0x7F: ST16 [cA],cS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_st16 primary_70, VM_C0, VM_C0L, VM_C0H
emit_primary_st16 primary_71, VM_C0, VM_C1L, VM_C1H
emit_primary_st16 primary_72, VM_C0, VM_C2L, VM_C2H
emit_primary_st16 primary_73, VM_C0, VM_C3L, VM_C3H
emit_primary_st16 primary_74, VM_C1, VM_C0L, VM_C0H
emit_primary_st16 primary_75, VM_C1, VM_C1L, VM_C1H
emit_primary_st16 primary_76, VM_C1, VM_C2L, VM_C2H
emit_primary_st16 primary_77, VM_C1, VM_C3L, VM_C3H
emit_primary_st16 primary_78, VM_C2, VM_C0L, VM_C0H
emit_primary_st16 primary_79, VM_C2, VM_C1L, VM_C1H
emit_primary_st16 primary_7A, VM_C2, VM_C2L, VM_C2H
emit_primary_st16 primary_7B, VM_C2, VM_C3L, VM_C3H
emit_primary_st16 primary_7C, VM_C3, VM_C0L, VM_C0H
emit_primary_st16 primary_7D, VM_C3, VM_C1L, VM_C1H
emit_primary_st16 primary_7E, VM_C3, VM_C2L, VM_C2H
emit_primary_st16 primary_7F, VM_C3, VM_C3L, VM_C3H

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x80-0x8F: AND cD,cS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_binary primary_80, and, and, VM_C0L, VM_C0H, VM_C0L, VM_C0H
emit_primary_binary primary_81, and, and, VM_C0L, VM_C0H, VM_C1L, VM_C1H
emit_primary_binary primary_82, and, and, VM_C0L, VM_C0H, VM_C2L, VM_C2H
emit_primary_binary primary_83, and, and, VM_C0L, VM_C0H, VM_C3L, VM_C3H
emit_primary_binary primary_84, and, and, VM_C1L, VM_C1H, VM_C0L, VM_C0H
emit_primary_binary primary_85, and, and, VM_C1L, VM_C1H, VM_C1L, VM_C1H
emit_primary_binary primary_86, and, and, VM_C1L, VM_C1H, VM_C2L, VM_C2H
emit_primary_binary primary_87, and, and, VM_C1L, VM_C1H, VM_C3L, VM_C3H
emit_primary_binary primary_88, and, and, VM_C2L, VM_C2H, VM_C0L, VM_C0H
emit_primary_binary primary_89, and, and, VM_C2L, VM_C2H, VM_C1L, VM_C1H
emit_primary_binary primary_8A, and, and, VM_C2L, VM_C2H, VM_C2L, VM_C2H
emit_primary_binary primary_8B, and, and, VM_C2L, VM_C2H, VM_C3L, VM_C3H
emit_primary_binary primary_8C, and, and, VM_C3L, VM_C3H, VM_C0L, VM_C0H
emit_primary_binary primary_8D, and, and, VM_C3L, VM_C3H, VM_C1L, VM_C1H
emit_primary_binary primary_8E, and, and, VM_C3L, VM_C3H, VM_C2L, VM_C2H
emit_primary_binary primary_8F, and, and, VM_C3L, VM_C3H, VM_C3L, VM_C3H

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x90-0x9F: OR cD,cS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_binary primary_90, or, or, VM_C0L, VM_C0H, VM_C0L, VM_C0H
emit_primary_binary primary_91, or, or, VM_C0L, VM_C0H, VM_C1L, VM_C1H
emit_primary_binary primary_92, or, or, VM_C0L, VM_C0H, VM_C2L, VM_C2H
emit_primary_binary primary_93, or, or, VM_C0L, VM_C0H, VM_C3L, VM_C3H
emit_primary_binary primary_94, or, or, VM_C1L, VM_C1H, VM_C0L, VM_C0H
emit_primary_binary primary_95, or, or, VM_C1L, VM_C1H, VM_C1L, VM_C1H
emit_primary_binary primary_96, or, or, VM_C1L, VM_C1H, VM_C2L, VM_C2H
emit_primary_binary primary_97, or, or, VM_C1L, VM_C1H, VM_C3L, VM_C3H
emit_primary_binary primary_98, or, or, VM_C2L, VM_C2H, VM_C0L, VM_C0H
emit_primary_binary primary_99, or, or, VM_C2L, VM_C2H, VM_C1L, VM_C1H
emit_primary_binary primary_9A, or, or, VM_C2L, VM_C2H, VM_C2L, VM_C2H
emit_primary_binary primary_9B, or, or, VM_C2L, VM_C2H, VM_C3L, VM_C3H
emit_primary_binary primary_9C, or, or, VM_C3L, VM_C3H, VM_C0L, VM_C0H
emit_primary_binary primary_9D, or, or, VM_C3L, VM_C3H, VM_C1L, VM_C1H
emit_primary_binary primary_9E, or, or, VM_C3L, VM_C3H, VM_C2L, VM_C2H
emit_primary_binary primary_9F, or, or, VM_C3L, VM_C3H, VM_C3L, VM_C3H

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xA0-0xAF: XOR cD,cS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_binary primary_A0, eor, eor, VM_C0L, VM_C0H, VM_C0L, VM_C0H
emit_primary_binary primary_A1, eor, eor, VM_C0L, VM_C0H, VM_C1L, VM_C1H
emit_primary_binary primary_A2, eor, eor, VM_C0L, VM_C0H, VM_C2L, VM_C2H
emit_primary_binary primary_A3, eor, eor, VM_C0L, VM_C0H, VM_C3L, VM_C3H
emit_primary_binary primary_A4, eor, eor, VM_C1L, VM_C1H, VM_C0L, VM_C0H
emit_primary_binary primary_A5, eor, eor, VM_C1L, VM_C1H, VM_C1L, VM_C1H
emit_primary_binary primary_A6, eor, eor, VM_C1L, VM_C1H, VM_C2L, VM_C2H
emit_primary_binary primary_A7, eor, eor, VM_C1L, VM_C1H, VM_C3L, VM_C3H
emit_primary_binary primary_A8, eor, eor, VM_C2L, VM_C2H, VM_C0L, VM_C0H
emit_primary_binary primary_A9, eor, eor, VM_C2L, VM_C2H, VM_C1L, VM_C1H
emit_primary_binary primary_AA, eor, eor, VM_C2L, VM_C2H, VM_C2L, VM_C2H
emit_primary_binary primary_AB, eor, eor, VM_C2L, VM_C2H, VM_C3L, VM_C3H
emit_primary_binary primary_AC, eor, eor, VM_C3L, VM_C3H, VM_C0L, VM_C0H
emit_primary_binary primary_AD, eor, eor, VM_C3L, VM_C3H, VM_C1L, VM_C1H
emit_primary_binary primary_AE, eor, eor, VM_C3L, VM_C3H, VM_C2L, VM_C2H
emit_primary_binary primary_AF, eor, eor, VM_C3L, VM_C3H, VM_C3L, VM_C3H

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xB0-0xB7: PUSH16 rN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_push16 primary_B0_push16_r0, VM_R0L, VM_R0H
emit_primary_push16 primary_B1_push16_r1, VM_R1L, VM_R1H
emit_primary_push16 primary_B2_push16_r2, VM_R2L, VM_R2H
emit_primary_push16 primary_B3_push16_r3, VM_R3L, VM_R3H
emit_primary_push16 primary_B4_push16_r4, VM_R4L, VM_R4H
emit_primary_push16 primary_B5_push16_r5, VM_R5L, VM_R5H
emit_primary_push16 primary_B6_push16_r6, VM_R6L, VM_R6H
emit_primary_push16 primary_B7_push16_r7, VM_R7L, VM_R7H

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xB8-0xBF: POP16 rN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_pop16 primary_B8_pop16_r0, VM_R0L, VM_R0H
emit_primary_pop16 primary_B9_pop16_r1, VM_R1L, VM_R1H
emit_primary_pop16 primary_BA_pop16_r2, VM_R2L, VM_R2H
emit_primary_pop16 primary_BB_pop16_r3, VM_R3L, VM_R3H
emit_primary_pop16 primary_BC_pop16_r4, VM_R4L, VM_R4H
emit_primary_pop16 primary_BD_pop16_r5, VM_R5L, VM_R5H
emit_primary_pop16 primary_BE_pop16_r6, VM_R6L, VM_R6H
emit_primary_pop16 primary_BF_pop16_r7, VM_R7L, VM_R7H

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xC0-0xC3: LDI8 cD,imm8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_immediate primary_C0_ldi8_c0, ldi8_c0_apply, fetch_imm8_then_ijmp
emit_primary_immediate primary_C1_ldi8_c1, ldi8_c1_apply, fetch_imm8_then_ijmp
emit_primary_immediate primary_C2_ldi8_c2, ldi8_c2_apply, fetch_imm8_then_ijmp
emit_primary_immediate primary_C3_ldi8_c3, ldi8_c3_apply, fetch_imm8_then_ijmp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xC4-0xC7: LDI16 cD,imm16
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_immediate primary_C4_ldi16_c0, ldi16_c0_apply, fetch_imm16_then_ijmp
emit_primary_immediate primary_C5_ldi16_c1, ldi16_c1_apply, fetch_imm16_then_ijmp
emit_primary_immediate primary_C6_ldi16_c2, ldi16_c2_apply, fetch_imm16_then_ijmp
emit_primary_immediate primary_C7_ldi16_c3, ldi16_c3_apply, fetch_imm16_then_ijmp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xC8-0xCB: ADDI.S8 cD,simm8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_immediate primary_C8_addi_s8_c0, addi_s8_c0_apply, fetch_simm8_then_ijmp
emit_primary_immediate primary_C9_addi_s8_c1, addi_s8_c1_apply, fetch_simm8_then_ijmp
emit_primary_immediate primary_CA_addi_s8_c2, addi_s8_c2_apply, fetch_simm8_then_ijmp
emit_primary_immediate primary_CB_addi_s8_c3, addi_s8_c3_apply, fetch_simm8_then_ijmp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xCC-0xCF: CMPI.S8 cL,simm8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_immediate primary_CC_cmpi_s8_c0, cmpi_s8_c0_apply, fetch_simm8_then_ijmp
emit_primary_immediate primary_CD_cmpi_s8_c1, cmpi_s8_c1_apply, fetch_simm8_then_ijmp
emit_primary_immediate primary_CE_cmpi_s8_c2, cmpi_s8_c2_apply, fetch_simm8_then_ijmp
emit_primary_immediate primary_CF_cmpi_s8_c3, cmpi_s8_c3_apply, fetch_simm8_then_ijmp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xD0-0xD3: conditional branches
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; All D0-D6 instructions have one signed byte operand. The primary slot
; advances VM_PC from the opcode to that operand and forwards to an out-of-line
; continuation. This exactly fills the fixed four-word primary slot.

.macro emit_primary_rel8 label, target
\label:
    add  VM_PCL, ONE
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO
    rjmp \target
    assert_primary_slot_width \label
.endm

emit_primary_rel8 primary_D0_breq_rel8,  breq_rel8_decode_func
emit_primary_rel8 primary_D1_brne_rel8,  brne_rel8_decode_func
emit_primary_rel8 primary_D2_brult_rel8, brult_rel8_decode_func
emit_primary_rel8 primary_D3_brslt_rel8, brslt_rel8_decode_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xD4-0xD7: relative control, ADJSP, and SYS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_rel8 primary_D4_jmp_rel8,  jmp_rel8_func
emit_primary_rel8 primary_D5_call_rel8, call_rel8_func
emit_primary_rel8 primary_D6_adjsp,     adjsp_simm8_func

; Account for the service byte in the 24-bit VM PC. The out-of-line decoder
; reads that byte from SPDR and immediately starts fetching the following
; primary opcode. This setup plus the final RJMP exactly fills the four-word
; primary slot.
primary_D7_sys:
    add  VM_PCL, ONE
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO
    rjmp sys_decode_func
primary_D7_sys_end:
.if (primary_D7_sys_end - primary_D7_sys) != PRIMARY_STRIDE_BYTES
    .error "SYS primary dispatch slot is not exactly four words"
.endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xD8-0xDF: reserved
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_stub primary_D8_reserved, invalid_primary_instruction_func
emit_primary_stub primary_D9_reserved, invalid_primary_instruction_func
emit_primary_stub primary_DA_reserved, invalid_primary_instruction_func
emit_primary_stub primary_DB_reserved, invalid_primary_instruction_func
emit_primary_stub primary_DC_reserved, invalid_primary_instruction_func
emit_primary_stub primary_DD_reserved, invalid_primary_instruction_func
emit_primary_stub primary_DE_reserved, invalid_primary_instruction_func
emit_primary_stub primary_DF_reserved, invalid_primary_instruction_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xE0-0xE3: direct near/far control
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; JMP16/CALL16 consume a little-endian signed 16-bit displacement relative to
; the address immediately following the three-byte instruction. Their primary
; slots advance VM_PC from the opcode to the low displacement byte.
;
; JMPF/CALLF consume a little-endian absolute 24-bit image-relative target.
; JMPF does not need the sequential VM_PC, so its slot spends the same three
; setup cycles as the other direct-control slots only to preserve the first-byte
; SPI read timing. CALLF advances directly from the opcode to nextPC with FOUR
; so the return address is ready to push while later target bytes are fetched.

.macro emit_primary_rel16 label, target
\label:
    add  VM_PCL, ONE
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO
    rjmp \target
    assert_primary_slot_width \label
.endm

emit_primary_rel16 primary_E0_jmp16,  jmp_call_rel16_func
emit_primary_rel16 primary_E1_call16, jmp_call_rel16_func

primary_E2_jmpf:
    nop
    nop
    nop
    rjmp jmp_call_far_func
    assert_primary_slot_width primary_E2_jmpf

primary_E3_callf:
    add  VM_PCL, FOUR
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO
    rjmp jmp_call_far_func
    assert_primary_slot_width primary_E3_callf

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xE4-0xE7: JMPP qN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; A program pointer uses the first register of qN for bits 15:0 and the low
; byte of the second register for bits 23:16. The unused top byte of qN is
; ignored. Each primary slot installs that 24-bit address as the current VM PC
; and forwards to the shared stream-seek/primary-dispatch handler.

.macro emit_primary_jmpp label, ptr16, ptr23_16
\label:
    movw VM_PCL, \ptr16
    mov  VM_PCH, \ptr23_16
    delay_3
    rjmp seek_and_dispatch_func
    assert_primary_slot_width \label
.endm

emit_primary_jmpp primary_E4_jmpp_q0, VM_R0, VM_R1L
emit_primary_jmpp primary_E5_jmpp_q1, VM_R2, VM_R3L
emit_primary_jmpp primary_E6_jmpp_q2, VM_R4, VM_R5L
emit_primary_jmpp primary_E7_jmpp_q3, VM_R6, VM_R7L

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xE8-0xEB: CALLP qN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; CALLP is a one-byte instruction, so VM_PC already contains the sequential
; return address at primary-slot entry. Preserve the selected 24-bit program
; pointer in scratch before the shared prologue pushes VM_PC and installs the
; target. The speculative sequential-byte transfer has ample time to finish
; before the shared seek handler toggles flash chip select; no delay is needed.

.macro emit_primary_callp label, ptr16, ptr23_16
\label:
    movw r24, \ptr16
    mov  r26, \ptr23_16
    rjmp push_pc_seek_and_dispatch_func
    nop
    assert_primary_slot_width \label
.endm

emit_primary_callp primary_E8_callp_q0, VM_R0, VM_R1L
emit_primary_callp primary_E9_callp_q1, VM_R2, VM_R3L
emit_primary_callp primary_EA_callp_q2, VM_R4, VM_R5L
emit_primary_callp primary_EB_callp_q3, VM_R6, VM_R7L

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xEC-0xEE: reserved
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_stub primary_EC_reserved, invalid_primary_instruction_func
emit_primary_stub primary_ED_reserved, invalid_primary_instruction_func
emit_primary_stub primary_EE_reserved, invalid_primary_instruction_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xEF: RET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Return addresses are stored little-endian at VM_SP: low, middle, high. RET
; restores the complete 24-bit VM PC directly in its four-word primary slot and
; enters the common stream-restart handler. No forwarding body or delay is
; required; the three two-cycle loads already outlast the discarded speculative
; byte transfer before flash chip select is toggled.

primary_EF_ret:
    ld   VM_PCL, Y+
    ld   VM_PCM, Y+
    ld   VM_PCH, Y+
    rjmp seek_and_dispatch_func
    assert_primary_slot_width primary_EF_ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xF0-0xFE: secondary-page prefixes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Each bounded page now advertises its architectural upper bound. Every valid
; entry is present at its specified natural width and currently forwards to a
; nearby unimplemented-secondary trap.
; F0 bound 0x6E, one-word veneer slots.
emit_primary_bounded_page primary_F0_cold_veneer_page, 0x6E, f0_veneer_table, secondary_width_1_stub
; F1 bound 0x90, two-word slots.
emit_primary_bounded_page primary_F1_dense_2word_page, 0x90, f1_table, secondary_width_2_stub
; F2 bound 0x60, three-word slots.
emit_primary_bounded_page primary_F2_dense_3word_page_a, 0x60, f2_table, secondary_width_3_stub
; F3 bound 0x80, three-word slots.
emit_primary_bounded_page primary_F3_dense_3word_page_b, 0x80, f3_table, secondary_width_3_stub
; F4 bound 0xB8, three-word slots.
emit_primary_bounded_page primary_F4_dense_3word_page_c, 0xB8, f4_table, secondary_width_3_stub
; F5 bound 0x60, four-word slots.
emit_primary_bounded_page primary_F5_dense_4word_page_a, 0x60, f5_table, secondary_width_4_stub
; F6 bound 0x50, four-word slots.
emit_primary_bounded_page primary_F6_dense_4word_page_b, 0x50, f6_table, secondary_width_4_stub
; F7 bound 0x90, five-word slots.
emit_primary_bounded_page primary_F7_dense_5word_page_a, 0x90, f7_table, secondary_width_5_stub
; F8 bound 0x30, five-word slots.
emit_primary_bounded_page primary_F8_simple_condition_page, 0x30, f8_table, secondary_width_5_stub

; F9 is a dedicated table-free runtime decoder. Its primary slot only forwards
; to the nearby exact-width handler; the secondary byte is already in flight.
emit_primary_stub primary_F9_runtime_bitwise_page, f9_bitop_entry

; FA bound 0x30, two-word forwarding slots.
emit_primary_bounded_page primary_FA_variable_shift_page, 0x30, fa_forward_table, secondary_width_2_stub

; FB-FD share one condition gate and one 64-entry operand table. Bit 6 of the
; secondary byte selects the inverse condition; bit 7 is reserved.
emit_primary_cmov_page primary_FB_cmov_eq_ne_page,  (1 << SREG_Z)
emit_primary_cmov_page primary_FC_cmov_ult_uge_page, (1 << SREG_C)
emit_primary_cmov_page primary_FD_cmov_slt_sge_page, (1 << SREG_S)
; FE bound 0x40, two-word forwarding slots.
emit_primary_bounded_page primary_FE_mul16_page, 0x40, fe_forward_table, secondary_width_2_stub

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xFF: reserved
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_stub primary_FF_reserved, invalid_primary_instruction_func

primary_table_end:
.if (primary_table_end - primary_table) != (256 * PRIMARY_STRIDE_BYTES)
    .error "primary dispatch table is not exactly 256 four-word slots"
.endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; F9 dedicated runtime-decoded full-register bitwise page
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Encoding: F9 oodddsss
;   bits 7:5  destination register r0-r7
;   bits 4:2  source register r0-r7
;   bits 1:0  00=AND, 01=OR, 10=XOR, 11=invalid
;
; The primary-slot RJMP plus the five instructions through OUT place the
; speculative following-primary OUT exactly 18 cycles after the OUT that
; started the secondary byte. Both architectural operands are loaded before
; writeback, so destination/source aliasing is fully defined.

f9_bitop_entry:
    ; Consume the secondary byte in the VM PC and immediately start the
    ; speculative following-primary transfer.
    add   VM_PCL, ONE
    adc   VM_PCM, ZERO
    adc   VM_PCH, ZERO
    cli
    out   SPDR, ZERO
    in    SECONDARY_OPCODE, SPDR
    sei

    ; X = native register-file address of destination rD.
    mov   r26, SECONDARY_OPCODE
    swap  r26
    andi  r26, 0x0e
    subi  r26, -8
    mov   r27, ZERO

    ; Z = native register-file address of source rS.
    mov   r30, SECONDARY_OPCODE
    lsr   r30
    andi  r30, 0x0e
    subi  r30, -8
    mov   r31, ZERO

    ; Preserve operation bits without another scratch register:
    ; carry = original bit 0, SECONDARY_OPCODE bit 0 = original bit 1.
    lsr   SECONDARY_OPCODE

    ; Capture both complete original operands before modifying rD.
    ld    r0,  X+
    ld    r1,  X
    ld    r25, Z+
    ld    r27, Z

    ; SECONDARY_OPCODE bit 0 selects low (AND/OR) versus high
    ; (XOR/invalid) operation groups.
    sbrc  SECONDARY_OPCODE, 0
    rjmp  .Lf9_high_operation

    ; Low group: carry selects AND=0 or OR=1.
    brcc  .Lf9_and
    or    r0, r25
    or    r1, r27
    rjmp  .Lf9_store

.Lf9_and:
    and   r0, r25
    and   r1, r27

.Lf9_store:
    ; Loading source high into r27 temporarily replaced XH. All architectural
    ; register-file addresses are below 0x100, so restore XH to zero.
    mov   r27, ZERO
    st    X,  r1
    st    -X, r0
    rjmp  cluster_a_tail_18

.Lf9_high_operation:
    ; High group: carry selects XOR=0 or invalid=1.
    brcs  .Lf9_invalid
    eor   r0, r25
    eor   r1, r27
    rjmp  .Lf9_store

.Lf9_invalid:
    rjmp  invalid_secondary_instruction_func

f9_bitop_end:
.if (f9_bitop_end - f9_bitop_entry) != 78
    .error "dedicated F9 runtime bitwise handler must occupy exactly 39 AVR words"
.endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Generic bounded-secondary decoder
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; F0-F8, FA, and FE share this decoder. A primary prefix slot preloads the
; entry limit and word-address table base in Z, then one of these five tiny
; stubs loads the natural slot width. The decoder consumes the secondary byte,
; starts speculative fetch of the following primary opcode, performs one
; upper-bound check, and IJMPs directly to the operand-specialized slot.
;
; The page setup and multiplier stub are too long to hit an exact reverse
; 17-cycle handoff, so the decoder uses the standard protected IN/OUT order.

bounded_page_decoder_start:
secondary_width_1_stub:
    ldi  SECONDARY_MULTIPLIER, 1
    rjmp bounded_page_decode
secondary_width_1_stub_end:
.if (secondary_width_1_stub_end - secondary_width_1_stub) != 4
    .error "one-word secondary-width stub is not exactly two AVR words"
.endif

secondary_width_2_stub:
    ldi  SECONDARY_MULTIPLIER, 2
    rjmp bounded_page_decode
secondary_width_2_stub_end:
.if (secondary_width_2_stub_end - secondary_width_2_stub) != 4
    .error "two-word secondary-width stub is not exactly two AVR words"
.endif

secondary_width_3_stub:
    ldi  SECONDARY_MULTIPLIER, 3
    rjmp bounded_page_decode
secondary_width_3_stub_end:
.if (secondary_width_3_stub_end - secondary_width_3_stub) != 4
    .error "three-word secondary-width stub is not exactly two AVR words"
.endif

secondary_width_4_stub:
    ldi  SECONDARY_MULTIPLIER, 4
    rjmp bounded_page_decode
secondary_width_4_stub_end:
.if (secondary_width_4_stub_end - secondary_width_4_stub) != 4
    .error "four-word secondary-width stub is not exactly two AVR words"
.endif

secondary_width_5_stub:
    ldi  SECONDARY_MULTIPLIER, 5
    rjmp bounded_page_decode
secondary_width_5_stub_end:
.if (secondary_width_5_stub_end - secondary_width_5_stub) != 4
    .error "five-word secondary-width stub is not exactly two AVR words"
.endif

bounded_page_decode:
    ; The PC currently names the prefix opcode. Advance it to the secondary
    ; byte while useful work replaces transfer-window padding.
    add  VM_PCL, ONE
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO

    ; Preserve the caller's interrupt state while making the SPDR read/restart
    ; atomic. Restore the complete SREG immediately after launching the
    ; speculative following-primary transfer.
    in   SECONDARY_SREG, SREG
    cli
    in   SECONDARY_OPCODE, SPDR
    out  SPDR, ZERO
    out  SREG, SECONDARY_SREG

    ; The valid path is the one-cycle not-taken branch specified by the ISA
    ; plan. This leaves ten cycles from the speculative OUT to table entry;
    ; each slot's selected landing then supplies its exact 17/18/19 cadence.
    cp   SECONDARY_OPCODE, SECONDARY_LIMIT
    brsh invalid_secondary

bounded_page_valid:
    ; Z already contains the table's AVR word address. MUL produces a word
    ; offset because SECONDARY_MULTIPLIER is the slot width in AVR words.
    mul  SECONDARY_OPCODE, SECONDARY_MULTIPLIER
    add  r30, r0
    adc  r31, r1
    ijmp

invalid_secondary:
    rjmp invalid_secondary_instruction_func

bounded_page_decoder_end:
.if (bounded_page_decoder_end - bounded_page_decoder_start) != 50
    .error "bounded-page decoder and five width stubs must occupy 25 AVR words"
.endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FB-FD shared conditional-move gate
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Entry state:
;   * CMOV_MASK identifies Z, C, or S for the selected prefix.
;   * Z contains the AVR word address of cmov_table.
;   * The secondary byte is completing in SPDR.
;
; The gate consumes that byte, starts speculative fetch of the following
; primary opcode, applies bit-6 inversion, and indexes the table only when the
; selected condition is true. Bit 7 is invalid. Architectural VM_FLAGS is read
; but never modified.
cmov_gate:
    add   VM_PCL, ONE
    adc   VM_PCM, ZERO
    adc   VM_PCH, ZERO

    in    CMOV_SAVED_SREG, SREG
    cli
    in    CMOV_SECONDARY, SPDR
    out   SPDR, ZERO
    out   SREG, CMOV_SAVED_SREG

    cpi   CMOV_SECONDARY, 0x80
    brsh  cmov_invalid

    in    CMOV_TEST, VM_FLAGS
    sbrc  CMOV_SECONDARY, 6
    com   CMOV_TEST
    and   CMOV_TEST, CMOV_MASK
    breq  cmov_no_move

    andi  CMOV_SECONDARY, 0x3F
    lsl   CMOV_SECONDARY
    add   r30, CMOV_SECONDARY
    adc   r31, ZERO
    ijmp

cmov_no_move:
    rjmp  cluster_a_tail

cmov_invalid:
    rjmp  invalid_secondary

cmov_gate_end:
.if (cmov_gate_end - cmov_gate) != 44
    .error "FB-FD shared condition gate must occupy exactly 22 AVR words"
.endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Post-table migration scaffolding
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; All defined non-prefix primary opcodes 00-EF are complete. The generic
; bounded-page decoder, secondary cadence clusters, and every specified
; executable secondary table are present. The fixed-width self-contained F1-F8
; pages, the dedicated F9 runtime bitwise decoder, and the FB-FD shared
; conditional-move gate/table are implemented; F0, FA, and FE still require
; their dedicated veneers, forwarding bodies, or shared implementations.

; Direct 00-BF handlers use these exact cadence landings. Later secondary
; pages may add local copies when required by layout or RJMP reach.

; CMP captures native SREG in PRIMARY_OPCODE (r24). The one-cycle landing pad
; plus OUT and the standard dispatch body produce an exact 18-cycle cadence.
flags_commit_18_delay_1:
    nop
flags_commit_18:
    out  VM_FLAGS, PRIMARY_OPCODE
    dispatch

cluster_tail_17_delay_1:
    nop
cluster_tail_17:
    dispatch_reverse

cluster_tail_18_delay_3:
    nop
cluster_tail_18_delay_2:
    rjmp cluster_tail_18
cluster_tail_18_delay_1:
    nop
cluster_tail_18:
    dispatch

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; C0-CF compact immediate instructions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; At entry to each fetch continuation, the first immediate byte was started by
; the dispatch that selected the primary slot. Z contains the word address of
; the destination-specialized apply stub. PRIMARY_OPCODE (r24) carries imm8 or
; the low byte of imm16; r25 carries the sign extension or imm16 high byte.
;
; The fetch paths leave VM PC naming the final immediate byte. Their final OUT
; starts the following primary opcode; the apply stubs delay until that byte is
; ready, then standard dispatch advances PC to it and enters its primary slot.

; Consume one unsigned immediate byte and start the following primary opcode.
; From primary-slot entry to the OUT is eight cycles; including the preceding
; dispatch, this preserves the normal 17/18-cycle SPI byte cadence.
fetch_imm8_then_ijmp:
    add  VM_PCL, ONE
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO
    in   PRIMARY_OPCODE, SPDR
    out  SPDR, ZERO
    ijmp

; Consume one signed immediate byte, start the following primary opcode, and
; form its 16-bit sign extension in r25 before entering the selected apply stub.
fetch_simm8_then_ijmp:
    add  VM_PCL, ONE
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO
    in   PRIMARY_OPCODE, SPDR
    out  SPDR, ZERO
    clr  r25
    sbrc PRIMARY_OPCODE, 7
    com  r25
    ijmp

; Consume a little-endian 16-bit immediate. The low-byte handoff uses the
; standard 18-cycle IN/OUT schedule. While the high byte transfers, complete
; the second PC increment, use a callable delay for the remaining slack, and
; perform an exact reverse-order 17-cycle handoff for the following opcode.
fetch_imm16_then_ijmp:
    add  VM_PCL, ONE
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO
    in   PRIMARY_OPCODE, SPDR
    out  SPDR, ZERO

    add  VM_PCL, ONE
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO
    rcall interp_delay_12
    cli
    out  SPDR, ZERO
    in   r25, SPDR
    sei
    ijmp

; The following-opcode transfer needs sixteen cycles before dispatch reads it.
; These shared landings provide the family-specific remainder after IJMP,
; native work, and the apply stub's final RJMP.
immediate_result_tail_delay_9:
    delay_4
    delay_3
    rjmp cluster_tail_18

; The reverse-order high-byte handoff in LDI16 reaches its apply stub two
; cycles later than the other immediate families. Use the shorter seven-cycle
; landing so the following primary opcode is still read at its first legal time.
immediate_result_tail_delay_7:
    delay_3
    rjmp cluster_tail_18_delay_2

immediate_result_tail_delay_6:
    delay_4
    rjmp cluster_tail_18

; CMPI.S8 has one extra native instruction to capture SREG. Four cycles before
; the existing flag commit make its following-opcode read occur at cycle 16.
cmpi_s8_flags_commit_delay_4:
    delay_2
    rjmp flags_commit_18

.macro emit_ldi8_apply label, dstl, dsth
\label:
    mov  \dstl, PRIMARY_OPCODE
    clr  \dsth
    rjmp immediate_result_tail_delay_9
.endm

.macro emit_ldi16_apply label, dstl, dsth
\label:
    mov  \dstl, PRIMARY_OPCODE
    mov  \dsth, r25
    rjmp immediate_result_tail_delay_7
.endm

.macro emit_addi_s8_apply label, dstl, dsth
\label:
    add  \dstl, PRIMARY_OPCODE
    adc  \dsth, r25
    rjmp immediate_result_tail_delay_6
.endm

.macro emit_cmpi_s8_apply label, lhsl, lhsh
\label:
    cp   \lhsl, PRIMARY_OPCODE
    cpc  \lhsh, r25
    in   PRIMARY_OPCODE, SREG
    rjmp cmpi_s8_flags_commit_delay_4
.endm

emit_ldi8_apply ldi8_c0_apply, VM_C0L, VM_C0H
emit_ldi8_apply ldi8_c1_apply, VM_C1L, VM_C1H
emit_ldi8_apply ldi8_c2_apply, VM_C2L, VM_C2H
emit_ldi8_apply ldi8_c3_apply, VM_C3L, VM_C3H

emit_ldi16_apply ldi16_c0_apply, VM_C0L, VM_C0H
emit_ldi16_apply ldi16_c1_apply, VM_C1L, VM_C1H
emit_ldi16_apply ldi16_c2_apply, VM_C2L, VM_C2H
emit_ldi16_apply ldi16_c3_apply, VM_C3L, VM_C3H

emit_addi_s8_apply addi_s8_c0_apply, VM_C0L, VM_C0H
emit_addi_s8_apply addi_s8_c1_apply, VM_C1L, VM_C1H
emit_addi_s8_apply addi_s8_c2_apply, VM_C2L, VM_C2H
emit_addi_s8_apply addi_s8_c3_apply, VM_C3L, VM_C3H

emit_cmpi_s8_apply cmpi_s8_c0_apply, VM_C0L, VM_C0H
emit_cmpi_s8_apply cmpi_s8_c1_apply, VM_C1L, VM_C1H
emit_cmpi_s8_apply cmpi_s8_c2_apply, VM_C2L, VM_C2H
emit_cmpi_s8_apply cmpi_s8_c3_apply, VM_C3L, VM_C3H

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; D0-D6 relative control and stack adjustment
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; At entry to each continuation, VM_PC points at the signed operand byte and
; SPDR contains that byte. Conditional branches immediately start a speculative
; fetch of the fallthrough opcode. A not-taken branch preserves that stream;
; a taken branch discards it and restarts at nextPC + sign_extend(rel8).

.macro emit_branch_rel8_decode label, skipop, flag
\label:
    ; The primary slot enters fifteen cycles after the operand-starting OUT.
    ; One cycle of padding followed by the protected reverse handoff places the
    ; speculative fallthrough OUT at the exact 17-cycle boundary.
    nop
    cli
    out  SPDR, ZERO
    in   PRIMARY_OPCODE, SPDR
    sei

    ; A satisfied condition skips the not-taken jump. SBIS implements a
    ; branch-on-set condition; SBIC implements a branch-on-clear condition.
    \skipop VM_FLAGS, \flag
    rjmp branch_rel8_not_taken_func
    rjmp branch_rel8_taken_func
.endm

emit_branch_rel8_decode breq_rel8_decode_func,  sbis, SREG_Z
emit_branch_rel8_decode brne_rel8_decode_func,  sbic, SREG_Z
emit_branch_rel8_decode brult_rel8_decode_func, sbis, SREG_C
emit_branch_rel8_decode brslt_rel8_decode_func, sbis, SREG_S

branch_rel8_not_taken_func:
    ; PRIMARY_OPCODE contains the ignored displacement and VM_PC still names
    ; that byte. Seven cycles of padding make dispatch_reverse start the byte
    ; after the fallthrough opcode at the normal 17-cycle SPI cadence.
    rcall interp_delay_7
    rjmp cluster_tail_17

branch_rel8_taken_func:
    ; Form the signed high extension only on the taken path. Both sign cases
    ; take two cycles, which also lets the speculative fallthrough transfer
    ; finish before seek_and_dispatch_func toggles flash chip select.
    clr  r25
    sbrc PRIMARY_OPCODE, 7
    com  r25

    ; Convert the operand address to nextPC, then add the signed displacement
    ; in the full modulo-2^24 program address space.
    add  VM_PCL, ONE
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO
    add  VM_PCL, PRIMARY_OPCODE
    adc  VM_PCM, r25
    adc  VM_PCH, r25
    rjmp seek_and_dispatch_func

; D4 and D5 use fully specialized continuations. Duplicating the operand
; fetch, sign extension, next-PC calculation, and target addition removes the
; shared opcode test and avoids RCALL/RET overhead on CALL.
jmp_rel8_func:
    ; The operand transfer was started by the preceding primary dispatch. The
    ; two-cycle delay places this read at the normal SPI byte boundary.
    delay_2
    in   r26, SPDR

    clr  r25
    sbrc r26, 7
    com  r25

    ; VM_PC currently names the displacement byte. Advance to nextPC, apply
    ; the signed displacement in modulo-2^24 arithmetic, and restart the stream.
    add  VM_PCL, ONE
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO
    add  VM_PCL, r26
    adc  VM_PCM, r25
    adc  VM_PCH, r25
    rjmp seek_and_dispatch_func

call_rel8_func:
    ; Fetch and sign-extend the displacement exactly as for JMP rel8.
    delay_2
    in   r26, SPDR

    clr  r25
    sbrc r26, 7
    com  r25

    ; Advance to nextPC and push that 24-bit return address in the canonical
    ; little-endian stack layout: [SP+0]=PCL, [SP+1]=PCM, [SP+2]=PCH.
    add  VM_PCL, ONE
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO
    st   -Y, VM_PCH
    st   -Y, VM_PCM
    st   -Y, VM_PCL

    ; Form the branch target only after preserving nextPC, then restart the
    ; external-flash stream at that target.
    add  VM_PCL, r26
    adc  VM_PCM, r25
    adc  VM_PCH, r25
    rjmp seek_and_dispatch_func

adjsp_simm8_func:
    ; Read simm8 while starting the following primary opcode. VM_PC remains on
    ; the operand byte so dispatch_reverse advances it exactly once afterward.
    ; The one-cycle landing makes the reverse OUT occur exactly 17 cycles after
    ; the operand-starting OUT from the preceding dispatch.
    nop
    cli
    out  SPDR, ZERO
    in   PRIMARY_OPCODE, SPDR
    sei

    clr  r25
    sbrc PRIMARY_OPCODE, 7
    com  r25
    add  VM_SPL, PRIMARY_OPCODE
    adc  VM_SPH, r25

    ; Preserve the sequential stream and architectural VM_FLAGS. This delay
    ; makes the next SPI OUT occur at the reverse-order 17-cycle cadence.
    delay_4
    rjmp cluster_tail_17_delay_1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; E0-E3 direct near/far control
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; The first operand byte was started by the primary dispatch. Each paired
; JMP/CALL continuation reaches the exact 17-cycle boundary with useful work,
; then uses CLI/OUT/IN/SEI to launch the next operand byte. Opcode bit 0 selects
; the call path, but its conditional return-address push is completely hidden
; inside operand-transfer slack, so the paired forms retain equal latency.
; Remaining idle intervals use the shared callable delay ladder.

jmp_call_rel16_func:
    ; Fetch rel16[7:0] and launch rel16[15:8] with the exact reverse-order
    ; 17-cycle handoff. VM_PC initially names rel16[7:0].
    add  VM_PCL, ONE
    cli
    out  SPDR, ZERO
    in   r26, SPDR
    sei
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO

    ; Advance through rel16[15:8] to nextPC. Opcode bit 0 distinguishes CALL16
    ; from JMP16. Both paths consume the same nine-cycle transfer slack:
    ; CALL16 uses a three-cycle skip plus three two-cycle stores, while JMP16
    ; uses a four-cycle test/JMP plus a three-cycle delay and two-cycle RJMP.
    add  VM_PCL, ONE
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO
    sbrs PRIMARY_OPCODE, 0
    jmp  jmp_rel16_wait

    ; CALL16: preserve nextPC before applying the signed displacement.
    st   -Y, VM_PCH
    st   -Y, VM_PCM
    st   -Y, VM_PCL

rel16_read_high:
    in   r27, SPDR

    ; Add sign_extend(rel16) to nextPC in modulo-2^24 arithmetic.
    clr  r25
    sbrc r27, 7
    com  r25
    add  VM_PCL, r26
    adc  VM_PCM, r27
    adc  VM_PCH, r25
    rjmp seek_and_dispatch_func

jmp_rel16_wait:
    delay_3
    rjmp rel16_read_high

jmp_call_far_func:
    ; Preserve opcode bit 0 before target[7:0] replaces PRIMARY_OPCODE. The MOV
    ; occupies the same one-cycle landing used by the specialized handlers, so
    ; target[15:8] still launches at the exact first 17-cycle boundary.
    mov  r27, PRIMARY_OPCODE
    cli
    out  SPDR, ZERO
    in   r24, SPDR
    sei

    ; E3 CALLF has already advanced VM_PC to nextPC in its primary slot. The
    ; CALL path uses the middle-byte transfer slack to push it. The E2 JMPF
    ; path uses an equal-time wait, so both launch target[23:16] at cycle 17.
    sbrs r27, 0
    jmp  jmp_far_wait
    st   -Y, VM_PCH
    st   -Y, VM_PCM
    st   -Y, VM_PCL
    delay_4

far_launch_high:
    cli
    out  SPDR, ZERO
    in   r25, SPDR
    sei

    ; No further byte must be launched. Read target[23:16] at its earliest
    ; legal cycle, then install the complete absolute image-relative target.
    rcall interp_delay_14
    in   r26, SPDR
    mov  VM_PCL, r24
    mov  VM_PCM, r25
    mov  VM_PCH, r26
    rjmp seek_and_dispatch_func

jmp_far_wait:
    rcall interp_delay_7
    rjmp far_launch_high

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SYS service dispatch
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Entry state:
;   * VM PC points at the following primary opcode.
;   * SPDR contains the completed service byte.
;   * The byte following the service has not yet been started.
;
; The protected SPDR handoff starts fetching the following primary opcode and
; captures the service ID. Each service returns through cluster_tail_18, which
; consumes that opcode, starts its following byte, advances the PC, and enters
; its four-word primary slot.
sys_decode_func:
    ; The D7 primary slot reaches this continuation fifteen cycles after the
    ; service-byte transfer began. Land the reverse OUT exactly on cycle 17.
    nop
    cli
    out  SPDR, ZERO
    in   PRIMARY_OPCODE, SPDR
    sei

sys_dispatch_func:
    ldi  r30, lo8(pm(sys_dispatch_table))
    ldi  r31, hi8(pm(sys_dispatch_table))
    add  r30, PRIMARY_OPCODE
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
.if (SYS_MILLIS != 0x02)
    .error "SYS_MILLIS must occupy dispatch-table entry 2"
.endif
.if (SYS_MILLIS32 != 0x03)
    .error "SYS_MILLIS32 must occupy dispatch-table entry 3"
.endif

; One AVR word per service number. The service byte therefore indexes this
; table directly in program-memory word-address space.
sys_dispatch_table:
    sys_entries 1,   sys_debug_putc_func
    sys_entries 1,   sys_debug_break_func
    sys_entries 1,   sys_millis_func
    sys_entries 1,   sys_millis32_func
    sys_entries 252, invalid_syscall_func
sys_dispatch_table_end:

.if (sys_dispatch_table_end - sys_dispatch_table) != (256 * 2)
    .error "SYS dispatch table must contain exactly 256 one-word entries"
.endif

sys_debug_putc_func:
    ; DEBUG_PUTC writes low8(c0) to the emulator/debug USB endpoint register.
    sts  UEDATX, VM_C0L
    rjmp cluster_tail_18_delay_2

sys_debug_break_func:
    break
    rjmp cluster_tail_18_delay_3

; Return a coherent low 16-bit snapshot of the millisecond counter in c0.
sys_millis_func:
    cli
    lds  VM_C0L, data_millis+0
    lds  VM_C0H, data_millis+1
    sei
    rjmp cluster_tail_18

; Return a coherent 32-bit snapshot with the low half in c0 and high half in
; c1. Timer0 cannot update the counter during the four-byte snapshot.
sys_millis32_func:
    cli
    lds  VM_C0L, data_millis+0
    lds  VM_C0H, data_millis+1
    lds  VM_C1L, data_millis+2
    lds  VM_C1H, data_millis+3
    sei
    rjmp cluster_tail_18

; CALLP shared prologue. The primary slot has preserved the selected target in
; r26:r25:r24 while VM_PC still contains the one-byte call's sequential return
; address. Push the return PC in canonical little-endian stack layout, install
; the target, and fall through directly into the common seek handler.
push_pc_seek_and_dispatch_func:
    st   -Y, VM_PCH
    st   -Y, VM_PCM
    st   -Y, VM_PCL
    movw VM_PCL, r24
    mov  VM_PCH, r26

; Shared continuation for JMPP, CALLP, RET, and taken control-flow instructions.
; On entry, VM_PCH:VM_PCM:VM_PCL is the new image-relative program counter.
; Seek the external-flash stream to VM_PC, consume the target primary opcode,
; start its following-byte fetch, and dispatch directly to that primary slot.
seek_and_dispatch_func:
    fx_disable
    ldi  r30, SFC_READ
    fx_enable
    out  SPDR, r30

    lds  r26, data_page_data+0
    add  r26, VM_PCM
    lds  r27, data_page_data+1
    adc  r27, VM_PCH

    rcall interp_delay_10
    out  SPDR, r27
    rcall interp_delay_17
    out  SPDR, r26
    rcall interp_delay_17
    out  SPDR, VM_PCL
    rcall interp_delay_16
    out  SPDR, ZERO
    rcall interp_delay_14
    add  VM_PCL, ONE
    cli
    out  SPDR, ZERO
    in   PRIMARY_OPCODE, SPDR
    sei
    adc  VM_PCM, ZERO
    adc  VM_PCH, ZERO
    mul  PRIMARY_OPCODE, FOUR
    movw r30, r0
    subi r31, hi8(-(pm(primary_table)))
    ijmp

; Local fixed-delay ladder for pre-table interpreter paths. The large dense
; secondary tables place the original fx_seek_delay_* ladder outside RCALL's
; signed 12-bit word displacement. Each entry retains the same total delay,
; measured from the calling RCALL through the returning RET.
interp_delay_17:
    nop
interp_delay_16:
    delay_2
interp_delay_14:
    nop
interp_delay_13:
    nop
interp_delay_12:
    nop
interp_delay_11:
    nop
interp_delay_10:
    nop
interp_delay_9:
    delay_2
interp_delay_7:
    ret

; Dedicated secondary-prefix encodings whose distinct decoders/gates are not
; yet present stop here. Generic bounded prefixes use invalid_secondary instead.
unimplemented_instruction_func:
    rjmp unimplemented_instruction_func

; Reserved primary encodings stop here.
invalid_primary_instruction_func:
    rjmp invalid_primary_instruction_func

; Reserved secondary encodings, zero-entry page placeholders, and unknown SYS
; services use these shared traps.
invalid_secondary_instruction_func:
    rjmp invalid_secondary_instruction_func

invalid_syscall_func:
    rjmp invalid_syscall_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Fixed-width secondary tables and remaining trap scaffolds
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; F1-F8 use their exact operand-specialized native sequences. Pages that still
; await dedicated bodies retain final-width trap slots: the first word jumps to
; a nearby local trap and the remaining words are unreachable padding.

.macro emit_secondary_trap_table label, end_label, count, width, trap
\label:
    .rept \count
        rjmp \trap
        .rept (\width - 1)
            nop
        .endr
    .endr
\end_label:
    .if (\end_label - \label) != (2 * \count * \width)
        .error "secondary trap table has incorrect size"
    .endif
.endm


; Exact fixed-width slot emitters for F1-F8. Each macro expands to the native
; sequence specified by the ISA implementation plan and asserts its natural
; AVR word count. No slot contains padding except reserved postincrement-load
; aliases, which remain same-width invalid-instruction entries.

.macro emit_f1_mov dst, src
.Lf1_mov_start_\@:
    movw  \dst, \src
    rjmp  cluster_a_tail_17_delay_2
.Lf1_mov_end_\@:
    .if (.Lf1_mov_end_\@ - .Lf1_mov_start_\@) != 4
        .error "F1 MOV slot is not exactly two words"
    .endif
.endm

.macro emit_f1_stsp8 src, q
.Lf1_stsp8_start_\@:
    std   Y+\q, \src
    rjmp  cluster_a_tail_17_delay_1
.Lf1_stsp8_end_\@:
    .if (.Lf1_stsp8_end_\@ - .Lf1_stsp8_start_\@) != 4
        .error "F1 STSP8 slot is not exactly two words"
    .endif
.endm

.macro emit_f1_zext8 dsth
.Lf1_zext8_start_\@:
    clr   \dsth
    rjmp  cluster_a_tail_17_delay_2
.Lf1_zext8_end_\@:
    .if (.Lf1_zext8_end_\@ - .Lf1_zext8_start_\@) != 4
        .error "F1 ZEXT8 slot is not exactly two words"
    .endif
.endm

.macro emit_f1_swap8 dstl
.Lf1_swap8_start_\@:
    swap  \dstl
    rjmp  cluster_a_tail_17_delay_2
.Lf1_swap8_end_\@:
    .if (.Lf1_swap8_end_\@ - .Lf1_swap8_start_\@) != 4
        .error "F1 SWAP8 slot is not exactly two words"
    .endif
.endm

.macro emit_f1_getsp dst
.Lf1_getsp_start_\@:
    movw  \dst, VM_SP
    rjmp  cluster_a_tail_17_delay_2
.Lf1_getsp_end_\@:
    .if (.Lf1_getsp_end_\@ - .Lf1_getsp_start_\@) != 4
        .error "F1 GETSP slot is not exactly two words"
    .endif
.endm

.macro emit_f1_setsp src
.Lf1_setsp_start_\@:
    movw  VM_SP, \src
    rjmp  cluster_a_tail_17_delay_2
.Lf1_setsp_end_\@:
    .if (.Lf1_setsp_end_\@ - .Lf1_setsp_start_\@) != 4
        .error "F1 SETSP slot is not exactly two words"
    .endif
.endm

.macro emit_f2_add dstl, dsth, srcl, srch
.Lf2_add_start_\@:
    add   \dstl, \srcl
    adc   \dsth, \srch
    rjmp  cluster_a_tail_17_delay_1
.Lf2_add_end_\@:
    .if (.Lf2_add_end_\@ - .Lf2_add_start_\@) != 6
        .error "F2 ADD slot is not exactly three words"
    .endif
.endm

.macro emit_f2_sub dstl, dsth, srcl, srch
.Lf2_sub_start_\@:
    sub   \dstl, \srcl
    sbc   \dsth, \srch
    rjmp  cluster_a_tail_17_delay_1
.Lf2_sub_end_\@:
    .if (.Lf2_sub_end_\@ - .Lf2_sub_start_\@) != 6
        .error "F2 SUB slot is not exactly three words"
    .endif
.endm

.macro emit_f3_st8 addr, srcl
.Lf3_st8_start_\@:
    movw  r26, \addr
    st    X, \srcl
    rjmp  cluster_a_tail_18_delay_2
.Lf3_st8_end_\@:
    .if (.Lf3_st8_end_\@ - .Lf3_st8_start_\@) != 6
        .error "F3 ST8 slot is not exactly three words"
    .endif
.endm

.macro emit_f3_mul op, dstl, srcl
.Lf3_mul_start_\@:
    \op   \dstl, \srcl
    movw  \dstl, r0
    rjmp  cluster_a_tail_18_delay_2
.Lf3_mul_end_\@:
    .if (.Lf3_mul_end_\@ - .Lf3_mul_start_\@) != 6
        .error "F3 widening multiply slot is not exactly three words"
    .endif
.endm

.macro emit_f3_ldsp8u dstl, dsth, q
.Lf3_ldsp8u_start_\@:
    ldd   \dstl, Y+\q
    clr   \dsth
    rjmp  cluster_a_tail_18_delay_2
.Lf3_ldsp8u_end_\@:
    .if (.Lf3_ldsp8u_end_\@ - .Lf3_ldsp8u_start_\@) != 6
        .error "F3 LDSP8U slot is not exactly three words"
    .endif
.endm

.macro emit_f4_ldsp16 dstl, dsth, q0, q1
.Lf4_ldsp16_start_\@:
    ldd   \dstl, Y+\q0
    ldd   \dsth, Y+\q1
    rjmp  cluster_b_tail_18_delay_1
.Lf4_ldsp16_end_\@:
    .if (.Lf4_ldsp16_end_\@ - .Lf4_ldsp16_start_\@) != 6
        .error "F4 LDSP16 slot is not exactly three words"
    .endif
.endm

.macro emit_f4_stsp16 srcl, srch, q0, q1
.Lf4_stsp16_start_\@:
    std   Y+\q0, \srcl
    std   Y+\q1, \srch
    rjmp  cluster_b_tail_18_delay_1
.Lf4_stsp16_end_\@:
    .if (.Lf4_stsp16_end_\@ - .Lf4_stsp16_start_\@) != 6
        .error "F4 STSP16 slot is not exactly three words"
    .endif
.endm

.macro emit_f4_shift op_hi, op_lo, dstl, dsth
.Lf4_shift_start_\@:
    \op_hi \dsth
    \op_lo \dstl
    rjmp  cluster_b_tail_17_delay_1
.Lf4_shift_end_\@:
    .if (.Lf4_shift_end_\@ - .Lf4_shift_start_\@) != 6
        .error "F4 shift slot is not exactly three words"
    .endif
.endm

.macro emit_f4_lsl16 dstl, dsth
.Lf4_lsl16_start_\@:
    lsl   \dstl
    rol   \dsth
    rjmp  cluster_b_tail_17_delay_1
.Lf4_lsl16_end_\@:
    .if (.Lf4_lsl16_end_\@ - .Lf4_lsl16_start_\@) != 6
        .error "F4 LSL16 slot is not exactly three words"
    .endif
.endm

.macro emit_f4_not16 dstl, dsth
.Lf4_not16_start_\@:
    com   \dstl
    com   \dsth
    rjmp  cluster_b_tail_17_delay_1
.Lf4_not16_end_\@:
    .if (.Lf4_not16_end_\@ - .Lf4_not16_start_\@) != 6
        .error "F4 NOT16 slot is not exactly three words"
    .endif
.endm

.macro emit_f4_tst8 dstl
.Lf4_tst8_start_\@:
    cp    \dstl, ZERO
    in    SECONDARY_OPCODE, SREG
    rjmp  flags_commit_b_18_delay_2
.Lf4_tst8_end_\@:
    .if (.Lf4_tst8_end_\@ - .Lf4_tst8_start_\@) != 6
        .error "F4 TST8 slot is not exactly three words"
    .endif
.endm

.macro emit_f4_inc16 dstl, dsth
.Lf4_inc16_start_\@:
    add   \dstl, ONE
    adc   \dsth, ZERO
    rjmp  cluster_b_tail_17_delay_1
.Lf4_inc16_end_\@:
    .if (.Lf4_inc16_end_\@ - .Lf4_inc16_start_\@) != 6
        .error "F4 INC16 slot is not exactly three words"
    .endif
.endm

.macro emit_f4_dec16 dstl, dsth
.Lf4_dec16_start_\@:
    sub   \dstl, ONE
    sbc   \dsth, ZERO
    rjmp  cluster_b_tail_17_delay_1
.Lf4_dec16_end_\@:
    .if (.Lf4_dec16_end_\@ - .Lf4_dec16_start_\@) != 6
        .error "F4 DEC16 slot is not exactly three words"
    .endif
.endm

.macro emit_f5_cmp lhsl, lhsh, rhsl, rhsh
.Lf5_cmp_start_\@:
    cp    \lhsl, \rhsl
    cpc   \lhsh, \rhsh
    in    SECONDARY_OPCODE, SREG
    rjmp  flags_commit_b_18_delay_1
.Lf5_cmp_end_\@:
    .if (.Lf5_cmp_end_\@ - .Lf5_cmp_start_\@) != 8
        .error "F5 CMP slot is not exactly four words"
    .endif
.endm

.macro emit_f5_ld8u dstl, dsth, addr
.Lf5_ld8u_start_\@:
    movw  r26, \addr
    ld    \dstl, X
    clr   \dsth
    rjmp  cluster_b_tail_18_delay_1
.Lf5_ld8u_end_\@:
    .if (.Lf5_ld8u_end_\@ - .Lf5_ld8u_start_\@) != 8
        .error "F5 LD8U slot is not exactly four words"
    .endif
.endm

.macro emit_f5_ld16 dstl, dsth, addr
.Lf5_ld16_start_\@:
    movw  r26, \addr
    ld    \dstl, X+
    ld    \dsth, X
    rjmp  cluster_b_tail_18
.Lf5_ld16_end_\@:
    .if (.Lf5_ld16_end_\@ - .Lf5_ld16_start_\@) != 8
        .error "F5 LD16 slot is not exactly four words"
    .endif
.endm

.macro emit_f5_st16 addr, srcl, srch
.Lf5_st16_start_\@:
    movw  r26, \addr
    st    X+, \srcl
    st    X, \srch
    rjmp  cluster_b_tail_18
.Lf5_st16_end_\@:
    .if (.Lf5_st16_end_\@ - .Lf5_st16_start_\@) != 8
        .error "F5 ST16 slot is not exactly four words"
    .endif
.endm

.macro emit_f6_st8_post addr, srcl
.Lf6_st8_post_start_\@:
    movw  r26, \addr
    st    X+, \srcl
    movw  \addr, r26
    rjmp  cluster_b_tail_18_delay_1
.Lf6_st8_post_end_\@:
    .if (.Lf6_st8_post_end_\@ - .Lf6_st8_post_start_\@) != 8
        .error "F6 ST8 postincrement slot is not exactly four words"
    .endif
.endm

.macro emit_f6_bswap16 dstl, dsth
.Lf6_bswap16_start_\@:
    mov   SECONDARY_OPCODE, \dstl
    mov   \dstl, \dsth
    mov   \dsth, SECONDARY_OPCODE
    rjmp  cluster_b_tail_18_delay_2
.Lf6_bswap16_end_\@:
    .if (.Lf6_bswap16_end_\@ - .Lf6_bswap16_start_\@) != 8
        .error "F6 BSWAP16 slot is not exactly four words"
    .endif
.endm

.macro emit_f6_tst16 dstl, dsth
.Lf6_tst16_start_\@:
    cp    \dstl, ZERO
    cpc   \dsth, ZERO
    in    SECONDARY_OPCODE, SREG
    rjmp  flags_commit_b_18_delay_1
.Lf6_tst16_end_\@:
    .if (.Lf6_tst16_end_\@ - .Lf6_tst16_start_\@) != 8
        .error "F6 TST16 slot is not exactly four words"
    .endif
.endm

.macro emit_f6_mul8 dstl, dsth, srcl
.Lf6_mul8_start_\@:
    mul   \dstl, \srcl
    mov   \dstl, r0
    clr   \dsth
    rjmp  cluster_b_tail_18_delay_1
.Lf6_mul8_end_\@:
    .if (.Lf6_mul8_end_\@ - .Lf6_mul8_start_\@) != 8
        .error "F6 MUL8 slot is not exactly four words"
    .endif
.endm

.macro emit_f6_sext8 dstl, dsth
.Lf6_sext8_start_\@:
    clr   \dsth
    sbrc  \dstl, 7
    dec   \dsth
    rjmp  cluster_b_tail_18_delay_2
.Lf6_sext8_end_\@:
    .if (.Lf6_sext8_end_\@ - .Lf6_sext8_start_\@) != 8
        .error "F6 SEXT8 slot is not exactly four words"
    .endif
.endm

.macro emit_f6_neg16 dstl, dsth
.Lf6_neg16_start_\@:
    neg   \dstl
    adc   \dsth, ZERO
    neg   \dsth
    rjmp  cluster_b_tail_18_delay_2
.Lf6_neg16_end_\@:
    .if (.Lf6_neg16_end_\@ - .Lf6_neg16_start_\@) != 8
        .error "F6 NEG16 slot is not exactly four words"
    .endif
.endm

.macro emit_f7_ld8u_post dstl, dsth, addr
.Lf7_ld8u_post_start_\@:
    movw  r26, \addr
    ld    \dstl, X+
    movw  \addr, r26
    clr   \dsth
    rjmp  cluster_c_tail_18
.Lf7_ld8u_post_end_\@:
    .if (.Lf7_ld8u_post_end_\@ - .Lf7_ld8u_post_start_\@) != 10
        .error "F7 LD8U postincrement slot is not exactly five words"
    .endif
.endm

.macro emit_f7_ld16_post dstl, dsth, addr
.Lf7_ld16_post_start_\@:
    movw  r26, \addr
    ld    \dstl, X+
    ld    \dsth, X+
    movw  \addr, r26
    rjmp  cluster_c_tail_18
.Lf7_ld16_post_end_\@:
    .if (.Lf7_ld16_post_end_\@ - .Lf7_ld16_post_start_\@) != 10
        .error "F7 LD16 postincrement slot is not exactly five words"
    .endif
.endm

.macro emit_f7_st16_post addr, srcl, srch
.Lf7_st16_post_start_\@:
    movw  r26, \addr
    st    X+, \srcl
    st    X+, \srch
    movw  \addr, r26
    rjmp  cluster_c_tail_18
.Lf7_st16_post_end_\@:
    .if (.Lf7_st16_post_end_\@ - .Lf7_st16_post_start_\@) != 10
        .error "F7 ST16 postincrement slot is not exactly five words"
    .endif
.endm

.macro emit_f7_add32 d0, d1, d2, d3, s0, s1, s2, s3
.Lf7_add32_start_\@:
    add   \d0, \s0
    adc   \d1, \s1
    adc   \d2, \s2
    adc   \d3, \s3
    rjmp  cluster_c_tail_18_delay_1
.Lf7_add32_end_\@:
    .if (.Lf7_add32_end_\@ - .Lf7_add32_start_\@) != 10
        .error "F7 ADD32 slot is not exactly five words"
    .endif
.endm

.macro emit_f7_sub32 d0, d1, d2, d3, s0, s1, s2, s3
.Lf7_sub32_start_\@:
    sub   \d0, \s0
    sbc   \d1, \s1
    sbc   \d2, \s2
    sbc   \d3, \s3
    rjmp  cluster_c_tail_18_delay_1
.Lf7_sub32_end_\@:
    .if (.Lf7_sub32_end_\@ - .Lf7_sub32_start_\@) != 10
        .error "F7 SUB32 slot is not exactly five words"
    .endif
.endm

.macro emit_f7_lsr32 d0, d1, d2, d3
.Lf7_lsr32_start_\@:
    lsr   \d3
    ror   \d2
    ror   \d1
    ror   \d0
    rjmp  cluster_c_tail_18_delay_1
.Lf7_lsr32_end_\@:
    .if (.Lf7_lsr32_end_\@ - .Lf7_lsr32_start_\@) != 10
        .error "F7 LSR32 slot is not exactly five words"
    .endif
.endm

.macro emit_f7_asr32 d0, d1, d2, d3
.Lf7_asr32_start_\@:
    asr   \d3
    ror   \d2
    ror   \d1
    ror   \d0
    rjmp  cluster_c_tail_18_delay_1
.Lf7_asr32_end_\@:
    .if (.Lf7_asr32_end_\@ - .Lf7_asr32_start_\@) != 10
        .error "F7 ASR32 slot is not exactly five words"
    .endif
.endm

.macro emit_f7_bool dstl, dsth
.Lf7_bool_start_\@:
    or    \dstl, \dsth
    clr   \dsth
    cpse  \dstl, ZERO
    mov   \dstl, ONE
    rjmp  cluster_c_tail_18_delay_1
.Lf7_bool_end_\@:
    .if (.Lf7_bool_end_\@ - .Lf7_bool_start_\@) != 10
        .error "F7 BOOL slot is not exactly five words"
    .endif
.endm

.macro emit_f7_invalid trap
.Lf7_invalid_start_\@:
    rjmp  \trap
    nop
    nop
    nop
    nop
.Lf7_invalid_end_\@:
    .if (.Lf7_invalid_end_\@ - .Lf7_invalid_start_\@) != 10
        .error "F7 reserved slot is not exactly five words"
    .endif
.endm

.macro emit_f8_cset dstl, dsth, flag_bit, skipop
.Lf8_cset_start_\@:
    clr   \dstl
    clr   \dsth
    \skipop VM_FLAGS, \flag_bit
    mov   \dstl, ONE
    rjmp  cluster_c_tail_18_delay_1
.Lf8_cset_end_\@:
    .if (.Lf8_cset_end_\@ - .Lf8_cset_start_\@) != 10
        .error "F8 CSET slot is not exactly five words"
    .endif
.endm

.macro emit_cmov_entry dst, src
.Lcmov_start_\@:
    movw  \dst, \src
    rjmp  cmov_tail
.Lcmov_end_\@:
    .if (.Lcmov_end_\@ - .Lcmov_start_\@) != 4
        .error "FB-FD CMOV entry is not exactly two AVR words"
    .endif
.endm

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Secondary-page cadence clusters and table insertion anchors
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; These copies are intentionally separate from the compact-primary tails.
; Future secondary tables are inserted at the marked anchors so every slot's
; final RJMP remains comfortably within range without changing these sequences.

; Cluster A serves F0/F1/F2/F3, the dedicated F9 decoder, cold F0 bodies, the
; FB-FD condition gate/table, and FE/FA shared bodies where specified.
; The CMOV false path reaches this landing twelve cycles after launching the
; following-primary transfer. NOP plus the two-cycle RJMP supply exactly three
; cycles, so the reverse tail's OUT lands on cycle 17. The two-cycle F1 landing
; shares the RJMP. Keep both entries outside the measured 24-word cluster.
cluster_a_tail:
    nop
cluster_a_tail_17_delay_2:
    rjmp cluster_a_tail_17
cluster_a_start:
cluster_a_tail_17_delay_1:
    nop
cluster_a_tail_17:
    dispatch_reverse

cluster_a_tail_18_delay_2:
    rjmp cluster_a_tail_18
flags_commit_a_18_delay_1:
    out  VM_FLAGS, SECONDARY_OPCODE
cluster_a_tail_18_delay_1:
    nop
cluster_a_tail_18:
    dispatch
cluster_a_end:
.if (cluster_a_end - cluster_a_start) != 48
    .error "secondary cadence Cluster A must occupy 24 AVR words"
.endif

; F0 retains one-word veneer placeholders; F1-F3 contain their exact native
; slots. The local F0 trap remains before the group for short RJMP reach.
secondary_tables_before_cluster_b:
secondary_unimplemented_a_func:
    rjmp unimplemented_instruction_func

emit_secondary_trap_table f0_veneer_table, f0_veneer_table_end, 0x6E, 1, secondary_unimplemented_a_func

f1_table:
    ; F1: bounded two-word dense table
    ; 00: MOV r0,r0
    emit_f1_mov r8, r8
    ; 01: MOV r0,r1
    emit_f1_mov r8, r10
    ; 02: MOV r0,r2
    emit_f1_mov r8, r12
    ; 03: MOV r0,r3
    emit_f1_mov r8, r14
    ; 04: MOV r0,r4
    emit_f1_mov r8, r16
    ; 05: MOV r0,r5
    emit_f1_mov r8, r18
    ; 06: MOV r0,r6
    emit_f1_mov r8, r20
    ; 07: MOV r0,r7
    emit_f1_mov r8, r22
    ; 08: MOV r1,r0
    emit_f1_mov r10, r8
    ; 09: MOV r1,r1
    emit_f1_mov r10, r10
    ; 0A: MOV r1,r2
    emit_f1_mov r10, r12
    ; 0B: MOV r1,r3
    emit_f1_mov r10, r14
    ; 0C: MOV r1,r4
    emit_f1_mov r10, r16
    ; 0D: MOV r1,r5
    emit_f1_mov r10, r18
    ; 0E: MOV r1,r6
    emit_f1_mov r10, r20
    ; 0F: MOV r1,r7
    emit_f1_mov r10, r22
    ; 10: MOV r2,r0
    emit_f1_mov r12, r8
    ; 11: MOV r2,r1
    emit_f1_mov r12, r10
    ; 12: MOV r2,r2
    emit_f1_mov r12, r12
    ; 13: MOV r2,r3
    emit_f1_mov r12, r14
    ; 14: MOV r2,r4
    emit_f1_mov r12, r16
    ; 15: MOV r2,r5
    emit_f1_mov r12, r18
    ; 16: MOV r2,r6
    emit_f1_mov r12, r20
    ; 17: MOV r2,r7
    emit_f1_mov r12, r22
    ; 18: MOV r3,r0
    emit_f1_mov r14, r8
    ; 19: MOV r3,r1
    emit_f1_mov r14, r10
    ; 1A: MOV r3,r2
    emit_f1_mov r14, r12
    ; 1B: MOV r3,r3
    emit_f1_mov r14, r14
    ; 1C: MOV r3,r4
    emit_f1_mov r14, r16
    ; 1D: MOV r3,r5
    emit_f1_mov r14, r18
    ; 1E: MOV r3,r6
    emit_f1_mov r14, r20
    ; 1F: MOV r3,r7
    emit_f1_mov r14, r22
    ; 20: MOV r4,r0
    emit_f1_mov r16, r8
    ; 21: MOV r4,r1
    emit_f1_mov r16, r10
    ; 22: MOV r4,r2
    emit_f1_mov r16, r12
    ; 23: MOV r4,r3
    emit_f1_mov r16, r14
    ; 24: MOV r5,r0
    emit_f1_mov r18, r8
    ; 25: MOV r5,r1
    emit_f1_mov r18, r10
    ; 26: MOV r5,r2
    emit_f1_mov r18, r12
    ; 27: MOV r5,r3
    emit_f1_mov r18, r14
    ; 28: MOV r6,r0
    emit_f1_mov r20, r8
    ; 29: MOV r6,r1
    emit_f1_mov r20, r10
    ; 2A: MOV r6,r2
    emit_f1_mov r20, r12
    ; 2B: MOV r6,r3
    emit_f1_mov r20, r14
    ; 2C: MOV r7,r0
    emit_f1_mov r22, r8
    ; 2D: MOV r7,r1
    emit_f1_mov r22, r10
    ; 2E: MOV r7,r2
    emit_f1_mov r22, r12
    ; 2F: MOV r7,r3
    emit_f1_mov r22, r14
    ; 30: STSP8 [SP+0],c0
    emit_f1_stsp8 r16, 0
    ; 31: STSP8 [SP+0],c1
    emit_f1_stsp8 r18, 0
    ; 32: STSP8 [SP+0],c2
    emit_f1_stsp8 r20, 0
    ; 33: STSP8 [SP+0],c3
    emit_f1_stsp8 r22, 0
    ; 34: STSP8 [SP+1],c0
    emit_f1_stsp8 r16, 1
    ; 35: STSP8 [SP+1],c1
    emit_f1_stsp8 r18, 1
    ; 36: STSP8 [SP+1],c2
    emit_f1_stsp8 r20, 1
    ; 37: STSP8 [SP+1],c3
    emit_f1_stsp8 r22, 1
    ; 38: STSP8 [SP+2],c0
    emit_f1_stsp8 r16, 2
    ; 39: STSP8 [SP+2],c1
    emit_f1_stsp8 r18, 2
    ; 3A: STSP8 [SP+2],c2
    emit_f1_stsp8 r20, 2
    ; 3B: STSP8 [SP+2],c3
    emit_f1_stsp8 r22, 2
    ; 3C: STSP8 [SP+3],c0
    emit_f1_stsp8 r16, 3
    ; 3D: STSP8 [SP+3],c1
    emit_f1_stsp8 r18, 3
    ; 3E: STSP8 [SP+3],c2
    emit_f1_stsp8 r20, 3
    ; 3F: STSP8 [SP+3],c3
    emit_f1_stsp8 r22, 3
    ; 40: STSP8 [SP+4],c0
    emit_f1_stsp8 r16, 4
    ; 41: STSP8 [SP+4],c1
    emit_f1_stsp8 r18, 4
    ; 42: STSP8 [SP+4],c2
    emit_f1_stsp8 r20, 4
    ; 43: STSP8 [SP+4],c3
    emit_f1_stsp8 r22, 4
    ; 44: STSP8 [SP+5],c0
    emit_f1_stsp8 r16, 5
    ; 45: STSP8 [SP+5],c1
    emit_f1_stsp8 r18, 5
    ; 46: STSP8 [SP+5],c2
    emit_f1_stsp8 r20, 5
    ; 47: STSP8 [SP+5],c3
    emit_f1_stsp8 r22, 5
    ; 48: STSP8 [SP+6],c0
    emit_f1_stsp8 r16, 6
    ; 49: STSP8 [SP+6],c1
    emit_f1_stsp8 r18, 6
    ; 4A: STSP8 [SP+6],c2
    emit_f1_stsp8 r20, 6
    ; 4B: STSP8 [SP+6],c3
    emit_f1_stsp8 r22, 6
    ; 4C: STSP8 [SP+7],c0
    emit_f1_stsp8 r16, 7
    ; 4D: STSP8 [SP+7],c1
    emit_f1_stsp8 r18, 7
    ; 4E: STSP8 [SP+7],c2
    emit_f1_stsp8 r20, 7
    ; 4F: STSP8 [SP+7],c3
    emit_f1_stsp8 r22, 7
    ; 50: STSP8 [SP+8],c0
    emit_f1_stsp8 r16, 8
    ; 51: STSP8 [SP+8],c1
    emit_f1_stsp8 r18, 8
    ; 52: STSP8 [SP+8],c2
    emit_f1_stsp8 r20, 8
    ; 53: STSP8 [SP+8],c3
    emit_f1_stsp8 r22, 8
    ; 54: STSP8 [SP+9],c0
    emit_f1_stsp8 r16, 9
    ; 55: STSP8 [SP+9],c1
    emit_f1_stsp8 r18, 9
    ; 56: STSP8 [SP+9],c2
    emit_f1_stsp8 r20, 9
    ; 57: STSP8 [SP+9],c3
    emit_f1_stsp8 r22, 9
    ; 58: STSP8 [SP+10],c0
    emit_f1_stsp8 r16, 10
    ; 59: STSP8 [SP+10],c1
    emit_f1_stsp8 r18, 10
    ; 5A: STSP8 [SP+10],c2
    emit_f1_stsp8 r20, 10
    ; 5B: STSP8 [SP+10],c3
    emit_f1_stsp8 r22, 10
    ; 5C: STSP8 [SP+11],c0
    emit_f1_stsp8 r16, 11
    ; 5D: STSP8 [SP+11],c1
    emit_f1_stsp8 r18, 11
    ; 5E: STSP8 [SP+11],c2
    emit_f1_stsp8 r20, 11
    ; 5F: STSP8 [SP+11],c3
    emit_f1_stsp8 r22, 11
    ; 60: STSP8 [SP+12],c0
    emit_f1_stsp8 r16, 12
    ; 61: STSP8 [SP+12],c1
    emit_f1_stsp8 r18, 12
    ; 62: STSP8 [SP+12],c2
    emit_f1_stsp8 r20, 12
    ; 63: STSP8 [SP+12],c3
    emit_f1_stsp8 r22, 12
    ; 64: STSP8 [SP+13],c0
    emit_f1_stsp8 r16, 13
    ; 65: STSP8 [SP+13],c1
    emit_f1_stsp8 r18, 13
    ; 66: STSP8 [SP+13],c2
    emit_f1_stsp8 r20, 13
    ; 67: STSP8 [SP+13],c3
    emit_f1_stsp8 r22, 13
    ; 68: STSP8 [SP+14],c0
    emit_f1_stsp8 r16, 14
    ; 69: STSP8 [SP+14],c1
    emit_f1_stsp8 r18, 14
    ; 6A: STSP8 [SP+14],c2
    emit_f1_stsp8 r20, 14
    ; 6B: STSP8 [SP+14],c3
    emit_f1_stsp8 r22, 14
    ; 6C: STSP8 [SP+15],c0
    emit_f1_stsp8 r16, 15
    ; 6D: STSP8 [SP+15],c1
    emit_f1_stsp8 r18, 15
    ; 6E: STSP8 [SP+15],c2
    emit_f1_stsp8 r20, 15
    ; 6F: STSP8 [SP+15],c3
    emit_f1_stsp8 r22, 15
    ; 70: ZEXT8 r0
    emit_f1_zext8 r9
    ; 71: ZEXT8 r1
    emit_f1_zext8 r11
    ; 72: ZEXT8 r2
    emit_f1_zext8 r13
    ; 73: ZEXT8 r3
    emit_f1_zext8 r15
    ; 74: ZEXT8 r4
    emit_f1_zext8 r17
    ; 75: ZEXT8 r5
    emit_f1_zext8 r19
    ; 76: ZEXT8 r6
    emit_f1_zext8 r21
    ; 77: ZEXT8 r7
    emit_f1_zext8 r23
    ; 78: SWAP8 r0
    emit_f1_swap8 r8
    ; 79: SWAP8 r1
    emit_f1_swap8 r10
    ; 7A: SWAP8 r2
    emit_f1_swap8 r12
    ; 7B: SWAP8 r3
    emit_f1_swap8 r14
    ; 7C: SWAP8 r4
    emit_f1_swap8 r16
    ; 7D: SWAP8 r5
    emit_f1_swap8 r18
    ; 7E: SWAP8 r6
    emit_f1_swap8 r20
    ; 7F: SWAP8 r7
    emit_f1_swap8 r22
    ; 80: GETSP r0
    emit_f1_getsp r8
    ; 81: GETSP r1
    emit_f1_getsp r10
    ; 82: GETSP r2
    emit_f1_getsp r12
    ; 83: GETSP r3
    emit_f1_getsp r14
    ; 84: GETSP r4
    emit_f1_getsp r16
    ; 85: GETSP r5
    emit_f1_getsp r18
    ; 86: GETSP r6
    emit_f1_getsp r20
    ; 87: GETSP r7
    emit_f1_getsp r22
    ; 88: SETSP r0
    emit_f1_setsp r8
    ; 89: SETSP r1
    emit_f1_setsp r10
    ; 8A: SETSP r2
    emit_f1_setsp r12
    ; 8B: SETSP r3
    emit_f1_setsp r14
    ; 8C: SETSP r4
    emit_f1_setsp r16
    ; 8D: SETSP r5
    emit_f1_setsp r18
    ; 8E: SETSP r6
    emit_f1_setsp r20
    ; 8F: SETSP r7
    emit_f1_setsp r22
f1_table_end:
.if (f1_table_end - f1_table) != (2 * 0x90 * 2)
    .error "f1_table has incorrect size"
.endif

f2_table:
    ; F2: bounded three-word ADD/SUB table
    ; 00: ADD r0,r0
    emit_f2_add r8, r9, r8, r9
    ; 01: ADD r0,r1
    emit_f2_add r8, r9, r10, r11
    ; 02: ADD r0,r2
    emit_f2_add r8, r9, r12, r13
    ; 03: ADD r0,r3
    emit_f2_add r8, r9, r14, r15
    ; 04: ADD r0,r4
    emit_f2_add r8, r9, r16, r17
    ; 05: ADD r0,r5
    emit_f2_add r8, r9, r18, r19
    ; 06: ADD r0,r6
    emit_f2_add r8, r9, r20, r21
    ; 07: ADD r0,r7
    emit_f2_add r8, r9, r22, r23
    ; 08: ADD r1,r0
    emit_f2_add r10, r11, r8, r9
    ; 09: ADD r1,r1
    emit_f2_add r10, r11, r10, r11
    ; 0A: ADD r1,r2
    emit_f2_add r10, r11, r12, r13
    ; 0B: ADD r1,r3
    emit_f2_add r10, r11, r14, r15
    ; 0C: ADD r1,r4
    emit_f2_add r10, r11, r16, r17
    ; 0D: ADD r1,r5
    emit_f2_add r10, r11, r18, r19
    ; 0E: ADD r1,r6
    emit_f2_add r10, r11, r20, r21
    ; 0F: ADD r1,r7
    emit_f2_add r10, r11, r22, r23
    ; 10: ADD r2,r0
    emit_f2_add r12, r13, r8, r9
    ; 11: ADD r2,r1
    emit_f2_add r12, r13, r10, r11
    ; 12: ADD r2,r2
    emit_f2_add r12, r13, r12, r13
    ; 13: ADD r2,r3
    emit_f2_add r12, r13, r14, r15
    ; 14: ADD r2,r4
    emit_f2_add r12, r13, r16, r17
    ; 15: ADD r2,r5
    emit_f2_add r12, r13, r18, r19
    ; 16: ADD r2,r6
    emit_f2_add r12, r13, r20, r21
    ; 17: ADD r2,r7
    emit_f2_add r12, r13, r22, r23
    ; 18: ADD r3,r0
    emit_f2_add r14, r15, r8, r9
    ; 19: ADD r3,r1
    emit_f2_add r14, r15, r10, r11
    ; 1A: ADD r3,r2
    emit_f2_add r14, r15, r12, r13
    ; 1B: ADD r3,r3
    emit_f2_add r14, r15, r14, r15
    ; 1C: ADD r3,r4
    emit_f2_add r14, r15, r16, r17
    ; 1D: ADD r3,r5
    emit_f2_add r14, r15, r18, r19
    ; 1E: ADD r3,r6
    emit_f2_add r14, r15, r20, r21
    ; 1F: ADD r3,r7
    emit_f2_add r14, r15, r22, r23
    ; 20: ADD r4,r0
    emit_f2_add r16, r17, r8, r9
    ; 21: ADD r4,r1
    emit_f2_add r16, r17, r10, r11
    ; 22: ADD r4,r2
    emit_f2_add r16, r17, r12, r13
    ; 23: ADD r4,r3
    emit_f2_add r16, r17, r14, r15
    ; 24: ADD r5,r0
    emit_f2_add r18, r19, r8, r9
    ; 25: ADD r5,r1
    emit_f2_add r18, r19, r10, r11
    ; 26: ADD r5,r2
    emit_f2_add r18, r19, r12, r13
    ; 27: ADD r5,r3
    emit_f2_add r18, r19, r14, r15
    ; 28: ADD r6,r0
    emit_f2_add r20, r21, r8, r9
    ; 29: ADD r6,r1
    emit_f2_add r20, r21, r10, r11
    ; 2A: ADD r6,r2
    emit_f2_add r20, r21, r12, r13
    ; 2B: ADD r6,r3
    emit_f2_add r20, r21, r14, r15
    ; 2C: ADD r7,r0
    emit_f2_add r22, r23, r8, r9
    ; 2D: ADD r7,r1
    emit_f2_add r22, r23, r10, r11
    ; 2E: ADD r7,r2
    emit_f2_add r22, r23, r12, r13
    ; 2F: ADD r7,r3
    emit_f2_add r22, r23, r14, r15
    ; 30: SUB r0,r0
    emit_f2_sub r8, r9, r8, r9
    ; 31: SUB r0,r1
    emit_f2_sub r8, r9, r10, r11
    ; 32: SUB r0,r2
    emit_f2_sub r8, r9, r12, r13
    ; 33: SUB r0,r3
    emit_f2_sub r8, r9, r14, r15
    ; 34: SUB r0,r4
    emit_f2_sub r8, r9, r16, r17
    ; 35: SUB r0,r5
    emit_f2_sub r8, r9, r18, r19
    ; 36: SUB r0,r6
    emit_f2_sub r8, r9, r20, r21
    ; 37: SUB r0,r7
    emit_f2_sub r8, r9, r22, r23
    ; 38: SUB r1,r0
    emit_f2_sub r10, r11, r8, r9
    ; 39: SUB r1,r1
    emit_f2_sub r10, r11, r10, r11
    ; 3A: SUB r1,r2
    emit_f2_sub r10, r11, r12, r13
    ; 3B: SUB r1,r3
    emit_f2_sub r10, r11, r14, r15
    ; 3C: SUB r1,r4
    emit_f2_sub r10, r11, r16, r17
    ; 3D: SUB r1,r5
    emit_f2_sub r10, r11, r18, r19
    ; 3E: SUB r1,r6
    emit_f2_sub r10, r11, r20, r21
    ; 3F: SUB r1,r7
    emit_f2_sub r10, r11, r22, r23
    ; 40: SUB r2,r0
    emit_f2_sub r12, r13, r8, r9
    ; 41: SUB r2,r1
    emit_f2_sub r12, r13, r10, r11
    ; 42: SUB r2,r2
    emit_f2_sub r12, r13, r12, r13
    ; 43: SUB r2,r3
    emit_f2_sub r12, r13, r14, r15
    ; 44: SUB r2,r4
    emit_f2_sub r12, r13, r16, r17
    ; 45: SUB r2,r5
    emit_f2_sub r12, r13, r18, r19
    ; 46: SUB r2,r6
    emit_f2_sub r12, r13, r20, r21
    ; 47: SUB r2,r7
    emit_f2_sub r12, r13, r22, r23
    ; 48: SUB r3,r0
    emit_f2_sub r14, r15, r8, r9
    ; 49: SUB r3,r1
    emit_f2_sub r14, r15, r10, r11
    ; 4A: SUB r3,r2
    emit_f2_sub r14, r15, r12, r13
    ; 4B: SUB r3,r3
    emit_f2_sub r14, r15, r14, r15
    ; 4C: SUB r3,r4
    emit_f2_sub r14, r15, r16, r17
    ; 4D: SUB r3,r5
    emit_f2_sub r14, r15, r18, r19
    ; 4E: SUB r3,r6
    emit_f2_sub r14, r15, r20, r21
    ; 4F: SUB r3,r7
    emit_f2_sub r14, r15, r22, r23
    ; 50: SUB r4,r0
    emit_f2_sub r16, r17, r8, r9
    ; 51: SUB r4,r1
    emit_f2_sub r16, r17, r10, r11
    ; 52: SUB r4,r2
    emit_f2_sub r16, r17, r12, r13
    ; 53: SUB r4,r3
    emit_f2_sub r16, r17, r14, r15
    ; 54: SUB r5,r0
    emit_f2_sub r18, r19, r8, r9
    ; 55: SUB r5,r1
    emit_f2_sub r18, r19, r10, r11
    ; 56: SUB r5,r2
    emit_f2_sub r18, r19, r12, r13
    ; 57: SUB r5,r3
    emit_f2_sub r18, r19, r14, r15
    ; 58: SUB r6,r0
    emit_f2_sub r20, r21, r8, r9
    ; 59: SUB r6,r1
    emit_f2_sub r20, r21, r10, r11
    ; 5A: SUB r6,r2
    emit_f2_sub r20, r21, r12, r13
    ; 5B: SUB r6,r3
    emit_f2_sub r20, r21, r14, r15
    ; 5C: SUB r7,r0
    emit_f2_sub r22, r23, r8, r9
    ; 5D: SUB r7,r1
    emit_f2_sub r22, r23, r10, r11
    ; 5E: SUB r7,r2
    emit_f2_sub r22, r23, r12, r13
    ; 5F: SUB r7,r3
    emit_f2_sub r22, r23, r14, r15
f2_table_end:
.if (f2_table_end - f2_table) != (2 * 0x60 * 3)
    .error "f2_table has incorrect size"
.endif

f3_table:
    ; F3: bounded three-word memory and widening-multiply table
    ; 00: ST8 [c0],r0
    emit_f3_st8 r16, r8
    ; 01: ST8 [c0],r1
    emit_f3_st8 r16, r10
    ; 02: ST8 [c0],r2
    emit_f3_st8 r16, r12
    ; 03: ST8 [c0],r3
    emit_f3_st8 r16, r14
    ; 04: ST8 [c1],r0
    emit_f3_st8 r18, r8
    ; 05: ST8 [c1],r1
    emit_f3_st8 r18, r10
    ; 06: ST8 [c1],r2
    emit_f3_st8 r18, r12
    ; 07: ST8 [c1],r3
    emit_f3_st8 r18, r14
    ; 08: ST8 [c2],r0
    emit_f3_st8 r20, r8
    ; 09: ST8 [c2],r1
    emit_f3_st8 r20, r10
    ; 0A: ST8 [c2],r2
    emit_f3_st8 r20, r12
    ; 0B: ST8 [c2],r3
    emit_f3_st8 r20, r14
    ; 0C: ST8 [c3],r0
    emit_f3_st8 r22, r8
    ; 0D: ST8 [c3],r1
    emit_f3_st8 r22, r10
    ; 0E: ST8 [c3],r2
    emit_f3_st8 r22, r12
    ; 0F: ST8 [c3],r3
    emit_f3_st8 r22, r14
    ; 10: MULU8.W c0,c0
    emit_f3_mul mul, r16, r16
    ; 11: MULU8.W c0,c1
    emit_f3_mul mul, r16, r18
    ; 12: MULU8.W c0,c2
    emit_f3_mul mul, r16, r20
    ; 13: MULU8.W c0,c3
    emit_f3_mul mul, r16, r22
    ; 14: MULU8.W c1,c0
    emit_f3_mul mul, r18, r16
    ; 15: MULU8.W c1,c1
    emit_f3_mul mul, r18, r18
    ; 16: MULU8.W c1,c2
    emit_f3_mul mul, r18, r20
    ; 17: MULU8.W c1,c3
    emit_f3_mul mul, r18, r22
    ; 18: MULU8.W c2,c0
    emit_f3_mul mul, r20, r16
    ; 19: MULU8.W c2,c1
    emit_f3_mul mul, r20, r18
    ; 1A: MULU8.W c2,c2
    emit_f3_mul mul, r20, r20
    ; 1B: MULU8.W c2,c3
    emit_f3_mul mul, r20, r22
    ; 1C: MULU8.W c3,c0
    emit_f3_mul mul, r22, r16
    ; 1D: MULU8.W c3,c1
    emit_f3_mul mul, r22, r18
    ; 1E: MULU8.W c3,c2
    emit_f3_mul mul, r22, r20
    ; 1F: MULU8.W c3,c3
    emit_f3_mul mul, r22, r22
    ; 20: MULS8.W c0,c0
    emit_f3_mul muls, r16, r16
    ; 21: MULS8.W c0,c1
    emit_f3_mul muls, r16, r18
    ; 22: MULS8.W c0,c2
    emit_f3_mul muls, r16, r20
    ; 23: MULS8.W c0,c3
    emit_f3_mul muls, r16, r22
    ; 24: MULS8.W c1,c0
    emit_f3_mul muls, r18, r16
    ; 25: MULS8.W c1,c1
    emit_f3_mul muls, r18, r18
    ; 26: MULS8.W c1,c2
    emit_f3_mul muls, r18, r20
    ; 27: MULS8.W c1,c3
    emit_f3_mul muls, r18, r22
    ; 28: MULS8.W c2,c0
    emit_f3_mul muls, r20, r16
    ; 29: MULS8.W c2,c1
    emit_f3_mul muls, r20, r18
    ; 2A: MULS8.W c2,c2
    emit_f3_mul muls, r20, r20
    ; 2B: MULS8.W c2,c3
    emit_f3_mul muls, r20, r22
    ; 2C: MULS8.W c3,c0
    emit_f3_mul muls, r22, r16
    ; 2D: MULS8.W c3,c1
    emit_f3_mul muls, r22, r18
    ; 2E: MULS8.W c3,c2
    emit_f3_mul muls, r22, r20
    ; 2F: MULS8.W c3,c3
    emit_f3_mul muls, r22, r22
    ; 30: MULSU8.W c0,c0
    emit_f3_mul mulsu, r16, r16
    ; 31: MULSU8.W c0,c1
    emit_f3_mul mulsu, r16, r18
    ; 32: MULSU8.W c0,c2
    emit_f3_mul mulsu, r16, r20
    ; 33: MULSU8.W c0,c3
    emit_f3_mul mulsu, r16, r22
    ; 34: MULSU8.W c1,c0
    emit_f3_mul mulsu, r18, r16
    ; 35: MULSU8.W c1,c1
    emit_f3_mul mulsu, r18, r18
    ; 36: MULSU8.W c1,c2
    emit_f3_mul mulsu, r18, r20
    ; 37: MULSU8.W c1,c3
    emit_f3_mul mulsu, r18, r22
    ; 38: MULSU8.W c2,c0
    emit_f3_mul mulsu, r20, r16
    ; 39: MULSU8.W c2,c1
    emit_f3_mul mulsu, r20, r18
    ; 3A: MULSU8.W c2,c2
    emit_f3_mul mulsu, r20, r20
    ; 3B: MULSU8.W c2,c3
    emit_f3_mul mulsu, r20, r22
    ; 3C: MULSU8.W c3,c0
    emit_f3_mul mulsu, r22, r16
    ; 3D: MULSU8.W c3,c1
    emit_f3_mul mulsu, r22, r18
    ; 3E: MULSU8.W c3,c2
    emit_f3_mul mulsu, r22, r20
    ; 3F: MULSU8.W c3,c3
    emit_f3_mul mulsu, r22, r22
    ; 40: LDSP8U c0,[SP+0]
    emit_f3_ldsp8u r16, r17, 0
    ; 41: LDSP8U c1,[SP+0]
    emit_f3_ldsp8u r18, r19, 0
    ; 42: LDSP8U c2,[SP+0]
    emit_f3_ldsp8u r20, r21, 0
    ; 43: LDSP8U c3,[SP+0]
    emit_f3_ldsp8u r22, r23, 0
    ; 44: LDSP8U c0,[SP+1]
    emit_f3_ldsp8u r16, r17, 1
    ; 45: LDSP8U c1,[SP+1]
    emit_f3_ldsp8u r18, r19, 1
    ; 46: LDSP8U c2,[SP+1]
    emit_f3_ldsp8u r20, r21, 1
    ; 47: LDSP8U c3,[SP+1]
    emit_f3_ldsp8u r22, r23, 1
    ; 48: LDSP8U c0,[SP+2]
    emit_f3_ldsp8u r16, r17, 2
    ; 49: LDSP8U c1,[SP+2]
    emit_f3_ldsp8u r18, r19, 2
    ; 4A: LDSP8U c2,[SP+2]
    emit_f3_ldsp8u r20, r21, 2
    ; 4B: LDSP8U c3,[SP+2]
    emit_f3_ldsp8u r22, r23, 2
    ; 4C: LDSP8U c0,[SP+3]
    emit_f3_ldsp8u r16, r17, 3
    ; 4D: LDSP8U c1,[SP+3]
    emit_f3_ldsp8u r18, r19, 3
    ; 4E: LDSP8U c2,[SP+3]
    emit_f3_ldsp8u r20, r21, 3
    ; 4F: LDSP8U c3,[SP+3]
    emit_f3_ldsp8u r22, r23, 3
    ; 50: LDSP8U c0,[SP+4]
    emit_f3_ldsp8u r16, r17, 4
    ; 51: LDSP8U c1,[SP+4]
    emit_f3_ldsp8u r18, r19, 4
    ; 52: LDSP8U c2,[SP+4]
    emit_f3_ldsp8u r20, r21, 4
    ; 53: LDSP8U c3,[SP+4]
    emit_f3_ldsp8u r22, r23, 4
    ; 54: LDSP8U c0,[SP+5]
    emit_f3_ldsp8u r16, r17, 5
    ; 55: LDSP8U c1,[SP+5]
    emit_f3_ldsp8u r18, r19, 5
    ; 56: LDSP8U c2,[SP+5]
    emit_f3_ldsp8u r20, r21, 5
    ; 57: LDSP8U c3,[SP+5]
    emit_f3_ldsp8u r22, r23, 5
    ; 58: LDSP8U c0,[SP+6]
    emit_f3_ldsp8u r16, r17, 6
    ; 59: LDSP8U c1,[SP+6]
    emit_f3_ldsp8u r18, r19, 6
    ; 5A: LDSP8U c2,[SP+6]
    emit_f3_ldsp8u r20, r21, 6
    ; 5B: LDSP8U c3,[SP+6]
    emit_f3_ldsp8u r22, r23, 6
    ; 5C: LDSP8U c0,[SP+7]
    emit_f3_ldsp8u r16, r17, 7
    ; 5D: LDSP8U c1,[SP+7]
    emit_f3_ldsp8u r18, r19, 7
    ; 5E: LDSP8U c2,[SP+7]
    emit_f3_ldsp8u r20, r21, 7
    ; 5F: LDSP8U c3,[SP+7]
    emit_f3_ldsp8u r22, r23, 7
    ; 60: LDSP8U c0,[SP+8]
    emit_f3_ldsp8u r16, r17, 8
    ; 61: LDSP8U c1,[SP+8]
    emit_f3_ldsp8u r18, r19, 8
    ; 62: LDSP8U c2,[SP+8]
    emit_f3_ldsp8u r20, r21, 8
    ; 63: LDSP8U c3,[SP+8]
    emit_f3_ldsp8u r22, r23, 8
    ; 64: LDSP8U c0,[SP+9]
    emit_f3_ldsp8u r16, r17, 9
    ; 65: LDSP8U c1,[SP+9]
    emit_f3_ldsp8u r18, r19, 9
    ; 66: LDSP8U c2,[SP+9]
    emit_f3_ldsp8u r20, r21, 9
    ; 67: LDSP8U c3,[SP+9]
    emit_f3_ldsp8u r22, r23, 9
    ; 68: LDSP8U c0,[SP+10]
    emit_f3_ldsp8u r16, r17, 10
    ; 69: LDSP8U c1,[SP+10]
    emit_f3_ldsp8u r18, r19, 10
    ; 6A: LDSP8U c2,[SP+10]
    emit_f3_ldsp8u r20, r21, 10
    ; 6B: LDSP8U c3,[SP+10]
    emit_f3_ldsp8u r22, r23, 10
    ; 6C: LDSP8U c0,[SP+11]
    emit_f3_ldsp8u r16, r17, 11
    ; 6D: LDSP8U c1,[SP+11]
    emit_f3_ldsp8u r18, r19, 11
    ; 6E: LDSP8U c2,[SP+11]
    emit_f3_ldsp8u r20, r21, 11
    ; 6F: LDSP8U c3,[SP+11]
    emit_f3_ldsp8u r22, r23, 11
    ; 70: LDSP8U c0,[SP+12]
    emit_f3_ldsp8u r16, r17, 12
    ; 71: LDSP8U c1,[SP+12]
    emit_f3_ldsp8u r18, r19, 12
    ; 72: LDSP8U c2,[SP+12]
    emit_f3_ldsp8u r20, r21, 12
    ; 73: LDSP8U c3,[SP+12]
    emit_f3_ldsp8u r22, r23, 12
    ; 74: LDSP8U c0,[SP+13]
    emit_f3_ldsp8u r16, r17, 13
    ; 75: LDSP8U c1,[SP+13]
    emit_f3_ldsp8u r18, r19, 13
    ; 76: LDSP8U c2,[SP+13]
    emit_f3_ldsp8u r20, r21, 13
    ; 77: LDSP8U c3,[SP+13]
    emit_f3_ldsp8u r22, r23, 13
    ; 78: LDSP8U c0,[SP+14]
    emit_f3_ldsp8u r16, r17, 14
    ; 79: LDSP8U c1,[SP+14]
    emit_f3_ldsp8u r18, r19, 14
    ; 7A: LDSP8U c2,[SP+14]
    emit_f3_ldsp8u r20, r21, 14
    ; 7B: LDSP8U c3,[SP+14]
    emit_f3_ldsp8u r22, r23, 14
    ; 7C: LDSP8U c0,[SP+15]
    emit_f3_ldsp8u r16, r17, 15
    ; 7D: LDSP8U c1,[SP+15]
    emit_f3_ldsp8u r18, r19, 15
    ; 7E: LDSP8U c2,[SP+15]
    emit_f3_ldsp8u r20, r21, 15
    ; 7F: LDSP8U c3,[SP+15]
    emit_f3_ldsp8u r22, r23, 15
f3_table_end:
.if (f3_table_end - f3_table) != (2 * 0x80 * 3)
    .error "f3_table has incorrect size"
.endif

; Cluster B serves F4-F6 and provides both one- and two-cycle flag-commit
; landings needed by TST8, CMP, and TST16 families.
cluster_b_start:
cluster_b_tail_17_delay_1:
    nop
cluster_b_tail_17:
    dispatch_reverse

flags_commit_b_18_delay_2:
    out  VM_FLAGS, SECONDARY_OPCODE
cluster_b_tail_18_delay_2:
    rjmp cluster_b_tail_18
flags_commit_b_18_delay_1:
    out  VM_FLAGS, SECONDARY_OPCODE
cluster_b_tail_18_delay_1:
    nop
cluster_b_tail:
cluster_b_tail_18:
    dispatch
cluster_b_end:
.if (cluster_b_end - cluster_b_start) != 50
    .error "secondary cadence Cluster B must occupy 25 AVR words"
.endif

; F4-F7 contain their exact native slots. A nearby invalid-secondary shim is
; used only by the reserved postincrement-load alias entries in F7.
secondary_tables_before_cluster_c:
secondary_unimplemented_b_func:
    rjmp secondary_unimplemented_a_func
secondary_invalid_b_func:
    rjmp invalid_secondary_instruction_func

f4_table:
    ; F4: bounded three-word stack, unary, and fixed-shift table
    ; 00: LDSP16 c0,[SP+0]
    emit_f4_ldsp16 r16, r17, 0, 1
    ; 01: LDSP16 c1,[SP+0]
    emit_f4_ldsp16 r18, r19, 0, 1
    ; 02: LDSP16 c2,[SP+0]
    emit_f4_ldsp16 r20, r21, 0, 1
    ; 03: LDSP16 c3,[SP+0]
    emit_f4_ldsp16 r22, r23, 0, 1
    ; 04: LDSP16 c0,[SP+1]
    emit_f4_ldsp16 r16, r17, 1, 2
    ; 05: LDSP16 c1,[SP+1]
    emit_f4_ldsp16 r18, r19, 1, 2
    ; 06: LDSP16 c2,[SP+1]
    emit_f4_ldsp16 r20, r21, 1, 2
    ; 07: LDSP16 c3,[SP+1]
    emit_f4_ldsp16 r22, r23, 1, 2
    ; 08: LDSP16 c0,[SP+2]
    emit_f4_ldsp16 r16, r17, 2, 3
    ; 09: LDSP16 c1,[SP+2]
    emit_f4_ldsp16 r18, r19, 2, 3
    ; 0A: LDSP16 c2,[SP+2]
    emit_f4_ldsp16 r20, r21, 2, 3
    ; 0B: LDSP16 c3,[SP+2]
    emit_f4_ldsp16 r22, r23, 2, 3
    ; 0C: LDSP16 c0,[SP+3]
    emit_f4_ldsp16 r16, r17, 3, 4
    ; 0D: LDSP16 c1,[SP+3]
    emit_f4_ldsp16 r18, r19, 3, 4
    ; 0E: LDSP16 c2,[SP+3]
    emit_f4_ldsp16 r20, r21, 3, 4
    ; 0F: LDSP16 c3,[SP+3]
    emit_f4_ldsp16 r22, r23, 3, 4
    ; 10: LDSP16 c0,[SP+4]
    emit_f4_ldsp16 r16, r17, 4, 5
    ; 11: LDSP16 c1,[SP+4]
    emit_f4_ldsp16 r18, r19, 4, 5
    ; 12: LDSP16 c2,[SP+4]
    emit_f4_ldsp16 r20, r21, 4, 5
    ; 13: LDSP16 c3,[SP+4]
    emit_f4_ldsp16 r22, r23, 4, 5
    ; 14: LDSP16 c0,[SP+5]
    emit_f4_ldsp16 r16, r17, 5, 6
    ; 15: LDSP16 c1,[SP+5]
    emit_f4_ldsp16 r18, r19, 5, 6
    ; 16: LDSP16 c2,[SP+5]
    emit_f4_ldsp16 r20, r21, 5, 6
    ; 17: LDSP16 c3,[SP+5]
    emit_f4_ldsp16 r22, r23, 5, 6
    ; 18: LDSP16 c0,[SP+6]
    emit_f4_ldsp16 r16, r17, 6, 7
    ; 19: LDSP16 c1,[SP+6]
    emit_f4_ldsp16 r18, r19, 6, 7
    ; 1A: LDSP16 c2,[SP+6]
    emit_f4_ldsp16 r20, r21, 6, 7
    ; 1B: LDSP16 c3,[SP+6]
    emit_f4_ldsp16 r22, r23, 6, 7
    ; 1C: LDSP16 c0,[SP+7]
    emit_f4_ldsp16 r16, r17, 7, 8
    ; 1D: LDSP16 c1,[SP+7]
    emit_f4_ldsp16 r18, r19, 7, 8
    ; 1E: LDSP16 c2,[SP+7]
    emit_f4_ldsp16 r20, r21, 7, 8
    ; 1F: LDSP16 c3,[SP+7]
    emit_f4_ldsp16 r22, r23, 7, 8
    ; 20: LDSP16 c0,[SP+8]
    emit_f4_ldsp16 r16, r17, 8, 9
    ; 21: LDSP16 c1,[SP+8]
    emit_f4_ldsp16 r18, r19, 8, 9
    ; 22: LDSP16 c2,[SP+8]
    emit_f4_ldsp16 r20, r21, 8, 9
    ; 23: LDSP16 c3,[SP+8]
    emit_f4_ldsp16 r22, r23, 8, 9
    ; 24: LDSP16 c0,[SP+9]
    emit_f4_ldsp16 r16, r17, 9, 10
    ; 25: LDSP16 c1,[SP+9]
    emit_f4_ldsp16 r18, r19, 9, 10
    ; 26: LDSP16 c2,[SP+9]
    emit_f4_ldsp16 r20, r21, 9, 10
    ; 27: LDSP16 c3,[SP+9]
    emit_f4_ldsp16 r22, r23, 9, 10
    ; 28: LDSP16 c0,[SP+10]
    emit_f4_ldsp16 r16, r17, 10, 11
    ; 29: LDSP16 c1,[SP+10]
    emit_f4_ldsp16 r18, r19, 10, 11
    ; 2A: LDSP16 c2,[SP+10]
    emit_f4_ldsp16 r20, r21, 10, 11
    ; 2B: LDSP16 c3,[SP+10]
    emit_f4_ldsp16 r22, r23, 10, 11
    ; 2C: LDSP16 c0,[SP+11]
    emit_f4_ldsp16 r16, r17, 11, 12
    ; 2D: LDSP16 c1,[SP+11]
    emit_f4_ldsp16 r18, r19, 11, 12
    ; 2E: LDSP16 c2,[SP+11]
    emit_f4_ldsp16 r20, r21, 11, 12
    ; 2F: LDSP16 c3,[SP+11]
    emit_f4_ldsp16 r22, r23, 11, 12
    ; 30: LDSP16 c0,[SP+12]
    emit_f4_ldsp16 r16, r17, 12, 13
    ; 31: LDSP16 c1,[SP+12]
    emit_f4_ldsp16 r18, r19, 12, 13
    ; 32: LDSP16 c2,[SP+12]
    emit_f4_ldsp16 r20, r21, 12, 13
    ; 33: LDSP16 c3,[SP+12]
    emit_f4_ldsp16 r22, r23, 12, 13
    ; 34: LDSP16 c0,[SP+13]
    emit_f4_ldsp16 r16, r17, 13, 14
    ; 35: LDSP16 c1,[SP+13]
    emit_f4_ldsp16 r18, r19, 13, 14
    ; 36: LDSP16 c2,[SP+13]
    emit_f4_ldsp16 r20, r21, 13, 14
    ; 37: LDSP16 c3,[SP+13]
    emit_f4_ldsp16 r22, r23, 13, 14
    ; 38: LDSP16 c0,[SP+14]
    emit_f4_ldsp16 r16, r17, 14, 15
    ; 39: LDSP16 c1,[SP+14]
    emit_f4_ldsp16 r18, r19, 14, 15
    ; 3A: LDSP16 c2,[SP+14]
    emit_f4_ldsp16 r20, r21, 14, 15
    ; 3B: LDSP16 c3,[SP+14]
    emit_f4_ldsp16 r22, r23, 14, 15
    ; 3C: LDSP16 c0,[SP+15]
    emit_f4_ldsp16 r16, r17, 15, 16
    ; 3D: LDSP16 c1,[SP+15]
    emit_f4_ldsp16 r18, r19, 15, 16
    ; 3E: LDSP16 c2,[SP+15]
    emit_f4_ldsp16 r20, r21, 15, 16
    ; 3F: LDSP16 c3,[SP+15]
    emit_f4_ldsp16 r22, r23, 15, 16
    ; 40: STSP16 [SP+0],c0
    emit_f4_stsp16 r16, r17, 0, 1
    ; 41: STSP16 [SP+0],c1
    emit_f4_stsp16 r18, r19, 0, 1
    ; 42: STSP16 [SP+0],c2
    emit_f4_stsp16 r20, r21, 0, 1
    ; 43: STSP16 [SP+0],c3
    emit_f4_stsp16 r22, r23, 0, 1
    ; 44: STSP16 [SP+1],c0
    emit_f4_stsp16 r16, r17, 1, 2
    ; 45: STSP16 [SP+1],c1
    emit_f4_stsp16 r18, r19, 1, 2
    ; 46: STSP16 [SP+1],c2
    emit_f4_stsp16 r20, r21, 1, 2
    ; 47: STSP16 [SP+1],c3
    emit_f4_stsp16 r22, r23, 1, 2
    ; 48: STSP16 [SP+2],c0
    emit_f4_stsp16 r16, r17, 2, 3
    ; 49: STSP16 [SP+2],c1
    emit_f4_stsp16 r18, r19, 2, 3
    ; 4A: STSP16 [SP+2],c2
    emit_f4_stsp16 r20, r21, 2, 3
    ; 4B: STSP16 [SP+2],c3
    emit_f4_stsp16 r22, r23, 2, 3
    ; 4C: STSP16 [SP+3],c0
    emit_f4_stsp16 r16, r17, 3, 4
    ; 4D: STSP16 [SP+3],c1
    emit_f4_stsp16 r18, r19, 3, 4
    ; 4E: STSP16 [SP+3],c2
    emit_f4_stsp16 r20, r21, 3, 4
    ; 4F: STSP16 [SP+3],c3
    emit_f4_stsp16 r22, r23, 3, 4
    ; 50: STSP16 [SP+4],c0
    emit_f4_stsp16 r16, r17, 4, 5
    ; 51: STSP16 [SP+4],c1
    emit_f4_stsp16 r18, r19, 4, 5
    ; 52: STSP16 [SP+4],c2
    emit_f4_stsp16 r20, r21, 4, 5
    ; 53: STSP16 [SP+4],c3
    emit_f4_stsp16 r22, r23, 4, 5
    ; 54: STSP16 [SP+5],c0
    emit_f4_stsp16 r16, r17, 5, 6
    ; 55: STSP16 [SP+5],c1
    emit_f4_stsp16 r18, r19, 5, 6
    ; 56: STSP16 [SP+5],c2
    emit_f4_stsp16 r20, r21, 5, 6
    ; 57: STSP16 [SP+5],c3
    emit_f4_stsp16 r22, r23, 5, 6
    ; 58: STSP16 [SP+6],c0
    emit_f4_stsp16 r16, r17, 6, 7
    ; 59: STSP16 [SP+6],c1
    emit_f4_stsp16 r18, r19, 6, 7
    ; 5A: STSP16 [SP+6],c2
    emit_f4_stsp16 r20, r21, 6, 7
    ; 5B: STSP16 [SP+6],c3
    emit_f4_stsp16 r22, r23, 6, 7
    ; 5C: STSP16 [SP+7],c0
    emit_f4_stsp16 r16, r17, 7, 8
    ; 5D: STSP16 [SP+7],c1
    emit_f4_stsp16 r18, r19, 7, 8
    ; 5E: STSP16 [SP+7],c2
    emit_f4_stsp16 r20, r21, 7, 8
    ; 5F: STSP16 [SP+7],c3
    emit_f4_stsp16 r22, r23, 7, 8
    ; 60: STSP16 [SP+8],c0
    emit_f4_stsp16 r16, r17, 8, 9
    ; 61: STSP16 [SP+8],c1
    emit_f4_stsp16 r18, r19, 8, 9
    ; 62: STSP16 [SP+8],c2
    emit_f4_stsp16 r20, r21, 8, 9
    ; 63: STSP16 [SP+8],c3
    emit_f4_stsp16 r22, r23, 8, 9
    ; 64: STSP16 [SP+9],c0
    emit_f4_stsp16 r16, r17, 9, 10
    ; 65: STSP16 [SP+9],c1
    emit_f4_stsp16 r18, r19, 9, 10
    ; 66: STSP16 [SP+9],c2
    emit_f4_stsp16 r20, r21, 9, 10
    ; 67: STSP16 [SP+9],c3
    emit_f4_stsp16 r22, r23, 9, 10
    ; 68: STSP16 [SP+10],c0
    emit_f4_stsp16 r16, r17, 10, 11
    ; 69: STSP16 [SP+10],c1
    emit_f4_stsp16 r18, r19, 10, 11
    ; 6A: STSP16 [SP+10],c2
    emit_f4_stsp16 r20, r21, 10, 11
    ; 6B: STSP16 [SP+10],c3
    emit_f4_stsp16 r22, r23, 10, 11
    ; 6C: STSP16 [SP+11],c0
    emit_f4_stsp16 r16, r17, 11, 12
    ; 6D: STSP16 [SP+11],c1
    emit_f4_stsp16 r18, r19, 11, 12
    ; 6E: STSP16 [SP+11],c2
    emit_f4_stsp16 r20, r21, 11, 12
    ; 6F: STSP16 [SP+11],c3
    emit_f4_stsp16 r22, r23, 11, 12
    ; 70: STSP16 [SP+12],c0
    emit_f4_stsp16 r16, r17, 12, 13
    ; 71: STSP16 [SP+12],c1
    emit_f4_stsp16 r18, r19, 12, 13
    ; 72: STSP16 [SP+12],c2
    emit_f4_stsp16 r20, r21, 12, 13
    ; 73: STSP16 [SP+12],c3
    emit_f4_stsp16 r22, r23, 12, 13
    ; 74: STSP16 [SP+13],c0
    emit_f4_stsp16 r16, r17, 13, 14
    ; 75: STSP16 [SP+13],c1
    emit_f4_stsp16 r18, r19, 13, 14
    ; 76: STSP16 [SP+13],c2
    emit_f4_stsp16 r20, r21, 13, 14
    ; 77: STSP16 [SP+13],c3
    emit_f4_stsp16 r22, r23, 13, 14
    ; 78: STSP16 [SP+14],c0
    emit_f4_stsp16 r16, r17, 14, 15
    ; 79: STSP16 [SP+14],c1
    emit_f4_stsp16 r18, r19, 14, 15
    ; 7A: STSP16 [SP+14],c2
    emit_f4_stsp16 r20, r21, 14, 15
    ; 7B: STSP16 [SP+14],c3
    emit_f4_stsp16 r22, r23, 14, 15
    ; 7C: STSP16 [SP+15],c0
    emit_f4_stsp16 r16, r17, 15, 16
    ; 7D: STSP16 [SP+15],c1
    emit_f4_stsp16 r18, r19, 15, 16
    ; 7E: STSP16 [SP+15],c2
    emit_f4_stsp16 r20, r21, 15, 16
    ; 7F: STSP16 [SP+15],c3
    emit_f4_stsp16 r22, r23, 15, 16
    ; 80: LSL16.1 r0
    emit_f4_lsl16 r8, r9
    ; 81: LSL16.1 r1
    emit_f4_lsl16 r10, r11
    ; 82: LSL16.1 r2
    emit_f4_lsl16 r12, r13
    ; 83: LSL16.1 r3
    emit_f4_lsl16 r14, r15
    ; 84: LSL16.1 r4
    emit_f4_lsl16 r16, r17
    ; 85: LSL16.1 r5
    emit_f4_lsl16 r18, r19
    ; 86: LSL16.1 r6
    emit_f4_lsl16 r20, r21
    ; 87: LSL16.1 r7
    emit_f4_lsl16 r22, r23
    ; 88: LSR16.1 r0
    emit_f4_shift lsr, ror, r8, r9
    ; 89: LSR16.1 r1
    emit_f4_shift lsr, ror, r10, r11
    ; 8A: LSR16.1 r2
    emit_f4_shift lsr, ror, r12, r13
    ; 8B: LSR16.1 r3
    emit_f4_shift lsr, ror, r14, r15
    ; 8C: LSR16.1 r4
    emit_f4_shift lsr, ror, r16, r17
    ; 8D: LSR16.1 r5
    emit_f4_shift lsr, ror, r18, r19
    ; 8E: LSR16.1 r6
    emit_f4_shift lsr, ror, r20, r21
    ; 8F: LSR16.1 r7
    emit_f4_shift lsr, ror, r22, r23
    ; 90: ASR16.1 r0
    emit_f4_shift asr, ror, r8, r9
    ; 91: ASR16.1 r1
    emit_f4_shift asr, ror, r10, r11
    ; 92: ASR16.1 r2
    emit_f4_shift asr, ror, r12, r13
    ; 93: ASR16.1 r3
    emit_f4_shift asr, ror, r14, r15
    ; 94: ASR16.1 r4
    emit_f4_shift asr, ror, r16, r17
    ; 95: ASR16.1 r5
    emit_f4_shift asr, ror, r18, r19
    ; 96: ASR16.1 r6
    emit_f4_shift asr, ror, r20, r21
    ; 97: ASR16.1 r7
    emit_f4_shift asr, ror, r22, r23
    ; 98: NOT16 r0
    emit_f4_not16 r8, r9
    ; 99: NOT16 r1
    emit_f4_not16 r10, r11
    ; 9A: NOT16 r2
    emit_f4_not16 r12, r13
    ; 9B: NOT16 r3
    emit_f4_not16 r14, r15
    ; 9C: NOT16 r4
    emit_f4_not16 r16, r17
    ; 9D: NOT16 r5
    emit_f4_not16 r18, r19
    ; 9E: NOT16 r6
    emit_f4_not16 r20, r21
    ; 9F: NOT16 r7
    emit_f4_not16 r22, r23
    ; A0: TST8 r0
    emit_f4_tst8 r8
    ; A1: TST8 r1
    emit_f4_tst8 r10
    ; A2: TST8 r2
    emit_f4_tst8 r12
    ; A3: TST8 r3
    emit_f4_tst8 r14
    ; A4: TST8 r4
    emit_f4_tst8 r16
    ; A5: TST8 r5
    emit_f4_tst8 r18
    ; A6: TST8 r6
    emit_f4_tst8 r20
    ; A7: TST8 r7
    emit_f4_tst8 r22
    ; A8: INC16 r0
    emit_f4_inc16 r8, r9
    ; A9: INC16 r1
    emit_f4_inc16 r10, r11
    ; AA: INC16 r2
    emit_f4_inc16 r12, r13
    ; AB: INC16 r3
    emit_f4_inc16 r14, r15
    ; AC: INC16 r4
    emit_f4_inc16 r16, r17
    ; AD: INC16 r5
    emit_f4_inc16 r18, r19
    ; AE: INC16 r6
    emit_f4_inc16 r20, r21
    ; AF: INC16 r7
    emit_f4_inc16 r22, r23
    ; B0: DEC16 r0
    emit_f4_dec16 r8, r9
    ; B1: DEC16 r1
    emit_f4_dec16 r10, r11
    ; B2: DEC16 r2
    emit_f4_dec16 r12, r13
    ; B3: DEC16 r3
    emit_f4_dec16 r14, r15
    ; B4: DEC16 r4
    emit_f4_dec16 r16, r17
    ; B5: DEC16 r5
    emit_f4_dec16 r18, r19
    ; B6: DEC16 r6
    emit_f4_dec16 r20, r21
    ; B7: DEC16 r7
    emit_f4_dec16 r22, r23
f4_table_end:
.if (f4_table_end - f4_table) != (2 * 0xB8 * 3)
    .error "f4_table has incorrect size"
.endif

f5_table:
    ; F5: bounded four-word compare and ordinary compact-pointer memory table
    ; 00: CMP r0,r0
    emit_f5_cmp r8, r9, r8, r9
    ; 01: CMP r0,r1
    emit_f5_cmp r8, r9, r10, r11
    ; 02: CMP r0,r2
    emit_f5_cmp r8, r9, r12, r13
    ; 03: CMP r0,r3
    emit_f5_cmp r8, r9, r14, r15
    ; 04: CMP r0,r4
    emit_f5_cmp r8, r9, r16, r17
    ; 05: CMP r0,r5
    emit_f5_cmp r8, r9, r18, r19
    ; 06: CMP r0,r6
    emit_f5_cmp r8, r9, r20, r21
    ; 07: CMP r0,r7
    emit_f5_cmp r8, r9, r22, r23
    ; 08: CMP r1,r0
    emit_f5_cmp r10, r11, r8, r9
    ; 09: CMP r1,r1
    emit_f5_cmp r10, r11, r10, r11
    ; 0A: CMP r1,r2
    emit_f5_cmp r10, r11, r12, r13
    ; 0B: CMP r1,r3
    emit_f5_cmp r10, r11, r14, r15
    ; 0C: CMP r1,r4
    emit_f5_cmp r10, r11, r16, r17
    ; 0D: CMP r1,r5
    emit_f5_cmp r10, r11, r18, r19
    ; 0E: CMP r1,r6
    emit_f5_cmp r10, r11, r20, r21
    ; 0F: CMP r1,r7
    emit_f5_cmp r10, r11, r22, r23
    ; 10: CMP r2,r0
    emit_f5_cmp r12, r13, r8, r9
    ; 11: CMP r2,r1
    emit_f5_cmp r12, r13, r10, r11
    ; 12: CMP r2,r2
    emit_f5_cmp r12, r13, r12, r13
    ; 13: CMP r2,r3
    emit_f5_cmp r12, r13, r14, r15
    ; 14: CMP r2,r4
    emit_f5_cmp r12, r13, r16, r17
    ; 15: CMP r2,r5
    emit_f5_cmp r12, r13, r18, r19
    ; 16: CMP r2,r6
    emit_f5_cmp r12, r13, r20, r21
    ; 17: CMP r2,r7
    emit_f5_cmp r12, r13, r22, r23
    ; 18: CMP r3,r0
    emit_f5_cmp r14, r15, r8, r9
    ; 19: CMP r3,r1
    emit_f5_cmp r14, r15, r10, r11
    ; 1A: CMP r3,r2
    emit_f5_cmp r14, r15, r12, r13
    ; 1B: CMP r3,r3
    emit_f5_cmp r14, r15, r14, r15
    ; 1C: CMP r3,r4
    emit_f5_cmp r14, r15, r16, r17
    ; 1D: CMP r3,r5
    emit_f5_cmp r14, r15, r18, r19
    ; 1E: CMP r3,r6
    emit_f5_cmp r14, r15, r20, r21
    ; 1F: CMP r3,r7
    emit_f5_cmp r14, r15, r22, r23
    ; 20: CMP r4,r0
    emit_f5_cmp r16, r17, r8, r9
    ; 21: CMP r4,r1
    emit_f5_cmp r16, r17, r10, r11
    ; 22: CMP r4,r2
    emit_f5_cmp r16, r17, r12, r13
    ; 23: CMP r4,r3
    emit_f5_cmp r16, r17, r14, r15
    ; 24: CMP r5,r0
    emit_f5_cmp r18, r19, r8, r9
    ; 25: CMP r5,r1
    emit_f5_cmp r18, r19, r10, r11
    ; 26: CMP r5,r2
    emit_f5_cmp r18, r19, r12, r13
    ; 27: CMP r5,r3
    emit_f5_cmp r18, r19, r14, r15
    ; 28: CMP r6,r0
    emit_f5_cmp r20, r21, r8, r9
    ; 29: CMP r6,r1
    emit_f5_cmp r20, r21, r10, r11
    ; 2A: CMP r6,r2
    emit_f5_cmp r20, r21, r12, r13
    ; 2B: CMP r6,r3
    emit_f5_cmp r20, r21, r14, r15
    ; 2C: CMP r7,r0
    emit_f5_cmp r22, r23, r8, r9
    ; 2D: CMP r7,r1
    emit_f5_cmp r22, r23, r10, r11
    ; 2E: CMP r7,r2
    emit_f5_cmp r22, r23, r12, r13
    ; 2F: CMP r7,r3
    emit_f5_cmp r22, r23, r14, r15
    ; 30: LD8U r0,[c0]
    emit_f5_ld8u r8, r9, r16
    ; 31: LD8U r1,[c0]
    emit_f5_ld8u r10, r11, r16
    ; 32: LD8U r2,[c0]
    emit_f5_ld8u r12, r13, r16
    ; 33: LD8U r3,[c0]
    emit_f5_ld8u r14, r15, r16
    ; 34: LD8U r0,[c1]
    emit_f5_ld8u r8, r9, r18
    ; 35: LD8U r1,[c1]
    emit_f5_ld8u r10, r11, r18
    ; 36: LD8U r2,[c1]
    emit_f5_ld8u r12, r13, r18
    ; 37: LD8U r3,[c1]
    emit_f5_ld8u r14, r15, r18
    ; 38: LD8U r0,[c2]
    emit_f5_ld8u r8, r9, r20
    ; 39: LD8U r1,[c2]
    emit_f5_ld8u r10, r11, r20
    ; 3A: LD8U r2,[c2]
    emit_f5_ld8u r12, r13, r20
    ; 3B: LD8U r3,[c2]
    emit_f5_ld8u r14, r15, r20
    ; 3C: LD8U r0,[c3]
    emit_f5_ld8u r8, r9, r22
    ; 3D: LD8U r1,[c3]
    emit_f5_ld8u r10, r11, r22
    ; 3E: LD8U r2,[c3]
    emit_f5_ld8u r12, r13, r22
    ; 3F: LD8U r3,[c3]
    emit_f5_ld8u r14, r15, r22
    ; 40: LD16 r0,[c0]
    emit_f5_ld16 r8, r9, r16
    ; 41: LD16 r1,[c0]
    emit_f5_ld16 r10, r11, r16
    ; 42: LD16 r2,[c0]
    emit_f5_ld16 r12, r13, r16
    ; 43: LD16 r3,[c0]
    emit_f5_ld16 r14, r15, r16
    ; 44: LD16 r0,[c1]
    emit_f5_ld16 r8, r9, r18
    ; 45: LD16 r1,[c1]
    emit_f5_ld16 r10, r11, r18
    ; 46: LD16 r2,[c1]
    emit_f5_ld16 r12, r13, r18
    ; 47: LD16 r3,[c1]
    emit_f5_ld16 r14, r15, r18
    ; 48: LD16 r0,[c2]
    emit_f5_ld16 r8, r9, r20
    ; 49: LD16 r1,[c2]
    emit_f5_ld16 r10, r11, r20
    ; 4A: LD16 r2,[c2]
    emit_f5_ld16 r12, r13, r20
    ; 4B: LD16 r3,[c2]
    emit_f5_ld16 r14, r15, r20
    ; 4C: LD16 r0,[c3]
    emit_f5_ld16 r8, r9, r22
    ; 4D: LD16 r1,[c3]
    emit_f5_ld16 r10, r11, r22
    ; 4E: LD16 r2,[c3]
    emit_f5_ld16 r12, r13, r22
    ; 4F: LD16 r3,[c3]
    emit_f5_ld16 r14, r15, r22
    ; 50: ST16 [c0],r0
    emit_f5_st16 r16, r8, r9
    ; 51: ST16 [c0],r1
    emit_f5_st16 r16, r10, r11
    ; 52: ST16 [c0],r2
    emit_f5_st16 r16, r12, r13
    ; 53: ST16 [c0],r3
    emit_f5_st16 r16, r14, r15
    ; 54: ST16 [c1],r0
    emit_f5_st16 r18, r8, r9
    ; 55: ST16 [c1],r1
    emit_f5_st16 r18, r10, r11
    ; 56: ST16 [c1],r2
    emit_f5_st16 r18, r12, r13
    ; 57: ST16 [c1],r3
    emit_f5_st16 r18, r14, r15
    ; 58: ST16 [c2],r0
    emit_f5_st16 r20, r8, r9
    ; 59: ST16 [c2],r1
    emit_f5_st16 r20, r10, r11
    ; 5A: ST16 [c2],r2
    emit_f5_st16 r20, r12, r13
    ; 5B: ST16 [c2],r3
    emit_f5_st16 r20, r14, r15
    ; 5C: ST16 [c3],r0
    emit_f5_st16 r22, r8, r9
    ; 5D: ST16 [c3],r1
    emit_f5_st16 r22, r10, r11
    ; 5E: ST16 [c3],r2
    emit_f5_st16 r22, r12, r13
    ; 5F: ST16 [c3],r3
    emit_f5_st16 r22, r14, r15
f5_table_end:
.if (f5_table_end - f5_table) != (2 * 0x60 * 4)
    .error "f5_table has incorrect size"
.endif

f6_table:
    ; F6: bounded four-word postincrement-store and unary table
    ; 00: ST8 [c0+],r0
    emit_f6_st8_post r16, r8
    ; 01: ST8 [c0+],r1
    emit_f6_st8_post r16, r10
    ; 02: ST8 [c0+],r2
    emit_f6_st8_post r16, r12
    ; 03: ST8 [c0+],r3
    emit_f6_st8_post r16, r14
    ; 04: ST8 [c0+],r4
    emit_f6_st8_post r16, r16
    ; 05: ST8 [c0+],r5
    emit_f6_st8_post r16, r18
    ; 06: ST8 [c0+],r6
    emit_f6_st8_post r16, r20
    ; 07: ST8 [c0+],r7
    emit_f6_st8_post r16, r22
    ; 08: ST8 [c1+],r0
    emit_f6_st8_post r18, r8
    ; 09: ST8 [c1+],r1
    emit_f6_st8_post r18, r10
    ; 0A: ST8 [c1+],r2
    emit_f6_st8_post r18, r12
    ; 0B: ST8 [c1+],r3
    emit_f6_st8_post r18, r14
    ; 0C: ST8 [c1+],r4
    emit_f6_st8_post r18, r16
    ; 0D: ST8 [c1+],r5
    emit_f6_st8_post r18, r18
    ; 0E: ST8 [c1+],r6
    emit_f6_st8_post r18, r20
    ; 0F: ST8 [c1+],r7
    emit_f6_st8_post r18, r22
    ; 10: ST8 [c2+],r0
    emit_f6_st8_post r20, r8
    ; 11: ST8 [c2+],r1
    emit_f6_st8_post r20, r10
    ; 12: ST8 [c2+],r2
    emit_f6_st8_post r20, r12
    ; 13: ST8 [c2+],r3
    emit_f6_st8_post r20, r14
    ; 14: ST8 [c2+],r4
    emit_f6_st8_post r20, r16
    ; 15: ST8 [c2+],r5
    emit_f6_st8_post r20, r18
    ; 16: ST8 [c2+],r6
    emit_f6_st8_post r20, r20
    ; 17: ST8 [c2+],r7
    emit_f6_st8_post r20, r22
    ; 18: ST8 [c3+],r0
    emit_f6_st8_post r22, r8
    ; 19: ST8 [c3+],r1
    emit_f6_st8_post r22, r10
    ; 1A: ST8 [c3+],r2
    emit_f6_st8_post r22, r12
    ; 1B: ST8 [c3+],r3
    emit_f6_st8_post r22, r14
    ; 1C: ST8 [c3+],r4
    emit_f6_st8_post r22, r16
    ; 1D: ST8 [c3+],r5
    emit_f6_st8_post r22, r18
    ; 1E: ST8 [c3+],r6
    emit_f6_st8_post r22, r20
    ; 1F: ST8 [c3+],r7
    emit_f6_st8_post r22, r22
    ; 20: BSWAP16 r0
    emit_f6_bswap16 r8, r9
    ; 21: BSWAP16 r1
    emit_f6_bswap16 r10, r11
    ; 22: BSWAP16 r2
    emit_f6_bswap16 r12, r13
    ; 23: BSWAP16 r3
    emit_f6_bswap16 r14, r15
    ; 24: BSWAP16 r4
    emit_f6_bswap16 r16, r17
    ; 25: BSWAP16 r5
    emit_f6_bswap16 r18, r19
    ; 26: BSWAP16 r6
    emit_f6_bswap16 r20, r21
    ; 27: BSWAP16 r7
    emit_f6_bswap16 r22, r23
    ; 28: TST16 r0
    emit_f6_tst16 r8, r9
    ; 29: TST16 r1
    emit_f6_tst16 r10, r11
    ; 2A: TST16 r2
    emit_f6_tst16 r12, r13
    ; 2B: TST16 r3
    emit_f6_tst16 r14, r15
    ; 2C: TST16 r4
    emit_f6_tst16 r16, r17
    ; 2D: TST16 r5
    emit_f6_tst16 r18, r19
    ; 2E: TST16 r6
    emit_f6_tst16 r20, r21
    ; 2F: TST16 r7
    emit_f6_tst16 r22, r23
    ; 30: MUL8 c0,c0
    emit_f6_mul8 r16, r17, r16
    ; 31: MUL8 c0,c1
    emit_f6_mul8 r16, r17, r18
    ; 32: MUL8 c0,c2
    emit_f6_mul8 r16, r17, r20
    ; 33: MUL8 c0,c3
    emit_f6_mul8 r16, r17, r22
    ; 34: MUL8 c1,c0
    emit_f6_mul8 r18, r19, r16
    ; 35: MUL8 c1,c1
    emit_f6_mul8 r18, r19, r18
    ; 36: MUL8 c1,c2
    emit_f6_mul8 r18, r19, r20
    ; 37: MUL8 c1,c3
    emit_f6_mul8 r18, r19, r22
    ; 38: MUL8 c2,c0
    emit_f6_mul8 r20, r21, r16
    ; 39: MUL8 c2,c1
    emit_f6_mul8 r20, r21, r18
    ; 3A: MUL8 c2,c2
    emit_f6_mul8 r20, r21, r20
    ; 3B: MUL8 c2,c3
    emit_f6_mul8 r20, r21, r22
    ; 3C: MUL8 c3,c0
    emit_f6_mul8 r22, r23, r16
    ; 3D: MUL8 c3,c1
    emit_f6_mul8 r22, r23, r18
    ; 3E: MUL8 c3,c2
    emit_f6_mul8 r22, r23, r20
    ; 3F: MUL8 c3,c3
    emit_f6_mul8 r22, r23, r22
    ; 40: SEXT8 r0
    emit_f6_sext8 r8, r9
    ; 41: SEXT8 r1
    emit_f6_sext8 r10, r11
    ; 42: SEXT8 r2
    emit_f6_sext8 r12, r13
    ; 43: SEXT8 r3
    emit_f6_sext8 r14, r15
    ; 44: SEXT8 r4
    emit_f6_sext8 r16, r17
    ; 45: SEXT8 r5
    emit_f6_sext8 r18, r19
    ; 46: SEXT8 r6
    emit_f6_sext8 r20, r21
    ; 47: SEXT8 r7
    emit_f6_sext8 r22, r23
    ; 48: NEG16 r0
    emit_f6_neg16 r8, r9
    ; 49: NEG16 r1
    emit_f6_neg16 r10, r11
    ; 4A: NEG16 r2
    emit_f6_neg16 r12, r13
    ; 4B: NEG16 r3
    emit_f6_neg16 r14, r15
    ; 4C: NEG16 r4
    emit_f6_neg16 r16, r17
    ; 4D: NEG16 r5
    emit_f6_neg16 r18, r19
    ; 4E: NEG16 r6
    emit_f6_neg16 r20, r21
    ; 4F: NEG16 r7
    emit_f6_neg16 r22, r23
f6_table_end:
.if (f6_table_end - f6_table) != (2 * 0x50 * 4)
    .error "f6_table has incorrect size"
.endif

f7_table:
    ; F7: bounded five-word postincrement, 32-bit, and BOOL table
    ; 00: LD8U r0,[c0+]
    emit_f7_ld8u_post r8, r9, r16
    ; 01: LD8U r1,[c0+]
    emit_f7_ld8u_post r10, r11, r16
    ; 02: LD8U r2,[c0+]
    emit_f7_ld8u_post r12, r13, r16
    ; 03: LD8U r3,[c0+]
    emit_f7_ld8u_post r14, r15, r16
    ; 04: reserved LD8U r4,[c0+], destination aliases pointer
    emit_f7_invalid secondary_invalid_b_func
    ; 05: LD8U r5,[c0+]
    emit_f7_ld8u_post r18, r19, r16
    ; 06: LD8U r6,[c0+]
    emit_f7_ld8u_post r20, r21, r16
    ; 07: LD8U r7,[c0+]
    emit_f7_ld8u_post r22, r23, r16
    ; 08: LD8U r0,[c1+]
    emit_f7_ld8u_post r8, r9, r18
    ; 09: LD8U r1,[c1+]
    emit_f7_ld8u_post r10, r11, r18
    ; 0A: LD8U r2,[c1+]
    emit_f7_ld8u_post r12, r13, r18
    ; 0B: LD8U r3,[c1+]
    emit_f7_ld8u_post r14, r15, r18
    ; 0C: LD8U r4,[c1+]
    emit_f7_ld8u_post r16, r17, r18
    ; 0D: reserved LD8U r5,[c1+], destination aliases pointer
    emit_f7_invalid secondary_invalid_b_func
    ; 0E: LD8U r6,[c1+]
    emit_f7_ld8u_post r20, r21, r18
    ; 0F: LD8U r7,[c1+]
    emit_f7_ld8u_post r22, r23, r18
    ; 10: LD8U r0,[c2+]
    emit_f7_ld8u_post r8, r9, r20
    ; 11: LD8U r1,[c2+]
    emit_f7_ld8u_post r10, r11, r20
    ; 12: LD8U r2,[c2+]
    emit_f7_ld8u_post r12, r13, r20
    ; 13: LD8U r3,[c2+]
    emit_f7_ld8u_post r14, r15, r20
    ; 14: LD8U r4,[c2+]
    emit_f7_ld8u_post r16, r17, r20
    ; 15: LD8U r5,[c2+]
    emit_f7_ld8u_post r18, r19, r20
    ; 16: reserved LD8U r6,[c2+], destination aliases pointer
    emit_f7_invalid secondary_invalid_b_func
    ; 17: LD8U r7,[c2+]
    emit_f7_ld8u_post r22, r23, r20
    ; 18: LD8U r0,[c3+]
    emit_f7_ld8u_post r8, r9, r22
    ; 19: LD8U r1,[c3+]
    emit_f7_ld8u_post r10, r11, r22
    ; 1A: LD8U r2,[c3+]
    emit_f7_ld8u_post r12, r13, r22
    ; 1B: LD8U r3,[c3+]
    emit_f7_ld8u_post r14, r15, r22
    ; 1C: LD8U r4,[c3+]
    emit_f7_ld8u_post r16, r17, r22
    ; 1D: LD8U r5,[c3+]
    emit_f7_ld8u_post r18, r19, r22
    ; 1E: LD8U r6,[c3+]
    emit_f7_ld8u_post r20, r21, r22
    ; 1F: reserved LD8U r7,[c3+], destination aliases pointer
    emit_f7_invalid secondary_invalid_b_func
    ; 20: LD16 r0,[c0+]
    emit_f7_ld16_post r8, r9, r16
    ; 21: LD16 r1,[c0+]
    emit_f7_ld16_post r10, r11, r16
    ; 22: LD16 r2,[c0+]
    emit_f7_ld16_post r12, r13, r16
    ; 23: LD16 r3,[c0+]
    emit_f7_ld16_post r14, r15, r16
    ; 24: reserved LD16 r4,[c0+], destination aliases pointer
    emit_f7_invalid secondary_invalid_b_func
    ; 25: LD16 r5,[c0+]
    emit_f7_ld16_post r18, r19, r16
    ; 26: LD16 r6,[c0+]
    emit_f7_ld16_post r20, r21, r16
    ; 27: LD16 r7,[c0+]
    emit_f7_ld16_post r22, r23, r16
    ; 28: LD16 r0,[c1+]
    emit_f7_ld16_post r8, r9, r18
    ; 29: LD16 r1,[c1+]
    emit_f7_ld16_post r10, r11, r18
    ; 2A: LD16 r2,[c1+]
    emit_f7_ld16_post r12, r13, r18
    ; 2B: LD16 r3,[c1+]
    emit_f7_ld16_post r14, r15, r18
    ; 2C: LD16 r4,[c1+]
    emit_f7_ld16_post r16, r17, r18
    ; 2D: reserved LD16 r5,[c1+], destination aliases pointer
    emit_f7_invalid secondary_invalid_b_func
    ; 2E: LD16 r6,[c1+]
    emit_f7_ld16_post r20, r21, r18
    ; 2F: LD16 r7,[c1+]
    emit_f7_ld16_post r22, r23, r18
    ; 30: LD16 r0,[c2+]
    emit_f7_ld16_post r8, r9, r20
    ; 31: LD16 r1,[c2+]
    emit_f7_ld16_post r10, r11, r20
    ; 32: LD16 r2,[c2+]
    emit_f7_ld16_post r12, r13, r20
    ; 33: LD16 r3,[c2+]
    emit_f7_ld16_post r14, r15, r20
    ; 34: LD16 r4,[c2+]
    emit_f7_ld16_post r16, r17, r20
    ; 35: LD16 r5,[c2+]
    emit_f7_ld16_post r18, r19, r20
    ; 36: reserved LD16 r6,[c2+], destination aliases pointer
    emit_f7_invalid secondary_invalid_b_func
    ; 37: LD16 r7,[c2+]
    emit_f7_ld16_post r22, r23, r20
    ; 38: LD16 r0,[c3+]
    emit_f7_ld16_post r8, r9, r22
    ; 39: LD16 r1,[c3+]
    emit_f7_ld16_post r10, r11, r22
    ; 3A: LD16 r2,[c3+]
    emit_f7_ld16_post r12, r13, r22
    ; 3B: LD16 r3,[c3+]
    emit_f7_ld16_post r14, r15, r22
    ; 3C: LD16 r4,[c3+]
    emit_f7_ld16_post r16, r17, r22
    ; 3D: LD16 r5,[c3+]
    emit_f7_ld16_post r18, r19, r22
    ; 3E: LD16 r6,[c3+]
    emit_f7_ld16_post r20, r21, r22
    ; 3F: reserved LD16 r7,[c3+], destination aliases pointer
    emit_f7_invalid secondary_invalid_b_func
    ; 40: ST16 [c0+],r0
    emit_f7_st16_post r16, r8, r9
    ; 41: ST16 [c0+],r1
    emit_f7_st16_post r16, r10, r11
    ; 42: ST16 [c0+],r2
    emit_f7_st16_post r16, r12, r13
    ; 43: ST16 [c0+],r3
    emit_f7_st16_post r16, r14, r15
    ; 44: ST16 [c0+],r4
    emit_f7_st16_post r16, r16, r17
    ; 45: ST16 [c0+],r5
    emit_f7_st16_post r16, r18, r19
    ; 46: ST16 [c0+],r6
    emit_f7_st16_post r16, r20, r21
    ; 47: ST16 [c0+],r7
    emit_f7_st16_post r16, r22, r23
    ; 48: ST16 [c1+],r0
    emit_f7_st16_post r18, r8, r9
    ; 49: ST16 [c1+],r1
    emit_f7_st16_post r18, r10, r11
    ; 4A: ST16 [c1+],r2
    emit_f7_st16_post r18, r12, r13
    ; 4B: ST16 [c1+],r3
    emit_f7_st16_post r18, r14, r15
    ; 4C: ST16 [c1+],r4
    emit_f7_st16_post r18, r16, r17
    ; 4D: ST16 [c1+],r5
    emit_f7_st16_post r18, r18, r19
    ; 4E: ST16 [c1+],r6
    emit_f7_st16_post r18, r20, r21
    ; 4F: ST16 [c1+],r7
    emit_f7_st16_post r18, r22, r23
    ; 50: ST16 [c2+],r0
    emit_f7_st16_post r20, r8, r9
    ; 51: ST16 [c2+],r1
    emit_f7_st16_post r20, r10, r11
    ; 52: ST16 [c2+],r2
    emit_f7_st16_post r20, r12, r13
    ; 53: ST16 [c2+],r3
    emit_f7_st16_post r20, r14, r15
    ; 54: ST16 [c2+],r4
    emit_f7_st16_post r20, r16, r17
    ; 55: ST16 [c2+],r5
    emit_f7_st16_post r20, r18, r19
    ; 56: ST16 [c2+],r6
    emit_f7_st16_post r20, r20, r21
    ; 57: ST16 [c2+],r7
    emit_f7_st16_post r20, r22, r23
    ; 58: ST16 [c3+],r0
    emit_f7_st16_post r22, r8, r9
    ; 59: ST16 [c3+],r1
    emit_f7_st16_post r22, r10, r11
    ; 5A: ST16 [c3+],r2
    emit_f7_st16_post r22, r12, r13
    ; 5B: ST16 [c3+],r3
    emit_f7_st16_post r22, r14, r15
    ; 5C: ST16 [c3+],r4
    emit_f7_st16_post r22, r16, r17
    ; 5D: ST16 [c3+],r5
    emit_f7_st16_post r22, r18, r19
    ; 5E: ST16 [c3+],r6
    emit_f7_st16_post r22, r20, r21
    ; 5F: ST16 [c3+],r7
    emit_f7_st16_post r22, r22, r23
    ; 60: ADD32 q0,q0
    emit_f7_add32 r8, r9, r10, r11, r8, r9, r10, r11
    ; 61: ADD32 q0,q1
    emit_f7_add32 r8, r9, r10, r11, r12, r13, r14, r15
    ; 62: ADD32 q0,q2
    emit_f7_add32 r8, r9, r10, r11, r16, r17, r18, r19
    ; 63: ADD32 q0,q3
    emit_f7_add32 r8, r9, r10, r11, r20, r21, r22, r23
    ; 64: ADD32 q1,q0
    emit_f7_add32 r12, r13, r14, r15, r8, r9, r10, r11
    ; 65: ADD32 q1,q1
    emit_f7_add32 r12, r13, r14, r15, r12, r13, r14, r15
    ; 66: ADD32 q1,q2
    emit_f7_add32 r12, r13, r14, r15, r16, r17, r18, r19
    ; 67: ADD32 q1,q3
    emit_f7_add32 r12, r13, r14, r15, r20, r21, r22, r23
    ; 68: ADD32 q2,q0
    emit_f7_add32 r16, r17, r18, r19, r8, r9, r10, r11
    ; 69: ADD32 q2,q1
    emit_f7_add32 r16, r17, r18, r19, r12, r13, r14, r15
    ; 6A: ADD32 q2,q2
    emit_f7_add32 r16, r17, r18, r19, r16, r17, r18, r19
    ; 6B: ADD32 q2,q3
    emit_f7_add32 r16, r17, r18, r19, r20, r21, r22, r23
    ; 6C: ADD32 q3,q0
    emit_f7_add32 r20, r21, r22, r23, r8, r9, r10, r11
    ; 6D: ADD32 q3,q1
    emit_f7_add32 r20, r21, r22, r23, r12, r13, r14, r15
    ; 6E: ADD32 q3,q2
    emit_f7_add32 r20, r21, r22, r23, r16, r17, r18, r19
    ; 6F: ADD32 q3,q3
    emit_f7_add32 r20, r21, r22, r23, r20, r21, r22, r23
    ; 70: SUB32 q0,q0
    emit_f7_sub32 r8, r9, r10, r11, r8, r9, r10, r11
    ; 71: SUB32 q0,q1
    emit_f7_sub32 r8, r9, r10, r11, r12, r13, r14, r15
    ; 72: SUB32 q0,q2
    emit_f7_sub32 r8, r9, r10, r11, r16, r17, r18, r19
    ; 73: SUB32 q0,q3
    emit_f7_sub32 r8, r9, r10, r11, r20, r21, r22, r23
    ; 74: SUB32 q1,q0
    emit_f7_sub32 r12, r13, r14, r15, r8, r9, r10, r11
    ; 75: SUB32 q1,q1
    emit_f7_sub32 r12, r13, r14, r15, r12, r13, r14, r15
    ; 76: SUB32 q1,q2
    emit_f7_sub32 r12, r13, r14, r15, r16, r17, r18, r19
    ; 77: SUB32 q1,q3
    emit_f7_sub32 r12, r13, r14, r15, r20, r21, r22, r23
    ; 78: SUB32 q2,q0
    emit_f7_sub32 r16, r17, r18, r19, r8, r9, r10, r11
    ; 79: SUB32 q2,q1
    emit_f7_sub32 r16, r17, r18, r19, r12, r13, r14, r15
    ; 7A: SUB32 q2,q2
    emit_f7_sub32 r16, r17, r18, r19, r16, r17, r18, r19
    ; 7B: SUB32 q2,q3
    emit_f7_sub32 r16, r17, r18, r19, r20, r21, r22, r23
    ; 7C: SUB32 q3,q0
    emit_f7_sub32 r20, r21, r22, r23, r8, r9, r10, r11
    ; 7D: SUB32 q3,q1
    emit_f7_sub32 r20, r21, r22, r23, r12, r13, r14, r15
    ; 7E: SUB32 q3,q2
    emit_f7_sub32 r20, r21, r22, r23, r16, r17, r18, r19
    ; 7F: SUB32 q3,q3
    emit_f7_sub32 r20, r21, r22, r23, r20, r21, r22, r23
    ; 80: LSR32.1 q0
    emit_f7_lsr32 r8, r9, r10, r11
    ; 81: LSR32.1 q1
    emit_f7_lsr32 r12, r13, r14, r15
    ; 82: LSR32.1 q2
    emit_f7_lsr32 r16, r17, r18, r19
    ; 83: LSR32.1 q3
    emit_f7_lsr32 r20, r21, r22, r23
    ; 84: ASR32.1 q0
    emit_f7_asr32 r8, r9, r10, r11
    ; 85: ASR32.1 q1
    emit_f7_asr32 r12, r13, r14, r15
    ; 86: ASR32.1 q2
    emit_f7_asr32 r16, r17, r18, r19
    ; 87: ASR32.1 q3
    emit_f7_asr32 r20, r21, r22, r23
    ; 88: BOOL r0
    emit_f7_bool r8, r9
    ; 89: BOOL r1
    emit_f7_bool r10, r11
    ; 8A: BOOL r2
    emit_f7_bool r12, r13
    ; 8B: BOOL r3
    emit_f7_bool r14, r15
    ; 8C: BOOL r4
    emit_f7_bool r16, r17
    ; 8D: BOOL r5
    emit_f7_bool r18, r19
    ; 8E: BOOL r6
    emit_f7_bool r20, r21
    ; 8F: BOOL r7
    emit_f7_bool r22, r23
f7_table_end:
.if (f7_table_end - f7_table) != (2 * 0x90 * 5)
    .error "f7_table has incorrect size"
.endif

; Cluster C serves F7/F8 and the late forwarding/shared-body pages.
cluster_c_start:
cluster_c_tail_17_delay_1:
    nop
cluster_c_tail_17:
    dispatch_reverse

cluster_c_tail_18_delay_2:
    rjmp cluster_c_tail_18
cluster_c_tail_18_delay_1:
    nop
cluster_c_tail:
cmov_tail:
cluster_c_tail_18:
    dispatch
cluster_c_end:
.if (cluster_c_end - cluster_c_start) != 46
    .error "secondary cadence Cluster C must occupy 23 AVR words"
.endif

; F8 contains its exact CSET slots. FA and FE retain final-width forwarding
; placeholders. FB-FD validate secondary < 0x80 in the shared condition gate,
; then use bits 5:0 to select one of the 64 two-word MOVW entries below.
secondary_tables_after_cluster_c:
secondary_unimplemented_c_func:
    rjmp secondary_unimplemented_b_func

f8_table:
    ; F8: bounded five-word simple-condition materialization table
    ; 00: CSET.EQ r0
    emit_f8_cset r8, r9, SREG_Z, sbic
    ; 01: CSET.EQ r1
    emit_f8_cset r10, r11, SREG_Z, sbic
    ; 02: CSET.EQ r2
    emit_f8_cset r12, r13, SREG_Z, sbic
    ; 03: CSET.EQ r3
    emit_f8_cset r14, r15, SREG_Z, sbic
    ; 04: CSET.EQ r4
    emit_f8_cset r16, r17, SREG_Z, sbic
    ; 05: CSET.EQ r5
    emit_f8_cset r18, r19, SREG_Z, sbic
    ; 06: CSET.EQ r6
    emit_f8_cset r20, r21, SREG_Z, sbic
    ; 07: CSET.EQ r7
    emit_f8_cset r22, r23, SREG_Z, sbic
    ; 08: CSET.NE r0
    emit_f8_cset r8, r9, SREG_Z, sbis
    ; 09: CSET.NE r1
    emit_f8_cset r10, r11, SREG_Z, sbis
    ; 0A: CSET.NE r2
    emit_f8_cset r12, r13, SREG_Z, sbis
    ; 0B: CSET.NE r3
    emit_f8_cset r14, r15, SREG_Z, sbis
    ; 0C: CSET.NE r4
    emit_f8_cset r16, r17, SREG_Z, sbis
    ; 0D: CSET.NE r5
    emit_f8_cset r18, r19, SREG_Z, sbis
    ; 0E: CSET.NE r6
    emit_f8_cset r20, r21, SREG_Z, sbis
    ; 0F: CSET.NE r7
    emit_f8_cset r22, r23, SREG_Z, sbis
    ; 10: CSET.ULT r0
    emit_f8_cset r8, r9, SREG_C, sbic
    ; 11: CSET.ULT r1
    emit_f8_cset r10, r11, SREG_C, sbic
    ; 12: CSET.ULT r2
    emit_f8_cset r12, r13, SREG_C, sbic
    ; 13: CSET.ULT r3
    emit_f8_cset r14, r15, SREG_C, sbic
    ; 14: CSET.ULT r4
    emit_f8_cset r16, r17, SREG_C, sbic
    ; 15: CSET.ULT r5
    emit_f8_cset r18, r19, SREG_C, sbic
    ; 16: CSET.ULT r6
    emit_f8_cset r20, r21, SREG_C, sbic
    ; 17: CSET.ULT r7
    emit_f8_cset r22, r23, SREG_C, sbic
    ; 18: CSET.UGE r0
    emit_f8_cset r8, r9, SREG_C, sbis
    ; 19: CSET.UGE r1
    emit_f8_cset r10, r11, SREG_C, sbis
    ; 1A: CSET.UGE r2
    emit_f8_cset r12, r13, SREG_C, sbis
    ; 1B: CSET.UGE r3
    emit_f8_cset r14, r15, SREG_C, sbis
    ; 1C: CSET.UGE r4
    emit_f8_cset r16, r17, SREG_C, sbis
    ; 1D: CSET.UGE r5
    emit_f8_cset r18, r19, SREG_C, sbis
    ; 1E: CSET.UGE r6
    emit_f8_cset r20, r21, SREG_C, sbis
    ; 1F: CSET.UGE r7
    emit_f8_cset r22, r23, SREG_C, sbis
    ; 20: CSET.SLT r0
    emit_f8_cset r8, r9, SREG_S, sbic
    ; 21: CSET.SLT r1
    emit_f8_cset r10, r11, SREG_S, sbic
    ; 22: CSET.SLT r2
    emit_f8_cset r12, r13, SREG_S, sbic
    ; 23: CSET.SLT r3
    emit_f8_cset r14, r15, SREG_S, sbic
    ; 24: CSET.SLT r4
    emit_f8_cset r16, r17, SREG_S, sbic
    ; 25: CSET.SLT r5
    emit_f8_cset r18, r19, SREG_S, sbic
    ; 26: CSET.SLT r6
    emit_f8_cset r20, r21, SREG_S, sbic
    ; 27: CSET.SLT r7
    emit_f8_cset r22, r23, SREG_S, sbic
    ; 28: CSET.SGE r0
    emit_f8_cset r8, r9, SREG_S, sbis
    ; 29: CSET.SGE r1
    emit_f8_cset r10, r11, SREG_S, sbis
    ; 2A: CSET.SGE r2
    emit_f8_cset r12, r13, SREG_S, sbis
    ; 2B: CSET.SGE r3
    emit_f8_cset r14, r15, SREG_S, sbis
    ; 2C: CSET.SGE r4
    emit_f8_cset r16, r17, SREG_S, sbis
    ; 2D: CSET.SGE r5
    emit_f8_cset r18, r19, SREG_S, sbis
    ; 2E: CSET.SGE r6
    emit_f8_cset r20, r21, SREG_S, sbis
    ; 2F: CSET.SGE r7
    emit_f8_cset r22, r23, SREG_S, sbis
f8_table_end:
.if (f8_table_end - f8_table) != (2 * 0x30 * 5)
    .error "f8_table has incorrect size"
.endif

emit_secondary_trap_table fa_forward_table, fa_forward_table_end, 0x30, 2, secondary_unimplemented_c_func

cmov_table:
    ; 00: CMOV r0,r0
    emit_cmov_entry r8, r8
    ; 01: CMOV r0,r1
    emit_cmov_entry r8, r10
    ; 02: CMOV r0,r2
    emit_cmov_entry r8, r12
    ; 03: CMOV r0,r3
    emit_cmov_entry r8, r14
    ; 04: CMOV r0,r4
    emit_cmov_entry r8, r16
    ; 05: CMOV r0,r5
    emit_cmov_entry r8, r18
    ; 06: CMOV r0,r6
    emit_cmov_entry r8, r20
    ; 07: CMOV r0,r7
    emit_cmov_entry r8, r22
    ; 08: CMOV r1,r0
    emit_cmov_entry r10, r8
    ; 09: CMOV r1,r1
    emit_cmov_entry r10, r10
    ; 0A: CMOV r1,r2
    emit_cmov_entry r10, r12
    ; 0B: CMOV r1,r3
    emit_cmov_entry r10, r14
    ; 0C: CMOV r1,r4
    emit_cmov_entry r10, r16
    ; 0D: CMOV r1,r5
    emit_cmov_entry r10, r18
    ; 0E: CMOV r1,r6
    emit_cmov_entry r10, r20
    ; 0F: CMOV r1,r7
    emit_cmov_entry r10, r22
    ; 10: CMOV r2,r0
    emit_cmov_entry r12, r8
    ; 11: CMOV r2,r1
    emit_cmov_entry r12, r10
    ; 12: CMOV r2,r2
    emit_cmov_entry r12, r12
    ; 13: CMOV r2,r3
    emit_cmov_entry r12, r14
    ; 14: CMOV r2,r4
    emit_cmov_entry r12, r16
    ; 15: CMOV r2,r5
    emit_cmov_entry r12, r18
    ; 16: CMOV r2,r6
    emit_cmov_entry r12, r20
    ; 17: CMOV r2,r7
    emit_cmov_entry r12, r22
    ; 18: CMOV r3,r0
    emit_cmov_entry r14, r8
    ; 19: CMOV r3,r1
    emit_cmov_entry r14, r10
    ; 1A: CMOV r3,r2
    emit_cmov_entry r14, r12
    ; 1B: CMOV r3,r3
    emit_cmov_entry r14, r14
    ; 1C: CMOV r3,r4
    emit_cmov_entry r14, r16
    ; 1D: CMOV r3,r5
    emit_cmov_entry r14, r18
    ; 1E: CMOV r3,r6
    emit_cmov_entry r14, r20
    ; 1F: CMOV r3,r7
    emit_cmov_entry r14, r22
    ; 20: CMOV r4,r0
    emit_cmov_entry r16, r8
    ; 21: CMOV r4,r1
    emit_cmov_entry r16, r10
    ; 22: CMOV r4,r2
    emit_cmov_entry r16, r12
    ; 23: CMOV r4,r3
    emit_cmov_entry r16, r14
    ; 24: CMOV r4,r4
    emit_cmov_entry r16, r16
    ; 25: CMOV r4,r5
    emit_cmov_entry r16, r18
    ; 26: CMOV r4,r6
    emit_cmov_entry r16, r20
    ; 27: CMOV r4,r7
    emit_cmov_entry r16, r22
    ; 28: CMOV r5,r0
    emit_cmov_entry r18, r8
    ; 29: CMOV r5,r1
    emit_cmov_entry r18, r10
    ; 2A: CMOV r5,r2
    emit_cmov_entry r18, r12
    ; 2B: CMOV r5,r3
    emit_cmov_entry r18, r14
    ; 2C: CMOV r5,r4
    emit_cmov_entry r18, r16
    ; 2D: CMOV r5,r5
    emit_cmov_entry r18, r18
    ; 2E: CMOV r5,r6
    emit_cmov_entry r18, r20
    ; 2F: CMOV r5,r7
    emit_cmov_entry r18, r22
    ; 30: CMOV r6,r0
    emit_cmov_entry r20, r8
    ; 31: CMOV r6,r1
    emit_cmov_entry r20, r10
    ; 32: CMOV r6,r2
    emit_cmov_entry r20, r12
    ; 33: CMOV r6,r3
    emit_cmov_entry r20, r14
    ; 34: CMOV r6,r4
    emit_cmov_entry r20, r16
    ; 35: CMOV r6,r5
    emit_cmov_entry r20, r18
    ; 36: CMOV r6,r6
    emit_cmov_entry r20, r20
    ; 37: CMOV r6,r7
    emit_cmov_entry r20, r22
    ; 38: CMOV r7,r0
    emit_cmov_entry r22, r8
    ; 39: CMOV r7,r1
    emit_cmov_entry r22, r10
    ; 3A: CMOV r7,r2
    emit_cmov_entry r22, r12
    ; 3B: CMOV r7,r3
    emit_cmov_entry r22, r14
    ; 3C: CMOV r7,r4
    emit_cmov_entry r22, r16
    ; 3D: CMOV r7,r5
    emit_cmov_entry r22, r18
    ; 3E: CMOV r7,r6
    emit_cmov_entry r22, r20
    ; 3F: CMOV r7,r7
    emit_cmov_entry r22, r22
cmov_table_end:
.if (cmov_table_end - cmov_table) != (2 * 0x40 * 2)
    .error "cmov_table has incorrect size"
.endif

emit_secondary_trap_table fe_forward_table, fe_forward_table_end, 0x40, 2, secondary_unimplemented_c_func

; The active secondary executable tables must occupy exactly 7,276 bytes.
.if ((f0_veneer_table_end - f0_veneer_table) + (f1_table_end - f1_table) + (f2_table_end - f2_table) + (f3_table_end - f3_table) + (f4_table_end - f4_table) + (f5_table_end - f5_table) + (f6_table_end - f6_table) + (f7_table_end - f7_table) + (f8_table_end - f8_table) + (fa_forward_table_end - fa_forward_table) + (cmov_table_end - cmov_table) + (fe_forward_table_end - fe_forward_table)) != 7276
    .error "secondary executable tables must occupy exactly 7276 bytes"
.endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; External-flash bytecode stream positioning
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Seek to the current 24-bit image-relative VM PC and prime one byte. The
; physical W25Q128 address is (data_page_data << 8) + VM_PC, modulo 24 bits.
fx_seek_to_pc:
    fx_disable
    ldi  r30, SFC_READ
    fx_enable
    out  SPDR, r30

    lds  r26, data_page_data+0
    add  r26, VM_PCM
    lds  r27, data_page_data+1
    adc  r27, VM_PCH

    rcall fx_seek_delay_10
    out  SPDR, r27
    rcall fx_seek_delay_17
    out  SPDR, r26
    rcall fx_seek_delay_17
    out  SPDR, VM_PCL
    rcall fx_seek_delay_17
    out  SPDR, ZERO

    ; Wait 16 cycles: 2 + 10 + 4 from RET. The addressed byte is ready in
    ; SPDR when this routine returns.
    delay_2
    rcall fx_seek_delay_10
    ret

; Fixed delay ladder. Each name denotes total cycles from the calling RCALL
; through the returning RET, matching the cadence used by the SPI pipeline.
; Entries 7 and 9-14 cover the operand-fetch slack used below without
; repeated inline delay sequences. No current path requires an 8-cycle call.
fx_seek_delay_17:
    nop
fx_seek_delay_16:
    delay_2
fx_seek_delay_14:
    nop
fx_seek_delay_13:
    nop
fx_seek_delay_12:
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
    ; Establish the immutable interpreter constants before any helper runs.
    clr  ZERO
    ldi  r26, 1
    mov  ONE, r26
    ldi  r26, 4
    mov  FOUR, r26

    ldi  r26, lo8(0x0100)
    ldi  r27, hi8(0x0100)
startup_clear_ram_loop:
    st   X+, ZERO
    cpi  r26, lo8(RAMEND + 1)
    brne startup_clear_ram_loop
    cpi  r27, hi8(RAMEND + 1)
    brne startup_clear_ram_loop

    ; Initialize persistent architectural and startup state. VM_FLAGS lives
    ; in low-I/O GPIOR0; VM PC is loaded from the image header below.
    ldi  VM_SPL, lo8(VM_SP_INITIAL_VALUE)
    ldi  VM_SPH, hi8(VM_SP_INITIAL_VALUE)
    out  VM_FLAGS, ZERO

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

    ; entryPoint, packed little-endian 24-bit image-relative address.
    rcall fx_startup_read_byte
    mov  VM_PCL, r30
    rcall fx_startup_read_byte
    mov  VM_PCM, r30
    rcall fx_startup_read_byte
    mov  VM_PCH, r30

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

    ; VM_PCH:VM_PCM:VM_PCL already contains the image entry point. Seek to
    ; it, consume the first primary opcode, and start the following transfer.
    rcall fx_seek_to_pc
    in   PRIMARY_OPCODE, SPDR
    out  SPDR, ZERO
    sei
    delay_1
    mul  PRIMARY_OPCODE, FOUR
    movw r30, r0
    subi r31, hi8(-(pm(primary_table)))
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
