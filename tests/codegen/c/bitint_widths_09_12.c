/* C23 bit-precise integers: every unsigned and signed width in 9-12. */
#include "bitint_oracle.h"

BI_DEFINE_UNSIGNED(9)
BI_DEFINE_SIGNED(9)
BI_DEFINE_UNSIGNED(10)
BI_DEFINE_SIGNED(10)
BI_DEFINE_UNSIGNED(11)
BI_DEFINE_SIGNED(11)
BI_DEFINE_UNSIGNED(12)
BI_DEFINE_SIGNED(12)

int avm_test_main(void)
{
    for (bi_it = 0; bi_it < BI_ITERATIONS; ++bi_it) {
        BI_RUN_UNSIGNED(9);
        BI_RUN_SIGNED(9);
        BI_RUN_UNSIGNED(10);
        BI_RUN_SIGNED(10);
        BI_RUN_UNSIGNED(11);
        BI_RUN_SIGNED(11);
        BI_RUN_UNSIGNED(12);
        BI_RUN_SIGNED(12);
        if (bi_failure != 0)
            return bi_report(bi_failure);
    }
    return 0;
}
