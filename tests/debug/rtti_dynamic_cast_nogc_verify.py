#!/usr/bin/env python3
"""Checks dynamic_cast<void*> in a program without RTTI, with and without section garbage collection.

The fixture rtti_dynamic_cast_void_nogc.cpp is compiled with -fno-rtti at each optimization level.
Its image is linked twice: without --gc-sections, and with it. For each of those images the
verifier checks:

  1. the object re-links with ld.lld in that mode, with the same flags as the image build;
  2. the ELF defines __avm_dynamic_cast_to_void, which the runtime's dynamic_cast_void.c provides,
     and it does not define or reference __dynamic_cast, __avm_typeid_from_object, or any of the
     class-cast matcher's functions, so the class-cast archive member is not extracted;
  3. the vtables of the fixture's polymorphic classes keep their null RTTI slot;
  4. the image runs to its pass line under the host probe;
  5. each void* cast returns the complete object that the probe read at its entry, and that
     object is the fixture's both_object.

A negative control then links a -frtti unit with a real dynamic_cast to a class type against the
-fno-rtti unit, which is selected first. The link must still be rejected by the mixed-RTTI check,
with and without garbage collection, and a positive control with the -frtti unit first must link.

Every check reads the ELF and the packed image, and the probe reads the emulator's state. The
runtime is never called to compute an expected value.
"""

import argparse
import os
import re
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)

import eh_rtti_verify as rtti  # noqa: E402

SOURCE = 'rtti_dynamic_cast_void_nogc'
ENTRY = '__avm_dynamic_cast_to_void'
CLASS_CAST = '__dynamic_cast'
TYPEID = '__avm_typeid_from_object'
VOID_FILE = 'dynamic_cast_void.c'
CLASS_FILE = 'dynamic_cast.c'
BOTH = '_ZN12_GLOBAL__N_111both_objectE'
FIXTURE_VTABLE = '_ZTVN12_GLOBAL__N_1'
FIXTURE_BOTH_VTABLE = '_ZTVN12_GLOBAL__N_14BothE'
# The static functions of dynamic_cast.c. None of them may appear in a void-only image.
HIERARCHY = ['classify', 'cross_edge', 'add_downcast_targets', 'dc_walk_init', 'dc_walk_next',
             'replay_to', 'dynamic_root', 'read_complete', 'descriptor_in_window', 'class_kind',
             'base_count', 'base_edge', 'add_target', 'add_downcast']
SUPPORT_VTABLES = ['_ZTVN10__cxxabiv117__class_type_infoE',
                   '_ZTVN10__cxxabiv120__si_class_type_infoE',
                   '_ZTVN10__cxxabiv121__vmi_class_type_infoE']
PASS_LINE = 'rtti-dynamic-cast-void-nogc=ok'
MIN_VOID_CASTS = 3
CYCLE_LIMIT = '400000000'
ADDRESS_POINT = 6
RTTI_SLOT = 3
MIXED_DIAGNOSTIC = re.compile(
    r"AVM polymorphic RTTI required, but selected vtable '(_ZTV\w+)' has no RTTI entry")
STATUS = 'status: debug_break'
SERIAL = re.compile(r' serial="([^"]*)"')
SNAPSHOT = re.compile(
    r'^snapshot (\S+) pc=0x[0-9a-f]+ sp=0x[0-9a-f]+ cycle=\d+ '
    r'regs=([0-9a-f,]+) record=0x([0-9a-f]+)(?: bytes=([0-9a-f]+))?',
    re.MULTILINE)
# Exception-free and freestanding, as the SDK compiles the fixture and the negative control.
COMMON = [
    '--target=avm-unknown-arduboyfx', '-ffreestanding', '-fomit-frame-pointer',
    '-fno-stack-protector', '-ffunction-sections', '-fdata-sections', '-Wall', '-Wextra',
    '-Werror', '-std=c++23', '-fno-exceptions', '-fno-threadsafe-statics',
    '-fno-use-cxa-atexit',
]
OPTIONS = ['O0', 'O2']
VARIANTS = [('nogc', []), ('gc', ['--gc-sections'])]


