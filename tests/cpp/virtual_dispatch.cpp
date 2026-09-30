struct Base {
    virtual int value();
};

struct Other {
    virtual int other();
};

struct Derived : Base, Other {
    int value() override;
    int other() override;
};

struct Root {
    virtual int root();
};

struct VirtualDerived : virtual Root {
    int root() override;
};

static_assert(sizeof(Base) == 3, "AVM vptrs occupy three bytes");

int Base::value() { return 1; }
int Other::other() { return 3; }
int Derived::value() { return 2; }
int Derived::other() { return 4; }
int Root::root() { return 5; }
int VirtualDerived::root() { return 6; }

__attribute__((noinline)) static int call_base(Base* object) {
    return object->value();
}

__attribute__((noinline)) static int call_other(Other* object) {
    return object->other();
}

__attribute__((noinline)) static int call_member(Base* object,
                                                  int (Base::*method)()) {
    return (object->*method)();
}

__attribute__((noinline)) static int call_root(Root* object) {
    return object->root();
}

extern "C" int avm_test_main() {
    Base base;
    Other other;
    Derived derived;
    Root root;
    VirtualDerived virtual_derived;
    Base* as_base = &derived;
    Other* as_other = &derived;
    Root* as_root = &virtual_derived;
    int (Base::*method)() = &Base::value;

    if (call_base(&base) != 1 || call_base(as_base) != 2)
        return 1;
    if (call_other(&other) != 3 || call_other(as_other) != 4)
        return 2;
    if (call_member(as_base, method) != 2)
        return 3;
    if (call_root(&root) != 5 || call_root(as_root) != 6)
        return 4;
    return 0;
}
