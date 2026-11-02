#!/usr/bin/env python3
"""Explains the virtual base adjustments of an eh_virtual image, one hop at a time.

eh_inheritance_verify checks each handler's adjustment against the packed RTTI and the
thrown object's vptrs. This verifier takes the same handlers and walks their RTTI again,
keeping each virtual hop as evidence: the containing subobject's offset and vptr, the
vtable slot that the RTTI names, the signed displacement that the image holds there, and
the base offset that follows. It also requires that the run caught a virtual base, and
that it caught a shared virtual base reached by two paths, so both the vptr path and the
single-subobject rule are exercised. The walk is separate from the runtime's matcher.
"""

import argparse
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)

import eh_inheritance_verify as inh  # noqa: E402
import eh_metadata_verify as aveh  # noqa: E402
import eh_rtti_verify as rtti  # noqa: E402

check = aveh.check
Failure = aveh.Failure
HEADER_SIZE = inh.HEADER_SIZE


class Trace:
    """Enumerates the paths from a thrown class to a catch class, with their virtual hops."""

    def __init__(self, elf, image):
        self.elf = elf
        self.image = image
        self.reference = inh.Reference(elf, image)

    def paths(self, thrown, catch, obj):
        """Returns (offset, public, hops) for each path from thrown to catch. A hop is one
        virtual edge on the path, and it records the containing subobject's vptr."""
        found = []

        def visit(address, offset, public, hops, level):
            check(level <= inh.MAX_LEVELS, 'the trace is deeper than the runtime allows')
            if address == catch:
                found.append((offset, public, list(hops)))
            for edge in self.reference.decode(address)['edges']:
                child_public = public and edge['public']
                if not edge['virtual']:
                    visit(edge['base'], offset + edge['offset'], child_public, hops, level + 1)
                    continue
                check(offset + 3 <= len(obj),
                      'a virtual base is read from past the thrown object')
                vptr = rtti.u24(obj[offset:offset + 3])
                slot = vptr + edge['offset']
                displacement = rtti.u24(self.image.read(slot, 3))
                if displacement & 0x800000:
                    displacement -= 0x1000000
                hop = {'containing': offset, 'vptr': vptr, 'slot_offset': edge['offset'],
                       'slot': slot, 'displacement': displacement,
                       'base': offset + displacement}
                hops.append(hop)
                visit(edge['base'], hop['base'], child_public, hops, level + 1)
                hops.pop()

        visit(thrown, 0, True, [], 1)
        return found


def explain(trace, handler):
    """Checks one handler and returns the number of virtual hops on its path, and whether
    the catch is reached by more than one path."""
    header = handler['header']
    obj = handler['object']
    thrown = handler['thrown']
    catch = handler['catch']
    adjustment = handler['adjustment']
    if catch in (0, thrown):
        return 0, False
    found = trace.paths(thrown, catch, obj)
    check(found, 'the clause 0x%06x matches no path of thrown 0x%06x' % (catch, thrown))
    offsets = set(offset for offset, _, _ in found)
    check(len(offsets) == 1, 'paths to 0x%06x reach %d subobjects, not one'
          % (catch, len(offsets)))
    offset = offsets.pop()
    check(any(public for _, public, _ in found), 'every path to 0x%06x is nonpublic' % catch)
    check(offset == adjustment, 'the RTTI gives adjustment %d, the runtime %d'
          % (offset, adjustment))
    returned = header + HEADER_SIZE + adjustment
    shared = len(found) > 1
    hops = next((hops for _, _, hops in found if hops), [])
    print('  handler: complete object 0x%04x, thrown 0x%06x, catch 0x%06x, %d path(s)'
          % (header + HEADER_SIZE, thrown, catch, len(found)))
    for hop in hops:
        print('    containing subobject at offset %d, vptr 0x%06x' % (hop['containing'],
                                                                     hop['vptr']))
        print('    RTTI vtable-slot offset %d -> slot 0x%06x' % (hop['slot_offset'], hop['slot']))
        print('    signed displacement %d -> base offset %d' % (hop['displacement'], hop['base']))
    print('    final base adjustment %d, returned catch object 0x%04x'
          % (adjustment, returned))
    return len(hops), shared


def verify(args):
    handlers = inh.verify(args)
    elf = rtti.Elf(args.elf)
    trace = Trace(elf, rtti.Image(args.image))
    virtual = 0
    shared = 0
    for handler in handlers:
        hops, diamond = explain(trace, handler)
        if hops:
            virtual += 1
        if diamond:
            shared += 1
    check(virtual > 0, 'no handler caught a virtual base, so no vptr was read')
    check(shared > 0, 'no handler caught a shared virtual base reached by two paths')
    print('eh_virtual_verify: %s: %d virtual base handlers, %d shared virtual bases'
          % (os.path.basename(args.elf), virtual, shared))


def main():
    parser = argparse.ArgumentParser(description=__doc__.split('\n')[1])
    parser.add_argument('--bin-dir', required=True)
    parser.add_argument('--probe', required=True)
    parser.add_argument('--interpreter', required=True)
    parser.add_argument('--boundary', required=True)
    parser.add_argument('--image', required=True)
    parser.add_argument('--elf', required=True)
    args = parser.parse_args()
    try:
        verify(args)
    except Failure as error:
        print('eh_virtual_verify: FAIL: %s' % error, file=sys.stderr)
        sys.exit(1)


if __name__ == '__main__':
    main()
