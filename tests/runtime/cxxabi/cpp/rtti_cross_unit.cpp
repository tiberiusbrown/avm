#include <stdint.h>
#include <string.h>
#include <typeinfo>

#include "../../../codegen/c/test_hex_output.h"
#include "../../../support/cpp/rtti_static.h"

#define CHECK(c) do { if (!(c)) { test_line16("line", __LINE__); return 1; } } while (0)

extern "C" int avm_test_main() {
    // Each type is named in this unit and in the second unit. Both must refer
    // to the same descriptor, so the identity, hash, and name all agree.
    const std::type_info &alpha = typeid(SharedAlpha);
    const std::type_info &alpha_b = unit_b_alpha();
    CHECK(&alpha == &alpha_b);
    CHECK(alpha == alpha_b);
    CHECK(alpha.hash_code() == alpha_b.hash_code());
    CHECK(strcmp(alpha.name(), alpha_b.name()) == 0);
    CHECK(strcmp(alpha.name(), "11SharedAlpha") == 0);

    const std::type_info &beta = typeid(SharedBeta);
    const std::type_info &beta_b = unit_b_beta();
    CHECK(&beta == &beta_b);
    CHECK(beta == beta_b);
    CHECK(alpha != beta);
    CHECK(!beta.before(beta_b));
    CHECK(!beta_b.before(beta));

    // The key function places the one descriptor in the second unit, so this unit
    // must alias that same descriptor.
    const std::type_info &keyed = typeid(SharedKeyed);
    const std::type_info &keyed_b = unit_b_keyed();
    CHECK(&keyed == &keyed_b);
    CHECK(keyed == keyed_b);
    CHECK(strcmp(keyed.name(), "11SharedKeyed") == 0);

    test_puts("rtti-cross-unit=ok\n");
    return 0;
}
