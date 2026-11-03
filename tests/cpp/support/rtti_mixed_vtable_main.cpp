// The -frtti main unit of the mixed-vtable fixtures. It inspects both objects through base
// references and calls the typeid unit. Each query must name the one canonical descriptor,
// which is the descriptor that the linker's selected vtable names.
#include <typeinfo>

#include "../../c/test_hex_output.h"
#include "rtti_mixed_vtable.h"

#define CHECK(c)                                                                         \
    do {                                                                                 \
        if (!(c)) {                                                                      \
            test_line16("line", __LINE__);                                               \
            return 1;                                                                    \
        }                                                                                \
    } while (0)

extern "C" int avm_test_main() {
    using namespace rtti_mixed_vtable;
    const Base &nortti = nortti_object();
    const Base &rtti = rtti_object();
    CHECK(nortti.value() == 2);
    CHECK(rtti.value() == 2);
    CHECK(&dynamic_type(nortti) == &typeid(Derived));
    CHECK(&dynamic_type(rtti) == &typeid(Derived));
    test_puts("rtti-mixed-vtable=ok\n");
    return 0;
}
