#ifndef _AVM_RUNTIME_ERRNO_H
#define _AVM_RUNTIME_ERRNO_H

#define EDOM 33
#define ERANGE 34
#define EILSEQ 84
#define EINVAL 22
#define ENOSYS 38
#define EBADF 9
#define ESPIPE 29
#define EIO 5

#ifdef __cplusplus
extern "C" {
#endif

/* The AVM runtime has a single execution thread. */
extern int __avm_errno;
#define errno __avm_errno

#ifdef __cplusplus
} // extern "C"
#endif

#endif // _AVM_RUNTIME_ERRNO_H
