#!/usr/bin/env python3
"""Checks each class dynamic_cast of a linked AVM image against an independent hierarchy oracle.

The probe snapshots __dynamic_cast on entry and at its return. The entry snapshot gives the
verifier everything a cast's inputs and its hierarchy need, and it does not run the runtime:

  - r4, the source AS0 pointer, and the three bytes at it, which are the source's vptr;
  - r6:r7, the source descriptor, a 24-bit program address;
  - stack bytes 0-2, the destination descriptor, and bytes 3-4, the signed 16-bit src2dst hint,
    which begin at the caller's SP + 3 (the three-byte return record comes first);
  - guest RAM from 0x0100 through 0x0AFF, so the vptr of each subobject that a virtual edge
    passes through is available.

The return snapshot gives r4, the result. The verifier decodes each cast as follows:

  1. The source vptr names the vtable. The offset-to-top at vptr - 6 gives the complete object,
     and the descriptor at vptr - 3 gives its dynamic type. Both come from the packed image.
  2. It enumerates the physical subobjects of the complete object by walking the descriptors'
     base lists. A nonvirtual edge adds its static offset. A virtual edge reads the vptr of the
     containing subobject from captured RAM, and the signed displacement from the vtable slot at
     vptr + offset in the packed image. Subobjects are identified by (descriptor, AS0 address).
  3. It finds the source subobject by its descriptor and address. The expected result is the
     target that publicly contains it when exactly one distinct target does; otherwise the
     cross-cast whose source and target are both publicly reachable from the dynamic object when
     the target is unique; otherwise null.
  4. The hierarchy must contain the source subobject at its actual address. If it does not, the
     object representation is inconsistent, and the runtime aborts on the same condition. The
     verifier fails the image and never retries the enumeration from the source address.

The actual result must equal the expected address exactly. A null result is checked the same way:
it is accepted only where the oracle derives null, and a zero pointer alone is never accepted.
Virtual edges are never skipped. Any edge needed for an expected result that cannot be decoded
fails the image. The void* casts are checked against the complete object alone.

The runtime's algorithm is never used to compute an expected value. The optional --trace output
prints each decoded cast, including the virtual-base slot and displacement.
"""

import argparse
import os
import re
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)

import eh_rtti_verify as rtti  # noqa: E402

CLASS_CAST = '__dynamic_cast'
VOID_CAST = '__avm_dynamic_cast_to_void'
WINDOW_START = 0x0500
WINDOW_END = 0xfa00
ADDRESS_POINT = 6
RTTI_SLOT = 3
VPTR_SIZE = 3
RAM_START = 0x0100
RAM_END = 0x0b00
RAM_CAPTURE = '0100:0A00'
STACK_BYTES = 5
CLASS_KINDS = ('class', 'si', 'vmi')
MAX_NODES = 4096

# The probe prints one snapshot line for each event. The fields that the RTTI cast verifier reads
# are optional, so one regular expression also matches the lines of the other snapshots.
SNAPSHOT = re.compile(
    r'^snapshot (\S+) pc=0x[0-9a-f]+ sp=0x[0-9a-f]+ cycle=\d+ '
    r'regs=([0-9a-f,]+) record=0x([0-9a-f]+)(?: bytes=([0-9a-f]+))?'
    r'(?: stackargs=([0-9a-f]+))?(?: ram_start=([0-9a-f]{4}) ram=([0-9a-f]*))?',
    re.MULTILINE)
STATUS = 'status: debug_break'
SERIAL = re.compile(r' serial="([^"]*)"')
INSTRUCTION = re.compile(r'^\s*([0-9a-f]+):\s+(.*)$')


class Failure(Exception):
    pass


def check(condition, message):
    if not condition:
        raise Failure(message)


def u16(value):
    return value & 0xffff


def signed24(value):
    return value - 0x1000000 if value & 0x800000 else value


