#include <stdint.h>

#include "test_hex_output.h"

#if defined(__clang__)
#define NOINLINE __attribute__((noinline))
#else
#define NOINLINE
#endif

static uint16_t rotate_left(uint16_t value, uint8_t count)
{
    return (uint16_t)((uint16_t)(value << count) |
                      (uint16_t)(value >> (uint8_t)(16 - count)));
}

static NOINLINE uint16_t dense_switch(uint8_t value)
{
    switch(value) {
    case 0: return 0x0010;
    case 1: return 0x0021;
    case 2: return 0x0032;
    case 3: return 0x0043;
    case 4: return 0x0054;
    case 5: return 0x0065;
    case 6: return 0x0076;
    case 7: return 0x0087;
    default: return 0x0099;
    }
}

static NOINLINE uint16_t sparse_switch(uint16_t value)
{
    switch(value) {
    case 1: return 0x1111;
    case 17: return 0x2222;
    case 257: return 0x3333;
    case 4096: return 0x4444;
    case 0x8000: return 0x5555;
    default: return (uint16_t)(value ^ 0xa55a);
    }
}

static NOINLINE uint16_t loop_control(uint16_t seed)
{
    uint16_t value = seed;

    for(uint8_t i = 0; i < 64; ++i) {
        if((i & 3u) == 1u)
            continue;

        value = (uint16_t)(rotate_left(value, 1) ^
                           (uint16_t)(i * 0x0123u + 0x0055u));
        if(i == 37)
            break;
    }

    return value;
}

static NOINLINE uint16_t run_state_machine(uint8_t seed)
{
    uint8_t state = (uint8_t)(seed % 5u);
    uint16_t value = 0x1234;

    for(uint8_t i = 0; i < 23; ++i) {
        switch(state) {
        case 0:
            value = (uint16_t)(value + 0x0111);
            state = 3;
            break;
        case 1:
            value ^= 0x2222;
            state = 4;
            break;
        case 2:
            value = rotate_left(value, 3);
            state = 0;
            break;
        case 3:
            value = (uint16_t)(value - 0x0333);
            state = 1;
            break;
        default:
            value = (uint16_t)(value + (uint16_t)(i * 17u));
            state = 2;
            break;
        }
    }

    return (uint16_t)(value ^ state);
}

static NOINLINE uint16_t
select_mix(int16_t a, int16_t b, uint16_t x, uint16_t y, uint8_t flag)
{
    const int16_t low = a < b ? a : b;
    const uint16_t high = x > y ? x : y;
    return (uint16_t)((uint16_t)low ^ high ^
                      (flag != 0 ? 0xaaaa : 0x5555));
}

int avm_test_main(void)
{
    uint16_t c0 = 0;
    for(uint8_t i = 0; i < 12; ++i)
        c0 = (uint16_t)(c0 + dense_switch(i));

    const uint16_t sparse_inputs[] = {1, 17, 257, 4096, 0x8000, 7};
    uint16_t c1 = 0x0f0f;
    for(uint8_t i = 0; i < 6; ++i)
        c1 = (uint16_t)(rotate_left(c1, 1) ^ sparse_switch(sparse_inputs[i]));

    const uint16_t c2 = loop_control(0x6d2b);
    const uint16_t c3 = run_state_machine(7);
    const uint16_t c4 = select_mix(-200, 123, 0x1234, 0xf00d, 1);

    test_line16("C0", c0);
    test_line16("C1", c1);
    test_line16("C2", c2);
    test_line16("C3", c3);
    test_line16("C4", c4);

    return c0 != 0x04c0 || c1 != 0x44bc || c2 != 0x41e4 ||
           c3 != 0xe610 || c4 != 0xa59f;
}
