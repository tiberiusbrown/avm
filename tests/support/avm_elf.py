"""Independent ELF32 decoder shared by ABI validation programs."""
import struct

SHT_SYMTAB = 2
SHN_UNDEF = 0
SHN_LORESERVE = 0xff00
STB_WEAK = 2

class Elf:
    """A 32-bit little-endian AVM ELF with its section and symbol tables."""

    def __init__(self, path):
        with open(path, 'rb') as f:
            self.data = f.read()
        if self.data[:4] != b'\x7fELF' or self.data[4] != 1:
            raise ValueError('%s is not a 32-bit ELF' % path)
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

