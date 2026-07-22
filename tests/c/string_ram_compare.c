#include <stddef.h>
#include <stdint.h>
#include <string.h>

#include "test_hex_output.h"

#if defined(__clang__) || defined(__GNUC__)
#define NOINLINE __attribute__((noinline))
#else
#define NOINLINE
#endif

NOINLINE int test_call_memcmp(const void *lhs, const void *rhs, size_t n)
{
    return memcmp(lhs, rhs, n);
}

NOINLINE int test_call_strcmp(const char *lhs, const char *rhs)
{
    return strcmp(lhs, rhs);
}

NOINLINE size_t test_call_strlen(const char *src)
{
    return strlen(src);
}

int avm_test_main(void)
{
    static const uint8_t eq_a[] = {0x11, 0x22, 0x33, 0x44, 0x55};
    static const uint8_t eq_b[] = {0x11, 0x22, 0x33, 0x44, 0x55};
    static const uint8_t low[] = {0x11, 0x22, 0x01, 0x44, 0x55};
    static const uint8_t high[] = {0x11, 0x22, 0xff, 0x44, 0x55};
    static const uint8_t high2[] = {0x11, 0x22, 0xfe, 0x44, 0x55};
    static const uint8_t low2[] = {0x11, 0x22, 0x02, 0x44, 0x55};
    static const uint8_t late_a[] = {1, 2, 3, 4, 0x55};
    static const uint8_t late_b[] = {1, 2, 3, 4, 0x50};

    static const char alpha[] = "Alpha";
    static const char alphz[] = "Alphz";
    static const char cat[] = "cat";
    static const char catalog[] = "catalog";
    static const char unsigned_hi[] = {(char)0xf0, '\0'};
    static const char unsigned_lo[] = {(char)0x10, '\0'};

    static char long_text[261];
    for(uint16_t i = 0; i < 260; ++i)
        long_text[i] = 'x';
    long_text[260] = '\0';

    const int me = test_call_memcmp(eq_a, eq_b, sizeof(eq_a));
    const int ml = test_call_memcmp(low, high, sizeof(low));
    const int mg = test_call_memcmp(high2, low2, sizeof(high2));
    const int mt = test_call_memcmp(late_a, late_b, sizeof(late_a));
    const int mz = test_call_memcmp(low, high, 0);

    const int se = test_call_strcmp(alpha, alpha);
    const int sl = test_call_strcmp(alpha, alphz);
    const int sg = test_call_strcmp(alphz, alpha);
    const int sp = test_call_strcmp(cat, catalog);
    const int sr = test_call_strcmp(catalog, cat);
    const int su = test_call_strcmp(unsigned_hi, unsigned_lo);
    const int sv = test_call_strcmp(unsigned_lo, unsigned_hi);

    const size_t l0 = test_call_strlen("");
    const size_t l1 = test_call_strlen("AVM!");
    const size_t ll = test_call_strlen(long_text);

    test_line16("ME", (uint16_t)me);
    test_line16("ML", (uint16_t)ml);
    test_line16("MG", (uint16_t)mg);
    test_line16("MT", (uint16_t)mt);
    test_line16("MZ", (uint16_t)mz);
    test_line16("SE", (uint16_t)se);
    test_line16("SL", (uint16_t)sl);
    test_line16("SG", (uint16_t)sg);
    test_line16("SP", (uint16_t)sp);
    test_line16("SR", (uint16_t)sr);
    test_line16("SU", (uint16_t)su);
    test_line16("SV", (uint16_t)sv);
    test_line16("L0", (uint16_t)l0);
    test_line16("L1", (uint16_t)l1);
    test_line16("LL", (uint16_t)ll);

    return me != 0 || ml != -254 || mg != 252 || mt != 5 || mz != 0 ||
           se != 0 || sl != -25 || sg != 25 || sp != -97 || sr != 97 ||
           su != 224 || sv != -224 || l0 != 0 || l1 != 4 || ll != 260;
}
