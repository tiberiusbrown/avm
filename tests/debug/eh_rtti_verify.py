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

SHF_WRITE = 0x1
SHF_AVM_PROGSPACE = 0x10000000
SHF_AVM_DATASPACE = 0x20000000
SHT_SYMTAB = 2
SHN_UNDEF = 0
STB_WEAK = 2
SHN_LORESERVE = 0xff00

# Two 24-bit entries precede the address point that descriptors name.
ADDRESS_POINT = 6
HEADER_SIZE = 39
DESCRIPTOR_TYPE = re.compile(r'^_Z(T[IV]|TS)')

# The vtable that a descriptor names selects its layout. The class, fundamental,
# single-inheritance, and multiple-inheritance forms are the ones the fixtures use.
VTABLE_KINDS = {
    '_ZTVN10__cxxabiv117__class_type_infoE': 'class',
    '_ZTVN10__cxxabiv123__fundamental_type_infoE': 'class',
    '_ZTVN10__cxxabiv120__si_class_type_infoE': 'si',
    '_ZTVN10__cxxabiv121__vmi_class_type_infoE': 'vmi',
}


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
    if kind == 'class':
        size = 6
    elif kind == 'si':
        size = 9
    else:
        size = 10
    check(symbol['size'] >= size,
          '%s is %d bytes, smaller than its %s layout' % (name, symbol['size'], kind))
    raw = image.read(address, symbol['size'])

    type_name = find_symbol_at(elf, '_ZTS', u24(raw[3:6]))
    check(type_name is not None,
          '%s names no _ZTS object at 0x%06x' % (name, u24(raw[3:6])))
    check(image.cstring(u24(raw[3:6])) == name[len('_ZTI'):],
          '%s name bytes do not match its mangled name' % name)
    check(type_name == '_ZTS' + name[len('_ZTI'):],
          '%s points at %s' % (name, type_name))

    bases = []
    if kind == 'si':
        bases.append(u24(raw[6:9]))
    elif kind == 'vmi':
        count = u16(raw[8:10])
        size = 10 + 7 * count
        check(symbol['size'] >= size, '%s is too short for %d bases' % (name, count))
        raw = image.read(address, size)
        for i in range(count):
            base = 10 + 7 * i
            bases.append(u24(raw[base:base + 3]))
    for base in bases:
        check(find_symbol_at(elf, '_ZTI', base) is not None,
              '%s base 0x%06x names no _ZTI object' % (name, base))
    return {'address': address, 'vtable': vtable_name, 'name': type_name,
            'bases': bases, 'size': symbol['size']}


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
    type_address = u24(header[15:18])
    dtor = u24(header[18:21])
    check(type_address == descriptor,
          'captured type address 0x%06x is not %s at 0x%06x'
          % (type_address, args.thrown_type, descriptor))
    check(dtor == destructor,
          'captured destructor 0x%06x is not %s at 0x%06x'
          % (dtor, args.destructor, destructor))
    check(u16(header[21:23]) == args.size,
          'captured object size %d is not %d' % (u16(header[21:23]), args.size))
    check(header[23] == 0, 'a new exception header is not in the allocated state')
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
    for name in args.expect:
        info = decoded[name]
        bases = ', '.join('0x%06x' % b for b in info['bases']) or 'none'
        print('  %s at 0x%06x: %d bytes, address point of %s, name %s, bases %s'
              % (name, info['address'], info['size'], info['vtable'], info['name'],
                 bases))
    if args.probe:
        check(args.thrown_type and args.destructor and args.size and args.interpreter
              and args.boundary, 'the header check needs its probe arguments')
        check_header(args, elf)
    print('eh_rtti_verify: %s: %d RTTI objects in program space, %d descriptors decoded'
          % (os.path.basename(args.elf), count, len(decoded)))


if __name__ == '__main__':
    main()
