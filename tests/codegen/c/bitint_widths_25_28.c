/* C23 bit-precise integers: every unsigned and signed width in 25-28. */
#include "bitint_oracle.h"

BI_DEFINE_UNSIGNED(25)
BI_DEFINE_SIGNED(25)
BI_DEFINE_UNSIGNED(26)
BI_DEFINE_SIGNED(26)
BI_DEFINE_UNSIGNED(27)
BI_DEFINE_SIGNED(27)
BI_DEFINE_UNSIGNED(28)
BI_DEFINE_SIGNED(28)

int avm_test_main(void)
{
    for (bi_it = 0; bi_it < BI_ITERATIONS; ++bi_it) {
        BI_RUN_UNSIGNED(25);
        BI_RUN_SIGNED(25);
        BI_RUN_UNSIGNED(26);
        BI_RUN_SIGNED(26);
        BI_RUN_UNSIGNED(27);
        BI_RUN_SIGNED(27);
        BI_RUN_UNSIGNED(28);
        BI_RUN_SIGNED(28);
        if (bi_failure != 0)
            return bi_report(bi_failure);
    }
    return 0;
}
