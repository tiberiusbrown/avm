#include <stdint.h>

#include "test_hex_output.h"

#define NOINLINE __attribute__((noinline))
#define CHECK(expression) do { if (!(expression)) return __LINE__; } while (0)
#define FLOAT_WORD(word) __builtin_bit_cast(float, UINT32_C(word))

static volatile int16_t input;

static NOINLINE uint32_t integer_common_low(int16_t a, int16_t b)
{
    return a < b ? UINT32_C(0x12345678) : UINT32_C(0x9abc5678);
}

static NOINLINE uint32_t integer_common_high(uint16_t a, uint16_t b)
{
    return a < b ? UINT32_C(0x12345678) : UINT32_C(0x1234abcd);
}

static NOINLINE float float_common_low(int16_t a, int16_t b)
{
    return a < b ? FLOAT_WORD(0x3fa12345) : FLOAT_WORD(0xbfa12345);
}

static NOINLINE float float_common_high(float a, float b)
{
    return a < b ? FLOAT_WORD(0x3f801234) : FLOAT_WORD(0x3f80abcd);
}

static NOINLINE float signed_zero(int16_t a, int16_t b)
{
    return a < b ? 0.0f : -0.0f;
}

static NOINLINE float nan_payload(int16_t a, int16_t b)
{
    return a < b ? FLOAT_WORD(0x7fc12345) : FLOAT_WORD(0xffc12345);
}

/* Keep another arithmetic use of the condition operands, so a select's
 * 16-bit result cannot overwrite a value still needed by its caller. */
static NOINLINE uint32_t live_operands(int16_t a, int16_t b)
{
    uint32_t selected = a < b ? UINT32_C(0x12345678) : UINT32_C(0x9abc5678);
    return selected ^ ((uint32_t)(uint16_t)a << 16) ^ (uint16_t)b;
}

int avm_test_main(void)
{
    static const int16_t edges[] = {INT16_MIN, -1, 0, 1, INT16_MAX};
    for (unsigned i = 0; i < sizeof(edges) / sizeof(edges[0]); ++i) {
        input = edges[i];
        int16_t a = input;
        for (unsigned j = 0; j < sizeof(edges) / sizeof(edges[0]); ++j) {
            input = edges[j];
            int16_t b = input;
            uint32_t selected = a < b ? UINT32_C(0x12345678) : UINT32_C(0x9abc5678);
            CHECK(integer_common_low(a, b) == selected);
            CHECK(integer_common_high((uint16_t)a, (uint16_t)b) ==
                  ((uint16_t)a < (uint16_t)b ? UINT32_C(0x12345678) : UINT32_C(0x1234abcd)));
            CHECK(__builtin_bit_cast(uint32_t, float_common_low(a, b)) ==
                  (a < b ? UINT32_C(0x3fa12345) : UINT32_C(0xbfa12345)));
            CHECK(__builtin_bit_cast(uint32_t, float_common_high((float)a, (float)b)) ==
                  (a < b ? UINT32_C(0x3f801234) : UINT32_C(0x3f80abcd)));
            CHECK(__builtin_bit_cast(uint32_t, signed_zero(a, b)) ==
                  (a < b ? UINT32_C(0) : UINT32_C(0x80000000)));
            CHECK(__builtin_bit_cast(uint32_t, nan_payload(a, b)) ==
                  (a < b ? UINT32_C(0x7fc12345) : UINT32_C(0xffc12345)));
            CHECK(live_operands(a, b) ==
                  (selected ^ ((uint32_t)(uint16_t)a << 16) ^ (uint16_t)b));
        }
    }
    CHECK(__builtin_bit_cast(uint32_t, float_common_high(FLOAT_WORD(0x7fc12345), 1.0f)) ==
          UINT32_C(0x3f80abcd));
    CHECK(__builtin_bit_cast(uint32_t, float_common_high(1.0f, FLOAT_WORD(0xffc12345))) ==
          UINT32_C(0x3f80abcd));
    test_puts("select-constant-words=ok\n");
    return 0;
}
