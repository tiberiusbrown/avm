#!/usr/bin/env python3
"""Checks which vtable a mixed -frtti and -fno-rtti link selects when dynamic typeid is live.

The fixture has one polymorphic class, Derived. Its vtable is a COMDAT in the -fno-rtti
unit and in the -frtti unit. Only the -frtti unit has the canonical descriptor, which lies
in the flash window. The typeid unit calls typeid on a base reference, so the link keeps
__avm_typeid_from_object. Each case is built at O0, at O2, and at O2 with full LTO:

  - control: no dynamic typeid. The -fno-rtti vtable is selected, and the link succeeds.
    The ELF shows that its RTTI slot is zero, while the descriptor and its name are valid
    and lie in the window. The image runs and prints its virtual-dispatch line.
  - negative: the -fno-rtti unit comes first, so its vtable is selected. The typeid unit is
    linked, so the link must fail with the vtable diagnostic. The window descriptor is valid
    in the control, so the diagnostic must not be the descriptor's window error.
  - positive: the -frtti unit comes first, so its vtable is selected. The slot must name the
    descriptor, and the image must print the canonical typeid match.
  - dead helper: the typeid unit is unreferenced and is collected, so the -fno-rtti vtable is
    accepted and the helper is absent from the ELF.
  - anonymous namespace: a local -fno-rtti vtable with the helper live must fail with its
    local name. The -frtti copy of the same class must link and match typeid.

Every link uses --gc-sections, as the image build does. Each selected vtable is confirmed from
the packed image through the ELF, not from the diagnostic text alone.
"""

import argparse
import os
import re
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)

import eh_rtti_verify as rtti  # noqa: E402

WINDOW_START = 0x0500
WINDOW_END = 0xfa00
DERIVED = 'N17rtti_mixed_vtable7DerivedE'
VTABLE = '_ZTV' + DERIVED
DESCRIPTOR = '_ZTI' + DERIVED
NAME = '_ZTS' + DERIVED
HELPER = '__avm_typeid_from_object'
DIAGNOSTIC = "AVM polymorphic RTTI required, but selected vtable '%s' has no RTTI entry" % VTABLE
LOCAL_DIAGNOSTIC = re.compile(
    r"selected vtable '(_ZTVN12_GLOBAL__N_1\d+LocalDerivedE)' has no RTTI entry")
ALIAS_ERROR = 'is not addressable through the AS0 flash window'
SNAPSHOT_STATUS = 'status: debug_break'
SERIAL = re.compile(r' serial="([^"]*)"')
CYCLE_LIMIT = '400000000'

COMMON = [
    '--target=avm-unknown-arduboyfx', '-ffreestanding', '-fomit-frame-pointer',
    '-fno-stack-protector', '-funwind-tables', '-fasynchronous-unwind-tables',
    '-ffunction-sections', '-fdata-sections', '-Wall', '-Wextra', '-Werror',
    '-std=c++23', '-fno-exceptions', '-fno-threadsafe-statics', '-fno-use-cxa-atexit',
]

OPTIONS = {
    'O0': ['-O0'],
    'O2': ['-O2'],
    'LTO': ['-O2', '-flto=full'],
}

# The units, each with its source file and RTTI flag.
UNITS = {
    'main': ('rtti_mixed_vtable_main.cpp', True),
    'virtual': ('rtti_mixed_vtable_virtual_main.cpp', False),
    'nortti': ('rtti_mixed_vtable_nortti_unit.cpp', False),
    'rtti': ('rtti_mixed_vtable_rtti_unit.cpp', True),
    'typeid': ('rtti_mixed_vtable_typeid_unit.cpp', True),
    'local_nortti': ('rtti_mixed_vtable_local_nortti_unit.cpp', False),
    'local_rtti': ('rtti_mixed_vtable_local_rtti_unit.cpp', True),
}

# The layout that the high-address RTTI fixtures use. The runtime's flash image sits at
# 0x500, so the descriptors start at 0x580, and the code and the high vtables follow.
LAYOUT = [
    '--image-base=0x100', '--section-start=.data=0x100', '--section-start=.flash=0x0B00',
    '--section-start=.avm.rtti=0x0580', '--section-start=.text=0x0A00',
    '--section-start=.rodata=0x10000', '--defsym=__avm_heap_start=0x110',
    '--undefined=__avm_trap_entry', '--gc-sections',
]


def fail(message):
    print('rtti_mixed_vtable_verify: FAIL: ' + message, file=sys.stderr)
    sys.exit(1)


def ensure(condition, message):
    if not condition:
        fail(message)


