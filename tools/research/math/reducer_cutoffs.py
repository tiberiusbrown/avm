"""Binary32 split-reconstruction experiment; independent double/100-digit refs.

Writes only the requested report. Production has no candidate switches.
"""
import argparse
import json
import math
import random
import struct
from pathlib import Path
import mpmath as mp

def f(x): return struct.unpack('<f', struct.pack('<f', x))[0]
def bits(x): return struct.unpack('<I', struct.pack('<f', x))[0]
def value(u): return struct.unpack('<f', struct.pack('<I', u))[0]

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    mp.mp.dps = 100
    rng = random.Random(0x41564d)
    inputs = set()
    for n in range(1, 100001):
        for phase in [0, 0.5]:
            u = bits((n+phase)*math.pi/2)
            for d in [-1, 0, 1]: inputs.add(u+d)
    for _ in range(100000): inputs.add(rng.randrange(0x3f490fda, bits(200000)))
    limits = [201, 1024, 10000, 30000, 50000, 100000, 131072, 200000]
    stats = {n: dict(cases=0, raw_quadrant_mismatches=0, corrected_mismatches=0,
                    max_remainder_error=0, worst=None, cancellation_cases=0,
                    max_after_cancellation_handoff=0) for n in limits}
    for u in sorted(inputs):
        a = value(u)
        n = (int(f(a*f(4/math.pi)))+1) >> 1
        expected = int(a*(2/math.pi)+0.5)
        r = f(f(a-f(f(n)*float.fromhex('0x1.92p0')))-f(f(n)*float.fromhex('0x1.fb5444p-12')))
        raw = n
        if r > f(math.pi/4): n += 1; r=f(f(r-f(math.pi/2))-f(-4.37113900018624283e-8))
        elif r < -f(math.pi/4): n -= 1; r=f(f(r+f(math.pi/2))+f(-4.37113900018624283e-8))
        error = abs(r-(a-n*(math.pi/2)))
        cancellation = bits(abs(r)) < u-(21<<23)
        for limit,s in stats.items():
            if a > limit: continue
            s['cases'] += 1
            s['raw_quadrant_mismatches'] += raw != expected
            s['corrected_mismatches'] += n != expected
            s['cancellation_cases'] += cancellation
            if error > s['max_remainder_error']:
                s['max_remainder_error']=error; s['worst']=f'{u:08x}'
            if not cancellation: s['max_after_cancellation_handoff']=max(s['max_after_cancellation_handoff'],error)
    for s in stats.values():
        a=mp.mpf(value(int(s['worst'],16)))
        n=int(mp.floor(a*2/mp.pi+mp.mpf('.5')))
        s['worst_exact_remainder']=str(a-n*mp.pi/2)
    args.output.parent.mkdir(parents=True,exist_ok=True)
    args.output.write_text(json.dumps(stats,indent=2)+'\n')
    print(json.dumps(stats,indent=2))

if __name__ == '__main__': main()
