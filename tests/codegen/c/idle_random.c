#include <stdint.h>

#include "test_hex_output.h"

#if defined(__clang__) || defined(__GNUC__)
#define NOINLINE __attribute__((noinline))
#else
#define NOINLINE
#endif

extern uint16_t __avm_millis(void);
extern void __avm_idle(void);
extern uint16_t __avm_generate_random_seed(void);

static NOINLINE uint16_t call_millis(void)
{
    return __avm_millis();
}

static NOINLINE void call_idle(void)
{
    __avm_idle();
}

static NOINLINE uint16_t call_generate_random_seed(void)
{
    return __avm_generate_random_seed();
}

int avm_test_main(void)
{
    const uint16_t before = call_millis();
    call_idle();
    const uint16_t after = call_millis();
    const uint16_t idle_woke = (uint16_t)(after != before);

    uint16_t seed_mix = 0;
    for(uint16_t i = 0; i < 4; ++i)
        seed_mix ^= call_generate_random_seed();
    volatile uint16_t seed_sink = seed_mix;
    (void)seed_sink;

    test_line16("IW", idle_woke);
    test_line16("RS", 4);

    return idle_woke != 1;
}
