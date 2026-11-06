#!/usr/bin/env python3
"""Checks the pointer handlers of an eh_pointer_conversion image against the emulator.

The probe reports each installation of a landing context, the entry and the return of
__cxa_begin_catch and __cxa_get_exception_ptr, and the first bytes that the pointer and the
thrown object hold. The expected clause, conversion mode, adjustment, and converted value come
from a model that reads the packed RTTI and the thrown pointer's target, and not from the
runtime's matcher. The model implements the rules of C++ pointer matching: exact types, a
reference marker that matches its pointer type exactly, qualification conversion with the
nested-level rule, conversion to void, the public base of a derived pointee, a null pointer
from std::nullptr_t, and a null derived pointer, which is walked by type only. A virtual base
is located through the vptr of the subobject that holds the edge, read from the pointee's bytes.

For each handler the check reads the packed AVEH5 block and the machine code, and confirms that:

  - the header holds the thrown descriptor, and the selector that phase one recorded equals the
    selector in r5 at the installer;
  - every clause before the selected one does not match, and the selected clause matches;
  - the conversion mode and the handler adjustment equal the model's;
  - the pointer returned by __cxa_begin_catch or __cxa_get_exception_ptr is the converted
    buffer, at CONVERTED_OFFSET in the header, for a converted handler, and the caught object,
    at HEADER_SIZE after the header, for an exact handler;
  - a converted buffer holds the model's value in its first two bytes for a data pointer, and in
    all three bytes for a program pointer, and it is zero for a std::nullptr_t;
  - each handler is begun once, ended once, and its exception object is freed once.

The run must end with the success report.
"""

import argparse
import os
import re
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)

import eh_runtime_layout as layout  # noqa: E402

import eh_metadata_verify as aveh  # noqa: E402
import eh_rtti_verify as rtti  # noqa: E402

Failure = aveh.Failure
check = aveh.check

INSTALL = '__avm_eh_install_context'
BEGIN = '__cxa_begin_catch'
GET_PTR = '__cxa_get_exception_ptr'
END = '__cxa_end_catch'
FREE = 'free'
RETURNS = (BEGIN, GET_PTR)

HEADER_SIZE = layout.HEADER_SIZE
CONVERTED_OFFSET = layout.CONVERTED_OFFSET
OBJECT_LIMIT = 8
TARGET_BYTES = 24
STATE_ENTERING_CATCH = 4
MAX_LEVELS = 8

# The conversion modes, as the runtime's header records them.
NONE, DATA, PROGRAM, NULL = 0, 1, 2, 3

# The pointer flags of a pointer descriptor, and the layout of each kind.
CONST, VOLATILE, RESTRICT, INCOMPLETE, NOEXCEPT, WIDE = 0x01, 0x02, 0x04, 0x08, 0x40, 0x80
DEFINED_FLAGS = CONST | VOLATILE | RESTRICT | INCOMPLETE | NOEXCEPT | WIDE
POINTER_FLAGS = 6
POINTER_POINTEE = 8
MARKER_UNDERLYING = 6
NAME = 3

VTABLE_KINDS = {
    '_ZTVN10__cxxabiv117__class_type_infoE': 'class',
    '_ZTVN10__cxxabiv120__si_class_type_infoE': 'class',
    '_ZTVN10__cxxabiv121__vmi_class_type_infoE': 'class',
    '_ZTVN10__cxxabiv119__pointer_type_infoE': 'pointer',
    '_ZTVN10__cxxabiv123__fundamental_type_infoE': 'fundamental',
    '_ZTVN10__cxxabiv120__function_type_infoE': 'function',
    '__avm_eh_exact_pointer_ref_type_info': 'marker',
}

SNAPSHOT = re.compile(
    r'^snapshot (\S+) pc=0x[0-9a-f]+ sp=0x([0-9a-f]+) cycle=\d+ '
    r'regs=([0-9a-f,]+) record=0x([0-9a-f]+)'
    r'(?: bytes=([0-9a-f]+))?'
    r'(?: target=([0-9a-f]{4}))?'
    r'(?: targetbytes=([0-9a-f]+))?',
    re.MULTILINE)
