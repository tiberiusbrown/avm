#include <stdint.h>

static uint8_t lengths[32];
static uint8_t values[128];
static volatile uint16_t loop_shapes_result;

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 32; ++i)
        lengths[i] = (uint8_t)(i % 9u + 1u);
    for (uint8_t i = 0; i < 128; ++i)
        values[i] = (uint8_t)(i * 13u + 5u);

    __avm_debug_break();

    uint16_t checksum = 0;
    for (uint8_t repeat = 0; repeat < 32; ++repeat) {
        uint8_t i = 0;
        do {
            uint8_t remaining = lengths[i];
            while (remaining != 0) {
                uint8_t value = values[(uint8_t)(i * 3u + remaining)];
                --remaining;
                if ((value & 7u) == 0)
                    continue;
                checksum = (uint16_t)(checksum + value);
                if (value > 240u)
                    break;
            }
            ++i;
        } while (i < 32);
    }
    loop_shapes_result = checksum;

    __avm_debug_break();
    return 0;
}
