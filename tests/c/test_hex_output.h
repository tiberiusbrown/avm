#ifndef AVM_TEST_HEX_OUTPUT_H
#define AVM_TEST_HEX_OUTPUT_H

#include <stdint.h>

extern void __avm_debug_putc(uint8_t value);

static inline void test_putc(char value)
{
    __avm_debug_putc((uint8_t)value);
}

static inline void test_puts(const char *text)
{
    while(*text != '\0')
        test_putc(*text++);
}

static inline char test_hex_digit(uint8_t value)
{
    value &= 0x0f;
    return (char)(value < 10 ? (uint8_t)('0' + value)
                             : (uint8_t)('A' + value - 10));
}

static inline void test_hex8(uint8_t value)
{
    test_putc(test_hex_digit((uint8_t)(value >> 4)));
    test_putc(test_hex_digit(value));
}

static inline void test_hex16(uint16_t value)
{
    test_hex8((uint8_t)(value >> 8));
    test_hex8((uint8_t)value);
}

static inline void test_hex32(uint32_t value)
{
    test_hex16((uint16_t)(value >> 16));
    test_hex16((uint16_t)value);
}

static inline void test_line16(const char *label, uint16_t value)
{
    test_puts(label);
    test_putc('=');
    test_hex16(value);
    test_putc('\n');
}

static inline void test_line32(const char *label, uint32_t value)
{
    test_puts(label);
    test_putc('=');
    test_hex32(value);
    test_putc('\n');
}

#endif
