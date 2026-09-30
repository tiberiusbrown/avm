#include <stdbool.h>
#include <stdint.h>

/* This test intentionally exercises atomics larger than the lock-free width. */
#if defined(__clang__)
#pragma clang diagnostic ignored "-Watomic-alignment"
#endif

static uint64_t value;
static _Alignas(8) uint64_t aligned_value;

int avm_test_main(void)
{
    uint64_t expected;

    __atomic_store_n(&value, UINT64_C(0x123456789abcdef0), __ATOMIC_SEQ_CST);
    if (__atomic_load_n(&value, __ATOMIC_SEQ_CST) !=
        UINT64_C(0x123456789abcdef0))
        return 1;
    if (__atomic_fetch_add(&value, 0x20, __ATOMIC_SEQ_CST) !=
        UINT64_C(0x123456789abcdef0))
        return 2;
    if (__atomic_fetch_sub(&value, 0x10, __ATOMIC_SEQ_CST) !=
        UINT64_C(0x123456789abcdf10))
        return 3;
    if (__atomic_fetch_and(&value, UINT64_C(0xfffffffffffffff0),
                           __ATOMIC_SEQ_CST) !=
        UINT64_C(0x123456789abcdf00))
        return 4;
    if (__atomic_fetch_or(&value, 3, __ATOMIC_SEQ_CST) !=
        UINT64_C(0x123456789abcdf00))
        return 5;
    if (__atomic_fetch_xor(&value, 1, __ATOMIC_SEQ_CST) !=
        UINT64_C(0x123456789abcdf03))
        return 6;
    if (__atomic_fetch_nand(&value, UINT64_MAX, __ATOMIC_SEQ_CST) !=
        UINT64_C(0x123456789abcdf02))
        return 7;
    expected = UINT64_C(0xedcba987654320fd);
    if (!__atomic_compare_exchange_n(&value, &expected, 7, false,
                                      __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST))
        return 8;
    expected = 8;
    if (__atomic_compare_exchange_n(&value, &expected, 9, false,
                                     __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST) ||
        expected != 7)
        return 9;
    if (__atomic_exchange_n(&value, 11, __ATOMIC_SEQ_CST) != 7 ||
        __atomic_load_n(&value, __ATOMIC_SEQ_CST) != 11)
        return 10;
    __atomic_store_n(&aligned_value, 5, __ATOMIC_SEQ_CST);
    if (__atomic_fetch_add(&aligned_value, 3, __ATOMIC_SEQ_CST) != 5 ||
        __atomic_load_n(&aligned_value, __ATOMIC_SEQ_CST) != 8)
        return 11;
    return 0;
}
