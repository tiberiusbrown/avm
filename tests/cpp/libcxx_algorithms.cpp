#include <algorithm>
#include <array>
#include <functional>
#include <iterator>
#include <numeric>
#include <ranges>

extern "C" int avm_test_main()
{
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
