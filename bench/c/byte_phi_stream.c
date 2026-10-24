#include <avm/pgmspace.h>
#include <stdint.h>

static const uint8_t AVM_PROGMEM program_bytes[8] = {
    0, 13, 31, 32, 127, 128, 254, 255
};
static volatile uint8_t ram_bytes[8];
static volatile uint16_t byte_phi_stream_result;

/* The byte carried around each loop is defined by the previous load. The
 * comparison requires its full unsigned value, including at the loop header. */
static __attribute__((noinline)) uint16_t scan_ram(uint16_t count)
{
    uint8_t byte = 255;
    uint16_t small = 0;
    for (uint16_t i = 0; i < count; ++i) {
        small += byte < 32;
        byte = ram_bytes[i & 7u];
    }
    return small;
}

static __attribute__((noinline)) uint16_t scan_program(uint16_t count)
{
    uint8_t byte = 255;
    uint16_t small = 0;
    for (uint16_t i = 0; i < count; ++i) {
        small += byte < 32;
        byte = ((const volatile uint8_t AVM_PROGMEM *)program_bytes)[i & 7u];
    }
    return small;
}

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 8; ++i)
        ram_bytes[i] = (uint8_t)(i * 37u);

    __avm_debug_break();

    uint16_t checksum = 0;
    for (uint16_t repeat = 0; repeat < 128; ++repeat)
        checksum += (uint16_t)(scan_ram(65) + scan_program(65));
    byte_phi_stream_result = checksum;

    __avm_debug_break();
    return 0;
}
