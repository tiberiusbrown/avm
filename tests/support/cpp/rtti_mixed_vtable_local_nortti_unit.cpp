// The -fno-rtti copy of a local-linkage vtable. LocalDerived lives in an anonymous
// namespace, so its vtable is local to this unit and is never a COMDAT candidate. The
// typeid call that makes the helper live is in the typeid unit.
#include "../../codegen/c/test_hex_output.h"
#include "rtti_mixed_vtable.h"

namespace {

struct LocalDerived : rtti_mixed_vtable::Base {
    int value() const override { return 3; }
};

} // namespace

extern "C" int avm_test_main() {
    static LocalDerived object;
    rtti_mixed_vtable::dynamic_type(object);
    if (object.value() != 3) {
        test_line16("line", __LINE__);
        return 1;
    }
    return 0;
}
