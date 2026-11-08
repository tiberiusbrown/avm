#include <stdint.h>

static volatile uint16_t tail_seed = 0x1357u;
static volatile uint16_t tail_calls_result;

__attribute__((noinline))
static uint16_t tail_leaf(uint16_t value)
{
    return (uint16_t)(value * 3u + 1u);
}

__attribute__((noinline))
static uint16_t tail_direct(uint16_t value)
{
    return tail_leaf((uint16_t)(value + 7u));
}

__attribute__((noinline))
static uint16_t tail_with_saved(uint16_t value)
{
    uint16_t a = (uint16_t)(value ^ 0x55aau);
    uint16_t b = (uint16_t)(value + 0x1234u);
    return tail_leaf((uint16_t)(a + b));
}

typedef uint16_t (*tail_function)(uint16_t);

__attribute__((noinline))
static uint16_t tail_indirect(tail_function function, uint16_t value)
{
    return function((uint16_t)(value + 11u));
}

int avm_test_main(void)
{
    __avm_debug_break();

    uint16_t value = tail_seed;
    for (uint16_t i = 0; i < 256; ++i) {
        value = tail_direct(value);
        value ^= tail_with_saved(value);
        value = tail_indirect(tail_leaf, value);
    }
    tail_calls_result = value;

    __avm_debug_break();
    return 0;
}
