#include <stdlib.h>
#include <errno.h>

#define CHECK(x) do { if (!(x)) return __LINE__; } while (0)

int avm_test_main(void)
{
    char *(*volatile get_env)(const char *) = getenv;
    int (*volatile run_cmd)(const char *) = system;

    errno = 42;

    CHECK(getenv("PATH") == NULL);
    CHECK(getenv("HOME") == NULL);
    CHECK(getenv("") == NULL);
    CHECK(getenv("AVM_TEST") == NULL);

    CHECK(get_env("PATH") == NULL);
    CHECK(get_env("") == NULL);
    CHECK(get_env("AVM_TEST") == NULL);

    CHECK(system(NULL) == 0);
    CHECK(system("") == -1);
    CHECK(system("echo hello") == -1);
    CHECK(system("exit 0") == -1);

    CHECK(run_cmd(NULL) == 0);
    CHECK(run_cmd("") == -1);
    CHECK(run_cmd("echo hello") == -1);

    CHECK(get_env("PATH") == NULL);
    CHECK(run_cmd(NULL) == 0);
    CHECK(run_cmd("echo hello") == -1);

    CHECK(errno == 42);

    return 0;
}
