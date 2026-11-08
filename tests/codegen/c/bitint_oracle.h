/* Shared checks for C23 bit-precise integers of widths 1 through 64.
 *
 * Each width N is checked against 64-bit arithmetic, which the rest of the
 * suite already validates. Unsigned values are reduced to their low N bits.
 * Signed values are sign-extended from N bits. Signed arithmetic runs in the
 * unsigned type so that the test itself never relies on signed overflow.
 *
 * The AVM stack is 256 bytes and the linker bounds the whole call tree, so
 * every check group is a small function called directly from avm_test_main.
 * The run macros set file-level operands for each width, and the checks read
 * them, so no check takes arguments. A failing check records its width and a
 * unique check number for avm_test_main to report. */

#ifndef AVM_TESTS_BITINT_ORACLE_H
#define AVM_TESTS_BITINT_ORACLE_H

#include <stdbool.h>
#include <stdint.h>
#include "test_hex_output.h"

typedef unsigned long long bi_u64;
typedef long long bi_s64;

/* Operand pairs per width and signedness. */
#define BI_ITERATIONS 10u

/* Operand helpers are macros, so that no call frame sits between a check and
 * the 64-bit arithmetic it performs. */

/* Low n bits set, for 1 <= n <= 64. The double shift avoids a shift by 64. */
#define BI_MASK(n) (((1ULL << ((n) - 1u)) << 1) - 1ULL)

/* Sign-extend the low n bits of x to a 64-bit two's-complement value. */
#define BI_SEXT(x, n)                                                         \
    ((bi_s64)((((x) & BI_MASK(n)) ^ (1ULL << ((n) - 1u))) -                   \
              (1ULL << ((n) - 1u))))

#define BI_SMIN(n) ((bi_s64)(0ULL - (1ULL << ((n) - 1u))))
#define BI_SMAX(n) ((bi_s64)((1ULL << ((n) - 1u)) - 1ULL))

/* A 32-bit hash of a seed, used for operands after the edge values. */
#define BI_HASH(x) ((((x) ^ ((x) >> 15)) * 0x2C1B3C6DUL) ^ (((x) * 0x297A2D39UL) >> 13))


/* Operand for iteration it: edge values first, then hashed patterns, all
 * reduced to n bits. The salt separates the two operands of one iteration.
 * The hashed value is assembled from 32-bit halves, which keeps the frame
 * small on the AVM stack. */
static bi_u64 bi_value(unsigned it, unsigned salt, unsigned n)
{
    unsigned kind = it % 8u;
    bi_u64 mask = BI_MASK(n);
    union {
        bi_u64 whole;
        unsigned long half[2];
    } bits;
    unsigned long seed = 0;
    if (kind == 0u)
        return salt == 0u ? 0 : mask;
    if (kind == 1u)
        return 1 & mask;
    if (kind == 2u)
        return mask;
    if (kind == 3u)
        return mask - 1u;
    if (kind == 4u)
        return (mask >> 1) + 1u;
    seed = (unsigned long)it * 131UL + (unsigned long)salt * 7UL + n;
    bits.half[0] = BI_HASH(seed + 0x85EBCA6BUL);
    bits.half[1] = BI_HASH(seed + 0x9E3779B9UL);
    return bits.whole & mask;
}

/* Signed operand: the n-bit pattern, sign-extended. A function, so that its
 * temporaries are not added to the frame of the caller. */
static bi_s64 bi_sext_value(unsigned it, unsigned salt, unsigned n)
{
    return BI_SEXT(bi_value(it, salt, n), n);
}

/* The first failing check records its width and a unique check number. Check
 * functions return nothing, so avm_test_main keeps no per-call temporaries. */
static long bi_failure;

/* A check function defines w, the width reported on failure. */
#define BI_CHECK(cond)                                                        \
    do {                                                                      \
        if (!(cond)) {                                                        \
            if (bi_failure == 0)                                              \
                bi_failure = ((long)w << 16) | (long)__COUNTER__;             \
            return;                                                           \
        }                                                                     \
    } while (0)

