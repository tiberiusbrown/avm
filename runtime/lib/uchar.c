#include <uchar.h>
#include <errno.h>

/* Without a live pointer, each function keeps its own conversion state. */
static mbstate_t mbrtoc8_state;
static mbstate_t c8rtomb_state;
static mbstate_t c16rtomb_state;

/* Every C-locale byte b is the code point b, so only code points below 256
 * can be stored. A code point above 255 has no byte in the locale, and an
 * ill-formed input is rejected as an encoding error. */
static size_t encoding_error(void) {
    errno = EILSEQ;
    return (size_t)-1;
}

size_t mbrtoc8(char8_t *restrict pc8, const char *restrict s, size_t n,
               mbstate_t *restrict ps) {
    unsigned char pending;
    if (!ps) ps = &mbrtoc8_state;
    if (!s) {
        pc8 = NULL;
        s = "";
        n = 1;
    }
    pending = *ps;
    if (pending) {
        /* The second unit of a two-unit code point consumes no input. */
        *ps = 0;
        if (pc8) *pc8 = pending;
        return (size_t)-3;
    }
    if (n == 0) return (size_t)-2;
    {
        unsigned char byte = (unsigned char)*s;
        if (byte < 0x80) {
            if (pc8) *pc8 = byte;
            return byte != 0;
        }
        /* U+0080..U+00FF encode as a lead unit C2 or C3, then 80..BF. */
        if (pc8) *pc8 = (char8_t)(0xC0u | (byte >> 6));
        *ps = (mbstate_t)(0x80u | (byte & 0x3Fu));
        return 1;
    }
}

size_t c8rtomb(char *restrict s, char8_t c8, mbstate_t *restrict ps) {
    char discard;
    unsigned char lead;
    if (!ps) ps = &c8rtomb_state;
    if (!s) {
        s = &discard;
        c8 = 0;
    }
    lead = *ps;
    *ps = 0;
    if (lead) {
        if ((c8 & 0xC0u) != 0x80u) return encoding_error();
        *s = (char)(((lead & 0x1Fu) << 6) | (c8 & 0x3Fu));
        return 1;
    }
    if (c8 < 0x80u) {
        *s = (char)c8;
        return 1;
    }
    /* Only the leads for U+0080..U+00FF can begin a representable character. */
    if (c8 == 0xC2u || c8 == 0xC3u) {
        *ps = (mbstate_t)c8;
        return 0;
    }
    return encoding_error();
}

size_t mbrtoc16(char16_t *restrict pc16, const char *restrict s, size_t n,
                mbstate_t *restrict ps) {
    unsigned char byte;
    (void)ps;
    if (!s) {
        pc16 = NULL;
        s = "";
        n = 1;
    }
    if (n == 0) return (size_t)-2;
    byte = (unsigned char)*s;
    if (pc16) *pc16 = byte;
    return byte != 0;
}

size_t c16rtomb(char *restrict s, char16_t c16, mbstate_t *restrict ps) {
    char discard;
    if (!ps) ps = &c16rtomb_state;
    if (!s) {
        s = &discard;
        c16 = 0;
    }
    if (*ps) {
        /* A low surrogate completes a pair above U+FFFF. Any other unit is
         * invalid after a high surrogate. Both cases fail. */
        *ps = 0;
        return encoding_error();
    }
    if (c16 < 0x100u) {
        *s = (char)c16;
        return 1;
    }
    if (c16 >= 0xD800u && c16 <= 0xDBFFu) {
        /* The high surrogate is held as one flag; no value is stored yet. */
        *ps = 1;
        return 0;
    }
    return encoding_error();
}

size_t mbrtoc32(char32_t *restrict pc32, const char *restrict s, size_t n,
                mbstate_t *restrict ps) {
    unsigned char byte;
    (void)ps;
    if (!s) {
        pc32 = NULL;
        s = "";
        n = 1;
    }
    if (n == 0) return (size_t)-2;
    byte = (unsigned char)*s;
    if (pc32) *pc32 = byte;
    return byte != 0;
}

size_t c32rtomb(char *restrict s, char32_t c32, mbstate_t *restrict ps) {
    char discard;
    (void)ps;
    if (!s) {
        s = &discard;
        c32 = 0;
    }
    if (c32 < 0x100u) {
        *s = (char)c32;
        return 1;
    }
    return encoding_error();
}
