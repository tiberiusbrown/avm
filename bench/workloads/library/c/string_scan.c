#include <stdint.h>

static char strings[8][32];
static uint8_t data[128];
static volatile uint16_t string_scan_result;

static uint16_t string_length(const char *s)
{
    const char *p = s;
    while (*p != '\0')
        ++p;
    return (uint16_t)(p - s);
}

static const uint8_t *find_byte(const uint8_t *p, uint8_t value, uint16_t size)
{
    while (size != 0) {
        if (*p == value)
            return p;
        ++p;
        --size;
    }
    return 0;
}

static int16_t string_compare(const char *a, const char *b)
{
    while (*a != '\0' && *a == *b) {
        ++a;
        ++b;
    }
    return (int16_t)(uint8_t)*a - (int16_t)(uint8_t)*b;
}

int avm_test_main(void)
{
    for (uint8_t s = 0; s < 8; ++s) {
        for (uint8_t i = 0; i < 31; ++i)
            strings[s][i] = (char)('a' + (uint8_t)((i + s * 3u) % 26u));
        strings[s][(uint8_t)(8u + s * 3u)] = '\0';
        strings[s][31] = '\0';
    }
    for (uint8_t i = 0; i < 128; ++i)
        data[i] = (uint8_t)(i * 11u + 7u);

    __avm_debug_break();

    uint16_t result = 0;
    for (uint8_t repeat = 0; repeat < 64; ++repeat) {
        for (uint8_t s = 0; s < 8; ++s)
            result = (uint16_t)(result + string_length(strings[s]));
        for (uint8_t value = 0; value < 8; ++value) {
            const uint8_t *found = find_byte(data, (uint8_t)(value * 33u), 128);
            if (found != 0)
                result ^= (uint16_t)(found - data);
        }
        for (uint8_t s = 0; s < 7; ++s)
            result = (uint16_t)(result + (uint16_t)string_compare(strings[s],
                                                                  strings[s + 1]));
    }
    string_scan_result = result;

    __avm_debug_break();
    return 0;
}
