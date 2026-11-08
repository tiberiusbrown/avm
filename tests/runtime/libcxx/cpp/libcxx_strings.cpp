#include <array>
#include <bitset>
#include <span>
#include <string>
#include <string_view>

namespace {

__attribute__((noinline)) int dynamic_string_test()
{
    char ordinary_text[] = "Ordinary RAM text";
    std::string value(ordinary_text);
    return value.size() == sizeof(ordinary_text) - 1 && value[9] == 'R' ? 0 : 1;
}

__attribute__((always_inline)) inline int string_conversion_test()
{
    char number_text[] = "7";
    std::string number(number_text);
    return std::stoi(number) == 7 ? 0 : 1;
}

__attribute__((noinline)) int integer_to_string_test()
{
    return std::to_string(7) == "7" ? 0 : 1;
}

__attribute__((noinline)) int view_test()
{
    char text[] = "AVM library";
    const std::string_view view(text, sizeof(text) - 1);
    return view.starts_with("AVM") && view.ends_with("library") &&
                   view.substr(4, 3) == "lib"
               ? 0
               : 1;
}

__attribute__((noinline)) int span_test()
{
    std::array<int, 5> values{1, 2, 3, 4, 5};
    std::span<int> span(values);
    const std::span<int> middle = span.subspan(1, 3);
    middle[1] = 30;
    return span.size() == 5 && middle.size() == 3 && values[2] == 30 &&
                   middle.data() == values.data() + 1
               ? 0
               : 1;
}

__attribute__((noinline)) int bitset_test()
{
    std::bitset<13> bits;
    bits.set(2).set(12);
    bits.flip(2);
    return bits.count() == 1 && !bits.test(2) && bits.test(12) &&
                   bits.to_ulong() == (1UL << 12)
               ? 0
               : 1;
}

}

extern "C" int avm_test_main()
{
    if(dynamic_string_test() != 0 || string_conversion_test() != 0 ||
       integer_to_string_test() != 0 || view_test() != 0 || span_test() != 0 ||
       bitset_test() != 0)
        return 1;
    return 0;
}
