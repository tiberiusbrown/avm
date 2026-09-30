#include "support/multiple_translation_units.h"

extern "C" int avm_test_main() {
    MultiDerived object;
    MultiBase* base = &object;
    if (multi_dispatch(base, 4) != 15)
        return 1;
    if (multi_dispatch(base, 7) != 24)
        return 2;
    return multi_call_count() == 2 ? 0 : 3;
}
