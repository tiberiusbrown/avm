#define AVM_MATH_IMPLEMENTATION
#include <math.h>

float sinf(float x) {
    return __avm_sinf(x);
}

float cosf(float x) {
    return __avm_cosf(x);
}

float atan2f(float y, float x) {
    return __avm_atan2f(y, x);
}

float tanf(float x) {
    return __avm_tanf(x);
}

float expf(float x) {
    return __avm_expf(x);
}

float logf(float x) {
    return __avm_logf(x);
}

float log2f(float x) {
    return __avm_log2f(x);
}

float log10f(float x) {
    return __avm_log10f(x);
}

float powf(float x, float y) {
    return __avm_powf(x, y);
}

float hypotf(float x, float y) {
    return __avm_hypotf(x, y);
}

float fmodf(float x, float y) {
    return __avm_fmodf(x, y);
}
