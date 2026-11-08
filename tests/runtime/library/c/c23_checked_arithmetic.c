#include <stdckdint.h>
#include <limits.h>
#include <stdbool.h>
#include <stdint.h>
#include "../../../codegen/c/test_hex_output.h"

#define CHECK(expr) do { if(!(expr)) { test_line16("LINE", __LINE__); return 1; } } while(0)

int avm_test_main(void) {
    int i = 0;
    long l = 0;
    unsigned char u8 = 0;
    signed char s8 = 0;
    unsigned int ui = 0;
    int16_t s16 = 0;
    long long ll = 0;
    unsigned long long ull = 0;
    bool overflow;
    int count = 0;

    /* A checked operation computes the exact result, so the result type's
     * range decides overflow, whatever the operand types are. */
    overflow = ckd_add(&l, 40000L, 2000L);
    CHECK(!overflow && l == 42000L);
    overflow = ckd_add(&i, 20000, 20000);
    CHECK(overflow);
    overflow = ckd_add(&s8, 100, 27);
    CHECK(!overflow && s8 == 127);
    overflow = ckd_add(&s8, 100, 28);
    CHECK(overflow);

    /* Negative and unsigned operands are exact, not converted to unsigned. */
    overflow = ckd_add(&i, 3u, -5);
    CHECK(!overflow && i == -2);
    overflow = ckd_add(&ui, -1, 0);
    CHECK(overflow && ui == UINT_MAX);
    overflow = ckd_sub(&u8, 1, 2);
    CHECK(overflow && u8 == UCHAR_MAX);
    overflow = ckd_sub(&s8, -100, 100);
    CHECK(overflow);
    overflow = ckd_sub(&i, 1, 2);
    CHECK(!overflow && i == -1);

    /* Unsigned results keep the modular value when they overflow. */
    overflow = ckd_add(&u8, 200, 100);
    CHECK(overflow && u8 == 44);
    overflow = ckd_mul(&ui, 300u, 200u);
    CHECK(!overflow && ui == 60000u);
    overflow = ckd_mul(&ui, 300u, 300u);
    CHECK(overflow && ui == 24464u);
    overflow = ckd_mul(&s16, (int16_t)300, (int16_t)200);
    CHECK(overflow);

    /* Products are exact for the widest types as well. */
    overflow = ckd_mul(&ll, 1LL << 40, 1000);
    CHECK(!overflow && ll == 1099511627776000LL);
    overflow = ckd_mul(&ll, LLONG_MAX, 2);
    CHECK(overflow);
    overflow = ckd_add(&ll, LLONG_MIN, -1);
    CHECK(overflow);
    overflow = ckd_sub(&ull, 5, 7);
    CHECK(overflow && ull == ULLONG_MAX - 1);

    /* Each operand is evaluated once. */
    overflow = ckd_add(&i, ++count, 1);
    CHECK(!overflow && count == 1 && i == 2);
    return 0;
}
