#!/usr/bin/env python3
"""Checks the flash-resident RTTI descriptors of linked AVM exception images.

The ELF supplies symbols and section flags. The descriptor bytes are read from the
packed image, which is what the device runs. Every descriptor is decoded from its
vtable kind, and each pointer must resolve to a defined symbol at its exact 24-bit
value. When a probe is given, the exception header that the throw shim captured is
read at __avm_eh_throw.
"""

import argparse
import os
import re
import struct
import subprocess
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import eh_runtime_layout as layout

SHF_WRITE = 0x1
SHF_AVM_PROGSPACE = 0x10000000
SHF_AVM_DATASPACE = 0x20000000
SHT_SYMTAB = 2
SHN_UNDEF = 0
STB_WEAK = 2
SHN_LORESERVE = 0xff00

# Two 24-bit entries precede the address point that descriptors name.
ADDRESS_POINT = 6
HEADER_SIZE = layout.HEADER_SIZE
DESCRIPTOR_TYPE = re.compile(r'^_Z(T[IV]|TS)')
# The low byte of a base entry's offset-and-flags word. Its other bits are reserved.
RTTI_BASE_VIRTUAL = 0x01
RTTI_BASE_PUBLIC = 0x02
RTTI_BASE_RESERVED = 0xfc

# The vtable that a descriptor names selects its layout. The class, fundamental, function,
# single-inheritance, multiple-inheritance, pointer, and marker forms are the ones the fixtures
# use. A pointer descriptor is 11 bytes: the address point, the type name, a u16 flag word, and the
# pointee. A marker is 9 bytes: the address point, three reserved zero bytes, and the pointer
# descriptor that it names, which a catch of a non-const pointer by reference matches exactly.
VTABLE_KINDS = {
    '_ZTVN10__cxxabiv117__class_type_infoE': 'class',
    '_ZTVN10__cxxabiv123__fundamental_type_infoE': 'class',
    '_ZTVN10__cxxabiv120__function_type_infoE': 'function',
    '_ZTVN10__cxxabiv120__si_class_type_infoE': 'si',
    '_ZTVN10__cxxabiv121__vmi_class_type_infoE': 'vmi',
    '_ZTVN10__cxxabiv119__pointer_type_infoE': 'pointer',
    '__avm_eh_exact_pointer_ref_type_info': 'marker',
}
# The sizes of the layouts. A VMI descriptor's base entries follow its 10-byte header.
KIND_SIZES = {'class': 6, 'function': 6, 'si': 9, 'vmi': 10, 'pointer': 11, 'marker': 9}
# The pointer flags that clang writes. CONST, VOLATILE, RESTRICT, INCOMPLETE, NOEXCEPT, and the AVM
# bit for a 24-bit representation. CLASS_INCOMPLETE belongs to member pointers, and any other bit is
# reserved.
POINTER_FLAGS_DEFINED = 0x01 | 0x02 | 0x04 | 0x08 | 0x40 | 0x80
POINTER_WIDE = 0x80
POINTER_NOEXCEPT = 0x40


def check(condition, message):
    if not condition:
        print('eh_rtti_verify: FAIL: ' + message, file=sys.stderr)
        sys.exit(1)


def u16(b):
    return b[0] | b[1] << 8


def u24(b):
    return b[0] | b[1] << 8 | b[2] << 16


def u32(b):
    return b[0] | b[1] << 8 | b[2] << 16 | b[3] << 24


