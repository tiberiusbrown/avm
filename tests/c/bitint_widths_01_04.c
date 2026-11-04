/* C23 bit-precise integers: every unsigned and signed width in 1-4. */
#include "bitint_oracle.h"

BI_DEFINE_UNSIGNED(1)
BI_DEFINE_UNSIGNED(2)
BI_DEFINE_SIGNED(2)
BI_DEFINE_UNSIGNED(3)
BI_DEFINE_SIGNED(3)
BI_DEFINE_UNSIGNED(4)
BI_DEFINE_SIGNED(4)

int avm_test_main(void)
{
    for (bi_it = 0; bi_it < BI_ITERATIONS; ++bi_it) {
        BI_RUN_UNSIGNED(1);
        BI_RUN_UNSIGNED(2);
        BI_RUN_SIGNED(2);
        BI_RUN_UNSIGNED(3);
        BI_RUN_SIGNED(3);
        BI_RUN_UNSIGNED(4);
        BI_RUN_SIGNED(4);
        if (bi_failure != 0)
            return bi_report(bi_failure);
    }
    return 0;
}
