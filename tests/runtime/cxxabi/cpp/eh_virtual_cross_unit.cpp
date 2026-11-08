// Cross-unit virtual base catches. The VMost object is built and thrown by the support
// unit, and the catches are in this unit. The VBase handler must bind to the virtual base
// that the other unit's vptr locates, and the complete object must be destroyed once, when
// the catch ends.
#include "../../../support/cpp/eh_virtual.h"

extern "C" int avm_test_main(void);

namespace {

int failures = 0;

void expect(bool ok) {
    if (!ok)
        ++failures;
}

__attribute__((noinline)) int catch_virtual_base() {
    try {
        eh_virtual_throw_most(64, 16, 32);
    } catch (VBase &base) {
        expect(&base == static_cast<VBase *>(static_cast<VMost *>(eh_virtual_most_address())));
        expect(eh_virtual_most_destructions() == 0);
        return base.value == 64 ? 1 : 0;
    }
    return 0;
}

__attribute__((noinline)) int catch_mid() {
    try {
        eh_virtual_throw_most(64, 16, 32);
    } catch (VMid &mid) {
        expect(&mid == static_cast<VMid *>(static_cast<VMost *>(eh_virtual_most_address())));
        return mid.mid == 16 ? 1 : 0;
    }
    return 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    expect(catch_virtual_base() == 1);
    expect(eh_virtual_most_destructions() == 1);
    expect(catch_mid() == 1);
    expect(eh_virtual_most_destructions() == 2);
    return failures == 0 ? 0 : 1;
}
