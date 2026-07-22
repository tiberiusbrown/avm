#include <stddef.h>
#include <stdint.h>
#include <string.h>

#include "test_hex_output.h"

#if defined(__clang__) || defined(__GNUC__)
#define NOINLINE __attribute__((noinline))
#else
#define NOINLINE
#endif

NOINLINE char *test_call_strncpy(char *dst, const char *src, size_t n)
{
    return strncpy(dst, src, n);
}

NOINLINE char *test_call_strncat(char *dst, const char *src, size_t n)
{
    return strncat(dst, src, n);
}

static uint16_t hash_bytes(const void *memory, size_t n)
{
    const uint8_t *p = (const uint8_t *)memory;
    uint16_t hash = 0x6d2b;

    for(size_t i = 0; i < n; ++i) {
        hash = (uint16_t)((uint16_t)(hash << 5) | (uint16_t)(hash >> 11));
        hash ^= p[i];
        hash = (uint16_t)(hash + (uint16_t)(i * 17u + 3u));
    }

    return hash;
}

static void fill_bytes(void *memory, uint8_t value, size_t n)
{
    uint8_t *p = (uint8_t *)memory;
    for(size_t i = 0; i < n; ++i)
        p[i] = value;
}

static int bytes_equal(const void *lhs, const void *rhs, size_t n)
{
    const uint8_t *a = (const uint8_t *)lhs;
    const uint8_t *b = (const uint8_t *)rhs;

    for(size_t i = 0; i < n; ++i)
        if(a[i] != b[i])
            return 0;
    return 1;
}

static int text_equal(const char *lhs, const char *rhs)
{
    while(*lhs == *rhs) {
        if(*lhs == '\0')
            return 1;
        ++lhs;
        ++rhs;
    }
    return 0;
}

int avm_test_main(void)
{
    char pad[10];
    char trunc[7];
    char exact[6];
    char zero[5];

    fill_bytes(pad, 0xa5, sizeof(pad));
    fill_bytes(trunc, 0xcc, sizeof(trunc));
    fill_bytes(exact, 0x7e, sizeof(exact));
    fill_bytes(zero, 0x3c, sizeof(zero));

    char *rp = test_call_strncpy(pad, "cat", 8);
    char *rt = test_call_strncpy(trunc, "abcdef", 3);
    char *re = test_call_strncpy(exact, "dog", 4);
    char *rz = test_call_strncpy(zero, "ignored", 0);

    uint16_t return_flags = 0;
    if(rp == pad) return_flags |= 0x0001;
    if(rt == trunc) return_flags |= 0x0002;
    if(re == exact) return_flags |= 0x0004;
    if(rz == zero) return_flags |= 0x0008;

    char full[12] = "red";
    char cut[12] = "sun";
    char nochange[8] = "ice";
    char empty_source[8] = "oak";
    char empty_dest[8] = "";

    char *rf = test_call_strncat(full, "wood", 8);
    char *rc = test_call_strncat(cut, "flower", 3);
    char *rn = test_call_strncat(nochange, "berg", 0);
    char *rs = test_call_strncat(empty_source, "", 4);
    char *rd = test_call_strncat(empty_dest, "go", 2);

    if(rf == full) return_flags |= 0x0010;
    if(rc == cut) return_flags |= 0x0020;
    if(rn == nochange) return_flags |= 0x0040;
    if(rs == empty_source) return_flags |= 0x0080;
    if(rd == empty_dest) return_flags |= 0x0100;

    const uint16_t hp = hash_bytes(pad, sizeof(pad));
    const uint16_t ht = hash_bytes(trunc, sizeof(trunc));
    const uint16_t he = hash_bytes(exact, sizeof(exact));
    const uint16_t hz = hash_bytes(zero, sizeof(zero));
    const uint16_t hf = hash_bytes(full, sizeof(full));
    const uint16_t hc = hash_bytes(cut, sizeof(cut));
    const uint16_t hn = hash_bytes(nochange, sizeof(nochange));
    const uint16_t hs = hash_bytes(empty_source, sizeof(empty_source));
    const uint16_t hd = hash_bytes(empty_dest, sizeof(empty_dest));

    test_line16("RF", return_flags);
    test_line16("NP", hp);
    test_line16("NT", ht);
    test_line16("NE", he);
    test_line16("NZ", hz);
    test_line16("CF", hf);
    test_line16("CT", hc);
    test_line16("CZ", hn);
    test_line16("CE", hs);
    test_line16("CD", hd);

    static const uint8_t expect_pad[10] =
        {'c', 'a', 't', 0, 0, 0, 0, 0, 0xa5, 0xa5};
    static const uint8_t expect_trunc[7] =
        {'a', 'b', 'c', 0xcc, 0xcc, 0xcc, 0xcc};
    static const uint8_t expect_exact[6] =
        {'d', 'o', 'g', 0, 0x7e, 0x7e};
    static const uint8_t expect_zero[5] =
        {0x3c, 0x3c, 0x3c, 0x3c, 0x3c};

    return return_flags != 0x01ff ||
           !bytes_equal(pad, expect_pad, sizeof(pad)) ||
           !bytes_equal(trunc, expect_trunc, sizeof(trunc)) ||
           !bytes_equal(exact, expect_exact, sizeof(exact)) ||
           !bytes_equal(zero, expect_zero, sizeof(zero)) ||
           !text_equal(full, "redwood") ||
           !text_equal(cut, "sunflo") ||
           !text_equal(nochange, "ice") ||
           !text_equal(empty_source, "oak") ||
           !text_equal(empty_dest, "go");
}
