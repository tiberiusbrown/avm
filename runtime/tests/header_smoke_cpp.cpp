#include <math.h>
#include <string.h>

extern "C" float cpp_direct_math(float x) {
    return cosf(x);
}

extern "C" float (*cpp_math_address(void))(float) {
    return &cosf;
}

extern "C" void *cpp_parenthesized_copy(
    void *dst, const void *src, size_t size) {
    return (memmove)(dst, src, size);
}
