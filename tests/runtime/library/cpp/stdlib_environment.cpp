#include <stdlib.h>
#include <errno.h>

#define CHECK(x) do { if (!(x)) return __LINE__; } while (0)

extern "C" int avm_test_main()
{
    char *(*volatile get_env)(const char *) = getenv;
    int (*volatile run_cmd)(const char *) = system;

    errno = 42;
    CHECK(getenv("PATH") == nullptr);
    CHECK(system(nullptr) == 0);
    CHECK(system("echo test") == -1);
    CHECK(get_env("PATH") == nullptr);
    CHECK(run_cmd(nullptr) == 0);
    CHECK(run_cmd("echo test") == -1);
    CHECK(errno == 42);
    return 0;
}
