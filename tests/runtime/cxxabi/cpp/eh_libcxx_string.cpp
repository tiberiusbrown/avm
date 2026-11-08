#include <stdexcept>
#include <string>

namespace {

std::string invalid_number("x");
std::string out_of_range_number("2147483648");

int invalid_argument_test()
{
    try {
        (void)std::stoi(invalid_number);
    } catch(const std::invalid_argument&) {
        return 0;
    } catch(...) {
        return 1;
    }
    return 2;
}

int out_of_range_test()
{
    try {
        (void)std::stoi(out_of_range_number);
    } catch(const std::out_of_range&) {
        return 0;
    } catch(...) {
        return 1;
    }
    return 2;
}

}

extern "C" int avm_test_main()
{
    if(invalid_argument_test() != 0)
        return 1;
    return out_of_range_test() == 0 ? 0 : 2;
}
