/* C23 bit-precise integers: every unsigned and signed width in 41-44. */
#include "bitint_oracle.h"

BI_DEFINE_UNSIGNED(41)
BI_DEFINE_SIGNED(41)
BI_DEFINE_UNSIGNED(42)
BI_DEFINE_SIGNED(42)
BI_DEFINE_UNSIGNED(43)
BI_DEFINE_SIGNED(43)
BI_DEFINE_UNSIGNED(44)
BI_DEFINE_SIGNED(44)

int avm_test_main(void)
{
    for (bi_it = 0; bi_it < BI_ITERATIONS; ++bi_it) {
        BI_RUN_UNSIGNED(41);
        BI_RUN_SIGNED(41);
        BI_RUN_UNSIGNED(42);
        BI_RUN_SIGNED(42);
        BI_RUN_UNSIGNED(43);
        BI_RUN_SIGNED(43);
        BI_RUN_UNSIGNED(44);
        BI_RUN_SIGNED(44);
        if (bi_failure != 0)
            return bi_report(bi_failure);
    }
    return 0;
}
