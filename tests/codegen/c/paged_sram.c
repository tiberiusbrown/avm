#include <stdint.h>

#include "test_hex_output.h"

static volatile struct {
    uint8_t prefix;
    uint16_t value;
    uint8_t suffix;
} global = {0x19, 0xa5c3, 0x26};

int avm_test_main(void)
{
    uint16_t failures = 0;
    failures += global.value != 0xa5c3;
    global.value = 0x81e7;
    global.suffix = 0xd9;
    failures += global.prefix != 0x19;
    failures += global.value != 0x81e7;
    failures += global.suffix != 0xd9;

    // The start is in page 4 and the second byte is in the framebuffer.
    volatile uint16_t *word = (volatile uint16_t *)(uintptr_t)0x04ff;
    volatile uint8_t *byte = (volatile uint8_t *)(uintptr_t)0x04ff;
    *word = 0xa572;
    *byte = 0xe9;
    failures += *byte != 0xe9;
    failures += *word != 0xa5e9;
    test_line16("failures", failures);
    return failures != 0;
}
