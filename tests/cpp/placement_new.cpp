#include <cstddef>
#include <new>

static_assert(sizeof(std::size_t) == 2, "AVM size_t is 16 bits");

static int constructed;
static int destroyed;

struct object {
    int value;

    explicit object(int n) : value(n) { ++constructed; }
    ~object() { ++destroyed; }
};

extern "C" int avm_test_main() {
    alignas(object) unsigned char storage[sizeof(object)];
    void* place = storage;
    object* instance = ::new (place) object(42);
    if (instance != place || instance->value != 42 || constructed != 1)
        return 1;

    instance->~object();
    ::operator delete(instance, place);
    if (destroyed != 1)
        return 2;

    alignas(int) unsigned char array_storage[2 * sizeof(int)];
    void* array_place = array_storage;
    int* values = ::new (array_place) int[2]{7, 8};
    if (values != array_place || values[0] != 7 || values[1] != 8)
        return 3;
    ::operator delete[](values, array_place);
    return 0;
}