INSTRUCTION = re.compile(r'^\s*([0-9a-f]+):\s+(.*)$')


def run_probe(args, names):
    command = [args.probe, '--interpreter', args.interpreter, '--boundary', args.boundary,
               '--image', args.image, '--elf', args.elf, '--cycle-limit', '600000000',
               '--snapshot-bytes', str(HEADER_SIZE + OBJECT_LIMIT),
               '--target-bytes', str(TARGET_BYTES)]
    for name in names:
        command += ['--snapshot', name]
    result = subprocess.run(command, capture_output=True, text=True)
    check('status: debug_break' in result.stdout,
          'the probe run did not finish cleanly:\n%s' % result.stdout[-800:])
    serial = re.search(r' serial="([^"]*)"', result.stdout)
    check(serial is not None and serial.group(1).endswith('P\\n'),
          'the run did not report success: serial %r'
          % (serial.group(1) if serial else None))
    events = []
    for match in SNAPSHOT.finditer(result.stdout):
        events.append({
            'name': match.group(1),
            'regs': [int(v, 16) for v in match.group(3).split(',')],
            'record': int(match.group(4), 16),
            'bytes': bytes.fromhex(match.group(5)) if match.group(5) else b'',
            'target': int(match.group(6), 16) if match.group(6) else None,
            'target_bytes': bytes.fromhex(match.group(7)) if match.group(7) else None,
        })
    return events


def return_addresses(objdump, elf):
    """The address after each call of __cxa_begin_catch and __cxa_get_exception_ptr."""
    returns = set()
    after_call = False
    for line in aveh.run_tool(objdump, ['-d', '--no-show-raw-insn', elf]).splitlines():
        match = INSTRUCTION.match(line)
        if not match:
            continue
        if after_call:
            returns.add(int(match.group(1), 16))
            after_call = False
        if any('<%s>' % name in match.group(2) for name in RETURNS):
            after_call = True
    check(returns, 'the image has no calls to %s' % ', '.join(RETURNS))
    return returns


