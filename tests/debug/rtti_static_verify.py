#!/usr/bin/env python3
"""Checks the flash-window RTTI of a linked AVM image for static typeid.

The ELF gives the symbols and section placement. Each descriptor is decoded from the
packed image, which is what the device runs: its vtable address point, its three-byte
type-name pointer, and the name's bytes. Each name must lie in the flash window, so
its AS0 alias, which adds 0x0600 to the program address, is a valid 16-bit address.
Each --observed value is a window object whose two bytes must hold the alias of
its descriptor, so a constant typeid initializer is checked too.
"""

import argparse
import struct
import sys

FLASH_DELTA = 0x0600
WINDOW_START = 0x0500  # First program address with an AS0 alias.
WINDOW_END = 0xFA00  # One past the last program address with an alias.
SHF_WRITE = 0x1
SHF_EXECINSTR = 0x4
SHF_AVM_DATASPACE = 0x20000000
SHF_AVM_PROGSPACE = 0x10000000
SHT_PROGBITS = 1
SHT_SYMTAB = 2
SHN_UNDEF = 0
SHN_LORESERVE = 0xff00
STB_WEAK = 2
RTTI_SECTION = '.avm.rtti'
# A descriptor's vtable address point lies six bytes past its support vtable symbol.
ADDRESS_POINT = 6
SUPPORT_VTABLES = (
    '_ZTVN10__cxxabiv123__fundamental_type_infoE',
    '_ZTVN10__cxxabiv117__class_type_infoE',
    '_ZTVN10__cxxabiv120__si_class_type_infoE',
    '_ZTVN10__cxxabiv121__vmi_class_type_infoE',
    '_ZTVN10__cxxabiv119__pointer_type_infoE',
    '_ZTVN10__cxxabiv120__function_type_infoE',
    '_ZTVN10__cxxabiv129__pointer_to_member_type_infoE',
    '_ZTVN10__cxxabiv117__array_type_infoE',
)


def check(condition, message):
    if not condition:
        print('rtti_static_verify: error: ' + message, file=sys.stderr)
        sys.exit(1)


