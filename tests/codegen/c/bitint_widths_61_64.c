/* C23 bit-precise integers: every unsigned and signed width in 61-64. */
#include "bitint_oracle.h"

BI_DEFINE_UNSIGNED(61)
BI_DEFINE_SIGNED(61)
BI_DEFINE_UNSIGNED(62)
BI_DEFINE_SIGNED(62)
BI_DEFINE_UNSIGNED(63)
BI_DEFINE_SIGNED(63)
BI_DEFINE_UNSIGNED(64)
BI_DEFINE_SIGNED(64)

int avm_test_main(void)
{
    for (bi_it = 0; bi_it < BI_ITERATIONS; ++bi_it) {
        BI_RUN_UNSIGNED(61);
        BI_RUN_SIGNED(61);
        BI_RUN_UNSIGNED(62);
        BI_RUN_SIGNED(62);
        BI_RUN_UNSIGNED(63);
        BI_RUN_SIGNED(63);
        BI_RUN_UNSIGNED(64);
        BI_RUN_SIGNED(64);
        if (bi_failure != 0)
            return bi_report(bi_failure);
    }
    return 0;
}
