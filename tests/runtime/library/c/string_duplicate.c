#include <stdlib.h>
#include <string.h>
#include "../../../codegen/c/test_hex_output.h"

#define CHECK(expr) do { if(!(expr)) { test_line16("LINE", __LINE__); return 1; } } while(0)

static char *(*volatile dup_call)(const char *) = strdup;
static char *(*volatile ndup_call)(const char *, size_t) = strndup;
static char long_source[201];

int avm_test_main(void) {
    char source[] = "abcdef";
    char *copy;
    unsigned int i;

    copy = dup_call(source);
    CHECK(copy && copy != source && strcmp(copy, "abcdef") == 0);
    source[0] = 'Z';
    CHECK(strcmp(copy, "abcdef") == 0);
    free(copy);

    copy = dup_call("");
    CHECK(copy && copy[0] == '\0');
    free(copy);

    copy = ndup_call("abcdef", 3);
    CHECK(copy && strcmp(copy, "abc") == 0 && copy[3] == '\0');
    free(copy);

    /* A shorter source ends at its own null character. */
    copy = ndup_call("ab", 10);
    CHECK(copy && strcmp(copy, "ab") == 0);
    free(copy);

    /* An embedded null ends the copy before n characters. */
    copy = ndup_call("abc\0def", 6);
    CHECK(copy && strcmp(copy, "abc") == 0);
    free(copy);

    copy = ndup_call("xyz", 0);
    CHECK(copy && copy[0] == '\0');
    free(copy);

    /* A copy of 200 characters fits in AVM's largest allocation. */
    for (i = 0; i < 200; ++i) long_source[i] = (char)('a' + (i % 26));
    long_source[200] = '\0';
    copy = dup_call(long_source);
    CHECK(copy && strcmp(copy, long_source) == 0);
    free(copy);

    /* Fill the heap with eight-byte blocks, chained through their first bytes,
     * until allocation fails. The source is then too long for any remaining
     * space, so both copies must return null. */
    {
        void *head = NULL;
        void *block;
        char tail[21];
        for (i = 0; i < 20; ++i) tail[i] = (char)('A' + i);
        tail[20] = '\0';
        while ((block = malloc(8)) != NULL) {
            *(void **)block = head;
            head = block;
        }
        CHECK(dup_call(tail) == NULL);
        CHECK(ndup_call(tail, 20) == NULL);
        while (head) {
            block = head;
            head = *(void **)block;
            free(block);
        }
    }
    /* With the heap released again, the same copy succeeds. */
    copy = dup_call("released");
    CHECK(copy && strcmp(copy, "released") == 0);
    free(copy);
    return 0;
}
