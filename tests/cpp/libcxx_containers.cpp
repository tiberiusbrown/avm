#include <array>
#include <cstddef>
#include <memory>
#include <stack>
#include <vector>

namespace {

alignas(std::max_align_t) unsigned char allocator_storage[64];
std::size_t allocator_offset;

void reset_allocator() { allocator_offset = 0; }

template<class T>
struct arena_allocator {
    using value_type = T;

    template<class U>
    struct rebind { using other = arena_allocator<U>; };

    arena_allocator() = default;
    template<class U>
    arena_allocator(const arena_allocator<U>&) noexcept {}

    T* allocate(std::size_t count)
    {
        const std::size_t aligned =
            (allocator_offset + alignof(T) - 1) & ~(alignof(T) - 1);
        const std::size_t bytes = count * sizeof(T);
        if(aligned + bytes > sizeof(allocator_storage))
            __builtin_trap();
        allocator_offset = aligned + bytes;
        return reinterpret_cast<T*>(allocator_storage + aligned);
    }

    void deallocate(T*, std::size_t) noexcept {}

    template<class U>
    bool operator==(const arena_allocator<U>&) const noexcept { return true; }
};

int vector_test()
{
    reset_allocator();
    std::vector<int, arena_allocator<int>> values;
    values.push_back(1);
    values.push_back(2);
    values.push_back(3);
    if(values.size() != 3 || values.front() != 1 || values.back() != 3 ||
       values[1] != 2)
        return 1;
    values.pop_back();
    return values.size() == 2 ? 0 : 2;
}

int adaptor_test()
{
    reset_allocator();
    using storage_type = std::vector<int, arena_allocator<int>>;
    std::stack<int, storage_type> values;
    values.push(21);
    values.push(22);
    if(values.top() != 22)
        return 1;
    values.pop();
    return values.top() == 21 ? 0 : 2;
}

}

extern "C" int avm_test_main()
{
    const std::array<int, 3> fixed{1, 2, 3};
    if(fixed.front() != 1 || fixed.back() != 3 || fixed.size() != 3)
        return 1;
    if(vector_test() != 0)
        return 2;
    return adaptor_test() == 0 ? 0 : 3;
}
