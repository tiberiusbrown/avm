#include <cstdlib>
#include <deque>
#include <iterator>
#include <memory>
#include <new>

namespace {

unsigned fail_allocation;
unsigned live_allocations;
unsigned fail_copy;
unsigned live_values;
unsigned failure_point;
int result;
const int input[] = {7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17};

template<class T> struct input_iterator {
    using value_type = T;
    using difference_type = std::ptrdiff_t;
    using iterator_category = std::input_iterator_tag;
    const T* pointer;
    const T& operator*() const { return *pointer; }
    input_iterator& operator++() { ++pointer; return *this; }
    input_iterator operator++(int) { auto old = *this; ++*this; return old; }
    bool operator==(const input_iterator&) const = default;
};

const input_iterator<int> first{input};
const input_iterator<int> last{input + 11};

using container = std::deque<int>;
alignas(container) unsigned char storage[sizeof(container)];
container* values;
alignas(container::const_iterator) unsigned char position_storage[sizeof(container::const_iterator)];
alignas(container::iterator) unsigned char iterator_storage[sizeof(container::iterator)];

template<bool Input> __attribute__((noinline)) void allocation_failure()
{
    values = std::construct_at(reinterpret_cast<container*>(storage));
    ::new (static_cast<void*>(position_storage)) container::const_iterator(values->cbegin());
    fail_allocation = failure_point;
    result = 3;
    try {
        if constexpr(Input)
            ::new (static_cast<void*>(iterator_storage)) container::iterator(
                values->insert(*reinterpret_cast<container::const_iterator*>(position_storage), first, last));
        else
            ::new (static_cast<void*>(iterator_storage)) container::iterator(
                values->insert(*reinterpret_cast<container::const_iterator*>(position_storage), 3, input[0]));
    } catch(const std::bad_alloc&) {
        result = 0;
    }
    if(!values->empty() || fail_allocation != 0)
        result = 1;
    fail_allocation = 0;
    std::destroy_at(values);
    if(live_allocations != 0)
        result = 4;
}

struct counted_value {
    int value = 7;
    counted_value() noexcept { ++live_values; }
    counted_value(const counted_value& other) : value(other.value)
    {
        if(fail_copy != 0 && --fail_copy == 0)
            throw 31;
        ++live_values;
    }
    counted_value(counted_value&& other) noexcept : value(other.value) { ++live_values; }
    counted_value& operator=(const counted_value&) = default;
    counted_value& operator=(counted_value&&) = default;
    ~counted_value() { --live_values; }
};

const counted_value source[11];
const input_iterator<counted_value> counted_first{source};
const input_iterator<counted_value> counted_last{source + 11};
using counted_container = std::deque<counted_value>;
alignas(counted_container) unsigned char counted_storage[sizeof(counted_container)];
counted_container* counted;
alignas(counted_container::const_iterator) unsigned char counted_position_storage[sizeof(counted_container::const_iterator)];
alignas(counted_container::iterator) unsigned char counted_iterator_storage[sizeof(counted_container::iterator)];

template<bool Input, unsigned Copy = 2> __attribute__((noinline)) void construction_failure()
{
    counted = std::construct_at(reinterpret_cast<counted_container*>(counted_storage));
    ::new (static_cast<void*>(counted_position_storage)) counted_container::const_iterator(counted->cbegin());
    fail_copy = Copy;
    result = 3;
    try {
        if constexpr(Input)
            ::new (static_cast<void*>(counted_iterator_storage)) counted_container::iterator(
                counted->insert(*reinterpret_cast<counted_container::const_iterator*>(counted_position_storage), counted_first, counted_last));
        else
            ::new (static_cast<void*>(counted_iterator_storage)) counted_container::iterator(
                counted->insert(*reinterpret_cast<counted_container::const_iterator*>(counted_position_storage), 3, source[0]));
    } catch(int value) {
        result = value;
    } catch(...) {
        result = 2;
    }
    fail_copy = 0;
}

template<bool Input> __attribute__((noinline)) void finish_construction_failure()
{
    // Input staging rolls back completely. Fill insertion retains the first
    // successfully constructed element, as in the original header.
    result = result == 31 && counted->size() == (Input ? 0u : 1u) &&
        live_values == (Input ? 11u : 12u) ? 0 : 1;
    std::destroy_at(counted);
    if(live_values != 11 || live_allocations != 0)
        result = 4;
}

}

void* operator new(std::size_t size)
{
    if(fail_allocation != 0 && --fail_allocation == 0)
        throw std::bad_alloc();
    void* memory = std::malloc(size);
    if(!memory)
        throw std::bad_alloc();
    ++live_allocations;
    return memory;
}

void operator delete(void* memory) noexcept
{
    if(memory)
        --live_allocations;
    std::free(memory);
}

void operator delete(void* memory, std::size_t) noexcept { ::operator delete(memory); }

extern "C" int avm_test_main()
{
    // Fail map and block allocation separately, then fail each allocation in
    // the input path (two staging buffers, map, block).
    for(failure_point = 1; failure_point != 3; ++failure_point) {
        allocation_failure<false>();
        if(result != 0)
            goto done;
    }
    construction_failure<false>();
    finish_construction_failure<false>();
    if(result != 0)
        goto done;
    for(failure_point = 1; failure_point != 5; ++failure_point) {
        allocation_failure<true>();
        if(result != 0)
            goto done;
    }
    construction_failure<true>();
    finish_construction_failure<true>();
    if(result != 0)
        goto done;
    // Eight elements have already been staged when the ninth copy fails,
    // exercising cleanup after the staging buffer has grown and moved them.
    construction_failure<true, 9>();
    finish_construction_failure<true>();
done:
    return result;
}
