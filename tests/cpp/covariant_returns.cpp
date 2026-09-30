struct Prefix {
    virtual int prefix() const;
    int pad;
};

struct Base {
    virtual Base* self();
    virtual int value() const;
};

struct Derived : Prefix, Base {
    Derived* self() override;
    int value() const override;
    int payload;
};

int Prefix::prefix() const { return pad; }
Base* Base::self() { return this; }
int Base::value() const { return 1; }
Derived* Derived::self() { return this; }
int Derived::value() const { return payload; }

__attribute__((noinline)) static Base* call_self(Base* object) {
    return object->self();
}

__attribute__((noinline)) static int call_value(Base* object) {
    return object->value();
}

extern "C" int avm_test_main() {
    Base plain;
    Derived derived;
    derived.pad = 9;
    derived.payload = 42;
    Base* adjusted_base = &derived;
    if (reinterpret_cast<void*>(adjusted_base) ==
        reinterpret_cast<void*>(&derived))
        return 1;
    if (call_self(&plain) != &plain)
        return 2;
    if (call_self(adjusted_base) != adjusted_base)
        return 3;
    if (derived.self() != &derived)
        return 4;
    if (call_value(adjusted_base) != 42 || derived.prefix() != 9)
        return 5;
    return 0;
}
