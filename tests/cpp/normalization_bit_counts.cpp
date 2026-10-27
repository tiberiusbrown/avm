#include <stdint.h>

#include "../c/test_hex_output.h"

#define NOINLINE __attribute__((noinline))

// LLVM recognizes this normalization loop as a 32-bit CTLZ at -O2.
static NOINLINE int normalization_top(uint32_t mantissa)
{
    int top = 0;
    for (uint32_t m = mantissa; m >>= 1;)
        ++top;
    return top;
}

static NOINLINE int leading_zeros(uint32_t value)
{
    return __builtin_clzl(value);
}

static NOINLINE int leading_zeros_defined(uint32_t value)
{
    return __builtin_clzg(value, 32);
}

static NOINLINE int popcount(uint32_t value)
{
    return __builtin_popcountl(value);
}

static NOINLINE uint16_t check(uint32_t value)
{
    // Scan individual bits to keep the reference independent of count idioms.
    int last = 0, count = 0;
    for (int bit = 0; bit < 32; ++bit) {
        if (value & (UINT32_C(1) << bit)) {
            last = bit;
            ++count;
        }
    }
    int leading = count ? 31 - last : 32;
    uint16_t failures = normalization_top(value) != last;
    failures += popcount(value) != count;
    failures += leading_zeros_defined(value) != leading;
    if (value)
        failures += leading_zeros(value) != leading;
    return failures;
}

extern "C" int avm_test_main(void)
{
    uint16_t failures = check(0);
    for (int bit = 0; bit < 32; ++bit) {
        uint32_t power = UINT32_C(1) << bit;
        failures += check(power);
        failures += check(power - 1);
        failures += check(power + 1);
        failures += check(~power);
    }
    failures += check(UINT32_C(0xffffffff));
    failures += check(UINT32_C(0x55555555));
    failures += check(UINT32_C(0xaaaaaaaa));
    failures += check(UINT32_C(0x12345678));
    test_line16("FAILURES", failures);
    return failures != 0;
}
