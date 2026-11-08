#include <cstdlib>
#include <new>
#include <valarray>

namespace {
unsigned fail_after;
unsigned allocations;

__attribute__((noinline)) int gslice_failure()
{
    static const std::size_t extents[] = {2, 2};
    static const std::size_t steps[] = {3, 1};
    const std::valarray<std::size_t> sizes(extents, 2);
    const std::valarray<std::size_t> strides(steps, 2);
    const unsigned before = allocations;
    // The size copy, stride copy and flattened index allocation each fail.
    for(unsigned attempt = 1; attempt <= 3; ++attempt) {
        fail_after = attempt;
        try {
            std::gslice selection(1, sizes, strides);
            (void)selection;
        } catch(const std::bad_alloc&) {
            if(fail_after || allocations != before)
                return 1;
            continue;
        } catch(...) {
            return 2;
        }
        return 3;
    }
    std::gslice selection(1, sizes, strides);
    return selection.start() == 1 ? 0 : 4;
}

__attribute__((noinline)) int mask_failure()
{
    std::valarray<int> values(7, 4);
    const std::valarray<bool> mask = {true, false, true, false};
    const unsigned before = allocations;
    for(unsigned attempt = 1; attempt <= 2; ++attempt) {
        fail_after = attempt;
        try {
            std::valarray<int> selected = values[mask];
            (void)selected;
        } catch(const std::bad_alloc&) {
            if(fail_after || allocations != before || values.sum() != 28)
                return 1;
            continue;
        } catch(...) {
            return 2;
        }
        return 3;
    }
    return 0;
}
}

void* operator new(std::size_t size)
{
    if(fail_after && --fail_after == 0)
        throw std::bad_alloc();
    if(void* result = std::malloc(size)) {
        ++allocations;
        return result;
    }
    throw std::bad_alloc();
}

void operator delete(void* pointer) noexcept
{
    if(pointer) {
        --allocations;
        std::free(pointer);
    }
}

extern "C" int avm_test_main()
{
    return gslice_failure() || mask_failure() || allocations != 0;
}
