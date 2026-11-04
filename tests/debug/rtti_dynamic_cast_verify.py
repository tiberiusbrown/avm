#!/usr/bin/env python3
"""Checks each dynamic_cast of a linked AVM image against the emulator's RAM and the packed image.

The probe snapshots __dynamic_cast and __avm_dynamic_cast_to_void on entry and at each return.
On entry, the AS0 object pointer is in r4, and the three bytes at it are the object's vptr. The
destination RTTI descriptor is the 24-bit value in r6 and r7. The return value is in r4. The
verifier decodes each query without the runtime, from the probe's RAM bytes, the packed image, and
the ELF:

  1. the vptr at the object, a 24-bit program address, from RAM;
  2. the offset-to-top and the RTTI slot at vptr - 6 and vptr - 3, from the packed image;
  3. the complete object, the object address plus the offset-to-top, and the dynamic descriptor,
     which must be a _ZTI object in the flash window;
  4. the destination descriptor, which must be a _ZTI object in the ELF.

For a void* cast, the result must be the complete object. For a class cast, a nonnull result must
be the address that a subobject of the destination type has in the complete object. The verifier
enumerates those addresses from the packed image's base lists, along nonvirtual edges only. A
virtual edge needs the vptr of a subobject other than the object the probe samples, so such a
query is counted as unverified here, and the image-based corruption verifier checks the virtual
displacements. A null result is accepted without a check, because the ambiguity and the source
subobject are not visible at the entry. With --high, every queried vptr must exceed 0xFFFF.
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

CLASS_CAST = '__dynamic_cast'
VOID_CAST = '__avm_dynamic_cast_to_void'
FLASH_DELTA = 0x0600
WINDOW_START = 0x0500
WINDOW_END = 0xfa00
ADDRESS_POINT = 6
RTTI_SLOT = 3
MAX_PATH_DEPTH = 8

# The probe prints one snapshot line for each event, and the serial output ends the run.
SNAPSHOT = re.compile(
    r'^snapshot (\S+) pc=0x[0-9a-f]+ sp=0x[0-9a-f]+ cycle=\d+ '
    r'regs=([0-9a-f,]+) record=0x([0-9a-f]+)(?: bytes=([0-9a-f]+))?',
    re.MULTILINE)
INSTRUCTION = re.compile(r'^\s*([0-9a-f]+):\s+(.*)$')
SERIAL = re.compile(r' serial="([^"]*)"')
STATUS = 'status: debug_break'


def signed24(value):
    return value - 0x1000000 if value & 0x800000 else value


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
        regs = [int(v, 16) for v in match.group(2).split(',')]
        events.append({
            'name': match.group(1),
            'regs': regs,
            'record': int(match.group(3), 16),
            'bytes': bytes.fromhex(match.group(4)) if match.group(4) else b'',
        })
    return serial.group(1), events


def return_addresses(objdump, elf, helpers):
    """The address after each call of each helper, which is where its result is read."""
    returns = set()
    text = aveh.run_tool(objdump, ['-d', '--no-show-raw-insn', elf])
    after_call = False
    for line in text.splitlines():
        match = INSTRUCTION.match(line)
        if not match:
            continue
        if after_call:
            returns.add(int(match.group(1), 16))
            after_call = False
        if any('<%s>' % helper in match.group(2) for helper in helpers):
            after_call = True
    return returns


def descriptor_name(elf, address):
    return rtti.find_symbol_at(elf, '_ZTI', address)


def nonvirtual_offsets(elf, image, name, offset, depth, found):
    """Adds each subobject that a nonvirtual path from the complete object reaches, with its
    offset. Virtual edges are skipped, and the caller learns whether any were skipped."""
    found.setdefault(name, set()).add(offset)
    if depth >= MAX_PATH_DEPTH:
        return True
    decoded = rtti.decode_descriptor(elf, image, name)
    skipped = False
    for edge in decoded['edges']:
        if edge['virtual']:
            skipped = True
            continue
        base_name = descriptor_name(elf, edge['base'])
        check(base_name is not None, '%s names no _ZTI base at 0x%06x'
              % (name, edge['base']))
        if nonvirtual_offsets(elf, image, base_name, offset + edge['offset'], depth + 1,
                              found):
            skipped = True
    return skipped


def decode_query(elf, image, entry, ret, args):
    """Decodes one __dynamic_cast from RAM, the image, and the ELF. The runtime is never called.

    The probe reads the source type from r6:r7. The destination is passed on the stack, which the
    probe does not read, so the verifier checks the source subobject and the result instead."""
    regs = entry['regs']
    check(len(regs) >= 8, 'the probe reported too few registers')
    source = regs[4]
    check(source <= 0xfffd, 'the source pointer 0x%04x leaves room for no vptr' % source)
    check(len(entry['bytes']) == 3, 'the probe read no vptr at 0x%04x' % source)
    vptr = rtti.u24(entry['bytes'])
    check(vptr >= 6 and vptr <= 0xffffff,
          'the vptr 0x%06x at 0x%04x is not a program address' % (vptr, source))
    if args.high:
        check(vptr > 0xffff, 'the vptr 0x%06x is not above 0xFFFF' % vptr)

    offset = signed24(rtti.u24(image.read(vptr - ADDRESS_POINT, 3)))
    complete = source + offset
    check(0 <= complete <= 0xffff,
          'the complete object of 0x%04x lies outside 16-bit RAM' % source)

    dynamic_address = rtti.u24(image.read(vptr - RTTI_SLOT, 3))
    check(dynamic_address != 0, 'the RTTI slot at 0x%06x is zero' % (vptr - RTTI_SLOT))
    check(WINDOW_START <= dynamic_address and dynamic_address + 6 <= WINDOW_END,
          'the dynamic RTTI 0x%06x lies outside the flash window' % dynamic_address)
    dynamic = descriptor_name(elf, dynamic_address)
    check(dynamic is not None, 'no _ZTI descriptor at the dynamic RTTI 0x%06x' % dynamic_address)

    # The source descriptor is a 24-bit program address, so r7 holds only its top byte.
    check(regs[7] <= 0xff, 'the source descriptor register r7 holds 0x%04x, not a 24-bit value'
          % regs[7])
    source_type_address = regs[6] | (regs[7] << 16)
    source_type = descriptor_name(elf, source_type_address)
    check(source_type is not None,
          'the source type 0x%06x names no _ZTI descriptor' % source_type_address)

    found = {}
    skipped = nonvirtual_offsets(elf, image, dynamic, 0, 0, found)
    if not skipped:
        check(any(complete + o == source for o in found.get(source_type, set())),
              '%s at 0x%04x is not a subobject of %s at complete 0x%04x'
              % (source_type, source, dynamic, complete))
    returned = ret['regs'][4]
    if returned != 0:
        addresses = {complete + o for offsets in found.values() for o in offsets}
        check(skipped or returned in addresses,
              'the result 0x%04x from 0x%04x is no subobject of %s at complete 0x%04x'
              % (returned, source, dynamic, complete))
    return {
        'source': source, 'source_type': source_type, 'vptr': vptr, 'offset': offset,
        'complete': complete, 'dynamic': dynamic, 'returned': returned,
        'verified': not skipped,
    }


def decode_void(elf, image, entry, ret):
    source = entry['regs'][4]
    check(source <= 0xfffd, 'the source pointer 0x%04x leaves room for no vptr' % source)
    check(len(entry['bytes']) == 3, 'the probe read no vptr at 0x%04x' % source)
    vptr = rtti.u24(entry['bytes'])
    check(vptr >= 6, 'the vptr 0x%06x at 0x%04x is not a program address' % (vptr, source))
    offset = signed24(rtti.u24(image.read(vptr - ADDRESS_POINT, 3)))
    complete = source + offset
    check(0 <= complete <= 0xffff, 'the complete object of 0x%04x lies outside RAM' % source)
    check(ret['regs'][4] == complete,
          'dynamic_cast<void*> at 0x%04x returned 0x%04x, not the complete object 0x%04x'
          % (source, ret['regs'][4], complete))
    return {'source': source, 'vptr': vptr, 'offset': offset, 'complete': complete}


def pair(events, helper, returns, decode):
    """Pairs each entry of helper with the return snapshot that follows it."""
    queries = []
    pending = None
    return_names = {'0x%06x' % address: address for address in sorted(returns)}
    for event in events:
        if event['name'] == helper:
            check(pending is None, '%s was entered before the last call returned' % helper)
            pending = event
        elif pending is not None and event['name'] in return_names:
            check(return_names[event['name']] == pending['record'],
                  '%s with return PC 0x%06x returned to 0x%06x'
                  % (helper, pending['record'], return_names[event['name']]))
            queries.append(decode(pending, event))
            pending = None
    check(pending is None, '%s never returned' % helper)
    return queries


def verify(args):
    objdump = os.path.join(args.bin_dir, 'llvm-objdump')
    elf = rtti.Elf(args.elf)
    image = rtti.Image(args.image)
    check(CLASS_CAST in elf.symbols, 'the image does not define %s' % CLASS_CAST)
    # An image with no dynamic_cast<void*> does not define its helper, so only the defined
    # entry points are probed.
    helpers = [h for h in (CLASS_CAST, VOID_CAST) if h in elf.symbols]

    # The first run records the entries, which also catches a tail-jumped call whose return is
    # not at a call site. The second run snapshots each recorded return as well.
    _, entries = run_probe(args, helpers)
    entry_records = {h: [e['record'] for e in entries if e['name'] == h] for h in helpers}
    check(entry_records[CLASS_CAST], 'the run made no class dynamic_cast calls')
    returns = return_addresses(objdump, args.elf, helpers)
    for helper in helpers:
        returns |= set(entry_records[helper])
    return_names = ['0x%06x' % address for address in sorted(returns)]

    _, events = run_probe(args, helpers + return_names)
    class_queries = pair(events, CLASS_CAST, returns,
                         lambda e, r: decode_query(elf, image, e, r, args))
    void_queries = (pair(events, VOID_CAST, returns, lambda e, r: decode_void(elf, image, e, r))
                    if VOID_CAST in helpers else [])
    check(len(class_queries) == len(entry_records[CLASS_CAST]),
          '%d class casts were entered, but %d returned'
          % (len(entry_records[CLASS_CAST]), len(class_queries)))

    verified = 0
    for query in class_queries[:args.trace]:
        print('  cast from 0x%04x as %s vptr 0x%06x offset %d complete 0x%04x dynamic %s '
              'returned 0x%04x' % (query['source'], query['source_type'], query['vptr'],
                                   query['offset'], query['complete'], query['dynamic'],
                                   query['returned']))
    for query in class_queries:
        verified += 1 if query['verified'] else 0
    if args.expect:
        seen = {q['dynamic'] for q in class_queries}
        for name in args.expect:
            check(name in seen, 'no cast saw dynamic type %s' % name)
    if args.secondary:
        check(any(q['offset'] != 0 for q in class_queries) or
              any(q['offset'] != 0 for q in void_queries),
              'no cast reached a nonzero offset-to-top')
    print('rtti_dynamic_cast_verify: %d class casts (%d fully verified along nonvirtual edges), '
          '%d void* casts checked against the complete object'
          % (len(class_queries), verified, len(void_queries)))


def main():
    parser = argparse.ArgumentParser(description=__doc__.split('\n')[1])
    parser.add_argument('--bin-dir', required=True)
    parser.add_argument('--probe', required=True)
    parser.add_argument('--interpreter', required=True)
    parser.add_argument('--boundary', required=True)
    parser.add_argument('--image', required=True)
    parser.add_argument('--elf', required=True)
    parser.add_argument('--expect', action='append', default=[],
                        help='a dynamic type that some cast must see, by its _ZTI name')
    parser.add_argument('--trace', type=int, default=0,
                        help='print the first N class casts')
    parser.add_argument('--secondary', action='store_true',
                        help='require some cast to reach a nonzero offset-to-top')
    parser.add_argument('--high', action='store_true',
                        help='require every queried vptr to exceed 0xFFFF')
    args = parser.parse_args()
    verify(args)


if __name__ == '__main__':
    try:
        main()
    except Failure as error:
        print('rtti_dynamic_cast_verify: %s' % error, file=sys.stderr)
        sys.exit(1)
