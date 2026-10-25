#include <stdint.h>

#include "test_hex_output.h"

#define NOINLINE __attribute__((noinline))

static volatile uint8_t input;
static volatile uint8_t observed;

static NOINLINE uint16_t bounded(uint8_t limit)
{
    uint16_t sum = 0;
    for(uint8_t i = 0; i < limit; ++i) {
        // The inner loop keeps the byte induction variable live across blocks.
        for(uint8_t j = 0; j < 3; ++j)
            sum = (uint16_t)(sum + (i ^ j));
        observed = i;
    }
    return sum;
}

static NOINLINE uint16_t fixed(void)
{
    uint16_t sum = 0;
    for(uint8_t i = 0; i < 32; ++i)
        for(uint8_t j = 0; j < input; ++j)
            sum = (uint16_t)(sum + i);
    return sum;
}

// These recurrences must retain byte wrapping. The equality is tested after
// the update, including 255 -> 0 and 0 -> 255, with signed byte users as well.
static NOINLINE uint16_t wrapping(uint8_t start, uint8_t stop, uint8_t down)
{
    uint16_t sum = 0;
    uint8_t i = start;
    do {
        i = down ? (uint8_t)(i - 1u) : (uint8_t)(i + 1u);
        sum = (uint16_t)(sum + i + ((int8_t)i < 0 ? 17u : 0u));
        observed = i;
    } while(i != stop);
    return sum;
}

static NOINLINE uint16_t reference(uint8_t start, uint8_t stop, uint8_t down)
{
    uint16_t sum = 0;
    uint16_t i = start;
    do {
        i = (uint16_t)((i + (down ? 255u : 1u)) & 255u);
        sum = (uint16_t)(sum + i + (i >= 128 ? 17u : 0u));
    } while(i != stop);
    return sum;
}

int avm_test_main(void)
{
    static const uint8_t boundaries[] = {0, 1, 31, 32, 127, 128, 254, 255};
    uint16_t failures = 0;
    for(uint8_t k = 0; k < sizeof(boundaries); ++k) {
        input = boundaries[k];
        uint8_t limit = input;
        uint16_t expected = 0;
        for(uint16_t i = 0; i < limit; ++i)
            for(uint16_t j = 0; j < 3; ++j)
                expected = (uint16_t)(expected + (i ^ j));
        observed = 99;
        failures += bounded(limit) != expected;
        failures += observed != (limit == 0 ? 99 : (uint8_t)(limit - 1u));
        input = k;
        failures += fixed() != (uint16_t)(496u * k);

        // Equal endpoints require a complete 256-step cycle. Nearby endpoints
        // exercise short loops both with and without crossing a byte boundary.
        for(uint8_t down = 0; down < 2; ++down) {
            uint8_t stop = (uint8_t)(limit + (down ? 252u : 4u));
            failures += wrapping(limit, stop, down) != reference(limit, stop, down);
            failures += observed != stop;
            failures += wrapping(limit, limit, down) != reference(limit, limit, down);
            failures += observed != limit;
        }
    }
    test_line16("failures", failures);
    return failures != 0;
}
