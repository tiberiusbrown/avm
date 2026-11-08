#include <uchar.h>
#include <errno.h>
#include <stdlib.h>
#include "../../../codegen/c/test_hex_output.h"

#define CHECK(expr) do { if(!(expr)) { test_line16("LINE", __LINE__); return 1; } } while(0)

_Static_assert(sizeof(char8_t) == 1, "char8_t is one byte");
_Static_assert(sizeof(char16_t) == 2, "char16_t is sixteen bits");
_Static_assert(sizeof(char32_t) == 4, "char32_t is thirty-two bits");
_Static_assert(sizeof(mbstate_t) == 1, "one-byte conversion state");

/* Each function is also addressable through a volatile pointer. */
static size_t (*volatile mbrtoc8_call)(char8_t*, const char*, size_t, mbstate_t*) = mbrtoc8;
static size_t (*volatile c8rtomb_call)(char*, char8_t, mbstate_t*) = c8rtomb;
static size_t (*volatile mbrtoc16_call)(char16_t*, const char*, size_t, mbstate_t*) = mbrtoc16;
static size_t (*volatile c16rtomb_call)(char*, char16_t, mbstate_t*) = c16rtomb;
static size_t (*volatile mbrtoc32_call)(char32_t*, const char*, size_t, mbstate_t*) = mbrtoc32;
static size_t (*volatile c32rtomb_call)(char*, char32_t, mbstate_t*) = c32rtomb;

int avm_test_main(void) {
    char buf[4];
    char8_t c8;
    char16_t c16;
    char32_t c32;
    mbstate_t st;

    /* mbrtoc16 and mbrtoc32 map each byte to the code point of the same value. */
    st = 0;
    errno = 0;
    CHECK(mbrtoc16_call(&c16, "A", 1, &st) == 1 && c16 == 'A');
    CHECK(mbrtoc16_call(&c16, "\0", 1, &st) == 0 && c16 == 0);
    CHECK(mbrtoc16_call(&c16, "\xe9", 1, &st) == 1 && c16 == 0xE9);
    CHECK(mbrtoc16_call(&c16, "A", 0, &st) == (size_t)-2);
    CHECK(mbrtoc16_call(NULL, NULL, 0, &st) == 0);
    CHECK(mbrtoc32_call(&c32, "\xff", 1, &st) == 1 && c32 == 0xFF);
    CHECK(mbrtoc32_call(&c32, "B", 1, &st) == 1 && c32 == 'B');
    CHECK(errno == 0);

    /* U+00E9 is C3 A9 in UTF-8. The first unit is returned now, the second on
     * the following call, which consumes no input. */
    st = 0;
    CHECK(mbrtoc8_call(&c8, "\xe9", 1, &st) == 1 && c8 == 0xC3);
    CHECK(mbrtoc8_call(&c8, "Q", 1, &st) == (size_t)-3 && c8 == 0xA9);
    CHECK(mbrtoc8_call(&c8, "Q", 1, &st) == 1 && c8 == 'Q');
    CHECK(mbrtoc8_call(&c8, "", 1, &st) == 0 && c8 == 0);
    CHECK(mbrtoc8_call(&c8, "A", 0, &st) == (size_t)-2);
    CHECK(mbrtoc8_call(NULL, NULL, 0, &st) == 0);

    /* The second unit can be discarded when no pointer receives it. */
    st = 0;
    CHECK(mbrtoc8_call(NULL, "\xff", 1, &st) == 1);
    CHECK(mbrtoc8_call(NULL, "\xff", 1, &st) == (size_t)-3);
    CHECK(mbrtoc8_call(NULL, "\xff", 1, &st) == 1);

    /* c8rtomb reassembles C3 A9 into the one-byte character E9. The lead
     * stores nothing and returns zero. */
    st = 0;
    errno = 0;
    buf[0] = '?';
    CHECK(c8rtomb_call(buf, 'A', &st) == 1 && buf[0] == 'A');
    CHECK(c8rtomb_call(buf, 0xC3, &st) == 0 && buf[0] == 'A');
    CHECK(c8rtomb_call(buf, 0xA9, &st) == 1 && (unsigned char)buf[0] == 0xE9);
    CHECK(c8rtomb_call(buf, 0xC2, &st) == 0);
    CHECK(c8rtomb_call(buf, 0x80, &st) == 1 && (unsigned char)buf[0] == 0x80);
    CHECK(errno == 0);

    /* Invalid units and unrepresentable sequences fail with EILSEQ. A pending
     * lead is cleared by the failure. */
    CHECK(c8rtomb_call(buf, 0x80, &st) == (size_t)-1 && errno == EILSEQ);
    errno = 0;
    CHECK(c8rtomb_call(buf, 0xE2, &st) == (size_t)-1 && errno == EILSEQ);
    errno = 0;
    CHECK(c8rtomb_call(buf, 0xC4, &st) == (size_t)-1 && errno == EILSEQ);
    errno = 0;
    CHECK(c8rtomb_call(buf, 0xC3, &st) == 0);
    CHECK(c8rtomb_call(buf, 'A', &st) == (size_t)-1 && errno == EILSEQ);
    errno = 0;
    CHECK(c8rtomb_call(buf, 'B', &st) == 1 && buf[0] == 'B');

    /* A null pointer for ps uses the function's internal state. */
    CHECK(c8rtomb_call(buf, 0xC3, NULL) == 0);
    CHECK(c8rtomb_call(buf, 0xA9, NULL) == 1 && (unsigned char)buf[0] == 0xE9);
    CHECK(c8rtomb_call(NULL, 0, NULL) == 1);

    /* c16rtomb and c32rtomb reject any value above the one-byte locale. */
    st = 0;
    errno = 0;
    CHECK(c16rtomb_call(buf, 0x41, &st) == 1 && buf[0] == 'A');
    CHECK(c16rtomb_call(buf, 0x100, &st) == (size_t)-1 && errno == EILSEQ);
    errno = 0;
    CHECK(c16rtomb_call(buf, 0xDC00, &st) == (size_t)-1 && errno == EILSEQ);
    errno = 0;
    CHECK(c32rtomb_call(buf, 0xE9, &st) == 1 && (unsigned char)buf[0] == 0xE9);
    CHECK(c32rtomb_call(buf, 0x100, &st) == (size_t)-1 && errno == EILSEQ);
    errno = 0;
    CHECK(c32rtomb_call(buf, 0x10000, &st) == (size_t)-1 && errno == EILSEQ);
    errno = 0;
    CHECK(c32rtomb_call(buf, 0xD800, &st) == (size_t)-1 && errno == EILSEQ);
    errno = 0;
    CHECK(c32rtomb_call(NULL, 0, &st) == 1);

    /* A high surrogate waits for its pair. Any pair is above the locale, so the
     * completing unit fails. */
    st = 0;
    CHECK(c16rtomb_call(buf, 0xD83D, &st) == 0);
    CHECK(c16rtomb_call(buf, 0xDE00, &st) == (size_t)-1 && errno == EILSEQ);
    errno = 0;
    CHECK(c16rtomb_call(buf, 'C', &st) == 1 && buf[0] == 'C');
    CHECK(c16rtomb_call(buf, 0xD83D, &st) == 0);
    CHECK(c16rtomb_call(buf, 'D', &st) == (size_t)-1 && errno == EILSEQ);
    errno = 0;
    CHECK(c16rtomb_call(buf, 'E', &st) == 1 && buf[0] == 'E');
    CHECK(c16rtomb_call(NULL, 0, &st) == 1);

    return 0;
}
