#include "rtti_static.h"

const std::type_info &unit_b_alpha() { return typeid(SharedAlpha); }

const std::type_info &unit_b_beta() { return typeid(SharedBeta); }

int SharedKeyed::value() const { return 2; }

const std::type_info &unit_b_keyed() { return typeid(SharedKeyed); }
