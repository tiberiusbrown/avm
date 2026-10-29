#ifndef _AVM_RUNTIME_FENV_H
#define _AVM_RUNTIME_FENV_H

typedef unsigned char fenv_t;
typedef unsigned char fexcept_t;

#define FE_TONEAREST 0
#define FE_ALL_EXCEPT 0
#define FE_DFL_ENV ((const fenv_t *)0)

#ifdef __cplusplus
extern "C" {
#endif
int feclearexcept(int excepts);
int fegetexceptflag(fexcept_t *flagp, int excepts);
int feraiseexcept(int excepts);
int fesetexceptflag(const fexcept_t *flagp, int excepts);
int fetestexcept(int excepts);
int fegetround(void);
int fesetround(int round);
int fegetenv(fenv_t *envp);
int feholdexcept(fenv_t *envp);
int fesetenv(const fenv_t *envp);
int feupdateenv(const fenv_t *envp);
#ifdef __cplusplus
}
#endif
#endif
