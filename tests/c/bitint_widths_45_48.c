/* C23 bit-precise integers: every unsigned and signed width in 45-48. */
#include "bitint_oracle.h"

BI_DEFINE_UNSIGNED(45)
BI_DEFINE_SIGNED(45)
BI_DEFINE_UNSIGNED(46)
BI_DEFINE_SIGNED(46)
BI_DEFINE_UNSIGNED(47)
BI_DEFINE_SIGNED(47)
BI_DEFINE_UNSIGNED(48)
BI_DEFINE_SIGNED(48)

int avm_test_main(void)
{
    for (bi_it = 0; bi_it < BI_ITERATIONS; ++bi_it) {
        BI_RUN_UNSIGNED(45);
        BI_RUN_SIGNED(45);
        BI_RUN_UNSIGNED(46);
        BI_RUN_SIGNED(46);
        BI_RUN_UNSIGNED(47);
        BI_RUN_SIGNED(47);
        BI_RUN_UNSIGNED(48);
        BI_RUN_SIGNED(48);
        if (bi_failure != 0)
            return bi_report(bi_failure);
    }
    return 0;
}
