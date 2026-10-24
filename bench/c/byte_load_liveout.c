#include <avm/pgmspace.h>
#include <stdint.h>

static const uint8_t AVM_PROGMEM program_bytes[8] = {
    0, 1, 127, 128, 129, 254, 255, 37
};
static volatile uint8_t ram_bytes[8];
static volatile uint8_t choose;
static volatile uint16_t byte_load_liveout_result;

static __attribute__((noinline)) uint16_t consume(uint8_t byte, uint16_t salt)
{
    return (uint16_t)((uint16_t)byte * 257u + salt);
}

static __attribute__((noinline)) uint16_t step(uint8_t index, uint16_t salt)
{
    uint8_t ram = ram_bytes[index];
    uint8_t program = ((const volatile uint8_t AVM_PROGMEM *)program_bytes)[index];
    if (choose)
        return (uint16_t)(consume(ram, salt) ^ consume(program, salt));
    return (uint16_t)(consume(program, (uint16_t)(salt ^ 0xa55au)) +
                      consume(ram, salt));
}

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 8; ++i)
        ram_bytes[i] = (uint8_t)(i * 37u + 129u);

    __avm_debug_break();

    uint16_t checksum = 0;
    for (uint16_t i = 0; i < 256; ++i) {
        choose = (uint8_t)(i & 1u);
        checksum ^= step((uint8_t)(i & 7u), (uint16_t)(i + checksum));
    }
    byte_load_liveout_result = checksum;

    __avm_debug_break();
    return 0;
}
