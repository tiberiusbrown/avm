#include <algorithm>
#include <array>
#include <functional>
#include <iterator>
#include <numeric>
#include <ranges>
#include <utility>
#include <__utility/try_key_extraction.h>

namespace {

int sort_values[65];
unsigned frequencies[65];
unsigned comparisons;

struct counting_less {
    bool operator()(int left, int right) const
    {
        ++comparisons;
        return left < right;
    }
};

__attribute__((noinline)) int sort_patterns()
{
    for(unsigned count = 0; count <= 65; ++count) {
        for(unsigned pattern = 0; pattern != 5; ++pattern) {
            std::fill(std::begin(frequencies), std::end(frequencies), 0u);
            for(unsigned i = 0; i != count; ++i) {
                const unsigned value = pattern == 0 ? i :
                    pattern == 1 ? count - i - 1 :
                    pattern == 2 ? 7 :
                    pattern == 3 ? i % 4 : (i * 17 + count * 3) % 65;
                sort_values[i] = static_cast<int>(value);
                ++frequencies[value];
            }
            comparisons = 0;
            if(pattern % 2)
                std::ranges::sort(sort_values, sort_values + count, counting_less{});
            else
                std::sort(sort_values, sort_values + count, counting_less{});
            for(unsigned i = 0; i != count; ++i) {
                const int value = sort_values[i];
                if(value < 0 || value >= 65 || frequencies[value] == 0 ||
                   (i != 0 && sort_values[i - 1] > value))
                    return 1;
                --frequencies[value];
            }
            unsigned levels = 0;
            for(unsigned remaining = count; remaining != 0; remaining >>= 1)
                ++levels;
            if(comparisons > 2 * count * (levels + 1))
                return 2;
        }
    }
    return 0;
}

struct move_only {
    int key = 0;
    int identity = 0;
    constexpr move_only() = default;
    move_only(const move_only&) = delete;
    move_only& operator=(const move_only&) = delete;
    constexpr move_only(move_only&&) = default;
    constexpr move_only& operator=(move_only&&) = default;
};

move_only projected_values[17];

__attribute__((noinline)) int projected_sort()
{
    for(int i = 0; i != 17; ++i) {
        projected_values[i].key = (i * 7) % 17;
        projected_values[i].identity = i;
    }
    auto* end = std::ranges::sort(projected_values, std::greater<>{}, &move_only::key);
    if(end != projected_values + 17)
        return 1;
    for(int i = 0; i != 17; ++i) {
        if(projected_values[i].key != 16 - i ||
           projected_values[i].key != (projected_values[i].identity * 7) % 17)
            return 2;
    }
    return 0;
}

constexpr bool constexpr_sort()
{
    int values[] = {4, 1, 3, 1, 2};
    std::ranges::sort(values);
    return values[0] == 1 && values[1] == 1 && values[4] == 4;
}

static_assert(constexpr_sort());

struct extracted_key {
    template<class... Args>
    int operator()(const int& key, Args&&...) const { return key; }
};

struct unextracted_key {
    template<class... Args>
    int operator()(Args&&...) const { return -1; }
};

__attribute__((noinline)) int key_extraction()
{
    using value_type = std::pair<const int, int>;
    if(std::__try_key_extraction<int, int>(extracted_key{}, unextracted_key{}, 17) != 17)
        return 1;
    value_type pair{19, 1};
    if(std::__try_key_extraction<int, value_type>(extracted_key{}, unextracted_key{}, pair) != 19)
        return 2;
    if(std::__try_key_extraction<int, value_type>(extracted_key{}, unextracted_key{}, 23, 1) != 23)
        return 3;
    if(std::__try_key_extraction<int, value_type>(extracted_key{}, unextracted_key{},
            std::piecewise_construct, std::forward_as_tuple(pair.first), std::tuple<>()) != 19)
        return 4;
    if(std::__try_key_extraction<int, value_type>(extracted_key{}, unextracted_key{}, 1L) != -1)
        return 5;
    return 0;
}

}

extern "C" int avm_test_main()
{
    if(sort_patterns() != 0)
        return 4;
    if(projected_sort() != 0)
        return 5;
    if(key_extraction() != 0)
        return 6;
    std::array<int, 6> values{5, 1, 4, 2, 6, 3};
    std::for_each(values.begin(), values.end(),
                  [](int& value) { value *= 2; });
    if(values[0] != 10 || values[5] != 6)
        return 1;

    std::array<int, 6> descending{};
    std::ranges::copy(values, descending.begin());
    if(std::ranges::find(descending, 8) != descending.begin() + 2 ||
       !std::ranges::all_of(descending, [](int value) { return value > 0; }))
        return 2;

    int sequence[5]{};
    std::iota(std::begin(sequence), std::end(sequence), 1);
    const int total = std::accumulate(std::begin(sequence), std::end(sequence), 0);
    return total == 15 ? 0 : 3;
}
