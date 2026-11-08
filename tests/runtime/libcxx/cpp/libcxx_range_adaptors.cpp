#include <algorithm>
#include <array>
#include <iterator>
#include <ranges>
#include <tuple>
#include <vector>

namespace {

constexpr bool pointer_cache()
{
    int value = 7;
    std::ranges::__non_propagating_cache<int*> cache;
    cache.__emplace(&value);
    auto copy = cache;
    if(copy.__has_value() || !cache.__has_value() || *cache != &value)
        return false;
    auto moved = std::move(cache);
    if(moved.__has_value() || cache.__has_value())
        return false;
    moved.__emplace(nullptr);
    if(!moved.__has_value() || *moved != nullptr)
        return false;
    copy.__emplace_from([&] { return &value; });
    moved = copy;
    if(moved.__has_value() || !copy.__has_value())
        return false;
    moved = std::move(copy);
    return !moved.__has_value() && !copy.__has_value();
}
static_assert(pointer_cache());

__attribute__((noinline)) int pipeline()
{
    static int values[] = {1, 2, 3, 4, 5, 6};
    auto view = values | std::views::filter([](int x) { return x % 2 == 0; }) |
                std::views::transform([](int x) { return x * x; }) | std::views::drop(1) | std::views::take(2);
    int expected = 16;
    for(int value : view) {
        if(value != expected)
            return 1;
        expected += 20;
    }
    return expected == 56 ? 0 : 2;
}

__attribute__((noinline)) int joining()
{
    int values[][2] = {{1, 2}, {3, 4}, {5, 6}};
    auto flattened = values | std::views::join;
    int expected = 1;
    for(int value : flattened)
        if(value != expected++)
            return 1;
    return expected == 7 ? 0 : 2;
}

__attribute__((noinline)) int stepping()
{
    auto values = std::views::iota(1, 8) | std::views::stride(2) | std::views::reverse;
    int expected = 7;
    for(int value : values) {
        if(value != expected)
            return 1;
        expected -= 2;
    }
    return expected == -1 ? 0 : 2;
}

__attribute__((noinline)) int enumeration()
{
    int values[] = {3, 4, 5};
    unsigned count = 0;
    for(auto [index, value] : std::views::enumerate(values)) {
        if(index != static_cast<int>(count) || value != 3 + static_cast<int>(count))
            return 1;
        ++count;
    }
    return count == 3 ? 0 : 2;
}

__attribute__((noinline)) int zipping()
{
    int a[] = {1, 2, 3};
    int b[] = {5, 6};
    unsigned count = 0;
    for(auto [left, right] : std::views::zip(a, b)) {
        left += right;
        ++count;
    }
    return count == 2 && a[0] == 6 && a[1] == 8 && a[2] == 3 ? 0 : 1;
}

__attribute__((noinline)) int adjacency()
{
    int values[] = {1, 2, 3, 4};
    int expected = 1;
    for(auto [a, b] : std::views::pairwise(values)) {
        if(a != expected || b != expected + 1)
            return 1;
        ++expected;
    }
    return expected == 4 ? 0 : 2;
}

__attribute__((noinline)) int chunks()
{
    int values[] = {1, 2, 4, 5, 7};
    auto groups = values | std::views::chunk_by([](int a, int b) { return b == a + 1; });
    unsigned count = 0;
    for(auto group : groups) {
        if(std::ranges::distance(group) != (count < 2 ? 2 : 1))
            return 1;
        ++count;
    }
    return count == 3 ? 0 : 2;
}

__attribute__((noinline)) int iterators()
{
    int values[] = {3, 1, 2};
    std::vector<int> copy;
    std::copy(std::begin(values), std::end(values), std::back_inserter(copy));
    return copy.size() == 3 && copy[0] == 3 && copy[1] == 1 && copy[2] == 2 ? 0 : 1;
}

__attribute__((noinline)) int counted_and_reverse()
{
    std::array<int, 3> copy = {3, 1, 2};
    auto counted = std::views::counted(copy.begin(), 2);
    if(std::ranges::distance(counted) != 2 || counted[1] != 1)
        return 1;
    auto reversed = copy | std::views::reverse | std::views::common;
    return *reversed.begin() == 2 && *std::make_move_iterator(copy.begin()) == 3 ? 0 : 2;
}

}

extern "C" int avm_test_main()
{
    return pipeline() || joining() || stepping() || enumeration() || zipping() || adjacency() || chunks() || iterators() || counted_and_reverse();
}
