#include <algorithm>
#include <functional>
#include <ranges>

extern "C" void libcxx_freestanding_ranges_sort(int* first, int* last) {
    std::ranges::sort(first, last, std::greater<>{});
}
