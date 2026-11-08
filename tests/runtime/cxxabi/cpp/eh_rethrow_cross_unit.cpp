// A rethrow that crosses a translation-unit boundary. The support unit throws a Relay,
// catches it, and rethrows it. This unit catches the original object by its exact class,
// rethrows it again from its own handler, and then catches it in an outer handler. The
// descriptor is shared across the link, and the object is destroyed once.
#include "../../../support/cpp/eh_rethrow.h"

extern "C" int avm_test_main(void);

namespace {

int failures = 0;

void expect(bool ok) {
    if (!ok)
        ++failures;
}

} // namespace

extern "C" int avm_test_main(void) {
    int seen = 0;
    try {
        eh_rethrow_relay(42);
    } catch (const Relay &caught) {
        seen = caught.value;
    }
    expect(seen == 42);
    expect(eh_rethrow_relay_destructions == 1);

    // The same object again, rethrown from this unit's own handler to an outer handler.
    seen = 0;
    try {
        try {
            eh_rethrow_relay(43);
        } catch (const Relay &) {
            throw;
        }
    } catch (const Relay &caught) {
        seen = caught.value;
    }
    expect(seen == 43);
    expect(eh_rethrow_relay_destructions == 2);
    return failures == 0 ? 0 : 1;
}
