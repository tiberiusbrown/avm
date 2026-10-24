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
        CHECK(signed_byte_times_six((int8_t)value) ==
              (int16_t)((int16_t)(int8_t)value * 6));
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
