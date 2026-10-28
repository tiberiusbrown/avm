"""Linked RAM and callback-stack regressions; run by avm_termination_checks."""
import argparse
from pathlib import Path
import struct
import re


def elf(path):
    data = path.read_bytes()
    assert data[:6] == b'\x7fELF\x01\x01'
    off = struct.unpack_from('<I', data, 32)[0]
    entsize, count, names = struct.unpack_from('<HHH', data, 46)
    headers = [struct.unpack_from('<10I', data, off + i * entsize) for i in range(count)]
    def blob(h):
        return data[h[4]:h[4] + h[5]]
    def string(b, n):
        return b[n:b.index(0, n)].decode()
    strings = blob(headers[names])
    sections = {string(strings, h[0]): h for h in headers}
    symbols = {}
    for h in headers:
        if h[1] != 2:
            continue
        strings = blob(headers[h[6]])
        for pos in range(h[4], h[4] + h[5], h[9]):
            n, value, size, info, other, section = struct.unpack_from('<IIIBBH', data, pos)
            symbols[string(strings, n)] = (value, size, section)
    return sections, symbols


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--work', type=Path, required=True)
    args = parser.parse_args()
    work = args.work

    def linked(name):
        path = work / (name + '.elf')
        assert path.is_file(), f'Missing fixture ELF: {path}'
        return elf(path)

    def report(name):
        path = work / (name + '.log')
        assert path.is_file(), f'Missing fixture report: {path}'
        return path.read_text(encoding='utf-8')

    def ram(name, capacity, expected, mixed=False):
        sections, symbols = linked(name)
        diagnostics = report(name)
        phase = symbols['__avm_crt_termination_phase']
        match = re.search(r'_start: frame (\d+)', diagnostics)
        assert match is not None, (name, diagnostics)
        frame = int(match.group(1))
        assert (
            phase[2] == 0xfff1
            and 0xa00 - frame <= phase[0] <= 0x9fe
        ), (name, phase, frame)

        if '__avm_termination_phase' in symbols:
            assert symbols['__avm_termination_phase'][0] == phase[0]

        actual = sections.get('.data', [0] * 10)[5]
        assert actual == expected, (name, actual, expected, diagnostics)
        count = symbols.get('__avm_atexit_count')

        if expected == 0:
            assert count is None or count[0] == 0, (name, symbols)
        else:
            assert count and count[0] != 0, (name, count)
            entry_size = 5 if mixed else 3
            assert symbols['__avm_termination_entry_size'][0] == entry_size
            assert (
                symbols['__avm_termination_slots_end'][0]
                - symbols['__avm_local_dtor_slots_start'][0]
                == capacity * entry_size
            )
        print(f'{name}: {actual} bytes static RAM')

    ram('unused', 32, 0)
    ram('exit_only', 32, 0)
    ram('immediate_only', 32, 0)
    ram('abort_only', 32, 0)
    for capacity in (1, 4, 8, 32, 255):
        ram(f'plain_{capacity}', capacity, capacity * 3 + 1)
    ram('mixed_32', 32, 164, mixed=True)
    ram('mixed_4', 4, 24, mixed=True)

    sections, symbols = linked('local_only')
    assert symbols.get('__avm_atexit_count', (0, 0, 0))[0] == 0
    assert sections['.data'][5] == 8, sections['.data']
    report('local_only')
    sections, symbols = linked('globals_only')
    assert symbols.get('__avm_atexit_count', (0, 0, 0))[0] == 0
    assert sections['.data'][5] == 1
    report('globals_only')
    sections, symbols = linked('cpp_exit_only')
    assert symbols.get('__avm_atexit_count', (0, 0, 0))[0] == 0
    assert sections['.data'][5] == 1
    report('cpp_exit_only')
    sections, _ = linked('default_capacity')
    assert sections['.data'][5] == 97
    report('default_capacity')

    for name in ('bare__Exit', 'bare_abort'):
        _, symbols = linked(name)
        assert '__avm_terminate' not in symbols
        assert '__avm_run_local_dtors' not in symbols
        report(name)

    for name in ('invalid_0', 'invalid_neg1', 'invalid_256',
                 'invalid_oops', 'invalid_1x'):
        diagnostics = report(name)
        assert diagnostics.strip(), (name, 'Expected diagnostic output')

    sections, symbols = linked('dead_registration')
    assert symbols.get('__avm_atexit_count', (0, 0, 0))[0] == 0
    assert sections.get('.data', [0] * 10)[5] == 0
    report('dead_registration')

    for opt in ('O0', 'O2', 'Oz'):
        for lto in (False, True):
            label = opt + ('_lto' if lto else '')
            name = 'safe_' + label
            linked(name)
            diagnostics = report(name)
            assert 'complete bound: yes' in diagnostics, (name, diagnostics)
            name = 'registrar_pointer_' + label
            linked(name)
            diagnostics = report(name)
            assert 'complete bound: yes' in diagnostics, (name, diagnostics)
            name = 'unknown_' + label
            linked(name)
            diagnostics = report(name)
            assert 'complete bound: no' in diagnostics, (name, diagnostics)
            assert 'unresolved indirect call target' in diagnostics, (name, diagnostics)
            name = 'overflow_' + label
            diagnostics = report(name)
            assert 'AVM maximum provable stack usage' in diagnostics, (name, diagnostics)
            assert 'callback' in diagnostics, (name, diagnostics)
            print(
                f'{label}: known/multiple targets complete, '
                'unknown incomplete, callback overflow rejected'
            )
    print('Termination linked-image and stack checks passed')


if __name__ == '__main__':
    main()