def signed16(value):
    return value - 0x10000 if value & 0x8000 else value


def u24_bytes(data):
    return data[0] | data[1] << 8 | data[2] << 16


def run_probe(args, names, extra):
    command = [args.probe, '--interpreter', args.interpreter, '--boundary', args.boundary,
               '--image', args.image, '--elf', args.elf, '--cycle-limit', '600000000'] + extra
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
        event = {
            'name': match.group(1),
            'regs': regs,
            'record': int(match.group(3), 16),
            'bytes': bytes.fromhex(match.group(4)) if match.group(4) else b'',
            'stackargs': bytes.fromhex(match.group(5)) if match.group(5) else None,
            'ram_start': int(match.group(6), 16) if match.group(6) else None,
            'ram': bytes.fromhex(match.group(7)) if match.group(7) is not None and
            match.group(6) else None,
        }
        events.append(event)
    return serial.group(1), events


def return_addresses(objdump, elf, helpers):
    """The address after each call of each helper, which is where its result is read."""
    returns = set()
    result = subprocess.run([objdump, '-d', '--no-show-raw-insn', elf],
                            capture_output=True, text=True)
    check(result.returncode == 0, 'llvm-objdump failed on %s' % elf)
    text = result.stdout
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


class Context:
    """The packed image, the ELF, the descriptors decoded so far, and one entry's captured RAM."""

    def __init__(self, elf, image):
        self.elf = elf
        self.image = image
        self.descriptors = {}
        self.ram = None

    def descriptor(self, address):
        """The class descriptor at address, decoded by the RTTI verifier's descriptor reader."""
        if address in self.descriptors:
            return self.descriptors[address]
        check(WINDOW_START <= address and address + 6 <= WINDOW_END,
              'the descriptor 0x%06x lies outside the flash window' % address)
        name = rtti.find_symbol_at(self.elf, '_ZTI', address)
        check(name is not None, 'no _ZTI descriptor at 0x%06x' % address)
        decoded = rtti.decode_descriptor(self.elf, self.image, name)
        check(decoded['kind'] in CLASS_KINDS,
              '%s at 0x%06x is a %s descriptor, not a class' % (name, address, decoded['kind']))
        decoded['name'] = name
        self.descriptors[address] = decoded
        return decoded

    def type_name(self, address):
        return rtti.find_symbol_at(self.elf, '_ZTI', address) or '?0x%06x' % address

    def ram_bytes(self, address, count):
        """Guest RAM as captured at the entry. Every byte must lie in the capture."""
        check(self.ram is not None, 'no RAM was captured for this entry')
        check(RAM_START <= address and address + count <= RAM_START + len(self.ram),
              'the RAM at 0x%04x (%d bytes) is outside the captured range 0x%04x-0x%04x'
              % (address, count, RAM_START, RAM_START + len(self.ram) - 1))
        offset = address - RAM_START
        return self.ram[offset:offset + count]

    def ram_u24(self, address):
        return u24_bytes(self.ram_bytes(address, VPTR_SIZE))


class Graph:
    """Physical subobjects of one complete object, identified by (descriptor, AS0 address)."""

    def __init__(self, root):
        self.root = root
        self.edges = {root: []}

    def add(self, parent, child, virtual, public, detail):
        self.edges[parent].append({'child': child, 'virtual': virtual, 'public': public,
                                   'detail': detail})


