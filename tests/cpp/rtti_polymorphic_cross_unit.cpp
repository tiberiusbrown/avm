#include <stdint.h>
#include <typeinfo>

#include "../c/test_hex_output.h"
#include "support/rtti_polymorphic.h"

#define CHECK(c) do { if (!(c)) { test_line16("line", __LINE__); return 1; } } while (0)

// The objects are created in the support unit. Their dynamic types are read here through
// base references, and each query must name the one canonical descriptor.
extern "C" int avm_test_main() {
    using namespace rtti_poly;

    Shared &shared = make_shared_derived();
    CHECK(&typeid(shared) == &typeid(SharedDerived));
    CHECK(typeid(shared) == typeid(SharedDerived));
    CHECK(shared.value() == 2);
    CHECK(typeid(shared) != typeid(Shared));

    // Inline classes emit their descriptors in both units, and the two copies merge.
    const Inline &created = make_inline_derived();
    InlineDerived local;
    Inline &local_reference = local;
    CHECK(&typeid(created) == &typeid(InlineDerived));
    CHECK(&typeid(local_reference) == &typeid(InlineDerived));
    CHECK(&typeid(created) == &typeid(local_reference));
    CHECK(typeid(shared) != typeid(InlineDerived));
    CHECK(&typeid(shared) != &typeid(created));

    test_puts("rtti-polymorphic-cross-unit=ok\n");
    return 0;
}
