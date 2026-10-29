#include <fenv.h>

int feclearexcept(int excepts)
{
    return excepts == 0 ? 0 : 1;
}

int fegetexceptflag(fexcept_t *flagp, int excepts)
{
    if (excepts != 0) return 1;
    *flagp = 0;
    return 0;
}

int feraiseexcept(int excepts)
{
    return excepts == 0 ? 0 : 1;
}

int fesetexceptflag(const fexcept_t *flagp, int excepts)
{
    (void)flagp;
    return excepts == 0 ? 0 : 1;
}

int fetestexcept(int excepts)
{
    (void)excepts;
    return 0;
}

int fegetround(void)
{
    return FE_TONEAREST;
}

int fesetround(int round)
{
    return round == FE_TONEAREST ? 0 : 1;
}

int fegetenv(fenv_t *envp)
{
    *envp = 0;
    return 0;
}

int feholdexcept(fenv_t *envp)
{
    *envp = 0;
    return 0;
}

int fesetenv(const fenv_t *envp)
{
    (void)envp;
    return 0;
}

int feupdateenv(const fenv_t *envp)
{
    (void)envp;
    return 0;
}
