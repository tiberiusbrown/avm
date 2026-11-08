#include "math_test.h"
#include "math_c99_cases.h"

#ifdef __cplusplus
extern "C"
#endif
int avm_test_main(void)
{
    for (int e=-149; e<=127; ++e) {
        uint32_t expected=e>=-126 ? (uint32_t)(e+127)<<23 : 1UL<<(e+149);
        if (check_result(exp2f((float)e),expected,0,(uint16_t)(e+149))) return 1;
    }
    return c99_cases();
}
