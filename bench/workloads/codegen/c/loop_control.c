#include <stdint.h>

static uint8_t source[32];
static volatile uint16_t loop_control_result;

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 32; ++i)
        source[i] = (uint8_t)(i * 5u + 1u);

    __avm_debug_break();

    uint16_t state = 0x1234u;
    for (uint16_t repeat = 0; repeat < 128; ++repeat) {
        for (uint16_t i = 0; i < 8; ++i)
            state = (uint16_t)(state + 3u);
        for (uint16_t i = 0; i < 32; ++i)
            state ^= (uint16_t)(i * 17u);
        for (uint16_t i = 0; i < 256; ++i)
            state = (uint16_t)(state + source[i & 31u]);
    }
    loop_control_result = state;

    __avm_debug_break();
    return 0;
}
