#include <stdint.h>

static volatile uint64_t values[4];
static volatile uint8_t counts[4];
static volatile uint64_t result;

int avm_test_main(void)
{
    values[0] = UINT64_C(0x8123456789abcdef);
    values[1] = UINT64_C(0x123456789abcdef0);
    values[2] = UINT64_C(0xffff0000ffff0000);
    values[3] = UINT64_C(0x8000000100000001);
    counts[0] = 1;
    counts[1] = 15;
    counts[2] = 32;
    counts[3] = 63;

    __avm_debug_break();

    uint64_t acc = 0;
    for (uint8_t repeat = 0; repeat < 4; ++repeat) {
        for (uint8_t i = 0; i < 4; ++i) {
            uint64_t value = values[i];
            uint8_t count = counts[i];
            acc ^= value << count;
            acc += value >> count;
            acc ^= (uint64_t)((int64_t)value >> count);
        }
    }
    result = acc;

    __avm_debug_break();
    return 0;
}
