#include <stdint.h>

#include "test_hex_output.h"

#define NOINLINE __attribute__((noinline))

struct record {
    uint16_t x;
    uint16_t y;
    uint8_t padding[6];
    uint8_t id;
    uint8_t tail[7];
};

_Static_assert(sizeof(struct record) == 18, "record stride");

static struct record records[8];
static volatile uint8_t seed = 7;

static NOINLINE uint16_t scan(const struct record *data, uint8_t count)
{
    uint16_t sum = 0;
    for(uint8_t i = 0; i < count; ++i) {
        if(data[i].id == 0)
            continue;
        sum = (uint16_t)(sum + data[i].x + data[i].y + i);
    }
    return sum;
}

static NOINLINE uint16_t reverse_scan(const struct record *data, uint8_t count)
{
    uint16_t sum = 0;
    while(count != 0) {
        --count;
        sum = (uint16_t)(sum + data[count].x + data[count].y + data[count].id);
    }
    return sum;
}

// The affine outer scan surrounds an indirect inner search. Both the pointer
// and slot number are needed, as in the RPG actor draw-order construction.
static NOINLINE uint8_t sorted_slots(const struct record *data, uint8_t *output)
{
    uint8_t order[8];
    uint8_t count = 0;
    for(uint8_t slot = 0; slot < 8; ++slot) {
        if(data[slot].id == 0)
            continue;
        uint8_t index = count;
        while(index != 0 && data[order[index - 1]].y > data[slot].y) {
            order[index] = order[index - 1];
            --index;
        }
        order[index] = slot;
        ++count;
    }
    for(uint8_t i = 0; i < count; ++i)
        output[i] = order[i];
    return count;
}

static NOINLINE uint16_t multiply(uint16_t start, uint16_t limit)
{
    uint16_t sum = 0;
    for(uint16_t i = start; i < limit; ++i) {
        // Retaining an inner loop also exercises range-based multiply
        // selection where generic LSR cannot replace the outer recurrence.
        uint16_t product = (uint16_t)(i * 18u);
        for(uint8_t j = 0; j < seed; ++j)
            sum = (uint16_t)(sum + (product ^ j));
    }
    return sum;
}

int avm_test_main(void)
{
    uint16_t failures = 0;
    uint8_t order[8];
    for(uint8_t round = 0; round < 6; ++round) {
        uint16_t expected_scan = 0;
        uint16_t expected_reverse = 0;
        uint8_t expected_count = 0;
        for(uint8_t i = 0; i < 8; ++i) {
            records[i].x = (uint16_t)(seed * 129u + i * 71u);
            uint8_t mask = round < 4 ? 7 : 3;
            records[i].y = (uint16_t)(((7u - i + round) & mask) * 257u);
            records[i].id = (uint8_t)((i + round) * 127u);
            if(records[i].id != 0) {
                expected_scan = (uint16_t)(expected_scan + records[i].x + records[i].y + i);
                ++expected_count;
            }
            expected_reverse = (uint16_t)(expected_reverse + records[i].x +
                                           records[i].y + records[i].id);
        }
        failures += scan(records, 8) != expected_scan;
        failures += scan(records, 0) != 0;
        failures += reverse_scan(records, 8) != expected_reverse;
        failures += reverse_scan(records, 0) != 0;
        uint8_t count = sorted_slots(records, order);
        failures += count != expected_count;
        uint16_t seen = 0;
        for(uint8_t i = 0; i < count; ++i) {
            uint8_t slot = order[i];
            if(slot >= 8) {
                ++failures;
                continue;
            }
            failures += records[slot].id == 0 || (seen & (1u << slot)) != 0;
            seen |= (uint16_t)(1u << slot);
            if(i != 0) {
                failures += records[order[i - 1]].y > records[slot].y;
                if(records[order[i - 1]].y == records[slot].y)
                    failures += order[i - 1] >= slot;
            }
        }
    }
    // Include values above 255: a byte-multiply fallback must not truncate
    // indices merely because the loop happens to have a small trip count.
    failures += multiply(254, 259) != 0x7609;
    failures += multiply(0, 8) != 0x0de0;
    test_line16("failures", failures);
    return failures != 0;
}
