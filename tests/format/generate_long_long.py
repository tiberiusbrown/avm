"""Generate program-memory fixtures using host libc integer formatting.

Fixed seed; no host reference corpus is placed in guest RAM. Run with --check
to verify the checked-in header. Only defined C99 integer combinations and
the C23 binary conversions occur.
"""
import argparse
import ctypes
import json
from pathlib import Path
import random
import re
import sys

MAX_ROWS_PER_ARRAY = 512


def binary_reference(fmt, bits, width, precision):
    """C23 %b/%B reference, used as the oracle when the host libc lacks them."""
    flags, w, p, conv = re.fullmatch(
        r'%([-#0]*)(\*|\d*)(?:\.(\*|\d*))?(?:ll|j)([bB])', fmt).groups()
    left = '-' in flags
    if w == '*':
        if width < 0:
            left, width = True, -width
        w = width
    w = int(w or 0)
    if p == '*':
        p = precision if precision >= 0 else None
    elif p is not None:
        p = int(p or 0)
    digits = format(bits, 'b') if bits or p != 0 else ''
    if p is not None:
        digits = digits.rjust(p, '0')
    prefix = '0' + conv if '#' in flags and bits else ''
    if left:
        return (prefix + digits).ljust(w)
    if '0' in flags and p is None:
        return prefix + digits.rjust(w - len(prefix), '0')
    return (prefix + digits).rjust(w)


