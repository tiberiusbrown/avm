#include <stdint.h>

typedef uint16_t (*binary_operation)(uint16_t, uint16_t);

static volatile uint8_t operation_selector = 1;
static volatile uint16_t indirect_call_result;

__attribute__((noinline))
static uint16_t operation_add(uint16_t a, uint16_t b)
{
    return (uint16_t)(a + b);
}

__attribute__((noinline))
static uint16_t operation_sub(uint16_t a, uint16_t b)
{
    return (uint16_t)(a - b);
}

__attribute__((noinline))
static uint16_t operation_mix(uint16_t a, uint16_t b)
{
    return (uint16_t)((a ^ b) + (a >> 3) + (b << 2));
}

int avm_test_main(void)
{
    __avm_debug_break();

    uint8_t selector = operation_selector;
    binary_operation operation =
        selector == 0 ? operation_add
                      : (selector == 1 ? operation_mix : operation_sub);

    uint16_t acc = 0x1234u;
    for (uint16_t i = 0; i < 128; ++i)
        acc = operation(acc, (uint16_t)(i * 17u + 3u));
    indirect_call_result = acc;

    __avm_debug_break();
    return 0;
}
