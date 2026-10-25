#include <math.h>
#include <stdint.h>

static __attribute__((noinline)) float target_math(uint8_t operation, float x,
                                                 float y)
{
    switch (operation) {
    case 0: return __avm_sqrtf(x);
    case 1: return __avm_sinf(x);
    case 2: return __avm_cosf(x);
    case 3: return __avm_atan2f(x, y);
    case 4: return __avm_tanf(x);
    case 5: return __avm_expf(x);
    case 6: return __avm_logf(x);
    case 7: return __avm_log2f(x);
    case 8: return __avm_log10f(x);
    case 9: return __avm_powf(x, y);
    case 10: return __avm_hypotf(x, y);
    default: return __avm_fmodf(x, y);
    }
}

static float (*const functions[])(float) = {
    sqrtf, sinf, cosf, tanf, expf, logf, log2f, log10f
};

int avm_test_main(void)
{
    volatile float input = 0.75f;
    float x = input;
    for (uint8_t i = 0; i < 12; ++i) {
        float result = target_math(i, x, 1.25f);
        float expected;
        if (i < 3) expected = functions[i](x);
        else if (i == 3) expected = atan2f(x, 1.25f);
        else if (i < 9) expected = functions[i-1](x);
        else if (i == 9) expected = powf(x, 1.25f);
        else if (i == 10) expected = hypotf(x, 1.25f);
        else expected = fmodf(x, 1.25f);
        if (result != expected) return 1;
    }
    return 0;
}
