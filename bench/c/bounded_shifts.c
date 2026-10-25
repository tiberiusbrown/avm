#include <stdint.h>

static volatile uint32_t values[4];
static volatile uint16_t counts[8];
static volatile uint32_t result;

static __attribute__((noinline)) uint32_t small(uint32_t x, uint16_t n)
{
    n &= 15;
    return (x << n) ^ (x >> n) ^ (uint32_t)((int32_t)x >> n);
}

static __attribute__((noinline)) uint32_t large(uint32_t x, uint16_t n)
{
    n = (n & 15) | 16;
    return (x << n) ^ (x >> n) ^ (uint32_t)((int32_t)x >> n);
}

static __attribute__((noinline)) uint32_t full(uint32_t x, uint16_t n)
{
    n &= 31;
    return (x << n) ^ (x >> n) ^ (uint32_t)((int32_t)x >> n);
}

int avm_test_main(void)
{
    values[0] = 0x81234567UL;
    values[1] = 0x12345678UL;
    values[2] = 0xffff0001UL;
    values[3] = 0x8000ffffUL;
    for (uint8_t i = 0; i < 8; ++i)
        counts[i] = (uint16_t)(i * 5u);

    __avm_debug_break();
    uint32_t acc = 0;
    for (uint8_t i = 0; i < 8; ++i) {
        uint32_t x = values[i & 3];
        uint16_t n = counts[i];
        acc += small(x, n);
        acc ^= large(x, n);
        acc += full(x, n);
    }
    result = acc;
    __avm_debug_break();
    return 0;
}
