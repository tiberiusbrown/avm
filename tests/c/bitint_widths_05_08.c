/* C23 bit-precise integers: every unsigned and signed width in 5-8. */
#include "bitint_oracle.h"

BI_DEFINE_UNSIGNED(5)
BI_DEFINE_SIGNED(5)
BI_DEFINE_UNSIGNED(6)
BI_DEFINE_SIGNED(6)
BI_DEFINE_UNSIGNED(7)
BI_DEFINE_SIGNED(7)
BI_DEFINE_UNSIGNED(8)
BI_DEFINE_SIGNED(8)

int avm_test_main(void)
{
    for (bi_it = 0; bi_it < BI_ITERATIONS; ++bi_it) {
        BI_RUN_UNSIGNED(5);
        BI_RUN_SIGNED(5);
        BI_RUN_UNSIGNED(6);
        BI_RUN_SIGNED(6);
        BI_RUN_UNSIGNED(7);
        BI_RUN_SIGNED(7);
        BI_RUN_UNSIGNED(8);
        BI_RUN_SIGNED(8);
        if (bi_failure != 0)
            return bi_report(bi_failure);
    }
    return 0;
}
