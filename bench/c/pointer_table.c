#include <stdint.h>

static uint8_t rows[8][24];
static uint8_t *row_pointers[8];
static volatile uint16_t pointer_table_result;

int avm_test_main(void)
{
    for (uint8_t row = 0; row < 8; ++row) {
        row_pointers[row] = rows[(row * 3u) & 7u];
        for (uint8_t column = 0; column < 24; ++column)
            rows[row][column] = (uint8_t)(row * 31u + column * 7u);
    }

    __avm_debug_break();

    uint16_t checksum = 0;
    for (uint8_t repeat = 0; repeat < 32; ++repeat) {
        for (uint8_t row = 0; row < 8; ++row) {
            uint8_t *p = row_pointers[row];
            uint8_t column = (uint8_t)((checksum + repeat) % 24u);
            uint8_t value = p[column];
            p[column] = (uint8_t)(value + row);
            checksum = (uint16_t)(checksum + p[column] + p[23u - column]);
        }
    }
    pointer_table_result = checksum;

    __avm_debug_break();
    return 0;
}
