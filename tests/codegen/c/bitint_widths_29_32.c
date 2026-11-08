/* C23 bit-precise integers: every unsigned and signed width in 29-32. */
#include "bitint_oracle.h"

BI_DEFINE_UNSIGNED(29)
BI_DEFINE_SIGNED(29)
BI_DEFINE_UNSIGNED(30)
BI_DEFINE_SIGNED(30)
BI_DEFINE_UNSIGNED(31)
BI_DEFINE_SIGNED(31)
BI_DEFINE_UNSIGNED(32)
BI_DEFINE_SIGNED(32)

int avm_test_main(void)
{
    for (bi_it = 0; bi_it < BI_ITERATIONS; ++bi_it) {
        BI_RUN_UNSIGNED(29);
        BI_RUN_SIGNED(29);
        BI_RUN_UNSIGNED(30);
        BI_RUN_SIGNED(30);
        BI_RUN_UNSIGNED(31);
        BI_RUN_SIGNED(31);
        BI_RUN_UNSIGNED(32);
        BI_RUN_SIGNED(32);
        if (bi_failure != 0)
            return bi_report(bi_failure);
    }
    return 0;
}
