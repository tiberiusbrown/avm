#include <stdint.h>

static volatile uint8_t input[8];
static volatile uint16_t stack_base_nested_result;

int avm_test_main(void)
{
    for(uint8_t i = 0; i < 8; ++i)
        input[i] = (uint8_t)((7u - i) * 31u);

    __avm_debug_break();

    uint8_t values[8];
    // Word indices leave room for a shared base. record_stride_nested covers
    // byte indices and indirect record accesses under greater register pressure.
    for(uint16_t repeat = 0; repeat < 16; ++repeat) {
        for(uint16_t slot = 0; slot < 8; ++slot) {
            uint8_t value = input[slot];
            uint16_t index = slot;
            while(index != 0 && values[index - 1] > value) {
                values[index] = values[index - 1];
                --index;
            }
            values[index] = value;
        }
    }
    uint16_t sum = 0;
    for(uint8_t i = 0; i < 8; ++i)
        sum = (uint16_t)(sum * 3u + values[i]);
    stack_base_nested_result = sum;

    __avm_debug_break();
    return 0;
}
