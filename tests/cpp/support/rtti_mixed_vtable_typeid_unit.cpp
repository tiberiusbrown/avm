// The only dynamic typeid of the mixed-vtable fixtures. A link that omits this unit has no
// live __avm_typeid_from_object, so the vtable check is not needed there.
#include <typeinfo>

#include "rtti_mixed_vtable.h"

namespace rtti_mixed_vtable {

__attribute__((noinline)) const std::type_info &dynamic_type(const Base &base) {
    return typeid(base);
}

} // namespace rtti_mixed_vtable
