/* C23 bit-precise integers: every unsigned and signed width in 49-52. */
#include "bitint_oracle.h"

BI_DEFINE_UNSIGNED(49)
BI_DEFINE_SIGNED(49)
BI_DEFINE_UNSIGNED(50)
BI_DEFINE_SIGNED(50)
BI_DEFINE_UNSIGNED(51)
BI_DEFINE_SIGNED(51)
BI_DEFINE_UNSIGNED(52)
BI_DEFINE_SIGNED(52)

int avm_test_main(void)
{
    for (bi_it = 0; bi_it < BI_ITERATIONS; ++bi_it) {
        BI_RUN_UNSIGNED(49);
        BI_RUN_SIGNED(49);
        BI_RUN_UNSIGNED(50);
        BI_RUN_SIGNED(50);
        BI_RUN_UNSIGNED(51);
        BI_RUN_SIGNED(51);
        BI_RUN_UNSIGNED(52);
        BI_RUN_SIGNED(52);
        if (bi_failure != 0)
            return bi_report(bi_failure);
    }
    return 0;
}
