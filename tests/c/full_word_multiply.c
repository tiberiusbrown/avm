#include <stdint.h>

#include "test_hex_output.h"

#define NOINLINE __attribute__((noinline))
#define CHECK(expression) do { if (!(expression)) return __LINE__; } while (0)

extern uint32_t __avm_umulhisi3(uint16_t, uint16_t);
extern int32_t __avm_mulhisi3(int16_t, int16_t);

static volatile uint16_t left_input, right_input;

static NOINLINE uint32_t unsigned_product(uint16_t a, uint16_t b)
{
    return (uint32_t)a * b;
}

static NOINLINE int32_t signed_product(int16_t a, int16_t b)
{
    return (int32_t)a * b;
}

static NOINLINE uint16_t unsigned_high(uint16_t a, uint16_t b)
{
    return (uint16_t)(((uint32_t)a * b) >> 16);
}

static NOINLINE int16_t signed_high(int16_t a, int16_t b)
{
    return (int16_t)(((int32_t)a * b) >> 16);
}

/* Shift/add reference with no multiplication or signed overflow. */
static NOINLINE uint32_t reference_product(uint16_t a, uint16_t b)
{
    uint32_t result = 0;
    uint32_t shifted = a;
    while (b) {
        if (b & 1u)
            result += shifted;
        shifted += shifted;
        b >>= 1;
    }
    return result;
}

static NOINLINE int check_pair(uint16_t a, uint16_t b)
{
    left_input = a;
    right_input = b;
    uint32_t expected = reference_product(a, b);
    CHECK(unsigned_product(left_input, right_input) == expected);
    CHECK(__avm_umulhisi3(left_input, right_input) == expected);
    CHECK(unsigned_high(left_input, right_input) == (uint16_t)(expected >> 16));

    /* Reinterpret the same inputs as signed and correct their high words. */
    if (a & 0x8000u)
        expected -= (uint32_t)b << 16;
    if (b & 0x8000u)
        expected -= (uint32_t)a << 16;
    CHECK((uint32_t)signed_product((int16_t)left_input,
                                  (int16_t)right_input) == expected);
    CHECK((uint32_t)__avm_mulhisi3((int16_t)left_input,
                                 (int16_t)right_input) == expected);
    CHECK((uint16_t)signed_high((int16_t)left_input, (int16_t)right_input) ==
          (uint16_t)(expected >> 16));
    return 0;
}

int avm_test_main(void)
{
    static const uint16_t boundaries[] = {
        0, 1, 2, 0x7f, 0x80, 0xff, 0x100, 0x101, 0x7fff,
        0x8000, 0x8001, 0xfeff, 0xff00, 0xfffe, 0xffff
    };
    for (uint8_t i = 0; i < sizeof(boundaries) / sizeof(boundaries[0]); ++i)
        for (uint8_t j = 0; j < sizeof(boundaries) / sizeof(boundaries[0]); ++j) {
            int error = check_pair(boundaries[i], boundaries[j]);
            if (error)
                return error;
        }

    /* Every byte value in both positions, with carry and sign transitions. */
    for (uint16_t i = 0; i < 256; ++i) {
        uint16_t a = (uint16_t)((i << 8) | (255u - i));
        uint16_t b = (uint16_t)((i << 8) | i);
        int error = check_pair(a, b);
        if (error)
            return error;
        error = check_pair((uint16_t)(0x8000u + i), 0xffffu);
        if (error)
            return error;
        error = check_pair(i, (uint16_t)(0xff00u | i));
        if (error)
            return error;
    }

    test_puts("full-word-multiply=ok\n");
    return 0;
}
