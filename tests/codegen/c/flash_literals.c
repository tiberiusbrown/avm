#include <stdint.h>
#include <stdio.h>
#include <string.h>

#include "test_hex_output.h"

#define CHECK(expression) do { if (!(expression)) return __LINE__; } while (0)
#define NOINLINE __attribute__((noinline))

// The literal stays in flash while the pointer and the array remain writable.
static const char *writable_pointer = "Hello";
static char writable_text[] = "Hello";

static NOINLINE const char *get_message(void)
{
    return "Hello from flash";
}

static NOINLINE uint16_t address_of(const void *p)
{
    return (uint16_t)(uintptr_t)p;
}

static NOINLINE char read_at(const char *p, uint8_t index)
{
    return p[index];
}

int avm_test_main(void)
{
    char buffer[32];
    const char *message = get_message();

    CHECK(address_of(message) >= 0x0B00u);
    CHECK(strlen(message) == 16u);
    CHECK(strcmp(message, "Hello from flash") == 0);
    CHECK(read_at(message, 6) == 'f');
    CHECK(memcmp(message, "Hello", 5) == 0);

    CHECK(address_of(&writable_pointer) < 0x0B00u);
    CHECK(address_of(writable_pointer) >= 0x0B00u);
    CHECK(read_at(writable_pointer, 0) == 'H');
    CHECK(strcmp(writable_pointer, "Hello") == 0);

    CHECK(address_of(writable_text) < 0x0B00u);
    CHECK(strcmp(writable_text, "Hello") == 0);
    writable_text[0] = 'J';
    CHECK(strcmp(writable_text, "Jello") == 0);
    CHECK(strcmp(writable_pointer, "Hello") == 0);

    memcpy(buffer, message, 6);
    CHECK(memcmp(buffer, "Hello ", 6) == 0);
    memmove(buffer, message + 1, 4);
    CHECK(memcmp(buffer, "ello", 4) == 0);
    CHECK(snprintf(buffer, sizeof buffer, message) == 16);
    CHECK(strcmp(buffer, "Hello from flash") == 0);
    CHECK(snprintf(buffer, sizeof buffer, "%s!", message) == 17);
    CHECK(strcmp(buffer, "Hello from flash!") == 0);

    test_puts("flash-literals=ok\n");
    return 0;
}
