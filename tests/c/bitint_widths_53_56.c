/* C23 bit-precise integers: every unsigned and signed width in 53-56. */
#include "bitint_oracle.h"

BI_DEFINE_UNSIGNED(53)
BI_DEFINE_SIGNED(53)
BI_DEFINE_UNSIGNED(54)
BI_DEFINE_SIGNED(54)
BI_DEFINE_UNSIGNED(55)
BI_DEFINE_SIGNED(55)
BI_DEFINE_UNSIGNED(56)
BI_DEFINE_SIGNED(56)

int avm_test_main(void)
{
    for (bi_it = 0; bi_it < BI_ITERATIONS; ++bi_it) {
        BI_RUN_UNSIGNED(53);
        BI_RUN_SIGNED(53);
        BI_RUN_UNSIGNED(54);
        BI_RUN_SIGNED(54);
        BI_RUN_UNSIGNED(55);
        BI_RUN_SIGNED(55);
        BI_RUN_UNSIGNED(56);
        BI_RUN_SIGNED(56);
        if (bi_failure != 0)
            return bi_report(bi_failure);
    }
    return 0;
}
