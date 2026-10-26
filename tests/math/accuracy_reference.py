"""High precision companion to shortcuts_reference.c (mpmath, 100 digits).

The probe links the existing production reference objects, including the FPOLY
model. Deterministic stratified sampling is followed by local searches around
the largest errors. JSON records domains, distributions, worst inputs and ALL
acceptance/exception failures. --fixtures exports worst cases to the AVR suite.
"""
import argparse
import json
import math
import os
from pathlib import Path
import random
import re
import time
import struct
import subprocess
import mpmath as mp

mp.mp.dps = 100
FUNCTIONS = ['sqrtf', 'expf', 'logf', 'log2f', 'log10f', 'hypotf', 'powf',
             'sinf', 'cosf', 'tanf', 'atanf', 'atan2f', 'fmodf', 'sincos_sinf', 'sincos_cosf']

def value(u):
    return struct.unpack('<f', struct.pack('<I', u))[0]

def bits(x):
    try:
        return struct.unpack('<I', struct.pack('<f', float(x)))[0]
    except OverflowError:
        return 0xff800000 if x < 0 else 0x7f800000

def reference(name, a, b):
    name=name.removeprefix('sincos_')
    x, y = mp.mpf(value(a)), mp.mpf(value(b))
    try:
        if name == 'sqrtf': return mp.sqrt(x) if x >= 0 else mp.nan
        if name == 'expf': return mp.inf if x > 1000 else mp.mpf(0) if x < -1000 else mp.exp(x)
        if name in ['logf', 'log2f', 'log10f']:
            if x < 0: return mp.nan
            return mp.log(x) if name == 'logf' else mp.log(x, 2 if name == 'log2f' else 10)
        if name == 'hypotf':
            if mp.isinf(x) or mp.isinf(y): return mp.inf
            return mp.sqrt(x*x+y*y)
        if name == 'powf':
            # Preserve the runtime's signaling-NaN identities.
            snan = lambda u: (u & 0x7fffffff) > 0x7f800000 and not (u & 0x400000)
            if (snan(a) and y == 0) or (a == 0x3f800000 and snan(b)): return mp.nan
            if y == 0 or x == 1: return mp.mpf(1)
            if mp.isnan(x) or mp.isnan(y): return mp.nan
            if mp.isinf(y):
                if abs(x)==1: return mp.mpf(1)
                return mp.inf if (abs(x)>1)==(y>0) else mp.mpf(0)
            if mp.isinf(x):
                negative=x<0 and abs(y)%2==1
                return (-mp.inf if negative else mp.inf) if y>0 else (-0.0 if negative else 0.0)
            if x < 0 and mp.isfinite(y) and y != mp.floor(y): return mp.nan
            if x == 0:
                negative = bool(a >> 31) and mp.isfinite(y) and abs(y) % 2 == 1
                if y < 0: return -mp.inf if negative else mp.inf
                return -0.0 if negative else 0.0
            z = mp.power(x,y)
            return z if not isinstance(z,mp.mpc) else mp.nan
        if name == 'sinf': return mp.sin(x)
        if name == 'cosf': return mp.cos(x)
        if name == 'tanf': return mp.tan(x)
        if name == 'atanf': return mp.atan(x)
        if name == 'atan2f':
            if mp.isnan(x) or mp.isnan(y): return mp.nan
            sign=-1 if a>>31 else 1
            if x==0:
                return sign*mp.pi if (b>>31) else 0.0
            if y==0: return sign*mp.pi/2
            if mp.isinf(x) and mp.isinf(y): return sign*mp.pi*(mp.mpf('0.25') if y>0 else mp.mpf('0.75'))
            if mp.isinf(x): return sign*mp.pi/2
            if mp.isinf(y): return 0.0 if y>0 else sign*mp.pi
            return mp.atan2(x,y)
        if name == 'fmodf':
            if not mp.isfinite(x) or y == 0 or mp.isnan(y): return mp.nan
            if mp.isinf(y): return x
            return x - mp.sign(x/y)*mp.floor(abs(x/y))*y
    except (ValueError, ZeroDivisionError): return mp.nan

def expected_bits(name,a,b,ref):
    name=name.removeprefix('sincos_')
    word=bits(ref)
    if word&0x7fffffff==0:
        negative=(name in ['sqrtf','sinf','tanf','atanf','atan2f','fmodf'] and a>>31) or (name=='powf' and a>>31 and value(b)%2==1)
        if negative: word|=0x80000000
    return word

