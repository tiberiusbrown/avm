#include <signal.h>
#include <errno.h>
#include <avm/runtime.h>

static __avm_sighandler_t handlers[6];

__avm_sighandler_t signal(int sig, __avm_sighandler_t func)
{
    if (sig < SIGABRT || sig > SIGTERM || func == SIG_ERR) {
        errno = EINVAL;
        return SIG_ERR;
    }
    unsigned int index = (unsigned int)(sig - SIGABRT);
    __avm_sighandler_t previous = handlers[index];
    handlers[index] = func;
    return previous;
}

int raise(int sig)
{
    if (sig < SIGABRT || sig > SIGTERM) {
        errno = EINVAL;
        return -1;
    }
    unsigned int index = (unsigned int)(sig - SIGABRT);
    __avm_sighandler_t handler = handlers[index];
    if (handler == SIG_IGN)
        return 0;
    if (handler == SIG_DFL)
        avm_halt();
    /* C99 permits resetting a disposition before delivery. */
    handlers[index] = SIG_DFL;
    handler(sig);
    return 0;
}

/* Weakly referenced by abort(); abort alone must not extract this object. */
void __avm_signal_abort(void)
{
    (void)raise(SIGABRT);
}
