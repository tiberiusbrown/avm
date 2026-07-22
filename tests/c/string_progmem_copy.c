#include <avm/pgmspace.h>
#include <stddef.h>
#include <stdint.h>
#include <string.h>

#include "test_hex_output.h"

#if defined(__clang__) || defined(__GNUC__)
#define NOINLINE __attribute__((noinline))
#else
#define NOINLINE
#endif

NOINLINE char *test_call_strncpy_P(char *dst,
                                   const char AVM_PROGMEM *src,
                                   size_t n)
{
    return strncpy_P(dst, src, n);
}

NOINLINE char *test_call_strncat_P(char *dst,
                                   const char AVM_PROGMEM *src,
                                   size_t n)
{
    return strncat_P(dst, src, n);
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

static const char AVM_PROGMEM p_cat[] = "cat";
static const char AVM_PROGMEM p_abcdef[] = "abcdef";
static const char AVM_PROGMEM p_dog[] = "dog";
static const char AVM_PROGMEM p_ignored[] = "ignored";
static const char AVM_PROGMEM p_wood[] = "wood";
static const char AVM_PROGMEM p_flower[] = "flower";
static const char AVM_PROGMEM p_berg[] = "berg";
static const char AVM_PROGMEM p_empty[] = "";
static const char AVM_PROGMEM p_go[] = "go";
static const char AVM_PROGMEM p_z[] = "Z";

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

    char *rp = test_call_strncpy_P(pad, p_cat, 8);
    char *rt = test_call_strncpy_P(trunc, p_abcdef, 3);
    char *re = test_call_strncpy_P(exact, p_dog, 4);
    char *rz = test_call_strncpy_P(zero, p_ignored, 0);

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

    char *rf = test_call_strncat_P(full, p_wood, 8);
    char *rc = test_call_strncat_P(cut, p_flower, 3);
    char *rn = test_call_strncat_P(nochange, p_berg, 0);
    char *rs = test_call_strncat_P(empty_source, p_empty, 4);
    char *rd = test_call_strncat_P(empty_dest, p_go, 2);

    if(rf == full) return_flags |= 0x0010;
    if(rc == cut) return_flags |= 0x0020;
    if(rn == nochange) return_flags |= 0x0040;
    if(rs == empty_source) return_flags |= 0x0080;
    if(rd == empty_dest) return_flags |= 0x0100;

    static char long_pad[263];
    fill_bytes(long_pad, 0xa5, sizeof(long_pad));
    char *rl = test_call_strncpy_P(long_pad, p_z, 260);
    if(rl == long_pad) return_flags |= 0x0200;

    static char long_cat[270];
    for(uint16_t i = 0; i < 257; ++i)
        long_cat[i] = 'd';
    long_cat[257] = '\0';
    fill_bytes(long_cat + 258, 0xb6, sizeof(long_cat) - 258);
    char *rcl = test_call_strncat_P(long_cat, p_go, 2);
    if(rcl == long_cat) return_flags |= 0x0400;

    const uint16_t hp = hash_bytes(pad, sizeof(pad));
    const uint16_t ht = hash_bytes(trunc, sizeof(trunc));
    const uint16_t he = hash_bytes(exact, sizeof(exact));
    const uint16_t hz = hash_bytes(zero, sizeof(zero));
    const uint16_t hf = hash_bytes(full, sizeof(full));
    const uint16_t hc = hash_bytes(cut, sizeof(cut));
    const uint16_t hn = hash_bytes(nochange, sizeof(nochange));
    const uint16_t hs = hash_bytes(empty_source, sizeof(empty_source));
    const uint16_t hd = hash_bytes(empty_dest, sizeof(empty_dest));
    const uint16_t hl = hash_bytes(long_pad, sizeof(long_pad));
    const uint16_t hcl = hash_bytes(long_cat, sizeof(long_cat));

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
    test_line16("LP", hl);
    test_line16("LC", hcl);

    static const uint8_t expect_pad[10] =
        {'c', 'a', 't', 0, 0, 0, 0, 0, 0xa5, 0xa5};
    static const uint8_t expect_trunc[7] =
        {'a', 'b', 'c', 0xcc, 0xcc, 0xcc, 0xcc};
    static const uint8_t expect_exact[6] =
        {'d', 'o', 'g', 0, 0x7e, 0x7e};
    static const uint8_t expect_zero[5] =
        {0x3c, 0x3c, 0x3c, 0x3c, 0x3c};

    int long_pad_ok = long_pad[0] == 'Z';
    for(uint16_t i = 1; i < 260; ++i)
        long_pad_ok &= long_pad[i] == '\0';
    long_pad_ok &= (uint8_t)long_pad[260] == 0xa5;
    long_pad_ok &= (uint8_t)long_pad[261] == 0xa5;
    long_pad_ok &= (uint8_t)long_pad[262] == 0xa5;

    int long_cat_ok = long_cat[257] == 'g' &&
                      long_cat[258] == 'o' &&
                      long_cat[259] == '\0' &&
                      (uint8_t)long_cat[260] == 0xb6;

    return return_flags != 0x07ff ||
           !bytes_equal(pad, expect_pad, sizeof(pad)) ||
           !bytes_equal(trunc, expect_trunc, sizeof(trunc)) ||
           !bytes_equal(exact, expect_exact, sizeof(exact)) ||
           !bytes_equal(zero, expect_zero, sizeof(zero)) ||
           !text_equal(full, "redwood") ||
           !text_equal(cut, "sunflo") ||
           !text_equal(nochange, "ice") ||
           !text_equal(empty_source, "oak") ||
           !text_equal(empty_dest, "go") ||
           !long_pad_ok || !long_cat_ok;
}
