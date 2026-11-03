#!/usr/bin/env python3
"""Checks the flash-window placement of a dynamic RTTI descriptor in a mixed link.

The -frtti unit has a polymorphic class whose vtable names its descriptor. No typeid
names that class, so the vtable's marker is the only request for the window check. The
-fno-rtti unit throws the same class, so it emits its own copy of the descriptor, which
the layout places above 0xFFFF in .rodata. Each unit is compiled with the SDK's flags, and
both link orders are run:

  - with the -fno-rtti copy first, the linker selects the high descriptor, and the vtable's
    marker must reject the link naming the descriptor and its type name;
  - with the -frtti copy first, the window copy is selected, the high copy is discarded,
    and the link succeeds.
"""

import argparse
import os
import subprocess
import sys

CLASS = '_ZTIN10rtti_mixed7DerivedE'
NAME = '_ZTSN10rtti_mixed7DerivedE'
WINDOW_UNIT = 'rtti_mixed_window_unit.cpp'
HIGH_UNIT = 'rtti_mixed_high_unit.cpp'
ENTRY = 'mixed_window_value'

COMMON = [
    '--target=avm-unknown-arduboyfx', '-ffreestanding', '-fomit-frame-pointer',
    '-fno-stack-protector', '-funwind-tables', '-fasynchronous-unwind-tables',
    '-ffunction-sections', '-fdata-sections', '-O2', '-Wall', '-Wextra', '-Werror',
    '-std=c++23', '-fno-exceptions', '-fno-rtti', '-fno-threadsafe-statics',
    '-fno-use-cxa-atexit',
]

# The layout of the descriptor and vtable sections, as the other high-address fixtures use.
LAYOUT = [
    '--image-base=0x100', '--section-start=.data=0x100', '--section-start=.text=0x0a00',
    '--section-start=.avm.rtti=0x0600', '--section-start=.rodata=0x10000',
    '--defsym=__avm_heap_start=0x110', '--defsym=avm_test_main=' + ENTRY,
]


def run(command):
    result = subprocess.run(command, capture_output=True, text=True)
    return result.returncode, result.stderr


def compile_unit(args, source, output, extra):
    command = [args.clang] + COMMON + extra + ['-c', os.path.join(args.support_dir, source),
                                               '-o', output]
    code, stderr = run(command)
    if code != 0:
        print('rtti_mixed_link_verify: FAIL: %s did not compile:\n%s' % (source, stderr),
              file=sys.stderr)
        sys.exit(1)


def link(args, objects, output):
    libraries = [os.path.join(args.sysroot_lib, 'libavm.a'),
                 os.path.join(args.sysroot_lib, 'libavm-builtins.a')]
    command = [args.ld] + LAYOUT + [os.path.join(args.sysroot_lib, 'crt0_test.o')] + \
        objects + libraries + ['-o', output]
    return run(command)


def main():
    parser = argparse.ArgumentParser(description=__doc__.split('\n')[1])
    parser.add_argument('--clang', required=True)
    parser.add_argument('--ld', required=True)
    parser.add_argument('--sysroot-lib', required=True)
    parser.add_argument('--support-dir', required=True)
    parser.add_argument('--scratch-dir', required=True)
    args = parser.parse_args()

    os.makedirs(args.scratch_dir, exist_ok=True)
    window = os.path.join(args.scratch_dir, 'mixed_window.o')
    high = os.path.join(args.scratch_dir, 'mixed_high.o')
    compile_unit(args, WINDOW_UNIT, window, ['-frtti'])
    compile_unit(args, HIGH_UNIT, high, ['-fno-rtti', '-fexceptions'])

    code, stderr = link(args, [high, window], os.path.join(args.scratch_dir, 'high-first.elf'))
    expected = ["AVM type_info descriptor '%s' is not addressable through the AS0 flash window"
                % CLASS, "AVM type_info name '%s' is not addressable through the AS0 flash window"
                % NAME]
    if code == 0:
        print('rtti_mixed_link_verify: FAIL: the high copy was selected and the link succeeded',
              file=sys.stderr)
        sys.exit(1)
    for message in expected:
        if message not in stderr:
            print('rtti_mixed_link_verify: FAIL: the link did not report %r:\n%s'
                  % (message, stderr), file=sys.stderr)
            sys.exit(1)
    print('  high copy first: rejected, %s' % expected[0])

    code, stderr = link(args, [window, high], os.path.join(args.scratch_dir, 'window-first.elf'))
    if code != 0:
        print('rtti_mixed_link_verify: FAIL: the window copy first did not link:\n%s'
              % stderr, file=sys.stderr)
        sys.exit(1)
    print('  window copy first: linked')
    print('rtti_mixed_link_verify: the vtable marker checks the mixed link in both orders')


if __name__ == '__main__':
    main()
