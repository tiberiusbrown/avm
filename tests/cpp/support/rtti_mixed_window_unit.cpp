// The -frtti half of the mixed-link check. Derived's vtable names its descriptor, and no
// typeid names Derived in this unit. The vtable's marker is therefore the only reference
// that asks the linker to check the descriptor's flash-window placement. The object is a
// global, so its constructor keeps the vtable alive after optimization.
namespace rtti_mixed {

struct Base {
    virtual ~Base() = default;
    virtual int value() const { return 1; }
};

struct Derived : Base {
    int value() const override { return 2; }
};

} // namespace rtti_mixed

rtti_mixed::Derived mixed_window_object;
rtti_mixed::Base *volatile mixed_window_pointer;

extern "C" int mixed_window_value() {
    mixed_window_pointer = &mixed_window_object;
    return mixed_window_pointer->value();
}
