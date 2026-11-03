#!/usr/bin/env python3
"""Checks each dynamic typeid of a linked AVM image against the emulator's RAM.

The probe snapshots __avm_typeid_from_object on entry and at each return. On entry the
AS0 object pointer is in r4, and the three bytes at it are the object's vptr, which
the probe reads from emulator RAM. On return r4 holds the std::type_info pointer. The
verifier decodes the same query without the runtime helper:

  1. the vptr, a 24-bit program address, read from the object's RAM bytes;
  2. the RTTI slot at vptr - 3, read from the packed image in program space;
  3. the _ZTI descriptor that the slot names, found in the ELF, which must lie in the
     flash window, so that its AS0 alias, P + 0x0600, is a 16-bit address;
  4. the returned pointer, which must equal that alias.

It also reads the offset-to-top at vptr - 6, so a query through a secondary base can be
tied to the complete object: the object address plus the offset is the complete
object's address. With --secondary, some query must reach a nonzero offset, and with
--high, every vptr must lie above 0xFFFF. The serial output of the image gives the
complete and secondary object addresses when the fixture prints them, and a
secondary query must name the secondary address, which differs from the complete one.
The helper itself is never used to compute an expected value.
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

HELPER = '__avm_typeid_from_object'
FLASH_DELTA = 0x0600
WINDOW_START = 0x0500
WINDOW_END = 0xfa00
ADDRESS_POINT = 6
SIGN_BIT = 0x800000

SNAPSHOT = re.compile(
    r'^snapshot (\S+) pc=0x[0-9a-f]+ sp=0x[0-9a-f]+ cycle=\d+ '
    r'regs=([0-9a-f,]+) record=0x([0-9a-f]+)(?: bytes=([0-9a-f]+))?',
    re.MULTILINE)
INSTRUCTION = re.compile(r'^\s*([0-9a-f]+):\s+(.*)$')
SERIAL = re.compile(r' serial="([^"]*)"')
STATUS = 'status: debug_break'


def signed24(value):
    return value - 0x1000000 if value & SIGN_BIT else value


def run_probe(args, names):
    command = [args.probe, '--interpreter', args.interpreter, '--boundary', args.boundary,
               '--image', args.image, '--elf', args.elf, '--cycle-limit', '600000000',
               '--snapshot-bytes', '3']
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
            'record': int(match.group(3), 16),
            'bytes': bytes.fromhex(match.group(4)) if match.group(4) else b'',
        })
    return serial.group(1), events


def return_addresses(objdump, elf):
    """The address after each call of the helper, which is where its result is read."""
    returns = set()
    after_call = False
    for line in aveh.run_tool(objdump, ['-d', '--no-show-raw-insn', elf]).splitlines():
        match = INSTRUCTION.match(line)
        if not match:
            continue
        if after_call:
            returns.add(int(match.group(1), 16))
            after_call = False
        if '<%s>' % HELPER in match.group(2):
            after_call = True
    check(returns, 'the image has no calls to %s' % HELPER)
    return returns


def decode_query(elf, image, entry, ret):
    """Decodes one query from RAM, the packed image, and the ELF. It never calls the
    runtime helper, so the result is an independent expectation."""
    obj = entry['regs'][4]
    check(obj <= 0xfffd, 'the object pointer 0x%04x leaves room for no vptr' % obj)
    check(len(entry['bytes']) == 3, 'the probe read no vptr at 0x%04x' % obj)
    vptr = rtti.u24(entry['bytes'])
    check(vptr >= 3 and vptr <= 0xffffff,
          'the vptr 0x%06x at 0x%04x is not a program address' % (vptr, obj))
    slot = vptr - 3
    descriptor = rtti.u24(image.read(slot, 3))
    check(descriptor != 0, 'the RTTI slot at 0x%06x is zero' % slot)
    check(WINDOW_START <= descriptor and descriptor + 6 <= WINDOW_END,
          'the RTTI slot at 0x%06x names 0x%06x, outside the flash window'
          % (slot, descriptor))
    name = rtti.find_symbol_at(elf, '_ZTI', descriptor)
    check(name is not None, 'no _ZTI descriptor at 0x%06x' % descriptor)
    alias = descriptor + FLASH_DELTA
    returned = ret['regs'][4]
    check(returned == alias,
          '%s: typeid at 0x%04x returned 0x%04x, but the descriptor aliases to 0x%04x'
          % (name, obj, returned, alias))
    offset = signed24(rtti.u24(image.read(vptr - ADDRESS_POINT, 3)))
    complete = (obj + offset) & 0xffff
    return {'object': obj, 'vptr_bytes': entry['bytes'], 'vptr': vptr, 'slot': slot,
            'slot_bytes': image.read(slot, 3), 'descriptor': descriptor, 'name': name,
            'alias': alias, 'returned': returned, 'offset': offset, 'complete': complete}


def print_trace(query):
    print('  object 0x%04x: vptr bytes %s -> vptr 0x%06x' % (
        query['object'], query['vptr_bytes'].hex(' '), query['vptr']))
    print('    RTTI slot 0x%06x holds bytes %s -> descriptor 0x%06x (%s)' % (
        query['slot'], query['slot_bytes'].hex(' '), query['descriptor'], query['name']))
    print('    AS0 alias 0x%04x; typeid returned 0x%04x; offset-to-top %d, complete 0x%04x'
          % (query['alias'], query['returned'], query['offset'], query['complete']))


def verify(args):
    objdump = os.path.join(args.bin_dir, 'llvm-objdump')
    elf = rtti.Elf(args.elf)
    image = rtti.Image(args.image)
    check(HELPER in elf.symbols, 'the image does not define %s' % HELPER)
    # A helper call can be a tail jump, as at O2, where the helper returns to the caller of
    # the function that jumps to it. Such a return is not at a call site of the helper, so
    # the first run records each entry's return PC, and the second run snapshots those too.
    _, entries = run_probe(args, [HELPER])
    entry_records = [e['record'] for e in entries if e['name'] == HELPER]
    check(entry_records, 'the run made no calls to %s' % HELPER)
    returns = return_addresses(objdump, args.elf) | set(entry_records)
    return_names = {'0x%06x' % address: address for address in sorted(returns)}

    _, events = run_probe(args, [HELPER] + list(return_names))
    queries = []
    pending = None
    for event in events:
        if event['name'] == HELPER:
            check(pending is None, 'a typeid call was entered before the last one returned')
            pending = event
        elif pending is not None and event['name'] in return_names:
            # A return site can also be a join point that ordinary code jumps to, so
            # the snapshot counts as a return only while the helper is running.
            check(return_names[event['name']] == pending['record'],
                  'a typeid call with return PC 0x%06x returned to 0x%06x'
                  % (pending['record'], return_names[event['name']]))
            queries.append(decode_query(elf, image, pending, event))
            pending = None
    check(pending is None, 'a typeid call never returned')
    check(queries, 'the run made no dynamic typeid calls')
    check(len(queries) == len(entry_records),
          '%d typeid calls were entered, but %d returned' % (len(entry_records), len(queries)))

    for query in queries[:args.trace]:
        print_trace(query)

    seen = set(query['name'] for query in queries)
    for name in args.expect:
        check(name in seen, '%s is never the dynamic type of a typeid query' % name)

    if args.secondary:
        # A query through a secondary subobject names it by its own address, which is
        # not the complete object's address. Its offset-to-top leads back to the complete
        # object, whose own primary query reports offset zero at that address.
        secondary = [q for q in queries if q['offset'] != 0]
        check(secondary, 'no query reached a nonzero offset-to-top, so no secondary '
                         'subobject was inspected')
        for query in secondary:
            check(query['object'] != query['complete'],
                  'the secondary subobject 0x%04x is the complete object address'
                  % query['object'])
            primary = [q for q in queries
                       if q['object'] == query['complete'] and q['offset'] == 0]
            check(primary, 'the complete object 0x%04x has no query of its own'
                  % query['complete'])
        print('  %d secondary quer%s: each reaches a complete object with its own primary query'
              % (len(secondary), 'y' if len(secondary) == 1 else 'ies'))
    if args.high:
        low = [q for q in queries if q['vptr'] <= 0xffff]
        check(not low, 'a vptr at or below 0xFFFF was used: 0x%06x'
              % (low[0]['vptr'] if low else 0))

    print('rtti_polymorphic_verify: %s: %d dynamic queries checked, %d distinct type(s)'
          % (os.path.basename(args.elf), len(queries), len(seen)))
    for name in sorted(seen):
        print('  dynamic type %s' % name)


def main():
    parser = argparse.ArgumentParser(description=__doc__.split('\n')[1])
    parser.add_argument('--bin-dir', required=True)
    parser.add_argument('--probe', required=True)
    parser.add_argument('--interpreter', required=True)
    parser.add_argument('--boundary', required=True)
    parser.add_argument('--image', required=True)
    parser.add_argument('--elf', required=True)
    parser.add_argument('--expect', action='append', default=[],
                        help='a _ZTI symbol that some query must return')
    parser.add_argument('--trace', type=int, default=0,
                        help='print the RAM-to-descriptor trace of the first N queries')
    parser.add_argument('--secondary', action='store_true',
                        help='require a query through a secondary subobject')
    parser.add_argument('--high', action='store_true',
                        help='require every vptr to lie above 0xFFFF')
    args = parser.parse_args()
    try:
        verify(args)
    except Failure as error:
        print('rtti_polymorphic_verify: FAIL: %s' % error, file=sys.stderr)
        sys.exit(1)


if __name__ == '__main__':
    main()
