// The -fno-rtti half of the mixed-link check. It throws Derived by value, so it emits the
// exception descriptor of Derived without RTTI. The descriptor has no .avm.rtti placement,
// so the layout puts it in .rodata, above 0xFFFF, which makes it the high copy.
namespace rtti_mixed {

struct Base {
    virtual ~Base() = default;
    virtual int value() const { return 1; }
};

struct Derived : Base {
    int value() const override { return 2; }
};

} // namespace rtti_mixed

extern "C" int mixed_high_throw() {
    try {
        throw rtti_mixed::Derived();
    } catch (const rtti_mixed::Derived &value) {
        return value.value();
    }
    return 0;
}
