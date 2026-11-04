// Shared by the eh_rethrow_cross_unit fixture and its support unit. Both units use the
// class Relay, so its single flash-resident descriptor must match across the link. Its
// destructor counts into a variable that the support unit defines, so the main unit can
// check that the one exception object is destroyed exactly once.
#ifndef AVM_TESTS_EH_RETHROW_H
#define AVM_TESTS_EH_RETHROW_H

extern int eh_rethrow_relay_destructions;

struct Relay {
    int value;
    explicit Relay(int v) : value(v) {}
    Relay(const Relay &other) : value(other.value) {}
    ~Relay() { ++eh_rethrow_relay_destructions; }
};

// Defined in eh_rethrow_unit.cpp. It throws Relay{value}, catches it in that unit,
// and rethrows it to the caller, so the object crosses the unit boundary.
int eh_rethrow_relay(int value);

#endif