def run(command):
    result = subprocess.run(command, capture_output=True, text=True)
    return result.returncode, result.stdout, result.stderr


def compile_unit(args, unit, option, output):
    source, rtti_enabled = UNITS[unit]
    command = ([args.clang] + COMMON + OPTIONS[option] +
               ['-frtti' if rtti_enabled else '-fno-rtti', '-c',
                os.path.join(args.support_dir, source), '-o', output])
    code, _, stderr = run(command)
    ensure(code == 0, '%s did not compile for %s:\n%s' % (source, option, stderr))
    return output


def link(args, objects, output, roots=()):
    libraries = [os.path.join(args.sysroot_lib, 'libavm.a'),
                 os.path.join(args.sysroot_lib, 'libavm-builtins.a')]
    command = ([args.ld, '-flavor', 'gnu', '--entry=_start'] + LAYOUT +
               ['--undefined=' + root for root in roots] +
               [os.path.join(args.sysroot_lib, 'crt0_test.o')] + objects + libraries +
               ['-o', output])
    return run(command)


def link_ok(args, objects, output, label, roots=()):
    code, _, stderr = link(args, objects, output, roots)
    ensure(code == 0, '%s did not link:\n%s' % (label, stderr))
    return output


def pack(args, elf, image):
    code, _, stderr = run([args.packer, '--development', elf, '-o', image])
    ensure(code == 0, 'the packer rejected %s:\n%s' % (elf, stderr))
    return image


def probe(args, elf, image, expected):
    command = [args.probe, '--interpreter', args.interpreter, '--boundary', args.boundary,
               '--image', image, '--elf', elf, '--cycle-limit', CYCLE_LIMIT]
    _, stdout, stderr = run(command)
    ensure(SNAPSHOT_STATUS in stdout,
           'the probe run did not finish cleanly for %s:\n%s%s' % (image, stdout[-800:], stderr))
    match = SERIAL.search(stdout)
    ensure(match is not None, 'the probe printed no serial output for %s' % image)
    # The fixtures print their line and then P, which marks a passing run.
    ensure(match.group(1) == expected + r'\nP\n',
           'the image printed %r, not %r' % (match.group(1), expected))


def selected_vtable(elf_path, image_path):
    """Reads the selected vtable's slot, and checks the descriptor and name in the window."""
    elf = rtti.Elf(elf_path)
    image = rtti.Image(image_path)
    vtable = rtti.defined(elf, VTABLE)
    descriptor = rtti.defined(elf, DESCRIPTOR)
    name = rtti.defined(elf, NAME)
    for symbol, label in ((descriptor, DESCRIPTOR), (name, NAME)):
        ensure(WINDOW_START <= symbol['value'] and
               symbol['value'] + symbol['size'] <= WINDOW_END,
               '%s lies outside the flash window' % label)
    decoded = rtti.decode_descriptor(elf, image, DESCRIPTOR)
    ensure(decoded['name'] == NAME,
           '%s names %s, not %s' % (DESCRIPTOR, decoded['name'], NAME))
    slot = rtti.u24(image.read(vtable['value'] + 3, 3))
    return elf, descriptor, slot


def case_control(args, option, objs, scratch):
    # Nothing refers to the descriptor when the RTTI-disabled vtable is selected, so the
    # control keeps it as a root. The other links reach it through typeid or the vtable.
    elf_path = link_ok(args, [objs['virtual'], objs['nortti'], objs['rtti']],
                       os.path.join(scratch, 'control.elf'), 'the control link',
                       roots=[DESCRIPTOR, NAME])
    image = pack(args, elf_path, os.path.join(scratch, 'control.bin'))
    elf, descriptor, slot = selected_vtable(elf_path, image)
    ensure(slot == 0, 'control: the selected vtable names 0x%06x, not a null slot' % slot)
    ensure(HELPER not in elf.symbols, 'control: the helper is live without dynamic typeid')
    probe(args, elf_path, image, 'rtti-mixed-virtual=ok')
    print('  %s control: -fno-rtti vtable selected, null RTTI slot, descriptor 0x%06x'
          % (option, descriptor['value']))


def case_negative(args, option, objs, scratch):
    code, _, stderr = link(args, [objs['main'], objs['nortti'], objs['rtti'], objs['typeid']],
                           os.path.join(scratch, 'negative.elf'))
    ensure(code != 0, 'negative: the mixed link with a live typeid was accepted')
    ensure(DIAGNOSTIC in stderr,
           'negative: the link did not report the vtable:\n%s' % stderr)
    ensure(ALIAS_ERROR not in stderr,
           'negative: the link failed on the descriptor window instead of the vtable:\n%s'
           % stderr)
    if option != 'LTO':
        ensure('>>> defined in' in stderr and 'nortti.o' in stderr,
               'negative: the diagnostic does not name the selected unit:\n%s' % stderr)
    print('  %s negative: rejected, %s' % (option, DIAGNOSTIC))


