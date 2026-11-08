#include <stdint.h>
#include <string.h>

#include "test_hex_output.h"

#define CHECK(expression) do { if (!(expression)) return __LINE__; } while (0)
#define NOINLINE __attribute__((noinline))

// Defined in support/flash_cross_unit_impl.c.
extern const uint8_t impl_table[4];
extern const char impl_text[];
extern const uint16_t weak_words[2];
extern const uint16_t *const impl_pointer;

static NOINLINE uint8_t read_at(const uint8_t *p, uint8_t index)
{
    return p[index];
}

static NOINLINE uint16_t address_of(const void *p)
{
    return (uint16_t)(uintptr_t)p;
}

int avm_test_main(void)
{
    CHECK(address_of(impl_table) >= 0x0B00u);
    CHECK(read_at(impl_table, 3) == 0x44u);
    CHECK(strcmp(impl_text, "cross") == 0);
    CHECK(address_of(impl_text) >= 0x0B00u);
    CHECK(weak_words[1] == 0xbeefu);
    CHECK(*impl_pointer == 0x1234u);
    CHECK(impl_pointer == weak_words);
    CHECK(address_of(&impl_pointer) >= 0x0B00u);

    test_puts("flash-cross-unit=ok\n");
    return 0;
}
