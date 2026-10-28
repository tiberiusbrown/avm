#ifndef _AVM_RUNTIME_SIGNAL_H
#define _AVM_RUNTIME_SIGNAL_H

typedef signed char sig_atomic_t;
#define SIGABRT 1
#define SIGFPE  2
#define SIGILL  3
#define SIGINT  4
#define SIGSEGV 5
#define SIGTERM 6

typedef void (*__avm_sighandler_t)(int);
#define SIG_DFL ((__avm_sighandler_t)0)
#define SIG_IGN ((__avm_sighandler_t)1)
#define SIG_ERR ((__avm_sighandler_t)2)

#ifdef __cplusplus
extern "C" {
#endif
__avm_sighandler_t signal(int sig, __avm_sighandler_t func);
int raise(int sig);
#ifdef __cplusplus
}
#endif
#endif
