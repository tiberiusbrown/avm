#include <stdbool.h>
#include <stdint.h>

/* This test intentionally exercises atomics larger than the lock-free width. */
#if defined(__clang__)
#pragma clang diagnostic ignored "-Watomic-alignment"
#endif

static uint64_t value;
static _Alignas(8) uint64_t aligned_value;

__attribute__((noinline)) static int check_store_load(void) {
    __atomic_store_n(&value, UINT64_C(0x123456789abcdef0), __ATOMIC_SEQ_CST);
    return __atomic_load_n(&value, __ATOMIC_SEQ_CST) !=
           UINT64_C(0x123456789abcdef0);
}

__attribute__((noinline)) static int check_add(void) {
    return __atomic_fetch_add(&value, 0x20, __ATOMIC_SEQ_CST) !=
           UINT64_C(0x123456789abcdef0);
}

__attribute__((noinline)) static int check_sub(void) {
    return __atomic_fetch_sub(&value, 0x10, __ATOMIC_SEQ_CST) !=
           UINT64_C(0x123456789abcdf10);
}

__attribute__((noinline)) static int check_and(void) {
    return __atomic_fetch_and(&value, UINT64_C(0xfffffffffffffff0),
                              __ATOMIC_SEQ_CST) !=
           UINT64_C(0x123456789abcdf00);
}

__attribute__((noinline)) static int check_or(void) {
    return __atomic_fetch_or(&value, 3, __ATOMIC_SEQ_CST) !=
           UINT64_C(0x123456789abcdf00);
}

__attribute__((noinline)) static int check_xor(void) {
    return __atomic_fetch_xor(&value, 1, __ATOMIC_SEQ_CST) !=
           UINT64_C(0x123456789abcdf03);
}

__attribute__((noinline)) static int check_nand(void) {
    return __atomic_fetch_nand(&value, UINT64_MAX, __ATOMIC_SEQ_CST) !=
           UINT64_C(0x123456789abcdf02);
}

__attribute__((noinline)) static int check_compare_exchange(void) {
    uint64_t expected = UINT64_C(0xedcba987654320fd);
    if (!__atomic_compare_exchange_n(&value, &expected, 7, false,
                                      __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST))
        return 1;
    expected = 8;
    if (__atomic_compare_exchange_n(&value, &expected, 9, false,
                                     __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST) ||
        expected != 7)
        return 2;
    return 0;
}

__attribute__((noinline)) static int check_exchange(void) {
    return __atomic_exchange_n(&value, 11, __ATOMIC_SEQ_CST) != 7 ||
           __atomic_load_n(&value, __ATOMIC_SEQ_CST) != 11;
}

__attribute__((noinline)) static int check_aligned(void) {
    __atomic_store_n(&aligned_value, 5, __ATOMIC_SEQ_CST);
    return __atomic_fetch_add(&aligned_value, 3, __ATOMIC_SEQ_CST) != 5 ||
           __atomic_load_n(&aligned_value, __ATOMIC_SEQ_CST) != 8;
}

int avm_test_main(void) {
    if (check_store_load()) return 1;
    if (check_add()) return 2;
    if (check_sub()) return 3;
    if (check_and()) return 4;
    if (check_or()) return 5;
    if (check_xor()) return 6;
    if (check_nand()) return 7;
    int compare_result = check_compare_exchange();
    if (compare_result) return compare_result == 1 ? 8 : 9;
    if (check_exchange()) return 10;
    if (check_aligned()) return 11;
    return 0;
}
