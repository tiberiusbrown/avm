#include <functional>

namespace {

struct large_callable {
    // This cannot fit inside std::function, but avoids oversized by-value
    // callable copies in the O0 fixture.
    unsigned char bytes[sizeof(std::function<int()>) + 1];

    int operator()() const { return bytes[0]; }
};

int allocation_test()
{
    large_callable target{};
    target.bytes[0] = 71;
    std::function<int()> callable = target;
    return callable() == 71 ? 0 : 1;
}

int empty_call_test()
{
    std::function<int()> empty;
    try {
        (void)empty();
    } catch(const std::bad_function_call&) {
        return 0;
    } catch(...) {
        return 1;
    }
    return 2;
}

}

extern "C" int avm_test_main()
{
    if(allocation_test() != 0)
        return 1;
    return empty_call_test() == 0 ? 0 : 2;
}
