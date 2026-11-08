#include <stdint.h>
#include "test_hex_output.h"

#define NOINLINE __attribute__((noinline))
#define CHECK(expr) do { if (!(expr)) return __LINE__; } while (0)

static volatile uint8_t bytes[272];
static volatile uint16_t words[48];
static volatile int8_t signed_bytes[64];
static volatile int8_t coefficients[16];

static NOINLINE uint16_t byte_window(uint16_t i)
{
    return (uint16_t)(bytes[i] + bytes[i + 1] + bytes[i + 15] + bytes[i + 223]);
}

static NOINLINE uint16_t word_window(uint16_t i)
{
    return (uint16_t)(words[i] + words[i + 1] + words[i + 7] + words[i + 15]);
}

static NOINLINE uint16_t negative_window(uint16_t i)
{
    return (uint16_t)(bytes[i - 32] + bytes[i - 1] + bytes[i] + bytes[i + 223]);
}

static NOINLINE void write_window(uint16_t i, uint16_t value)
{
    bytes[i] = (uint8_t)value;
    bytes[i + 1] = (uint8_t)(value + 1);
    bytes[i + 15] = (uint8_t)(value + 15);
    bytes[i + 223] = (uint8_t)(value + 223);
    words[i] = value;
    words[i + 1] = (uint16_t)(value + 257);
    words[i + 7] = (uint16_t)(value ^ 0x8000u);
    words[i + 15] = (uint16_t)~value;
}

/* A shared address must survive replacement of signed loads by the byte
 * multiply selector. Signed values also have independent full-word users. */
static NOINLINE int16_t signed_window(uint16_t i, int8_t coefficient)
{
    int16_t a = signed_bytes[i];
    int16_t b = signed_bytes[i + 1];
    int16_t c = signed_bytes[i + 7];
    int16_t d = signed_bytes[i + 15];
    return (int16_t)(a * coefficient + b * coefficient +
                     c * coefficient + d * coefficient + a);
}

/* The shared sample base crosses sixteen products and spilled coefficients,
 * matching the register pressure of an unrolled FIR loop. */
static NOINLINE uint16_t fir_windows(void)
{
#define COEFFICIENT(n) int16_t c##n = coefficients[n]
    COEFFICIENT(0); COEFFICIENT(1); COEFFICIENT(2); COEFFICIENT(3);
    COEFFICIENT(4); COEFFICIENT(5); COEFFICIENT(6); COEFFICIENT(7);
    COEFFICIENT(8); COEFFICIENT(9); COEFFICIENT(10); COEFFICIENT(11);
    COEFFICIENT(12); COEFFICIENT(13); COEFFICIENT(14); COEFFICIENT(15);
#undef COEFFICIENT
    uint16_t sum = 0;
    for (uint16_t i = 0; i < 16; ++i) {
#define PRODUCT(n) sum = (uint16_t)(sum + (uint16_t)(c##n * (int16_t)signed_bytes[i + n]))
        PRODUCT(0); PRODUCT(1); PRODUCT(2); PRODUCT(3);
        PRODUCT(4); PRODUCT(5); PRODUCT(6); PRODUCT(7);
        PRODUCT(8); PRODUCT(9); PRODUCT(10); PRODUCT(11);
        PRODUCT(12); PRODUCT(13); PRODUCT(14); PRODUCT(15);
#undef PRODUCT
    }
    return sum;
}

/* Separate calls keep the reference from sharing address calculations. */
static NOINLINE uint16_t read_byte(uint16_t i) { return bytes[i]; }
static NOINLINE uint16_t read_word(uint16_t i) { return words[i]; }
static NOINLINE int16_t read_signed(uint16_t i) { return signed_bytes[i]; }

int avm_test_main(void)
{
    for (uint16_t i = 0; i < 272; ++i)
        bytes[i] = (uint8_t)(i * 73u + 129u);
    for (uint16_t i = 0; i < 48; ++i)
        words[i] = (uint16_t)(i * 2011u + 0x807fu);
    for (uint16_t i = 0; i < 64; ++i)
        signed_bytes[i] = (int8_t)(i * 37u + 127u);
    for (uint16_t i = 0; i < 16; ++i)
        coefficients[i] = (int8_t)((int16_t)i * 9 - 67);

    uint16_t fir_expected = 0;
    for (uint16_t i = 0; i < 16; ++i)
        for (uint16_t tap = 0; tap < 16; ++tap)
            fir_expected = (uint16_t)(fir_expected +
                (uint16_t)(read_signed(i + tap) * (int16_t)coefficients[tap]));
    CHECK(fir_windows() == fir_expected);

    for (uint16_t i = 0; i < 16; ++i) {
        uint16_t expected = (uint16_t)(read_byte(i) + read_byte(i + 1) +
                                      read_byte(i + 15) + read_byte(i + 223));
        CHECK(byte_window(i) == expected);
        expected = (uint16_t)(read_word(i) + read_word(i + 1) +
                              read_word(i + 7) + read_word(i + 15));
        CHECK(word_window(i) == expected);
        uint16_t j = i + 32;
        expected = (uint16_t)(read_byte(j - 32) + read_byte(j - 1) +
                              read_byte(j) + read_byte(j + 223));
        CHECK(negative_window(j) == expected);
        int16_t a = read_signed(i);
        int16_t sum = (int16_t)(a + read_signed(i + 1) +
                                read_signed(i + 7) + read_signed(i + 15));
        CHECK(signed_window(i, -17) == (int16_t)(sum * -17 + a));

        uint16_t value = (uint16_t)(i * 4093u + 0xff80u);
        write_window(i, value);
        CHECK(read_byte(i) == (uint8_t)value);
        CHECK(read_byte(i + 1) == (uint8_t)(value + 1));
        CHECK(read_byte(i + 15) == (uint8_t)(value + 15));
        CHECK(read_byte(i + 223) == (uint8_t)(value + 223));
        CHECK(read_word(i) == value);
        CHECK(read_word(i + 1) == (uint16_t)(value + 257));
        CHECK(read_word(i + 7) == (uint16_t)(value ^ 0x8000u));
        CHECK(read_word(i + 15) == (uint16_t)~value);
    }
    test_puts("shared-data-bases=ok\n");
    return 0;
}