/* Unsigned check groups for one width N. Each takes the iteration index. */
#define BI_DEFINE_UNSIGNED(N)                                                 \
    static void bi_set_u_##N(void)                                            \
    {                                                                         \
        bi_a = bi_value(bi_it, 0, N);                                         \
        bi_b = bi_value(bi_it, 3, N);                                         \
    }                                                                         \
                                                                              \
    static void bi_e_add_##N(void)                                             \
    {                                                                         \
        bi_u64 sum = 0;                                                       \
        int wrapped = __builtin_add_overflow(bi_a, bi_b, &sum);               \
        bi_exp = wrapped || (sum & ~BI_MASK(N)) != 0;                           \
    }                                                                         \
                                                                              \
    static void bi_e_mul_##N(void)                                             \
    {                                                                         \
        bi_u64 prod = 0;                                                      \
        int wrapped = __builtin_mul_overflow(bi_a, bi_b, &prod);              \
        bi_exp = wrapped || (prod & ~BI_MASK(N)) != 0;                          \
    }                                                                         \
                                                                              \
    static void bi_u_add_##N(void)                                     \
    {                                                                         \
        typedef unsigned _BitInt(N) T;                                        \
        const unsigned w = N;                                                 \
        T A = (T)bi_a;                                                           \
        T B = (T)bi_b;                                                           \
        BI_CHECK(sizeof(T) == (N + 7u) / 8u);                                 \
        BI_CHECK((bi_u64)A == bi_a);                                             \
        BI_CHECK((bi_u64)(A + B) == ((bi_a + bi_b) & BI_MASK(N)));                  \
        BI_CHECK((bi_u64)(A - B) == ((bi_a - bi_b) & BI_MASK(N)));                  \
        return;                                                               \
    }                                                                         \
                                                                              \
    static void bi_u_mul_##N(void)                                     \
    {                                                                         \
        typedef unsigned _BitInt(N) T;                                        \
        const unsigned w = N;                                                 \
        T A = (T)bi_a;                                                           \
        T B = (T)bi_b;                                                           \
        BI_CHECK((bi_u64)(A * B) == ((bi_a * bi_b) & BI_MASK(N)));                  \
        return;                                                               \
    }                                                                         \
                                                                              \
    static void bi_u_logic_##N(void)                                   \
    {                                                                         \
        typedef unsigned _BitInt(N) T;                                        \
        const unsigned w = N;                                                 \
        T A = (T)bi_a;                                                           \
        T B = (T)bi_b;                                                           \
        BI_CHECK((bi_u64)(A & B) == (bi_a & bi_b));                                 \
        BI_CHECK((bi_u64)(A | B) == (bi_a | bi_b));                                 \
        BI_CHECK((bi_u64)(A ^ B) == (bi_a ^ bi_b));                                 \
        return;                                                               \
    }                                                                         \
                                                                              \
    static void bi_u_unary_##N(void)                                   \
    {                                                                         \
        typedef unsigned _BitInt(N) T;                                        \
        const unsigned w = N;                                                 \
        T A = (T)bi_a;                                                           \
        BI_CHECK((bi_u64)(~A) == (~bi_a & BI_MASK(N)));                          \
        BI_CHECK((bi_u64)(-A) == ((0ULL - bi_a) & BI_MASK(N)));                  \
        return;                                                               \
    }                                                                         \
                                                                              \
    static void bi_u_div_##N(void)                                     \
    {                                                                         \
        typedef unsigned _BitInt(N) T;                                        \
        const unsigned w = N;                                                 \
        T A = (T)bi_a;                                                           \
        T B = (T)bi_b;                                                           \
        if (bi_b != 0) {                                                         \
            BI_CHECK((bi_u64)(A / B) == bi_a / bi_b);                               \
            BI_CHECK((bi_u64)(A % B) == bi_a % bi_b);                               \
        }                                                                     \
        return;                                                               \
    }                                                                         \
                                                                              \
    static void bi_u_shift_##N(void)                                   \
    {                                                                         \
        typedef unsigned _BitInt(N) T;                                        \
        const unsigned w = N;                                                 \
        T A = (T)bi_a;                                                           \
        unsigned sh = (unsigned)(bi_b % N);                                      \
        BI_CHECK((bi_u64)(A << sh) == ((bi_a << sh) & BI_MASK(N)));              \
        BI_CHECK((bi_u64)(A >> sh) == (bi_a >> sh));                             \
        return;                                                               \
    }                                                                         \
                                                                              \
    static void bi_u_cmp_##N(void)                                     \
    {                                                                         \
        typedef unsigned _BitInt(N) T;                                        \
        const unsigned w = N;                                                 \
        T A = (T)bi_a;                                                           \
        T B = (T)bi_b;                                                           \
        BI_CHECK((A < B) == (bi_a < bi_b));                                         \
        BI_CHECK((A <= B) == (bi_a <= bi_b));                                       \
        BI_CHECK((A > B) == (bi_a > bi_b));                                         \
        BI_CHECK((A >= B) == (bi_a >= bi_b));                                       \
        BI_CHECK((A == B) == (bi_a == bi_b));                                       \
        BI_CHECK((A != B) == (bi_a != bi_b));                                       \
        BI_CHECK((bool)A == (bi_a != 0));                                        \
        return;                                                               \
    }                                                                         \
                                                                              \
    static void bi_u_conv_##N(void)                                    \
    {                                                                         \
        typedef unsigned _BitInt(N) T;                                        \
        const unsigned w = N;                                                 \
        T A = (T)bi_a;                                                           \
        BI_CHECK((long long)A == (long long)bi_a);                               \
        BI_CHECK((float)A == (float)bi_a);                                       \
        return;                                                               \
    }                                                                         \
                                                                              \
    static void bi_u_ovfadd_##N(void)                      \
    {                                                                         \
        typedef unsigned _BitInt(N) T;                                        \
        const unsigned w = N;                                                 \
        T A = (T)bi_a;                                                           \
        T B = (T)bi_b;                                                           \
        T R = 0;                                                              \
        int ov = __builtin_add_overflow(A, B, &R);                            \
        BI_CHECK(ov == bi_exp);                                               \
        BI_CHECK((bi_u64)R == ((bi_a + bi_b) & BI_MASK(N)));                        \
        return;                                                               \
    }                                                                         \
                                                                              \
    static void bi_u_ovfmul_##N(void)                      \
    {                                                                         \
        typedef unsigned _BitInt(N) T;                                        \
        const unsigned w = N;                                                 \
        T A = (T)bi_a;                                                           \
        T B = (T)bi_b;                                                           \
        T R = 0;                                                              \
        int ov = __builtin_mul_overflow(A, B, &R);                            \
        BI_CHECK(ov == bi_exp);                                               \
        BI_CHECK((bi_u64)R == ((bi_a * bi_b) & BI_MASK(N)));                        \
        return;                                                               \
    }                                                                         \
                                                                              \
    static void bi_u_pop_##N(void)                                     \
    {                                                                         \
        typedef unsigned _BitInt(N) T;                                        \
        const unsigned w = N;                                                 \
        T A = (T)bi_a;                                                           \
        BI_CHECK((unsigned)__builtin_popcountg(A) ==                          \
                 (unsigned)__builtin_popcountll(bi_a));                          \
        return;                                                               \
    }                                                                         \
                                                                              \
    static void bi_u_clz_##N(void)                                     \
    {                                                                         \
        typedef unsigned _BitInt(N) T;                                        \
        const unsigned w = N;                                                 \
        T A = (T)bi_a;                                                           \
        if (bi_a != 0)                                                           \
            BI_CHECK(__builtin_clzg(A, N) == __builtin_clzll(bi_a) - (64 - N)); \
        else                                                                  \
            BI_CHECK(__builtin_clzg(A, N) == N);                              \
        return;                                                               \
    }                                                                         \
                                                                              \
    static void bi_u_ctz_##N(void)                                     \
    {                                                                         \
        typedef unsigned _BitInt(N) T;                                        \
        const unsigned w = N;                                                 \
        T A = (T)bi_a;                                                           \
        if (bi_a != 0)                                                           \
            BI_CHECK(__builtin_ctzg(A, N) == __builtin_ctzll(bi_a));             \
        else                                                                  \
            BI_CHECK(__builtin_ctzg(A, N) == N);                              \
        return;                                                               \
    }                                                                         \
                                                                              \
    static void bi_u_mem_##N(void)                                     \
    {                                                                         \
        typedef unsigned _BitInt(N) T;                                        \
        const unsigned w = N;                                                 \
        T cell[2] = {0, 0};                                                   \
        cell[1] = (T)bi_a;                                                       \
        BI_CHECK((bi_u64)cell[1] == bi_a);                                       \
        return;                                                               \
    }                                                                         \
                                                                              \
    static void bi_u_float_##N(void)                                   \
    {                                                                         \
        typedef unsigned _BitInt(N) T;                                        \
        const unsigned w = N;                                                 \
        const unsigned k = N < 24 ? N : 24;                                   \
        float f = (float)(bi_a % (1ULL << k));                                   \
        T X = (T)f;                                                           \
        BI_CHECK((bi_u64)X == (bi_u64)f);                                     \
        return;                                                               \
    }

