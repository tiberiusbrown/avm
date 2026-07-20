#include <math.h>
#include <string.h>

float direct_math(float x, float y) {
    return sinf(x) + powf(x, y);
}

float parenthesized_math(float x) {
    return (sinf)(x);
}

float (*math_address(void))(float) {
    return &sinf;
}

void *direct_copy(void *dst, const void *src, size_t size) {
    return memcpy(dst, src, size);
}

void *(*copy_address(void))(void *, const void *, size_t) {
    return &memcpy;
}
