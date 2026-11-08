/* C23 bit-precise integers: every unsigned and signed width in 17-20. */
#include "bitint_oracle.h"

BI_DEFINE_UNSIGNED(17)
BI_DEFINE_SIGNED(17)
BI_DEFINE_UNSIGNED(18)
BI_DEFINE_SIGNED(18)
BI_DEFINE_UNSIGNED(19)
BI_DEFINE_SIGNED(19)
BI_DEFINE_UNSIGNED(20)
BI_DEFINE_SIGNED(20)

int avm_test_main(void)
{
    for (bi_it = 0; bi_it < BI_ITERATIONS; ++bi_it) {
        BI_RUN_UNSIGNED(17);
        BI_RUN_SIGNED(17);
        BI_RUN_UNSIGNED(18);
        BI_RUN_SIGNED(18);
        BI_RUN_UNSIGNED(19);
        BI_RUN_SIGNED(19);
        BI_RUN_UNSIGNED(20);
        BI_RUN_SIGNED(20);
        if (bi_failure != 0)
            return bi_report(bi_failure);
    }
    return 0;
}
