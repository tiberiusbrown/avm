#include <algorithm>
#include <functional>
#include <iterator>
#include <ranges>
#include <type_traits>

namespace {

int integers[65];
unsigned frequencies[65];
unsigned comparisons;
unsigned live_values;

struct record {
    int key = 0;
    unsigned identity = 0;
    record() noexcept { ++live_values; }
    record(const record&) = delete;
    record& operator=(const record&) = delete;
    record(record&& other) noexcept : key(other.key), identity(other.identity)
    {
        ++live_values;
        other.identity = 0xffffu;
    }
    record& operator=(record&& other) noexcept
    {
        key = other.key;
        identity = other.identity;
        other.identity = 0xffffu;
        return *this;
    }
    ~record() { --live_values; }
    bool operator<(const record& other) const
    {
        ++comparisons;
        return key < other.key;
    }
};

record records[65];

struct greater_key {
    bool operator()(int left, int right) const
    {
        ++comparisons;
        return left > right;
    }
};

unsigned value_for(unsigned index, unsigned count, unsigned pattern)
{
    return pattern == 0 ? index : pattern == 1 ? count - index - 1 :
        pattern == 2 ? 7 : pattern == 3 ? index % 4 : (index * 17 + count * 3) % 65;
}

__attribute__((noinline)) int integer_sort()
{
    for(unsigned count = 0; count <= 65; ++count)
        for(unsigned pattern = 0; pattern != 5; ++pattern) {
            std::fill(std::begin(frequencies), std::end(frequencies), 0u);
            for(unsigned i = 0; i != count; ++i) {
                const unsigned value = value_for(i, count, pattern);
                integers[i] = int(value) - 32;
                ++frequencies[value];
            }
            if(pattern % 2)
                std::sort(integers, integers + count);
            else
                std::stable_sort(integers, integers + count);
            for(unsigned i = 0; i != count; ++i) {
                const int value = integers[i] + 32;
                if(value < 0 || value >= 65 || frequencies[value] == 0 ||
                   (i != 0 && integers[i - 1] > integers[i]))
                    return 1;
                --frequencies[value];
            }
        }
    return 0;
}

template<class T> __attribute__((noinline)) int scalar_sort()
{
    static T values[] = {T(3), T(-2), T(0), T(3), T(1), T(-7)};
    static constexpr bool is_unsigned = std::is_unsigned_v<T>;
    static constexpr T expected[] = {T(is_unsigned ? 0 : -7), T(is_unsigned ? 1 : -2),
        T(is_unsigned ? 3 : 0), T(is_unsigned ? 3 : 1), T(is_unsigned ? -7 : 3), T(is_unsigned ? -2 : 3)};
    std::sort(values, values + 6);
    for(unsigned i = 0; i != 6; ++i)
        if(values[i] != expected[i])
            return 1;
    return 0;
}

__attribute__((noinline)) int record_sort()
{
    for(unsigned count = 0; count <= 65; ++count)
        for(unsigned pattern = 0; pattern != 5; ++pattern) {
            for(unsigned i = 0; i != count; ++i) {
                records[i].key = int(value_for(i, count, pattern)) - 32;
                records[i].identity = i;
            }
            comparisons = 0;
            if(pattern % 2) {
                if(std::ranges::stable_sort(records, records + count, greater_key{}, &record::key) != records + count)
                    return 1;
            } else {
                std::stable_sort(records, records + count);
            }
            unsigned levels = 0;
            for(unsigned size = count; size != 0; size >>= 1)
                ++levels;
            if(comparisons > count * levels || live_values != 65)
                return 2;
            for(unsigned i = 0; i != count; ++i) {
                const auto identity = records[i].identity;
                if(identity >= count || records[i].key != int(value_for(identity, count, pattern)) - 32)
                    return 3;
                if(i != 0 && (pattern % 2 ? records[i - 1].key < records[i].key :
                                           records[i - 1].key > records[i].key))
                    return 4;
                if(i != 0 && records[i - 1].key == records[i].key && records[i - 1].identity > identity)
                    return 5;
            }
        }
    return 0;
}

}

extern "C" int avm_test_main()
{
    if(integer_sort() != 0)
        return 1;
    if(scalar_sort<unsigned long>() != 0 || scalar_sort<long long>() != 0 || scalar_sort<float>() != 0)
        return 3;
    return record_sort() == 0 ? 0 : 2;
}
