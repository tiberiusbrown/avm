/* C23 bit-precise integers: every unsigned and signed width in 33-36. */
#include "bitint_oracle.h"

BI_DEFINE_UNSIGNED(33)
BI_DEFINE_SIGNED(33)
BI_DEFINE_UNSIGNED(34)
BI_DEFINE_SIGNED(34)
BI_DEFINE_UNSIGNED(35)
BI_DEFINE_SIGNED(35)
BI_DEFINE_UNSIGNED(36)
BI_DEFINE_SIGNED(36)

int avm_test_main(void)
{
    for (bi_it = 0; bi_it < BI_ITERATIONS; ++bi_it) {
        BI_RUN_UNSIGNED(33);
        BI_RUN_SIGNED(33);
        BI_RUN_UNSIGNED(34);
        BI_RUN_SIGNED(34);
        BI_RUN_UNSIGNED(35);
        BI_RUN_SIGNED(35);
        BI_RUN_UNSIGNED(36);
        BI_RUN_SIGNED(36);
        if (bi_failure != 0)
            return bi_report(bi_failure);
    }
    return 0;
}
