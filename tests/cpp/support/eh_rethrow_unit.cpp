// The second translation unit of eh_rethrow_cross_unit. It throws a Relay, catches it
// here by reference, and rethrows it. The rethrow leaves this unit, so the main unit
// catches the original object. The destruction count is kept here, where the destructor
// that runs for the exception is defined.
#include "eh_rethrow.h"

int eh_rethrow_relay_destructions = 0;

int eh_rethrow_relay(int value) {
    try {
        throw Relay(value);
    } catch (const Relay &first) {
        if (first.value != value)
            return 0;
        throw;
    }
    return 0;
}
