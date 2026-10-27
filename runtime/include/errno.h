#ifndef _AVM_RUNTIME_ERRNO_H
#define _AVM_RUNTIME_ERRNO_H

#define EDOM 33
#define ERANGE 34
#define EILSEQ 84
#define EINVAL 22

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
