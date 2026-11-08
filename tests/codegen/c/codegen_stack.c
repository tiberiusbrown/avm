#include <avm/pgmspace.h>
#include <stdint.h>

#include "test_hex_output.h"

#if defined(__clang__)
#define NOINLINE __attribute__((noinline))
#else
#define NOINLINE
#endif

static const uint8_t AVM_PROGMEM flash_data[32] = {
    0x4e, 0x9e, 0x82, 0xe2, 0xc6, 0x56, 0x72, 0x32,
    0xde, 0xce, 0xa2, 0x82, 0x66, 0xb6, 0xf2, 0x12,
    0x0e, 0x7e, 0x42, 0xa2, 0x86, 0xb6, 0x52, 0x52,
    0x3e, 0x0e, 0xe2, 0x42, 0x66, 0x96, 0x92, 0xf2
};

static uint16_t rotate_left(uint16_t value, uint8_t count)
{
    if(count == 0)
        return value;
    return (uint16_t)((uint16_t)(value << count) |
                      (uint16_t)(value >> (uint8_t)(16 - count)));
}

static NOINLINE uint16_t fibonacci(uint8_t value)
{
    if(value < 2)
        return value;
    return (uint16_t)(fibonacci((uint8_t)(value - 1)) +
                      fibonacci((uint8_t)(value - 2)));
}

static NOINLINE uint16_t stack_arrays(uint16_t seed)
{
    uint16_t words[12];
    uint8_t bytes[17];

    for(uint8_t i = 0; i < 12; ++i)
        words[i] = (uint16_t)((uint16_t)(seed + (uint16_t)(i * 0x0123u)) ^
                             rotate_left(seed, (uint8_t)(i % 7u)));

    for(uint8_t i = 0; i < 17; ++i) {
        const uint16_t word = words[i % 12u];
        const uint8_t part =
            (uint8_t)(word >> ((i & 1u) != 0 ? 8 : 0));
        bytes[i] = (uint8_t)(part ^ (uint8_t)(i * 13u));
    }

    uint16_t result = 0x2468;
    for(uint8_t i = 12; i != 0; --i)
        result = (uint16_t)(rotate_left(result, 1) ^ words[i - 1]);

    for(uint8_t i = 0; i < 17; ++i)
        result = (uint16_t)(result + (uint16_t)(bytes[i] * 17u));

    return result;
}

static NOINLINE uint16_t
helper4(uint16_t a, uint16_t b, uint16_t c, uint16_t d)
{
    return (uint16_t)(((uint16_t)(a + (uint16_t)(3u * b))) ^
                      ((uint16_t)(5u * c + (uint16_t)(7u * d))));
}

static NOINLINE uint16_t register_pressure(uint16_t seed)
{
    const uint16_t v0 = (uint16_t)(seed + 0x1111);
    const uint16_t v1 = (uint16_t)(seed ^ 0x2222);
    const uint16_t v2 = rotate_left(seed, 3);
    const uint16_t v3 = (uint16_t)(v0 + v1);
    const uint16_t v4 = (uint16_t)(v2 ^ v3);
    const uint16_t v5 = (uint16_t)(v4 + 0x3333);
    const uint16_t v6 = rotate_left(v5, 5);
    const uint16_t v7 = (uint16_t)(v6 - v1);
    const uint16_t v8 = (uint16_t)(v7 ^ v0);
    const uint16_t v9 = (uint16_t)(v8 + v2);
    const uint16_t x = helper4(v0, v3, v6, v9);
    const uint16_t y = helper4(v1, v4, v7, v8);

    return (uint16_t)(x ^ rotate_left(y, 1) ^ v5);
}

static NOINLINE uint16_t program_pointer_stack(void)
{
    const uint8_t AVM_PROGMEM *pointers[3] = {
        flash_data + 1,
        flash_data + 7,
        flash_data + 13,
    };
    const uint8_t counts[3] = {5, 6, 7};
    uint16_t result = 0;

    for(uint8_t stream = 0; stream < 3; ++stream) {
        const uint8_t AVM_PROGMEM *p = pointers[stream];
        for(uint8_t i = 0; i < counts[stream]; ++i)
            result = (uint16_t)(rotate_left(result, 1) + *p++);
    }

    return result;
}

int avm_test_main(void)
{
    volatile uint8_t fib_input = 10;
    volatile uint16_t seed0 = 0x3141;
    volatile uint16_t seed1 = 0x5a3c;

    const uint16_t s0 = fibonacci(fib_input);
    const uint16_t s1_value = stack_arrays(seed0);
    const uint16_t s2_value = register_pressure(seed1);
    const uint16_t s3_value = program_pointer_stack();

    test_line16("S0", s0);
    test_line16("S1", s1_value);
    test_line16("S2", s2_value);
    test_line16("S3", s3_value);

    return s0 != 0x0037 || s1_value != 0x9ef0 ||
           s2_value != 0xe4a8 || s3_value != 0xd3e8;
}
