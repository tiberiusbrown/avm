// Shared by the eh_inheritance_cross_unit fixture and its support unit. Both units
// name Lead, Trail, and Joined, so each descriptor must be one object across the link.
// Trail lies at offset two in Joined, so a catch through Trail must find that offset.
#ifndef AVM_TESTS_EH_INHERITANCE_H
#define AVM_TESTS_EH_INHERITANCE_H

struct Lead {
    int lead;
};

struct Trail {
    int trail;
};

struct Joined : Lead, Trail {
    int joined;
    Joined(int l, int t, int j);
};

// Defined in eh_inheritance_unit.cpp. It throws a Joined built from its arguments.
void eh_inheritance_throw_joined(int lead, int trail, int joined);

// Defined in eh_inheritance_unit.cpp. It returns the address of the Joined object that
// the most recent throw built.
void *eh_inheritance_joined_address(void);

#endif
