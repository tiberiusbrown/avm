// The second translation unit of eh_virtual_cross_unit. It builds a VMost object and throws
// it, so the catches in the main unit match the descriptor and vtable across the link. The
// constructor and destructor record the object's address and destruction count, which the
// main unit checks against the handler.
#include "eh_virtual.h"

namespace {

void *last_most;
int most_destructions;

} // namespace

VMost::VMost(int v, int m, int t) : VBase(v), VMid(m), most(t) {
    last_most = this;
}

VMost::~VMost() {
    ++most_destructions;
}

void eh_virtual_throw_most(int value, int mid, int most) {
    throw VMost(value, mid, most);
}

void *eh_virtual_most_address(void) {
    return last_most;
}

int eh_virtual_most_destructions(void) {
    return most_destructions;
}
