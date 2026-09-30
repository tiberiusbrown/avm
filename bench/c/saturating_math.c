#include <stdint.h>

static volatile uint16_t unsigned_inputs[32];
static volatile int16_t signed_inputs[32];
static volatile uint16_t saturating_math_result;

__attribute__((noinline))
static uint16_t saturated_add(uint16_t left, uint16_t right)
{
    uint32_t sum = (uint32_t)left + right;
    return sum > UINT16_MAX ? UINT16_MAX : (uint16_t)sum;
}

__attribute__((noinline))
static int16_t clamp_signed(int32_t value)
{
    if (value > INT16_MAX)
        return INT16_MAX;
    if (value < INT16_MIN)
        return INT16_MIN;
    return (int16_t)value;
}

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 32; ++i) {
        unsigned_inputs[i] = (uint16_t)(i * 2039u);
        signed_inputs[i] = (int16_t)((int16_t)i * 1511 - 24000);
    }

    __avm_debug_break();

    uint16_t checksum = 0;
    for (uint8_t repeat = 0; repeat < 20; ++repeat) {
        for (uint8_t i = 0; i < 32; ++i) {
            uint16_t a = unsigned_inputs[i];
            int16_t b = signed_inputs[i];
            checksum ^= saturated_add(a, (uint16_t)(repeat * 1231u));
            checksum += (uint16_t)clamp_signed((int32_t)b * 3 + a);
        }
    }
    saturating_math_result = checksum;

    __avm_debug_break();
    return 0;
}
