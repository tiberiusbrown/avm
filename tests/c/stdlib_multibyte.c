#include <stdlib.h>
#include <errno.h>
#include "test_hex_output.h"

#define CHECK(expr) do { if(!(expr)) { test_line16("LINE", __LINE__); return 1; } } while(0)

static int (*volatile length_call)(const char*, size_t) = mblen;
static int (*volatile decode_call)(wchar_t*, const char*, size_t) = mbtowc;
static int (*volatile encode_call)(char*, wchar_t) = wctomb;
static size_t (*volatile widen_call)(wchar_t*, const char*, size_t) = mbstowcs;
static size_t (*volatile narrow_call)(char*, const wchar_t*, size_t) = wcstombs;

int avm_test_main(void) {
    wchar_t wide[4];
    char narrow[4];
    errno = EDOM;
    CHECK(sizeof(wchar_t) == 1 && (wchar_t)-1 == 255);
    CHECK(MB_CUR_MAX == 1);
    CHECK(length_call(NULL, 0) == 0 && length_call(NULL, 10) == 0);
    CHECK(decode_call(NULL, NULL, 0) == 0);
    wide[0] = 42;
    CHECK(decode_call(wide, NULL, 10) == 0 && wide[0] == 42);
    CHECK(encode_call(NULL, (wchar_t)255) == 0);
    CHECK(length_call("", 0) == -1 && length_call("a", 0) == -1);
    CHECK(decode_call(wide, "a", 0) == -1 && wide[0] == 42);
    for(unsigned int i = 0; i < 256; ++i) {
        char input = (char)i;
        wchar_t output = 42;
        char encoded = 42;
        CHECK(length_call(&input, 1) == (i != 0));
        CHECK(decode_call(&output, &input, 1) == (i != 0));
        CHECK(output == i);
        CHECK(decode_call(NULL, &input, 1) == (i != 0));
        CHECK(encode_call(&encoded, output) == 1);
        CHECK((unsigned char)encoded == i);
        /* Reset queries must not change the following conversion. */
        CHECK(length_call(NULL, 1) == 0 && encode_call(NULL, output) == 0);
    }
    const char bytes[] = {'A', (char)255, 0};
    const wchar_t chars[] = {'A', 255, 0};
    for(size_t n = 0; n <= 4; ++n) {
        for(size_t i = 0; i < 4; ++i) { wide[i] = 42; narrow[i] = 42; }
        size_t expected = n < 2 ? n : 2;
        CHECK(widen_call(wide, bytes, n) == expected);
        CHECK(narrow_call(narrow, chars, n) == expected);
        for(size_t i = 0; i < 4; ++i) {
            unsigned int value = i < n && i <= 2 ? chars[i] : 42;
            CHECK(wide[i] == value && (unsigned char)narrow[i] == value);
        }
    }
    wide[0] = 42; narrow[0] = 42;
    CHECK(widen_call(wide, "", 1) == 0 && wide[0] == 0);
    CHECK(narrow_call(narrow, chars + 2, 1) == 0 && narrow[0] == 0);
    CHECK(mblen("a", 1) == 1 && mbtowc(wide, "b", 1) == 1 && wide[0] == 'b');
    CHECK(wctomb(narrow, 'c') == 1 && narrow[0] == 'c');
    CHECK(mbstowcs(wide, "d", 2) == 1 && wide[0] == 'd' && wide[1] == 0);
    CHECK(wcstombs(narrow, chars, 3) == 2 && narrow[2] == 0);
    CHECK(widen_call(NULL, bytes, 0) == 2 && widen_call(NULL, bytes, 1) == 2);
    CHECK(narrow_call(NULL, chars, 0) == 2 && narrow_call(NULL, chars, 1) == 2);
    CHECK(errno == EDOM);
    return 0;
}
