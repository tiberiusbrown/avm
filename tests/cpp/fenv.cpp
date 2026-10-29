#include <fenv.h>
#include "../c/test_hex_output.h"
#define CHECK(c) do { if (!(c)) { test_line16("line", __LINE__); return 1; } } while (0)

extern "C" int avm_test_main()
{
    const fenv_t *env = FE_DFL_ENV;
    fenv_t saved = 42;
    fexcept_t flags = 42;
    CHECK(fegetround() == FE_TONEAREST && fesetround(FE_TONEAREST) == 0);
    CHECK(FE_ALL_EXCEPT == 0 && feclearexcept(FE_ALL_EXCEPT) == 0);
    CHECK(fegetexceptflag(&flags, 0) == 0 && flags == 0);
    CHECK(fesetexceptflag(&flags, 0) == 0 && feraiseexcept(0) == 0);
    CHECK(fetestexcept(0) == 0);
    CHECK(fegetenv(&saved) == 0 && saved == 0);
    CHECK(fesetenv(&saved) == 0 && feholdexcept(&saved) == 0);
    CHECK(feupdateenv(&saved) == 0 && fesetenv(env) == 0);
    CHECK(feupdateenv(env) == 0 && fegetround() == FE_TONEAREST);
    return 0;
}
