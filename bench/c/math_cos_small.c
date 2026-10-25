#include <math.h>
#include <stdint.h>

/* Small/medium angles only: no large-angle reduction. */
static volatile float inputs[32] = {
    0.125f, -0.125f,
    0.25f, -0.25f,
    0.5f, -0.5f,
    0.6744f, -0.6744f,
    0.75f, -0.75f,
    1.0f, -1.0f,
    1.25f, -1.25f,
    1.5f, -1.5f,
    2.0f, -2.0f,
    3.0f, -3.0f,
    4.0f, -4.0f,
    8.0f, -8.0f,
    16.0f, -16.0f,
    32.0f, -32.0f,
    64.0f, -64.0f,
    128.0f, -128.0f
};
static volatile float result;

int avm_test_main(void)
{
    float sum = 0.0f;
    __avm_debug_break();
    for (uint8_t i = 0; i < 32; ++i) {
        float x = inputs[i];
        sum += cosf(x);
    }
    result = sum;
    __avm_debug_break();
    return 0;
}
