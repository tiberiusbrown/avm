/* C23 bit-precise integers: every unsigned and signed width in 13-16. */
#include "bitint_oracle.h"

BI_DEFINE_UNSIGNED(13)
BI_DEFINE_SIGNED(13)
BI_DEFINE_UNSIGNED(14)
BI_DEFINE_SIGNED(14)
BI_DEFINE_UNSIGNED(15)
BI_DEFINE_SIGNED(15)
BI_DEFINE_UNSIGNED(16)
BI_DEFINE_SIGNED(16)

int avm_test_main(void)
{
    for (bi_it = 0; bi_it < BI_ITERATIONS; ++bi_it) {
        BI_RUN_UNSIGNED(13);
        BI_RUN_SIGNED(13);
        BI_RUN_UNSIGNED(14);
        BI_RUN_SIGNED(14);
        BI_RUN_UNSIGNED(15);
        BI_RUN_SIGNED(15);
        BI_RUN_UNSIGNED(16);
        BI_RUN_SIGNED(16);
        if (bi_failure != 0)
            return bi_report(bi_failure);
    }
    return 0;
}