class Model:
    """The expected conversions, from the packed RTTI and the thrown pointer's target."""

    def __init__(self, elf, image):
        self.elf = elf
        self.image = image
        self.classes = {}

    def address_point(self, address):
        """The kind of the descriptor at address, read from its vtable address point."""
        if address < 0x100 or address > 0xffffff - 11:
            return 'invalid'
        point = rtti.u24(self.image.read(address, 3))
        for name, kind in VTABLE_KINDS.items():
            for entry in self.elf.symbols.get(name, []):
                if entry['value'] + rtti.ADDRESS_POINT == point:
                    return kind
        return 'other'

    def pointer_flags(self, descriptor):
        return rtti.u16(self.image.read(descriptor + POINTER_FLAGS, 2))

    def pointee(self, descriptor):
        return rtti.u24(self.image.read(descriptor + POINTER_POINTEE, 3))

    def fundamental_name(self, descriptor):
        name = rtti.u24(self.image.read(descriptor + NAME, 3))
        return self.image.cstring(name) if self.address_point(name) != 'invalid' else None

    def is_void(self, descriptor):
        return self.address_point(descriptor) == 'fundamental' and \
            self.fundamental_name(descriptor) == 'v'

    def is_nullptr(self, descriptor):
        return self.address_point(descriptor) == 'fundamental' and \
            self.fundamental_name(descriptor) == 'Dn'

    def class_edges(self, descriptor):
        if descriptor not in self.classes:
            name = rtti.find_symbol_at(self.elf, '_ZTI', descriptor)
            check(name is not None, 'no RTTI object at 0x%06x' % descriptor)
            self.classes[descriptor] = rtti.decode_descriptor(self.elf, self.image, name)
        return self.classes[descriptor]['edges']

    def pointer_chain(self, source, target):
        """Matches a thrown pointer against a pointer type. Returns 'convert' when no walk is
        needed, 'base' when the pointees are classes, or None. The levels are the pointer
        descriptors along the chain. A level's qualifiers must include the source's, and once
        one level changes the qualifiers, every target level above it must be const."""
        depth = 0
        const_above = True
        while True:
            sf, tf = self.pointer_flags(source), self.pointer_flags(target)
            check(sf & ~DEFINED_FLAGS == 0 and tf & ~DEFINED_FLAGS == 0,
                  'a pointer descriptor sets undefined flags')
            if (sf ^ tf) & (WIDE | RESTRICT):
                return None
            scv, tcv = sf & (CONST | VOLATILE), tf & (CONST | VOLATILE)
            if scv & ~tcv:
                return None
            if scv != tcv and not const_above:
                return None
            const_above = const_above and bool(tcv & CONST)
            sp, tp = self.pointee(source), self.pointee(target)
            sk, tk = self.address_point(sp), self.address_point(tp)
            if sk == 'pointer' and tk == 'pointer':
                check(depth + 1 < MAX_LEVELS, 'the conversion chain is deeper than the runtime allows')
                source, target, depth = sp, tp, depth + 1
                continue
            if sp == tp:
                if (sf | tf) & NOEXCEPT:
                    if sk != 'function':
                        return None
                    if depth == 0:
                        if tf & NOEXCEPT and not sf & NOEXCEPT:
                            return None
                    elif (sf ^ tf) & NOEXCEPT:
                        return None
                return 'convert'
            if depth == 0 and sk == 'class' and tk == 'class':
                return None if sf & WIDE else 'base'
            if depth == 0 and tk == 'fundamental' and self.is_void(tp) and sk != 'function':
                return 'convert'
            return None

    def walk(self, root, catch, origin, target_bytes):
        """The unique public subobject of type catch in the class at root. The origin is the
        address of the thrown object, or None for a null pointer, which is walked by type alone.
        Returns (offset, True) for a unique accessible match, or None. A nonnull walk identifies a
        subobject by its address, and a null walk by its anchor and its offset within it. A
        virtual edge reads the vptr of the containing subobject from the target bytes."""
        found = {}

        def visit(descriptor, anchor, position, public, level):
            check(level <= MAX_LEVELS, 'the base walk is deeper than the runtime allows')
            for edge in self.class_edges(descriptor):
                base = edge['base']
                edge_public = public and edge['public']
                if origin is None:
                    if edge['virtual']:
                        child_anchor, child_position = base, 0
                    else:
                        child_anchor, child_position = anchor, position + edge['offset']
                else:
                    if edge['virtual']:
                        vptr = rtti.u24(target_bytes[position:position + 3])
                        displacement = rtti.u24(self.image.read(vptr + edge['offset'], 3))
                        if displacement & 0x800000:
                            displacement -= 0x1000000
                        child_position = position + displacement
                    else:
                        child_position = position + edge['offset']
                    child_anchor = None
                if base == catch:
                    key = (child_anchor, child_position)
                    found.setdefault(key, False)
                    found[key] = found[key] or edge_public
                visit(base, child_anchor, child_position, edge_public, level + 1)

        if origin is None:
            visit(root, root, 0, True, 1)
        else:
            visit(root, None, 0, True, 1)
        if len(found) != 1:
            return None
        (_, position), public = next(iter(found.items()))
        if not public:
            return None
        return (position if origin is not None else 0, True)

    def match(self, thrown, catch, value, target_bytes):
        """The model's conversion for a catch of type catch by a throw of thrown, or None. For a
        thrown pointer, value is its target address, or 0 for a null pointer, and target_bytes
        are the target's first bytes. For a thrown class object, target_bytes are the object's
        bytes, and value is None. The result is (mode, adjustment, converted value), where the
        converted value is None for a class object and is masked to the handler's width."""
        if catch == thrown:
            return (NONE, 0, value)
        catch_kind = self.address_point(catch)
        if catch_kind == 'marker':
            underlying = rtti.u24(self.image.read(catch + MARKER_UNDERLYING, 3))
            check(self.address_point(underlying) == 'pointer',
                  'a marker names a descriptor that is not a pointer')
            return (NONE, 0, value) if underlying == thrown else None
        thrown_kind = self.address_point(thrown)
        if thrown_kind == 'pointer':
            if catch_kind != 'pointer':
                return None
            width = PROGRAM if self.pointer_flags(thrown) & WIDE else DATA
            outcome = self.pointer_chain(thrown, catch)
            if outcome == 'convert':
                return (width, 0, value)
            if outcome == 'base':
                if value == 0:
                    found = self.walk(self.pointee(thrown), self.pointee(catch), None, None)
                    return (DATA, 0, 0) if found else None
                found = self.walk(self.pointee(thrown), self.pointee(catch), value, target_bytes)
                if found is None:
                    return None
                adjustment = found[0]
                return (DATA, adjustment, (value + adjustment) & 0xffff)
            return None
        if thrown_kind == 'fundamental' and self.is_nullptr(thrown) and catch_kind == 'pointer':
            return (NULL, 0, 0)
        if thrown_kind == 'class' and catch_kind == 'class':
            found = self.walk(thrown, catch, 0, target_bytes)
            return (NONE, found[0], None) if found else None
        return None


