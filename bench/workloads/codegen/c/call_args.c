#include <stdint.h>

static volatile uint32_t call_result;

__attribute__((noinline))
static uint32_t mix_arguments(uint16_t a0, uint16_t a1, uint16_t a2,
                              uint16_t a3, uint16_t a4, uint16_t a5,
                              uint16_t a6, uint16_t a7, uint32_t q0,
                              uint32_t q1)
{
    uint32_t lo = (uint32_t)(a0 + a2 + a4 + a6);
    uint32_t hi = (uint32_t)(a1 + a3 + a5 + a7);
    return (q0 + lo) ^ (q1 + (hi << 8));
}

int avm_test_main(void)
{
    __avm_debug_break();

    uint32_t acc = 0x13579bdfu;
    for (uint16_t i = 0; i < 96; ++i) {
        acc = mix_arguments(i, (uint16_t)(i + 1u), (uint16_t)(i + 2u),
                            (uint16_t)(i + 3u), (uint16_t)(i + 4u),
                            (uint16_t)(i + 5u), (uint16_t)(i + 6u),
                            (uint16_t)(i + 7u), acc,
                            0x2468ace0u ^ (uint32_t)i);
    }
    call_result = acc;

    __avm_debug_break();
    return 0;
}
