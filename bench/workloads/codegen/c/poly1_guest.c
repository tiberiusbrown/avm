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
        float y = (-0.25f*x+0.125f);
        sum += y;
    }
    result = sum;
    __avm_debug_break();
    return 0;
}
