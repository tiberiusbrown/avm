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
; will eventually end with RJMP to a shared cadence tail; a longer primary
; handler may use its fourth word to forward to an out-of-line continuation.
; For this migration skeleton every architecturally defined opcode traps as
; unimplemented and every reserved opcode traps as invalid.

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

.org PRIMARY_TABLE_ORG
.global primary_table
.global abvm_interp
primary_table:
abvm_interp:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x00-0x0F: MOV cD,cS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_stub primary_00, unimplemented_instruction_func
emit_primary_stub primary_01, unimplemented_instruction_func
emit_primary_stub primary_02, unimplemented_instruction_func
emit_primary_stub primary_03, unimplemented_instruction_func
emit_primary_stub primary_04, unimplemented_instruction_func
emit_primary_stub primary_05, unimplemented_instruction_func
emit_primary_stub primary_06, unimplemented_instruction_func
emit_primary_stub primary_07, unimplemented_instruction_func
emit_primary_stub primary_08, unimplemented_instruction_func
emit_primary_stub primary_09, unimplemented_instruction_func
emit_primary_stub primary_0A, unimplemented_instruction_func
emit_primary_stub primary_0B, unimplemented_instruction_func
emit_primary_stub primary_0C, unimplemented_instruction_func
emit_primary_stub primary_0D, unimplemented_instruction_func
emit_primary_stub primary_0E, unimplemented_instruction_func
emit_primary_stub primary_0F, unimplemented_instruction_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x10-0x1F: ADD cD,cS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_stub primary_10, unimplemented_instruction_func
emit_primary_stub primary_11, unimplemented_instruction_func
emit_primary_stub primary_12, unimplemented_instruction_func
emit_primary_stub primary_13, unimplemented_instruction_func
emit_primary_stub primary_14, unimplemented_instruction_func
emit_primary_stub primary_15, unimplemented_instruction_func
emit_primary_stub primary_16, unimplemented_instruction_func
emit_primary_stub primary_17, unimplemented_instruction_func
emit_primary_stub primary_18, unimplemented_instruction_func
emit_primary_stub primary_19, unimplemented_instruction_func
emit_primary_stub primary_1A, unimplemented_instruction_func
emit_primary_stub primary_1B, unimplemented_instruction_func
emit_primary_stub primary_1C, unimplemented_instruction_func
emit_primary_stub primary_1D, unimplemented_instruction_func
emit_primary_stub primary_1E, unimplemented_instruction_func
emit_primary_stub primary_1F, unimplemented_instruction_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x20-0x2F: SUB cD,cS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_stub primary_20, unimplemented_instruction_func
emit_primary_stub primary_21, unimplemented_instruction_func
emit_primary_stub primary_22, unimplemented_instruction_func
emit_primary_stub primary_23, unimplemented_instruction_func
emit_primary_stub primary_24, unimplemented_instruction_func
emit_primary_stub primary_25, unimplemented_instruction_func
emit_primary_stub primary_26, unimplemented_instruction_func
emit_primary_stub primary_27, unimplemented_instruction_func
emit_primary_stub primary_28, unimplemented_instruction_func
emit_primary_stub primary_29, unimplemented_instruction_func
emit_primary_stub primary_2A, unimplemented_instruction_func
emit_primary_stub primary_2B, unimplemented_instruction_func
emit_primary_stub primary_2C, unimplemented_instruction_func
emit_primary_stub primary_2D, unimplemented_instruction_func
emit_primary_stub primary_2E, unimplemented_instruction_func
emit_primary_stub primary_2F, unimplemented_instruction_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x30-0x3F: CMP cL,cR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_stub primary_30, unimplemented_instruction_func
emit_primary_stub primary_31, unimplemented_instruction_func
emit_primary_stub primary_32, unimplemented_instruction_func
emit_primary_stub primary_33, unimplemented_instruction_func
emit_primary_stub primary_34, unimplemented_instruction_func
emit_primary_stub primary_35, unimplemented_instruction_func
emit_primary_stub primary_36, unimplemented_instruction_func
emit_primary_stub primary_37, unimplemented_instruction_func
emit_primary_stub primary_38, unimplemented_instruction_func
emit_primary_stub primary_39, unimplemented_instruction_func
emit_primary_stub primary_3A, unimplemented_instruction_func
emit_primary_stub primary_3B, unimplemented_instruction_func
emit_primary_stub primary_3C, unimplemented_instruction_func
emit_primary_stub primary_3D, unimplemented_instruction_func
emit_primary_stub primary_3E, unimplemented_instruction_func
emit_primary_stub primary_3F, unimplemented_instruction_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x40-0x4F: LD8U cD,[cA]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_stub primary_40, unimplemented_instruction_func
emit_primary_stub primary_41, unimplemented_instruction_func
emit_primary_stub primary_42, unimplemented_instruction_func
emit_primary_stub primary_43, unimplemented_instruction_func
emit_primary_stub primary_44, unimplemented_instruction_func
emit_primary_stub primary_45, unimplemented_instruction_func
emit_primary_stub primary_46, unimplemented_instruction_func
emit_primary_stub primary_47, unimplemented_instruction_func
emit_primary_stub primary_48, unimplemented_instruction_func
emit_primary_stub primary_49, unimplemented_instruction_func
emit_primary_stub primary_4A, unimplemented_instruction_func
emit_primary_stub primary_4B, unimplemented_instruction_func
emit_primary_stub primary_4C, unimplemented_instruction_func
emit_primary_stub primary_4D, unimplemented_instruction_func
emit_primary_stub primary_4E, unimplemented_instruction_func
emit_primary_stub primary_4F, unimplemented_instruction_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x50-0x5F: ST8 [cA],cS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_stub primary_50, unimplemented_instruction_func
emit_primary_stub primary_51, unimplemented_instruction_func
emit_primary_stub primary_52, unimplemented_instruction_func
emit_primary_stub primary_53, unimplemented_instruction_func
emit_primary_stub primary_54, unimplemented_instruction_func
emit_primary_stub primary_55, unimplemented_instruction_func
emit_primary_stub primary_56, unimplemented_instruction_func
emit_primary_stub primary_57, unimplemented_instruction_func
emit_primary_stub primary_58, unimplemented_instruction_func
emit_primary_stub primary_59, unimplemented_instruction_func
emit_primary_stub primary_5A, unimplemented_instruction_func
emit_primary_stub primary_5B, unimplemented_instruction_func
emit_primary_stub primary_5C, unimplemented_instruction_func
emit_primary_stub primary_5D, unimplemented_instruction_func
emit_primary_stub primary_5E, unimplemented_instruction_func
emit_primary_stub primary_5F, unimplemented_instruction_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x60-0x6F: LD16 cD,[cA]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_stub primary_60, unimplemented_instruction_func
emit_primary_stub primary_61, unimplemented_instruction_func
emit_primary_stub primary_62, unimplemented_instruction_func
emit_primary_stub primary_63, unimplemented_instruction_func
emit_primary_stub primary_64, unimplemented_instruction_func
emit_primary_stub primary_65, unimplemented_instruction_func
emit_primary_stub primary_66, unimplemented_instruction_func
emit_primary_stub primary_67, unimplemented_instruction_func
emit_primary_stub primary_68, unimplemented_instruction_func
emit_primary_stub primary_69, unimplemented_instruction_func
emit_primary_stub primary_6A, unimplemented_instruction_func
emit_primary_stub primary_6B, unimplemented_instruction_func
emit_primary_stub primary_6C, unimplemented_instruction_func
emit_primary_stub primary_6D, unimplemented_instruction_func
emit_primary_stub primary_6E, unimplemented_instruction_func
emit_primary_stub primary_6F, unimplemented_instruction_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x70-0x7F: ST16 [cA],cS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_stub primary_70, unimplemented_instruction_func
emit_primary_stub primary_71, unimplemented_instruction_func
emit_primary_stub primary_72, unimplemented_instruction_func
emit_primary_stub primary_73, unimplemented_instruction_func
emit_primary_stub primary_74, unimplemented_instruction_func
emit_primary_stub primary_75, unimplemented_instruction_func
emit_primary_stub primary_76, unimplemented_instruction_func
emit_primary_stub primary_77, unimplemented_instruction_func
emit_primary_stub primary_78, unimplemented_instruction_func
emit_primary_stub primary_79, unimplemented_instruction_func
emit_primary_stub primary_7A, unimplemented_instruction_func
emit_primary_stub primary_7B, unimplemented_instruction_func
emit_primary_stub primary_7C, unimplemented_instruction_func
emit_primary_stub primary_7D, unimplemented_instruction_func
emit_primary_stub primary_7E, unimplemented_instruction_func
emit_primary_stub primary_7F, unimplemented_instruction_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x80-0x8F: AND cD,cS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_stub primary_80, unimplemented_instruction_func
emit_primary_stub primary_81, unimplemented_instruction_func
emit_primary_stub primary_82, unimplemented_instruction_func
emit_primary_stub primary_83, unimplemented_instruction_func
emit_primary_stub primary_84, unimplemented_instruction_func
emit_primary_stub primary_85, unimplemented_instruction_func
emit_primary_stub primary_86, unimplemented_instruction_func
emit_primary_stub primary_87, unimplemented_instruction_func
emit_primary_stub primary_88, unimplemented_instruction_func
emit_primary_stub primary_89, unimplemented_instruction_func
emit_primary_stub primary_8A, unimplemented_instruction_func
emit_primary_stub primary_8B, unimplemented_instruction_func
emit_primary_stub primary_8C, unimplemented_instruction_func
emit_primary_stub primary_8D, unimplemented_instruction_func
emit_primary_stub primary_8E, unimplemented_instruction_func
emit_primary_stub primary_8F, unimplemented_instruction_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0x90-0x9F: OR cD,cS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_stub primary_90, unimplemented_instruction_func
emit_primary_stub primary_91, unimplemented_instruction_func
emit_primary_stub primary_92, unimplemented_instruction_func
emit_primary_stub primary_93, unimplemented_instruction_func
emit_primary_stub primary_94, unimplemented_instruction_func
emit_primary_stub primary_95, unimplemented_instruction_func
emit_primary_stub primary_96, unimplemented_instruction_func
emit_primary_stub primary_97, unimplemented_instruction_func
emit_primary_stub primary_98, unimplemented_instruction_func
emit_primary_stub primary_99, unimplemented_instruction_func
emit_primary_stub primary_9A, unimplemented_instruction_func
emit_primary_stub primary_9B, unimplemented_instruction_func
emit_primary_stub primary_9C, unimplemented_instruction_func
emit_primary_stub primary_9D, unimplemented_instruction_func
emit_primary_stub primary_9E, unimplemented_instruction_func
emit_primary_stub primary_9F, unimplemented_instruction_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xA0-0xAF: XOR cD,cS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_stub primary_A0, unimplemented_instruction_func
emit_primary_stub primary_A1, unimplemented_instruction_func
emit_primary_stub primary_A2, unimplemented_instruction_func
emit_primary_stub primary_A3, unimplemented_instruction_func
emit_primary_stub primary_A4, unimplemented_instruction_func
emit_primary_stub primary_A5, unimplemented_instruction_func
emit_primary_stub primary_A6, unimplemented_instruction_func
emit_primary_stub primary_A7, unimplemented_instruction_func
emit_primary_stub primary_A8, unimplemented_instruction_func
emit_primary_stub primary_A9, unimplemented_instruction_func
emit_primary_stub primary_AA, unimplemented_instruction_func
emit_primary_stub primary_AB, unimplemented_instruction_func
emit_primary_stub primary_AC, unimplemented_instruction_func
emit_primary_stub primary_AD, unimplemented_instruction_func
emit_primary_stub primary_AE, unimplemented_instruction_func
emit_primary_stub primary_AF, unimplemented_instruction_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xB0-0xB7: PUSH16 rN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_stub primary_B0_push16_r0, unimplemented_instruction_func
emit_primary_stub primary_B1_push16_r1, unimplemented_instruction_func
emit_primary_stub primary_B2_push16_r2, unimplemented_instruction_func
emit_primary_stub primary_B3_push16_r3, unimplemented_instruction_func
emit_primary_stub primary_B4_push16_r4, unimplemented_instruction_func
emit_primary_stub primary_B5_push16_r5, unimplemented_instruction_func
emit_primary_stub primary_B6_push16_r6, unimplemented_instruction_func
emit_primary_stub primary_B7_push16_r7, unimplemented_instruction_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xB8-0xBF: POP16 rN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_stub primary_B8_pop16_r0, unimplemented_instruction_func
emit_primary_stub primary_B9_pop16_r1, unimplemented_instruction_func
emit_primary_stub primary_BA_pop16_r2, unimplemented_instruction_func
emit_primary_stub primary_BB_pop16_r3, unimplemented_instruction_func
emit_primary_stub primary_BC_pop16_r4, unimplemented_instruction_func
emit_primary_stub primary_BD_pop16_r5, unimplemented_instruction_func
emit_primary_stub primary_BE_pop16_r6, unimplemented_instruction_func
emit_primary_stub primary_BF_pop16_r7, unimplemented_instruction_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xC0-0xC3: LDI8 cD,imm8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_stub primary_C0_ldi8_c0, unimplemented_instruction_func
emit_primary_stub primary_C1_ldi8_c1, unimplemented_instruction_func
emit_primary_stub primary_C2_ldi8_c2, unimplemented_instruction_func
emit_primary_stub primary_C3_ldi8_c3, unimplemented_instruction_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xC4-0xC7: LDI16 cD,imm16
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_stub primary_C4_ldi16_c0, unimplemented_instruction_func
emit_primary_stub primary_C5_ldi16_c1, unimplemented_instruction_func
emit_primary_stub primary_C6_ldi16_c2, unimplemented_instruction_func
emit_primary_stub primary_C7_ldi16_c3, unimplemented_instruction_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xC8-0xCB: ADDI.S8 cD,simm8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_stub primary_C8_addi_s8_c0, unimplemented_instruction_func
emit_primary_stub primary_C9_addi_s8_c1, unimplemented_instruction_func
emit_primary_stub primary_CA_addi_s8_c2, unimplemented_instruction_func
emit_primary_stub primary_CB_addi_s8_c3, unimplemented_instruction_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xCC-0xCF: CMPI.S8 cL,simm8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_stub primary_CC_cmpi_s8_c0, unimplemented_instruction_func
emit_primary_stub primary_CD_cmpi_s8_c1, unimplemented_instruction_func
emit_primary_stub primary_CE_cmpi_s8_c2, unimplemented_instruction_func
emit_primary_stub primary_CF_cmpi_s8_c3, unimplemented_instruction_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xD0-0xD3: conditional branches
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_stub primary_D0_conditional_branch, unimplemented_instruction_func
emit_primary_stub primary_D1_conditional_branch, unimplemented_instruction_func
emit_primary_stub primary_D2_conditional_branch, unimplemented_instruction_func
emit_primary_stub primary_D3_conditional_branch, unimplemented_instruction_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xD4-0xD7: relative control, ADJSP, and SYS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_stub primary_D4_jmp_rel8, unimplemented_instruction_func
emit_primary_stub primary_D5_call_rel8, unimplemented_instruction_func
emit_primary_stub primary_D6_adjsp, unimplemented_instruction_func

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