def enumerate_graph(ctx, root_type, root_address):
    """Walks every base edge from the root. Nothing here consults the runtime or its results."""
    graph = Graph((root_type, root_address))
    pending = [graph.root]
    while pending:
        key = pending.pop()
        type_address, address = key
        decoded = ctx.descriptor(type_address)
        for edge in decoded['edges']:
            if edge['virtual']:
                vptr = ctx.ram_u24(address)
                check(vptr >= ADDRESS_POINT,
                      'the vptr 0x%06x of the subobject at 0x%04x names no vtable'
                      % (vptr, address))
                slot = vptr + edge['offset']
                check(slot >= 0 and slot + VPTR_SIZE <= 0x1000000,
                      'the virtual-base slot 0x%06x for 0x%04x is outside program space'
                      % (slot, address))
                displacement = signed24(rtti.u24(ctx.image.read(slot, VPTR_SIZE)))
                child_address = address + displacement
                detail = {'vptr': vptr, 'slot': slot, 'displacement': displacement}
            else:
                child_address = address + edge['offset']
                detail = None
            check(0 <= child_address <= 0xffff,
                  'the base at %s offset %d of 0x%04x lies outside 16-bit RAM'
                  % (ctx.type_name(type_address), child_address - address, address))
            child = (edge['base'], child_address)
            ctx.descriptor(edge['base'])
            graph.add(key, child, edge['virtual'], edge['public'], detail)
            if child not in graph.edges:
                check(len(graph.edges) < MAX_NODES, 'the hierarchy has more than %d subobjects'
                      % MAX_NODES)
                graph.edges[child] = []
                pending.append(child)
    # A virtual base class occurs once in a complete object, however many paths reach it. Two
    # addresses for one virtual base mean that some displacement is wrong, even when the cast's
    # result does not depend on the extra subobject.
    located = {}
    for edges in graph.edges.values():
        for edge in edges:
            if not edge['virtual']:
                continue
            type_address, address = edge['child']
            previous = located.setdefault(type_address, address)
            check(previous == address,
                  'the virtual base %s is at 0x%04x and at 0x%04x in one complete object'
                  % (ctx.type_name(type_address), previous, address))
    return graph


def reach(graph, start, public_only=True):
    seen = {start}
    work = [start]
    while work:
        node = work.pop()
        for edge in graph.edges[node]:
            if public_only and not edge['public']:
                continue
            if edge['child'] not in seen:
                seen.add(edge['child'])
                work.append(edge['child'])
    return seen


def reach_flagged(graph, start):
    """Maps each subobject reachable from start to True when some path to it crosses a virtual edge.

    The walk runs over (subobject, crossed-a-virtual-edge) states, so each state is visited once."""
    flags = {}
    seen = set()
    work = [(start, False)]
    while work:
        state = work.pop()
        if state in seen:
            continue
        seen.add(state)
        node, crossed = state
        flags[node] = flags.get(node, False) or crossed
        for edge in graph.edges[node]:
            work.append((edge['child'], crossed or edge['virtual']))
    return flags


def expected_result(graph, source_key, dst_type):
    """The oracle's answer, from the enumerated subobjects alone. Returns (address, rule, facts)."""
    targets = [key for key in graph.edges if key[0] == dst_type]
    downcast = set()
    for target in targets:
        if source_key in reach(graph, target, public_only=True):
            downcast.add(target[1])
    if len(downcast) == 1:
        return next(iter(downcast)), 'downcast', targets, downcast
    root_reach = reach(graph, graph.root, public_only=True)
    if source_key in root_reach and len(targets) == 1 and targets[0] in root_reach:
        return targets[0][1], 'cross', targets, downcast
    return 0, 'null', targets, downcast


def involves_virtual(graph, source_key, targets):
    from_root = reach_flagged(graph, graph.root)
    if from_root.get(source_key, False):
        return True
    for target in targets:
        if from_root.get(target, False):
            return True
        if reach_flagged(graph, target).get(source_key, False):
            return True
    return False


