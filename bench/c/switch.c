#include <stdint.h>

static volatile uint16_t switch_result;

__attribute__((noinline))
static uint16_t dense_dispatch(uint8_t opcode, uint16_t value)
{
    switch (opcode) {
    case 0: return (uint16_t)(value + 1u);
    case 1: return (uint16_t)(value - 3u);
    case 2: return (uint16_t)(value ^ 0x55aau);
    case 3: return (uint16_t)(value << 1);
    case 4: return (uint16_t)(value >> 1);
    case 5: return (uint16_t)(value | 0x0101u);
    case 6: return (uint16_t)(value & 0x7f7fu);
    case 7: return (uint16_t)~value;
    default: return value;
    }
}

__attribute__((noinline))
static uint16_t sparse_dispatch(uint8_t opcode, uint16_t value)
{
    switch (opcode) {
    case 3: return (uint16_t)(value + 17u);
    case 19: return (uint16_t)(value ^ 0x1234u);
    case 64: return (uint16_t)(value - 29u);
    case 127: return (uint16_t)(value + (value >> 3));
    case 200: return (uint16_t)(value ^ (value << 5));
    default: return (uint16_t)(value + opcode);
    }
}

int avm_test_main(void)
{
    __avm_debug_break();

    uint16_t acc = 0x5a5au;
    for (uint16_t i = 0; i < 512; ++i) {
        uint8_t dense = (uint8_t)(i & 7u);
        uint8_t sparse = (uint8_t)(i * 37u);
        acc = dense_dispatch(dense, acc);
        acc = sparse_dispatch(sparse, acc);
    }
    switch_result = acc;

    __avm_debug_break();
    return 0;
}
