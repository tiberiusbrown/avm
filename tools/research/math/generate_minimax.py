"""Reproduce the atan/tan correction polynomials (requires mpmath).

Remez exchange at 80 decimal digits, followed by binary32 coefficient rounding.
The reference C test checks the resulting float evaluation, including reduction.
"""

import struct

import mpmath as mp

mp.mp.dps = 80


def remez(function, end, degree, start=mp.mpf(0), verbose=True):
    count = degree + 2
    points = [start + (end-start) * (1 - mp.cos(mp.pi * i / (count - 1))) / 2 for i in range(count)]
    for iteration in range(20):
        matrix = mp.matrix([[x**j for j in range(degree + 1)] + [mp.mpf(-1)**i]
                            for i, x in enumerate(points)])
        solution = mp.lu_solve(matrix, mp.matrix([function(x) for x in points]))
        coefficients = list(solution)[:-1]

        def derivative(x):
            return mp.diff(function, x) - sum(j * coefficients[j] * x**(j - 1)
                                            for j in range(1, degree + 1))

        extrema = [start]
        left = start + (end-start)/4096
        dl = derivative(left)
        for i in range(1, 513):
            right = start + (end-start) * i / 512
            dr = derivative(right)
            if dl * dr < 0:
                extrema.append(mp.findroot(derivative, (left, right), solver='anderson'))
            left, dl = right, dr
        extrema.append(end)
        if len(extrema) != count:
            raise RuntimeError('Unexpected extrema count')
        change = max(abs(a - b) for a, b in zip(points, extrema))
        points = extrema
        if change < mp.mpf('1e-60'):
            break
    if verbose:
        print('degree', degree, 'iterations', iteration + 1,
              'correction error', mp.nstr(abs(list(solution)[-1]), 12))
        for coefficient in coefficients:
            rounded = struct.unpack('<f', struct.pack('<f', float(coefficient)))[0]
            print(rounded.hex() + 'f,')
    return coefficients


def atan_correction(z):
    if not z:
        return mp.mpf(1) / 3
    x = mp.sqrt(z)
    return (x - mp.atan(x)) / x**3


def tan_correction(z):
    if not z:
        return mp.mpf(1) / 3
    x = mp.sqrt(z)
    return (mp.tan(x) - x) / x**3


if __name__ == '__main__':
    remez(atan_correction, mp.mpf(7)**2 / 16**2, 4)
    # The first float that takes the pi/4 transform is word 0x3f2ca140.
    tan_limit = mp.mpf(struct.unpack('<f', struct.pack('<I', 0x3f2ca140))[0])
    remez(tan_correction, tan_limit**2, 5)
