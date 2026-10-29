#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <avm.h>
#define CHECK(x) do { if(!(x)) return __LINE__; } while(0)

int avm_test_main(void) {
    CHECK(stdin != stdout && stdin != stderr && stdout != stderr);
    CHECK(!feof(stdin) && !ferror(stdin));
    CHECK(fgetc(stdin) == EOF && feof(stdin) && !ferror(stdin));
    CHECK(ungetc(EOF, stdin) == EOF);
    CHECK(ungetc(255, stdin) == 255 && !feof(stdin));
    CHECK(ungetc('B', stdin) == EOF);
    CHECK(getc(stdin) == 255);
    CHECK(getchar() == EOF && feof(stdin));
    clearerr(stdin);
    CHECK(!feof(stdin) && !ferror(stdin));
    char buf[4] = {'x','y','z',0};
    CHECK(fgets(buf, 1, stdin) == buf && buf[0] == 0 && !feof(stdin));
    CHECK(fgets(buf, 4, stdin) == NULL && feof(stdin));
    CHECK(gets(buf) == NULL);
    CHECK(ungetc('q', stdin) == 'q');
    CHECK(fread(buf, 2, 1, stdin) == 0 && buf[0] == 'q' && feof(stdin));
    clearerr(stdin);
    CHECK(ungetc('r', stdin) == 'r');
    CHECK(fread(buf, 1, 2, stdin) == 1 && buf[0] == 'r');
    clearerr(stdin);
    CHECK(ungetc('\n', stdin) == '\n');
    CHECK(fgets(buf, sizeof buf, stdin) == buf && buf[0] == '\n' && buf[1] == 0);
    CHECK(fread(buf, 0, 50, stdin) == 0 && fread(buf, 2, 0, stdin) == 0);
    CHECK(fputc('x', stdin) == EOF && ferror(stdin) && errno == EBADF);
    CHECK(ungetc('q', stdin) == 'q');
    CHECK(fgets(buf, sizeof buf, stdin) == buf && strcmp(buf, "q") == 0);
    CHECK(ferror(stdin)); /* A prior error indicator does not turn EOF into a new error. */
    CHECK(ungetc('r', stdin) == 'r');
    CHECK(gets(buf) == buf && strcmp(buf, "r") == 0 && ferror(stdin));
    rewind(stdin);
    CHECK(!ferror(stdin) && !feof(stdin) && errno == ESPIPE);
    fpos_t pos = 123;
    CHECK(fgetpos(stdout, &pos) != 0 && pos == 123 && errno == ESPIPE);
    CHECK(fsetpos(stdout, &pos) != 0 && errno == ESPIPE);
    CHECK(fseek(stdout, 0, SEEK_SET) != 0 && errno == ESPIPE);
    CHECK(ftell(stdout) == -1L && errno == ESPIPE);
    CHECK(setvbuf(stdout, NULL, _IONBF, 0) == 0);
    CHECK(setvbuf(stdout, buf, _IOLBF, sizeof buf) != 0 && errno == EINVAL);
    CHECK(setvbuf(stdout, buf, _IOFBF, sizeof buf) != 0);
    CHECK(setvbuf(stdout, NULL, 99, 0) != 0);
    setbuf(stdout, NULL);
    CHECK(fflush(NULL) == 0 && fflush(stdout) == 0);
    CHECK(fopen("x", "w") == NULL && errno == ENOSYS);
    CHECK(remove("x") != 0 && errno == ENOSYS);
    CHECK(rename("x", "y") != 0 && errno == ENOSYS);
    CHECK(tmpfile() == NULL && errno == ENOSYS);
    CHECK(tmpnam(NULL) == NULL && tmpnam(buf) == NULL && errno == ENOSYS);
    CHECK(fwrite(buf, (size_t)-1, 2, stdout) == 0 && ferror(stdout) && errno == EIO);
    clearerr(stdout);
    CHECK(fwrite(buf, 0, 20, stdout) == 0 && fwrite(buf, 1, 0, stdout) == 0);
    CHECK(putchar('A') == 'A');
    CHECK(putc('B', stdout) == 'B');
    CHECK(fputc('C', stderr) == 'C');
    CHECK(fputs("", stdout) >= 0);
    CHECK(fputs("D", stdout) >= 0);
    CHECK(puts("E") >= 0);
    const char binary[] = {'a', 'z', 'b', '\n', 'c', 'd'};
    CHECK(fwrite(binary, 1, 6, stdout) == 6);
    CHECK(fwrite(binary, 2, 3, stdout) == 3);
    CHECK(fwrite(binary, 3, 2, stderr) == 2);
    errno = EBADF; perror("prefix");
    errno = ESPIPE; perror("");
    errno = ENOSYS; perror(NULL);
    CHECK(errno == ENOSYS);
    CHECK(strcmp(strerror(EDOM), "Numerical argument out of domain") == 0);
    CHECK(fclose(stdout) == 0);
    CHECK(fputc('x', stdout) == EOF && errno == EBADF && ferror(stdout));
    CHECK(fflush(stdout) == EOF);
    CHECK(freopen("x", "r", stdin) == NULL && errno == ENOSYS);
    CHECK(fgetc(stdin) == EOF && ferror(stdin) && errno == EBADF);
    CHECK(fclose(stderr) == 0);
    CHECK(fputs("x", stderr) == EOF);
    return 0;
}
