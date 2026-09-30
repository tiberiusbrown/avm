#include <stdint.h>

struct Accumulator {
    uint16_t first;
    uint16_t second;

    __attribute__((noinline)) uint16_t add(uint16_t value) {
        first = (uint16_t)(first + value);
        return (uint16_t)(first ^ second);
    }

    __attribute__((noinline)) uint16_t mix(uint16_t value) {
        second = (uint16_t)((second ^ value) + (value >> 2));
        return (uint16_t)(first + second);
    }
};

static volatile uint16_t member_pointers_result;

extern "C" int avm_test_main()
{
    Accumulator current{0x1234, 0x5678};
    uint16_t (Accumulator::*methods[])(uint16_t) = {
        &Accumulator::add, &Accumulator::mix};
    uint16_t Accumulator::*fields[] = {
        &Accumulator::first, &Accumulator::second};

    __avm_debug_break();

    uint16_t checksum = 0;
    for (uint16_t i = 0; i < 256; ++i) {
        unsigned selected = (checksum ^ i) & 1u;
        checksum ^= (current.*methods[selected])((uint16_t)(i * 19u));
        checksum = (uint16_t)(checksum + current.*fields[selected]);
    }
    member_pointers_result = checksum;

    __avm_debug_break();
    return 0;
}
