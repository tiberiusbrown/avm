#include <stdint.h>

struct Bytes2 { uint8_t a, b; };
struct Bytes3 { uint8_t a, b, c; };
struct Bytes4 { uint8_t a, b, c, d; };

static volatile uint16_t input[32];
static volatile uint16_t aggregate_byte_packing_result;

__attribute__((noinline)) uint16_t consume2(Bytes2 v)
{
    return (uint16_t)(v.a + v.b);
}

__attribute__((noinline)) uint16_t consume3(Bytes3 v)
{
    return (uint16_t)(v.a + v.b + v.c);
}

__attribute__((noinline)) uint16_t consume4(Bytes4 v)
{
    return (uint16_t)(v.a + v.b + v.c + v.d);
}

extern "C" int avm_test_main()
{
    for (uint8_t i = 0; i < 32; ++i)
        input[i] = (uint16_t)(0xa500u | (uint8_t)(i * 37u));

    __avm_debug_break();

    uint16_t checksum = 0;
    for (uint8_t repeat = 0; repeat < 16; ++repeat) {
        for (uint8_t i = 0; i < 32; ++i) {
            uint8_t a = (uint8_t)input[i];
            uint8_t b = (uint8_t)input[(i + 1u) & 31u];
            uint8_t c = (uint8_t)input[(i + 2u) & 31u];
            uint8_t d = (uint8_t)input[(i + 3u) & 31u];
            checksum = (uint16_t)(checksum + consume2({a, b}));
            checksum = (uint16_t)(checksum + consume3({a, b, c}));
            checksum = (uint16_t)(checksum + consume4({a, b, c, d}));
        }
    }
    aggregate_byte_packing_result = checksum;

    __avm_debug_break();
    return 0;
}
