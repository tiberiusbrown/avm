// The -fno-rtti main unit for the programs without dynamic typeid. It uses virtual dispatch
// only, so the link has no live __avm_typeid_from_object, and an RTTI-disabled vtable is
// acceptable.
#include "../../c/test_hex_output.h"
#include "rtti_mixed_vtable.h"

extern "C" int avm_test_main() {
    using namespace rtti_mixed_vtable;
    if (nortti_object().value() != 2 || rtti_object().value() != 2) {
        test_line16("line", __LINE__);
        return 1;
    }
    test_puts("rtti-mixed-virtual=ok\n");
    return 0;
}
