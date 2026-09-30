#include "support/separate_compilation.h"

__attribute__((noinline)) static int call_method(SeparateBase* object,
                                                  SeparateMethod method,
                                                  int input) {
    return (object->*method)(input);
}

extern "C" int avm_test_main() {
    if (separate_destructor_count() != 0)
        return 1;
    {
        SeparateDerived object(17);
        SeparateBase* base = &object;
        if (call_method(base, separate_method(), 5) != 22)
            return 2;
        if (base->value(6) != 23)
            return 3;
    }
    return separate_destructor_count() == 2 ? 0 : 4;
}