def classify_cast(ctx, entry, ret):
    """Decodes one class cast and returns its record. Any failure raises Failure."""
    regs = entry['regs']
    check(len(regs) >= 8, 'the probe reported too few registers')
    source = regs[4]
    check(source <= 0xfffd, 'the source pointer 0x%04x leaves room for no vptr' % source)
    check(len(entry['bytes']) == VPTR_SIZE, 'the probe read no vptr at 0x%04x' % source)
    check(entry['stackargs'] is not None and len(entry['stackargs']) == STACK_BYTES,
          'the cast at 0x%04x has %s stack-argument bytes, not %d'
          % (source, None if entry['stackargs'] is None else len(entry['stackargs']),
             STACK_BYTES))
    check(entry['ram'] is not None and entry['ram_start'] == RAM_START and
          len(entry['ram']) == RAM_END - RAM_START,
          'the cast at 0x%04x has no complete RAM capture' % source)
    ctx.ram = entry['ram']

    vptr_bytes = entry['bytes']
    check(ctx.ram_bytes(source, VPTR_SIZE) == vptr_bytes,
          'the RAM at the source 0x%04x disagrees with the probe\'s vptr bytes' % source)
    vptr = u24_bytes(vptr_bytes)
    check(vptr >= ADDRESS_POINT, 'the vptr 0x%06x at 0x%04x is not a program address'
          % (vptr, source))
    check(regs[7] <= 0xff, 'the source descriptor register r7 holds 0x%04x, not 24 bits'
          % regs[7])
    source_type = regs[6] | (regs[7] << 16)
    stack = entry['stackargs']
    dst_type = u24_bytes(stack[0:3])
    hint = signed16(stack[3] | stack[4] << 8)
    ctx.descriptor(source_type)
    ctx.descriptor(dst_type)

    offset = signed24(rtti.u24(ctx.image.read(vptr - ADDRESS_POINT, VPTR_SIZE)))
    complete = source + offset
    check(0 <= complete <= 0xffff,
          'the complete object of 0x%04x lies outside 16-bit RAM' % source)
    dynamic_type = rtti.u24(ctx.image.read(vptr - RTTI_SLOT, VPTR_SIZE))
    check(dynamic_type != 0, 'the RTTI slot at 0x%06x is zero' % (vptr - RTTI_SLOT))
    ctx.descriptor(dynamic_type)

    # The hierarchy of the active vptr must hold the source subobject at its actual address. If
    # it does not, the object representation is inconsistent. The verifier never retries from
    # the source address, because the runtime does not.
    source_key = (source_type, source)
    graph = enumerate_graph(ctx, dynamic_type, complete)
    check(source_key in graph.edges,
          'the source 0x%04x of %s is absent from the hierarchy of %s rooted at 0x%04x'
          % (source, ctx.type_name(source_type), ctx.type_name(dynamic_type), complete))

    expected, rule, targets, downcast = expected_result(graph, source_key, dst_type)
    actual = ret['regs'][4]
    check(actual == expected,
          'cast of 0x%04x from %s to %s returned 0x%04x, the oracle expects 0x%04x (%s rule,'
          ' %d candidate%s, dynamic %s at 0x%04x)'
          % (source, ctx.type_name(source_type), ctx.type_name(dst_type), actual, expected,
             rule, len(targets), '' if len(targets) == 1 else 's',
             ctx.type_name(dynamic_type), complete))
    virtual = involves_virtual(graph, source_key, targets)
    ambiguous = expected == 0 and (len(targets) >= 2 or len(downcast) >= 2)
    return {
        'source': source, 'source_type': ctx.type_name(source_type),
        'dst_type': ctx.type_name(dst_type), 'hint': hint, 'vptr': vptr, 'offset': offset,
        'complete': complete, 'dynamic': ctx.type_name(dynamic_type), 'dynamic_type': dynamic_type,
        'source_type_address': source_type, 'dst_type_address': dst_type,
        'expected': expected, 'actual': actual, 'rule': rule,
        'virtual': virtual, 'ambiguous': ambiguous, 'secondary': offset != 0,
        'candidates': len(targets), 'downcasts': len(downcast),
        'virtual_edge': source_virtual_edge(graph, source_key),
    }