class Failure(Exception):
    pass


def check(condition, message):
    if not condition:
        raise Failure(message)


def signed24(value):
    return value - 0x1000000 if value & 0x800000 else value


def run(command):
    result = subprocess.run(command, capture_output=True, text=True)
    return result.returncode, result.stdout, result.stderr


def link_command(args, objects, output, gc):
    libraries = [os.path.join(args.sysroot_lib, 'libavm.a'),
                 os.path.join(args.sysroot_lib, 'libavm-builtins.a')]
    # The image build passes the trap root for libavm.a and the anchor definition, and the same
    # flags here. Only --gc-sections differs between the two modes.
    return ([args.ld, '-flavor', 'gnu', '--entry=_start', '--undefined=__avm_trap_entry',
             '--defsym=__avm_text_state=0']
            + gc + ['-o', output, os.path.join(args.sysroot_lib, 'crt0_test.o')]
            + objects + libraries)


def symbol_names(elf):
    """Every symbol that the ELF defines, locals included, and every undefined reference."""
    return set(elf.symbols) | set(elf.undefined)


def file_symbols(args, elf_path):
    """The STT_FILE names in the ELF's symbol table, which record the input object names."""
    code, out, err = run([os.path.join(args.bin_dir, 'llvm-readobj'), '--symbols', elf_path])
    check(code == 0, 'llvm-readobj failed on %s: %s' % (elf_path, err))
    names = set()
    last = None
    for line in out.splitlines():
        stripped = line.strip()
        if stripped.startswith('Name: '):
            last = stripped[len('Name: '):].split(' (')[0]
        elif stripped == 'Type: File (0x4)' and last is not None:
            names.add(last)
    return names


def check_elf(args, label, elf_path):
    elf = rtti.Elf(elf_path)
    names = symbol_names(elf)
    check(ENTRY in elf.symbols, '%s: %s is not defined' % (label, ENTRY))
    # llvm-avm-image rejects any global undefined symbol, so the image must have none.
    check(not elf.undefined, '%s: undefined global symbols %s' % (label, sorted(elf.undefined)))
    for name in [CLASS_CAST, TYPEID] + HIERARCHY:
        check(name not in names, '%s: %s is linked into a void-only image' % (label, name))
    for name in SUPPORT_VTABLES:
        check(name not in names,
              '%s: the class-cast support vtable %s is linked into a void-only image'
              % (label, name))
    files = file_symbols(args, elf_path)
    check(VOID_FILE in files, '%s: no archive member %s contributed to the image' % (label, VOID_FILE))
    check(CLASS_FILE not in files,
          '%s: the class-cast member %s was extracted into a void-only image' % (label, CLASS_FILE))
    return elf


def check_rtti_slots(elf, image, label):
    """Every vtable of the fixture's classes keeps a zero RTTI slot, because the class has no RTTI."""
    vtables = [(name, entries) for name, entries in elf.symbols.items()
               if name.startswith(FIXTURE_VTABLE)]
    check(FIXTURE_BOTH_VTABLE in elf.symbols,
          '%s: the vtable of Both is not linked, so no class vtable is checked' % label)
    count = 0
    for name, entries in vtables:
        for entry in entries:
            slot = rtti.u24(image.read(entry['value'] + RTTI_SLOT, 3))
            check(slot == 0, '%s: %s has RTTI slot 0x%06x, not zero' % (label, name, slot))
            count += 1
    return count


def parse_events(text):
    events = []
    for match in SNAPSHOT.finditer(text):
        regs = [int(v, 16) for v in match.group(2).split(',')]
        events.append({
            'name': match.group(1),
            'regs': regs,
            'record': int(match.group(3), 16),
            'bytes': bytes.fromhex(match.group(4)) if match.group(4) else b'',
        })
    return events


def probe(args, image, elf_path, names):
    command = [args.probe, '--interpreter', args.interpreter, '--boundary', args.boundary,
               '--image', image, '--elf', elf_path, '--cycle-limit', CYCLE_LIMIT,
               '--snapshot-bytes', '3']
    for name in names:
        command += ['--snapshot', name]
    code, out, err = run(command)
    check(STATUS in out, 'the probe run did not finish cleanly:\n%s' % out[-800:])
    serial = SERIAL.search(out)
    check(serial is not None, 'the probe printed no serial output')
    return serial.group(1), parse_events(out)


