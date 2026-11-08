#include <stdint.h>

/* Keep the bit-by-bit oracle independent of the optimized bit-count lowering. */
__attribute__((noinline, optnone))
static unsigned reference_leading(uint16_t value)
{
    unsigned count = 0;
    uint16_t bit = 0x8000u;
    while (bit && !(value & bit)) {
        ++count;
        bit >>= 1;
    }
    return count;
}

__attribute__((noinline, optnone))
static unsigned reference_trailing(uint16_t value)
{
    unsigned count = 0;
    uint16_t bit = 1;
    while (bit && !(value & bit)) {
        ++count;
        bit <<= 1;
    }
    return count;
}

__attribute__((noinline)) static unsigned leading(uint16_t value)
{
    return __builtin_clzg(value, 16);
}

__attribute__((noinline)) static unsigned trailing(uint16_t value)
{
    return __builtin_ctzg(value, 16);
}

__attribute__((noinline)) static unsigned leading_nonzero(uint16_t value)
{
    return __builtin_clz(value);
}

__attribute__((noinline)) static unsigned trailing_nonzero(uint16_t value)
{
    return __builtin_ctz(value);
}

int avm_test_main(void)
{
    uint16_t value = 0;
    do {
        unsigned lz = reference_leading(value);
        unsigned tz = reference_trailing(value);
        if (leading(value) != lz || trailing(value) != tz)
            return 1;
        if (value && (leading_nonzero(value) != lz ||
                      trailing_nonzero(value) != tz))
            return 2;
        ++value;
    } while (value);
    return 0;
}
