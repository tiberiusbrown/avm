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

NOINLINE int test_call_memcmp_P(const void *lhs,
                                const void AVM_PROGMEM *rhs,
                                size_t n)
{
    return memcmp_P(lhs, rhs, n);
}

NOINLINE int test_call_strcmp_P(const char *lhs,
                                const char AVM_PROGMEM *rhs)
{
    return strcmp_P(lhs, rhs);
}

NOINLINE size_t test_call_strlen_P(const char AVM_PROGMEM *src)
{
    return strlen_P(src);
}

static const uint8_t AVM_PROGMEM p_equal[] =
    {0x11, 0x22, 0x33, 0x44, 0x55};
static const uint8_t AVM_PROGMEM p_high[] =
    {0x11, 0x22, 0xff, 0x44, 0x55};
static const uint8_t AVM_PROGMEM p_low[] =
    {0x11, 0x22, 0x02, 0x44, 0x55};
static const uint8_t AVM_PROGMEM p_late[] =
    {1, 2, 3, 4, 0x56};

static const char AVM_PROGMEM p_alpha[] = "Alpha";
static const char AVM_PROGMEM p_alphz[] = "Alphz";
static const char AVM_PROGMEM p_cat[] = "cat";
static const char AVM_PROGMEM p_catalog[] = "catalog";
static const char AVM_PROGMEM p_unsigned_lo[] = {(char)0x10, '\0'};
static const char AVM_PROGMEM p_empty[] = "";
static const char AVM_PROGMEM p_short[] = "program";

#define TEN_Q "QQQQQQQQQQ"
static const char AVM_PROGMEM p_long[] =
    TEN_Q TEN_Q TEN_Q TEN_Q TEN_Q TEN_Q TEN_Q TEN_Q TEN_Q TEN_Q
    TEN_Q TEN_Q TEN_Q TEN_Q TEN_Q TEN_Q TEN_Q TEN_Q TEN_Q TEN_Q
    TEN_Q TEN_Q TEN_Q TEN_Q TEN_Q TEN_Q;
#undef TEN_Q

int avm_test_main(void)
{
    static const uint8_t equal[] = {0x11, 0x22, 0x33, 0x44, 0x55};
    static const uint8_t low[] = {0x11, 0x22, 0x01, 0x44, 0x55};
    static const uint8_t high[] = {0x11, 0x22, 0xfe, 0x44, 0x55};
    static const uint8_t late[] = {1, 2, 3, 4, 0x55};

    static const char alpha[] = "Alpha";
    static const char alphz[] = "Alphz";
    static const char cat[] = "cat";
    static const char catalog[] = "catalog";
    static const char unsigned_hi[] = {(char)0xf0, '\0'};

    const int me = test_call_memcmp_P(equal, p_equal, sizeof(equal));
    const int ml = test_call_memcmp_P(low, p_high, sizeof(low));
    const int mg = test_call_memcmp_P(high, p_low, sizeof(high));
    const int mt = test_call_memcmp_P(late, p_late, sizeof(late));
    const int mz = test_call_memcmp_P(low, p_high, 0);

    const int se = test_call_strcmp_P(alpha, p_alpha);
    const int sl = test_call_strcmp_P(alpha, p_alphz);
    const int sg = test_call_strcmp_P(alphz, p_alpha);
    const int sp = test_call_strcmp_P(cat, p_catalog);
    const int sr = test_call_strcmp_P(catalog, p_cat);
    const int su = test_call_strcmp_P(unsigned_hi, p_unsigned_lo);

    const size_t l0 = test_call_strlen_P(p_empty);
    const size_t l1 = test_call_strlen_P(p_short);
    const size_t ll = test_call_strlen_P(p_long);

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
    test_line16("L0", (uint16_t)l0);
    test_line16("L1", (uint16_t)l1);
    test_line16("LL", (uint16_t)ll);

    return me != 0 || ml != -1 || mg != 1 || mt != -1 || mz != 0 ||
           se != 0 || sl != -1 || sg != 1 || sp != -1 || sr != 1 ||
           su != 1 || l0 != 0 || l1 != 7 || ll != 260;
}