def generate():
    libc = ctypes.CDLL('msvcrt' if sys.platform == 'win32' else None)
    printf = libc._snprintf if sys.platform == 'win32' else libc.snprintf
    printf.argtypes = [ctypes.c_void_p, ctypes.c_size_t, ctypes.c_char_p]
    printf.restype = ctypes.c_int
    probe = ctypes.create_string_buffer(8)
    printf(probe, len(probe), b'%b', ctypes.c_uint(5))
    libc_binary = probe.value == b'101'
    rows = []

    def add(value, fmt, width=0, precision=0):
        signed = fmt[-1] in 'di'
        dynamic = '*' in fmt
        bits = value & ((1 << 64) - 1)
        arg = ctypes.c_longlong(bits) if signed else ctypes.c_ulonglong(bits)
        args = [ctypes.c_int(width), ctypes.c_int(precision)] if dynamic else []
        binary = fmt[-1] in 'bB'
        text = None
        if libc_binary or not binary:
            output = ctypes.create_string_buffer(128)
            length = printf(output, len(output), fmt.encode(), *args, arg)
            assert length == len(output.value)
            text = output.value.decode()
        if binary:
            reference = binary_reference(fmt, bits, width, precision)
            assert text in (None, reference), (fmt, text, reference)
            text = reference
        assert len(text) < 80
        rows.append((bits, fmt, text, width, precision,
                     int(signed) | (2 if dynamic else 0)))

    values = [0, 1, 2, 42, 32768, 2147483646, 2147483647, 2147483648,
              4294967295, 4294967296, 4294967297, (1 << 63) - 1, 1 << 63,
              (1 << 64) - 1, 0xaaaaaaaaaaaaaaaa, 0x0123456789abcdef]
    for value in values:
        for fmt in ['%lld', '%lli', '%llu', '%llo', '%llx', '%llX',
                    '%jd', '%ji', '%ju', '%jo', '%jx', '%jX']:
            add(value, fmt)
    for value in [-1, -2, -32768, -2147483648, -42]:
        add(value, '%lld')
    for power in range(1, 20):
        for offset in [-1, 0, 1]:
            add(10 ** power + offset, '%llu')
    for fmt in ['%.0llu', '%#.0llo', '%#llx', '%#.0llx', '%+.0lld',
                '%+lld', '% lld', '%+025lld', '% 25lld', '%-25lld',
                '%025llu', '%#018llx', '%#018llX', '%#025llo', '%.24llu',
                '%30.24llu', '%030.24llu', '%.0ju', '%#.0jo', '%#jx',
                '%#.0jx', '%+025jd', '%#018jX', '%#025jo', '%.24ju',
                '%30.24ju', '%030.24ju']:
        for value in [0, 42, (1 << 64) - 1]:
            add(value, fmt)
    for width in [-30, 30]:
        for precision in [-1, 0, 24]:
            add(-(1 << 63), '%*.*lld', width, precision)
            add((1 << 64) - 1, '%*.*llu', width, precision)
            add(-(1 << 63), '%*.*jd', width, precision)
            add((1 << 64) - 1, '%*.*ju', width, precision)
    rng = random.Random(0x41564d4c4c)
    for _ in range(96):
        value = rng.getrandbits(64)
        conv = rng.choice('diuoxX')
        flags = rng.choice(['', '-', '0', '#', '#0'])
        if conv in 'di':
            flags = rng.choice(['', '+', ' ', '0', '+0', '-+'])
        elif conv == 'u':
            flags = rng.choice(['', '-', '0'])
        if rng.randrange(2):
            add(value, '%' + flags + '*.*' + rng.choice(['ll', 'j']) + conv,
                rng.choice([-31, -25, 0, 18, 30]), rng.choice([-1, 0, 3, 24]))
        else:
            add(value, '%' + flags + rng.choice(['', '25', '30.24', '.0'])
                + rng.choice(['ll', 'j']) + conv)
    assert rows[13 * 12 + 2][2] == '18446744073709551615'
    # C23 binary conversions come last so the vectors above stay unchanged.
    for value in values:
        for fmt in ['%llb', '%llB', '%jb', '%jB']:
            add(value, fmt)
    for fmt in ['%.0llb', '%#.0llb', '%#llb', '%#llB', '%#018llb', '%#018llB',
                '%#070llb', '%-70llb', '%070llb', '%.66llb', '%70.66llb',
                '%070.66llb', '%#70.66llB', '%.0jb', '%#.0jb', '%#jb', '%#jB',
                '%#070jb', '%-#70jB', '%070jb', '%.66jb', '%70.66jB']:
        for value in [0, 42, (1 << 64) - 1]:
            add(value, fmt)
    for width in [-30, 30, 70]:
        for precision in [-1, 0, 24, 66]:
            add((1 << 64) - 1, '%*.*llb', width, precision)
            add(0x0123456789abcdef, '%*.*llB', width, precision)
            add(0, '%*.*jb', width, precision)
            add(1 << 63, '%*.*jB', width, precision)
    rng = random.Random(0x4156424e)
    for _ in range(64):
        value = rng.getrandbits(rng.randrange(1, 65))
        flags = rng.choice(['', '-', '0', '#', '#0'])
        length = rng.choice(['ll', 'j'])
        conv = rng.choice('bB')
        if rng.randrange(2):
            add(value, '%' + flags + '*.*' + length + conv,
                rng.choice([-31, -25, 0, 18, 30, 70]), rng.choice([-1, 0, 3, 24, 66]))
        else:
            add(value, '%' + flags + rng.choice(['', '25', '70', '30.24', '.0', '.66'])
                + length + conv)
    lines = ['/* Generated by tests/format/generate_long_long.py; host libc, fixed seed. */']
    groups = [rows[i:i + MAX_ROWS_PER_ARRAY]
              for i in range(0, len(rows), MAX_ROWS_PER_ARRAY)]
    for index, group in enumerate(groups):
        lines.append('static const struct integer_vector AVM_PROGMEM integer_vectors_%d[] = {' % index)
        for bits, fmt, expected, width, precision, kind in group:
            lines.append('    {0x%016xULL, %s, %s, %d, %d, %d},' %
                         (bits, json.dumps(fmt), json.dumps(expected), width, precision, kind))
        lines.extend(['};', ''])
    lines.extend([
        'struct integer_vector_group {',
        '    const struct integer_vector AVM_PROGMEM *vectors;',
        '    uint16_t count;',
        '};',
        'static const AVM_PROGMEM struct integer_vector_group integer_vector_groups[] = {'
    ])
    for index, group in enumerate(groups):
        lines.append('    {integer_vectors_%d, sizeof(integer_vectors_%d) / sizeof(integer_vectors_%d[0])},' %
                     (index, index, index))
    lines.extend(['};', ''])
    return '\n'.join(lines) + '\n'


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true')
    options = parser.parse_args()
    path = Path(__file__).resolve().parents[1] / 'runtime/stdio/c' / 'printf_long_long_vectors.h'
    content = generate()
    if options.check:
        if path.read_text() != content:
            raise SystemExit('long long fixtures differ from host libc')
    else:
        path.write_text(content)
