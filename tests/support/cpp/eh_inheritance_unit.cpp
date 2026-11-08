// The second translation unit of eh_inheritance_cross_unit. It builds a Joined object
// and throws it, so the catches in the main unit match the descriptor across the link.
#include "eh_inheritance.h"

namespace {

void *last_joined;

} // namespace

Joined::Joined(int l, int t, int j) : Lead{l}, Trail{t}, joined(j) {
    last_joined = this;
}

void eh_inheritance_throw_joined(int lead, int trail, int joined) {
    throw Joined(lead, trail, joined);
}

void *eh_inheritance_joined_address(void) {
    return last_joined;
}
