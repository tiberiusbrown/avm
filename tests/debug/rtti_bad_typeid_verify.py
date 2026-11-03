#!/usr/bin/env python3
"""Checks the std::bad_typeid path of a linked AVM image against the ABI and the emulator.

The ELF and packed image give the ABI facts, and the names are those that the pinned
compiler emits, which spell the class std::10bad_typeid. The checks are:

  - the class descriptor, its vtable, and the exception base each occur once, and the
    descriptor is a single-inheritance class of std::exception in the flash window;
  - the vtable has offset-to-top zero, the descriptor as its RTTI entry, and three
    function entries that name the complete destructor, the deleting destructor, and
    what(), in that order, and each is a function in program space;
  - the runtime's placeholder support vtables keep their nine-byte placeholder form, so
    no normal class vtable replaced them;
  - no symbol of the class lies in data space, so the exception reserves no RAM.

The probe then follows each throw. A raise by __cxa_bad_typeid is followed by its begin
and end, the destructor that the end calls, and the free of the same header. The header
is read from the emulator's RAM at __cxa_begin_catch, so the thrown descriptor and the
destructor are the ones the catch sees. Each throw must be caught once and freed once.
"""

import argparse
import os
import re
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)

import eh_rtti_verify as rtti  # noqa: E402

check = rtti.check

RAISE = '__cxa_bad_typeid'
BEGIN = '__cxa_begin_catch'
END = '__cxa_end_catch'
FREE = 'free'
BAD_TYPEID = '_ZTISt10bad_typeid'
BAD_VTABLE = '_ZTVSt10bad_typeid'
BAD_NAME = '_ZTSSt10bad_typeid'
BAD_COMPLETE_DTOR = '_ZNSt10bad_typeidD1Ev'
BAD_DELETING_DTOR = '_ZNSt10bad_typeidD0Ev'
BAD_WHAT = '_ZNKSt10bad_typeid4whatEv'
EXCEPTION = '_ZTISt9exception'
EXCEPTION_NAME = '_ZTSSt9exception'
SI_PLACEHOLDER = '_ZTVN10__cxxabiv120__si_class_type_infoE'
CLASS_PLACEHOLDER = '_ZTVN10__cxxabiv117__class_type_infoE'
SHF_EXECINSTR = 0x4
SHF_AVM_DATASPACE = 0x20000000
ADDRESS_POINT = 6
VTABLE_ENTRY = 3
HEADER_SIZE = 55
TYPE_OFFSET = 15
DESTRUCTOR_OFFSET = 18
SIZE_OFFSET = 21
PLACEHOLDER_SIZE = 9
WINDOW_START = 0x0500
WINDOW_END = 0xfa00
FLASH_DELTA = 0x0600

SNAPSHOT = re.compile(
    r'^snapshot (\S+) pc=0x[0-9a-f]+ sp=0x[0-9a-f]+ cycle=\d+ '
    r'regs=([0-9a-f,]+) record=0x[0-9a-f]+(?: bytes=([0-9a-f]+))?',
    re.MULTILINE)
SERIAL = re.compile(r' serial="([^"]*)"')
STATUS = 'status: debug_break'


def once(elf, name):
    matches = elf.symbols.get(name, [])
    check(len(matches) == 1, '%s must be defined exactly once, found %d' % (name, len(matches)))
    return matches[0]


def text_symbol_at(elf, address):
    """The name of a function in program space at address, or None."""
    for name, entries in elf.symbols.items():
        for entry in entries:
            if entry['value'] == address and entry['section']['flags'] & SHF_EXECINSTR:
                return name
    return None


def check_abi(elf, image):
    descriptor = once(elf, BAD_TYPEID)
    address = descriptor['value']
    decoded = rtti.decode_descriptor(elf, image, BAD_TYPEID)
    exception = once(elf, EXCEPTION)
    check(decoded['bases'] == [exception['value']],
          '%s does not derive publicly from std::exception' % BAD_TYPEID)
    check(decoded['vtable'] == SI_PLACEHOLDER,
          '%s is not a single-inheritance descriptor' % BAD_TYPEID)
    check(WINDOW_START <= address and address + 6 <= WINDOW_END,
          '%s lies outside the flash window' % BAD_TYPEID)
    name = once(elf, BAD_NAME)
    check(WINDOW_START <= name['value'] and name['value'] + name['size'] <= WINDOW_END,
          '%s lies outside the flash window' % BAD_NAME)

    vtable = once(elf, BAD_VTABLE)
    raw = image.read(vtable['value'], vtable['size'])
    check(rtti.u24(raw[0:3]) == 0, '%s has a nonzero offset-to-top' % BAD_VTABLE)
    check(rtti.u24(raw[3:6]) == address, '%s does not name %s' % (BAD_VTABLE, BAD_TYPEID))
    entries = [rtti.u24(raw[i:i + 3]) for i in range(ADDRESS_POINT, len(raw), VTABLE_ENTRY)]
    expected = [once(elf, BAD_COMPLETE_DTOR)['value'], once(elf, BAD_DELETING_DTOR)['value'],
                once(elf, BAD_WHAT)['value']]
    check(entries[:3] == expected,
          '%s entries are %s, not the complete destructor, deleting destructor, and what()'
          % (BAD_VTABLE, ['0x%06x' % e for e in entries[:3]]))
    for value in expected:
        check(text_symbol_at(elf, value) is not None,
              'a %s entry 0x%06x is not a function in program space' % (BAD_VTABLE, value))

    # The runtime's support vtables keep their placeholder size. A normal class vtable of
    # the same name would be larger, and it would replace the placeholder.
    for placeholder in (SI_PLACEHOLDER, CLASS_PLACEHOLDER):
        if placeholder in elf.symbols:
            check(once(elf, placeholder)['size'] == PLACEHOLDER_SIZE,
                  '%s is not the %d-byte placeholder' % (placeholder, PLACEHOLDER_SIZE))

    base = rtti.decode_descriptor(elf, image, EXCEPTION)
    check(base['bases'] == [] and base['vtable'] == CLASS_PLACEHOLDER,
          '%s is not a plain class descriptor' % EXCEPTION)
    check(once(elf, EXCEPTION_NAME)['value'] >= WINDOW_START,
          '%s lies below the flash window' % EXCEPTION_NAME)

    for name in (BAD_TYPEID, BAD_NAME, BAD_VTABLE, EXCEPTION, EXCEPTION_NAME, BAD_COMPLETE_DTOR,
                 BAD_DELETING_DTOR, BAD_WHAT, RAISE):
        if name in elf.symbols:
            for entry in elf.symbols[name]:
                check(not entry['section']['flags'] & SHF_AVM_DATASPACE,
                      '%s is in data space, which would reserve RAM' % name)
    return decoded, address