def corpus(count):
    rng = random.Random(0x41564d26)
    special = [0,0x80000000,1,0x80000001,0x007fffff,0x00800000,0x00800001,
               0x3f7fffff,0x3f800000,0x3f800001,0x7f7fffff,0x7f800000,
               0xff800000,0x7fc12345,0x7fa12345,0xbf800000]
    result = {(u,v) for u in special for v in special}
    # Every exponent, interval boundaries and neighboring floats.
    for e in range(255):
        for f in [0,1,0x1ffff,0x20000,0x3fffff,0x400000,0x7ffffe,0x7fffff]:
            u = (e<<23)|f
            result.add((u, bits(0.75)))
            result.add((u|0x80000000,bits(1.25)))
    for _ in range(count):
        result.add((rng.getrandbits(32),rng.getrandbits(32)))
        result.add((bits(rng.uniform(-104,89)),bits(rng.uniform(-1.25,1.25))))
        result.add((bits(rng.uniform(0.5,2)),bits(rng.uniform(-8,8))))
    for k in range(-150,130):
        u = bits(k*math.log(2))
        for d in [-2,-1,0,1,2]: result.add(((u+d)&0xffffffff,bits(1.25)))
    return sorted(result)


def phase34_corpus(name):
    """Algorithm boundaries and cancellation cases, independent of old libm."""
    name=name.removeprefix('sincos_')
    pairs=set()
    def neighbors(x,y=0):
        a,b=bits(x),bits(y)
        for d in range(-2,3):
            if 0 <= a+d <= 0xffffffff: pairs.add((a+d,b))
    if name=='powf':
        for a in [0x3f7fffff,0x3f800001,0x3f7fff00,0x3f800100,
                  0x3f700000,0x3f900000,0x3f000000,0x40000000,
                  1,0x00800000,0x7f7fffff]:
            x=value(a)
            for t in [-150,-149,-126,-1,1,126,127.99,128]:
                y=bits(mp.mpf(t)/mp.log(x,2))
                for d in range(-2,3): pairs.add((a,(y+d)&0xffffffff))
        for n in [-16777216,-16777215,-65,-64,-33,-32,-17,-16,-9,-8,-3,-2,-1,
                  1,2,3,8,9,16,17,32,33,64,65,16777215,16777216]:
            for x in [-2,-1.03125,-0.75,-0.0,0.5,0.75,1.03125,2,2.0**-64,2.0**64]:
                neighbors(x,n)
        # y near the mathematical overflow boundary, at mantissas across
        # the entire normalization interval; conversion to float is explicit.
        for i in range(1,129):
            x=value(bits(0.5+i/128))
            if x==1: continue
            for t in [-150,128]:
                y=bits(mp.mpf(t)/mp.log(x,2))
                for d in [-1,0,1]: pairs.add((bits(x),(y+d)&0xffffffff))
    elif name=='hypotf':
        for e in range(-149,128):
            x=bits(math.ldexp(1.0,e))
            for gap in [0,1,11,12,13,25,26,60,150]:
                y=bits(math.ldexp(1.234567,e-gap))
                for d in [-1,0,1]:
                    if 0<x+d<0x7f800000: pairs.add((x+d,y))
        for d in range(0,129,4):
            radius=value(0x7f7fffff-d)
            for i in range(129):
                angle=i*math.pi/256
                pairs.add((bits(radius*math.cos(angle)),bits(radius*math.sin(angle))))
    elif name in ['sinf','cosf','tanf']:
        for n in list(range(-653,654))+[1023,1024,65535,65536,1048575]:
            for f in [0,0.5,1]: neighbors((n+f)*math.pi/2)
        for x in [math.pi/4,2**-12,2**-27,0.6744,4,8,16,32,64,128,1024]:
            neighbors(x); neighbors(-x)
        for u in [0x65f379c6,0x48926054,0x5b86a17b,0x53f00239]:
            neighbors(value(u)); neighbors(-value(u))
    elif name in ['atanf','atan2f']:
        for x in [0.25,0.4375,0.5,0.6875,0.75,1,1.1875,2,2.4375,4]:
            for sign in [-1,1]:
                neighbors(sign*x,1)
                if name=='atan2f':
                    for e in [-148,-126,-60,0,60,126]:
                        for sy in [-1,1]: neighbors(math.ldexp(sign*x,e), math.ldexp(sy,e))
    return sorted(pairs)

def acceptance(name,actual,ref,ulp):
    name=name.removeprefix('sincos_')
    if name == 'sqrtf': return ulp <= 2
    if name == 'hypotf': return ulp <= 4
    if name == 'fmodf': return ulp == 0
    at, rt = {'expf':(0,1e-5),'powf':(0,5e-5),'sinf':(1e-5,0),'cosf':(1e-5,0),
              'tanf':(1e-4,1e-4),'atanf':(1e-6,0),'atan2f':(1e-6,0)}.get(name,(1e-6,1e-6))
    if name in ['expf','powf'] and abs(ref) < mp.mpf(2)**-126:
        at = mp.mpf(rt)*mp.mpf(2)**-126+mp.mpf(2)**-149
    return abs(actual-ref) <= mp.mpf(at)+mp.mpf(rt)*abs(ref)

