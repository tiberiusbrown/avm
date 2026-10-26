"""Measure temporary phase 3/4 fits using the production build and AVR runner.

Run in the configured compiler environment. Only the selected headers remain
in the runtime after review; rejected fits and disassemblies stay in build/.
No runtime precision switch or alternate library is introduced.
"""
import argparse
import json
from pathlib import Path
import struct
import re
import subprocess
import sys

ROOT=Path(__file__).resolve().parents[2]
LIB=ROOT/'runtime/lib/math'


def run(*args):
    subprocess.run([sys.executable,*map(str,args)],cwd=ROOT,check=True)


def measure(label,functions):
    print('Measuring',label,flush=True)
    run('tests/math/run_candidate.py','--label',label,'--output','build/math-phase34',
        '--functions',*functions)


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('group',choices=['trig','atan','power'])
    args=p.parse_args()
    path=LIB/({'trig':'trig_poly.h','atan':'atan_poly.h','power':'ef_pow.c'}[args.group])
    original=path.read_text()
    try:
        sweep(args.group,original)
    finally:
        path.write_text(original)
    rows={}
    for path in (ROOT/'build/math-phase34').glob('*/accuracy.json'):
        rows[path.parent.name]=dict(
            failures={k:v['failures'] for k,v in json.loads(path.read_text())['functions'].items()},
            cycles=(path.parent/'cycles.txt').read_text())
    (ROOT/'build/math-phase34/candidates.json').write_text(json.dumps(rows,indent=2)+'\n')


def sweep(group,original):
    if group=='trig':
        for label,s,c,t,horner in [
            ('trig-too-short',1,2,2,False),('trig-minimum',2,2,2,False),
            ('trig-tan2',2,3,2,False),('trig-tan3',2,3,3,False),
            ('trig-longer',3,4,4,False),('trig-horner',2,3,2,True)]:
            run('tests/math/phase34_coefficients.py','--sin',s,'--cos',c,'--tan',t,
                '--output',LIB/'trig_poly.h',*(['--horner'] if horner else []))
            measure(label,['sinf','cosf','tanf','sincos_sinf','sincos_cosf'])
    elif group=='atan':
        for label,d,pieces,horner in [
            ('atan-single5',5,1,False),('atan-single6',6,1,False),
            ('atan-two3',3,2,False),('atan-four2',2,4,False),
            ('atan-four3',3,4,False),('atan-two4-horner',4,2,True)]:
            run('tests/math/phase34_coefficients.py','--atan',d,'--pieces',pieces,
                '--output',LIB/'atan_poly.h',*(['--horner'] if horner else []))
            measure(label,['atanf','atan2f'])
    else:
        current=re.search(r'if \(integer && iy<=(0x[0-9a-f]+UL)',original)[1]
        for n in [0,8,16,32,64,128]:
            limit=struct.unpack('<I',struct.pack('<f',float(n)))[0]
            source=original.replace(current,f'0x{limit:08x}UL')
            if n==0: source=source.replace('(hx>>31) || (iy>=0x40000000UL && iy<=0x00000000UL)','(hx>>31)')
            (LIB/'ef_pow.c').write_text(source)
            measure(f'pow-integer{n}',['powf'])


if __name__=='__main__': main()
