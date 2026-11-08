#include <algorithm>
#include <execution>
#include <functional>
#include <iterator>
#include <memory>
#include <numeric>
#include <type_traits>

namespace {

const int input[] = {1, 2, 3, 4, 5, 6, 7, 8};
int work[8];
int extra[8];
alignas(int) unsigned char storage[8 * sizeof(int)];
constexpr int zero = 0;
constexpr int nine = 9;

template<class T> struct forward_iterator {
    using value_type = std::remove_const_t<T>;
    using difference_type = std::ptrdiff_t;
    using iterator_category = std::forward_iterator_tag;
    T* pointer;
    T& operator*() const { return *pointer; }
    forward_iterator& operator++() { ++pointer; return *this; }
    forward_iterator operator++(int) { auto old = *this; ++*this; return old; }
    bool operator==(const forward_iterator&) const = default;
};

static_assert(std::is_execution_policy_v<std::execution::sequenced_policy>);
static_assert(std::is_execution_policy_v<std::execution::parallel_policy>);
static_assert(std::is_execution_policy_v<std::execution::parallel_unsequenced_policy>);
static_assert(std::is_execution_policy_v<std::execution::unsequenced_policy>);
static_assert(!std::is_execution_policy_v<int>);
#ifndef __cpp_lib_execution
#error Execution policy feature-test macro is missing
#endif

template<class Policy> __attribute__((noinline)) int predicates(const Policy& policy)
{
    if(!std::all_of(policy, input, input + 8, [](int v) { return v > 0; }) ||
       !std::any_of(policy, input, input + 8, [](int v) { return v == 7; }) ||
       !std::none_of(policy, input, input + 8, [](int v) { return v < 0; }))
        return 1;
    if(std::count_if(policy, input, input + 8, [](int v) { return v % 2 == 0; }) != 4 ||
       std::find(policy, input, input + 8, 5) != input + 4)
        return 2;
    return 0;
}

template<class Policy> __attribute__((noinline)) int copy_transform(const Policy& policy)
{
    if(std::copy(policy, input, input + 8, work) != work + 8 ||
       !std::equal(policy, input, input + 8, work))
        return 1;
    std::transform(policy, input, input + 8, work, [](int v) { return 2 * v; });
    std::transform(policy, input, input + 8, work, extra, [](int a, int b) { return a + b; });
    return extra[0] == 3 && extra[7] == 24 ? 0 : 2;
}

template<class Policy> __attribute__((noinline)) int generate_fill(const Policy& policy)
{
    std::fill(policy, work, work + 8, nine);
    std::for_each(policy, work, work + 8, [](int& v) { ++v; });
    if(work[0] != 10 || work[7] != 10)
        return 1;
    std::generate(policy, work, work + 8, [] { return 7; });
    return work[0] == 7 && work[7] == 7 ? 0 : 2;
}

template<class Policy> __attribute__((noinline)) int ordering(const Policy& policy)
{
    if(std::reverse_copy(policy, input, input + 8, work) != work + 8)
        return 3;
    std::sort(policy, work, work + 8);
    if(!std::is_sorted(policy, work, work + 8))
        return 1;
    std::stable_sort(policy, work, work + 8, std::greater<int>{});
    return work[0] == 8 && work[7] == 1 ? 0 : 2;
}

template<class Policy> __attribute__((noinline)) int reductions(const Policy& policy)
{
    if(std::reduce(policy, input, input + 8, zero) != 36)
        return 1;
    return std::transform_reduce(policy, input, input + 8, input, zero) == 204 ? 0 : 2;
}

template<class Policy> __attribute__((noinline)) int scans(const Policy& policy)
{
    std::inclusive_scan(policy, input, input + 8, work);
    if(work[0] != 1 || work[7] != 36)
        return 1;
    std::exclusive_scan(policy, input, input + 8, extra, zero);
    if(extra[0] != 0 || extra[7] != 28)
        return 2;
    std::transform_exclusive_scan(policy, input, input + 8, extra, zero,
        std::plus<int>{}, [](int v) { return 2 * v; });
    if(extra[0] != 0 || extra[7] != 56)
        return 3;
    std::exclusive_scan(policy, work, work + 8, work, zero, std::plus<int>{});
    return work[0] == 0 && work[7] == 84 ? 0 : 4;
}

template<class Policy> __attribute__((noinline)) int forward_ranges(const Policy& policy)
{
    auto first = forward_iterator<const int>{input};
    auto last = forward_iterator<const int>{input + 8};
    auto out = forward_iterator<int>{work};
    if(std::copy(policy, first, last, out).pointer != work + 8 || work[0] != 1 || work[7] != 8)
        return 1;
    return std::count_if(policy, first, last, [](int v) { return v % 2 == 0; }) == 4 ? 0 : 2;
}

template<class Policy> __attribute__((noinline)) int lifetime(const Policy& policy)
{
    auto* values = reinterpret_cast<int*>(storage);
    std::uninitialized_copy(policy, input, input + 8, values);
    if(values[0] != 1 || values[7] != 8)
        return 1;
    std::destroy(policy, values, values + 8);
    std::uninitialized_fill(policy, values, values + 8, nine);
    if(values[0] != 9 || values[7] != 9)
        return 2;
    std::destroy_n(policy, values, 8);
    return 0;
}

template<class Policy> int run(const Policy& policy)
{
    if(predicates(policy) != 0 || copy_transform(policy) != 0 || generate_fill(policy) != 0 ||
       ordering(policy) != 0 || reductions(policy) != 0 || scans(policy) != 0 ||
       forward_ranges(policy) != 0 || lifetime(policy) != 0)
        return 1;
    return 0;
}

}

extern "C" int avm_test_main()
{
    if(run(std::execution::seq) != 0 || run(std::execution::par) != 0 ||
       run(std::execution::par_unseq) != 0 || run(std::execution::unseq) != 0)
        return 1;
    return 0;
}
