#include <math.h>
#include <new>
#include <stdio.h>
#include <string.h>

struct cpp_smoke_object {
    int value;
};

extern "C" cpp_smoke_object* cpp_place_object(void* storage) {
    return ::new (storage) cpp_smoke_object{7};
}

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

extern "C" int cpp_stdio_expression(
    char *dst, size_t size, const char *format, va_list args) {
    return (vsnprintf(dst, size, format, args) + 1);
}

extern "C" int cpp_stdio_program_expression(
    char *dst, size_t size, const char AVM_PROGMEM *format, va_list args) {
    return (vsnprintf_P(dst, size, format, args) + 1);
}

extern "C" int cpp_stdio_parenthesized(
    char *dst, size_t size, const char *format, va_list args) {
    return (vsnprintf)(dst, size, format, args);
}

extern "C" int (*cpp_stdio_address(void))(
    char *, size_t, const char *, va_list) {
    return &vsnprintf;
}
