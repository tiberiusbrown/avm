#include <stdio.h>
int avm_test_main(void) {
    int n = -1;
    if(printf("%2048s%n", "", &n) != 2048 || n != 2048) return 1;
    if(fprintf(stdout, "%32768s", "") >= 0 || !ferror(stdout)) return 2;
    clearerr(stdout);
    return 0;
}
