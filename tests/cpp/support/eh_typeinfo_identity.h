#ifndef AVM_TEST_EH_TYPEINFO_IDENTITY_H
#define AVM_TEST_EH_TYPEINFO_IDENTITY_H

// The main unit names Remote with typeid and catches it by exact type. The second
// unit throws it, so the throw and the typeid must share one descriptor.
struct Remote {
    int code;
};

// Throws Remote{code} from the second translation unit.
void throw_remote(int code);

#endif