class Elf:
    """A 32-bit little-endian AVM ELF with its sections and defined symbols."""

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
            self.sections.append({'name': self._cstring(strtab + entry[0]),
                                  'type': entry[1], 'flags': entry[2],
                                  'addr': entry[3], 'offset': entry[4],
                                  'size': entry[5], 'link': entry[6]})
        self.symbols = {}
        for section in self.sections:
            if section['type'] != SHT_SYMTAB:
                continue
            names = self.sections[section['link']]['offset']
            for i in range(section['size'] // 16):
                name_off, value, size, info, _, shndx = struct.unpack_from(
                    '<IIIBBH', self.data, section['offset'] + i * 16)
                name = self._cstring(names + name_off)
                if not name or shndx == SHN_UNDEF or shndx >= SHN_LORESERVE:
                    continue
                self.symbols.setdefault(name, []).append(
                    {'value': value, 'size': size, 'section': self.sections[shndx]})

    def _cstring(self, offset):
        end = self.data.index(b'\0', offset)
        return self.data[offset:end].decode()


class Image:
    """The packed image, where program address P is the byte at image offset P."""

    def __init__(self, path):
        with open(path, 'rb') as f:
            self.data = f.read()

    def read(self, address, count):
        check(address >= 0 and address + count <= len(self.data),
              'bytes at image offset 0x%X lie outside the image' % address)
        return self.data[address:address + count]

    def cstring(self, address):
        end = self.data.index(b'\0', address)
        return self.data[address:end].decode()


def defined(elf, name):
    matches = elf.symbols.get(name, [])
    check(len(matches) == 1, '%s must be defined exactly once, found %d'
          % (name, len(matches)))
    return matches[0]


def u24(b):
    return b[0] | b[1] << 8 | b[2] << 16


def window_alias(address, size):
    """Returns the AS0 alias of a program object that must lie in the window."""
    check(address >= WINDOW_START and address + size <= WINDOW_END,
          'program object at 0x%06X (%d bytes) is outside the flash window'
          % (address, size))
    return address + FLASH_DELTA


def check_layout(elf):
    sections = [s for s in elf.sections if s['name'] == RTTI_SECTION]
    if not sections:
        return None
    section = sections[0]
    check(section['type'] == SHT_PROGBITS, '.avm.rtti must be SHT_PROGBITS')
    check(section['flags'] & SHF_AVM_PROGSPACE, '.avm.rtti must be program-space')
    check(not section['flags'] & (SHF_WRITE | SHF_EXECINSTR),
          '.avm.rtti must be read-only and nonexecutable')
    end = section['addr'] + section['size']
    check(section['addr'] >= WINDOW_START and end <= WINDOW_END,
          '.avm.rtti spans 0x%06X-0x%06X, outside the flash window'
          % (section['addr'], end))
    return section


def check_descriptor(elf, image, name, support_points):
    """Decodes one descriptor and its name. Returns the two AS0 aliases."""
    typename = '_ZTS' + name[len('_ZTI'):]
    descriptor = defined(elf, name)
    name_symbol = defined(elf, typename)
    check(descriptor['section']['name'] == RTTI_SECTION,
          '%s must be in %s, found %s'
          % (name, RTTI_SECTION, descriptor['section']['name']))
    check(name_symbol['section']['name'] == RTTI_SECTION,
          '%s must be in %s, found %s'
          % (typename, RTTI_SECTION, name_symbol['section']['name']))
    alias = window_alias(descriptor['value'], descriptor['size'])

    raw = image.read(descriptor['value'], descriptor['size'])
    vtable_point = u24(raw[0:3])
    check(vtable_point in support_points,
          '%s names vtable address point 0x%06X, which is not a support vtable'
          % (name, vtable_point))
    name_address = u24(raw[3:6])
    check(name_address == name_symbol['value'],
          '%s names type name 0x%06X, but %s is at 0x%06X'
          % (name, name_address, typename, name_symbol['value']))
    name_alias = window_alias(name_address, name_symbol['size'])
    mangled = image.cstring(name_address)
    check(mangled == typename[len('_ZTS'):],
          '%s stores %r, which does not match its symbol' % (name, mangled))
    check(image.read(name_address + len(mangled), 1) == b'\0',
          '%s is not NUL-terminated' % typename)
    return alias, name_alias, mangled


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--elf', required=True)
    parser.add_argument('--image', required=True)
    parser.add_argument('--expect', action='append', default=[],
                        help='a typeid descriptor symbol, such as _ZTI5Alpha')
    parser.add_argument('--observed', action='append', default=[],
                        help='SYMBOL=_ZTIxxx: a window object holding that alias')
    parser.add_argument('--forbid', action='append', default=[],
                        help='a symbol the image must not define, such as malloc')
    args = parser.parse_args()

    elf = Elf(args.elf)
    image = Image(args.image)
    layout = check_layout(elf)
    check(layout is not None or not args.expect,
          'the image has no .avm.rtti section for its typeid descriptors')

    support_points = set()
    for vtable in SUPPORT_VTABLES:
        if vtable in elf.symbols:
            support_points.add(defined(elf, vtable)['value'] + ADDRESS_POINT)

    aliases = {}
    for name in args.expect:
        alias, name_alias, mangled = check_descriptor(elf, image, name, support_points)
        aliases[name] = alias
        print('%s: descriptor 0x%06X alias 0x%04X; name %r alias 0x%04X'
              % (name, defined(elf, name)['value'], alias, mangled, name_alias))

    for spec in args.observed:
        symbol, _, descriptor = spec.partition('=')
        check(descriptor in aliases,
              '%s names %s, which is not in --expect' % (symbol, descriptor))
        window = defined(elf, symbol)
        check(not window['section']['flags'] & SHF_AVM_PROGSPACE,
              '%s must be a window object' % symbol)
        # A window object at AS0 address V is stored at image offset V - 0x0600.
        value = struct.unpack('<H', image.read(window['value'] - FLASH_DELTA, 2))[0]
        check(value == aliases[descriptor],
              '%s holds 0x%04X, but typeid names 0x%04X'
              % (symbol, value, aliases[descriptor]))
        print('%s: holds the typeid alias of %s' % (symbol, descriptor))

    # Each descriptor and name has one definition, and none is in data space.
    for symbol_name, matches in elf.symbols.items():
        if not symbol_name.startswith(('_ZTI', '_ZTS')):
            continue
        check(len(matches) == 1,
              '%s has %d definitions' % (symbol_name, len(matches)))
        check(not matches[0]['section']['flags'] & SHF_AVM_DATASPACE,
              '%s is in data space, not program space' % symbol_name)

    # typeid, equality, hashing, and name access never allocate, so the image must not
    # define the heap entry points.
    for symbol_name in args.forbid:
        check(symbol_name not in elf.symbols,
              'the image defines %s, which means a heap allocation is linked'
              % symbol_name)

    if layout is not None:
        print('.avm.rtti: 0x%06X-0x%06X (%d bytes)'
              % (layout['addr'], layout['addr'] + layout['size'], layout['size']))
    print('rtti_static_verify: %d descriptor(s), %d window value(s) checked'
          % (len(aliases), len(args.observed)))
    return 0


if __name__ == '__main__':
    sys.exit(main())