def pointer_value(data, width):
    return sum(data[HEADER_SIZE + i] << (8 * i) for i in range(width))


def verify(args):
    objdump = os.path.join(args.bin_dir, 'llvm-objdump')
    nm = os.path.join(args.bin_dir, 'llvm-nm')

    with open(args.image, 'rb') as handle:
        image_bytes = handle.read()
    anchor = aveh.symbol_address(nm, args.elf, aveh.ANCHOR)
    check(anchor is not None, 'the ELF lacks the metadata anchor')
    block = aveh.read_u(image_bytes, anchor, 3)
    functions, _ = aveh.decode_block(image_bytes, block)

    pads = {}
    for fn in functions:
        for site in fn['sites']:
            if site['action']:
                pads.setdefault(site['landing'], (fn, site['action']))
    check(pads, 'the packed block has no landing pads')

    elf = rtti.Elf(args.elf)
    model = Model(elf, rtti.Image(args.image))
    symbols = [name for name in (INSTALL, BEGIN, GET_PTR, END, FREE) if name in elf.symbols]
    returns = return_addresses(objdump, args.elf)
    names = symbols + ['0x%06x' % pc for pc in sorted(returns)]
    events = run_probe(args, names)

    current = None
    by_return = {}
    handlers = 0
    converted = 0
    nullptrs = 0
    begins = 0
    ends = 0
    frees = 0

    for event in events:
        name = event['name']
        regs = event['regs']
        data = event['bytes']
        if name == INSTALL:
            check(len(data) >= HEADER_SIZE,
                  'the installer header is %d bytes, not %d' % (len(data), HEADER_SIZE))
            if layout.state(data) != STATE_ENTERING_CATCH:
                continue
            pad = layout.context_pc(data)
            check(pad in pads, 'landing pad 0x%06x is not a landing pad of the packed block'
                  % pad)
            _, (_, entries) = pads[pad]
            selector = regs[5]
            recorded = layout.u16(data, layout.SELECTOR_OFFSET)
            check(selector != 0 and selector == recorded,
                  'handler installed with selector %d, but phase one recorded %d'
                  % (selector, recorded))
            clause = [entry for entry in entries if entry[0] == selector]
            check(len(clause) == 1, 'selector %d names no clause of its pad' % selector)
            catch = clause[0][1]
            thrown = rtti.u24(data[layout.TYPE_OFFSET:layout.TYPE_OFFSET + 3])
            size = layout.u16(data, layout.SIZE_OFFSET)
            check(size <= OBJECT_LIMIT, 'the thrown object has %d bytes, more than the probe reads'
                  % size)
            if model.address_point(thrown) == 'pointer':
                width = 3 if model.pointer_flags(thrown) & WIDE else 2
                check(size == width, 'a pointer of %d bytes has an object of %d bytes'
                      % (width, size))
                value = pointer_value(data, width)
                target = event['target_bytes']
                check(value == 0 or target is not None,
                      'the probe gave no target bytes for the pointer 0x%06x' % value)
            else:
                value = None
                target = data[HEADER_SIZE:HEADER_SIZE + size]
            for other_selector, other in entries:
                if other_selector == selector:
                    break
                check(other != 0, 'a catch-all precedes the selected clause')
                check(model.match(thrown, other, value, target) is None,
                      'clause 0x%06x matches thrown 0x%06x before the selected clause'
                      % (other, thrown))
            if catch == 0:
                mode, adjustment, converted_value = NONE, 0, value
            else:
                expected = model.match(thrown, catch, value, target)
                check(expected is not None,
                      'selected clause 0x%06x does not match thrown 0x%06x' % (catch, thrown))
                mode, adjustment, converted_value = expected
            recorded_mode = layout.conversion_mode(data)
            recorded_adjustment = layout.u16(data, layout.ADJUSTMENT_OFFSET)
            check(recorded_mode == mode,
                  'conversion mode is %d, but the model gives %d for 0x%06x -> 0x%06x'
                  % (recorded_mode, mode, thrown, catch))
            check(recorded_adjustment == adjustment & 0xffff,
                  'handler adjustment is %d, but the model gives %d'
                  % (recorded_adjustment, adjustment & 0xffff))
            if mode == NONE:
                check(recorded_adjustment == 0, 'an exact handler has adjustment %d'
                      % recorded_adjustment)
            handlers += 1
            if mode != NONE:
                converted += 1
            if mode == NULL:
                nullptrs += 1
            print('  handler: thrown 0x%06x, catch 0x%06x, selector %d, mode %d, adjustment %d'
                  % (thrown, catch, selector, mode, adjustment))
            current = {'header': regs[4], 'mode': mode, 'adjustment': adjustment,
                       'value': converted_value, 'thrown': thrown, 'catch': catch,
                       'width': 3 if mode == PROGRAM else 2}
        elif name == GET_PTR or name == BEGIN:
            check(current is not None and current['header'] == regs[4],
                  '%s begins a header that no handler installed' % name)
            current['call'] = name
            if name == BEGIN:
                begins += 1
            by_return[event['record']] = dict(current)
        elif name == END:
            ends += 1
        elif name == FREE:
            frees += 1
        elif name.startswith('0x') and int(name, 16) in by_return:
            entry = by_return.pop(int(name, 16))
            header = entry['header']
            if entry['mode'] == NONE:
                address = header + HEADER_SIZE
            else:
                address = header + CONVERTED_OFFSET
            check(regs[4] == address & 0xffff,
                  'return from %s gives 0x%04x, expected 0x%04x'
                  % (entry['call'], regs[4], address & 0xffff))
            if entry['mode'] != NONE:
                if entry['mode'] == NULL:
                    expected_bytes = bytes(3)
                else:
                    expected_bytes = (entry['value'] & ((1 << (8 * entry['width'])) - 1)).to_bytes(
                        entry['width'], 'little')
                    expected_bytes += bytes(3 - entry['width'])
                held = bytes(event['bytes'][:3])
                check(held == expected_bytes,
                      'the converted buffer of %s holds %s, expected %s'
                      % (entry['call'], held.hex(), expected_bytes.hex()))
            print('  %s returned 0x%04x: header 0x%04x, mode %d, adjustment %d'
                  % (entry['call'], regs[4], header, entry['mode'], entry['adjustment']))

    check(handlers > 0, 'no handler was installed')
    check(converted > 0, 'no handler converted a pointer, so no conversion was checked')
    check(begins == handlers, '%d handlers but %d __cxa_begin_catch calls' % (handlers, begins))
    check(ends == handlers, '%d handlers but %d __cxa_end_catch calls' % (handlers, ends))
    check(frees == ends, '%d exceptions ended but %d were freed' % (ends, frees))
    print('eh_pointer_conversion_verify: %s: %d handlers verified, %d converted, %d null'
          % (os.path.basename(args.elf), handlers, converted, nullptrs))
    return handlers


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
        print('eh_pointer_conversion_verify: FAIL: %s' % error, file=sys.stderr)
        sys.exit(1)


if __name__ == '__main__':
    main()
