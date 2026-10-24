#include <avm/pgmspace.h>
#include <stdint.h>

typedef const uint8_t AVM_PROGMEM *program_pointer;
static const uint8_t AVM_PROGMEM pages[4][8] = {
    {17, 203, 5, 91, 128, 255, 64, 7},
    {29, 147, 83, 0, 251, 19, 177, 68},
    {239, 37, 101, 211, 11, 159, 73, 193},
    {43, 227, 61, 131, 23, 181, 97, 241}
};
static program_pointer const AVM_PROGMEM table[4] = {
    pages[0], pages[1], pages[2], pages[3]
};
static uint8_t values[32];
static volatile uint16_t normalized_loads_result;

static __attribute__((noinline)) uint16_t mix_byte(uint8_t value, uint16_t salt)
{
    return (uint16_t)(value + salt * 3u);
}

static __attribute__((noinline)) uint8_t read_page(program_pointer page, uint8_t index)
{
    return page[index & 7u];
}

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 32; ++i)
        values[i] = (uint8_t)(i * 37u + 129u);

    __avm_debug_break();

    uint16_t checksum = 0;
    for (uint8_t repeat = 0; repeat < 16; ++repeat) {
        for (uint8_t i = 0; i < 32; ++i) {
            uint8_t value = values[(i + repeat) & 31u];
            program_pointer page = table[(value + repeat) & 3u];
            checksum = mix_byte(value, checksum);
            checksum = (uint16_t)(checksum + read_page(page, i));
        }
    }
    normalized_loads_result = checksum;

    __avm_debug_break();
    return 0;
}
