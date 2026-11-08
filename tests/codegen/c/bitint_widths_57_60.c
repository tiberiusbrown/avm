/* C23 bit-precise integers: every unsigned and signed width in 57-60. */
#include "bitint_oracle.h"

BI_DEFINE_UNSIGNED(57)
BI_DEFINE_SIGNED(57)
BI_DEFINE_UNSIGNED(58)
BI_DEFINE_SIGNED(58)
BI_DEFINE_UNSIGNED(59)
BI_DEFINE_SIGNED(59)
BI_DEFINE_UNSIGNED(60)
BI_DEFINE_SIGNED(60)

int avm_test_main(void)
{
    for (bi_it = 0; bi_it < BI_ITERATIONS; ++bi_it) {
        BI_RUN_UNSIGNED(57);
        BI_RUN_SIGNED(57);
        BI_RUN_UNSIGNED(58);
        BI_RUN_SIGNED(58);
        BI_RUN_UNSIGNED(59);
        BI_RUN_SIGNED(59);
        BI_RUN_UNSIGNED(60);
        BI_RUN_SIGNED(60);
        if (bi_failure != 0)
            return bi_report(bi_failure);
    }
    return 0;
}
