#include <stdint.h>

static uint8_t input[128];
static volatile uint16_t state_machine_result;

int avm_test_main(void)
{
    for (uint16_t i = 0; i < 128; ++i)
        input[i] = (uint8_t)(i * 37u + 11u);

    __avm_debug_break();

    uint8_t state = 0;
    uint16_t checksum = 0;
    for (uint8_t repeat = 0; repeat < 64; ++repeat) {
        for (uint16_t i = 0; i < 128; ++i) {
            uint8_t byte = input[i];
            switch (state) {
            case 0:
                checksum = (uint16_t)(checksum + byte);
                state = (byte & 1u) != 0 ? 1u : 2u;
                break;
            case 1:
                checksum ^= (uint16_t)((uint16_t)byte << 3);
                state = byte > 160u ? 3u : 0u;
                break;
            case 2:
                checksum = (uint16_t)(checksum - byte);
                state = (byte & 0x30u) == 0x30u ? 4u : 1u;
                break;
            case 3:
                checksum = (uint16_t)((checksum << 1) | (checksum >> 15));
                state = byte == 0 ? 0u : 4u;
                break;
            default:
                checksum = (uint16_t)(checksum + (uint16_t)(byte * 5u));
                state = (uint8_t)((byte >> 5) & 3u);
                break;
            }
        }
    }
    state_machine_result = (uint16_t)(checksum ^ state);

    __avm_debug_break();
    return 0;
}
