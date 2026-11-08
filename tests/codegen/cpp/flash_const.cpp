#include <stdint.h>

#include "../c/test_hex_output.h"

#define CHECK(c) do { if (!(c)) { test_line16("line", __LINE__); return 1; } } while (0)

namespace {
struct Point {
    int x;
    int y;
};

struct Counter {
    mutable int value;
};

struct Base {
    virtual int value() const { return 1; }
};

struct Derived : Base {
    int value() const override { return 2; }
};

// The volatile source keeps the dynamic initializer from becoming a constant.
__attribute__((noinline)) int get_value() {
    volatile int source = 3;
    return source;
}

constexpr int values[] = {10, 20, 30};
constexpr Point origin{0, 0};
const Counter counter{1};
const int runtime_value = get_value();
inline constexpr int inline_table[] = {1, 2};
const Derived derived_object{};

__attribute__((noinline)) int use_locals() {
    static const int local_constant = 7;
    static const int local_dynamic = get_value();
    return local_constant + local_dynamic;
}

__attribute__((noinline)) int read_at(const int *p, unsigned index) {
    return p[index];
}

__attribute__((noinline)) uint16_t address_of(const void *p) {
    return (uint16_t)(uintptr_t)p;
}
}

extern "C" int avm_test_main() {
    CHECK(address_of(values) >= 0x0B00u);
    CHECK(read_at(values, 2) == 30);
    CHECK(address_of(inline_table) >= 0x0B00u);
    CHECK(read_at(inline_table, 1) == 2);
    CHECK(address_of(&origin) >= 0x0B00u);
    CHECK(read_at(&origin.x, 1) == 0);

    CHECK(address_of(&counter) < 0x0B00u);
    counter.value = 2;
    CHECK(counter.value == 2);

    CHECK(address_of(&runtime_value) < 0x0B00u);
    CHECK(runtime_value == 3);
    CHECK(use_locals() == 10);

    const Base *base = &derived_object;
    CHECK(address_of(base) >= 0x0B00u);
    CHECK(base->value() == 2);

    test_puts("flash-const=ok\n");
    return 0;
}
