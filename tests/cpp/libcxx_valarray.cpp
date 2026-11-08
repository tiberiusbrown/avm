#include <utility>
#include <valarray>

namespace {

int square(int value) { return value * value; }
int negate(const int& value) { return -value; }

template<class T, unsigned N>
bool equal(const std::valarray<T>& actual, const T (&expected)[N])
{
    if(actual.size() != N)
        return false;
    for(unsigned i = 0; i < N; ++i)
        if(actual[i] != expected[i])
            return false;
    return true;
}

__attribute__((noinline)) int compound(std::valarray<int>& c, const std::valarray<int>& a)
{
    c /= 2;
    c += a;
    static const int expected[] = {5, 7, 10, 12};
    return equal(c, expected) ? 0 : 2;
}

__attribute__((noinline)) int arithmetic()
{
    static const int initial[] = {1, 2, 3, 4};
    std::valarray<int> a(initial, 4);
    std::valarray<int> b(2, 4);
    std::valarray<int> c = (a + b) * 3 - 1;
    static const int expected[] = {8, 11, 14, 17};
    if(!equal(c, expected) || c.sum() != 50 || c.min() != 8 || c.max() != 17)
        return 1;
    return compound(c, a);
}

__attribute__((noinline)) int logical()
{
    static const int initial[] = {1, 2, 3, 4};
    std::valarray<int> a(initial, 4);
    std::valarray<int> b(2, 4);
    std::valarray<bool> mask = (a < b) || (a == 4);
    static const bool selected[] = {true, false, false, true};
    return equal(mask, selected) ? 0 : 3;
}

__attribute__((noinline)) int slice_read(std::valarray<int>& values)
{
    std::valarray<int> selected = values[std::slice(1, 3, 2)];
    static const int expected[] = {1, 3, 5};
    return equal(selected, expected) ? 0 : 1;
}

__attribute__((noinline)) int slice_write(std::valarray<int>& values)
{
    values[std::slice(0, 3, 2)] = 7;
    static const int changed[] = {7, 1, 7, 3, 7, 5};
    return equal(values, changed) ? 0 : 1;
}

__attribute__((noinline)) int slices()
{
    std::valarray<int> values = {0, 1, 2, 3, 4, 5};
    return slice_read(values) || slice_write(values);
}

__attribute__((noinline)) int generalized_operations(std::valarray<int>& values, const std::gslice& selection)
{
    std::valarray<int> selected = values[selection];
    static const int expected[] = {1, 2, 4, 5};
    if(!equal(selected, expected))
        return 1;
    values[selection] += selected;
    static const int changed[] = {0, 2, 4, 3, 8, 10};
    return equal(values, changed) ? 0 : 2;
}

__attribute__((noinline)) int generalized_slice()
{
    static const int initial[] = {0, 1, 2, 3, 4, 5};
    static const std::size_t extents[] = {2, 2};
    static const std::size_t steps[] = {3, 1};
    std::valarray<int> values(initial, 6);
    const std::valarray<std::size_t> sizes(extents, 2);
    const std::valarray<std::size_t> strides(steps, 2);
    const std::gslice selection(1, sizes, strides);
    return generalized_operations(values, selection);
}

__attribute__((noinline)) int masks()
{
    static const int initial[] = {1, 2, 3, 4};
    static const bool selected_indices[] = {false, true, false, true};
    std::valarray<int> values(initial, 4);
    const std::valarray<bool> mask(selected_indices, 4);
    std::valarray<int> selected = values[mask];
    static const int expected[] = {2, 4};
    if(!equal(selected, expected))
        return 1;
    values[mask] = 7;
    static const int changed[] = {1, 7, 3, 7};
    return equal(values, changed) ? 0 : 2;
}

__attribute__((noinline)) int indirect()
{
    std::valarray<int> values = {1, 2, 3, 4};
    const std::valarray<std::size_t> indices = {3, 0, 2};
    std::valarray<int> selected = values[indices];
    static const int expected[] = {4, 1, 3};
    if(!equal(selected, expected))
        return 1;
    values[indices] += selected;
    static const int changed[] = {2, 2, 6, 8};
    return equal(values, changed) ? 0 : 2;
}

__attribute__((noinline)) int shifts()
{
    const std::valarray<int> values = {1, 2, 3, 4};
    static const int left[] = {3, 4, 0, 0};
    static const int right[] = {0, 1, 2, 3};
    static const int wrapped[] = {4, 1, 2, 3};
    static const int zero[] = {0, 0, 0, 0};
    if(!equal(values.shift(2), left) || !equal(values.shift(-1), right) ||
       !equal(values.cshift(-5), wrapped) || !equal(values.shift(7), zero))
        return 1;
    return 0;
}

__attribute__((noinline)) int applications()
{
    const std::valarray<int> values = {1, 2, 3, 4};
    static const int squares[] = {1, 4, 9, 16};
    static const int negatives[] = {-1, -2, -3, -4};
    return equal(values.apply(square), squares) && equal(values.apply(negate), negatives) ? 0 : 2;
}

__attribute__((noinline)) int ownership()
{
    std::valarray<int> a = {1, 2, 3};
    std::valarray<int> b(a);
    a = 9;
    if(b.sum() != 6)
        return 1;
    b.resize(5, 7);
    if(b.size() != 5 || b.sum() != 35)
        return 2;
    a = std::move(b);
    if(a.size() != 5 || a.sum() != 35)
        return 3;
    b = {4, 5};
    a.swap(b);
    if(a.size() != 2 || a.sum() != 9 || b.size() != 5)
        return 4;
    a.resize(0);
    return a.size() == 0 ? 0 : 5;
}

}

extern "C" int avm_test_main()
{
    if(arithmetic() || logical() || applications() || slices() || generalized_slice() || masks() || indirect() || shifts() || ownership())
        return 1;
    return 0;
}
