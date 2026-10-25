#include <avm/pgmspace.h>
#include <stdint.h>

#include "test_hex_output.h"

#define CHECK(expression) do { if (!(expression)) return __LINE__; } while (0)
#define NOINLINE __attribute__((noinline))

struct program_record {
    const uint8_t AVM_PROGMEM *data;
    const char AVM_PROGMEM *title;
};

static const uint8_t AVM_PROGMEM data[] = {11, 37, 83, 149};
static const char AVM_PROGMEM title[] = "Tracks";
static const struct program_record AVM_PROGMEM records[256] = {
    [0] = {data, title},
    [127] = {data + 1, title + 1},
    [128] = {data + 2, title + 2},
    [255] = {data + 3, title + 3},
};

_Static_assert(sizeof(struct program_record) == 6, "two 24-bit pointers");

static volatile uint8_t input;
static volatile uint16_t word_input;

static NOINLINE uint32_t byte_times_six(uint8_t value)
{
    return (uint32_t)value * 6u;
}

static NOINLINE uint32_t byte_times_257(uint8_t value)
{
    return (uint32_t)value * 257u;
}

static NOINLINE uint32_t byte_times_258(uint8_t value)
{
    return (uint32_t)value * 258u;
}

static NOINLINE uint32_t word_times_six(uint16_t value)
{
    return (uint32_t)value * 6u;
}

static NOINLINE int32_t signed_byte_times_six(int8_t value)
{
    return (int32_t)value * 6;
}

#define SIGNED_CONSTANT_PRODUCT(name, type, factor) \
    static NOINLINE int32_t name(type value) { return (int32_t)value * (factor); }
SIGNED_CONSTANT_PRODUCT(signed_byte_times_257, int8_t, 257)
SIGNED_CONSTANT_PRODUCT(signed_byte_times_511, int8_t, 511)
SIGNED_CONSTANT_PRODUCT(signed_byte_times_513, int8_t, 513)
SIGNED_CONSTANT_PRODUCT(signed_byte_times_negative_257, int8_t, -257)
SIGNED_CONSTANT_PRODUCT(signed_word_times_257, int16_t, 257)
#undef SIGNED_CONSTANT_PRODUCT

static NOINLINE int32_t signed_byte_times_positive_word(int8_t a, uint16_t b)
{
    return (int32_t)a * (int32_t)((b & 255u) | 256u);
}

static NOINLINE int32_t signed_byte_times_zero_through_511(int8_t a, uint16_t b)
{
    return (int32_t)a * (int32_t)(b & 511u);
}

static NOINLINE int32_t signed_byte_product(int8_t a, int8_t b)
{
    return (int32_t)a * (int32_t)b;
}

/* Independent addition reference, including products beyond signed i16. */
static NOINLINE int32_t reference_product(int16_t a, uint16_t b)
{
    int32_t shifted = a;
    int32_t result = 0;
    while (b) {
        if (b & 1u)
            result += shifted;
        shifted += shifted;
        b >>= 1;
    }
    return result;
}

static NOINLINE uint16_t record_value(uint8_t index)
{
    return (uint16_t)(*records[index].data + *records[index].title);
}

int avm_test_main(void)
{
    for (uint16_t i = 0; i < 256; ++i) {
        input = (uint8_t)i;
        uint8_t value = input;
        uint16_t expected = (uint16_t)(i + i + i);
        expected = (uint16_t)(expected + expected);
        CHECK(byte_times_six(value) == expected);
        CHECK(byte_times_257(value) == ((uint32_t)i << 8) + i);
        CHECK(byte_times_258(value) == ((uint32_t)i << 8) + i + i);
        int16_t signed_value = (int8_t)value;
        int32_t product257 = reference_product(signed_value, 257);
        CHECK(signed_byte_times_six((int8_t)value) ==
              reference_product(signed_value, 6));
        CHECK(signed_byte_times_257((int8_t)value) == product257);
        CHECK(signed_byte_times_511((int8_t)value) ==
              reference_product(signed_value, 511));
        CHECK(signed_byte_times_513((int8_t)value) ==
              reference_product(signed_value, 513));
        CHECK(signed_byte_times_negative_257((int8_t)value) == -product257);
        word_input = i;
        CHECK(signed_byte_times_positive_word((int8_t)value, word_input) ==
              reference_product(signed_value, (word_input & 255u) | 256u));
        CHECK(signed_byte_times_zero_through_511((int8_t)value, 0) == 0);
        CHECK(signed_byte_times_zero_through_511((int8_t)value, 511) ==
              reference_product(signed_value, 511));
        /* Both signs, zero, and the -128 * -128 maximum. */
        CHECK(signed_byte_product((int8_t)value, -128) ==
              -reference_product(signed_value, 128));
        CHECK(signed_byte_product((int8_t)value, 127) ==
              reference_product(signed_value, 127));
        CHECK(signed_byte_product((int8_t)value, 0) == 0);
    }

    static const int16_t signed_words[] = {
        -32768, -32767, -256, -129, -128, -1, 0, 1, 127, 128, 255, 32767
    };
    for (uint8_t i = 0; i < sizeof(signed_words) / sizeof(signed_words[0]); ++i) {
        word_input = (uint16_t)signed_words[i];
        CHECK(signed_word_times_257((int16_t)word_input) ==
              reference_product(signed_words[i], 257));
    }

    word_input = 65535u;
    CHECK(word_times_six(word_input) == 393210UL);
    input = 0;
    CHECK(record_value(input) == 95);
    input = 127;
    CHECK(record_value(input) == 151);
    input = 128;
    CHECK(record_value(input) == 180);
    input = 255;
    CHECK(record_value(input) == 248);

    test_puts("narrow-multiply=ok\n");
    return 0;
}
