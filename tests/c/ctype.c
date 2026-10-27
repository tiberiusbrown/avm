#include <ctype.h>
#include <stdint.h>

#include "test_hex_output.h"

/* ASCII oracle: upper, lower, digit, space, blank, control, punctuation, hex.
 * Bytes 128..255 and EOF have no classification flags in the C locale. */
static const uint8_t ascii_flags[128] = {
    0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x38, 0x28, 0x28, 0x28, 0x28, 0x20, 0x20,
    0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
    0x18, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40,
    0x84, 0x84, 0x84, 0x84, 0x84, 0x84, 0x84, 0x84, 0x84, 0x84, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40,
    0x40, 0x81, 0x81, 0x81, 0x81, 0x81, 0x81, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
    0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x40, 0x40, 0x40, 0x40, 0x40,
    0x40, 0x82, 0x82, 0x82, 0x82, 0x82, 0x82, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02,
    0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x40, 0x40, 0x40, 0x40, 0x20,
};

static int (*volatile classify[])(int) = {
    isalnum, isalpha, isblank, iscntrl, isdigit, isgraph,
    islower, isprint, ispunct, isspace, isupper, isxdigit
};
static int (*volatile lower_case)(int) = tolower;
static int (*volatile upper_case)(int) = toupper;

int avm_test_main(void)
{
    static const char upper[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    static const char lower[] = "abcdefghijklmnopqrstuvwxyz";
    for(int c = -1; c <= 255; ++c) {
        uint8_t flags = c >= 0 && c < 128 ? ascii_flags[c] : 0;
        const uint8_t expected[] = {
            (uint8_t)!!(flags & 7), (uint8_t)!!(flags & 3),
            (uint8_t)!!(flags & 16), (uint8_t)!!(flags & 32),
            (uint8_t)!!(flags & 4), (uint8_t)!!(flags & 71),
            (uint8_t)!!(flags & 2), (uint8_t)(!!(flags & 71) || c == ' '),
            (uint8_t)!!(flags & 64), (uint8_t)!!(flags & 8),
            (uint8_t)!!(flags & 1), (uint8_t)!!(flags & 128)
        };
        for(uint8_t i = 0; i < 12; ++i) {
            if(!!classify[i](c) != expected[i]) {
                test_line16("CHAR", (uint16_t)c);
                test_line16("FUNC", i);
                return 1;
            }
        }
        int want_lower = c;
        int want_upper = c;
        for(uint8_t i = 0; i < 26; ++i) {
            if(c == upper[i]) want_lower = lower[i];
            if(c == lower[i]) want_upper = upper[i];
        }
        if(lower_case(c) != want_lower || upper_case(c) != want_upper) {
            test_line16("CASE", (uint16_t)c);
            return 2;
        }
    }
    /* Direct calls, constant arguments, and single evaluation of expressions. */
    int c = '0';
    if(!isdigit(c++) || c != '1' || !isalpha('Z') || !isspace('\v') ||
       isblank('\n') || !isprint(' ') || isgraph(' ') ||
       tolower('Q') != 'q' || toupper('q') != 'Q')
        return 3;
    return 0;
}
