#include <math.h>
#include <new>
#include <avm.h>
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

extern "C" int (*cpp_snprintf_address(void))(
    char *, size_t, const char *, ...) {
    return &snprintf;
}

extern "C" int (*cpp_snprintf_program_address(void))(
    char *, size_t, const char AVM_PROGMEM *, ...) {
    return &snprintf_P;
}

// Every paired interface accepts either source address space under its
// ordinary C++ name. Explicit _P spellings remain available.
extern "C" void cpp_address_space_calls(
    char* dst, const char* ram, const char AVM_PROGMEM* flash,
    size_t n, va_list args) {
    memcpy(dst, ram, n);
    memcpy(dst, flash, n);
    memcmp(dst, ram, n);
    memcmp(dst, flash, n);
    strcmp(dst, ram);
    strcmp(dst, flash);
    strlen(ram);
    strlen(flash);
    strncpy(dst, ram, n);
    strncpy(dst, flash, n);
    strncat(dst, ram, n);
    strncat(dst, flash, n);
    strcpy(dst, ram);
    strcpy(dst, flash);
    strcat(dst, ram);
    strcat(dst, flash);
    vsnprintf(dst, n, ram, args);
    vsnprintf(dst, n, flash, args);
    snprintf(dst, n, ram, 7);
    snprintf(dst, n, flash, 7);
    avm_draw_text(0, 10, ram);
    avm_draw_text(0, 10, flash);
    avm_text_width(ram);
    avm_text_width(flash);
    avm_draw_textfv(0, 10, ram, args);
    avm_draw_textfv(0, 10, flash, args);
    avm_draw_textf(0, 10, ram, 7);
    avm_draw_textf(0, 10, flash, 7);
    strlen(F("abc"));
    strlen(PSTR("abc"));
    strcpy(dst, PSTR("abc"));
    avm_draw_text(0, 10, F("hello"));
    avm_draw_text(0, 10, PSTR("hello"));
    avm_text_width(F("hello"));
    avm_text_width(PSTR("hello"));
    avm_draw_textf(0, 10, F("%u"), 7u);
    avm_draw_textf(0, 10, PSTR("%u"), 7u);
    snprintf(dst, n, F("%u"), 7u);
    snprintf(dst, n, PSTR("%u"), 7u);
    memcpy_P(dst, flash, n);
    avm_draw_text_P(0, 10, flash);
    avm_text_width_P(flash);
    avm_draw_textfv_P(0, 10, flash, args);
    avm_draw_textf_P(0, 10, flash, 7);
}

extern "C" void cpp_address_space_pointers(
    char* dst, const void* ram, const void AVM_PROGMEM* flash, size_t n) {
    void* (*ram_copy)(void*, const void*, size_t) = &memcpy;
    void* (*flash_copy)(void*, const void AVM_PROGMEM*, size_t) = &memcpy;
    void* (*explicit_copy)(void*, const void AVM_PROGMEM*, size_t) = &memcpy_P;
    char* (*flash_strcpy)(char*, const char AVM_PROGMEM*) = &strcpy;
    (memcpy)(dst, ram, n);
    (memcpy)(dst, flash, n);
    ram_copy(dst, ram, n);
    flash_copy(dst, flash, n);
    explicit_copy(dst, flash, n);
    flash_strcpy(dst, (const char AVM_PROGMEM*)flash);
    const char* typed_ram = nullptr;
    const char AVM_PROGMEM* typed_flash = nullptr;
    (void)strlen(typed_ram);
    (void)strlen(typed_flash);
}