def source_virtual_edge(graph, source_key):
    """The virtual edge that enters the source subobject, with its containing subobject, for the
    trace. None when every path to the source is nonvirtual."""
    for parent, edges in graph.edges.items():
        for edge in edges:
            if edge['child'] == source_key and edge['virtual']:
                return {'containing': parent, 'detail': edge['detail']}
    return None


def decode_void(ctx, entry, ret):
    source = entry['regs'][4]
    check(source <= 0xfffd, 'the source pointer 0x%04x leaves room for no vptr' % source)
    check(len(entry['bytes']) == VPTR_SIZE, 'the probe read no vptr at 0x%04x' % source)
    vptr = u24_bytes(entry['bytes'])
    check(vptr >= ADDRESS_POINT, 'the vptr 0x%06x at 0x%04x is not a program address'
          % (vptr, source))
    offset = signed24(rtti.u24(ctx.image.read(vptr - ADDRESS_POINT, VPTR_SIZE)))
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


def pair_entries(events, helper, returns):
    """The entry and return snapshots of helper, paired by return address, in execution order."""
    pairs = []
    pending = None
    return_names = {'0x%06x' % address for address in returns}
    for event in events:
        if event['name'] == helper:
            check(pending is None, '%s was entered before the last call returned' % helper)
            pending = event
        elif pending is not None and event['name'] in return_names:
            check(event['name'] == '0x%06x' % pending['record'],
                  '%s with return PC 0x%06x returned to %s'
                  % (helper, pending['record'], event['name']))
            pairs.append((pending, event))
            pending = None
    check(pending is None, '%s never returned' % helper)
    return pairs


def capture(args):
    """Runs the probe twice. The first run finds each entry's return address, and the second
    snapshots every return with the RAM and stack-argument fields."""
    helpers = [h for h in (CLASS_CAST, VOID_CAST) if h in args.elf_symbols]
    _, entries = run_probe(args, helpers, ['--snapshot-bytes', '3'])
    entry_records = {h: sorted({e['record'] for e in entries if e['name'] == h}) for h in helpers}
    check(entry_records[CLASS_CAST], 'the run made no class dynamic_cast calls')
    returns = return_addresses(args.objdump, args.elf, helpers)
    for helper in helpers:
        returns |= set(entry_records[helper])
    names = [h for h in helpers]
    extra = ['--snapshot-bytes', '3', '--snapshot-stack-args', str(STACK_BYTES),
             '--snapshot-ram-range', RAM_CAPTURE]
    _, events = run_probe(args, names + ['0x%06x' % a for a in sorted(returns)], extra)
    return helpers, returns, events


def verify_casts(ctx, events, returns):
    """Decodes every class cast in events. Returns the records and the void-cast count."""
    pairs = pair_entries(events, CLASS_CAST, returns)
    records = []
    for entry, ret in pairs:
        ctx.ram = entry['ram']
        records.append(classify_cast(ctx, entry, ret))
    return records


def summarize(name, records, void_count):
    observed = len(records)
    fully = sum(1 for r in records if r['expected'] == r['actual'])
    virtual = sum(1 for r in records if r['virtual'])
    nulls = sum(1 for r in records if r['expected'] == 0 and r['actual'] == 0)
    nonzero = sum(1 for r in records if r['expected'] != 0 and r['actual'] == r['expected'])
    secondary = sum(1 for r in records if r['secondary'])
    ambiguous = sum(1 for r in records if r['ambiguous'])
    print('rtti_dynamic_cast_verify: %s' % name)
    print('  class casts observed: %d' % observed)
    print('  class casts fully verified: %d' % fully)
    print('  virtual-edge casts verified: %d' % virtual)
    print('  null results independently verified: %d' % nulls)
    print('  nonzero results independently verified: %d' % nonzero)
    print('  secondary-source casts verified: %d' % secondary)
    print('  ambiguous failures verified: %d' % ambiguous)
    print('  unverified casts: %d' % (observed - fully))
    print('  void* casts checked against the complete object: %d' % void_count)
    return {'observed': observed, 'fully': fully, 'virtual': virtual, 'null': nulls,
            'nonzero': nonzero, 'secondary': secondary,
            'ambiguous': ambiguous, 'unverified': observed - fully}


