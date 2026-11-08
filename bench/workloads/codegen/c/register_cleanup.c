#include <stdint.h>

typedef struct {
    uint16_t position;
    uint16_t velocity;
    uint32_t flags;
} state;
static volatile uint32_t register_cleanup_result;

static __attribute__((noinline)) uint16_t step(state* item, uint16_t input)
{
    item->position = (uint16_t)(item->position + item->velocity + input);
    item->velocity = (uint16_t)((item->velocity + 7u) & 255u);
    item->flags ^= (uint32_t)input << (input & 7u);
    return (uint16_t)(item->position ^ item->velocity);
}

static __attribute__((noinline)) uint32_t run(uint16_t seed)
{
    state item = {0, 0, 0};
    uint16_t a = seed;
    uint16_t b = (uint16_t)(seed + 23u);
    uint32_t total = 0;
    for (uint8_t i = 0; i < 48; ++i) {
        a = (uint16_t)(a + step(&item, b));
        b = (uint16_t)(b ^ step(&item, a));
        total += (uint32_t)a + b + item.flags;
    }
    return total + item.position + item.velocity;
}

int avm_test_main(void)
{
    __avm_debug_break();

    uint32_t checksum = 0;
    for (uint8_t repeat = 0; repeat < 12; ++repeat)
        checksum ^= run((uint16_t)(repeat * 31u + 257u));
    register_cleanup_result = checksum;

    __avm_debug_break();
    return 0;
}
