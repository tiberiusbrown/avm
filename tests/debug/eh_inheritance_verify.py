#!/usr/bin/env python3
"""Checks the base-class catches of an eh_inheritance image against the emulator.

The probe reports each installation of a landing context, and each return from
__cxa_begin_catch and __cxa_get_exception_ptr. The expected base offsets come from the
RTTI edges of the packed image, walked here, and not from the runtime's matcher. The
check reads the packed AVEH4 block and the machine code to confirm, for each handler,
that:

  - the header holds the thrown descriptor, and the selector that phase one recorded
    equals the selector in r5 at the installer;
  - the pad's action list names that selector, and every clause before it is a typed
    clause that does not match, so the selected clause is the first match;
  - the handler adjustment equals the byte offset of the unique public nonvirtual base
    subobject, or zero for an exact or catch-all clause;
  - the pointer returned by __cxa_get_exception_ptr and by __cxa_begin_catch is the
    header plus the header size, which is where the object begins, plus the adjustment,
    so the catch object is the selected subobject;
  - each handler is begun once, ended once, and its exception object is freed once.

The run must include a handler with a nonzero adjustment, and the run must end with
the success report.
"""

import argparse
import os
import re
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)

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

HEADER_SIZE = 43
# Program-space and stack layout of the guest, as llvm/BinaryFormat/AVM.h defines it.
STACK_BASE = 0x900
STACK_TOP = 0xa00
STATE_ENTERING_CATCH = 4
MAX_LEVELS = 8

CLASS_VTABLES = {
    '_ZTVN10__cxxabiv117__class_type_infoE',
    '_ZTVN10__cxxabiv120__si_class_type_infoE',
    '_ZTVN10__cxxabiv121__vmi_class_type_infoE',
}

SNAPSHOT = re.compile(
    r'^snapshot (\S+) pc=0x[0-9a-f]+ sp=0x([0-9a-f]+) cycle=\d+ '
    r'regs=([0-9a-f,]+) record=0x([0-9a-f]+)(?: bytes=([0-9a-f]+))?',
    re.MULTILINE)
INSTRUCTION = re.compile(r'^\s*([0-9a-f]+):\s+(.*)$')


class Unsupported(Exception):
    """A virtual edge: the clause does not match, as the runtime treats it."""


def run_probe(args, names):
    command = [args.probe, '--interpreter', args.interpreter, '--boundary', args.boundary,
               '--image', args.image, '--elf', args.elf, '--cycle-limit', '600000000',
               '--snapshot-bytes', str(HEADER_SIZE)]
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
            'sp': int(match.group(2), 16),
            'regs': [int(v, 16) for v in match.group(3).split(',')],
            'record': int(match.group(4), 16),
            'bytes': bytes.fromhex(match.group(5)) if match.group(5) else b'',
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


