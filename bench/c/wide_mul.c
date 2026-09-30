#include <stdint.h>

static volatile uint64_t factors[4];
static volatile uint64_t result;

int avm_test_main(void)
{
    factors[0] = UINT64_C(0x123456789abcdef0);
    factors[1] = UINT64_C(0xfedcba9876543211);
    factors[2] = UINT64_C(0x0001000100010001);
    factors[3] = UINT64_C(0x800000010000ffff);

    __avm_debug_break();

    uint64_t acc = 1;
    for (uint8_t repeat = 0; repeat < 4; ++repeat) {
        for (uint8_t i = 0; i < 4; ++i)
            acc ^= factors[i] * factors[(uint8_t)((i + 1u) & 3u)];
    }
    result = acc;

    __avm_debug_break();
    return 0;
}