/* Signed check groups for one width N, where N is at least 2. */
#define BI_DEFINE_SIGNED(N)                                                   \
    static void bi_set_s_##N(void)                                            \
    {                                                                         \
        bi_sa = bi_sext_value(bi_it, 0, N);                                   \
        bi_sb = bi_sext_value(bi_it, 3, N);                                   \
    }                                                                         \
                                                                              \
    static void bi_es_add_##N(void)                                             \
    {                                                                         \
        bi_s64 sum = 0;                                                       \
        int wrapped = __builtin_add_overflow(bi_sa, bi_sb, &sum);             \
        bi_exp = wrapped || sum < BI_SMIN(N) || sum > BI_SMAX(N);               \
    }                                                                         \
                                                                              \
    static void bi_es_mul_##N(void)                                             \
    {                                                                         \
        bi_s64 prod = 0;                                                      \
        int wrapped = __builtin_mul_overflow(bi_sa, bi_sb, &prod);            \
        bi_exp = wrapped || prod < BI_SMIN(N) || prod > BI_SMAX(N);             \
    }                                                                         \
                                                                              \
    static void bi_s_conv_##N(void)                                    \
    {                                                                         \
        typedef _BitInt(N) T;                                                 \
        typedef unsigned _BitInt(N) U;                                        \
        const unsigned w = N;                                                 \
        T A = (T)bi_sa;                                                          \
        U UA = (U)A;                                                          \
        BI_CHECK(sizeof(T) == (N + 7u) / 8u);                                 \
        BI_CHECK((bi_s64)A == bi_sa);                                            \
        BI_CHECK((bi_u64)UA == ((bi_u64)bi_sa & BI_MASK(N)));                    \
        BI_CHECK((bool)A == (bi_sa != 0));                                       \
        BI_CHECK((long long)A == (long long)bi_sa);                              \
        BI_CHECK((float)A == (float)bi_sa);                                      \
        return;                                                               \
    }                                                                         \
                                                                              \
    static void bi_s_add_##N(void)                                     \
    {                                                                         \
        typedef _BitInt(N) T;                                                 \
        typedef unsigned _BitInt(N) U;                                        \
        const unsigned w = N;                                                 \
        const bi_u64 ua = (bi_u64)bi_sa;             \
        const bi_u64 ub = (bi_u64)bi_sb;             \
        U UA = (U)ua;                                                         \
        U UB = (U)ub;                                                         \
        BI_CHECK((bi_s64)(T)(UA + UB) == BI_SEXT(ua + ub, N));                \
        BI_CHECK((bi_s64)(T)(UA - UB) == BI_SEXT(ua - ub, N));                \
        if (N <= 32) {                                                        \
            /* Sums of at most 32-bit operands cannot overflow 64 bits. */    \
            T A = (T)(bi_s64)ua;                                              \
            T B = (T)(bi_s64)ub;                                              \
            bi_s64 sum = (bi_s64)ua + (bi_s64)ub;                             \
            if (sum >= BI_SMIN(N) && sum <= BI_SMAX(N))                       \
                BI_CHECK((bi_s64)(A + B) == sum);                             \
        }                                                                     \
        return;                                                               \
    }                                                                         \
                                                                              \
    static void bi_s_mul_##N(void)                                     \
    {                                                                         \
        typedef _BitInt(N) T;                                                 \
        typedef unsigned _BitInt(N) U;                                        \
        const unsigned w = N;                                                 \
        const bi_u64 ua = (bi_u64)bi_sa;             \
        const bi_u64 ub = (bi_u64)bi_sb;             \
        U UA = (U)ua;                                                         \
        U UB = (U)ub;                                                         \
        BI_CHECK((bi_s64)(T)(UA * UB) == BI_SEXT(ua * ub, N));                \
        if (N <= 32) {                                                        \
            /* Products of at most 32-bit operands fit exactly in 64 bits. */ \
            T A = (T)(bi_s64)ua;                                              \
            T B = (T)(bi_s64)ub;                                              \
            bi_s64 prod = (bi_s64)ua * (bi_s64)ub;                            \
            if (prod >= BI_SMIN(N) && prod <= BI_SMAX(N))                     \
                BI_CHECK((bi_s64)(A * B) == prod);                            \
        }                                                                     \
        return;                                                               \
    }                                                                         \
                                                                              \
    static void bi_s_bit_##N(void)                                     \
    {                                                                         \
        typedef _BitInt(N) T;                                                 \
        typedef unsigned _BitInt(N) U;                                        \
        const unsigned w = N;                                                 \
        const bi_u64 ua = (bi_u64)bi_sa;             \
        const bi_u64 ub = (bi_u64)bi_sb;             \
        U UA = (U)ua;                                                         \
        U UB = (U)ub;                                                         \
        BI_CHECK((bi_s64)(T)(UA & UB) == BI_SEXT(ua & ub, N));                \
        BI_CHECK((bi_s64)(T)(UA | UB) == BI_SEXT(ua | ub, N));                \
        BI_CHECK((bi_s64)(T)(UA ^ UB) == BI_SEXT(ua ^ ub, N));                \
        return;                                                               \
    }                                                                         \
                                                                              \
    static void bi_s_unary_##N(void)                                   \
    {                                                                         \
        typedef _BitInt(N) T;                                                 \
        typedef unsigned _BitInt(N) U;                                        \
        const unsigned w = N;                                                 \
        const bi_u64 ua = (bi_u64)bi_sa;             \
        U UA = (U)ua;                                                         \
        BI_CHECK((bi_s64)(T)(~UA) == BI_SEXT(~ua, N));                        \
        BI_CHECK((bi_s64)(T)(-UA) == BI_SEXT(0ULL - ua, N));                  \
        return;                                                               \
    }                                                                         \
                                                                              \
    static void bi_s_div_##N(void)                                     \
    {                                                                         \
        typedef _BitInt(N) T;                                                 \
        const unsigned w = N;                                                 \
        T A = (T)bi_sa;                                                          \
        T B = (T)bi_sb;                                                          \
        if (bi_sb != 0 && !(bi_sb == -1 && bi_sa == BI_SMIN(N))) {                     \
            BI_CHECK((bi_s64)(A / B) == bi_sa / bi_sb);                             \
            BI_CHECK((bi_s64)(A % B) == bi_sa % bi_sb);                             \
        }                                                                     \
        return;                                                               \
    }                                                                         \
                                                                              \
    static void bi_s_shift_##N(void)                                   \
    {                                                                         \
        typedef _BitInt(N) T;                                                 \
        typedef unsigned _BitInt(N) U;                                        \
        const unsigned w = N;                                                 \
        T A = (T)bi_sa;                                                          \
        unsigned sh = (unsigned)((bi_u64)bi_sb % N);                             \
        BI_CHECK((bi_s64)(T)((U)A << sh) == BI_SEXT((bi_u64)bi_sa << sh, N));   \
        BI_CHECK((bi_s64)(A >> sh) == (bi_sa >> sh));                            \
        return;                                                               \
    }                                                                         \
                                                                              \
    static void bi_s_cmp_##N(void)                                     \
    {                                                                         \
        typedef _BitInt(N) T;                                                 \
        const unsigned w = N;                                                 \
        T A = (T)bi_sa;                                                          \
        T B = (T)bi_sb;                                                          \
        BI_CHECK((A < B) == (bi_sa < bi_sb));                                       \
        BI_CHECK((A <= B) == (bi_sa <= bi_sb));                                     \
        BI_CHECK((A > B) == (bi_sa > bi_sb));                                       \
        BI_CHECK((A >= B) == (bi_sa >= bi_sb));                                     \
        BI_CHECK((A == B) == (bi_sa == bi_sb));                                     \
        BI_CHECK((A != B) == (bi_sa != bi_sb));                                     \
        return;                                                               \
    }                                                                         \
                                                                              \
    static void bi_s_ovfadd_##N(void)                      \
    {                                                                         \
        typedef _BitInt(N) T;                                                 \
        const unsigned w = N;                                                 \
        T A = (T)bi_sa;                                                          \
        T B = (T)bi_sb;                                                          \
        T R = 0;                                                              \
        int ov = __builtin_add_overflow(A, B, &R);                            \
        BI_CHECK(ov == bi_exp);                                               \
        BI_CHECK((bi_s64)R == BI_SEXT((bi_u64)bi_sa + (bi_u64)bi_sb, N));           \
        return;                                                               \
    }                                                                         \
                                                                              \
    static void bi_s_ovfmul_##N(void)                      \
    {                                                                         \
        typedef _BitInt(N) T;                                                 \
        const unsigned w = N;                                                 \
        T A = (T)bi_sa;                                                          \
        T B = (T)bi_sb;                                                          \
        T R = 0;                                                              \
        int ov = __builtin_mul_overflow(A, B, &R);                            \
        BI_CHECK(ov == bi_exp);                                               \
        return;                                                               \
    }                                                                         \
                                                                              \
    static void bi_s_mulval_##N(void)                                  \
    {                                                                         \
        typedef _BitInt(N) T;                                                 \
        const unsigned w = N;                                                 \
        T A = (T)bi_sa;                                                          \
        T B = (T)bi_sb;                                                          \
        T R = 0;                                                              \
        __builtin_mul_overflow(A, B, &R);                                     \
        BI_CHECK((bi_s64)R == BI_SEXT((bi_u64)bi_sa * (bi_u64)bi_sb, N));           \
        return;                                                               \
    }                                                                         \
                                                                              \
    static void bi_s_pop_##N(void)                                     \
    {                                                                         \
        typedef _BitInt(N) T;                                                 \
        typedef unsigned _BitInt(N) U;                                        \
        const unsigned w = N;                                                 \
        U UA = (U)(T)bi_sa;                                                      \
        BI_CHECK((unsigned)__builtin_popcountg(UA) ==                         \
                 (unsigned)__builtin_popcountll((bi_u64)bi_sa & BI_MASK(N)));    \
        return;                                                               \
    }                                                                         \
                                                                              \
    static void bi_s_mem_##N(void)                                     \
    {                                                                         \
        typedef _BitInt(N) T;                                                 \
        const unsigned w = N;                                                 \
        T cell[2] = {0, 0};                                                   \
        cell[1] = (T)bi_sa;                                                      \
        BI_CHECK((bi_s64)cell[1] == bi_sa);                                      \
        return;                                                               \
    }                                                                         \
                                                                              \
    static void bi_s_float_##N(void)                                   \
    {                                                                         \
        typedef _BitInt(N) T;                                                 \
        const unsigned w = N;                                                 \
        const unsigned k = (N - 1u) < 24u ? (N - 1u) : 24u;                   \
        float f = (float)(bi_sa % (1LL << k));                                   \
        T X = (T)f;                                                           \
        BI_CHECK((bi_s64)X == (bi_s64)f);                                     \
        return;                                                               \
    }