class Reference:
    """Expected clause matches, from the RTTI edges of the packed image."""

    def __init__(self, elf, image):
        self.elf = elf
        self.image = image
        self.decoded = {}

    def decode(self, address):
        name = rtti.find_symbol_at(self.elf, '_ZTI', address)
        check(name is not None, 'no RTTI object at 0x%06x' % address)
        if name not in self.decoded:
            self.decoded[name] = rtti.decode_descriptor(self.elf, self.image, name)
        return self.decoded[name]

    def is_class(self, address):
        """True when the descriptor at address is a class with base information. The
        address point is read directly, because the other kinds are not decoded."""
        point = rtti.u24(self.image.read(address, 3))
        for name in CLASS_VTABLES:
            for entry in self.elf.symbols.get(name, []):
                if entry['value'] + rtti.ADDRESS_POINT == point:
                    return True
        return False

    def adjustment(self, thrown, catch):
        """0 for an exact match, the offset of the unique public base for a base match,
        and None when the clause does not match."""
        if catch == thrown:
            return 0
        if not self.is_class(thrown) or not self.is_class(catch):
            return None
        found = []

        def visit(address, offset, public, level):
            check(level <= MAX_LEVELS, 'the reference walk is deeper than the runtime allows')
            if address == catch:
                found.append((offset, public))
            for edge in self.decode(address)['edges']:
                if edge['virtual']:
                    raise Unsupported()
                visit(edge['base'], offset + edge['offset'],
                      public and edge['public'], level + 1)

        try:
            visit(thrown, 0, True, 1)
        except Unsupported:
            return None
        if len(found) == 1 and found[0][1]:
            return found[0][0]
        return None


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
    # The probe refuses a symbol that the image lacks, and a catch by reference never
    # calls __cxa_get_exception_ptr, so only the symbols that the image defines are named.
    symbols = [name for name in (INSTALL, BEGIN, GET_PTR, END, FREE) if name in elf.symbols]
    returns = return_addresses(objdump, args.elf)
    names = symbols + ['0x%06x' % pc for pc in sorted(returns)]
    events = run_probe(args, names)

    reference = Reference(elf, rtti.Image(args.image))
    expected_returns = {}
    handlers = 0
    nonzero = 0
    begins = 0
    ends = 0
    frees = 0

    for event in events:
        name = event['name']
        regs = event['regs']
        data = event['bytes']
        if name == INSTALL:
            check(len(data) == HEADER_SIZE,
                  'the installer header is %d bytes, not %d' % (len(data), HEADER_SIZE))
            state = data[23]
            sp = data[0] | data[1] << 8
            check(STACK_BASE <= sp < STACK_TOP, 'landing SP 0x%04x is outside the stack' % sp)
            pad = data[2] | data[3] << 8 | data[4] << 16
            check(pad in pads, 'landing pad 0x%06x is not a landing pad of the packed block'
                  % pad)
            fn, (has_cleanup, entries) = pads[pad]
            if state != STATE_ENTERING_CATCH:
                continue
            selector = regs[5]
            recorded = data[39] | data[40] << 8
            check(selector != 0 and selector == recorded,
                  'handler installed with selector %d, but phase one recorded %d'
                  % (selector, recorded))
            thrown = rtti.u24(data[15:18])
            adjustment = data[41] | data[42] << 8
            clause = [entry for entry in entries if entry[0] == selector]
            check(len(clause) == 1, 'selector %d names no clause of its pad' % selector)
            catch = clause[0][1]
            for other_selector, other in entries:
                if other_selector == selector:
                    break
                check(other != 0, 'a catch-all precedes the selected clause')
                check(reference.adjustment(thrown, other) is None,
                      'clause 0x%06x matches thrown 0x%06x before the selected clause'
                      % (other, thrown))
            if catch == 0:
                expected = 0
            else:
                expected = reference.adjustment(thrown, catch)
                check(expected is not None,
                      'selected clause 0x%06x does not match thrown 0x%06x' % (catch, thrown))
            check(adjustment == expected,
                  'handler adjustment is %d, but the RTTI of 0x%06x gives %d'
                  % (adjustment, thrown, expected))
            if catch == thrown or catch == 0:
                check(adjustment == 0, 'an exact or catch-all handler has adjustment %d'
                      % adjustment)
            handlers += 1
            if adjustment:
                nonzero += 1
            print('  handler: thrown 0x%06x, catch 0x%06x, selector %d, adjustment %d'
                  % (thrown, catch, selector, adjustment))
        elif name == GET_PTR or name == BEGIN:
            check(len(data) == HEADER_SIZE, 'the header snapshot is %d bytes' % len(data))
            header = regs[4]
            adjustment = data[41] | data[42] << 8
            expected = header + HEADER_SIZE + adjustment
            check(expected <= 0xffff, 'adjusted object address overflows 16-bit RAM')
            if name == BEGIN:
                begins += 1
            expected_returns[event['record']] = (expected, header, adjustment, name)
        elif name == END:
            ends += 1
        elif name == FREE:
            frees += 1
        elif name.startswith('0x') and int(name, 16) in expected_returns:
            address = int(name, 16)
            expected, header, adjustment, call = expected_returns.pop(address)
            check(regs[4] == expected,
                  'return from the call at 0x%06x gives 0x%04x, expected 0x%04x'
                  % (address, regs[4], expected))
            print('  %s returned 0x%04x: header 0x%04x + %d + adjustment %d'
                  % (call, regs[4], header, HEADER_SIZE, adjustment))

    check(handlers > 0, 'no handler was installed')
    check(nonzero > 0, 'no handler has a nonzero adjustment, so no base was caught')
    check(begins == handlers, '%d handlers but %d __cxa_begin_catch calls' % (handlers, begins))
    check(ends == handlers, '%d handlers but %d __cxa_end_catch calls' % (handlers, ends))
    check(frees == ends, '%d exceptions ended but %d were freed' % (ends, frees))
    print('eh_inheritance_verify: %s: %d handlers verified, %d with a base adjustment'
          % (os.path.basename(args.elf), handlers, nonzero))


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
        print('eh_inheritance_verify: FAIL: %s' % error, file=sys.stderr)
        sys.exit(1)


if __name__ == '__main__':
    main()
