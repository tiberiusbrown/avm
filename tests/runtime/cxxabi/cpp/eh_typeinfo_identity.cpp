#include <stdint.h>
#include <string.h>
#include <typeinfo>

#include "../../../codegen/c/test_hex_output.h"
#include "../../../support/cpp/eh_typeinfo_identity.h"

#define CHECK(c) do { if (!(c)) { test_line16("line", __LINE__); return 1; } } while (0)

struct Local {
    int code;
};

struct LocalBase {};

struct LocalDerived : LocalBase {};

namespace {
__attribute__((noinline)) void throw_local(int code) { throw Local{code}; }

__attribute__((noinline)) void throw_derived() { throw LocalDerived{}; }
}

extern "C" int avm_test_main() {
    // A type that is thrown and named by typeid reports one name and one
    // identity, whichever side of the exception names it.
    CHECK(strcmp(typeid(Remote).name(), "6Remote") == 0);
    CHECK(typeid(Remote) == typeid(Remote));

    // The typed catch matches the descriptor that the other unit throws.
    bool caught_remote = false;
    try {
        throw_remote(41);
    } catch (const Remote &remote) {
        CHECK(remote.code == 41);
        caught_remote = true;
    }
    CHECK(caught_remote);

    // A local throw matches its own descriptor, and typeid names that descriptor.
    bool caught_local = false;
    try {
        throw_local(7);
    } catch (const Local &local) {
        CHECK(local.code == 7);
        caught_local = true;
    }
    CHECK(caught_local);
    CHECK(typeid(Local) != typeid(Remote));
    CHECK(strcmp(typeid(Local).name(), "5Local") == 0);

    // A public base catch still matches the derived object.
    bool caught_base = false;
    try {
        throw_derived();
    } catch (const LocalBase &) {
        caught_base = true;
    }
    CHECK(caught_base);
    CHECK(typeid(LocalBase) != typeid(LocalDerived));
    CHECK(typeid(LocalDerived).hash_code() == typeid(LocalDerived).hash_code());

    test_puts("eh-typeinfo-identity=ok\n");
    return 0;
}
