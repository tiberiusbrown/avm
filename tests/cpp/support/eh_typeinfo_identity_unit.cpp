#include "eh_typeinfo_identity.h"

void throw_remote(int code) { throw Remote{code}; }
