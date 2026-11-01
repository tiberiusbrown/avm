// RTTI identity across translation units. Both units throw the same class, and
// the link must keep one flash-resident descriptor for it. A second class with an
// identical layout must keep a descriptor of its own. The exceptions cross from the
// second unit into this one, and each catch(...) runs its handler, so the logged
// order is the cleanup, the handler, and then the destruction of the exception.
#include "support/eh_rtti_identity.h"

extern "C" int avm_test_main(void);

namespace {

int failures = 0;

void expect(bool ok) {
    if (!ok)
        ++failures;
}

volatile int log_entries[8];
volatile int log_count;

} // namespace

void eh_identity_append(int tag) {
    log_entries[log_count] = tag;
    log_count = log_count + 1;
}

extern "C" int avm_test_main(void) {
    // Thrown in the second unit: cleanup 7, handler 90, then the exception 7.
    log_count = 0;
    try {
        eh_identity_throw_shared(7);
    } catch (...) {
        eh_identity_append(90);
    }
    expect(log_count == 3 && log_entries[0] == 7 && log_entries[1] == 90 &&
           log_entries[2] == 7);

    // Thrown in this unit, with the same descriptor requested again.
    log_count = 0;
    try {
        Shared value(9);
        throw value;
    } catch (...) {
        eh_identity_append(92);
    }
    expect(log_count == 3 && log_entries[0] == 9 && log_entries[1] == 92 &&
           log_entries[2] == 9);

    // A distinct class with the same layout keeps its own descriptor.
    log_count = 0;
    try {
        Distinct value(8);
        throw value;
    } catch (...) {
        eh_identity_append(91);
    }
    expect(log_count == 3 && log_entries[0] == 8 && log_entries[1] == 91 &&
           log_entries[2] == 8);

    return failures == 0 ? 0 : 1;
}
