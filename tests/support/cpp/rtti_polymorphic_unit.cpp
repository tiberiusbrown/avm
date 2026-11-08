// The second translation unit of the polymorphic cross-unit fixture. It defines the key
// functions of Shared and SharedDerived, so their vtables and descriptors are emitted
// here, and it creates the objects that the main unit inspects through base references.
#include "rtti_polymorphic.h"

namespace rtti_poly {

Shared::~Shared() = default;

int Shared::value() const { return 1; }

SharedDerived::~SharedDerived() = default;

int SharedDerived::value() const { return 2; }

Shared &make_shared_derived() {
    static SharedDerived object;
    return object;
}

const Inline &make_inline_derived() {
    static InlineDerived object;
    return object;
}

} // namespace rtti_poly