def pair_returns(events, entries):
    """Pairs each entry with the return snapshot at its own return address, in execution order."""
    pairs = []
    pending = None
    for event in events:
        if event['name'] == ENTRY:
            check(pending is None, '%s was entered before the last call returned' % ENTRY)
            pending = event
        elif pending is not None and event['name'] == '0x%06x' % pending['record']:
            pairs.append((pending, event))
            pending = None
    check(pending is None, '%s never returned' % ENTRY)
    check(len(pairs) == len(entries), '%d void casts were entered, but %d returned'
          % (len(entries), len(pairs)))
    return pairs


def verify_image(args, label, elf_path, image_path, image, both_address):
    serial, entries_run = probe(args, image_path, elf_path, [ENTRY])
    check(PASS_LINE in serial, '%s: the image printed %r, not %s' % (label, serial, PASS_LINE))
    entries = [e for e in entries_run if e['name'] == ENTRY]
    check(len(entries) >= MIN_VOID_CASTS,
          '%s: %d void casts ran, expected at least %d' % (label, len(entries), MIN_VOID_CASTS))

    returns = sorted({e['record'] for e in entries})
    _, events = probe(args, image_path, elf_path, [ENTRY] + ['0x%06x' % r for r in returns])
    results = []
    for entry, ret in pair_returns(events, entries):
        check(len(entry['bytes']) == 3, '%s: the vptr at 0x%04x was not read' % (label, entry['regs'][4]))
        source = entry['regs'][4]
        vptr = rtti.u24(entry['bytes'])
        check(vptr >= ADDRESS_POINT, '%s: vptr 0x%06x is not a program address' % (label, vptr))
        offset = signed24(rtti.u24(image.read(vptr - ADDRESS_POINT, 3)))
        complete = source + offset
        returned = ret['regs'][4]
        check(complete == both_address,
              '%s: the complete object of 0x%04x is 0x%04x, not both_object at 0x%04x'
              % (label, source, complete, both_address))
        check(returned == both_address,
              '%s: void cast of 0x%04x returned 0x%04x, not both_object at 0x%04x'
              % (label, source, returned, both_address))
        results.append((source, offset, returned))
    return len(results), results


def verify_mode(args, opt, variant, gc):
    label = '%s %s' % (variant, opt)
    void_dir = os.path.join(args.void_dir, opt)
    obj = os.path.join(void_dir, SOURCE + '.o')
    check(os.path.exists(obj), 'missing object %s' % obj)

    scratch = os.path.join(args.scratch_dir, 'relink-%s-%s' % (variant, opt))
    os.makedirs(scratch, exist_ok=True)
    relinked = os.path.join(scratch, SOURCE + '.elf')
    code, _, err = run(link_command(args, [obj], relinked, gc))
    check(code == 0, '%s: the object did not re-link:\n%s' % (label, err))
    check_elf(args, label + ' relink', relinked)

    built_dir = os.path.join(args.void_dir, variant, opt)
    elf_path = os.path.join(built_dir, SOURCE + '.elf')
    image = os.path.join(built_dir, SOURCE + '.bin')
    check(os.path.exists(elf_path) and os.path.exists(image),
          'missing built image in %s' % built_dir)
    elf = check_elf(args, label, elf_path)
    image_data = rtti.Image(image)
    slots = check_rtti_slots(elf, image_data, label)
    both = elf.symbols.get(BOTH)
    check(both, '%s: %s is not defined' % (label, BOTH))
    both_address = both[0]['value']
    casts, results = verify_image(args, label, elf_path, image, image_data, both_address)
    secondary = sum(1 for _, offset, _ in results if offset != 0)
    print('  %s: linked%s, %d vtable RTTI slots zero, %d void casts return both_object at 0x%04x'
          ' (%d through a nonzero offset)' % (label, '' if not gc else ' with --gc-sections',
                                              slots, casts, both_address, secondary))
    return casts


