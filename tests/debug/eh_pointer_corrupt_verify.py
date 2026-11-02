#!/usr/bin/env python3
"""Checks that malformed pointer RTTI and reference markers fail a throw, instead of selecting
a handler.

The image of eh_pointer_corrupt_target runs unchanged on each of its four paths, and each must
report success. The conversion path throws a pointer to a class with a virtual base, and it
catches the base pointer. The marker path throws a base pointer and catches it by a mutable
reference. The noexcept path throws a pointer to a noexcept function and catches it as a pointer
to the potentially throwing type. The nested path throws a pointer to a pointer and catches it as
a pointer to a const pointer. Then each mutation patches one descriptor, or the vptr byte, in a
copy of the packed image, and runs the path that reads it. Every patched image must end with the
halt report, which means the throw was not caught, and the handler never ran. The mutations cover
an unknown vtable address point on the thrown pointer and on its class, an out-of-range pointee on
the thrown, the catch, and the inner pointer, a reserved flag bit on the thrown and the outer
pointer, a vptr or a vbase slot that makes the virtual base read leave 16-bit RAM or program
space, a function pointer representation without the AVM bit on one side or on both, and a marker
with nonzero reserved bytes, an out-of-range underlying descriptor, or an underlying descriptor
that is not a pointer.
"""

import argparse
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)

import eh_inheritance_corrupt_verify as corrupt  # noqa: E402
import eh_rtti_verify as rtti  # noqa: E402

check = rtti.check
put = corrupt.put

MODE = '_ZN12_GLOBAL__N_118pointer_corruptionE'
THROWN_POINTER = '_ZTIPN12_GLOBAL__N_18PVirtualE'
THROWN_CLASS = '_ZTIN12_GLOBAL__N_18PVirtualE'
VTABLE = '_ZTVN12_GLOBAL__N_18PVirtualE'
VTABLE_SIZE = 9
CATCH_POINTER = '_ZTIPN12_GLOBAL__N_15PBaseE'
MARKER = '_ZTIRPN12_GLOBAL__N_15PBaseE'
NON_POINTER = '_ZTIN12_GLOBAL__N_15PBaseE'
NOEXCEPT_THROWN = '_ZTIPDoFvvE'
FUNCTION_CATCH = '_ZTIPFvvE'
OUTER_POINTER = '_ZTIPPi'
INNER_POINTER = '_ZTIPi'

# The pointer descriptor's pointee sits at offset eight, and the flag word at offset six.
POINTEE = 8
FLAGS = 6
# The marker's reserved bytes lie at offset three, and its underlying descriptor at six.
RESERVED = 3
UNDERLYING = 6
OUTSIDE = 0x000010
UNKNOWN_VTABLE = 0x000123
RESERVED_FLAG = 0x20
# The vptr values that the constructor stores, selected by the mode byte at index zero. A vptr
# of four puts the vbase slot below program address zero.
ZERO_VPTR = 1
SMALL_VPTR = 2
# A displacement that lands past the 16-bit range, and one that lands below address zero.
HIGH_DISPLACEMENT = 0x7fffff
LOW_DISPLACEMENT = 0x800000
# The throw path, selected by the byte at index one.
CONVERSION = 0
MARKER_PATH = 1
NOEXCEPT_PATH = 2
NESTED_PATH = 3
# The AVM bit of a pointer descriptor's flag word, which is the low byte's top bit.
WIDE_BIT = 0x80
NOEXCEPT_BIT = 0x40


def mutations(addresses):
    """Each mutation names the path that reads the patched field, and patches a copy."""
    mode = addresses['mode']
    thrown = addresses['thrown_pointer']
    thrown_class = addresses['thrown_class']
    catch = addresses['catch_pointer']
    marker = addresses['marker']
    non_pointer = addresses['non_pointer']
    slot = addresses['vbase_slot']
    noexcept_thrown = addresses['noexcept_thrown']
    function_catch = addresses['function_catch']
    outer = addresses['outer']
    inner = addresses['inner']

    def vptr(value):
        return lambda d: d.__setitem__(mode, value)

    return [
        ('vptr zero on the converted object', CONVERSION, vptr(ZERO_VPTR)),
        ('vptr whose vbase slot lies below program address zero', CONVERSION,
         vptr(SMALL_VPTR)),
        ('vbase displacement past the 16-bit range', CONVERSION,
         lambda d: put(d, slot, HIGH_DISPLACEMENT, 3)),
        ('vbase displacement below address zero', CONVERSION,
         lambda d: put(d, slot, LOW_DISPLACEMENT, 3)),
        ('unknown vtable address point on the thrown pointer', CONVERSION,
         lambda d: put(d, thrown, UNKNOWN_VTABLE, 3)),
        ('thrown pointer names a pointee below the reserved header', CONVERSION,
         lambda d: put(d, thrown + POINTEE, OUTSIDE, 3)),
        ('reserved flag bit on the thrown pointer', CONVERSION,
         lambda d: d.__setitem__(thrown + FLAGS, d[thrown + FLAGS] | RESERVED_FLAG)),
        ('unknown vtable address point on the thrown class', CONVERSION,
         lambda d: put(d, thrown_class, UNKNOWN_VTABLE, 3)),
        ('catch pointer names a pointee below the reserved header', CONVERSION,
         lambda d: put(d, catch + POINTEE, OUTSIDE, 3)),
        ('marker with nonzero reserved bytes', MARKER_PATH,
         lambda d: put(d, marker + RESERVED, 1, 3)),
        ('marker naming a descriptor below the reserved header', MARKER_PATH,
         lambda d: put(d, marker + UNDERLYING, OUTSIDE, 3)),
        ('function pointer descriptors without the AVM bit on both sides', NOEXCEPT_PATH,
         lambda d: (d.__setitem__(noexcept_thrown + FLAGS,
                                  d[noexcept_thrown + FLAGS] & ~WIDE_BIT),
                    d.__setitem__(function_catch + FLAGS, d[function_catch + FLAGS] & ~WIDE_BIT))),
        ('noexcept function pointer descriptor without the AVM bit', NOEXCEPT_PATH,
         lambda d: d.__setitem__(noexcept_thrown + FLAGS, d[noexcept_thrown + FLAGS] & ~WIDE_BIT)),
        ('inner pointer descriptor naming a pointee below the reserved header', NESTED_PATH,
         lambda d: put(d, inner + POINTEE, OUTSIDE, 3)),
        ('outer pointer descriptor with a reserved flag bit', NESTED_PATH,
         lambda d: d.__setitem__(outer + FLAGS, d[outer + FLAGS] | RESERVED_FLAG)),
        ('marker naming a class descriptor, which is not a pointer', MARKER_PATH,
         lambda d: put(d, marker + UNDERLYING, non_pointer, 3)),
    ]