def case_positive(args, option, objs, scratch):
    elf_path = link_ok(args, [objs['main'], objs['rtti'], objs['nortti'], objs['typeid']],
                       os.path.join(scratch, 'positive.elf'), 'the positive link')
    image = pack(args, elf_path, os.path.join(scratch, 'positive.bin'))
    elf, descriptor, slot = selected_vtable(elf_path, image)
    ensure(slot == descriptor['value'],
           'positive: the selected vtable names 0x%06x, not the descriptor at 0x%06x'
           % (slot, descriptor['value']))
    ensure(HELPER in elf.symbols, 'positive: the typeid helper is not live')
    probe(args, elf_path, image, 'rtti-mixed-vtable=ok')
    print('  %s positive: -frtti vtable selected, slot names 0x%06x, typeid matches'
          % (option, slot))


def case_dead_helper(args, option, objs, scratch):
    # The typeid unit is unreferenced, so it and the helper are collected. The descriptor
    # is kept as a root, as in the control, so the selected vtable can still be read.
    elf_path = link_ok(args, [objs['virtual'], objs['nortti'], objs['rtti'], objs['typeid']],
                       os.path.join(scratch, 'dead-helper.elf'), 'the dead-helper link',
                       roots=[DESCRIPTOR, NAME])
    image = pack(args, elf_path, os.path.join(scratch, 'dead-helper.bin'))
    elf, _, slot = selected_vtable(elf_path, image)
    ensure(HELPER not in elf.symbols, 'dead helper: the collected typeid helper is still linked')
    ensure(slot == 0, 'dead helper: the selected vtable does not have the null slot')
    probe(args, elf_path, image, 'rtti-mixed-virtual=ok')
    print('  %s dead helper: unreferenced typeid collected, RTTI-disabled vtable accepted'
          % option)


def case_local(args, option, objs, scratch):
    code, _, stderr = link(args, [objs['local_nortti'], objs['typeid']],
                           os.path.join(scratch, 'local-negative.elf'))
    ensure(code != 0, 'local negative: an anonymous-namespace vtable without RTTI was accepted')
    match = LOCAL_DIAGNOSTIC.search(stderr)
    ensure(match is not None,
           'local negative: the link did not report the anonymous-namespace vtable:\n%s'
           % stderr)
    ensure(ALIAS_ERROR not in stderr,
           'local negative: the link failed on the descriptor window instead of the vtable')
    print('  %s local negative: rejected, %s' % (option, match.group(1)))

    elf_path = link_ok(args, [objs['local_rtti'], objs['typeid']],
                       os.path.join(scratch, 'local-positive.elf'), 'the local positive link')
    image = pack(args, elf_path, os.path.join(scratch, 'local-positive.bin'))
    probe(args, elf_path, image, 'rtti-mixed-local=ok')
    print('  %s local positive: -frtti anonymous-namespace vtable accepted, typeid matches'
          % option)


def main():
    parser = argparse.ArgumentParser(description=__doc__.split('\n')[1])
    parser.add_argument('--clang', required=True)
    parser.add_argument('--ld', required=True)
    parser.add_argument('--packer', required=True)
    parser.add_argument('--probe', required=True)
    parser.add_argument('--interpreter', required=True)
    parser.add_argument('--boundary', required=True)
    parser.add_argument('--sysroot-lib', required=True)
    parser.add_argument('--support-dir', required=True)
    parser.add_argument('--scratch-dir', required=True)
    args = parser.parse_args()

    os.makedirs(args.scratch_dir, exist_ok=True)
    for option in OPTIONS:
        scratch = os.path.join(args.scratch_dir, option)
        os.makedirs(scratch, exist_ok=True)
        objs = {unit: compile_unit(args, unit, option,
                                   os.path.join(scratch, unit + '.o')) for unit in UNITS}
        case_control(args, option, objs, scratch)
        case_negative(args, option, objs, scratch)
        case_positive(args, option, objs, scratch)
        case_dead_helper(args, option, objs, scratch)
        case_local(args, option, objs, scratch)
    print('rtti_mixed_vtable_verify: the vtable check selects and accepts the links at O0, O2, '
          'and full LTO')


if __name__ == '__main__':
    main()