def run_probe(args, names):
    command = [args.probe, '--interpreter', args.interpreter, '--boundary', args.boundary,
               '--image', args.image, '--elf', args.elf, '--cycle-limit', '600000000',
               '--snapshot-bytes', str(HEADER_SIZE)]
    for name in names:
        command += ['--snapshot', name]
    result = subprocess.run(command, capture_output=True, text=True)
    check(STATUS in result.stdout,
          'the probe run did not finish cleanly:\n%s' % result.stdout[-800:])
    serial = SERIAL.search(result.stdout)
    check(serial is not None, 'the probe printed no serial output')
    events = []
    for match in SNAPSHOT.finditer(result.stdout):
        events.append({
            'name': match.group(1),
            'regs': [int(v, 16) for v in match.group(2).split(',')],
            'bytes': bytes.fromhex(match.group(3)) if match.group(3) else b'',
        })
    return serial.group(1), events


def verify(args):
    elf = rtti.Elf(args.elf)
    image = rtti.Image(args.image)
    check(rtti.check_program_space(elf) > 0, 'the image has no RTTI objects')
    _, bad_address = check_abi(elf, image)
    destructor = once(elf, BAD_COMPLETE_DTOR)['value']

    names = [RAISE, BEGIN, END, FREE, '0x%06x' % destructor]
    serial, events = run_probe(args, names)
    check(serial.endswith('P\\n'), 'the run did not report success: %r' % serial)

    # Each throw is one raise, one begin, one end, one destructor call, and one free, in
    # that order. The destructor address is the complete destructor, and the free receives
    # the header that the begin received.
    throws = []
    current = None
    stage = ['raise', 'begin', 'end', 'destructor', 'free']
    for event in events:
        name = event['name']
        if name == RAISE:
            check(current is None, 'a throw began before the previous one was freed')
            current = {'stage': 1}
        elif name == BEGIN:
            check(current is not None and current['stage'] == 1,
                  'a catch began outside a raise')
            header = event['regs'][4]
            raw = event['bytes']
            check(len(raw) == HEADER_SIZE, 'the probe read %d header bytes' % len(raw))
            current.update({
                'header': header,
                'thrown': rtti.u24(raw[TYPE_OFFSET:TYPE_OFFSET + 3]),
                'destructor': rtti.u24(raw[DESTRUCTOR_OFFSET:DESTRUCTOR_OFFSET + 3]),
                'size': raw[SIZE_OFFSET] | (raw[SIZE_OFFSET + 1] << 8),
                'stage': 2})
        elif name == END:
            check(current is not None and current['stage'] == 2, 'an end without a begin')
            current['stage'] = 3
        elif name == '0x%06x' % destructor:
            check(current is not None and current['stage'] == 3,
                  'the destructor ran outside an end')
            current['stage'] = 4
        elif name == FREE:
            check(current is not None and current['stage'] == 4,
                  'a free without a destructor call')
            check(event['regs'][4] == current['header'],
                  'the free of 0x%04x does not release the caught header 0x%04x'
                  % (event['regs'][4], current['header']))
            current['stage'] = 5
            throws.append(current)
            current = None
    check(current is None, 'a throw was never freed')
    check(throws, 'the run made no std::bad_typeid throws')
    check(len(throws) == args.throws,
          'the run threw %d std::bad_typeid, not the expected %d' % (len(throws), args.throws))
    for throw in throws:
        check(throw['thrown'] == bad_address,
              'a catch received descriptor 0x%06x, not %s' % (throw['thrown'], BAD_TYPEID))
        check(throw['destructor'] == destructor,
              'a catch received destructor 0x%06x, not the complete destructor'
              % throw['destructor'])
        check(throw['size'] == 3, 'the exception object is %d bytes, not 3' % throw['size'])

    first = throws[0]
    print('  first throw: header 0x%04x, thrown descriptor 0x%06x (alias 0x%04x), '
          'destructor 0x%06x, object %d bytes'
          % (first['header'], first['thrown'], first['thrown'] + FLASH_DELTA,
             first['destructor'], first['size']))
    print('rtti_bad_typeid_verify: %s: %d throws, each caught once, destroyed once, freed once'
          % (os.path.basename(args.elf), len(throws)))


def main():
    parser = argparse.ArgumentParser(description=__doc__.split('\n')[1])
    parser.add_argument('--probe', required=True)
    parser.add_argument('--interpreter', required=True)
    parser.add_argument('--boundary', required=True)
    parser.add_argument('--image', required=True)
    parser.add_argument('--elf', required=True)
    parser.add_argument('--throws', type=int, required=True,
                        help='the number of std::bad_typeid throws the fixture makes')
    args = parser.parse_args()
    verify(args)


if __name__ == '__main__':
    main()