/* Report the first recorded failure: its width and its check number. */
static int bi_report(long result)
{
    test_line16("WIDTH", (uint16_t)(result >> 16));
    test_line16("CHECK", (uint16_t)(result & 0xffffL));
    return 1;
}

/* The iteration, the operands and the expected overflow flag are file-level
 * variables. Keeping them out of avm_test_main keeps its frame small, so the
 * deepest path through a check stays within the AVM stack. */
static unsigned bi_it;
static bi_u64 bi_a;
static bi_u64 bi_b;
static bi_s64 bi_sa;
static bi_s64 bi_sb;
static int bi_exp;

#define BI_RUN_UNSIGNED(N)                                                    \
    bi_set_u_##N();                                                           \
    bi_u_add_##N();                                                 \
    bi_u_mul_##N();                                                 \
    bi_u_logic_##N();                                               \
    bi_u_unary_##N();                                                     \
    bi_u_div_##N();                                                 \
    bi_u_shift_##N();                                               \
    bi_u_cmp_##N();                                                 \
    bi_u_conv_##N();                                                      \
    bi_e_add_##N();                                  \
    bi_u_ovfadd_##N();                                      \
    bi_e_mul_##N();                                  \
    bi_u_ovfmul_##N();                                      \
    bi_u_pop_##N();                                                       \
    bi_u_clz_##N();                                                       \
    bi_u_ctz_##N();                                                       \
    bi_u_mem_##N();                                                       \
    bi_u_float_##N()

#define BI_RUN_SIGNED(N)                                                      \
    bi_set_s_##N();                                                           \
    bi_s_conv_##N();                                                     \
    bi_s_add_##N();                                               \
    bi_s_mul_##N();                                               \
    bi_s_bit_##N();                                               \
    bi_s_unary_##N();                                                    \
    bi_s_div_##N();                                               \
    bi_s_shift_##N();                                             \
    bi_s_cmp_##N();                                               \
    bi_es_add_##N();                                \
    bi_s_ovfadd_##N();                                    \
    bi_es_mul_##N();                                \
    bi_s_ovfmul_##N();                                    \
    bi_s_mulval_##N();                                            \
    bi_s_pop_##N();                                                      \
    bi_s_mem_##N();                                                      \
    bi_s_float_##N()

#endif
