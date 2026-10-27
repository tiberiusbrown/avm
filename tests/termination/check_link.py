"""Linked RAM and callback-stack regressions; run by avm_termination_checks."""
import argparse
from pathlib import Path
import struct
import re
import subprocess


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
    parser.add_argument('--compiler', type=Path, required=True)
    parser.add_argument('--work', type=Path, required=True)
    args = parser.parse_args()
    args.work.mkdir(parents=True, exist_ok=True)
    def run(command, success=True):
        result = subprocess.run([str(x) for x in command], capture_output=True, text=True)
        if (result.returncode == 0) != success:
            raise AssertionError(f'{command}\n{result.stdout}\n{result.stderr}')
        return result.stdout + result.stderr
    def link(name, source, options=(), success=True, suffix='.c'):
        src = args.work / (name + suffix)
        src.write_text(('extern "C" int main();\n' if suffix == '.cpp' else '') + source)
        out = args.work / (name + '.elf')
        report = run([args.compiler, '--target=avm-unknown-arduboyfx', '-O2', '-std=c++17' if suffix == '.cpp' else '-std=c99',
                      src, '--avm-no-image', '-Wl,--avm-print-stack-usage,--avm-print-stack-gaps',
                      *options, '-o', out], success)
        return out, report
    def ram(name, source, capacity, expected, mixed=False, suffix='.c'):
        out, report = link(name, source, [f'-Wl,--avm-atexit-capacity={capacity}'], suffix=suffix)
        sections, symbols = elf(out)
        phase = symbols['__avm_crt_termination_phase']
        frame = int(re.search(r'_start: frame (\d+)', report).group(1))
        assert phase[2] == 0xfff1 and 0xa00 - frame <= phase[0] <= 0x9fe, (phase, frame)
        if '__avm_termination_phase' in symbols:
            assert symbols['__avm_termination_phase'][0] == phase[0]
        actual = sections.get('.data', [0] * 10)[5]
        assert actual == expected, (name, actual, expected, report)
        count = symbols.get('__avm_atexit_count')
        if expected == 0:
            assert count is None or count[0] == 0, (name, symbols)
        else:
            assert count and count[0] != 0, (name, count)
            assert symbols['__avm_termination_entry_size'][0] == (5 if mixed else 3)
            assert symbols['__avm_termination_slots_end'][0] - symbols['__avm_local_dtor_slots_start'][0] == capacity * (5 if mixed else 3)
        print(f'{name}: {actual} bytes static RAM')
    include = '#include <stdlib.h>\n'
    use = include + 'static void f(void) {} int main(void) { return atexit(f); }'
    ram('unused', 'int main(void) { return 0; }', 32, 0)
    ram('exit_only', include + 'int main(void) { exit(5); }', 32, 0)
    ram('immediate_only', include + 'int main(void) { _Exit(5); }', 32, 0)
    ram('abort_only', include + 'int main(void) { abort(); }', 32, 0)
    for capacity in (1, 4, 8, 32, 255):
        ram(f'plain_{capacity}', use, capacity, capacity * 3 + 1)
    # Empty global object takes one object byte, plus five-byte callback slots,
    # the callback count and two-byte next pointer; the phase lives on the stack.
    cpp = include + 'struct G { ~G(); }; G::~G() { asm volatile("" : : "r"(this) : "memory"); } G g; int main() { return atexit(+[]{}); }'
    ram('mixed_32', cpp, 32, 164, mixed=True, suffix='.cpp')
    ram('mixed_4', cpp, 4, 24, mixed=True, suffix='.cpp')
    out, _ = link('local_only', 'struct G { ~G() { asm volatile("" : : "r"(this) : "memory"); } }; int main() { static G g; }', suffix='.cpp')
    sections, symbols = elf(out)
    assert symbols.get('__avm_atexit_count', (0, 0, 0))[0] == 0
    assert sections['.data'][5] == 8, sections['.data']  # slot5, pointer2, object1; phase lives in startup frame
    out, _ = link('globals_only', cpp.replace('return atexit(+[]{});', 'return 0;'), suffix='.cpp')
    sections, symbols = elf(out)
    assert symbols.get('__avm_atexit_count', (0, 0, 0))[0] == 0
    assert sections['.data'][5] == 1
    out, _ = link('cpp_exit_only', cpp.replace('return atexit(+[]{});', 'exit(3);'), suffix='.cpp')
    sections, symbols = elf(out)
    assert symbols.get('__avm_atexit_count', (0, 0, 0))[0] == 0
    assert sections['.data'][5] == 1  # object only, no static termination state
    out, _ = link('default_capacity', use)
    assert elf(out)[0]['.data'][5] == 97
    for operation in ('_Exit', 'abort'):
        call = '_Exit(5)' if operation == '_Exit' else 'abort()'
        out, _ = link('bare_' + operation, include + 'void _start(void) { ' + call + '; }', ['--avm-startup=none'])
        _, symbols = elf(out)
        assert '__avm_terminate' not in symbols and '__avm_run_local_dtors' not in symbols
    for capacity in ('0', '-1', '256', 'oops', '1x'):
        link('invalid', use, [f'-Wl,--avm-atexit-capacity={capacity}'], success=False)
    # GC of a native registration site must discard its callback/table, including
    # archive objects already extracted while resolving that dead reference.
    out, _ = link('dead_registration', include + 'static void f(void) {} void dead(void) { atexit(f); } int main(void) { return 0; }')
    sections, symbols = elf(out)
    assert symbols.get('__avm_atexit_count', (0, 0, 0))[0] == 0
    assert sections.get('.data', [0] * 10)[5] == 0
    for opt in ('-O0', '-O2', '-Oz'):
        for lto in (False, True):
            options = [opt] + (['-flto=full'] if lto else [])
            label = opt[1:] + ('_lto' if lto else '')
            source = include + '''volatile unsigned char input;
__attribute__((noinline)) static void a(void) { volatile unsigned char x[20]; x[input %% 20] = 1; }
__attribute__((noinline)) static void b(void) { volatile unsigned char x[30]; x[input %% 30] = 2; }
int main(void) { return atexit(input ? a : b); }
'''.replace('%%', '%')
            _, report = link('safe_' + label, source, options)
            assert 'complete bound: yes' in report, report
            via_pointer = source.replace('return atexit(input ? a : b);',
                'int (*reg)(void (*)(void)) = atexit; return reg(input ? a : b);')
            _, report = link('registrar_pointer_' + label, via_pointer, options)
            assert 'complete bound: yes' in report, report
            unknown = include + 'void (*volatile target)(void); int main(void) { return atexit(target); }'
            _, report = link('unknown_' + label, unknown, options)
            assert 'complete bound: no' in report and 'unresolved indirect call target' in report, report
            overflow = include + '''volatile unsigned char input;
__attribute__((noinline)) static void callback(void) { volatile unsigned char frame[240]; frame[input %% 240] = 1; }
int main(void) { return atexit(callback); }
'''.replace('%%', '%')
            _, report = link('overflow_' + label, overflow, options, success=False)
            assert 'AVM maximum provable stack usage' in report and 'callback' in report, report
            print(f'{label}: known/multiple targets complete, unknown incomplete, callback overflow rejected')
    print('Termination linked-image and stack checks passed')


if __name__ == '__main__':
    main()


