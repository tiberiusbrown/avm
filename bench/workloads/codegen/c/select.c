#include <stdint.h>

static volatile int16_t signed_a[32];
static volatile int16_t signed_b[32];
static volatile uint16_t unsigned_values[32];
static volatile uint16_t select_result;

__attribute__((noinline))
static uint16_t select_kernel(int16_t a, int16_t b, uint16_t selector)
{
    int16_t minimum = a < b ? a : b;
    int16_t maximum = a > b ? a : b;
    int16_t clamped_low = minimum < -1000 ? -1000 : minimum;
    int16_t clamped = clamped_low > 1000 ? 1000 : clamped_low;
    uint16_t chosen =
        (selector & 1u) != 0 ? (uint16_t)maximum : (uint16_t)clamped;
    return (selector & 2u) != 0 ? (uint16_t)(chosen ^ selector) : chosen;
}

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 32; ++i) {
        signed_a[i] = (int16_t)(-2400 + (int16_t)i * 173);
        signed_b[i] = (int16_t)(1800 - (int16_t)i * 127);
        unsigned_values[i] = (uint16_t)(i * 257u + 3u);
    }

    __avm_debug_break();

    uint16_t acc = 0;
    for (uint8_t repeat = 0; repeat < 16; ++repeat) {
        for (uint8_t i = 0; i < 32; ++i)
            acc = (uint16_t)(acc +
                             select_kernel(signed_a[i], signed_b[i],
                                           unsigned_values[i]));
    }
    select_result = acc;

    __avm_debug_break();
    return 0;
}
