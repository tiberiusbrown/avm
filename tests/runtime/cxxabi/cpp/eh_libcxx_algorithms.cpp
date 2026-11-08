#include <algorithm>
#include <ranges>
#include <utility>

namespace {

unsigned live;
unsigned fail_comparison;
unsigned fail_construction;
unsigned fail_assignment;

struct value {
    int key = 0;
    value() noexcept { ++live; }
    value(const value&) = delete;
    value& operator=(const value&) = delete;
    value(value&& other) : key(other.key)
    {
        if(fail_construction != 0 && --fail_construction == 0)
            throw 37;
        ++live;
        other.key = -1;
    }
    value& operator=(value&& other)
    {
        if(fail_assignment != 0 && --fail_assignment == 0)
            throw 41;
        key = other.key;
        other.key = -1;
        return *this;
    }
    ~value() { --live; }
};

value values[4];

struct less {
    bool operator()(const value& left, const value& right) const
    {
        if(fail_comparison != 0 && --fail_comparison == 0)
            throw 31;
        return left.key < right.key;
    }
};

void prepare()
{
    for(unsigned i = 0; i != 4; ++i)
        values[i].key = 4 - i;
    fail_comparison = fail_construction = fail_assignment = 0;
}

__attribute__((noinline)) int comparison_failure()
{
    prepare();
    fail_comparison = 2;
    try {
        std::stable_sort(values, values + 4, less{});
    } catch(int error) {
        return error == 31 && live == 4 ? 0 : 1;
    }
    return 2;
}

__attribute__((noinline)) int construction_failure()
{
    prepare();
    fail_construction = 1;
    try {
        std::stable_sort(values, values + 4, less{});
    } catch(int error) {
        return error == 37 && live == 4 ? 0 : 1;
    }
    return 2;
}

__attribute__((noinline)) int assignment_failure()
{
    prepare();
    fail_assignment = 1;
    try {
        std::stable_sort(values, values + 4, less{});
    } catch(int error) {
        return error == 41 && live == 4 ? 0 : 1;
    }
    return 2;
}

struct cached_value {
    cached_value() { ++live; }
    cached_value(const cached_value&) = delete;
    cached_value(cached_value&&) = delete;
    ~cached_value() { --live; }
};

__attribute__((noinline)) int cache_lifetimes()
{
    std::ranges::__non_propagating_cache<cached_value> cache;
    cache.__emplace_from([] { return cached_value{}; });
    if(live != 5)
        return 1;
    auto copy = cache;
    if(copy.__has_value() || !cache.__has_value())
        return 2;
    auto moved = std::move(cache);
    if(live != 4 || moved.__has_value() || cache.__has_value())
        return 3;
    copy.__emplace_from([] { return cached_value{}; });
    try {
        copy.__emplace_from([]() -> cached_value { throw 47; });
    } catch(int error) {
        return error == 47 && live == 4 && !copy.__has_value() ? 0 : 4;
    }
    return 5;
}

}

extern "C" int avm_test_main()
{
    if(comparison_failure() != 0)
        return 1;
    if(construction_failure() != 0)
        return 2;
    if(assignment_failure() != 0)
        return 3;
    return cache_lifetimes() == 0 && live == 4 ? 0 : 4;
}
