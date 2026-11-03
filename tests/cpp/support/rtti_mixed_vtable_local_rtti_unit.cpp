// The -frtti copy of the anonymous-namespace vtable. Its descriptor is local too, and the
// typeid unit must return the same descriptor that typeid(LocalDerived) names here.
#include <typeinfo>

#include "../../c/test_hex_output.h"
#include "rtti_mixed_vtable.h"

namespace {

struct LocalDerived : rtti_mixed_vtable::Base {
    int value() const override { return 3; }
};

} // namespace

extern "C" int avm_test_main() {
    static LocalDerived object;
    if (&rtti_mixed_vtable::dynamic_type(object) != &typeid(LocalDerived)) {
        test_line16("line", __LINE__);
        return 1;
    }
    test_puts("rtti-mixed-local=ok\n");
    return 0;
}
