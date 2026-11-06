#include <array>
#include <cstddef>
#include <mdspan>

#if !defined(__cpp_lib_mdspan) || __cpp_lib_mdspan < 202207L
#error "C++23 mdspan support is required"
#endif

extern "C" int avm_test_main()
{
    using extents_type = std::extents<std::size_t, 2, 3>;
    std::array<int, 8> storage{};

    std::mdspan<int, extents_type> right(storage.data());
    right[1, 2] = 17;
    if(right.extent(0) != 2 || right.extent(1) != 3 || right[1, 2] != 17 ||
       right.mapping()(1, 2) != 5)
        return 1;

    std::mdspan<int, extents_type, std::layout_left> left(storage.data());
    left[1, 0] = 23;
    if(left.mapping()(1, 0) != 1 || storage[1] != 23)
        return 2;

    const std::array<std::size_t, 2> strides{4, 1};
    const std::layout_stride::mapping<extents_type> mapping(extents_type{}, strides);
    std::mdspan<int, extents_type, std::layout_stride> strided(storage.data(), mapping);
    strided[1, 2] = 31;
    if(strided.mapping()(1, 2) != 6 || storage[6] != 31)
        return 3;

    std::mdspan<const int, extents_type, std::layout_stride> readonly(
        storage.data(), mapping);
    return readonly[1, 2] == 31 ? 0 : 4;
}
