#include <stdint.h>

static uint16_t coordinates[32];
static volatile uint16_t boolean_select_result;

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 32; ++i)
        coordinates[i] = (uint16_t)((uint16_t)i * 2053u + 63u);

    __avm_debug_break();

    uint16_t checksum = 0;
    for (uint8_t repeat = 0; repeat < 32; ++repeat) {
        for (uint8_t i = 0; i < 32; ++i) {
            uint16_t value = coordinates[i];
            uint16_t x = (uint16_t)(value - 128u);
            uint16_t y = (uint16_t)(value - 64u);

            // Match the RPG camera clamps: materializing these predicates
            // before selecting zero used to produce CSET -> TST -> CMOV.
            x = value < x ? 0 : x;
            y = value < y ? 0 : y;
            checksum = (uint16_t)(checksum + x);
            checksum ^= y;
            coordinates[i] = (uint16_t)(value + 37u);
        }
    }
    boolean_select_result = checksum;

    __avm_debug_break();
    return 0;
}
