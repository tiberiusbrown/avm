// Shared by the eh_virtual_cross_unit fixture and its support unit. Both units name VBase,
// VMid, and VMost, so each class must be one object across the link. VBase is a virtual
// base of VMid, and VMost is the complete object that holds it, so the catch in the main
// unit must find the base through the vptr of VMid in an object that the other unit built.
#ifndef AVM_TESTS_EH_VIRTUAL_H
#define AVM_TESTS_EH_VIRTUAL_H

struct VBase {
    int value;
    VBase(int v) : value(v) {}
};

struct VMid : virtual VBase {
    int mid;
    VMid(int m) : VBase(0), mid(m) {}
};

struct VMost : VMid {
    int most;
    VMost(int v, int m, int t);
    ~VMost();
};

// Defined in eh_virtual_unit.cpp. It throws a VMost built from its arguments.
void eh_virtual_throw_most(int value, int mid, int most);

// Defined in eh_virtual_unit.cpp. It returns the address of the VMost object that the most
// recent throw built.
void *eh_virtual_most_address(void);

// Defined in eh_virtual_unit.cpp. It returns how many times a VMost has been destroyed.
int eh_virtual_most_destructions(void);

#endif
