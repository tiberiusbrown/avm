// The -fno-rtti copy of Derived's vtable. Its RTTI slot is zero, and this unit emits no
// descriptor. The static object keeps the constructor, and so the vtable, in the link.
#include "rtti_mixed_vtable.h"

namespace rtti_mixed_vtable {

const Base &nortti_object() {
    static Derived object;
    return object;
}

} // namespace rtti_mixed_vtable
