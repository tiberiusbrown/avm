// Cross-unit base catches. The Joined object is built and thrown by the support unit,
// and the catches are in this unit. Each catch must match the one Joined descriptor
// that both units name, and the handler of Trail must bind to the subobject that lies
// two bytes into the object.
#include "../../../support/cpp/eh_inheritance.h"

extern "C" int avm_test_main(void);

namespace {

int failures = 0;

void expect(bool ok) {
    if (!ok)
        ++failures;
}

__attribute__((noinline)) int catch_trail() {
    try {
        eh_inheritance_throw_joined(1, 2, 3);
    } catch (Trail &trail) {
        expect(&trail == static_cast<Trail *>(
                             static_cast<Joined *>(eh_inheritance_joined_address())));
        return trail.trail == 2 ? 1 : 0;
    }
    return 0;
}

__attribute__((noinline)) int catch_lead() {
    try {
        eh_inheritance_throw_joined(4, 5, 6);
    } catch (const Lead &lead) {
        return lead.lead == 4 ? 1 : 0;
    }
    return 0;
}

__attribute__((noinline)) int catch_exact() {
    try {
        eh_inheritance_throw_joined(7, 8, 9);
    } catch (Joined &joined) {
        return joined.joined == 9 ? 1 : 0;
    } catch (Lead &) {
        return 0;
    }
    return 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    expect(catch_trail() == 1);
    expect(catch_lead() == 1);
    expect(catch_exact() == 1);
    return failures == 0 ? 0 : 1;
}
