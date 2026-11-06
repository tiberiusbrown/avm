#include <string>

extern "C" int avm_test_main()
{
    return std::to_string(1.25f) == "1.250000" ? 0 : 1;
}