def run_path(args, original, mode, path, patch, label, scratch, index):
    data = bytearray(original)
    data[mode + 1] = path
    if patch is not None:
        patch(data)
        check(bytes(data) != bytes(original), 'the %s mutation changed nothing' % label)
    file_name = os.path.join(scratch, 'pointer_corrupt_%02d.bin' % index)
    with open(file_name, 'wb') as handle:
        handle.write(data)
    return corrupt.run(args, file_name)


def verify(args):
    elf = rtti.Elf(args.elf)
    with open(args.image, 'rb') as handle:
        original = bytearray(handle.read())
    addresses = {
        'mode': rtti.defined(elf, MODE)['value'],
        'thrown_pointer': rtti.defined(elf, THROWN_POINTER)['value'],
        'thrown_class': rtti.defined(elf, THROWN_CLASS)['value'],
        'catch_pointer': rtti.defined(elf, CATCH_POINTER)['value'],
        'marker': rtti.defined(elf, MARKER)['value'],
        'non_pointer': rtti.defined(elf, NON_POINTER)['value'],
        'noexcept_thrown': rtti.defined(elf, NOEXCEPT_THROWN)['value'],
        'function_catch': rtti.defined(elf, FUNCTION_CATCH)['value'],
        'outer': rtti.defined(elf, OUTER_POINTER)['value'],
        'inner': rtti.defined(elf, INNER_POINTER)['value'],
    }
    mode = addresses['mode']
    check(original[mode] == 0 and original[mode + 1] == 0,
          'the corruption bytes are not zero in the unpatched image')
    check(rtti.u24(original[addresses['marker'] + UNDERLYING:addresses['marker'] + UNDERLYING + 3])
          == addresses['catch_pointer'],
          'the marker does not name the catch pointer descriptor')
    decoded = rtti.decode_descriptor(elf, rtti.Image(args.image), THROWN_CLASS)
    check(decoded['bases'] == [rtti.defined(elf, '_ZTIN12_GLOBAL__N_15PBaseE')['value']],
          'the thrown class does not name its virtual base PBase')
    check([edge['virtual'] for edge in decoded['edges']] == [True],
          'the thrown class does not have one virtual base')
    # A class vtable is nine bytes, and its address point, which the vptr holds, is nine bytes in.
    # The virtual base's slot lies at the address point plus the RTTI edge's displacement.
    vtable = rtti.defined(elf, VTABLE)
    check(vtable['size'] == VTABLE_SIZE, 'the thrown class vtable is %d bytes, not %d'
          % (vtable['size'], VTABLE_SIZE))
    slot = vtable['value'] + VTABLE_SIZE + decoded['edges'][0]['offset']
    check(slot == vtable['value'], 'the vbase slot is at 0x%06x, not the vtable start' % slot)
    addresses['vbase_slot'] = slot

    os.makedirs(args.scratch_dir, exist_ok=True)
    for path, label in ((CONVERSION, 'conversion'), (MARKER_PATH, 'marker'),
                        (NOEXCEPT_PATH, 'noexcept function'), (NESTED_PATH, 'nested pointer')):
        serial = run_path(args, original, mode, path, None, label, args.scratch_dir, 90 + path)
        check(serial.endswith('P\\n'),
              'the unchanged %s path did not report success: %r' % (label, serial))
        print('  unchanged %s path: %s' % (label, serial))

    count = 0
    for index, (label, path, patch) in enumerate(mutations(addresses)):
        serial = run_path(args, original, mode, path, patch, label, args.scratch_dir, index)
        check(serial.endswith('H\\n') and 'P' not in serial,
              '%s: the throw did not fail, serial %r' % (label, serial))
        print('  %s: %s' % (label, serial))
        count += 1
    print('eh_pointer_corrupt_verify: %s: %d malformed pointer and marker fields fail the throw'
          % (os.path.basename(args.elf), count))


def main():
    parser = argparse.ArgumentParser(description=__doc__.split('\n')[1])
    parser.add_argument('--probe', required=True)
    parser.add_argument('--interpreter', required=True)
    parser.add_argument('--boundary', required=True)
    parser.add_argument('--image', required=True)
    parser.add_argument('--elf', required=True)
    parser.add_argument('--scratch-dir', required=True)
    args = parser.parse_args()
    verify(args)


if __name__ == '__main__':
    main()