def negative_control(args):
    """A real class cast in a -frtti unit must keep the -fno-rtti vtable from linking."""
    scratch = os.path.join(args.scratch_dir, 'negative')
    os.makedirs(scratch, exist_ok=True)
    header = os.path.join(scratch, 'neg.h')
    with open(header, 'w') as f:
        f.write('#ifndef NEG_H\n#define NEG_H\n'
                'class NegBase {\npublic:\n    virtual ~NegBase() = default;\n'
                '    virtual int value() const { return base_value; }\n    int base_value = 3;\n};\n'
                'class NegDerived : public NegBase {\npublic:\n'
                '    int value() const override { return derived_value; }\n'
                '    int derived_value = 5;\n};\n#endif\n')
    nogc_unit = os.path.join(scratch, 'neg_nogc.cpp')
    with open(nogc_unit, 'w') as f:
        f.write('#include "neg.h"\nint neg_cast_check(NegBase *base);\n'
                'extern "C" int avm_test_main(void) {\n'
                '    NegDerived derived;\n    NegBase *base = &derived;\n'
                '    return neg_cast_check(base) ? 0 : 1;\n}\n')
    cast_unit = os.path.join(scratch, 'neg_cast.cpp')
    with open(cast_unit, 'w') as f:
        # The global object makes this unit emit the vtable too, so the link order chooses it.
        f.write('#include "neg.h"\nNegDerived neg_cast_object;\n'
                'int neg_cast_check(NegBase *base) {\n'
                '    return dynamic_cast<NegDerived *>(base) != nullptr;\n}\n')

    objects = {}
    for name, source, flags in [('nogc', nogc_unit, ['-fno-rtti']),
                                ('rtti', cast_unit, ['-frtti'])]:
        output = os.path.join(scratch, 'neg_%s.o' % name)
        code, _, err = run([args.clang] + COMMON + ['-O2'] + flags + ['-c', source, '-o', output])
        check(code == 0, 'the negative control %s unit did not compile:\n%s' % (name, err))
        objects[name] = output

    for variant, gc in VARIANTS:
        code, _, err = run(link_command(args, [objects['nogc'], objects['rtti']],
                                        os.path.join(scratch, 'negative-%s.elf' % variant), gc))
        check(code != 0, 'negative %s: the -fno-rtti vtable linked with a live class cast' % variant)
        match = MIXED_DIAGNOSTIC.search(err)
        check(match is not None,
              'negative %s: the link did not report the mixed-RTTI vtable:\n%s' % (variant, err))
        check('neg_nogc.o' in err,
              'negative %s: the diagnostic does not name the -fno-rtti unit:\n%s' % (variant, err))
        print('  negative %s: rejected, selected vtable %s has no RTTI entry'
              % (variant, match.group(1)))

    for variant, gc in VARIANTS:
        output = os.path.join(scratch, 'positive-%s.elf' % variant)
        code, _, err = run(link_command(args, [objects['rtti'], objects['nogc']], output, gc))
        check(code == 0, 'positive %s: the -frtti vtable first did not link:\n%s' % (variant, err))
        print('  positive %s: -frtti vtable selected, link succeeds' % variant)


ARCHIVE_FORBIDDEN_PREFIXES = ('__dynamic_cast', '__avm_typeid', '_ZTV', '_ZTI', '__cxa_bad',
                              '__cxa_begin', '__cxa_end', '__cxa_rethrow', '__cxa_throw',
                              '__cxa_allocate', '__cxa_free', '_Unwind_', '__avm_eh', '__avm_unwind')
ARCHIVE_ALLOWED_UNDEFINED = {'abort'}


