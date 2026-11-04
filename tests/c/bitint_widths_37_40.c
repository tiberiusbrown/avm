/* C23 bit-precise integers: every unsigned and signed width in 37-40. */
#include "bitint_oracle.h"

BI_DEFINE_UNSIGNED(37)
BI_DEFINE_SIGNED(37)
BI_DEFINE_UNSIGNED(38)
BI_DEFINE_SIGNED(38)
BI_DEFINE_UNSIGNED(39)
BI_DEFINE_SIGNED(39)
BI_DEFINE_UNSIGNED(40)
BI_DEFINE_SIGNED(40)

int avm_test_main(void)
{
    for (bi_it = 0; bi_it < BI_ITERATIONS; ++bi_it) {
        BI_RUN_UNSIGNED(37);
        BI_RUN_SIGNED(37);
        BI_RUN_UNSIGNED(38);
        BI_RUN_SIGNED(38);
        BI_RUN_UNSIGNED(39);
        BI_RUN_SIGNED(39);
        BI_RUN_UNSIGNED(40);
        BI_RUN_SIGNED(40);
        if (bi_failure != 0)
            return bi_report(bi_failure);
    }
    return 0;
}
