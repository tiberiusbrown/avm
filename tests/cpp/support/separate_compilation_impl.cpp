#include "separate_compilation.h"

static int destructor_count;

int SeparateBase::value(int input) const { return input + 1; }
SeparateBase::~SeparateBase() { ++destructor_count; }

SeparateDerived::SeparateDerived(int value) : bias(value) {}
int SeparateDerived::value(int input) const { return input + bias; }
SeparateDerived::~SeparateDerived() { ++destructor_count; }

SeparateMethod separate_method() { return &SeparateBase::value; }
int separate_destructor_count() { return destructor_count; }
