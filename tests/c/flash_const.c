#include <avm/pgmspace.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

#include "test_hex_output.h"

#define CHECK(expression) do { if (!(expression)) return __LINE__; } while (0)
#define NOINLINE __attribute__((noinline))

struct flash_record {
    uint8_t tag;
    uint16_t word;
    const uint8_t *bytes;
};

// Immutable AS0 objects are placed in the flash window at 0x0B00-0xFFFF.
static const uint8_t table[4] = {1, 2, 3, 4};
static const uint16_t words[2] = {0x1234, 0xabcd};
static const uint32_t dwords[1] = {0x12345678};
static const char text[] = "AVM";
static const uint8_t zeros[8] = {0};
static const uint8_t *const table_pointer = table;
static const struct flash_record records[2] = {
    {1, 0x1111, table},
    {2, 0x2222, table + 2},
};

// Explicit program memory is address space one and keeps its 24-bit pointers.
static const uint8_t AVM_PROGMEM program_bytes[4] = {1, 2, 3, 4};
_Static_assert(sizeof(const uint8_t AVM_PROGMEM *) == 3, "24-bit pointers");
_Static_assert(sizeof(const uint8_t *) == 2, "16-bit flash pointers");

// Writable objects stay in SRAM. They may point into the flash window.
static uint8_t writable_table[4] = {9, 8, 7, 6};
static const struct flash_record *writable_record;

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
    uint8_t buffer[16];

    CHECK(address_of(table) >= 0x0B00u);
    CHECK(address_of(&table[3]) == address_of(table) + 3u);
    CHECK(read_at(table, 2) == 3u);
    CHECK(table_pointer[3] == 4u);
    CHECK(words[1] == 0xabcdu);
    CHECK(dwords[0] == 0x12345678u);
    CHECK(zeros[7] == 0u);
    CHECK(strlen(text) == 3u);
    CHECK(strcmp(text, "AVM") == 0);
    CHECK(memcmp(table, "\x01\x02", 2) == 0);
    CHECK(records[1].bytes == table + 2);
    CHECK(read_at(records[1].bytes, 1) == 4u);
    CHECK(*(program_bytes + 2) == 3u);

    writable_record = &records[1];
    CHECK(address_of(writable_record) >= 0x0B00u);
    CHECK(writable_record->tag == 2u);
    CHECK(writable_record->word == 0x2222u);
    CHECK(address_of(writable_table) < 0x0B00u);
    CHECK(read_at(writable_table, 1) == 8u);

    memcpy(buffer, table, sizeof table);
    CHECK(memcmp(buffer, table, sizeof table) == 0);
    CHECK(snprintf((char *)buffer, sizeof buffer, "n=%u",
                   (unsigned)(dwords[0] & 0xffu)) == 5);
    CHECK(strcmp((char *)buffer, "n=120") == 0);

    test_puts("flash-const=ok\n");
    return 0;
}
