#include <signal.h>
#include <errno.h>

static volatile sig_atomic_t calls, received, failed, mode;
static void other(int sig) { (void)sig; }
static void handler(int sig) {
    ++calls;
    received = (sig_atomic_t)sig;
    if (signal(sig, SIG_DFL) != SIG_DFL) failed = 1;
    if (mode == 1 && signal(sig, handler) != SIG_DFL) failed = 1;
    if (mode == 2 && signal(sig, SIG_IGN) != SIG_DFL) failed = 1;
}
#define CHECK(x) do { if (!(x)) return __LINE__; } while (0)
int avm_test_main(void) {
    __avm_sighandler_t (*volatile install)(int, __avm_sighandler_t) = &signal;
    int (*volatile deliver)(int) = &raise;
    CHECK(SIG_DFL != SIG_IGN && SIG_DFL != SIG_ERR && SIG_IGN != SIG_ERR);
    errno = 37;
    for (int sig = SIGABRT; sig <= SIGTERM; ++sig) {
        CHECK(install(sig, handler) == SIG_DFL);
        CHECK(signal(sig, other) == handler);
        CHECK(signal(sig, SIG_IGN) == other);
        CHECK(deliver(sig) == 0);
        CHECK(signal(sig, SIG_DFL) == SIG_IGN);
    }
    CHECK(errno == 37 && calls == 0);
    CHECK(signal(SIGINT, handler) == SIG_DFL);
    CHECK(signal(SIGTERM, other) == SIG_DFL);
    CHECK(deliver(SIGINT) == 0);
    CHECK(calls == 1 && received == SIGINT && !failed);
    CHECK(signal(SIGINT, SIG_DFL) == SIG_DFL);
    CHECK(signal(SIGTERM, handler) == other);
    mode = 1;
    CHECK(raise(SIGTERM) == 0);
    CHECK(calls == 2 && received == SIGTERM && !failed);
    CHECK(signal(SIGTERM, handler) == handler);
    mode = 2;
    CHECK(raise(SIGTERM) == 0);
    CHECK(calls == 3 && !failed);
    CHECK(raise(SIGTERM) == 0 && calls == 3);
    CHECK(signal(SIGTERM, SIG_DFL) == SIG_IGN);
    CHECK(errno == 37);
    const int invalid[] = {0, -1, -32767, SIGTERM + 1, 32767};
    for (unsigned i = 0; i < sizeof(invalid)/sizeof(invalid[0]); ++i) {
        errno = 0;
        CHECK(signal(invalid[i], handler) == SIG_ERR && errno == EINVAL);
        errno = 0;
        CHECK(raise(invalid[i]) != 0 && errno == EINVAL);
    }
    for (int sig = SIGABRT; sig <= SIGTERM; ++sig) {
        CHECK(signal(sig, SIG_IGN) == SIG_DFL);
        errno = 0;
        CHECK(signal(sig, SIG_ERR) == SIG_ERR && errno == EINVAL);
        CHECK(signal(sig, SIG_DFL) == SIG_IGN);
    }
    return 0;
}
