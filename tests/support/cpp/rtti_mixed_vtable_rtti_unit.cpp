// The -frtti copy of Derived's vtable. Its RTTI slot names the canonical descriptor, which
// the window copy of the descriptor provides. The static object keeps the vtable in the link.
#include "rtti_mixed_vtable.h"

namespace rtti_mixed_vtable {

const Base &rtti_object() {
    static Derived object;
    return object;
}

} // namespace rtti_mixed_vtable
