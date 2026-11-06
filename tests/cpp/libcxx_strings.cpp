#include <array>
#include <bitset>
#include <span>
#include <string_view>

extern "C" int avm_test_main()
{
    char text[] = "AVM library";
    const std::string_view view(text, sizeof(text) - 1);
    if(!view.starts_with("AVM") || !view.ends_with("library") ||
       view.substr(4, 3) != "lib")
        return 1;

    std::array<int, 5> values{1, 2, 3, 4, 5};
    std::span<int> span(values);
    const std::span<int> middle = span.subspan(1, 3);
    middle[1] = 30;
    if(span.size() != 5 || middle.size() != 3 || values[2] != 30 ||
       middle.data() != values.data() + 1)
        return 3;

    std::bitset<13> bits;
    bits.set(2).set(12);
    bits.flip(2);
    if(bits.count() != 1 || bits.test(2) || !bits.test(12) ||
       bits.to_ulong() != (1UL << 12))
        return 4;

    return 0;
}