def print_trace(records, limit):
    shown = 0
    for record in records:
        if shown >= limit:
            break
        shown += 1
        print('  trace %d: source AS0 0x%04x, source RTTI %s (0x%06x), destination RTTI %s '
              '(0x%06x), src2dst hint %d'
              % (shown, record['source'], record['source_type'], record['source_type_address'],
                 record['dst_type'], record['dst_type_address'], record['hint']))
        print('    source vptr 0x%06x, signed offset-to-top %d, complete object 0x%04x, '
              'dynamic RTTI %s' % (record['vptr'], record['offset'], record['complete'],
                                   record['dynamic']))
        edge = record['virtual_edge']
        if edge is not None:
            print('    virtual base of containing subobject 0x%04x: its vptr 0x%06x, slot '
                  '0x%06x, displacement %d'
                  % (edge['containing'][1], edge['detail']['vptr'], edge['detail']['slot'],
                     edge['detail']['displacement']))
        print('    rule %s, expected 0x%04x, actual 0x%04x'
              % (record['rule'], record['expected'], record['actual']))


def verify(args):
    objdump = os.path.join(args.bin_dir, 'llvm-objdump')
    elf = rtti.Elf(args.elf)
    image = rtti.Image(args.image)
    check(CLASS_CAST in elf.symbols, 'the image does not define %s' % CLASS_CAST)
    args.elf_symbols = elf.symbols
    args.objdump = objdump
    helpers, returns, events = capture(args)

    ctx = Context(elf, image)
    records = verify_casts(ctx, events, returns)
    void_pairs = pair(events, VOID_CAST, returns,
                      lambda e, r: decode_void(ctx, e, r)) if VOID_CAST in helpers else []
    counts = summarize(os.path.relpath(args.image), records, len(void_pairs))
    print_trace(records, args.trace)

    check(counts['unverified'] == 0, '%d class casts were not fully verified'
          % counts['unverified'])
    check(counts['observed'] > 0, 'no class cast was observed')
    if args.expect:
        seen = {r['dynamic'] for r in records}
        for name in args.expect:
            check(name in seen, 'no cast saw dynamic type %s' % name)
    if args.secondary:
        check(counts['secondary'] > 0, 'no cast reached a nonzero offset-to-top')
    if args.high:
        for record in records:
            check(record['vptr'] > 0xffff, 'the vptr 0x%06x is not above 0xFFFF' % record['vptr'])
    for flag, key in [(args.min_virtual, 'virtual'), (args.min_null, 'null'),
                      (args.min_nonzero, 'nonzero')]:
        check(counts[key] >= flag, 'only %d %s casts verified, at least %d are required'
              % (counts[key], key, flag))
    print('  verified %d class casts against the independent oracle' % counts['fully'])


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
                        help='print the first N decoded class casts')
    parser.add_argument('--secondary', action='store_true',
                        help='require some cast to reach a nonzero offset-to-top')
    parser.add_argument('--high', action='store_true',
                        help='require every queried vptr to exceed 0xFFFF')
    parser.add_argument('--min-virtual', type=int, default=0,
                        help='require at least N casts whose oracle crosses a virtual edge')
    parser.add_argument('--min-null', type=int, default=0,
                        help='require at least N independently verified null results')
    parser.add_argument('--min-nonzero', type=int, default=0,
                        help='require at least N independently verified nonzero results')
    args = parser.parse_args()
    try:
        verify(args)
    except Failure as error:
        print('rtti_dynamic_cast_verify: FAIL: %s' % error, file=sys.stderr)
        sys.exit(1)


if __name__ == '__main__':
    main()