class Elf:
    """A 32-bit little-endian AVM ELF with its section and symbol tables."""

    def __init__(self, path):
        with open(path, 'rb') as f:
            self.data = f.read()
        check(self.data[:4] == b'\x7fELF' and self.data[4] == 1,
              '%s is not a 32-bit ELF' % path)
        shoff = struct.unpack_from('<I', self.data, 0x20)[0]
        shentsize, shnum, shstrndx = struct.unpack_from('<HHH', self.data, 0x2e)
        raw = [struct.unpack_from('<IIIIIIIIII', self.data, shoff + i * shentsize)
               for i in range(shnum)]
        strtab = raw[shstrndx][4]
        self.sections = []
        for entry in raw:
            name = self._cstring(strtab + entry[0])
            self.sections.append({'name': name, 'type': entry[1], 'flags': entry[2],
                                  'addr': entry[3], 'offset': entry[4],
                                  'size': entry[5], 'link': entry[6]})
        self.symbols = {}
        self.undefined = []
        for section in self.sections:
            if section['type'] != SHT_SYMTAB:
                continue
            names = self.sections[section['link']]['offset']
            for i in range(section['size'] // 16):
                name_off, value, size, info, _, shndx = struct.unpack_from(
                    '<IIIBBH', self.data, section['offset'] + i * 16)
                name = self._cstring(names + name_off)
                if not name:
                    continue
                if shndx == SHN_UNDEF:
                    # A weak reference may stay unresolved, and the runtime
                    # uses weak references for optional hooks.
                    if info >> 4 != STB_WEAK:
                        self.undefined.append(name)
                    continue
                if shndx >= SHN_LORESERVE:
                    continue
                self.symbols.setdefault(name, []).append(
                    {'value': value, 'size': size, 'section': self.sections[shndx]})

    def _cstring(self, offset):
        end = self.data.index(b'\0', offset)
        return self.data[offset:end].decode()

    def section_for(self, symbol):
        return symbol['section']


class Image:
    """The packed image, which maps each program address to its byte."""

    def __init__(self, path):
        with open(path, 'rb') as f:
            self.data = f.read()

    def read(self, address, count):
        check(address + count <= len(self.data),
              'descriptor at 0x%x lies outside the image' % address)
        return self.data[address:address + count]

    def cstring(self, address):
        end = self.data.index(b'\0', address)
        return self.data[address:end].decode()


def defined(elf, name):
    matches = elf.symbols.get(name, [])
    check(len(matches) == 1, '%s must be defined exactly once, found %d'
          % (name, len(matches)))
    return matches[0]


def check_program_space(elf):
    """Every RTTI object is read-only program-space data."""
    count = 0
    for name, entries in elf.symbols.items():
        if not DESCRIPTOR_TYPE.match(name):
            continue
        for entry in entries:
            flags = entry['section']['flags']
            check(flags & SHF_AVM_PROGSPACE and not flags & SHF_AVM_DATASPACE,
                  '%s is not in program space' % name)
            check(not flags & SHF_WRITE,
                  '%s is in a writable section %s' % (name, entry['section']['name']))
            count += 1
    return count


def find_address_point(elf, value):
    """Returns the vtable symbol whose address point is value."""
    for name, kind in VTABLE_KINDS.items():
        for entry in elf.symbols.get(name, []):
            if entry['value'] + ADDRESS_POINT == value:
                return name, kind
    check(False, 'vtable pointer 0x%06x is not a known address point' % value)


def find_symbol_at(elf, prefix, value):
    for name, entries in elf.symbols.items():
        if not name.startswith(prefix):
            continue
        for entry in entries:
            if entry['value'] == value:
                return name
    return None


def decode_descriptor(elf, image, name):
    """Decodes one _ZTI object and resolves each of its pointers."""
    symbol = defined(elf, name)
    address = symbol['value']
    check(address <= 0xffffff, '%s is beyond the 24-bit program space' % name)
    vtable_name, kind = find_address_point(elf, u24(image.read(address, 3)))
    size = KIND_SIZES.get(kind, 6)
    check(symbol['size'] >= size,
          '%s is %d bytes, smaller than its %s layout' % (name, symbol['size'], kind))
    if kind == 'marker':
        # A marker has no type name. Its reserved bytes are zero, and it names one pointer.
        raw = image.read(address, symbol['size'])
        check(u24(raw[3:6]) == 0, '%s has nonzero reserved bytes' % name)
        check(symbol['size'] == size, '%s is %d bytes, not the %d of a marker'
              % (name, symbol['size'], size))
        pointee = u24(raw[6:9])
        check(find_symbol_at(elf, '_ZTI', pointee) is not None,
              '%s names no _ZTI object at 0x%06x' % (name, pointee))
        return {'address': address, 'vtable': vtable_name, 'name': None, 'bases': [],
                'edges': [], 'size': symbol['size'], 'kind': kind, 'pointee': pointee,
                'flags': None}
    raw = image.read(address, symbol['size'])
    if kind == 'pointer':
        # A pointer names its pointee through a flag word that holds only the defined bits.
        flags = u16(raw[6:8])
        check(flags & ~POINTER_FLAGS_DEFINED == 0,
              '%s sets undefined pointer flags 0x%04x' % (name, flags))
        pointee = u24(raw[8:11])
        check(find_symbol_at(elf, '_ZTI', pointee) is not None,
              '%s names no _ZTI object at 0x%06x' % (name, pointee))
        flags_name = name
        type_name = find_symbol_at(elf, '_ZTS', u24(raw[3:6]))
        check(type_name is not None,
              '%s names no _ZTS object at 0x%06x' % (name, u24(raw[3:6])))
        check(image.cstring(u24(raw[3:6])) == name[len('_ZTI'):],
              '%s name bytes do not match its mangled name' % name)
        return {'address': address, 'vtable': vtable_name, 'name': type_name, 'bases': [],
                'edges': [], 'size': symbol['size'], 'kind': kind, 'pointee': pointee,
                'flags': flags, 'flags_name': flags_name}

    type_name = find_symbol_at(elf, '_ZTS', u24(raw[3:6]))
    check(type_name is not None,
          '%s names no _ZTS object at 0x%06x' % (name, u24(raw[3:6])))
    check(image.cstring(u24(raw[3:6])) == name[len('_ZTI'):],
          '%s name bytes do not match its mangled name' % name)
    check(type_name == '_ZTS' + name[len('_ZTI'):],
          '%s points at %s' % (name, type_name))

    bases = []
    edges = []
    if kind == 'si':
        # An SI class has one public nonvirtual base at offset zero.
        bases.append(u24(raw[6:9]))
        edges.append({'base': bases[-1], 'offset': 0, 'public': True, 'virtual': False})
    elif kind == 'vmi':
        count = u16(raw[8:10])
        size = 10 + 7 * count
        check(symbol['size'] >= size, '%s is too short for %d bases' % (name, count))
        raw = image.read(address, size)
        for i in range(count):
            entry = 10 + 7 * i
            # The offset-and-flags word is 32 bits. Its low byte holds the flags, and
            # the upper 24 bits hold the signed offset.
            word = u32(raw[entry + 3:entry + 7])
            flags = word & 0xff
            check(flags & RTTI_BASE_RESERVED == 0,
                  '%s base %d sets reserved flag bits 0x%02x' % (name, i, flags))
            offset = word >> 8
            if offset & 0x800000:
                offset -= 0x1000000
            bases.append(u24(raw[entry:entry + 3]))
            edges.append({'base': bases[-1], 'offset': offset,
                          'public': bool(flags & RTTI_BASE_PUBLIC),
                          'virtual': bool(flags & RTTI_BASE_VIRTUAL)})
    for base in bases:
        check(find_symbol_at(elf, '_ZTI', base) is not None,
              '%s base 0x%06x names no _ZTI object' % (name, base))
    return {'address': address, 'vtable': vtable_name, 'name': type_name,
            'bases': bases, 'edges': edges, 'size': symbol['size'], 'kind': kind,
            'pointee': None, 'flags': None}


def check_pointer(elf, image, spec, decoded):
    """Checks one pointer descriptor against an expected flag word and pointee, given as
    NAME:FLAGS:POINTEE. FLAGS is an integer, which may be hexadecimal, and POINTEE is the
    _ZTI object that the pointer names. A pointer whose flags carry the AVM bit is a 24-bit
    program or function pointer, and a pointer with the noexcept bit names a function."""
    try:
        name, flags, pointee_name = spec.split(':')
    except ValueError:
        check(False, 'a pointer needs NAME:FLAGS:POINTEE, not %r' % spec)
    if name not in decoded:
        decoded[name] = decode_descriptor(elf, image, name)
    info = decoded[name]
    check(info['kind'] == 'pointer', '%s is a %s descriptor, not a pointer'
          % (name, info['kind']))
    expected = int(flags, 0)
    check(info['flags'] == expected, '%s has flags 0x%02x, expected 0x%02x'
          % (name, info['flags'], expected))
    check(info['pointee'] == defined(elf, pointee_name)['value'],
          '%s names pointee 0x%06x, expected %s' % (name, info['pointee'], pointee_name))
    if info['flags'] & POINTER_NOEXCEPT:
        check(decode_descriptor(elf, image, pointee_name)['kind'] == 'function',
              '%s is noexcept, but %s is not a function descriptor' % (name, pointee_name))
    print('  pointer %s at 0x%06x: %d bytes, flags 0x%02x%s, pointee %s at 0x%06x'
          % (name, info['address'], info['size'], info['flags'],
             ', AVM 24-bit' if info['flags'] & POINTER_WIDE else '',
             pointee_name, info['pointee']))


def check_marker(elf, image, spec, decoded):
    """Checks one marker descriptor against the pointer descriptor it names, given as
    NAME:POINTEE. The marker is nine bytes, and it is distinct from a class descriptor because
    its vtable is the marker support vtable."""
    try:
        name, pointee_name = spec.split(':')
    except ValueError:
        check(False, 'a marker needs NAME:POINTEE, not %r' % spec)
    if name not in decoded:
        decoded[name] = decode_descriptor(elf, image, name)
    info = decoded[name]
    check(info['kind'] == 'marker', '%s is a %s descriptor, not a marker'
          % (name, info['kind']))
    check(info['vtable'] == '__avm_eh_exact_pointer_ref_type_info',
          '%s uses vtable %s, not the marker vtable' % (name, info['vtable']))
    check(info['pointee'] == defined(elf, pointee_name)['value'],
          '%s names %s, expected %s' % (name, hex(info['pointee']), pointee_name))
    print('  marker %s at 0x%06x: %d bytes, names pointer 0x%06x (%s)'
          % (name, info['address'], info['size'], info['pointee'], pointee_name))


def check_edge(elf, image, spec, decoded):
    """Checks one base edge against an expected layout, given as
    DERIVED:BASE:OFFSET:ACCESS. ACCESS is public or nonpublic, and +virtual is appended
    for a virtual edge. A nonvirtual offset is the base's offset inside the derived class.
    A virtual offset is the signed displacement, in bytes, from the vtable address point
    of the derived class to the slot that holds the virtual base's offset, so it is
    reported as a vtable-slot displacement and never as an object offset."""
    try:
        derived, base_name, offset, access = spec.split(':')
    except ValueError:
        check(False, 'an edge needs DERIVED:BASE:OFFSET:ACCESS, not %r' % spec)
    visibility, _, virtual_flag = access.partition('+')
    check(visibility in ('public', 'nonpublic') and virtual_flag in ('', 'virtual'),
          'an access is public or nonpublic, with an optional +virtual, not %r' % access)
    if derived not in decoded:
        decoded[derived] = decode_descriptor(elf, image, derived)
    info = decoded[derived]
    base_address = defined(elf, base_name)['value']
    matches = [edge for edge in info['edges'] if edge['base'] == base_address]
    check(len(matches) == 1, '%s has %d edges to %s at 0x%06x, expected one'
          % (derived, len(matches), base_name, base_address))
    edge = matches[0]
    check(edge['offset'] == int(offset, 0),
          '%s -> %s has offset %d, expected %s'
          % (derived, base_name, edge['offset'], offset))
    check(edge['virtual'] == (virtual_flag == 'virtual'),
          '%s -> %s is %s, expected %s' % (derived, base_name,
                                          'virtual' if edge['virtual'] else 'nonvirtual',
                                          access))
    check(edge['public'] == (visibility == 'public'),
          '%s -> %s is %s, expected %s' % (derived, base_name,
                                          'public' if edge['public'] else 'nonpublic',
                                          visibility))
    label = 'vtable-slot displacement' if edge['virtual'] else 'object offset'
    print('  edge %s at 0x%06x -> %s at 0x%06x: %s %d, %s%s'
          % (derived, info['address'], base_name, base_address, label, edge['offset'],
             'public' if edge['public'] else 'nonpublic',
             ', virtual' if edge['virtual'] else ''))


def run_probe(args):
    """Returns the header bytes that the throw shim captured at __avm_eh_throw."""
    cmd = [args.probe, '--interpreter', args.interpreter, '--boundary', args.boundary,
           '--image', args.image, '--elf', args.elf, '--snapshot', '__avm_eh_throw',
           '--snapshot-bytes', str(HEADER_SIZE)]
    result = subprocess.run(cmd, capture_output=True, text=True)
    check('status: debug_break' in result.stdout,
          'the probe run did not finish cleanly')
    headers = [line for line in result.stdout.splitlines()
               if line.startswith('snapshot __avm_eh_throw ')]
    check(len(headers) == 1, 'expected one throw snapshot, found %d' % len(headers))
    match = re.search(r' bytes=([0-9a-f]+)$', headers[0])
    check(match is not None, 'the snapshot did not print header bytes')
    header = bytes.fromhex(match.group(1))
    check(len(header) == HEADER_SIZE, 'header snapshot is %d bytes' % len(header))
    return header


def check_header(args, elf):
    header = run_probe(args)
    descriptor = defined(elf, args.thrown_type)['value']
    destructor = defined(elf, args.destructor)['value']
    type_address = u24(header[layout.TYPE_OFFSET:layout.TYPE_OFFSET + 3])
    dtor = u24(header[layout.DESTRUCTOR_OFFSET:layout.DESTRUCTOR_OFFSET + 3])
    check(type_address == descriptor,
          'captured type address 0x%06x is not %s at 0x%06x'
          % (type_address, args.thrown_type, descriptor))
    check(dtor == destructor,
          'captured destructor 0x%06x is not %s at 0x%06x'
          % (dtor, args.destructor, destructor))
    check(u16(header[layout.SIZE_OFFSET:layout.SIZE_OFFSET + 2]) == args.size,
          'captured object size %d is not %d' % (u16(header[layout.SIZE_OFFSET:layout.SIZE_OFFSET + 2]), args.size))
    check(layout.state(header) == 0, 'a new exception header is not in the allocated state')
    print('  header: type 0x%06x, destructor 0x%06x, size %d'
          % (type_address, dtor, args.size))


def main():
    parser = argparse.ArgumentParser(description=__doc__.split('\n')[1])
    parser.add_argument('--elf', required=True)
    parser.add_argument('--image', required=True)
    parser.add_argument('--expect', action='append', default=[],
                        help='a descriptor that must be defined exactly once')
    parser.add_argument('--high', action='append', default=[],
                        help='a descriptor that must lie above program address 0xFFFF')
    parser.add_argument('--edge', action='append', default=[],
                        help='an expected base edge, DERIVED:BASE:OFFSET:ACCESS')
    parser.add_argument('--high-symbol', action='append', default=[],
                        help='a symbol, such as a vtable, that must lie above 0xFFFF')
    parser.add_argument('--pointer', action='append', default=[],
                        help='a pointer descriptor, NAME:FLAGS:POINTEE')
    parser.add_argument('--marker', action='append', default=[],
                        help='a reference marker, NAME:POINTEE')
    parser.add_argument('--probe', help='avm_eh_stack_probe, for the header check')
    parser.add_argument('--interpreter')
    parser.add_argument('--boundary')
    parser.add_argument('--thrown-type', help='descriptor of the header type')
    parser.add_argument('--destructor', help='destructor symbol in the header')
    parser.add_argument('--size', type=int, default=0,
                        help='object size recorded in the header')
    args = parser.parse_args()

    elf = Elf(args.elf)
    image = Image(args.image)
    check(not elf.undefined, 'the linked image has unresolved symbols: %s'
          % ', '.join(sorted(set(elf.undefined))[:8]))
    count = check_program_space(elf)
    decoded = {}
    for name in args.expect:
        decoded[name] = decode_descriptor(elf, image, name)
    for name in args.high:
        check(name in decoded, '%s was not expected, so it cannot be checked high'
              % name)
        check(decoded[name]['address'] > 0xffff,
              '%s is at 0x%06x, not above 0xFFFF' % (name, decoded[name]['address']))
    for name in args.high_symbol:
        address = defined(elf, name)['value']
        check(address > 0xffff, '%s is at 0x%06x, not above 0xFFFF' % (name, address))
        print('  %s at 0x%06x, above 0xFFFF' % (name, address))
    for name in args.expect:
        info = decoded[name]
        bases = ', '.join('0x%06x' % b for b in info['bases']) or 'none'
        print('  %s at 0x%06x: %d bytes, address point of %s, name %s, bases %s'
              % (name, info['address'], info['size'], info['vtable'], info['name'],
                 bases))
    for spec in args.edge:
        check_edge(elf, image, spec, decoded)
    for spec in args.pointer:
        check_pointer(elf, image, spec, decoded)
    for spec in args.marker:
        check_marker(elf, image, spec, decoded)
    if args.probe:
        check(args.thrown_type and args.destructor and args.size and args.interpreter
              and args.boundary, 'the header check needs its probe arguments')
        check_header(args, elf)
    print('eh_rtti_verify: %s: %d RTTI objects in program space, %d descriptors decoded'
          % (os.path.basename(args.elf), count, len(decoded)))


if __name__ == '__main__':
    main()
