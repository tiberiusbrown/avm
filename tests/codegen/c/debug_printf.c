#include <avm.h>

int avm_test_main(void)
{
    avm_debug_printf_P(F("d=%+d\n"), 42);
    return 0;
}