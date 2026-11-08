#include <avm/pgmspace.h>
#include <stdint.h>

#include "test_hex_output.h"

#define CHECK(expression) do { if (!(expression)) return __LINE__; } while (0)
#define NOINLINE __attribute__((noinline))

struct mixed_record {
    uint8_t tag;
    uint16_t word;
    float number;
    const uint8_t AVM_PROGMEM *program;
};

static const uint8_t AVM_PROGMEM program_data[16] = {
    13, 29, 47, 61, 79, 97, 113, 131, 149, 167, 181, 199, 211, 227, 239, 251
};
static struct mixed_record records[8];
static uint8_t gaps[64];

_Static_assert(sizeof(const uint8_t AVM_PROGMEM *) == 3, "24-bit pointers");
_Static_assert(sizeof(struct mixed_record) == 10, "packed AVM fields");

static NOINLINE void populate_words(uint16_t* dst)
{
    for (uint8_t i = 0; i < 32; ++i)
        dst[i] = (uint16_t)((uint16_t)i * 2053u + 63u);
}

static NOINLINE void populate_records(struct mixed_record* dst)
{
    for (uint8_t i = 0; i < 8; ++i) {
        dst[i].tag = (uint8_t)(17 + i);
        dst[i].word = (uint16_t)(257u + (uint16_t)i * 4099u);
        dst[i].number = (float)(i + 1);
        dst[i].program = program_data + i;
    }
}

static NOINLINE void populate_gaps(uint8_t* dst)
{
    for (uint8_t i = 0; i < 32; ++i)
        dst[(uint8_t)(i * 2)] = (uint8_t)(13 + i * 3);
}

int avm_test_main(void)
{
    struct {
        uint8_t before[3];
        uint16_t words[32];
        uint8_t after[3];
    } local;
    for (uint8_t i = 0; i < 3; ++i) {
        local.before[i] = 0xa5;
        local.after[i] = 0x5a;
    }
    populate_words(local.words);
    for (uint8_t i = 0; i < 32; ++i)
        CHECK(local.words[i] == (uint16_t)((uint16_t)i * 2053u + 63u));
    for (uint8_t i = 0; i < 3; ++i) {
        CHECK(local.before[i] == 0xa5);
        CHECK(local.after[i] == 0x5a);
    }

    populate_records(records);
    for (uint8_t i = 0; i < 8; ++i) {
        CHECK(records[i].tag == (uint8_t)(17 + i));
        CHECK(records[i].word == (uint16_t)(257u + (uint16_t)i * 4099u));
        CHECK(records[i].number == (float)(i + 1));
        CHECK(records[i].program == program_data + i);
        CHECK(*records[i].program == program_data[i]);
    }

    for (uint8_t i = 0; i < 64; ++i)
        gaps[i] = 0x96;
    populate_gaps(gaps);
    for (uint8_t i = 0; i < 32; ++i) {
        CHECK(gaps[(uint8_t)(i * 2)] == (uint8_t)(13 + i * 3));
        CHECK(gaps[(uint8_t)(i * 2 + 1)] == 0x96);
    }
    test_puts("constant-init=ok\n");
    return 0;
}