def run(probe, requests):
    data = ''.join(f'{n} {a:08x} {b:08x}\n' for n,a,b in requests)
    p = subprocess.run([str(probe)],input=data,text=True,capture_output=True,check=True)
    out = [int(s,16) for s in p.stdout.splitlines()]
    if len(out)!=len(requests): raise RuntimeError('truncated probe output')
    return out

def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--probe',type=Path,default=Path('build/tests/avm_math_accuracy_probe'+('.exe' if os.name=='nt' else '')))
    p.add_argument('--output',type=Path,required=True)
    p.add_argument('--samples',type=int,default=2000)
    p.add_argument('--functions',nargs='+',choices=FUNCTIONS,default=FUNCTIONS)
    p.add_argument('--rounds',type=int,default=2,help='adaptive rounds after the initial corpus (default: 2)')
    p.add_argument('--profile',choices=['fast','full'],default='full')
    p.add_argument('--fixtures',action='store_true')
    args=p.parse_args()
    start=time.perf_counter()
    if args.samples<0 or args.rounds<0: p.error('samples and rounds must be nonnegative')
    if args.profile=='fast' and args.fixtures: p.error('fast runs must not overwrite committed fixtures')
    if args.profile=='fast' and Path('docs').resolve() in args.output.resolve().parents:
        p.error('fast runs must write reports in the build directory, not committed docs')
    stats={n:dict(count=0,failures=0,exceptional_changes=0,max_absolute=0,max_relative_normal=0,max_ulp=0,
                  worst_absolute=None,worst_relative=None,worst_ulp=None,ulp_distribution=[0]*5,
                  ranges={},exceptional_examples=[]) for n in args.functions}
    seeds={n:[] for n in args.functions}
    retained={n:set() for n in args.functions}
    pairs=corpus(args.samples)
    if args.profile=='fast':
        # Retain all exponent strata, choose fewer fractions in each stratum.
        pairs=[pair for pair in pairs if (pair[0]&0x7fffff) in [0,1,0x400000,0x7fffff] or
               abs(value(pair[0]))<16 or not math.isfinite(value(pair[0]))]
    def fixtures(name):
        paths=Path(__file__).resolve().parents[1]/'c'
        result=set()
        for path in paths.glob('math_'+name+'*.c'):
            result.update((int(a,16),int(b,16)) for a,b in re.findall(
                r'\{\s*0x([0-9a-fA-F]+)UL,\s*0x([0-9a-fA-F]+)UL,',path.read_text()))
        if name.removeprefix('sincos_') in ['sinf','cosf','tanf']:
            result.update((int(u,16),0) for u in re.findall(
                r'\{0x([0-9a-fA-F]+)UL,', (paths/'math_trig_regressions.c').read_text()))
        return result
    requests=[(n,a,b) for n in args.functions for a,b in sorted(set(pairs)|set(phase34_corpus(n))|fixtures(n))]
    seen=set()
    for iteration in range(args.rounds+1):
        requests=[r for r in requests if r not in seen]
        seen.update(requests)
        outputs=run(args.probe,requests)
        scores={n:[] for n in args.functions}
        for (n,a,b),out in zip(requests,outputs):
            s=stats[n]; s['count']+=1
            ref=reference(n,a,b); expected=expected_bits(n,a,b,ref); actual=value(out)
            inputs=[f'{a:08x}',f'{b:08x}']
            nonfinite=(expected&0x7fffffff)>=0x7f800000 or not math.isfinite(actual)
            if nonfinite:
                ok=(math.isnan(actual) and mp.isnan(ref)) or out==expected
                if not ok:
                    s['exceptional_changes']+=1; s['failures']+=1; retained[n].add((a,b))
                    if len(s['exceptional_examples'])<32: s['exceptional_examples'].append([inputs,f'{out:08x}',f'{expected:08x}'])
                continue
            if (out^expected)&0x80000000:
                s['exceptional_changes']+=1; s['failures']+=1; retained[n].add((a,b))
                if len(s['exceptional_examples'])<32: s['exceptional_examples'].append([inputs,f'{out:08x}',f'{expected:08x}'])
                continue
            ordered=lambda u: (0x80000000-(u&0x7fffffff) if u>>31 else 0x80000000+u)
            ulp=abs(ordered(out)-ordered(expected))
            absolute=abs(mp.mpf(actual)-ref)
            relative=absolute/abs(ref) if abs(ref)>=mp.mpf(2)**-126 else mp.mpf(0)
            for key,v in [('absolute',absolute),('relative_normal',relative),('ulp',ulp)]:
                if v>s['max_'+key]:
                    s['max_'+key]=float(v); s['worst_'+('relative' if key=='relative_normal' else key)]=inputs
            s['ulp_distribution'][0 if ulp==0 else 1 if ulp==1 else 2 if ulp<=4 else 3 if ulp<=16 else 4]+=1
            category='subnormal' if (a&0x7fffffff)<0x00800000 else 'near_one' if abs(value(a)-1)<0.125 else 'ordinary' if abs(value(a))<16 else 'extreme'
            if n.removeprefix('sincos_') in ['sinf','cosf','tanf']:
                magnitude=abs(value(a))
                category=('direct' if magnitude<=math.pi/4 else
                          'gameplay' if magnitude<=10000 else
                          'medium' if magnitude<=100000 else
                          'fallback_ordinary' if magnitude<=2**20 else 'huge')
            bucket=s['ranges'].setdefault(category,dict(count=0,failures=0,max_ulp=0,
                                                        max_absolute=0,worst_absolute=None))
            bucket['count']+=1; bucket['max_ulp']=max(bucket['max_ulp'],ulp)
            if absolute>bucket['max_absolute']:
                bucket['max_absolute']=float(absolute); bucket['worst_absolute']=inputs
            ok=acceptance(n,mp.mpf(actual),ref,ulp)
            if n=='tanf':
                region='pole_neighbors' if abs(ref)>=10000 else 'away_from_poles'
                record=s.setdefault('tangent_regions',{}).setdefault(region,
                    dict(count=0,max_absolute=0,max_relative_normal=0,max_ulp=0,max_budget_fraction=0))
                record['count']+=1
                record['max_absolute']=max(record['max_absolute'],float(absolute))
                record['max_relative_normal']=max(record['max_relative_normal'],float(relative))
                record['max_ulp']=max(record['max_ulp'],ulp)
                fraction=float(absolute/(mp.mpf('0.0001')*(1+abs(ref))))
                record['max_budget_fraction']=max(record['max_budget_fraction'],fraction)
            if not ok: s['failures']+=1; bucket['failures']+=1; retained[n].add((a,b))
            # Rank by scaled error, keeping both absolute and relative hard cases.
            score=float(absolute/(mp.mpf('1e-6')+abs(ref)))
            scores[n].append((score,a,b))
        requests=[]
        for n,sc in scores.items():
            best=sorted(sc,reverse=True)[:12]
            for _,a,b in best:
                retained[n].add((a,b))
                for d in range(-16,17):
                    if 0<a+d<0xffffffff: requests.append((n,a+d,b))
        print('search round',iteration+1,'cases',sum(s['count'] for s in stats.values()),flush=True)
    for s in stats.values(): s['failure_percent']=100*s['failures']/s['count']
    args.output.parent.mkdir(parents=True,exist_ok=True)
    args.output.write_text(json.dumps(dict(precision_digits=100,mpmath_version=mp.__version__,random_samples=args.samples,seed='41564d26',search_rounds=args.rounds+1,profile=args.profile,elapsed_seconds=time.perf_counter()-start,functions=stats),indent=2)+'\n', encoding='utf-8')
    if args.fixtures:
        for n,inputs in retained.items():
            policy={'sqrtf':'AVM_SQRT','expf':'AVM_EXP','hypotf':'AVM_HYPOT','powf':'AVM_POW','sinf':'AVM_SIN','cosf':'AVM_COS','tanf':'AVM_TAN','atanf':'AVM_ATAN','atan2f':'AVM_ATAN2','fmodf':'AVM_EXACT'}.get(n.removeprefix('sincos_'),'AVM_LOG')
            lines=['/* Generated by tests/math/accuracy_reference.py --fixtures. */','#include "math_test.h"']
            if n.startswith('sincos_'):
                lines += [f'static float {n}(float x) {{ float s,c; sincosf(x,&s,&c); return {"s" if n=="sincos_sinf" else "c"}; }}']
            lines += ['static const AVM_PROGMEM struct math_case cases[] = {']
            for a,b in sorted(inputs): lines.append(f'    {{0x{a:08x}UL,0x{b:08x}UL,0x{expected_bits(n,a,b,reference(n,a,b)):08x}UL,1}},')
            binary=n in ['hypotf','powf','atan2f','fmodf']
            lines+=['};','int avm_test_main(void) {',f'    return check_{"binary" if binary else "unary"}_accuracy({n}, cases, sizeof(cases)/sizeof(cases[0]), {policy});','}','']
            path=Path('tests/c')/f'math_{n}_accuracy.c'
            path.write_text('\n'.join(lines), encoding='utf-8'); path.with_name(path.stem+'_output.txt').write_text('P\n', encoding='utf-8')
    print(json.dumps(stats,indent=2))
    raise SystemExit(any(s['failures'] for s in stats.values()))

if __name__=='__main__': main()