emit_primary_stub primary_E0_jmp16, unimplemented_instruction_func
emit_primary_stub primary_E1_call16, unimplemented_instruction_func
emit_primary_stub primary_E2_jmpf, unimplemented_instruction_func
emit_primary_stub primary_E3_callf, unimplemented_instruction_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xE4-0xE7: JMPP qN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_stub primary_E4_jmpp_q0, unimplemented_instruction_func
emit_primary_stub primary_E5_jmpp_q1, unimplemented_instruction_func
emit_primary_stub primary_E6_jmpp_q2, unimplemented_instruction_func
emit_primary_stub primary_E7_jmpp_q3, unimplemented_instruction_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xE8-0xEB: CALLP qN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_stub primary_E8_callp_q0, unimplemented_instruction_func
emit_primary_stub primary_E9_callp_q1, unimplemented_instruction_func
emit_primary_stub primary_EA_callp_q2, unimplemented_instruction_func
emit_primary_stub primary_EB_callp_q3, unimplemented_instruction_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xEC-0xEE: reserved
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_stub primary_EC_reserved, invalid_primary_instruction_func
emit_primary_stub primary_ED_reserved, invalid_primary_instruction_func
emit_primary_stub primary_EE_reserved, invalid_primary_instruction_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xEF: RET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_stub primary_EF_ret, unimplemented_instruction_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xF0-0xFE: secondary-page prefixes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_stub primary_F0_cold_veneer_page, unimplemented_instruction_func
emit_primary_stub primary_F1_dense_2word_page, unimplemented_instruction_func
emit_primary_stub primary_F2_dense_3word_page_a, unimplemented_instruction_func
emit_primary_stub primary_F3_dense_3word_page_b, unimplemented_instruction_func
emit_primary_stub primary_F4_dense_3word_page_c, unimplemented_instruction_func
emit_primary_stub primary_F5_dense_4word_page_a, unimplemented_instruction_func
emit_primary_stub primary_F6_dense_4word_page_b, unimplemented_instruction_func
emit_primary_stub primary_F7_dense_5word_page_a, unimplemented_instruction_func
emit_primary_stub primary_F8_simple_condition_page, unimplemented_instruction_func
emit_primary_stub primary_F9_runtime_bitwise_page, unimplemented_instruction_func
emit_primary_stub primary_FA_variable_shift_page, unimplemented_instruction_func
emit_primary_stub primary_FB_cmov_eq_ne_page, unimplemented_instruction_func
emit_primary_stub primary_FC_cmov_ult_uge_page, unimplemented_instruction_func
emit_primary_stub primary_FD_cmov_slt_sge_page, unimplemented_instruction_func
emit_primary_stub primary_FE_mul16_page, unimplemented_instruction_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0xFF: reserved
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emit_primary_stub primary_FF_reserved, invalid_primary_instruction_func

primary_table_end:
.if (primary_table_end - primary_table) != (256 * PRIMARY_STRIDE_BYTES)
    .error "primary dispatch table is not exactly 256 four-word slots"
.endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Post-table migration scaffolding
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Secondary decoders, condition gates, executable secondary tables, and all
; instruction bodies are intentionally absent. They should be added after the
; primary table in the single-section order defined by the implementation
; guide, without interior power-of-two alignment.

; Exact cadence tails retained as implementation scaffolding. Future handlers
; may RJMP to these labels once their native work and required padding are
; known. Additional copies will be placed according to the final layout plan.
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

; Defined encodings stop here until their handlers are implemented.
unimplemented_instruction_func:
    rjmp unimplemented_instruction_func

; Reserved primary encodings stop here.
invalid_primary_instruction_func:
    rjmp invalid_primary_instruction_func

; Reserved secondary encodings and unknown SYS services will use these shared
; traps once their decoders are introduced.
invalid_secondary_instruction_func:
    rjmp invalid_secondary_instruction_func

invalid_syscall_func:
    rjmp invalid_syscall_func

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
