/* C23 bit-precise integers: every unsigned and signed width in 21-24. */
#include "bitint_oracle.h"

BI_DEFINE_UNSIGNED(21)
BI_DEFINE_SIGNED(21)
BI_DEFINE_UNSIGNED(22)
BI_DEFINE_SIGNED(22)
BI_DEFINE_UNSIGNED(23)
BI_DEFINE_SIGNED(23)
BI_DEFINE_UNSIGNED(24)
BI_DEFINE_SIGNED(24)

int avm_test_main(void)
{
    for (bi_it = 0; bi_it < BI_ITERATIONS; ++bi_it) {
        BI_RUN_UNSIGNED(21);
        BI_RUN_SIGNED(21);
        BI_RUN_UNSIGNED(22);
        BI_RUN_SIGNED(22);
        BI_RUN_UNSIGNED(23);
        BI_RUN_SIGNED(23);
        BI_RUN_UNSIGNED(24);
        BI_RUN_SIGNED(24);
        if (bi_failure != 0)
            return bi_report(bi_failure);
    }
    return 0;
}
