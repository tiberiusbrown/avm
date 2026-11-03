#include <stdint.h>
#include <stdio.h>
#include <string.h>

#include "../c/test_hex_output.h"

#define CHECK(c) do { if (!(c)) { test_line16("line", __LINE__); return 1; } } while (0)

namespace {
// The literal stays in flash while the pointer and the array remain writable.
const char *writable_pointer = "Hello";
char writable_text[] = "Hello";

__attribute__((noinline)) const char *get_message() {
    return "Hello from flash";
}

__attribute__((noinline)) char read_at(const char *p, unsigned index) {
    return p[index];
}

__attribute__((noinline)) uint16_t address_of(const void *p) {
    return (uint16_t)(uintptr_t)p;
}
}

extern "C" int avm_test_main() {
    char buffer[32];
    const char *message = get_message();

    CHECK(address_of(message) >= 0x0B00u);
    CHECK(strlen(message) == 16);
    CHECK(strcmp(message, "Hello from flash") == 0);
    CHECK(read_at(message, 6) == 'f');

    CHECK(address_of(&writable_pointer) < 0x0B00u);
    CHECK(address_of(writable_pointer) >= 0x0B00u);
    CHECK(strcmp(writable_pointer, "Hello") == 0);
    CHECK(address_of(writable_text) < 0x0B00u);
    writable_text[0] = 'J';
    CHECK(strcmp(writable_text, "Jello") == 0);

    CHECK(snprintf(buffer, sizeof buffer, "%s!", message) == 17);
    CHECK(strcmp(buffer, "Hello from flash!") == 0);

    test_puts("flash-literals=ok\n");
    return 0;
}
