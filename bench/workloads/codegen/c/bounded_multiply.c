#include <stdint.h>

static volatile uint8_t length = 7;
static volatile uint16_t bounded_multiply_result;

int avm_test_main(void)
{
    __avm_debug_break();

    uint16_t sum = 0;
    for(uint8_t repeat = 0; repeat < 16; ++repeat) {
        for(uint16_t i = 0; i < 8; ++i) {
            uint16_t product = (uint16_t)(i * 18u);
            uint8_t count = length;
            for(uint8_t j = 0; j < count; ++j)
                sum = (uint16_t)(sum + (product ^ j));
        }
    }
    bounded_multiply_result = sum;

    __avm_debug_break();
    return 0;
}
