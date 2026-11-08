#include <avm/pgmspace.h>
#include <stdint.h>

typedef const uint8_t AVM_PROGMEM *program_pointer;
_Static_assert(sizeof(program_pointer) == 3, "packed program pointers");

static const uint8_t AVM_PROGMEM pages[4][8] = {
    {17, 203, 5, 91, 128, 255, 64, 7},
    {29, 147, 83, 0, 251, 19, 177, 68},
    {239, 37, 101, 211, 11, 159, 73, 193},
    {43, 227, 61, 131, 23, 181, 97, 241}
};
static program_pointer const AVM_PROGMEM table[4] = {
    pages[0], pages[1], pages[2], pages[3]
};
static volatile uint8_t bytes[8] = {0, 255, 128, 127, 1, 254, 129, 126};

static __attribute__((noinline)) uint16_t mix(uint8_t value, uint16_t salt)
{
    return (uint16_t)(value + salt * 3u);
}

static __attribute__((noinline)) uint8_t read_page(program_pointer page, uint8_t index)
{
    return page[index & 7u];
}

static __attribute__((noinline)) void mutate(uint16_t* value, uint16_t delta)
{
    *value = (uint16_t)((*value + delta + 257u) ^ 0xa55au);
}

static __attribute__((noinline)) uint32_t exercise(uint8_t seed)
{
    struct {
        uint8_t before[3];
        uint16_t value;
        uint8_t after[3];
    } local = {{0x17, 0x81, 0xfe}, seed, {0xc3, 0x59, 0xa7}};
    uint16_t checksum = 0;
    for (uint8_t i = 0; i < 32; ++i) {
        uint8_t value = bytes[(i + seed) & 7u];
        program_pointer page = table[(i + seed) & 3u];
        checksum = mix(value, checksum);
        checksum = (uint16_t)(checksum + read_page(page, value));
        mutate(&local.value, checksum);
        checksum ^= local.value;
    }
    if (local.before[0] != 0x17 || local.before[1] != 0x81 || local.before[2] != 0xfe ||
        local.after[0] != 0xc3 || local.after[1] != 0x59 || local.after[2] != 0xa7)
        return UINT32_C(0x10000);
    return checksum;
}

int avm_test_main(void)
{
    static const uint8_t seeds[4] = {0, 1, 127, 255};
    static const uint16_t expected[4] = {35825, 15757, 25683, 16595};
    for (uint8_t i = 0; i < 4; ++i)
        if (exercise(seeds[i]) != expected[i])
            return 1;
    return 0;
}
