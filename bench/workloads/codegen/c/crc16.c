#include <stdint.h>

static uint8_t data[128];
static volatile uint16_t crc_result;

int avm_test_main(void)
{
    for (uint16_t i = 0; i < 128; ++i)
        data[i] = (uint8_t)(i * 29u + 17u);

    __avm_debug_break();

    uint16_t crc = 0xffffu;
    for (uint8_t repeat = 0; repeat < 8; ++repeat) {
        for (uint16_t i = 0; i < 128; ++i) {
            crc ^= (uint16_t)data[i] << 8;
            for (uint8_t bit = 0; bit < 8; ++bit)
                crc = (crc & 0x8000u) != 0
                          ? (uint16_t)((crc << 1) ^ 0x1021u)
                          : (uint16_t)(crc << 1);
        }
    }
    crc_result = crc;

    __avm_debug_break();
    return 0;
}
