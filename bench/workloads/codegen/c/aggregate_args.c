#include <stdint.h>

typedef struct {
    uint32_t value;
    uint16_t weight;
    uint8_t kind;
    uint8_t enabled;
} item;

static item items[16];
static volatile uint32_t aggregate_args_result;

__attribute__((noinline))
static uint32_t combine(item left, item right, uint16_t bias)
{
    uint32_t a = left.enabled ? left.value * left.weight : bias;
    uint32_t b = right.enabled ? right.value + right.weight : bias;
    return (a ^ b) + ((uint32_t)left.kind << 8) + right.kind;
}

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 16; ++i) {
        items[i].value = 0x1200u + (uint32_t)i * 17u;
        items[i].weight = (uint16_t)(i * 3u + 1u);
        items[i].kind = (uint8_t)(i ^ 0x5au);
        items[i].enabled = i & 1u;
    }

    __avm_debug_break();

    uint32_t checksum = 0;
    for (uint8_t repeat = 0; repeat < 20; ++repeat) {
        for (uint8_t i = 0; i < 16; ++i)
            checksum += combine(items[i], items[(i + 5u) & 15u],
                                (uint16_t)(checksum >> 12));
    }
    aggregate_args_result = checksum;

    __avm_debug_break();
    return 0;
}
