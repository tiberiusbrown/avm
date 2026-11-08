#include <stdint.h>
#include <string.h>

#include "test_hex_output.h"

#if defined(__clang__)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-volatile"
#define NOINLINE __attribute__((noinline))
#else
#define NOINLINE
#endif

#ifdef __cplusplus
extern "C" {
#endif

extern float __floatdisf(int64_t value);
extern float __floatundisf(uint64_t value);

#ifdef __cplusplus
}
#endif

#define CHECK(condition) do {                                      \
    if (!(condition)) { test_line16("FAIL", __LINE__); return 1; }  \
} while (0)

static uint32_t float_bits(float value)
{
    uint32_t bits;
    memcpy(&bits, &value, sizeof(bits));
    return bits;
}

static NOINLINE float cast_to_float_signed(volatile int64_t value)
{
    return (float)value;
}

static NOINLINE float cast_to_float_unsigned(volatile uint64_t value)
{
    return (float)value;
}

static NOINLINE float cast_to_double_signed(volatile int64_t value)
{
    return (double)value;
}

static NOINLINE float cast_to_double_unsigned(volatile uint64_t value)
{
    return (double)value;
}

static NOINLINE float cast_to_ldouble_signed(volatile int64_t value)
{
    return (long double)value;
}

static NOINLINE float cast_to_ldouble_unsigned(volatile uint64_t value)
{
    return (long double)value;
}

int avm_test_main(void)
{
    /* ---- Signed conversion vectors ---- */
    volatile int64_t vi0 = 0;
    volatile int64_t vi1 = 1;
    volatile int64_t vim1 = -1;
    volatile int64_t vi16777217 = 16777217;
    volatile int64_t vi4294967296 = 4294967296;
    volatile int64_t vi1099511627776 = 1099511627776;

    CHECK(float_bits(cast_to_float_signed(vi0)) == 0x00000000);
    CHECK(float_bits(cast_to_float_signed(vi1)) == 0x3F800000);
    CHECK(float_bits(cast_to_float_signed(vim1)) == 0xBF800000);
    CHECK(float_bits(cast_to_float_signed(vi16777217)) == 0x4B800000);
    CHECK(float_bits(cast_to_float_signed(vi4294967296)) == 0x4F800000);
    CHECK(float_bits(cast_to_float_signed(vi1099511627776)) == 0x53800000);

    /* INT64_MAX and INT64_MIN via helper */
    CHECK(float_bits(__floatdisf(INT64_MAX)) == 0x5F000000);
    CHECK(float_bits(__floatdisf(INT64_MIN)) == 0xDF000000);

    /* ---- Unsigned conversion vectors ---- */
    volatile uint64_t vu0 = 0;
    volatile uint64_t vu1 = 1;
    volatile uint64_t vu0fff = 0xFFFFFFFF;
    volatile uint64_t vu1_32 = 0x100000000;
    volatile uint64_t vu1_64 = 0x10000000000;
    volatile uint64_t vu_max = UINT64_MAX;

    CHECK(float_bits(cast_to_float_unsigned(vu0)) == 0x00000000);
    CHECK(float_bits(cast_to_float_unsigned(vu1)) == 0x3F800000);
    CHECK(float_bits(cast_to_float_unsigned(vu0fff)) == 0x4F800000);
    CHECK(float_bits(cast_to_float_unsigned(vu1_32)) == 0x4F800000);
    CHECK(float_bits(cast_to_float_unsigned(vu1_64)) == 0x53800000);
    CHECK(float_bits(cast_to_float_unsigned(vu_max)) == 0x5F800000);

    /* ---- Source-language cast vectors (all three FP types) ---- */
    volatile int64_t vi_cast = 16777217;
    volatile uint64_t vu_cast = 0x100000180;
    CHECK(float_bits(cast_to_float_signed(vi_cast)) ==
          float_bits(cast_to_double_signed(vi_cast)));
    CHECK(float_bits(cast_to_float_signed(vi_cast)) ==
          float_bits(cast_to_ldouble_signed(vi_cast)));
    CHECK(float_bits(cast_to_float_unsigned(vu_cast)) ==
          float_bits(cast_to_double_unsigned(vu_cast)));
    CHECK(float_bits(cast_to_float_unsigned(vu_cast)) ==
          float_bits(cast_to_ldouble_unsigned(vu_cast)));

    /* ---- Cross-direction round-trip tests ---- */
    static const int64_t rt_signed[] = {0, 1, -1, 1073741824, 2147483648, INT64_MIN};
    for (int i = 0; i < 6; ++i) {
        int64_t orig = rt_signed[i];
        float f = (float)orig;
        int64_t back = (int64_t)f;
        CHECK((uint64_t)back == (uint64_t)orig);
    }

    static const uint64_t rt_unsigned[] = {0, 1, 2147483648, 4294967296,
                                           UINT64_C(1) << 63};
    for (int i = 0; i < 5; ++i) {
        uint64_t orig = rt_unsigned[i];
        float f = (float)orig;
        uint64_t back = (uint64_t)f;
        CHECK(back == orig);
    }

    return 0;
}

#if defined(__clang__)
#pragma clang diagnostic pop
#endif
