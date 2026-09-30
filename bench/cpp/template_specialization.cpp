#include <stdint.h>

static volatile uint16_t inputs[32];
static volatile uint16_t template_result;

template <unsigned Shift>
__attribute__((noinline)) static uint16_t transform(uint16_t value)
{
    uint16_t rotated =
        (uint16_t)((value << Shift) | (value >> (16u - Shift)));
    return (uint16_t)((rotated ^ (uint16_t)(Shift * 0x1111u)) + value);
}

extern "C" int avm_test_main()
{
    for (uint8_t i = 0; i < 32; ++i)
        inputs[i] = (uint16_t)(i * 1709u + 0x1234u);

    __avm_debug_break();

    uint16_t checksum = 0;
    for (uint8_t repeat = 0; repeat < 24; ++repeat) {
        for (uint8_t i = 0; i < 32; ++i) {
            uint16_t value = inputs[i];
            checksum ^= transform<3>((uint16_t)(value + checksum));
            checksum += transform<7>((uint16_t)(value ^ checksum));
            checksum ^= transform<11>((uint16_t)(value - checksum));
        }
    }
    template_result = checksum;

    __avm_debug_break();
    return 0;
}
