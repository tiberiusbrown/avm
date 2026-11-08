#include <stdint.h>

static volatile uint16_t stack_seed = 0x2345u;
static volatile uint16_t stack_result;

__attribute__((noinline))
static uint16_t stack_kernel(uint16_t seed)
{
    uint16_t local[24];

    for (uint8_t i = 0; i < 24; ++i)
        local[i] = (uint16_t)(seed + (uint16_t)i * 37u);

    for (uint8_t pass = 0; pass < 4; ++pass) {
        for (uint8_t i = 1; i < 23; ++i)
            local[i] =
                (uint16_t)(local[i - 1] ^ local[i] ^ local[i + 1] ^ pass);
    }

    uint16_t checksum = 0;
    for (uint8_t i = 0; i < 24; ++i)
        checksum = (uint16_t)(checksum + local[i]);

    return checksum;
}

int avm_test_main(void)
{
    __avm_debug_break();

    uint16_t acc = 0;
    for (uint8_t i = 0; i < 16; ++i)
        acc ^= stack_kernel((uint16_t)(stack_seed + i));
    stack_result = acc;

    __avm_debug_break();
    return 0;
}
