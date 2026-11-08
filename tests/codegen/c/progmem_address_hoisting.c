#include <avm/pgmspace.h>
#include <stdint.h>

#define NOINLINE __attribute__((noinline))

/* The linker puts this object at 0x1fffc so indexing crosses a 16-bit address
 * boundary. Both the invariant base and the computed address need 24 bits. */
static const uint8_t AVM_PROGMEM bytes[8]
    __attribute__((section(".high_program_bytes"))) = {
        0, 13, 31, 32, 127, 128, 254, 255
    };
static const uint8_t expected_bytes[8] = {0, 13, 31, 32, 127, 128, 254, 255};
static volatile uint16_t runtime_count;
static volatile int32_t runtime_offset;

static NOINLINE uint16_t scan_constant(uint16_t count)
{
    uint8_t byte = 255;
    uint16_t small = 0;
    for (uint16_t i = 0; i < count; ++i) {
        small += byte < 32;
        byte = ((const volatile uint8_t AVM_PROGMEM *)bytes)[i & 7u];
    }
    return small;
}

static NOINLINE uint16_t scan_dynamic(
    const volatile uint8_t AVM_PROGMEM *base, uint16_t count)
{
    uint16_t sum = 0;
    uint8_t state = 0;
    for (uint16_t i = 0; i < count; ++i) {
        state = base[(state + i * 13u) & 7u];
        sum ^= (uint16_t)((uint16_t)state << (i & 7u));
    }
    return sum;
}

/* Keep the pointer and signed offset live after indexing. The returned bits
 * check all 24 address bits, while the load checks the actual location. */
static NOINLINE uint32_t gather(const volatile uint8_t AVM_PROGMEM *base,
                                int32_t offset)
{
    uint8_t value = base[offset];
    return ((uint32_t)base + (uint32_t)offset) ^ value;
}

/* Several live accumulators force allocation to choose between preserving
 * the invariant pair and rematerializing it instead of spilling hot values. */
static NOINLINE uint32_t crowded(uint16_t count)
{
    uint32_t a = 0x12345678UL, b = 0x87654321UL;
    uint16_t c = 0x1357, d = 0x2468;
    for (uint16_t i = 0; i < count; ++i) {
        uint8_t value = ((const volatile uint8_t AVM_PROGMEM *)bytes)[i & 7u];
        a += value;
        b ^= a;
        c += value;
        d ^= c;
    }
    return a ^ b ^ c ^ d;
}

int avm_test_main(void)
{
    uint32_t address = (uint32_t)bytes;
    if (address != 0x1fffcUL || sizeof(const uint8_t AVM_PROGMEM *) != 3)
        return 1;

    for (uint16_t count = 0; count <= 129; ++count) {
        runtime_count = count;
        uint16_t small = 0, sum = 0;
        uint8_t previous = 255, state = 0;
        uint32_t a = 0x12345678UL, b = 0x87654321UL;
        uint16_t c = 0x1357, d = 0x2468;
        for (uint16_t i = 0; i < count; ++i) {
            small += previous < 32;
            previous = expected_bytes[i & 7u];
            state = expected_bytes[(state + i * 13u) & 7u];
            sum ^= (uint16_t)((uint16_t)state << (i & 7u));
            a += previous;
            b ^= a;
            c += previous;
            d ^= c;
        }
        if (scan_constant(runtime_count) != small ||
            scan_dynamic(bytes, runtime_count) != sum ||
            crowded(runtime_count) != (a ^ b ^ c ^ d))
            return 2;
    }

    for (uint16_t i = 0; i < 8; ++i) {
        runtime_offset = i;
        if (gather(bytes, runtime_offset) !=
            ((address + i) ^ expected_bytes[i]))
            return 3;
        runtime_offset = (int32_t)i - 7;
        if (gather(bytes + 7, runtime_offset) !=
            ((address + i) ^ expected_bytes[i]))
            return 4;
    }
    return 0;
}
