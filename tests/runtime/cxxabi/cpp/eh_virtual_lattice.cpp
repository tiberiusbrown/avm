// A lattice of three classes at each of five levels, each deriving virtually from all
// three classes below it. The walk visits 363 edges, within the 512-edge budget, so
// the catch of the bottom class matches its one subobject.
#include <avm.h>
#include <avm/runtime.h>

extern "C" int avm_test_main(void);

namespace {

struct Lat5_0 {
    int v;
};

struct Lat5_1 {
    int v;
};

struct Lat5_2 {
    int v;
};

struct Lat4_0 : virtual Lat5_0, virtual Lat5_1, virtual Lat5_2 {
    int v;
};

struct Lat4_1 : virtual Lat5_0, virtual Lat5_1, virtual Lat5_2 {
    int v;
};

struct Lat4_2 : virtual Lat5_0, virtual Lat5_1, virtual Lat5_2 {
    int v;
};

struct Lat3_0 : virtual Lat4_0, virtual Lat4_1, virtual Lat4_2 {
    int v;
};

struct Lat3_1 : virtual Lat4_0, virtual Lat4_1, virtual Lat4_2 {
    int v;
};

struct Lat3_2 : virtual Lat4_0, virtual Lat4_1, virtual Lat4_2 {
    int v;
};

struct Lat2_0 : virtual Lat3_0, virtual Lat3_1, virtual Lat3_2 {
    int v;
};

struct Lat2_1 : virtual Lat3_0, virtual Lat3_1, virtual Lat3_2 {
    int v;
};

struct Lat2_2 : virtual Lat3_0, virtual Lat3_1, virtual Lat3_2 {
    int v;
};

struct Lat1_0 : virtual Lat2_0, virtual Lat2_1, virtual Lat2_2 {
    int v;
};

struct Lat1_1 : virtual Lat2_0, virtual Lat2_1, virtual Lat2_2 {
    int v;
};

struct Lat1_2 : virtual Lat2_0, virtual Lat2_1, virtual Lat2_2 {
    int v;
};

struct LatTop : virtual Lat1_0, virtual Lat1_1, virtual Lat1_2 {
    int v;
};

__attribute__((noinline)) void throw_lattice() {
    throw LatTop();
}

__attribute__((noinline)) int catch_bottom() {
    try {
        throw_lattice();
    } catch (Lat5_0 &) {
        return 1;
    }
    return 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    return catch_bottom() == 1 ? 0 : 1;
}
