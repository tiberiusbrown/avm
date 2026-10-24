#include <avm/pgmspace.h>
#include <stdint.h>

static const uint8_t AVM_PROGMEM program_bytes[8] = {
    0, 1, 127, 128, 129, 254, 255, 37
};
static volatile uint8_t ram_byte;
static volatile uint8_t choose;

static __attribute__((noinline)) uint16_t consume(uint8_t byte, uint16_t salt)
{
    return (uint16_t)((uint16_t)byte * 257u + salt);
}

static __attribute__((noinline)) uint16_t ram_path(uint16_t salt)
{
    uint8_t byte = ram_byte;
    if (choose)
        return consume(byte, salt);
    return consume(byte, (uint16_t)(salt ^ 0xa55au));
}

static __attribute__((noinline)) uint16_t program_path(
    const volatile uint8_t AVM_PROGMEM *address, uint16_t salt)
{
    uint8_t byte = *address;
    if (choose)
        return consume(byte, salt);
    return consume(byte, (uint16_t)(salt ^ 0xa55au));
}

static __attribute__((noinline)) uint16_t ram_phi(void)
{
    uint8_t byte = 255;
    uint16_t small = 0;
    for (uint16_t i = 0; i < 4; ++i) {
        small += byte < 32;
        byte = ram_byte;
    }
    return small;
}

static __attribute__((noinline)) uint16_t program_phi(void)
{
    uint8_t byte = 255;
    uint16_t small = 0;
    for (uint16_t i = 0; i < 9; ++i) {
        small += byte < 32;
        byte = ((const volatile uint8_t AVM_PROGMEM *)program_bytes)[i & 7u];
    }
    return small;
}

int avm_test_main(void)
{
    for (uint16_t value = 0; value < 256; ++value) {
        ram_byte = (uint8_t)value;
        if (ram_phi() != (value < 32 ? 3 : 0))
            return 3;
        for (uint8_t path = 0; path < 2; ++path) {
            choose = path;
            uint16_t salt = path ? 0x1234u : (0x1234u ^ 0xa55au);
            uint16_t expected = (uint16_t)(value * 257u + salt);
            if (ram_path(0x1234u) != expected)
                return 1;
            uint8_t index = (uint8_t)(value & 7u);
            static const uint8_t reference[8] = {0, 1, 127, 128, 129, 254, 255, 37};
            expected = (uint16_t)((uint16_t)reference[index] * 257u + salt);
            if (program_path(program_bytes + index, 0x1234u) != expected)
                return 2;
        }
    }
    if (program_phi() != 2)
        return 4;
    return 0;
}
