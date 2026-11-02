// Shared by the eh_typed fixture and its support unit. Both units use the class
// Remote, so its single flash-resident descriptor must match across the link.
#ifndef AVM_TESTS_EH_TYPED_H
#define AVM_TESTS_EH_TYPED_H

struct Remote {
    int x;
};

// Defined in eh_typed_unit.cpp. It throws Remote{value}.
void eh_typed_throw_remote(int value);

#endif