def read_archive(path):
    """The members of a GNU-format ar archive, by name, with long names taken from the // table."""
    with open(path, 'rb') as f:
        data = f.read()
    check(data[:8] == b'!<arch>\n', '%s is not an ar archive' % path)
    entries = []
    offset = 8
    while offset + 60 <= len(data):
        header = data[offset:offset + 60]
        offset += 60
        name = header[0:16].decode().strip()
        size = int(header[48:58].decode().strip())
        body = data[offset:offset + size]
        offset += size + (size & 1)
        entries.append((name, body))
    long_names = next((body for name, body in entries if name == '//'), b'')
    members = {}
    for name, body in entries:
        if name in ('/', '//'):
            continue
        if name.startswith('/') and name[1:].isdigit():
            start = int(name[1:])
            name = long_names[start:long_names.index(b'/\n', start)].decode()
        members.setdefault(name.rstrip('/'), body)
    return members


def check_archive(args, scratch):
    """Each runtime member defines its own entry point, and the void-only member is self-contained."""
    members = read_archive(os.path.join(args.sysroot_lib, 'libavm.a'))
    for name in ('dynamic_cast.o', 'dynamic_cast_void.o'):
        check(name in members, 'libavm.a has no archive member %s' % name)
    paths = {}
    for name in ('dynamic_cast.o', 'dynamic_cast_void.o'):
        paths[name] = os.path.join(scratch, 'member-' + name)
        with open(paths[name], 'wb') as f:
            f.write(members[name])

    class_member = rtti.Elf(paths['dynamic_cast.o'])
    check('__dynamic_cast' in class_member.symbols,
          'dynamic_cast.o does not define __dynamic_cast')
    check(ENTRY not in class_member.symbols,
          'dynamic_cast.o also defines %s' % ENTRY)

    void_member = rtti.Elf(paths['dynamic_cast_void.o'])
    check(ENTRY in void_member.symbols, 'dynamic_cast_void.o does not define %s' % ENTRY)
    check(CLASS_CAST not in void_member.symbols,
          'dynamic_cast_void.o also defines %s' % CLASS_CAST)
    for name in void_member.undefined:
        check(not name.startswith(ARCHIVE_FORBIDDEN_PREFIXES),
              'dynamic_cast_void.o references %s' % name)
    check(set(void_member.undefined) <= ARCHIVE_ALLOWED_UNDEFINED,
          'dynamic_cast_void.o has undefined references beyond abort: %s'
          % sorted(set(void_member.undefined) - ARCHIVE_ALLOWED_UNDEFINED))
    for section in void_member.sections:
        if section['name'].startswith(('.data', '.bss', '.rodata', '.sdata', '.sbss')):
            check(section['size'] == 0,
                  'dynamic_cast_void.o has a %s contribution of %d bytes'
                  % (section['name'], section['size']))
    return sorted(void_member.undefined)


def verify(args):
    check(os.path.isdir(args.void_dir), 'no void-only build directory at %s' % args.void_dir)
    os.makedirs(args.scratch_dir, exist_ok=True)
    undefined = check_archive(args, args.scratch_dir)
    print('  runtime archive: dynamic_cast.o defines %s only; dynamic_cast_void.o defines %s only, '
          'references %s, and has no data or bss'
          % (CLASS_CAST, ENTRY, ', '.join(undefined) or 'nothing'))
    total = 0
    for opt in OPTIONS:
        for variant, gc in VARIANTS:
            total += verify_mode(args, opt, variant, gc)
    negative_control(args)
    print('rtti_dynamic_cast_nogc_verify: %d void* casts verified in both link modes, '
          'void-only images define no class-cast matcher, negative control rejected'
          % total)


def main():
    parser = argparse.ArgumentParser(description=__doc__.split('\n')[1])
    parser.add_argument('--bin-dir', required=True)
    parser.add_argument('--clang', required=True)
    parser.add_argument('--ld', required=True)
    parser.add_argument('--probe', required=True)
    parser.add_argument('--interpreter', required=True)
    parser.add_argument('--boundary', required=True)
    parser.add_argument('--void-dir', required=True,
                        help='the directory with O0/O2 objects and nogc/gc images')
    parser.add_argument('--sysroot-lib', required=True)
    parser.add_argument('--scratch-dir', required=True)
    args = parser.parse_args()
    try:
        verify(args)
    except Failure as error:
        print('rtti_dynamic_cast_nogc_verify: FAIL: %s' % error, file=sys.stderr)
        sys.exit(1)


if __name__ == '__main__':
    main()
