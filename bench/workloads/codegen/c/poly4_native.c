#include <math.h>
#include <stdint.h>

static volatile float inputs[32];
static volatile float result;
int avm_test_main(void)
{
    for (uint8_t i = 0; i < 32; ++i) inputs[i] = 0.25f + i * 0.015625f;
    float sum = 0.0f;
    __avm_debug_break();
    for (uint8_t i = 0; i < 32; ++i) {
        float x = inputs[i];
        register float y __asm__("q2") = x;
        __asm__("fpoly 5, 0xbe800000, 0x3e000000, 0xbe800000, 0x3e000000, 0xbe800000" : "+r"(y));
        sum += y;
    }
    result = sum;
    __avm_debug_break();
    return 0;
}
